# Tworzenie strony osobistego CV

W tej lekcji stworzymy prosty widok osobistego CV i nauczymy się następujących zagadnień:

* cornerRadius
* spacing
* ScrollView

W trakcie budowania widoku powtórzymy wiedzę o układach, Text i Image, a także zrealizujemy kontrolę odstępów i efekt przewijania treści.

## Osobiste CV

Docelowy efekt:

![Swift](../../RESOURCE/004_img.png)

**Najpierw spróbuj wykonać to samodzielnie, a dopiero potem czytaj dalsze wyjaśnienia.**

### Tworzenie projektu

Utwórz nowy projekt iOS albo kontynuuj pracę na poprzednim projekcie.

Domyślny kod ContentView:

```swift id="f0v3se"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Teraz usuń ten kod i zacznij pisać własną zawartość:

```swift id="6yp6sg"
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Ogólna struktura

W rzeczywistym programowaniu zazwyczaj najpierw projektujemy ogólną strukturę.

Nasza strona zawiera:

1. tytuł
2. informacje osobiste
3. przedstawienie siebie

Na zewnątrz dodajemy VStack:

```swift id="ykobwr"
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack zapewnia pionowe ułożenie widoków i pozwala kontrolować ich kolejność oraz odstępy.

### Tytuł

Najpierw tworzymy Text do wyświetlenia tytułu.

Tutaj jako tytuł wyświetlam swoje angielskie imię i nazwisko:

```swift id="ri0omf"
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Tytuł zwykle jest większy i pogrubiony, dlatego używamy modyfikatorów font i fontWeight:

```swift id="ckq3hx"
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Układ

Domyślne wyrównanie w SwiftUI to center, więc tytuł pojawia się na środku ContentView.

![Swift](../../RESOURCE/004_img3.png)

Musimy wyświetlić tytuł w górnej części widoku. Do korekty układu możemy użyć Spacer:

```swift id="s4x6bm"
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer zajmie pozostałą przestrzeń i wypchnie Text do górnej części kontenera.

![Swift](../../RESOURCE/004_img4.png)

### Pusta przestrzeń

Jeśli uważasz, że tekst jest zbyt blisko górnej krawędzi, możesz użyć padding albo Spacer.

**1. padding**

```swift id="ny8u7l"
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Ustawia to górny odstęp padding dla VStack na 20.

**2. Spacer**

```swift id="g6bqmc"
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Można też użyć Spacer i ustawić wysokość przez frame, aby uzyskać pustą przestrzeń o określonej wysokości.

Efekt końcowy:

![Swift](../../RESOURCE/004_img5.png)

### Obraz

Przygotowujemy własne zdjęcie portretowe i umieszczamy je w folderze zasobów Assets.

![Swift](../../RESOURCE/004_img6.png)

W ContentView używamy Image do wyświetlenia obrazu:

```swift id="1v0xmi"
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Ponieważ oryginalny rozmiar obrazu jest dość duży, musimy użyć frame do kontrolowania rozmiaru wyświetlania.

```swift id="7ljuc1"
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

W tym momencie pojawia się pewien problem:

Jeśli proporcje szerokości i wysokości w frame nie zgadzają się z oryginalnymi proporcjami obrazu, obraz zostanie zniekształcony.

Na przykład:

```swift id="gvtykb"
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Aby uniknąć zniekształcenia obrazu, musimy użyć scaledToFit:

```swift id="xdrf9f"
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Działanie scaledToFit polega na tym, że:

w zadanym obszarze frame obraz jest skalowany zgodnie ze swoimi oryginalnymi proporcjami i wyświetlany w całości.

Nie rozciąga on obrazu na siłę, aby wypełnić cały frame, tylko zachowuje proporcje szerokości i wysokości i skaluje go równomiernie, aż jedna z krawędzi dokładnie dopasuje się do granicy.

To oznacza, że:

* jeśli szerokość frame jest mniejsza, obraz będzie skalowany względem szerokości
* jeśli wysokość frame jest mniejsza, obraz będzie skalowany względem wysokości
* obraz zawsze zachowuje oryginalne proporcje i nie ulega zniekształceniu

Zazwyczaj można ustawić rozmiar tylko w jednym kierunku. Na przykład:

```swift id="529fdz"
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

W ten sposób system automatycznie obliczy odpowiednią wysokość na podstawie szerokości 140, zachowując proporcje obrazu.

Jeśli chcesz ustalić proporcje wizualne albo uniknąć ściskania w bardziej złożonym układzie, możesz jednocześnie ograniczyć szerokość i wysokość.

### Zaokrąglone rogi

Jeśli chcesz wyświetlać obraz z zaokrąglonymi rogami, możesz użyć modyfikatora cornerRadius:

```swift id="d8jqft"
.cornerRadius(10)
```

Na przykład:

```swift id="1mjlwm"
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Dodajemy cornerRadius(20) za modyfikatorami Image.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) oznacza przycięcie granic widoku i zastosowanie promienia zaokrąglenia 20.

Po dodaniu zaokrągleń cztery rogi obrazu stają się łukami, co daje łagodniejszy i nowocześniejszy efekt wizualny.

Taki styl projektowania jest dziś bardzo powszechny. Na przykład ikony aplikacji iOS również mają kształt zaokrąglonego prostokąta, chociaż systemowe ikony używają superelipsy o ciągłej krzywiźnie, a nie zwykłego prostego zaokrąglenia.

### Informacje osobiste

Teraz zaczynamy tworzyć obszar informacji osobistych po lewej stronie obrazu. Z układu interfejsu widać, że informacje osobiste i obraz są rozmieszczone poziomo, więc należy użyć HStack.

![Swift](../../RESOURCE/004_img10.png)

```swift id="zn0d1w"
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Treść informacji osobistych jest ułożona pionowo.

![Swift](../../RESOURCE/004_img11.png)

Dlatego na zewnątrz używamy HStack, dla informacji osobistych VStack, a dla treści tekstowych Text.

Podstawowa struktura:

```swift id="df6fqu"
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Pogrubienie nazw pól**

Aby odróżnić nazwę pola od jego wartości, możemy użyć fontWeight dla nazw pól:

```swift id="gxh669"
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Wyrównanie tekstu do lewej**

Domyślnie VStack jest wyśrodkowany. Jeśli chcemy, aby cały tekst był wyrównany do lewej, trzeba ustawić alignment:

```swift id="c0h7kj"
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading oznacza wyrównanie do lewej strony, w środowisku języków od lewej do prawej.

![Swift](../../RESOURCE/004_img14.png)

### Odstępy

Jeśli chcesz zachować stały odstęp między informacjami osobistymi a obrazem, wcześniej uczyliśmy się zostawiać pustą przestrzeń za pomocą Spacer:

```swift id="o8a842"
Spacer()
    .frame(width: 10)
```

Można też użyć parametru spacing w HStack:

```swift id="qh2h6g"
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 oznacza, że odstęp między dwoma widokami podrzędnymi wynosi 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Czym jest spacing?**

W VStack, HStack i ZStack spacing może kontrolować odległość między widokami podrzędnymi.

Na przykład:

```swift id="6w6z0k"
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Odstęp między widokami podrzędnymi w VStack zostanie ustawiony na 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Trzeba pamiętać, że spacing działa tylko na „bezpośrednie widoki podrzędne” i nie wpływa na układ wewnątrz zagnieżdżonych kontenerów.

**Kontrolowanie odstępów wewnątrz listy**

Jeśli chcesz zwiększyć odstęp między polami, najprostszym sposobem jest ustawienie spacing dla VStack:

```swift id="pmy4a7"
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Wtedy odstęp między wszystkimi widokami podrzędnymi wynosi 10 pt.

Jednak po obejrzeniu interfejsu pojawia się pewien problem:

odstęp pojawia się zarówno między grupami pól, jak i między nazwą pola a jego wartością.

Dzieje się tak dlatego, że spacing działa na wszystkie bezpośrednie widoki podrzędne bieżącego kontenera.

W tej strukturze każdy Text jest bezpośrednim widokiem podrzędnym zewnętrznego VStack, dlatego odstępy są takie same.

Jeśli chcesz, aby odstęp występował między grupami pól, ale nazwa pola i wartość pozostały blisko siebie, możesz potraktować „nazwę pola + wartość pola” jako jedną logiczną całość i opakować ją osobnym VStack:

```swift id="p1k7y8"
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Wtedy struktura zmienia się tak, że odstępy występują między zewnętrznymi VStack, a wewnątrz wewnętrznych VStack pozostaje domyślny, zwarty układ. Dzięki temu nie pojawi się dodatkowa przerwa między nazwą pola a jego wartością.

![Swift](../../RESOURCE/004_img18.png)

### Przedstawienie siebie

Następnie tworzymy obszar przedstawienia siebie.

Z układu interfejsu widać, że treść przedstawienia składa się z wielu linii tekstu ułożonych pionowo.

![Swift](../../RESOURCE/004_img19.png)

Dlatego można użyć VStack razem z Text:

```swift id="5vwqbq"
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Zwiększenie odstępów**

Teraz sekcja informacji osobistych i sekcja przedstawienia siebie są dość zbite i wizualnie nie wyglądają dobrze.

![Swift](../../RESOURCE/004_img20.png)

Ponieważ obie znajdują się w tym samym zewnętrznym kontenerze, możemy sterować ogólnym odstępem na poziomie kontenera zewnętrznego:

```swift id="orv65g"
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Efekt końcowy:

![Swift](../../RESOURCE/004_img21.png)

**Odstęp w liście**

Użyj spacing, aby ustawić odstęp między liniami tekstu w sekcji przedstawienia siebie:

```swift id="t0ru3m"
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Ukończenie osobistego CV

Na tym etapie podstawowa struktura naszego osobistego CV jest już gotowa.

![Swift](../../RESOURCE/004_img.png)

### Widok przewijania

Obecnie struktura strony używa VStack. Gdy liczba linii w przedstawieniu jest mała, nie ma problemu, ale jeśli zwiększymy ją do 20, 30 albo jeszcze więcej, wysokość treści przekroczy ekran.

Na przykład:

```swift id="e1qtz1"
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Wtedy pojawią się dwa zjawiska:

* dolna część treści zostanie ucięta
* strona nie będzie mogła się przewijać

To nie jest problem VStack, ponieważ VStack jest tylko kontenerem układu i sam nie zapewnia przewijania.

**Czym jest ScrollView**

ScrollView to kontener z możliwością przewijania, odpowiedni dla dużej ilości treści przekraczającej rozmiar ekranu, na przykład dla pionowych albo poziomych list.

Podstawowa struktura:

```swift id="4obz8u"
ScrollView {
    ...
}
```

Jeśli chcesz uzyskać efekt przewijania, musisz opakować całą zawartość strony w ScrollView:

```swift id="obv84j"
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

W ten sposób cała strona staje się przewijalnym obszarem. Gdy wysokość treści przekroczy ekran, można naturalnie przewijać zawartość.

Domyślnie ScrollView pokazuje wskaźnik paska przewijania. Jeśli chcesz go ukryć, możesz ustawić:

```swift id="jlwmzb"
ScrollView(showsIndicators: false) {
    ...
}
```

## Pełny kod

```swift id="4gdf0q"
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
