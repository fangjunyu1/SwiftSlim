# Laskuri

Edellisissä kahdessa luvussa opimme muuttujat, vakiot, painikkeet ja metodit.

Tässä luvussa yhdistämme nämä tiedot ja teemme yksinkertaisen laskurisovelluksen.

Tässä esimerkissä opimme, miten muuttujaa tallennetaan ja muutetaan sekä miten `@State`-muokkainta käytetään muuttujan hallintaan.

## Laskurin toteuttaminen

Laskuria käytetään tavallisesti kirjaamaan määriä, joita täytyy kasvattaa jatkuvasti. Tällaisia tilanteita ovat esimerkiksi hyppynarukerrat tai juoksukierrokset.

Tehdään nyt yksinkertainen laskuri: näytetään yksi numero ja painike, jota painamalla numero kasvaa.

![Num](../../RESOURCE/009_num.png)

### Numeron näyttäminen

Näytämme ensin numeron `Text`-näkymällä.

```swift
Text("0")
```

Mutta jos numeron täytyy muuttua, emme voi kirjoittaa `"0"`-arvoa kiinteästi. Sen sijaan numero täytyy tallentaa muuttujaan.

```swift
var num = 0
```

Sen jälkeen näytämme muuttujan `Text`-näkymässä:

```swift
Text("\(num)")
```

Tässä käytetään merkkijonointerpolaatiota `\()`, jolla numero muunnetaan merkkijonoksi näyttämistä varten.

### Numeron kasvattaminen painikkeella

Seuraavaksi lisäämme painikkeen.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Kun painiketta klikataan, haluamme numeron kasvavan.

Siksi voimme muuttaa muuttujan arvoa painikkeen sisällä:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Tämä tarkoittaa: kun painiketta painetaan, lasketaan `num + 1` ja sijoitetaan tulos takaisin `num`-muuttujaan.

### Yksinkertaisempi kirjoitustapa

Swift tarjoaa myös lyhyemmän tavan kirjoittaa tämän:

```swift
num += 1
```

Se vastaa tätä:

```swift
num = num + 1
```

Tätä kirjoitustapaa kutsutaan yhdistetyksi sijoitusoperaattoriksi.

Swiftin tavallisia yhdistettyjä sijoitusoperaattoreita ovat:

```text
+=   yhteenlasku ja sijoitus
-=   vähennys ja sijoitus
*=   kertolasku ja sijoitus
/=   jakolasku ja sijoitus
%=   jakojäännös ja sijoitus
```

Esimerkiksi:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Täydellinen koodi

Nyt voimme kirjoittaa yksinkertaisen laskurin:

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

Mutta tällä hetkellä tämä koodi ei vielä toimi oikein.

### Virhe ilmenee

Xcode näyttää virheilmoituksen:

```text
Cannot assign to property: 'self' is immutable
```

Se tarkoittaa, ettei ominaisuutta voi muuttaa, koska näkymä on muuttumaton.

Miksi näin tapahtuu?

## Miten SwiftUI toimii

SwiftUI:ssa **käyttöliittymä on datan ohjaama**. Tämä tarkoittaa, että kun data muuttuu, käyttöliittymä päivittyy automaattisesti.

On kuitenkin tärkeää huomata, että SwiftUI seuraa muutoksia ja päivittää näkymän vain silloin, kun tila (`@State`, `@Binding` jne.) muuttuu.

Jos käytämme tavallista muuttujaa, SwiftUI lukee sen arvon vain kerran näkymää luotaessa. Vaikka muuttujan arvo myöhemmin muuttuisi, käyttöliittymä ei päivity.

Esimerkiksi:

```swift
var num = 0   // 0
num = 1   // 0
```

Yllä olevassa esimerkissä `num` on tavallinen muuttuja. Vaikka sen arvo muuttuu, SwiftUI ei päivitä näkymää, joten käyttöliittymä näyttää edelleen alkuperäisen `0`-arvon.

![Num](../../RESOURCE/009_state.png)

Siksi vain silloin, kun data on merkitty tilaksi esimerkiksi `@State`-, `@Binding`- tai muilla property wrapper -mekanismeilla, SwiftUI seuraa sen muutoksia automaattisesti ja päivittää näkymän.

## @State-property wrapper

SwiftUI:ssa, jos haluamme muuttaa muuttujaa ja päivittää näkymän, meidän täytyy käyttää `@State`-property wrapperia.

```swift
@State var num = 0
```

`@State` saa SwiftUI:n seuraamaan tätä muuttujaa.

Kun muuttujan arvo muuttuu, SwiftUI laskee näkymän uudelleen ja päivittää sen.

Täydellinen koodi:

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

Nyt kun painiketta klikataan:

```swift
num += 1
```

SwiftUI havaitsee, että `num` muuttui, ja päivittää näkymän automaattisesti.

![Num](../../RESOURCE/009_state1.png)

## @State:n käyttösäännöt

Käytännön kehityksessä `@State` noudattaa tavallisesti kahta sääntöä.

### 1. @State käyttää yleensä privatea

`@State`-muuttujia käytetään tavallisesti vain nykyisen tyypin sisällä, kuten nykyisessä `View`-rakenteessa, joten ne kirjoitetaan yleensä näin:

```swift
@State private var num = 0
```

Tällä tavoin estetään muita näkymiä pääsemästä muuttujaan suoraan käsiksi tai muuttamasta sitä.

Emme ole vielä opetelleet `private`-avainta, mutta voit ymmärtää sen tässä vaiheessa näin:

**`private`-määreellä varustettua sisältöä voidaan käyttää vain nykyisessä näkymässä; ulkopuoliset näkymät eivät voi käyttää sitä.**

### 2. @Statea käytetään vain nykyisen näkymän tilaan

`@State` soveltuu datalle, jota nykyinen `View` hallitsee itse.

Esimerkiksi tekstikentän sisältö tai kytkimen tila:

```swift
@State private var isOn = false
@State private var text = ""
```

Jos dataa täytyy jakaa usean näkymän välillä, on käytettävä muita tilatyyppejä, kuten `@Binding` tai `@Observable`.

Näihin palaamme myöhemmissä luvuissa.

### Vähennä-painike

Laskuri ei voi vain kasvaa — sen täytyy voida myös vähentyä.

Voimme lisätä `-`-painikkeen.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Sitten voimme asettaa painikkeet vierekkäin vaakasuunnassa `HStack`in avulla:

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

Tuloksena:

![Num](../../RESOURCE/009_num1.png)

Kun `+`-painiketta painetaan, numero kasvaa yhdellä; kun `-`-painiketta painetaan, numero vähenee yhdellä.

### Nollauspainike

Voimme lisätä myös nollauspainikkeen, joka palauttaa numeron takaisin arvoon `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Kun nollauspainiketta painetaan, `num` saa arvon `0`.

Tuloksena:

![Num](../../RESOURCE/009_num2.png)

Kun `0`-painiketta klikataan, numero muuttuu `0`:ksi.

### Mukautettu painike

Tällä hetkellä painikkeemme näyttävät vain tekstiä:

```swift
Button("+") {

}
```

Tällä kirjoitustavalla painike voi näyttää vain tekstisisältöä, kuten `+` tai `-`.

Käytännön kehityksessä haluamme kuitenkin usein rikkaamman ulkoasun, esimerkiksi kuvakkeita tai muita näkymiä.

SwiftUI sallii painikkeen näytettävän sisällön mukauttamisen. Tällöin voidaan käyttää toista kirjoitustapaa:

```swift
Button(action: {

}, label: {

})
```

Tässä muodossa `action` tarkoittaa koodia, joka suoritetaan painiketta painettaessa, ja `label` on painikkeessa näytettävä näkymä.

Esimerkiksi voimme näyttää painikkeessa `SF Symbols` -ikonin:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Tällöin painike ei enää näytä tekstiä, vaan kuvakkeen.

### Laskurin käyttöliittymän parantaminen

Jotta laskurin käyttöliittymä olisi selkeämpi, voimme säätää myös numeron tyyliä. Esimerkiksi suurentaa numeron:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Tämän jälkeen voimme vaihtaa myös painikkeiden sisällön kuvakkeiksi ja hieman suurentaa niitä:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Samoin voimme vaihtaa myös vähennys- ja nollauspainikkeet ikonimuotoisiksi:

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

Nyt painikkeet näyttävät `SF Symbols` -kuvakkeita, ja käyttöliittymä on intuitiivisempi.

![Num](../../RESOURCE/009_num3.png)

## Yhteenveto

Tässä luvussa harjoittelimme yksinkertaisen laskurin avulla yhdessä muuttujien, `Text`- ja `Button`-näkymien käyttöä. Tallensimme numeron muuttujaan, säädimme sitä painikkeilla ja opimme samalla yhdistettyjä sijoitusoperaattoreita, kuten `num += 1` ja `num -= 1`.

Toteutuksen aikana opimme myös paremmin, miten SwiftUI toimii: käyttöliittymä on datan ohjaama. Vasta kun data muuttuu, käyttöliittymä päivittyy. Siksi meidän täytyy käyttää `@State`-tilaa muuttuvan tilan tallentamiseen. Kun `@State`-muuttuja muuttuu, SwiftUI päivittää näkymän automaattisesti.

Lopuksi paransimme käyttöliittymää hieman säätämällä `Text`-näkymän fonttityyliä ja käyttämällä `Button(action:label:)`-kirjoitustapaa painikkeen sisällön mukauttamiseen, jotta painikkeet voivat näyttää kuvakkeita. Näin laskurin käyttöliittymästä tuli selkeämpi ja siistimpi.

Nyt olemme jo tutustuneet SwiftUI-näkymien perustapaan toimia. SwiftUI:ssa suurin osa käyttöliittymistä on muuttujien ohjaamia. Kun muuttuja muuttuu, SwiftUI päivittää näkymän automaattisesti. Siksi SwiftUI-sovelluksia kehitettäessä meidän täytyy yleensä ensin suunnitella, mitä dataa täytyy tallentaa, ja rakentaa käyttöliittymä ja vuorovaikutus tämän datan varaan.

## Täydellinen koodi

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
