# Einführung

## Was ist Swift?

Bevor wir Swift lernen, verschaffen wir uns zunächst einen kurzen Überblick über die Programmiersprache Swift. Swift ist eine moderne Programmiersprache, die von Apple entwickelt wurde und hauptsächlich zum Erstellen von Apps für Apple-Plattformen wie iOS, macOS, iPadOS und watchOS verwendet wird.

![Swift](../../RESOURCE/000_swift.png)

Im Vergleich zu anderen Programmiersprachen ist die Syntax von Swift kompakt und legt mehr Wert auf Sicherheit und Lesbarkeit. In Kombination mit SwiftUI lässt sich Swift leichter lernen und verstehen. Natürlich hatte ich vorher keine anderen Programmiersprachen gelernt, daher ist es für mich vielleicht nur etwas schwieriger als HTML.

Swift kann nicht nur für Apps auf Apple-Plattformen verwendet werden. Die Swift-Community arbeitet daran, Swift auf die [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/)-Plattform zu portieren und sogar in anderen Umgebungen wie auf [Servern](https://github.com/awslabs/swift-aws-lambda-runtime) auszuführen. Langfristig betrachtet hat Swift viel Entwicklungspotenzial und könnte in Zukunft zu einer plattformübergreifenden Programmiersprache ähnlich wie Flutter oder React Native werden.

## Lerninhalte

Dieses Tutorial konzentriert sich hauptsächlich auf die Grundlagen von Swift und SwiftUI.

Wir beginnen mit einfachen Variablen und Datentypen, verwenden SwiftUI zum Erstellen von Oberflächen, verstehen, wie Daten gespeichert und gelesen werden, und lernen später möglicherweise auch fortgeschrittene Themen wie SwiftData und iCloud-Synchronisierung kennen.

Jedes Kapitel dreht sich um ein praktisches Beispiel, damit wir Swift-Wissen in echten Anwendungsszenarien lernen können.

Manche Tutorials erklären zuerst sehr viel Syntax und viele APIs und gehen erst danach in die Projektpraxis über. Für Anfänger ist das so, als würde ein Kind Wörter direkt aus dem Wörterbuch lernen. Wenn man sich ohne Anwendungsszenario zu viele Inhalte merken muss, verliert man am Ende leicht das Interesse.

In diesem Tutorial lernen wir Wissen direkt in praktischen Entwicklungsszenarien und führen die relevanten Konzepte aus konkreten Anforderungen heraus ein.

Nach Abschluss dieses Tutorials wirst du in der Lage sein, selbstständig eine einfache App zu entwickeln und auszuführen, sie auf deinem eigenen iOS- oder macOS-Gerät zu installieren und sie sogar im App Store zu veröffentlichen.

## Wie lernt man ohne Vorkenntnisse?

Ich selbst habe auch ohne Vorkenntnisse angefangen. Anfangs habe ich nur einige [Swift-Lernvideos](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) auf YouTube angesehen und festgestellt, dass die Entwicklung von iOS-Apps gar nicht so kompliziert ist. Das hat mein Interesse geweckt. Danach habe ich versucht, mehr über Swift zu lernen, zum Beispiel mit den Programmier-Spielen in [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), durch das Lesen der [offiziellen Swift-Dokumentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) und durch [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Rückblickend hat mir vor allem [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) einen Lernrahmen gegeben, mit dem ich SwiftUI systematisch lernen konnte. Da das Tutorial jedoch auf Englisch ist und mir Grundlagen der Programmierung fehlten, hatte ich beim Verstehen große Schwierigkeiten. Deshalb habe ich KI-Werkzeuge wie [ChatGPT](https://chatgpt.com/) und [Claude](https://claude.ai/?redirect=claude.com) genutzt, um mir beim Verstehen der Konzepte helfen zu lassen.

Während des Lernens stößt man zwangsläufig auf Dinge, die schwer zu verstehen sind. Ich erinnere mich zum Beispiel daran, dass ich bei UserDefaults nur wusste, wie man Daten speichert, aber nicht, dass man sie auch manuell wieder auslesen muss. Dadurch dachte ich sogar, mein Code hätte ein Problem. Selbst ein so einfaches Thema hat mich mehrere Tage gekostet.

Ähnlich war es mit Closures, dem Main Thread oder Generics. Weil ich diese Themen in der frühen Lernphase nicht wirklich verstanden hatte, musste ich später erneut Zeit und Energie investieren, als ich ihnen in der Praxis wieder begegnete.

Deshalb sind dies meine Empfehlungen:

**1. Grundlagen ergänzen**

In China gibt es ein Sprichwort: "Aller Anfang ist schwer." Für Anfänger ohne Vorkenntnisse tauchen beim Lernen von Swift oft schwer verständliche Themen auf. Das liegt häufig nicht daran, dass das Thema selbst besonders kompliziert ist, sondern daran, dass an der Basis dieser Wissenspyramide noch grundlegendere Konzepte fehlen, mit denen man noch nicht in Berührung gekommen ist.

In solchen Fällen kann man mit KI-Werkzeugen wie [ChatGPT](https://chatgpt.com/) und [Claude](https://claude.ai/?redirect=claude.com) fehlendes Grundlagenwissen gezielt ergänzen.

**2. Jedes Konzept wirklich verstehen**

Beim Lernen ist es am wichtigsten, jedes Konzept so gut wie möglich zu verstehen, auch wenn das ein paar Tage dauert.

Wenn man Inhalte überspringt, die man nicht versteht, begegnet man ihnen später in der Entwicklung mit hoher Wahrscheinlichkeit erneut. Dann blockieren sie den Fortschritt, und man muss doch wieder Zeit investieren, um sie zu lernen. Es ist besser, Wissen schon in der Lernphase klar zu verstehen, statt später mühsam Lücken zu schließen.

Jedes Konzept ist im Kern ein Werkzeug. Je mehr Werkzeuge du beherrschst, desto stärker wird deine Fähigkeit, Probleme zu lösen.

Es ist wie beim Hausbau: Wenn du nur ein Werkzeug in der Hand hast, kannst du zwar den Großteil der Arbeit irgendwie erledigen, aber bei höheren Qualitätsanforderungen kommst du schnell an Grenzen. Mit mehr Werkzeugen kannst du ein stabileres Haus bauen.

**3. Kontinuierlich weiterlernen**

Lernen erfordert langfristiges Dranbleiben. Nur wenige Menschen sind wirklich bereit, mehrere Monate lang ernsthaft an einem Tutorial zu arbeiten. Kontinuierliche Zeitinvestition ist wichtiger als kurzfristige Phasen mit sehr hoher Intensität.

Selbst wenn du jeden Tag nur ein Prozent schaffst, kannst du in hundert Tagen das gesamte Lernziel erreichen.

## Bildungsvision

Dieser Kurs wird nicht übermäßig viel Wissen über Swift und SwiftUI vermitteln, sondern Anfänger auf den Weg des Swift-Programmierens führen. Es ist wie mit Bausteinen: Das Tutorial erklärt, wie man die Teile zusammensetzt, und den Rest der Zeit verwendest du darauf, deine eigenen Konstruktionen zu bauen.

Das Projekt ist auf [GitHub](https://github.com/fangjunyu1/SwiftSlim) als Open Source veröffentlicht und kann kostenlos heruntergeladen und verwendet werden. Zusätzlich gibt es eine App-Store-Version zum Ausprobieren.

Wir hoffen, mehr Menschen ohne technischen Hintergrund, die ihren beruflichen Weg verändern möchten, dabei zu helfen, durch das Lernen von Programmierung und App-Entwicklung neue Möglichkeiten zu entdecken.

## Inhaltsaktualisierungen

Dieses Tutorial basiert auf den aktuellen Versionen von Swift und SwiftUI.

Da sich Apple-Plattformen und Werkzeuge weiterentwickeln, können sich einzelne APIs ändern. Wenn du Probleme findest oder Inhalte aktualisiert werden müssen, orientiere dich bitte an der offiziellen Dokumentation oder an der neuesten Version des Open-Source-Repositories.

---
Fang Junyu

2026-02-14
