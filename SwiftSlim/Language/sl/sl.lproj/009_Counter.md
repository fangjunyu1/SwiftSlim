# Števec

V prejšnjih dveh lekcijah smo se naučili o spremenljivkah, konstantah, gumbih in funkcijah.

V tej lekciji bomo to znanje povezali in izdelali preprosto aplikacijo števca.

V tem primeru se bomo naučili, kako shranjevati in spreminjati spremenljivke ter kako uporabljati @State za upravljanje spremenljivk.

## Izdelava števca

Števec se običajno uporablja za beleženje količin, ki se morajo neprestano povečevati. Na primer število preskokov kolebnice ali število tekaških krogov.

Spodaj bomo izdelali preprost števec: prikazali bomo eno številko in gumb, ob kliku pa se bo številka povečala.

![Num](../../RESOURCE/009_num.png)

### Prikaz številke

Najprej uporabimo Text za prikaz številke.

```swift
Text("0")
````

Če pa se mora številka spreminjati, ne moremo neposredno zapisati "0", ampak moramo številko shraniti v spremenljivko.

```swift
var num = 0
```

Nato spremenljivko prikažemo v Text:

```swift
Text("\(num)")
```

Tukaj uporabljamo interpolacijo niza \(), da številko pretvorimo v niz za prikaz.

### Gumb za povečanje številke

Nato dodamo gumb.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Ko je gumb kliknjen, želimo, da se številka poveča.

Zato lahko v gumbu spremenimo vrednost spremenljivke:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Ta koda pomeni: ob kliku gumba izračunamo num + 1 in rezultat znova dodelimo spremenljivki num.

### Krajši zapis

Swift ponuja tudi bolj kratek zapis:

```swift
num += 1
```

To je enakovredno zapisu:

```swift
num = num + 1
```

Tak zapis se imenuje »sestavljeni operator prirejanja«.

Pogosti sestavljeni operatorji prirejanja v Swiftu so:

```id="yuyb4d"
+=   prirejanje z seštevanjem
-=   prirejanje z odštevanjem
*=   prirejanje z množenjem
/=   prirejanje z deljenjem
%=   prirejanje z ostankom
```

Na primer:

```swift id="vqj0h5"
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Celotna koda

Zdaj lahko napišemo preprost števec:

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

Toda v tem trenutku koda ne bo delovala pravilno.

### Pojavi se napaka

Xcode bo prikazal sporočilo:

```id="i4xjws"
Cannot assign to property: 'self' is immutable
```

To pomeni, da lastnosti ni mogoče spremeniti, ker je pogled nespremenljiv.

Zakaj se to zgodi?

## Kako deluje SwiftUI

V SwiftUI velja: **uporabniški vmesnik poganjajo podatki**. To pomeni, da se bo ob spremembi podatkov vmesnik samodejno osvežil.

Vendar je treba poudariti, da SwiftUI spremlja spremembe in osveži pogled samo takrat, ko se spremeni stanje, na primer @State ali @Binding.

Če uporabimo navadno spremenljivko, SwiftUI njeno vrednost prebere le enkrat ob ustvarjanju pogleda. Tudi če se ta spremenljivka pozneje spremeni, se vmesnik ne bo posodobil.

Na primer:

```swift id="w8j1hn"
var num = 0   // 0
num = 1   // 0
```

V zgornjem primeru je num navadna spremenljivka. Čeprav se njena vrednost spremeni, SwiftUI ne bo osvežil pogleda, zato bo vmesnik še vedno prikazoval začetno vrednost 0.

![Num](../../RESOURCE/009_state.png)

Zato SwiftUI samodejno spremlja spremembe in posodablja pogled le takrat, ko so podatki označeni kot stanje, na primer z uporabo lastnostnih ovojev, kot sta @State ali @Binding.

## Lastnostni ovoj @State

Če želimo v SwiftUI spremeniti spremenljivko in hkrati posodobiti pogled, moramo uporabiti @State.

```swift id="rtx3z5"
@State var num = 0
```

@State pove SwiftUI, naj spremlja to spremenljivko.

Ko se vrednost spremenljivke spremeni, SwiftUI znova izračuna pogled in ga posodobi.

Celotna koda:

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

Zdaj bo ob kliku gumba:

```swift id="g1h3zy"
num += 1
```

SwiftUI zaznal spremembo spremenljivke num in samodejno posodobil pogled.

![Num](../../RESOURCE/009_state1.png)

## Pravila uporabe @State

V dejanskem razvoju @State običajno sledi dvema praviloma.

### 1. @State običajno uporablja private

Spremenljivke @State se običajno uporabljajo samo znotraj trenutnega tipa, na primer trenutne strukture View, zato jih pogosto zapišemo tako:

```swift id="i7e188"
@State private var num = 0
```

S tem preprečimo, da bi drugi pogledi neposredno dostopali do te spremenljivke ali jo spreminjali.

private še nismo obravnavali, zato ga lahko za zdaj razumemo preprosto tako:

**vsebino, označeno s private, je mogoče uporabljati samo v trenutnem pogledu; zunanji pogledi je ne morejo uporabljati.**

### 2. @State se uporablja samo za stanje trenutnega pogleda

@State je primeren za podatke, ki jih upravlja trenutni View sam.

Na primer vsebina vnosnega polja ali stanje stikala.

```swift id="0dwzqs"
@State private var isOn = false
@State private var text = ""
```

Če morajo podatki biti deljeni med več pogledi, moramo uporabiti druge vrste stanja, na primer @Binding ali @Observable.

Te vsebine bomo obravnavali v kasnejših lekcijah.

### Gumb za zmanjšanje

Števec se lahko poleg povečevanja tudi zmanjšuje.

Dodamo lahko gumb -.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Nato gumbe vodoravno razporedimo z uporabo HStack:

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

Učinek:

![Num](../../RESOURCE/009_num1.png)

Ko kliknemo gumb +, se številka poveča za 1; ko kliknemo gumb -, se zmanjša za 1.

### Gumb za ponastavitev

Dodamo lahko tudi gumb za ponastavitev, ki bo številko spremenil nazaj v 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Ko kliknemo gumb za ponastavitev, se num nastavi na 0.

Učinek:

![Num](../../RESOURCE/009_num2.png)

Ko kliknemo gumb 0, se številka vrne na 0.

### Prilagojeni gumbi

Trenutno lahko naši gumbi prikazujejo samo besedilo:

```swift
Button("+") {

}
```

Tako zapisan gumb lahko prikazuje le besedilno vsebino, na primer + ali -.

V dejanskem razvoju pa želimo, da je videz gumba pogosto bogatejši, na primer z ikonami ali drugimi pogledi.

SwiftUI omogoča, da prilagodimo vsebino prikaza gumba. Takrat lahko uporabimo drugo obliko zapisa gumba:

```swift
Button(action: {

}, label: {

})
```

V tem zapisu action predstavlja kodo, ki se izvede ob kliku gumba, label pa predstavlja pogled, ki ga gumb prikazuje.

Na primer, lahko naredimo, da gumb prikazuje ikono SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Tako gumb ne prikazuje več besedila, ampak ikono.

### Izboljšanje vmesnika števca

Da bo vmesnik števca bolj pregleden, lahko prilagodimo tudi način prikaza številke. Na primer, povečamo velikost številke:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Nato lahko vsebino gumba spremenimo v ikono in ustrezno povečamo tudi velikost ikone:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Na enak način lahko v obliko ikon spremenimo tudi gumba za zmanjšanje in ponastavitev:

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

Zdaj gumbi prikazujejo ikone SF Symbols, zato je vmesnik bolj neposreden.

![Num](../../RESOURCE/009_num3.png)

## Povzetek

V tej lekciji smo z izdelavo preprostega števca povezali uporabo spremenljivk, Text in Button. Za shranjevanje številke smo uporabili spremenljivko, z gumbi pa smo številko povečevali in zmanjševali. Ob tem smo spoznali tudi sestavljene operatorje prirejanja, kot sta num += 1 in num -= 1.

Med izdelavo smo razumeli tudi način delovanja SwiftUI: vmesnik poganjajo podatki. Ko se podatki spremenijo, se vmesnik osveži. Zato moramo za shranjevanje spremenljivega stanja uporabiti @State. Ko se spremeni spremenljivka @State, SwiftUI samodejno posodobi pogled.

Na koncu smo vmesnik nekoliko izboljšali, prilagodili slog pisave v Text in uporabili Button(action:label:) za prilagojeno vsebino gumba, tako da so gumbi lahko prikazovali ikone. S tem je vmesnik števca postal bolj pregleden in lepši.

Zdaj smo že prišli v stik z osnovnim načinom uporabe pogledov v SwiftUI. V SwiftUI večino vmesnikov poganjajo spremenljivke. Ko se spremenljivke spremenijo, SwiftUI samodejno posodobi pogled. Zato moramo pri razvoju aplikacij v SwiftUI običajno najprej dobro načrtovati, katere podatke moramo shraniti, nato pa na podlagi teh podatkov zgraditi vmesnik in logiko interakcije.

## Celotna koda

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