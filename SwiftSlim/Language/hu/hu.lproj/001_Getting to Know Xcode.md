# Ismerkedés az Xcode-dal

## Mi az Xcode

Az Xcode az Apple hivatalos integrált fejlesztői környezete (IDE, Integrated Development Environment), amelyet iOS, macOS, watchOS, tvOS és más Apple platformokra készült alkalmazások fejlesztésére használnak.

![Swift](../../RESOURCE/001_xcode.png)

A teljes tananyag során Xcode-ot fogunk használni a kód írására és a programok futtatására.

Ebben a leckében megtanuljuk, hogyan lehet letölteni az Xcode-ot, hogyan kell létrehozni az első iOS alkalmazást, valamint alapvetően megismerkedünk az Xcode felületének szerkezetével.

## Xcode letöltése

Jelenleg az Xcode kétféleképpen telepíthető:

1、Letöltés a [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) segítségével

2、Letöltés az [Apple Developer hivatalos weboldaláról](https://developer.apple.com/xcode/)

Mindkét módon le lehet tölteni az Xcode-ot. A különbség az, hogy az Apple Developer hivatalos weboldalán a stabil kiadáson kívül [béta](https://developer.apple.com/download/all/?q=Xcode) vagy korábbi verziók is elérhetők.

Ha csak tanulási céllal fejlesztesz, érdemes a stabil verziót használni. A béta verziók főként új funkciók kipróbálására szolgálnak, és előfordulhatnak bennük instabilitások.

## Az első projekt létrehozása

Miután megnyitod az Xcode-ot, megjelenik a kezdőképernyő.

![Swift](../../RESOURCE/001_xcode1.png)

A bal oldalon három gyakran használt lehetőség található:

- Create New Project —— új projekt létrehozása  
- Clone Git Repository —— Git adattár klónozása  
- Open Existing Project —— meglévő projekt megnyitása

A jobb oldalon a nemrég megnyitott Xcode projektek láthatók.

Mi a "Create New Project" opciót választjuk.

### Projekt sablon kiválasztása

![Swift](../../RESOURCE/001_xcode2.png)

Ezután belépünk a projekt sablon kiválasztási felületére, ahol több platform (iOS, macOS stb.) és különféle projekttípus-sablonok jelennek meg.

Gyakori sablonok:
- App —— a legalapvetőbb alkalmazástípus (ajánlott)
- Document App —— dokumentum alapú alkalmazás
- Game —— játékfejlesztéshez
- Framework —— újrahasználható modul

Kezdő szinten csak az "iOS" - "App" sablont választjuk, mert ez a grafikus felülettel rendelkező alkalmazástípus.

Kattints a "Next" gombra.

### Projektadatok kitöltése

Belépünk a projektinformációk kitöltési felületére, ahol a mezőket a mezők típusának megfelelően kell kitölteni.

![Swift](../../RESOURCE/001_xcode3.png)

Az egyes mezők jelentése:

- Product Name —— a projekt neve, például: SwiftSlimTest
- Team —— fejlesztői csapat; ha nincs fizetős Apple Developer fiókod, ezt nem kötelező kiválasztani
- Organization Identifier —— szervezeti azonosító, általában fordított domain formában, például:
  - com.yourname
  - com.yourcompany
  - ha nincs domainneved, saját angol nevedet is használhatod azonosítóként
- Bundle Identifier —— az alkalmazás egyedi azonosítója, amely automatikusan létrejön az Organization Identifier és a Product Name alapján
- Interface —— felületi technológia, itt válaszd a SwiftUI-t
- Language —— fejlesztési nyelv, itt válaszd a Swiftet
- Testing System —— alapértelmezés szerint létrehoz tesztcélokat (Unit Tests), ezt kezdő szinten figyelmen kívül hagyhatjuk
- Storage —— helyi adatmegőrzési keretrendszer, amely automatikusan integrálhat SwiftData vagy Core Data megoldást; kezdő szinten ezt is figyelmen kívül hagyhatjuk

Miután mindent kitöltöttél, kattints a "Next" gombra.

### Projekt mentése

![Swift](../../RESOURCE/001_xcode4.png)

Válassz egy megfelelő mappát a mentéshez.

Kattints a "Create" gombra, és az Xcode automatikusan létrehozza a projekt szerkezetét.

## Xcode projektstruktúra

Miután elmentetted az Xcode projektet, a Finderben láthatod a létrehozott projektmappát.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— a képek, alkalmazásikonok és más erőforrások tárolására szolgáló mappa

- ContentView.swift —— az alapértelmezetten létrehozott SwiftUI nézetfájl, amelyben később a felület kódját fogjuk írni

- SwiftSlimTestApp.swift —— az alkalmazás belépési pontja (App Entry Point), amely az alkalmazás indításáért felel; ezt egyelőre még nem kell részletesen értenünk

- SwiftSlimTest.xcodeproj —— az Xcode projektfájl; dupla kattintással megnyitható a projekt

## Ismerkedés az Xcode felületével

Nyisd meg a projektet a `.xcodeproj` fájlra duplán kattintva, majd a bal oldali Navigator területen válaszd ki a `ContentView.swift` fájlt.

Az Xcode felülete főként öt területből áll:

- Navigator —— navigációs terület, a fájlszerkezet megtekintésére és keresésre
- Editor —— szerkesztőterület, ahol Swift vagy SwiftUI kódot írunk
- Canvas —— vászon terület, a SwiftUI előnézethez
- Inspector —— tulajdonságellenőrző terület, a fájlok tulajdonságainak megtekintésére és módosítására
- Debug Area —— hibakeresési terület, a naplóüzenetek megtekintésére

![Swift](../../RESOURCE/001_xcode6.png)

Megjegyzés: a Canvas főként a SwiftUI nézetek előnézetére szolgál. Az Xcode hivatalos architektúrája szerint ez az Editor kiegészítő előnézeti panelje (Preview Pane). A Canvas csak SwiftUI nézetfájl megnyitásakor kapcsolható be, más típusú fájloknál nem jelenik meg az előnézet funkció.

A későbbi leckékben elsősorban az Editor területen fogunk Swift és SwiftUI kódot írni.

Amikor először nyitsz meg egy Xcode projektet, az Inspector és a Debug Area alapértelmezés szerint rejtett lehet; ezeket a jobb felső és jobb alsó sarokban található gombokkal lehet megjeleníteni.

![Swift](../../RESOURCE/001_xcode7.png)

Tipp: az Inspector terület főként a fájlok tulajdonságainak megtekintésére és módosítására szolgál. A valós fejlesztés során ezt gyakran elrejtjük, hogy nagyobb hely maradjon a szerkesztéshez.

## Összegzés

Ebben a leckében megtanultuk, hogyan lehet letölteni az Xcode-ot, hogyan lehet létrehozni az első Xcode projektet, valamint megismertük az Xcode alapvető felületi elrendezését.

Most itt az önálló felfedezés ideje:
- Próbálj meg fájlokat létrehozni és törölni a Navigator területen.  
- Nézd meg az Editor terület kódját, és figyeld meg a kódszerkezetet.
- Nézd meg a Canvas terület gombjait, és próbáld meg nagyítani vagy kicsinyíteni az előnézeti nézetet.

A következő leckében elkezdünk egyszerű kódot írni, és ezzel tovább ismerkedünk az Xcode-dal.  
