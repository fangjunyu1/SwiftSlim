# Brojač

U prethodne dvije lekcije učili smo varijable, konstante, gumbe i metode.

U ovoj ćemo lekciji spojiti to znanje i izraditi jednostavnu aplikaciju brojača.

U ovom primjeru naučit ćemo kako spremati i mijenjati varijable te kako koristiti `@State` za upravljanje varijablama.

## Izrada brojača

Brojač se obično koristi za bilježenje količina koje se trebaju neprestano zbrajati. Na primjer, broj skokova preko užeta, broj krugova pri trčanju i slični scenariji brojanja.

Sada ćemo izraditi jednostavan brojač: prikazat ćemo jedan broj i gumb, a klik na gumb povećavat će broj.

![Num](../../RESOURCE/009_num.png)

### Prikaz broja

Najprije koristimo `Text` za prikaz broja.

```swift
Text("0")
```

Ali ako se broj treba mijenjati, ne možemo ga izravno zapisati kao `"0"`, nego trebamo koristiti varijablu za spremanje broja.

```swift
var num = 0
```

Zatim prikažemo varijablu u `Text`:

```swift
Text("\(num)")
```

Ovdje koristimo interpolaciju stringa `\()` kako bismo broj pretvorili u string i prikazali ga.

### Povećavanje broja pomoću gumba

Zatim dodajemo jedan gumb.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Kada se klikne gumb, želimo da se broj poveća.

Zato možemo promijeniti varijablu unutar gumba:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Ovaj kod znači: kada kliknete gumb, izračunat će se `num + 1`, a rezultat će biti dodijeljen varijabli `num`.

### Sažetiji zapis

Swift nudi sažetiji način pisanja:

```swift
num += 1
```

To je ekvivalentno ovome:

```swift
num = num + 1
```

Takav zapis naziva se “složeni operator pridruživanja”.

U Swiftu su česti složeni operatori pridruživanja:

```
+=   zbrajanje i pridruživanje
-=   oduzimanje i pridruživanje
*=   množenje i pridruživanje
/=   dijeljenje i pridruživanje
%=   ostatak pri dijeljenju i pridruživanje
```

Na primjer:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Potpuni kod

Sada možemo napisati jednostavan brojač:

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

Ali u ovom trenutku kod ne može pravilno raditi.

### Pojava greške

Xcode će prikazati:

```
Cannot assign to property: 'self' is immutable
```

To znači da nije moguće mijenjati svojstvo jer je prikaz nepromjenjiv.

Zašto se to događa?

## Kako SwiftUI radi

U SwiftUI-ju: **sučelje je vođeno podacima**, što znači da se sučelje automatski osvježava kada se podaci promijene.

Ali treba primijetiti da SwiftUI prati promjene i osvježava prikaz samo kada se promijeni stanje (`@State`、`@Binding` i slično).

Ako se koristi obična varijabla, SwiftUI će vrijednost varijable pročitati samo jednom kada se prikaz stvori. Nakon toga, čak i ako se varijabla promijeni, sučelje se neće ažurirati.

Na primjer:

```swift
var num = 0   // 0
num = 1   // 0
```

U gornjem primjeru `num` je obična varijabla. Iako se njezina vrijednost promijenila, SwiftUI neće ažurirati prikaz i sučelje će i dalje prikazivati početnu `0`.

![Num](../../RESOURCE/009_state.png)

Zato će SwiftUI automatski pratiti promjene i ažurirati prikaz samo kada su podaci označeni kao stanje (na primjer pomoću `@State`、`@Binding` i drugih property wrappera).

## Property wrapper `@State`

U SwiftUI-ju, ako trebamo mijenjati varijablu i pritom ažurirati prikaz, moramo koristiti `@State`.

```swift
@State var num = 0
```

`@State` omogućuje SwiftUI-ju da prati tu varijablu.

Kada se varijabla promijeni, SwiftUI ponovno izračuna prikaz i zatim ga ažurira.

Potpuni kod:

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

Sada, kada kliknemo gumb:

```swift
num += 1
```

SwiftUI će otkriti da se `num` promijenio i automatski ažurirati prikaz.

![Num](../../RESOURCE/009_state1.png)

## Pravila korištenja `@State`

U stvarnom razvoju `@State` obično slijedi dva pravila.

### 1. `@State` se obično koristi s `private`

`@State` varijable obično se koriste samo unutar trenutačnog tipa (na primjer unutar trenutačne `View` strukture), pa se uglavnom pišu ovako:

```swift
@State private var num = 0
```

Tako se sprječava da drugi prikazi izravno pristupaju toj varijabli ili je mijenjaju.

Još nismo učili `private`, pa to za sada možemo jednostavno razumjeti ovako:

**Sadržaj označen s `private` može se koristiti samo u trenutačnom prikazu; vanjski prikazi ne mogu ga koristiti.**

### 2. `@State` se koristi samo za stanje trenutačnog prikaza

`@State` je prikladan za podatke kojima upravlja sam trenutačni `View`.

Na primjer, sadržaj tekstualnog polja ili stanje prekidača.

```swift
@State private var isOn = false
@State private var text = ""
```

Ako podatke treba dijeliti između više prikaza, tada treba koristiti druge vrste stanja, kao što su `@Binding` ili `@Observable`.

Te ćemo sadržaje učiti u kasnijim lekcijama.

### Gumb za smanjenje

Brojač ne mora samo povećavati, može i smanjivati.

Možemo dodati gumb `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Zatim koristimo `HStack` za vodoravno raspoređivanje gumba:

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

Efekt:

![Num](../../RESOURCE/009_num1.png)

Kada kliknemo gumb `+`, broj će se povećati za 1; kada kliknemo gumb `-`, broj će se smanjiti za 1.

### Gumb za resetiranje

Možemo dodati i gumb za resetiranje kojim se broj vraća na `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Kada kliknemo gumb za resetiranje, `num` dobiva vrijednost `0`.

Efekt:

![Num](../../RESOURCE/009_num2.png)

Kada kliknemo gumb `0`, broj postaje `0`.

### Prilagođeni gumb

Trenutno naši gumbi još uvijek mogu prikazivati samo tekst:

```swift
Button("+") {

}
```

Takav zapis gumba može prikazati samo tekstualni sadržaj, poput `+` ili `-`.

U stvarnom razvoju često želimo bogatiji izgled gumba, na primjer korištenje ikona ili drugih prikaza.

SwiftUI dopušta da prilagodimo prikaz sadržaja gumba. Tada možemo koristiti drugi zapis:

```swift
Button(action: {

}, label: {

})
```

U tom zapisu `action` predstavlja kod koji se izvršava pri kliku gumba, a `label` predstavlja prikaz sadržaja gumba.

Na primjer, možemo prikazati SF Symbols ikonu:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Na taj način gumb više ne prikazuje tekst, nego ikonu.

### Optimizacija sučelja brojača

Kako bi sučelje brojača bilo jasnije, možemo prilagoditi i stil prikaza broja. Na primjer, možemo povećati broj:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Zatim ćemo i sadržaj gumba promijeniti u ikone te po potrebi povećati veličinu ikona:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Na isti način možemo i gumb za smanjenje i gumb za resetiranje promijeniti u ikone:

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

Sada gumbi prikazuju SF Symbols ikone, a sučelje izgleda intuitivnije.

![Num](../../RESOURCE/009_num3.png)

## Sažetak

U ovoj smo lekciji kroz izradu jednostavnog brojača sveobuhvatno vježbali korištenje varijabli, `Text` i `Button`. Koristili smo varijablu za spremanje broja i gumbe za njegovo povećavanje ili smanjivanje, a istovremeno smo učili složene operatore pridruživanja poput `num += 1` i `num -= 1`.

Tijekom implementacije upoznali smo kako SwiftUI radi: sučelje je vođeno podacima. Sučelje se osvježava tek kada se podaci promijene. Zato moramo koristiti `@State` za pohranu promjenjivog stanja. Kada se `@State` varijabla promijeni, SwiftUI automatski ažurira prikaz.

Na kraju smo jednostavno optimizirali sučelje, prilagodili stil fonta za `Text` i upotrijebili `Button(action:label:)` za prilagodbu sadržaja gumba, kako bi gumbi mogli prikazivati ikone i tako brojač izgledao jasnije i ljepše.

Sada smo već došli u kontakt s osnovnim načinima korištenja SwiftUI prikaza. U SwiftUI-ju je većina sučelja pokretana varijablama. Kada se varijable promijene, SwiftUI automatski ažurira prikaz. Zato pri razvoju SwiftUI aplikacija obično najprije trebamo osmisliti koje podatke treba spremiti, a zatim na temelju tih podataka izgraditi sučelje i logiku interakcije.

## Potpuni kod

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
