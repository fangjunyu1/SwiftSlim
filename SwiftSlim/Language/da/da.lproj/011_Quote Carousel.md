# Citatkarussel

I denne lektion implementerer vi en funktion til en "citatkarussel" og lærer mere i dybden om grundlæggende Swift-viden som arrays (`Array`) og betingede sætninger (`if-else`).

Vi vil vise, hvordan man gemmer flere citater og bruger knapinteraktion til at opnå en cirkulær afspilning af citaterne.

![alt text](../../RESOURCE/011_word.png)

## Vis citater

Først skal vi vise et citat i SwiftUI.

Den enkleste måde er at bruge `Text`-visningen:

```swift
Text("Slow progress is still progress.")
```

Denne kode kan kun vise ét fast citat. Hvis vi vil vise flere citater og skifte mellem dem, skal vi først gemme dem.

Men en almindelig strengvariabel kan kun gemme ét citat:

```swift
let sayings = "Slow progress is still progress."
```

Hvis vi vil gemme flere citater, skal vi erklære en variabel for hvert enkelt citat:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Men i reel udvikling er denne metode ikke bare besværlig. Fordi hver variabel er uafhængig, kan vi heller ikke lave en fleksibel karusselvisning.

For at gøre det lettere at styre flere citater skal vi bruge en datastruktur, som kan gemme dem samlet. Det er netop et array (`Array`).

Når vi bruger et array, kan koden ovenfor gemmes sådan:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tip: I programmeringskonventioner bruger arrayvariabler, der gemmer flere elementer, normalt flertalsform, som for eksempel `sayings`, for at afspejle, at de repræsenterer en samling.**

## Arrays

I Swift er et array en samling af ordnede elementer og skrives med firkantede parenteser `[]`.

```swift
[]
```

Et array kan indeholde flere elementer af samme type, adskilt med engelske kommaer `,`.

For eksempel:

```swift
[101, 102, 103, 104, 105]
```

Vi kan forstå et array ret enkelt som et tog:

![Array](../../RESOURCE/011_array1.png)

Hele toget repræsenterer arrayobjektet, og hver vogn er arrangeret i rækkefølge.

### Indeks og adgang til elementer

Fordi arrays er ordnede, kan systemet finde et bestemt element ud fra dets position. Denne positioneringsmekanisme kaldes et indeks (`Index`).

I Swift, og i de fleste andre programmeringssprog, begynder arrayindekser ved `0` og ikke ved `1`. Det betyder, at det første element har indeks `0`, det andet har indeks `1` og så videre.

![Array](../../RESOURCE/011_array2.png)

Hvis vi vil have adgang til et bestemt element i arrayet, skal vi blot skrive arraynavnet efterfulgt af firkantede parenteser og indsætte målindekset derinde.

For eksempel:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Hvis vi prøver at få adgang til et indeks uden for arrayets gyldige område, opstår der et "index out of range"-problem. Derfor skal vi være forsigtige med at sikre, at indekset ligger inden for det gyldige område.

**Indeks uden for område**

For eksempel: Hvis et array kun har 5 elementer, er de gyldige indeks `0` til `4`. Hvis vi prøver at læse `sayings[5]`, vil programmet ikke kunne finde den tilsvarende "vogn", hvilket udløser en fejl om indeks uden for område og får appen til at crashe.

![Array](../../RESOURCE/011_array3.png)

### Arbejd med arrays

Arrays understøtter ikke kun statisk definition, men også handlinger som at tilføje, slette og ændre elementer samt at få længden af arrayet.

Tip: Hvis du vil ændre et array, skal du erklære det med `var` og ikke med konstanten `let`.

**1. Tilføj et element**

Du kan bruge metoden `append` til at tilføje et element til slutningen af arrayet:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Slet et element**

Med metoden `remove(at:)` kan du fjerne et bestemt element fra arrayet:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Ændr et element**

Du kan direkte bruge indekset til at ændre et element i arrayet:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Tæl længden af arrayet**

Brug egenskaben `count` til at få antallet af elementer i arrayet:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Brug arrays til at vise citater

For at vise flere citater kan vi gemme citaterne i et array og derefter læse og vise dem via et indeks.

Først opretter vi et `sayings`-array i `ContentView` for at gemme citaterne. Derefter læser og viser vi det tilsvarende citat i `Text` ved hjælp af et indeks:

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

Her betyder `sayings[0]` det første citat i arrayet.

Hvis vi vil vise et andet citat, behøver vi kun ændre indeksværdien inde i parenteserne:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definér citatets indeks

Hvis vi vil opnå en dynamisk skifteeffekt mellem citater, kan vi ikke bare "låse" indekset direkte fast inde i `Text`.

Vi skal oprette en variabel, som separat gemmer det indeks, der vises i øjeblikket.

I SwiftUI kan vi bruge `@State` til at erklære et ændringsbart indeks:

```swift
@State private var index = 0
```

SwiftUI vil overvåge variabler pakket ind med `@State`. Når `index` ændrer sig, vil SwiftUI gengive visningen igen og vise det tilsvarende citat.

Derefter bruger vi `sayings[index]` til dynamisk at hente citatet i arrayet:

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

Når værdien af `index` ændrer sig, vil `Text` vise et andet citat.

### Brug en knap til at styre indekset

For at styre skiftet mellem citater kan vi bruge en `Button` til at ændre værdien af `index`. Hver gang der trykkes på knappen, øges `index` automatisk med `1`:

```swift
Button("Next") {
    index += 1
}
```

Når vi trykker på knappen, ændres værdien af `index` fra `0` til `1`, visningen opdateres, og `Text(sayings[index])` vil læse næste citat.

Men her er der et muligt problem: Hvis vi klikker på knappen mange gange i træk, kan `index` blive større end arrayets gyldige område. Det vil føre til en fejl om indeks uden for område. For eksempel, når `index` bliver `5` (mens arrayets indeks kun går fra `0` til `4`), vil programmet crashe.

For at undgå dette skal vi tilføje en betingelse, der sikrer, at `index` ikke overskrider arrayets område. Det kan vi gøre med en `if-else`-sætning, der kontrollerer, om `index` er mindre end arrayets længde.

## Betinget kontrol: if-else-sætninger

`if-else` er en af de mest almindelige betingede forgreningssætninger i Swift. Den bruges til at afgøre, om en betingelse er opfyldt, og derefter udføre forskellige kodeblokke afhængigt af om den er sand eller falsk.

Grundstruktur:

```swift
if condition {
    // Kode der udføres, når condition er true
} else {
    // Kode der udføres, når condition er false
}
```

I en `if`-sætning er betingelsen `condition` en boolsk værdi (`Bool`), som kan være `true` eller `false`. Når betingelsen er `true`, udføres koden i `if`, ellers udføres koden i `else`.

For eksempel:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

I dette eksempel er værdien af `age` `25`, og `if`-sætningen kontrollerer, om `age > 18` er sand. Da betingelsen er opfyldt, vises `"Big Boy"`.

Hvis du ikke har brug for `else`-delen, kan den udelades:

```swift
if condition {
    // Kode der udføres, når condition er true
}
```

### Brug betingelser til at kontrollere indeksområdet

For at forhindre, at arrayindekset går uden for området, kan vi bruge en `if`-sætning til at sikre, at `index` ikke overskrider arrayets gyldige område:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logisk analyse: værdien af `sayings.count` er `5`, fordi der er `5` citater. Derfor er `sayings.count - 1` lig med `4`, og det er også det sidste gyldige indeks i arrayet.

Når `index` er mindre end `4`, er det sikkert at øge værdien med `1`, når man trykker på knappen. Når `index` først når `4`, er betingelsen ikke længere opfyldt, og et klik på knappen vil ikke have nogen virkning.

Nu har koden allerede implementeret skiftet mellem citater:

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

### Citater i løkke

Hvis vi ønsker, at der efter det sidste citat igen skal vises det første citat, når der trykkes på knappen, så vi opnår en cirkulær visning, kan det gøres gennem `else`-delen:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Når der trykkes på knappen, og `index` er nået til det sidste element i arrayet, nulstilles `index` til `0`, og citaterne begynder igen fra starten.

## Optimer visningen af citaterne

Nu har vi implementeret logikken for citatkarussellen, men vi kan stadig optimere interfacet yderligere, så det ser pænere ud.

Fuld kode:

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

I dette eksempel har `Text`-visningen fået en hvid halvtransparent baggrund og afrundede hjørner, `Button` bruger stilen `.borderedProminent`, og `VStack` har et baggrundsbillede.

Supplerende videnspunkt: Når man bruger modifieren `background()` til at behandle et billedbaggrund, er standardadfærden at fylde det layoutområde, som den aktuelle visning befinder sig i, så meget som muligt. I mange tilfælde kan baggrunden også naturligt strække sig ind over `Safe Area`.

Nu har vi implementeret citatkarussel-visningen.

![SwiftUI View](../../RESOURCE/011_word.png)

## Opsummering

Gennem denne lektion lærte vi, hvordan man bruger arrays til at gemme flere citater og bruger `if`- og `if-else`-sætninger til at få citaterne til at rotere.

Vi lærte også grundlæggende arrayoperationer som at tilføje, slette og ændre elementer samt hvordan man forhindrer, at arrayindekser går uden for området.

Denne lektion forklarer ikke kun, hvordan man implementerer en citatkarussel, men kombinerer også grundlæggende brug af arrays og betingede sætninger, så vi bedre kan beherske databehandling og kontrol af programflow.

## Udvidet viden - Flere betingelser: if-else if-else

I reel udvikling er det ofte nødvendigt at håndtere flere betingelser. For eksempel i et spil: når pointene er lig med `1`, udløses hændelse `A`; når de er `2`, udløses hændelse `B`; når de er `3`, udløses hændelse `C`; og så videre.

Når vi står over for situationer med mere end to betingede grene, har vi brug for `if-else if-else` til flerleddet vurdering.

Grundlæggende syntaks:

```swift
if conditionA {
    // Kode der udføres, når conditionA er true
} else if conditionB {
    // Kode der udføres, når conditionB er true
} else if conditionC {
    // Kode der udføres, når conditionC er true
} else {
    // Kode der udføres, når ingen betingelser er opfyldt
}
```

I denne situation vil programmet kontrollere betingelserne i rækkefølge og udføre den første betingelse, der er opfyldt. Hvis ingen betingelser er opfyldt, udføres koden efter `else`.

I citatkarussellen kan vi også bruge `if-else if-else` til flerleddet vurdering:

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

Når `index` er `0`, `1`, `2` eller `3`, udføres `index += 1`, hver gang der trykkes på knappen. Når `index` er `4`, som er det sidste element, nulstilles `index` til `0`, så der opnås en løkke.

`else`-grenen bruges som en sidste sikkerhed for at forhindre ugyldige værdier, for eksempel hvis `index` ved en fejl er blevet ændret forkert.

Det er vigtigt at bemærke, at `==` her betyder "er lig med". Hvis `if`-sætningen vurderer, at `index` er lig med et bestemt tal, returnerer den `true` og udfører den efterfølgende kodeblok. Hvis den ikke er lig, fortsætter vurderingen til næste `if`.

Denne type flerleddet vurdering gør det lettere at udføre forskellig kode i forskellige betingede scenarier.
