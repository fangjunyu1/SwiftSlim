# Sjajne boje

U ovoj ćemo lekciji naučiti uobičajene vizualne modifikatore u SwiftUI-ju, uključujući:

- boje
- boju prednjeg plana
- boju pozadine
- pomak
- prozirnost
- zamućenje

Također ćemo naučiti i o `Safe Area` (sigurnom području).

Ti se modifikatori koriste za kontrolu izgleda prikaza i čine sučelje jasnijim i slojevitijim.

## Boja

U SwiftUI-ju možemo postaviti boju teksta.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` znači plava boja i zapravo je pojednostavljeni zapis za `Color.blue` (zaključivanje tipa).

Česte boje uključuju:

```
.black
.green
.yellow
.pink
.gray
...
```

Sve su to statička svojstva tipa `Color`.

![Color](../../RESOURCE/006_color.png)

`Color` možemo shvatiti kao tip boje, a `.blue`、`.red` i druge vrijednosti njegove su konkretne boje.

### `Color` prikaz

U SwiftUI-ju `Color` također može biti prikazan kao samostalan prikaz.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Ovaj će kod stvoriti crveni kvadrat veličine `100×100`.

Možete i cijelo sučelje prikazati jednom bojom:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Nakon pokretanja možete primijetiti da crvena boja ne prekriva cijeli zaslon; na vrhu i dnu iPhonea još uvijek ostaje bijeli prostor. To je povezano s postojanjem `Safe Area`.

## `Safe Area`

`Safe Area` je područje koje sustav ostavlja kako sadržaj ne bi bio prekriven, a uključuje:

1. gornju statusnu traku (vrijeme, baterija)

2. donji Home indikator

3. područje notcha ili Dynamic Islanda

![Color](../../RESOURCE/006_color3.png)

SwiftUI prema zadanim postavkama ograničava sadržaj unutar sigurnog područja, pa se prikazi ne protežu do samih rubova zaslona.

### Ignoriranje `Safe Area`

Ako želite da boja ispuni cijeli zaslon, možete koristiti `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Ili `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Tako će se prikaz proširiti preko cijelog zaslona.

Važno je napomenuti da je `edgesIgnoringSafeArea` stariji zapis, a od iOS-a 14 preporučuje se `ignoresSafeArea`.

## Boja prednjeg plana

### Modifikator `foregroundStyle`

U prethodnim smo lekcijama učili kako koristiti `foregroundStyle` za postavljanje boje.

Na primjer:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` je noviji sustav stilova koji podržava boje, gradijente, materijale i slično.

![Color](../../RESOURCE/006_color2.png)

### Modifikator `foregroundColor`

`foregroundColor` također može postaviti boju:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Način korištenja isti je kao kod `foregroundStyle`.

U najnovijim verzijama Xcodea, Xcode upozorava da bi `foregroundColor` mogao biti zastario u budućim verzijama iOS-a, pa se preporučuje dati prednost `foregroundStyle`.

## Pozadina

Ako želite prikazu dodati boju pozadine, možete koristiti `background`:

```swift
background(.red)
```

Na primjer, dodavanje boje pozadine tekstu:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Sličan efekt boje pozadine možemo vidjeti kada označimo tekst u aplikacijama kao što su Word ili Chrome.

![Color](../../RESOURCE/006_color16.png)

Ako želimo povećati pozadinu, trebamo je kombinirati s `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Ovdje treba obratiti pozornost na jedno važno pravilo:

SwiftUI modifikatori grade prikaz odozgo prema dolje. Modifikator koji je napisan kasnije djeluje na rezultat prethodnih modifikatora.

Dakle:

```swift
.padding()
.background()
```

To znači da će pozadina obuhvatiti prikaz nakon dodavanja unutarnjeg razmaka.

Ako obrnemo redoslijed:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Pozadina se neće proširiti, jer ne obuhvaća kasnije dodani `padding`.

## Primjer - četverokutna matica

Sada ćemo napraviti jednostavan prikaz četverokutne matice.

![Color](../../RESOURCE/006_color8.png)

Najprije napravimo bijeli kvadrat veličine `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Ako ga želimo pretvoriti u krug, možemo koristiti `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Kada je radijus zaobljenja jednak polovici širine i visine, oblik postaje krug.

Sada dodajmo plavu pozadinu:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Dodani `padding` proširit će vanjsko područje, a `background` će nacrtati plavu boju na tom vanjskom području.

Tako smo dobili efekt četverokutne matice.

### Drugi pristup

Osim korištenja boje pozadine za izradu četverokutne matice, možemo koristiti i `ZStack`.

Ranije smo učili da `ZStack` omogućuje slojeviti raspored, a četverokutna matica također se može shvatiti kao preklapanje kruga i pravokutnika.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` slaže prikaze redoslijedom, a prikaz dodan kasnije prikazuje se iznad prethodnih.

## Primjer - dva preklopljena kruga

Mnoge se ikone sastoje od preklapanja jednostavnih oblika, na primjer dva preklopljena kruga.

![Color](../../RESOURCE/006_color14.png)

Najprije stvorimo dva kruga:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Budući da želimo da se dva kruga preklapaju, koristimo `ZStack` raspored:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

U ovom trenutku dva jednako velika kruga potpuno se preklapaju.

Želimo da se preklapaju samo djelomično, a ne potpuno, pa možemo koristiti `offset` kako bismo stvorili efekt pomaka.

## Pomak

`offset` mijenja samo poziciju crtanja prikaza i ne utječe na izračun rasporeda roditeljskog prikaza.

Način korištenja:

```swift
.offset(x:y:)
```

`x` je vodoravni pomak, a `y` okomiti pomak.

Pozitivne vrijednosti znače pomak udesno/prema dolje, a negativne ulijevo/prema gore.

Koristimo `offset` kako bismo postavili djelomično preklapanje dva kruga:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Položaj crvenog kruga u rasporedu nije se promijenio, ali je njegova pozicija crtanja pomaknuta 25 točaka ulijevo. Zbog toga nastaje vizualni efekt djelomičnog preklapanja dvaju krugova.

## Prozirnost

U SwiftUI-ju se `opacity` koristi za postavljanje prozirnosti prikaza.

Osnovna upotreba:

```swift
.opacity(0.5)
```

Raspon parametra `opacity` je od `0.0` do `1.0`, pri čemu:

- `0` znači potpuno prozirno
- `1` znači neprozirno

Možemo koristiti `opacity` za postavljanje prozirnosti narančastog kruga:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Kada se `opacity` narančastog kruga postavi na `0.8`, njegova je neprozirnost 80%. Kada se dva kruga preklapaju, u području preklapanja dolazi do miješanja boja.

## Zamućenje

U SwiftUI-ju možemo koristiti `blur` za postavljanje efekta zamućenja:

```swift
.blur(radius:10)
```

`radius` definira radijus zamućenja; što je vrijednost veća, efekt zamućenja bit će izraženiji.

Možemo dodati efekt zamućenja dvama krugovima:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Na kraju možemo vidjeti dva vrlo zamućena kruga.

## Sažetak

U ovoj smo lekciji obradili uobičajene vizualne modifikatore u SwiftUI-ju i naučili kako pomoću modifikatora kontrolirati boju, položaj i vizualne efekte prikaza.

Kroz konkretne primjere mogli smo vidjeti stvarnu ulogu različitih vizualnih modifikatora u sučelju, a također smo upoznali i koncept sigurnog područja.

Sve su to vrlo osnovni modifikatori. Ako ih više vježbamo i koristimo, moći ćemo jasnije kontrolirati efekte sučelja u stvarnom razvoju.

### Vježba nakon lekcije

- Dodajte prozirnost i efekt zamućenja jednoj slici
- Postavite tri kruga s različitim razinama prozirnosti koji se preklapaju
- Napravite pozadinsku sliku koja prekriva cijeli zaslon i ignorira sigurno područje
- Koristite `offset` za prilagodbu položaja više prikaza

Svrha vježbe nije zapamtiti API, nego promatrati odnos između vizualnih promjena i ponašanja rasporeda.
