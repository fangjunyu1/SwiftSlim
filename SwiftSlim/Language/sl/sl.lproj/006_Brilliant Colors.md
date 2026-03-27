# Živahne barve

V tej lekciji bomo spoznali pogoste vizualne modifikatorje v SwiftUI, vključno z:

- barvo
- barvo ospredja
- barvo ozadja
- zamikom
- prosojnostjo
- zameglitvijo

Spoznali bomo tudi Safe Area (varno območje).

Ti modifikatorji se uporabljajo za nadzor vizualnega videza pogleda, da je vmesnik bolj jasen in bolj plastovit.

## Barva

V SwiftUI lahko nastavimo barvo besedila.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
````

.blue pomeni modro barvo. To je pravzaprav skrajšana oblika za Color.blue (sklepanje tipa).

Pogoste barve vključujejo:

```swift
.black
.green
.yellow
.pink
.gray
...
```

To so vse statične lastnosti tipa Color.

![Color](../../RESOURCE/006_color.png)

Color si lahko predstavljamo kot tip za barve, medtem ko sta .blue in .red njegovi konkretni barvi.

### Pogled Color

V SwiftUI je lahko tudi Color prikazan kot pogled.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Ta koda ustvari rdeč kvadrat velikosti 100 × 100.

Lahko pa tudi celoten vmesnik prikažemo v določeni barvi:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Po zagonu lahko opazimo, da rdeča barva ne zapolni celotnega zaslona. Zgornji in spodnji del iPhona sta še vedno bela. Tu pride v poštev Safe Area (varno območje).

## Safe Area（varno območje）

Safe Area je območje, ki ga sistem rezervira, da vsebina ne bi bila prekrita, in vključuje:

1. zgornjo statusno vrstico (čas, baterija)

2. spodnji indikator Home

3. območje z zarezo (notch) ali Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI privzeto omeji vsebino znotraj varnega območja, zato pogled ne sega do roba zaslona.

### Ignoriranje Safe Area（varnega območja）

Če želimo, da barva zapolni celoten zaslon, lahko uporabimo ignoresSafeArea:

```swift
Color.red
    .ignoresSafeArea()
```

ali pa uporabimo edgesIgnoringSafeArea:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Na ta način se bo pogled razširil čez celoten zaslon.

Treba je poudariti, da je edgesIgnoringSafeArea starejši zapis. Od iOS 14 naprej je priporočena uporaba ignoresSafeArea.

## Barva ospredja

### Modifikator foregroundStyle

V prejšnjih lekcijah smo že spoznali foregroundStyle za nastavljanje barve.

Na primer:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle je novejši sistem slogov, ki podpira barve, prelive, materiale in podobno.

![Color](../../RESOURCE/006_color2.png)

### Modifikator foregroundColor

Barvo lahko nastavimo tudi z foregroundColor:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Način uporabe je enak kot pri foregroundStyle.

V najnovejših različicah Xcode bo Xcode opozoril, da bo foregroundColor v prihodnjih različicah iOS morda opuščen, zato je priporočljivo dati prednost foregroundStyle.

## Ozadje

Če želimo pogledu dodati barvo ozadja, lahko uporabimo background:

```swift
background(.red)
```

Na primer, če želimo besedilu dodati barvo ozadja:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Podoben učinek barvnega ozadja lahko opazimo, ko v aplikacijah, kot sta Word ali Chrome, izberemo besedilo.

![Color](../../RESOURCE/006_color16.png)

Če želimo povečati ozadje, ga moramo kombinirati s padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Tu je treba paziti na pomembno pravilo:

modifikatorji v SwiftUI gradijo pogled od zgoraj navzdol. Modifikator, ki je zapisan kasneje, deluje na rezultat prejšnjih modifikatorjev.

Torej:

```swift
.padding()
.background()
```

to pomeni, da bo ozadje ovilo pogled po tem, ko je bil dodan notranji odmik.

Če pa vrstni red obrnemo:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

se ozadje ne bo povečalo, ker ne ovija padding, ki je zapisan kasneje.

## Primer - štirikotni vijak

Zdaj bomo izdelali preprost pogled štirikotnega vijaka.

![Color](../../RESOURCE/006_color8.png)

Najprej naredimo bel kvadrat velikosti 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Če ga želimo spremeniti v krog, lahko uporabimo cornerRadius:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Ko je polmer zaoblitve enak polovici širine in višine, se oblika spremeni v krog.

Zdaj dodamo modro ozadje:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Novi padding poveča zunanje območje, background pa na tem območju nariše modro barvo.

Tako dobimo učinek štirikotnega vijaka.

### Drugačen pristop

Poleg uporabe barve ozadja lahko štirikotni vijak ustvarimo tudi z ZStack.

Prej smo spoznali, da ZStack omogoča nalaganje pogledov enega na drugega. Tudi štirikotni vijak lahko razumemo kot prekrivanje kroga in pravokotnika.

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

ZStack bo poglede zložil enega na drugega po vrstnem redu, pri čemer bo kasneje dodani pogled prikazan na vrhu.

## Primer - dva prekrivajoča se kroga

Veliko ikon je sestavljenih iz preprostih oblik, naloženih eno čez drugo, na primer dveh prekrivajočih se krogov.

![Color](../../RESOURCE/006_color14.png)

Najprej ustvarimo dva kroga:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Ker želimo, da se kroga prikazujeta prekrivajoče, uporabimo postavitev ZStack:

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

Na tej točki se dva enako velika kroga popolnoma prekrivata.

Želimo, da se kroga delno prekrivata in ne popolnoma. Za to lahko uporabimo offset za zamik.

## Zamik

offset spremeni le položaj izrisa pogleda in ne vpliva na izračun postavitve v nadrejenem pogledu.

Uporaba:

```swift
.offset(x:y:)
```

x predstavlja zamik v vodoravni smeri, y pa zamik v navpični smeri.

Pozitivna vrednost pomeni zamik v desno oziroma navzdol, negativna pa v levo oziroma navzgor.

Z offset lahko nastavimo delno prekrivanje dveh krogov:

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

Položaj rdečega kroga v postavitvi se ni spremenil, vendar se je njegov izris premaknil za 25 točk v levo. Tako kroga ustvarita vizualni učinek delnega prekrivanja.

## Prosojnost

V SwiftUI se za nastavitev prosojnosti pogleda uporablja opacity.

Osnovna uporaba:

```swift
.opacity(0.5)
```

Parameter opacity ima razpon od 0.0 do 1.0, pri čemer:

* 0 pomeni popolnoma prosojno
* 1 pomeni neprosojno

Z opacity lahko nastavimo prosojnost oranžnega kroga:

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

Ko je opacity oranžnega kroga nastavljen na 0.8, njegova neprosojnost znaša 80 %. Ko se kroga prekrivata, se v prekrivajočem območju pojavi učinek mešanja barv.

## Zameglitev

V SwiftUI lahko uporabimo blur za učinek zameglitve:

```swift
.blur(radius:10)
```

radius določa polmer zameglitve. Večja kot je vrednost, izrazitejši je učinek.

Učinek zameglitve lahko dodamo dvema krogoma:

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

Na koncu lahko vidimo dva zelo zamegljena kroga.

## Povzetek

Ta lekcija se je osredotočila na pogoste vizualne modifikatorje v SwiftUI in pokazala, kako z njimi nadzorujemo barvo, položaj in vizualne učinke pogleda.

S konkretnimi primeri lahko vidimo dejansko vlogo različnih vizualnih modifikatorjev v vmesniku in hkrati spoznamo tudi koncept varnega območja.

To so zelo osnovni modifikatorji. Smiselno jih je večkrat vaditi in uporabljati, saj pomagajo pri bolj jasnem nadzoru nad videzom vmesnika v dejanskem razvoju.

### Vaje po lekciji

* Dodajte sliki učinek prosojnosti in zameglitve
* Nastavite tri kroge z različnimi stopnjami prosojnosti, ki se prekrivajo
* Ustvarite sliko ozadja, ki zapolni celoten zaslon in ignorira varno območje
* Z offset prilagodite položaj več pogledov

Cilj vaj ni zapomniti si API, ampak opazovati razmerje med vizualnimi spremembami in obnašanjem postavitve.
