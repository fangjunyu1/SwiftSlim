# జంతు విజ్ఞాన సర్వస్వం 

ఈ పాఠంలో, మనం కస్టమ్ View మరియు డేటా పంపిణీని కొనసాగించి అభ్యసిస్తాము.

మనము ఒక సరళమైన జంతు విజ్ఞాన సర్వస్వం View తయారు చేయబోతున్నాం. పేజీలో ఐదు జంతువులు కనిపిస్తాయి. ఏదైనా జంతువుపై నొక్కినప్పుడు, ఒక వివరాల View పాప్ అప్ అవుతుంది. అందులో ఆ జంతువు చిత్రం, విస్తరణ ప్రాంతం, నివాస స్థలం మరియు వివరణ కనిపిస్తాయి.

అమలు చేసిన ఫలితం:

![view](../../../Resource/029_view.png)

ఈ ఉదాహరణ ద్వారా, మనం డేటా నిర్మాణం, జాబితా ప్రదర్శన, క్లిక్ పరస్పర చర్య మరియు Sheet పాప్ అప్ View మధ్య సమన్వయాన్ని అభ్యసించవచ్చు.

## చిత్ర వనరులు సిద్ధం చేయడం

ముందుగా, మనం ఐదు జంతు చిత్రాలను సిద్ధం చేయాలి:

- డాల్ఫిన్: `dolphin.jpg`
- జిరాఫీ: `giraffe.jpg`
- సింహం: `lion.jpg`
- పాండా: `panda.jpg`
- ధ్రువ ఎలుగుబంటి: `polarBear.jpg`

క్రింద ఉన్న ఈ చిత్ర వనరులను ఉపయోగించవచ్చు:

[డాల్ఫిన్](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [జిరాఫీ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [సింహం](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [పాండా](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ధ్రువ ఎలుగుబంటి](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

చిత్రాలను డౌన్‌లోడ్ చేసిన తరువాత, వాటిని Xcode ప్రాజెక్ట్‌లోని `Assets` వనరుల ఫోల్డర్‌లోకి లాగి వదలండి.

![assets](../../../Resource/029_assets.png)

గమనించవలసిన విషయం ఏమిటంటే, కోడ్‌లో చిత్రాన్ని ఉపయోగించినప్పుడు సాధారణంగా `.jpg` suffix రాయాల్సిన అవసరం లేదు.

ఉదాహరణకు, చిత్ర వనరుల పేరు `dolphin` అయితే, కోడ్‌లో ఇలా రాయాలి:

```swift
Image("dolphin")
```

చిత్రం పేరు తప్పుగా రాస్తే, చిత్రం సరిగా కనిపించదు.

గమనిక: పై చిత్ర వనరులు Wikimedia ప్రాజెక్టుల నుండి వచ్చాయి. ఉపయోగించే సమయంలో అసలు చిత్ర లింక్ మరియు మూల సమాచారాన్ని ఉంచడం మంచిది.

## జంతు నిర్మాణం సృష్టించడం

ఈ పేజీలో, ప్రతి జంతువుకు అనేక సమాచార అంశాలు ఉంటాయి:

- జంతువు పేరు
- జంతువు చిత్రం
- జంతువు ఎమోజీ
- విస్తరణ ప్రాంతం
- నివాస స్థలం
- జంతువు వివరణ

ఈ సమాచారాన్ని అనేక variables గా విడిగా ఉంచితే, కోడ్ కొద్దిగా గందరగోళంగా మారుతుంది. కాబట్టి, మనం ఒక `Animal` structure సృష్టించి, ఒక జంతువు సమాచారాన్ని ఒకే చోట ఉంచవచ్చు.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

ఈ కోడ్‌లో:

- `id`: జంతువు యొక్క ప్రత్యేక గుర్తింపు.
- `name`: జంతువు పేరు.
- `imageName`: జంతువు చిత్రం పేరు.
- `avatarEmoji`: జంతువు ఎమోజీ.
- `distributionArea`: విస్తరణ ప్రాంతం.
- `habitat`: నివాస స్థలం.
- `animalDescription`: జంతువు వివరణ.

ఇందులో:

```swift
let id = UUID()
```

`id` ప్రతి జంతువును గుర్తించడానికి ఉపయోగించబడుతుంది. తరువాత మనం `ForEach` ఉపయోగించి జంతు జాబితాను చూపిస్తాము. అలాగే `.sheet(item:)` ఉపయోగించి ఎంచుకున్న జంతువు ఆధారంగా వివరాల View ని పాప్ అప్ చేస్తాము. అందుకే `Animal` ను `Identifiable` protocol కు అనుగుణంగా చేయాలి.

`Identifiable` పాత్ర ఏమిటంటే SwiftUI కి ఇలా చెప్పడం: ప్రతి జంతువుకూ దాని గుర్తింపును వేరు చేయగల ఒక `id` ఉంది.

## జంతు డేటా సృష్టించడం

తర్వాత, మనం `ContentView` లో ఒక జంతు array సృష్టిస్తాము.

ఈ array లో ఐదు `Animal` లు ఉంటాయి. ప్రతి `Animal` ఒక జంతువును సూచిస్తుంది.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // డాల్ఫిన్
        Animal(
            name: "డాల్ఫిన్",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ప్రపంచవ్యాప్తంగా ఉన్న వెచ్చని మరియు మితమైన మహాసముద్రాలు.",
            habitat: "మహాసముద్రాలు, తీర జలాలు మరియు కొన్ని పెద్ద నదులు.",
            animalDescription: "డాల్ఫిన్లు తెలివైన సముద్ర స్తన్యధారులు. అవి గుంపులుగా జీవిస్తాయి, శబ్దాల ద్వారా సంభాషిస్తాయి, మరియు వాటి ఆటపాటల ప్రవర్తనకు ప్రసిద్ధి చెందాయి."
        ),
        // జిరాఫీ
        Animal(
            name: "జిరాఫీ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ఆఫ్రికాలోని సవానాలు మరియు తెరచిన అడవి ప్రాంతాలు.",
            habitat: "పచ్చిక మైదానాలు, సవానాలు మరియు తెరచిన అడవులు.",
            animalDescription: "జిరాఫీలు భూమిపై అత్యంత పొడవైన జంతువులు. వాటికి పొడవైన మెడలు, పొడవైన కాళ్లు ఉంటాయి, మరియు సాధారణంగా ఎత్తైన చెట్ల ఆకులను తింటాయి."
        ),
        // సింహం
        Animal(
            name: "సింహం",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ప్రధానంగా ఉప-సహారా ఆఫ్రికాలో కనిపిస్తుంది, పశ్చిమ భారతదేశంలో చిన్న జనాభా ఉంది.",
            habitat: "పచ్చిక మైదానాలు, సవానాలు మరియు తెరచిన అడవి ప్రాంతాలు.",
            animalDescription: "సింహాలు శక్తివంతమైన పెద్ద పిల్లి జాతి జంతువులు. అవి సాధారణంగా prides అని పిలువబడే గుంపులుగా జీవిస్తాయి, మరియు జంతు ప్రపంచపు రాజులుగా తరచుగా గుర్తించబడతాయి."
        ),
        // పాండా
        Animal(
            name: "పాండా",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "చైనా మధ్య ప్రాంతంలోని పర్వత అడవులు.",
            habitat: "చల్లని మరియు తడి పర్వత ప్రాంతాల్లోని వెదురు అడవులు.",
            animalDescription: "పాండాలు నలుపు-తెలుపు రోమాల వల్ల ప్రసిద్ధి చెందిన ఎలుగుబంట్లు. అవి ప్రధానంగా వెదురును తింటాయి, మరియు ప్రపంచంలో అత్యంత సులభంగా గుర్తించగల జంతువులలో ఒకటి."
        ),
        // ధ్రువ ఎలుగుబంటి
        Animal(
            name: "ధ్రువ ఎలుగుబంటి",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ఉత్తర ధ్రువం చుట్టూ ఉన్న ఆర్క్టిక్ ప్రాంతాలు.",
            habitat: "సముద్ర మంచు, తీర ప్రాంతాలు మరియు చల్లని ఆర్క్టిక్ వాతావరణాలు.",
            animalDescription: "ధ్రువ ఎలుగుబంట్లు చల్లని వాతావరణాలకు సరిపోయేలా అభివృద్ధి చెందిన పెద్ద ఎలుగుబంట్లు. అవి బలమైన ఈతగాళ్లు, మరియు seals వేటాడటానికి ప్రధానంగా సముద్ర మంచుపై ఆధారపడతాయి."
        )
    ]

    var body: some View {
        Text("జంతు విజ్ఞాన సర్వస్వం")
    }
}
```

ఇక్కడి `animals` ఒక array:

```swift
let animals: [Animal]
```

`[Animal]` అంటే ఈ array లో అనేక `Animal` లు నిల్వ చేయబడుతున్నాయి.

అంటే, `animals` ఒక జంతువు కాదు, జంతువుల సమూహం.

## జంతు జాబితా చూపించడం

ఇప్పుడు, మనం `ForEach` ఉపయోగించి జంతు జాబితాను చూపించవచ్చు.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

ప్రదర్శన ఫలితం:

![view](../../../Resource/029_view1.png)

ఈ కోడ్‌లో:

```swift
ForEach(animals) { animal in
    ...
}
```

`animals` array ను traverse చేయడం అని అర్థం.

ప్రతి loop సమయంలో, `animal` ప్రస్తుతం చూపిస్తున్న ఆ జంతువును సూచిస్తుంది.

ఉదాహరణకు, మొదటి loop సమయంలో `animal` డాల్ఫిన్; రెండవ loop సమయంలో `animal` జిరాఫీ.

అందువల్ల, క్రింద ఉన్న విధంగా ప్రస్తుత జంతువు సమాచారాన్ని చూపించవచ్చు:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

ఇలా చేస్తే ఐదు జంతువులను చూపించవచ్చు.

## జంతు జాబితాను క్లిక్ చేయగలిగేలా చేయడం

ఇప్పుడు జాబితా కనిపిస్తోంది, కానీ ఇంకా క్లిక్ చేయలేము.

ఒక జంతువుపై నొక్కిన తరువాత వివరాలు పాప్ అప్ కావాలని అనుకుంటే, ముందుగా “ప్రస్తుతం ఎంచుకున్న జంతువు” ను record చేయాలి.

కాబట్టి, `ContentView` లో ఒక state variable జోడించండి:

```swift
@State private var selectedAnimal: Animal? = nil
```

ఇక్కడి `selectedAnimal` ఒక optional value type `Animal?`.

ఇది ఒక జంతువు ఉండవచ్చు, లేక జంతువు లేకపోవచ్చు అని సూచిస్తుంది.

డిఫాల్ట్ value `nil`, అంటే ప్రారంభంలో ఏ జంతువూ ఎంచుకోలేదు.

తర్వాత, ప్రతి జంతు row ను `Button` గా మార్చుతాము:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

ముఖ్యమైనది ఈ కోడ్ line:

```swift
selectedAnimal = animal
```

వినియోగదారు ఏదైనా జంతువుపై నొక్కినప్పుడు, మనం ఆ జంతువును `selectedAnimal` లో నిల్వ చేస్తాము.

ఉదాహరణకు, వినియోగదారు డాల్ఫిన్ పై నొక్కితే, `selectedAnimal` లో నిల్వ అయ్యేది డాల్ఫిన్.

వినియోగదారు పాండా పై నొక్కితే, `selectedAnimal` లో నిల్వ అయ్యేది పాండా.

అంటే, `selectedAnimal` వినియోగదారు ప్రస్తుతం ఏ జంతువుపై నొక్కారో record చేయడానికి ఉపయోగించబడుతుంది.

## Sheet పాప్ అప్ View

ఇప్పుడు మనం button ద్వారా “ప్రస్తుతం నొక్కిన జంతువు” ను record చేయగలుగుతున్నాం.

తర్వాత, జంతువు వివరాలను చూపించడానికి ఒక పాప్ అప్ View అమలు చేయాలి.

![view](../../../Resource/029_view2.png)

SwiftUI లో, ఈ పాప్ అప్ ప్రభావాన్ని `Sheet` ద్వారా అమలు చేయవచ్చు.

`Sheet` ను తాత్కాలికంగా పాప్ అప్ అయ్యే పేజీగా అర్థం చేసుకోవచ్చు. ఇది ప్రస్తుత పేజీపై కనిపిస్తుంది. వినియోగదారు కంటెంట్ చూసిన తరువాత, కిందికి స్వైప్ చేసి మూసేయవచ్చు.

## Sheet ఉదాహరణ

జంతు వివరాలను నిజంగా చూపించడానికి ముందు, `Sheet` ఎలా పాప్ అప్ అవుతుందో ఒక సరళమైన ఉదాహరణతో ముందుగా అర్థం చేసుకుందాం.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet చూపించు")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet View")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ప్రదర్శన ఫలితం:

![view](../../../Resource/029_view3.png)

ఈ కోడ్‌లో, మనం ఒక Boolean value సృష్టించాము:

```swift
@State private var showSheet = false
```

`showSheet` డిఫాల్ట్‌గా `false`, అంటే మొదట `Sheet` చూపించబడదు.

button పై నొక్కినప్పుడు:

```swift
showSheet.toggle()
```

`toggle()` అంటే Boolean value ను మార్చడం.

ముందు `false` అయితే, `toggle()` పిలిచిన తరువాత అది `true` అవుతుంది.

ముందు `true` అయితే, `toggle()` పిలిచిన తరువాత అది `false` అవుతుంది.

కాబట్టి, button నొక్కిన తరువాత `showSheet` `false` నుండి `true` గా మారుతుంది.

`showSheet` `true` గా మారినప్పుడు, క్రింద ఉన్న కోడ్ `Sheet` ను పాప్ అప్ చేస్తుంది:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ఈ కోడ్ అర్థం: `showSheet` `true` అయినప్పుడు, ఒక `Sheet` పాప్ అప్ చేయాలి, మరియు `Sheet` లో `Text("Sheet View")` చూపించాలి.

ప్రదర్శన ఫలితం:

![view](../../../Resource/029_view4.png)

ఈ విధానం fixed content పాప్ అప్ చేయడానికి అనుకూలంగా ఉంటుంది.

ఉదాహరణకు, button నొక్కిన తరువాత settings page, explanation page, prompt page మొదలైనవి పాప్ అప్ చేయవచ్చు.

### Sheet చూపించే స్థానం

`Sheet` ఒక పాప్ అప్ View అయినప్పటికీ, SwiftUI లో అది `Text()`, `Image()` లా నేరుగా ఒక independent View గా రాయబడదు. దాన్ని ఒక view modifier గా ఉపయోగిస్తారు.

అంటే, `.sheet(...)` మరియు `.font()`, `.padding()`, `.shadow()` వంటి modifiers ఒకే విధంగా ఉంటాయి. అవి ఏదో ఒక View తర్వాత జోడించాలి.

ఉదాహరణకు:

```swift
Button("Sheet చూపించు") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ఈ ఉదాహరణలో, `.sheet` `Button` తర్వాత జోడించబడింది.

`showSheet` `true` గా మారినప్పుడు, SwiftUI `Sheet` ను పాప్ అప్ చేసి, curly braces లోని కంటెంట్ ను చూపిస్తుంది:

```swift
Text("Sheet View")
```

అయితే, వాస్తవ development లో, ఒక పేజీలో అనేక buttons ఉంటే, సాధారణంగా ప్రతి button కి ఒక `.sheet` జోడించరు.

మరింత సాధారణమైన విధానం: `.sheet` ను బయట ఉన్న View తర్వాత జోడించడం.

ఉదాహరణకు:

```swift
VStack {
    Button("Sheet చూపించు") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

button `showSheet` ను మార్చడానికి బాధ్యత వహిస్తుంది. బయట ఉన్న View `showSheet` `true` అయ్యిందా లేదా ఆధారంగా `Sheet` ను పాప్ అప్ చేయడానికి బాధ్యత వహిస్తుంది.

## Optional value binding Sheet

ముందు మనం నేర్చుకున్న విధానం:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ఈ విధానం ఒక fixed page ను show/hide చేయడానికి అనుకూలంగా ఉంటుంది.

కానీ జంతు విజ్ఞాన సర్వస్వం ఉదాహరణలో, మనం “`Sheet` పాప్ అప్ అవుతుందా” అన్నదే కాదు, “ఏ జంతువుపై నొక్కారు” అన్నదీ తెలుసుకోవాలి.

ఉదాహరణకు:

వినియోగదారు డాల్ఫిన్ పై నొక్కితే, `Sheet` లో డాల్ఫిన్ వివరాలు కనిపించాలి.

వినియోగదారు పాండా పై నొక్కితే, `Sheet` లో పాండా వివరాలు కనిపించాలి.

కాబట్టి, ఇక్కడ మరొక Sheet రాయడం విధానం మరింత అనుకూలం:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet లో చూపించాల్సిన కంటెంట్
}
```

ఈ కోడ్‌లో, `Sheet` ఒక optional value `selectedAnimal` తో bind చేయబడింది.

ఇక్కడ గమనించాలి: `item:` తర్వాత `$selectedAnimal` రాయాలి, `selectedAnimal` కాదు.

ఎందుకంటే `Sheet` కేవలం `selectedAnimal` value ను చదవడం మాత్రమే కాదు; దాని మార్పు ఆధారంగా పాప్ అప్ కావాలా వద్దా అనేది నిర్ణయించాలి.

ఈ కోడ్ ను ఇలా అర్థం చేసుకోవచ్చు:

- `selectedAnimal` `nil` అయితే, `Sheet` చూపించదు.
- `selectedAnimal` కు value ఉంటే, `Sheet` చూపిస్తుంది.
- `Sheet` మూసినప్పుడు, SwiftUI `selectedAnimal` ను మళ్లీ `nil` గా మారుస్తుంది.

SwiftUI, `selectedAnimal` లో నిల్వ చేసిన జంతువును curly braces లోని `animal` కు పంపిస్తుంది.

అంటే, `.sheet(item:)` కేవలం పాప్ అప్ ను control చేయడం మాత్రమే కాదు; ఎంచుకున్న data ను `Sheet` లోకి కూడా పంపిస్తుంది.

## Sheet ఉపయోగించి జంతు పేరు చూపించడం

ఇప్పుడు, క్లిష్టమైన details View ను వెంటనే సృష్టించకుండా ఉండుదాం.

కోడ్ మరింత సులభంగా అర్థం కావడానికి, ముందుగా `Sheet` లో ప్రస్తుత జంతువు పేరును మాత్రమే చూపిద్దాం.

`VStack` బయట `.sheet(item:)` జోడించండి:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

ఇక్కడ అత్యంత ముఖ్యమైనది ఈ కోడ్:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal` కు value ఉన్నప్పుడు, `Sheet` పాప్ అప్ అవుతుంది.

curly braces లోని `animal` ప్రస్తుతం ఎంచుకున్న జంతువే.

కాబట్టి:

```swift
Text(animal.name)
```

ప్రస్తుతంగా నొక్కిన జంతువు పేరును చూపిస్తుంది.

ఉదాహరణకు, `డాల్ఫిన్` పై నొక్కితే, Sheet లో `డాల్ఫిన్` కనిపిస్తుంది.

`పాండా` పై నొక్కితే, `Sheet` లో `పాండా` కనిపిస్తుంది.

ఇలా, భిన్నమైన జంతువులపై నొక్కినప్పుడు భిన్నమైన జంతు పేర్లు పాప్ అప్ అయ్యే ప్రభావాన్ని మనం పూర్తి చేసాము.

జంతు పేరు చూపించడం:

![view](../../../Resource/029_view5.png)

అయితే, జంతు వివరాలు కేవలం ఒక పేరును మాత్రమే చూపించకూడదు. పేరు, విస్తరణ ప్రాంతం, నివాస స్థలం మరియు వివరణను కూడా చూపించాలి.

ఈ కోడ్ మొత్తాన్ని `.sheet` లోనే రాస్తే, కోడ్ చాలా పొడవుగా మారి చదవడానికి అసౌకర్యంగా ఉంటుంది.

కాబట్టి, తర్వాత మనం ఒక కొత్త custom View సృష్టిస్తాము. అది ప్రత్యేకంగా జంతు వివరాలను చూపించడానికి బాధ్యత వహిస్తుంది.

## జంతు వివరాల View సృష్టించడం

తర్వాత, మనం `AnimalDetailView` అనే కొత్త custom View సృష్టిస్తాము.

ఈ View ఒక `Animal` ను స్వీకరిస్తుంది, మరియు జంతు వివరాలను చూపిస్తుంది.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**విస్తరణ ప్రాంతం** ：\(animal.distributionArea)")

                    Divider()

                    Text("**నివాస స్థలం** ：\(animal.habitat)")

                    Divider()

                    Text("**జంతు వివరణ** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ప్రదర్శన ఫలితం:

![view](../../../Resource/029_view2.png)

ఇక్కడి ప్రధాన విషయం:

```swift
var animal: Animal
```

ఇది `AnimalDetailView` బయట నుంచి ఒక జంతువును స్వీకరించాలి అని సూచిస్తుంది.

జంతువును స్వీకరించిన తరువాత, details View ఆ జంతువు యొక్క వివిధ సమాచారాన్ని ఉపయోగించవచ్చు:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

అంటే, `AnimalDetailView` లోకి పంపిన జంతువును చూపించడానికే బాధ్యత వహిస్తుంది.

### Markdown bold text

details View లో, మనం ఇలాంటి కోడ్ రాశాము:

```swift
Text("**నివాస స్థలం:** \(animal.habitat)")
```

ఇక్కడ రెండు జ్ఞానాంశాలు ఉన్నాయి.

మొదటిది, `**నివాస స్థలం:**` `Markdown` syntax ఉపయోగించింది. రెండు asterisks తో చుట్టిన text bold గా కనిపిస్తుంది.

రెండవది, `\()` string interpolation. ఇది variable value ను text లో చూపించగలదు.

ఈ కోడ్ అర్థం: ముందుగా bold గా `నివాస స్థలం:` చూపిస్తుంది, తరువాత ఈ జంతువు నివాస స్థలాన్ని చూపిస్తుంది.

## Sheet లో details View చూపించడం

`AnimalDetailView` సృష్టించిన తరువాత, మనం తిరిగి `ContentView` కు వెళ్లి, `Sheet` లో ఉన్న అసలు name View ను details View తో భర్తీ చేయవచ్చు.

ముందు ఇలా ఉంది:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ఇప్పుడు ఇలా మార్చండి:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ఇక్కడి `animal:` అనేది `AnimalDetailView` parameter name.

తర్వాతి `animal` అనేది `.sheet(item:)` ద్వారా పంపబడిన ప్రస్తుత జంతువు.

అంటే, ప్రస్తుతం నొక్కిన జంతువును `AnimalDetailView` కు పంపించి చూపించడం.

పూర్తి నిర్మాణం:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

వినియోగదారు జంతువుపై నొక్కినప్పుడు:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` నుండి ఒక నిర్దిష్ట జంతువుగా మారుతుంది. `Sheet` `selectedAnimal` కు value ఉందని గుర్తించిన తరువాత View ను పాప్ అప్ చేస్తుంది.

`Sheet`, `selectedAnimal` లోని జంతువును `AnimalDetailView` View కు పంపిస్తుంది. `AnimalDetailView` జంతు వివరాలను చూపిస్తుంది.

ఇలా, మనం జంతు జాబితాపై నొక్కి, సంబంధిత జంతు వివరాలు పాప్ అప్ అయ్యే ఫంక్షన్ పూర్తి చేసాము.

## Sheet రెండు రాయడం విధానాల మధ్య తేడా

ఇప్పుడు, మనం `.sheet(item:)` ఉపయోగించి జంతు details View ప్రదర్శనను పూర్తి చేసాము.

ఇక్కడ `Sheet` యొక్క రెండు సాధారణ రాయడం విధానాలను సులభంగా summarize చేయవచ్చు.

### మొదటి విధానం Boolean value తో bind చేయడం

```swift
@State private var showSheet = false

Button("Sheet చూపించు") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ఈ విధానం fixed content పాప్ అప్ చేయడానికి అనుకూలం. ఉదాహరణకు settings page, explanation page, prompt page మొదలైనవి.

`showSheet` ఒక Boolean value. దీనికి `true` మరియు `false` అనే రెండు states మాత్రమే ఉంటాయి.

`showSheet` `true` అయినప్పుడు, `Sheet` కనిపిస్తుంది.

`showSheet` `false` అయినప్పుడు, `Sheet` కనిపించదు.

### రెండవ విధానం optional value తో bind చేయడం

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ఈ విధానం ఎంచుకున్న data ఆధారంగా భిన్నమైన content పాప్ అప్ చేయడానికి అనుకూలం.

ఈ పాఠంలో, మనం భిన్నమైన జంతువులపై నొక్కినప్పుడు భిన్నమైన జంతు వివరాలను చూపించాలి. కాబట్టి `.sheet(item:)` ఉపయోగించడం మరింత సరైనది.

## పూర్తి కోడ్

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // జంతువు పేరు
    let name: String
    
    // జంతువు చిత్రం
    let imageName: String
    
    // జంతువు ఎమోజీ
    let avatarEmoji: String
    
    // విస్తరణ ప్రాంతం
    let distributionArea: String
    
    // నివాస స్థలం
    let habitat: String
    
    // జంతువు వివరణ
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // డాల్ఫిన్
        Animal(
            name: "డాల్ఫిన్",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ప్రపంచవ్యాప్తంగా ఉన్న వెచ్చని మరియు మితమైన మహాసముద్రాలు.",
            habitat: "మహాసముద్రాలు, తీర జలాలు మరియు కొన్ని పెద్ద నదులు.",
            animalDescription: "డాల్ఫిన్లు తెలివైన సముద్ర స్తన్యధారులు. అవి గుంపులుగా జీవిస్తాయి, శబ్దాల ద్వారా సంభాషిస్తాయి, మరియు వాటి ఆటపాటల ప్రవర్తనకు ప్రసిద్ధి చెందాయి."
        ),
        // జిరాఫీ
        Animal(
            name: "జిరాఫీ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ఆఫ్రికాలోని సవానాలు మరియు తెరచిన అడవి ప్రాంతాలు.",
            habitat: "పచ్చిక మైదానాలు, సవానాలు మరియు తెరచిన అడవులు.",
            animalDescription: "జిరాఫీలు భూమిపై అత్యంత పొడవైన జంతువులు. వాటికి పొడవైన మెడలు, పొడవైన కాళ్లు ఉంటాయి, మరియు సాధారణంగా ఎత్తైన చెట్ల ఆకులను తింటాయి."
        ),
        // సింహం
        Animal(
            name: "సింహం",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ప్రధానంగా ఉప-సహారా ఆఫ్రికాలో కనిపిస్తుంది, పశ్చిమ భారతదేశంలో చిన్న జనాభా ఉంది.",
            habitat: "పచ్చిక మైదానాలు, సవానాలు మరియు తెరచిన అడవి ప్రాంతాలు.",
            animalDescription: "సింహాలు శక్తివంతమైన పెద్ద పిల్లి జాతి జంతువులు. అవి సాధారణంగా prides అని పిలువబడే గుంపులుగా జీవిస్తాయి, మరియు జంతు ప్రపంచపు రాజులుగా తరచుగా గుర్తించబడతాయి."
        ),
        // పాండా
        Animal(
            name: "పాండా",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "చైనా మధ్య ప్రాంతంలోని పర్వత అడవులు.",
            habitat: "చల్లని మరియు తడి పర్వత ప్రాంతాల్లోని వెదురు అడవులు.",
            animalDescription: "పాండాలు నలుపు-తెలుపు రోమాల వల్ల ప్రసిద్ధి చెందిన ఎలుగుబంట్లు. అవి ప్రధానంగా వెదురును తింటాయి, మరియు ప్రపంచంలో అత్యంత సులభంగా గుర్తించగల జంతువులలో ఒకటి."
        ),
        // ధ్రువ ఎలుగుబంటి
        Animal(
            name: "ధ్రువ ఎలుగుబంటి",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ఉత్తర ధ్రువం చుట్టూ ఉన్న ఆర్క్టిక్ ప్రాంతాలు.",
            habitat: "సముద్ర మంచు, తీర ప్రాంతాలు మరియు చల్లని ఆర్క్టిక్ వాతావరణాలు.",
            animalDescription: "ధ్రువ ఎలుగుబంట్లు చల్లని వాతావరణాలకు సరిపోయేలా అభివృద్ధి చెందిన పెద్ద ఎలుగుబంట్లు. అవి బలమైన ఈతగాళ్లు, మరియు seals వేటాడటానికి ప్రధానంగా సముద్ర మంచుపై ఆధారపడతాయి."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**విస్తరణ ప్రాంతం** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**నివాస స్థలం** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**జంతు వివరణ** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## సారాంశం

ఈ పాఠంలో ఒక సరళమైన జంతు విజ్ఞాన సర్వస్వం పేజీ పూర్తి చేసాము.

ముందుగా `Animal` structure తో జంతు సమాచారాన్ని నిల్వ చేసాము. తర్వాత array తో ఐదు జంతువులను నిల్వ చేసి, `ForEach` ఉపయోగించి జంతు జాబితాను చూపించాము.

వినియోగదారు ఏదైనా జంతువుపై నొక్కినప్పుడు, మనం ఆ జంతువును `selectedAnimal` లో నిల్వ చేస్తాము:

```swift
selectedAnimal = animal
```

`selectedAnimal` కు value ఉన్నప్పుడు, `.sheet(item:)` details View ను పాప్ అప్ చేసి, ఎంచుకున్న జంతువును `AnimalDetailView` కు పంపిస్తుంది.

ఈ పాఠంలోని అత్యంత ముఖ్యమైనది interface style కాదు, ఈ data passing route ను అర్థం చేసుకోవడం:

```swift
జంతువుపై నొక్కడం → selectedAnimal జంతువును నిల్వ చేస్తుంది → Sheet పాప్ అప్ అవుతుంది → AnimalDetailView వివరాలను చూపిస్తుంది
```

ఈ route అర్థమైతే, భవిష్యత్తులో మరిన్ని ఇలాంటి functions తయారు చేయవచ్చు. ఉదాహరణకు product details, course details, article details, contact details మొదలైనవి.
