# Citatų karuselė

Šioje pamokoje įgyvendinsime „citatų karuselės“ funkciją ir išsamiau susipažinsime su Swift pagrindais: masyvais (`Array`) ir sąlyginiais sakiniais (`if-else`).

Parodysime, kaip išsaugoti kelias citatas ir kaip mygtukų sąveika įgyvendinti jų ciklinį perjungimą.

![alt text](../../RESOURCE/011_word.png)

## Citatos rodymas

Pirmiausia turime SwiftUI aplinkoje parodyti vieną citatą.

Paprasčiausias būdas - naudoti `Text` vaizdą:

```swift
Text("Slow progress is still progress.")
```

Šis kodas gali parodyti tik vieną fiksuotą citatą. Jei norime rodyti kelias citatas ir jas perjungti, pirmiausia turime jas išsaugoti.

Tačiau įprastas eilutės kintamasis gali saugoti tik vieną citatą:

```swift
let sayings = "Slow progress is still progress."
```

Jei reikia saugoti kelias citatas, reikėtų kiekvienai iš jų deklaruoti po kintamąjį:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Tačiau realiame kūrime toks būdas yra ne tik gremėzdiškas, bet ir neleidžia lanksčiai įgyvendinti karuselės perjungimo, nes kiekvienas kintamasis egzistuoja atskirai.

Kad būtų patogiau valdyti kelias citatas, reikia naudoti duomenų struktūrą, kuri jas saugotų kartu - tai masyvas (`Array`).

Naudojant masyvą, aukščiau pateiktą kodą galima išsaugoti taip:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Patarimas: programavimo praktikoje masyvo kintamieji, kurie saugo kelis elementus, dažnai vadinami daugiskaita, pavyzdžiui, `sayings`, kad būtų aiškiau, jog tai yra kolekcija.**

## Masyvas

Swift kalboje masyvas yra tvarkinga elementų kolekcija, žymima laužtiniais skliaustais `[]`.

```swift
[]
```

Masyvo viduje gali būti keli to paties tipo elementai, o patys elementai atskiriami anglų kalbos kableliu `,`.

Pavyzdžiui:

```swift
[101, 102, 103, 104, 105]
```

Masyvą galima paprastai įsivaizduoti kaip traukinio vagonų eilę:

![Array](../../RESOURCE/011_array1.png)

Visa traukinio sudėtis reiškia patį masyvą, o kiekvienas vagonas išdėstytas pagal eilę.

### Indeksai ir elementų pasiekimas

Kadangi masyvas yra tvarkingas, sistema gali nustatyti konkretų elementą pagal jo vietą eilėje. Šis nustatymo mechanizmas vadinamas indeksu (`Index`).

Swift (ir daugumoje programavimo kalbų) masyvo indeksai skaičiuojami nuo `0`, o ne nuo `1`. Tai reiškia, kad pirmasis elementas turi indeksą `0`, antrasis - `1` ir taip toliau.

![Array](../../RESOURCE/011_array2.png)

Jei norime pasiekti konkretų masyvo elementą, tereikia po masyvo pavadinimo pridėti laužtinius skliaustus ir juose nurodyti to elemento indeksą.

Pavyzdžiui:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Jei bandysime pasiekti indeksą, kuris viršija galimą diapazoną, įvyks „indekso išėjimo už ribų“ (`Index Out of Range`) problema. Todėl dirbant su masyvais reikia būti atsargiems ir įsitikinti, kad indeksas yra galiojantis.

**Indekso išėjimas už ribų**

Pavyzdžiui, kai masyvas turi tik 5 elementus, teisėtų indeksų diapazonas yra nuo `0` iki `4`. Jei bandysime pasiekti `sayings[5]`, programa neras atitinkamo „vagono“, dėl to kils „indekso išėjimo už ribų“ klaida ir programėlė užsidarys.

![Array](../../RESOURCE/011_array3.png)

### Veiksmai su masyvu

Masyvai palaiko ne tik statinį apibrėžimą, bet ir elementų pridėjimą, šalinimą, keitimą bei ilgio gavimą.

Patarimas: jei norite keisti masyvą, jį būtina deklaruoti su `var`, o ne su konstanta `let`.

**1. Naujo elemento pridėjimas**

Galima naudoti metodą `append`, kad į masyvo pabaigą pridėtumėte elementą:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Elemento pašalinimas**

Naudojant metodą `remove(at:)`, galima pašalinti nurodytą masyvo elementą:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Elemento keitimas**

Tiesiogiai naudokite indeksą masyvo elementui pakeisti:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Masyvo ilgio skaičiavimas**

Naudokite savybę `count`, kad gautumėte elementų skaičių masyve:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Citatų rodymas naudojant masyvą

Kad parodytume kelias citatas, galime jas išsaugoti masyve, o tada pasiekti ir rodyti naudodami indeksą.

Pirmiausia `ContentView` viduje sukuriame masyvą `sayings`, skirtą citatoms saugoti, o tada `Text` vaizde per indeksą nuskaitome ir parodome atitinkamą citatą:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Čia `sayings[0]` reiškia pirmąją masyvo citatą.

Jei norite rodyti kitą citatą, pakanka pakeisti indekso reikšmę laužtiniuose skliaustuose:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Citatos indekso apibrėžimas

Norėdami įgyvendinti dinaminį citatų perjungimą, negalime indekso `Text` vaizde „užrašyti kietai“.

Turime sukurti kintamąjį, kuris atskirai saugotų šiuo metu rodomą indekso reikšmę.

SwiftUI aplinkoje tam galime naudoti `@State`, kad deklaruotume keičiamą indeksą:

```swift
@State private var index = 0
```

SwiftUI stebi `@State` apgaubtus kintamuosius. Kai `index` pasikeičia, SwiftUI iš naujo nubraižo vaizdą ir parodo atitinkamą citatą.

Toliau naudojame `sayings[index]`, kad dinamiškai gautume citatą iš masyvo:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Kai `index` reikšmė pasikeičia, `Text` parodys kitą citatą.

### Indekso valdymas mygtuku

Kad valdytume citatų perjungimą, galime naudoti `Button`, kuris pakeis `index` reikšmę. Kiekvieną kartą paspaudus mygtuką, `index` padidinamas 1:

```swift
Button("Next") {
    index += 1
}
```

Kai paspaudžiame mygtuką, `index` reikšmė pasikeičia iš `0` į `1`, sužadina vaizdo atnaujinimą, ir `Text(sayings[index])` nuskaito kitą citatą.

Tačiau čia yra galima problema: jei mygtuką spausite nuolat, `index` didės iki reikšmės, kuri viršija masyvo ribas, ir sukels masyvo indekso klaidą. Pavyzdžiui, kai `index` pasieks `5` (o masyvo indeksai yra nuo `0` iki `4`), programa užsidarys.

Kad to išvengtume, turime įvesti sąlyginį valdymą ir užtikrinti, kad `index` neviršytų masyvo ribų. Tai galima padaryti naudojant `if-else` sakinį ir tikrinant, ar `index` yra mažesnis už masyvo ilgį.

## Sąlyginis valdymas: `if-else` sakinys

`if-else` sakinys yra vienas dažniausiai naudojamų Swift sąlyginių šakų sakinių, skirtas patikrinti, ar sąlyga tenkinama, ir pagal jos teisingumą vykdyti skirtingus kodo blokus.

Pagrindinė struktūra:

```swift
if condition {
    // Kodas, vykdomas kai condition yra true
} else {
    // Kodas, vykdomas kai condition yra false
}
```

`if` sakinyje sąlyga `condition` yra loginė reikšmė (`Bool` tipo) ir gali būti `true` arba `false`. Kai sąlyga yra `true`, vykdomas `if` blokas, priešingu atveju vykdomas `else` blokas.

Pavyzdžiui:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Šiame pavyzdyje `age` reikšmė yra `25`, o `if` sakinys tikrina, ar `age > 18` yra teisinga. Kadangi sąlyga tenkinama, išvedama `"Big Boy"`.

Jei `else` dalies nereikia, ją galima praleisti:

```swift
if condition {
    // Kodas, vykdomas kai condition yra true
}
```

### Indekso ribų valdymas naudojant sąlygą

Kad išvengtume masyvo indekso išėjimo už ribų, galima naudoti `if`, kad `index` neviršytų leidžiamo diapazono:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logikos analizė: `sayings.count` reikšmė yra `5` (iš viso yra 5 citatos), todėl `sayings.count - 1` yra `4`, o tai ir yra paskutinis galiojantis masyvo indeksas.

Kai `index` yra mažesnis už `4`, paspaudus mygtuką galima saugiai vykdyti `+1`; kai `index` tampa `4`, sąlyga nebetenkinama ir mygtuko spaudimas nieko nedaro.

Dabar kodas jau gali įgyvendinti citatų perjungimą:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Ciklinės citatos

Jei norime, kad pasiekus paskutinę citatą kitas paspaudimas vėl parodytų pirmąją ir taip būtų įgyvendintas ciklas, tai galima padaryti per `else` dalį:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Kai paspaudžiamas mygtukas ir `index` pasiekia paskutinį masyvo elementą, `index` vėl nustatomas į `0`, ir citatos pradeda rodytis iš naujo.

## Citatų vaizdo patobulinimas

Dabar citatų karuselės logika jau veikia, tačiau sąsają dar galime šiek tiek pagražinti.

Pilnas kodas:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Šiame pavyzdyje `Text` vaizdui pridedamas pusiau permatomas baltas fonas ir užapvalinti kampai, `Button` naudoja `.borderedProminent` stilių, o `VStack` turi foninį paveikslą.

Papildomas paaiškinimas: naudojant `background()` modifikatorių vaizdo fonui, numatytoji jo elgsena yra kuo labiau užpildyti dabartinio vaizdo išdėstymo sritį. Daugeliu atvejų jis natūraliai gali išsiplėsti ir padengti saugiąją sritį (`Safe Area`).

Taip ir gauname citatų karuselės vaizdą.

![SwiftUI View](../../RESOURCE/011_word.png)

## Santrauka

Per šią pamoką išmokome, kaip naudoti masyvą kelioms citatoms saugoti ir kaip per `if` bei `if-else` sakinius įgyvendinti jų karuselę.

Taip pat susipažinome su pagrindinėmis masyvo operacijomis, tokiomis kaip elementų pridėjimas, šalinimas, keitimas bei apsauga nuo indekso išėjimo už ribų.

Šioje pamokoje ne tik paaiškinome, kaip įgyvendinti citatų karuselę, bet ir kartu išmokome bazinio darbo su masyvais ir sąlyginiais sakiniais, kurie padeda apdoroti duomenis ir valdyti programos eigą.

## Papildomos žinios - kelių sąlygų tikrinimas: `if-else if-else`

Praktiniame kūrime dažnai tenka apdoroti daugiau nei vieną sąlygą. Pavyzdžiui, žaidime, kai taškai lygūs `1`, suveikia įvykis A, kai lygūs `2` - įvykis B, kai lygūs `3` - įvykis C ir taip toliau.

Kai sąlyginių šakų yra daugiau nei dvi, reikia naudoti `if-else if-else`, kad atliktume daugybinį tikrinimą.

Pagrindinė sintaksė:

```swift
if conditionA {
    // Kodas, vykdomas kai conditionA yra true
} else if conditionB {
    // Kodas, vykdomas kai conditionB yra true
} else if conditionC {
    // Kodas, vykdomas kai conditionC yra true
} else {
    // Kodas, vykdomas kai nė viena sąlyga netenkinama
}
```

Tokiu atveju programa tikrina sąlygas iš eilės ir vykdo pirmąją tenkinamą sąlygą. Jei netenkinama nė viena, vykdomas kodas po `else`.

Citatų karuselėje taip pat galime naudoti `if-else if-else`, kad atliktume kelių sąlygų tikrinimą:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Kai `index` yra `0`, `1`, `2` arba `3`, kiekvienas mygtuko paspaudimas vykdo `index += 1`; kai `index` tampa `4` (paskutinis elementas), jis grąžinamas į `0`, taip įgyvendinant ciklą.

`else` šaka čia veikia kaip atsarginė apsauga, neleidžianti atsirasti neteisingai reikšmei (pavyzdžiui, jei `index` būtų klaidingai pakeistas).

Svarbu pastebėti, kad čia naudojamas `==` reiškia „ar yra lygu“. Jei `if` sakinys nustato, kad `index` lygus tam tikram skaičiui, jis grąžina `true` ir vykdo toliau esantį kodo bloką. Jei nelygu, pereina prie kitos `if` šakos.

Toks kelių sąlygų tikrinimas naudingas tada, kai skirtingomis sąlygomis reikia vykdyti skirtingą kodą.
