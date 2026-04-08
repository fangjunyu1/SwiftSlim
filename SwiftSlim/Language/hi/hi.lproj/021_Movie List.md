# फ़िल्म सूची

इस पाठ में, हम एक फ़िल्म सूची बनाएँगे।

![movie](../../Resource/021_movie.png)

सूची में हर फ़िल्म का पोस्टर, नाम, निर्देशक और रेटिंग दिखाई जाएगी।

इस उदाहरण में, हम एक बहुत महत्वपूर्ण ज्ञान बिंदु सीखेंगे: `struct` संरचना। यह हमें एक फ़िल्म की कई जानकारियों को एक पूरे रूप में जोड़ने में मदद कर सकती है। इसके अलावा, हम `UUID()`、`ForEach`、`Divider` विभाजक रेखा, और कस्टम ऑब्जेक्ट्स का उपयोग करके डेटा को मैनेज करना भी सीखेंगे।

यह ज्ञान आगे के SwiftUI विकास में बहुत सामान्य है। यह पाठ सीखने के बाद, आप न केवल एक फ़िल्म सूची बना पाएँगे, बल्कि “डेटा के एक समूह को इंटरफ़ेस के रूप में कैसे दिखाया जाए” यह भी समझना शुरू करेंगे।

## एकल फ़िल्म

हम सबसे पहले एक अकेली फ़िल्म के इंटरफ़ेस से शुरुआत कर सकते हैं।

![movie](../../Resource/021_movie1.png)

इस इंटरफ़ेस का लेआउट मुख्य रूप से दो भागों से बना है: बाईं ओर फ़िल्म का पोस्टर है, और दाईं ओर फ़िल्म का परिचय है।

### फ़िल्म पोस्टर

बाईं ओर फ़िल्म का पोस्टर दिखाया जाता है, और हम चित्र दिखाने के लिए `Image` का उपयोग कर सकते हैं।

उदाहरण के लिए:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

इस कोड का अर्थ है कि `"The Shawshank Redemption"` नाम की एक तस्वीर दिखाई जाती है।

यहाँ ध्यान देने की ज़रूरत है कि चित्र का नाम वास्तव में `Assets` संसाधन फ़ोल्डर में मौजूद होना चाहिए, नहीं तो इंटरफ़ेस इस चित्र को सही तरह से नहीं दिखा पाएगा।

![movie](../../Resource/021_movie2.png)

इन मॉडिफ़ायर्स के कार्य क्रमशः इस प्रकार हैं:

- `resizable()` का मतलब है कि चित्र का आकार बदला जा सकता है।
- `scaledToFit()` का मतलब है कि स्केल करते समय मूल अनुपात बना रहता है, ताकि चित्र खिंचकर विकृत न हो।
- `frame(height: 180)` का मतलब है कि चित्र की ऊँचाई 180 सेट की जाती है।
- `cornerRadius(10)` का मतलब है कि चित्र को 10 के गोल कोने दिए जाते हैं।

इस तरह, हम उपयुक्त आकार और गोल कोनों वाला फ़िल्म पोस्टर चित्र प्राप्त कर सकते हैं।

![movie](../../Resource/021_movie3.png)

### फ़िल्म परिचय

दाईं ओर फ़िल्म का परिचय दिखाया जाता है, जिसमें फ़िल्म का नाम, निर्देशक और रेटिंग शामिल है।

![movie](../../Resource/021_movie4.png)

इस भाग को दिखाने के लिए हम `Text` का उपयोग कर सकते हैं:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

इस कोड में, `.font` फ़ॉन्ट का आकार दर्शाता है, और `.fontWeight` फ़ॉन्ट की मोटाई दर्शाता है।

“फ़िल्म का नाम”, “निर्देशक जानकारी” और “रेटिंग जानकारी” के बीच अधिक स्पष्ट दूरी देने के लिए, यहाँ सबसे बाहरी स्तर पर `VStack` का उपयोग किया गया है, और सेट किया गया है:

```swift
spacing: 10
```

इसका मतलब है कि इस `VStack` के अंदर हर कंटेंट समूह के बीच की दूरी 10 है।

निर्देशक और रेटिंग को अलग-अलग फिर से एक `VStack` में लपेटने का कारण यह है कि दोनों “शीर्षक + सामग्री” जैसी संरचना से संबंधित हैं। इसलिए इंटरफ़ेस की परतें अधिक स्पष्ट हो जाती हैं, और बाद में स्टाइल को समायोजित करना भी अधिक सुविधाजनक होता है।

इसके अलावा, `VStack` डिफ़ॉल्ट रूप से बीच में संरेखित होता है। पूरे पाठ को बाईं ओर संरेखित करने के लिए, हम सेट करते हैं:

```swift
alignment: .leading
```

इस तरह फ़िल्म परिचय वाला भाग अधिक व्यवस्थित दिखाई देता है।

### विभाजक रेखा

अब, हालाँकि फ़िल्म परिचय की सामग्री `spacing` के द्वारा अलग की जा चुकी है, लेकिन अलग-अलग सामग्री के बीच की सीमा अभी भी पर्याप्त स्पष्ट नहीं है।

इस समय, हम एक विभाजक रेखा जोड़ सकते हैं:

```swift
Divider()
```

उदाहरण के लिए:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

इस तरह, फ़िल्म परिचय वाला भाग अधिक स्पष्ट विभाजन प्रभाव प्राप्त करेगा।

![movie](../../Resource/021_movie4.png)

`Divider` एक बहुत सरल लेकिन बहुत सामान्य रूप से उपयोग होने वाला view है, जिसका काम अलग-अलग सामग्री को अलग करना है।

`VStack` में, `Divider()` एक क्षैतिज रेखा के रूप में दिखाई देता है।

`HStack` में, `Divider()` एक ऊर्ध्वाधर रेखा के रूप में दिखाई देता है।

इसके अलावा, `.frame`、`.background`、`.padding` आदि तरीकों से `Divider` की स्टाइल भी बदली जा सकती है।

उदाहरण के लिए:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

यह 2 की मोटाई और दोनों ओर क्षैतिज padding वाली एक नीली विभाजक रेखा बनाएगा।

![divider](../../Resource/021_divider.png)

### पूर्ण इंटरफ़ेस

अंत में, हम `HStack` का उपयोग करके फ़िल्म पोस्टर और फ़िल्म परिचय को साथ-साथ व्यवस्थित कर सकते हैं।

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

यहाँ, `HStack(spacing: 20)` का अर्थ है कि बाएँ और दाएँ भाग के बीच 20 का अंतर रखा जाएगा।

ध्यान देने की बात यह है कि `Divider()` भी पहले देखे गए `TextField` और `Slider` की तरह डिफ़ॉल्ट रूप से जितनी संभव हो उतनी उपलब्ध जगह लेने की कोशिश करता है।

इसलिए, हम दाईं ओर के परिचय भाग के बाहरी `VStack` के लिए एक निश्चित चौड़ाई सेट करते हैं:

```swift
.frame(width: 200)
```

इस तरह विभाजक रेखा और पाठ क्षेत्र की चौड़ाई एक जैसी बनी रह सकती है, जिससे पूरा लेआउट अधिक व्यवस्थित दिखाई देता है।

यहाँ तक, हमने “एकल फ़िल्म” के प्रदर्शन इंटरफ़ेस को पूरा कर लिया है।

![movie](../../Resource/021_movie1.png)

## ऐरे में फ़िल्मों को सहेजना

अगर हम एक ही स्टाइल में कई फ़िल्मों को एक के बाद एक दिखाना चाहते हैं, तो इसका मतलब है कि हर फ़िल्म के लिए समान प्रकार का कोड लिखना पड़ेगा।

उदाहरण के लिए:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

हालाँकि इस तरह लिखा गया कोड परिणाम दे सकता है, लेकिन कोड लगातार बढ़ता जाएगा और उसकी देखभाल करना बहुत कठिन हो जाएगा।

उदाहरण के लिए, अगर सभी फ़िल्मों के बीच की दूरी `20` से `15` करनी हो, या दाईं ओर की चौड़ाई `200` से
`220` करनी हो, तो हर दोहराए गए कोड ब्लॉक को हाथ से बदलना पड़ेगा।

यह स्पष्ट रूप से कोई प्रभावी तरीका नहीं है।

हम पहले ऐरे सीख चुके हैं, और `ForEach` का उपयोग करके ऐरे के आधार पर views को बार-बार दिखाना भी सीख चुके हैं।

उदाहरण के लिए:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

यह तरीका उन स्थितियों के लिए बहुत उपयुक्त है जहाँ “सिर्फ एक प्रकार का डेटा” हो, जैसे कुछ चित्रों के नामों का समूह।

लेकिन एक फ़िल्म में केवल एक मान नहीं होता। इसमें कम से कम यह शामिल होता है:

1. फ़िल्म पोस्टर
2. फ़िल्म का नाम
3. निर्देशक
4. रेटिंग

यानि, एक फ़िल्म वास्तव में संबंधित डेटा का एक समूह है, न कि केवल एक अकेली string।

अगर हम केवल ऐरे का उपयोग करें, तो हमें यह जानकारी अलग-अलग सहेजनी पड़ेगी:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

दिखाते समय, हमें एक ही index पर भरोसा करके इन्हें एक-एक करके मिलाना पड़ेगा:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

इस लिखने के तरीके की समस्या यह है कि इसका रखरखाव खर्च बहुत अधिक है।

क्योंकि एक फ़िल्म का डेटा कई ऐरे में बँट जाता है। अगर किसी एक ऐरे में एक आइटम ज़्यादा, कम या क्रम अलग हो जाए, तो प्रदर्शन का परिणाम गलत हो जाएगा।

खासतौर पर जब नई फ़िल्म जोड़ी जाए या फ़िल्म हटाई जाए, तब आपको एक साथ कई ऐरे बदलने पड़ते हैं, और कुछ छूट जाना बहुत आसान होता है।

तो फिर “फ़िल्म का नाम, निर्देशक और रेटिंग” जैसी जानकारी को एक पूरे रूप में कैसे जोड़ा जाए?

इसके लिए `struct` की ज़रूरत होती है।

## struct संरचना को परिभाषित करना

Swift में, `struct` का अर्थ “संरचना” है।

आप इसे एक “कस्टम डेटा प्रकार” के रूप में समझ सकते हैं, जो कई संबंधित fields को जोड़कर एक पूरा रूप बना सकता है।

मूल उपयोग:

```swift
struct StructName {
	let name: String
}
```

इस कोड में, `struct` एक keyword है, जो बताता है कि हम एक संरचना परिभाषित कर रहे हैं। `StructName` इस संरचना का नाम है।

Curly braces के भीतर की सामग्री इस संरचना में शामिल fields हैं, और हर field का नाम और प्रकार स्पष्ट रूप से लिखना होता है।

आमतौर पर, `struct` का नाम बड़े अक्षर से शुरू होता है, जैसे `Movie`、`Student`、`UserInfo`। यह Swift में आम नामकरण शैली है।

आप `struct` को सरलता से एक खाली डिब्बे की तरह समझ सकते हैं, जिसमें हर field उस डिब्बे के भीतर आरक्षित खाली स्थान जैसा होता है।

जब ये स्थान अभी तक भरे नहीं गए हों, तब यह सिर्फ़ एक खाली डिब्बा होता है। जब सभी fields उपयुक्त values से भर दिए जाते हैं, तभी यह एक पूर्ण उपहार डिब्बा बनता है।

### struct instance

पहले हमने केवल संरचना को ही परिभाषित किया था, जो एक डिब्बे का आकार तैयार करने जैसा है।

अब हमें इसके अंदर वास्तविक सामग्री भरनी होगी, तभी हमें एक वास्तविक “instance” मिलेगा, जिसका उपयोग किया जा सके।

Instance बनाते समय, सामान्यतः संरचना के नाम के बाद `()` जोड़ा जाता है:

```swift
StructName(...)
```

Parentheses के अंदर जो भरा जाता है, वही इस संरचना के लिए ज़रूरी field values होती हैं।

उदाहरण के लिए:

```swift
StructName(name: "Fang Junyu")
```

इस कोड का मतलब है: `StructName` संरचना के प्रारूप के अनुसार एक नई instance बनाना, और `name` field को `"Fang Junyu"` value देना।

जब हम सभी आवश्यक fields भर देते हैं, तो यह उस डिब्बे को पूरी तरह भर देने जैसा होता है।

उस समय, हमें एक पूर्ण struct instance मिलती है।

### struct properties तक पहुँचना

जब हम instance बना लेते हैं, तब उसके अंदर की properties तक पहुँचने के लिए “dot syntax” का उपयोग कर सकते हैं।

मूल लिखावट:

```swift
instance.propertyName
```

उदाहरण के लिए:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

यहाँ `st` एक struct instance है, और `st.name` का मतलब है इस instance से `name` value को पढ़ना।

आप इस पढ़ने के तरीके को ऐसे समझ सकते हैं: जब हम `st.name` लिखते हैं, तो मानो हम उस डिब्बे के एक निश्चित स्थान में रखी सामग्री को पढ़ रहे हों।

इस तरह की लिखावट आगे के SwiftUI इंटरफ़ेस में बहुत आम होगी।

उदाहरण के लिए, यदि हमारे पास एक student structure हो, जिसमें नाम, उम्र और कक्षा हो, तो इंटरफ़ेस में दिखाते समय हम अलग-अलग पढ़ सकते हैं:

```swift
student.name
student.age
student.className
```

ऐसा करने का लाभ यह है कि डेटा अधिक स्पष्ट हो जाता है और उसे मैनेज करना भी अधिक आसान हो जाता है।

### struct की स्थिति

शुरुआती लोगों के लिए, सामान्यतः संरचना को `ContentView` के बाहर लिखा जा सकता है।

उदाहरण के लिए:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

इस तरह संरचना अधिक स्पष्ट हो जाती है और पढ़ने में भी आसान होती है।

आप देखेंगे कि `ContentView` खुद भी वास्तव में एक `struct` है।

### Movie संरचना

ऊपर की नींव के आधार पर, अब हम एक फ़िल्म संरचना परिभाषित कर सकते हैं:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

यह `Movie` नाम की एक संरचना है, जिसमें `name`, `director` और `rating` ये तीन fields होते हैं, जो क्रमशः फ़िल्म का नाम, निर्देशक और रेटिंग दर्शाते हैं।

इस तरह, एक फ़िल्म से संबंधित जानकारी को अब कई ऐरे में अलग-अलग सहेजने की ज़रूरत नहीं रहती, बल्कि उसे सीधे एक पूरे रूप में जोड़ा जा सकता है।

उदाहरण के लिए, हम इस तरह की फ़िल्म instance बना सकते हैं:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

यह instance “एक पूर्ण फ़िल्म डेटा” का प्रतिनिधित्व करती है।

### ऐरे में संरचनाओं को सहेजना

हम पहले कह चुके हैं कि ऐरे केवल एक ही प्रकार का डेटा सहेज सकते हैं।

अब हमारे पास `Movie` संरचना है, इसलिए ऐरे कई `Movie` सहेज सकता है।

```swift
let lists: [Movie] = []
```

उदाहरण के लिए:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

इस `lists` ऐरे में strings नहीं, बल्कि कई `Movie` instances सहेजी जाती हैं।

अर्थात, ऐरे का प्रत्येक element एक पूर्ण फ़िल्म है।

इस तरह, जब हमें फ़िल्म सूची दिखानी हो, तो `ForEach` के माध्यम से एक-एक करके हर फ़िल्म को पढ़ा जा सकता है।

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

यहाँ `movie in` का अर्थ है कि हर लूप के दौरान ऐरे से एक फ़िल्म निकाली जाएगी और उसे अस्थायी रूप से `movie` नाम दिया जाएगा।

इसके बाद, हम उपयोग कर सकते हैं:

```swift
movie.name
movie.director
movie.rating
```

ताकि उस फ़िल्म का नाम, निर्देशक और रेटिंग अलग-अलग पढ़कर इंटरफ़ेस में दिखाई जा सके।

## ForEach त्रुटि

यहाँ तक, हमने फ़िल्म ऐरे और `ForEach` की मूल लिखावट पूरी कर ली है।

लेकिन यदि आप नीचे दिया गया कोड सीधे चलाएँ:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

तो त्रुटि दिखाई देगी:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

इस त्रुटि का अर्थ है कि जब आप `id: \.self` लिखते हैं, तब SwiftUI को ऐरे के हर element को ही “अद्वितीय पहचान” के रूप में लेना पड़ता है, ताकि उन्हें अलग किया जा सके।

यह लिखावट `String` और `Int` जैसे सरल प्रकारों के लिए उपयुक्त है, क्योंकि उन्हें स्वाभाविक रूप से अलग करना आसान होता है।

लेकिन `Movie` हमारी परिभाषित की हुई custom structure है, और `ForEach` नहीं जानता कि उसे खुद उसी को अद्वितीय पहचान के रूप में कैसे उपयोग करना है, इसलिए त्रुटि आती है।

इस समस्या को हल करने का सबसे सामान्य तरीका है `Movie` को `Identifiable` protocol के अनुरूप बनाना।

## प्रोटोकॉल

Swift में, प्रोटोकॉल को एक प्रकार के “नियम” या “आवश्यकता” के रूप में समझा जा सकता है।

आप इसे किसी अंतरराष्ट्रीय संगठन के समझौते जैसा समझ सकते हैं: यदि कोई देश किसी अंतरराष्ट्रीय संगठन में शामिल होना चाहता है, तो सामान्यतः उसे पहले उस संगठन द्वारा तय किए गए कुछ नियमों को पूरा करना होता है, कुछ डेटा सार्वजनिक करना होता है और कुछ साझा नियमों का पालन करना होता है। इन शर्तों को पूरा करने के बाद ही वह उसमें शामिल हो सकता है या कुछ मामलों में भाग ले सकता है।

प्रोटोकॉल भी इसी तरह काम करते हैं।

जब कोई प्रकार किसी निश्चित प्रोटोकॉल का पालन करना चाहता है, तो उसे उस प्रोटोकॉल द्वारा निर्धारित सामग्री को पूरा करना होता है। इन आवश्यकताओं को पूरा करने के बाद ही वह प्रकार संबंधित सुविधाओं का उपयोग कर सकता है।

मूल लिखावट:

```swift
struct Movie: Identifiable {
    // ...
}
```

यहाँ `: Identifiable` का अर्थ है कि `Movie` `Identifiable` protocol का पालन करता है।

यदि कोई प्रकार कई protocols का पालन करता है, तो उन्हें comma से अलग किया जा सकता है:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` के लिए सबसे महत्वपूर्ण आवश्यकता यह है कि उस प्रकार के पास `id` होना चाहिए, जिसके द्वारा वह स्वयं की पहचान कर सके।

उदाहरण के लिए:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

यहाँ `id` पहचान पत्र संख्या की तरह है, जिसका उपयोग हर फ़िल्म को अलग करने के लिए किया जाता है।

जब तक हर फ़िल्म का `id` अलग है, SwiftUI ऐरे के हर element को सही तरह से अलग कर सकता है।

उदाहरण के लिए:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

फिर `ForEach` में इस तरह उपयोग करते हैं:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

इस तरह त्रुटि नहीं आएगी।

क्योंकि `Movie` पहले से ही `Identifiable` का पालन करता है, इसलिए अधिक सामान्य लिखावट यह है कि सीधे `id:` को छोड़ दिया जाए:

```swift
ForEach(lists) { movie in
    // ...
}
```

क्योंकि SwiftUI पहले से जानता है कि हर item को अलग करने के लिए `movie.id` का उपयोग करना है।

## ForEach की भिन्नता पहचान

अब हम `ForEach` में `id` की भूमिका को अधिक गहराई से समझेंगे।

उदाहरण के लिए:

```swift
ForEach(lists, id: \.self)
```

यहाँ इसका अर्थ है: element को ही भिन्नता पहचान के रूप में उपयोग करना।

और:

```swift
ForEach(lists, id: \.id)
```

का अर्थ है: element के `id` field को भिन्नता पहचान के रूप में उपयोग करना।

यदि कोई field स्वयं ही अद्वितीय होने की गारंटी दे सकता है, तो उसे अस्थायी रूप से भी उपयोग किया जा सकता है।

उदाहरण के लिए, यदि हर फ़िल्म का नाम अलग हो, तो वर्तमान डेटा के साथ नीचे की लिखावट भी सही तरह से काम कर सकती है:

```swift
ForEach(lists, id: \.name)
```

लेकिन यहाँ एक छिपी हुई समस्या है: `name` हमेशा अद्वितीय हो यह ज़रूरी नहीं है।

मान लीजिए कि बाद में आप उसी नाम की एक और फ़िल्म जोड़ते हैं, तो `name` हर element को सटीक रूप से अलग नहीं कर पाएगा।

उस समय, भले ही कोड compile हो जाए, लेकिन view refresh, update, insert या delete करते समय SwiftUI गलत पहचान कर सकता है, जिससे प्रदर्शन संबंधी समस्याएँ हो सकती हैं।

इसलिए, जब डेटा को स्थिर रूप से अलग करने की ज़रूरत हो, तो वास्तव में अद्वितीय field यानी `id` का उपयोग करना बेहतर है।

## UUID

हालाँकि `id: 1`, `id: 2` इस तरह हाथ से लिखकर समस्या हल की जा सकती है, फिर भी एक जोखिम रहता है: गलती से एक जैसा `id` लिखा जा सकता है, और तब अद्वितीय पहचान अमान्य हो जाती है।

उदाहरण के लिए:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

इस तरह दो समान `id` हो जाएँगे, और अद्वितीय पहचान की वैधता समाप्त हो जाएगी।

हाथ की गलतियों से बचने के लिए, हम सामान्यतः `UUID()` का उपयोग करते हैं।

Swift में, `UUID()` यादृच्छिक रूप से एक 128-bit पहचानकर्ता बनाता है। यह सामान्यतः अक्षरों और संख्याओं की एक लंबी string के रूप में दिखाई देता है।

उदाहरण के लिए:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

यहाँ `UUID()` वास्तव में `UUID` प्रकार की एक instance बनाता है; आप इसे अपने आप बनने वाले “अद्वितीय नंबर” के रूप में समझ सकते हैं।

इसलिए, हर बार बनने वाले values लगभग कभी दोहराए नहीं जाते, इसलिए `id` के रूप में उपयोग के लिए यह बहुत उपयुक्त है।

हम `Movie` को इस तरह बदल सकते हैं:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

इस कोड का अर्थ है कि `Movie` संरचना के `id` field को डिफ़ॉल्ट रूप से एक नई `UUID` instance दी जाएगी।

यानी, हर बार जब हम नया `Movie` बनाएँगे, तो सिस्टम पहले ही अपने आप एक अद्वितीय `id` बना देगा।

क्योंकि `id` के पास पहले से default value है, इसलिए बाद में `Movie` instances बनाते समय `id` को हाथ से भरने की आवश्यकता नहीं रहेगी।

उदाहरण के लिए:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

यहाँ `id` लिखा नहीं गया है, फिर भी वास्तव में इस फ़िल्म instance के पास अपना `id` होता है; बस यह value पहले ही `UUID()` द्वारा अपने आप बनाई जा चुकी होती है।

इस तरीके का उपयोग करने के बाद, हर फ़िल्म के लिए `id` को हाथ से भरने की ज़रूरत नहीं रहती। इससे न केवल कोड की मात्रा कम होती है, बल्कि एक जैसे id लिख देने से होने वाली गलतियाँ भी बच जाती हैं।

अंत में, हमें केवल ऊपर एक `Banner` चित्र जोड़ना है, और `ScrollView` का उपयोग करना है ताकि सामग्री scroll की जा सके, और इस तरह पूरा फ़िल्म सूची view पूरा हो जाएगा।

## सारांश

इस पाठ में, हमने एक बहुत महत्वपूर्ण ज्ञान बिंदु सीखा: `struct`।

`struct` के माध्यम से, हम एक फ़िल्म के कई संबंधित fields को एक पूरे रूप में व्यवस्थित कर सकते हैं, नाम, निर्देशक और रेटिंग को अलग-अलग ऐरे में बाँटने के बजाय।

डेटा को व्यवस्थित करने के बाद, हम `ForEach` का उपयोग करके ऐरे की हर फ़िल्म को एक-एक करके view में दिखा सकते हैं।

इसके साथ-साथ, हमने `ForEach` में “भिन्नता पहचान” की भूमिका भी समझी। SwiftUI को पता होना चाहिए कि ऐरे के हर element को कैसे अलग करना है, तभी वह view को सही ढंग से दिखा और अपडेट कर सकता है।

इसीलिए हमने `Movie` को `Identifiable` protocol का पालन करवाया और उसे एक अद्वितीय `id` दिया।

हाथ से `id` भरते समय होने वाली गलतियों से बचने के लिए, हमने आगे `UUID()` भी सीखा, ताकि सिस्टम अपने आप अद्वितीय पहचानकर्ता बना सके।

इस पाठ को पूरा करने के बाद, आप न केवल फ़िल्म सूची पूरी करेंगे, बल्कि SwiftUI की एक महत्वपूर्ण सोच को भी समझना शुरू करेंगे: **पहले डेटा को व्यवस्थित करो, फिर उसी डेटा के आधार पर view बनाओ।**

## पूर्ण कोड

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
