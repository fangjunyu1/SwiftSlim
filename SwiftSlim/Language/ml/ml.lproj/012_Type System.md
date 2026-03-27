# ടൈപ്പ് സിസ്റ്റം

മുൻ പാഠങ്ങളിൽ നാം variables പഠിച്ചു കഴിഞ്ഞു; variable-കൾക്ക് വ്യത്യസ്ത തരത്തിലുള്ള data save ചെയ്യാമെന്ന് അറിയുകയും ചെയ്തു.

ഉദാഹരണത്തിന്:

```swift
var hello = "Hello, World"
```

ഇവിടെ `hello` ഒരു text segment save ചെയ്യുന്നു, അതിനാൽ അതിന്റെ type `String` ആണ്.

അടുത്തതായി type (`Type`) എന്ന ആശയം, explicit type declaration, type inference എന്നിവ ക്രമബദ്ധമായി പഠിക്കാം. അതിലൂടെ variable-ന്റെ അടിസ്ഥാന സ്വഭാവം കൂടുതൽ ആഴത്തിൽ മനസ്സിലാക്കാം.

## Type എന്താണ്

Swift-ൽ ഓരോ value-ക്കും വ്യക്തമായ ഒരു type ഉണ്ട്. ആ value എന്താണ്, അതുകൊണ്ട് എന്ത് ചെയ്യാം എന്നിവ type തീരുമാനിക്കുന്നു.

ഉദാഹരണത്തിന്:

- `42` ഒരു `Int` ആണ് (integer)
- `"Hello"` ഒരു `String` ആണ്
- `true` ഒരു `Bool` ആണ്

ഇവ വ്യത്യസ്ത type-കളിലാണ്; ഉപയോഗവുമെല്ലാം വ്യത്യസ്തമാണ്.

## Swift-ിലെ സാധാരണ അടിസ്ഥാന types

പഠനത്തിന്റെ തുടക്കത്തിൽ ഏറ്റവും സാധാരണമായി കാണുന്ന types:

- `String`: string (text)
- `Int`: integer
- `Double`: floating-point number (decimal ഉള്ളത്, കൂടുതൽ precision)
- `Bool`: boolean (`true/false`)

ഇതിനു പുറമെ `Float` (floating-point number) എന്ന type ഉണ്ട്, പക്ഷേ അതിന്റെ precision `Double`-നേക്കാൾ കുറവാണ്; അതിനാൽ സാധാരണ കുറച്ച് മാത്രമേ ഉപയോഗിക്കാറുള്ളൂ. `Character` (single character) എന്ന type-ും ഉണ്ട്, ഉദാഹരണത്തിന് `"A"`, `"!"` പോലുള്ള single characters.

### Type declaration (explicit type)

Swift-ൽ variable declare ചെയ്യുമ്പോൾ type manual ആയി specify ചെയ്യാം:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Variable name-ന് ശേഷം `: Type` ചേർത്താണ് variable-ന്റെ type declare ചെയ്യുന്നത്.

Array-യുടെ type എഴുതുന്ന രീതി `: [Type]` ആണ്:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

ഈ code-ൽ `scores` array-ക്ക് `Int` type elements മാത്രം save ചെയ്യാം; `tags`-ന് `String` type elements മാത്രം.

Explicit type declaration code-ന്റെ ഉദ്ദേശ്യം കൂടുതൽ വ്യക്തമാക്കുകയും, ചില സാഹചര്യങ്ങളിൽ type inference errors ഒഴിവാക്കുകയും ചെയ്യും.

## Type inference

പല സാഹചര്യങ്ങളിലും type explicit ആയി declare ചെയ്യേണ്ടതില്ല:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

ഇത് Swift compiler `"initial value"`-ന്റെ അടിസ്ഥാനത്തിൽ type സ്വയം infer ചെയ്യുന്നതിനാലാണ്.

## Explicit declarationയും type inferenceഉം

മുൻ പാഠങ്ങളിൽ explicit declaration നാം പ്രത്യേകം പരിചയപ്പെടുത്തിയിരുന്നില്ല, ഉദാഹരണത്തിന്:

```swift
var age: Int = 18
```

പകരം ആദ്യം type inference-നെയാണ് മുൻഗണന നൽകിയത്:

```swift
var age = 18
```

ഈ ഉദാഹരണത്തിൽ, ഈ രണ്ട് രീതികളും തുല്യമാണ്; `age` ഇരുവിധത്തിലും `Int` type ആകും. താരതമ്യപ്പെടുത്തുമ്പോൾ type inference കൂടുതൽ concise ആണ്.

ആരംഭഘട്ടത്തിൽ explicit type declaration-നെ അധികമായി stress ചെയ്യാത്തതിന്റെ കാരണം, type inference code-ലെ അധിക വിവരങ്ങൾ കുറയ്ക്കുന്നു; അതിനാൽ തുടക്കത്തിൽ മനസ്സിലാക്കാനുള്ള ഭാരം കുറഞ്ഞിരിക്കും.

## Types എന്തുകൊണ്ട് ആവശ്യമാണ്

Swift ഒരു strongly typed language ആണ് (`Strongly Typed Language`).

അതായത്: ഒരു variable-ന്റെ type ഒരിക്കൽ തീരുമാനിച്ചാൽ, അത് ഇഷ്ടാനുസരണം മാറ്റാനാവില്ല.

ഉദാഹരണത്തിന്:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

ആദ്യത്തെ `20` `Int` type ആണെന്നതിനാൽ `age`-ലേക്ക് assign ചെയ്യാം; രണ്ടാമത്തെ `"20"` `String` ആണ്, `Int`-നൊപ്പം type ഒത്തുപോകാത്തതിനാൽ error വരും.

`nums` എന്നത് `[Int]` type array ആണ്; അതിനാൽ integers മാത്രം save ചെയ്യാം, strings mix ചെയ്യാൻ പറ്റില്ല.

Type-കൾ data ഉപയോഗം നിയന്ത്രിക്കുന്നു. Compile stage-ലുതന്നെ type mismatch കണ്ടെത്തി type confusion മൂലമുള്ള bugs കുറയ്ക്കുകയും, code-ന്റെ stability, maintainability വർദ്ധിപ്പിക്കുകയും ചെയ്യും.

## Explicit type എപ്പോഴാണ് നിർബന്ധം

Swift type സ്വയം infer ചെയ്യാമെങ്കിലും, ചില സാഹചര്യങ്ങളിൽ compiler-ക്ക് അത് കണ്ടെത്താൻ കഴിയില്ല, അല്ലെങ്കിൽ തെറ്റായി infer ചെയ്യാം. അപ്പോൾ manual declaration വേണം.

**1. Empty array**

ഒരു empty array സൃഷ്ടിക്കുമ്പോൾ type explicit ആയി declare ചെയ്യണം:

```swift
var nums: [Int] = []
```

Type എഴുതാതെ:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler-ന് empty array-ൽ നിന്ന് element type infer ചെയ്യാൻ കഴിയില്ല; അതിനാൽ compile error വരും.

**2. Infer ചെയ്യുന്ന type തെറ്റുന്നത് ഒഴിവാക്കുക**

```swift
var value = 10   // Int
```

ഈ ഉദാഹരണത്തിൽ, `10` ഒരു floating-point number (`Double`) ആയി കാണിക്കാനാകുമെങ്കിലും decimal point ഇല്ലാത്തതിനാൽ compiler അതിനെ default ആയി `Int` ആക്കുന്നു.

`value` floating-point number ആയിരിക്കണമെന്ന് ആഗ്രഹിക്കുന്നുവെങ്കിൽ type explicit ആയി declare ചെയ്യണം:

```swift
var value: Double = 10   // Double
```

Type inference result പ്രതീക്ഷിച്ചതുപോലെ അല്ലെങ്കിൽ, explicit declaration അല്ലെങ്കിൽ literal form മാറ്റൽ വഴി type ശരിയാക്കണം.

**3. Custom types**

പിന്നീട് നാം custom types-ും പഠിക്കും. അവ ഉപയോഗിക്കുമ്പോൾ സാധാരണ explicit declaration ആവശ്യമാണ്:

```swift
var info: GameInfo
var users: [User] = []
```

ഇതിന് empty array-യോടുള്ളതുപോലെ തന്നെയാണ് കാരണം: compiler-ന് empty value-ൽ നിന്ന് type infer ചെയ്യാൻ കഴിയില്ല.

## Type conversion

Swift-ൽ വ്യത്യസ്ത type-ുകൾക്കിടയിൽ automatic conversion ഉണ്ടാകില്ല; manual conversion നിർബന്ധമാണ്.

ഉദാഹരണത്തിന്, രണ്ട് വ്യത്യസ്ത type-കളിലുള്ള numbers കൂട്ടുക:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

ഈ code-ൽ `a` `Int` ആണ്, `b` `Double` ആണ്. Type വ്യത്യാസമുള്ളതിനാൽ നേരിട്ട് operation ചെയ്യാൻ പറ്റില്ല.

Operation ചെയ്യുന്നതിന് മുമ്പ്, അതിൽ ഒന്നിനെ same type-ലേക്ക് convert ചെയ്യണം:

```swift
var result = Double(a) + b
```

ഈ code `Int` type ആയ `a`-യെ `Double` ആക്കി മാറ്റി, പിന്നെ `b`-യുമായി add ചെയ്യുന്നു; ഫലം `result`-ലേക്ക് assign ചെയ്യുന്നു.

ശ്രദ്ധിക്കുക: type conversion original variable-ന്റെ type മാറ്റുകയില്ല. ഉദാഹരണത്തിന് `Double(a)` `a`-യുടെ `Int` type മാറ്റുന്നില്ല; പകരം calculation-ക്കായി ഒരു പുതിയ `Double` value സൃഷ്ടിക്കുന്നു.

മറ്റു type-കളും സമാനമായി convert ചെയ്യാം. Target type + `()` എന്ന രീതിയിൽ convert ചെയ്യേണ്ട value pass ചെയ്യാം. ഉദാഹരണത്തിന്:

```
Int()、Double()、String()
```

ഉദാഹരണം:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

ശ്രദ്ധിക്കുക: എല്ലാ type conversions-നും വിജയിക്കണമെന്നില്ല. ഉദാഹരണത്തിന് `Double → Int` ചെയ്യുമ്പോൾ decimal ഭാഗം truncation ചെയ്യും; round ചെയ്യില്ല.

## Type alias

Swift-ൽ നിലവിലുള്ള type-ന് ഒരു alias name കൊടുക്കാം; അതിലൂടെ code-ന്റെ semantic അർത്ഥം കൂടുതൽ വ്യക്തമാക്കാം:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

ഇവിടെ `UserID` യാഥാർത്ഥ്യത്തിൽ ഇപ്പോഴും `Int` തന്നെയാണ്; type മാറ്റമൊന്നുമില്ല, പക്ഷേ name കൂടുതൽ meaningful ആകുന്നു.

വലിയ codebase ഉള്ള, type complexity കൂടുതലുള്ള projects-ൽ type alias code വായിക്കാൻ കൂടുതൽ സൗകര്യപ്രദമാക്കും.

## Type example

ഇപ്പോൾ ഒരു ലളിതമായ example വഴി types യഥാർത്ഥ development-ൽ എങ്ങനെ പ്രവർത്തിക്കുന്നു എന്ന് നോക്കാം.

### Variable സൃഷ്ടിക്കുക

ആദ്യം ഒരു `age` variable സൃഷ്ടിക്കാം:

```swift
var age = 20
```

ഇത് SwiftUI-ൽ കാണിക്കുകയും modify ചെയ്യുകയും വേണമെന്നതിനാൽ `@State` ഉപയോഗിച്ച് declare ചെയ്യണം:

```swift
@State private var age = 20
```

`private` മുമ്പ് പറഞ്ഞതുപോലെ ഈ variable നിലവിലെ view-ൽ മാത്രമേ ഉപയോഗിക്കാനാകൂ എന്നർത്ഥം. പിന്നീട് ഇത് കൂടുതൽ വിശദമായി പഠിക്കും.

### SwiftUI-ൽ data കാണിക്കുക

SwiftUI-ൽ `age` variable കാണിക്കുക:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

ഇപ്പോൾ view കാണിക്കുന്നത്:

```swift
age: 20
```

### Data modify ചെയ്യുക

അടുത്തതായി `age` modify ചെയ്യാൻ രണ്ട് buttons ചേർക്കാം:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Running result

`changeAge1` click ചെയ്താൽ `age`-യ്ക്ക് `18` assign ചെയ്യും:

```swift
age = 18
```

`18` `Int` type ആണെന്നും `age`-ന്റെ type-നൊപ്പം match ചെയ്യുന്നതുകൊണ്ടും assign ചെയ്യാം.

`changeAge2` error ഉണ്ടാക്കും:

```swift
age = "18"
```

Error message:

```
Cannot assign value of type 'String' to type 'Int'
```

ഇതിന് കാരണം `"18"` `String` type ആണ് (`""` ഉപയോഗിച്ച് strings എഴുതണം), പക്ഷേ `age` `Int` ആണ്. Type mismatch ഉണ്ടാകുന്നതിനാൽ assign ചെയ്യാൻ കഴിയില്ല.

### എന്തുകൊണ്ട് error വരുന്നു?

പ്രധാനമായും കാരണമാകുന്നത് ഈ line ആണ്:

```swift
@State private var age = 20   // Int
```

Explicit type declaration ഇല്ലെങ്കിലും, initial value `20` `Int` ആയതിനാൽ compiler `age`-നെ സ്വയം `Int` ആയി infer ചെയ്യും.

Type ഒരിക്കൽ നിശ്ചയിച്ചാൽ പിന്നീട് മറ്റൊരു type assign ചെയ്യാനാവില്ല.

അതിലുപരി, `changeAge2` button-ന്റെ error “runtime failure” ആയി വരുന്നതല്ല; compile stage-ലുതന്നെ വരുന്നു. അതിനാൽ code compile ആകുകയില്ല.

ഇതും Swift strongly typed language ആണെന്നതിന്റെ ഒരു ഗുണമാണ്: code എഴുതുന്ന സമയത്തുതന്നെ type പ്രശ്നങ്ങൾ കണ്ടെത്താം.

### ശരിയായ രീതി

Error code നീക്കം ചെയ്താൽ:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` button click ചെയ്താൽ view update ആയി:

```
age: 18
```

### Explicit type declaration (ഐച്ഛികം)

Definition സമയത്ത് type വ്യക്തമായി specify ചെയ്യാനും കഴിയും:

```swift
@State private var age: Int = 20
```

ഈ syntax type കൂടുതൽ വ്യക്തതയോടെ കാണിക്കും; പക്ഷേ ലളിതമായ സാഹചര്യങ്ങളിൽ ഇത് നിർബന്ധമല്ല.

## സംഗ്രഹം

ഈ പാഠത്തിൽ പ്രധാനമായും Swift-ന്റെ type systemയും അതിന്റെ യഥാർത്ഥ development-ലുള്ള പ്രവർത്തനവുമാണ് പഠിച്ചത്.

Swift-ൽ ഓരോ value-ക്കും ഒരു വ്യക്തമായ type ഉണ്ട്; type data-യുടെ അർത്ഥവും അത് പങ്കെടുക്കാവുന്ന operations-ഉം നിർണ്ണയിക്കുന്നു.

Swift strongly typed ആയതിനാൽ, variable-ന്റെ type ഒരിക്കൽ നിശ്ചയിച്ചാൽ അത് മറ്റൊരു type-ലേക്ക് മാറ്റാനാവില്ല. ഈ നിയന്ത്രണം compile stage-ലുതന്നെ errors കണ്ടെത്താൻ സഹായിക്കുന്നു; runtime പ്രശ്നങ്ങൾ കുറയുകയും code safety മെച്ചപ്പെടുകയും ചെയ്യും.

Variable-ന്റെ type initial value-ൽ നിന്ന് സ്വയം infer ചെയ്യാം; അല്ലെങ്കിൽ explicit ആയി declare ചെയ്യാം. ചില സാഹചര്യങ്ങളിൽ (ഉദാ: empty arrays, inference തെറ്റുന്ന സാഹചര്യങ്ങൾ, custom types) compiler type ശരിയായി infer ചെയ്യില്ല; അപ്പോൾ explicit declaration നിർബന്ധമാണ്.

വ്യത്യസ്ത type-ുകൾ തമ്മിൽ automatic conversion ഉണ്ടാകില്ല; `Int()`, `Double()`, `String()` പോലുള്ള മാർഗങ്ങൾ ഉപയോഗിച്ച് explicit conversion ചെയ്യണം.

Type-കൾക്ക് alias-ുകളും നൽകാം. പ്രത്യേകിച്ച് complex projects-ൽ type alias code readability മെച്ചപ്പെടുത്താൻ സഹായിക്കും.

Type എന്നത് data label മാത്രമല്ല; അതൊരു constraint mechanism കൂടിയാണ്. അതിലൂടെ data-യുടെ ഉപയോഗം സുരക്ഷിതവും വ്യക്തമുള്ളതും നിയന്ത്രിക്കാവുന്നതുമായിരിക്കും.

## വിപുലമായ അറിവ് - Optional types

Type conversion ചെയ്യുമ്പോൾ ചില operations പരാജയപ്പെടാൻ സാധ്യതയുണ്ട്.

ഉദാഹരണത്തിന് `String`-നെ `Double`-ലേക്ക് മാറ്റുക:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

ഇവിടെ `Double(input)` `Double` അല്ല, മറിച്ച്:

```
Double?
```

ഇതുതന്നെയാണ് Optional type (`Optional`).

### എന്തുകൊണ്ട് Optional type return ചെയ്യുന്നു?

കാരണം string-ന്റെ content മുൻകൂട്ടി ഉറപ്പില്ല. `"3.14"` `Double` ആക്കാം, `"Hello"` `Double` ആക്കാൻ കഴിയില്ല.

അത് എന്നു പറഞ്ഞാൽ ഈ operation വിജയിക്കാം, പരാജയപ്പെടാം.

അതുകൊണ്ടാണ് Swift ഈ uncertainty കാണിക്കാൻ Optional type ഉപയോഗിക്കുന്നത്.

### Optional type എന്താണ്?

Optional type എന്നത്: ഒരു value ഉണ്ടാകാനും ഇല്ലാതിരിക്കാനും സാധ്യതയുള്ളതാണ്.

ഉദാഹരണത്തിന്:

```
Double?
```

ഈ type-ന്റെ അർത്ഥം: value ഉണ്ടെങ്കിൽ print ചെയ്യുമ്പോൾ `Optional(...)` എന്ന രൂപത്തിൽ കാണിക്കും; value ഇല്ലെങ്കിൽ `nil` return ചെയ്യും.

ശ്രദ്ധിക്കുക: `nil` എന്നത് “value ഇല്ല” എന്നർത്ഥം, `0` അല്ലെങ്കിൽ empty string എന്നല്ല.

### ഉദാഹരണം

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

ഇതിന്റെ അർത്ഥം string വിജയകരമായി `Double` ആയി മാറി `3.14` ലഭിച്ചു; പക്ഷേ type `Double?` ആയതിനാൽ അത് `Optional`-ൽ wrap ചെയ്തിരിക്കുന്നു.

Conversion പരാജയപ്പെട്ടാൽ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

കാരണം `"Hello"` `Double` type-ലേക്ക് convert ചെയ്യാനാവില്ല; അതിനാൽ conversion fail ചെയ്തു `nil` return ചെയ്യുന്നു.

### `Optional(...)` എന്നത് എന്താണ്?

നാം Optional type നേരിട്ട് print ചെയ്യുമ്പോൾ:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift അതിന്റെ “debug description” ആണ് കാണിക്കുന്നത്:

```
Optional(3.14)
```

ഇത് യഥാർത്ഥ data-യുടെ ഭാഗമല്ല; നിലവിലെ value ഒരു “optional type” ആണെന്നും അതിന്റെ ഉള്ളിൽ ഒരു value ഉണ്ടെന്നും കാണിക്കുന്ന ഒരു സൂചന മാത്രമാണ്.

### Optional type unwrap ചെയ്യുക

യഥാർത്ഥ development-ൽ Optional-ന്റെ ഉള്ളിൽ ഉള്ള actual value പുറത്തെടുക്കേണ്ട സാഹചര്യം സാധാരണമാണ്. ഈ process-നെയാണ് unwrapping എന്ന് പറയുന്നത്.

ഒരു സാധാരണ മാർഗം `??` ഉപയോഗിച്ച് default value നൽകുന്നതാണ്:

```
??
```

ഇത് Nil-Coalescing Operator എന്നറിയപ്പെടുന്നു.

ഉദാഹരണത്തിന്:

```swift
name ?? "FangJunyu"
```

ഈ code-ന്റെ അർത്ഥം: `name`-ന് value ഉണ്ടെങ്കിൽ അതേ value return ചെയ്യുക; അത് `nil` ആണെങ്കിൽ default value `"FangJunyu"` ഉപയോഗിക്കുക.

ശ്രദ്ധിക്കേണ്ടത്: default value-യുടെ type, optional-ിന്റെ inner type-നൊപ്പം ഒത്തിരിക്കണം.

### `??` ഉപയോഗിച്ച് default value നൽകുക

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

`input` `Double`-ലേക്ക് convert ചെയ്യുമ്പോൾ conversion വിജയിക്കുകയും value output ചെയ്യുകയും ചെയ്യും. Conversion പരാജയപ്പെട്ടാൽ `??` നൽകിയ default value output ചെയ്യും.

Conversion പരാജയപ്പെട്ടാൽ:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

ഇവിടെ `input` `Double` type-ലേക്ക് convert ചെയ്യുമ്പോൾ conversion fail ചെയ്തു `nil` return ചെയ്യുന്നു; `??` `nil`-ന് default value നൽകുന്നു.

Optional type “value ഉണ്ടാകാം, ഇല്ലാതിരിക്കാം” എന്ന സാഹചര്യത്തെ പ്രതിനിധീകരിക്കാൻ ഉപയോഗിക്കുന്നു.

Type conversion പോലുള്ള fail ചെയ്യാൻ സാധ്യതയുള്ള operations-ൽ Swift program safety ഉറപ്പാക്കാൻ Optional type return ചെയ്യും.

അവയിലെ value ഉപയോഗിക്കേണ്ടപ്പോൾ `??` ഉപയോഗിച്ച് default value നൽകാം; അങ്ങനെ `nil` ഉണ്ടായാലും നമുക്ക് യുക്തിസഹമായ ഒരു ഫലം ലഭിക്കും.
