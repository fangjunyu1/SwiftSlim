# Spoznajmo Xcode

## Kaj je Xcode

Xcode je Applovo uradno integrirano razvojno okolje (IDE, Integrated Development Environment), namenjeno razvoju aplikacij za Applove platforme, kot so iOS, macOS, watchOS in tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Skozi celoten učni proces bomo za pisanje kode in poganjanje programov uporabljali Xcode.

V tej lekciji se bomo naučili, kako prenesti Xcode, ustvariti svojo prvo aplikacijo za iOS in se osnovno seznaniti s strukturo vmesnika Xcode.

## Prenos Xcode

Trenutno obstajata dva načina namestitve Xcode:

1、prenos prek [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、prenos prek [uradne spletne strani Apple Developer](https://developer.apple.com/xcode/)

Na oba načina lahko prenesete Xcode. Razlika je v tem, da je na uradni strani Apple Developer poleg stabilne različice mogoče prenesti tudi [Beta](https://developer.apple.com/download/all/?q=Xcode) različice ali starejše različice.

Če se razvoja šele učite, je priporočljivo uporabljati stabilno različico. Različice Beta so namenjene predvsem preizkušanju novih funkcij in so lahko nestabilne.

## Ustvarjanje prvega projekta

Ko odprete Xcode, boste videli začetni zaslon.

![Swift](../../RESOURCE/001_xcode1.png)

Na levi strani so tri pogosto uporabljene možnosti:

- Create New Project —— ustvari nov projekt  
- Clone Git Repository —— klonira Git repozitorij  
- Open Existing Project —— odpre obstoječi projekt

Na desni strani so prikazani nedavno odprti projekti Xcode.

Izberemo možnost "Create New Project".

### Izbira predloge projekta

![Swift](../../RESOURCE/001_xcode2.png)

Odpre se zaslon za izbiro predloge projekta, kjer so prikazane različne platforme (iOS, macOS itd.) in različne vrste projektnih predlog.

Pojasnilo pogostih predlog:
- App —— najbolj osnovna vrsta aplikacije (priporočeno)
- Document App —— aplikacija, zasnovana na dokumentnem načinu
- Game —— za razvoj iger
- Framework —— modul za večkratno uporabo

Na začetni stopnji izberemo samo predlogo "iOS" - "App", ker gre za vrsto aplikacije z uporabniškim vmesnikom.

Kliknite "Next".

### Izpolnjevanje podatkov o projektu

Nato vstopimo v zaslon za izpolnjevanje podatkov o projektu, kjer moramo vnesti vrednosti glede na posamezna polja.

![Swift](../../RESOURCE/001_xcode3.png)

Pomen posameznih polj:

- Product Name —— ime projekta, na primer: SwiftSlimTest
- Team —— razvojna ekipa; če nimate plačljivega računa Apple Developer, lahko to pustite prazno
- Organization Identifier —— identifikator organizacije, običajno v obliki obratne domene, na primer:
  - com.yourname
  - com.yourcompany
  - če nimate domene, lahko kot identifikator uporabite svoje angleško ime
- Bundle Identifier —— edinstveni identifikator aplikacije, ki se samodejno ustvari na podlagi Organization Identifier in Product Name
- Interface —— tehnologija uporabniškega vmesnika, izberite SwiftUI
- Language —— razvojni jezik, izberite Swift
- Testing System —— privzeto se ustvari testni cilj (Unit Tests), kar lahko na začetni stopnji prezrete
- Storage —— ogrodje za lokalno trajno shranjevanje podatkov; lahko samodejno vključi SwiftData ali Core Data, kar lahko na začetni stopnji prezrete

Ko vse izpolnite, kliknite "Next".

### Shranjevanje projekta

![Swift](../../RESOURCE/001_xcode4.png)

Izberite ustrezno mapo za shranjevanje.

Kliknite gumb "Create" in Xcode bo samodejno ustvaril strukturo projekta.

## Struktura projekta Xcode

Ko projekt Xcode shranite, boste v Finderju videli ustvarjeno projektno mapo.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— mapa za shranjevanje slik, ikon aplikacije in drugih virov

- ContentView.swift —— privzeto ustvarjena datoteka pogleda SwiftUI; pozneje bomo tukaj pisali kodo uporabniškega vmesnika

- SwiftSlimTestApp.swift —— vstopna datoteka aplikacije (App Entry Point), odgovorna za zagon aplikacije; za zdaj je še ni treba razumeti

- SwiftSlimTest.xcodeproj —— projektna datoteka Xcode; projekt odprete tako, da dvokliknete to datoteko

## Spoznajmo vmesnik Xcode

Dvokliknite datoteko .xcodeproj, da odprete projekt, nato pa v levem območju Navigator izberite datoteko ContentView.swift.

Vmesnik Xcode je v glavnem sestavljen iz petih območij:

- Navigator —— navigacijsko območje za pregled strukture datotek in iskanje
- Editor —— območje za urejanje, kjer pišemo kodo Swift ali SwiftUI
- Canvas —— območje platna za predogled SwiftUI
- Inspector —— območje za pregled lastnosti, kjer si ogledamo in spreminjamo lastnosti datoteke
- Debug Area —— območje za odpravljanje napak, kjer si ogledamo izpis dnevnikov

![Swift](../../RESOURCE/001_xcode6.png)

Opomba: Canvas se uporablja predvsem za predogled pogledov SwiftUI. Po uradni arhitekturi Xcode je to pomožna plošča za predogled znotraj Editorja (Preview Pane). Canvas je mogoče omogočiti samo, ko je odprta datoteka pogleda SwiftUI; pri drugih vrstah datotek funkcija predogleda ni na voljo.

V naslednjih lekcijah bomo večinoma pisali kodo Swift in SwiftUI v območju Editor.

Ko projekt Xcode odprete prvič, sta lahko območji Inspector in Debug Area privzeto skriti. Prikažete ju lahko s klikom na gumb v zgornjem desnem in spodnjem desnem kotu.

![Swift](../../RESOURCE/001_xcode7.png)

Namig: območje Inspector se uporablja predvsem za pregledovanje in spreminjanje lastnosti datotek. V dejanskem razvoju je to območje pogosto skrito, da ostane več prostora za urejanje.

## Povzetek

V tej lekciji smo se naučili, kako prenesti Xcode, ustvariti prvi projekt Xcode in spoznati osnovno razporeditev vmesnika Xcode.

Spodaj je čas za samostojno raziskovanje:
- Lahko poskusite ustvariti in izbrisati datoteke v območju Navigator.  
- Oglejte si kodo v območju Editor in opazujte njeno strukturo.
- Oglejte si gumbe v območju Canvas ter poskusite povečati in pomanjšati predogled.

V naslednji lekciji bomo začeli pisati nekaj preproste kode, kar nam bo pomagalo še bolje spoznati Xcode.