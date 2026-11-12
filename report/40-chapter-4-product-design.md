[← Capítulo III](30-chapter-3-requirements-specification.md) · [Contenido](../README.md#contenido) · [Capítulo V →](50-chapter-5-product-implementation-validation-and-deployment.md)

<a id="capitulo-iv-product-design"></a>

# Capítulo IV: Product Design

<a id="41-style-guidelines"></a>

## 4.1. Style Guidelines.

En esta sección el equipo establece el repositorio central de decisiones visuales que comparten el Landing Page y la Frontend Web Application de BottleTrack. El objetivo es que ambos productos se perciban como una sola experiencia, tal como lo exige la consistencia entre el sitio web estático y la aplicación web.

Las decisiones se implementaron como variables CSS en el archivo `assets/css/tokens.css` del repositorio del Landing Page, y se documentan de forma viva en la vista `style-guide.html`, que funciona como referencia consultable para todo el equipo. Ningún valor visual se escribe directamente en las vistas: siempre se consume el token correspondiente, de modo que un cambio de marca se realiza en un solo lugar.

<a id="411-general-style-guidelines"></a>

### 4.1.1. General Style Guidelines.

**Branding**

BottleTrack es el producto de la startup CodeCrafters. La marca se apoya en el color naranja, asociado al movimiento y a la señalización logística, y en una comunicación directa centrada en la trazabilidad. El logotipo se representa con una marca cuadrada de esquinas redondeadas acompañada del nombre del producto en tipografía de alto peso.

**Tono de comunicación**

El equipo definió las siguientes dimensiones para el lenguaje aplicado en toda la experiencia:

| Dimensión | Decisión | Sustento |
| :-------- | :------- | :------- |
| Divertido / Serio | Serio | El usuario consulta la plataforma mientras la carga está en riesgo; el contenido informa, no entretiene. |
| Formal / Casual | Casual moderado | Los segmentos incluyen supervisores de operación y responsables de bodegas, para quienes un lenguaje excesivamente formal genera distancia. |
| Respetuoso / Irreverente | Respetuoso | La plataforma registra incidencias que afectan el desempeño de personas, por lo que el lenguaje evita cualquier tono de sanción. |
| Entusiasta / Sereno | Sereno | Las alertas deben leerse con calma para no amplificar la urgencia de la operación. |

**Colores**

La paleta se organiza en una sola rampa de marca de tres peldaños, separados por contraste y no por matiz. Solo los dos peldaños oscuros son legibles como texto sobre fondo blanco; el color de marca se emplea únicamente como fondo con texto blanco encima.

| Muestra | Token | Valor | Contraste sobre blanco | Rol |
| :------ | :---- | :---- | :--------------------- | :-- |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#f97316;border:1px solid #ded8d3;"></div> | `--primary` | `#f97316` | 3.0:1 | Color de marca. Fondo de botones y acentos, nunca texto. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#b34900;border:1px solid #ded8d3;"></div> | `--primary-mid` | `#b34900` | 5.4:1 (AA) | Primer peldaño legible. Enlaces y texto destacado. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#4f2000;border:1px solid #ded8d3;"></div> | `--primary-dark` | `#4f2000` | 12.4:1 | Titulares, estados de hover y acentos profundos. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#ffedd5;border:1px solid #ded8d3;"></div> | `--primary-soft` | `#ffedd5` | — | Fondo tenue para botones terciarios y numeradores. |

Las superficies y el color de texto general se resuelven con cuatro valores. Una superficie apagada se pinta siempre con un color opaco, nunca con una capa translúcida.

| Muestra | Token | Valor | Rol |
| :------ | :---- | :---- | :-- |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#ffffff;border:1px solid #ded8d3;"></div> | `--background` / `--surface` | `#ffffff` | Fondo de la página y de las tarjetas. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#f6f2ef;border:1px solid #ded8d3;"></div> | `--surface-muted` | `#f6f2ef` | Superficie en segundo plano, para alternar secciones. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#303030;border:1px solid #ded8d3;"></div> | `--foreground` | `#303030` | Color de texto general, en reemplazo del negro puro. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#202020;border:1px solid #ded8d3;"></div> | `--chrome` | `#202020` | Fondo del pie de página y del marco de la aplicación. |

Los colores neutros se reducen a cuatro roles de línea ordenados por jerarquía y no por tono, de manera que un divisor interno no pese lo mismo que el borde de una tarjeta clicable:

| Muestra | Token | Valor | Rol |
| :------ | :---- | :---- | :-- |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#efeceb;border:1px solid #ded8d3;"></div> | `--line` | `#efeceb` | Divisor dentro de una superficie. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#ded8d3;border:1px solid #ded8d3;"></div> | `--border` | `#ded8d3` | Borde por defecto de una superficie. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#c2c2c2;border:1px solid #ded8d3;"></div> | `--control` | `#c2c2c2` | Borde de un elemento interactivo en reposo. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#a3a3a3;border:1px solid #ded8d3;"></div> | `--control-hover` | `#a3a3a3` | El mismo elemento bajo el cursor. |

Los estados se resuelven con cuatro roles, cada uno con tres piezas: el color sólido para puntos y barras, el fuerte para el hover y para el texto sobre el suave, y el suave como fondo de etiqueta. La pareja suave más fuerte cumple el nivel AA por diseño.

| Rol | Sólido | Fuerte | Suave | Uso en BottleTrack |
| :-- | :----- | :----- | :---- | :----------------- |
| `danger` | <div style="width:48px;height:24px;border-radius:4px;background-color:#e7000b;border:1px solid #ded8d3;"></div><br>`#e7000b` | <div style="width:48px;height:24px;border-radius:4px;background-color:#c10007;border:1px solid #ded8d3;"></div><br>`#c10007` | <div style="width:48px;height:24px;border-radius:4px;background-color:#ffe2e2;border:1px solid #ded8d3;"></div><br>`#ffe2e2` | Botellas rotas, entrega fallida, incidencia crítica. |
| `warning` | <div style="width:48px;height:24px;border-radius:4px;background-color:#eab308;border:1px solid #ded8d3;"></div><br>`#eab308` | <div style="width:48px;height:24px;border-radius:4px;background-color:#854d0e;border:1px solid #ded8d3;"></div><br>`#854d0e` | <div style="width:48px;height:24px;border-radius:4px;background-color:#fef9c3;border:1px solid #ded8d3;"></div><br>`#fef9c3` | Ruta retrasada, temperatura fuera de rango. |
| `success` | <div style="width:48px;height:24px;border-radius:4px;background-color:#30b875;border:1px solid #ded8d3;"></div><br>`#30b875` | <div style="width:48px;height:24px;border-radius:4px;background-color:#044137;border:1px solid #ded8d3;"></div><br>`#044137` | <div style="width:48px;height:24px;border-radius:4px;background-color:#e0f5eb;border:1px solid #ded8d3;"></div><br>`#e0f5eb` | Entrega realizada, incidencia resuelta. |
| `info` | <div style="width:48px;height:24px;border-radius:4px;background-color:#155dfc;border:1px solid #ded8d3;"></div><br>`#155dfc` | <div style="width:48px;height:24px;border-radius:4px;background-color:#1447e6;border:1px solid #ded8d3;"></div><br>`#1447e6` | <div style="width:48px;height:24px;border-radius:4px;background-color:#dbeafe;border:1px solid #ded8d3;"></div><br>`#dbeafe` | Envío en tránsito, aviso informativo. |

Finalmente, el estado deshabilitado cuenta con su propia pareja de tokens. Su contraste bajo es deliberado, ya que las pautas de accesibilidad eximen a los controles deshabilitados justamente para que se lean inertes.

| Muestra | Token | Valor | Rol |
| :------ | :---- | :---- | :-- |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#eae7e5;border:1px solid #ded8d3;"></div> | `--disabled` | `#eae7e5` | Relleno del control deshabilitado. |
| <div style="width:48px;height:24px;border-radius:4px;background-color:#a09a96;border:1px solid #ded8d3;"></div> | `--disabled-ink` | `#a09a96` | Texto del control deshabilitado. |

Una decisión relevante es que el rol `success` conserva una familia verde propia y el rol `warning` se desplazó hacia el ámbar. Al ser el naranja el color de la marca, un estado de aviso naranja dejaría de leerse como señal y una confirmación naranja se confundiría con un elemento de marca.

**Tipografía**

La familia tipográfica es Manrope, con una pila de respaldo de tipografías de sistema. La escala parte de una base de 16 píxeles y crece en pasos definidos como variables, evitando valores arbitrarios.

| Muestra | Token | Tamaño | Uso |
| :------ | :---- | :----- | :-- |
| <span style="font-size:48px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-5xl` | 3 rem · 48 px | Titular principal del Landing Page. |
| <span style="font-size:36px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-4xl` | 2.25 rem · 36 px | Título de página. |
| <span style="font-size:30px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-3xl` | 1.875 rem · 30 px | Título de sección. |
| <span style="font-size:20px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-xl` | 1.25 rem · 20 px | Título de tarjeta. |
| <span style="font-size:18px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-lg` | 1.125 rem · 18 px | Párrafo de entrada de sección. |
| <span style="font-size:16px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-base` | 1 rem · 16 px | Cuerpo de texto por defecto. |
| <span style="font-size:14px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-sm` | 0.875 rem · 14 px | Texto secundario, etiquetas y botones. |
| <span style="font-size:12px;font-weight:700;color:#4f2000;line-height:1.2;">Aa</span> | `--text-xs` | 0.75 rem · 12 px | Metadatos y etiquetas de estado. |

Los pesos se limitan a cuatro valores (400, 500, 600 y 700) y la altura de línea a tres: 1.2 para titulares, 1.35 para texto compacto y 1.6 para cuerpo de texto.

**Espaciado**

El sistema de espaciado utiliza una base de cuatro píxeles expuesta como escala de tokens. Toda separación entre elementos consume un valor de la escala, lo que sostiene el ritmo vertical de las vistas en ambos productos y evita el uso de valores arbitrarios.

| Muestra | Token | Valor | Uso habitual |
| :------ | :---- | :---- | :----------- |
| <div style="width:4px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-1` | 4 px | Separación mínima entre elementos contiguos. |
| <div style="width:8px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-2` | 8 px | Separación entre una etiqueta y su campo. |
| <div style="width:12px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-3` | 12 px | Relleno vertical de botones y etiquetas de estado. |
| <div style="width:16px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-4` | 16 px | Separación entre tarjetas de una rejilla. |
| <div style="width:20px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-5` | 20 px | Separación entre bloques de texto del encabezado principal. |
| <div style="width:24px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-6` | 24 px | Relleno interno de una tarjeta y márgenes laterales del contenedor. |
| <div style="width:32px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-8` | 32 px | Separación entre bloques del pie de página. |
| <div style="width:40px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-10` | 40 px | Separación entre columnas en pantallas medianas. |
| <div style="width:48px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-12` | 48 px | Relleno vertical de sección en vista móvil. |
| <div style="width:64px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-16` | 64 px | Separación entre las dos columnas del encabezado principal. |
| <div style="width:80px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-20` | 80 px | Relleno vertical de sección en vista de escritorio. |
| <div style="width:96px;height:12px;border-radius:2px;background-color:#f97316;"></div> | `--space-24` | 96 px | Espacio superior del encabezado principal. |

<a id="412-web-style-guidelines"></a>

### 4.1.2. Web Style Guidelines.

**Superficies y elevación**

Una superficie apagada se pinta siempre con un color opaco (`--surface-muted`) y nunca con una capa translúcida, porque una capa translúcida deja pasar el color que se encuentre detrás y produce resultados distintos según la sección. La elevación se reserva para elementos que efectivamente flotan: una tarjeta estática se define por su borde, y solo la tarjeta clicable recibe sombra al recibir el cursor.

**Componentes compartidos**

Los componentes se implementaron en `assets/css/components.css` y son los mismos que consumirá la Frontend Web Application, adaptándolos a la biblioteca de componentes PrimeVue bajo el lenguaje de diseño Material Design:

| Componente | Variantes | Comportamiento |
| :--------- | :-------- | :------------- |
| Botón | Primario, secundario, terciario y deshabilitado | El botón deshabilitado utiliza los tokens `--disabled` y `--disabled-ink`, con un contraste bajo deliberado para que se lea inerte. |
| Tarjeta | Estática e interactiva | La interactiva refuerza el borde en reposo y añade elevación en hover. |
| Etiqueta de estado | Cuatro roles de estado | Combina siempre el fondo suave con el texto fuerte del mismo rol. |
| Campo de formulario | Reposo, hover y deshabilitado | Etiqueta asociada mediante el atributo `for`. |

**Responsive web design**

El Landing Page se construyó con una aproximación fluida basada en unidades relativas, `grid` y `flex`. Los puntos de quiebre son dos: 60 rem, donde el bloque principal pasa de dos columnas a una, y 48 rem, donde la navegación se colapsa en un menú desplegable y la escala tipográfica reduce sus tamaños mayores.

**Interacción y accesibilidad**

Las transiciones duran 160 milisegundos y se anulan cuando el sistema operativo declara la preferencia `prefers-reduced-motion`. Todo elemento enfocable expone un contorno visible mediante `:focus-visible`. La experiencia incluye un enlace de salto al contenido principal, atributos ARIA en los controles que cambian de estado y texto alternativo en las imágenes.


<a id="42-information-architecture"></a>

## 4.2. Information Architecture.

En esta sección el equipo plantea las decisiones que dirigen la manera como se organiza el contenido en el Landing Page y en la Frontend Web Application de BottleTrack. El criterio que guía estas decisiones es que cada segmento objetivo encuentre lo que necesita sin recorrer contenido que no le corresponde, considerando que los segmentos operan en contextos muy distintos: el administrador y el supervisor consultan la plataforma desde una oficina, mientras que el responsable de la bodega lo hace desde un teléfono, con poco tiempo disponible y mientras atiende su negocio.

<a id="421-organization-systems"></a>

### 4.2.1. Organization Systems.

**Organización visual del contenido**

| Producto | Esquema aplicado | Sustento |
| :------- | :--------------- | :------- |
| Landing Page | Jerárquica | El visitante llega sin conocer el producto, por lo que el contenido desciende desde la propuesta de valor hasta el detalle de las funcionalidades y los segmentos. |
| Landing Page, sección "Cómo funciona" | Secuencial | La operación se explica como tres pasos ordenados en el tiempo, del despacho al cierre de la incidencia. |
| Web Application, tablero de rutas | Matricial | El supervisor compara varias rutas simultáneas según estado, avance y alertas, sin que exista un orden de lectura obligatorio. |
| Web Application, registro de incidencias | Secuencial | El reporte de una incidencia es un flujo de pasos que el supervisor completa hasta adjuntar la evidencia. |

**Esquemas de categorización**

| Esquema | Dónde se aplica |
| :------ | :-------------- |
| Por audiencia | Sección de segmentos del Landing Page, donde cada bloque se dirige a un segmento objetivo y ofrece su propio llamado a la acción. |
| Por tópicos | Funcionalidades del producto, agrupadas en seguimiento y monitoreo IoT por un lado, y reporte de incidencias por el otro. |
| Cronológico | Historial de eventos de una ruta y bitácora de incidencias en la Web Application, ordenados del evento más reciente al más antiguo. |
| Alfabético | Listados auxiliares de la Web Application, como el catálogo de vehículos y de puntos de entrega. |

<a id="422-labeling-systems"></a>

### 4.2.2. Labeling Systems.

Las etiquetas se redactan con el mínimo número de palabras y utilizan el vocabulario del Ubiquitous Language del dominio, de manera que el visitante y el usuario reconozcan de inmediato a qué conjunto de información se refieren. El idioma por defecto de la interfaz es el inglés, con la traducción al español latinoamericano disponible mediante el selector de idioma.

| Etiqueta (en-US) | Etiqueta (es-419) | Conjunto de información asociado |
| :--------------- | :---------------- | :------------------------------- |
| Features | Funcionalidades | Capacidades del producto. |
| How it works | Cómo funciona | Explicación del flujo de la operación. |
| Who it is for | Para quién es | Segmentos objetivo y sus llamados a la acción. |
| The product | El producto | Video About the Product. |
| The team | El equipo | Video About the Team. |
| Contact | Contacto | Correo, teléfono y redes sociales de CodeCrafters. |
| Route | Ruta | Recorrido asignado a un vehículo con sus puntos de entrega. |
| Stop | Parada | Punto de entrega individual dentro de una ruta. |
| Shipment | Envío | Carga de producto asociada a una ruta. |
| Incident | Incidencia | Problema reportado durante el transporte. |
| In transit | En tránsito | Estado de un envío que ya salió y no ha llegado. |
| Delivered | Entregado | Estado de una parada completada. |

Las etiquetas de estado se acompañan siempre de su color de rol, pero nunca dependen únicamente del color para comunicar el significado, de manera que la información siga siendo comprensible para personas con dificultades en la percepción del color.

<a id="423-seo-tags-and-meta-tags"></a>

### 4.2.3. SEO Tags and Meta Tags.

Los siguientes valores se encuentran implementados en las vistas del Landing Page.

**Vista principal (`index.html`)**

| Etiqueta | Valor |
| :------- | :---- |
| `title` | BottleTrack \| Bottled beverage transport tracking and IoT monitoring |
| `description` | BottleTrack lets beverage distributors follow every route in real time, monitor cargo with IoT sensors and report transport incidents with evidence. |
| `keywords` | beverage logistics, fleet tracking, IoT monitoring, cold chain, delivery incidents, transport management |
| `author` | CodeCrafters |
| `og:title` | BottleTrack \| Bottled beverage transport tracking |
| `og:type` | website |
| `og:locale` | en_US |
| `og:locale:alternate` | es_419 |

**Vista de términos y condiciones (`terms-of-service.html`)**

| Etiqueta | Valor |
| :------- | :---- |
| `title` | Terms and conditions of service \| BottleTrack |
| `description` | Terms and conditions of service for the BottleTrack platform, including the ethical and professional commitments adopted by CodeCrafters. |
| `keywords` | terms of service, conditions, privacy, BottleTrack, CodeCrafters |
| `author` | CodeCrafters |

**Vistas de la Frontend Web Application**

| Vista | `title` | `description` |
| :---- | :------ | :------------ |
| Monitoring | Fleet monitoring \| BottleTrack | Real time view of every active route, with cargo temperature and impact alerts. |
| Incidents | Incident reporting \| BottleTrack | Report damaged product, broken bottles, missing units and delays with photographic evidence. |
| Analytics | Delivery indicators \| BottleTrack | Product loss, delivery compliance and recurring failures across the distribution operation. |
| Delivery tracking | Track your order \| BottleTrack | Check the status of your beverage order and report shortages or damaged products on arrival. |

<a id="424-searching-systems"></a>

### 4.2.4. Searching Systems.

El Landing Page no incorpora un sistema de búsqueda, ya que su volumen de contenido es reducido y la navegación por secciones basta para recorrerlo por completo.

En la Frontend Web Application la búsqueda sí resulta necesaria, porque el volumen de rutas e incidencias crece con la operación. Las decisiones son las siguientes:

| Vista | Búsqueda | Filtros | Presentación de los resultados |
| :---- | :------- | :------ | :----------------------------- |
| Rutas | Por código de ruta, placa del vehículo o nombre del conductor | Estado del envío, rango de fechas y vehículo | Listado con el estado, el avance y la alerta más reciente de cada ruta. |
| Incidencias | Por código de incidencia o punto de entrega | Tipo de incidencia, severidad, estado de seguimiento y rango de fechas | Listado ordenado del reporte más reciente al más antiguo, con etiqueta de estado. |
| Puntos de entrega | Por nombre del cliente o distrito | Distrito y tipo de establecimiento | Listado alfabético. |

Cuando una búsqueda no arroja resultados, la vista comunica de forma explícita que no se encontraron coincidencias e indica qué filtros se encuentran activos, para que el usuario pueda retirarlos sin abandonar la vista.

<a id="425-navigation-systems"></a>

### 4.2.5. Navigation Systems.

**Landing Page**

La navegación principal se mantiene fija en la parte superior durante todo el recorrido y enlaza a las secciones mediante desplazamiento suave dentro de la misma página. Esto permite que el visitante conserve en todo momento la referencia de dónde se encuentra y pueda saltar a cualquier sección sin retroceder.

El recorrido esperado del visitante desciende desde la propuesta de valor hasta los segmentos objetivo. Cada segmento presenta un llamado a la acción propio que redirige a la vista correspondiente de la Frontend Web Application:

| Segmento objetivo | Llamado a la acción | Vista de destino |
| :---------------- | :------------------ | :--------------- |
| Supervisores o encargados de flota | Monitor your fleet | Monitoring |
| Empresas distribuidoras de bebidas | See the indicators | Analytics |
| Bodegas y minimarkets | Track your order | Delivery tracking |

En dispositivos con ancho menor a 48 rem la navegación se colapsa en un menú desplegable que expone su estado mediante el atributo `aria-expanded` y se cierra automáticamente al seleccionar un enlace. El pie de página repite los enlaces principales y añade el acceso a los términos y condiciones del servicio.

**Frontend Web Application**

La aplicación utiliza una barra lateral persistente como sistema de navegación global. Sus opciones dependen del rol: el administrador accede a indicadores, flota, usuarios y configuración de la empresa; el supervisor, a operaciones, monitoreo, incidencias e historial; y el responsable de la bodega, únicamente a la vista de seguimiento de sus pedidos. Dentro de cada sección se emplea navegación contextual mediante una ruta de migas que permite regresar del detalle de una ruta o de una incidencia al listado del que se ingresó, sin perder los filtros aplicados.


<a id="43-landing-page-ui-design"></a>

## 4.3. Landing Page UI Design.

En esta sección se presenta la propuesta de interfaz del Landing Page, elaborada en Figma antes de su implementación. El archivo de diseño se encuentra disponible en https://www.figma.com/design/lBVdrnyGUWfjN6Mz4fhBpY/BOTTLETRACK?node-id=0-1. La propuesta aplica las decisiones de la sección 4.1 y la organización de contenido de la sección 4.2: una navegación fija con selector de idioma, una sección hero con la propuesta de valor y su llamado a la acción principal, y un recorrido que desciende desde el problema hasta los segmentos objetivo.

<a id="431-landing-page-wireframe"></a>

### 4.3.1. Landing Page Wireframe.

El wireframe define la estructura y la jerarquía de cada sección sin aplicar color ni contenido final. Se organiza en una retícula de dos columnas para la sección hero, que combina el mensaje principal con una vista previa del estado de una ruta, y en una retícula de tres columnas para las tarjetas de problemas, capacidades y segmentos. En pantallas angostas las columnas se apilan en una sola, conservando el orden de lectura.

<img src="assets/landingPageUIDesign/landing1_wireframe.png" alt="Wireframe del Landing Page: navegación, sección hero y sección del problema" width="800">

<img src="assets/landingPageUIDesign/landing2_wireframe.png" alt="Wireframe del Landing Page: capacidades del producto y funcionamiento" width="800">

<img src="assets/landingPageUIDesign/landing3_wireframe.png" alt="Wireframe del Landing Page: segmentos objetivo, videos y pie de página" width="800">

<a id="432-landing-page-mock-up"></a>

### 4.3.2. Landing Page Mock-up.

El mock-up aplica el design system de BottleTrack sobre el wireframe: la rampa naranja para los llamados a la acción, la tipografía Manrope, las superficies alternadas para separar secciones y los colores de estado en la vista previa de la ruta, donde cada estado se acompaña de un texto y no depende solo del color. El mensaje principal, *Cada botella, rastreada desde la planta hasta el cliente*, resume la propuesta de valor, y la sección del problema traduce los tres puntos de dolor de las entrevistas: la falta de visibilidad, la falta de evidencia y la falta de datos.

<img src="assets/landingPageUIDesign/landing1_mockup.png" alt="Mock-up del Landing Page: sección hero y sección del problema" width="800">

<img src="assets/landingPageUIDesign/landing2_mockup.png" alt="Mock-up del Landing Page: capacidades y funcionamiento del producto" width="800">

<img src="assets/landingPageUIDesign/landing3_mockup.png" alt="Mock-up del Landing Page: segmentos objetivo y pie de página" width="800">

<a id="44-web-applications-uxui-design"></a>

## 4.4. Web Applications UX/UI Design.

En esta sección se presenta el diseño de la Frontend Web Application para sus dos roles principales: el administrador de la distribuidora y el supervisor de flota. El tercer rol, el responsable de la bodega, utiliza una única vista de seguimiento de pedidos, que se presenta en las evidencias de ejecución del Capítulo V. Las vistas se diseñaron en Figma siguiendo el mismo design system del Landing Page, para que la experiencia sea consistente entre ambos productos. El archivo de diseño se encuentra disponible en: https://www.figma.com/design/lBVdrnyGUWfjN6Mz4fhBpY/BOTTLETRACK?node-id=0-1

<a id="441-web-applications-wireframes"></a>

### 4.4.1. Web Applications Wireframes.

Los wireframes comparten una estructura común: una barra lateral de navegación global a la izquierda y un área de contenido con el título de la vista, sus filtros y la información principal.

**Vistas comunes**

**Login.** Formulario de inicio de sesión con correo y contraseña, selector de idioma y acceso a la recuperación de la contraseña.

<img src="assets/webApplicationUxDesign/wireframes/loginWA_wireframe.png" alt="Wireframe de la vista de inicio de sesión" width="800">

**Profile.** Datos personales del usuario autenticado, su rol y la empresa a la que pertenece.

<img src="assets/webApplicationUxDesign/wireframes/profileWA_wireframe.png" alt="Wireframe de la vista de perfil" width="800">

<hr>

**Vistas del administrador**

**Users.** Registro de nuevos usuarios de la empresa y asignación de su rol.

<img src="assets/webApplicationUxDesign/wireframes/registrouser_admin_WA_wireframe.png" alt="Wireframe del registro de usuarios" width="800">

**Company settings.** Datos de la empresa distribuidora.

<img src="assets/webApplicationUxDesign/wireframes/config_admin_WA_wireframe.png" alt="Wireframe de la configuración de la empresa" width="800">

**Vehicles.** Registro de un vehículo con su placa, modelo, capacidad y estado.

<img src="assets/webApplicationUxDesign/wireframes/registrovehiculo_admin_WA_wireframe.png" alt="Wireframe del registro de vehículos" width="800">

**Drivers.** Registro de un conductor con sus datos de contacto y su licencia.

<img src="assets/webApplicationUxDesign/wireframes/registroconductor_admin_WA_wireframe.png" alt="Wireframe del registro de conductores" width="800">

**Dashboard.** Indicadores de la operación, reportes e incidencias recientes.

<img src="assets/webApplicationUxDesign/wireframes/dashboard_admin_WA_wireframe.png" alt="Wireframe del dashboard del administrador" width="800">

<hr>

**Vistas del supervisor**

**Operation history.** Listado de las operaciones finalizadas con sus filtros.

<img src="assets/webApplicationUxDesign/wireframes/browser_supervisor_WA_wireframe.png" alt="Wireframe del historial de operaciones" width="800">

**Incident detail.** Información de una incidencia y de la operación a la que pertenece.

<img src="assets/webApplicationUxDesign/wireframes/incident_browser_supervisor_WA_wireframe.png" alt="Wireframe del detalle de una incidencia" width="800">

**Delivery points.** Puntos de entrega de una operación y el estado de cada uno.

<img src="assets/webApplicationUxDesign/wireframes/deliverypoint_supervisor_WA_wireframe.png" alt="Wireframe de los puntos de entrega" width="800">

**Incident summary.** Resumen de las incidencias registradas.

<img src="assets/webApplicationUxDesign/wireframes/driver_browser_supervisor_WA_wireframe.png" alt="Wireframe del resumen de incidencias" width="800">

**New operation.** Creación de una operación de transporte en tres pasos: datos, vehículo y conductor.

<img src="assets/webApplicationUxDesign/wireframes/newoperation_supervisor_WA_wireframe.png" alt="Wireframe de la creación de una operación" width="800">

**Operations.** Listado de las operaciones asignadas al supervisor con su estado.

<img src="assets/webApplicationUxDesign/wireframes/operationlist_supervisor_WA_wireframe.png" alt="Wireframe del listado de operaciones" width="800">

**Dashboard.** Resumen de las operaciones del día, las entregas y las incidencias abiertas.

<img src="assets/webApplicationUxDesign/wireframes/dashboard_supervisor_WA_wireframe.png" alt="Wireframe del dashboard del supervisor" width="800">

<a id="442-web-applications-wireflow-diagrams"></a>

### 4.4.2. Web Applications Wireflow Diagrams.

Los wireflows conectan los wireframes según las acciones del usuario. Cada flecha parte del elemento que el usuario selecciona y llega a la vista resultante.

**Wireflow del administrador.** Parte del inicio de sesión y llega al dashboard, desde el cual el administrador accede a la gestión de usuarios, vehículos, conductores y a la configuración de la empresa.

<img src="assets/webApplicationUxDesign/wireflow/admin_WA_wireflow.png" alt="Wireflow del administrador" width="800">

**Wireflow del supervisor.** Parte del inicio de sesión y recorre el ciclo de una operación: el listado de operaciones, la creación de una operación, sus puntos de entrega, las incidencias y el historial.

<img src="assets/webApplicationUxDesign/wireflow/supervisor_WA_wireflow.png" alt="Wireflow del supervisor" width="800">

A continuación se presentan los wireflows organizados por User Goal para cada rol de la Web Application.

#### Administrador

**Goal 1: Iniciar sesión y revisar el estado de la operación.**

<img src="assets/webApplicationUxDesign/wireflow/goal_admin_login_WA_wireflow.png" alt="Wireflow del administrador: iniciar sesión y revisar el estado de la operación" width="800">

**Goal:** El administrador quiere iniciar sesión en BottleTrack y revisar el estado general de las operaciones del día.

El administrador ingresa su correo electrónico y su contraseña en la pantalla de inicio de sesión (US04) y presiona «Iniciar sesión». El sistema valida sus credenciales y lo dirige al Dashboard (US35). Allí ve los indicadores del día: operaciones de hoy, en curso, completadas y con incidencias, además de los vehículos y conductores disponibles. También encuentra el gráfico de operaciones por semana y una tabla con las últimas operaciones, su conductor, su vehículo y su estado.

**Goal 2: Registrar un nuevo usuario.**

<img src="assets/webApplicationUxDesign/wireflow/goal_admin_users_WA_wireflow.png" alt="Wireflow del administrador: registrar un nuevo usuario" width="800">

**Goal:** El administrador quiere registrar un nuevo usuario de la empresa y asignarle un rol.

Desde el Dashboard, el administrador selecciona «Usuarios» en el menú lateral. En Gestión de usuarios (US07, US08) ve la lista de usuarios con su nombre, apellidos, correo y teléfono, y puede filtrarla por rol y por estado. Al crear un usuario se abre el panel lateral «Nuevo usuario», donde completa el nombre, los apellidos, el correo y el teléfono, elige el rol (US08) y el estado, y presiona «Guardar». El nuevo usuario se agrega a la tabla.

**Goal 3: Registrar vehículos y conductores de la flota.**

<img src="assets/webApplicationUxDesign/wireflow/goal_admin_fleet_WA_wireflow.png" alt="Wireflow del administrador: registrar vehículos y conductores de la flota" width="800">

**Goal:** El administrador quiere registrar los vehículos y los conductores de la flota para que estén disponibles al planificar operaciones.

Desde el Dashboard, el administrador entra a Flota > Vehículos (US10, US11, US12). Ve la lista de vehículos con placa, marca, modelo, año y capacidad, con filtros por estado y marca, y en el panel «Registrar vehículo» completa esos datos junto con el estado del vehículo. Luego pasa a Flota > Conductores (US13, US14, US15), donde ve el nombre, los apellidos, el DNI, el número de licencia y el teléfono de cada conductor. En el panel «Registrar conductor» ingresa sus datos, lo deja como «Disponible» y presiona «Guardar».

**Goal 4: Configurar los datos de la empresa.**

<img src="assets/webApplicationUxDesign/wireflow/goal_admin_company_WA_wireflow.png" alt="Wireflow del administrador: configurar los datos de la empresa" width="800">

**Goal:** El administrador quiere mantener actualizados los datos de su empresa en BottleTrack.

Desde el Dashboard, el administrador selecciona «Empresa» en el menú lateral y llega a Configuración de empresa (US09). Puede cambiar el logo y editar la razón social, el RUC, el nombre comercial, el teléfono, el correo y la dirección. Al presionar «Guardar cambios» se actualiza la información; con «Cancelar» se descartan los cambios.

**Goal 5: Recuperar el acceso a la cuenta.**

<img src="assets/webApplicationUxDesign/wireflow/goal_admin_password_WA_wireflow.png" alt="Wireflow del administrador: recuperar el acceso a la cuenta" width="800">

**Goal:** El usuario quiere recuperar el acceso a su cuenta cuando olvidó su contraseña.

En la pantalla de inicio de sesión, el usuario selecciona «¿Olvidaste tu contraseña?». En Recuperar contraseña ingresa el correo de su cuenta y presiona «Enviar enlace de recuperación». El sistema envía un enlace para restablecer la contraseña, que vence en 30 minutos, y el usuario vuelve a la pantalla de inicio de sesión para ingresar con su nueva contraseña. Este flujo está disponible tanto para el administrador como para el supervisor.

#### Supervisor de flota

**Goal 1: Iniciar sesión y monitorear las operaciones del día.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_login_WA_wireflow.png" alt="Wireflow del supervisor de flota: iniciar sesión y monitorear las operaciones del día" width="800">

**Goal:** El supervisor quiere iniciar sesión y conocer de inmediato el estado de las operaciones y entregas del día.

El supervisor ingresa su correo y su contraseña (US04) y llega a su Dashboard (US35). Allí ve las operaciones de hoy, en curso, pendientes y completadas, y el estado de las entregas: completadas, pendientes, retrasadas y con incidencias. La tabla «Operaciones en curso» muestra la ruta, el conductor, el vehículo, el avance de las entregas (por ejemplo, 2/4) y el estado de cada operación.

**Goal 2: Crear una operación de transporte y definir su ruta.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_create_operation_WA_wireflow.png" alt="Wireflow del supervisor de flota: crear una operación de transporte y definir su ruta" width="800">

**Goal:** El supervisor quiere crear una operación de transporte, asignarle un vehículo y un conductor, y definir los puntos de entrega de su ruta.

Desde el Dashboard, el supervisor entra a Operaciones (US19), donde ve la lista de operaciones con filtros por fecha, estado, conductor y vehículo, y presiona «Nueva operación». En Crear operación de transporte (US16, US17, US18) completa tres pasos: los datos de la operación (descripción y fecha), la asignación de un vehículo disponible y la asignación de un conductor disponible. Al presionar «Guardar y continuar a Ruta» pasa a Puntos de entrega (US23, US24), donde agrega cada establecimiento con su dirección y su distrito, los reordena arrastrándolos y puede eliminar los que no correspondan.

**Goal 3: Hacer seguimiento a una operación y finalizarla.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_finish_operation_WA_wireflow.png" alt="Wireflow del supervisor de flota: hacer seguimiento a una operación y finalizarla" width="800">

**Goal:** El supervisor quiere revisar el avance de una operación en curso y finalizarla cuando termine el recorrido.

En la lista de operaciones, el supervisor selecciona una operación (por ejemplo, OP-001) y abre su detalle (US34). Ve el conductor, el vehículo, la fecha, las incidencias, una barra con el progreso de las entregas (2 de 4 completadas) y la lista de puntos de entrega con su estado. Al presionar «Finalizar operación» (US22) se abre una ventana de confirmación con el resumen de entregas completadas y pendientes, las incidencias abiertas y un campo de observaciones. Con «Confirmar finalización», la operación se cierra y pasa al historial.

**Goal 4: Gestionar las incidencias de las operaciones.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_incidents_WA_wireflow.png" alt="Wireflow del supervisor de flota: gestionar las incidencias de las operaciones" width="800">

**Goal:** El supervisor quiere revisar las incidencias reportadas durante las operaciones y actualizar su estado.

Desde el detalle de una operación, el supervisor presiona «Ver incidencias» y llega a Gestión de incidencias (US32, US33). Ve la lista con el código, la operación, el punto de entrega y el tipo de cada incidencia, con filtros por tipo, severidad, estado y fecha. Al seleccionar una incidencia se abre un panel con la operación, la entrega, el tipo, la descripción y la evidencia fotográfica (US31). Desde ese panel actualiza el estado de la incidencia (US33) y presiona «Guardar».

**Goal 5: Consultar el historial de operaciones.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_history_WA_wireflow.png" alt="Wireflow del supervisor de flota: consultar el historial de operaciones" width="800">

**Goal:** El supervisor quiere consultar las operaciones finalizadas para analizar su resultado.

Desde el Dashboard, el supervisor entra a Historial (US36). Filtra las operaciones por rango de fechas, conductor, vehículo, estado o si tuvieron incidencias, y ve en la tabla las entregas totales, las completadas, las incidencias y el estado final de cada una. Al abrir una fila se muestra el detalle de la operación en modo solo lectura (US37).

**Goal 6: Revisar el perfil y cerrar sesión.**

<img src="assets/webApplicationUxDesign/wireflow/goal_super_profile_WA_wireflow.png" alt="Wireflow del supervisor de flota: revisar el perfil y cerrar sesión" width="800">

**Goal:** El supervisor quiere revisar los datos de su cuenta y cerrar sesión de forma segura.

Desde el menú lateral, el supervisor selecciona «Perfil». Ve su nombre, sus apellidos, su correo, su teléfono, su rol (Supervisor de flota) y la empresa a la que pertenece, y puede editar sus datos con «Editar datos». Al presionar «Cerrar sesión» (US05) finaliza su sesión y vuelve a la pantalla de inicio de sesión.

<a id="443-web-applications-mock-ups"></a>

### 4.4.3. Web Applications Mock-ups.

Los mock-ups aplican el design system sobre los wireframes. La barra lateral usa el color `--chrome` para separar visualmente la navegación del contenido, los botones principales usan `--primary` y los estados de las operaciones y de las incidencias se muestran como etiquetas con color y texto.

**Administrador.** Inicio de sesión, dashboard, gestión de usuarios y gestión de la flota.

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_login_WA_wireframe.png" alt="Mock-up de la vista de inicio de sesión" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_admin1_WA_wireframe.png" alt="Mock-up del dashboard del administrador" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_admin2_WA_wireframe.png" alt="Mock-up de la gestión de usuarios" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_admin3_WA_wireframe.png" alt="Mock-up de la gestión de la flota" width="500">

**Supervisor.** Listado de operaciones, detalle de una operación con el progreso de sus entregas, creación de una operación e incidencias.

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_super1_WA_wireframe.png" alt="Mock-up del listado de operaciones" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_super2_WA_wireframe.png" alt="Mock-up del detalle de una operación" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_super3_WA_wireframe.png" alt="Mock-up de la creación de una operación" width="800">

<img src="assets/webApplicationUxDesign/mock-ups-wireframe/mockup_super4_WA_wireframe.png" alt="Mock-up de las incidencias" width="800">

<a id="444-web-applications-user-flow-diagrams"></a>

### 4.4.4. Web Applications User Flow Diagrams.

Los User Flow Diagrams describen, para cada User Goal, el recorrido que sigue el usuario en la Web Application. Cada goal se enuncia desde el rol que lo persigue, con la forma *Como [rol], quiero [acción] para [beneficio]*. Los diagramas combinan las pantallas de los mock-ups de la sección 4.4.3 con las acciones del usuario y las condiciones que deciden el camino: el **happy path**, en verde, lleva al usuario a cumplir su objetivo, y cada **unhappy path**, en rojo, muestra lo que ocurre cuando una condición no se cumple y cómo el usuario retoma el flujo.

**Leyenda**

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/user_flow_legend.png"><img src="assets/webApplicationUxDesign/user-flow/user_flow_legend.png" alt="Leyenda de los User Flow Diagrams" width="433"></a></p>

#### Administrador

**Goal 1: Iniciar sesión y revisar el estado de la operación.**

**User Goal:** Como administrador de la distribuidora, quiero iniciar sesión y revisar el estado de las operaciones del día para detectar a tiempo las entregas con problemas.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_admin_login_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_admin_login_WA_userflow.png" alt="User flow: iniciar sesión y revisar el estado de la operación" width="595"></a></p>

**Happy path.** El administrador ingresa su correo y su contraseña en la pantalla de inicio de sesión. Como los datos tienen un formato válido, las credenciales son correctas y su cuenta está activa, BottleTrack lo lleva al Dashboard del administrador. Si el indicador «Con incidencias» muestra operaciones afectadas, lo abre y revisa esas operaciones; si no, revisa el avance de las operaciones del día.

**Unhappy paths.**

- **Formato inválido:** si el correo o la contraseña están vacíos o el correo no tiene formato válido, el formulario marca el campo y no envía la solicitud.
- **Credenciales incorrectas:** se muestra «El correo o la contraseña son incorrectos» y se conserva el correo ingresado para que lo corrija.
- **Cuenta inactiva:** se muestra «Tu cuenta está inactiva» y el usuario no ingresa a la aplicación.

**Goal 2: Registrar un nuevo usuario.**

**User Goal:** Como administrador, quiero registrar a un nuevo usuario de mi empresa y asignarle un rol para que acceda solo a las funciones que le corresponden.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_admin_users_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_admin_users_WA_userflow.png" alt="User flow: registrar un nuevo usuario" width="616"></a></p>

**Happy path.** Desde el Dashboard, el administrador entra a «Usuarios» y abre el panel «Nuevo usuario». Completa nombres, correo, contraseña, rol y estado, y presiona «Guardar». Como los datos son válidos y el correo no está registrado, el usuario aparece en la lista con su rol y ya puede iniciar sesión.

**Unhappy paths.**

- **Datos incompletos o inválidos:** el panel marca junto a cada campo el dato que falta o es inválido, y el administrador lo corrige sin perder lo ingresado.
- **Correo ya registrado:** se muestra «El correo ya está registrado» y no se crea el usuario hasta que el administrador use otro correo.
- **Cancelar:** el panel se cierra sin crear el usuario.

**Goal 3: Registrar vehículos y conductores de la flota.**

**User Goal:** Como administrador, quiero registrar los vehículos y los conductores de mi flota para que el supervisor pueda asignarlos a las operaciones de transporte.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_admin_fleet_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_admin_fleet_WA_userflow.png" alt="User flow: registrar vehículos y conductores de la flota" width="597"></a></p>

**Happy path.** El administrador entra a Flota › Vehículos y registra un vehículo con una placa válida y su capacidad; el vehículo queda con estado «Disponible». Luego entra a Flota › Conductores y registra un conductor con su DNI y su licencia. Ambos quedan disponibles para asignarse al crear una operación.

**Unhappy paths.**

- **Formato inválido:** si la placa no sigue el formato ABC-123, la capacidad no es mayor que cero, el DNI no tiene 8 dígitos o la licencia no es válida, el panel marca el campo y no guarda.
- **Datos duplicados:** si la placa, el DNI o la licencia ya existen en la empresa, se muestra el dato duplicado y no se guarda el registro.

**Goal 4: Configurar los datos de la empresa.**

**User Goal:** Como administrador, quiero mantener actualizados los datos de mi empresa para que la información de contacto de BottleTrack sea correcta.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_admin_company_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_admin_company_WA_userflow.png" alt="User flow: configurar los datos de la empresa" width="621"></a></p>

**Happy path.** El administrador entra a «Empresa», edita la razón social, el teléfono o la dirección y presiona «Guardar cambios». Como los campos obligatorios están completos y el servicio guarda los cambios, la tarjeta de la empresa muestra los datos actualizados.

**Unhappy paths.**

- **Campo obligatorio vacío:** el formulario señala el campo y no guarda hasta que se complete.
- **Error del servicio:** se muestra «No pudimos guardar los cambios. Inténtalo de nuevo» y los datos anteriores se mantienen.
- **Cancelar:** se descartan los cambios.

**Goal 5: Recuperar el acceso a la cuenta.**

**User Goal:** Como usuario de BottleTrack, quiero recuperar el acceso a mi cuenta cuando olvido mi contraseña para seguir trabajando sin depender de soporte.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_admin_password_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_admin_password_WA_userflow.png" alt="User flow: recuperar el acceso a la cuenta" width="614"></a></p>

**Happy path.** Desde el inicio de sesión, el usuario presiona «¿Olvidaste tu contraseña?», ingresa su correo y presiona «Enviar enlace». La pantalla confirma el envío y le recuerda que el enlace vence en 30 minutos. El usuario recibe el correo, define una nueva contraseña e inicia sesión.

**Unhappy paths.**

- **Correo inválido:** el campo se marca como inválido y no se envía el enlace.
- **El correo no llega:** el recuadro informativo le sugiere revisar la carpeta de spam o solicitar un nuevo enlace.
- **Volver:** con «Volver a iniciar sesión» regresa sin enviar el enlace.

#### Supervisor de flota

**Goal 1: Iniciar sesión y monitorear las operaciones del día.**

**User Goal:** Como supervisor de flota, quiero iniciar sesión y conocer de inmediato el estado de las operaciones y entregas del día para priorizar las que necesitan atención.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_login_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_login_WA_userflow.png" alt="User flow: iniciar sesión y monitorear las operaciones del día" width="589"></a></p>

**Happy path.** El supervisor inicia sesión con credenciales correctas y llega a su Dashboard. Si hay entregas retrasadas o con incidencias, busca la operación desde la barra superior y abre su detalle para atenderla; si no, sigue el avance de las operaciones en curso.

**Unhappy paths.**

- **Credenciales incorrectas:** se muestra «El correo o la contraseña son incorrectos» y vuelve a intentarlo.
- **Servicio no disponible:** se muestra «No pudimos conectar con BottleTrack» y el supervisor reintenta en unos minutos.

**Goal 2: Crear una operación de transporte y definir su ruta.**

**User Goal:** Como supervisor de flota, quiero crear una operación de transporte con su vehículo, su conductor y sus puntos de entrega para planificar el reparto del día.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_create_operation_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_create_operation_WA_userflow.png" alt="User flow: crear una operación de transporte y definir su ruta" width="558"></a></p>

**Happy path.** En la lista de operaciones, el supervisor presiona «Nueva operación», ingresa la descripción y la fecha, elige un vehículo y un conductor disponibles y presiona «Guardar y continuar a Ruta». En la pantalla de ruta agrega los puntos de entrega con su cantidad y ordena las paradas. La operación queda «Pendiente», lista para iniciarse.

**Unhappy paths.**

- **Descripción o fecha inválidas:** el formulario marca el campo y no avanza.
- **Sin recursos disponibles:** la vista informa que no hay vehículos o conductores disponibles y el supervisor vuelve a la lista sin crear la operación.
- **Recurso tomado por otra operación:** si el vehículo o el conductor dejó de estar disponible al guardar, se muestra «Ese recurso ya no está disponible. Elige otro».
- **Parada inválida:** si falta el punto de entrega o la cantidad no es mayor que cero, el diálogo lo marca y no agrega la parada.

**Goal 3: Registrar las entregas y finalizar una operación.**

**User Goal:** Como supervisor de flota, quiero registrar el resultado de cada entrega y finalizar la operación para cerrar la jornada con información completa sobre lo entregado.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_finish_operation_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_finish_operation_WA_userflow.png" alt="User flow: registrar las entregas y finalizar una operación" width="1122"></a></p>

**Happy path.** El supervisor abre la operación «En curso» y registra el resultado de cada entrega: completa, parcial o no realizada. Repite el registro mientras queden entregas pendientes. Cuando no queda ninguna, presiona «Finalizar operación» y confirma. La operación queda «Completada» y su vehículo y su conductor vuelven a estar disponibles.

**Unhappy paths.**

- **Entrega parcial incompleta:** el diálogo exige una cantidad mayor que cero y menor que la planificada, y el motivo de la diferencia.
- **Entrega no realizada sin motivo:** el diálogo exige el motivo antes de registrarla.
- **Cancelar la finalización:** la operación sigue «En curso» y el supervisor vuelve al detalle.

**Goal 4: Gestionar las incidencias de las operaciones.**

**User Goal:** Como supervisor de flota, quiero revisar las incidencias de mis operaciones y actualizar su estado para resolverlas antes del cierre de la jornada.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_incidents_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_incidents_WA_userflow.png" alt="User flow: gestionar las incidencias de las operaciones" width="812"></a></p>

**Happy path.** El supervisor filtra la lista de incidencias y abre una. En el panel de detalle revisa la evidencia y elige el siguiente estado; si la marca como «Resuelta», describe la acción tomada. El servicio guarda el cambio y la incidencia muestra su nuevo estado en la lista.

**Unhappy paths.**

- **Resolución vacía:** el panel no permite marcar la incidencia como «Resuelta» sin describir la acción tomada.
- **Error del servicio:** se muestra «No pudimos guardar los cambios» y el estado no cambia.
- **Cerrar:** vuelve a la lista sin modificar la incidencia.

**Goal 5: Consultar el historial de operaciones.**

**User Goal:** Como supervisor de flota, quiero consultar las operaciones finalizadas para analizar sus resultados y la merma de cada jornada.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_history_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_history_WA_userflow.png" alt="User flow: consultar el historial de operaciones" width="602"></a></p>

**Happy path.** El supervisor entra a «Historial» y filtra por rango de fechas, conductor o estado. Con los resultados, abre el detalle de una operación en modo lectura para revisar sus entregas, incidencias y merma, o exporta el historial filtrado.

**Unhappy paths.**

- **Sin resultados:** la tabla indica que no hay operaciones con esos filtros y el supervisor los cambia.

**Goal 6: Revisar el perfil y cerrar sesión.**

**User Goal:** Como supervisor de flota, quiero revisar los datos de mi cuenta y cerrar sesión de forma segura para que nadie use mi cuenta en un equipo compartido.

<p align="center"><a href="assets/webApplicationUxDesign/user-flow/goal_super_profile_WA_userflow.png"><img src="assets/webApplicationUxDesign/user-flow/goal_super_profile_WA_userflow.png" alt="User flow: revisar el perfil y cerrar sesión" width="911"></a></p>

**Happy path.** Desde el menú, el supervisor abre su perfil. Puede editar sus nombres y su correo y guardarlos, o presionar «Cerrar sesión». Al cerrar sesión, BottleTrack invalida la sesión y lo lleva al inicio de sesión.

**Unhappy paths.**

- **Correo ya registrado:** se muestra «El correo ya está registrado» y no se guardan los cambios.
- **Intento de volver con «Atrás»:** las rutas de la aplicación están protegidas, por lo que el navegador regresa al inicio de sesión.

<a id="45-web-applications-prototyping"></a>

## 4.5. Web Applications Prototyping.

El prototipo navegable se construyó en Figma conectando los mock-ups de la sección 4.4.3. Permite recorrer el inicio de sesión, el dashboard, la creación de una operación, el detalle de sus entregas y el registro de incidencias, y sirvió de base para la Web Application sobre la que se realizaron las entrevistas de validación de la sección 5.3.

<img src="assets/webApplicationUxDesign/prototype_WA.png" alt="Prototipo navegable de la Web Application en Figma" width="800">

<a id="46-domain-driven-software-architecture"></a>

## 4.6. Domain-Driven Software Architecture.

La arquitectura de BottleTrack se diseñó con Domain-Driven Design. El dominio se divide en cinco bounded contexts, cada uno con su propio lenguaje, sus agregados y su conjunto de tablas: **Identity and Access Management**, **Fleet Management**, **Operations and Routes**, **IoT Monitoring** e **Incident Management**. Los cuatro primeros corresponden a las capacidades del producto; IoT Monitoring se separa de Operations and Routes porque maneja datos de alta frecuencia e inmutables, tiene un vocabulario propio (lectura, rango seguro, alerta) y cambia por razones distintas, como el proveedor de los dispositivos.

El Backend API se organiza como un **monolito modular**: un solo despliegue con un módulo por bounded context. Cada módulo aplica **arquitectura hexagonal** (puertos y adaptadores):

| Capa | Contenido | Rol en la arquitectura hexagonal |
| :--- | :-------- | :------------------------------- |
| Interfaces | Controllers REST y manejadores de eventos | Adaptadores de entrada |
| Application | Command Services y Query Services | Implementan los puertos de entrada y orquestan los casos de uso |
| Domain | Agregados, entidades, value objects, eventos de dominio e interfaces de repositorio | Núcleo del negocio, sin dependencias de frameworks. Declara los puertos de salida |
| Infrastructure | Repositorios con Entity Framework Core, cliente del servicio de mapas, emisión de tokens | Adaptadores de salida que implementan los puertos del dominio |

Los bounded contexts no acceden a las tablas de los demás. Se comunican a través de **facades** (por ejemplo, Operations and Routes reserva un vehículo mediante la facade de Fleet Management) o de **eventos de dominio** (IoT Monitoring publica `AlertRaised` e Incident Management abre una incidencia).

<a id="461-design-level-event-storming"></a>

### 4.6.1. Design-level Event Storming.

El Design-Level EventStorming parte de los eventos del Big Picture de la sección 2.4 y los agrupa por bounded context. Para cada contexto se identificaron los **agregados** (amarillo), los **comandos** que reciben (azul), los **eventos de dominio** que publican (naranja), las **políticas** que reaccionan a esos eventos (morado) y los **read models** que consultan los usuarios (verde). Las políticas definen las reglas que cruzan contextos, por ejemplo: *cuando se completa una operación, liberar el vehículo y el conductor*, o *cuando se levanta una alerta crítica, abrir una incidencia*.

El tablero se encuentra disponible en: https://miro.com/welcomeonboard/aEpQNnI1bURVdldqRzNDWk5aUnR6bStSQnhiSmpuYi9RM01sVkxtOWNsM3V5T1NkRW5pdHFuZ003VHcrV0hxR29tQ0xvRTJHV1VNTzNYUWV1VmwyWUZGRzlld2tuSnZKRTNrM3RnczNnc0NMQWt2WlB6WnEzRXBES1h0d2svaStnbHpza3F6REdEcmNpNEFOMmJXWXBBPT0hdjE=?share_link_id=491275847129

<img src="assets/chapter4/design-level-eventstorming.jpeg" alt="Design-Level EventStorming con los cinco bounded contexts de BottleTrack">

<a id="462-software-architecture-context-diagram"></a>

### 4.6.2. Software Architecture Context Diagram.

El diagrama de contexto muestra a BottleTrack como una caja negra y su relación con las personas y los sistemas externos. Sus usuarios son el administrador de la distribuidora, el supervisor de flota y el responsable de la bodega. El conductor aparece como actor del dominio que reporta al supervisor, pero no usa la aplicación. Los sistemas externos son los dispositivos IoT instalados en los vehículos y el servicio de mapas y geolocalización, que constituye el servicio de terceros que consume la solución.

Los diagramas C4 se elaboraron con Structurizr DSL; el código fuente de cada diagrama se encuentra junto a su imagen ...en la carpeta `report/assets/DD-SoftwareArchitecture` del repositorio.

<img src="assets/DD-SoftwareArchitecture/contextDiagram.png" alt="Diagrama de contexto C4 de BottleTrack" width="800">

<a id="463-software-architecture-container-diagrams"></a>

### 4.6.3. Software Architecture Container Diagrams.

El diagrama de contenedores muestra las unidades desplegables de la solución:

| Contenedor | Tecnología | Despliegue |
| :--------- | :--------- | :--------- |
| Website | HTML5, CSS3, JavaScript | Netlify (contenido estático) |
| Web Application Static Content | Archivos HTML, CSS y JavaScript generados por el build de Vue 3 | Vercel (contenido estático) |
| Single-Page Application | Vue 3, PrimeVue, Pinia, Vue Router, vue-i18n, axios | Navegador del usuario |
| Web Services | ASP.NET Core (.NET 10), C#, Entity Framework Core, documentado con OpenAPI y Scalar | Proveedor de nube (monolito) |
| Database | MySQL | Proveedor de nube |

El Website y la Web Application son dos productos distintos y ambos se despliegan como contenido estático, es decir, como una copia de carpetas con archivos HTML, CSS y JavaScript hacia un hosting. Por eso el diagrama los representa con el contenedor de tipo carpeta.

La Web Application se representa con dos contenedores. Cuando el usuario escribe la URL de la aplicación, el hosting de Vercel le entrega los archivos, y desde ese momento toda la aplicación se ejecuta en su navegador como una Single-Page Application. A partir de allí el usuario interactúa únicamente con ese contenedor, que consume los Web Services mediante HTTPS y JSON.

La persona que visita el Website todavía no está autenticada, por lo que el diagrama la representa como *Visitor*. Los roles Distributor Administrator, Fleet Supervisor y Delivery Point Owner aparecen cuando interactúan con la aplicación. Los Web Services son un único contenedor porque el backend es un monolito, y son el único contenedor que accede a la base de datos y al servicio de mapas.

<img src="assets/DD-SoftwareArchitecture/containerDiagram.png" alt="Diagrama de contenedores C4 de BottleTrack" width="800">

<a id="464-software-architecture-components-diagrams"></a>

### 4.6.4. Software Architecture Components Diagrams.

Se elaboró un diagrama de componentes por bounded context. Los cinco bounded contexts ya están implementados en los Web Services. Los componentes dibujados con borde punteado y trazo tenue (*Planned*) son los que conectan un contexto con otro (facades, capas anticorrupción y eventos de dominio) y los adaptadores hacia servicios externos, que todavía no existen en el código; el resto corresponde a lo que ya está implementado en el repositorio. Todos siguen la misma estructura hexagonal: un controller como adaptador de entrada, command services y query services en la capa de aplicación, el modelo de dominio con sus agregados, la interfaz del repositorio como puerto de salida (borde punteado) y el repositorio de Entity Framework Core como adaptador que lo implementa.

**Identity and Access Management.** Gestiona las organizaciones y los usuarios con sus roles. Implementado: registro, consulta y edición de organizaciones y de usuarios, asignación de rol, un adaptador de salida que calcula el hash de las contraseñas con PBKDF2 y el inicio de sesión, que valida las credenciales y emite un token JWT.

<img src="assets/DD-SoftwareArchitecture/componentIAM_D.png" alt="Diagrama de componentes de Identity and Access Management" width="800">

**Fleet Management.** Gestiona los vehículos y los conductores y su disponibilidad. Implementado: registro y consulta de vehículos y de conductores, con filtro por disponibilidad. La facade con la que Operations and Routes reservará y liberará recursos está planificada.

<img src="assets/DD-SoftwareArchitecture/componentFleetM_D.png" alt="Diagrama de componentes de Fleet Management" width="800">

**Operations and Routes.** Es el core del dominio. Gestiona el ciclo de vida de la operación de transporte, sus puntos de entrega y el resultado de cada entrega. Su capa anticorrupción traduce las llamadas a Fleet Management y al servicio de mapas.

<img src="assets/DD-SoftwareArchitecture/componentOR_D.png" alt="Diagrama de componentes de Operations and Routes" width="800">

**IoT Monitoring.** Recibe las lecturas de los dispositivos, las evalúa contra el rango seguro y levanta alertas. Publica el evento `AlertRaised` para que Incident Management actúe.

<img src="assets/DD-SoftwareArchitecture/componentIoTM_D.png" alt="Diagrama de componentes de IoT Monitoring" width="800">

**Incident Management.** Gestiona las incidencias, su evidencia, su severidad y su resolución. Abre incidencias a partir de los reportes del supervisor, de la bodega o de las alertas de IoT Monitoring.

<img src="assets/DD-SoftwareArchitecture/componentIM_D.png" alt="Diagrama de componentes de Incident Management" width="800">

<a id="47-software-object-oriented-design"></a>

## 4.7. Software Object-Oriented Design.

<a id="471-class-diagrams"></a>

### 4.7.1. Class Diagrams.

Los diagramas de clases se presentan en dos versiones, una por producto, porque cada uno se programa en un lenguaje distinto y sigue sus propias convenciones de nomenclatura: la Frontend Web Application en JavaScript y el Backend en C#. Ambas se organizan por bounded context, con nombres en inglés tomados del Ubiquitous Language de la sección 2.5.

Ambos diagramas se elaboraron como Diagram-as-Code con PlantUML, y sus fuentes son `report/assets/Software-Object-Oriented-Design/frontend-class-diagrams.puml` y `report/assets/Software-Object-Oriented-Design/backend-class-diagrams.puml`. Cada bounded context tiene además su propia fuente (`frontend-class-<bounded-context>.puml` y `backend-class-<bounded-context>.puml`) en la misma carpeta.

**Cómo leer los diagramas**

- Cada clase muestra sus atributos y sus métodos con su visibilidad: `+` público y `-` privado. En el frontend, el prefijo `/` indica un getter, es decir, una propiedad derivada de solo lectura, como `/fullName`.
- El estereotipo entre `« »` indica el rol de la clase. En el backend: *Aggregate Root* (raíz que controla un agregado), *Entity* y *Value Object*. En el frontend: *Entity*, *Command* (datos de una acción del usuario), *Assembler* (convierte entre recursos del API y entidades) e *Infrastructure* (acceso al API).
- Una flecha continua con punta abierta es una asociación: una clase conoce a otra. Una flecha punteada es una dependencia: una clase usa o crea a otra. Un rombo relleno es una composición: la parte no existe sin el todo. Un triángulo hueco es herencia, o la extensión de una interfaz.
- Cada relación tiene su nombre sobre la línea y su multiplicidad en los extremos (`1`, `0..1`, `0..*`, `1..*`).
- El recuadro inferior de cada imagen contiene las clases compartidas. En el frontend son `BaseApi` y `BaseEndpoint`, de los que dependen todas las clases de acceso al API. En el backend son `IBaseRepository` e `IUnitOfWork`, del Shared Kernel.

**Frontend Web Application (JavaScript)**

El diagrama completo reúne los cinco bounded contexts y refleja las clases implementadas en el repositorio de la Web Application. Los stores de Pinia y los componentes de Vue no se incluyen porque no son clases.

<img src="assets/Software-Object-Oriented-Design/frontend-class-diagrams.png" alt="Diagrama de clases completo de la Frontend Web Application" width="800">

**Backend (C#)**

El diagrama completo reúne el modelo de dominio implementado en los Web Services para los cinco bounded contexts. Las relaciones entre contextos se representan con dependencias por identificador, ya que un agregado nunca contiene a otro de un contexto distinto.

<img src="assets/Software-Object-Oriented-Design/backend-class-diagrams.png" alt="Diagrama de clases completo del Backend" width="800">

#### Identity and Access Management

Gestiona la organización de la empresa distribuidora y los usuarios que acceden a BottleTrack con su rol.

*Frontend.* `User` y `Organization` son las entidades. `User` guarda sus datos y su rol, y ofrece getters como `fullName` e `isActive` y el método `hasAnyRole` para validar el acceso a cada vista. Cada usuario tiene un único rol de `USER_ROLES` (administrador, supervisor de flota o responsable de bodega). Los comandos (`SignInCommand`, `RegisterUserCommand`, `UpdateUserCommand`, `AssignRoleCommand` y `UpdateOrganizationCommand`) encapsulan los datos de cada acción. `UserAssembler`, `OrganizationAssembler` y `SignInAssembler` leen esos comandos y crean las entidades y el `SignInResource` (usuario y token). `IamApi` recibe el comando de inicio de sesión, hereda de `BaseApi` y contiene dos `BaseEndpoint`, uno para usuarios y otro para organizaciones.

<img src="assets/Software-Object-Oriented-Design/frontend-class-identity-access.png" alt="Diagrama de clases de Identity and Access Management en el frontend" width="800">

*Backend.* `Organization` y `User` son agregados independientes. Muchos usuarios (`1..*`) pertenecen a una organización, y cada usuario tiene un rol (`UserRole`) y un estado (`UserStatus`). `EmailAddress` y `TaxId` son value objects dentro de sus agregados: el correo identifica al usuario y la organización se registra con su `TaxId`. Los métodos expresan las reglas, como `Register`, `UpdateProfile`, `AssignRole` y `Deactivate`. `IOrganizationRepository` e `IUserRepository` definen cómo se guardan y buscan los agregados, por ejemplo buscar un usuario por correo.

<img src="assets/Software-Object-Oriented-Design/backend-class-identity-access.png" alt="Diagrama de clases de Identity and Access Management en el backend" width="800">

#### Fleet Management

Administra los vehículos y los conductores que se asignan a las operaciones de transporte.

*Frontend.* `Vehicle` y `Driver` son entidades con sus datos (placa, marca, modelo y capacidad en cajas para el vehículo; documento y licencia para el conductor). Cada una tiene un estado de `VEHICLE_STATUSES` o `DRIVER_STATUSES` (disponible, asignado y en mantenimiento o inactivo) y expone el getter `isAvailable`, que se calcula a partir de ese estado. `VehicleAssembler` y `DriverAssembler` crean las entidades a partir de las respuestas del API y las convierten en recursos para enviarlas. `FleetApi` accede al API con dos `BaseEndpoint`, uno para vehículos y otro para conductores.

<img src="assets/Software-Object-Oriented-Design/frontend-class-fleet-management.png" alt="Diagrama de clases de Fleet Management en el frontend" width="800">

*Backend.* `Vehicle` y `Driver` son raíces de agregado que controlan su propia disponibilidad: `Reserve` los marca como asignados, `Release` los libera y, en el vehículo, `SendToMaintenance` lo retira de circulación. `PlateNumber` y `LicenseNumber` son value objects que los identifican, y cada uno tiene un estado (`VehicleStatus` o `DriverStatus`). `IVehicleRepository` e `IDriverRepository` permiten buscar por placa, documento o licencia, para evitar duplicados, y listar los recursos disponibles de una organización.

<img src="assets/Software-Object-Oriented-Design/backend-class-fleet-management.png" alt="Diagrama de clases de Fleet Management en el backend" width="800">

#### Operations and Routes

Planifica y ejecuta las operaciones de transporte: sus recursos, su ruta de entregas y el resultado de cada entrega.

*Frontend.* `TransportOperation` contiene (composición, `1` a `0..*`) a sus `DeliveryStop`, las paradas de entrega ordenadas por `sequenceNumber`. Sus getters indican qué puede hacerse en cada momento, como `canStart`, `canComplete` y `canCancel`, y calculan el avance (`progress`). `DeliveryOrder` es la vista de la bodega sobre una parada: muestra su estado de seguimiento y si ya se puede reportar un problema. Los estados salen de `OPERATION_STATUSES` y `DELIVERY_STATUSES`. Los comandos agregan una parada a una operación (`AddDeliveryStopCommand`), registran el resultado de una parada (`RecordDeliveryCommand`, que valida las cantidades y el motivo) y reportan un problema sobre un `DeliveryOrder` (`ReportReceptionProblemCommand`). Los assemblers leen esos comandos y crean las entidades. `TransportOperationsApi` y `OperationsApi` acceden al API con cinco y cuatro `BaseEndpoint`.

<img src="assets/Software-Object-Oriented-Design/frontend-class-operations-routes.png" alt="Diagrama de clases de Operations and Routes en el frontend" width="800">

*Backend.* `TransportOperation` es la raíz del agregado y contiene entre una y muchas `DeliveryStop` (`1..*`). Toda modificación de una parada pasa por la operación, que valida las transiciones de estado con `Dispatch`, `Start`, `Complete` y `Cancel`, registra los resultados con `RecordDelivery` y calcula el avance con `CalculateProgress`. Cada parada se entrega en un `DeliveryPoint` y tiene una cantidad planificada y otra entregada, modeladas con el value object `Quantity`. Los estados están en `OperationStatus` y `DeliveryStatus`. `ITransportOperationRepository` e `IDeliveryPointRepository` definen las consultas por organización, por estado y por responsable de la bodega.

<img src="assets/Software-Object-Oriented-Design/backend-class-operations-routes.png" alt="Diagrama de clases de Operations and Routes en el backend" width="800">

#### IoT Monitoring

Vigila la carga durante la operación con las lecturas de temperatura y golpes de los dispositivos IoT, y genera alertas cuando se sale del rango seguro.

*Frontend.* `IoTDevice` guarda su rango seguro de temperatura y su umbral de impacto, y con `isTemperatureSafe`, `isImpactSafe` y `evaluate` decide qué tipos de alerta de `ALERT_TYPES` corresponden a una `SensorReading` (como máximo dos, por eso la multiplicidad `0..2`). `Alert` registra la alerta y si ya fue atendida (`isAcknowledged`). `SafeRange` valida los límites que el usuario configura para un dispositivo. `MonitoredOperation` es una vista de lectura que agrupa una operación con su dispositivo (`0..1`) y su última lectura (`0..1`), e indica si la carga está segura o si el dispositivo está sin conexión. `MonitoringAssembler` crea estas clases y `MonitoringApi` accede al API con seis `BaseEndpoint`.

<img src="assets/Software-Object-Oriented-Design/frontend-class-iot-monitoring.png" alt="Diagrama de clases de IoT Monitoring en el frontend" width="800">

*Backend.* `IoTDevice` es la raíz del agregado: se instala en un vehículo (`InstallOnVehicle`), se configura con un `SafeRange` (`ConfigureSafeRange`), registra muchas `SensorReading` y levanta muchas `Alert` cuando `Evaluate` detecta una lectura fuera de rango o un golpe fuerte. `Alert` es otra raíz de agregado, con tipo `AlertType` (temperatura fuera de rango, impacto detectado o dispositivo sin conexión), y se atiende con `Acknowledge`. `IIoTDeviceRepository` busca el dispositivo de un vehículo e `IAlertRepository` lista las alertas de las operaciones.

<img src="assets/Software-Object-Oriented-Design/backend-class-iot-monitoring.png" alt="Diagrama de clases de IoT Monitoring en el backend" width="800">

#### Incident Management

Registra y da seguimiento a las incidencias que afectan una operación o una entrega, con sus evidencias, hasta su cierre.

*Frontend.* `Incident` guarda su código, su origen, su tipo, su severidad, la cantidad afectada y su estado. Avanza por `INCIDENT_STATUSES` (reportada, en revisión, resuelta y cerrada) y expone getters que guían la interfaz: `nextStatus`, `isOpen` y `requiresResolution`. Cada `Evidence` pertenece a una incidencia (`0..*` a `1`). Los comandos validan sus datos antes de enviarlos: `ReportIncidentCommand` para reportar, `AdvanceIncidentCommand` para pasar al siguiente estado y `AttachEvidenceCommand` para adjuntar una evidencia. `IncidentAssembler` y `EvidenceAssembler` leen esos comandos y crean las entidades, y `IncidentsApi` accede al API con cuatro `BaseEndpoint`.

<img src="assets/Software-Object-Oriented-Design/frontend-class-incident-management.png" alt="Diagrama de clases de Incident Management en el frontend" width="800">

*Backend.* `Incident` es la raíz del agregado y contiene sus `Evidence` (`0..*`). Su ciclo de vida se expresa con los métodos `Report`, `AttachEvidence`, `AssignSeverity`, `Review`, `Resolve` y `Close`. Cada incidencia se clasifica por tipo (`IncidentType`), tiene una severidad (`Severity`), un estado (`IncidentStatus`) y un origen (`IncidentSource`): el supervisor, la bodega o una alerta IoT. `IIncidentRepository` lista las incidencias de las operaciones y obtiene el siguiente código correlativo.

<img src="assets/Software-Object-Oriented-Design/backend-class-incident-management.png" alt="Diagrama de clases de Incident Management en el backend" width="800">

Los diagramas del backend de los cinco bounded contexts, junto con el Shared Kernel, reflejan el código del repositorio de los Web Services.

<a id="48-database-design"></a>

## 4.8. Database Design.

<a id="481-database-diagrams"></a>

### 4.8.1. Database Diagrams.

El diagrama de base de datos corresponde al esquema relacional en MySQL. Las tablas siguen una convención única: nombres en inglés, en plural y en snake_case, y columnas en snake_case. Las claves primarias son identificadores `CHAR(36)` generados por la aplicación y las claves foráneas se nombran como `<entidad>_id`.

Las tablas `organizations`, `users`, `vehicles` y `drivers` reflejan la migración `InitialCreate` de los Web Services: los estados se guardan como texto (`VARCHAR`) y los correos, los RUC, las placas, los DNI y las licencias son únicos. Las demás tablas pertenecen a los bounded contexts que todavía no están implementados y son diseño.

El diagrama se elaboró como Diagram-as-Code con PlantUML; su fuente es `report/assets/Database-Design/database-diagram.puml`.

<img src="assets/Database-Design/DatabaseDiagrams.png" alt="Diagrama de base de datos de BottleTrack" width="800">
<hr>

---

[← Capítulo III](30-chapter-3-requirements-specification.md) · [Contenido](../README.md#contenido) · [Capítulo V →](50-chapter-5-product-implementation-validation-and-deployment.md)