# Vrteči se citati

V tej lekciji bomo izdelali funkcijo »vrtenja citatov« in se poglobili v osnovno znanje Swifta, kot so polja (Array) in pogojni stavki (if-else).

Pokazali bomo, kako shraniti več citatov in kako z interakcijo gumba doseči krožno prikazovanje citatov.

![alt text](../../RESOURCE/011_word.png)

## Prikaz citata

Najprej moramo v SwiftUI prikazati en citat.

Najpreprostejši način je uporaba pogleda Text:

```swift
Text("Slow progress is still progress.")
````

Ta koda lahko prikaže samo en fiksen citat. Če želimo prikazati več citatov in omogočiti preklapljanje, jih moramo najprej shraniti.

Običajna nizovna spremenljivka pa lahko shrani samo en citat:

```swift id="a1s9dk"
let sayings = "Slow progress is still progress."
```

Če moramo shraniti več citatov, bi morali za vsak citat deklarirati svojo spremenljivko:

```swift id="18qg5v"
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Toda v dejanskem razvoju je takšen pristop ne le okoren, ampak tudi neprilagodljiv, saj je vsaka spremenljivka neodvisna in zato ne moremo preprosto uresničiti prilagodljivega vrtenja.

Da bi več citatov lažje upravljali, potrebujemo podatkovno strukturo, ki jih shrani skupaj. To je polje (Array).

Po uporabi polja lahko zgornjo kodo zapišemo takole:

```swift id="hndj8g"
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Namig: po programerskih smernicah se imena spremenljivk za polja, ki hranijo več elementov, običajno pišejo v množini, na primer sayings, da se poudari njihova zbirna narava.**

## Polje

V Swiftu je polje urejena zbirka elementov in se zapisuje z oglatimi oklepaji [].

```swift id="2vdjlc"
[]
```

Polje lahko vsebuje več elementov istega tipa, med katerimi so angleške vejice ,.

Na primer:

```swift id="3e3h1h"
[101, 102, 103, 104, 105]
```

Polje si lahko preprosto predstavljamo kot vlak:

![Array](../../RESOURCE/011_array1.png)

Celoten vlak predstavlja objekt polja, vsak vagon pa je razporejen po določenem vrstnem redu.

### Indeks in dostop do elementov

Ker je polje urejeno, lahko sistem po vrstnem redu natančno določi posamezen element v polju. Ta mehanizem se imenuje indeks (Index).

V Swiftu, tako kot v veliki večini programskih jezikov, se indeks polja začne pri 0 in ne pri 1. To pomeni, da ima prvi element v polju indeks 0, drugi element indeks 1 in tako naprej.

![Array](../../RESOURCE/011_array2.png)

Če želimo dostopati do določenega elementa v polju, moramo za ime polja dodati oglate oklepaje in vanje zapisati indeks ciljnega elementa.

Na primer:

```swift id="6v084k"
sayings[0]   // 101
sayings[1]   // 102
```

Če poskusimo dostopati do indeksa, ki je zunaj veljavnega obsega polja, pride do težave »Index Out of Range«, torej do izhoda iz meja indeksa. Zato moramo biti pri dostopu do polja previdni in zagotoviti, da je indeks v veljavnem obsegu.

**Izhod iz meja indeksa**

Na primer, če ima polje samo 5 elementov, je veljavni obseg indeksov od 0 do 4. Če poskusimo dostopati do sayings[5], program ne bo mogel najti ustreznega »vagona«, kar bo povzročilo napako »Index Out of Range« in sesutje aplikacije.

![Array](../../RESOURCE/011_array3.png)

### Operacije nad poljem

Polje ne podpira le statične definicije, ampak tudi dodajanje, brisanje, spreminjanje elementov in pridobivanje njegove dolžine.

Namig: če želimo polje spreminjati, moramo uporabiti deklaracijo var, ne pa konstante let.

**1. Dodajanje elementa**

Z metodo append lahko na konec polja dodamo element:

```swift id="6agjjj"
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Brisanje elementa**

Z metodo remove(at:) lahko izbrišemo določen element v polju:

```swift id="g18hmn"
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Spreminjanje elementa**

Element v polju lahko neposredno spremenimo z uporabo indeksa:

```swift id="2felp2"
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Štetje dolžine polja**

Z lastnostjo count dobimo število elementov v polju:

```swift id="sqvizi"
var num = [0, 1, 2]
num.count   // 3
```

### Uporaba polja za prikaz citatov

Če želimo prikazati več citatov, jih lahko shranimo v polje, nato pa do njih dostopamo prek indeksa in jih prikažemo.

Najprej v ContentView ustvarimo polje sayings za shranjevanje citatov, nato pa v pogledu Text prek indeksa preberemo in prikažemo ustrezen citat:

```swift id="0l8pyz"
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

Tukaj sayings[0] pomeni prvi citat v polju.

Če želimo prikazati drug citat, moramo samo spremeniti indeks znotraj oglatih oklepajev:

```swift id="yllv59"
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Določitev indeksa citata

Če želimo doseči dinamičen učinek preklapljanja citatov, indeksa ne moremo »zapisati na trdo« neposredno v Text.

Ustvariti moramo spremenljivko, ki samostojno shranjuje trenutno prikazani indeks.

V SwiftUI lahko za deklaracijo spremenljivega indeksa uporabimo @State:

```swift id="2dc2vz"
@State private var index = 0
```

SwiftUI bo spremljal spremenljivko, ovito z @State. Ko se index spremeni, bo SwiftUI znova izrisal pogled in prikazal ustrezen citat.

Nato uporabimo sayings[index], da dinamično dobimo citat iz polja:

```swift id="kdt0w4"
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

Ko se vrednost index spremeni, bo Text prikazal drug citat.

### Uporaba gumba za nadzor indeksa

Da nadzorujemo preklapljanje citatov, lahko uporabimo Button za spreminjanje vrednosti index. Ob vsakem kliku se index samodejno poveča za 1:

```swift id="8p6bvh"
Button("Next") {
    index += 1
}
```

Ko kliknemo gumb, se bo vrednost index spremenila z 0 na 1, sprožila osvežitev pogleda, Text(sayings[index]) pa bo prebral naslednji citat.

Vendar pa je tukaj potencialna težava: če gumb klikamo zaporedoma, se bo index povečal do vrednosti, ki presega obseg polja, kar bo povzročilo napako izhoda iz meja indeksa. Na primer, ko index doseže 5, medtem ko je obseg indeksov polja od 0 do 4, se bo program sesul.

Da preprečimo izhod iz meja polja, moramo uvesti pogojno kontrolo in zagotoviti, da index ne preseže obsega polja. To lahko dosežemo z uporabo stavka if-else, ki preveri, ali je index manjši od dolžine polja.

## Pogojna kontrola：stavek if-else

Stavek if-else je eden najpogosteje uporabljenih pogojnih stavkov v Swiftu. Uporablja se za preverjanje, ali je pogoj izpolnjen, in za izvajanje različne kode glede na to, ali je pogoj resničen ali ne.

Osnovna struktura:

```swift id="pj4z8q"
if condition {
    // Koda, ki se izvede, ko je condition true
} else {
    // Koda, ki se izvede, ko je condition false
}
```

V stavku if je pogoj condition logična vrednost (tip Bool), ki je lahko true ali false. Če je pogoj true, se izvede koda v delu if, sicer pa koda v delu else.

Na primer:

```swift id="byjkzi"
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

V tem primeru je vrednost age enaka 25. Stavek if preveri, ali je age > 18 resničen. Ker je pogoj resničen, se izpiše "Big Boy".

Če dela else ne potrebujemo, ga lahko izpustimo:

```swift id="4p3d97"
if condition {
    // Koda, ki se izvede, ko je condition true
}
```

### Uporaba pogojev za nadzor obsega indeksa

Da preprečimo izhod iz meja polja, lahko uporabimo stavek if in zagotovimo, da index ne preseže obsega polja:

```swift id="v2prg7"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logična razlaga: sayings.count ima vrednost 5, ker je skupaj 5 citatov, zato je sayings.count - 1 enako 4, kar je tudi zadnji veljavni indeks v polju.

Ko je index manjši od 4, je ob kliku gumba varno izvesti povečanje za 1. Ko pa index doseže 4, pogoj ni več izpolnjen in klik gumba ne povzroči nobene spremembe.

Zdaj je koda že uresničila funkcijo preklapljanja citatov:

```swift id="ycpo17"
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

### Kroženje citatov

Če želimo, da se po prikazu zadnjega citata ob naslednjem kliku gumba znova prikaže prvi citat in s tem dosežemo krožno prikazovanje, lahko to uresničimo z delom else:

```swift id="cpz9kc"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Ko kliknemo gumb, se bo ob doseženem zadnjem elementu v polju index ponastavil na 0 in citati se bodo začeli znova krožno prikazovati.

## Optimizacija pogleda s citati

Zdaj smo logiko vrtenja citatov že uresničili, vendar lahko vmesnik še dodatno izboljšamo, da bo lepši.

Celotna koda:

```swift id="g4ldh2"
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

V tem primeru smo pogledu Text dodali belo polprosojno ozadje in zaobljene vogale, gumb Button uporablja slog .borderedProminent, VStack pa ima nastavljeno sliko za ozadje.

Dodatno pojasnilo: kadar pri uporabi modifikatorja background() za obravnavo slikovnega ozadja uporabimo privzeto vedenje, se ta poskuša čim bolj razširiti in zapolniti območje postavitve trenutnega pogleda. V mnogih primerih se lahko naravno razširi tudi čez varno območje (Safe Area).

Zdaj smo že uresničili pogled vrtenja citatov.

![SwiftUI View](../../RESOURCE/011_word.png)

## Povzetek

S to lekcijo smo osvojili, kako uporabiti polje za shranjevanje več citatov ter kako s stavki if in if-else uresničiti vrtenje citatov.

Spoznali smo tudi osnovne operacije nad poljem, kot so dodajanje, brisanje in spreminjanje elementov, ter kako preprečiti izhod iz meja indeksa polja.

Ta lekcija ni pojasnila le implementacije funkcije vrtenja citatov, temveč je hkrati povezala tudi osnovno uporabo polj in pogojnih stavkov ter nam pomagala osvojiti sposobnost obdelave podatkov in nadzora poteka programa.

## Razširjeno znanje - večkratna pogojna presoja：stavek if-else if-else

V dejanskem razvoju moramo pogosto obravnavati več pogojev. Na primer, v neki igri lahko ob doseženi vrednosti 1 sprožimo dogodek A, ob vrednosti 2 dogodek B, ob vrednosti 3 dogodek C in tako naprej.

Ko imamo opravka z več kot dvema pogojnima vejama, uporabimo stavek if-else if-else za večkratno presojo.

Osnovna sintaksa:

```swift id="z5ec2h"
if conditionA {
    // Koda, ki se izvede, ko je conditionA true
} else if conditionB {
    // Koda, ki se izvede, ko je conditionB true
} else if conditionC {
    // Koda, ki se izvede, ko je conditionC true
} else {
    // Koda, ki se izvede, ko noben pogoj ni izpolnjen
}
```

V tem primeru bo program pogoje preverjal po vrsti in izvedel prvo vejo, katere pogoj je izpolnjen. Če ni izpolnjen noben pogoj, se izvede koda za else.

Tudi pri vrtenju citatov lahko za večkratno presojo uporabimo stavek if-else if-else:

```swift id="g2g8vd"
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

Ko je index enak 0, 1, 2 ali 3, se ob vsakem kliku gumba izvede index += 1. Ko je index enak 4, torej zadnjemu elementu, se index ponastavi na 0 in s tem dosežemo kroženje.

Veja else služi kot varnostna mreža in preprečuje težave ob morebitni neveljavni vrednosti, na primer če bi bil index po pomoti napačno spremenjen.

Treba je poudariti, da tukaj uporabljeni == pomeni preverjanje, ali sta vrednosti »enaki«. Če stavek if preverja, ali je index enak določenemu številu, bo rezultat true in izvedel se bo ustrezen blok kode. Če vrednosti nista enaki, se nadaljuje preverjanje naslednjega stavka if.

Takšna večkratna presoja je uporabna, kadar želimo v različnih pogojnih scenarijih izvajati različno kodo.
