[← Capítulo V](50-chapter-5-product-implementation-validation-and-deployment.md) · [Contenido](../README.md#contenido) · [Bibliografía →](99-bibliography.md)

<a id="conclusiones"></a>

# Conclusiones

<a id="conclusiones-y-recomendaciones"></a>

## Conclusiones y recomendaciones.

### Conclusiones

1. La aplicación de Event Storming y Domain-Driven Design permitió identificar 5 Bounded Contexts claros (Identidad y Accesos, Gestión de Flota, Operaciones y Rutas, Monitoreo IoT, Gestión de Incidencias), lo que hizo posible diseñar BottleTrack como un monolito modular con responsabilidades bien separadas, en lugar de un backend monolítico sin fronteras internas definidas.

2. El alcance del producto no fue estático durante el desarrollo: la eliminación del rol de Conductor como usuario de la plataforma obligó a actualizar en cascada las User Stories, el Product Backlog, el Class Diagram y los mock-ups ya construidos. Esto evidenció que mantener sincronizados los artefactos de diseño con las decisiones de negocio es tan importante como generarlos la primera vez.

3. El Sprint 1 mostró una brecha entre lo planificado y lo entregado (27 story points comprometidos frente a 8 realmente completados): el equipo priorizó cerrar la documentación técnica y la Landing Page, dejando las pantallas de identidad, usuarios y empresa solo a nivel de diseño en Figma, sin pasar a implementación.

4. La revisión de AV1 mostró que cumplir la forma exacta de cada artefacto pesa tanto como su contenido. Por ello, el equipo reescribió el Problem Statement con la plantilla Brand new initiative, completó el Lean UX Canvas, analizó las entrevistas con variables y porcentajes, reordenó el Product Backlog según el valor para el negocio y rehízo los diagramas de clases y de base de datos con una sola convención de nombres en inglés.

### Recomendaciones

1. Cerrar el diseño en Figma de cada pantalla *antes* de comprometerla en un sprint de implementación, para evitar que el tiempo de desarrollo se use en decisiones de diseño pendientes.

2. Recalibrar la Sprint Velocity del equipo usando el dato real del Sprint 1 (8 puntos) en lugar de la capacidad estimada inicialmente (27), y reservar explícitamente horas para trabajo de documentación en la planificación de los siguientes sprints, en vez de tratarlo como actividad paralela sin costo.

3. Mantener la trazabilidad entre las secciones del informe cada vez que cambia una decisión. Tras la revisión de AV1, el equipo alineó los segmentos objetivo, los User Personas, las User Stories, el Landing Page y la arquitectura alrededor de las mismas tres decisiones: tres segmentos, el conductor como actor que no usa la aplicación y el monitoreo IoT dentro del alcance con lecturas simuladas.

<a id="video-about-the-team"></a>

## Video About-the-Team.

El video About-the-Team presenta a los integrantes de CodeCrafters, su motivación para construir BottleTrack y la forma en que el equipo trabajó en cada Sprint, incluyendo los testimonios que sustentan el Student Outcome. Tiene una duración aproximada de 5 minutos más 1 minuto por integrante, se publica en Microsoft Stream y en YouTube, y se incrusta en la sección *The team* del Landing Page.

<hr>

---

[← Capítulo V](50-chapter-5-product-implementation-validation-and-deployment.md) · [Contenido](../README.md#contenido) · [Bibliografía →](99-bibliography.md)