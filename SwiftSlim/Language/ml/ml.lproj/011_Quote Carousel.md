# ഉദ്ധരണി കരൂസൽ

ഈ പാഠത്തിൽ നാം ഒരു “quote carousel” feature നടപ്പാക്കും. അതോടൊപ്പം arrays (`Array`) ഉം conditional statements (`if-else`) ഉം പോലുള്ള Swift അടിസ്ഥാന അറിവുകളും കൂടുതൽ ആഴത്തിൽ പഠിക്കും.

ഒന്നിലധികം quotes എങ്ങനെ save ചെയ്യാം, button interaction ഉപയോഗിച്ച് അവയെ എങ്ങനെ cyclic ആയി rotate ചെയ്യാം എന്നതും കാണിക്കും.

![alt text](../../RESOURCE/011_word.png)

## Quote കാണിക്കൽ

ആദ്യം SwiftUI-ൽ ഒരു quote കാണിക്കണം.

ഏറ്റവും ലളിതമായ മാർഗം `Text` view ഉപയോഗിക്കുകയാണു:

```swift
Text("Slow progress is still progress.")
```

ഈ code ഒരു fixed quote മാത്രം കാണിക്കും. പല quotes കാണിക്കാനും switch ചെയ്യാനുമെങ്കിൽ, അവ save ചെയ്യണം.

പക്ഷേ സാധാരണ string variable ഒരു quote മാത്രം save ചെയ്യും:

```swift
let sayings = "Slow progress is still progress."
```

ഒന്നിലധികം quotes save ചെയ്യണമെങ്കിൽ ഓരോ quote-നുമായി ഓരോ variable declare ചെയ്യണം:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

പക്ഷേ യഥാർത്ഥ development-ൽ ഇത് ബുദ്ധിമുട്ടുള്ളതുമാത്രമല്ല, ഓരോ variable-വും സ്വതന്ത്രമാണെന്നതിനാൽ flexible carousel switching നടപ്പാക്കാനും പറ്റില്ല.

ഒന്നിലധികം quotes സൗകര്യപ്രദമായി manage ചെയ്യാൻ അവയെ ഒരുമിച്ച് save ചെയ്യുന്ന data structure വേണം; അതാണ് array (`Array`).

Array ഉപയോഗിച്ചാൽ മുകളിലെ code ഇങ്ങനെ save ചെയ്യാം:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**സൂചന: programming conventions-ൽ multiple elements save ചെയ്യുന്ന array variable-കൾക്ക് സാധാരണ plural പേര് ഉപയോഗിക്കും, ഉദാഹരണത്തിന് `sayings`, കാരണം അത് ഒരു collection ആണെന്ന് അതിലൂടെ മനസ്സിലാക്കാം.**

## Array

Swift-ൽ array എന്നത് ordered elements-ന്റെ ഒരു collection ആണ്; ഇത് square brackets `[]` ഉപയോഗിച്ചാണ് പ്രതിനിധീകരിക്കുന്നത്.

```swift
[]
```

Array-ക്കുള്ളിൽ ഒരേ type-ിലുള്ള നിരവധി elements ഉൾക്കൊള്ളാം; അവ English comma `,` ഉപയോഗിച്ച് വേർതിരിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
[101, 102, 103, 104, 105]
```

ഒരു array-യെ ഒരു train പോലെ ലളിതമായി ചിന്തിക്കാം:

![Array](../../RESOURCE/011_array1.png)

മുഴുവൻ train array object ആണ്; ഓരോ coach-ും ക്രമത്തിൽ പരമ്പരയായി നിൽക്കും.

### Index, element access

Array ordered ആയതിനാൽ system-ന് അതിലെ specific element അതിന്റെ position ഉപയോഗിച്ച് കണ്ടെത്താം. ഈ locating mechanism-നെയാണ് index (`Index`) എന്ന് പറയുന്നത്.

Swift-ൽ (മറ്റുപല programming languages-ലും പോലെ) array index `0`-ൽ നിന്നാണ് തുടങ്ങുന്നത്, `1`-ൽ നിന്ന് അല്ല. അതായത് array-യിലെ ആദ്യ element-ന്റെ index `0`, രണ്ടാമത്തേതിന്റെ index `1`, പിന്നെ ഇങ്ങനെ തുടരും.

![Array](../../RESOURCE/011_array2.png)

Array-യിലെ ഒരു നിർദ്ദിഷ്ട element access ചെയ്യണമെങ്കിൽ, array name-ന് ശേഷം square brackets ചേർത്ത് അതിനുള്ളിൽ target index value നൽകുക മതി.

ഉദാഹരണത്തിന്:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Array-യുടെ valid range-നെ കവിയുന്ന index access ചെയ്യാൻ ശ്രമിച്ചാൽ “Index Out of Range” പ്രശ്നം ഉണ്ടാകും. അതിനാൽ array access ചെയ്യുമ്പോൾ index valid range-ലാണെന്ന് ഉറപ്പാക്കണം.

**Index out of range**

ഉദാഹരണത്തിന് array-ൽ 5 elements മാത്രമാണെങ്കിൽ valid indices `0` മുതൽ `4` വരെയാണ്. `sayings[5]` access ചെയ്യാൻ ശ്രമിച്ചാൽ system ബന്ധപ്പെട്ട “coach” കണ്ടെത്താനാവില്ല; ഫലമായി “index out of range” error ഉണ്ടാകും; app crash ചെയ്യാനും സാധ്യതയുണ്ട്.

![Array](../../RESOURCE/011_array3.png)

### Array-ൽ പ്രവർത്തനങ്ങൾ

Arrays static definition മാത്രമല്ല പിന്തുണയ്ക്കുന്നത്; elements add ചെയ്യൽ, remove ചെയ്യൽ, modify ചെയ്യൽ, length കണ്ടെത്തൽ എന്നിവയും കഴിയും.

സൂചന: array modify ചെയ്യണമെങ്കിൽ `let` constant അല്ല, `var` variable ഉപയോഗിച്ചേ declare ചെയ്യാവൂ.

**1. Element ചേർക്കുക**

Array-യുടെ അവസാനം element ചേർക്കാൻ `append` method ഉപയോഗിക്കാം:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Element നീക്കം ചെയ്യുക**

`remove(at:)` method ഉപയോഗിച്ച് നിർദ്ദിഷ്ട element നീക്കം ചെയ്യാം:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Element മാറ്റുക**

Index ഉപയോഗിച്ച് array element നേരിട്ട് modify ചെയ്യാം:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Array length കണ്ടെത്തുക**

Array-യിലെ elements-ന്റെ എണ്ണം അറിയാൻ `count` property ഉപയോഗിക്കുക:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Array ഉപയോഗിച്ച് quote കാണിക്കുക

ഒന്നിലധികം quotes കാണിക്കാൻ, അവ array-യിൽ save ചെയ്ത് index ഉപയോഗിച്ച് access ചെയ്യാനും display ചെയ്യാനും കഴിയും.

ആദ്യം `ContentView`-ൽ quotes save ചെയ്യാൻ ഒരു `sayings` array സൃഷ്ടിക്കുക, തുടർന്ന് `Text` view-ൽ index ഉപയോഗിച്ച് അനുബന്ധ quote വായിച്ച് കാണിക്കുക:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

ഇവിടെ `sayings[0]` എന്നത് array-യിലെ ആദ്യത്തെ quote ആണ്.

വ്യത്യസ്ത quote കാണിക്കണമെങ്കിൽ square brackets-നുള്ളിലെ index value മാറ്റുക മതി:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Quote-ന്റെ index define ചെയ്യുക

Quotes dynamic ആയി switch ചെയ്യാൻ, index-നെ `Text` view-ൽ hard-code ചെയ്യാൻ പറ്റില്ല.

നിലവിൽ കാണിക്കപ്പെടുന്ന index value പ്രത്യേകം save ചെയ്യുന്ന ഒരു variable നമുക്ക് വേണം.

SwiftUI-ൽ mutable index declare ചെയ്യാൻ `@State` ഉപയോഗിക്കാം:

```swift
@State private var index = 0
```

SwiftUI `@State`-ൽ wrap ചെയ്ത variables observe ചെയ്യും. `index` മാറുമ്പോൾ SwiftUI view വീണ്ടും render ചെയ്ത് അനുബന്ധ quote കാണിക്കും.

ശേഷം array-യിലെ quote dynamically access ചെയ്യാൻ `sayings[index]` ഉപയോഗിക്കാം:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

`index` value മാറുമ്പോൾ `Text` വേറെ quote കാണിക്കും.

### Button ഉപയോഗിച്ച് index നിയന്ത്രിക്കുക

Quote switching നിയന്ത്രിക്കാൻ `Button` ഉപയോഗിച്ച് `index` value മാറ്റാം. Button ഓരോ തവണ click ചെയ്‌താൽ `index` 1 വീതം കൂടും:

```swift
Button("Next") {
    index += 1
}
```

Button click ചെയ്യുമ്പോൾ `index` `0`-ൽ നിന്ന് `1` ആയി മാറും; view refresh ആകുകയും `Text(sayings[index])` അടുത്ത quote വായിക്കുകയും ചെയ്യും.

എന്നാൽ ഇവിടെ ഒരു സാധ്യതയുള്ള പ്രശ്നമുണ്ട്: button തുടർച്ചയായി click ചെയ്താൽ `index` array range-നെ കവിയുന്ന value ആയി കൂടാം. ഉദാഹരണത്തിന് `index` `5` ആകുമ്പോൾ (array indices `0` മുതൽ `4` വരെ മാത്രമാണ്), program crash ചെയ്യും.

അതുകൊണ്ട് array index range-നെ കവിയാതിരിക്കാനായി conditional control ചേർക്കണം. `index` array-ന്റെ length-നെക്കാൾ ചെറുതാണോ എന്ന് `if-else` ഉപയോഗിച്ച് പരിശോധിക്കാം.

## Conditional control: `if-else`

`if-else` Swift-ൽ ഏറ്റവും സാധാരണമായി ഉപയോഗിക്കുന്ന conditional branch statement ആണ്. ഒരു condition ശരിയാണോ എന്ന് പരിശോധിച്ച്, അതിന്റെ truth value അനുസരിച്ച് വ്യത്യസ്ത code blocks execute ചെയ്യാൻ ഇത് ഉപയോഗിക്കുന്നു.

അടിസ്ഥാന structure:

```swift
if condition {
    // condition true ആണെങ്കിൽ execute ചെയ്യുന്ന code
} else {
    // condition false ആണെങ്കിൽ execute ചെയ്യുന്ന code
}
```

`if` statement-ൽ `condition` ഒരു boolean value (`Bool` type) ആണ്; ഇത് `true` അല്ലെങ്കിൽ `false` ആയിരിക്കും. Condition `true` ആണെങ്കിൽ `if` ഭാഗം execute ചെയ്യും; അല്ലെങ്കിൽ `else` ഭാഗം execute ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

ഈ ഉദാഹരണത്തിൽ `age`-ന്റെ value `25` ആണ്. `if` statement `age > 18` ശരിയാണോ എന്ന് പരിശോധിക്കുന്നു. Condition satisfied ആകുന്നതിനാൽ `"Big Boy"` output ചെയ്യും.

`else` ഭാഗം ആവശ്യമില്ലെങ്കിൽ അത് ഒഴിവാക്കാം:

```swift
if condition {
    // condition true ആണെങ്കിൽ execute ചെയ്യുന്ന code
}
```

### Condition ഉപയോഗിച്ച് index range നിയന്ത്രിക്കുക

Array index out-of-range ഒഴിവാക്കാൻ `if` statement ഉപയോഗിച്ച് `index` array range-നുള്ളിൽ തന്നെയാണെന്ന് ഉറപ്പാക്കാം:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logic analysis: `sayings.count` value `5` ആണ് (ആകെ 5 quotes ഉണ്ട്), അതിനാൽ `sayings.count - 1` value `4` ആണ്. അതാണ് array-യിലെ അവസാന valid index.

`index` `4`-നേക്കാൾ ചെറുതായിരിക്കുമ്പോൾ button click ചെയ്ത് `+1` ചെയ്യുന്നത് സുരക്ഷിതമാണ്; `index` `4` ആകുമ്പോൾ condition satisfy ആവില്ല, അതിനാൽ click ചെയ്താലും ഒന്നും സംഭവിക്കില്ല.

ഇപ്പോൾ code quote switching പ്രവർത്തനം നടപ്പിലാക്കുന്നു:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cycle quotes

അവസാന quote-ൽ എത്തിയ ശേഷവും button click ചെയ്താൽ വീണ്ടും ആദ്യ quote കാണിക്കണം, അങ്ങനെ carousel loop ആവണം എങ്കിൽ `else` ഭാഗം ഉപയോഗിക്കാം:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Button click ചെയ്‌തപ്പോൾ `index` array-യിലെ അവസാന element-ലേക്ക് എത്തിയാൽ, `index` വീണ്ടും `0` ആക്കും. അതിനാൽ quotes loop ആയി വീണ്ടും തുടങ്ങും.

## Quote view optimize ചെയ്യുക

ഇപ്പോൾ quote carousel logic പ്രവർത്തിക്കുന്നു, പക്ഷേ interface ഇനിയും കൂടുതൽ മനോഹരമാക്കാം.

പൂർണ്ണ കോഡ്:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

ഈ ഉദാഹരണത്തിൽ `Text` view-ക്ക് semi-transparent white background ഉം rounded corners ഉം ചേർത്തിരിക്കുന്നു. `Button` `.borderedProminent` style ഉപയോഗിക്കുന്നു; `VStack`-ന് background image ഉണ്ട്.

കൂടുതൽ അറിവ്: `background()` modifier image background-നായി ഉപയോഗിക്കുമ്പോൾ, അതിന്റെ default behavior നിലവിലെ view occupy ചെയ്യുന്ന layout area പൂരിപ്പിക്കാൻ പരമാവധി ശ്രമിക്കുന്നതാണ്. പല സാഹചര്യങ്ങളിലും അത് safe area വരെ സ്വാഭാവികമായി നീളും.

ഇപ്പോൾ quote carousel view സൃഷ്ടിച്ചു കഴിഞ്ഞു.

![SwiftUI View](../../RESOURCE/011_word.png)

## സംഗ്രഹം

ഈ പാഠത്തിലൂടെ ഒന്നിലധികം quotes save ചെയ്യാൻ arrays എങ്ങനെ ഉപയോഗിക്കാം എന്നും, `if`, `if-else` statements ഉപയോഗിച്ച് quote carousel എങ്ങനെ നടപ്പിലാക്കാം എന്നും നാം കൈവരിച്ചു.

Array-യുടെ അടിസ്ഥാന പ്രവർത്തനങ്ങൾ — add ചെയ്യുക, remove ചെയ്യുക, modify ചെയ്യുക — കൂടാതെ array index out-of-range ഒഴിവാക്കുന്നതും മനസ്സിലാക്കി.

ഈ പാഠം quote carousel-ന്റെ feature implementation മാത്രം പഠിപ്പിച്ചില്ല; array-യും conditional statements-ഉം എങ്ങനെ ഉപയോഗിക്കാം എന്നും ചേർത്ത് പരിചയപ്പെടുത്തി. അതുവഴി data process ചെയ്യാനും program flow നിയന്ത്രിക്കാനും കഴിയുന്ന കഴിവ് നമുക്ക് ലഭിച്ചു.

## വിപുലമായ അറിവ് - multiple conditional checks: `if-else if-else`

യഥാർത്ഥ development-ൽ പലതരം conditions കൈകാര്യം ചെയ്യേണ്ട സാഹചര്യം പതിവാണ്. ഉദാഹരണത്തിന് ഒരു game-ൽ score `1` ആണെങ്കിൽ event A, `2` ആണെങ്കിൽ event B, `3` ആണെങ്കിൽ event C എന്നിങ്ങനെ.

രണ്ട് condition-കളിൽ കൂടുതൽ branch ഉള്ള സാഹചര്യങ്ങളിൽ `if-else if-else` ഉപയോഗിച്ച് multiple checks നടത്തണം.

അടിസ്ഥാന syntax:

```swift
if conditionA {
    // conditionA true ആണെങ്കിൽ execute ചെയ്യുന്ന code
} else if conditionB {
    // conditionB true ആണെങ്കിൽ execute ചെയ്യുന്ന code
} else if conditionC {
    // conditionC true ആണെങ്കിൽ execute ചെയ്യുന്ന code
} else {
    // എല്ലാ conditions-വും false ആണെങ്കിൽ execute ചെയ്യുന്ന code
}
```

ഈ സാഹചര്യത്തിൽ program conditions ക്രമത്തിൽ പരിശോധിച്ച് ആദ്യമായി satisfy ചെയ്യുന്ന branch execute ചെയ്യും. ഒന്നും satisfy ചെയ്യാത്ത പക്ഷം `else`-ക്കുശേഷമുള്ള code execute ചെയ്യും.

Quote carousel-ലും `if-else if-else` ഉപയോഗിച്ച് multiple checks നടത്താം:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

`index` `0`, `1`, `2`, `3` ആയിരിക്കുമ്പോൾ button click ചെയ്യുമ്പോൾ എല്ലാം `index += 1` ചെയ്യും; `index` `4` (അവസാന element) ആണെങ്കിൽ `0` ആക്കി reset ചെയ്യും, അതുവഴി loop നടപ്പാകും.

`else` branch fallback ആയി പ്രവർത്തിക്കുന്നു; illegal values വരുന്നത് (ഉദാ: `index` തെറ്റായി മാറ്റപ്പെടുന്നത്) തടയാൻ ഇത് സഹായിക്കുന്നു.

ശ്രദ്ധിക്കുക: ഇവിടെ ഉപയോഗിച്ചിരിക്കുന്ന `==` എന്നത് “equal ആണോ” എന്ന് പരിശോധിക്കുന്ന operator ആണ്. `if` statement `index` ഒരു specific number-നോട് തുല്യമാണോ എന്ന് പരിശോധിച്ച് true ആണെങ്കിൽ പിന്നിലുള്ള code block execute ചെയ്യും. അല്ലെങ്കിൽ അടുത്ത `if` branch പരിശോധിക്കും.

ഇത്തരം multiple checks വ്യത്യസ്ത conditions-ൽ വ്യത്യസ്ത code execute ചെയ്യേണ്ടപ്പോൾ വളരെ ഉപകാരപ്പെടും.
