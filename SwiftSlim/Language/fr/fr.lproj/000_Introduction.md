# Introduction

## Qu'est-ce que Swift ?

Avant d'apprendre Swift, commençons par découvrir brièvement ce langage de programmation. Swift est un langage moderne développé par Apple, principalement utilisé pour créer des applications sur les plateformes Apple comme iOS, macOS, iPadOS et watchOS.

![Swift](../../RESOURCE/000_swift.png)

Comparé à d'autres langages, Swift possède une syntaxe plus concise et met davantage l'accent sur la sécurité et la lisibilité. Avec SwiftUI, il est aussi plus facile à apprendre et à comprendre. Bien sûr, je n'avais moi-même jamais appris d'autre langage auparavant, donc cela peut être un peu plus difficile que HTML.

Swift ne sert pas seulement à développer des applications pour les plateformes Apple. La communauté Swift travaille aussi à porter Swift sur [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), et même à l'utiliser sur des [serveurs](https://github.com/awslabs/swift-aws-lambda-runtime) ou dans d'autres environnements. À long terme, Swift dispose donc d'un plus grand potentiel de développement et pourrait devenir un langage multiplateforme comparable à Flutter ou React Native.

## Contenu de l'apprentissage

Ce tutoriel se concentre principalement sur les bases de Swift et de SwiftUI.

Nous commencerons par des notions simples comme les variables et les types de données, nous construirons des interfaces avec SwiftUI, nous comprendrons comment les données sont stockées et lues, puis nous pourrons aller plus loin vers des sujets avancés comme SwiftData ou la synchronisation iCloud.

Chaque chapitre s'appuiera sur un cas concret afin d'apprendre Swift dans un contexte pratique.

Certains tutoriels choisissent d'abord d'expliquer une grande quantité de syntaxe et d'API avant de passer à la pratique sur projet. Pour un débutant, c'est un peu comme apprendre des mots dans un dictionnaire sans contexte d'utilisation : on finit facilement par perdre l'intérêt.

Dans ce tutoriel, nous apprendrons les connaissances directement dans des situations réelles de développement, en partant des besoins pour introduire les notions correspondantes.

À la fin de ce tutoriel, vous serez capable de développer et d'exécuter une application de base de manière autonome, de l'installer sur vos appareils iOS / macOS, et même de la publier sur l'App Store.

## Comment apprendre en partant de zéro ?

Au début, moi aussi je partais de zéro. J'ai d'abord regardé quelques vidéos de formation Swift sur YouTube, comme cette [playlist d'apprentissage Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3), et j'ai découvert que développer des applications iOS n'était pas si compliqué, ce qui m'a donné envie d'aller plus loin. Ensuite, j'ai commencé à apprendre davantage sur Swift, par exemple en essayant les jeux de programmation dans [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), en lisant la [documentation officielle de Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/), et en étudiant [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Avec le recul, c'est surtout [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) qui m'a fourni une structure d'apprentissage me permettant d'étudier SwiftUI de manière systématique. Mais comme le tutoriel est en anglais et que je manquais de bases en programmation, j'ai rencontré énormément de difficultés pour comprendre certains points. Pour cela, j'ai utilisé des IA comme [ChatGPT](https://chatgpt.com/) et [Claude](https://claude.ai/?redirect=claude.com) pour m'aider à assimiler les notions.

Pendant l'apprentissage, il est inévitable de rencontrer des notions difficiles à comprendre. Je me souviens par exemple qu'en apprenant `UserDefaults`, je savais seulement comment sauvegarder des données, sans savoir qu'il fallait ensuite les relire manuellement, au point de douter de mon code. Même pour une notion aussi simple, j'ai perdu plusieurs jours.

On peut aussi citer des notions comme les closures, le thread principal ou les génériques. Au début, comme je ne les comprenais pas en profondeur, chaque fois que je les retrouvais dans le développement réel, je devais de nouveau investir du temps pour les réapprendre.

C'est pourquoi je recommande :

**1. Compléter les connaissances de base**

En chinois, on dit : « le plus difficile, c'est de commencer ». Pour les débutants complets en Swift, il est normal de rencontrer des notions difficiles pendant l'apprentissage. Souvent, le problème ne vient pas de la complexité de la notion elle-même, mais du fait qu'à la base de cette pyramide de connaissances, il existe encore des concepts plus fondamentaux auxquels le débutant n'a pas encore été exposé.

Dans ce type de situation, vous pouvez envisager d'utiliser des outils d'IA comme [ChatGPT](https://chatgpt.com/) et [Claude](https://claude.ai/?redirect=claude.com) pour combler rapidement les bases manquantes.

**2. Comprendre chaque notion**

Pendant l'apprentissage, le plus important est d'essayer de comprendre chaque notion, même si cela demande plusieurs jours.

Si vous choisissez d'ignorer une partie que vous ne comprenez pas, il est très probable que vous la retrouviez plus tard dans le développement, où elle finira par bloquer votre progression. Vous devrez alors y revenir de toute façon. Mieux vaut comprendre les connaissances clairement dès la phase d'apprentissage.

Chaque notion est en réalité un outil. Plus vous maîtrisez d'outils, plus vous êtes capable de résoudre des problèmes.

C'est comme construire une maison : si vous n'avez qu'un seul outil, vous pourrez peut-être faire l'essentiel, mais face à des exigences de qualité plus élevées, vous vous sentirez vite limité. En maîtrisant plus d'outils, vous pouvez construire une maison plus solide.

**3. Garder une continuité dans l'apprentissage**

Apprendre demande de la persévérance sur le long terme. Peu de gens sont réellement prêts à consacrer plusieurs mois à suivre sérieusement un tutoriel. Il est plus important d'investir régulièrement du temps que de travailler très intensément sur une courte période.

Même si vous ne réalisez qu'un pour cent par jour, au bout de cent jours, vous aurez accompli l'ensemble de l'objectif.

## Vision éducative

Ce cours n'a pas pour but d'enseigner énormément de connaissances Swift et SwiftUI d'un seul coup, mais plutôt de conduire les débutants sur la voie de la programmation avec Swift. C'est un peu comme assembler des briques : le tutoriel vous montre comment les emboîter, puis le reste du temps vous sert à construire vos propres créations.

Le projet est déjà open source sur [GitHub](https://github.com/fangjunyu1/SwiftSlim) et peut être téléchargé et utilisé gratuitement. Une version App Store est également proposée pour l'essayer.

Nous espérons aider davantage de personnes sans bagage technique mais désireuses de changer de trajectoire professionnelle à découvrir de nouvelles possibilités grâce à l'apprentissage de la programmation et au développement d'applications.

## Mise à jour du contenu

Ce tutoriel est écrit sur la base de la version actuelle de Swift et SwiftUI.

Avec les mises à jour des plateformes et des outils Apple, certaines API peuvent évoluer. Si vous constatez un problème ou si un contenu doit être actualisé, vous pouvez consulter la documentation officielle ou la dernière version du dépôt open source.

---
Fang Junyu

2026-02-14  
