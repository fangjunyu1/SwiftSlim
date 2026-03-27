# बटन को काम करने दें

इस पाठ में हम मुख्य रूप से `Button`, `print` से debug information output करना, और Swift functions सीखेंगे।

ये सामग्री SwiftUI interaction programming की बुनियाद है।

## बटन

बटन सबसे सामान्य UI controls में से एक है। जब हमें download, open, exit जैसी operations करनी होती हैं, तो हम आम तौर पर बटन पर click करते हैं।

उदाहरण के लिए, App Store में App डाउनलोड करने के लिए "Get" बटन पर क्लिक किया जाता है।

![Button](../../RESOURCE/008_button.png)

SwiftUI में, बटन को `Button` से दर्शाया जाता है।

मूल उपयोग:

```swift
Button("") {
    
}
```

इसकी संरचना को दो भागों में बाँटा जा सकता है:

```swift
Button("बटन का टेक्स्ट") {
    बटन क्लिक होने पर चलने वाला code
}
```

उदाहरण:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

run करने के बाद एक `Start` बटन दिखेगा।

![Button](../../RESOURCE/008_button1.png)

जब user बटन पर click करता है, तो `{}` के अंदर का code execute होता है।

ध्यान देने योग्य बात: `Button` SwiftUI का interface control (`View`) है, इसलिए इसे `body` के भीतर ही लिखना होगा।

### `buttonStyle` modifier

SwiftUI में, `Button` system-built-in button styles प्रदान करता है, जिन्हें `buttonStyle` modifier से उपयोग किया जा सकता है।

उदाहरण:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system द्वारा प्रदान की गई button style का उपयोग करेगा।

सामान्य options में शामिल हैं:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

अलग-अलग styles का मुख्य अंतर यह होता है कि बटन में border है या नहीं, background है या नहीं, और visual emphasis कितनी है।

## `print` output

programming में अक्सर यह देखना होता है कि program किसी विशेष code block तक पहुँचा है या नहीं।

Swift debugging information output करने के लिए `print` function प्रदान करता है।

मूल syntax:

```swift
print("Hello")
```

यह line text को `Console` में output करेगी।

### बटन की usability जांचना

हम `print` को बटन के अंदर लिखकर यह test कर सकते हैं कि बटन click हुआ या नहीं।

```swift
Button("Start") {
    print("Test 123")
}
```

जब बटन click होगा, तो `Console` में output होगा:

```
Test 123
```

इसका अर्थ है कि बटन सफलतापूर्वक trigger हो गया।

![Button](../../RESOURCE/008_button3.png)

ध्यान दें: `print` Swift code है, interface control नहीं। इसे सीधे `body` में नहीं रखा जा सकता, वरना error आएगी।

उदाहरण के लिए, नीचे का code गलत है:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Error: body must return a View
    }
}
```

SwiftUI में, `body` interface structure को describe करने के लिए होता है, इसलिए इसमें केवल interface controls (`View`) ही रखे जा सकते हैं, जैसे `Text`、`Button`、`Image` आदि।

सामान्य code (calculation logic, `print` आदि) को बटन, function या अन्य event handler के अंदर रखना चाहिए।

### `Console`

`print` का output Xcode के `Console` में दिखाई देगा।

यदि `Console` दिखाई नहीं दे रहा, तो नीचे दाईं ओर `Show the Debug Area` बटन से debug area खोलें, फिर `Show the Console` बटन पर क्लिक करके console दिखाएँ।

![](../../RESOURCE/008_button4.png)

`Console` के नीचे बाईं ओर दो labels होते हैं: `Executable` और `Previews`।

![](../../RESOURCE/008_button5.png)

ये दोनों labels अलग-अलग runtime environments के अनुरूप हैं: जब `Canvas` preview में run करते हैं, तो `print` output `Previews` label के नीचे दिखेगा; यदि simulator या real device पर app run करते हैं, तो output `Executable` label के नीचे दिखेगा।

इसलिए, जब आपको लगे कि `print` output नहीं हुआ, तो पहले यह पुष्टि करें कि आपने सही label चुना है।

## उदाहरण - ASCII character art

कुछ code projects में अक्सर ASCII character art दिखाई देती है।

character art सामान्य characters से बनाई गई आकृति होती है, उदाहरण:

![ASCII](../../RESOURCE/008_ascii.png)

हम बटन + `print` का उपयोग करके एक ASCII character art output कर सकते हैं।

उदाहरण code:

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

जब बटन क्लिक किया जाएगा, तो `Console` output करेगा:

```
 /\_/\
( o.o )
 > ^ <
```

ध्यान दें: string के भीतर `\` को `\\` लिखना पड़ता है, क्योंकि backslash string में escape character है।

## functions

हम बटन के अंदर सीधे code लिख सकते हैं।

उदाहरण:

```swift
Button("Start") {
    print("Hello")
}
```

यदि code कम है, तो इस तरह लिखना ठीक है। लेकिन वास्तविक development में, एक बटन द्वारा trigger की जाने वाली logic काफी बड़ी हो सकती है।

उदाहरण:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // शायद और भी बहुत code हो
}
```

यदि code लगातार बढ़ता जाए, तो उसे सीधे बटन के अंदर लिखने से interface code बहुत messy हो जाएगा, और पढ़ना या maintain करना कठिन होगा।

इसलिए, हम आम तौर पर ऐसे code को एक function में organize करते हैं, और फिर बटन में उस function को call करते हैं।

### function क्या है

function एक code block है जिसे बार-बार उपयोग किया जा सकता है।

जब किसी code को execute करना हो, तो हमें केवल उस function को call करना होता है, और function के भीतर का code चल जाएगा।

इससे code structure अधिक साफ़ बनता है, और reuse भी आसान हो जाता है।

### मूल syntax

Swift में, function को `func` keyword से define किया जाता है:

```swift
func randomInt() {
    // code
}
```

यह code एक function define करता है।

`randomInt` function का नाम है, जो इस code block की पहचान करता है।

`()` parameter की position है, जहाँ बाहरी data receive की जा सकती है। यदि data की आवश्यकता न हो, तो इसे खाली रखा जा सकता है।

`{}` के भीतर function का code area होता है, जहाँ वह सब code लिखा जाता है जिसे execute करना है।

उदाहरण:

```swift
func getName() {
    print("FangJunyu")
}
```

इस function का काम एक line text output करना है।

### function को call करना

function define करना केवल उस code block को बनाना है। यदि उसे execute करना है, तो function को call करना होगा।

call करने का तरीका है function के नाम के बाद `()` लगाना:

```swift
getName()
```

जब program इस line तक पहुँचेगा, तो `getName` function का code execute होगा।

पूर्ण उदाहरण:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

run करने के बाद, `Console` output करेगा:

```
FangJunyu
```

### SwiftUI में function का उपयोग

SwiftUI view में function सामान्यतः `body` के बाहर लिखी जाती है।

उदाहरण:

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

जब बटन click होगा, तो `getName()` function call होगा।

इससे interface code concise रहता है, और specific logic function के भीतर handle होती है।

### function parameters

कभी-कभी एक function को अलग-अलग data के आधार पर अलग operation करनी होती है।

उदाहरण के लिए, हम चाहते हैं कि function अलग-अलग नाम output करे, न कि केवल fixed `"FangJunyu"`।

उस समय parameters का उपयोग किया जा सकता है। parameter को ऐसे समझें: function call करते समय दी गई data।

उदाहरण:

```swift
func getName(name: String) {
    print(name)
}
```

इस function में एक नया parameter जोड़ा गया है। `name` parameter का नाम है, और `String` उसका type है。

इसका अर्थ है कि function को एक `String` type की data receive करनी होगी।

क्योंकि function को अब data की आवश्यकता है, इसलिए call करते समय यह data देना अनिवार्य है।

```swift
getName(name: "Sam")
```

जब call के समय `"Sam"` pass किया जाता है, तो function के भीतर वही value output होती है।

run result:

```
Sam
```

## उदाहरण - function का उपयोग करके ASCII character art output करना

पिछले उदाहरण में, हमने `print` को सीधे बटन के भीतर लिखा था।

लेकिन यदि character art अधिक complex हो, तो code बहुत लंबा हो जाएगा। उस समय logic को function में रखना बेहतर है, ताकि interface code अधिक साफ़ रहे।

उदाहरण code:

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

run करने के बाद बटन click करें, `Console` output करेगा:

```
 /\_/\
( o.o )
 > ^ <
```

यहाँ दो चीज़ें होती हैं, जब user बटन click करता है:

1. बटन `printCat()` function को call करता है
2. function के भीतर का `print` code execute होता है

इससे interface code केवल event trigger करने की जिम्मेदारी निभाता है, जबकि specific logic function में handle होती है।

वास्तविक development में, अधिकांश बटन operations functions के माध्यम से ही implement किए जाते हैं।

## सारांश

इस पाठ में हमने तीन महत्वपूर्ण चीज़ें सीखीं:

**1. `Button`**

`Button` SwiftUI में action trigger करने वाला control है।

```swift
Button("Start") {

}
```

जब user बटन click करता है, तो braces के भीतर का code execute होता है।

**2. `print` output**

`print` का उपयोग `Console` में debug information output करने के लिए किया जाता है।

```swift
print("Hello")
```

developers `Console` के माध्यम से program की running state देख सकते हैं।

**3. function**

function एक reusable code block है।

```swift
func sayHello() {
    print("Hello")
}
```

function call करना:

```swift
sayHello()
```

यदि function को data चाहिए, तो parameter का उपयोग किया जा सकता है:

```swift
func sayHello(name: String) {
    print(name)
}
```

आगे के पाठों में हम और अधिक SwiftUI controls तथा data और interface के interaction को सीखेंगे।

## अभ्यास

नीचे दिए गए अभ्यास पूरे करने की कोशिश करें:

1. एक बटन बनाइए, जिसका text `"Hello"` हो
2. बटन click होने पर `Console` में `Hello Swift` output करें
3. output code को एक function में लिखें, और फिर बटन के भीतर उस function को call करें
