# Cómo contribuir al informe

Este repositorio contiene el informe del trabajo final de BottleTrack, escrito en Markdown. Esta guía
dice dónde va cada cosa y qué revisar antes de abrir un Pull Request.

## Estructura

```text
README.md                 carátula, registro de versiones, contenido y student outcome
build.ps1 · Makefile      compilan el PDF (Windows · Linux/macOS)
config/
├── build.yaml            archivos que forman el PDF y opciones de Pandoc (el orden importa)
├── metadata.yaml         idioma, metadatos del PDF y ajustes de LaTeX
├── cover.tex             carátula del PDF
└── filters/              filtro Lua que adapta el HTML de los .md para el PDF
report/
├── 10-chapter-1-….md     un archivo por capítulo, con prefijo numérico en kebab-case
├── …
├── 90-conclusions.md
├── 99-bibliography.md
├── annexes/              un archivo por anexo; cada uno empieza en una nueva página
└── assets/               imágenes del informe, agrupadas por sección
    └── <sección>/        también el código fuente de los diagramas (.puml, .dot, .txt)
build/                    PDF generado (no se sube a Git)
```

Los prefijos ordenan los archivos: `10`–`89` para los capítulos, `90` para las conclusiones y `99`
para la bibliografía.

## Imágenes y diagramas

- Una imagen va en `report/assets/<sección>/` y se enlaza desde el capítulo como
  `assets/<sección>/archivo.png`.
- **Los diagramas van como imagen en el informe, nunca como bloque de código.** GitHub no muestra
  bien el código de los diagramas.
- Si el diagrama se genera desde código (PlantUML, Graphviz, Structurizr), el código se versiona
  junto a su imagen en `report/assets/<sección>/` y el informe muestra la imagen exportada.
- Todo `<img>` lleva un `alt` que describe el diagrama.

## Redacción

- El informe se escribe en español. Los títulos de sección que fija el enunciado se mantienen tal
  como están, aunque estén en inglés.
- **Un Sprint Goal lo tiene que entender el Product Owner.** Sigue la plantilla *Nuestro enfoque
  está en… Creemos que esto entrega… a… Esto se confirmará cuando…* y habla de lo que logran los
  usuarios, sin términos técnicos como API, URL o bounded context.
- Términos que no se usan: *librería* (biblioteca), *requerimiento* (requisito), *aplicativo*
  (aplicación), *elicitar* (obtener), *deployar*, *testear* y *comitear*. Scrum es un framework, no
  una metodología.

## Generar el PDF

El PDF se genera con Pandoc y XeLaTeX a partir de los archivos de `config/build.yaml`.

1. Instala Pandoc y MiKTeX (una sola vez). En Windows:
   `winget install --id JohnMacFarlane.Pandoc` y `winget install --id MiKTeX.MiKTeX`.
   Después abre una terminal nueva.
2. Desde la raíz del repositorio ejecuta `.\build.ps1` en Windows, o `make pdf` en Linux o macOS.
3. El resultado queda en `build/informe-bottletrack.pdf`.

Si agregas un capítulo o un anexo, añádelo a `input-files` en `config/build.yaml`, en su lugar.
Las imágenes se escriben como `assets/<sección>/archivo.png`, relativas a `report/`.

## Antes de abrir un Pull Request

1. Comprueba que todo enlace e imagen apunte a un archivo y a un ancla que existan. Al mover o
   renombrar un archivo, actualiza la tabla de contenido del `README.md`.
2. Deja una línea en blanco antes y después de cada encabezado, también entre un `<a id="…"></a>`
   y su título; si no, Pandoc no reconoce el título y no sale en el índice del PDF.
3. Añade una fila al Registro de Versiones del `README.md` con la versión, la fecha, el autor y el
   cambio.

## Ramas y commits

El repositorio sigue GitFlow: cada cambio sale de `develop` en una rama `feature/`, `fix/` o `docs/`
y vuelve por Pull Request. Los commits siguen Conventional Commits en inglés, con el alcance de la
sección: `docs(sprint-goal): …`, `docs(database-design): …`, `fix(report): …`.