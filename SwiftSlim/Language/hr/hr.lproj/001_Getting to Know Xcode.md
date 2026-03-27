# Upoznavanje s Xcodeom

## Što je Xcode

Xcode je Appleovo službeno integrirano razvojno okruženje (IDE, Integrated Development Environment) za razvoj aplikacija za Apple platforme kao što su iOS, macOS, watchOS i tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Tijekom cijelog tečaja koristit ćemo Xcode za pisanje koda i pokretanje programa.

U ovoj ćemo lekciji naučiti kako preuzeti Xcode, stvoriti prvu iOS aplikaciju i osnovno upoznati strukturu Xcode sučelja.

## Preuzimanje Xcodea

Trenutno postoje dva načina instalacije Xcodea:

1、Preuzimanje putem [Mac App Storea](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Preuzimanje putem [službene Apple Developer stranice](https://developer.apple.com/xcode/)

Oba načina mogu se koristiti za preuzimanje Xcodea. Razlika je u tome što Apple Developer stranica, uz službenu stabilnu verziju, omogućuje preuzimanje i [Beta](https://developer.apple.com/download/all/?q=Xcode) verzija ili starijih izdanja.

Ako samo učite razvoj, preporučuje se korištenje službene stabilne verzije. Beta verzije uglavnom služe za isprobavanje novih značajki i mogu biti nestabilne.

## Izrada prvog projekta

Nakon otvaranja Xcodea vidjet ćete početni zaslon.

![Swift](../../RESOURCE/001_xcode1.png)

S lijeve strane nalaze se tri često korištene opcije:

- Create New Project —— stvaranje novog projekta  
- Clone Git Repository —— kloniranje Git repozitorija  
- Open Existing Project —— otvaranje postojećeg projekta

Desna strana prikazuje nedavno otvorene Xcode projekte.

Mi odabiremo opciju "Create New Project".

### Odabir predloška projekta

![Swift](../../RESOURCE/001_xcode2.png)

Zatim ulazimo u zaslon za odabir predloška projekta, gdje su prikazane različite platforme (iOS, macOS itd.) i različite vrste projektnih predložaka.

Objašnjenje čestih predložaka:
- App —— najosnovnija vrsta aplikacije (preporučeno)
- Document App —— aplikacija temeljena na dokumentima
- Game —— za razvoj igara
- Framework —— ponovno upotrebljivi modul

U početnoj fazi biramo samo predložak "iOS" - "App", jer je to tip aplikacije sa sučeljem.

Kliknite "Next".

### Ispunjavanje podataka o projektu

Ulazimo u zaslon za unos informacija o projektu, gdje polja treba ispuniti prema njihovoj namjeni.

![Swift](../../RESOURCE/001_xcode3.png)

Značenje pojedinih polja:

- Product Name —— naziv projekta, na primjer: SwiftSlimTest
- Team —— razvojni tim; ako nemate plaćeni Apple Developer račun, ovo polje možete ostaviti praznim
- Organization Identifier —— identifikator organizacije, obično u obrnutom obliku domene, na primjer:
  - com.yourname
  - com.yourcompany
  - ako nemate domenu, možete koristiti svoje englesko ime kao identifikator
- Bundle Identifier —— jedinstveni identifikator aplikacije, automatski se generira iz Organization Identifier i Product Name
- Interface —— tehnologija sučelja, odaberite SwiftUI
- Language —— programski jezik, odaberite Swift
- Testing System —— prema zadanim postavkama stvara ciljeve za testiranje (Unit Tests), u početnoj fazi to možemo zanemariti
- Storage —— okvir za lokalnu postojanu pohranu podataka; može automatski integrirati SwiftData ili Core Data, u početnoj fazi to također možemo zanemariti

Nakon što sve ispunite, kliknite "Next".

### Spremanje projekta

![Swift](../../RESOURCE/001_xcode4.png)

Odaberite prikladnu mapu za spremanje.

Kliknite gumb "Create" i Xcode će automatski generirati strukturu projekta.

## Struktura Xcode projekta

Nakon spremanja Xcode projekta, u Finderu možete vidjeti generiranu mapu projekta.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— mapa za pohranu slika, ikona aplikacije i drugih resursa

- ContentView.swift —— zadano generirana SwiftUI datoteka prikaza; ovdje ćemo kasnije pisati kod sučelja

- SwiftSlimTestApp.swift —— ulazna datoteka aplikacije (App Entry Point), odgovorna za pokretanje aplikacije; zasad je ne moramo detaljno razumjeti

- SwiftSlimTest.xcodeproj —— Xcode projektna datoteka; dvostrukim klikom na nju možete otvoriti projekt

## Upoznavanje Xcode sučelja

Dvostrukim klikom na `.xcodeproj` datoteku otvorite projekt, a zatim u lijevom Navigator području odaberite datoteku `ContentView.swift`.

Xcode sučelje uglavnom se sastoji od pet područja:

- Navigator —— navigacijsko područje za pregled strukture datoteka i pretraživanje
- Editor —— uređivačko područje za pisanje Swift ili SwiftUI koda
- Canvas —— područje platna za SwiftUI pregled
- Inspector —— područje za pregled svojstava, koristi se za pregled i izmjenu atributa datoteka
- Debug Area —— područje za otklanjanje pogrešaka i pregled izlaznih zapisa

![Swift](../../RESOURCE/001_xcode6.png)

Napomena: Canvas se uglavnom koristi za pregled SwiftUI prikaza. Prema službenoj arhitekturi Xcodea, to je pomoćna ploča za pregled unutar Editora (Preview Pane). Canvas se može uključiti samo kada je otvorena SwiftUI datoteka prikaza; druge vrste datoteka neće prikazivati funkciju pregleda.

U kasnijim ćemo lekcijama uglavnom pisati Swift i SwiftUI kod u Editor području.

Prilikom prvog otvaranja Xcode projekta, Inspector i Debug Area mogu biti skriveni prema zadanim postavkama. Možete ih prikazati gumbima u gornjem desnom i donjem desnom kutu.

![Swift](../../RESOURCE/001_xcode7.png)

Savjet: Inspector područje uglavnom služi za pregled i izmjenu svojstava datoteka. U stvarnom razvoju često se skriva kako bi ostalo više prostora za uređivanje.

## Sažetak

U ovoj smo lekciji naučili kako preuzeti Xcode, stvoriti prvi Xcode projekt i upoznati osnovni raspored Xcode sučelja.

Sada slijedi slobodno vrijeme za istraživanje:
- Možete pokušati stvarati i brisati datoteke u Navigator području.  
- Pogledajte kod u Editor području i promotrite njegovu strukturu.
- Pogledajte gumbe u Canvas području i pokušajte povećati ili smanjiti pregled.

U sljedećoj lekciji počet ćemo pisati jednostavan kod i dodatno upoznati Xcode.  
