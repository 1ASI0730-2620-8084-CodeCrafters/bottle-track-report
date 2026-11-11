-- config/filters/html-to-pdf.lua
--
-- Adapta los .md del informe (pensados para verse bien en GitHub) para que
-- Pandoc genere un PDF correcto. No modifica ningun archivo fuente.
--
--  1. Quita la caratula en HTML del README (la caratula del PDF sale de config/cover.tex).
--  2. Reemplaza el indice manual del README por un indice automatico del PDF.
--  3. Convierte <img> (y las <table> que solo contienen imagenes) en imagenes de Pandoc.
--  4. Convierte <br> en salto de linea y <div style="page-break-before"> en salto de pagina.
--  5. Descarta el HTML decorativo, las lineas de navegacion entre capitulos y las reglas "---".
--  6. Omite imagenes remotas (http/https): descargalas a report/assets/ para que salgan en el PDF.

local stringify = pandoc.utils.stringify

local function warn(msg) io.stderr:write('[html-to-pdf] ' .. msg .. '\n') end
local function is_html(el) return el.format:match('^html') ~= nil end

-- ---------------------------------------------------------------------------
-- Imagenes
-- ---------------------------------------------------------------------------
local function images_in(html)
  local found = {}
  for tag in html:gmatch('<img[^>]->') do
    local src = tag:match('src="([^"]+)"')
    local w = tonumber(tag:match('width="(%d+)"'))
    if src then
      if src:match('^https?://') then
        warn('imagen remota omitida (descargala a report/assets/): ' .. src)
      else
        table.insert(found, { src = src, width = w })
      end
    end
  end
  return found
end

-- width="800" en el HTML equivale a "ancho completo" (100 %). Se escala proporcionalmente.
local function make_image(info, max_pct)
  local attrs = {}
  if info.width then
    local pct = math.floor(info.width / 800 * 100)
    if max_pct and pct > max_pct then pct = max_pct end
    if pct > 100 then pct = 100 end
    attrs = { { 'width', pct .. '%' } }
  elseif max_pct and max_pct < 100 then
    attrs = { { 'width', max_pct .. '%' } }
  end
  return pandoc.Image({}, info.src, '', pandoc.Attr('', {}, attrs))
end

local function centered(inlines)
  return {
    pandoc.RawBlock('latex', '\\begin{center}'),
    pandoc.Para(inlines),
    pandoc.RawBlock('latex', '\\end{center}'),
  }
end

local function only_images(inlines)
  local n = 0
  for _, il in ipairs(inlines) do
    if il.t == 'Image' then n = n + 1
    elseif il.t ~= 'Space' and il.t ~= 'SoftBreak' and il.t ~= 'LineBreak' then return false end
  end
  return n > 0
end

-- ---------------------------------------------------------------------------
-- Conversion de HTML crudo
-- ---------------------------------------------------------------------------
local function raw_inline(el)
  if not is_html(el) then return nil end
  local imgs = images_in(el.text)
  if #imgs > 0 then return make_image(imgs[1]) end
  if el.text:match('^<br') then return pandoc.LineBreak() end
  return {}                                   -- <a id>, <a href>, </a>, <p>, etc.
end

local function raw_block(el)
  if not is_html(el) then return nil end
  local imgs = images_in(el.text)
  if #imgs > 0 then
    local per = math.floor(95 / #imgs)         -- varias imagenes en una fila comparten el ancho
    local inl = {}
    for i, info in ipairs(imgs) do
      if i > 1 then table.insert(inl, pandoc.Space()) end
      table.insert(inl, make_image(info, per))
    end
    return centered(inl)
  end
  return {}                                   -- <hr>, <table>, <p align=...>, etc.
end

local function div(el)
  local style = el.attributes['style'] or ''
  if style:match('page%-break') then
    return pandoc.RawBlock('latex', '\\newpage')
  end
  return el.content                           -- otro <div>: se conserva solo el contenido
end

local function is_nav(block)
  if block.t ~= 'Para' and block.t ~= 'Plain' then return false end
  local links = 0
  for _, il in ipairs(block.content) do
    if il.t == 'Link' then
      if il.target:match('%.md') or il.target:match('#contenido$') then links = links + 1 else return false end
    elseif il.t ~= 'Space' and il.t ~= 'SoftBreak' and il.t ~= 'LineBreak' and not (il.t == 'Str' and il.text == '·') then
      return false
    end
  end
  return links > 0
end

-- Texto largo sin espacios (feature/landing-page, rutas): LaTeX no sabe donde cortarlo y
-- el texto invade la columna vecina. Se agregan puntos de corte despues de / - _ .
local function break_str(s)
  if #s.text < 10 or not s.text:match('[/%-_%.]') then return nil end
  local out, buf = {}, ''
  for ch in s.text:gmatch('.') do
    buf = buf .. ch
    if ch:match('[/%-_%.]') then
      table.insert(out, pandoc.Str(buf))
      table.insert(out, pandoc.RawInline('latex', '\\allowbreak{}'))
      buf = ''
    end
  end
  if buf ~= '' then table.insert(out, pandoc.Str(buf)) end
  return out
end

local function breakable(txt)
  local out, buf = {}, ''
  for ch in txt:gmatch('.') do
    buf = buf .. ch
    if ch:match('[/%-_%.%?=&:]') or #buf >= 12 then
      table.insert(out, pandoc.Str(buf))
      table.insert(out, pandoc.RawInline('latex', '\\allowbreak{}'))
      buf = ''
    end
  end
  if buf ~= '' then table.insert(out, pandoc.Str(buf)) end
  return out
end

local function shorten_link(l)
  local txt = stringify(l.content)
  if #txt > 70 and txt:match('^https?://') then
    local inl = breakable(txt:sub(1, 60))
    table.insert(inl, pandoc.Str('…'))
    l.content = inl
    return l
  end
end

-- Codigo en linea largo (rutas, ramas): \texttt no corta lineas. Se reconstruye con puntos de
-- corte despues de / - . y se escapan los caracteres especiales de LaTeX.
local latex_escape = {
  ['\\'] = '\\textbackslash{}', ['{'] = '\\{', ['}'] = '\\}', ['$'] = '\\$', ['&'] = '\\&',
  ['#'] = '\\#', ['^'] = '\\^{}', ['_'] = '\\_', ['%'] = '\\%', ['~'] = '\\textasciitilde{}',
}
local function code_break(c)
  if #c.text < 14 or c.text:find('%s') then return nil end
  local s = c.text:gsub('[\\{}$&#^_%%~]', latex_escape)
  s = s:gsub('([/%-%.])', '%1\\allowbreak{}')
  return pandoc.RawInline('latex', '\\texttt{' .. s .. '}')
end

-- Ancho de columnas. Pandoc reparte el ancho segun los guiones de la fila "|:----|:----|" del
-- .md; si una columna queda mas angosta que su palabra mas larga, el texto se encima con la
-- columna vecina. Se respeta el reparto original y solo se ensancha lo minimo necesario esas
-- columnas, quitando el espacio a las que les sobra.
local function fix_widths(t)
  local n = #t.colspecs
  if n < 2 then return nil end
  local orig, total = {}, 0
  for j = 1, n do
    local w = t.colspecs[j][2]
    if not w then return nil end              -- ancho automatico: no se toca
    orig[j] = w; total = total + w
  end
  if total <= 0 then return nil end

  local maxword = {}
  for j = 1, n do maxword[j] = 0 end
  local function scan(rows)
    for _, row in ipairs(rows) do
      for j, cell in ipairs(row.cells) do
        if j <= n then
          for w in stringify(cell.contents):gmatch('[^%s/%-_%.]+') do
            local l = utf8.len(w) or #w
            if l > maxword[j] then maxword[j] = l end
          end
        end
      end
    end
  end
  scan(t.head.rows)
  for _, b in ipairs(t.bodies) do scan(b.body) end
  scan(t.foot.rows)

  local frac, minfrac, deficit, slack = {}, {}, 0, 0
  for j = 1, n do
    frac[j] = orig[j] / total
    minfrac[j] = math.min(maxword[j], 14) * 1.1 / 70
    if frac[j] < minfrac[j] then deficit = deficit + (minfrac[j] - frac[j]); frac[j] = minfrac[j]
    else slack = slack + (frac[j] - minfrac[j]) end
  end
  if deficit == 0 then return nil end
  if slack > 0 then
    local take = math.min(deficit, slack)
    for j = 1, n do
      if frac[j] > minfrac[j] then frac[j] = frac[j] - take * (frac[j] - minfrac[j]) / slack end
    end
  end
  local s = 0
  for j = 1, n do s = s + frac[j] end
  for j = 1, n do t.colspecs[j] = { t.colspecs[j][1], frac[j] / s } end
  return t
end

-- La tabla de Student Outcome tiene celdas enormes (varias paginas por fila). LaTeX no puede
-- partir una fila entre paginas y la tabla sale cortada y con columnas encimadas. Se presenta
-- cada fila como bloques seguidos: criterio, acciones realizadas y conclusiones.
local function expand_student_outcome(t)
  local head = t.head.rows[1]
  if not head or stringify(head.cells[1].contents) ~= 'Criterio específico' then return nil end
  local out = {}
  for _, body in ipairs(t.bodies) do
    for _, row in ipairs(body.body) do
      table.insert(out, pandoc.RawBlock('latex', '\\bigskip\\hrule\\bigskip'))
      for j, cell in ipairs(row.cells) do
        local label = stringify(head.cells[j].contents)
        if j == 1 then
          table.insert(out, pandoc.Para({ pandoc.Strong({ pandoc.Str(label .. ':') }), pandoc.Space() ,
                                          table.unpack(pandoc.utils.blocks_to_inlines(cell.contents)) }))
        else
          table.insert(out, pandoc.Para({ pandoc.Strong({ pandoc.Str(label) }) }))
          for _, blk in ipairs(cell.contents) do table.insert(out, blk) end
        end
      end
    end
  end
  return out
end

-- ---------------------------------------------------------------------------
-- Documento completo
-- ---------------------------------------------------------------------------
function Pandoc(doc)
  -- con file-scope, Pandoc envuelve el contenido de cada archivo en un <div id="archivo.md">:
  -- se desenvuelve para trabajar con los bloques directamente
  local blocks = {}
  for _, b in ipairs(doc.blocks) do
    if b.t == 'Div' and b.identifier:match('%.md$') then
      for _, x in ipairs(b.content) do table.insert(blocks, x) end
    else
      table.insert(blocks, b)
    end
  end

  -- 1) caratula HTML del README: todo lo anterior al primer <hr>
  local first = blocks[1]
  if first and first.t == 'RawBlock' and first.text:match('align="center"') then
    local cut
    for i, b in ipairs(blocks) do
      if b.t == 'RawBlock' and b.text:match('^<hr') then cut = i; break end
    end
    if cut then
      local rest = {}
      for i = cut + 1, #blocks do table.insert(rest, blocks[i]) end
      blocks = rest
    end
  end

  -- 2) indice manual "Contenido" -> \tableofcontents
  local out, i = {}, 1
  while i <= #blocks do
    local b = blocks[i]
    if b.t == 'Header' and b.level == 1 and stringify(b.content) == 'Contenido' then
      table.insert(out, pandoc.RawBlock('latex', '\\tableofcontents'))
      i = i + 1
      while i <= #blocks and not (blocks[i].t == 'Header' and blocks[i].level == 1) do i = i + 1 end
    else
      table.insert(out, b)
      i = i + 1
    end
  end

  -- 3) HTML crudo, divs y enlaces de navegacion
  doc = pandoc.Pandoc(out, doc.meta)
  doc = doc:walk({ RawInline = raw_inline, RawBlock = raw_block, Div = div })

  local final = {}
  for _, b in ipairs(doc.blocks) do
    if b.t == 'HorizontalRule' or is_nav(b) then
      -- se descarta
    elseif b.t == 'Para' and only_images(b.content) then
      for _, x in ipairs(centered(b.content)) do table.insert(final, x) end
    elseif b.t == 'Table' and expand_student_outcome(b) then
      for _, x in ipairs(expand_student_outcome(b)) do table.insert(final, x) end
    else
      table.insert(final, b)
    end
  end
  doc = pandoc.Pandoc(final, doc.meta)

  -- URLs muy largas (enlaces de SharePoint): el enlace sigue funcionando en el PDF, pero el
  -- texto visible se acorta porque no cabe en la pagina
  doc = doc:walk({ Link = shorten_link })

  -- en las tablas, permite cortar linea despues de / - _ . (ramas, rutas y nombres largos)
  doc = doc:walk({ Table = function(t) return t:walk({ Str = break_str }) end })

  -- codigo en linea largo (rutas, ramas): tambien se puede cortar
  doc = doc:walk({ Code = code_break })

  -- anchos de columna segun el contenido
  doc = doc:walk({ Table = fix_widths })

  -- 4) aviso si queda algun enlace a otro .md (en el PDF no navegaria)
  doc:walk({ Link = function(l)
    if l.target:match('%.md') then warn('enlace a archivo .md en el cuerpo: ' .. l.target) end
  end })

  return doc
end
