# കാഴ്ചകൾ മനസ്സിലാക്കൽ

ഈ പാഠത്തിൽ, നാം ആദ്യം കണ്ട `ContentView`-ലേക്ക് വീണ്ടും മടങ്ങുന്നു.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

നാം ആദ്യമായി SwiftUI കണ്ടപ്പോൾ, `ContentView`-ൽ നമുക്ക് മനസ്സിലാകാത്ത നിരവധി keywords ഉണ്ടായിരുന്നു.

ഉദാഹരണത്തിന് `struct`, `View`, `var`, `body`, `some View` തുടങ്ങിയ keywords.

അന്ന് നമുക്ക് അറിയാമായിരുന്നത് ഇത്രമാത്രമായിരിക്കും: **code `body`-യുടെ ഉള്ളിൽ എഴുതിയാൽ, interface-ൽ content കാണിക്കും.**

ഇപ്പോൾ നാം `struct`, variables, methods, protocols എന്നിവ പഠിച്ചു കഴിഞ്ഞു. അതിനാൽ ഈ code വീണ്ടും മനസ്സിലാക്കി, SwiftUI views തമ്മിലുള്ള ബന്ധം മനസ്സിലാക്കാൻ കഴിയും.

## ContentView വീണ്ടും നോക്കുക

SwiftUI project സൃഷ്ടിച്ചതിന് ശേഷം, Xcode default ആയി ഒരു `ContentView` file സൃഷ്ടിക്കും.

ഉദാഹരണ code ഇങ്ങനെ:

```swift
import SwiftUI

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

ഈ code ചില ഭാഗങ്ങളായി വിഭജിച്ച് മനസ്സിലാക്കാം.

ആദ്യം:

```swift
import SwiftUI
```

ഈ code line SwiftUI framework import ചെയ്യുന്നതിനെ സൂചിപ്പിക്കുന്നു.

SwiftUI import ചെയ്ത ശേഷം മാത്രമാണ് `View`, `Text`, `Image`, `VStack`, `Button` തുടങ്ങിയ SwiftUI views ഉപയോഗിക്കാൻ കഴിയുക.

## ContentView structure

ഈ code line ഒരു structure സൃഷ്ടിക്കുന്നതിനെ സൂചിപ്പിക്കുന്നു:

```swift
struct ContentView: View
```

അതിൽ:

```swift
struct ContentView
```

എന്നത് `ContentView` ഒരു structure ആണെന്ന് സൂചിപ്പിക്കുന്നു.

മുൻ പാഠത്തിൽ നാം `struct` structure പഠിച്ചു. അത് വ്യത്യസ്ത fields ഒന്നിച്ച് കൂട്ടാനാകും, properties, methods എന്നിവയും ഉൾക്കൊള്ളാം.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

ഈ example-ൽ, `ContentView` ഉള്ളിൽ മൂന്ന് കാര്യങ്ങൾ ഉണ്ട്: `name`, `printName`, `body`.

അതായത്, `struct` ബന്ധപ്പെട്ട properties, methods, view content എന്നിവ ഒത്തുചേർത്ത് ക്രമീകരിക്കാം.

![contentView](../../Resource/023_contentVIew.png)

## View ഒരു protocol ആണ്

ഈ code line തുടർന്നും നോക്കാം:

```swift
struct ContentView: View 
```

colon-ന് ശേഷമുള്ള `View` എന്നത്: `ContentView` `View` protocol പിന്തുടരുന്നു എന്നതാണ്.

ഇങ്ങനെ മനസ്സിലാക്കാം: `ContentView` ഒരു SwiftUI view ആകണമെങ്കിൽ, `View` protocol-ന്റെ requirements പാലിക്കണം.

### Identifiable protocol

മുമ്പ് movie list പഠിക്കുമ്പോൾ, നാം `Identifiable` protocol കണ്ടിരുന്നു.

അന്ന് `ForEach`-ൽ `Movie` array traverse ചെയ്യേണ്ടി വന്നു, പക്ഷേ `Movie` structure-ന് unique identifier ഇല്ലായിരുന്നു, അതുകൊണ്ട് `ForEach` traversal support ചെയ്തില്ല.

അപ്പോൾ `Movie` structure `Identifiable` protocol പിന്തുടരുന്ന വിധത്തിൽ മാറ്റണം, അങ്ങനെ `ForEach` ആവശ്യപ്പെടുന്ന unique identifier requirement പാലിക്കും.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol-ന്റെ requirement: **ഈ type-ന് തന്നെയെ തിരിച്ചറിയുന്ന ഒരു `id` field ഉണ്ടായിരിക്കണം.**

`Movie` ഒരു `id` field നൽകുമ്പോൾ, അത് `Identifiable` requirement പാലിക്കും.

ഇങ്ങനെ `ForEach`-ൽ ഉപയോഗിക്കുമ്പോൾ, SwiftUI ഓരോ data item-വും തിരിച്ചറിയാൻ കഴിയും.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol-വും അതുപോലെയാണ്.

ഒരു type SwiftUI view ആകണമെങ്കിൽ, അത് `View` protocol പിന്തുടരണം.

`View` protocol-ന്റെ ഏറ്റവും പ്രധാന requirement ഒരു `body` നൽകുന്നതാണ്.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

ഇങ്ങനെ മനസ്സിലാക്കാം: `View` protocol ആവശ്യപ്പെടുന്നത്: **`body` return ചെയ്യുന്ന SwiftUI view മാത്രം സ്വീകരിക്കും, `ContentView` `body` വഴി SwiftUI view കാണിക്കും.**

### View പിന്തുടരാത്താൽ എന്താകും?

നാം ഇങ്ങനെ എഴുതിയാൽ:

```swift
struct ContentView {
}
```

ഇത് ഒരു സാധാരണ structure മാത്രമാണ്, SwiftUI view അല്ല.

ഇത് നേരിട്ട് error നൽകില്ല, കാരണം സാധാരണ structure തന്നെ valid Swift code ആണ്.

പക്ഷേ അത് preview-ൽ ഇട്ടാൽ:

```swift
#Preview {
    ContentView()
}
```

അപ്പോൾ error ഉണ്ടാകും.

കാരണം: **preview ഒരു SwiftUI view display ചെയ്യണം, എന്നാൽ ഈ `ContentView` `View` protocol പിന്തുടരുന്നില്ല.**

അതുകൊണ്ട് `ContentView` interface-ൽ കാണിക്കണമെങ്കിൽ, അത് `View` protocol പിന്തുടരണം:

```swift
struct ContentView: View {
}
```

അതോടൊപ്പം, `View` protocol requirement പ്രകാരം `body` നൽകണം. `body` ഇല്ലെങ്കിൽ compiler ഇപ്പോഴും error നൽകും.

ശരിയായ എഴുത്ത്:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

അപ്പോൾ `ContentView` യഥാർത്ഥത്തിൽ display ചെയ്യാവുന്ന SwiftUI view ആകുന്നു.

## body view display-ന്റെ entry point ആണ്

SwiftUI-ൽ `body` view content-ന്റെ entry point ആണ്.

```swift
var body: some View {
    Text("Hello, world!")
}
```

ഇത് മൂന്ന് ഭാഗങ്ങളായി വേർതിരിക്കാം:

**1. var body**

```swift
var body
```

ഇത് `body` എന്ന variable define ചെയ്തതായി സൂചിപ്പിക്കുന്നു.

**2. some View**

```swift
: some View
```

ഇത് ഈ `body` ഒരു view return ചെയ്യുമെന്ന് സൂചിപ്പിക്കുന്നു.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

ഇത് display ചെയ്യുന്ന view content ആണ്. ഈ code-ൽ ഒരു `Text` view display ചെയ്യുന്നു.

അതിനർത്ഥം, `body` ഉള്ളിൽ എന്ത് എഴുതിയാലും, interface-ൽ അതാണ് കാണിക്കുന്നത്.

ഉദാഹരണത്തിന്:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

ഈ code സൂചിപ്പിക്കുന്നത്: **interface-ൽ vertically arranged content കാണിക്കുന്നു, അതിനുള്ളിൽ രണ്ട് texts ഉണ്ട്.**

### body എന്ന പേര് ഇഷ്ടമുള്ളപോലെ മാറ്റാനാകില്ല

ശ്രദ്ധിക്കേണ്ടത്, `body` എന്ന പേര് ഇഷ്ടമുള്ളപോലെ മാറ്റാനാകില്ല.

ഇങ്ങനെ എഴുതിയാൽ:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

ഈ `content`-വും ഒരു view property ആണെങ്കിലും, അത് `body`-നെ പകരംവെക്കാനാകില്ല.

കാരണം `View` protocol ആവശ്യപ്പെടുന്ന പേര് കൃത്യമായി `body` തന്നെയാണ്.

## some View എന്നത് എന്ത്?

SwiftUI-ൽ `some View` എന്നത് ഒരു concrete view return ചെയ്യുന്നതിനെ സൂചിപ്പിക്കുന്നു, എന്നാൽ ആ view-ന്റെ മുഴുവൻ type എഴുതേണ്ടതില്ല.

```swift
var body: some View
```

അതാണ്, `some View` type ഇല്ല എന്നല്ല. യഥാർത്ഥ type ഇപ്പോഴും ഉണ്ട്, compiler ആ type അറിയുന്നു, പക്ഷേ ആ type വളരെ complex ആയേക്കാം, അതുകൊണ്ട് Swift `some View` ഉപയോഗിച്ച് അതിനെ hide ചെയ്യാൻ അനുവദിക്കുന്നു.

### some എന്താണ്?

Swift-ൽ `some` opaque type declare ചെയ്യാൻ ഉപയോഗിക്കുന്ന keyword ആണ്.

Opaque type എന്നത്: **return value-ന് ഒരു concrete type ഉണ്ട്, compiler ആ concrete type എന്താണെന്ന് അറിയുന്നു, പക്ഷേ നാം ആ concrete type നേരിട്ട് എഴുതുന്നില്ല.**

ഉദാഹരണത്തിന്:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

ഇത് `makeView` `View` protocol പിന്തുടരുന്ന ഒരു concrete type return ചെയ്യുമെന്ന് സൂചിപ്പിക്കുന്നു.

### some എന്തിന് വേണം?

Variables പഠിക്കുമ്പോൾ നാം മനസ്സിലാക്കിയിട്ടുണ്ട്: **Swift-ൽ values-ന് explicit type annotation വേണം, അല്ലെങ്കിൽ compiler automatic ആയി type infer ചെയ്യണം.**

ഉദാഹരണത്തിന്:

```swift
let a: Int = 10
```

ഇവിടെ constant `a`-യുടെ type `Int` ആണ്.

SwiftUI views-നും ഇതിൽ നിന്ന് വ്യത്യാസമില്ല. `body` ഉപയോഗിച്ച് SwiftUI view display ചെയ്യുമ്പോൾ, `body` ബന്ധപ്പെട്ട SwiftUI type return ചെയ്യണം.

ഉദാഹരണത്തിന്, `body` ഉപയോഗിച്ച് ഒരു `Text` text view display ചെയ്യുകയാണെങ്കിൽ, `body` ബന്ധപ്പെട്ട `Text` type return ചെയ്യണം.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

ഈ example-ൽ, `body` ഉള്ളിൽ display ചെയ്യുന്നത് ഒരു `Text` view ആണ്, return type-വും `Text` തന്നെയാണ്.

അകത്തെ type-വും declared type-വും ഒത്തുചേരുമ്പോൾ മാത്രമേ compiler-ന്റെ type consistency requirement പാലിക്കൂ.

**Type mismatch പ്രശ്നം**

`body`-യുടെ type `Color` ആക്കി, പക്ഷേ display ചെയ്യുന്നത് `Text` ആണെങ്കിൽ:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` type-വും അകത്തെ code type-വും ഒത്തുവരില്ല, അതിനാൽ type mismatch error trigger ചെയ്യും.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

അപ്പോൾ `body`-യുടെ return type കൈകൊണ്ട് മാറ്റണം.

**Complex view types**

യഥാർത്ഥ development-ൽ interface സാധാരണ ഒരു `Text` മാത്രമല്ല.

കൂടുതൽ complex ആയ `VStack` display ചെയ്യേണ്ടതുണ്ടെങ്കിൽ, complex return type കൈകൊണ്ട് annotate ചെയ്യേണ്ടിവരും.

ഉദാഹരണത്തിന്:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

ഈ code ഒരു `VStack` return ചെയ്യുന്നതും, `VStack` ഉള്ളിൽ `Image`, `Text` type views ഉള്ളതുമാണ് സൂചിപ്പിക്കുന്നത്.

`body`-യുടെ return type:

```swift
VStack<TupleView<(Image,Text)>>
```

കാണാം, ഈ return type വളരെ complex ആണ്, കൂടാതെ മുമ്പ് കണ്ടിട്ടില്ലാത്ത `TupleView` കൂടി വന്നു.

ഇവിടെ `TupleView` ഇങ്ങനെ മനസ്സിലാക്കാം: **പല child views-നെ ഒരു view ആയി wrap ചെയ്യുന്നത്.**

**ഇനി കൂടുതൽ complex view types**

View-ന് modifiers ചേർത്താൽ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

അപ്പോൾ ഈ view-ന്റെ return type വളരെ complex ആകും, ഇവിടെ അത് വ്യക്തമാക്കാനാകില്ല.

നിലവിലെ `VStack<TupleView<(Image,Text)>>` return type modifiers വിവരിക്കാൻ കഴിയില്ല, അതിനാൽ error ഉണ്ടാകും.

**some View return type ലളിതമാക്കുന്നു**

ഈ സാഹചര്യത്തിന് SwiftUI ഒരു concise solution നൽകുന്നു, അതായത് `some View` ഉപയോഗിച്ച് എഴുത്ത് ലളിതമാക്കുക.

നാം `body`-നെ `some View` type ആയി മാറ്റുമ്പോൾ:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

ഓരോ തവണ view code മാറ്റുമ്പോഴും, പൂർണ്ണമായ return type വീണ്ടും എഴുതേണ്ടതില്ല.

കാരണം `some View` എന്നത് `View` protocol പിന്തുടരുന്ന ഒരു concrete view return ചെയ്യുന്നതാണ്.

മറ്റൊരു രീതിയിൽ പറഞ്ഞാൽ, `VStack`, `Image` തുടങ്ങിയ SwiftUI views എല്ലാം `View` protocol പിന്തുടരുന്നു. Modifier ചേർത്ത ശേഷം return ചെയ്യുന്ന view type-വും `View` protocol പിന്തുടരുന്നു.

അതിനാൽ അവയെല്ലാം `some View` ആയി return ചെയ്യാം.

### some View ഏതെങ്കിലും view ഇഷ്ടമുള്ളപോലെ return ചെയ്യാനാകില്ല

`some View` complex types hide ചെയ്യാമെങ്കിലും, അത് "type ഇല്ല" എന്നല്ല.

അതിന്റെ core rule: **compiler ഒരു concrete return type determine ചെയ്യാൻ കഴിയണം**.

ഉദാഹരണത്തിന്:

```swift
var title: some View {
    Text("Hello")
}
```

ഇവിടെ return ചെയ്യുന്ന view `Text` ആണ്.

പക്ഷേ രണ്ട് views return ചെയ്യാൻ ശ്രമിച്ചാൽ, error ഉണ്ടാകും:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

കാരണം `some View` ഒടുവിൽ ഒരു view structure return ചെയ്യണം, എന്നാൽ ഇവിടെ രണ്ട് independent views return ചെയ്യാൻ ശ്രമിക്കുന്നു.

### പരിഹാരം

സാധാരണ രണ്ട് solutions ഉണ്ട്: container, `@ViewBuilder`.

**1. container ഉപയോഗിച്ച് wrap ചെയ്യുക**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

ഈ code-ൽ, `title` ഒരു `VStack` return ചെയ്യുന്നു, `Text`, `Image` എന്നിവ `VStack` ഉള്ളിലെ child views ആണ്.

`some View` സ്വീകരിക്കുന്ന view structure ഒരു `VStack<...>` ആണ്, അതിനാൽ `some View` ഒരു view structure return ചെയ്യണമെന്ന requirement പാലിക്കുന്നു. 

ഇതിനാലാണ് SwiftUI പഠിക്കാൻ തുടങ്ങുമ്പോഴേ view code ഏറ്റവും പുറത്തെ layer-ൽ `VStack` container ഉപയോഗിച്ച് wrap ചെയ്യണമെന്ന് നിർദ്ദേശിക്കുന്നത്.

**2. @ViewBuilder ഉപയോഗിക്കുക**

`some View`-ന്റെ മുന്നിൽ `@ViewBuilder` modifier ചേർക്കാനും കഴിയും:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` പല views-നെ ഒരു return result ആയി combine ചെയ്യാം.

അതിന്റെ essence ഇപ്പോഴും പല views-നെ ഒരു view ആയി merge ചെയ്യുന്നതാണ്, അതിലൂടെ `some View`-ന്റെ ഒരു view structure return requirement പാലിക്കുന്നു.

### body-യിൽ പല views നേരിട്ട് എഴുതാനാകുന്നത് എന്തുകൊണ്ട്?

`var body` ഉള്ളിൽ പല views എഴുതിയാൽ, ഉദാഹരണത്തിന്:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

ചില സാഹചര്യങ്ങളിൽ ഇത്തരത്തിലുള്ള `body` error നൽകില്ല.

കാരണം, `View` protocol-ിലുള്ള `body` default ആയി `@ViewBuilder` support ചെയ്യുന്നു:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol-ന്റെ source code-ൽ, `@ViewBuilder` ഇതിനകം `body` variable modify ചെയ്തിരിക്കുന്നതായി കാണാം.

അതുകൊണ്ട് `body` സാധാരണ `some View`-നെക്കാൾ ഒരു extra special handling ഉണ്ട്, അങ്ങനെ SwiftUI പല views-നെ automatic ആയി ഒരു view ആയി combine ചെയ്യുന്നു.

**Container ഉപയോഗിക്കുന്നത് ശുപാർശ ചെയ്യുന്നു**

Beginners-ന് കൂടുതൽ എളുപ്പത്തിൽ മനസ്സിലാക്കാൻ, പല views ക്രമീകരിക്കുമ്പോൾ ആദ്യം `VStack`, `HStack`, `ZStack`, `Group` തുടങ്ങിയ containers ഉപയോഗിക്കാൻ ശുപാർശ ചെയ്യുന്നു.

ഉദാഹരണത്തിന്:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

ഇങ്ങനെ code കൂടുതൽ intuitive ആണ്: **പുറത്തെ layer ഒരു `VStack` ആണ്, അതിനുള്ളിൽ രണ്ട് child views ഉണ്ട്.**

## Views വിഭജിക്കൽ

Interface താരതമ്യേന simple ആണെങ്കിൽ, എല്ലാ code-ഉം `body` ഉള്ളിൽ എഴുതാം.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote-ലേക്ക് സ്വാഗതം")
                Text("സുപ്രഭാതം")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("എന്നെ ക്ലിക്ക് ചെയ്യൂ") {
                print("എന്നെ ക്ലിക്ക് ചെയ്യൂ ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

ഈ view-ന്റെ display style:

![view](../../Resource/023_view1.png)

ഈ code സാധാരണ run ചെയ്യാം, പക്ഷേ view code വളരെ complex ആണെങ്കിൽ, `body` ഉള്ളിലെ code കൂടുതൽ നീളുകയും, വായിക്കാനും modify ചെയ്യാനും ബുദ്ധിമുട്ട് കൂടുകയും ചെയ്യും.

അപ്പോൾ വ്യത്യസ്ത areas independent view properties ആയി വിഭജിക്കാം.

### മുകളിലെ view വിഭജിക്കൽ

ഉദാഹരണത്തിന്, മുകളിലെ area വേർതിരിക്കുക:

```swift
var topHome: some View {
    HStack {
        Text("ഹോം")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ഇവിടെ `topHome` ഒരു variable ആണ്, അത് ഒരു view return ചെയ്യുന്നു.

Return ചെയ്യുന്നത് view ആകയാൽ, type ഇങ്ങനെ എഴുതാം:

```swift
some View
```

ഇത് യഥാർത്ഥത്തിൽ `body` പോലെ തന്നെയാണ് usage:

```swift
var topHome: some View { }
var body: some View { }
```

ഇരുവരും variable ഉപയോഗിച്ച് view display ചെയ്യുന്നു, return type `some View`.

### മറ്റു views വിഭജിക്കൽ

പിന്നീട്, മറ്റു ഭാഗങ്ങളും വിഭജിക്കുക:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote-ലേക്ക് സ്വാഗതം")
        Text("സുപ്രഭാതം")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("എന്നെ ക്ലിക്ക് ചെയ്യൂ") {
        print("എന്നെ ക്ലിക്ക് ചെയ്യൂ")
    }
    .buttonStyle(.borderedProminent)
}
```

വിഭജിച്ച ശേഷം, view variables `body` ഉള്ളിൽ ഇടാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("ഹോം")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote-ലേക്ക് സ്വാഗതം")
            Text("സുപ്രഭാതം")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("എന്നെ ക്ലിക്ക് ചെയ്യൂ") {
            print("എന്നെ ക്ലിക്ക് ചെയ്യൂ")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ഇപ്പോൾ `body` page structure വിവരിക്കുന്നതിൽ മാത്രം responsible:

```swift
topBar
welcomeText
colorList
clickButton
```

ഓരോ ഭാഗത്തിന്റെയും concrete implementation താഴെയുള്ള corresponding property-യിൽ ഇടുന്നു.

ഈ രീതിയിൽ view വിഭജിക്കുന്നത് page structure കൂടുതൽ clear ആക്കുന്നു. ഓരോ view area-ക്കും സ്വന്തം പേര് ഉണ്ടാകുന്നതിനാൽ വായിക്കാൻ കൂടുതൽ intuitive ആകുന്നു.

ഒരു ഭാഗത്തിന്റെ code modify ചെയ്യുമ്പോൾ, complex code-ക്കിടയിൽ തിരയുന്നതിന് പകരം corresponding view area നേരിട്ട് കണ്ടെത്താം.

### some View ഒറ്റ view return ചെയ്യുന്നു

ഈ വിഭജിച്ച view-ൽ, നാം പല views return ചെയ്യാൻ ശ്രമിച്ചാൽ:

```swift
var topBar: some View {
    Text("ഹോം")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` ഒറ്റ view structure മാത്രമേ return ചെയ്യാൻ കഴിയൂ, അതിനാൽ error ഉണ്ടാകും.

`body`-യിൽ നിന്ന് വ്യത്യസ്തമായി, സാധാരണ computed property-ക്ക് default ആയി `@ViewBuilder` ഇല്ല.

അതുകൊണ്ട് പല views return ചെയ്യേണ്ടതുണ്ടെങ്കിൽ, `VStack`, `HStack` അല്ലെങ്കിൽ `Group` container ഉപയോഗിച്ച് പല views ഒറ്റതാക്കാം.

```swift
var topBar: some View {
    VStack {
        Text("ഹോം")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

അല്ലെങ്കിൽ views combine ചെയ്യാൻ `@ViewBuilder` ചേർക്കാം:

```swift
@ViewBuilder
var topBar: some View {
    Text("ഹോം")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

ഇങ്ങനെ നമുക്ക് പല views return ചെയ്യാം.

### if പല views return ചെയ്യുമ്പോൾ

ഉദാഹരണത്തിന്:

```swift
var topHome: some View {
    if step == "ഹോം" {
        HStack {
            Text("ഹോം")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("ഒന്നുമില്ല")
    }
}
```

ഈ code-ൽ, `topHome` `step` content അനുസരിച്ച് `HStack` അല്ലെങ്കിൽ `Text` എന്ന രണ്ട് different type views return ചെയ്യുന്നു.

`some View`-ന് ഒരു determined concrete return type വേണം, അതിനാൽ സാധാരണ computed property-യിലെ `if`-ന്റെ രണ്ട് branches different type views നേരിട്ട് return ചെയ്യാനാകില്ല, അതിനാൽ error ഉണ്ടാകും.

**Solution ഇപ്പോഴും container ഉപയോഗിച്ച് wrap ചെയ്യുക, അല്ലെങ്കിൽ `@ViewBuilder` modifier ഉപയോഗിക്കുക.**

### വിഭജിച്ച view-ന് parentheses ഉപയോഗിക്കാത്തത് എന്തിന്

`body` ഉള്ളിൽ വിഭജിച്ച view properties ഉപയോഗിക്കുമ്പോൾ, നാം നേരിട്ട് ഇങ്ങനെ എഴുതുന്നു:

```swift
topBar
welcomeText
colorList
clickButton
```

ഇങ്ങനെ അല്ല:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

കാരണം `topBar`, `welcomeText`, `colorList`, `clickButton` variables ആണ്. ഈ variables യഥാർത്ഥത്തിൽ computed properties ആണ്, methods അല്ല.

**Properties-ന് parentheses വേണ്ട.**

Method ആയി എഴുതിയാലും, സമാന effect നേടാം:

```swift
func topBar() -> some View {
    HStack {
        Text("ഹോം")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ഈ code-ും സമാന effect നൽകും. ഈ method call ചെയ്താൽ ഒരു view return ചെയ്യും.

ഉപയോഗിക്കുമ്പോൾ ഇങ്ങനെ എഴുതണം:

```swift
topBar()
```

SwiftUI-ൽ, parameter pass ചെയ്യേണ്ടതില്ലാത്ത view മാത്രം വിഭജിക്കുകയാണെങ്കിൽ, computed property രീതി കൂടുതൽ common ആണ്.

```swift
var topBar: some View { ... }
```

## Nested views

Code properties ആയി വിഭജിക്കുന്നതിനു പുറമേ, പുതിയ view structures-വും സൃഷ്ടിക്കാം.

ഉദാഹരണത്തിന്:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

ഈ `PinkColorView`, `ContentView` പോലെ തന്നെയാണ്, ഒരു independent SwiftUI view ആണ്.

അതിനെ `ContentView` ഉള്ളിൽ display ചെയ്യേണ്ടതുണ്ടെങ്കിൽ, view name-ന് ശേഷം `()` ചേർക്കാം.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

ഇവിടെ:

```swift
PinkColorView()
```

എന്നത് ഒരു `PinkColorView` instance സൃഷ്ടിക്കുന്നതാണ്.

`PinkColorView` `View` protocol പിന്തുടരുന്നതിനാൽ, `Text`, `Image`, `Button` പോലെ മറ്റു views ഉള്ളിൽ വെച്ച് display ചെയ്യാം.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

ഇതാണ് view nesting, ഒരു view മറ്റൊരു view ഉള്ളിൽ display ചെയ്യാം.

## View property ആണോ, പുതിയ view സൃഷ്ടിക്കണോ?

View code താരതമ്യേന simple ആണെങ്കിൽ, സാധാരണ code വിഭജിക്കേണ്ടതില്ല. Code complex ആകുമ്പോഴേ view വിഭജിക്കുന്നത് ശുപാർശ ചെയ്യൂ.

### View property ഉപയോഗിക്കുന്ന സാഹചര്യം

ഇത് current view ഉള്ളിലെ ചെറിയ content block മാത്രമാണെങ്കിൽ, view property ഉപയോഗിക്കാം.

ഉദാഹരണത്തിന്:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

ഇവ സാധാരണ current view ഉള്ളിൽ മാത്രമേ ഉപയോഗിക്കൂ.

### പുതിയ view സൃഷ്ടിക്കുന്ന സാഹചര്യം

ഈ content സ്വതന്ത്രമാണെങ്കിൽ, അല്ലെങ്കിൽ പിന്നീട് പല pages-ൽ reuse ചെയ്യാൻ സാധ്യതയുണ്ടെങ്കിൽ, പുതിയ view സൃഷ്ടിക്കുന്നതാണ് കൂടുതൽ suitable.

ഉദാഹരണത്തിന്:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

ഇത് ഒരു title view ആണ്. ഈ view common component ആയി മറ്റു views-ൽ reuse ചെയ്യാൻ ആഗ്രഹിക്കുന്നുവെങ്കിൽ.

പുതിയ view സൃഷ്ടിക്കാം:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

പിന്നീട് മറ്റു സ്ഥലങ്ങളിൽ ഉപയോഗിക്കുക:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

അപ്പോൾ ഈ view reusable independent component ആകുന്നു.

ലളിതമായി ഇങ്ങനെ summarize ചെയ്യാം:

- current view-ന്റെ content area: `var xxx: some View` ഉപയോഗിക്കാം
- reusable independent component: പുതിയ `struct XxxView: View` സൃഷ്ടിക്കാം
- data pass ചെയ്യേണ്ട component: സാധാരണ പുതിയ view സൃഷ്ടിക്കുന്നത് കൂടുതൽ suitable.

## സംഗ്രഹം

ഈ പാഠത്തിൽ, SwiftUI-യിലെ ഏറ്റവും basic ആയിട്ടും ഏറ്റവും important ആയ view structure വീണ്ടും മനസ്സിലാക്കി.

`ContentView` ഒരു structure ആണ്. അത് `struct` ഉപയോഗിച്ച് define ചെയ്യുന്നു, page-related code organize ചെയ്യാൻ ഉപയോഗിക്കുന്നു.

`View` ഒരു protocol ആണ്. ഒരു structure SwiftUI view ആകണമെങ്കിൽ, `View` protocol പിന്തുടരണം.

`body` എന്നത് `View` protocol നമുക്ക് provide ചെയ്യാൻ ആവശ്യപ്പെടുന്ന content ആണ്. ഈ view എന്ത് content display ചെയ്യുമെന്ന് അത് തീരുമാനിക്കുന്നു.

`some View` എന്നത് ഒരു concrete view return ചെയ്യുന്നതാണ്, അതിന്റെ complex full type എഴുതേണ്ടതില്ല.

View code നീളുമ്പോൾ, `var xxx: some View` ഉപയോഗിച്ച് view code പല small areas ആയി വിഭജിക്കാം.

ഒരു content block താരതമ്യേന independent ആണെങ്കിൽ, അല്ലെങ്കിൽ reuse വേണമെങ്കിൽ, പുതിയ view structure സൃഷ്ടിച്ച് മറ്റു views-ൽ `XxxView()` വഴി display ചെയ്യാം.

ലളിതമായി പറഞ്ഞാൽ, SwiftUI interface ഒറ്റൊറ്റ views combine ചെയ്‌താണ് നിർമ്മിക്കുന്നത്. ഒരു page-ൽ പല small views ഉണ്ടായേക്കാം, ഒരു small view-നും വീണ്ടും മറ്റു views contain ചെയ്യാം.
