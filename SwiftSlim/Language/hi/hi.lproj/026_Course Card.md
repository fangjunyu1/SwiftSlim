# कोर्स कार्ड

यह पाठ एक चरणबद्ध पुनरावृत्ति पाठ है। हम एक “कोर्स कार्ड” पूरा करेंगे।

इस अभ्यास के माध्यम से, हम पहले सीखे गए `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` आदि को दोहरा सकते हैं, और सीख सकते हैं कि कई छोटे views को मिलाकर एक पूरा view module कैसे बनाया जाता है।

कोर्स कार्ड का प्रभाव:

![view](../../../Resource/026_view.png)

यह कोर्स कार्ड मुख्य रूप से कुछ भागों से बना है:

- कोर्स स्तर: `Beginner`
- कोर्स सामग्री: `20+ Lessons`
- कोर्स शीर्षक: `SwiftUI Beginner Tutorial`
- कोर्स विवरण
- बटन: `Start Learning`
- कोर्स पृष्ठभूमि: Swift आइकन और indigo रंग की पृष्ठभूमि

हम इस view को `ContentView` में पूरा कर सकते हैं।

## शीर्ष क्षेत्र

सबसे पहले, कोर्स कार्ड का शीर्ष क्षेत्र बनाते हैं।

![view](../../../Resource/026_view1.png)

शीर्ष क्षेत्र के बाईं ओर कोर्स स्तर दिखता है, और दाईं ओर कोर्स सामग्री दिखती है।

क्योंकि ये दोनों सामग्री क्षैतिज रूप से व्यवस्थित हैं, इसलिए `HStack` का उपयोग किया जा सकता है।

```swift
var topView: some View {
    HStack {
        Text("शुरुआती")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ पाठ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

यहाँ हमने शीर्ष क्षेत्र को एक computed property में अलग कर दिया है:

```swift
var topView: some View
```

ऐसा करने का लाभ यह है कि `body` अधिक स्पष्ट हो जाता है।

शीर्ष क्षेत्र में मुख्य रूप से ये सामग्री उपयोग की गई है:

- `HStack`: दो texts को क्षैतिज रूप से व्यवस्थित करता है।
- `Text`: पाठ सामग्री दिखाता है।
- `Spacer()`: बाएँ text को बाईं ओर और दाएँ text को दाईं ओर धकेलता है।
- `.font(.footnote)`: छोटा text style सेट करता है।
- `.fontWeight(.bold)`: text को bold सेट करता है।
- `.foregroundStyle(Color.white)`: foreground color को सफेद सेट करता है।
- `.padding(.vertical, 10)`: ऊपर और नीचे की padding सेट करता है।
- `.padding(.horizontal, 16)`: बाएँ और दाएँ की padding सेट करता है।
- `.background(Color.white.opacity(0.15))`: अर्ध-पारदर्शी सफेद background सेट करता है।
- `.cornerRadius(20)`: corner radius सेट करता है।

यहाँ `Beginner` ने दो दिशाओं की `.padding()` का उपयोग किया है:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

इससे text के ऊपर-नीचे और बाएँ-दाएँ दोनों तरफ जगह मिलती है, और यह एक label जैसा दिखता है।

`Color.white.opacity(0.15)` का अर्थ है `15%` opacity वाला सफेद, यानी बहुत हल्का सफेद।

### कार्ड background जोड़ना

पहले हमने `topView` बनाया, लेकिन केवल view बनाने से वह अपने आप display नहीं होगा।

SwiftUI में, interface पर सच में दिखने वाली सामग्री को `body` में लिखना होता है।

इसलिए, पहले `topView` को `body` में रखकर दिखाया जा सकता है:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

अब आप देखेंगे कि शीर्ष क्षेत्र दिखने लगा है:

![view](../../../Resource/026_view2.png)

लेकिन क्योंकि `topView` में text सफेद है, और default background भी हल्का है, इसलिए light mode में यह स्पष्ट नहीं दिख सकता।

इसलिए, हम बाहरी layer में एक `VStack` जोड़ सकते हैं, फिर पूरे क्षेत्र के लिए padding, background color और corner radius सेट कर सकते हैं:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Display effect:

![view](../../../Resource/026_view3.png)

यहाँ `VStack` में अभी केवल एक `topView` रखा गया है, इसलिए यह अनिवार्य नहीं लगता।

लेकिन आगे हम कोर्स शीर्षक, कोर्स विवरण और बटन क्षेत्र भी जोड़ेंगे। वे सभी ऊपर-नीचे व्यवस्थित सामग्री हैं, इसलिए यहाँ पहले से `VStack` का उपयोग करने से बाद में views को संयोजित करना आसान होगा।

यहाँ दो `.padding()` हैं, और इनके कार्य अलग-अलग हैं।

पहला `.padding(20)` `.background()` से पहले लिखा गया है:

```swift
.padding(20)
.background(Color.indigo)
```

यह कार्ड के अंदर की padding नियंत्रित करता है, यानी content और background किनारे के बीच की दूरी।

दूसरा `.padding(30)` `.background()` के बाद लिखा गया है:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

यह कार्ड के बाहर की padding नियंत्रित करता है, यानी पूरे कार्ड और screen edge के बीच की दूरी।

![view](../../../Resource/026_view4.png)

इसलिए, वही `.padding()` अलग-अलग स्थानों पर लिखने से प्रभाव भी अलग होगा।

## सामग्री क्षेत्र

अब कोर्स कार्ड का सामग्री क्षेत्र बनाते हैं।

Display effect:

![view](../../../Resource/026_view5.png)

सामग्री क्षेत्र में कोर्स शीर्षक और कोर्स विवरण शामिल हैं। वे ऊपर-नीचे व्यवस्थित हैं, इसलिए `VStack` का उपयोग करें।

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI शुरुआती ट्यूटोरियल")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI से शून्य से शुरुआत करें और Apple के declarative UI development को व्यवस्थित रूप से सीखें। स्पष्ट व्याख्या और practical examples के माध्यम से, आप धीरे-धीरे layout, interaction और state management में महारत हासिल करेंगे, ताकि सुंदर और उपयोगी app interfaces बना सकें।")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Display effect:

![view](../../../Resource/026_view6.png)

यहाँ `VStack` में दो parameters का उपयोग किया गया है:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` का अर्थ है `VStack` के अंदर के views को बाईं ओर align करना।

`spacing: 10` का अर्थ है `VStack` के अंदर views के बीच `10 pt` की दूरी रखना।

इसलिए, कोर्स शीर्षक और कोर्स विवरण बाईं ओर से व्यवस्थित होंगे, और उनके बीच कुछ दूरी रहेगी।

कोर्स विवरण काफ़ी लंबा है। यदि पूरा दिखाया जाए, तो कार्ड बहुत ऊँचा हो जाएगा। इसलिए यहाँ `.lineLimit()` से प्रदर्शित पंक्तियों की संख्या सीमित की गई है:

```swift
.lineLimit(3)
```

इसका अर्थ है अधिकतम `3` पंक्तियाँ दिखाना। जब content इस सीमा से अधिक होगा, तो अतिरिक्त भाग omitted हो जाएगा।

### View को बाईं ओर align करना

यहाँ एक और बात ध्यान देने योग्य है।

`VStack(alignment: .leading)` केवल `VStack` के अंदर views की alignment नियंत्रित कर सकता है। यह सीधे `VStack` को बाहरी container में कहाँ रखना है, इसे नियंत्रित नहीं करता।

उदाहरण के लिए, यदि कोर्स विवरण छोटा है:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI शुरुआती ट्यूटोरियल")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("कुछ सामग्री।")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Display effect:

![view](../../../Resource/026_view7.png)

आप देख सकते हैं कि कोर्स शीर्षक और कोर्स विवरण `VStack` के अंदर तो left-aligned हैं, लेकिन पूरा `VStack` कार्ड के सबसे बाएँ किनारे तक नहीं गया है।

ऐसा इसलिए है क्योंकि जब content छोटा होता है, तो `VStack` की width भी छोटी हो जाती है। बाहरी container layout करते समय इस संकरे `VStack` को बीच में रख सकता है।

इसे ऐसे समझ सकते हैं: `VStack(alignment: .leading)` अंदरूनी left alignment के लिए जिम्मेदार है।
लेकिन यह पूरे content area को सबसे बाईं ओर धकेलने के लिए जिम्मेदार नहीं है।

यदि आप चाहते हैं कि पूरा content area सच में बाईं ओर लगे, तो बाहर एक और `HStack` wrap कर सकते हैं और `Spacer()` जोड़ सकते हैं:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI शुरुआती ट्यूटोरियल")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("कुछ सामग्री।")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Display effect:

![view](../../../Resource/026_view8.png)

यहाँ `HStack` horizontal layout है।

`Spacer()` दाईं ओर की बाकी जगह ले लेता है, जिससे बाईं ओर वाला `VStack` सबसे बाईं ओर धकेल दिया जाता है।

इसलिए, `HStack + Spacer()` का उपयोग पूरे content area की position नियंत्रित करने के लिए किया जा सकता है।

वास्तविक कोर्स कार्ड में, कोर्स विवरण लंबा है और आमतौर पर अधिक width लेता है, इसलिए यह समस्या ज़रूरी नहीं कि स्पष्ट हो। लेकिन इस अंतर को समझना महत्वपूर्ण है, क्योंकि आगे short text layout बनाते समय अक्सर ऐसी स्थिति मिलेगी।

### अंदरूनी views के बीच की दूरी नियंत्रित करना

पहले हमने `VStack` में `spacing: 10` लिखा था:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` अंदरूनी views के बीच की दूरी नियंत्रित करता है।

यदि `spacing` सेट नहीं किया जाता, तो `VStack` में default spacing भी होती है, लेकिन default spacing हमेशा हमारे इच्छित effect के अनुरूप नहीं होती।

यहाँ, यदि कोर्स शीर्षक और कोर्स विवरण बहुत पास हों, तो वे भीड़भाड़ जैसे दिखेंगे। इसलिए उपयोग किया गया है:

```swift
spacing: 10
```

ताकि उनके बीच थोड़ी जगह बनी रहे।

Display effect:

![view](../../../Resource/026_view9.png)

इसी तरह, शीर्ष क्षेत्र और सामग्री क्षेत्र भी ऊपर-नीचे व्यवस्थित हैं, इसलिए उनके बीच की दूरी नियंत्रित करने के लिए भी `spacing` का उपयोग किया जा सकता है।

अब `topView` और `contentView` को `body` में रखें:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Display effect:

![view](../../../Resource/026_view10.png)

यहाँ `VStack(spacing: 20)` `topView` और `contentView` के बीच की दूरी नियंत्रित करता है।

यानी:

```swift
VStack(alignment: .leading, spacing: 10)
```

यह कोर्स शीर्षक और कोर्स विवरण के बीच की दूरी नियंत्रित करता है।

```swift
VStack(spacing: 20)
```

यह शीर्ष क्षेत्र और सामग्री क्षेत्र के बीच की दूरी नियंत्रित करता है।

दोनों `spacing` हैं, लेकिन वे अलग-अलग `VStack` पर काम करते हैं, इसलिए उनके प्रभाव का scope भी अलग है।

इस तरह, सामग्री क्षेत्र का view पूरा हो गया।

## बटन क्षेत्र

अब नीचे का बटन क्षेत्र बनाते हैं।

Display effect:

![view](../../../Resource/026_view11.png)

बटन क्षेत्र मुख्य रूप से एक play icon और text के एक हिस्से से बना है।

हम `Image` से play icon दिखा सकते हैं, और `Text` से बटन text दिखा सकते हैं।

यहाँ पहले एक button appearance बनाते हैं:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("बटन क्लिक हुआ")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("सीखना शुरू करें")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Display effect:

![view](../../../Resource/026_view12.png)

यहाँ दो `HStack` का उपयोग किया गया है:

अंदर वाला `HStack` icon और text को horizontal रूप से व्यवस्थित करता है:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("सीखना शुरू करें")
}
```

बाहर वाला `HStack`, `Spacer()` के साथ, इस button appearance को बाईं ओर दिखाने के लिए उपयोग किया जाता है:

```swift
HStack {
    ...
    Spacer()
}
```

जब button पर tap किया जाता है, console में `बटन क्लिक हुआ` output होगा।

## मूल कार्ड पूरा

अब शीर्ष क्षेत्र, सामग्री क्षेत्र और बटन क्षेत्र को मिलाते हैं:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Display effect:

![view](../../../Resource/026_view13.png)

यहाँ तक एक basic कोर्स कार्ड पूरा हो गया है।

## Swift आइकन background

अंत में, हम कार्ड में एक अर्ध-पारदर्शी Swift icon background जोड़ते हैं।

![view](../../../Resource/026_view.png)

पहले हमने background color के रूप में `Color.indigo` का उपयोग किया था। वास्तव में, `.background()` color जोड़ने के अलावा एक पूरा view भी जोड़ सकता है।

इसलिए, हम पहले एक अलग background view बना सकते हैं:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

इस background view में, हमने `VStack`, `HStack` और `Spacer()` का उपयोग करके Swift icon को नीचे-दाएँ कोने में धकेला है।

क्योंकि Swift icon केवल decorative background के रूप में है, इसलिए यहाँ अर्ध-पारदर्शी सफेद रंग का उपयोग किया गया है:

```swift
Color.white.opacity(0.15)
```

इससे icon बहुत प्रमुख नहीं होगा, और सामने वाले text content को प्रभावित भी नहीं करेगा।

इसके बाद, `backgroundView` को कार्ड में जोड़ें:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Implemented effect:

![view](../../../Resource/026_view14.png)

यहाँ लगातार दो `.background()` उपयोग किए गए हैं:

```swift
.background(backgroundView)
.background(Color.indigo)
```

पहला `.background()` Swift icon background जोड़ने के लिए है।
दूसरा `.background()` indigo background जोड़ने के लिए है।

इस तरह, Swift icon indigo background के ऊपर दिखाई देगा, और कार्ड background के हिस्से के रूप में display होगा।

यहाँ से देखा जा सकता है कि `.background()` color जोड़ने के अलावा custom view भी जोड़ सकता है। कई `.background()` को मिलाकर अधिक समृद्ध background effects बनाए जा सकते हैं।

यहाँ तक एक पूरा कोर्स कार्ड बन गया है।

## सारांश

इस पाठ में हमने एक कोर्स कार्ड के माध्यम से SwiftUI में सामान्य basic layout methods को दोहराया।

हमने text दिखाने के लिए `Text`, system icon दिखाने के लिए `Image`, और view arrangement नियंत्रित करने के लिए `VStack`, `HStack` और `Spacer()` का उपयोग किया।

हमने `.lineLimit()` सीखा। यह text की अधिकतम प्रदर्शित पंक्तियों को सीमित कर सकता है। जब content सीमा से अधिक होगा, तो अतिरिक्त भाग omitted हो जाएगा।

साथ ही, हमने `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` आदि common modifiers को भी दोहराया।

इस पाठ को पूरा करने के बाद, हम कई छोटे views को मिलाकर एक पूरा card module बना सकते हैं।

यह SwiftUI development में बहुत आम सोच भी है: पहले छोटे views में विभाजित करें, फिर उन्हें मिलाकर पूरा interface बनाएं।

## पूरा कोड

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("शुरुआती")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ पाठ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI शुरुआती ट्यूटोरियल")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI से शून्य से शुरुआत करें और Apple के declarative UI development को व्यवस्थित रूप से सीखें। स्पष्ट व्याख्या और practical examples के माध्यम से, आप धीरे-धीरे layout, interaction और state management में महारत हासिल करेंगे, ताकि सुंदर और उपयोगी app interfaces बना सकें।")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("बटन क्लिक हुआ")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("सीखना शुरू करें")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
