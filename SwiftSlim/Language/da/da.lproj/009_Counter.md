# Tæller

I de to foregående lektioner lærte vi om variabler, konstanter, knapper og funktioner.

I denne lektion kombinerer vi denne viden for at lave en enkel tæller-app.

I dette eksempel lærer vi, hvordan man gemmer og ændrer variabler, samt hvordan man bruger `@State` til at styre dem.

## Lav en tæller

En tæller bruges typisk til at registrere et antal, der hele tiden skal lægges til, for eksempel antal sjippetag eller løberunder.

Nu laver vi en enkel tæller: vis et tal og en knap, og lad tallet stige, når der trykkes på knappen.

![Num](../../RESOURCE/009_num.png)

### Vis tallet

Først bruger vi `Text` til at vise tallet.

```swift
Text("0")
```

Men hvis tallet skal kunne ændre sig, kan vi ikke bare skrive `"0"` fast ind. Vi bør i stedet gemme tallet i en variabel.

```swift
var num = 0
```

Vis derefter variablen i `Text`:

```swift
Text("\(num)")
```

Her bruger vi strenginterpolation `\()` til at omdanne tallet til en streng, så det kan vises.

### Knap der øger tallet

Dernæst tilføjer vi en knap.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Når der trykkes på knappen, vil vi have tallet til at stige.

Derfor kan vi ændre variablen i knappen:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Denne kode betyder: Når der trykkes på knappen, beregnes `num + 1`, og resultatet tildeles derefter tilbage til `num`.

### En mere kortfattet skrivemåde

Swift tilbyder en mere kompakt måde at skrive det på:

```swift
num += 1
```

Det svarer til:

```swift
num = num + 1
```

Denne skrivemåde kaldes en sammensat tildelingsoperator.

Almindelige sammensatte tildelingsoperatorer i Swift er:

```
+=   additionstildeling
-=   subtraktionstildeling
*=   multiplikationstildeling
/=   divisionstildeling
%=   modulo-tildeling
```

For eksempel:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Fuld kode

Nu kan vi skrive en enkel tæller:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Men på dette tidspunkt kan koden ikke køre korrekt.

### Der opstår en fejl

Xcode vil vise:

```
Cannot assign to property: 'self' is immutable
```

Det betyder, at egenskaben ikke kan ændres, fordi viewet er uforanderligt.

Hvorfor sker det?

## Sådan virker SwiftUI

I SwiftUI gælder det, at: **brugerfladen drives af data**. Det betyder, at når data ændrer sig, opdateres brugerfladen automatisk.

Men det er vigtigt at forstå, at SwiftUI kun overvåger ændringer og opdaterer visningen, når en tilstand (`state`) ændrer sig, for eksempel `@State` eller `@Binding`.

Hvis man bruger en almindelig variabel, læser SwiftUI kun dens værdi én gang, når viewet oprettes. Selv hvis variablen ændrer sig bagefter, opdateres brugerfladen ikke.

For eksempel:

```swift
var num = 0   // 0
num = 1   // 0
```

I eksemplet ovenfor er `num` en almindelig variabel. Selvom dens værdi ændrer sig, vil SwiftUI ikke opdatere visningen, og interfacet vil stadig vise den oprindelige `0`.

![Num](../../RESOURCE/009_state.png)

Derfor er det kun, når data markeres som tilstand, for eksempel ved brug af `@State`, `@Binding` og andre property wrappers, at SwiftUI automatisk overvåger ændringer og opdaterer visningen.

## @State property wrapper

I SwiftUI skal man bruge `@State`, hvis man vil ændre en variabel og samtidig opdatere visningen.

```swift
@State var num = 0
```

`@State` får SwiftUI til at overvåge denne variabel.

Når variablen ændrer sig, vil SwiftUI beregne visningen igen og opdatere interfacet.

Fuld kode:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Nu, når knappen trykkes:

```swift
num += 1
```

vil SwiftUI opdage, at `num` er ændret, og derefter automatisk opdatere visningen.

![Num](../../RESOURCE/009_state1.png)

## Regler for brug af @State

I reel udvikling følger `@State` normalt to regler.

### 1. @State bruges normalt sammen med private

`@State`-variabler bruges som regel kun i den aktuelle type, for eksempel i den aktuelle `View`-struktur, og derfor skrives de ofte sådan:

```swift
@State private var num = 0
```

Det forhindrer andre visninger i at få direkte adgang til eller ændre denne variabel.

Vi har endnu ikke lært `private`, men du kan foreløbig forstå det sådan:

**Indhold markeret med `private` kan kun bruges i den aktuelle visning. Ydre visninger kan ikke bruge det.**

### 2. @State bruges kun til tilstand i den aktuelle visning

`@State` passer til data, som den aktuelle `View` selv styrer.

For eksempel indholdet i et tekstfelt eller tilstanden for en switch.

```swift
@State private var isOn = false
@State private var text = ""
```

Hvis data skal deles mellem flere visninger, skal man bruge andre tilstandstyper, for eksempel `@Binding` eller `@Observable`.

Det lærer vi i senere lektioner.

### Knap til at mindske tallet

En tæller skal ikke kun kunne øges, men også kunne mindskes.

Vi kan tilføje en `-`-knap.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Brug derefter `HStack` til at arrangere knapperne vandret:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Effekt:

![Num](../../RESOURCE/009_num1.png)

Når der trykkes på `+`, stiger tallet med `1`; når der trykkes på `-`, falder tallet med `1`.

### Nulstillingsknap

Vi kan også tilføje en nulstillingsknap, som sætter tallet tilbage til `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Når der trykkes på nulstillingsknappen, bliver `num` sat til `0`.

Effekt:

![Num](../../RESOURCE/009_num2.png)

Når knappen `0` trykkes, bliver tallet `0`.

### Tilpasset knap

Indtil nu kan vores knapper kun vise tekst:

```swift
Button("+") {

}
```

Denne form for knap kan kun vise tekstindhold som `+` eller `-`.

I reel udvikling ønsker vi ofte, at knapperne skal have et rigere udseende, for eksempel med ikoner eller andre views.

SwiftUI giver os mulighed for at tilpasse knappens visuelle indhold. I det tilfælde kan vi bruge den anden skrivemåde for knapper:

```swift
Button(action: {

}, label: {

})
```

I denne skrivemåde er `action` den kode, der udføres ved klik, og `label` er den visning, der vises som selve knappen.

For eksempel kan vi lade knappen vise et SF Symbols-ikon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

På den måde viser knappen ikke længere tekst, men et ikon.

### Optimer tællerens interface

For at gøre tællerens interface tydeligere kan vi også justere, hvordan tallet vises. For eksempel kan vi gøre tallet større:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Dernæst kan vi ændre knappernes indhold til ikoner og samtidig gøre ikonerne lidt større:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

På samme måde kan vi ændre minusknappen og nulstillingsknappen til ikoner:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Nu viser knapperne SF Symbols-ikoner, og interfacet bliver mere intuitivt.

![Num](../../RESOURCE/009_num3.png)

## Opsummering

I denne lektion øvede vi samlet brugen af variabler, `Text` og `Button` ved at lave en enkel tæller. Vi brugte en variabel til at gemme tallet og lod knapperne styre, om tallet skulle stige eller falde. Samtidig lærte vi sammensatte tildelingsoperatorer som `num += 1` og `num -= 1`.

Under implementeringen forstod vi også, hvordan SwiftUI arbejder: brugerfladen drives af data. Først når data ændrer sig, bliver interfacet opdateret. Derfor skal vi bruge `@State` til at gemme tilstand, der kan ændre sig. Når en `@State`-variabel ændres, opdaterer SwiftUI automatisk visningen.

Til sidst lavede vi en enkel optimering af interfacet ved at justere tekstens fontstil og bruge `Button(action:label:)` til at tilpasse knappens indhold, så knapperne kunne vise ikoner og tællerens interface blev tydeligere og mere pænt.

Nu har vi allerede stiftet bekendtskab med den grundlæggende måde, SwiftUI-visninger bruges på. I SwiftUI drives størstedelen af interfacet af variabler. Når variabler ændrer sig, opdaterer SwiftUI automatisk visningen. Derfor skal vi i udviklingen af SwiftUI-apps som regel først designe, hvilke data der skal gemmes, og derefter bygge interface og interaktionslogik ud fra disse data.

## Fuld kode

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
