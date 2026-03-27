# ബട്ടൺ പ്രവർത്തിപ്പിക്കാം

ഈ പാഠത്തിൽ പ്രധാനമായും `Button` ബട്ടൺ, `print` ഉപയോഗിച്ച് debug output, കൂടാതെ Swift functions എന്നിവ പഠിക്കും.

ഈ ഉള്ളടക്കങ്ങൾ SwiftUI interactive programming-ന്റെ അടിത്തറയാണ്.

## ബട്ടൺ

ബട്ടൺ UI-യിലെ ഏറ്റവും സാധാരണ control-കളിലൊന്നാണ്. download ചെയ്യുക, open ചെയ്യുക, exit ചെയ്യുക തുടങ്ങിയ പ്രവർത്തനങ്ങൾ ആവശ്യമായപ്പോൾ സാധാരണയായി നാം button click ചെയ്യാറുണ്ട്.

ഉദാഹരണത്തിന് App Store-ൽ `"Get"` button click ചെയ്ത് App download ചെയ്യുന്നു.

![Button](../../RESOURCE/008_button.png)

SwiftUI-ൽ button-നെ `Button` എന്നാണ് പ്രതിനിധീകരിക്കുന്നത്.

അടിസ്ഥാന ഉപയോഗം:

```swift
Button("") {
    
}
```

ഈ structure രണ്ട് ഭാഗങ്ങളായി കാണാം:

```swift
Button("ബട്ടൺ വാചകം") {
    ബട്ടൺ click ചെയ്തപ്പോൾ execute ചെയ്യേണ്ട code
}
```

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Run ചെയ്താൽ `Start` button കാണിക്കും.

![Button](../../RESOURCE/008_button1.png)

User button click ചെയ്യുമ്പോൾ `{}`-ക്കുള്ളിലെ code execute ചെയ്യും.

ശ്രദ്ധിക്കുക: `Button` SwiftUI-യുടെ UI control (`View`) ആണ്. അതിനാൽ ഇത് `body`-ക്കുള്ളിൽ തന്നെ എഴുതണം.

### `buttonStyle` modifier

SwiftUI-ൽ `Button`-ന് system built-in button styles ഉണ്ട്; അവ `buttonStyle` modifier ഉപയോഗിച്ച് പ്രയോഗിക്കാം.

ഉദാഹരണത്തിന്:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system നൽകുന്ന button style പ്രയോഗിക്കും.

സാധാരണ options:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

ഈ styles തമ്മിലുള്ള പ്രധാന വ്യത്യാസങ്ങൾ: button-ന് border ഉണ്ടോ, background ഉണ്ടോ, visual emphasis എത്രമാത്രം എന്നതാണ്.

## `print` output

Programming-ൽ, program code ഒരു പ്രത്യേക ഭാഗം വരെ എത്തിയിട്ടുണ്ടോ എന്ന് അറിയേണ്ട സാഹചര്യം പലപ്പോഴും ഉണ്ടാകും.

Swift debug വിവരങ്ങൾ output ചെയ്യാൻ `print` function നൽകുന്നു.

അടിസ്ഥാന രൂപം:

```swift
print("Hello")
```

ഈ line text-നെ `Console`-ലേക്ക് output ചെയ്യും.

### ബട്ടൺ പ്രവർത്തിക്കുന്നുണ്ടോ എന്ന് പരിശോധിക്കൽ

Button click ആയോ എന്ന് പരിശോധിക്കാൻ `print` button-നുള്ളിൽ എഴുതാം.

```swift
Button("Start") {
    print("Test 123")
}
```

Button click ചെയ്താൽ `Console`-ൽ output ഇങ്ങനെ വരും:

```
Test 123
```

ഇത് button വിജയകരമായി trigger ചെയ്തുവെന്നു സൂചിപ്പിക്കുന്നു.

![Button](../../RESOURCE/008_button3.png)

ശ്രദ്ധിക്കുക: `print` Swift code ആണ്; ഇത് UI control അല്ല. അതിനാൽ ഇത് നേരിട്ട് `body`-ക്കുള്ളിൽ വെക്കാൻ പറ്റില്ല; ഇല്ലെങ്കിൽ error ഉണ്ടാകും.

ഉദാഹരണത്തിന് താഴെപ്പറയുന്ന പോലെ എഴുതുന്നത് തെറ്റാണ്:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Error: body ഒരു View തിരികെ നൽകണം
    }
}
```

SwiftUI-ൽ `body` UI structure വിവരിക്കാൻ ഉപയോഗിക്കുന്നതാണ്. അതിനുള്ളിൽ `Text`, `Button`, `Image` പോലുള്ള UI controls (`View`) മാത്രം വെക്കാം.

സാധാരണ code (calculation logic, `print` എന്നിവ) buttons, functions, അല്ലെങ്കിൽ മറ്റ് event handlers-ലായിരിക്കണം.

### `Console`

`print` output Xcode-യിലെ `Console`-ൽ കാണിക്കും.

`Console` കാണുന്നില്ലെങ്കിൽ, താഴെ വലത് വശത്തുള്ള `Show the Debug Area` button click ചെയ്ത് debug area തുറക്കുക. തുടർന്ന് `Show the Console` button click ചെയ്ത് console കാണിക്കുക.

![](../../RESOURCE/008_button4.png)

`Console`-ന്റെ താഴെ ഇടതു വശത്ത് രണ്ട് tabs ഉണ്ട്: `Executable` ഒപ്പം `Previews`.

![](../../RESOURCE/008_button5.png)

ഈ tabs വ്യത്യസ്ത run environments-നെ സൂചിപ്പിക്കുന്നു: Canvas preview ഉപയോഗിക്കുമ്പോൾ `print` output `Previews` tab-ലായിരിക്കും; simulator അല്ലെങ്കിൽ physical device-ൽ app run ചെയ്താൽ output `Executable` tab-ലായിരിക്കും.

അതുകൊണ്ട് `print` output ഇല്ലെന്ന് തോന്നുമ്പോൾ, ആദ്യം ശരിയായ tab തന്നെയാണോ തിരഞ്ഞെടുത്തിരിക്കുന്നത് എന്ന് പരിശോധിക്കുക.

## ഉദാഹരണം - ASCII character art

ചില code projects-ൽ ASCII character art പതിവായി കാണാം.

Character art സാധാരണ characters ഉപയോഗിച്ച് രൂപപ്പെടുത്തിയ ഒരു ചിത്രം ആണ്. ഉദാഹരണത്തിന്:

![ASCII](../../RESOURCE/008_ascii.png)

ഒരു ASCII character art output ചെയ്യാൻ button + `print` ഉപയോഗിക്കാം.

Sample code:

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

Button click ചെയ്താൽ `Console`-ൽ output:

```
 /\_/\
( o.o )
 > ^ <
```

ശ്രദ്ധിക്കുക: string-ിലുള്ള `\` എന്നത് `\\` ആയി എഴുതണം, കാരണം backslash string-ൽ escape character ആണ്.

## Functions

Button-നുള്ളിൽ നമുക്ക് നേരിട്ട് code എഴുതാം.

ഉദാഹരണത്തിന്:

```swift
Button("Start") {
    print("Hello")
}
```

Code കുറവാണെങ്കിൽ ഇത് മതിയാകും. പക്ഷേ യഥാർത്ഥ development-ൽ ഒരു button trigger ചെയ്യുന്ന logic വളരെ കൂടുതൽ ആയിരിക്കാം.

ഉദാഹരണത്തിന്:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // കൂടുതൽ code ഉണ്ടാകാം
}
```

Code കൂടുതൽ കൂടിക്കൊണ്ടിരിക്കുമ്പോൾ അത് നേരിട്ട് button-നുള്ളിൽ എഴുതുന്നത് UI code കുഴപ്പമാക്കും; വായിക്കാനും maintain ചെയ്യാനും ബുദ്ധിമുട്ടാകും.

അതുകൊണ്ടാണ് ഈ code ഒരു function-ലേക്ക് ക്രമീകരിച്ച്, button-ൽ നിന്ന് അത് call ചെയ്യുന്നത്.

### Function എന്താണ്

Function എന്നത് വീണ്ടും ഉപയോഗിക്കാവുന്ന code-ന്റെ ഒരു ഭാഗമാണ്.

ഒരു code section execute ചെയ്യേണ്ടപ്പോൾ, അതിന് അനുയോജ്യമായ function call ചെയ്താൽ function-ന്റെ ഉള്ളിലുള്ള code run ചെയ്യും.

ഇത് code structure കൂടുതൽ വ്യക്തതയോടെ ക്രമപ്പെടുത്താനും, reusability ഉയർത്താനും സഹായിക്കുന്നു.

### അടിസ്ഥാന രൂപം

Swift-ൽ function define ചെയ്യാൻ **func** keyword ഉപയോഗിക്കുന്നു:

```swift
func randomInt() {
    // code
}
```

ഈ code ഒരു function define ചെയ്യുന്നു.

`randomInt` function name ആണ്; അത് ഈ code section-നെ തിരിച്ചറിയാൻ ഉപയോഗിക്കുന്നു.

`() ` parameter position ആണ്. ഇവിടെ പുറത്തുനിന്നുള്ള data സ്വീകരിക്കാം. Data ഒന്നും വേണ്ടെങ്കിൽ ഇത് ശൂന്യമായി വിടാം.

`{}`-ക്കുള്ളിൽ function-ന്റെ code area ആണ്; execute ചെയ്യേണ്ട എല്ലാ code-ഉം അവിടെ എഴുതണം.

ഉദാഹരണത്തിന്:

```swift
func getName() {
    print("FangJunyu")
}
```

ഈ function-ന്റെ ജോലി ഒരു text output ചെയ്യുക എന്നതാണ്.

### Function call ചെയ്യുക

Function define ചെയ്യുന്നത് code സൃഷ്ടിക്കുന്നതേ ഉള്ളൂ; അത് execute ചെയ്യണമെങ്കിൽ function call ചെയ്യണം.

Call ചെയ്യാനുള്ള മാർഗം: function name-ന് ശേഷം `()` ചേർക്കുക:

```swift
getName()
```

Program ഈ line-ലേക്ക് എത്തിയാൽ `getName` function-ിലുള്ള code execute ചെയ്യും.

പൂർണ്ണ ഉദാഹരണം:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Run ചെയ്താൽ `Console` output:

```
FangJunyu
```

### SwiftUI-ൽ functions ഉപയോഗിക്കുക

SwiftUI view-ൽ functions സാധാരണയായി `body`-യ്ക്ക് പുറത്താണ് എഴുതുന്നത്.

ഉദാഹരണത്തിന്:

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

Button click ചെയ്താൽ `getName()` function call ചെയ്യും.

ഇങ്ങനെ UI code clean ആയി നിലനിൽക്കും; concrete logic function-ലേക്ക് മാറ്റാം.

### Function parameters

ചിലപ്പോൾ ഒരു function വ്യത്യസ്ത data അനുസരിച്ച് വ്യത്യസ്ത പ്രവർത്തനങ്ങൾ ചെയ്യേണ്ടി വരും.

ഉദാഹരണത്തിന്, `"FangJunyu"` എന്ന fixed name മാത്രം അല്ല, വ്യത്യസ്ത പേരുകൾ output ചെയ്യുന്ന function വേണമെന്നു കരുതാം.

അത്തരം സാഹചര്യത്തിൽ parameters ഉപയോഗിക്കാം. Function call ചെയ്യുമ്പോൾ pass ചെയ്യുന്ന data തന്നെയാണ് parameter എന്ന് ലളിതമായി മനസ്സിലാക്കാം.

ഉദാഹരണത്തിന്:

```swift
func getName(name: String) {
    print(name)
}
```

ഈ function-ൽ പുതിയ parameter ഉണ്ട്. `name` parameter name ആണ്; `String` അതിന്റെ type ആണ്.

അത് function `String` type data സ്വീകരിക്കണം എന്നർത്ഥം.

ഇപ്പോൾ function-ന് data വേണമെന്നതിനാൽ call ചെയ്യുമ്പോൾ അത് നിർബന്ധമായും നൽകണം.

```swift
getName(name: "Sam")
```

Call ചെയ്യുമ്പോൾ `"Sam"` pass ചെയ്താൽ, function-ന്റെ ഉള്ളിൽ ആ value output ചെയ്യും.

Run result:

```
Sam
```

## ഉദാഹരണം - function ഉപയോഗിച്ച് ASCII art output ചെയ്യുക

മുൻ ഉദാഹരണത്തിൽ `print` നേരിട്ട് button-നുള്ളിൽ എഴുതിയിരുന്നു.

പക്ഷേ character art കൂടുതൽ സങ്കീർണ്ണമാകുമ്പോൾ code വളരെ നീളാം. അപ്പോൾ logic function-ലേക്ക് മാറ്റിയാൽ UI code കൂടുതൽ വ്യക്തമായിരിക്കും.

Sample code:

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

Run ചെയ്ത ശേഷം button click ചെയ്താൽ `Console` output:

```
 /\_/\
( o.o )
 > ^ <
```

ഇവിടെ user button click ചെയ്തതിന് ശേഷം രണ്ട് കാര്യങ്ങൾ നടക്കുന്നു:

1. Button `printCat()` function call ചെയ്യുന്നു
2. Function-ന്റെ ഉള്ളിലുള്ള `print` code execute ചെയ്യുന്നു

ഇതിലൂടെ UI code event trigger ചെയ്യുന്നതിന് മാത്രം ഉത്തരവാദിയാകും; detailed logic function-ൽ കൈകാര്യം ചെയ്യും.

യഥാർത്ഥ development-ൽ ഭൂരിഭാഗം button actions-ഉം functions വഴിയാണ് നടപ്പാക്കുന്നത്.

## സംഗ്രഹം

ഈ പാഠത്തിൽ മൂന്ന് പ്രധാന കാര്യങ്ങൾ പഠിച്ചു:

**1. `Button`**

`Button` SwiftUI-യിൽ actions trigger ചെയ്യാൻ ഉപയോഗിക്കുന്ന control ആണ്.

```swift
Button("Start") {

}
```

User button click ചെയ്യുമ്പോൾ braces-ക്കുള്ളിലെ code execute ചെയ്യും.

**2. `print` output**

`print` debug information `Console`-ലേക്ക് output ചെയ്യാൻ ഉപയോഗിക്കുന്നു.

```swift
print("Hello")
```

Developer-ന് program run state `Console` വഴി നിരീക്ഷിക്കാം.

**3. Functions**

Function വീണ്ടും ഉപയോഗിക്കാവുന്ന code block ആണ്.

```swift
func sayHello() {
    print("Hello")
}
```

Function call:

```swift
sayHello()
```

Function-ന് data വേണമെങ്കിൽ parameter ഉപയോഗിക്കാം:

```swift
func sayHello(name: String) {
    print(name)
}
```

അടുത്ത പാഠങ്ങളിൽ കൂടുതൽ SwiftUI controls ഉം data UI-യുമായി എങ്ങനെ interact ചെയ്യുന്നു എന്നും തുടർന്നുപഠിക്കും.

## അഭ്യാസം

താഴെയുള്ള exercise പൂർത്തിയാക്കി നോക്കൂ:

1. `"Hello"` എന്ന button text ഉള്ള ഒരു button സൃഷ്ടിക്കുക
2. Button click ചെയ്തപ്പോൾ `Console`-ൽ `Hello Swift` output ചെയ്യുക
3. Output code ഒരു function-ലേക്ക് മാറ്റി, button-ൽ നിന്ന് ആ function call ചെയ്യുക
