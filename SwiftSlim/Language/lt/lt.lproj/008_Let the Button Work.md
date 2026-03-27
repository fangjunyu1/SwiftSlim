# Priverskime mygtuką veikti

Šioje pamokoje daugiausia mokysimės apie `Button` mygtukus, `print` išvestį derinimui ir Swift funkcijas.

Šis turinys yra SwiftUI interaktyvaus programavimo pagrindas.

## Mygtukas

Mygtukas yra vienas dažniausiai naudojamų UI valdiklių. Kai reikia atsisiųsti, atidaryti ar išeiti, dažniausiai spaudžiame mygtuką.

Pavyzdžiui, App Store programoje spaudžiame mygtuką „Get“, kad atsisiųstume programėlę.

![Button](../../RESOURCE/008_button.png)

SwiftUI sistemoje mygtukas žymimas `Button`.

Pagrindinis naudojimas:

```swift
Button("") {
    
}
```

Struktūrą galima padalyti į dvi dalis:

```swift
Button("Mygtuko tekstas") {
    Kodas, vykdomas paspaudus mygtuką
}
```

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Paleidus bus rodomas mygtukas `Start`.

![Button](../../RESOURCE/008_button1.png)

Kai naudotojas paspaudžia mygtuką, kodas, esantis `{}` viduje, yra vykdomas.

Svarbu atkreipti dėmesį: `Button` priklauso SwiftUI sąsajos valdikliams (`View`), todėl jį būtina rašyti `body` viduje.

### `buttonStyle` modifikatorius

SwiftUI sistemoje `Button` pateikia įtaisytus sistemos mygtukų stilius, kuriuos galima naudoti su `buttonStyle` modifikatoriumi.

Pavyzdžiui:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` pritaiko sistemos pateiktą mygtuko stilių.

Dažniausi variantai:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Šių stilių skirtumai daugiausia pasireiškia tuo, ar mygtukas turi rėmelį, foną ir kokio lygio vizualinį akcentą jis turi.

## `print` išvestis

Programuojant dažnai reikia patikrinti, ar programa pasiekė tam tikrą kodo vietą.

Swift pateikia funkciją `print`, skirtą derinimo informacijai išvesti.

Pagrindinė rašymo forma:

```swift
print("Hello")
```

Ši eilutė išves tekstą į `Console` (konsolę).

### Mygtuko veikimo patikrinimas

Galime įrašyti `print` į mygtuką ir taip patikrinti, ar mygtukas buvo paspaustas.

```swift
Button("Start") {
    print("Test 123")
}
```

Kai mygtukas paspaudžiamas, `Console` parodys:

```
Test 123
```

Tai reiškia, kad mygtukas buvo sėkmingai suaktyvintas.

![Button](../../RESOURCE/008_button3.png)

Pastaba: `print` yra Swift kodas, o ne sąsajos valdiklis. Jo negalima tiesiogiai dėti į `body`, kitaip bus pateikta klaida.

Pavyzdžiui, taip rašyti yra neteisinga:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Klaida: body turi grąžinti View
    }
}
```

SwiftUI sistemoje `body` naudojamas sąsajos struktūrai aprašyti, todėl jame galima dėti tik sąsajos valdiklius (`View`), pavyzdžiui, `Text`, `Button`, `Image` ir pan.

Įprastą kodą (skaičiavimo logiką, `print` ir pan.) reikia dėti į mygtukus, funkcijas ar kitus įvykių apdorotojus.

### `Console` konsolė

`print` išvestis rodoma Xcode `Console` (konsolėje).

Jei `Console` nematote, galite paspausti dešiniajame apatiniame kampe esantį mygtuką `Show the Debug Area`, kad atidarytumėte derinimo sritį, o tada spausti `Show the Console`, kad parodytumėte konsolę.

![](../../RESOURCE/008_button4.png)

Kairiajame apatiniame `Console` kampe yra dvi kortelės: `Executable` ir `Previews`.

![](../../RESOURCE/008_button5.png)

Šios dvi kortelės atitinka skirtingas vykdymo aplinkas: kai naudojamas `Canvas` peržiūros langas, `print` išvestis rodoma kortelėje `Previews`; jei programą paleidžiate simuliatoriuje ar tikrame įrenginyje, išvestis bus rodoma kortelėje `Executable`.

Todėl, jei pastebite, kad `print` nieko nerodo, pirmiausia verta įsitikinti, kad pasirinkote tinkamą kortelę.

## Pavyzdys - ASCII simbolių piešinys

Kai kuriuose projektų koduose dažnai galima pamatyti ASCII simbolių piešinius.

Simbolių piešinys yra iš paprastų simbolių sudarytas vaizdas, pavyzdžiui:

![ASCII](../../RESOURCE/008_ascii.png)

Galime naudoti mygtuką + `print`, kad išvestume ASCII simbolių piešinį.

Pavyzdinis kodas:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Kai paspausite mygtuką, `Console` rodys:

```
 /\_/\
( o.o )
 > ^ <
```

Pastaba: eilutėje esantis `\` turi būti rašomas kaip `\\`, nes pasvirasis brūkšnys eilutėse yra pabėgimo simbolis.

## Funkcijos

Mygtuko viduje galime tiesiogiai rašyti kodą.

Pavyzdžiui:

```swift
Button("Start") {
    print("Hello")
}
```

Jei kodo nedaug, taip rašyti nėra problema. Tačiau realiame kūrime vieno mygtuko sukelta logika gali būti gana didelė.

Pavyzdžiui:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Gali būti dar daug kodo
}
```

Jei kodo vis daugėja, rašant jį tiesiogiai mygtuko viduje sąsajos kodas tampa netvarkingas, sunkiau skaitomas ir prižiūrimas.

Todėl dažniausiai tokį kodą sutvarkome į funkciją, o mygtuke iškviečiame tą funkciją.

### Kas yra funkcija

Funkcija yra kodo dalis, kurią galima naudoti pakartotinai.

Kai tam tikrą kodą reikia vykdyti, mums tereikia iškviesti šią funkciją, ir bus paleistas joje esantis kodas.

Taip kodo struktūra tampa aiškesnė, o pakartotinis naudojimas patogesnis.

### Pagrindinė rašymo forma

Swift kalboje funkcijos apibrėžiamos naudojant raktažodį **func**:

```swift
func randomInt() {
    // code
}
```

Šis kodas apibrėžia funkciją.

`randomInt` yra funkcijos pavadinimas, naudojamas tai kodo daliai identifikuoti.

`()` žymi parametrų vietą; čia galima priimti iš išorės perduotus duomenis. Jei duomenų nereikia, ji gali likti tuščia.

`{}` vidus yra funkcijos kodo sritis, kurioje rašomas visas vykdomas kodas.

Pavyzdžiui:

```swift
func getName() {
    print("FangJunyu")
}
```

Šios funkcijos paskirtis yra išvesti teksto eilutę.

### Funkcijos iškvietimas

Funkcijos apibrėžimas tik sukuria šią kodo dalį. Jei norime ją vykdyti, turime funkciją iškviesti.

Iškvietimo būdas - po funkcijos pavadinimo pridėti `()`:

```swift
getName()
```

Kai programa pasiekia šią eilutę, ji vykdo `getName` funkcijoje esantį kodą.

Pilnas pavyzdys:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Paleidus `Console` parodys:

```
FangJunyu
```

### Funkcijų naudojimas SwiftUI aplinkoje

SwiftUI vaizde funkcijos dažniausiai rašomos už `body` ribų.

Pavyzdžiui:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Kai mygtukas paspaudžiamas, iškviečiama funkcija `getName()`.

Taip sąsajos kodas išlieka glaustas, o konkreti logika apdorojama funkcijoje.

### Funkcijų parametrai

Kartais funkcija turi atlikti skirtingus veiksmus pagal skirtingus duomenis.

Pavyzdžiui, galime norėti, kad funkcija išvestų skirtingus vardus, o ne tik fiksuotą `"FangJunyu"`.

Tokiu atveju galima naudoti parametrus. Parametrus galima suprasti kaip duomenis, perduodamus iškviečiant funkciją.

Pavyzdžiui:

```swift
func getName(name: String) {
    print(name)
}
```

Ši funkcija turi naują parametrą: `name` yra parametro pavadinimas, o `String` - parametro tipas.

Tai reiškia, kad funkcija turi gauti `String` tipo duomenis.

Kadangi funkcijai dabar reikia duomenų, juos būtina pateikti iškvietimo metu.

```swift
getName(name: "Sam")
```

Kai iškviečiant perduodama `"Sam"`, funkcijos viduje išvedama būtent ši reikšmė.

Vykdymo rezultatas:

```
Sam
```

## Pavyzdys - ASCII simbolių piešinio išvedimas naudojant funkciją

Ankstesniame pavyzdyje `print` rašėme tiesiai mygtuko viduje.

Tačiau jei simbolių piešinys sudėtingesnis, kodas tampa ilgas. Tokiu atveju logiką verta perkelti į funkciją, kad sąsajos kodas būtų aiškesnis.

Pavyzdinis kodas:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Paleidus ir paspaudus mygtuką, `Console` rodys:

```
 /\_/\
( o.o )
 > ^ <
```

Čia įvyksta du dalykai, kai naudotojas paspaudžia mygtuką:

1. Mygtukas iškviečia funkciją `printCat()`
2. Funkcijoje esantis `print` kodas yra vykdomas

Taip sąsajos kodas atsako tik už įvykio sužadinimą, o konkreti logika apdorojama funkcijoje.

Realiame kūrime dauguma mygtukų veiksmų įgyvendinami per funkcijas.

## Santrauka

Šioje pamokoje išmokome tris svarbius dalykus:

**1. `Button` mygtukas**

`Button` yra SwiftUI valdiklis, naudojamas veiksmui sužadinti.

```swift
Button("Start") {

}
```

Kai naudotojas paspaudžia mygtuką, vykdomas figūriniuose skliaustuose esantis kodas.

**2. `print` išvestis**

`print` naudojamas derinimo informacijai išvesti į `Console`.

```swift
print("Hello")
```

Kūrėjas gali stebėti programos būseną per `Console`.

**3. Funkcijos**

Funkcija yra pakartotinai naudojama kodo dalis.

```swift
func sayHello() {
    print("Hello")
}
```

Funkcijos iškvietimas:

```swift
sayHello()
```

Jei funkcijai reikia duomenų, galima naudoti parametrus:

```swift
func sayHello(name: String) {
    print(name)
}
```

Vėlesnėse pamokose toliau mokysimės daugiau SwiftUI valdiklių ir kaip duomenys sąveikauja su sąsaja.

## Pratimas

Pabandykite atlikti toliau pateiktą pratimą:

1. Sukurkite mygtuką, kurio tekstas būtų `"Hello"`
2. Paspaudus mygtuką, `Console` išveskite `Hello Swift`
3. Išvesties kodą perkelkite į funkciją, o tada tą funkciją iškvieskite mygtuke
