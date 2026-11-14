[← Capítulo IV](40-chapter-4-product-design.md) · [Contenido](../README.md#contenido) · [Conclusiones →](90-conclusions.md)

<a id="capitulo-v-product-implementation-validation-deployment"></a>

# Capítulo V: Product Implementation, Validation & Deployment

<a id="51-software-configuration-management"></a>

## 5.1. Software Configuration Management.

En esta sección el equipo establece las decisiones y convenciones que permiten mantener la consistencia del producto durante todo el ciclo de vida. Estas decisiones son de cumplimiento obligatorio para todos los integrantes del equipo y se aplican de manera idéntica en los cuatro repositorios del proyecto.

<a id="511-software-development-environment-configuration"></a>

### 5.1.1. Software Development Environment Configuration.

A continuación se indican los productos de software que utiliza el equipo, el propósito de cada uno dentro del proyecto y la ruta de referencia o de descarga correspondiente.

**Project Management**

| Producto | Propósito | Ruta de referencia |
| :------- | :-------- | :----------------- |
| Trello | Product Backlog y Sprint Backlog del equipo, con el tablero público de control de estado. | https://trello.com |
| Discord | Reuniones de Sprint Planning, Review y Retrospective del equipo. | https://discord.com |
| Microsoft Stream | Publicación de los videos de entrevistas y de exposición con enlace privado. | https://www.microsoft.com/microsoft-stream |

**Requirements Management**

| Producto | Propósito | Ruta de referencia |
| :------- | :-------- | :----------------- |
| UXPressia | Elaboración de User Personas, Empathy Maps, User Journey Maps e Impact Maps. | https://uxpressia.com |
| Miro | Sesiones de Big Picture EventStorming y Design-Level EventStorming. | https://miro.com |

**Product UX/UI Design**

| Producto | Propósito | Ruta de referencia |
| :------- | :-------- | :----------------- |
| Figma | Wireframes, Mock-ups y Prototypes del Landing Page y de la Web Application. | https://www.figma.com |
| FigJam | Wireflow Diagrams. | https://www.figma.com/figjam |
| Graphviz | User Flow Diagrams elaborados como Diagram-as-Code en lenguaje DOT. | https://graphviz.org |
| Structurizr DSL y Structurizr Playground | Diagramas de arquitectura de software bajo el C4 Model. | https://playground.structurizr.com |
| PlantUML | Diagramas UML de clases y diagrama de base de datos, elaborados como Diagram-as-Code. | https://plantuml.com |

**Software Development**

| Producto | Propósito | Ruta de descarga |
| :------- | :-------- | :--------------- |
| JetBrains WebStorm | Entorno de desarrollo del Landing Page y de la Frontend Web Application. | https://www.jetbrains.com/webstorm |
| JetBrains Rider | Entorno de desarrollo de los Web Services en C#. | https://www.jetbrains.com/rider |
| Node.js y npm | Ejecución del entorno de desarrollo y gestión de dependencias de la Frontend Web Application. | https://nodejs.org |
| .NET SDK | Compilación y ejecución de los Web Services. | https://dotnet.microsoft.com/download |
| MySQL Server | Sistema de gestión de base de datos relacional. | https://dev.mysql.com/downloads |
| Git | Control de versiones distribuido. | https://git-scm.com/downloads |

**Software Deployment**

| Producto | Propósito | Ruta de referencia |
| :------- | :-------- | :----------------- |
| Netlify | Publicación del Landing Page. | https://www.netlify.com |
| Vercel | Publicación de la Frontend Web Application. | https://vercel.com |

**Software Documentation**

| Producto | Propósito | Ruta de referencia |
| :------- | :-------- | :----------------- |
| GitHub | Alojamiento del informe en formato Markdown y de los repositorios de código. | https://github.com |
| Scalar / OpenAPI | Documentación interactiva de los endpoints de los Web Services. | https://scalar.com |
| Pandoc y XeLaTeX (MiKTeX) | Generación del informe en PDF a partir de los archivos Markdown. | https://pandoc.org |

<a id="512-source-code-management"></a>

### 5.1.2. Source Code Management.

El seguimiento de modificaciones se realiza con Git, gestionado desde GitHub. El equipo trabaja dentro de una organización pública, con un repositorio independiente por producto.

| Repositorio | Contenido | URL |
| :---------- | :-------- | :-- |
| bottle-track-website | Landing Page: sitio web estático en HTML5, CSS3 y JavaScript. | https://github.com/1ASI0730-2620-8084-CodeCrafters/bottle-track-website |
| Frontend-Web-Aplication | Aplicación web desarrollada con Vue Framework. | https://github.com/1ASI0730-2620-8084-CodeCrafters/Frontend-Web-Aplication |
| bottle-track-web-services | RESTful API en ASP.NET Core, con sus pruebas unitarias y de integración. | https://github.com/1ASI0730-2620-8084-CodeCrafters/bottle-track-web-services |
| bottle-track-report | Informe del proyecto en formato Markdown, con su compilación a PDF. | https://github.com/1ASI0730-2620-8084-CodeCrafters/bottle-track-report |

Los repositorios del Landing Page, de los Web Services y del informe se renombraron en el Sprint 3 (antes `Landing-Page`, `Web-Services` y `Report`) para seguir una convención única en kebab-case. GitHub redirige los enlaces anteriores, por lo que las referencias históricas de los Sprints 1 y 2 conservan su validez.

**GitFlow como Workflow de control de versiones**

El equipo aplica GitFlow según el modelo descrito por Vincent Driessen. La estructura de ramas es la siguiente:

| Rama | Propósito | Origen | Destino del merge |
| :--- | :-------- | :----- | :---------------- |
| `main` | Contiene únicamente versiones publicadas y estables. Cada commit de esta rama corresponde a un release etiquetado. | — | — |
| `develop` | Rama de integración donde converge el trabajo terminado antes de conformar un release. | `main` | — |
| `feature/<nombre>` | Una rama por cada feature. Concentra el trabajo de una funcionalidad hasta que queda terminada. | `develop` | `develop` |
| `release/<versión>` | Preparación de una versión: correcciones finales y ajuste del número de versión. | `develop` | `main` y `develop` |
| `hotfix/<nombre>` | Corrección urgente sobre una versión ya publicada. | `main` | `main` y `develop` |
| `fix/<nombre>` | Corrección de un defecto detectado en `develop`, antes de un release. | `develop` | `develop` |
| `chore/<nombre>` | Tareas de mantenimiento del repositorio, como sincronizar `main` con `develop`. | `develop` | `develop` |

Las convenciones de nomenclatura de las ramas son las siguientes, empleando siempre kebab-case y el idioma inglés:

| Tipo de rama | Convención | Ejemplo |
| :----------- | :--------- | :------ |
| Feature | `feature/<nombre-de-la-funcionalidad>` | `feature/design-system` |
| Fix | `fix/<nombre-de-la-corrección>` | `fix/report-incident-diagrams` |
| Chore | `chore/<nombre-de-la-tarea>` | `chore/sync-main-into-develop` |
| Release | `release/<major>.<minor>.<patch>` | `release/1.0.0` |
| Hotfix | `hotfix/<nombre-de-la-corrección>` | `hotfix/broken-segment-link` |

La integración de una rama hacia `develop` o hacia `main` se realiza mediante un merge sin avance rápido, de modo que el commit de merge preserve en el historial la existencia de la rama y el conjunto de commits que la conformaron.

**Semantic Versioning**

Los releases se nombran siguiendo la especificación Semantic Versioning 2.0.0, con el formato `MAJOR.MINOR.PATCH`. Se incrementa el número mayor ante un cambio incompatible en la interfaz pública de los Web Services, el número menor ante la incorporación de nueva funcionalidad compatible, y el número de parche ante una corrección de defectos. Cada versión publicada en `main` recibe una etiqueta con el prefijo `v`, por ejemplo `v1.0.0`.

**Conventional Commits**

Los mensajes de commit siguen la especificación Conventional Commits, con la estructura `<type>(<scope>): <description>`. La descripción se redacta en inglés, en modo imperativo y en minúsculas.

| Tipo | Uso |
| :--- | :-- |
| `feat` | Incorporación de una nueva funcionalidad. |
| `fix` | Corrección de un defecto. |
| `docs` | Cambios en la documentación o en el informe. |
| `style` | Cambios que no afectan el comportamiento del código. |
| `refactor` | Reorganización del código sin cambio de comportamiento. |
| `test` | Incorporación o corrección de pruebas. |
| `chore` | Tareas de configuración y mantenimiento del repositorio. |

Ejemplos aplicados en el proyecto: `feat(design-system): add color, typography and spacing tokens`, `feat(landing): add home page with segment calls to action`, `docs(requirements): add user stories and product backlog`.

Adicionalmente, el equipo acordó mantener commits de alcance acotado, de manera que cada uno concentre un cambio comprensible de forma aislada y el historial permita evidenciar con claridad el aporte individual de cada integrante.

<a id="513-source-code-style-guide-and-conventions"></a>

### 5.1.3. Source Code Style Guide and Conventions.

Toda la nomenclatura de elementos del código se escribe en inglés, sin excepción, en los cuatro repositorios. Las referencias adoptadas por lenguaje son las siguientes:

| Lenguaje | Referencia adoptada |
| :------- | :------------------ |
| HTML | HTML Style Guide and Coding Conventions y Google HTML/CSS Style Guide. |
| CSS | Google HTML/CSS Style Guide. |
| JavaScript | Google JavaScript Style Guide, MDN JavaScript guidelines y W3C JavaScript Style Guide. |
| Vue | Vue Style Guide. |
| C# | C# Coding Conventions y Microsoft ASP.NET Core Coding Guidelines. |
| Gherkin | Gherkin Conventions for Readable Specifications. |

**Convenciones de nomenclatura**

| Elemento | Convención | Ejemplo |
| :------- | :--------- | :------ |
| Archivos y carpetas de HTML, CSS y assets | kebab-case en minúsculas | `terms-of-service.html`, `assets/css/tokens.css` |
| Clases CSS | kebab-case bajo la convención BEM | `.site-header__inner`, `.button--primary` |
| Variables CSS | kebab-case con doble guion inicial | `--primary-dark` |
| Variables y funciones de JavaScript | camelCase | `resolveInitialLanguage` |
| Constantes de JavaScript | SCREAMING_SNAKE_CASE | `DEFAULT_LANGUAGE` |
| Archivos de componentes de Vue | kebab-case | `vehicle-list.vue`, `driver-form-dialog.vue` |
| Clases de JavaScript | PascalCase | `TransportOperationAssembler` |
| Clases, métodos y propiedades públicas de C# | PascalCase | `TransportOperationCommandService`, `AddStop` |
| Parámetros y variables locales de C# | camelCase | `transportOperationRepository` |
| Endpoints de la API | kebab-case en plural | `/api/v1/transport-operations`, `/api/v1/incidents` |
| Tablas y columnas de base de datos | snake_case | `delivery_stops`, `reported_at` |

**Convenciones adicionales adoptadas por el equipo**

El código se escribe sin comentarios: la legibilidad se sostiene con nombres autoexplicativos y con funciones de responsabilidad única. La indentación es de cuatro espacios en HTML, CSS y JavaScript. Los valores visuales nunca se escriben de forma directa en las vistas, sino que se consumen desde los tokens del design system.

<a id="514-software-deployment-configuration"></a>

### 5.1.4. Software Deployment Configuration.

**Landing Page**

El Landing Page se publica en Netlify a partir de la rama `main` del repositorio `bottle-track-website`, mediante la integración de Netlify con GitHub. Durante el Sprint 1 se publicó en GitHub Pages; desde el Sprint 2 se utiliza Netlify, que vuelve a publicar el sitio de forma automática ante cada integración en `main`. Al tratarse de un sitio web estático sin proceso de construcción, no requiere un comando de build. Los pasos son los siguientes:

1. Integrar en `develop` las ramas de feature terminadas mediante un merge sin avance rápido.
2. Crear la rama `release/<versión>` a partir de `develop`.
3. Integrar la rama de release en `main`, etiquetar la versión con Semantic Versioning y publicar los cambios junto con la etiqueta.
4. En Netlify, importar el repositorio desde GitHub, seleccionar la rama `main`, dejar vacío el comando de construcción y publicar el directorio raíz.
5. Verificar la publicación en la URL entregada por Netlify.

**Frontend Web Application**

La aplicación web se publica en Vercel a partir de la rama `main` del repositorio `Frontend-Web-Aplication`, mediante la integración de Vercel con GitHub. Los pasos son los siguientes:

1. Importar el repositorio desde el panel de Vercel.
2. Configurar el comando de construcción y el directorio de salida que corresponden a un proyecto de Vue.
3. Registrar en el archivo `.env.production` la URL base del API, que apunta a los Web Services publicados en Railway (`https://bottle-track-web-services-production.up.railway.app/api/v1`). En el entorno de desarrollo (`.env.development`) la aplicación consume los Web Services locales en `http://localhost:5280/api/v1`.
4. Confirmar la publicación automática que Vercel ejecuta ante cada integración en `main`.

Una vez publicada la aplicación, la URL definitiva se registra en los llamados a la acción de cada segmento objetivo del Landing Page, de modo que ambos productos queden enlazados.

**Web Services**

La primera versión de los Web Services se implementó en el Sprint 3 y se publica en Railway junto con una base de datos MySQL, a partir de la rama `main` del repositorio `bottle-track-web-services`:

1. El repositorio incluye un `Dockerfile` que compila la solución y expone el servicio en el puerto 8080.
2. El archivo `appsettings.Production.json` toma la cadena de conexión de las variables de entorno `DATABASE_URL`, `DATABASE_USER`, `DATABASE_PASSWORD` y `DATABASE_SCHEMA`, de modo que ninguna credencial se guarda en el repositorio.
3. La lista de orígenes permitidos por CORS debe registrar la URL de la Web Application publicada en Vercel.
4. Las migraciones de Entity Framework Core crean las doce tablas al iniciar el servicio.

El proveedor de nube y la instancia de MySQL se seleccionarán y documentarán en el Sprint en el que se realice la publicación.


<a id="52-landing-page-services-applications-implementation"></a>

## 5.2. Landing Page, Services & Applications Implementation.

<a id="52x-sprint-n"></a>

### 5.2.1. Sprint 1

<a id="52x1-sprint-planning-n"></a>

#### 5.2.1.1. Sprint Planning 1.

| Sprint #  | Sprint 1 |
| :-------- | :------- |
| **Sprint Planning Background** | |
| Date | 2026-09-02 |
| Time | 5:00 PM |
| Location | Reunión virtual por Discord |
| Prepared By | Crispin Valdivia, Angel Gabriel |
| Attendees (to planning meeting) | Crispin Valdivia, Angel Gabriel; Cumba Rengifo, Leonardo Raul; Palacin Lazo, Gerardo Valentin; Pezo Castilla, Maria Jose; Huapaya Buitron, Ariana Alheli |
| Sprint 0 Review Summary | Es el primer Sprint del proyecto, por lo que no existe un Sprint anterior que revisar. |
| Sprint 0 Retrospective Summary | Es el primer Sprint del proyecto, por lo que no existe una retrospectiva anterior. |
| **Sprint Goal & User Stories** | |
| Sprint 1 Goal | *Nuestro enfoque está en* que los visitantes de cada segmento objetivo comprendan la propuesta de BottleTrack y encuentren su camino hacia la aplicación.<br>*Creemos que esto entrega* claridad sobre el problema que resolvemos y un punto de entrada propio a los administradores de distribuidoras y a los supervisores de flota.<br>*Esto se confirmará cuando* el Landing Page esté publicado, pueda recorrerse en inglés y en español desde escritorio y móvil, y cada segmento tenga su llamada a la acción. |
| Sprint 1 Velocity | 27 |
| Sum of Story Points | 27 |

<a id="52x2-aspect-leader-and-colaborators"></a>

#### 5.2.1.2. Aspect Leaders and Collaborators.

Durante el Sprint 1 el equipo se organizó por aspectos, de modo que cada integrante condujo el área en la que tenía mayor conocimiento y colaboró en las demás. La matriz de Liderazgo y Colaboración (LACX) refleja la asignación acordada en el Sprint Planning y es coherente con las tareas del Sprint Backlog y con el historial de commits.

| Team Member (Last Name, First Name) | GitHub Username | Requirements Specification | Needfinding & Impact Mapping | UX/UI Design | Software Architecture | Landing Page & Configuration Management |
| :---------------------------------- | :-------------- | :-----: | :-----: | :-----: | :-----: | :-----: |
| Crispin Valdivia, Angel Gabriel | FaureGalliard | C | C | C | C | L |
| Cumba Rengifo, Leonardo Raul | LeonardoC72 | L | C | C | C | C |
| Palacin Lazo, Gerardo Valentin | GeraldP03 | C | C | L | L | C |
| Pezo Castilla, Maria Jose | MariaJosePezo | C | L | C | C | C |
| Huapaya Buitron, Ariana Alheli | — | — | — | — | — | — |

<a id="52x3-sprint-backlog-n"></a>

#### 5.2.1.3. Sprint Backlog 1.

El Sprint 1 comprometió las User Stories del Landing Page y las de acceso e identidad de la Web Application, de acuerdo con el Sprint Goal. Cada User Story se descompuso en tareas de entre 4 y 8 horas. El tablero del Sprint se administró en Trello y se encuentra disponible en: https://trello.com/b/jGpO815B/bottletrack-product-backlog

| Sprint # | Sprint 1 | | | | | | |
| :------- | :------- | :- | :- | :- | :- | :- | :- |
| **User Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US01 | Conocer BottleTrack | T01 | Design system and style guide | Definir los tokens de color, tipografía y espaciado, los componentes base y la vista de style guide. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| US01 | Conocer BottleTrack | T02 | Hero and problem sections | Implementar la sección hero con la propuesta de valor y la sección del problema. | 6 | Crispin Valdivia, Angel Gabriel | Done |
| US01 | Conocer BottleTrack | T03 | English and Spanish translation | Implementar los diccionarios en_US y es_419 con detección del idioma del navegador y persistencia de la preferencia. | 6 | Crispin Valdivia, Angel Gabriel | Done |
| US02 | Conocer beneficios por segmento | T01 | Features and how it works sections | Implementar las tarjetas de capacidades y la explicación del funcionamiento del producto. | 5 | Crispin Valdivia, Angel Gabriel | Done |
| US02 | Conocer beneficios por segmento | T02 | Landing page UI design | Elaborar en Figma el wireframe y el mock-up del Landing Page. | 6 | Palacin Lazo, Gerardo Valentin | Done |
| US03 | Acceder a la aplicación | T01 | Responsive navigation and segment calls to action | Implementar la navegación adaptable y las llamadas a la acción de cada segmento hacia la Web Application. | 5 | Crispin Valdivia, Angel Gabriel | Done |
| US03 | Acceder a la aplicación | T02 | Terms of service and footer | Redactar los términos y condiciones de servicio y enlazarlos desde el pie de página. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US03 | Acceder a la aplicación | T03 | Deployment to GitHub Pages | Configurar GitHub Pages y publicar el release v0.1.0 desde la rama release/0.1.0. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US04 | Iniciar sesión | T01 | Login and profile UI design | Diseñar en Figma las vistas de inicio de sesión y de perfil. | 4 | Palacin Lazo, Gerardo Valentin | Done |
| US04 | Iniciar sesión | T02 | Sign in implementation | Implementar el formulario de inicio de sesión y el servicio de autenticación. | 8 | Crispin Valdivia, Angel Gabriel | To-do |
| US05 | Cerrar sesión | T01 | Sign out implementation | Implementar el cierre de sesión e invalidar la sesión activa. | 4 | Crispin Valdivia, Angel Gabriel | To-do |
| US06 | Consultar perfil | T01 | Profile view implementation | Implementar la vista y el servicio que muestran el perfil del usuario autenticado. | 4 | Pezo Castilla, Maria Jose | To-do |
| US07 | Gestionar usuarios | T01 | Users UI design | Diseñar en Figma el listado, el registro y la edición de usuarios. | 6 | Cumba Rengifo, Leonardo Raul | Done |
| US07 | Gestionar usuarios | T02 | Users management implementation | Implementar el registro, el listado y la edición de usuarios. | 8 | Cumba Rengifo, Leonardo Raul | To-do |
| US08 | Asignar rol a usuario | T01 | Role assignment implementation | Implementar la asignación del rol de administrador o supervisor. | 5 | Palacin Lazo, Gerardo Valentin | To-do |
| US09 | Gestionar información de empresa | T01 | Company settings UI design | Diseñar en Figma la vista de configuración de la empresa. | 4 | Pezo Castilla, Maria Jose | Done |
| US09 | Gestionar información de empresa | T02 | Company settings implementation | Implementar el formulario y el servicio para actualizar los datos de la empresa. | 5 | Pezo Castilla, Maria Jose | To-do |

<a id="52x4-development-evidence-for-sprint-review"></a>

#### 5.2.1.4. Development Evidence for Sprint Review.

En el Sprint 1 se implementó el Landing Page en el repositorio https://github.com/1ASI0730-2620-8084-CodeCrafters/Landing-Page siguiendo GitFlow: cada funcionalidad se desarrolló en una rama `feature/*` creada desde `develop`, se integró con merges `--no-ff` y se publicó desde la rama `release/0.1.0` con el tag `v0.1.0`. La siguiente tabla presenta los commits de la iteración.

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
| :--------- | :----- | :-------- | :------------- | :------------------ | :------------------ |
| Landing-Page | main | 76546df | chore: initialize landing page repository | — | 2026-09-01 |
| Landing-Page | feature/design-system | 387d995 | feat(design-system): add color, typography and spacing tokens | — | 2026-09-01 |
| Landing-Page | feature/design-system | 347abc9 | feat(design-system): add reset, element defaults and layout utilities | — | 2026-09-01 |
| Landing-Page | feature/design-system | bd041ec | feat(design-system): add button, card, chip and input components | — | 2026-09-01 |
| Landing-Page | feature/design-system | e53ea73 | feat(style-guide): add style guide page styles | — | 2026-09-01 |
| Landing-Page | feature/design-system | 971d12d | feat(style-guide): add copy to clipboard for color tokens | — | 2026-09-01 |
| Landing-Page | feature/design-system | db11e4f | docs(design-system): add living style guide page | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 072a531 | feat(layout): add site header, navigation and footer styles | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 0aa1a2d | feat(landing): add hero, features and segments section styles | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 520176d | feat(i18n): add english and spanish dictionaries | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 0e81a16 | feat(i18n): add language switching with browser detection and persistence | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 6b31440 | feat(landing): add responsive navigation toggle | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 4bdb386 | feat(landing): add home page with segment calls to action | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 1a38b64 | feat(legal): add terms and conditions of service page | — | 2026-09-01 |
| Landing-Page | feature/landing-page | 91b5085 | docs: describe landing page structure and conventions | — | 2026-09-01 |
| Landing-Page | feature/about-the-team-video | a0da10b | refactor(landing): replace team member cards with about the team video | — | 2026-09-03 |
| Landing-Page | feature/about-the-team-video | 7b3662f | docs: set github pages as the deployment target | — | 2026-09-03 |

<a id="52x5-execution-evidence-for-sprint-review"></a>

#### 5.2.1.5. Execution Evidence for Sprint Review.

Al cierre del Sprint 1 el Landing Page se encuentra publicado en https://1asi0730-2620-8084-codecrafters.github.io/Landing-Page/. La versión implementa la sección hero con la propuesta de valor, la sección del problema, las capacidades del producto, el funcionamiento en tres pasos, los segmentos objetivo con su llamada a la acción, el video About the Team y el pie de página con los términos y condiciones. El contenido se presenta en inglés por defecto y en español latinoamericano mediante el selector de idioma, y la disposición se adapta a escritorio y a móvil.

**Vista de escritorio**

<img src="assets/chapter5/landing-desktop-1.png" alt="Landing Page de BottleTrack en escritorio, parte 1 de 3" width="800">

<img src="assets/chapter5/landing-desktop-2.png" alt="Landing Page de BottleTrack en escritorio, parte 2 de 3" width="800">

<img src="assets/chapter5/landing-desktop-3.png" alt="Landing Page de BottleTrack en escritorio, parte 3 de 3" width="800">

**Vista móvil**

<table>
<tr>
<td><img src="assets/chapter5/landing-mobile-1.png" alt="Landing Page de BottleTrack en móvil, parte 1 de 3" width="220"></td>
<td><img src="assets/chapter5/landing-mobile-2.png" alt="Landing Page de BottleTrack en móvil, parte 2 de 3" width="220"></td>
<td><img src="assets/chapter5/landing-mobile-3.png" alt="Landing Page de BottleTrack en móvil, parte 3 de 3" width="220"></td>
</tr>
</table>

**Términos y condiciones de servicio**

<img src="assets/chapter5/landing-terms-1.png" alt="Vista de términos y condiciones de servicio, parte 1 de 2" width="800">

<img src="assets/chapter5/landing-terms-2.png" alt="Vista de términos y condiciones de servicio, parte 2 de 2" width="800">

**Style guide**

<img src="assets/chapter5/landing-style-guide-1.png" alt="Vista de style guide del design system de BottleTrack, parte 1 de 2" width="800">

<img src="assets/chapter5/landing-style-guide-2.png" alt="Vista de style guide del design system de BottleTrack, parte 2 de 2" width="800">

<a id="52x6-services-documentation-evidence-for-sprint-review"></a>

#### 5.2.1.6. Services Documentation Evidence for Sprint Review.

El alcance del Sprint 1 corresponde al Landing Page, que es un sitio estático y no expone endpoints. La documentación de los servicios con OpenAPI se incorporó en el Sprint 3 (sección 5.2.3.6), en el que se implementa la primera versión del Backend API, de acuerdo con la Technical Story TS13.

<a id="52x7-software-deployment-evidence-for-sprint-review"></a>

#### 5.2.1.7. Software Deployment Evidence for Sprint Review.

El Landing Page se desplegó en GitHub Pages desde el repositorio de la organización. El proceso fue el siguiente:

1. Se integraron las ramas `feature/design-system`, `feature/landing-page` y `feature/about-the-team-video` en `develop` mediante merges `--no-ff`.
2. Se creó la rama `release/0.1.0` desde `develop`, se integró en `main` y se etiquetó como `v0.1.0`, siguiendo Semantic Versioning.
3. En *Settings → Pages* del repositorio se configuró la publicación desde la rama `main`, carpeta raíz.
4. GitHub Actions ejecutó el flujo *pages build and deployment* y publicó el sitio.
5. Se verificó el acceso a la URL pública, la navegación entre secciones, el cambio de idioma y la visualización en escritorio y en móvil.

| Producto | Repositorio | Tecnología | Plataforma | Versión | URL |
| :------- | :---------- | :--------- | :--------- | :------ | :-- |
| Landing Page | Landing-Page | HTML5, CSS3, JavaScript | GitHub Pages | v0.1.0 | https://1asi0730-2620-8084-codecrafters.github.io/Landing-Page/ |

**Organización de GitHub con los repositorios de los productos**

<img src="assets/chapter5/github-organization.png" alt="Organización de GitHub 1ASI0730-2620-8084-CodeCrafters con sus cuatro repositorios" width="800">

**Ramas del repositorio Landing-Page según GitFlow**

<img src="assets/chapter5/landing-branches.png" alt="Ramas main, develop, release y feature del repositorio Landing-Page" width="800">

**Tag del release v0.1.0**

<img src="assets/chapter5/landing-tags.png" alt="Tag v0.1.0 del repositorio Landing-Page" width="800">

<a id="52x8-team-colaboration-insights-during-sprint"></a>

#### 5.2.1.8. Team Collaboration Insights during Sprint.

Durante el Sprint 1 el trabajo se distribuyó entre dos repositorios. En el repositorio del informe participaron cuatro integrantes, cada uno a cargo de los capítulos de su aspecto: Leonardo Cumba en los capítulos I y III, Maria Jose Pezo en el Needfinding, el Impact Mapping y el EventStorming, Gerardo Palacin en el diseño de las interfaces y en los diagramas C4, y Angel Crispin en las Style Guidelines, la arquitectura de información y la configuración del software. El repositorio del Landing Page concentró sus commits en Angel Crispin, responsable de su implementación, mientras que el diseño de la interfaz del Landing Page lo elaboró Gerardo Palacin en Figma.

La siguiente tabla resume los commits de cada integrante en el Sprint 1, sin considerar los commits de integración de ramas:

| Integrante | Report | Landing-Page |
| :--------- | :----: | :----------: |
| Crispin Valdivia, Angel Gabriel | 11 | 17 |
| Cumba Rengifo, Leonardo Raul | 20 | 0 |
| Pezo Castilla, Maria Jose | 10 | 0 |
| Palacin Lazo, Gerardo Valentin | 7 | 0 |
| Huapaya Buitron, Ariana Alheli | 0 | 0 |

**Analíticos de contribución del repositorio Landing-Page**

<img src="assets/chapter5/insights-landing-contributors.png" alt="GitHub Insights, contribuidores del repositorio Landing-Page" width="800">

**Grafo de ramas del repositorio Landing-Page.** Se aprecian las ramas `feature/design-system`, `feature/landing-page` y `feature/about-the-team-video` integradas en `develop` mediante merges `--no-ff`, y la publicación en `main`.

<img src="assets/chapter5/insights-landing-network.png" alt="Grafo de red de ramas del repositorio Landing-Page" width="800">

Para el Sprint 2 el equipo acordó que todos los integrantes participen con commits en el Landing Page y en la Frontend Web Application, cada uno en la rama de su bounded context.

<a id="522-sprint-2"></a>

### 5.2.2. Sprint 2

<a id="5221-sprint-planning-2"></a>

#### 5.2.2.1. Sprint Planning 2.

| Sprint #  | Sprint 2 |
| :-------- | :------- |
| **Sprint Planning Background** | |
| Date | 2026-09-28 |
| Time | 9:00 PM |
| Location | Reunión virtual por Discord |
| Prepared By | Crispin Valdivia, Angel Gabriel |
| Attendees (to planning meeting) | Crispin Valdivia, Angel Gabriel; Cumba Rengifo, Leonardo Raul; Palacin Lazo, Gerardo Valentin; Pezo Castilla, Maria Jose; Huapaya Buitron, Ariana Alheli |
| Sprint 1 Review Summary | En el Sprint 1 se publicó el Landing Page v0.1.0 en GitHub Pages y se completaron las User Stories US01, US02 y US03. La revisión de AV1 señaló que el Landing Page no mostraba medios de contacto, redes sociales ni capturas de la aplicación, que el informe conservaba textos pendientes y que el segmento de conductores no correspondía a un usuario de la aplicación. Las historias de acceso US04 a US09 quedaron pendientes de implementación. |
| Sprint 1 Retrospective Summary | El equipo valoró el design system y el uso de GitFlow desde el primer día. Como aspectos a mejorar identificó que el código se concentró en un solo integrante y que se entregaron secciones con textos pendientes. Se acordó que cada integrante lidere un bounded context de la Frontend Web Application en su propia rama, que ninguna sección se entregue con contenido pendiente y que las correcciones de AV1 se resuelvan dentro del Sprint 2. |
| **Sprint Goal & User Stories** | |
| Sprint 2 Goal | *Nuestro enfoque está en* que el administrador gestione los usuarios y los recursos de su empresa; que el supervisor de flota planifique una operación de transporte con sus recursos, siga sus entregas y la carga con lecturas IoT, y registre las incidencias con evidencia; y que el responsable de la bodega consulte el estado de su pedido, todo desde la Frontend Web Application.<br>*Creemos que esto entrega* orden y control sobre su empresa al administrador de la distribuidora, visibilidad del estado de cada entrega y de la carga al supervisor de flota, y certeza sobre la llegada de su pedido al responsable de la bodega.<br>*Esto se confirmará cuando* el administrador registre un vehículo y un conductor; el supervisor cree y ejecute una operación y atienda una alerta de la carga registrando una incidencia; y la bodega consulte su pedido. Los tres flujos deben completarse sin errores en la aplicación publicada en Vercel, a la que cada segmento llega desde la llamada a la acción de su Landing Page. |
| Sprint 2 Velocity | 143 |
| Sum of Story Points | 143 |

<a id="5222-aspect-leaders-and-collaborators"></a>

#### 5.2.2.2. Aspect Leaders and Collaborators.

En el Sprint 2 los aspectos corresponden a los bounded contexts de la Frontend Web Application, a la configuración base del proyecto y al Landing Page. Cada integrante lidera el bounded context que implementó en su rama de feature y colabora en los contextos con los que el suyo se integra. Angel Crispin colabora en todos los contextos porque revisó e integró cada rama en `develop` y mantuvo el Shared Kernel del que todos dependen.

| Team Member (Last Name, First Name) | GitHub Username | Project Setup & Configuration Management | Identity and Access Management | Fleet Management | Operations and Routes | IoT Monitoring | Incident Management | Landing Page |
| :---------------------------------- | :-------------- | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| Crispin Valdivia, Angel Gabriel | FaureGalliard | L | L | C | C | C | C | L |
| Cumba Rengifo, Leonardo Raul | LeonardoC72 | C | C | C | L | C | C | C |
| Palacin Lazo, Gerardo Valentin | GeraldP03 | C | C | C | C | L | C | C |
| Pezo Castilla, Maria Jose | MariaJosePezo | C | C | C | C | C | L | C |
| Huapaya Buitron, Ariana Alheli | arianahuapayabui | C | C | L | C | C | C | C |

<a id="5223-sprint-backlog-2"></a>

#### 5.2.2.3. Sprint Backlog 2.

El Sprint 2 comprometió las historias de acceso que quedaron pendientes en el Sprint 1, todas las User Stories de la Frontend Web Application que pueden resolverse con el fake API y las historias del Landing Page por segmento y de contacto. Las Technical Stories del RESTful API se planifican para el Sprint 3, junto con la primera versión de los Web Services. Las 51 tareas suman 216 horas y se gestionan en el tablero del proyecto: https://trello.com/b/jGpO815B/bottletrack-product-backlog

**Tablero del proyecto en Trello.** El Product Backlog contiene las User Stories y Technical Stories pendientes, y las listas de cada Sprint registran el avance de sus historias.

<img src="assets/chapter5/sprint2/trello-board.png" alt="Tablero de Trello de BottleTrack con el Product Backlog y las listas del Sprint 1" width="800">

**Historias del Sprint 2 en la lista Sprint 2 - Done.** Cada tarjeta registra en su descripción las tareas, las horas estimadas y el responsable.

<img src="assets/chapter5/sprint2/trello-sprint-2.png" alt="Listas del Sprint 2 en Trello con las historias terminadas" width="800">

| Sprint # | Sprint 2 | | | | | | |
| :------- | :------- | :- | :- | :- | :- | :- | :- |
| **User Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US39 | Conocer beneficios para distribuidoras | T01 | Distributor segment call to action | Enlazar la llamada a la acción del segmento de distribuidoras con la vista `/analytics` de la Web Application. | 2 | Crispin Valdivia, Angel Gabriel | Done |
| US39 | Conocer beneficios para distribuidoras | T02 | Application screenshots | Incorporar en la sección del producto las capturas del dashboard, de las operaciones y de las incidencias. | 4 | Palacin Lazo, Gerardo Valentin | Done |
| US40 | Conocer beneficios para supervisores | T01 | Supervisor segment call to action | Enlazar la llamada a la acción del segmento de supervisores con la vista `/monitoring` de la Web Application. | 2 | Crispin Valdivia, Angel Gabriel | Done |
| US41 | Conocer beneficios para bodegas | T01 | Delivery point segment | Reemplazar el segmento de conductores por el de bodegas y minimarkets, con su llamada a la acción hacia `/tracking`. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US42 | Contactar a CodeCrafters | T01 | Contact form and social links | Implementar el formulario de contacto, los enlaces a redes sociales en el footer y el favicon de la marca. | 5 | Crispin Valdivia, Angel Gabriel | Done |
| US04 | Iniciar sesión | T01 | Project setup | Configurar Vite, PrimeVue, Pinia, Vue Router, vue-i18n, axios, los design tokens y el fake API con json-server. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| US04 | Iniciar sesión | T02 | Sign in implementation | Implementar el formulario de inicio de sesión, el store de IAM y el guard de autenticación por rol. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| US05 | Cerrar sesión | T01 | Sign out implementation | Implementar el cierre de sesión desde la barra lateral e invalidar la sesión activa. | 2 | Crispin Valdivia, Angel Gabriel | Done |
| US06 | Consultar perfil | T01 | Profile view implementation | Implementar la vista del perfil del usuario autenticado. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US07 | Gestionar usuarios | T01 | Users management implementation | Implementar el listado, el registro y la edición de usuarios de la empresa. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| US08 | Asignar rol a usuario | T01 | Role assignment implementation | Implementar la selección del rol en el formulario de usuario y la navegación filtrada por rol. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US09 | Gestionar información de empresa | T01 | Company settings implementation | Implementar la vista y el servicio para actualizar los datos de la empresa. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| US10 | Registrar vehículo | T01 | Fleet domain and gateway | Implementar las entidades de vehículo y conductor, sus assemblers y el gateway del fake API. | 6 | Huapaya Buitron, Ariana Alheli | Done |
| US10 | Registrar vehículo | T02 | Vehicle registration | Implementar el formulario de registro de vehículos. | 4 | Huapaya Buitron, Ariana Alheli | Done |
| US11 | Actualizar vehículo | T01 | Vehicle edition | Implementar la edición de vehículos desde el listado. | 3 | Huapaya Buitron, Ariana Alheli | Done |
| US12 | Consultar vehículos disponibles | T01 | Vehicle list view | Implementar el listado de vehículos con su estado de disponibilidad. | 4 | Huapaya Buitron, Ariana Alheli | Done |
| US13 | Registrar conductor | T01 | Driver registration | Implementar el formulario de registro de conductores. | 4 | Huapaya Buitron, Ariana Alheli | Done |
| US14 | Actualizar conductor | T01 | Driver edition | Implementar la edición de conductores desde el listado. | 3 | Huapaya Buitron, Ariana Alheli | Done |
| US15 | Consultar conductores disponibles | T01 | Driver list view | Implementar el listado de conductores y registrar las rutas, traducciones y datos de la flota. | 4 | Huapaya Buitron, Ariana Alheli | Done |
| US16 | Crear operación de transporte | T01 | Operations domain and gateway | Implementar las entidades de operación y de orden de entrega, sus assemblers y los gateways del fake API. | 8 | Cumba Rengifo, Leonardo Raul | Done |
| US16 | Crear operación de transporte | T02 | Create operation dialog | Implementar el diálogo de creación de operaciones y el store de operaciones. | 6 | Cumba Rengifo, Leonardo Raul | Done |
| US17 | Asignar vehículo a operación | T01 | Vehicle assignment | Implementar la asignación de un vehículo disponible en la sección de recursos de la operación. | 3 | Cumba Rengifo, Leonardo Raul | Done |
| US18 | Asignar conductor a operación | T01 | Driver assignment | Implementar la asignación de un conductor disponible en la sección de recursos de la operación. | 3 | Cumba Rengifo, Leonardo Raul | Done |
| US19 | Consultar operaciones | T01 | Operation list view | Implementar el listado de operaciones con su estado y sus datos principales. | 5 | Cumba Rengifo, Leonardo Raul | Done |
| US20 | Cancelar operación | T01 | Cancel operation dialog | Implementar la cancelación de operaciones no iniciadas con el motivo obligatorio. | 3 | Cumba Rengifo, Leonardo Raul | Done |
| US21 | Iniciar operación | T01 | Start operation | Implementar el inicio de la operación cuando tiene recursos y puntos de entrega. | 2 | Cumba Rengifo, Leonardo Raul | Done |
| US22 | Finalizar operación | T01 | Finish operation | Implementar el cierre de la operación cuando todas las entregas tienen resultado. | 3 | Cumba Rengifo, Leonardo Raul | Done |
| US23 | Registrar punto de entrega | T01 | Add stop dialog | Implementar el diálogo para agregar puntos de entrega con la cantidad planificada. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US24 | Organizar puntos de entrega | T01 | Stop ordering | Implementar el cambio de orden de los puntos de entrega dentro de la ruta. | 3 | Cumba Rengifo, Leonardo Raul | Done |
| US25 | Consultar ruta de una operación | T01 | Operation route component | Implementar la tabla de la ruta con los puntos de entrega, su estado y sus acciones. | 5 | Cumba Rengifo, Leonardo Raul | Done |
| US26 | Consultar detalle de entrega | T01 | Delivery order card | Implementar la tarjeta con el detalle de cada orden de entrega. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US27 | Actualizar estado de entrega | T01 | Delivery result dialog | Implementar el registro del resultado de cada entrega. | 5 | Cumba Rengifo, Leonardo Raul | Done |
| US28 | Registrar entrega parcial | T01 | Partial delivery | Validar la cantidad entregada y el motivo en las entregas parciales. | 2 | Cumba Rengifo, Leonardo Raul | Done |
| US29 | Registrar entrega no realizada | T01 | Failed delivery | Registrar las entregas no realizadas con su motivo. | 2 | Cumba Rengifo, Leonardo Raul | Done |
| US34 | Consultar progreso de operación | T01 | Operation progress component | Implementar el avance de la operación con el conteo de entregas por estado. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US36 | Consultar historial de operaciones | T01 | Operation history view | Implementar el historial de operaciones finalizadas y canceladas. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US37 | Consultar detalle histórico | T01 | Historical detail | Enlazar cada operación del historial con su vista de detalle. | 2 | Cumba Rengifo, Leonardo Raul | Done |
| US38 | Consultar ubicación de entrega | T01 | Delivery location link | Mostrar la dirección del punto de entrega con el enlace a su ubicación en el mapa. | 2 | Cumba Rengifo, Leonardo Raul | Done |
| US46 | Consultar estado de mi pedido | T01 | Delivery order tracking view | Implementar la vista de pedidos en camino y recibidos para el responsable de la bodega. | 5 | Cumba Rengifo, Leonardo Raul | Done |
| US47 | Reportar problema de recepción | T01 | Reception problem dialog | Implementar el reporte de faltantes o productos dañados al recibir el pedido. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US47 | Reportar problema de recepción | T02 | Operations translations and data | Registrar las rutas, las traducciones y los datos del fake API de las operaciones. | 4 | Cumba Rengifo, Leonardo Raul | Done |
| US43 | Consultar lecturas IoT de una operación | T01 | IoT domain and gateway | Implementar la entidad de dispositivo IoT, sus assemblers y el gateway de lecturas y alertas. | 6 | Palacin Lazo, Gerardo Valentin | Done |
| US43 | Consultar lecturas IoT de una operación | T02 | Monitoring dashboard | Implementar el dashboard de monitoreo con la tarjeta de cada operación en curso. | 6 | Palacin Lazo, Gerardo Valentin | Done |
| US44 | Recibir alerta de carga en riesgo | T01 | Alert list | Implementar la lista de alertas pendientes con el registro de incidencia y la revisión. | 4 | Palacin Lazo, Gerardo Valentin | Done |
| US45 | Configurar rango seguro | T01 | Device settings view | Implementar la configuración de dispositivos con el rango seguro de temperatura y el umbral de golpes. | 5 | Palacin Lazo, Gerardo Valentin | Done |
| US30 | Registrar incidencia | T01 | Incidents domain and gateway | Implementar las entidades de incidencia y evidencia, su assembler y el gateway del fake API. | 6 | Pezo Castilla, Maria Jose | Done |
| US30 | Registrar incidencia | T02 | Report incident dialog | Implementar el diálogo de registro de incidencias y el store de incidencias. | 5 | Pezo Castilla, Maria Jose | Done |
| US31 | Adjuntar evidencia de incidencia | T01 | Attach evidence dialog | Implementar la carga de evidencias asociadas a una incidencia. | 5 | Pezo Castilla, Maria Jose | Done |
| US32 | Consultar incidencias | T01 | Incident list view | Implementar el listado de incidencias con su tipo, operación y estado. | 4 | Pezo Castilla, Maria Jose | Done |
| US33 | Actualizar estado de incidencia | T01 | Advance incident dialog | Implementar el avance de estado de la incidencia hasta su cierre. | 3 | Pezo Castilla, Maria Jose | Done |
| US35 | Consultar dashboard | T01 | Analytics dashboard | Implementar el dashboard con las operaciones del mes, las entregas completadas, las incidencias abiertas y la merma. | 6 | Pezo Castilla, Maria Jose | Done |

<a id="5224-development-evidence-for-sprint-review"></a>

#### 5.2.2.4. Development Evidence for Sprint Review.

En el Sprint 2 se implementó la primera versión de la Frontend Web Application en el repositorio https://github.com/1ASI0730-2620-8084-CodeCrafters/Frontend-Web-Aplication, con Vue 3, PrimeVue, Pinia, Vue Router, vue-i18n y axios, en JavaScript. El código se organiza por bounded context, y cada uno se divide en las capas `domain`, `application`, `infrastructure` y `presentation`. Angel Crispin preparó la base del proyecto en `feature/project-setup`, y luego cada integrante desarrolló su bounded context en una rama de feature propia, integrada en `develop` mediante un merge `--no-ff`. La versión se publicó desde `release/0.1.0` con la etiqueta `v0.1.0`.

En el repositorio del Landing Page se aplicaron las correcciones de AV1 y se publicaron las versiones `v0.2.0`, `v0.2.1` y `v1.0.0`. En la rama `develop` se revirtió un commit que eliminaba la sección del producto, porque Gerardo Palacin la había actualizado en paralelo con las capturas de la aplicación.

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
| :--------- | :----- | :-------- | :------------- | :------------------ | :------------------ |
| Frontend-Web-Aplication | main | 7e9d951 | chore: initialize vue project with vite | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | da71179 | feat: add design tokens and primevue theme preset | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | 15fdbe3 | style: add global layout styles | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | 96d0a01 | feat: configure i18n, pinia and router | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | 3f87eb6 | feat: add shared http client base and fake api setup | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | 6e6a35a | feat: add shared presentation components and views | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/project-setup | 6ad9864 | docs: add readme with architecture and team ownership | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/identity-access-management | 7d826b2 | feat(iam): add user and organization domain model with api gateway | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/identity-access-management | 932a0b6 | feat(iam): add iam store with session handling | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/identity-access-management | 0d4056f | feat(iam): add sign-in view | — | 2026-09-28 |
| Frontend-Web-Aplication | feature/identity-access-management | b4a580a | feat(iam): add application shell with authentication section | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/identity-access-management | cf99561 | feat(iam): add user management view | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/identity-access-management | 1dc83df | feat(iam): add profile and company settings views | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/identity-access-management | 2da7ae9 | feat(iam): register iam routes, guard and translations | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/identity-access-management | 712f660 | chore(iam): add users and organizations to fake api | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/operations-and-routes | d32c5cc | feat(operations): add transport operation and delivery order domain model | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/fleet-management | ecf11f6 | feat(fleet): add vehicle and driver domain model with api gateway | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/operations-and-routes | f236e17 | feat(operations): add operations api gateways and assemblers | — | 2026-09-29 |
| Frontend-Web-Aplication | feature/fleet-management | a63f5bd | feat(fleet): add fleet store and vehicle management view | — | 2026-09-30 |
| Frontend-Web-Aplication | feature/operations-and-routes | 8a47738 | feat(operations): add operations and transport operations stores | — | 2026-09-30 |
| Frontend-Web-Aplication | feature/iot-monitoring | 5a8323a | feat(monitoring): add iot device domain model with api gateway | — | 2026-09-30 |
| Frontend-Web-Aplication | feature/operations-and-routes | 7476ac7 | feat(operations): add operation list with create dialog | — | 2026-09-30 |
| Frontend-Web-Aplication | feature/fleet-management | 60490b9 | feat(fleet): add driver management view | — | 2026-09-30 |
| Frontend-Web-Aplication | feature/fleet-management | 263aeec | feat(fleet): register fleet routes, translations and fake api data | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/operations-and-routes | b4a7813 | feat(operations): add operation route and progress components | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/incident-management | 8f0da71 | feat(incidents): add incident and evidence domain model with api gateway | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/iot-monitoring | a35030a | feat(monitoring): add monitoring store and device settings with safe ranges | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/operations-and-routes | 8b7ac23 | feat(operations): add resource, stop and cancel dialogs | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/incident-management | deed4a1 | feat(incidents): add incidents store with report and advance dialogs | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/operations-and-routes | 5761bfa | feat(operations): add operation detail and history views | — | 2026-10-01 |
| Frontend-Web-Aplication | feature/iot-monitoring | 9d2d126 | feat(monitoring): add alert list and monitored operation card | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/operations-and-routes | 7554002 | feat(operations): add delivery order card and result dialog | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/incident-management | 85bc163 | feat(incidents): add incident list with evidence attachment | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/operations-and-routes | 567e394 | feat(operations): add delivery order tracking for delivery point owners | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/iot-monitoring | dd523ff | feat(monitoring): add monitoring dashboard and register routes | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/operations-and-routes | cc0a4c2 | feat(operations): register operations routes and english translations | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/operations-and-routes | 9213feb | feat(operations): add spanish translations | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/operations-and-routes | 30b4d0d | chore(operations): add delivery points, operations and stops to fake api | — | 2026-10-02 |
| Frontend-Web-Aplication | feature/iot-monitoring | f4c3635 | chore(monitoring): add iot devices, sensor readings and alerts to fake api | — | 2026-10-03 |
| Frontend-Web-Aplication | feature/incident-management | 6365298 | feat(incidents): add analytics dashboard | — | 2026-10-03 |
| Frontend-Web-Aplication | feature/incident-management | a51a526 | feat(incidents): register incidents routes, translations and fake api data | — | 2026-10-03 |
| Frontend-Web-Aplication | release/0.1.0 | 36f92e5 | chore(release): bump version to 0.1.0 | — | 2026-10-04 |
| Frontend-Web-Aplication | feature/beeceptor-snapshot-api | 8886464 | feat(shared): add snapshot adapter to serve the api from a single download | — | 2026-10-05 |
| Frontend-Web-Aplication | feature/beeceptor-snapshot-api | 94e4e9c | feat(shared): use the beeceptor snapshot in production builds | — | 2026-10-05 |
| Frontend-Web-Aplication | release/0.2.0 | ac4cf8c | chore(release): bump version to 0.2.0 | — | 2026-10-05 |
| Frontend-Web-Aplication | release/1.0.0 | 9f7e7e0 | chore(release): bump version to 1.0.0 | — | 2026-10-05 |
| Landing-Page | feature/product-screenshots | 6239460 | feat(landing): show application screenshots in product section. | — | 2026-10-03 |
| Landing-Page | feature/remove-team-video-placeholder | 4a9b9d4 | refactor(landing): remove about the team video placeholder | — | 2026-10-04 |
| Landing-Page | feature/remove-team-video-placeholder | 2cb5051 | refactor(landing): remove about the product video placeholder | — | 2026-10-04 |
| Landing-Page | develop | 1b40c6d | Revert "refactor(landing): remove about the product video placeholder" | — | 2026-10-04 |
| Landing-Page | feature/product-screenshots-copy | 9555745 | refactor(landing): describe the product section as application screenshots | — | 2026-10-04 |
| Landing-Page | feature/delivery-point-segment | 5fb86e2 | feat(landing): replace driver segment with delivery points and link ctas to the web app | — | 2026-10-04 |
| Landing-Page | feature/contact-and-social | c385ba0 | feat(landing): add contact form and social media links | — | 2026-10-04 |
| Landing-Page | feature/favicon | 6bd6720 | feat(landing): add brand favicon to every page | — | 2026-10-04 |
| Landing-Page | release/0.2.0 | 9fd01d0 | docs(release): document web application links for 0.2.0 | — | 2026-10-04 |
| Landing-Page | feature/netlify-deployment | f89ea12 | docs: set netlify as the deployment target | — | 2026-10-05 |
| Landing-Page | release/1.0.0 | 510c71d | docs(release): document version 1.0.0 | — | 2026-10-05 |

<a id="5225-execution-evidence-for-sprint-review"></a>

#### 5.2.2.5. Execution Evidence for Sprint Review.

Al cierre del Sprint 2 la Frontend Web Application v1.0.0 se encuentra publicada en https://frontend-web-aplication.vercel.app. La aplicación ofrece una experiencia distinta para cada rol: el administrador gestiona los usuarios, la empresa, la flota y los dispositivos IoT; el supervisor de flota planifica y ejecuta las operaciones, monitorea la carga y registra las incidencias; y el responsable de la bodega sigue sus pedidos y reporta los problemas de recepción. Las vistas que siguen se capturaron con los datos del fake API y el idioma español; la aplicación cambia a inglés desde el selector de idioma.

El recorrido de la aplicación con los tres roles se muestra en el video de exposición de TB1, publicado en Microsoft Stream: https://upcedupe-my.sharepoint.com/:v:/g/personal/u20221g181_upc_edu_pe/IQB1u3FFP1TITYZ6Tj6d4ynQAcF7YM7w-LCNJYLUWoZkpE0?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=8x6kZa

**Inicio de sesión**

<img src="assets/chapter5/sprint2/app-sign-in.png" alt="Vista de inicio de sesión de BottleTrack" width="800">

**Inicio del supervisor de flota**

<img src="assets/chapter5/sprint2/app-home.png" alt="Vista de inicio con la navegación del supervisor de flota" width="800">

**Listado de operaciones**

<img src="assets/chapter5/sprint2/app-operations.png" alt="Listado de operaciones de transporte" width="800">

**Detalle de una operación en curso**

<img src="assets/chapter5/sprint2/app-operation-detail.png" alt="Detalle de la operación OP-004 con recursos, avance y ruta" width="800">

**Historial de operaciones**

<img src="assets/chapter5/sprint2/app-history.png" alt="Historial de operaciones finalizadas y canceladas" width="800">

**Monitoreo IoT**

<img src="assets/chapter5/sprint2/app-monitoring.png" alt="Dashboard de monitoreo con una alerta de golpe y las lecturas del dispositivo" width="800">

**Incidencias**

<img src="assets/chapter5/sprint2/app-incidents.png" alt="Listado de incidencias con su estado" width="800">

**Seguimiento de pedidos de la bodega**

<img src="assets/chapter5/sprint2/app-tracking.png" alt="Vista Mis pedidos del responsable de la bodega" width="800">

**Dashboard de indicadores**

<img src="assets/chapter5/sprint2/app-analytics.png" alt="Dashboard con las operaciones del mes, las entregas completadas, las incidencias abiertas y la merma" width="800">

**Vehículos**

<img src="assets/chapter5/sprint2/app-vehicles.png" alt="Listado de vehículos de la flota" width="800">

**Conductores**

<img src="assets/chapter5/sprint2/app-drivers.png" alt="Listado de conductores" width="800">

**Dispositivos IoT**

<img src="assets/chapter5/sprint2/app-devices.png" alt="Configuración de los dispositivos IoT con su rango seguro" width="800">

**Usuarios**

<img src="assets/chapter5/sprint2/app-users.png" alt="Gestión de usuarios de la empresa" width="800">

**Empresa**

<img src="assets/chapter5/sprint2/app-company.png" alt="Configuración de los datos de la empresa" width="800">

**Perfil**

<img src="assets/chapter5/sprint2/app-profile.png" alt="Perfil del usuario autenticado" width="800">

**Vista móvil**

<table>
<tr>
<td><img src="assets/chapter5/sprint2/app-mobile-sign-in.png" alt="Inicio de sesión en móvil" width="220"></td>
<td><img src="assets/chapter5/sprint2/app-mobile-operations.png" alt="Listado de operaciones en móvil" width="220"></td>
<td><img src="assets/chapter5/sprint2/app-mobile-monitoring.png" alt="Monitoreo IoT en móvil" width="220"></td>
</tr>
</table>

**Landing Page v1.0.0**

El Landing Page incorpora las correcciones de AV1: el segmento de bodegas y minimarkets reemplaza al de conductores, las tres llamadas a la acción llevan a la vista correspondiente de la Web Application, la sección del producto muestra capturas de la aplicación, y se agregaron la sección de contacto, los enlaces a redes sociales y el favicon.

<img src="assets/chapter5/sprint2/landing-v2-segments.png" alt="Segmentos con sus llamadas a la acción hacia la Web Application" width="800">

<img src="assets/chapter5/sprint2/landing-v2-product.png" alt="Sección del producto con capturas de la aplicación" width="800">

<img src="assets/chapter5/sprint2/landing-v2-contact.png" alt="Sección de contacto" width="800">

<img src="assets/chapter5/sprint2/landing-v2-footer.png" alt="Footer con los enlaces a redes sociales y a los términos del servicio" width="800">

<table>
<tr>
<td><img src="assets/chapter5/sprint2/landing-v2-mobile-contact.png" alt="Sección de contacto del Landing Page en móvil" width="220"></td>
</tr>
</table>

<a id="5226-services-documentation-evidence-for-sprint-review"></a>

#### 5.2.2.6. Services Documentation Evidence for Sprint Review.

El Sprint 2 no incluye los Web Services, que se implementan en el Sprint 3 con su documentación en OpenAPI. Mientras tanto, la Frontend Web Application consume un fake API construido con json-server a partir del archivo `server/db.json` del repositorio. Las rutas se publican bajo el prefijo `/api/v1` y cada una se configura en el archivo de entorno con una variable `VITE_<RECURSO>_ENDPOINT_PATH`, de modo que el cambio al RESTful API definitivo solo requiera actualizar la URL base.

En producción el fake API se publica en Beeceptor, en https://bottle-track.free.beeceptor.com/api/v1. Como el plan gratuito de Beeceptor admite pocas solicitudes por día, el endpoint expone una sola regla, `GET /api/v1/db`, que entrega el conjunto completo de datos. La aplicación lo descarga una vez por pestaña del navegador y el adaptador `snapshot.adapter.js` de la capa de infraestructura compartida responde las demás solicitudes con las mismas reglas de json-server, sin modificar los gateways de los bounded contexts.

| Recurso | Bounded context | Verbos HTTP utilizados |
| :------ | :-------------- | :--------------------- |
| `/users` | Identity and Access Management | GET, POST, PATCH |
| `/organizations` | Identity and Access Management | GET, PATCH |
| `/vehicles` | Fleet Management | GET, POST, PATCH |
| `/drivers` | Fleet Management | GET, POST, PATCH |
| `/delivery-points` | Operations and Routes | GET |
| `/transport-operations` | Operations and Routes | GET, POST, PATCH |
| `/delivery-stops` | Operations and Routes | GET, POST, PATCH |
| `/iot-devices` | IoT Monitoring | GET, PATCH |
| `/sensor-readings` | IoT Monitoring | GET, POST |
| `/alerts` | IoT Monitoring | GET, PATCH |
| `/incidents` | Incident Management | GET, POST, PATCH |
| `/evidences` | Incident Management | GET, POST |

<a id="5227-software-deployment-evidence-for-sprint-review"></a>

#### 5.2.2.7. Software Deployment Evidence for Sprint Review.

En el Sprint 2 se publicaron dos productos.

**Frontend Web Application en Vercel**

1. Se integraron en `develop` las ramas `feature/project-setup`, `feature/identity-access-management`, `feature/fleet-management`, `feature/operations-and-routes`, `feature/iot-monitoring` y `feature/incident-management`, cada una con un merge `--no-ff`.
2. Se creó la rama `release/0.1.0`, se integró en `main` y se etiquetó como `v0.1.0`, siguiendo Semantic Versioning.
3. Desde la cuenta de Vercel del equipo se importó el repositorio `Frontend-Web-Aplication` de la organización de GitHub, con el preset de Vite, el comando `npm run build`, el directorio de salida `dist` y la rama de producción `main`.
4. El archivo `vercel.json` del repositorio redirige todas las rutas a `index.html`, para que Vue Router resuelva las rutas de la aplicación al ingresar directamente a ellas desde las llamadas a la acción del Landing Page.
5. Vercel publica una nueva versión ante cada integración en `main`. Se verificó el acceso a la URL pública y a las rutas `/monitoring`, `/tracking` y `/analytics`.
6. Se publicó el release `v0.2.0`, que agrega el archivo `.env.production` y el adaptador que consume el fake API de Beeceptor.
7. Se publicó el release `v1.0.0`, primera versión estable de la aplicación, desde la rama `release/1.0.0`.

**Proyecto de la Frontend Web Application en Vercel**, con el deployment de producción generado desde la rama `main`.

<img src="assets/chapter5/sprint2/vercel-project.png" alt="Vista general del proyecto frontend-web-aplication en Vercel" width="800">

**Historial de deployments en Vercel**

<img src="assets/chapter5/sprint2/vercel-deployments.png" alt="Historial de deployments del proyecto en Vercel" width="800">

**Configuración de construcción con el preset de Vite**

<img src="assets/chapter5/sprint2/vercel-build-settings.png" alt="Configuración de construcción del proyecto en Vercel con el preset de Vite" width="800">

**Integración del proyecto con el repositorio de GitHub**

<img src="assets/chapter5/sprint2/vercel-git.png" alt="Repositorio de GitHub conectado al proyecto de Vercel" width="800">

**Landing Page en Netlify**

A partir del Sprint 2 el Landing Page se publica en Netlify, que reemplaza a GitHub Pages porque este último dejó de publicar las nuevas versiones del sitio.

1. Se integraron en `develop` las ramas de las correcciones de AV1 y la rama `feature/product-screenshots`.
2. Se creó la rama `release/0.2.0`, se integró en `main` y se etiquetó como `v0.2.0`. Luego se publicaron `v0.2.1`, con la documentación del despliegue en Netlify, y `v1.0.0`, la primera versión estable, cada una desde su rama release.
3. Desde la cuenta de Netlify del equipo se importó el repositorio `Landing-Page`, con la rama de producción `main`, sin comando de construcción y con la carpeta raíz como directorio de publicación.
4. Netlify publica una nueva versión ante cada integración en `main`. Se verificó la URL pública y que las llamadas a la acción de cada segmento lleven a la vista correspondiente de la Web Application.

| Producto | Repositorio | Tecnología | Plataforma | Versión | URL |
| :------- | :---------- | :--------- | :--------- | :------ | :-- |
| Landing Page | Landing-Page | HTML5, CSS3, JavaScript | Netlify | v1.0.0 | https://1asi0730-2620-8084-codecrafters.netlify.app/ |
| Frontend Web Application | Frontend-Web-Aplication | Vue 3, PrimeVue, JavaScript | Vercel | v1.0.0 | https://frontend-web-aplication.vercel.app |

**Repositorio de la Frontend Web Application**

<img src="assets/chapter5/sprint2/github-frontend-repo.png" alt="Página principal del repositorio Frontend-Web-Aplication" width="800">

**Ramas del repositorio Frontend-Web-Aplication según GitFlow**

<img src="assets/chapter5/sprint2/github-frontend-branches.png" alt="Ramas main, develop, release y feature del repositorio Frontend-Web-Aplication" width="800">

**Tag del release v0.1.0 de la Frontend Web Application**

<img src="assets/chapter5/sprint2/github-frontend-tags.png" alt="Tag v0.1.0 del repositorio Frontend-Web-Aplication" width="800">

**Ramas y tags del repositorio Landing-Page**

<img src="assets/chapter5/sprint2/github-landing-branches.png" alt="Ramas del repositorio Landing-Page" width="800">

<img src="assets/chapter5/sprint2/github-landing-tags.png" alt="Tags v0.1.0, v0.2.0, v0.2.1 y v1.0.0 del repositorio del Landing Page" width="800">

<a id="5228-team-collaboration-insights-during-sprint"></a>

#### 5.2.2.8. Team Collaboration Insights during Sprint.

Durante el Sprint 2 los cinco integrantes participaron con commits en la Frontend Web Application, cada uno en la rama de su bounded context. Leonardo Cumba concentró el mayor volumen en Operations and Routes, el bounded context con más User Stories del Sprint; Angel Crispin aportó la base del proyecto, Identity and Access Management y la integración de las ramas; y Gerardo Palacin, Maria Jose Pezo y Ariana Huapaya implementaron IoT Monitoring, Incident Management y Fleet Management, respectivamente. En el Landing Page, Gerardo Palacin incorporó las capturas de la aplicación y Angel Crispin aplicó las correcciones de AV1 y publicó la versión v1.0.0. En el informe, Leonardo Cumba documentó los wireflows y User Flow Diagrams por objetivo de usuario y registró una nueva entrevista del segmento de bodegas y minimarkets; Gerardo Palacin registró otra entrevista de ese segmento; Maria Jose Pezo consolidó el Impact Map y actualizó las User Personas; Ariana Huapaya registró sus acciones en el Student Outcome; y Angel Crispin documentó el Sprint 2, aplicó las correcciones de AV1 y publicó los releases del informe.

La siguiente tabla resume los commits de cada integrante en el Sprint 2, sin considerar los commits de integración de ramas:

| Integrante | Frontend-Web-Aplication | Landing-Page | Report |
| :--------- | :---------------------: | :----------: | :----: |
| Crispin Valdivia, Angel Gabriel | 20 | 10 | 49 |
| Cumba Rengifo, Leonardo Raul | 12 | 0 | 6 |
| Palacin Lazo, Gerardo Valentin | 5 | 1 | 6 |
| Pezo Castilla, Maria Jose | 5 | 0 | 2 |
| Huapaya Buitron, Ariana Alheli | 4 | 0 | 1 |

**Analíticos de contribución del repositorio Frontend-Web-Aplication**

<img src="assets/chapter5/sprint2/insights-frontend-contributors.png" alt="GitHub Insights, contribuidores del repositorio Frontend-Web-Aplication" width="800">

**Grafo de ramas del repositorio Frontend-Web-Aplication.** Se aprecian las ramas de los cinco bounded contexts integradas en `develop` y la publicación del release v0.1.0 en `main`.

<img src="assets/chapter5/sprint2/insights-frontend-network.png" alt="Grafo de red de ramas del repositorio Frontend-Web-Aplication" width="800">

**Analíticos de contribución del repositorio Landing-Page**

<img src="assets/chapter5/sprint2/insights-landing-contributors.png" alt="GitHub Insights, contribuidores del repositorio Landing-Page" width="800">

<img src="assets/chapter5/sprint2/insights-landing-network.png" alt="Grafo de red de ramas del repositorio Landing-Page" width="800">


<a id="523-sprint-3"></a>

### 5.2.3. Sprint 3

<a id="5231-sprint-planning-3"></a>

#### 5.2.3.1. Sprint Planning 3.

En el Sprint 3 se implementó la primera versión de los Web Services de BottleTrack y se integró con la Frontend Web Application desarrollada durante el Sprint 2. En el entorno local, el incremento reemplaza el fake API por servicios RESTful con persistencia en MySQL, validaciones y reglas de negocio en el servidor.

La planificación consideró las Technical Stories TS01 a TS15 del Product Backlog, con una estimación total de 96 Story Points.

| Sprint # | Sprint 3 |
| :------- | :------- |
| **Sprint Planning Background** | |
| Date | 2026-10-28 |
| Time | 8:00 PM |
| Location | Reunión virtual por Discord |
| Prepared By | Cumba Rengifo, Leonardo Raul |
| Attendees (to planning meeting) | Crispin Valdivia, Angel Gabriel; Cumba Rengifo, Leonardo Raul; Palacin Lazo, Gerardo Valentin; Pezo Castilla, Maria Jose |
| Sprint 2 Review Summary | En el Sprint 2 se publicó una nueva versión del Landing Page y la primera versión de la Frontend Web Application. Se implementaron las vistas de autenticación, usuarios, empresa, flota, operaciones, entregas, incidencias, monitoreo IoT y seguimiento de pedidos para bodegas, sobre un fake API. También se incorporaron las correcciones de AV1 en el Landing Page. La implementación de los Web Services quedó para el Sprint 3. |
| Sprint 2 Retrospective Summary | La distribución del frontend por bounded context permitió la participación de los cinco integrantes. Para el Sprint 3 el equipo acordó mantener esa distribución, definir los contratos del API antes de integrar las vistas, distribuir las pruebas entre líderes y colaboradores y reservar tiempo para la documentación, el despliegue y la validación con usuarios. |
| **Sprint Goal & User Stories** | |
| Sprint 3 Goal | *Nuestro enfoque está en* que el administrador de la distribuidora mantenga de forma permanente sus usuarios, vehículos y conductores; en que el supervisor de flota planifique, ejecute y dé seguimiento a sus operaciones de transporte, con sus entregas, incidencias y alertas de carga en riesgo; y en que el responsable de la bodega consulte el estado de su pedido y reporte los problemas de recepción.<br>*Creemos que esto entrega* control confiable de sus recursos al administrador de la empresa distribuidora, información actualizada y trazable de cada operación al supervisor de flota, y certeza sobre sus pedidos con un canal directo para reportar faltantes o productos dañados al responsable de la bodega o minimarket.<br>*Esto se confirmará cuando* el administrador registre un vehículo y un conductor que sigan disponibles al volver a ingresar; el supervisor complete una operación de principio a fin, desde su creación hasta el cierre de sus entregas, y convierta una alerta de carga en una incidencia; y la bodega consulte su pedido y reporte un problema de recepción que el supervisor pueda ver. Los tres flujos deben ejecutarse sin errores en la aplicación publicada (100 % de los casos de aceptación) y al menos tres representantes de cada segmento deben completar su flujo principal en las entrevistas de validación. |
| Sprint 3 Velocity | 96 Story Points |
| Sum of Story Points | 96 |

La comprobación del Sprint Goal se realiza sobre la integración de la Web Application con los Web Services: el funcionamiento de una vista con datos del fake API no constituye evidencia del cumplimiento de una historia técnica. Las lecturas IoT continúan siendo simuladas: los Web Services ya permiten registrarlas y consultarlas, y su visualización en la Web Application pasa al siguiente Sprint. El conductor se mantiene como recurso de la operación y no como usuario de la plataforma.

**Resultado del Sprint.** Al cierre del Sprint 3 los Web Services implementan los cinco bounded contexts con 41 endpoints REST, doce tablas en MySQL creadas por cuatro migraciones de Entity Framework Core e inicio de sesión con tokens JWT. La Frontend Web Application consume estos servicios en sus flujos de autenticación, administración de usuarios y empresa, gestión de vehículos y conductores, creación de operaciones con sus paradas, consulta de dispositivos IoT y reporte, evidencia y resolución de incidencias.

Las acciones que la Web Application todavía no integra con el API se muestran con el aviso **Próximamente** y pasan al siguiente Sprint: asignar recursos, iniciar, completar y cancelar operaciones, registrar el resultado y reordenar las paradas, revisar y cerrar incidencias, el monitoreo en vivo con sus alertas, la configuración del rango seguro de un dispositivo y el seguimiento de pedidos de la bodega. Por esa razón el Sprint Goal se cumple de forma parcial: el flujo del administrador está completo, mientras que los flujos del supervisor y de la bodega requieren las acciones mencionadas.

<a id="5232-aspect-leaders-and-collaborators"></a>

#### 5.2.3.2. Aspect Leaders and Collaborators.

En el Sprint 3 se mantuvo la distribución por bounded context utilizada en el Sprint 2. Cada integrante lideró los servicios de su contexto y colaboró en su integración con los demás componentes de BottleTrack.

La matriz de Liderazgo y Colaboración (LACX) identifica al líder de cada aspecto con **L** y a sus colaboradores con **C**, en concordancia con los responsables del Sprint Backlog.

| Team Member (Last Name, First Name) | GitHub Username | Backend Setup & Configuration Management | Identity and Access Management | Fleet Management | Operations and Routes | IoT Monitoring | Incident Management & Analytics | OpenAPI & Integration Verification | Landing Page |
| :---------------------------------- | :-------------- | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| Crispin Valdivia, Angel Gabriel | FaureGalliard | L | L | L | C | C | C | L | C |
| Cumba Rengifo, Leonardo Raul | LeonardoC72 | C | C | C | L | C | C | C | C |
| Palacin Lazo, Gerardo Valentin | GeraldP03 | C | C | C | C | L | C | C | L |
| Pezo Castilla, Maria Jose | MariaJosePezo | C | C | C | C | C | L | C | C |

Angel Crispin lideró la configuración del backend, los servicios de autenticación y administración, la gestión de vehículos y conductores y la verificación de OpenAPI y de la integración. Leonardo Cumba lideró las operaciones, sus paradas y los puntos de entrega. Gerardo Palacin lideró el monitoreo IoT y el Landing Page. Maria Jose Pezo lideró las incidencias, sus evidencias y los indicadores operacionales del dashboard.

Cada integrante es responsable de documentar y verificar los endpoints de su contexto. La coordinación de la documentación y de las pruebas no reemplaza la responsabilidad individual de proporcionar evidencias de implementación.

<a id="5233-sprint-backlog-3"></a>

#### 5.2.3.3. Sprint Backlog 3.

El Sprint Backlog 3 contiene las Technical Stories del RESTful API previstas en el Product Backlog y su integración con las vistas existentes de la Frontend Web Application. También incluye tareas transversales de configuración, despliegue, validación y preparación de evidencias para AV2.

Las historias TS01 a TS15 suman 96 Story Points. Las User Stories implementadas con el fake API durante el Sprint 2 sirven como referencia de los flujos que se integran; sus puntos no se vuelven a contabilizar en esta suma.

**Tablero del Sprint 3** al cierre del Sprint, con sus 46 tareas distribuidas en las listas *To-do*, *In-Process* y *Done* según el estado registrado en la tabla siguiente. El tablero es público y se encuentra en https://trello.com/b/6ae377c3d33bbc1ab8709e54/sprint-3-bottletrack.

<img src="assets/chapter5/sprint3/trello-sprint-3.png" alt="Tablero de Trello del Sprint 3 al cierre del Sprint" width="800">

La siguiente tabla registra el estado de cada tarea al cierre del Sprint 3, el 2026-11-11. Las tareas identificadas con **—** corresponden a trabajo transversal que no depende de una sola historia.

| Sprint # | Sprint 3 | | | | | | |
| :------- | :------- | :- | :- | :- | :- | :- | :- |
| **User Story / Technical Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| — | Backend configuration | T01 | Backend project setup | Configurar el proyecto ASP.NET Core, la organización por bounded contexts, la inyección de dependencias y el manejo de errores. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| — | Backend configuration | T02 | Database configuration | Configurar la conexión a MySQL y la estrategia de creación y actualización del esquema, coordinando las entidades de cada contexto. | 6 | Crispin Valdivia, Angel Gabriel | Done |
| TS01 | Authentication REST API | T03 | Authentication and authorization | Implementar autenticación, emisión y validación de tokens y restricciones de acceso a recursos protegidos. | 8 | Crispin Valdivia, Angel Gabriel | In-Process |
| TS01 | Authentication REST API | T04 | Authentication frontend integration | Conectar el inicio y cierre de sesión con el API y gestionar credenciales inválidas, sesiones vencidas y accesos no autorizados. | 6 | Crispin Valdivia, Angel Gabriel | In-Process |
| TS02 | User and Company REST API | T05 | Users and company endpoints | Implementar registro, consulta y actualización de usuarios, roles y empresa, con validaciones y restricciones de acceso. | 8 | Crispin Valdivia, Angel Gabriel | In-Process |
| TS02 | User and Company REST API | T06 | Administration frontend integration | Conectar las vistas de usuarios, perfil y empresa con los servicios y verificar la persistencia de los cambios. | 6 | Crispin Valdivia, Angel Gabriel | Done |
| TS03 | Vehicle Management REST API | T07 | Vehicle management endpoints | Implementar persistencia, registro, actualización y consulta de vehículos disponibles, validando datos obligatorios y duplicados. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| TS03 | Vehicle Management REST API | T08 | Vehicle frontend integration | Conectar las vistas de vehículos con el API y verificar registro, actualización y disponibilidad. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| TS04 | Driver Management REST API | T09 | Driver management endpoints | Implementar registro, actualización y consulta de conductores disponibles, incluyendo las validaciones de sus datos. | 8 | Crispin Valdivia, Angel Gabriel | Done |
| TS04 | Driver Management REST API | T10 | Driver frontend integration | Integrar las vistas de conductores con el API y comprobar la conservación de los cambios. | 4 | Crispin Valdivia, Angel Gabriel | Done |
| TS05 | Transport Operations REST API | T11 | Operation domain and persistence | Implementar el agregado de operación, sus estados, reglas de negocio y persistencia. | 8 | Cumba Rengifo, Leonardo Raul | Done |
| TS05 | Transport Operations REST API | T12 | Operation endpoints and integration | Implementar creación, consulta, inicio, cancelación y cierre de operaciones y conectar las acciones con el frontend. | 8 | Cumba Rengifo, Leonardo Raul | In-Process |
| TS06 | Resource Assignment Service | T13 | Resource assignment rules | Implementar asignación y liberación de vehículos y conductores, rechazando recursos no disponibles o asignaciones incompatibles. | 6 | Cumba Rengifo, Leonardo Raul | To-do |
| TS06 | Resource Assignment Service | T14 | Resource assignment verification | Verificar junto con Operations and Routes la disponibilidad, la liberación de recursos y el rechazo de asignaciones incompatibles concurrentes. | 4 | Palacin Lazo, Gerardo Valentin | To-do |
| TS07 | Delivery Management REST API | T15 | Delivery points and sequence | Implementar registro y consulta de puntos de entrega y actualización de su secuencia dentro de una operación. | 8 | Cumba Rengifo, Leonardo Raul | In-Process |
| TS07 | Delivery Management REST API | T16 | Delivery results integration | Persistir resultados de entregas completas, parciales y no realizadas, validar cantidades y motivos e integrar las acciones con el frontend. | 8 | Cumba Rengifo, Leonardo Raul | To-do |
| TS08 | Incident Management REST API | T17 | Incident lifecycle endpoints | Implementar registro, consulta y actualización de incidencias vinculadas con operaciones o entregas. | 8 | Pezo Castilla, Maria Jose | In-Process |
| TS08 | Incident Management REST API | T18 | Incident frontend integration | Conectar las vistas de incidencias con el API y verificar validaciones y cambios de estado. | 4 | Pezo Castilla, Maria Jose | In-Process |
| TS09 | Incident Evidence Service | T19 | Evidence storage service | Implementar almacenamiento y consulta de evidencias, validando formato, tamaño y asociación con una incidencia existente. | 8 | Pezo Castilla, Maria Jose | In-Process |
| TS09 | Incident Evidence Service | T20 | Evidence frontend integration | Conectar la carga y visualización de evidencias y gestionar las respuestas de rechazo del servicio. | 4 | Pezo Castilla, Maria Jose | In-Process |
| TS10 | Monitoring REST API | T21 | Operational indicators | Implementar el cálculo de indicadores y progreso con información persistida, incluyendo respuestas consistentes cuando no existan datos. | 8 | Pezo Castilla, Maria Jose | To-do |
| TS10 | Monitoring REST API | T22 | Dashboard integration | Conectar el dashboard con el API y contrastar los indicadores con un conjunto conocido de operaciones, entregas e incidencias. | 4 | Pezo Castilla, Maria Jose | To-do |
| TS11 | Operation History REST API | T23 | Operation history endpoints | Implementar consulta y detalle de operaciones finalizadas y canceladas, incluyendo recursos, entregas e incidencias relacionadas. | 6 | Cumba Rengifo, Leonardo Raul | To-do |
| TS11 | Operation History REST API | T24 | History frontend integration | Conectar el historial y su detalle con el API y verificar el manejo de operaciones inexistentes. | 4 | Cumba Rengifo, Leonardo Raul | To-do |
| TS12 | Maps Service Integration | T25 | External maps adapter | Implementar la integración con un servicio externo de mapas o geolocalización, gestionando ubicaciones no encontradas y fallos del proveedor. | 8 | Palacin Lazo, Gerardo Valentin | To-do |
| TS12 | Maps Service Integration | T26 | Delivery location integration | Integrar la información geográfica con las vistas de entregas, coordinando el contrato con Operations and Routes. | 4 | Palacin Lazo, Gerardo Valentin | To-do |
| TS13 | OpenAPI Documentation | T27 | OpenAPI configuration | Configurar OpenAPI y Scalar con autorización, esquemas y convenciones comunes para parámetros, requests, responses y códigos HTTP. | 4 | Crispin Valdivia, Angel Gabriel | In-Process |
| TS13 | OpenAPI Documentation | T28 | Endpoint documentation verification | Revisar con cada líder la documentación de sus endpoints, ejecutar ejemplos y registrar capturas y enlaces para el informe. | 6 | Crispin Valdivia, Angel Gabriel | Done |
| TS14 | IoT Telemetry REST API | T29 | Devices and sensor readings | Implementar persistencia de dispositivos, rangos seguros y lecturas simuladas, validando la existencia del dispositivo y los valores recibidos. | 8 | Palacin Lazo, Gerardo Valentin | Done |
| TS14 | IoT Telemetry REST API | T30 | Cargo risk alerts | Generar alertas relacionadas con una operación cuando se detecten temperaturas fuera de rango o golpes e integrar su atención con incidencias. | 8 | Palacin Lazo, Gerardo Valentin | In-Process |
| TS14 | IoT Telemetry REST API | T31 | IoT frontend integration | Conectar monitoreo, alertas y configuración de dispositivos con el API y verificar el manejo de operaciones sin lecturas recientes. | 6 | Palacin Lazo, Gerardo Valentin | In-Process |
| TS15 | Delivery Point Tracking REST API | T32 | Delivery point tracking endpoints | Implementar la consulta de entregas de la bodega autorizada y el registro de problemas de recepción vinculados con una entrega. | 8 | Cumba Rengifo, Leonardo Raul | To-do |
| TS15 | Delivery Point Tracking REST API | T33 | Reception incident integration | Integrar los reportes de recepción con Incident Management y verificar su consulta desde los flujos de bodega y distribuidora. | 4 | Pezo Castilla, Maria Jose | To-do |
| — | Software deployment | T34 | API deployment | Configurar el alojamiento del API y la base de datos, las variables de entorno, HTTPS y CORS y verificar el acceso a los servicios y OpenAPI. | 8 | Crispin Valdivia, Angel Gabriel | In-Process |
| — | Software deployment | T35 | Frontend deployment verification | Publicar la nueva versión del frontend con la dirección del API y comprobar navegación por roles y persistencia después de recargar. | 6 | Crispin Valdivia, Angel Gabriel | To-do |
| — | Landing Page update | T36 | Landing page release | Actualizar capturas, comprobar las llamadas a la acción e incorporar los videos cuando estén publicados; verificar idiomas y vista móvil. | 6 | Palacin Lazo, Gerardo Valentin | In-Process |
| — | Integration verification | T37 | End-to-end acceptance checks | Ejecutar los flujos de administrador, supervisor y bodega sobre los productos desplegados y registrar resultados y defectos. | 8 | Crispin Valdivia, Angel Gabriel | In-Process |
| — | Validation interviews | T38 | Validation interview design | Definir tareas, preguntas y flujos de validación por segmento para el Landing Page y la Web Application. | 4 | Pezo Castilla, Maria Jose | Done |
| — | Validation interviews | T39 | Distributor validation interviews | Realizar y documentar entrevistas con entre tres y cinco representantes de empresas distribuidoras, conservando videos y datos de cada sesión. | 8 | Crispin Valdivia, Angel Gabriel | In-Process |
| — | Validation interviews | T40 | Supervisor validation interviews | Realizar y documentar entrevistas con entre tres y cinco supervisores de flota sobre los flujos principales de la aplicación. | 8 | Cumba Rengifo, Leonardo Raul | To-do |
| — | Validation interviews | T41 | Delivery point validation interviews | Realizar y documentar entrevistas con entre tres y cinco responsables de bodegas o minimarkets sobre seguimiento y recepción de pedidos. | 8 | Pezo Castilla, Maria Jose | In-Process |
| — | UX evaluation | T42 | Heuristic evaluation | Consolidar hallazgos de usabilidad, arquitectura de información y diseño inclusivo con el formato del Anexo D, incluyendo severidad, evidencia y recomendaciones. | 6 | Cumba Rengifo, Leonardo Raul | To-do |
| — | Product communication | T43 | About-the-Product video | Preparar y publicar un video de uno a tres minutos con escenas del producto y una opinión por segmento objetivo; registrar enlaces de Stream y YouTube. | 6 | Palacin Lazo, Gerardo Valentin | Done |
| — | Team communication | T44 | About-the-Team video | Coordinar los testimonios de los cuatro integrantes y las escenas de trabajo, editar el video y registrar los enlaces de publicación. | 6 | Palacin Lazo, Gerardo Valentin | Done |
| — | Sprint documentation | T45 | Sprint report and evidence | Consolidar las evidencias del equipo y actualizar las secciones del Sprint, Student Outcome, registro de versiones y conclusiones. | 6 | Cumba Rengifo, Leonardo Raul | In-Process |
| — | Sprint management | T46 | Sprint board update | Registrar y confirmar historias, tareas, responsables y estimaciones en Trello e incorporar la captura del tablero del Sprint 3. | 4 | Cumba Rengifo, Leonardo Raul | Done |

Al cierre del Sprint, 14 tareas están en **Done**, 18 en **In-Process** y 14 en **To-do**. Las tareas en **In-Process** tienen implementada su parte principal y les falta lo que se indica en la sección 5.2.3.1. Las tareas en **To-do** pasan al Sprint 4.

<a id="5234-development-evidence-for-sprint-review"></a>

#### 5.2.3.4. Development Evidence for Sprint Review.

En el Sprint 3 se creó el repositorio de los Web Services, se integró con ellos la Web Application y se trabajó en los repositorios del Landing Page y del informe. La siguiente tabla registra los commits integrados en `develop` desde el inicio del Sprint, el 2026-10-28, hasta la entrega de AV2, el 2026-11-13, sin considerar los commits de integración de ramas. La columna *Branch* indica la rama de feature en la que se elaboró cada commit, y `develop` identifica los commits realizados directamente sobre esa rama.

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
| :--------- | :----- | :-------- | :------------- | :------------------ | :------------------ |
| bottle-track-web-services | release/2.0.0 | `b5a1b39` | `docs(release): document version 2.0.0` | — | 2026-11-13 |
| bottle-track-web-services | feature/fleet-status-changes | `3a14329` | `test(fleet): cover driver status changes` | — | 2026-11-13 |
| bottle-track-web-services | feature/fleet-status-changes | `94ec3a2` | `test(fleet): cover vehicle status changes` | — | 2026-11-13 |
| bottle-track-web-services | feature/fleet-status-changes | `073e351` | `feat(fleet): accept a status change when updating drivers` | — | 2026-11-13 |
| bottle-track-web-services | feature/fleet-status-changes | `770f357` | `feat(fleet): accept a status change when updating vehicles` | — | 2026-11-13 |
| bottle-track-web-services | feature/iam-tokens-and-roles | `c6bb01f` | `feat(iam): add the roles controller with the users of each role` | — | 2026-11-13 |
| bottle-track-web-services | feature/fleet-status-changes | `c1e3e37` | `feat(fleet): let drivers be deactivated and activated` | — | 2026-11-13 |
| bottle-track-web-services | feature/iam-tokens-and-roles | `3edcba4` | `feat(iam): add the query to list users by role` | — | 2026-11-13 |
| bottle-track-web-services | fix/alert-acknowledgments-endpoint | `b63d801` | `fix(monitoring): acknowledge alerts with a post to acknowledgments` | — | 2026-11-12 |
| bottle-track-web-services | fix/incident-resolutions-endpoint | `69482b0` | `fix(incidents): resolve incidents with a post to resolutions` | — | 2026-11-12 |
| bottle-track-web-services | feature/fleet-status-changes | `aca89ed` | `feat(fleet): let vehicles return to service from maintenance` | — | 2026-11-12 |
| bottle-track-web-services | feature/iam-tokens-and-roles | `dc9904a` | `refactor(iam): assign user roles with a post to roles` | — | 2026-11-12 |
| bottle-track-web-services | feature/scalar-api-reference | `9797e76` | `docs(readme): point to the scalar api reference` | — | 2026-11-12 |
| bottle-track-web-services | feature/fleet-status-changes | `6693156` | `feat(fleet): add the invalid status change error and its messages` | — | 2026-11-12 |
| bottle-track-web-services | fix/transport-operation-dispatches-endpoint | `c105949` | `fix(operations): dispatch transport operations with a post to dispatches` | — | 2026-11-12 |
| bottle-track-web-services | feature/iam-tokens-and-roles | `bfd6913` | `test(iam): sign in through the tokens endpoint` | — | 2026-11-12 |
| bottle-track-web-services | feature/scalar-api-reference | `5c84891` | `feat(api): replace swagger ui with the scalar api reference` | — | 2026-11-12 |
| bottle-track-web-services | feature/iam-tokens-and-roles | `98ec681` | `refactor(iam): expose sign in as the tokens resource` | — | 2026-11-12 |
| bottle-track-web-services | feature/scalar-api-reference | `67573a7` | `build(api): add the scalar api reference package` | — | 2026-11-12 |
| bottle-track-web-services | release/1.0.1 | `b27480f` | `docs(release): document version 1.0.1` | — | 2026-11-12 |
| bottle-track-web-services | fix/transport-operation-scheduled-date | `e22f500` | `chore(persistence): update the model snapshot for the scheduled date migration` | — | 2026-11-12 |
| bottle-track-web-services | fix/transport-operation-scheduled-date | `2743cc1` | `fix(operations): add migration to store the scheduled date as datetime` | — | 2026-11-12 |
| bottle-track-web-services | release/1.0.0 | `a3284cb` | `docs(release): document version 1.0.0` | — | 2026-11-12 |
| bottle-track-web-services | feature/api-tests | `41003d8` | `test(iam): add authentication integration tests` | — | 2026-11-11 |
| bottle-track-web-services | feature/fleet-vehicle-update | `139f303` | `feat(fleet): expose vehicle update endpoint` | — | 2026-11-11 |
| bottle-track-web-services | feature/api-tests | `a8381cd` | `test(api): add unit tests for value objects and the user aggregate` | — | 2026-11-11 |
| bottle-track-web-services | feature/fleet-vehicle-update | `5649d02` | `feat(fleet): add vehicle details update to the aggregate` | — | 2026-11-11 |
| bottle-track-web-services | feature/api-tests | `3a8c705` | `fix(api): use es-419 as the supported spanish culture` | — | 2026-11-11 |
| bottle-track-web-services | chore/ef-core-migrations | `82ec010` | `chore(persistence): add migration for iot monitoring` | — | 2026-11-10 |
| bottle-track-web-services | chore/ef-core-migrations | `aff2bcc` | `chore(persistence): add migration for operations and routes` | — | 2026-11-10 |
| bottle-track-web-services | chore/ef-core-migrations | `7a06623` | `chore(persistence): add migration for incident management` | — | 2026-11-10 |
| bottle-track-web-services | feature/fleet-driver-update | `6acbe10` | `feat(fleet): expose driver update endpoint` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `f1cc24a` | `feat(operations): add transport operations controller` | — | 2026-11-10 |
| bottle-track-web-services | feature/fleet-driver-update | `7ec33f9` | `feat(fleet): add driver profile update to the aggregate` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `7d1c992` | `feat(iam): add organization update` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `1584724` | `feat(operations): add delivery points controller` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `5fa8dd0` | `feat(iam): add user profile update and role assignment` | — | 2026-11-10 |
| bottle-track-web-services | feature/incident-management | `22c8678` | `feat(incidents): add incidents rest controller and resources` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `160b84e` | `feat(monitoring): add alerts endpoint` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `cd41f73` | `feat(operations): add operations persistence with ef core` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `0860228` | `feat(monitoring): add sensor readings endpoint` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `d5bd3dc` | `feat(monitoring): add iot devices endpoint` | — | 2026-11-10 |
| bottle-track-web-services | feature/incident-management | `8173a7f` | `feat(incidents): add incident persistence with ef core` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `64653e8` | `feat(iam): add authentication endpoint with jwt bearer` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `72ca709` | `feat(monitoring): add monitoring persistence with ef core` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `73153cb` | `feat(operations): add delivery point and transport operation services` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `3d83c1f` | `feat(monitoring): add sensor reading and alert services` | — | 2026-11-10 |
| bottle-track-web-services | feature/incident-management | `d968ae5` | `feat(incidents): add incident command and query services` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `40babf1` | `feat(iam): add sign-in command service` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `2dfea58` | `feat(monitoring): add iot device command and query services` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `d730907` | `feat(operations): add transport operation aggregate with delivery stops` | — | 2026-11-10 |
| bottle-track-web-services | feature/incident-management | `e3d8774` | `feat(incidents): add incident commands, queries and repository port` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `cc4e4eb` | `feat(monitoring): add sensor reading and alert aggregates` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `4c5cab9` | `feat(iam): add jwt settings and token service` | — | 2026-11-10 |
| bottle-track-web-services | feature/incident-management | `c64c03c` | `feat(incidents): add incident aggregate, evidence and value objects` | — | 2026-11-10 |
| bottle-track-web-services | feature/iot-monitoring | `bae97f8` | `feat(monitoring): add iot device aggregate and repository port` | — | 2026-11-10 |
| bottle-track-web-services | feature/operations-and-routes | `1c88202` | `feat(operations): add delivery point aggregate and repository port` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-authentication | `6b3e2c2` | `chore(api): replace scalar with swagger ui and use port 5280` | — | 2026-11-10 |
| bottle-track-web-services | feature/iam-and-backend-base | `3f49ef0` | `chore(persistence): add initial ef core migration for iam and fleet` | — | 2026-11-03 |
| bottle-track-web-services | feature/iam-and-backend-base | `f63b3a6` | `feat(api): register iam and fleet services and snake_case enum serialization` | — | 2026-11-03 |
| bottle-track-web-services | feature/iam-and-backend-base | `b163436` | `feat(shared): add localized error messages for iam and fleet` | — | 2026-11-03 |
| bottle-track-web-services | feature/iam-and-backend-base | `ba46267` | `feat(fleet): add driver rest controller, resources and assembler` | — | 2026-11-01 |
| bottle-track-web-services | feature/fleet-driver-management | `71b76d9` | `feat(fleet): add driver entity configuration and repository` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-driver-management | `600dabe` | `feat(fleet): add driver repository port and application services` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-vehicle-api | `a1a9380` | `feat(fleet): add vehicle rest controller, resources and assembler` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-vehicle-api | `cf72c16` | `feat(fleet): add vehicle entity configuration and repository` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-driver-management | `1c0eeff` | `feat(fleet): add driver register command and queries` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-vehicle-model | `664f806` | `feat(fleet): add vehicle repository port and application services` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-driver-management | `7459d9f` | `feat(fleet): add driver aggregate with license number and status value objects` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-vehicle-model | `e185a7c` | `feat(fleet): add vehicle register command and queries` | — | 2026-10-31 |
| bottle-track-web-services | feature/fleet-vehicle-model | `c139727` | `feat(fleet): add vehicle aggregate with plate number and status value objects` | — | 2026-10-31 |
| bottle-track-web-services | feature/iam-and-backend-base | `ce09a05` | `feat(iam): add user rest controller, resources and assembler` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `0fc7aba` | `feat(iam): add user entity configuration and repository` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `7312ecd` | `feat(iam): add user application services and pbkdf2 password hashing` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `edf61ae` | `feat(iam): add user register command and queries` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `f01ad25` | `feat(iam): add user aggregate with role, status and email value objects` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `a5283a8` | `feat(iam): add organization rest controller, resources and assembler` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `7313c54` | `feat(iam): add organization entity configuration and repository` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `e5a5d35` | `feat(iam): add organization repository port and application services` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `81b508c` | `feat(iam): add organization register command and queries` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `c01cf2c` | `feat(iam): add organization aggregate and tax id value object` | — | 2026-10-30 |
| bottle-track-web-services | feature/iam-and-backend-base | `7b45e1b` | `refactor(shared): simplify kebab-case route convention and string extensions` | — | 2026-10-29 |
| bottle-track-web-services | feature/iam-and-backend-base | `13c7529` | `refactor(shared): replace target-typed new and primary constructor in persistence` | — | 2026-10-29 |
| bottle-track-web-services | feature/iam-and-backend-base | `45cf4fe` | `refactor(shared): use explicit members in the result pattern` | — | 2026-10-29 |
| bottle-track-web-services | develop | `884a08f` | `chore(shared): add backend base project` | — | 2026-10-29 |
| bottle-track-website | feature/landing-subscription-and-team | `3e5c062` | `feat(landing): add team member profile photos` | — | 2026-11-11 |
| bottle-track-website | feature/landing-subscription-and-team | `f36e9b8` | `refactor(landing): remove obsolete contact form behavior` | — | 2026-11-11 |
| bottle-track-website | feature/landing-subscription-and-team | `a2b345e` | `feat(i18n): add bilingual subscription and team content` | — | 2026-11-11 |
| bottle-track-website | feature/landing-subscription-and-team | `195313d` | `style(landing): improve subscription and team layouts` | — | 2026-11-11 |
| bottle-track-website | feature/landing-subscription-and-team | `3372feb` | `feat(landing): add subscription plans and video placeholders` | — | 2026-11-11 |
| bottle-track-website | feature/team-video-behavior | `697bdc5` | `style(landing): use a solid border for the video frame` | — | 2026-10-31 |
| bottle-track-website | feature/team-video-behavior | `68a8e46` | `feat(landing): reveal the team video section when a source is set` | — | 2026-10-31 |
| bottle-track-website | feature/landing-i18n | `9c1b1c6` | `feat(i18n): add strings for the team section, privacy policy and terms` | — | 2026-10-31 |
| bottle-track-website | feature/team-video-section | `3c2fbcf` | `feat(landing): add about-the-team video section to the home page` | — | 2026-10-30 |
| bottle-track-website | feature/legal-pages | `dcebd4f` | `feat(legal): link the privacy policy from the footer` | — | 2026-10-30 |
| bottle-track-website | feature/legal-pages | `eceb6a8` | `feat(legal): rework the terms of service page content` | — | 2026-10-29 |
| bottle-track-website | feature/legal-pages | `f72e983` | `feat(legal): add privacy policy page` | — | 2026-10-29 |
| bottle-track-report | develop | `9c9ebee` | `docs(report): update repository links to new assets path` | — | 2026-11-11 |
| bottle-track-report | feature/tb1-corrections | `c550dd4` | `docs(report): separate anchors from headings for Pandoc` | — | 2026-11-10 |
| bottle-track-report | feature/tb1-corrections | `dd8d73c` | `build(pandoc): add PDF build with Pandoc and XeLaTeX` | — | 2026-11-10 |
| bottle-track-report | feature/tb1-corrections | `541c837` | `docs(report): restructure report into chapters and fix links` | — | 2026-11-10 |
| bottle-track-report | feature/report-backend-and-database | `ef21e43` | `docs(report): describe the implemented backend and update the diagram source index` | — | 2026-11-03 |
| bottle-track-report | feature/report-backend-and-database | `a35b833` | `docs(database-design): add database design section aligned with the initial migration` | — | 2026-11-03 |
| bottle-track-report | fix/report-incident-diagrams | `c4a2358` | `docs(class-diagram): mark incident management backend classes as planned` | — | 2026-11-03 |
| bottle-track-report | fix/report-iot-and-fleet-diagrams | `af4df86` | `docs(class-diagram): mark iot monitoring backend classes as planned` | — | 2026-11-03 |
| bottle-track-report | fix/report-operations-diagrams | `d828b76` | `docs(class-diagram): mark operations and routes backend classes as planned` | — | 2026-11-03 |
| bottle-track-report | fix/report-incident-diagrams | `ab432ea` | `docs(component-diagram): mark incident management as planned` | — | 2026-11-03 |
| bottle-track-report | feature/report-backend-and-database | `b8a36f2` | `docs(class-diagram): align backend class model and identity and access classes` | — | 2026-11-03 |
| bottle-track-report | fix/report-iot-and-fleet-diagrams | `310b026` | `docs(component-diagram): mark iot monitoring as planned` | — | 2026-11-03 |
| bottle-track-report | fix/report-operations-diagrams | `0b2e055` | `docs(class-diagram): align fleet management backend classes with the code` | — | 2026-11-02 |
| bottle-track-report | fix/report-iot-and-fleet-diagrams | `49c9de2` | `docs(component-diagram): align fleet management with the code` | — | 2026-11-02 |
| bottle-track-report | fix/report-operations-diagrams | `ffadcce` | `docs(component-diagram): mark operations and routes as planned` | — | 2026-11-02 |
| bottle-track-report | feature/report-backend-and-database | `c065b8f` | `docs(component-diagram): align identity and access management with the code` | — | 2026-11-02 |
| bottle-track-report | feature/report-backend-and-database | `ab31818` | `docs(container-diagram): split website, spa and web services into separate containers` | — | 2026-11-02 |
| bottle-track-report | develop | `0a83ffd` | `docs(class-diagram): update comments from diagram classes for better understanding` | — | 2026-11-02 |
| bottle-track-report | develop | `f133dfc` | `docs(class-diagram): apply corrections to naming conventions to classes from frontend and backend` | — | 2026-11-02 |
| bottle-track-report | develop | `c0222bb` | `docs(sprint-goal-3): apply common conventions for the spring goal 3` | — | 2026-11-02 |
| bottle-track-report | develop | `caddedd` | `docs(container-diagram): create new diagram according to c4 model library` | — | 2026-11-02 |
| bottle-track-report | develop | `f655907` | `docs(user-flows): model user goals with happy and unhappy paths` | State each user goal from its role and draw its decisions, alternative paths and error states over the mock-up screens. | 2026-11-02 |
| bottle-track-report | develop | `9a63766` | `Sprint Backlog 3` | — | 2026-10-29 |
| bottle-track-report | develop | `b8d9086` | `docs(sprint-3): add backlog with tasks and estimates` | — | 2026-10-29 |
| bottle-track-report | develop | `8d527f1` | `docs(sprint-3): add leadership and collaboration matrix` | — | 2026-10-29 |
| bottle-track-report | develop | `46e7317` | `docs(sprint-3): add sprint planning and goal` | — | 2026-10-29 |

<a id="5235-execution-evidence-for-sprint-review"></a>

#### 5.2.3.5. Execution Evidence for Sprint Review.

Las capturas muestran la Frontend Web Application consumiendo los Web Services en el entorno local, con datos persistidos en MySQL. Se utilizó una cuenta de cada rol de la misma empresa: administrador, supervisor de flota y responsable de bodega. En los tres roles la navegación por todas las vistas del menú se completó sin errores en la consola del navegador ni respuestas de error del API.

**Inicio de sesión.** El inicio de sesión se valida contra el API, que devuelve el usuario autenticado y su token.

<img src="assets/chapter5/sprint3/app-sign-in.png" alt="Vista de inicio de sesión de la Web Application" width="800">

**Administrador: usuarios y empresa.** Los usuarios y los datos de la empresa se registran, consultan y editan en los Web Services.

<img src="assets/chapter5/sprint3/app-users.png" alt="Gestión de usuarios con los tres roles" width="800">

<img src="assets/chapter5/sprint3/app-company.png" alt="Datos de la empresa" width="800">

**Administrador: vehículos, conductores y dispositivos IoT.** La placa, el DNI, la licencia y el número de serie duplicados son rechazados por el API.

<img src="assets/chapter5/sprint3/app-vehicles.png" alt="Listado de vehículos" width="800">

<img src="assets/chapter5/sprint3/app-drivers.png" alt="Listado de conductores" width="800">

<img src="assets/chapter5/sprint3/app-devices.png" alt="Listado de dispositivos IoT con su rango seguro de temperatura y su umbral de golpes" width="800">

**Supervisor de flota: operaciones.** El supervisor crea operaciones, agrega sus paradas y consulta su detalle. La operación `OP-00002` fue despachada con un vehículo y un conductor.

<img src="assets/chapter5/sprint3/app-operations.png" alt="Listado de operaciones con su vehículo, conductor, avance y estado" width="800">

<img src="assets/chapter5/sprint3/app-operation-detail.png" alt="Detalle de la operación OP-00002 con sus recursos y paradas" width="800">

**Supervisor de flota: dashboard e incidencias.** El dashboard calcula sus indicadores con la información del API, y las incidencias se reportan, reciben evidencias y se resuelven en los Web Services.

<img src="assets/chapter5/sprint3/app-analytics.png" alt="Dashboard con los indicadores del mes" width="800">

<img src="assets/chapter5/sprint3/app-incidents.png" alt="Listado de incidencias con su severidad y estado" width="800">

**Funciones del siguiente Sprint.** El monitoreo en vivo y el seguimiento de pedidos de la bodega muestran el aviso *Próximamente*, al igual que las acciones de las operaciones e incidencias que todavía no expone el API.

<img src="assets/chapter5/sprint3/app-monitoring.png" alt="Vista de monitoreo con el aviso Próximamente" width="800">

<img src="assets/chapter5/sprint3/app-tracking.png" alt="Vista Mis pedidos de la bodega con el aviso Próximamente" width="800">

<a id="5236-services-documentation-evidence-for-sprint-review"></a>

#### 5.2.3.6. Services Documentation Evidence for Sprint Review.

Los Web Services se documentan con OpenAPI. ASP.NET Core genera el documento en `/openapi/v1.json` y Scalar lo presenta en `/scalar`, donde cada endpoint se puede ejecutar con sus parámetros y ver su respuesta. La documentación publicada se encuentra en https://bottle-track-web-services-production.up.railway.app/scalar. El repositorio es https://github.com/1ASI0730-2620-8084-CodeCrafters/bottle-track-web-services y los commits de cada contexto se registran en la sección 5.2.3.4.

Todos los endpoints siguen las mismas convenciones:

- Las rutas se escriben en kebab-case y en plural bajo el prefijo `/api/v1`, por ejemplo `/api/v1/transport-operations`.
- Los cambios de estado se modelan como la creación de un recurso con un sustantivo en plural, mediante `POST`: el inicio de sesión crea un token en `/api/v1/tokens`, y el despacho de una operación, la atención de una alerta, la resolución de una incidencia y la asignación de un rol se registran en `/dispatches`, `/acknowledgments`, `/resolutions` y `/roles`.
- Los cuerpos de las solicitudes y de las respuestas usan JSON, con propiedades en camelCase y valores de enumeraciones en snake_case, por ejemplo `"fleet_supervisor"` o `"temperature_out_of_range"`.
- Las respuestas de error usan el formato `ProblemDetails` (RFC 9110), con un mensaje traducido al idioma de la cabecera `Accept-Language` (inglés o español).
- `201 Created` indica un registro nuevo e incluye su ubicación; `400` indica datos inválidos; `404`, un recurso inexistente; `409`, un dato único repetido o un cambio de estado no permitido; y `401`, credenciales incorrectas.

<img src="assets/chapter5/sprint3/scalar-overview.png" alt="Scalar con los endpoints de los Web Services agrupados por recurso" width="800">

La documentación cubre 41 endpoints, organizados por bounded context:

Cada tabla indica el verbo HTTP, la ruta, el propósito, los parámetros de ruta o de consulta y si la solicitud lleva un cuerpo JSON, y los códigos de respuesta posibles. El esquema de cada cuerpo y de cada respuesta se consulta en Scalar, y los ejemplos que siguen muestran dos respuestas completas.

**Identity and Access Management** (11 endpoints)

| Verbo | Endpoint | Descripción | Parámetros | Respuestas |
| :----- | :---------------------------- | :--------------------------------- | :--------------- | :---------- |
| POST | `/api/v1/tokens` | Valida el correo y la contraseña y devuelve el usuario autenticado con su token JWT. | cuerpo JSON | 200, 401 |
| POST | `/api/v1/organizations` | Registra una empresa distribuidora; el RUC no puede repetirse. | cuerpo JSON | 201, 400, 409 |
| GET | `/api/v1/organizations/{id}` | Devuelve una empresa por su identificador. | `id` (ruta) | 200, 404 |
| PUT | `/api/v1/organizations/{id}` | Actualiza la razón social, el teléfono y la dirección de la empresa. | `id` (ruta), cuerpo JSON | 200, 400, 404 |
| POST | `/api/v1/users` | Registra un usuario de la empresa con su rol; el correo no puede repetirse. | cuerpo JSON | 201, 400, 404, 409 |
| GET | `/api/v1/users` | Lista los usuarios de una empresa. | `organizationId` (query) | 200 |
| GET | `/api/v1/users/{id}` | Devuelve un usuario por su identificador. | `id` (ruta) | 200, 404 |
| PUT | `/api/v1/users/{id}` | Actualiza el nombre, el apellido y el correo de un usuario. | `id` (ruta), cuerpo JSON | 200, 400, 404, 409 |
| POST | `/api/v1/users/{id}/roles` | Asigna un nuevo rol a un usuario. | `id` (ruta), cuerpo JSON | 200, 404 |
| GET | `/api/v1/roles` | Lista los roles disponibles en la plataforma. | — | 200 |
| GET | `/api/v1/roles/{role}/users` | Lista los usuarios de una empresa que tienen el rol indicado. | `role` (ruta), `organizationId` (query) | 200, 404 |

**Fleet Management** (8 endpoints)

| Verbo | Endpoint | Descripción | Parámetros | Respuestas |
| :----- | :---------------------------- | :--------------------------------- | :--------------- | :---------- |
| POST | `/api/v1/vehicles` | Registra un vehículo; la placa no puede repetirse. | cuerpo JSON | 201, 400, 409 |
| GET | `/api/v1/vehicles` | Lista los vehículos de una empresa; con `onlyAvailable=true`, solo los disponibles. | `organizationId` (query), `onlyAvailable` (query) | 200 |
| GET | `/api/v1/vehicles/{id}` | Devuelve un vehículo por su identificador. | `id` (ruta) | 200, 404 |
| PUT | `/api/v1/vehicles/{id}` | Actualiza la marca, el modelo y la capacidad en cajas de un vehículo y, de forma opcional, lo envía a mantenimiento o lo devuelve al servicio. | `id` (ruta), cuerpo JSON | 200, 400, 404, 409 |
| POST | `/api/v1/drivers` | Registra un conductor; el DNI y la licencia no pueden repetirse. | cuerpo JSON | 201, 400, 409 |
| GET | `/api/v1/drivers` | Lista los conductores de una empresa; con `onlyAvailable=true`, solo los disponibles. | `organizationId` (query), `onlyAvailable` (query) | 200 |
| GET | `/api/v1/drivers/{id}` | Devuelve un conductor por su identificador. | `id` (ruta) | 200, 404 |
| PUT | `/api/v1/drivers/{id}` | Actualiza el nombre, el apellido y el teléfono de un conductor y, de forma opcional, lo desactiva o lo vuelve a activar. | `id` (ruta), cuerpo JSON | 200, 400, 404, 409 |

**Operations and Routes** (8 endpoints)

| Verbo | Endpoint | Descripción | Parámetros | Respuestas |
| :----- | :---------------------------- | :--------------------------------- | :--------------- | :---------- |
| POST | `/api/v1/delivery-points` | Registra un punto de entrega (bodega o minimarket), opcionalmente con su responsable y su ubicación. | cuerpo JSON | 201, 400 |
| GET | `/api/v1/delivery-points` | Lista los puntos de entrega de una empresa. | `organizationId` (query) | 200 |
| GET | `/api/v1/delivery-points/{id}` | Devuelve un punto de entrega por su identificador. | `id` (ruta) | 200, 404 |
| POST | `/api/v1/transport-operations` | Crea una operación de transporte en estado pendiente, con un código correlativo `OP-00000`. | cuerpo JSON | 201, 400 |
| GET | `/api/v1/transport-operations` | Lista las operaciones de una empresa con sus paradas. | `organizationId` (query) | 200 |
| POST | `/api/v1/transport-operations/{id}/delivery-stops` | Agrega una parada a una operación pendiente, con su número de secuencia y la cantidad planificada. | `id` (ruta), cuerpo JSON | 200, 400, 404 |
| POST | `/api/v1/transport-operations/{id}/dispatches` | Despacha la operación con un vehículo y un conductor. | `id` (ruta), cuerpo JSON | 200, 404 |
| GET | `/api/v1/transport-operations/{id}` | Devuelve una operación con sus paradas. | `id` (ruta) | 200, 404 |

**IoT Monitoring** (9 endpoints)

| Verbo | Endpoint | Descripción | Parámetros | Respuestas |
| :----- | :---------------------------- | :--------------------------------- | :--------------- | :---------- |
| POST | `/api/v1/iot-devices` | Registra un dispositivo IoT con su rango seguro de temperatura y su umbral de impacto; el número de serie no puede repetirse. | cuerpo JSON | 201, 400, 409 |
| GET | `/api/v1/iot-devices` | Lista los dispositivos IoT. | — | 200 |
| GET | `/api/v1/iot-devices/{id}` | Devuelve un dispositivo por su identificador. | `id` (ruta) | 200, 404 |
| POST | `/api/v1/sensor-readings` | Registra una lectura simulada de ubicación, temperatura y fuerza de impacto. | cuerpo JSON | 201, 400 |
| GET | `/api/v1/sensor-readings` | Lista las lecturas de un dispositivo. | `iotDeviceId` (query) | 200 |
| POST | `/api/v1/alerts` | Levanta una alerta de un dispositivo sobre una operación. | cuerpo JSON | 201, 400 |
| GET | `/api/v1/alerts` | Lista las alertas de un dispositivo. | `iotDeviceId` (query) | 200 |
| POST | `/api/v1/alerts/{id}/acknowledgments` | Registra la atención de una alerta por un usuario. | `id` (ruta), cuerpo JSON | 200, 404 |
| GET | `/api/v1/alerts/{id}` | Devuelve una alerta por su identificador. | `id` (ruta) | 200, 404 |

**Incident Management** (5 endpoints)

| Verbo | Endpoint | Descripción | Parámetros | Respuestas |
| :----- | :---------------------------- | :--------------------------------- | :--------------- | :---------- |
| POST | `/api/v1/incidents` | Reporta una incidencia sobre una operación, con un código correlativo `INC-00000`. | cuerpo JSON | 201, 400 |
| GET | `/api/v1/incidents` | Lista las incidencias de una operación. | `transportOperationId` (query) | 200 |
| POST | `/api/v1/incidents/{id}/evidences` | Agrega una evidencia, como enlace al archivo, a una incidencia. | `id` (ruta), cuerpo JSON | 200, 400, 404 |
| PUT | `/api/v1/incidents/{id}/resolution` | Registra la resolución de una incidencia. | `id` (ruta), cuerpo JSON | 200, 400, 404 |
| GET | `/api/v1/incidents/{id}` | Devuelve una incidencia con sus evidencias. | `id` (ruta) | 200, 404 |

**Ejemplo 1: inicio de sesión.** La solicitud envía el correo y la contraseña:

```json
POST /api/v1/tokens
{ "email": "supervisor@codecrafters.pe", "password": "********" }
```

La respuesta `200 OK` devuelve los datos del usuario autenticado, su empresa, su rol y el token JWT que la aplicación guarda para la sesión:

```json
{
  "id": "175aa1e9-ef95-438e-b42e-9ad5ffae3525",
  "organizationId": "1fc1634e-b939-468c-9aca-f8ff413f6ff2",
  "email": "supervisor@codecrafters.pe",
  "firstName": "Sofia",
  "lastName": "Ramos",
  "role": "fleet_supervisor",
  "status": "active",
  "token": "eyJhbGciOiJIUzI1NiIsInR5..."
}
```

Si la contraseña no es correcta, la respuesta es `401 Unauthorized` con el detalle "El correo o la contraseña no son correctos." cuando la cabecera `Accept-Language` es `es`.

<img src="assets/chapter5/sprint3/scalar-tokens.png" alt="Endpoint de inicio de sesión en Scalar" width="800">

**Ejemplo 2: operaciones de una empresa.** `GET /api/v1/transport-operations?organizationId=…` devuelve `200 OK` con la lista de operaciones. Cada una incluye su código correlativo, la fecha programada, el vehículo y el conductor asignados, su estado y sus paradas (`deliveryStops`) con el número de secuencia, la cantidad planificada y la entregada y el estado de cada entrega. La captura muestra la ejecución del endpoint desde Scalar.

<img src="assets/chapter5/sprint3/scalar-transport-operations.png" alt="Ejecución del endpoint GET transport-operations en Scalar con su respuesta" width="800">

<a id="5237-software-deployment-evidence-for-sprint-review"></a>

#### 5.2.3.7. Software Deployment Evidence for Sprint Review.

| Producto | Repositorio | Plataforma | Versión publicada | Estado en la entrega de AV2 |
| :------- | :---------- | :--------- | :---------------- | :-------------------------- |
| Landing Page | bottle-track-website | Netlify | v1.2.1 | Publica los planes de suscripción, cuyos botones llevan al registro de la Web Application con el plan elegido, la sección del equipo con sus fotografías, los videos About-the-Product y About-the-Team, la página de contacto y la política de privacidad y los términos actualizados. |
| Frontend Web Application | bottle-track-web-application | Vercel | v1.2.0 | Consume los Web Services publicados en Railway. Incorpora el registro de una nueva empresa con su administrador y su plan de suscripción, y un pie de página con el enlace al Landing Page. |
| Web Services | bottle-track-web-services | Railway | v2.0.0 | Publicado junto con su base de datos MySQL en Railway, con la configuración por variables de entorno descrita en la sección 5.1.4. La documentación se consulta con Scalar. |

El Landing Page se encuentra en https://1asi0730-2620-8084-codecrafters.netlify.app/, la Web Application en https://frontend-web-aplication.vercel.app y los Web Services en https://bottle-track-web-services-production.up.railway.app, con su documentación en https://bottle-track-web-services-production.up.railway.app/scalar. Las tres direcciones se verificaron en la entrega de AV2.

<a id="5238-team-collaboration-insights-during-sprint"></a>

#### 5.2.3.8. Team Collaboration Insights during Sprint.

La siguiente tabla resume los commits de cada integrante en el Sprint 3, sin considerar los commits de integración de ramas:

| Integrante | bottle-track-web-services | bottle-track-website | bottle-track-report |
| :--------- | :-----------------------: | :------------------: | :-----------------: |
| Crispin Valdivia, Angel Gabriel | 17 | 1 | 5 |
| Cumba Rengifo, Leonardo Raul | 3 | 1 | 8 |
| Palacin Lazo, Gerardo Valentin | 3 | 2 | 11 |
| Pezo Castilla, Maria Jose | 4 | 8 | 2 |
| Huapaya Buitron, Ariana Alheli | 0 | 0 | 0 |

Los cuatro integrantes que participaron en el Sprint contribuyeron en los tres repositorios. En los Web Services, cada uno implementó una parte de Identity and Access Management o de Fleet Management, según la distribución por bounded context.

<a id="53-validation-interviews"></a>

## 5.3. Validation Interviews.

Las entrevistas de validación se realizan cuando los segmentos objetivo pueden interactuar con el Landing Page y con la Web Application desplegados. En esta sección se presenta su diseño y el registro de las entrevistas realizadas sobre la primera versión de la Web Application.

<a id="531-diseno-de-entrevistas"></a>

### 5.3.1. Diseño de Entrevistas.

El diseño consideró entrevistar a entre 3 y 5 representantes por segmento objetivo, preferentemente los mismos participantes de las entrevistas de Needfinding, para contrastar su situación actual con la experiencia que ofrece BottleTrack. Cada sesión se graba en video con la autorización del participante y comienza con la navegación libre del Landing Page, seguida de la ejecución de las tareas de su segmento en la Web Application.

| Segmento | Escenario | Tareas que realiza el participante |
| :------- | :-------- | :--------------------------------- |
| Empresas distribuidoras de bebidas | El administrador revisa cómo terminó la jornada. | Encontrar en el Landing Page la llamada a la acción de su segmento. Consultar los indicadores del dashboard. Revisar el detalle de una operación finalizada y su merma. |
| Supervisores o encargados de flota | El supervisor organiza y sigue la jornada. | Crear una operación con vehículo, conductor y tres puntos de entrega. Registrar una entrega parcial. Registrar una incidencia con una fotografía. Consultar el progreso de la operación. |
| Bodegas y minimarkets | La bodega espera su pedido. | Consultar el estado de su pedido. Reportar un faltante al recibirlo. |

Al finalizar las tareas se formulan las siguientes preguntas:

| # | Pregunta |
| :- | :------- |
| 1 | ¿Qué fue lo primero que entendió que hace BottleTrack al ingresar al sitio? |
| 2 | ¿En qué momento dudó sobre qué hacer a continuación? |
| 3 | ¿Qué información esperaba encontrar y no encontró? |
| 4 | ¿Cómo compara esta forma de trabajo con la que utiliza hoy? |
| 5 | ¿Qué cambiaría para utilizarlo durante su jornada? |

<a id="532-registro-de-entrevistas"></a>

### 5.3.2. Registro de Entrevistas.

El registro sigue el mismo formato de la sección 2.2.2. Las entrevistas las realizó Leonardo Cumba el 2026-11-11, de forma virtual, con participantes de las entrevistas de Needfinding, para contrastar su situación actual con la experiencia que ofrece BottleTrack. En este Sprint se entrevistó a un representante del segmento de empresas distribuidoras de bebidas y a dos del segmento de bodegas y minimarkets; el segmento de supervisores o encargados de flota no fue entrevistado. Cada entrevista se grabó en un video independiente publicado en YouTube, por lo que todas inician en el minuto 00:00:00.

**Segmento Objetivo 1: Empresas distribuidoras de bebidas**

| # | Nombres y Apellidos | Edad | Distrito | Screenshot | URL del video | Inicio | Duración |
| :- | :------------------ | :--- | :------- | :--------- | :------------ | :----- | :------- |
| 1 | Luis Angel Tufiño Argüelles | 32 años | Pueblo Libre | <img src="assets/chapter5/validation/validation-luis-tufino.png" alt="Entrevista de validación con Luis Angel Tufiño Argüelles"> | [Ver video en YouTube](https://youtu.be/vnJYp37qBu0) | 00:00:00 | 13:32 |

*Resumen de entrevista 1:*

Luis Ángel Tufiño, supervisor de distribución con ocho años de experiencia, representa al segmento de empresas distribuidoras de bebidas. Hoy coordina pedidos, vehículos, conductores y rutas con Excel, Google Maps, WhatsApp y llamadas, lo que dificulta centralizar la información y supervisar varias entregas a la vez.

Destaca la utilidad de BottleTrack para consultar el avance de las entregas, organizar los recursos y registrar incidencias como productos dañados o entregas parciales. Considera prioritario contar con estados actualizados, evidencias de los problemas y reportes por fecha y por ruta. Su disposición a adoptar la plataforma depende de la facilidad de uso, la confiabilidad de los datos, el costo y la capacitación necesaria, y propone realizar una prueba con una parte de la operación para evaluar sus beneficios.

**Segmento Objetivo 3: Bodegas y minimarkets**

| # | Nombres y Apellidos | Edad | Distrito | Screenshot | URL del video | Inicio | Duración |
| :- | :------------------ | :--- | :------- | :--------- | :------------ | :----- | :------- |
| 1 | Arturo Axel Saravia Huaricancha | 20 años | Los Olivos | <img src="assets/chapter5/validation/validation-arturo-saravia.png" alt="Entrevista de validación con Arturo Axel Saravia Huaricancha"> | [Ver video en YouTube](https://youtu.be/5J2oE865qiQ) | 00:00:00 | 07:59 |
| 2 | Leo Giovany Yañez Santos | 23 años | Pueblo Libre | <img src="assets/chapter5/validation/validation-leo-yanez.png" alt="Entrevista de validación con Leo Giovany Yañez Santos"> | [Ver video en YouTube](https://youtu.be/8L-3LssywR0) | 00:00:00 | 07:48 |

*Resumen de entrevista 1:*

Arturo, responsable de bodega, coordina sus pedidos mediante WhatsApp y llamadas. Sus principales dificultades son la incertidumbre sobre el horario de llegada, los retrasos y la recepción de productos faltantes o dañados. Considera útil consultar el estado del pedido y las paradas pendientes para organizar el espacio y prepararse para recibir las bebidas. Usaría BottleTrack principalmente desde el celular y necesita información actualizada, avisos de retrasos y una opción para registrar reclamos con fotografías y consultar su atención.

*Resumen de entrevista 2:*

Leo participa en la revisión de existencias, la reposición de productos y la recepción de mercadería. Identifica como dificultades la llegada simultánea de proveedores y las diferencias entre las cantidades solicitadas y las recibidas. Valora consultar las entregas en un solo lugar para coordinar al personal sin descuidar la atención al público, y propone filtros por proveedor y fecha, avisos sobre cambios en las cantidades y claridad en las marcas, presentaciones y unidades de los productos. Su disposición a utilizar BottleTrack depende de su facilidad de uso desde el celular y de la confiabilidad de la información.

**Conclusiones de las entrevistas de validación**

Los participantes confirman la necesidad de mejorar la información disponible durante la entrega de bebidas. En el segmento de distribuidoras, BottleTrack centraliza el seguimiento de las entregas, los recursos y las incidencias que hoy se reparten entre Excel, Google Maps, WhatsApp y llamadas. En el segmento de bodegas, el seguimiento del pedido facilita organizar la recepción y reduce las llamadas a los proveedores.

Las oportunidades de mejora que se desprenden de las entrevistas son:

- Presentar con claridad los estados y las cantidades de cada entrega.
- Comunicar oportunamente los retrasos y los cambios en las cantidades.
- Permitir el registro de reclamos con fotografías y el seguimiento de su atención.
- Ofrecer reportes por fecha y por ruta, y filtros por proveedor y fecha.

La facilidad de uso desde el celular y la confiabilidad de los datos son los factores que más pesan en la adopción. Estos hallazgos coinciden con las funciones que pasan al siguiente Sprint, en particular el seguimiento de pedidos de la bodega con el reporte de problemas de recepción y el registro del resultado de cada entrega.

<a id="533-evaluaciones-segun-heuristicas"></a>

### 5.3.3. Evaluaciones según heurísticas.

La evaluación aplica las diez heurísticas de usabilidad de Nielsen sobre el Landing Page y la Web Application, con la escala de severidad del curso: 1, problema cosmético; 2, problema menor; 3, problema mayor; 4, problema muy grave. Cada problema se documenta con su descripción, la heurística que incumple, una captura y la recomendación de solución, y se resume en una tabla con las columnas #, Problema, Severidad y Heurística o principio violado.

La evaluación según heurísticas pasa al Sprint 4 (tarea T42), para aplicarla sobre la versión publicada de la Web Application integrada con los Web Services.

<a id="54-video-about-the-product"></a>

## 5.4. Video About-the-Product.

El video About-the-Product presenta BottleTrack a los visitantes del Landing Page: el problema que resuelve, a quién está dirigido y sus funcionalidades principales. Tiene una duración de entre 1 y 3 minutos, se publica en Microsoft Stream y en YouTube y se incrusta en el Landing Page. Se produjo en el Sprint 3 sobre la presentación del producto, con las vistas de la Web Application en funcionamiento.

| Video | Nombre del archivo | Duración | URL |
| :---- | :----------------- | :------- | :-- |
| About-the-Product | upc-pre-202620-1asi0730-8084-codecrafters-about-the-product-sprint-3 | 03:53 | [Ver video en YouTube](https://youtu.be/o26x4zDOFbk) |

<img src="assets/chapter5/videos/about-the-product-youtube.png" alt="Video About-the-Product publicado en YouTube" width="800">

El video recorre la presentación del producto y cada integrante narra una sección:

| Inicio | Fin | Sección | Presenta |
| :----- | :-- | :------ | :------- |
| 00:00 | 00:44 | Problema de las distribuidoras, solución en tres pasos y los tres roles de la plataforma | Crispin Valdivia, Angel Gabriel |
| 00:44 | 01:37 | Recorrido por la aplicación: inicio de sesión, dashboard, vehículos y conductores | Cumba Rengifo, Leonardo Raul |
| 01:37 | 03:01 | Dispositivos IoT, usuarios y roles, operaciones, detalle de la operación y monitoreo IoT | Palacin Lazo, Gerardo Valentin |
| 03:01 | 03:53 | Incidencias, historial, seguimiento de pedidos de la bodega, uso desde el celular y cierre | Pezo Castilla, Maria Jose |



---

[← Capítulo IV](40-chapter-4-product-design.md) · [Contenido](../README.md#contenido) · [Conclusiones →](90-conclusions.md)