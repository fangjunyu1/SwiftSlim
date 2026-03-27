# Introducción

## ¿Qué es Swift?

Antes de aprender Swift, vamos a conocer brevemente este lenguaje de programación. Swift es un lenguaje moderno desarrollado por Apple, y se utiliza principalmente para crear aplicaciones en plataformas de Apple como iOS, macOS, iPadOS y watchOS.

![Swift](../../RESOURCE/000_swift.png)

En comparación con otros lenguajes, la sintaxis de Swift es más concisa y pone más énfasis en la seguridad y la legibilidad. Junto con SwiftUI, resulta más fácil de aprender y comprender. Claro, yo antes no había estudiado otros lenguajes de programación, así que quizá me pareció un poco más difícil que HTML.

Swift no solo permite desarrollar aplicaciones para las plataformas de Apple. La comunidad de Swift está trabajando para llevar Swift también a [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) e incluso para ejecutarlo en [servidores](https://github.com/awslabs/swift-aws-lambda-runtime) y otros entornos. A largo plazo, Swift tiene un margen de crecimiento mayor y en el futuro podría convertirse en un lenguaje multiplataforma similar a Flutter o React Native.

## Contenido de aprendizaje

Este tutorial se centra principalmente en los fundamentos de Swift y SwiftUI.

Comenzaremos con variables y tipos de datos sencillos, usaremos SwiftUI para construir interfaces, entenderemos cómo se almacenan y leen los datos, y al final quizá avancemos hacia temas más avanzados como SwiftData o la sincronización con iCloud.

Cada capítulo girará en torno a un caso práctico, para aprender Swift dentro de contextos reales de uso.

Algunos tutoriales explican primero una gran cantidad de sintaxis y APIs antes de pasar a proyectos reales. Para los principiantes, eso es como intentar aprender palabras de un diccionario sin contexto: memorizar mucho contenido sin aplicación práctica suele terminar desmotivando.

Este tutorial aprenderá los conocimientos dentro de escenarios reales de desarrollo, dejando que las necesidades concretas introduzcan los puntos de conocimiento relacionados.

Después de completar este tutorial, podrás desarrollar y ejecutar por tu cuenta una aplicación básica, instalarla en tus propios dispositivos iOS o macOS, e incluso publicar la aplicación en la App Store.

## ¿Cómo aprender desde cero?

Yo también empecé completamente desde cero. Al principio solo vi algunos videos de [Swift en YouTube](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3), y descubrí que desarrollar aplicaciones para iOS no era tan complicado, lo que despertó mi interés. Después empecé a aprender más sobre Swift, por ejemplo probando los juegos de programación de [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), leyendo la [documentación oficial de Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) y estudiando [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Mirándolo ahora, fue sobre todo [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) lo que me dio un marco de aprendizaje para estudiar SwiftUI de forma sistemática. Pero como el tutorial estaba en inglés y yo no tenía base de programación, me encontré con muchísimas dificultades para comprenderlo. Para eso, recurrí a herramientas de IA como [ChatGPT](https://chatgpt.com/) y [Claude](https://claude.ai/?redirect=claude.com) para ayudarme a entender los conceptos.

Durante el aprendizaje es inevitable encontrarse con conceptos difíciles. Recuerdo que al estudiar `UserDefaults`, solo sabía cómo guardar datos, pero no entendía que había que leerlos manualmente, así que llegué a sospechar que mi código estaba mal. Incluso un punto tan simple me hizo perder varios días.

Por ejemplo, también me ocurrió con conceptos como closures, el hilo principal o los genéricos. Como al principio no los entendía a fondo, cuando volvían a aparecer en el desarrollo real tenía que detenerme otra vez para reaprenderlos.

Por eso, mi consejo es el siguiente:

**1. Reforzar los conocimientos básicos**

En chino hay un dicho que dice: “lo más difícil es empezar”. Para quien aprende Swift desde cero, es normal encontrarse con conceptos difíciles de entender durante el proceso. Muchas veces no es que el concepto en sí sea demasiado complicado, sino que en la base de esa pirámide del conocimiento hay nociones aún más básicas que el principiante todavía no ha visto.

Cuando ocurra eso, puedes apoyarte en herramientas de IA como [ChatGPT](https://chatgpt.com/) y [Claude](https://claude.ai/?redirect=claude.com) para completar a tiempo esos conocimientos básicos que faltan.

**2. Entender cada concepto**

Durante el aprendizaje, lo más importante es intentar comprender cada punto de conocimiento, aunque haga falta dedicarle varios días.

Si decides saltarte lo que no entiendes, es muy probable que vuelvas a encontrártelo más adelante y termine bloqueando tu progreso en el desarrollo. Al final tendrás que volver a invertir tiempo para estudiarlo. En vez de arreglarlo tarde, es mejor entender bien los conceptos desde la etapa de aprendizaje.

Cada concepto es, en esencia, una herramienta: cuantas más herramientas domines, mayor será tu capacidad para resolver problemas.

Es como construir una casa. Si solo tienes una herramienta, quizá puedas terminar la mayor parte del trabajo, pero cuando se exija más calidad te faltarán recursos. Solo dominando más herramientas podrás construir una casa más sólida.

**3. Mantener un aprendizaje constante**

Aprender requiere constancia a largo plazo. Muy poca gente está realmente dispuesta a dedicar varios meses a estudiar un tutorial con seriedad. Es más importante seguir invirtiendo tiempo de forma continua que estudiar con intensidad solo durante un corto período.

Incluso si cada día completas solo el uno por ciento, en cien días podrás alcanzar todo el objetivo de aprendizaje.

## Visión educativa

Este curso no pretende enseñar una enorme cantidad de conocimientos de Swift y SwiftUI, sino guiar a los principiantes para que entren en el camino de la programación con Swift. Es como jugar con bloques de construcción: el tutorial te enseña cómo encajarlos, y después el resto depende de ti para construir tus propios proyectos.

El proyecto ya está disponible como código abierto en [GitHub](https://github.com/fangjunyu1/SwiftSlim), y puede descargarse y usarse gratuitamente. También existe una versión en la App Store para probarlo.

Esperamos ayudar a más personas sin formación técnica, pero con el deseo de cambiar su trayectoria profesional, a descubrir nuevas posibilidades a través del aprendizaje de la programación y el desarrollo de aplicaciones.

## Actualización del contenido

Este tutorial está escrito con base en la versión actual de Swift y SwiftUI.

Con las actualizaciones de las plataformas y herramientas de Apple, algunas APIs pueden cambiar. Si encuentras problemas o ves que algún contenido necesita actualizarse, puedes consultar la documentación oficial o la versión más reciente del repositorio de código abierto.

---
Fang Junyu

2026-02-14
