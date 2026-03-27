# പിഗ്ഗി ബാങ്ക് amount save ചെയ്യുക

മുൻ പാഠത്തിൽ നാം ഒരു ലളിതമായ “piggy bank” ഉണ്ടാക്കി. ഈ പാഠത്തിൽ ആ “piggy bank”-ലെ amount persistent ആയി എങ്ങനെ save ചെയ്യാം എന്ന് പഠിക്കും.

ഈ പാഠത്തിൽ പ്രധാനമായും `UserDefaults` ഉം `@AppStorage` property wrapper ഉം പഠിക്കും. കൂടാതെ `onAppear`-ന്റെ പ്രവർത്തനം, Optional type (`nil`) ഉപയോഗം എന്നിവയും വിശദീകരിക്കും.

ശ്രദ്ധിക്കുക: ഈ പാഠം മുൻ പാഠത്തിൽ നിർമ്മിച്ച “piggy bank” code തുടർന്നാണ് ഉപയോഗിക്കുന്നത്.

## Persistent saving പ്രശ്നം

ഇപ്പോൾ “piggy bank” interface വളരെ ലളിതവും ഉപയോഗിക്കാൻ എളുപ്പവുമാണ്.

![Piggy Bank](../../Resource/014_view.png)

പക്ഷേ ഒരു വ്യക്തമായ പ്രശ്നമുണ്ട്: view refresh ചെയ്യുമ്പോഴും app close ചെയ്യുമ്പോഴും “piggy bank”-ന്റെ total amount വീണ്ടും `0` ആകുന്നു; മുമ്പ് save ചെയ്ത total amount മുഴുവൻ നഷ്ടമാകും.

അതായത് data യഥാർത്ഥത്തിൽ save ചെയ്യപ്പെട്ടിട്ടില്ല. മറ്റുവിധത്തിൽ പറഞ്ഞാൽ, ഇപ്പോഴുള്ള “piggy bank” temporary data മാത്രമേ save ചെയ്യൂ.

### എന്തുകൊണ്ട് persistent ആയി save ചെയ്യാനാകുന്നില്ല?

ഇത് നാം `@State` ഉപയോഗിച്ച് declare ചെയ്ത variable ആണെന്നതിനാലാണ്:

```swift
@State private var amount = 0
```

`@State` declare ചെയ്ത variable-ന്റെ lifecycle പൂർണ്ണമായും view-നെ ആശ്രയിക്കുന്നു.

View create ചെയ്യുമ്പോൾ `amount` `0` ആയി initialize ചെയ്യും; view destroy ചെയ്യുമ്പോൾ `amount`-യും destroy ചെയ്യും.

ഇവിടെ `amount` save ചെയ്യുന്ന data memory-ൽ മാത്രമേ നിലനിൽക്കൂ; അത് device-ലേക്ക് save ചെയ്തിട്ടില്ല.

`amount` view lifecycle-നോടൊപ്പം ബന്ധപ്പെട്ടു നിൽക്കേണ്ടതില്ലെങ്കിൽ persistent saving implement ചെയ്യണം. അതായത് data device-ലേക്ക് save ചെയ്യണം.

### “Data persistence” എന്താണ്

Data persistence എന്നത് “temporary memory”ൽ ഉള്ള data “device storage”ലേക്ക് save ചെയ്യുന്നതായി മനസ്സിലാക്കാം.

View close ചെയ്താലും app close ചെയ്താലും data നഷ്ടമാകില്ല.

Swift development-ൽ ലളിതമായ persistence-ക്ക് `UserDefaults` ഉപയോഗിക്കാം; കൂടുതൽ സങ്കീർണ്ണമായ data-ക്ക് `SwiftData` അല്ലെങ്കിൽ `CoreData` ആവശ്യമാണ്.

ഈ പാഠത്തിൽ ആദ്യം ഏറ്റവും ലളിതമായ `UserDefaults` പഠിക്കാം.

## `UserDefaults`

`UserDefaults` lightweight key-value pair data save ചെയ്യാൻ ഉപയോഗിക്കുന്നു. സാധാരണയായി `String`, `Int`, `Double`, `Bool` പോലുള്ള അടിസ്ഥാന types save ചെയ്യാൻ ഇത് ഉപയോഗിക്കുന്നു.

### Data save ചെയ്യുക

`UserDefaults` data save ചെയ്യാൻ `set` method ഉപയോഗിക്കുന്നു:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults`-ന്റെ ആദ്യ parameter save ചെയ്യേണ്ട data ആണ്; ഇവിടെ `String`, `Int` പോലുള്ള values നൽകുന്നു.

രണ്ടാമത്തെ parameter `forKey` variable name പോലെയാണ്; `UserDefaults`-ൽ save ചെയ്യുന്ന data identify ചെയ്യാൻ ഉപയോഗിക്കുന്നു.

### Data വായിക്കുക

`UserDefaults` അനുയോജ്യമായ methods ഉപയോഗിച്ച് data വായിക്കുന്നു:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Read ചെയ്യുമ്പോൾ corresponding type method തന്നെ ഉപയോഗിക്കണം; അല്ലെങ്കിൽ തെറ്റായ data അല്ലെങ്കിൽ errors ഉണ്ടാകും.

### `UserDefaults` ഉപയോഗിക്കുമ്പോൾ ശ്രദ്ധിക്കേണ്ടത്

#### 1. Optional type return ചെയ്യാം

`UserDefaults` ഉപയോഗിച്ച് data വായിക്കുമ്പോൾ, ചില methods Optional return ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

ഇവിടെ `name`-ന്റെ return type:

```swift
String?
```

അതായത് value ഉണ്ടാകാം, ഇല്ലാതിരിക്കാം.

**എന്തുകൊണ്ട് Optional type return ചെയ്യുന്നു?**

കാരണം `UserDefaults`-ൽ ഒരു `Key`-യ്ക്ക് data ഇല്ലാതിരിക്കാം.

ഉദാഹരണത്തിന്:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

മുമ്പ് ഒരിക്കലും `"City"` എന്ന key save ചെയ്തിട്ടില്ലെങ്കിൽ, വായിക്കുന്ന ഫലം:

```swift
nil
```

ശ്രദ്ധിക്കണം: `nil` എന്നത് data ഇല്ല എന്നർത്ഥം, empty string അല്ല.

“Type system” പാഠത്തിൽ ഇതുപോലൊരു സാഹചര്യം മുമ്പ് കണ്ടിട്ടുണ്ട്: type conversion fail ചെയ്താൽ Optional return ചെയ്യും.

അത്തരം സമയത്ത് `??` ഉപയോഗിച്ച് default value നൽകി unwrap ചെയ്യണം:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

`UserDefaults` data വായിച്ചാൽ അത് തന്നെ ഉപയോഗിക്കും; data ഇല്ലെങ്കിൽ (`nil`) default value ഉപയോഗിക്കും.

#### 2. Non-optional type return ചെയ്യുന്നത്

`UserDefaults` `Int`, `Double`, `Bool` type values വായിക്കുമ്പോൾ non-optional type return ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

ഈ key-കൾക്കായി ഒരിക്കലും data save ചെയ്തിട്ടില്ലെങ്കിലും return value `nil` ആയിരിക്കില്ല.

പകരം default values return ചെയ്യും:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Data amount limit

`UserDefaults` ചെറിയ അളവിലുള്ള data save ചെയ്യാൻ മാത്രം അനുയോജ്യമാണ്; ഉദാഹരണത്തിന് app configuration, ലളിതമായ state data എന്നിവ.

യഥാർത്ഥ ഉപയോഗത്തിൽ, വലിയ data amount-കൾക്കും വളരെ frequent read/write ഉള്ള data-ക്കും ഇത് അനുയോജ്യമല്ല.

## “Piggy bank” amount save ചെയ്യുക

ഇപ്പോൾ `UserDefaults` ഉപയോഗിച്ച് “piggy bank”-ന്റെ total amount save ചെയ്യുന്ന code logic നടപ്പാക്കാം.

User button click ചെയ്തപ്പോൾ input amount total amount-ലേക്ക് ചേർക്കുകയും, ആ total amount `UserDefaults`-ലേക്ക് save ചെയ്യുകയും ചെയ്യണം.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

ഇപ്പോൾ data write logic നടപ്പായി.

## Data persistence logic വിശദീകരണം

Persistent write logic പൂർത്തിയാക്കിയിട്ടും യഥാർത്ഥ run-ൽ കാണുന്നത്, ഓരോ തവണ view refresh ചെയ്യുകയോ app വീണ്ടും തുറക്കുകയോ ചെയ്താൽ `amount` variable ഇപ്പോഴും `0` ആണെന്നാണ്.

അതിന്റെ കാരണം:

```swift
@State private var amount = 0
```

SwiftUI-ൽ `@State` variables view create ചെയ്യുമ്പോൾ വീണ്ടും initialize ചെയ്യും.

`UserDefaults`-ൽ `amount` save ചെയ്തിട്ടുണ്ടെങ്കിലും, view reload സമയത്ത് `amount` വീണ്ടും `0` ആകും.

ഇത് data `UserDefaults`-ലേക്ക് save ചെയ്‌തെങ്കിലും, view-ലേക്ക് restore ചെയ്തിട്ടില്ല എന്നതാണർത്ഥം.

അതുകൊണ്ട് view load ചെയ്യുന്ന സമയത്ത് `UserDefaults`-ൽ നിന്ന് data manual ആയി read ചെയ്ത് വീണ്ടും `amount`-ലേക്ക് assign ചെയ്യണം; അപ്പോഴാണ് മുഴുവൻ persistence logic പൂർത്തിയാകുന്നത്.

### Logic analogy

ഈ process-നെ “classroom blackboard” പോലെയായി കരുതാം:

Class നടക്കുമ്പോൾ teacher blackboard-ൽ content എഴുതും; അത് current view state (`@State`) പോലെയാണ്.

Class കഴിഞ്ഞാൽ blackboard മായ്ക്കപ്പെടും; അടുത്ത class-ിന് ഒരുക്കം നടത്തും. ഇത് view destroy ചെയ്യുന്നതും `@State` data clear ആവുന്നതും പോലെയാണ്.

പഠിപ്പിച്ച content നഷ്ടമാകാതിരിക്കാനായി teacher അത് മുൻകൂട്ടി notes-ൽ save ചെയ്യും. ആ notes `UserDefaults`-ലുള്ള data പോലെയാണ്.

അടുത്ത class തുടങ്ങുമ്പോൾ blackboard ആദ്യം ശൂന്യമായിരിക്കും (`@State` initialization). Teacher notes നോക്കി പഴയ content വീണ്ടും blackboard-ൽ എഴുതണം (`UserDefaults` വായിക്കുക).

പ്രധാനമായി മനസ്സിലാക്കേണ്ടത്: blackboard സ്വയം പഴയ content restore ചെയ്യുകയില്ല; “notes വായിച്ച്” (`UserDefaults` വായിച്ച്) വീണ്ടും എഴുതണം.

## `onAppear` ഉപയോഗിച്ച് data വായിക്കുക

View കാണിക്കപ്പെടുമ്പോൾ `UserDefaults`-ലുള്ള value manual ആയി read ചെയ്ത് `@State` variable ആയ `amount`-ലേക്ക് assign ചെയ്യണം; അപ്പോഴാണ് യഥാർത്ഥ persistence നേടുന്നത്.

SwiftUI-ൽ view display സമയത്ത് initialization logic execute ചെയ്യാൻ `onAppear` ഉപയോഗിക്കാം:

```swift
.onAppear {}
```

`UserDefaults` വായിക്കുന്ന code `onAppear`-ൽ ഇടാം:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

View create ചെയ്യുമ്പോൾ `amount` `0` ആയി initialize ചെയ്യുന്നു; view display ചെയ്യുമ്പോൾ `onAppear` trigger ചെയ്ത് `UserDefaults`-ൽ നിന്ന് read ചെയ്ത് `amount`-ലേക്ക് assign ചെയ്യും. ഇങ്ങനെ last saved total amount view-ൽ കാണിക്കാം.

ഇപ്പോൾ “piggy bank”-ന്റെ മുഴുവൻ persistence logic പൂർത്തിയായി.

## പൂർണ്ണ കോഡ്

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage` property wrapper

SwiftUI `@AppStorage` property wrapper നൽകുന്നു; ഇത് `UserDefaults` save logic ലളിതമാക്കുന്നു.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` എന്നത് `UserDefaults`-നെ wrap ചെയ്തതാണ്; `"amount"` എന്നത് `UserDefaults`-ലെ key-നോട് corresponds ചെയ്യുന്നു.

View create ചെയ്യുമ്പോൾ ഇത് `UserDefaults`-ൽ നിന്ന് data read ചെയ്യും; variable മാറുമ്പോൾ അത് സ്വയം `UserDefaults`-ലേക്ക് write ചെയ്യും.

ഇത് SwiftUI-ന്റെ state update mechanism-നെ പിന്തുണയ്ക്കുന്നു. `@State` പോലെ തന്നെ, value മാറുമ്പോൾ SwiftUI view refresh ചെയ്യും.

അതായത് `@AppStorage` data reading, saving logic രണ്ടും തന്നെ കൈകാര്യം ചെയ്യും; ഇനി `UserDefaults` manually call ചെയ്യാനോ `onAppear` ഉപയോഗിച്ച് data manually വായിക്കാനോ ആവശ്യമില്ല.

അതുകൊണ്ട് code-ലുള്ള `UserDefaults`-നെ `@AppStorage` ഉപയോഗിച്ച് മാറ്റിക്കൊള്ളാം:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## സംഗ്രഹം

ഈ പാഠത്തിൽ പ്രധാനമായും താഴെ പറയുന്ന അറിവുകൾ പഠിച്ചു:

ആദ്യം, `UserDefaults` lightweight data save ചെയ്യാൻ ഉപയോഗിക്കുന്നു. നാം `UserDefaults` ഉപയോഗിച്ച് total amount device-ൽ save ചെയ്തു. `UserDefaults` data read, write methods നൽകുന്നു; അതിനൊപ്പം Optional type പോലുള്ള സാഹചര്യങ്ങളും കൈകാര്യം ചെയ്യേണ്ടിവരും.

അടുത്തതായി, `@State` variables view-യിലെ temporary state manage ചെയ്യാൻ മാത്രം ഉപയോഗിക്കുന്നു; അതിന്റെ lifecycle view-നോടു തുല്യമാണ്. View വീണ്ടും create ചെയ്താൽ `@State` വീണ്ടും initialize ചെയ്യും.

`UserDefaults` data restore ചെയ്യുമ്പോൾ `onAppear` ഉപയോഗിച്ച് view display സമയത്ത് `UserDefaults` data read ചെയ്യുകയും restore ചെയ്യുകയും ചെയ്യുന്നത് പഠിച്ചു.

അവസാനമായി, `UserDefaults`-ന് പകരം `@AppStorage` ഉപയോഗിച്ച് view load സമയത്ത് data auto-read ചെയ്യുകയും, data മാറുമ്പോൾ auto-write ചെയ്യുകയും ചെയ്യുന്നത് നടപ്പാക്കി; അതുവഴി manual `UserDefaults`, `onAppear` logic എന്നിവ replace ചെയ്തു.

ഈ അറിവുകൾ ഉപയോഗിച്ച് ഒരു അടിസ്ഥാന app data storage feature നിർമ്മിക്കാം; അതിനാൽ data persistent ആയി save ചെയ്യും.

## പാഠാനന്തര അഭ്യാസം

ഇപ്പോൾ “piggy bank” amount save ചെയ്യുന്നു, പക്ഷേ അതിന്റെ functionality ഇപ്പോഴും പൂർണ്ണമല്ല.

1. User amount withdraw ചെയ്യണമെങ്കിൽ, അനുയോജ്യമായ withdraw logic രൂപകൽപ്പന ചെയ്യണം.
2. User amount clear ചെയ്യണമെങ്കിൽ, reset logic കൂടി implement ചെയ്യണം.
3. “Piggy bank” ന് പേര് നൽകണമെങ്കിൽ, `String` type data save ചെയ്യുന്നതും ഉൾപ്പെടുത്തണം.

നിലവിലുള്ള അടിസ്ഥാനത്തിൽ ഈ features പൂർത്തിയാക്കി “piggy bank” functionality കൂടുതൽ സമ്പൂർണ്ണമാക്കാം.

## വിപുലമായ അറിവ് - input box default value പ്രശ്നം

ഇപ്പോൾ input box interaction ഇനിയും optimize ചെയ്യാം; അതുവഴി input operation കൂടുതൽ സൗകര്യപ്രദമാകും.

![textfield](../../Resource/015_view.png)

ഇപ്പോഴത്തെ implementation-ൽ input box default value `0` ആണ്. User ഓരോ തവണ amount input ചെയ്യുമ്പോഴും ആദ്യം `0` delete ചെയ്ത് പിന്നെ പുതിയ number നൽകണം; ഈ interaction അനുയോജ്യമല്ല.

Input box initial value empty ആയിരിക്കണം, `0` അല്ല.

അതിന്റെ കാരണം `TextField` ഉം `number` ഉം two-way binding ആണ്:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number` `0` ആയി initialize ചെയ്യുമ്പോൾ input box-ലും `0` കാണിക്കും.

അതുകൊണ്ട് `number` empty value ആക്കണം, അതായത് `nil`.

```swift
@State private var number = nil
```

ഇപ്പോൾ error വരും:

```
Generic parameter 'Value' could not be inferred
```

ഇതുതന്നെയാണ് “type system” പാഠത്തിൽ പറഞ്ഞ സാഹചര്യം: variable-ന്റെ type auto-infer ചെയ്യാൻ കഴിയാത്തപ്പോൾ explicit type declaration ആവശ്യമാണ്.

`number`-നെ `nil` ആക്കി സജ്ജമാക്കുമ്പോൾ, `nil`-ക്കുതന്നെ type information ഒന്നുമില്ല. Compiler-ന് ഇത് `String` ആണോ, `Int` ആണോ, മറ്റേതാണോ എന്ന് തിരിച്ചറിയാൻ പറ്റില്ല; അതിനാൽ error വരും.

അതുകൊണ്ട് `number`-ന് explicit type declaration നൽകണം:

```swift
@State private var number:Int? = nil
```

ഇവിടെ `Int?` Optional type ആണ്; `number` value `Int` ആകാം, അല്ലെങ്കിൽ `nil` ആകാം.

ഇങ്ങനെ `nil` ആയി initialize ചെയ്താൽ input box empty ആയി കാണിക്കും; `0` കാണിക്കില്ല.

### Optional type unwrap ചെയ്യുക

`number` Optional type ആക്കിയതിനു ശേഷം പഴയ calculation code error കാണിക്കും:

```swift
amount += number
```

Prompt:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

ഇതിനുള്ള കാരണം `number` ഇപ്പോൾ `nil` ആകാനുള്ള സാധ്യതയുള്ളതാണ്. അതിനെ നേരിട്ട് calculation-ൽ ഉപയോഗിച്ചാൽ അതായത്:

```swift
amount += nil
```

തെളിവായി `nil`-നെ `amount`-നൊപ്പം add ചെയ്യാൻ കഴിയില്ല; അത് valid operation അല്ല.

അതുകൊണ്ട് Optional type calculation-ിൽ പങ്കെടുക്കുമ്പോൾ ആദ്യം unwrap ചെയ്യണം.

ഇവിടെ `??` ഉപയോഗിച്ച് default value നൽകാം:

```swift
amount += number ?? 0
```

`number` `nil` ആണെങ്കിൽ default value `0` ഉപയോഗിക്കും; `number`-ന് value ഉണ്ടെങ്കിൽ user input ചെയ്ത യഥാർത്ഥ data ഉപയോഗിക്കും.

ഇതിലൂടെ calculation ശരിയായി നടക്കുകയും input box default ആയി empty ആയിരിക്കുകയും ചെയ്യും; user-ന് ഇനി input box-യിലെ `0` manual ആയി delete ചെയ്യേണ്ടതില്ല.

## വിപുലമായ കോഡ്

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
