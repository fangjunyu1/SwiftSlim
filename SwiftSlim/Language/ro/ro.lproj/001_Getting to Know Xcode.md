# Cunoașterea Xcode

## Ce este Xcode

Xcode este mediul integrat de dezvoltare (IDE, Integrated Development Environment) oferit oficial de Apple, utilizat pentru dezvoltarea aplicațiilor pentru platformele Apple precum iOS, macOS, watchOS și tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Pe tot parcursul acestui curs, vom folosi Xcode pentru a scrie cod și pentru a rula programe.

În această lecție, vom învăța cum să descărcăm Xcode, cum să creăm prima aplicație iOS și cum să înțelegem, la nivel introductiv, structura interfeței Xcode.

## Descărcarea Xcode

În prezent, Xcode poate fi instalat în două moduri:

1. Descărcare prin [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Descărcare prin [site-ul oficial Apple Developer](https://developer.apple.com/xcode/)

Ambele metode pot fi folosite pentru a descărca Xcode. Diferența este că pe site-ul oficial Apple Developer, pe lângă versiunea stabilă, pot fi descărcate și versiunile [Beta](https://developer.apple.com/download/all/?q=Xcode) sau versiunile mai vechi.

Dacă scopul tău este doar să înveți dezvoltare, este recomandat să folosești versiunea stabilă. Versiunile Beta sunt destinate în principal testării funcțiilor noi și pot prezenta instabilități.

## Crearea primului proiect

După deschiderea Xcode, vei vedea ecranul de pornire.

![Swift](../../RESOURCE/001_xcode1.png)

În partea stângă se află trei opțiuni utilizate frecvent:

- Create New Project —— creează un proiect nou  
- Clone Git Repository —— clonează un depozit Git  
- Open Existing Project —— deschide un proiect existent

În partea dreaptă sunt afișate proiectele Xcode deschise recent.

Noi alegem opțiunea „Create New Project”.

### Alegerea șablonului de proiect

![Swift](../../RESOURCE/001_xcode2.png)

Vei intra în interfața de alegere a șablonului de proiect, unde sunt afișate mai multe platforme (iOS, macOS etc.) și diferite tipuri de șabloane de proiect.

Explicația șabloanelor uzuale:
- App —— cel mai de bază tip de aplicație (recomandat)
- Document App —— aplicație bazată pe modelul document
- Game —— pentru dezvoltarea jocurilor
- Framework —— modul reutilizabil

În etapa de început, alegem doar șablonul „iOS” - „App”, deoarece acesta este tipul de aplicație cu interfață.

Apasă pe „Next”.

### Completarea informațiilor proiectului

Vei intra în interfața pentru completarea informațiilor proiectului, unde trebuie să completezi câmpurile în funcție de tipul lor.

![Swift](../../RESOURCE/001_xcode3.png)

Semnificația fiecărui câmp:

- Product Name —— numele proiectului, de exemplu: SwiftSlimTest
- Team —— echipa de dezvoltare; dacă nu ai un cont Apple Developer plătit, poți să nu selectezi nimic
- Organization Identifier —— identificatorul organizației, de obicei în format de domeniu inversat, de exemplu:
  - com.yourname
  - com.yourcompany
  - dacă nu ai un domeniu, poți folosi propriul nume în engleză ca identificator
- Bundle Identifier —— identificatorul unic al aplicației; acesta va fi generat automat pe baza Organization Identifier și Product Name
- Interface —— tehnologia interfeței; alege SwiftUI
- Language —— limbajul de dezvoltare; alege Swift
- Testing System —— în mod implicit va fi creată o țintă de testare (Unit Tests); la început o putem ignora
- Storage —— framework-ul pentru persistența locală a datelor; poate integra automat SwiftData sau Core Data; la început o putem ignora

După completare, apasă pe „Next”.

### Salvarea proiectului

![Swift](../../RESOURCE/001_xcode4.png)

Alege un folder potrivit pentru salvare.

Apasă pe butonul „Create”, iar Xcode va genera automat structura proiectului.

## Structura proiectului Xcode

După salvarea proiectului Xcode, în Finder vei putea vedea folderul proiectului generat.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— folderul folosit pentru stocarea imaginilor, a iconițelor aplicației și a altor resurse

- ContentView.swift —— fișierul SwiftUI generat implicit; ulterior vom scrie aici codul interfeței.

- SwiftSlimTestApp.swift —— fișierul de intrare al aplicației (App Entry Point), responsabil pentru pornirea aplicației; momentan nu este necesar să-l înțelegem.

- SwiftSlimTest.xcodeproj —— fișierul proiectului Xcode; fă dublu clic pe acest fișier pentru a deschide proiectul.

## Cunoașterea interfeței Xcode

Fă dublu clic pe fișierul .xcodeproj pentru a deschide proiectul, apoi selectează fișierul ContentView.swift în zona Navigator din stânga.

Interfața Xcode este compusă în principal din cinci zone:

- Navigator —— zonă de navigare, folosită pentru a vedea structura fișierelor și pentru căutare
- Editor —— zonă de editare, folosită pentru a scrie cod Swift sau SwiftUI
- Canvas —— zonă de pânză, folosită pentru previzualizarea SwiftUI
- Inspector —— zonă de inspectare a proprietăților, folosită pentru a vedea și modifica proprietățile fișierelor
- Debug Area —— zonă de depanare, pentru vizualizarea jurnalelor de ieșire

![Swift](../../RESOURCE/001_xcode6.png)

Atenție: Canvas este folosit în principal pentru previzualizarea vizuală a interfețelor SwiftUI. Din perspectiva arhitecturii oficiale Xcode, acesta este un panou de previzualizare auxiliar pentru Editor (Preview Pane). Canvas poate fi activat doar atunci când este deschis un fișier de tip SwiftUI View; în alte tipuri de fișiere, funcția de previzualizare nu va fi afișată.

În lecțiile următoare, vom scrie în principal cod Swift și SwiftUI în zona Editor.

La prima deschidere a unui proiect Xcode, Inspector și Debug Area pot fi ascunse implicit; poți apăsa pe butoanele din colțul dreapta sus și dreapta jos pentru a le afișa.

![Swift](../../RESOURCE/001_xcode7.png)

Sugestie: zona Inspector este folosită în principal pentru a vedea și modifica proprietățile fișierelor. În dezvoltarea reală, această zonă este de obicei ascunsă pentru a obține mai mult spațiu de editare.

## Rezumat

În această lecție, am învățat cum să descărcăm Xcode, cum să creăm primul proiect Xcode și care este structura de bază a interfeței Xcode.

Mai jos este timpul de explorare liberă:
- Poți încerca să creezi și să ștergi fișiere în zona Navigator.  
- Să examinezi codul din zona Editor și să observi structura lui.
- Să verifici butoanele din zona Canvas și să încerci să mărești și să micșorezi previzualizarea.

În lecția următoare, vom începe să scriem câteva linii simple de cod, ceea ce ne va ajuta să înțelegem și mai bine Xcode.