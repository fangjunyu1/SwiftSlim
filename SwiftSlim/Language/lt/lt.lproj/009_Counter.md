# Skaitiklis

Ankstesnėse dviejose pamokose mokėmės apie kintamuosius, konstantas, mygtukus ir metodus.

Šioje pamokoje sujungsime šias žinias ir sukursime paprastą skaitiklio programėlę.

Šiame pavyzdyje mokysimės, kaip saugoti ir keisti kintamąjį bei kaip naudoti `@State` kintamajam valdyti.

## Skaitiklio įgyvendinimas

Skaitiklis dažnai naudojamas nuolat didėjančiam kiekiui fiksuoti. Pavyzdžiui, šuoliukų su virve skaičiui, nubėgtiems ratams ir panašioms situacijoms.

Toliau sukursime paprastą skaitiklį: parodysime skaičių ir mygtuką, o paspaudus mygtuką skaičius padidės.

![Num](../../RESOURCE/009_num.png)

### Skaičiaus rodymas

Pirmiausia naudosime `Text`, kad parodytume skaičių.

```swift
Text("0")
```

Tačiau jei skaičius turi keistis, negalime tiesiogiai užrašyti fiksuoto `"0"`, todėl turime naudoti kintamąjį skaičiui saugoti.

```swift
var num = 0
```

Tada `Text` viduje rodome kintamąjį:

```swift
Text("\(num)")
```

Čia naudojama eilutės interpoliacija `\()`, kuri skaičių paverčia eilute rodymui.

### Skaičiaus didinimas mygtuku

Toliau pridedame mygtuką.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Paspaudus mygtuką norime, kad skaičius padidėtų.

Todėl mygtuko viduje galima keisti kintamąjį:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Šis kodas reiškia: kai paspaudžiamas mygtukas, apskaičiuojama `num + 1`, o rezultatas priskiriamas `num`.

### Glaustesnė rašymo forma

Swift pateikia glaustesnį rašymo būdą:

```swift
num += 1
```

Jis yra lygiavertis:

```swift
num = num + 1
```

Toks rašymo būdas vadinamas „sudėtiniu priskyrimo operatoriumi“.

Dažniausi Swift sudėtiniai priskyrimo operatoriai yra:

```
+=   sudėties priskyrimas
-=   atimties priskyrimas
*=   daugybos priskyrimas
/=   dalybos priskyrimas
%=   liekanos priskyrimas
```

Pavyzdžiui:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Pilnas kodas

Dabar galime parašyti paprastą skaitiklį:

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

Tačiau šiuo metu kodas neveiks tinkamai.

### Atsiradusi klaida

Xcode parodys:

```
Cannot assign to property: 'self' is immutable
```

Tai reiškia, kad savybės pakeisti negalima, nes vaizdas yra nekeičiamas.

Kodėl taip nutinka?

## Kaip veikia SwiftUI

SwiftUI sistemoje **sąsaja yra valdoma duomenų**. Tai reiškia, kad kai duomenys pasikeičia, sąsaja automatiškai persibraižo.

Tačiau svarbu atkreipti dėmesį: SwiftUI stebi pokyčius ir atnaujina vaizdą tik tada, kai keičiasi būsena (pvz., `@State`, `@Binding`).

Jei naudojamas paprastas kintamasis, SwiftUI jo reikšmę perskaito tik vaizdo sukūrimo metu, o vėliau, net jei kintamasis pasikeičia, sąsaja nebūna atnaujinama.

Pavyzdžiui:

```swift
var num = 0   // 0
num = 1   // 0
```

Šiame pavyzdyje `num` yra paprastas kintamasis. Nors jo reikšmė pasikeitė, SwiftUI neatnaujins vaizdo, todėl sąsajoje vis tiek bus rodomas pradinis `0`.

![Num](../../RESOURCE/009_state.png)

Todėl tik tada, kai duomenys pažymėti kaip būsena (pavyzdžiui, naudojant `@State`, `@Binding` ir kitus savybių apvalkalus), SwiftUI gali automatiškai stebėti pokyčius ir atnaujinti vaizdą.

## `@State` savybių apvalkalas

SwiftUI sistemoje, jei reikia keisti kintamąjį ir atnaujinti vaizdą, būtina naudoti `@State`.

```swift
@State var num = 0
```

`@State` leidžia SwiftUI stebėti šį kintamąjį.

Kai kintamasis pasikeičia, SwiftUI iš naujo apskaičiuoja vaizdą ir jį atnaujina.

Pilnas kodas:

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

Dabar, kai paspaudžiamas mygtukas:

```swift
num += 1
```

SwiftUI aptiks, kad `num` pasikeitė, ir automatiškai atnaujins vaizdą.

![Num](../../RESOURCE/009_state1.png)

## `@State` naudojimo taisyklės

Realiame kūrime `@State` dažniausiai laikosi dviejų taisyklių.

### 1. `@State` dažniausiai naudojamas su `private`

`@State` kintamasis paprastai naudojamas tik dabartiniame tipe (pavyzdžiui, dabartiniame `View` struktūros objekte), todėl dažnai rašomas taip:

```swift
@State private var num = 0
```

Taip išvengiama situacijos, kai kiti vaizdai tiesiogiai pasiekia arba keičia šį kintamąjį.

Kol kas dar nesimokėme `private`, todėl galima paprastai suprasti taip:

**`private` pažymėtas turinys gali būti naudojamas tik dabartiniame vaizde, o išoriniai vaizdai jo naudoti negali.**

### 2. `@State` naudojamas tik dabartinio vaizdo būsenai

`@State` tinka duomenims, kuriuos valdo pats dabartinis `View`.

Pavyzdžiui, įvesties lauko turiniui ar jungiklio būsenai.

```swift
@State private var isOn = false
@State private var text = ""
```

Jei duomenimis reikia dalintis tarp kelių vaizdų, tuomet reikia naudoti kitus būsenos tipus, pavyzdžiui, `@Binding` arba `@Observable`.

Apie tai mokysimės vėlesnėse pamokose.

### Mažinimo mygtukas

Skaitiklis gali ne tik didėti, bet ir mažėti.

Galime pridėti mygtuką `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Tada mygtukus išdėstome horizontaliai naudodami `HStack`:

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

Rezultatas:

![Num](../../RESOURCE/009_num1.png)

Paspaudus `+` mygtuką, skaičius padidėja 1; paspaudus `-`, skaičius sumažėja 1.

### Nustatymo iš naujo mygtukas

Taip pat galime pridėti mygtuką nustatymui iš naujo, kuris grąžina skaičių į `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Paspaudus nustatymo iš naujo mygtuką, `num` priskiriama reikšmė `0`.

Rezultatas:

![Num](../../RESOURCE/009_num2.png)

Paspaudus mygtuką `0`, skaičius tampa `0`.

### Pasirinktinis mygtukas

Šiuo metu mūsų mygtukai dar gali rodyti tik tekstą:

```swift
Button("+") {

}
```

Tokiu būdu sukurtas mygtukas gali rodyti tik tekstinį turinį, pavyzdžiui, `+` arba `-`.

Realiame kūrime dažnai norime turtingesnės mygtuko išvaizdos, pavyzdžiui, naudoti piktogramas ar kitus vaizdus.

SwiftUI leidžia mums pasirinktinai apibrėžti mygtuko rodomą turinį; tokiu atveju naudojama kita mygtuko forma:

```swift
Button(action: {

}, label: {

})
```

Šioje formoje `action` reiškia kodą, vykdomą paspaudus mygtuką, o `label` - mygtuko rodomą vaizdą.

Pavyzdžiui, galime parodyti SF Symbols piktogramą:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Tokiu atveju mygtukas rodys ne tekstą, o piktogramą.

### Skaitiklio sąsajos patobulinimas

Kad skaitiklio sąsaja būtų aiškesnė, galime pakoreguoti ir skaičiaus rodymo stilių. Pavyzdžiui, padidinti skaičiaus šriftą:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Toliau mygtukų turinį taip pat pakeičiame į piktogramas ir šiek tiek padidiname jų dydį:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Lygiai taip pat galime pakeisti mažinimo ir nustatymo iš naujo mygtukus į piktogramų formą:

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

Dabar mygtukai rodys SF Symbols piktogramas, o sąsaja taps intuityvesnė.

![Num](../../RESOURCE/009_num3.png)

## Santrauka

Šioje pamokoje, kurdami paprastą skaitiklį, kartu pasipraktikavome naudoti kintamuosius, `Text` ir `Button`. Naudojome kintamąjį skaičiui saugoti ir per mygtukus valdėme jo didinimą bei mažinimą, kartu susipažinome su sudėtiniais priskyrimo operatoriais, tokiais kaip `num += 1` ir `num -= 1`.

Įgyvendinimo metu supratome, kaip veikia SwiftUI: sąsaja yra valdoma duomenų. Tik kai duomenys pasikeičia, sąsaja persibraižo. Todėl keičiamos būsenos saugojimui turime naudoti `@State`; kai `@State` kintamasis pasikeičia, SwiftUI automatiškai atnaujina vaizdą.

Galiausiai paprastai patobulinome sąsają: pakoregavome `Text` šrifto stilių ir naudojome `Button(action:label:)`, kad pasirinktinai apibrėžtume mygtuko turinį ir jis galėtų rodyti piktogramas, todėl skaitiklio sąsaja tapo aiškesnė ir gražesnė.

Dabar jau susipažinome su pagrindiniu SwiftUI vaizdų naudojimo būdu. SwiftUI aplinkoje didžioji dalis sąsajos valdoma kintamaisiais. Kai kintamasis pasikeičia, SwiftUI automatiškai atnaujina vaizdą. Todėl kurdami SwiftUI programėles paprastai pirmiausia turime suplanuoti, kokius duomenis reikia saugoti, o tada remiantis tais duomenimis konstruoti sąsają ir sąveikos logiką.

## Pilnas kodas

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
