# Prachtige kleuren

In deze les leren we veelgebruikte visuele modifiers in SwiftUI, waaronder:

- kleur
- voorgrondkleur
- achtergrondkleur
- verschuiving
- transparantie
- vervaging

We leren ook over Safe Area (veilig gebied).

Deze modifiers worden gebruikt om het uiterlijk van views te regelen, zodat de interface duidelijker en gelaagder wordt.

## Kleur

In SwiftUI kun je de kleur van tekst instellen.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue betekent blauw en is in feite een verkorte schrijfwijze van Color.blue (type inference).

Veelvoorkomende kleuren zijn onder andere:

```swift
.black
.green
.yellow
.pink
.gray
...
```

Dit zijn allemaal statische eigenschappen van Color.

![Color](../../RESOURCE/006_color.png)

Je kunt Color zien als een kleurtype, en .blue en .red zijn concrete kleuren daarvan.

### De Color-view

In SwiftUI kan Color ook als view worden weergegeven.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Deze code maakt een rood vierkant van 100 × 100.

Je kunt ook de hele interface in een bepaalde kleur weergeven:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Na het uitvoeren zie je dat rood niet het hele scherm vult; de boven- en onderkant van de iPhone blijven nog wit. Hierbij speelt het bestaan van Safe Area (veilig gebied) een rol.

## Safe Area (veilig gebied)

Safe Area is het gebied dat het systeem reserveert om te voorkomen dat inhoud wordt afgedekt. Dit omvat:

1. de statusbalk bovenaan (tijd, batterij)

2. de Home-indicator onderaan

3. het notch- of Dynamic Island-gebied

![Color](../../RESOURCE/006_color3.png)

SwiftUI beperkt inhoud standaard tot het veilige gebied, waardoor views niet tot aan de schermranden doorlopen.

### Safe Area negeren

Als je wilt dat de kleur het hele scherm vult, kun je ignoresSafeArea gebruiken:

```swift
Color.red
    .ignoresSafeArea()
```

Of je kunt edgesIgnoringSafeArea gebruiken:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Op deze manier loopt de view door over het hele scherm.

Let erop dat edgesIgnoringSafeArea een oudere schrijfwijze is. Sinds iOS 14 wordt ignoresSafeArea aanbevolen.

## Voorgrondkleur

### De foregroundStyle-modifier

In eerdere lessen hebben we foregroundStyle al gebruikt om kleur in te stellen.

Bijvoorbeeld:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle is het nieuwe stijlsysteem en ondersteunt kleuren, verlopen, materialen enzovoort.

![Color](../../RESOURCE/006_color2.png)

### De foregroundColor-modifier

foregroundColor kan ook kleur instellen:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

De gebruikswijze is hetzelfde als bij foregroundStyle.

In de nieuwste Xcode-versies geeft Xcode aan dat foregroundColor in toekomstige iOS-versies mogelijk wordt uitgefaseerd, en dat het beter is om eerst foregroundStyle te gebruiken.

## Achtergrond

Als je een achtergrondkleur aan een view wilt toevoegen, kun je background gebruiken:

```swift
background(.red)
```

Bijvoorbeeld, een achtergrondkleur toevoegen aan tekst:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Wanneer we tekst selecteren in apps zoals Word en Chrome, zien we een vergelijkbaar effect van achtergrondkleur.

![Color](../../RESOURCE/006_color16.png)

Als je de achtergrond wilt vergroten, moet je dit combineren met padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Hier moet je op een belangrijke regel letten:

SwiftUI bouwt views van boven naar beneden op via modifiers. Een modifier die later wordt geschreven, werkt op het resultaat van de eerdere modifiers.

Dus:

```swift
.padding()
.background()
```

Dit betekent dat de achtergrond de view inclusief de toegevoegde binnenruimte zal omhullen.

Als je de volgorde omdraait:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

dan wordt de achtergrond niet groter, omdat de achtergrond de latere padding niet omsluit.

## Voorbeeld - vierkante moer met afgeronde hoeken

Nu maken we een eenvoudige view van een vierkante moer met afgeronde hoeken.

![Color](../../RESOURCE/006_color8.png)

Maak eerst een wit vierkant van 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Als je het rond wilt maken, kun je cornerRadius gebruiken:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Wanneer de straal van de afgeronde hoeken gelijk is aan de helft van de breedte en hoogte, wordt het een cirkel.

Voeg nu een blauwe achtergrond toe:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

De nieuw toegevoegde padding vergroot het buitenste gebied, en background tekent blauw op dat buitenste gebied.

Zo is het effect van een vierkante moer met afgeronde hoeken voltooid.

### Een andere aanpak

Naast het gebruiken van achtergrondkleur om deze vorm te maken, kun je ook ZStack gebruiken.

We hebben eerder geleerd dat ZStack views over elkaar kan stapelen. Een vierkante moer met afgeronde hoeken kun je ook zien als een cirkel en een rechthoek die over elkaar heen liggen.

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

ZStack stapelt views in volgorde, waarbij later toegevoegde views bovenop worden weergegeven.

## Voorbeeld - twee overlappende cirkels

Veel iconen bestaan uit eenvoudige vormen die over elkaar heen worden gelegd, bijvoorbeeld twee overlappende cirkels.

![Color](../../RESOURCE/006_color14.png)

Maak eerst twee cirkels:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Omdat de twee cirkels over elkaar heen moeten worden weergegeven, gebruiken we een ZStack-layout:

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

Op dit moment overlappen twee cirkels van gelijke grootte elkaar volledig.

We willen dat ze gedeeltelijk overlappen in plaats van elkaar volledig te bedekken, dus kunnen we offset gebruiken om een verschuivingseffect te maken.

## Verschuiving

offset verandert alleen de tekenpositie van een view en heeft geen invloed op de layoutberekening van de bovenliggende view.

Gebruik:

```swift
.offset(x:y:)
```

x is de horizontale verschuiving en y is de verticale verschuiving.

Een positieve waarde betekent verschuiven naar rechts/beneden, en een negatieve waarde betekent verschuiven naar links/boven.

Gebruik offset om de twee cirkels gedeeltelijk te laten overlappen:

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

De positie van de rode cirkel in de layout verandert niet, maar de tekenpositie wordt 25 punten naar links verschoven. Daardoor ontstaat het visuele effect van gedeeltelijke overlap.

## Transparantie

In SwiftUI wordt opacity gebruikt om de transparantie van een view in te stellen.

Basisgebruik:

```swift
.opacity(0.5)
```

De parameter van opacity loopt van 0.0 tot 1.0, waarbij:

* 0 volledig transparant betekent
* 1 ondoorzichtig betekent

Je kunt opacity gebruiken om de transparantie van de oranje cirkel in te stellen:

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

Wanneer de opacity van de oranje cirkel op 0.8 staat, is de ondoorzichtigheid 80%. Wanneer de twee cirkels overlappen, ontstaat in het overlappende gebied een kleurmenging.

## Vervaging

In SwiftUI kun je blur gebruiken om een vervagingseffect in te stellen:

```swift
.blur(radius:10)
```

radius definieert de straal van de vervaging. Hoe groter de waarde, hoe duidelijker het vervagingseffect.

We kunnen aan de twee cirkels een vervagingseffect toevoegen:

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

Uiteindelijk zien we twee sterk vervaagde cirkels.

## Samenvatting

Deze les draaide om veelgebruikte visuele modifiers in SwiftUI. We hebben geleerd hoe je met modifiers de kleur, positie en visuele effecten van views kunt regelen.

Via concrete voorbeelden kun je zien welke praktische rol verschillende visuele modifiers in de interface spelen, en hebben we kennisgemaakt met het veilige gebied.

Dit zijn allemaal zeer basale modifiers. Door ze vaker te oefenen en te gebruiken, kun je in echte ontwikkeling de interface-effecten duidelijker beheersen.

### Oefeningen na de les

* Voeg transparantie en vervaging toe aan een afbeelding
* Stel drie overlappende cirkels in met verschillende transparanties
* Maak een achtergrondafbeelding die het hele scherm vult en negeer het veilige gebied
* Gebruik offset om de positie van meerdere views aan te passen

Het doel van deze oefeningen is niet om de API uit het hoofd te leren, maar om de relatie tussen visuele veranderingen en layoutgedrag te observeren.
