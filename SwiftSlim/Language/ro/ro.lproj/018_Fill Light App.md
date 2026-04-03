# Aplicația Fill Light

În această lecție, vom construi o aplicație fill light foarte interesantă. Când se lasă noaptea, putem face ecranul telefonului să afișeze culori diferite și să îl folosim ca o lumină de umplere simplă.

Această aplicație fill light poate schimba culorile prin atingerea ecranului și poate ajusta luminozitatea folosind un glisor.

În acest exemplu, vom învăța cum să folosim `brightness` pentru a ajusta luminozitatea unei vizualizări, `onTapGesture` pentru a adăuga un gest de atingere unei vizualizări și controlul `Slider`.

Rezultat:

![Color](../../Resource/018_color.png)

## Afișarea unei culori

Mai întâi, să facem ca vizualizarea să afișeze o culoare.

În SwiftUI, `Color` nu reprezintă doar o culoare, ci poate fi afișat și ca o vizualizare:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Aici, `Color.red` reprezintă o vizualizare roșie. `.ignoresSafeArea()` face ca vizualizarea de culoare să umple întregul ecran, astfel încât să semene mai mult cu un efect real de fill light.

Rezultat:

![Color](../../Resource/018_color1.png)

### Array de culori și index

Acum este afișată doar o singură culoare. Dar o lumină fill light nu are de obicei doar o singură culoare. Ea poate afișa și albastru, galben, mov, alb și alte culori.

Vrem să schimbăm între culori diferite atunci când ecranul este atins. Putem pune aceste culori într-un array pentru a le gestiona împreună:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Un array este potrivit pentru stocarea „unui grup de date de același tip”. Aici, fiecare element din array este un `Color`.

Dacă vrem să afișăm o anumită culoare, putem folosi un index:

```swift
colors[0]
```

Aceasta înseamnă să citim culoarea de la indexul `0` din array, adică prima culoare.

Acum codul poate fi scris astfel:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Astfel, ecranul afișează prima culoare din array, adică roșu.

### Folosirea indexului pentru a controla culoarea

Dacă trebuie să schimbăm între culori diferite, avem nevoie de o variabilă pentru a gestiona indexul, în loc să scriem indexul fix.

Putem folosi `@State` pentru a declara o variabilă care să stocheze indexul:

```swift
@State private var index = 0
```

Aici, `index` reprezintă indexul culorii curente.

Când `index` se schimbă, SwiftUI recalculează interfața și actualizează conținutul afișat.

Apoi schimbăm vechiul `colors[0]` în:

```swift
colors[index]
```

Astfel, culoarea afișată în vizualizare este determinată de `index`.

Acum codul devine:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Când `index` se schimbă, `colors[index]` va afișa și el o altă culoare.

De exemplu:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Este important de reținut că `index` nu poate depăși indexul maxim al array-ului, altfel va apărea o eroare de index în afara intervalului.

## Gest de atingere

Acum putem afișa culori diferite în funcție de `index`, dar încă nu putem atinge pentru a le schimba.

În lecția anterioară „Carusel de citate”, am folosit `Button` pentru a controla schimbarea citatelor.

Dar de data aceasta vrem să „atingem întreaga zonă colorată” pentru a schimba culoarea, așa că `onTapGesture` este mai potrivit.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Când atingem vizualizarea de culoare, se execută acest cod:

```swift
index += 1
```

Asta înseamnă că mărim `index` cu `1`. După ce indexul crește, `colors[index]` va afișa următoarea culoare din array.

### `onTapGesture`

`onTapGesture` este un modificator de gest care adaugă o acțiune de atingere unei vizualizări.

Utilizare de bază:

```swift
.onTapGesture {
    // code
}
```

De exemplu:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Când această vizualizare roșie este atinsă, codul din acolade se execută și în consolă apare:

```swift
Click color
```

Prin `onTapGesture`, putem defini ce se întâmplă după ce o vizualizare este atinsă.

### Diferența față de `Button`

Mai devreme am învățat despre vizualizarea `Button`. Atât `Button`, cât și `onTapGesture` pot gestiona acțiuni de atingere, dar scenariile lor de utilizare nu sunt exact aceleași.

`onTapGesture` este mai potrivit pentru „a adăuga funcția de atingere unei vizualizări deja existente”, cum ar fi `Color`, `Image`, `Text` sau o altă vizualizare obișnuită.

`Button` este mai potrivit atunci când vrem să reprezentăm un buton clar, cum ar fi „Confirmă”, „Trimite” sau „Șterge”.

În această aplicație fill light, vrem ca funcția de schimbare a culorii să fie mai simplă. Atingerea întregii zone colorate pentru a schimba culoarea face ca `onTapGesture` să fie o alegere bună aici.

## Problema indexului

Acum putem atinge ecranul pentru a schimba între culori diferite.

Dar aici există o problemă importantă: **indexul poate depăși intervalul array-ului**.

De exemplu:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Dacă continuăm să atingem ecranul, `index` va deveni în cele din urmă `4`, iar atunci va apărea eroarea „index out of range”.

Acest lucru se întâmplă deoarece array-ul `colors` are `4` elemente, dar indexarea începe de la `0`, deci intervalul valid de indecși este `0 - 3`, nu `4`.

Dacă accesăm `colors[4]`, va apărea eroarea „index out of range”.

În codul actual, fiecare atingere mărește automat `index` cu `1`. Dacă nu gestionăm acest lucru, la final va ieși cu siguranță din intervalul valid.

De aceea, atunci când ecranul este atins, trebuie să verificăm indexul: dacă este deja ultima culoare, ne întoarcem la prima; altfel continuăm să adăugăm `1`.

Putem face acest lucru cu o instrucțiune `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

În acest cod, `colors.count` înseamnă numărul de elemente din array.

În array-ul actual există 4 culori, deci:

```swift
colors.count // 4
```

Dar indexul maxim nu este `4`, ci `3`, deoarece indexarea începe de la `0`.

De aceea, ultimul index trebuie scris astfel:

```swift
colors.count - 1
```

Adică:

```swift
4 - 1 = 3
```

Această logică înseamnă: dacă indexul actual corespunde deja ultimei culori, resetează indexul la `0`; în caz contrar, mărește-l cu `1`.

În acest fel, culorile se pot schimba în buclă.

### Optimizarea logicii indexului

Dacă vrem să facem codul mai concis, putem folosi și operatorul ternar:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Acest cod înseamnă: dacă `index == colors.count - 1` este adevărat, întoarce `0`. În caz contrar, întoarce `index + 1`.

La final, atribuim rezultatul înapoi lui `index`.

Acum putem obține efectul de schimbare a culorilor.

Cod complet:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Acum putem atinge ecranul și schimba între culori diferite. O aplicație fill light de bază este gata.

## Afișarea numelui culorii

Putem adăuga încă un grup de texte corespunzătoare culorilor, astfel încât atunci când culoarea se schimbă, pe ecran să fie afișat și numele culorii actuale.

De exemplu:

- Roșu afișează `Red`
- Albastru afișează `Blue`
- Galben afișează `Yellow`
- Mov afișează `Purple`

Și aici putem folosi un array pentru a stoca numele culorilor:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Ordinea textelor din acest array trebuie să corespundă exact cu ordinea culorilor din array-ul de culori.

Apoi putem folosi `Text` pentru a afișa numele culorii pentru indexul curent:

```swift
Text(colorsName[index])
```

`Text` afișează numele culorii actuale în funcție de `index`.

Folosiți modificatori pentru a îmbunătăți aspectul lui `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Astfel, `Text` va apărea alb, cu dimensiune de titlu și cu font îngroșat.

Acum avem o vizualizare `Color` pe tot ecranul. Dacă vrem ca `Text` să apară deasupra vizualizării `Color`, trebuie să folosim containerul de layout `ZStack` pentru a le suprapune.

```swift
ZStack {
    Color
    Text
}
```

Așadar, codul devine:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

În acest fel, fundalul este vizualizarea de culoare, iar deasupra este suprapusă o vizualizare de text.

Rezultat:

![Color](../../Resource/018_color2.png)

Un lucru important de observat este că într-un `ZStack`, vizualizările scrise mai târziu apar de obicei în față. Dacă `Text` este scris înainte de `Color`, vizualizarea `Color` scrisă mai târziu poate acoperi `Text`.

## Controlul luminozității

Acum putem schimba între culori diferite, dar un fill light mai are o funcție importantă: **reglarea luminozității**.

În SwiftUI, putem folosi modificatorul `brightness` pentru a regla luminozitatea unei vizualizări.

De exemplu:

```swift
.brightness(1)
```

Putem scrie:

```swift
colors[index]
    .brightness(0.5)
```

Acest lucru face culoarea actuală mai luminoasă și mai apropiată de efectul unei lumini fill light.

Intervalul luminozității este `0 - 1`. `0` înseamnă păstrarea culorii originale, iar cu cât valoarea este mai aproape de `1`, cu atât culoarea devine mai luminoasă. `1` înseamnă cel mai luminos rezultat alb.

Deși putem controla `brightness` în cod, utilizatorul încă nu îl poate ajusta direct singur.

De aceea trebuie să adăugăm un control care poate fi glisat: `Slider`.

## Vizualizarea `Slider`

În SwiftUI, `Slider` este un control folosit pentru a selecta o valoare dintr-un interval. Apple îl descrie ca „un control pentru selectarea unei valori dintr-un interval liniar limitat”.

Utilizare de bază:

```swift
Slider(value: $value, in: 0...1)
```

Explicația parametrilor:

1. `value: $value`: `Slider` trebuie să fie legat de o variabilă.

    Când glisorul este mutat, valoarea variabilei se schimbă în același timp. Invers, dacă variabila se schimbă, glisorul este și el actualizat.

    Acest lucru este foarte asemănător cu `TextField`, pe care l-am învățat mai devreme. Ambele „leagă un control de o variabilă”.

    O variabilă legată are nevoie de simbolul `$` în față pentru a reprezenta binding-ul.

2. `in: 0...1`: acest parametru reprezintă intervalul de valori al glisorului.

    Aici, `0...1` înseamnă că valoarea minimă este `0` și valoarea maximă este `1`.

    Când glisorul este mutat complet spre stânga, variabila legată este aproape de `0`; când este mutat complet spre dreapta, este aproape de `1`.

De exemplu:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` este legat de variabila `value`. Când glisorul este mutat, valoarea lui `value` se schimbă în același timp.

Aspect:

![Slider](../../Resource/018_slider.png)

Când `Slider` este mutat spre stânga, valoarea legată `value` devine `0`. Când este mutat spre dreapta, devine `1`.

### Intervalul valorilor

Intervalul valorilor pentru `Slider` nu este fix. Poate fi scris și așa:

```swift
0...100
```

sau ca alt interval.

Dar în această aplicație fill light trebuie să controlăm luminozitatea, deci `0...1` este alegerea cea mai potrivită.

## Folosirea `Slider` pentru a controla luminozitatea

Acum trebuie să conectăm `Slider` cu `brightness`.

Mai întâi, creați o variabilă pentru a stoca valoarea luminozității:

```swift
@State private var slider = 0.0
```

Aici, `0.0` este o valoare de tip `Double`.

Deoarece `Slider` este de obicei legat de un tip numeric, iar aici vrem ca el să se schimbe continuu, `Double` este mai potrivit. În plus, `brightness` poate primi doar o valoare de tip `Double`.

Apoi transmiteți această valoare în `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Când `slider == 0`, culoarea rămâne în starea ei implicită. Cu cât `slider` este mai aproape de `1`, cu atât culoarea pare mai luminoasă.

### Adăugarea controlului `Slider`

Apoi adăugați un control `Slider` pentru a modifica această variabilă:

```swift
Slider(value: $slider, in: 0...1)
```

Când glisorul se schimbă, și valoarea lui `slider` se schimbă, iar `brightness(slider)` actualizează luminozitatea în același timp.

Acesta este un exemplu foarte tipic al ideii că „variabilele conduc vizualizarea” în SwiftUI.

### Ajustarea aspectului lui `Slider`

În mod implicit, `Slider` folosește lățimea disponibilă.

Îi putem da o lățime fixă:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Apoi mai adăugăm câțiva modificatori pentru a-l face mai ușor de observat:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Acest lucru oferă glisorului un fundal alb și colțuri rotunjite, astfel încât să iasă mai clar în evidență pe vizualizarea `Color`.

La final, plasați-l în partea de jos a ecranului.

Deoarece folosim deja `ZStack`, putem plasa un `VStack` în interiorul lui și să folosim `Spacer()` pentru a împinge `Slider` în jos.

## Cod complet

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Rezultat:

![Color](../../Resource/018_color.png)

## Rezumat

Folosind cunoștințele pe care le-am învățat înainte, împreună cu concepte de bază precum culorile și array-urile, am construit o aplicație fill light foarte interesantă.

Prin această aplicație fill light, am învățat să folosim `brightness` pentru a regla luminozitatea, `onTapGesture` pentru a adăuga acțiuni de atingere la vizualizări și controlul `Slider`.

Am adăugat `onTapGesture` la vizualizarea `Color` pentru a schimba culorile. De asemenea, am folosit controlul `Slider` pentru a schimba o variabilă care gestionează `brightness`, ceea ce este un alt exemplu al faptului că „variabilele conduc vizualizarea”.

Am revăzut și operatorul ternar, am folosit `ZStack` pentru a suprapune vizualizările și am folosit array-uri pentru a gestiona un grup de date de același tip. Acest lucru ne ajută să aprofundăm înțelegerea noastră despre array-uri și indecși, inclusiv despre problema practică de a evita erorile de index în afara intervalului.

Deși acest exemplu nu este complicat, el leagă multe dintre ideile de bază pe care le-am învățat înainte. Când sunt combinate într-un proiect mic, real, devine mai ușor să înțelegem la ce folosește fiecare concept.

### Scenariu de utilizare în viața reală

Imaginează-ți că așezi un iPhone vechi pe birou și folosești aplicația fill light pe care ai dezvoltat-o chiar tu pentru a controla culoarea luminii. Ar fi o experiență foarte plăcută.

Există multe aplicații „fill light” în App Store, iar nici acestea nu par foarte complicate.

![AppStore](../../Resource/018_appStore.PNG)

Putem începe prin a dezvolta aplicații simple și a încerca să le publicăm în App Store. Asta nu doar că ne crește interesul pentru dezvoltare, dar ne și înregistrează progresul.

### Exercițiu după lecție

Poți continua să te gândești la moduri de a extinde această aplicație fill light, de exemplu:

- Adaugă mai multe culori
- Afișează valoarea curentă a luminozității
- Îmbunătățește designul zonei cu slider din partea de jos

Când vei începe să folosești cu adevărat aceste cunoștințe, vei descoperi că fiecare concept pe care îl învățăm este, de fapt, un instrument pentru a construi aplicații.

Cu cât stăpânim mai multe instrumente, cu atât putem crea mai multe funcții.
