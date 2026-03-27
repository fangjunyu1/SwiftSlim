# Susipažinimas su Xcode

## Kas yra Xcode

Xcode yra oficiali Apple teikiama integruota kūrimo aplinka (IDE, Integrated Development Environment), naudojama kurti programas Apple platformoms, tokioms kaip iOS, macOS, watchOS ir tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Viso mokymosi proceso metu mes naudosime Xcode kodui rašyti ir programoms paleisti.

Šioje pamokoje sužinosime, kaip atsisiųsti Xcode, sukurti pirmąją iOS programą ir pirmą kartą susipažinti su Xcode sąsajos struktūra.

## Kaip atsisiųsti Xcode

Šiuo metu Xcode galima įdiegti dviem būdais:

1、Atsisiųsti per [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Atsisiųsti per [Apple Developer oficialią svetainę](https://developer.apple.com/xcode/)

Abiem būdais galima atsisiųsti Xcode. Skirtumas tas, kad Apple Developer svetainėje, be stabilios versijos, galima atsisiųsti ir [Beta](https://developer.apple.com/download/all/?q=Xcode) ar senesnes versijas.

Jei tik mokotės kurti programas, rekomenduojama naudoti stabilią versiją. Beta versijos daugiausia skirtos naujoms funkcijoms testuoti ir gali būti nestabilios.

## Pirmojo projekto sukūrimas

Atidarę Xcode, pamatysite paleidimo langą.

![Swift](../../RESOURCE/001_xcode1.png)

Kairėje pusėje yra trys dažnai naudojami pasirinkimai:

- Create New Project —— sukurti naują projektą  
- Clone Git Repository —— klonuoti Git saugyklą  
- Open Existing Project —— atidaryti esamą projektą

Dešinėje pusėje rodomi neseniai atidaryti Xcode projektai.

Mes pasirenkame "Create New Project".

### Projekto šablono pasirinkimas

![Swift](../../RESOURCE/001_xcode2.png)

Patekę į projekto šablonų pasirinkimo langą, pamatysite kelias platformas (iOS, macOS ir kt.) ir skirtingų tipų projektų šablonus.

Dažniausi šablonai:
- App —— pats pagrindinis programos tipas (rekomenduojama)
- Document App —— dokumentų modeliu paremtos programos
- Game —— žaidimų kūrimui
- Framework —— pakartotinai naudojamas modulis

Pradiniame etape renkamės tik "iOS" - "App" šabloną, nes tai yra sąsajos programos tipas.

Spaudžiame "Next".

### Projekto informacijos pildymas

Toliau atsidaro projekto informacijos pildymo langas, kuriame reikia užpildyti laukus pagal jų paskirtį.

![Swift](../../RESOURCE/001_xcode3.png)

Laukų reikšmės:

- Product Name —— projekto pavadinimas, pavyzdžiui: SwiftSlimTest
- Team —— kūrėjų komanda. Jei neturite mokamos Apple Developer paskyros, galite nepasirinkti
- Organization Identifier —— organizacijos identifikatorius, dažniausiai rašomas atvirkštinio domeno forma, pavyzdžiui:
  - com.yourname
  - com.yourcompany
  - jei neturite domeno, galite naudoti savo anglišką vardą kaip identifikatorių
- Bundle Identifier —— unikalus programos identifikatorius, kuris automatiškai sugeneruojamas pagal Organization Identifier ir Product Name
- Interface —— sąsajos technologija, pasirinkite SwiftUI
- Language —— kūrimo kalba, pasirinkite Swift
- Testing System —— pagal nutylėjimą bus sukurtas testavimo taikinys (Unit Tests), pradiniame etape galima nekreipti dėmesio
- Storage —— vietinio duomenų saugojimo sistema, gali automatiškai integruoti SwiftData arba Core Data, pradiniame etape galima ignoruoti

Užpildę, spauskite "Next".

### Projekto išsaugojimas

![Swift](../../RESOURCE/001_xcode4.png)

Pasirinkite tinkamą aplanką išsaugojimui.

Paspaudus "Create", Xcode automatiškai sugeneruos projekto struktūrą.

## Xcode projekto struktūra

Išsaugoję Xcode projektą, Finder lange pamatysite sugeneruotą projekto aplanką.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— aplankas, skirtas paveikslėliams, programos ikonoms ir kitiems ištekliams

- ContentView.swift —— numatytasis SwiftUI vaizdo failas, kuriame vėliau rašysime sąsajos kodą

- SwiftSlimTestApp.swift —— programos įėjimo failas (App Entry Point), atsakingas už programos paleidimą. Kol kas jo išsamiai nagrinėti nereikia

- SwiftSlimTest.xcodeproj —— Xcode projekto failas, kurį dukart spustelėję atidarysite projektą

## Susipažinimas su Xcode sąsaja

Dukart spustelėkite `.xcodeproj` failą, kad atidarytumėte projektą, ir kairėje Navigator srityje pasirinkite `ContentView.swift` failą.

Xcode sąsaja daugiausia susideda iš penkių sričių:

- Navigator —— navigacijos sritis, skirta failų struktūrai peržiūrėti ir paieškai
- Editor —— redagavimo sritis, skirta Swift ar SwiftUI kodui rašyti
- Canvas —— drobės sritis, skirta SwiftUI peržiūrai
- Inspector —— savybių tikrinimo sritis, skirta failų savybėms peržiūrėti ir keisti
- Debug Area —— derinimo sritis, skirta žurnalų išvedimui

![Swift](../../RESOURCE/001_xcode6.png)

Pastaba: Canvas daugiausia naudojama SwiftUI vaizdų peržiūrai. Pagal oficialią Xcode architektūrą ji yra Editor pagalbinė peržiūros panelė (Preview Pane). Canvas galima įjungti tik atidarius SwiftUI vaizdo failą, kituose failų tipuose peržiūra nebus rodoma.

Tolimesnėse pamokose daugiausia rašysime Swift ir SwiftUI kodą Editor srityje.

Pirmą kartą atidarius Xcode projektą, Inspector ir Debug Area pagal nutylėjimą gali būti paslėptos. Jas galima parodyti spustelėjus mygtukus viršutiniame dešiniajame ir apatiniame dešiniajame kampe.

![Swift](../../RESOURCE/001_xcode7.png)

Patarimas: Inspector sritis daugiausia naudojama failų savybėms peržiūrėti ir keisti. Praktiniame kūrime ši sritis dažnai slepiama, kad būtų daugiau vietos redagavimui.

## Santrauka

Šioje pamokoje sužinojome, kaip atsisiųsti Xcode, kaip sukurti pirmąjį Xcode projektą ir kaip atrodo pagrindinis Xcode išdėstymas.

Toliau laikas laisvai pasibandyti:
- Galite pabandyti Navigator srityje kurti ir trinti failus  
- Peržiūrėti kodą Editor srityje ir stebėti jo struktūrą
- Peržiūrėti Canvas srities mygtukus ir pabandyti didinti arba mažinti peržiūros vaizdą

Kitoje pamokoje pradėsime rašyti paprastą kodą ir dar geriau susipažinsime su Xcode。  
