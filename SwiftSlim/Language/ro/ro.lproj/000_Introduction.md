# Introducere

## Ce este Swift?

Înainte de a învăța Swift, să înțelegem mai întâi pe scurt limbajul de programare Swift. Swift este un limbaj de programare modern dezvoltat de Apple, folosit în principal pentru a construi aplicații pentru platformele Apple precum iOS, macOS, iPadOS și watchOS.

![Swift](../../RESOURCE/000_swift.png)

Comparativ cu alte limbaje de programare, Swift are o sintaxă mai concisă și pune un accent mai mare pe siguranță și lizibilitate. Împreună cu SwiftUI, este mai ușor de învățat și de înțeles. Desigur, eu nu studiasem înainte alte limbaje de programare, așa că poate mi s-a părut puțin mai dificil decât HTML.

Swift nu poate fi folosit doar pentru a dezvolta aplicații pe platformele Apple. Comunitatea Swift lucrează pentru a porta Swift pe platforma [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) și chiar pentru a-l rula în alte medii, precum [serverele](https://github.com/awslabs/swift-aws-lambda-runtime). Din perspectiva dezvoltării pe termen lung, Swift are un potențial mai mare și, în viitor, ar putea deveni un limbaj de programare cross-platform similar cu Flutter sau React Native.

## Conținutul învățării

Acest tutorial se concentrează în principal pe cunoștințele de bază despre Swift și SwiftUI.

Vom începe cu variabile simple și tipuri de date, vom construi interfețe folosind SwiftUI, vom înțelege cum sunt stocate și citite datele, iar la final este posibil să aprofundăm și subiecte mai avansate, precum SwiftData și sincronizarea prin iCloud.

Fiecare capitol va fi construit în jurul unui caz practic, învățând cunoștințele Swift în contexte reale de utilizare.

Unele tutoriale aleg să explice mai întâi o cantitate mare de sintaxă și API-uri, iar abia apoi să intre în proiecte practice. Pentru începători, acest lucru seamănă cu situația în care un copil învață cuvinte din dicționar: fără un context de aplicare, memorarea unei cantități mari de conținut nu face decât să-i facă pe începători să-și piardă interesul.

Acest tutorial va aborda învățarea în contexte reale de dezvoltare, folosind nevoi concrete pentru a introduce punctele de cunoaștere relevante.

După finalizarea acestui tutorial, vei putea să dezvolți și să rulezi independent o aplicație de bază, să o instalezi pe propriile dispozitive iOS / macOS și chiar să publici aplicația în App Store.

## Cum să înveți de la zero?

Și eu am început tot de la zero. La început am urmărit doar câteva videoclipuri de pe Youtube despre [Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3), iar asta m-a făcut să realizez că dezvoltarea aplicațiilor iOS nu este atât de complicată, ceea ce mi-a trezit interesul. Apoi am început să încerc să învăț mai multe despre Swift. De exemplu, am experimentat jocurile de programare din [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), am citit [documentația oficială Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) și am studiat [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Privind acum înapoi, în principal [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) mi-a oferit un cadru de învățare care mi-a permis să studiez SwiftUI într-un mod sistematic. Totuși, deoarece tutorialul era în engleză și eu nu aveam bază în programare, am întâmpinat foarte multe dificultăți în procesul de înțelegere. Pentru asta, am folosit AI precum [ChatGPT](https://chatgpt.com/) și [Claude](https://claude.ai/?redirect=claude.com) pentru a mă ajuta să înțeleg conceptele.

În procesul de învățare, este inevitabil să apară unele noțiuni mai greu de înțeles. Îmi amintesc că atunci când învățam despre UserDefaults, știam doar cum să salvez datele, dar nu știam că acestea trebuie citite manual, ceea ce m-a făcut să suspectez că există o problemă în codul meu. Chiar și o noțiune atât de simplă m-a făcut să pierd câteva zile.

De exemplu, concepte precum closures, thread-ul principal și genericele: în etapa inițială de învățare, pentru că nu le puteam înțelege în profunzime, atunci când le-am întâlnit din nou în dezvoltarea reală a trebuit să investesc din nou energie pentru a le reînvăța.

Prin urmare, recomandările mele sunt următoarele:

**1. Completează cunoștințele de bază**

În China există o expresie: „Cel mai greu este începutul”. Pentru cei care învață Swift de la zero, este inevitabil să întâlnească în procesul de învățare unele noțiuni greu de înțeles — iar de multe ori problema nu este că noțiunea în sine ar fi prea complicată, ci că la baza acestei piramide a cunoașterii există concepte și mai fundamentale cu care începătorul încă nu a luat contact.

În astfel de situații, poți lua în calcul folosirea unor instrumente AI precum [ChatGPT](https://chatgpt.com/) și [Claude](https://claude.ai/?redirect=claude.com) pentru a completa la timp cunoștințele de bază care îți lipsesc.

**2. Înțelege fiecare noțiune**

În timpul învățării, cel mai important lucru este să încerci să înțelegi fiecare noțiune, chiar dacă pentru asta trebuie să petreci câteva zile.

Dacă alegi să sari peste ceea ce nu înțelegi, este foarte probabil să întâlnești din nou acel conținut mai târziu în dezvoltare, iar acesta să îți blocheze progresul. În cele din urmă, tot va trebui să investești din nou timp pentru a-l învăța. În loc să repari ulterior, este mai bine să înțelegi bine cunoștințele încă din faza de învățare.

Fiecare noțiune este, în esență, un instrument — cu cât stăpânești mai multe instrumente, cu atât capacitatea ta de a rezolva probleme este mai mare.

Este ca atunci când construiești o casă: dacă ai în mână un singur instrument, deși poți termina cu greu cea mai mare parte a muncii, atunci când te confrunți cu cerințe de calitate mai ridicată vei simți că nu îți ajunge. Doar stăpânind mai multe instrumente poți construi o casă mai solidă.

**3. Menține învățarea constantă**

Învățarea necesită perseverență pe termen lung. Puțini oameni sunt cu adevărat dispuși să dedice câteva luni pentru a studia serios un tutorial. Este mai important să investești timp constant decât să depui un efort foarte intens pe termen scurt.

Chiar dacă finalizezi doar unu la sută în fiecare zi, în o sută de zile poți atinge întregul obiectiv de învățare.

## Viziune educațională

Acest curs nu va preda foarte multe cunoștințe de Swift și SwiftUI, ci își propune să îi conducă pe începători pe drumul programării cu Swift. Este ca și cum ai construi cu piese LEGO — tutorialul explică modul de asamblare, iar restul timpului îți revine ție să construiești propriul tău model.

Proiectul este open-source pe [GitHub](https://github.com/fangjunyu1/SwiftSlim), poate fi descărcat și folosit gratuit. În același timp, este oferită și o versiune în App Store pentru testare.

Sperăm să ajutăm mai multe persoane fără experiență tehnică, dar care își doresc să își schimbe traseul profesional, să obțină noi posibilități prin învățarea programării și dezvoltarea de aplicații.

## Actualizarea conținutului

Acest tutorial este scris pe baza versiunilor actuale de Swift și SwiftUI.

Pe măsură ce platformele și instrumentele Apple se actualizează, unele API-uri se pot schimba. Dacă observi probleme sau dacă anumite conținuturi trebuie actualizate, poți consulta documentația oficială sau cea mai recentă versiune a depozitului open-source.

---
Fang Junyu

2026-02-14