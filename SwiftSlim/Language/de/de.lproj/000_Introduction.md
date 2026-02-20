# Einführung

## Was ist Swift?

Bevor wir Swift lernen, lassen Sie uns kurz über die Programmiersprache Swift sprechen. Swift ist eine moderne Programmiersprache, die von Apple entwickelt wurde und hauptsächlich für die Erstellung von Anwendungen auf Apple-Plattformen wie iOS, macOS, iPadOS, watchOS usw. verwendet wird.

![Swift](000_swift.png)

Im Vergleich zu anderen Programmiersprachen ist die Syntax von Swift prägnant und legt mehr Wert auf Sicherheit und Lesbarkeit. In Kombination mit SwiftUI ist es einfacher zu lernen und zu verstehen. Natürlich habe ich zuvor keine anderen Programmiersprachen gelernt; es ist vielleicht etwas schwieriger als HTML.

Swift dient nicht nur der Entwicklung von Anwendungen für Apple-Plattformen. Die Swift-Community arbeitet hart daran, Swift auf die [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/)-Plattform zu portieren und sogar auf [Servern](https://github.com/awslabs/swift-aws-lambda-runtime) und in anderen Umgebungen auszuführen. Langfristig betrachtet hat Swift einen größeren Entwicklungsspielraum und in Zukunft die Chance, eine plattformübergreifende Programmiersprache ähnlich wie Flutter oder React Native zu werden.

## Lerninhalte

Dieses Tutorial konzentriert sich hauptsächlich auf die Grundlagen von Swift und SwiftUI.

Wir werden mit einfachen Variablen und Datentypen beginnen, SwiftUI zum Erstellen von Benutzeroberflächen verwenden, verstehen, wie Daten gespeichert und gelesen werden, und schließlich vielleicht in fortgeschrittene Inhalte wie Swift Data und iCloud-Synchronisierung eintauchen.

Jedes Kapitel wird sich um einen praktischen Fall drehen, um Swift-Wissen in der praktischen Anwendung zu erlernen.

Manche Tutorials konzentrieren sich möglicherweise zuerst auf die Erklärung einer großen Menge an Syntax und APIs, bevor sie zur Projektpraxis übergehen. Für Anfänger ist das so, als würde ein Kind Wörter aus einem Wörterbuch lernen; das Auswendiglernen großer Mengen an Inhalten ohne Anwendungsszenarien führt letztendlich nur dazu, dass der Anfänger das Interesse verliert.

In diesem Tutorial werden wir Wissen in tatsächlichen Entwicklungsszenarien erlernen und Anforderungen nutzen, um die entsprechenden Wissenspunkte einzuführen.

Nach Abschluss dieses Tutorials werden Sie in der Lage sein, eigenständig eine grundlegende Anwendung zu entwickeln und auszuführen, sie auf Ihrem eigenen iOS-/macOS-Gerät zu installieren oder die Anwendung im App Store zu veröffentlichen.

## Wie lernt man ohne Vorkenntnisse?

Ich habe früher auch ganz ohne Vorkenntnisse angefangen. Anfangs habe ich mir nur ein paar [Swift-Lehrvideos]( iOS-Anwendungen nicht kompliziert sind, was mein Interesse weckte. Danach begann ich zu versuchen, mir mehr Swift-Wissen anzueignen. Zum Beispiel durch das Spielen von Programmierspielen auf [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), das Lesen der [offiziellen Swift-Tutorial-Dokumentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) sowie das Studium von [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Rückblickend scheint es, dass mir hauptsächlich [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) einen Lernrahmen bot, der es mir ermöglichte, SwiftUI systematisch zu lernen. Da das Tutorial jedoch auf Englisch ist und mir die Programmiergrundlagen fehlten, hatte ich beim Verständnis viele Schwierigkeiten. Hierfür habe ich KIs wie [ChatGPT](https://chatgpt.com/) und [Claude](https://claude.ai/?redirect=claude.com) genutzt, um das Verständnis der Wissenspunkte zu unterstützen.

Im Lernprozess ist es unvermeidlich, dass einige Wissenspunkte auftauchen, die schwer zu verstehen sind. Ich erinnere mich, dass ich beim Lernen von UserDefaults nur wusste, wie man Daten speichert, aber nicht, dass Daten manuell gelesen werden müssen, sodass ich vermutete, dass mein Code fehlerhaft sei. Selbst ein so einfacher Wissenspunkt hat mich einige Tage gekostet.

Oder zum Beispiel Closures, Main Thread, Generics und andere Punkte; da ich sie in der frühen Lernphase nicht tiefgreifend verstehen konnte, musste ich erneut Energie aufwenden, um sie zu lernen, als ich ihnen in der tatsächlichen Entwicklung wieder begegnete.

Daher ist mein Rat:

**1. Grundlagenwissen ergänzen**

In China gibt es das Sprichwort „Aller Anfang ist schwer“. Für Anfänger ohne Vorkenntnisse sind einige Wissenspunkte zu Beginn des Swift-Lernens oft schwer zu verstehen. Das liegt nicht daran, dass der Wissenspunkt selbst komplex ist, sondern daran, dass es unter dieser Wissenspyramide noch grundlegenderes Wissen gibt, das Sie noch nicht gelernt oder kennengelernt haben.

In diesem Fall sollten Sie KIs wie [ChatGPT](https://chatgpt.com/) und [Claude](https://claude.ai/?redirect=claude.com) fragen, um das Grundlagenwissen zu vervollständigen.

**2. Versuchen Sie, jeden Wissenspunkt zu verstehen**

Im Lernprozess sollten Sie versuchen, jeden Wissenspunkt zu verstehen, auch wenn es einige Tage dauert.

Wenn Sie sich entscheiden, Inhalte zu überspringen, die Sie nicht verstehen, werden Ihnen diese in der späteren Entwicklung wieder begegnen und den Fortschritt behindern, sodass Sie letztendlich erneut Zeit investieren müssen, um sie zu lernen. Anstatt den Schaden erst zu begrenzen, wenn es zu spät ist, ist es besser, das Wissen bereits in der Lernphase klar zu verstehen.

Jeder Wissenspunkt ist im Wesentlichen ein Werkzeug – je mehr Werkzeuge Sie beherrschen, desto stärker ist Ihre Fähigkeit, Probleme zu lösen.

Es ist wie beim Bau eines Hauses: Wenn Sie nur ein Werkzeug in der Hand haben, können Sie zwar die meiste Arbeit kaum bewältigen, aber bei höheren Qualitätsanforderungen werden Sie machtlos erscheinen. Das Beherrschen von mehr Werkzeugen ermöglicht den Bau eines stabileren Hauses.

**3. Bleiben Sie kontinuierlich am Ball**

Lernen erfordert Beständigkeit. Nur wenige Menschen sind wirklich bereit, sich einige Monate Zeit zu nehmen, um ein Tutorial ernsthaft zu lernen. Kontinuierlicher Zeiteinsatz für das Lernen ist wichtiger als kurzfristige hohe Intensität.

Selbst wenn Sie jeden Tag nur ein Prozent schaffen, können Sie in hundert Tagen das gesamte Lernziel erreichen.

## Bildungsvision

Dieser Kurs wird nicht allzu viel Wissen über Swift und SwiftUI vermitteln, sondern Anfänger auf den Weg der Swift-Programmierung führen. Es ist wie beim Zusammensetzen von Bausteinen – das Tutorial ist für die Erklärung der Montagemethoden verantwortlich, und die verbleibende Zeit gehört Ihnen, um Ihre eigenen Bausteine zusammenzusetzen.

Das Projekt ist auf [GitHub](https://github.com/fangjunyu1/SwiftSlim) als Open Source verfügbar und kann kostenlos heruntergeladen und verwendet werden. Es wird auch eine App Store-Version zum Ausprobieren angeboten.

Wir hoffen, mehr Menschen ohne technischen Hintergrund, die sich jedoch nach einer Veränderung ihres Karriereweges sehnen, dabei zu helfen, durch das Erlernen von Programmierung und App-Entwicklung neue Möglichkeiten zu erhalten.

## Inhaltsaktualisierungen

Dieses Tutorial basiert auf den aktuellen Versionen von Swift und SwiftUI.

Mit der Aktualisierung von Apple-Plattformen und -Tools können sich einige APIs ändern. Wenn Sie Probleme finden oder Inhalte aktualisiert werden müssen, beziehen Sie sich bitte auf die offizielle Dokumentation oder die neueste Version im Open-Source-Repository.

---
Fang Junyu

14.02.2026