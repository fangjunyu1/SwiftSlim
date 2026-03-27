# மேற்கோள் சுழற்சி

இந்தப் பாடத்தில், நாம் ஒரு "மேற்கோள் சுழற்சி" அம்சத்தை உருவாக்கப் போகிறோம். அதே நேரத்தில் Array மற்றும் if-else போன்ற Swift அடிப்படை அறிவுகளையும் ஆழமாகக் கற்போம்.

பல மேற்கோள்களை எவ்வாறு சேமிப்பது, மேலும் Button interaction மூலம் அவற்றை எவ்வாறு சுற்றிச் சுற்றி காட்டுவது என்பதையும் பார்க்கப் போகிறோம்.

![alt text](../../RESOURCE/011_word.png)

## மேற்கோளை காட்டுதல்

முதலில், SwiftUI-ல் ஒரு மேற்கோளை காட்ட வேண்டும்.

அதற்கான எளிய வழி Text view-ஐ பயன்படுத்துவது:

```swift
Text("Slow progress is still progress.")
```

இந்த code ஒரு நிலையான மேற்கோளை மட்டும் காட்டும். பல மேற்கோள்களை காட்டி, அவற்றை மாறுமாறு செய்ய வேண்டுமெனில், அவற்றை முன்பே சேமித்து வைக்க வேண்டும்.

ஆனால், சாதாரண string variable ஒன்று ஒரு மேற்கோளை மட்டும் சேமிக்க முடியும்:

```swift
let sayings = "Slow progress is still progress."
```

பல மேற்கோள்களை சேமிக்க வேண்டுமானால், ஒவ்வொரு மேற்கோளுக்கும் தனித்தனி variable அறிவிக்க வேண்டும்:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

ஆனால் நடைமுறை development-இல், இந்த முறை சிரமமானதும்கூட; மேலும் ஒவ்வொரு variable-மும் தனித்தனியாக இருப்பதால், நெகிழ்வான சுழற்சி மாற்றத்தை உருவாக்க முடியாது.

பல மேற்கோள்களை சுலபமாக நிர்வகிக்க, அவற்றை ஒன்றாகச் சேமிக்கும் ஒரு data structure தேவை. அதுவே Array.

Array பயன்படுத்திய பிறகு, மேலுள்ள code இவ்வாறு மாற்றப்படலாம்:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**குறிப்பு: programming convention-இல், பல elements-ஐ கொண்ட array variable-களுக்கு பொதுவாக plural பெயர் பயன்படுத்தப்படும். உதாரணமாக sayings. இது அது ஒரு collection என்பதை தெளிவாக காட்டுகிறது.**

## Array

Swift-இல், Array என்பது ஒழுங்காக அமைந்த elements-ஐ சேமிக்கும் collection ஆகும். இது square brackets [] மூலம் குறிக்கப்படுகிறது.

```swift
[]
```

ஒரு array-இன் உள்ளே ஒரே type-ஐச் சேர்ந்த பல elements இருக்கலாம். அவை elements ஒன்றுக்கொன்று English comma , மூலம் பிரிக்கப்படுகின்றன.

உதாரணமாக:

```swift
[101, 102, 103, 104, 105]
```

ஒரு array-ஐ எளிமையாக ஒரு ரயிலாகக் கருதலாம்:

![Array](../../RESOURCE/011_array1.png)

முழு ரயிலும் array object-ஐ குறிக்கிறது. ஒவ்வொரு பெட்டியும் வரிசைப்படி அமைந்திருக்கும்.

### Index மற்றும் element access

Array ஒழுங்காக அமைந்ததால், system அதில் உள்ள குறிப்பிட்ட element-ஐ அதன் வரிசை அடிப்படையில் கண்டுபிடிக்க முடியும். இந்த locating mechanism-ஐ Index என்று அழைக்கின்றனர்.

Swift-இல் (மேலும் பெரும்பாலான programming languages-இல்), array index 0-இல் இருந்து துவங்குகிறது; 1-இல் இருந்து அல்ல. அதாவது, array-இன் முதல் element-ன் index 0, இரண்டாவது element-ன் index 1, இதேபோல் தொடர்ந்து செல்லும்.

![Array](../../RESOURCE/011_array2.png)

Array-இல் குறிப்பிட்ட element-ஐ அணுக, array பெயருக்குப் பிறகு square brackets சேர்த்து, அதன் உள்ளே தேவையான index value-ஐ எழுதினால் போதும்.

உதாரணமாக:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Array-இன் செல்லுபடியாகும் வரம்பை மீறிய index-ஐ அணுக முயன்றால், “Index Out of Range” எனப்படும் பிரச்சினை ஏற்படும். ஆகவே array-ஐ அணுகும்போது, index செல்லுபடியாகும் வரம்புக்குள் உள்ளதா என்பதை கவனிக்க வேண்டும்.

**Index Out of Range**

உதாரணமாக, array-இல் 5 elements இருந்தால், செல்லுபடியாகும் index வரம்பு 0 முதல் 4 வரை இருக்கும். நாம் sayings[5] என்பதை அணுக முயன்றால், program அதற்கான “ரயில் பெட்டி”யை கண்டுபிடிக்க முடியாது. இதனால் “index out of range” பிழை ஏற்பட்டு, app crash ஆகும்.

![Array](../../RESOURCE/011_array3.png)

### Array-ஐ இயக்குவது

Array-ஐ நிலையான முறையில் மட்டுமல்லாமல், element சேர்த்தல், நீக்கல், மாற்றல் போன்ற செயல்களுக்கும் பயன்படுத்தலாம். மேலும் array-இன் length-ஐயும் அறியலாம்.

குறிப்பு: array-ஐ மாற்ற வேண்டுமெனில், அது let constant ஆக இல்லாமல் var variable ஆக அறிவிக்கப்பட வேண்டும்.

**1. புதிய element சேர்த்தல்**

append method மூலம் array-இன் முடிவில் ஒரு புதிய element சேர்க்கலாம்:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. element நீக்கல்**

remove(at:) method மூலம், array-இல் குறிப்பிட்ட இடத்திலுள்ள element-ஐ நீக்கலாம்:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. element மாற்றல்**

Index-ஐ நேரடியாகப் பயன்படுத்தி element value-ஐ மாற்றலாம்:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. array length கணக்கிடுதல்**

count property மூலம் array-இல் உள்ள element எண்ணிக்கையை பெறலாம்:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Array பயன்படுத்தி மேற்கோளை காட்டுதல்

பல மேற்கோள்களை காட்ட, அவற்றை array-இல் சேமித்து, பின்னர் index மூலம் குறிப்பிட்ட மேற்கோளை வாசித்து காட்டலாம்.

முதலில், ContentView-இல் sayings என்ற array உருவாக்கி, அதில் மேற்கோள்களை சேமிக்கிறோம். பின்னர் Text view-இல் index மூலம் அதை வாசித்து காட்டலாம்:

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

இங்கு sayings[0] என்பது array-இன் முதல் மேற்கோளை குறிக்கிறது.

வேறு மேற்கோளை காட்ட வேண்டும் என்றால், square brackets உள்ளே இருக்கும் index-ஐ மாற்றினால் போதும்:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### மேற்கோளின் index-ஐ வரையறுத்தல்

மேற்கோளை dynamic ஆக மாற்ற வேண்டுமெனில், Text view-இல் index-ஐ நேரடியாக “hard code” செய்து எழுத முடியாது.

தற்போது எந்த மேற்கோள் காட்டப்படுகிறது என்பதை தனியாகச் சேமிக்க ஒரு variable தேவை.

SwiftUI-இல், நாம் @State பயன்படுத்தி ஒரு mutable index-ஐ அறிவிக்கலாம்:

```swift
@State private var index = 0
```

SwiftUI, @State-ஆல் wrap செய்யப்பட்ட variable-களை கண்காணிக்கும். index மாறும்போது, SwiftUI view-ஐ மறுபடியும் render செய்து, அதற்கேற்ற மேற்கோளை காட்டும்.

அடுத்து, sayings[index] பயன்படுத்தி array-இல் இருக்கும் மேற்கோளை dynamic ஆகப் பெறலாம்:

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

index value மாறும்போது, Text view வேறு மேற்கோளை காட்டும்.

### Button பயன்படுத்தி index-ஐ கட்டுப்படுத்துதல்

மேற்கோளை மாற்ற, Button மூலம் index value-ஐ மாற்றலாம். ஒவ்வொரு முறை Button அழுத்தப்படும் போது, index 1-ஆல் அதிகரிக்கும்:

```swift
Button("Next") {
    index += 1
}
```

Button அழுத்தப்பட்டதும், index 0-இல் இருந்து 1 ஆக மாறும். இதனால் view refresh ஆகும், Text(sayings[index]) அடுத்த மேற்கோளை வாசித்து காட்டும்.

ஆனால் இங்கு ஒரு மறைந்த பிரச்சினை உள்ளது: Button-ஐ தொடர்ந்து அழுத்தினால், index array வரம்பை மீறும் அளவுக்கு அதிகரிக்கலாம். இது array index out of range பிழையை ஏற்படுத்தும். உதாரணமாக, index 5 ஆகும்போது (array index range 0 முதல் 4 வரை), program crash ஆகும்.

இந்த array index out of range பிரச்சினையைத் தவிர்க்க, index array வரம்பை மீறாமல் இருக்க condition control தேவை. இதற்கு if-else statement பயன்படுத்தி, index array length-ஐ விட குறைவாக உள்ளதா என்பதைச் சரிபார்க்கலாம்.

## நிபந்தனை கட்டுப்பாடு: if-else statement

if-else statement என்பது Swift-இல் அதிகம் பயன்படுத்தப்படும் conditional branching statement ஆகும். இது ஒரு condition உண்மையா என்பதைச் சரிபார்த்து, அதன் அடிப்படையில் வேறு code blocks-ஐ இயக்க உதவுகிறது.

அடிப்படை அமைப்பு:

```swift
if condition {
    // condition true ஆக இருந்தால் இயங்கும் code
} else {
    // condition false ஆக இருந்தால் இயங்கும் code
}
```

if statement-இல் உள்ள condition என்பது Bool type-இன் value ஆகும்; அதாவது true அல்லது false. Condition true ஆக இருந்தால் if பகுதி இயங்கும்; இல்லையெனில் else பகுதி இயங்கும்.

உதாரணமாக:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

இந்த எடுத்துக்காட்டில், age value 25 ஆகும். if statement, age > 18 உண்மையா என்று பார்க்கிறது. அது true என்பதால் "Big Boy" output ஆகும்.

else பகுதி தேவையில்லையெனில், அதை விடுத்துவிடலாம்:

```swift
if condition {
    // condition true ஆக இருந்தால் இயங்கும் code
}
```

### Condition பயன்படுத்தி index range-ஐ கட்டுப்படுத்துதல்

Array index out of range ஏற்படாமல் தடுக்க, if statement மூலம் index array வரம்பை மீறாமல் இருக்கலாம்:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logic analysis: sayings.count value 5 ஆகும் (மொத்தம் 5 மேற்கோள்கள் இருப்பதால்). ஆகவே sayings.count - 1 value 4, அதுவே array-இன் கடைசி செல்லுபடியாகும் index.

index, 4-ஐ விட குறைவாக இருக்கும்போது, Button அழுத்தி index += 1 செய்வது பாதுகாப்பானது. index 4-ஐ அடைந்த பிறகு, condition உண்மையில்லை; அதனால் Button அழுத்தினாலும் மாற்றம் எதுவும் நடைபெறாது.

இப்போது, code ஏற்கனவே மேற்கோள் மாற்றும் அம்சத்தைச் செயல்படுத்துகிறது:

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

### மேற்கோளை சுழற்சியில் காட்டுதல்

கடைசி மேற்கோளை காட்டிய பிறகு Button அழுத்தும் போது மீண்டும் முதல் மேற்கோளிலிருந்து தொடங்க வேண்டுமெனில், அதாவது loop display செய்ய வேண்டுமெனில், else பகுதியைப் பயன்படுத்தலாம்:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Button அழுத்தப்படும் போது, index array-இன் கடைசி element-ஐ அடைந்திருந்தால், அது மீண்டும் 0 ஆக reset செய்யப்படும். இதனால் மேற்கோள் மறுபடியும் முதல் இடத்திலிருந்து சுற்றி வரும்.

## மேற்கோள் view-ஐ மேம்படுத்துதல்

இப்போது, மேற்கோள் சுழற்சியின் logic ஏற்கனவே தயாராகிவிட்டது. ஆனால் UI-ஐ இன்னும் அழகாக மாற்றலாம்.

முழு code:

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

இந்த எடுத்துக்காட்டில், Text view-க்கு வெள்ளை semi-transparent background மற்றும் rounded corners கொடுக்கப்பட்டுள்ளது. Button-க்கு .borderedProminent style பயன்படுத்தப்பட்டுள்ளது. VStack-க்கு background image அமைக்கப்பட்டுள்ளது.

கூடுதல் அறிவு: background() modifier-ஐ பயன்படுத்தி image background அமைக்கும் போது, அதன் இயல்பான செயல் current view இருக்கும் layout area-ஐ முடிந்தவரை நிரப்புவதாகும். பல சந்தர்ப்பங்களில், அது safe area வரை இயல்பாக விரிந்து காணப்படும்.

இப்போது, மேற்கோள் சுழற்சி view உருவாகிவிட்டது.

![SwiftUI View](../../RESOURCE/011_word.png)

## சுருக்கம்

இந்தப் பாடத்தின் மூலம், பல மேற்கோள்களை array-இல் சேமித்து, if மற்றும் if-else statements மூலம் மேற்கோள் சுழற்சியை எவ்வாறு உருவாக்குவது என்பதை கற்றுக் கொண்டோம்.

மேலும், array-இன் அடிப்படை operations ஆகிய element சேர்த்தல், நீக்கல், மாற்றல் மற்றும் array index out of range-ஐத் தவிர்ப்பது பற்றியும் அறிந்துகொண்டோம்.

இந்தப் பாடம் மேற்கோள் சுழற்சியின் implementation மட்டும் அல்லாமல், arrays மற்றும் conditional statements ஆகியவற்றின் அடிப்படை பயன்பாட்டையும் சேர்த்து விளக்குகிறது. இதன் மூலம் data-ஐ கையாளும் திறனும், program flow-ஐ கட்டுப்படுத்தும் திறனும் வளர்க்கப்படுகிறது.

## விரிவான அறிவு - பல நிபந்தனை தீர்மானம்: if-else if-else statement

நடைமுறை development-இல், பல நிபந்தனைகளை கையாள வேண்டிய சூழல் அடிக்கடி வரும். உதாரணமாக, ஒரு game-இல் score 1 என்றால் event A, 2 என்றால் event B, 3 என்றால் event C என்று வேறு வேறு செயல்கள் இயக்கப்படலாம்.

இரண்டு condition-களை விட அதிகமான branching தேவைப்படும் சூழலில், if-else if-else statement பயன்படுத்த வேண்டும்.

அடிப்படை syntax:

```swift
if conditionA {
    // conditionA true ஆக இருந்தால் இயங்கும் code
} else if conditionB {
    // conditionB true ஆக இருந்தால் இயங்கும் code
} else if conditionC {
    // conditionC true ஆக இருந்தால் இயங்கும் code
} else {
    // எந்த condition-மும் true அல்லாதபோது இயங்கும் code
}
```

இந்த நிலையில், program condition-களை வரிசையாகச் சரிபார்த்து, முதல் true condition-ஐ கண்டவுடன் அதற்குரிய code-ஐ இயக்கும். எந்த condition-மும் true ஆக இல்லையெனில், else பகுதி இயங்கும்.

மேற்கோள் சுழற்சியிலும், if-else if-else statement பயன்படுத்தி பல condition-களைச் சரிபார்க்கலாம்:

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

index value 0, 1, 2, 3 ஆக இருக்கும் போது, ஒவ்வொரு Button click-க்கும் index += 1 செய்யப்படும். index value 4 ஆக இருக்கும் போது (அதாவது கடைசி element), index மீண்டும் 0 ஆக reset செய்யப்படும். இதனால் loop உருவாகிறது.

else branch என்பது ஒரு fallback ஆக செயல்படுகிறது. அதாவது, index தவறாக மாற்றப்பட்டு சட்டவிரோதமான value-ஐ எடுத்திருந்தாலும், அதை மீண்டும் 0 ஆக reset செய்ய முடியும்.

கவனிக்க வேண்டியது என்னவென்றால், இங்கு பயன்படுத்தப்பட்ட == என்பது "சமமா?" என்பதைக் கேட்கும் equality comparison operator ஆகும். if statement-இல் index ஒரு குறிப்பிட்ட எண்ணிற்கு சமமாக இருந்தால், அது true return செய்து, அதற்குரிய code block இயங்கும். சமமாக இல்லையெனில், அடுத்த if statement-க்கு செல்கிறது.

இந்த வகையான multiple condition checking, வேறு வேறு சூழல்களில் வேறு வேறு code-ஐ இயக்க மிகவும் உதவிகரமாக இருக்கும்.
