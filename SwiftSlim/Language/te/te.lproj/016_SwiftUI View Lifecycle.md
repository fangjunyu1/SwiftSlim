# SwiftUI వ్యూ లైఫ్‌సైకిల్

గత పాఠంలో, @State variables view యొక్క lifecycle ను అనుసరిస్తాయని మనం తెలుసుకున్నాం. అలాగే onAppear యొక్క ప్రాథమిక usage ను కూడా నేర్చుకున్నాం.

ఈ పాఠంలో, SwiftUI view lifecycle ను ఇంకా లోతుగా అర్థం చేసుకుంటాము. View ఎలా create అవుతుంది, ఎలా display అవుతుంది, అలాగే view లోని variables ఎలా create అవుతాయి, మళ్లీ ఎలా recreate అవుతాయి అన్నదాన్ని తెలుసుకుంటాము. అదనంగా onAppear, onDisappear మరియు init constructor ను కూడా నేర్చుకుంటాము.

ఈ జ్ఞానాల ఆధారంగా, SwiftUI view మొత్తం నిర్మాణ ప్రక్రియపై ఒక సమగ్ర అవగాహనను ఏర్పరచుకుంటాము.

## యాప్ ప్రారంభ క్రమం

ఒక iOS project ను సృష్టించినప్పుడు, Xcode default గా రెండు files ను రూపొందిస్తుంది:

```text
ContentView.swift
ProjectName + App.swift
```

ఇందులో “ProjectName + App.swift”.swift అనేది మొత్తం app కు entry file.

ఉదాహరణకు:

```swift id="8qfm7j"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Code అమలుక్రమం

మనము App ను run చేసినప్పుడు (simulator లేదా real device లో), system ముందుగా @main keyword ను వెతుకుతుంది:

```swift id="wz2cbe"
@main
struct SwiftSlimTestApp: App {...}
```

Entry file ను గుర్తించిన తర్వాత, code అమలు కావడం మొదలవుతుంది.

ముందుగా App struct లోకి ప్రవేశించి, body లోని code ను అమలు చేస్తుంది. ఆ తర్వాత WindowGroup ను create చేసి, దాని లోని ContentView ను load చేస్తుంది.

### WindowGroup యొక్క పని

WindowGroup అనేది windows ను నిర్వహించడానికి ఉపయోగించబడుతుంది:

```swift id="44d6oa"
WindowGroup {
    ContentView()
}
```

iPad / macOS లో system multiple windows ను support చేస్తుంది, కానీ iPhone లో సాధారణంగా ఒక్క window మాత్రమే ఉంటుంది.

కాబట్టి, iPhone లో WindowGroup ప్రధానంగా మొదటగా display అయ్యే screen ను నిర్వహిస్తుంది.

### View loading process

System ContentView ను గుర్తించిన తరువాత:

```swift id="3f6vxy"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI body లోని code ను అమలు చేస్తుంది. ఆ తర్వాత return అయిన view structure (ఉదాహరణకు VStack, Text మొదలైనవి) ఆధారంగా interface ను నిర్మించి, screen పై display చేస్తుంది.

ఈ దశలు పూర్తయ్యాక, మనం ContentView ను screen పై చూడగలుగుతాము.

![ContentView](../../Resource/016_view1.png)

గమనించాల్సిన విషయం ఏమిటంటే, body యొక్క పని view ను generate చేయడం, కానీ దాన్ని store చేయడం కాదు.

అంటే, ప్రతి సారి view refresh అయినప్పుడు, SwiftUI body ను మళ్లీ calculate చేసి, ఒక కొత్త view structure ను generate చేస్తుంది.

### Preview view logic

Xcode preview (Canvas) మరియు actual running అనేవి రెండు వేర్వేరు mechanisms.

ఉదాహరణకు, entry file లో ఒక debug output జోడిద్దాం:

```swift id="v9q5uq"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode లో ContentView ను preview చేసినప్పుడు, అది @main entry నుండి ప్రారంభం కాదు. అందువల్ల entry file లోని onAppear trigger కాదు.

కానీ simulator లేదా physical device లో run చేస్తే, system @main నుండి ప్రారంభమై, పూర్తి app flow ప్రకారం మొత్తం app ను అమలు చేస్తుంది. అప్పుడు entry లోని onAppear trigger అవుతుంది మరియు debug information output అవుతుంది.

ఇక్కడ ముఖ్యమైన విషయం ఏమిటంటే, Xcode preview అనేది కేవలం “partial rendering”; ఇది ప్రస్తుతం ఉన్న view ను మాత్రమే చూపిస్తుంది. కానీ simulator మరియు physical device “complete runtime environment” ను అందిస్తాయి, కాబట్టి మొత్తం app అమలవుతుంది.

అందువల్ల, app functionality ను test చేసే సమయంలో simulator లేదా physical device ను ఆధారంగా తీసుకోవాలి. Xcode preview పూర్తి runtime environment ను అందించదు.

## View యొక్క lifecycle

ఈ దశలో, మన code అంతా ContentView లోనే ఉంది. కానీ actual applications లో, ఒక App సాధారణంగా అనేక views ను కలిగి ఉంటుంది, మరియు అవి వేర్వేరు సందర్భాల్లో మారుతూ ఉంటాయి.

ఉదాహరణకు, “పిగ్గీ బ్యాంక్” లో:

![PiggyBank](../../Resource/016_view.png)

“Save” ను నొక్కినప్పుడు, SaveView చూపించబడుతుంది; సేవ్ చేయడం పూర్తయిన తర్వాత లేదా close చేసినప్పుడు, SaveView తొలగించబడుతుంది.

ఈ ప్రక్రియే ఒక view యొక్క lifecycle — view create అవుతుంది, display అవుతుంది, చివరికి remove అవుతుంది.

### App ను మూసివేయడం

App close చేసినప్పుడు, అన్ని views remove అవుతాయి, అలాగే సంబంధిత states కూడా మాయమవుతాయి.

కాబట్టి, ContentView మరియు ఇతర views అన్నీ memory నుండి తొలగించబడతాయి. మొత్తం app runtime state కూడా పూర్తిగా clear అవుతుంది.

## View లో variables యొక్క lifecycle

SwiftUI లో, variables యొక్క lifecycle సాధారణంగా view తో బంధించబడి ఉంటుంది.

ఉదాహరణకు:

```swift id="m1qj8x"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State variable

@State తో declare చేసిన variable, view lifecycle కు bind అవుతుంది.

```swift id="f82772"
@State private var name = "FangJunyu"
```

View create అయినప్పుడు, name కూడా create అవుతుంది; view remove అయినప్పుడు, name కూడా destroy అవుతుంది.

అందుకే UserDefaults వంటి methods ను ఉపయోగించి data persistence చేయాలి.

### body లోని variables

body లో define చేసిన variables:

```swift id="fpjlwm"
var num = 10
```

వాటి lifecycle, body execution ప్రక్రియకు bind అయి ఉంటుంది.

SwiftUI state మారినప్పుడు, ఉదాహరణకు:

```swift id="rb63lc"
@State private var name = "FangJunyu"
name = "Hu"
```

name మారినప్పుడు, @State data మారిందని detect చేసి, SwiftUI కు తెలియజేస్తుంది. అప్పుడు SwiftUI view ను మళ్లీ calculate చేస్తుంది, body మళ్లీ recompute అవుతుంది.

body మళ్లీ calculate అయినప్పుడు, body లోని మొత్తం code మళ్లీ execute అవుతుంది. body లోని variables (ఉదాహరణకు num) కూడా మళ్లీ recreate అవుతాయి.

అందుకే, body లో complex variables ను define చేయడం recommend చేయబడదు.

ఎందుకంటే ప్రతి సారి view refresh అయినప్పుడు, body లోని variables మళ్లీ recreate అవుతాయి. ఇది computation cost ను పెంచి, performance పై ప్రభావం చూపుతుంది.

SwiftUI లో, వేర్వేరు data types ను వేర్వేరు పద్ధతుల్లో manage చేయాలి. View lifecycle ను అనుసరించాల్సిన data కోసం @State ను ఉపయోగించవచ్చు; temporary computed data ను body లో ఉంచవచ్చు.

## onAppear మరియు onDisappear

గత పాఠంలో, మనం onAppear గురించి నేర్చుకున్నాం. View కనిపించినప్పుడు onAppear call అవుతుంది.

```swift id="5xnt4c"
.onAppear {}
```

ఉదాహరణకు:

```swift id="gc7k9d"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode preview లేదా run సమయంలో, onAppear లోని debug output ను చూడవచ్చు.

### onDisappear

onAppear కు అనుసంధానమైనది onDisappear:

```swift id="9lujeg"
.onDisappear {}
```

View close అయినప్పుడు, onDisappear call అవుతుంది.

ఉదాహరణకు:

```swift id="n5e7l7"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

View remove అయినప్పుడు, onDisappear లోని code అమలవుతుంది.

సూచన: ప్రస్తుతం మనం ఉపయోగిస్తున్న ContentView అనేది app యొక్క root view. దాన్ని ఈ దశలో నేరుగా close చేయడం లేదా remove చేయడం సాధ్యం కాదు. కాబట్టి, ఈ దశలో onDisappear యొక్క effect ను ప్రత్యక్షంగా చూడలేము.

తరువాత page navigation లేదా కొత్త view ను open చేయడం నేర్చుకున్నప్పుడు, onDisappear call అవడాన్ని చూడగలుగుతాము.

## Create మరియు display logic

గమనించాల్సిన విషయం ఏమిటంటే, view create అవడం మరియు display అవడం రెండు వేర్వేరు దశలు.

View create అయినప్పుడు, struct యొక్క constructor call అవుతుంది:

```swift id="zttwku"
init() {}
```

ఎందుకంటే SwiftUI views అన్నీ struct రూపంలో ఉంటాయి:

```swift id="9dt57l"
struct ContentView: View { ... }
```

అందువల్ల, view instance create అయినప్పుడు init constructor అమలవుతుంది. View నిజంగా display అయిన తర్వాత మాత్రమే onAppear method call అవుతుంది.

ఉదాహరణకు:

```swift id="ql9rj2"
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode లో view ను preview చేసినప్పుడు, ఈ debug output ను చూడవచ్చు:

```swift id="6f1l8d"
Create ContentView
Show ContentView
```

ఇది ఏమి చూపిస్తుంది అంటే, ముందుగా init అమలై view create అవుతుంది, తర్వాత body లోని code calculate అవుతుంది, చివరికి view display అయి onAppear అమలవుతుంది.

అందువల్ల, view యొక్క create దశ మరియు display దశ వేర్వేరని అర్థం చేసుకోవాలి.

### init constructor

init అనేది Swift యొక్క ప్రాథమిక syntax. దీన్ని struct మరియు class రెండింటిలోనూ define చేయవచ్చు, object ను initialize చేయడానికి ఉపయోగిస్తారు.

```swift id="0hd2ao"
init() {}
```

SwiftUI లో, view create అయినప్పుడు system view యొక్క init method ను call చేస్తుంది. దీన్ని parameters receive చేయడానికి, data initialize చేయడానికి ఉపయోగించవచ్చు.

మనం init ను manually రాయకపోతే, Swift struct కోసం ఒక default constructor ను ఆటోమేటిక్‌గా generate చేస్తుంది.

ContentView వంటి SwiftUI views లో, view create అయినప్పుడు init అమలవుతుంది; view display అయినప్పుడు onAppear అమలవుతుంది.

అందువల్ల, init అనేది view create అయినప్పుడు execute అయ్యే constructor. తరువాత parameters pass చేయడం లేదా data initialize చేయడంలో దీన్ని ఉపయోగిస్తాము.

## సారాంశం

ఈ పాఠంలో, entry file నుండి ContentView file వరకు app startup sequence మరియు execution flow ను నేర్చుకున్నాము.

SwiftUI view lifecycle ను అర్థం చేసుకున్నాము: view create అయినప్పుడు init అమలవుతుంది, అది screen పై display అయినప్పుడు onAppear అమలవుతుంది, మరియు view remove లేదా close అయినప్పుడు onDisappear అమలవుతుంది.

అలాగే view update mechanism ను కూడా నేర్చుకున్నాము: views state ద్వారా నడపబడతాయి. @State వంటి states మారినప్పుడు, SwiftUI view ను refresh చేస్తుంది, body ను మళ్లీ calculate చేస్తుంది, body లోని variables కూడా మళ్లీ recreate అవుతాయి.

Variables యొక్క lifecycle view lifecycle కు bind అవుతుంది. body లోని temporary variables ప్రతి refresh సమయంలో మళ్లీ create అవుతాయి.

ఈ lifecycles మరియు variables యొక్క behavior ను అర్థం చేసుకోవడం వల్ల, మనం code ను మరింత బాగా నిర్వహించగలుగుతాము, తద్వారా app logic ఇంకా స్పష్టంగా ఉంటుంది.
