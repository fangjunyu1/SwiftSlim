# വേരിയബിളുകളും കോൺസ്റ്റന്റുകളും

ഈ പാഠത്തിൽ Swift-യിലെ variables ഉം constants ഉം പഠിക്കും. കൂടാതെ ചില സാധാരണ data types ഉം അടിസ്ഥാന operators ഉം പരിചയപ്പെടും.

ഇവ programming-യിലെ ഏറ്റവും അടിസ്ഥാനപരമായ അറിവുകളാണ്; തുടർന്ന് SwiftUI പഠിക്കാൻ ഇതൊക്കെ ശക്തമായ അടിത്തറ കൂടിയാണ്.

## ദൈനംദിന ജീവിതത്തിലെ variables ഉം constants ഉം

ജീവിതത്തിലെ ചില വസ്തുക്കൾ നോക്കി variables, constants എന്നിവ മനസിലാക്കാം.

ജീവിതത്തിലെ variables:

- ടെലിവിഷനിലെ ഓരോ പരിപാടിയുടെയും content വ്യത്യസ്തമാണ്
- ദിവസേന weather മാറുന്നു
- clock ഓരോ second-നും മാറുന്നു

ഇവയുടെ പൊതു പ്രത്യേകത: ഇവ മാറിക്കൊണ്ടിരിക്കുന്നു.

ടിവിയിൽ എന്നും ഒരേ ചിത്രം മാത്രം കാണുകയും, weather എന്നും sunny ആയിരിക്കുകയും, clock-ന്റെ സൂചികൾ ഒരിക്കലും നീങ്ങാതിരിക്കുകയുമാണെങ്കിൽ അവ constants ആയിരിക്കും.

ഒന്ന് മാറാനുള്ള സാധ്യതയുള്ളത്, മറ്റൊന്ന് മാറാത്തത്.

## Variables, constants മനസിലാക്കുക

App development-ൽ സാധാരണയായി user ചില വിവരങ്ങൾ fill ചെയ്യുകയോ save ചെയ്യുകയോ വേണം.

ഉദാഹരണത്തിന്:

- account name
- birthday
- contact information
- address

ഈ വിവരങ്ങൾ save ചെയ്ത് പിന്നീട് display ചെയ്യും.

ഉദാഹരണത്തിന്, user app-ൽ ഒരു name നൽകുന്നു:

```
FangJunyu
```

ഈ പേര് save ചെയ്ത് app-ൽ പിന്നീട് display ചെയ്യണം.

ഈ save ചെയ്യൽ പ്രക്രിയയെ ഒരു drawer-ൽ വസ്തു സൂക്ഷിക്കുന്നതുപോലെ കരുതാം.

ഒരു name save ചെയ്യുമ്പോൾ, അത് ഒരു drawer-ൽ വെക്കുന്നതുപോലെയാണ്.

Save ചെയ്യേണ്ട കാര്യങ്ങൾ പലതും ഉണ്ടായിരിക്കും; drawers-ഉം പലതായിരിക്കും. ഓരോ drawer-ലും എന്താണെന്ന് തിരിച്ചറിയാൻ അതിന് ഒരു പേര് വേണം.

ഉദാഹരണത്തിന്:

```
name
```

ഈ ഉദാഹരണത്തിൽ `name` drawer-ന്റെ പേര് ആണ്; `FangJunyu` save ചെയ്തിരിക്കുന്ന വിവരം ആണ്.

![Var](../../RESOURCE/007_var.png)

**Swift-ൽ data save ചെയ്യണമെങ്കിൽ നിർബന്ധമായും variable (`var`) അല്ലെങ്കിൽ constant (`let`) ആയി declare ചെയ്യണം.**

Name സാധാരണയായി മാറാൻ സാധ്യതയുള്ളതിനാൽ നാം variable ഉപയോഗിക്കണം.

```swift
var name = "FangJunyu"
```

ഇവിടെ `name` എന്ന variable declare ചെയ്തിരിക്കുന്നു. അതിന്റെ type `String` ആണ്; value `"FangJunyu"` ആണ്.

### Variables ഉം constants ഉം തമ്മിലുള്ള വ്യത്യാസം

Variable `var` ഉപയോഗിച്ച് declare ചെയ്യും:

```swift
var
```

Constant `let` ഉപയോഗിച്ച് declare ചെയ്യും:

```swift
let
```

ഉദാഹരണത്തിന്:

```swift
var name = "FangJunyu"
let id = 123456
```

Variable ആയി declare ചെയ്താൽ value പിന്നീട് മാറ്റാം; constant ആണെങ്കിൽ മാറ്റാൻ കഴിയില്ല.

അതുകൊണ്ട് variables, constants തമ്മിലുള്ള പ്രധാന വ്യത്യാസം: value മാറാൻ അനുവദിക്കുമോ എന്നതാണ്.

### Constant modify ചെയ്യുക

Code constant-ന്റെ value മാറ്റാൻ ശ്രമിച്ചാൽ:

```swift
let name = "Sam"
name = "Bob"
```

Swift അത് assign ചെയ്യാനാവില്ലെന്ന് അറിയിക്കും, കാരണം അത് constant ആണ്.

```
Cannot assign to property: 'name' is a 'let' constant
```

ഈ സംവിധാനം ചില പ്രധാന data-കൾ അബദ്ധത്തിൽ മാറ്റപ്പെടുന്നത് ഒഴിവാക്കാൻ സഹായിക്കുന്നു.

### SwiftUI-ൽ കാണിക്കൽ

`ContentView.swift` file തുറന്ന് View-ന്റെ ഉള്ളിൽ variable declare ചെയ്യുക:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

ഇവിടെ `name` എന്ന variable declare ചെയ്തിരിക്കുന്നു, അത് `Text` ഉപയോഗിച്ച് UI-യിൽ കാണിക്കുന്നു.

Variable-ന്റെ content മാറ്റിയാൽ:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

`Text` കാണിക്കുന്ന text content-വും അതനുസരിച്ച് മാറും.

ഈ രീതിയിൽ നാം variable ഉപയോഗിച്ച് UI display content നിയന്ത്രിക്കാം; ഓരോ തവണയും `Text`-ലുള്ള string നേരിട്ട് മാറ്റേണ്ടതില്ല.

മറ്റിടങ്ങളിൽ ഈ വിവരങ്ങൾ ആവശ്യമുണ്ടെങ്കിൽ, variable അവിടേക്കു pass ചെയ്യാനും കഴിയും. അതായത് drawer-ലുള്ള content മറ്റൊരിടത്ത് ഉപയോഗിക്കാൻ കൈമാറുന്നതുപോലെയാണ് അത്.

### SwiftUI-ൽ variables, constants എഴുതുന്ന സ്ഥലം

SwiftUI-ൽ variables, constants സാധാരണയായി `body`-ക്ക് പുറത്താണ് എഴുതുന്നത്:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

തീർച്ചയായും `body`-ന്റെ ഉള്ളിലും എഴുതാം:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

എന്നാൽ ഇവയ്ക്ക് ഒരു പ്രധാന വ്യത്യാസമുണ്ട്:

- Variables, constants `body`-ന്റെ ഉള്ളിൽ എഴുതിയാൽ, view ഓരോ തവണ re-calculate ചെയ്യുമ്പോഴും അത് വീണ്ടും create ചെയ്യും
- `body`-യ്ക്ക് പുറത്തു എഴുതിയാൽ, അവ view structure-ന്റെ properties ആയി നിലനിൽക്കും; code structure കൂടുതൽ വ്യക്തമാകും

അതുകൊണ്ട് യഥാർത്ഥ development-ൽ variables, constants `body`-ക്ക് പുറത്തു എഴുതുന്നതാണ് പതിവ്.

## Data types

Variables പലതരം data-കൾ save ചെയ്യാം; ഈ വ്യത്യസ്ത തരങ്ങളെ data types എന്നു വിളിക്കുന്നു.

ഉദാഹരണത്തിന്, മുമ്പ് നാം `Text` ഉപയോഗിച്ച് text കാണിച്ചു:

```swift
Text("Hello, World")
```

ഇവിടെ `"Hello, World"` ഒരു string (`String`) type ആണ്.

String text content സൂചിപ്പിക്കുന്നു; Swift-ൽ ഇത് എല്ലായ്പ്പോഴും double quotes `""` ഉപയോഗിച്ച് എഴുതണം.

ഉദാഹരണത്തിന്:

```swift
var hello = "Hello, World"
```

Strings പുറമെ Swift-ൽ നിരവധി data types ഉണ്ട്.

പഠനത്തിന്റെ ആരംഭഘട്ടത്തിൽ ഏറ്റവും സാധാരണമായ നാല് types:

- `String`
- `Int`
- `Double`
- `Bool`

ഈ നാല് types മിക്ക അടിസ്ഥാന data processing-ഉം കൈകാര്യം ചെയ്യാൻ മതിയാകും.

**String**

`String` text content സൂചിപ്പിക്കുന്നു. ഉദാഹരണത്തിന്:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Strings സാധാരണയായി username, title, text content എന്നിവ സൂചിപ്പിക്കാൻ ഉപയോഗിക്കുന്നു.

**Int**

`Int` integer ആണ്; decimal ഇല്ലാത്ത സംഖ്യകൾ.

ഉദാഹരണത്തിന്:

```swift
var age = 26
var count = 100
```

Integers സാധാരണയായി age, quantity, count പോലുള്ളവ സൂചിപ്പിക്കും.

**Double**

`Double` decimal point ഉള്ള numbers ആണ്.

ഉദാഹരണത്തിന്:

```swift
var weight = 74.5
var height = 185.0
```

Swift-ൽ decimal numbers സാധാരണ default ആയി `Double` ആണ്.

ഇതുപോലെ `Float` എന്ന type ഉം ഉണ്ട്. പക്ഷേ അത് represent ചെയ്യുന്ന value range കുറവാണ്. അതിനാൽ യഥാർത്ഥ development-ൽ `Double` കൂടുതലായി ഉപയോഗിക്കുന്നു.

**Bool**

`Bool` രണ്ട് states സൂചിപ്പിക്കുന്നു: `true` ഒപ്പം `false`.

ഉദാഹരണത്തിന്:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` സാധാരണ condition checking-ലാണ് ഉപയോഗിക്കുന്നത്. ഉദാഹരണത്തിന്, alert കാണിക്കണോ വേണ്ടയോ.

രണ്ട് possible results മാത്രമുള്ള സാഹചര്യങ്ങളിൽ `Bool` വളരെ അനുയോജ്യമാണ്.

### SwiftUI-ൽ കാണിക്കൽ

`String` type കാണിക്കുമ്പോൾ നേരിട്ട് `Text` ഉപയോഗിക്കാം:

```swift
Text(name)
```

പക്ഷേ `Int`, `Double` പോലുള്ള types strings അല്ല. അതിനാൽ അവ നേരിട്ട് text content-ന്റെ ഭാഗമാക്കാനാവില്ല.

ഇവ `Text`-ൽ കാണിക്കണമെങ്കിൽ string interpolation ഉപയോഗിക്കാം:

```swift
\()
```

String interpolation string-ന്റെ ഉള്ളിൽ എഴുതുകയും variable അല്ലെങ്കിൽ constant-നെ `\()` കൊണ്ട് wrap ചെയ്യുകയും വേണം.

ഉദാഹരണത്തിന്:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

മുകളിലുള്ള code-ൽ `""` string സൂചിപ്പിക്കുന്നു; `\()` variables അല്ലെങ്കിൽ constants string-ലേക്ക് insert ചെയ്യാൻ ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
"DoubleNum: \(num * 2)"
```

ഇത് കാണിക്കുന്ന content:

```swift
DoubleNum: 2
```

ഈ രീതിയിൽ variables അല്ലെങ്കിൽ constants strings-ന്റെ ഉള്ളിൽ insert ചെയ്ത് `Text` ഉപയോഗിച്ച് UI-യിൽ കാണിക്കാം.

സൂചന: `\()` string `""`-ന്റെ ഉള്ളിൽ മാത്രമേ ഉപയോഗിക്കാനാകൂ.

## Operators

Variables അല്ലെങ്കിൽ constants declare ചെയ്യുമ്പോൾ താഴെപോലെ ഒരു syntax കാണാം:

```swift
var num = 1
```

ഇവിടെ `=` assignment operator എന്നാണ് പറയുന്നത്.

ഇതിന്റെ ജോലി: വലതു വശത്തിലെ value ഇടതു വശത്തിലെ variable-ലേക്ക് assign ചെയ്യുക.

ഈ ഉദാഹരണത്തിൽ `1`, `num` variable-ലേക്ക് assign ചെയ്യപ്പെടുന്നു.

Assignment operator പുറമെ ചില സാധാരണ numeric operators ഉണ്ട്:

- `+`
- `-`
- `*`
- `/`

`Int`, `Double` പോലുള്ള numeric types-ന് calculations ചെയ്യുമ്പോൾ ഇവ ഉപയോഗിക്കും.

ഉദാഹരണത്തിന്:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Calculation പൂർത്തിയായ ശേഷം ഫലം variable-ൽ save ചെയ്യും.

## സംഗ്രഹം

Variables, constants, operators എന്നിവ programming-ിലെ ഏറ്റവും അടിസ്ഥാനപരമായ ആശയങ്ങളാണ്.

Variables, constants എന്നിവ വഴി program-ൽ വിവിധ data save ചെയ്യാം; data types വഴി data ഏത് തരത്തിലുള്ളതാണെന്ന് വ്യക്തമാക്കാം; operators വഴി data-യിൽ calculations, processing എന്നിവ നടത്താം.

ഈ അറിവുകൾ programming ലോകത്തിലെ basic tools പോലെയാണ്. ഇവ മനസ്സിലാക്കുന്നത് Swift, SwiftUI എന്നിവയുടെ തുടർപഠനത്തിന് ശക്തമായ അടിത്തറ നൽകും.
