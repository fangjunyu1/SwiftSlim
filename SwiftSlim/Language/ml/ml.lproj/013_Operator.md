# ഓപ്പറേറ്ററുകൾ

ഈ പാഠത്തിൽ നാം Swift operators (`Operators`) പഠിക്കും.

നമുക്ക് calculation ചെയ്യുമ്പോഴും, comparison ചെയ്യുമ്പോഴും, logical judgment നടത്തുമ്പോഴും operators ആവശ്യമാണ്. ഈ operations program execution-ന്റെ വിവിധ ഘട്ടങ്ങളിലൊട്ടാകെ വ്യാപിച്ചു കിടക്കുന്നു; programming-ന്റെ ഏറ്റവും അടിസ്ഥാനപരമായ കഴിവുകളിൽ ഒന്നാണിത്.

```swift
let a = 100 * 8
```

Programming പഠിക്കുന്ന പ്രക്രിയയിൽ പലരും കണ്ടെത്തുന്നത്, കുറച്ചെങ്കിലും mathematical thinking ഉള്ളവർക്ക് program logic മനസ്സിലാക്കാൻ പലപ്പോഴും എളുപ്പമാണെന്നാണ്. അതിന്റെ കാരണം programming-ന്റെ അടിസ്ഥാനത്തിൽ “calculation” ഉം “rule checking” ഉം ഉണ്ടെന്നതാണ്; operators അതിന്റെ core role വഹിക്കുന്നു.

യഥാർത്ഥ development-ൽ operators ലളിതമായ number calculations-ിന് മാത്രമല്ല, വിവിധ concrete സാഹചര്യങ്ങളിലും വ്യാപകമായി ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്, block game-ൽ user ഒരു block നിശ്ചിത സ്ഥാനത്തേക്ക് drag ചെയ്യുമ്പോൾ, താഴെപ്പറയുന്ന കാര്യങ്ങൾ calculate ചെയ്യണം:

- block-ന്റെ coordinate സ്ഥാനം
- block fill ചെയ്യാൻ കഴിയുന്ന സ്ഥലം
- target position available ആണോയെന്ന് പരിശോധിക്കൽ

ഇത്തരം “calculation + judgment” പ്രക്രിയകൾ മുഴുവൻ operators അടിസ്ഥാനമാക്കിയതാണ്.

![Block](../../Resource/013_block.png)

Operators പഠിക്കുന്നത് നമ്പർ calculation മാത്രം പഠിക്കുന്നതല്ല; അത് പിന്നീടുള്ള UI layout, data processing, interaction logic എന്നിവയ്ക്ക് അടിത്തറ പാകുകയാണ്.

## SwiftUI-ൽ calculations execute ചെയ്യുന്ന രീതി

SwiftUI-ൽ സാധാരണയായി `Button` ഉപയോഗിച്ച് function trigger ചെയ്ത്, ആ function-ൽ calculation logic execute ചെയ്യുന്നു.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Button click ചെയ്താൽ `Console` output:

```
c: 20
```

ഈ പാഠത്തിൽ നാം calculation logic എല്ലാം ഒരേ പോലെ `func`-ൽ എഴുതും, button ഉപയോഗിച്ച് trigger ചെയ്യും, `print` ഉപയോഗിച്ച് ഫലം output ചെയ്യും.

പിന്നീടുള്ള examples-ൽ code presentation ലളിതമാക്കാൻ calculation result നേരിട്ട് code-ൽ annotate ചെയ്യും; `print` output ആവർത്തിക്കുകയില്ല.

## `Console` output management

ഓരോ click-ലും output information ഉണ്ടാകുന്നതിനാൽ, `Console` area-യുടെ താഴെ വലത് ഭാഗത്തുള്ള clear button click ചെയ്ത് പഴയ logs clear ചെയ്യാം; അങ്ങനെ നിലവിലെ ഫലം കാണാൻ സൗകര്യമാകും.

![Console](../../Resource/013_console.png)

## `Button`-ന്റെ മറ്റൊരു syntax

Button ഒരു function മാത്രം execute ചെയ്യുമ്പോൾ കൂടുതൽ concise syntax ഉപയോഗിക്കാം:

```swift
Button(action: ) {
    // View
}
```

ഈ syntax-ൽ `action`, button click ചെയ്തപ്പോൾ execute ചെയ്യേണ്ട function (parameter ഇല്ലാത്ത function) ആണ്; `{}` button-ന്റെ view നിർവചിക്കാൻ ഉപയോഗിക്കുന്നു.

മുൻപുള്ള `calculate` function-നൊപ്പം ഇത് ഇങ്ങനെ എഴുതാം:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Button click ചെയ്താൽ `calculate` function നേരിട്ട് execute ചെയ്യും.

അതുകൊണ്ട് button logic ലളിതമായിരിക്കുമ്പോഴും ഒരു function call മാത്രമേ ചെയ്യേണ്ടതുണ്ടെങ്കിലും `action` syntax കൂടുതൽ വ്യക്തവും code convention-നോട് കൂടുതൽ പൊരുത്തപ്പെടുന്നതുമാണ്.

## Arithmetic operators

Arithmetic operators (`Arithmetic Operators`) numeric calculations-നായി ഉപയോഗിക്കുന്നു:

- `+` കൂട്ടൽ
- `-` കുറവ്
- `*` ഗുണനം
- `/` bölüm
- `%` remainder

ഉദാഹരണം:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

ശ്രദ്ധിക്കേണ്ടത്, Swift strongly typed language ആണെന്നതിനാൽ വ്യത്യസ്ത data types സ്വയം mix ചെയ്യുകയില്ല:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

രണ്ട് type-ുകളും വ്യത്യസ്തമായാൽ type manual ആയി convert ചെയ്യണം.

## Comparison operators

Comparison operators (`Comparison Operators`) രണ്ട് values തമ്മിലുള്ള ബന്ധം പരിശോധിക്കാൻ ഉപയോഗിക്കുന്നു; ഫലം `Bool` ആയിരിക്കും:

- `==` തുല്യം
- `!=` തുല്യമല്ല
- `>` വലുതാണ്
- `<` ചെറുതാണ്
- `>=` വലുതോ തുല്യമോ
- `<=` ചെറുതോ തുല്യമോ

ഉദാഹരണം:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Comparison operators സാധാരണ conditions-ൽ ഉപയോഗിക്കുന്നു. ഉദാഹരണത്തിന് “quote carousel”ൽ index array range കവിയാതിരിക്കണം:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

`index` `sayings.count - 1`-നേക്കാൾ ചെറുതാണെങ്കിൽ comparison result `true` ആയിരിക്കും; അപ്പോൾ `if` statement-നുള്ളിലെ code execute ചെയ്യും. Result `false` ആണെങ്കിൽ തുടർന്നുള്ള code execute ചെയ്യുകയില്ല.

## Logical operators

Logical operators (`Logical Operators`) ഒന്നിലധികം conditions combine ചെയ്യാൻ ഉപയോഗിക്കുന്നു:

- `&&` ഒപ്പം (`AND`)
- `||` അല്ലെങ്കിൽ (`OR`)
- `!` അല്ല (`NOT`)

### `&&` ഒപ്പം

ഒന്നിലധികം conditions എല്ലാം ഒരുമിച്ച് satisfy ചെയ്യണം എങ്കിൽ `&&` ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

ഈ code-ൽ രണ്ട് conditions ഉണ്ട്: `age >= 18` ഒപ്പം `age <= 100`।

ഈ രണ്ട് conditions-വും `true` ആണെങ്കിൽ മാത്രമേ `legalAge` `true` ആകൂ; ഏതെങ്കിലും ഒന്ന് satisfy ചെയ്യാതിരുന്നാൽ result `false` ആയിരിക്കും.

### `||` അല്ലെങ്കിൽ

ഒന്നിലധികം conditions-ൽ ഏതെങ്കിലും ഒന്ന് മതി എങ്കിൽ `||` ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

ഈ code-ന്റെ അർത്ഥം: `money >= 50` അല്ലെങ്കിൽ `creditCard >= 50` ഇവയിൽ ഏതെങ്കിലും ഒന്ന് ശരിയായാൽ `payAllowed` `true` ആകും.

രണ്ടു conditions-ഉം ശരിയല്ലെങ്കിൽ മാത്രം result `false` ആയിരിക്കും.

ഉദാഹരണത്തിന് payment സാഹചര്യത്തിൽ cash അല്ലെങ്കിൽ credit card ഉപയോഗിച്ച് payment നടത്താം. ഇവ രണ്ടിലും ഒന്നും സാധ്യമല്ലെങ്കിൽ payment fail ചെയ്യും.

### `!` അല്ല

`!` logical NOT operator ആണ്; ഇത് `Bool` value invert ചെയ്യാൻ ഉപയോഗിക്കുന്നു.

ലളിതമായി പറഞ്ഞാൽ `!` `true`-നെ `false` ആക്കും; `false`-നെ `true` ആക്കും.

ഉദാഹരണത്തിന്:

```swift
let allowed = true
let result = !allowed   // false
```

ഇവിടെ `!allowed` എന്നത് `allowed` value invert ചെയ്യുന്നതാണ്.

ശ്രദ്ധിക്കുക: `!` ഉം `!=` ഉം രണ്ട് വ്യത്യസ്ത operators ആണ്. `!` `Bool` value invert ചെയ്യുന്നു; `!=` comparison operator ആണ്, ഇത് `Bool` return ചെയ്യും.

## Assignment operators

Assignment operators (`Assignment Operators`) values assign ചെയ്യാനും variables update ചെയ്യാനും ഉപയോഗിക്കുന്നു:

- `=` assignment

Variable declaration-ലോ calculation process-ലോ assignment operation ഉണ്ടാകും:

```swift
let a = 5
```

ഈ code `5` എന്ന value `a` variable-ലേക്ക് assign ചെയ്യുന്നു.

### Compound assignment operators

യഥാർത്ഥ development-ൽ അടിസ്ഥാന assignment operator പുറമെ “compound assignment operators” ഉപയോഗിക്കുന്നത് പതിവാണ്. ഇവ original value അടിസ്ഥാനമാക്കി നേരിട്ട് calculation നടത്തി update ചെയ്യാൻ സഹായിക്കുന്നു:

- `+=`
- `-=`
- `*=`
- `/=`

മുൻ “counter” പാഠത്തിൽ നാം compound assignment operators കുറച്ച് പഠിച്ചിരുന്നു.

ഉദാഹരണത്തിന് button click ചെയ്തപ്പോൾ variable auto-increase ചെയ്യാൻ:

```swift
var num = 10
num += 5   // num = 15
```

ഈ code `num` ഉം `5` ഉം add ചെയ്ത് ഫലം വീണ്ടും `num`-ലേക്ക് assign ചെയ്യുന്നു.

അതുകൊണ്ട് ഇത് താഴെ പറയുന്നതിന് തുല്യമാണ്:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternary operator

Swift-യിലെ ternary operator (`Ternary Operator`) condition അനുസരിച്ച് രണ്ട് results-ൽ ഒന്നിനെ return ചെയ്യുന്നു:

```swift
നിബന്ധന ? മൂല്യം1 : മൂല്യം2
```

ഇതിന്റെ execution logic: condition `true` ആണെങ്കിൽ “value1” return ചെയ്യും; condition `false` ആണെങ്കിൽ “value2” return ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

ഈ code `showColor`-ന്റെ value പരിശോധിക്കുന്നു: അത് `true` ആണെങ്കിൽ `Color.blue` return ചെയ്യും, background blue ആയി കാണിക്കും; `false` ആണെങ്കിൽ `Color.clear` return ചെയ്യും, background color കാണിക്കില്ല.

സൂചന: `Color.clear` എന്നത് transparent color ആണ് (ഒന്നും കാണിക്കാത്തത്).

### `if-else`-നൊപ്പം താരതമ്യം

Ternary operator logic-ൽ `if-else`-നോട് തുല്യമാണ്.

ഉദാഹരണത്തിന് മുകളിലെ code ഇങ്ങനെ എഴുതാം:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

ഇരുവരുടെയും execution logic ഒന്നുതന്നെയാണ്. Condition `true` ആണെങ്കിൽ ആദ്യ result; `false` ആണെങ്കിൽ രണ്ടാമത്തേത്.

പ്രായോഗികമായി ternary operator syntax കൂടുതൽ concise ആണ്; അതിനാൽ “രണ്ടിൽ ഒന്ന്” തിരഞ്ഞെടുക്കുന്ന ലളിതമായ സാഹചര്യങ്ങളിൽ ഇത് കൂടുതലായി ഉപയോഗിക്കുന്നു. പ്രത്യേകിച്ച് നേരിട്ട് ഒരു value return ചെയ്യേണ്ടപ്പോൾ വളരെ അനുയോജ്യം.

SwiftUI view building-ൽ ternary operator വളരെ സാധാരണമാണ്. ഉദാഹരണത്തിന്:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

ഇത്തരത്തിലുള്ള syntax ഉപയോഗിച്ച് ഒരു line-ൽ തന്നെ condition അനുസരിച്ച് view effect dynamically മാറ്റാം.

## Range operators

Range operators (`Range Operators`) interval കാണിക്കാൻ ഉപയോഗിക്കുന്നു:

- `...` closed range (രണ്ട് അറ്റവും ഉൾപ്പെടുന്നു)
- `..<` half-open range (വലത് അറ്റം ഉൾപ്പെടില്ല)

ഉദാഹരണത്തിന്:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

ലളിതമായി പറഞ്ഞാൽ `1...3` 1 മുതൽ 3 വരെയുള്ള values, 3 ഉൾപ്പെടെ; `5..<8` 5 മുതൽ 8 വരെ, പക്ഷേ 8 ഉൾപ്പെടില്ല.

Extended forms (പരിചയത്തിനായി മാത്രം):

```
5...    // >= 5
...5    // <= 5
```

ഈ syntax “one-sided range” എന്നാണ്; സാധാരണ condition checking അല്ലെങ്കിൽ pattern matching-ൽ ഉപയോഗിക്കുന്നു.

പിന്നീട് `for` loop പഠിക്കുമ്പോൾ range operators ഉപയോഗിക്കും; ഇപ്പോൾ ഇത് ഒരു തുടർച്ചയായ number range ആയി മനസ്സിലാക്കാം.

## Operators അഭ്യസിക്കുക

ഇപ്പോൾ ചില ലളിതമായ examples വഴി operators view-ൽ എങ്ങനെ പ്രവർത്തിക്കുന്നു എന്ന് പരിശീലിക്കാം.

### 1. വാഹനങ്ങളുടെ ആകെ എണ്ണം കണക്കാക്കുക

ഉദാഹരണത്തിന് ഒരു junction വഴി ദിവസവും 500 vehicles സഞ്ചരിക്കുന്നു. 30 ദിവസത്തിൽ എത്ര vehicles സഞ്ചരിക്കും എന്ന് കണക്കാക്കാം.

ഇതിന് calculation operator ഉപയോഗിക്കാം:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

ഇവിടെ calculation process ഇങ്ങനെ: ദിവസവും 500 vehicles, 30 ദിവസത്തെ total = `500 × 30`, അതിന്റെ അവസാന ഫലം `15000`.

### 2. In-app purchase member ആണോ പരിശോധിക്കുക

ഒരു ആളിന് lifetime membership അല്ലെങ്കിൽ subscription membership ഏതെങ്കിലും ഒന്നെങ്കിലും ഉണ്ടെങ്കിൽ, അവനെ in-app purchase member ആയി കണക്കാക്കാം.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

ഈ code-ൽ `||` (`OR`) operator ഉപയോഗിക്കുന്നു: `lifeTime = false` lifetime membership ഇല്ലെന്ന് സൂചിപ്പിക്കുന്നു; `subscription = true` subscription membership ഉണ്ടെന്ന് സൂചിപ്പിക്കുന്നു.

ഇവയിൽ ഏതെങ്കിലും ഒന്ന് മതി എന്നതിനാൽ `isMember` `true` ആകും. അതിനാൽ ഈ വ്യക്തി in-app purchase member ആണ്.

## സംഗ്രഹം

Swift-ൽ operators data calculation-ന്റെയും logical judgment-ന്റെയും അടിസ്ഥാനമാണ്. `Text` content കാണിക്കുന്നതുപോലെ operators data തന്നെയാണു കൈകാര്യം ചെയ്യുന്നത്.

ലളിതമായ number calculations മുതൽ സങ്കീർണ്ണമായ logical judgments വരെ, views-ലുള്ള state control, layout calculations എന്നിവയൊക്കെ operators ഇല്ലാതെ നടക്കില്ല.

വ്യത്യസ്ത സാഹചര്യങ്ങളിലെ അഭ്യാസങ്ങളിലൂടെ ഈ പാഠത്തിൽ പരിചയപ്പെടുത്തിയ വിവിധ operators-നെ ക്രമേണ പരിചയപ്പെടുകയും മനസ്സിലാക്കുകയും ചെയ്യാം. ഇത് പിന്നീടുള്ള പഠനത്തിന് പ്രധാന അടിത്തറയാണ്.

### വിപുലമായ അറിവ് - Bitwise operators

ഇതിന് പുറമെ Swift ഒരു low-level operators വിഭാഗവും നൽകുന്നു — bitwise operators (`Bitwise Operators`):

- `&` (bitwise AND)
- `|` (bitwise OR)
- `^` (bitwise XOR)
- `~` (bitwise NOT)
- `>>` (right shift)
- `<<` (left shift)

ഉദാഹരണത്തിന്:

```swift
let a = 6  // binary 110
let b = 3  // binary 011

print(a & b) // 2 (binary 010)
print(a | b) // 7 (binary 111)
print(a ^ b) // 5 (binary 101)
print(~a)    // -7 (bitwise invert)
```

Swift-ൽ integers binary two's complement രൂപത്തിലാണ് represent ചെയ്യുന്നത്; invert ചെയ്താൽ അനുബന്ധ negative number ലഭിക്കും.

Bitwise operators നേരിട്ട് binary-ൽ പ്രവർത്തിക്കുന്നു; സാധാരണ low-level data processing, performance optimization സാഹചര്യങ്ങളിൽ ആണ് ഉപയോഗിക്കുന്നത്.

തുടക്കക്കാർക്ക് ഈ operators ഉപയോഗിക്കേണ്ട സാഹചര്യം കുറവാണ്; സാധാരണ iOS അല്ലെങ്കിൽ SwiftUI development-ലും ഇവ അപൂർവ്വമാണ്. അതിനാൽ ഇവിടെ വിശദമായി പോകുന്നില്ല.

പിന്നീട് low-level logic അല്ലെങ്കിൽ performance optimization ആവശ്യമായാൽ ഇത് കൂടുതൽ ആഴത്തിൽ പഠിക്കാം.
