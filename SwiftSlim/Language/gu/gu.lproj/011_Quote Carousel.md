# કહેવતોનું કેરુસેલ

આ પાઠમાં આપણે "કહેવતોનું કેરુસેલ" feature બનાવશું અને Swift ના કેટલાક મૂળભૂત ખ્યાલો, જેમ કે array (`Array`) અને conditional statements (`if-else`) ને વધુ ઊંડાઈથી શીખીશું.

અમે શીખીશું કે કેવી રીતે ઘણી કહેવતો save કરવી અને button interaction દ્વારા તેમને ચક્રાકાર રીતે બતાવવી.

![alt text](../../RESOURCE/011_word.png)

## કહેવત બતાવવી

સૌપ્રથમ, SwiftUI માં એક કહેવત બતાવવી છે.

સૌથી સરળ રીત `Text` view નો ઉપયોગ કરવી:

```swift
Text("Slow progress is still progress.")
```

આ code ફક્ત એક જ નક્કી કહેવત બતાવે છે. જો આપણે ઘણી કહેવતો બતાવી અને switch કરવાની સુવિધા ઇચ્છીએ, તો પહેલાં તેને save કરવી પડશે.

સામાન્ય string variable ફક્ત એક જ કહેવત save કરી શકે:

```swift
let sayings = "Slow progress is still progress."
```

જો ઘણી કહેવતો save કરવી હોય, તો દરેક માટે અલગ variable જાહેર કરવું પડે:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

પણ actual development માં આ રીત જટિલ છે. દરેક variable અલગ છે, એટલે લવચીક carousel effect બનાવવું મુશ્કેલ છે.

ઘણી કહેવતોને સરળતાથી manage કરવા માટે, અમને data structure જોઈએ જે તેમને સાથે રાખી શકે. આ માટે array (`Array`) નો ઉપયોગ થાય છે.

array નો ઉપયોગ કર્યા પછી ઉપરનું code આ રીતે લખી શકાય:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**ટિપ:** programming convention મુજબ, અનેક elements ધરાવતા array variable નામો સામાન્ય રીતે plural સ્વરૂપમાં લખાય છે, જેમ કે `sayings`, જેથી તે collection છે તે સ્પષ્ટ થાય.

## array

Swift માં array એ ordered elements નો સંગ્રહ છે, અને તેને square brackets `[]` દ્વારા દર્શાવવામાં આવે છે.

```swift
[]
```

array ની અંદર એક જ પ્રકારના ઘણા elements હોઈ શકે, અને elements વચ્ચે comma `,` હોય છે.

ઉદાહરણ તરીકે:

```swift
[101, 102, 103, 104, 105]
```

array ને સરળ રીતે ટ્રેનની બોગીઓ જેવી પંક્તિ સમજી શકાય:

![Array](../../RESOURCE/011_array1.png)

આખી ટ્રેન array object ને દર્શાવે છે, અને દરેક બોગી એક પછી એક ગોઠવાયેલી છે.

### index અને element access

કારણ કે array ordered છે, system તેમાંના ચોક્કસ element ને તેની position મુજબ શોધી શકે છે. આ સ્થાનસૂચક પદ્ધતિને index કહે છે.

Swift માં (અને મોટા ભાગની programming languages માં) array index `0` થી શરૂ થાય છે, `1` થી નહીં. એટલે પ્રથમ element નો index `0`, બીજાનો `1`, આ રીતે આગળ વધે છે.

![Array](../../RESOURCE/011_array2.png)

array માંથી કોઈ ચોક્કસ element મેળવવા માટે, array ના નામ પછી square brackets લખી અને અંદર target index આપવો પડે.

ઉદાહરણ તરીકે:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

જો array ની માન્ય સીમાથી બહારનો index access કરવાનો પ્રયાસ થાય, તો “Index Out of Range” error થાય. તેથી array access કરતી વખતે index માન્ય સીમામાં છે તેની ખાતરી રાખવી.

**Index Out of Range**

ઉદાહરણ તરીકે, જો array માં 5 elements હોય, તો માન્ય index range `0` થી `4` સુધી છે. જો આપણે `sayings[5]` access કરીએ, તો program ને તે “બોગી” નહીં મળે અને app crash થઈ શકે.

![Array](../../RESOURCE/011_array3.png)

### array પરની કામગીરી

array ફક્ત static definition માટે જ નહીં, પરંતુ add, remove, modify અને length મેળવવા માટે પણ વપરાય છે.

ટિપ: જો array modify કરવો હોય, તો તે `var` થી જાહેર કરવો પડે, `let` થી નહીં.

**1. element ઉમેરવું**

`append` method વડે array ના અંતે element ઉમેરાય:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element દૂર કરવું**

`remove(at:)` method વડે array માંથી ચોક્કસ element દૂર કરી શકાય:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element બદલી નાખવું**

index નો ઉપયોગ કરીને array element સીધું બદલી શકાય:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. array ની length ગણવી**

`count` property દ્વારા array માં કેટલા elements છે તે મળે:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### array નો ઉપયોગ કરીને કહેવતો બતાવવી

ઘણી કહેવતો બતાવવા માટે, આપણે તેમને array માં save કરી અને પછી index વડે access કરીને બતાવી શકીએ.

સૌપ્રથમ, `ContentView` માં `sayings` array બનાવો અને પછી `Text` માં index વડે યોગ્ય કહેવત બતાવો:

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

અહીં `sayings[0]` નો અર્થ array ની પ્રથમ કહેવત છે.

જો બીજી કહેવત બતાવવી હોય, તો square brackets ની અંદરનો index બદલો:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### કહેવત માટે index નિર્ધારિત કરવો

જો આપણે કહેવતો dynamic રીતે બદલવી હોય, તો `Text` માં index ને hard-code કરી શકાતું નથી.

અમે એક variable જોઈએ, જે હાલ બતાતી કહેવતનો index save કરે.

SwiftUI માં mutable index જાહેર કરવા માટે `@State` નો ઉપયોગ કરીએ:

```swift
@State private var index = 0
```

SwiftUI `@State` variable ને observe કરે છે. જ્યારે `index` બદલાય છે, ત્યારે view ફરી render થાય છે અને નવી કહેવત બતાવે છે.

પછી `sayings[index]` વડે array માંથી યોગ્ય કહેવત લઈ શકાય:

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

જ્યારે `index` ની value બદલાય છે, ત્યારે `Text` અલગ કહેવત બતાવશે.

### button વડે index નિયંત્રિત કરવો

કહેવત બદલવા માટે, આપણે `Button` વડે `index` ની value બદલી શકીએ. દરેક click પર `index` ને `1` થી વધારો:

```swift
Button("Next") {
    index += 1
}
```

જ્યારે button click થાય છે, ત્યારે `index` `0` થી `1` બને છે, view refresh થાય છે અને `Text(sayings[index])` આગળની કહેવત બતાવે છે.

પણ અહીં એક સંભવિત સમસ્યા છે: જો button સતત click કરીએ, તો `index` array range ની બહાર જઈ શકે છે. ઉદાહરણ તરીકે, જ્યારે `index` `5` બને છે (જ્યારે array index `0` થી `4` છે), ત્યારે program crash થશે.

આથી `index` array ની સીમા બહાર ન જાય તે ખાતરી કરવા માટે conditional control જોઈએ. `if-else` નો ઉપયોગ કરીને ચકાસી શકાય કે `index` array ની length કરતાં નાનું છે કે નહીં.

## શરતી નિયંત્રણ: `if-else`

`if-else` Swift માં સૌથી સામાન્ય conditional statements પૈકીનું એક છે. તે condition સાચી છે કે નહીં તે તપાસે છે અને તેના આધારે અલગ code block ચલાવે છે.

મૂળભૂત રચના:

```swift
if condition {
    // જ્યારે condition true હોય ત્યારે ચાલતો code
} else {
    // જ્યારે condition false હોય ત્યારે ચાલતો code
}
```

અહીં `condition` Bool value છે, એટલે કે `true` અથવા `false`. જો condition `true` હોય, તો `if` ભાગનો code ચાલે છે; નહીં તો `else` ભાગ ચાલે છે.

ઉદાહરણ તરીકે:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

આ ઉદાહરણમાં `age` ની value `25` છે, એટલે `age > 18` સાચું છે અને `"Big Boy"` output થાય છે.

જો `else` જરૂરી ન હોય, તો તેને છોડી શકાય:

```swift
if condition {
    // જ્યારે condition true હોય ત્યારે ચાલતો code
}
```

### condition વડે index range નિયંત્રિત કરવી

array index out of range ટાળવા માટે, `if` નો ઉપયોગ કરીને ખાતરી કરો કે `index` array ની સીમા બહાર ન જાય:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

logic: `sayings.count` નું value `5` છે, એટલે `sayings.count - 1` = `4`, જે array નો છેલ્લો માન્ય index છે.

જ્યારે `index` `4` કરતાં નાનું હોય, ત્યારે button click પર `index += 1` સલામત છે; એક વાર `index` `4` સુધી પહોંચી જાય, પછી condition સાચી નથી રહેતી અને button click પર કંઈ બદલાતું નથી.

હવે code કહેવતો બદલવાનું basic કામ કરે છે:

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

### ચક્રાકાર કહેવતો

જો આપણે છેલ્લી કહેવત પછી ફરી પ્રથમ કહેવત બતાવવી હોય, તો `else` ભાગનો ઉપયોગ કરીને loop બનાવી શકાય:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

હવે button click કરતાં જો `index` છેલ્લાં element સુધી પહોંચ્યો હોય, તો તે ફરી `0` પર reset થાય છે અને કહેવતો loop માં બતાવાય છે.

## કહેવત view ને વધુ સુંદર બનાવવું

હવે carousel ની logic તૈયાર છે, પણ interface ને વધુ સુંદર પણ બનાવી શકાય.

પૂર્ણ code:

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

આ ઉદાહરણમાં, `Text` view ને અર્ધપારદર્શક સફેદ background અને rounded corners મળ્યા છે. `Button` `.borderedProminent` style વાપરે છે, અને `VStack` માટે background image રાખવામાં આવી છે.

વધારાની નોંધ: `background()` modifier image background સાથે કામ કરતી વખતે, સામાન્ય રીતે હાલના view માટે ઉપલબ્ધ layout વિસ્તાર ભરવાનો પ્રયત્ન કરે છે. ઘણી પરિસ્થિતિઓમાં તે સ્વાભાવિક રીતે safe area સુધી લંબાઈ શકે છે.

હવે આપણે કહેવતોનું carousel view તૈયાર કરી લીધું છે.

![SwiftUI View](../../RESOURCE/011_word.png)

## સારાંશ

આ પાઠમાં આપણે શીખ્યું કે કેવી રીતે array નો ઉપયોગ કરીને ઘણી કહેવતો save કરવી અને `if` તેમજ `if-else` statements દ્વારા carousel effect બનાવવું.

અમે array ની basic operations પણ સમજ્યા, જેમ કે add, remove, modify, અને index out of range ટાળવાની રીત.

આ પાઠ ફક્ત કહેવતોનું carousel બનાવવા પૂરતો નથી, પરંતુ data handle કરવું અને program flow નિયંત્રિત કરવું જેવી મહત્વપૂર્ણ ક્ષમતાઓનું પણ આધાર આપે છે.

## વિસ્તૃત જ્ઞાન - બહુવિધ condition માટે `if-else if-else`

actual development માં ઘણી વાર બે કરતાં વધારે conditions હેન્ડલ કરવાની જરૂર પડે છે. ઉદાહરણ તરીકે, કોઈ game માં score `1` હોય ત્યારે event A, `2` હોય ત્યારે event B, `3` હોય ત્યારે event C, આ રીતે.

જ્યારે બે કરતાં વધારે condition branches હોય, ત્યારે `if-else if-else` statement વપરાય છે.

મૂળભૂત syntax:

```swift
if conditionA {
    // conditionA true હોય ત્યારે ચાલતો code
} else if conditionB {
    // conditionB true હોય ત્યારે ચાલતો code
} else if conditionC {
    // conditionC true હોય ત્યારે ચાલતો code
} else {
    // કોઈ condition સાચી ન હોય ત્યારે ચાલતો code
}
```

આ સ્થિતિમાં program એક પછી એક conditions ચકાસે છે અને પહેલી સાચી condition માટેનો code ચલાવે છે. જો કોઈ પણ condition સાચી ન હોય, તો `else` ભાગ ચાલે છે.

કહેવતોના carousel માં પણ `if-else if-else` નો ઉપયોગ આવી રીતે થઈ શકે:

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

જ્યારે `index` `0`, `1`, `2`, `3` હોય, ત્યારે click પર `index += 1` થાય છે; જ્યારે `index` `4` હોય, ત્યારે તે `0` પર reset થાય છે અને loop ચાલે છે.

`else` branch fallback તરીકે છે, જેથી જો `index` કોઈ કારણસર ગેરકાયદે value પર પહોંચી જાય, તો પણ તેને `0` પર reset કરી શકાય.

અહીં `==` નો અર્થ “બરાબર છે કે નહીં” એવી સરખામણી કરવી. જો `if` માં `index` અને કોઈ સંખ્યા સરખી હોય, તો પરિણામ `true` બને છે અને તે code block ચાલે છે.

આ પ્રકારનું multi-condition control જુદી જુદી પરિસ્થિતિમાં જુદા code ચલાવવા માટે બહુ ઉપયોગી છે.
