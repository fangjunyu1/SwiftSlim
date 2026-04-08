# चित्रपट यादी

या धड्यात आपण एक चित्रपट यादी तयार करणार आहोत.

![movie](../../Resource/021_movie.png)

या यादीत प्रत्येक चित्रपटाचे पोस्टर, नाव, दिग्दर्शक आणि रेटिंग दिसेल.

या उदाहरणात आपण एक अतिशय महत्त्वाची संकल्पना शिकणार आहोत: `struct` संरचना. ती आपल्याला एका चित्रपटाची अनेक माहिती एकत्र करून एक संपूर्ण घटक बनवण्यास मदत करते. याशिवाय, आपण `UUID()`、`ForEach`、`Divider` विभाजक रेषा, आणि कस्टम ऑब्जेक्ट वापरून डेटा कसा व्यवस्थापित करायचा हेही पाहू.

हे ज्ञान पुढील SwiftUI विकासात खूपच सामान्य आहे. हा धडा शिकल्यानंतर तुम्ही केवळ एक चित्रपट यादी तयार करणार नाही, तर “डेटाच्या एका समूहाला इंटरफेसमध्ये कसे दाखवायचे” हेही समजू लागाल.

## एक चित्रपट

आपण आधी एका एकमेव चित्रपटाच्या इंटरफेसपासून सुरुवात करू शकतो.

![movie](../../Resource/021_movie1.png)

या इंटरफेसचा मांडणी आराखडा प्रामुख्याने दोन भागांचा आहे: डावीकडे चित्रपटाचे पोस्टर, आणि उजवीकडे चित्रपटाची ओळख.

### चित्रपट पोस्टर

डावीकडे चित्रपटाचे पोस्टर दाखवले जाते, आणि आपण चित्र दाखवण्यासाठी `Image` वापरू शकतो.

उदाहरणार्थ:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

या कोडचा अर्थ असा आहे की `"The Shawshank Redemption"` नावाचे एक चित्र दाखवले जाते.

इथे एक गोष्ट लक्षात घ्यायची आहे: चित्राचे नाव `Assets` संसाधन फोल्डरमध्ये प्रत्यक्ष असलेच पाहिजे, नाहीतर इंटरफेस हे चित्र योग्यरीत्या दाखवू शकणार नाही.

![movie](../../Resource/021_movie2.png)

या काही मॉडिफायर्सची भूमिका पुढीलप्रमाणे आहे:

- `resizable()` म्हणजे चित्राचा आकार बदलता येतो.
- `scaledToFit()` म्हणजे आकार बदलताना मूळ प्रमाण कायम राहते, त्यामुळे चित्र ताणले जाऊन विकृत होत नाही.
- `frame(height: 180)` म्हणजे चित्राची उंची 180 सेट केली जाते.
- `cornerRadius(10)` म्हणजे चित्राला 10 चा गोल कोपरा दिला जातो.

अशा प्रकारे आपल्याला योग्य आकाराचे आणि गोल कोपरे असलेले चित्रपट पोस्टर मिळते.

![movie](../../Resource/021_movie3.png)

### चित्रपट परिचय

उजवीकडे चित्रपटाचा परिचय दाखवला जातो, ज्यात चित्रपटाचे नाव, दिग्दर्शक आणि रेटिंग समाविष्ट असते.

![movie](../../Resource/021_movie4.png)

हा भाग दाखवण्यासाठी आपण `Text` वापरू शकतो:

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

या कोडमध्ये `.font` म्हणजे फॉन्टचा आकार, आणि `.fontWeight` म्हणजे फॉन्टची जाडी.

“चित्रपटाचे नाव”, “दिग्दर्शक माहिती” आणि “रेटिंग माहिती” यांच्यामध्ये अधिक स्पष्ट अंतर ठेवण्यासाठी, इथे आपण सर्वात बाहेरील स्तरावर `VStack` वापरतो, आणि असे सेट करतो:

```swift
spacing: 10
```

याचा अर्थ या `VStack` मधील प्रत्येक गटामध्ये 10 चे अंतर असेल.

दिग्दर्शक आणि रेटिंग यांना पुन्हा स्वतंत्र `VStack` मध्ये गुंडाळण्याचे कारण असे की ते दोन्ही “शीर्षक + मजकूर” अशा रचनेचे आहेत. त्यामुळे इंटरफेसची पातळी अधिक स्पष्ट दिसते, आणि पुढे शैली बदलणेही सोपे होते.

याशिवाय, `VStack` डीफॉल्टने मध्यभागी अलाईन असतो. मजकूर संपूर्णपणे डावीकडे अलाईन करण्यासाठी आपण असे सेट करतो:

```swift
alignment: .leading
```

यामुळे चित्रपट परिचयाचा भाग अधिक नीटनेटका दिसतो.

### विभाजक रेषा

आता, चित्रपट परिचयातील मजकूर `spacing` मुळे थोडा वेगळा दिसत असला, तरी वेगवेगळ्या मजकुरामधील सीमा अजून पुरेशी स्पष्ट नाही.

या वेळी आपण विभाजक रेषा जोडू शकतो:

```swift
Divider()
```

उदाहरणार्थ:

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

अशा प्रकारे चित्रपट परिचयाच्या भागात अधिक स्पष्ट विभाजन परिणाम दिसेल.

![movie](../../Resource/021_movie4.png)

`Divider` हे अतिशय सोपे पण खूप वापरले जाणारे view आहे, ज्याचे काम वेगवेगळ्या मजकुरांना वेगळे करणे आहे.

`VStack` मध्ये `Divider()` एक आडवी रेषा म्हणून दिसतो.

`HStack` मध्ये `Divider()` एक उभी रेषा म्हणून दिसतो.

याशिवाय, `.frame`、`.background`、`.padding` अशा पद्धतींनी `Divider` ची शैली बदलता येते.

उदाहरणार्थ:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

यामुळे निळ्या रंगाची, जाडी 2 असलेली, आणि डावीकडे-उजवीकडे पॅडिंग असलेली विभाजक रेषा तयार होते.

![divider](../../Resource/021_divider.png)

### संपूर्ण इंटरफेस

शेवटी, आपण `HStack` वापरून चित्रपट पोस्टर आणि चित्रपट परिचय डावीकडून उजवीकडे मांडू शकतो.

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

इथले `HStack(spacing: 20)` म्हणजे डावी आणि उजवी अशा दोन भागांमध्ये 20 चे अंतर राखले जाईल.

लक्षात घ्या की `Divider()` आणि आधी शिकलेले `TextField`、`Slider` यांच्यासारखेच, डीफॉल्टने शक्य तितकी उपलब्ध जागा व्यापण्याचा प्रयत्न करतात.

म्हणून आपण उजव्या बाजूच्या परिचय भागाच्या बाहेरील `VStack` ला एक निश्चित रुंदी देतो:

```swift
.frame(width: 200)
```

यामुळे विभाजक रेषा आणि मजकूर क्षेत्राची रुंदी एकसारखी राहते, आणि संपूर्ण दृश्य अधिक नीटनेटके दिसते.

येथे आपण “एक चित्रपट” दाखवणारा इंटरफेस पूर्ण केला आहे.

![movie](../../Resource/021_movie1.png)

## अॅरेमध्ये चित्रपट साठवणे

जर आपल्याला अनेक चित्रपट एकाच शैलीत एकामागोमाग दाखवायचे असतील, तर प्रत्येक चित्रपटासाठी सारखाच कोड पुन्हा पुन्हा लिहावा लागेल.

उदाहरणार्थ:

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

असे लिहिलेला कोड परिणाम देऊ शकतो, पण कोड सतत वाढत जाईल, आणि देखभाल करणे खूप त्रासदायक होईल.

उदाहरणार्थ, सर्व चित्रपटांमधील अंतर `20` वरून `15` करायचे असेल, किंवा उजव्या बाजूची रुंदी `200` वरून
`220` करायची असेल, तर प्रत्येक पुनरावृत्ती होणारा कोड हाताने बदलावा लागेल.

हे स्पष्टपणे कार्यक्षम पद्धत नाही.

आपण आधी अॅरे शिकलो आहोत, आणि अॅरेच्या आधारे view पुन्हा पुन्हा दाखवण्यासाठी `ForEach` कसे वापरायचे हेही शिकलो आहोत.

उदाहरणार्थ:

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

ही पद्धत “फक्त एकाच प्रकारचा डेटा” हाताळण्यासाठी खूप योग्य आहे, जसे की चित्रांच्या नावांचा एक समूह.

परंतु, एका चित्रपटात फक्त एकच मूल्य नसते. त्यात किमान हे असते:

1. चित्रपट पोस्टर
2. चित्रपटाचे नाव
3. दिग्दर्शक
4. रेटिंग

म्हणजेच, एक चित्रपट प्रत्यक्षात परस्पर संबंधित डेटाचा एक समूह आहे, स्वतंत्र एकच स्ट्रिंग नाही.

जर आपण फक्त अॅरे वापरले, तर ही माहिती वेगवेगळी विभागूनच साठवावी लागेल:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

दाखवताना, त्यांना एकामागोमाग एक जुळवण्यासाठी समान index वर अवलंबून राहावे लागेल:

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

या पद्धतीची समस्या अशी आहे की देखभाल खर्च खूप जास्त असतो.

कारण एका चित्रपटाचा डेटा अनेक अॅरेमध्ये विखुरला जातो. फक्त एखाद्या एका अॅरेमध्ये एक आयटम जास्त, एक कमी, किंवा क्रम वेगळा झाला, तरी दाखवण्याचा परिणाम चुकू शकतो.

विशेषतः नवीन चित्रपट जोडताना किंवा काढताना, तुम्हाला अनेक अॅरे एकाच वेळी बदलावे लागतात, आणि काहीतरी चुकण्याची शक्यता खूप असते.

मग “चित्रपटाचे नाव, दिग्दर्शक, रेटिंग” ही माहिती एका संपूर्ण घटकामध्ये कशी एकत्र करायची?

यासाठी `struct` वापरावी लागते.

## `struct` संरचना परिभाषित करणे

Swift मध्ये `struct` म्हणजे “संरचना”.

तुम्ही तिला “कस्टम डेटा टाइप” म्हणून समजू शकता, जी अनेक संबंधित फील्ड्स एकत्र करून एक पूर्ण घटक बनवते.

मूलभूत वापर:

```swift
struct StructName {
	let name: String
}
```

या कोडमध्ये `struct` हा एक keyword आहे, जो आपण एक संरचना परिभाषित करत आहोत हे दर्शवतो. `StructName` हे त्या संरचनेचे नाव आहे.

कर्ली ब्रेसेसमधील मजकूर म्हणजे त्या संरचनेतील फील्ड्स; प्रत्येक फील्डसाठी नाव आणि प्रकार स्पष्टपणे लिहावा लागतो.

साधारणपणे `struct` चे नाव मोठ्या अक्षराने सुरू होते, जसे `Movie`、`Student`、`UserInfo`। हे Swift मध्ये सामान्य naming convention आहे.

तुम्ही `struct` ला साध्या भाषेत रिकाम्या पॅकेजिंग बॉक्ससारखे समजू शकता, आणि त्यातील प्रत्येक फील्ड म्हणजे त्या बॉक्समध्ये राखून ठेवलेली एक जागा.

ही जागा अजून रिकामी असताना, तो फक्त एक रिकामा बॉक्स असतो. पण त्या सर्व जागांमध्ये योग्य मूल्ये भरल्यानंतरच तो एक पूर्ण भेटवस्तूचा बॉक्स बनतो.

### `struct` instance

आधी आपण फक्त संरचना स्वतः परिभाषित केली, म्हणजे जणू पॅकेजिंग बॉक्सचा आराखडा तयार केला.

आता आपल्याला त्यात प्रत्यक्ष मजकूर भरावा लागेल, तेव्हाच एक खऱ्या अर्थाने वापरता येणारी “instance” मिळेल.

instance तयार करताना, साधारणपणे संरचनेच्या नावानंतर `()` लावले जाते:

```swift
StructName(...)
```

कंसांमध्ये त्या संरचनेला लागणारी फील्ड मूल्ये भरली जातात.

उदाहरणार्थ:

```swift
StructName(name: "Fang Junyu")
```

या कोडचा अर्थ असा: `StructName` या संरचनेच्या स्वरूपानुसार एक नवीन instance तयार करा, आणि `name` फील्डला `"Fang Junyu"` हे मूल्य द्या.

आपण आवश्यक सर्व फील्ड मूल्ये भरल्यानंतर, जणू तो बॉक्स पूर्ण भरला जातो.

त्या वेळी आपल्याला एक पूर्ण `struct` instance मिळते.

### `struct` गुणधर्मांना प्रवेश

एकदा आपण instance तयार केले की, त्यातील गुणधर्मांना “dot syntax” वापरून प्रवेश करू शकतो.

मूलभूत लेखन:

```swift
instance.propertyName
```

उदाहरणार्थ:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

इथले `st` हे एक `struct` instance आहे, आणि `st.name` म्हणजे त्या instance मधील `name` मूल्य वाचणे.

तुम्ही या वाचण्याच्या पद्धतीला असे समजू शकता: जेव्हा आपण `st.name` लिहितो, तेव्हा जणू त्या बॉक्समधील एखाद्या ठरावीक जागेत ठेवलेली वस्तू वाचत आहोत.

ही पद्धत पुढील SwiftUI इंटरफेसमध्ये खूप सामान्य असेल.

उदाहरणार्थ, जर आपल्याकडे नाव, वय, वर्ग असलेली विद्यार्थी संरचना असेल, तर इंटरफेसवर दाखवताना आपण वेगवेगळे असे वाचू शकतो:

```swift
student.name
student.age
student.className
```

याचा फायदा असा की डेटा अधिक स्पष्ट होतो, आणि व्यवस्थापन करणेही सोपे होते.

### `struct` चे स्थान

नवशिक्यांसाठी, सहसा संरचना `ContentView` च्या बाहेर लिहिणे योग्य असते.

उदाहरणार्थ:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

अशाने रचना अधिक स्पष्ट होते, आणि वाचायलाही सोपी होते.

तुम्हाला दिसेल की `ContentView` स्वतःही प्रत्यक्षात एक `struct` आहे.

### `Movie` संरचना

आधीचा पाया तयार झाल्यावर, आपण एक चित्रपट संरचना परिभाषित करू शकतो:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

ही `Movie` नावाची संरचना आहे, ज्यात `name`、`director` आणि `rating` अशी तीन फील्ड्स आहेत, जी अनुक्रमे चित्रपटाचे नाव, दिग्दर्शक आणि रेटिंग दर्शवतात.

अशा प्रकारे, एका चित्रपटाशी संबंधित माहिती अनेक अॅरेमध्ये विभागून साठवण्याची गरज राहत नाही; ती थेट एकत्र करून एक पूर्ण घटक बनवता येते.

उदाहरणार्थ, आपण असा एक चित्रपट instance तयार करू शकतो:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

हा instance “एका पूर्ण चित्रपट डेटाचे” प्रतिनिधित्व करतो.

### अॅरेमध्ये संरचना साठवणे

आधी आपण म्हटले होते की अॅरे फक्त एकाच प्रकारचा डेटा साठवू शकते.

आता आपल्याकडे `Movie` ही संरचना आहे, त्यामुळे अॅरे अनेक `Movie` साठवू शकते.

```swift
let lists: [Movie] = []
```

उदाहरणार्थ:

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

या `lists` अॅरेमध्ये स्ट्रिंग्स नसून अनेक `Movie` instances साठवलेले आहेत.

म्हणजेच, अॅरेतील प्रत्येक घटक हा एक पूर्ण चित्रपट आहे.

अशा प्रकारे, आपल्याला चित्रपट यादी दाखवायची असेल, तर `ForEach` वापरून प्रत्येक चित्रपट एकामागोमाग वाचू शकतो.

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

इथले `movie in` म्हणजे, प्रत्येक फेरीत अॅरेमधून एक चित्रपट काढून त्याला तात्पुरते `movie` असे नाव दिले जाते.

त्यानंतर आपण वापरू शकतो:

```swift
movie.name
movie.director
movie.rating
```

आणि त्या एका चित्रपटाचे नाव, दिग्दर्शक आणि रेटिंग वेगवेगळे वाचून इंटरफेसवर दाखवू शकतो.

## `ForEach` त्रुटी

येथपर्यंत आपण चित्रपट अॅरे आणि `ForEach` चे मूलभूत लेखन पूर्ण केले आहे.

पण खालील कोड थेट चालवला तर:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

त्रुटी दिसेल:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

या त्रुटीचा अर्थ असा की, जेव्हा तुम्ही `id: \.self` लिहिता, तेव्हा SwiftUI ला अॅरेमधील प्रत्येक घटक स्वतःच “अद्वितीय ओळख” म्हणून वापरावा लागतो.

ही लेखनपद्धत `String`、`Int` सारख्या साध्या प्रकारांसाठी योग्य आहे, कारण ते स्वतःच सहज वेगळे ओळखता येतात.

परंतु `Movie` ही आपण स्वतः तयार केलेली संरचना आहे. `ForEach` ला ती स्वतःच अद्वितीय ओळख म्हणून कशी वापरायची हे माहीत नसल्याने त्रुटी येते.

ही समस्या सोडवण्याचा सर्वात सामान्य मार्ग म्हणजे: `Movie` ने `Identifiable` प्रोटोकॉलचे पालन करणे.

## प्रोटोकॉल

Swift मध्ये प्रोटोकॉल म्हणजे एक प्रकारचा “नियम” किंवा “अट” असे समजू शकतो.

तुम्ही याला आंतरराष्ट्रीय संघटनेतील करारासारखे समजू शकता: एखाद्या देशाला एखाद्या आंतरराष्ट्रीय संघटनेत सामील व्हायचे असेल, तर प्रथम त्या संघटनेने ठरवलेल्या काही नियमांची पूर्तता करावी लागते, काही माहिती जाहीर करावी लागते, आणि काही सामायिक नियमांचे पालन करावे लागते. या अटी पूर्ण झाल्यावरच तो देश त्यात सामील होऊ शकतो किंवा काही व्यवहारात सहभागी होऊ शकतो.

प्रोटोकॉल हाच तत्त्वानुसार काम करतो.

जेव्हा एखाद्या प्रकाराला एखादा प्रोटोकॉल स्वीकारायचा असतो, तेव्हा त्या प्रोटोकॉलने ठरवलेली सामग्री त्याने पूर्ण करावी लागते. या अटी पूर्ण झाल्यानंतरच त्या प्रकाराला संबंधित functionality वापरता येते.

मूलभूत लेखन:

```swift
struct Movie: Identifiable {
    // ...
}
```

इथे `: Identifiable` म्हणजे `Movie` ने `Identifiable` प्रोटोकॉलचे पालन केले आहे.

जर एखादा प्रकार अनेक प्रोटोकॉलचे पालन करत असेल, तर त्यांना स्वल्पविरामाने वेगळे करता येते:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` साठी सर्वात महत्त्वाची अट म्हणजे: त्या प्रकारात स्वतःला ओळखता येईल असे `id` असणे आवश्यक आहे.

उदाहरणार्थ:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

इथले `id` हे जणू ओळखपत्र क्रमांकासारखे आहे, जे प्रत्येक चित्रपट वेगळा ओळखण्यासाठी वापरले जाते.

जोपर्यंत प्रत्येक चित्रपटाचे `id` वेगळे आहे, तोपर्यंत SwiftUI अॅरेतील प्रत्येक घटक योग्यरीत्या वेगळा ओळखू शकते.

उदाहरणार्थ:

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

मग `ForEach` मध्ये असे वापरतो:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

असे केल्यावर त्रुटी येणार नाही.

कारण `Movie` आधीच `Identifiable` चे पालन करते, म्हणून अधिक सामान्य लेखनपद्धत म्हणजे `id:` थेट वगळणे:

```swift
ForEach(lists) { movie in
    // ...
}
```

कारण SwiftUI ला आधीच माहिती असते की `movie.id` वापरून प्रत्येक आयटम वेगळा ओळखायचा आहे.

## `ForEach` मधील ओळखचिन्ह

आता आपण `ForEach` मधील `id` ची भूमिका अधिक सखोलपणे समजून घेऊ.

उदाहरणार्थ:

```swift
ForEach(lists, id: \.self)
```

याचा अर्थ: घटक स्वतःच ओळखचिन्ह म्हणून वापरला जातो.

आणि:

```swift
ForEach(lists, id: \.id)
```

याचा अर्थ: घटकातील `id` फील्ड ओळखचिन्ह म्हणून वापरले जाते.

जर एखादे फील्ड स्वतःच अद्वितीय राहू शकत असेल, तर तात्पुरते तेही वापरता येते.

उदाहरणार्थ, प्रत्येक चित्रपटाचे नाव वेगळे असल्यास, खालील लेखन सध्याच्या डेटामध्ये व्यवस्थित चालू शकते:

```swift
ForEach(lists, id: \.name)
```

परंतु इथे एक लपलेली समस्या आहे: `name` कायम अद्वितीय असेलच असे नाही.

समजा पुढे तुम्ही त्याच नावाचा आणखी एक चित्रपट जोडला, तर `name` प्रत्येक घटक अचूक वेगळा ओळखू शकणार नाही.

त्या वेळी, कोड compile होऊ शकतो, पण view refresh, update, insert, delete करताना SwiftUI चुकीची ओळख करू शकते, आणि प्रदर्शनात त्रुटी येऊ शकतात.

म्हणून, जेव्हा डेटा स्थिरपणे वेगळा ओळखणे आवश्यक असते, तेव्हा खरेच अद्वितीय फील्ड म्हणजे `id` वापरणे उत्तम.

## UUID

जरी हाताने `id: 1`、`id: 2` अशा पद्धतीने लिहिणे समस्या सोडवू शकते, तरी अजून एक धोका उरतो: चुकून एकच `id` पुन्हा लिहिला जाऊ शकतो, आणि अद्वितीय ओळख निष्फळ होईल.

उदाहरणार्थ:

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

असे झाल्यास दोन सारखे `id` तयार होतात, आणि अद्वितीय ओळख निष्फळ होते.

हाताने होणाऱ्या चुका टाळण्यासाठी, आपण सहसा `UUID()` वापरतो.

Swift मध्ये `UUID()` हा 128-bit ओळखक्रमांक यादृच्छिकपणे तयार करतो. तो सामान्यतः अक्षरे आणि अंक असलेल्या लांब स्ट्रिंगसारखा दिसतो.

उदाहरणार्थ:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

इथला `UUID()` प्रत्यक्षात `UUID` प्रकारचा एक instance तयार करतो; तुम्ही त्याला आपोआप तयार होणारा “अद्वितीय क्रमांक” असे समजू शकता.

म्हणून प्रत्येकवेळी तयार होणारे मूल्य जवळजवळ कधीच पुनरावृत्त होत नाही, त्यामुळे ते `id` म्हणून वापरण्यास खूप योग्य आहे.

आपण `Movie` असे बदलू शकतो:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

या कोडचा अर्थ असा आहे की `Movie` संरचनेतील `id` फील्डला डीफॉल्टने नवीन `UUID` instance चे मूल्य दिले जाईल.

म्हणजेच, प्रत्येकवेळी आपण नवीन `Movie` तयार करतो तेव्हा, सिस्टीम आधीच आपोआप एक अद्वितीय `id` तयार करते.

`id` ला आधीच डीफॉल्ट मूल्य आहे, त्यामुळे नंतर `Movie` instances तयार करताना `id` हाताने भरावे लागत नाही.

उदाहरणार्थ:

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

जरी इथे `id` लिहिलेले नाही, तरी प्रत्यक्षात या चित्रपट instance कडे स्वतःचे `id` असते; फक्त ते मूल्य `UUID()` ने आपोआप तयार केलेले असते.

ही पद्धत वापरल्यावर, प्रत्येक चित्रपटासाठी `id` हाताने लिहावे लागत नाही, त्यामुळे कोडही कमी होतो आणि duplicate `id` मुळे होणाऱ्या चुका टाळता येतात.

शेवटी, आपल्याला फक्त वर एक `Banner` चित्र जोडायचे आहे, आणि मजकूर स्क्रोल होण्यासाठी `ScrollView` वापरायचे आहे; मग संपूर्ण चित्रपट यादी view पूर्ण होईल.

## सारांश

या धड्यात आपण एक अतिशय महत्त्वाची संकल्पना शिकली: `struct`.

`struct` च्या मदतीने आपण एका चित्रपटाची अनेक संबंधित फील्ड्स एकत्र करून एक संपूर्ण घटक बनवू शकतो, आणि नाव、दिग्दर्शक、रेटिंग यांना वेगवेगळ्या अॅरेमध्ये विभागून साठवण्याची गरज राहत नाही.

डेटा एकत्र केल्यानंतर, आपण `ForEach` वापरून अॅरेमधील प्रत्येक चित्रपट view मध्ये एकामागोमाग दाखवू शकतो.

त्याच वेळी, आपण `ForEach` मधील “ओळखचिन्ह” याची भूमिकाही समजून घेतली. SwiftUI ला अॅरेतील प्रत्येक घटक कसा वेगळा ओळखायचा हे माहित असणे आवश्यक आहे, तेव्हाच view योग्यरीत्या दाखवता आणि अपडेट करता येतो.

म्हणूनच, आपण `Movie` ला `Identifiable` प्रोटोकॉलचे पालन करण्यास सांगितले, आणि त्याला एक अद्वितीय `id` दिले.

`id` हाताने भरताना चुका होऊ नयेत म्हणून आपण `UUID()` ही अधिक पुढची संकल्पना शिकली, ज्यामुळे सिस्टीम आपोआप अद्वितीय ओळख तयार करते.

हा धडा पूर्ण झाल्यावर, तुम्ही केवळ एक चित्रपट यादी तयार केली नाही, तर SwiftUI मधील एक महत्त्वाचा विचारमार्गही समजू लागलात: **आधी डेटा व्यवस्थित करा, मग त्या डेटाच्या आधारे view तयार करा.**

## संपूर्ण कोड

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
