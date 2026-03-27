# Conociendo Xcode

## Qué es Xcode

Xcode es el entorno de desarrollo integrado oficial de Apple (`IDE`, Integrated Development Environment), y se utiliza para crear aplicaciones para iOS, macOS, watchOS, tvOS y otras plataformas de Apple.

![Swift](../../RESOURCE/001_xcode.png)

Durante todo este curso usaremos Xcode para escribir código y ejecutar programas.

En esta lección aprenderemos cómo descargar Xcode, cómo crear nuestra primera aplicación para iOS y cómo conocer de manera inicial la estructura de su interfaz.

## Descargar Xcode

Actualmente hay dos formas de instalar Xcode:

1. Descargarlo desde la [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)
2. Descargarlo desde el [sitio oficial de Apple Developer](https://developer.apple.com/xcode/)

Ambas opciones sirven para descargar Xcode. La diferencia es que en el sitio oficial de Apple Developer, además de la versión estable, también se pueden descargar versiones [Beta](https://developer.apple.com/download/all/?q=Xcode) o versiones históricas.

Si solo estás aprendiendo a desarrollar, se recomienda usar la versión estable. Las versiones Beta se utilizan principalmente para probar funciones nuevas y pueden ser inestables.

## Crear el primer proyecto

Después de abrir Xcode, verás la pantalla de inicio.

![Swift](../../RESOURCE/001_xcode1.png)

En la parte izquierda hay tres opciones comunes:

- `Create New Project` — crear un proyecto nuevo
- `Clone Git Repository` — clonar un repositorio Git
- `Open Existing Project` — abrir un proyecto existente

En la parte derecha se muestran los proyectos de Xcode abiertos recientemente.

Elegimos la opción `Create New Project`.

### Elegir una plantilla de proyecto

![Swift](../../RESOURCE/001_xcode2.png)

Entraremos en la pantalla de selección de plantillas. Aquí se muestran varias plataformas (`iOS`, `macOS`, etc.) y distintos tipos de plantillas de proyecto.

Descripción de las plantillas más comunes:

- `App` — el tipo de aplicación más básico (recomendado)
- `Document App` — aplicación basada en documentos
- `Game` — para desarrollo de juegos
- `Framework` — módulo reutilizable

En la etapa inicial solo elegiremos la plantilla `iOS` - `App`, porque es el tipo de aplicación con interfaz gráfica.

Haz clic en `Next`.

### Completar la información del proyecto

Entraremos en la pantalla para rellenar la información del proyecto. Debemos completar los campos según su tipo.

![Swift](../../RESOURCE/001_xcode3.png)

Significado de cada campo:

- `Product Name` — nombre del proyecto, por ejemplo: `SwiftSlimTest`
- `Team` — equipo de desarrollador; si no tienes una cuenta de pago de Apple Developer, puedes dejarlo vacío
- `Organization Identifier` — identificador de organización, normalmente en formato de dominio invertido, por ejemplo:
  - `com.yourname`
  - `com.yourcompany`
  - Si no tienes un dominio, puedes usar tu propio nombre en inglés como identificador
- `Bundle Identifier` — identificador único de la app; se genera automáticamente a partir de `Organization Identifier` y `Product Name`
- `Interface` — tecnología de interfaz, elige `SwiftUI`
- `Language` — lenguaje de desarrollo, elige `Swift`
- `Testing System` — por defecto crea un target de pruebas (`Unit Tests`), que ignoraremos por ahora
- `Storage` — framework de persistencia local que puede integrar automáticamente `SwiftData` o `Core Data`; también lo ignoraremos en esta etapa

Cuando termines, haz clic en `Next`.

### Guardar el proyecto

![Swift](../../RESOURCE/001_xcode4.png)

Elige una carpeta adecuada para guardar el proyecto.

Haz clic en el botón `Create` y Xcode generará automáticamente la estructura del proyecto.

## Estructura del proyecto en Xcode

Después de guardar el proyecto, en Finder podrás ver la carpeta generada por Xcode.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` — carpeta para guardar imágenes, iconos de la app y otros recursos
- `ContentView.swift` — archivo de vista SwiftUI generado por defecto; más adelante escribiremos aquí el código de la interfaz
- `SwiftSlimTestApp.swift` — archivo de entrada de la aplicación (`App Entry Point`), encargado de iniciar la app; por ahora no hace falta entenderlo
- `SwiftSlimTest.xcodeproj` — archivo del proyecto de Xcode; haz doble clic sobre él para abrir el proyecto

## Conocer la interfaz de Xcode

Haz doble clic en el archivo `.xcodeproj` para abrir el proyecto y, en la zona `Navigator` de la izquierda, selecciona `ContentView.swift`.

La interfaz de Xcode se divide principalmente en cinco áreas:

- `Navigator` — zona de navegación, usada para ver la estructura de archivos y buscar
- `Editor` — zona de edición, usada para escribir código Swift o SwiftUI
- `Canvas` — zona del lienzo, usada para la vista previa de SwiftUI
- `Inspector` — zona de inspección de propiedades, usada para ver y modificar atributos del archivo
- `Debug Area` — zona de depuración, donde se ven los logs de salida

![Swift](../../RESOURCE/001_xcode6.png)

Nota: `Canvas` se utiliza principalmente para la vista previa de las vistas SwiftUI. Desde la arquitectura oficial de Xcode, en realidad es un panel auxiliar de previsualización del `Editor` (`Preview Pane`). Solo se puede activar al abrir archivos de vistas SwiftUI; otros tipos de archivos no mostrarán la función de vista previa.

En las siguientes lecciones, trabajaremos sobre todo en la zona `Editor` para escribir código Swift y SwiftUI.

La primera vez que abras un proyecto de Xcode, `Inspector` y `Debug Area` pueden estar ocultos por defecto. Puedes mostrarlos haciendo clic en los botones de la esquina superior derecha y la esquina inferior derecha.

![Swift](../../RESOURCE/001_xcode7.png)

Consejo: la zona `Inspector` se usa principalmente para ver y modificar propiedades de archivos. En desarrollo real, normalmente se oculta para obtener más espacio de edición.

## Resumen

En esta lección aprendimos cómo descargar Xcode, crear nuestro primer proyecto de Xcode y conocer la distribución básica de su interfaz.

Ahora llega el momento de explorar libremente:

- Puedes intentar crear y eliminar archivos en la zona `Navigator`.
- Revisar el código del área `Editor` y observar su estructura.
- Probar los botones del área `Canvas` para ampliar o reducir la vista previa.

En la siguiente lección empezaremos a escribir algo de código sencillo y seguiremos conociendo mejor Xcode.
