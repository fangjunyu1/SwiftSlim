# Teller

I de to forrige leksjonene lærte vi om variabler, konstanter, knapper og metoder.

I denne leksjonen skal vi kombinere denne kunnskapen og lage en enkel telleapp.

I dette eksemplet skal vi lære hvordan man lagrer og endrer variabler, og hvordan man bruker `@State` til å administrere variabler.

## Lag en teller

En teller brukes vanligvis til å registrere mengder som hele tiden må økes. For eksempel antall hopp med hoppetau eller runder under løping.

Nå skal vi lage en enkel teller: den viser et tall og en knapp, og når knappen trykkes, øker tallet.

![Num](../../RESOURCE/009_num.png)

### Vis et tall

Først bruker vi `Text` for å vise et tall.

```swift
Text("0")
```

Men hvis tallet må kunne endre seg, kan vi ikke skrive `"0"` direkte fast. I stedet bør vi bruke en variabel til å lagre tallet.

```swift
var num = 0
```

Deretter viser vi variabelen i `Text`：

```swift
Text("\(num)")
```

Her brukes strenginterpolasjon `\()` til å gjøre tallet om til en streng for visning.

### Knappen øker tallet

Deretter legger vi til en knapp.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Når knappen trykkes, vil vi at tallet skal øke.

Derfor kan vi endre variabelen i knappen:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Denne koden betyr: når knappen trykkes, regnes `num + 1` ut, og resultatet tilordnes `num`。

### En mer kortfattet skrivemåte

Swift tilbyr en kortere skrivemåte:

```swift
num += 1
```

Den er ekvivalent med:

```swift
num = num + 1
```

Denne skrivemåten kalles en “sammensatt tilordningsoperator”.

Vanlige sammensatte tilordningsoperatorer i Swift er:

```
+=   addisjonstilordning
-=   subtraksjonstilordning
*=   multiplikasjonstilordning
/=   divisjonstilordning
%=   resttilordning
```

For eksempel:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Fullstendig kode

Nå kan vi skrive en enkel teller:

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

Men nå vil ikke koden kjøre som den skal.

### Det oppstår en feil

Xcode viser:

```
Cannot assign to property: 'self' is immutable
```

Dette betyr at egenskapen ikke kan endres, fordi visningen er uforanderlig.

Hvorfor skjer dette?

## Hvordan SwiftUI fungerer

I SwiftUI er **grensesnittet datadrevet**。Det betyr at når data endres, oppdateres grensesnittet automatisk.

Men det er viktig å merke seg at SwiftUI bare overvåker endringer og oppdaterer visningen når en tilstand（som `@State` eller `@Binding`）endres.

Hvis vi bruker en vanlig variabel, leser SwiftUI bare verdien én gang når visningen opprettes. Selv om variabelen senere endres, blir ikke grensesnittet oppdatert.

For eksempel:

```swift
var num = 0   // 0
num = 1   // 0
```

I eksemplet over er `num` en vanlig variabel. Selv om verdien endres, vil ikke SwiftUI oppdatere visningen, og grensesnittet vil fortsatt vise den opprinnelige `0`。

![Num](../../RESOURCE/009_state.png)

Derfor er det bare når data merkes som tilstand（for eksempel med egenskapsinnpakninger som `@State` og `@Binding`）at SwiftUI automatisk overvåker endringer og oppdaterer visningen.

## `@State`-egenskapsinnpakning

I SwiftUI må vi bruke `@State` hvis vi vil endre en variabel og oppdatere visningen.

```swift
@State var num = 0
```

`@State` gjør at SwiftUI overvåker denne variabelen.

Når variabelen endres, vil SwiftUI beregne visningen på nytt og oppdatere den.

Fullstendig kode:

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

Nå, når knappen trykkes:

```swift
num += 1
```

vil SwiftUI oppdage at `num` har endret seg, og automatisk oppdatere visningen.

![Num](../../RESOURCE/009_state1.png)

## Regler for bruk av `@State`

I faktisk utvikling følger `@State` vanligvis to regler.

### 1. `@State` brukes vanligvis sammen med `private`

`@State`-variabler brukes vanligvis bare inne i den nåværende typen（for eksempel den nåværende `View`-strukturen）, og skrives derfor ofte slik:

```swift
@State private var num = 0
```

Dette kan hindre at andre visninger får direkte tilgang til eller endrer denne variabelen.

Vi har ikke lært `private` ennå, så du kan foreløpig forstå det enkelt slik:

**Innhold merket med `private` kan bare brukes i den nåværende visningen, og kan ikke brukes utenfra.**

### 2. `@State` brukes bare for tilstanden i den nåværende visningen

`@State` passer for data som administreres av den nåværende `View` selv.

For eksempel innhold i et tekstfelt eller tilstanden til en bryter.

```swift
@State private var isOn = false
@State private var text = ""
```

Hvis data må deles mellom flere visninger, må vi bruke andre tilstandstyper, som `@Binding` eller `@Observable`。

Dette skal vi lære i senere leksjoner.

### Reduser-knapp

En teller skal ikke bare kunne øke, men også minke.

Vi kan legge til en `-`-knapp.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Deretter bruker vi `HStack` til å ordne knappene horisontalt:

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

Resultat:

![Num](../../RESOURCE/009_num1.png)

Når `+`-knappen trykkes, øker tallet med `1`；når `-`-knappen trykkes, reduseres tallet med `1`。

### Nullstillingsknapp

Vi kan også legge til en nullstillingsknapp som setter tallet tilbake til `0`。

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Når nullstillingsknappen trykkes, får `num` verdien `0`。

Resultat:

![Num](../../RESOURCE/009_num2.png)

Når `0`-knappen trykkes, blir tallet `0`。

### Tilpasset knapp

Akkurat nå kan knappene våre bare vise tekst:

```swift
Button("+") {

}
```

Denne skrivemåten kan bare vise tekstinnhold, som `+` eller `-`。

I faktisk utvikling ønsker vi ofte at knapper skal ha et rikere utseende, for eksempel ved å bruke ikoner eller andre visninger.

SwiftUI lar oss tilpasse det som vises på knappen. Da kan vi bruke en annen skrivemåte for knappen:

```swift
Button(action: {

}, label: {

})
```

I denne skrivemåten er `action` koden som kjøres når knappen trykkes, og `label` er visningen som knappen skal vise.

For eksempel kan vi la knappen vise et `SF Symbols`-ikon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Da vil knappen ikke lenger vise tekst, men et ikon.

### Forbedre tellergrensesnittet

For å gjøre tellergrensesnittet tydeligere kan vi også justere hvordan tallet vises. For eksempel ved å gjøre tallet større:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Deretter endrer vi også knappene slik at de viser ikoner, og forstørrer ikonene litt:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

På samme måte kan vi også gjøre redusere-knappen og nullstillingsknappen om til ikonknapper:

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

Nå viser knappene `SF Symbols`-ikoner, og grensesnittet blir mer intuitivt.

![Num](../../RESOURCE/009_num3.png)

## Oppsummering

I denne leksjonen laget vi en enkel teller og øvde samlet på bruk av variabler, `Text` og `Button`。Vi brukte en variabel til å lagre tallet, og kontrollerte økning og reduksjon gjennom knapper, samtidig som vi lærte sammensatte tilordningsoperatorer som `num += 1` og `num -= 1`。

Under implementeringen fikk vi også innsikt i hvordan SwiftUI fungerer: grensesnittet drives av data. Først når dataene endres, oppdateres grensesnittet. Derfor må vi bruke `@State` for å lagre tilstand som kan endres, slik at SwiftUI kan oppdatere visningen automatisk når en `@State`-variabel endres.

Til slutt gjorde vi en enkel forbedring av grensesnittet ved å justere skriftstilen i `Text` og bruke `Button(action:label:)` til å tilpasse knappens innhold, slik at knappene kan vise ikoner og gjøre tellergrensesnittet tydeligere og penere.

Nå har vi fått kontakt med den grunnleggende måten SwiftUI-visninger brukes på. I SwiftUI drives de fleste grensesnitt av variabler. Når variabler endres, oppdaterer SwiftUI visningen automatisk. Derfor må vi vanligvis først tenke gjennom hvilke data som skal lagres, og så bygge grensesnitt og interaksjonslogikk ut fra disse dataene.

## Fullstendig kode

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
