# Layout, imagini și text

În lecția anterioară, am studiat codul ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

În această lecție, vom învăța mecanismul implicit de layout din SwiftUI, precum și modul de utilizare al imaginilor și textului. Pe baza lecției anterioare, vom înțelege mai bine structura și modul de afișare al view-urilor, iar aceste cunoștințe ne vor ajuta să construim layout-uri de bază pentru interfață.

## Mecanismul implicit de layout în SwiftUI

Atunci când previzualizăm view-ul ContentView, observăm că pictograma și textul sunt afișate centrat, nu aliniate pornind din partea de sus.

![Swift](../../RESOURCE/003_view.png)

În mod implicit, modul de aliniere al containerelor Stack este `.center`, de aceea subview-urile apar de obicei centrate.

### Alignment — modul de aliniere

Este clar că alinierea centrată este doar una dintre posibilități. Dacă vrem aliniere la stânga sau la dreapta, trebuie să folosim `alignment` pentru a controla modul de aliniere al view-urilor.

```swift
alignment
```

În SwiftUI, alinierea apare de obicei în două scenarii:

**1. Parametrul de aliniere al containerelor Stack**

De exemplu, pentru a alinia la stânga pictograma și textul din ContentView:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`alignment` din `VStack` controlează alinierea pe direcția orizontală.

Moduri de aliniere:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` are aranjare orizontală, iar `alignment` controlează alinierea pe direcția verticală:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` are aranjare suprapusă, iar `alignment` poate controla alinierea pe direcția orizontală sau verticală:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Dacă nu specificăm explicit `alignment`, `VStack`, `HStack` și `ZStack` folosesc implicit `.center`.

**2. alignment în interiorul frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Atunci când dimensiunea oferită de `frame` este mai mare decât dimensiunea proprie a view-ului, `alignment` decide poziționarea view-ului în interiorul acelui `frame`. Modul concret de utilizare al lui `frame` va fi explicat mai târziu; aici este suficient să îl cunoaștem pe scurt.

### Spacer și mecanismul de distribuire a spațiului

`alignment` poate face ca view-urile să fie afișate ordonat pe direcție orizontală sau verticală. Totuși, atunci când vrem ca textul și imaginea să fie afișate la capete opuse, o singură setare de aliniere nu este suficientă.

De exemplu, dacă vrem să realizăm un view de tip bară superioară similar celui de pe site-ul [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), cu pictograma NHK în stânga și pictograma meniului în dreapta.

![Swift](../../RESOURCE/003_alignment3.png)

Dacă folosim doar `alignment`, pictograma NHK și pictograma meniului vor fi afișate doar pe aceeași parte. Nu le putem distribui în stânga și dreapta, deci avem nevoie de `Spacer` pentru a ocupa spațiul rămas.

`Spacer` este un view flexibil folosit pentru layout, care poate umple automat spațiul rămas disponibil.

Mod de utilizare:

```swift
Spacer()
```

De exemplu:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Atunci când adăugăm un `Spacer` între `Image` și `Text`, acesta va ocupa spațiul rămas și va împinge `Image` și `Text` către capetele de sus și de jos.

![Swift](../../RESOURCE/003_view1.png)

Dacă există mai multe `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Spațiul rămas va fi distribuit în mod egal între toate `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Afișarea imaginilor și controlul dimensiunii cu Image

View-ul `Image` este folosit în principal pentru afișarea imaginilor. Pictogramele SF Symbols învățate în lecția anterioară sunt doar una dintre utilizările lui `Image`.

Mod de utilizare:

```swift
Image("imageName")
```

Textul dintre ghilimele este numele imaginii și nu trebuie să includă extensia.

### Afișarea unei imagini

Mai întâi pregătim o imagine.

![Swift](../../RESOURCE/003_img.jpg)

În Xcode, selectează folderul de resurse Assets și trage imaginea în Assets.

![Swift](../../RESOURCE/003_img1.png)

În ContentView, folosim `Image` pentru a afișa imaginea:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Atenție: `Image` din SwiftUI nu poate reda animații GIF; poate afișa doar cadrul static.

### Controlul dimensiunii imaginii

În SwiftUI, `Image` afișează implicit imaginea la dimensiunea sa originală. Dacă vrem să ajustăm dimensiunea de afișare, trebuie mai întâi să folosim `resizable` pentru a permite scalarea imaginii, apoi să folosim `frame` pentru a specifica dimensiunea layout-ului.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modificatorul resizable

Modificatorul `resizable` permite imaginii să participe la scalare în layout, în loc să folosească fix dimensiunea originală.

```swift
.resizable()
```

Doar după adăugarea `resizable()`, `frame` poate modifica efectiv dimensiunea imaginii afișate.

Dacă omitem `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` va oferi doar spațiul de layout pentru imagine, însă dimensiunea imaginii în sine nu se va schimba.

### Modificatorul frame

`frame(width:height:)` este folosit pentru a specifica lățimea și înălțimea unui view.

Utilizare de bază:

```swift
.frame(width: 10,height: 10)
```

De exemplu, setăm imaginea ca un dreptunghi cu `width` 300 și `height` 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

De asemenea, putem seta doar lățimea sau doar înălțimea:

```swift
.frame(width: 200)
.frame(height: 100)
```

Combinația `resizable + frame` permite controlul flexibil al dimensiunii de afișare a imaginii în interfață, menținând în același timp capacitatea de scalare.

### Proporția de scalare: scaledToFit și scaledToFill

Atunci când folosim `frame` cu proporții diferite între lățime și înălțime, imaginea se poate întinde și deforma.

Dacă vrem ca imaginea să se adapteze la spațiul disponibil, păstrându-și proporțiile, putem folosi `scaledToFit` sau `scaledToFill`.

**scaledToFit**

`scaledToFit` păstrează proporția originală a imaginii și o scalează astfel încât să se potrivească complet în spațiul disponibil, fără a tăia imaginea:

```swift
.scaledToFit()
```

sau

```swift
.aspectRatio(contentMode: .fit)
```

Această metodă este potrivită atunci când vrem să afișăm imaginea complet și să evităm deformarea.

Dacă toate imaginile primesc aceeași lățime și înălțime, este inevitabil ca unele să apară deformate.

De exemplu:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Fără a seta proporția de scalare, imaginea nu poate fi afișată la proporția ei originală.

![Swift](../../RESOURCE/003_img4.png)

Setarea `scaledToFit` permite imaginii să-și păstreze proporția originală.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` păstrează și el proporția imaginii, dar va umple întregul spațiu disponibil. Dacă proporțiile nu coincid, părțile care depășesc zona disponibilă vor fi tăiate:

```swift
.scaledToFill()
```

sau

```swift
.aspectRatio(contentMode: .fill)
```

Această metodă este potrivită atunci când imaginea trebuie să acopere complet o zonă, de exemplu ca imagine de fundal sau banner. Este foarte potrivită pentru utilizarea imaginilor ca fundal.

**Diferența dintre cele două**

![Swift](../../RESOURCE/003_img6.png)

## Text

În SwiftUI, `Text` este folosit pentru afișarea textului.

Utilizare de bază:

```swift
Text("FangJunyu")
```

În lecția anterioară am învățat `Text`. În această lecție vom merge mai departe și vom învăța cum să controlăm dimensiunea și grosimea fontului, pentru ca textul să aibă mai multă expresivitate în view.

### Dimensiunea fontului

Folosim modificatorul `font` pentru a controla dimensiunea textului:

```swift
.font(.title)
```

De exemplu:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Dimensiuni de font folosite frecvent (de la mare la mic):

```id="xi59vs"
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Grosimea fontului

Dacă vrem ca textul să fie afișat cu caractere mai groase, putem folosi modificatorul `fontWeight`:

```swift
.fontWeight(.bold)
```

De exemplu:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Grosimi de font folosite frecvent (de la subțire la gros):

```id="m3jli8"
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controlează dimensiunea fontului, iar `fontWeight` controlează grosimea acestuia. Cele două pot fi combinate pentru a îmbogăți expresivitatea textului.

## Rezumat și practică

Până în acest punct, am învățat layout-ul implicit din SwiftUI, `Spacer`, `Image` și `Text`. Aceste cunoștințe sunt deja suficiente pentru a dezvolta câteva view-uri simple.

De exemplu: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Interfața Google este foarte curată. Ea conține imagini și text, iar noi putem încerca să analizăm structura interfeței Google din perspectiva SwiftUI:

1. În ansamblu, interfața este împărțită în trei părți: pictograma Google, bara de căutare și textul informativ. Putem folosi `VStack` pentru aranjare verticală.
2. Pictograma Google este o imagine și poate fi afișată cu `Image`.
3. Bara de căutare conține un câmp de introducere și o pictogramă. Dacă ignorăm temporar câmpul de introducere, putem folosi `Image` pentru a afișa pictograma de căutare.
4. Textul explicativ poate fi afișat cu `Text`, aranjarea orizontală a textului poate folosi `HStack`, iar culoarea textului poate fi controlată cu `foregroundStyle`.

Prin exersarea acestor cunoștințe, putem crea câteva view-uri simple și putem aprofunda înțelegerea și utilizarea view-urilor `Image` și `Text`, precum și a modificatorilor acestora.
