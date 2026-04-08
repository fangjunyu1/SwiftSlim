# సినిమా జాబితా

ఈ పాఠంలో మనం ఒక సినిమా జాబితాను తయారు చేస్తాము.

![movie](../../Resource/021_movie.png)

ఈ జాబితాలో ప్రతి సినిమా యొక్క పోస్టర్, పేరు, దర్శకుడు మరియు రేటింగ్ చూపబడుతుంది.

ఈ ఉదాహరణలో మనం ఒక చాలా ముఖ్యమైన భావాన్ని నేర్చుకుంటాము: `struct` నిర్మాణం. ఇది ఒక సినిమా గురించి ఉన్న అనేక సమాచారాలను కలిపి ఒక సంపూర్ణ రూపంగా మార్చడానికి సహాయపడుతుంది. అదనంగా, `UUID()`, `ForEach`, `Divider` విభజన రేఖ, అలాగే డేటాను నిర్వహించడానికి కస్టమ్ ఆబ్జెక్ట్‌లను ఎలా ఉపయోగించాలో కూడా నేర్చుకుంటాము.

ఈ జ్ఞానం తరువాతి SwiftUI అభివృద్ధిలో చాలా సాధారణంగా ఉపయోగపడుతుంది. ఈ పాఠం పూర్తయ్యే సరికి, మీరు కేవలం ఒక సినిమా జాబితాను తయారు చేయడమే కాకుండా, “ఒక డేటా సమూహాన్ని ఇంటర్‌ఫేస్‌గా ఎలా చూపించాలి” అన్నది కూడా అర్థం చేసుకోవడం ప్రారంభిస్తారు.

## ఒక సినిమా

మొదటగా, ఒక్క సినిమా కోసం ఉన్న ఇంటర్‌ఫేస్‌తో ప్రారంభించవచ్చు.

![movie](../../Resource/021_movie1.png)

ఈ ఇంటర్‌ఫేస్ అమరిక ప్రధానంగా రెండు భాగాలుగా ఉంటుంది: ఎడమవైపు సినిమా పోస్టర్, కుడివైపు సినిమా పరిచయం.

### సినిమా పోస్టర్

ఎడమవైపు సినిమా పోస్టర్ చూపబడుతుంది; చిత్రాన్ని చూపించడానికి `Image` ను ఉపయోగించవచ్చు.

ఉదాహరణకు:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

ఈ కోడ్ `"The Shawshank Redemption"` అనే పేరున్న చిత్రాన్ని చూపిస్తుంది అని అర్థం.

ఇక్కడ గమనించాల్సిన విషయం ఏమిటంటే, చిత్రం పేరు నిజంగా `Assets` వనరుల ఫోల్డర్‌లో ఉండాలి; లేకపోతే ఇంటర్‌ఫేస్ ఆ చిత్రాన్ని సరిగ్గా చూపించలేడు.

![movie](../../Resource/021_movie2.png)

ఈ modifiers యొక్క పనులు ఇవి:

- `resizable()` చిత్రం పరిమాణాన్ని మార్చవచ్చని సూచిస్తుంది.
- `scaledToFit()` పరిమాణం మార్చినప్పుడు అసలు నిష్పత్తి అలాగే ఉంచబడుతుందని సూచిస్తుంది; దాంతో చిత్రం లాగబడి వక్రీకరించబడదు.
- `frame(height: 180)` చిత్రం ఎత్తును 180గా ఉంచుతుంది.
- `cornerRadius(10)` చిత్రానికి 10 పరిమాణం గల గుండ్రని మూలలను ఇస్తుంది.

ఇలా మనకు సరైన పరిమాణంలో, గుండ్రని మూలలతో ఉన్న సినిమా పోస్టర్ చిత్రం లభిస్తుంది.

![movie](../../Resource/021_movie3.png)

### సినిమా పరిచయం

కుడివైపు సినిమా పరిచయం చూపబడుతుంది; ఇందులో సినిమా పేరు, దర్శకుడు, రేటింగ్ ఉంటాయి.

![movie](../../Resource/021_movie4.png)

ఈ భాగాన్ని చూపించడానికి `Text` ను ఉపయోగించవచ్చు:

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

ఈ కోడ్‌లో `.font` అక్షర పరిమాణాన్ని సూచిస్తుంది; `.fontWeight` అక్షరాల దృఢత్వాన్ని సూచిస్తుంది.

“సినిమా పేరు”, “దర్శకుడి సమాచారం”, “రేటింగ్ సమాచారం” మధ్య మరింత స్పష్టమైన అంతరం ఉండేందుకు, ఇక్కడ బాహ్యస్థాయిలో `VStack` ఉపయోగించి ఇలా సెట్ చేస్తాము:

```swift
spacing: 10
```

దీని అర్థం ఈ `VStack` లోని ప్రతి కంటెంట్ గుంపు మధ్య అంతరం 10గా ఉంటుంది.

దర్శకుడు మరియు రేటింగ్‌ను తలో `VStack` లో మళ్లీ చుట్టిపెట్టిన కారణం, అవి రెండూ “శీర్షిక + కంటెంట్” అనే నిర్మాణానికి చెందినవి. అందువల్ల ఇంటర్‌ఫేస్ స్థాయిలు మరింత స్పష్టంగా ఉంటాయి; తరువాత శైలిని మార్చడం కూడా సులభమవుతుంది.

అదనంగా, `VStack` డిఫాల్ట్‌గా మధ్యకు align అవుతుంది. మొత్తం వచనాన్ని ఎడమవైపు align చేయడానికి ఇలా సెట్ చేస్తాము:

```swift
alignment: .leading
```

ఇలా సినిమా పరిచయ భాగం మరింత శుభ్రంగా కనిపిస్తుంది.

### విభజన రేఖ

ఇప్పుడు, సినిమా పరిచయంలోని కంటెంట్ `spacing` వల్ల విడివిడిగా కనిపించినా, వేర్వేరు కంటెంట్‌ల మధ్య సరిహద్దు ఇంకా తగినంత స్పష్టంగా లేదు.

ఈ సమయంలో మనం ఒక విభజన రేఖను జోడించవచ్చు:

```swift
Divider()
```

ఉదాహరణకు:

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

ఇలా సినిమా పరిచయ భాగంలో మరింత స్పష్టమైన విభజన ప్రభావం కనిపిస్తుంది.

![movie](../../Resource/021_movie4.png)

`Divider` అనేది చాలా సరళమైనదే అయినా చాలా సాధారణంగా ఉపయోగించే view; దీని పని వేర్వేరు కంటెంట్‌లను విడదీయడం.

`VStack` లో `Divider()` ఒక సమాంతర రేఖలా కనిపిస్తుంది.

`HStack` లో `Divider()` ఒక నిలువు రేఖలా కనిపిస్తుంది.

అదనంగా, `.frame`, `.background`, `.padding` వంటి మార్గాల ద్వారా `Divider` యొక్క శైలిని మార్చవచ్చు.

ఉదాహరణకు:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

దీంతో 2 మందం ఉన్న, నీలి రంగులో, ఎడమ-కుడి padding కలిగిన విభజన రేఖ ఉత్పత్తి అవుతుంది.

![divider](../../Resource/021_divider.png)

### పూర్తి ఇంటర్‌ఫేస్

చివరిగా, సినిమా పోస్టర్ మరియు సినిమా పరిచయాన్ని ఎడమ-కుడి పక్కపక్కనే అమర్చడానికి `HStack` ను ఉపయోగించవచ్చు.

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

ఇక్కడ `HStack(spacing: 20)` అంటే ఎడమ మరియు కుడి భాగాల మధ్య 20 అంతరం ఉంచబడుతుంది.

గమనించాల్సిన విషయం ఏమిటంటే, `Divider()` అలాగే ముందుగా చూసిన `TextField`, `Slider` లాగానే, డిఫాల్ట్‌గా అందుబాటులో ఉన్న స్థలాన్ని వీలైనంత ఎక్కువగా ఆక్రమించడానికి ప్రయత్నిస్తుంది.

అందువల్ల, కుడివైపు పరిచయ భాగానికి ఉన్న బాహ్య `VStack` కు స్థిరమైన వెడల్పును ఇస్తాము:

```swift
.frame(width: 200)
```

ఇలా చేస్తే విభజన రేఖ వెడల్పు మరియు టెక్స్ట్ ప్రాంతం వెడల్పు ఒకేలా ఉంటుంది; మొత్తం రూపం మరింత శుభ్రంగా కనిపిస్తుంది.

ఇక్కడికి వచ్చేసరికి, “ఒక సినిమా” చూపించే ఇంటర్‌ఫేస్ పూర్తయింది.

![movie](../../Resource/021_movie1.png)

## array లో సినిమాలను నిల్వచేయడం

ఒకే శైలిలో అనేక సినిమాలను వరుసగా చూపించాలంటే, ప్రతి సినిమాకి ఇలాంటి కోడ్ మళ్లీ మళ్లీ వ్రాయాల్సి వస్తుంది.

ఉదాహరణకు:

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

ఇలా వ్రాసిన కోడ్ ఫలితాన్ని ఇవ్వగలదు; కానీ కోడ్ పెరుగుతూ ఉంటుంది, దాన్ని నిర్వహించడం కూడా చాలా కష్టమవుతుంది.

ఉదాహరణకు, అన్ని సినిమాల spacing ను `20` నుండి `15` కు మార్చాలన్నా, లేదా కుడి భాగం వెడల్పును `200` నుండి
`220` కు మార్చాలన్నా, ప్రతి పునరావృత కోడ్ భాగాన్ని చేతితో మార్చాలి.

ఇది స్పష్టంగా సమర్థవంతమైన పద్ధతి కాదు.

మనం ముందుగా array లను నేర్చుకున్నాము; array ఆధారంగా view లను పునరావృతంగా చూపించడానికి `ForEach` ఎలా ఉపయోగించాలో కూడా నేర్చుకున్నాము.

ఉదాహరణకు:

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

ఈ విధానం “ఒకే ఒక రకమైన డేటా” ఉన్న సందర్భాలకు బాగా సరిపోతుంది; ఉదాహరణకు చిత్రాల పేర్ల సమూహం.

కానీ, ఒక సినిమా అనేది ఒక్క విలువ మాత్రమే కాదు. కనీసం ఇందులో ఇవి ఉంటాయి:

1. సినిమా పోస్టర్
2. సినిమా పేరు
3. దర్శకుడు
4. రేటింగ్

అంటే, ఒక సినిమా అనేది వాస్తవానికి పరస్పర సంబంధం ఉన్న డేటా సమూహం; అది ఒక్క string కాదు.

మనము array మాత్రమే ఉపయోగిస్తే, ఈ సమాచారాన్ని విడివిడిగా మాత్రమే నిల్వ చేయగలం:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

చూపించేటప్పుడు, వాటిని ఒక్కొక్కటిగా సరిపోల్చడానికి ఒకే index పై ఆధారపడాల్సి ఉంటుంది:

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

ఈ విధమైన వ్రాత పద్ధతిలో ఉన్న సమస్య ఏమిటంటే, దాని నిర్వహణ వ్యయం చాలా ఎక్కువ.

ఎందుకంటే, ఒక సినిమా యొక్క డేటా అనేక array లలో చెల్లాచెదురుగా ఉంటుంది. ఒక array లో ఒక item ఎక్కువైనా, తక్కువైనా, లేదా క్రమం మారినా, చూపే ఫలితం తప్పుగా ఉంటుంది.

ప్రత్యేకంగా, కొత్త సినిమాలను జోడించేటప్పుడు లేదా తొలగించేటప్పుడు, మీరు ఒకేసారి అనేక array లను మార్చాలి; ఏదైనా ఒకటి మిస్ కావడం చాలా సులభం.

అయితే, “సినిమా పేరు, దర్శకుడు, రేటింగ్” వంటి సమాచారాన్ని ఒకే మొత్తం రూపంలో ఎలా కలపాలి?

దాని కోసం `struct` అవసరం.

## `struct` నిర్మాణాన్ని నిర్వచించడం

Swift లో, `struct` అంటే “నిర్మాణం”.

దాన్ని మీరు “కస్టమ్ డేటా టైప్” గా అర్థం చేసుకోవచ్చు; ఇది అనేక సంబంధిత fields ను ఒకే మొత్తంగా కలపగలదు.

అడిపాయ ఉపయోగం:

```swift
struct StructName {
	let name: String
}
```

ఈ కోడ్‌లో `struct` అనేది మనం ఒక నిర్మాణాన్ని నిర్వచిస్తున్నామని చెప్పే keyword. `StructName` అనేది ఆ నిర్మాణం పేరు.

వంకర బ్రాకెట్లలో ఉన్నవి ఈ నిర్మాణంలోని fields; ప్రతి field కు పేరు మరియు type స్పష్టంగా వ్రాయాలి.

సాధారణంగా, `struct` పేరు పెద్ద అక్షరంతో ప్రారంభమవుతుంది, ఉదాహరణకు `Movie`, `Student`, `UserInfo`. ఇది Swift లో సాధారణ naming convention.

`struct` ను ఒక ఖాళీ ప్యాకేజింగ్ పెట్టెలా సులభంగా ఊహించవచ్చు; అందులో ప్రతి field అంటే ఆ పెట్టెలో ముందుగా ఉంచిన ఖాళీ స్థలం.

ఈ స్థలాలు ఇంకా నింపబడకపోతే, అది కేవలం ఖాళీ పెట్టె మాత్రమే. అన్ని fields సరైన విలువలతో నింపబడిన తర్వాతే అది ఒక సంపూర్ణ బహుమతి పెట్టెగా మారుతుంది.

### `struct` instance

ఇప్పటివరకు మనం నిర్మాణాన్ని మాత్రమే నిర్వచించాము; అంటే ఒక ప్యాకేజింగ్ పెట్టె ఆకారాన్ని సిద్ధం చేశాము.

ఇప్పుడు అందులో నిర్దిష్టమైన కంటెంట్‌ను నింపాలి; అప్పుడు మాత్రమే ఉపయోగించగల “instance” లభిస్తుంది.

instance సృష్టించేటప్పుడు, సాధారణంగా నిర్మాణం పేరుకు తర్వాత `()` ఉంచుతారు:

```swift
StructName(...)
```

ఈ కొటేషన్‌లలో నింపబడేది, ఆ నిర్మాణానికి అవసరమైన field values.

ఉదాహరణకు:

```swift
StructName(name: "Fang Junyu")
```

ఈ కోడ్ అంటే: `StructName` నిర్మాణం ఆకారాన్ని అనుసరించి ఒక కొత్త instance ను సృష్టించు, మరియు `name` field కు `"Fang Junyu"` అనే విలువను ఇవ్వు.

అన్ని అవసరమైన field values నింపిన తర్వాత, అది ఆ పెట్టెను పూర్తిగా నింపినట్టే.

అప్పుడు మనకు ఒక సంపూర్ణ `struct` instance లభిస్తుంది.

### `struct` లక్షణాలకు ప్రాప్తి

ఒక instance సృష్టించిన తర్వాత, దాని లోపలి లక్షణాలను “dot syntax” తో ప్రాప్తి చేయవచ్చు.

అడిపాయ రాయు విధానం:

```swift
instance.propertyName
```

ఉదాహరణకు:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

ఇక్కడ `st` ఒక `struct` instance; `st.name` అంటే ఆ instance లోని `name` విలువను చదవడం.

ఈ చదివే విధానాన్ని ఇలా అర్థం చేసుకోవచ్చు: మనం `st.name` అని వ్రాస్తే, అది ఆ పెట్టెలో ఒక నిర్దిష్ట స్థానంలో ఉంచిన విషయాన్ని చదవడం లాంటిది.

ఈ విధమైన రాత SwiftUI ఇంటర్‌ఫేస్‌లలో తరచుగా కనిపిస్తుంది.

ఉదాహరణకు, పేరు, వయస్సు, తరగతి ఉన్న ఒక student నిర్మాణం ఉంటే, ఇంటర్‌ఫేస్‌లో చూపేటప్పుడు విడిగా ఇలా చదవచ్చు:

```swift
student.name
student.age
student.className
```

దీని ప్రయోజనం ఏమిటంటే, డేటా మరింత స్పష్టంగా ఉంటుంది; నిర్వహించడమూ సులభం.

### `struct` ఉంచే స్థానం

ప్రారంభస్థాయి వారికి సాధారణంగా నిర్మాణాన్ని `ContentView` కి బయట వ్రాయడం సులభంగా ఉంటుంది.

ఉదాహరణకు:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

ఇలా చేస్తే నిర్మాణం మరింత స్పష్టంగా ఉంటుంది; చదవడమూ సులభంగా ఉంటుంది.

`ContentView` కూడా వాస్తవానికి ఒక `struct` అనే విషయాన్ని మీరు గమనిస్తారు.

### `Movie` నిర్మాణం

పై ఉన్న పునాదితో, ఇప్పుడు మనం ఒక సినిమా నిర్మాణాన్ని నిర్వచించవచ్చు:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

ఇది `Movie` అనే పేరున్న ఒక నిర్మాణం; ఇది `name`, `director`, `rating` అనే మూడు fields కలిగి ఉంటుంది. ఇవి వరుసగా సినిమా పేరు, దర్శకుడు, రేటింగ్‌ను సూచిస్తాయి.

ఇలా చేస్తే, ఒక సినిమాకు సంబంధించిన సమాచారాన్ని అనేక array లుగా విడదీసి నిల్వ చేయాల్సిన అవసరం ఉండదు; వాటిని నేరుగా ఒకే మొత్తంగా కలపవచ్చు.

ఉదాహరణకు, ఈ విధంగా ఒక సినిమా instance ను సృష్టించవచ్చు:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

ఈ instance “ఒక సంపూర్ణ సినిమా డేటా” ను సూచిస్తుంది.

### నిర్మాణాలను array-ఇలో నిల్వచేయడం

ముందుగా మనం array ఒకే type ను మాత్రమే నిల్వచేయగలదని చెప్పాము.

ఇప్పుడు మనకు `Movie` నిర్మాణం ఉంది; కాబట్టి array అనేక `Movie` values ను నిల్వచేయగలదు.

```swift
let lists: [Movie] = []
```

ఉదాహరణకు:

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

ఈ `lists` array లో strings కాకుండా, అనేక `Movie` instances నిల్వచేయబడ్డాయి.

అంటే, array లోని ప్రతి element ఒక సంపూర్ణ సినిమానే.

అప్పుడు, సినిమా జాబితాను చూపించాల్సినప్పుడు, `ForEach` ద్వారా ప్రతి సినిమాను వరుసగా చదవవచ్చు.

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

ఇక్కడ `movie in` అంటే, ప్రతి loop సమయంలో array నుంచి ఒక సినిమా తీసుకుని, దానికి తాత్కాలికంగా `movie` అని పేరు పెట్టడం.

తర్వాత మనం ఇవి ఉపయోగించవచ్చు:

```swift
movie.name
movie.director
movie.rating
```

ఆ సినిమా పేరు, దర్శకుడు, రేటింగ్‌ను విడివిడిగా చదివి ఇంటర్‌ఫేస్‌లో చూపించడానికి.

## `ForEach` లో లోపం

ఇక్కడివరకు మనం సినిమా array మరియు `ForEach` యొక్క ప్రాథమిక రాత విధానాన్ని పూర్తి చేశాము.

కానీ క్రింది కోడ్‌ను నేరుగా నడిపితే:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ఒక లోపం వస్తుంది:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

ఈ లోపం అర్థం ఏమిటంటే, మీరు `id: \.self` అని వ్రాసినప్పుడు, SwiftUI array లోని ప్రతి element ని “ప్రత్యేక గుర్తింపు”గా ఉపయోగించి వాటిని వేరుచేయాలి.

ఈ రాత విధానం `String`, `Int` వంటి సులభమైన types కు సరిపోతుంది; ఎందుకంటే వాటిని స్వయంగా వేరుచేయడం సులభం.

కానీ `Movie` అనేది మనం నిర్వచించిన custom నిర్మాణం. దానినే ప్రత్యేక గుర్తింపుగా ఎలా ఉపయోగించాలో `ForEach` కి తెలియదు. అందుకే ఈ లోపం వస్తుంది.

ఈ సమస్యకు అత్యంత సాధారణ పరిష్కారం: `Movie` ను `Identifiable` protocol ను అనుసరించేలా చేయడం.

## ప్రోటోకాల్

Swift లో ప్రోటోకాల్ ను ఒక రకమైన “నియమం” లేదా “అవసరం”గా అర్థం చేసుకోవచ్చు.

దాన్ని ఒక అంతర్జాతీయ సంస్థలోని ఒప్పందంలా ఊహించవచ్చు: ఒక దేశం ఏదైనా అంతర్జాతీయ సంస్థలో చేరాలనుకుంటే, ఆ సంస్థ నిర్దేశించిన కొన్ని నియమాలను ముందుగా పాటించాలి, కొన్ని డేటాను వెల్లడించాలి, కొన్ని సాధారణ నియమాలను అనుసరించాలి. ఈ షరతులు నెరవేరిన తర్వాతే ఆ సంస్థలో చేరగలదు లేదా కొన్ని విషయాల్లో పాల్గొనగలదు.

ప్రోటోకాల్ కూడా ఇదే తర్కంతో పనిచేస్తుంది.

ఏదైనా type ఒక ప్రోటోకాల్ ను అనుసరించాలనుకుంటే, ఆ ప్రోటోకాల్ కోరిన విషయాలను తీరవలసి ఉంటుంది. ఈ అవసరాలు నెరవేరిన తర్వాతే ఆ type సంబంధిత functionality ను ఉపయోగించగలదు.

అడిపాయ రాయు విధానం:

```swift
struct Movie: Identifiable {
    // ...
}
```

ఇక్కడ `: Identifiable` అంటే `Movie` `Identifiable` protocol ను అనుసరిస్తోంది అని అర్థం.

ఒక type అనేక protocols ను అనుసరిస్తే, వాటిని comma తో వేరు చేయవచ్చు:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` కోసం అత్యంత ముఖ్యమైన అవసరం: type లో దానిని తానే గుర్తించగల `id` ఉండాలి.

ఉదాహరణకు:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

ఇక్కడ `id` అనేది గుర్తింపు కార్డు సంఖ్యలాంటిది; ప్రతి సినిమాను వేరుచేయడానికి ఉపయోగించబడుతుంది.

ప్రతి సినిమాకీ వేర్వేరు `id` ఉన్నంత వరకు, SwiftUI array లోని ప్రతి element ను సరిగ్గా వేరుచేయగలదు.

ఉదాహరణకు:

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

తర్వాత `ForEach` లో ఇలా వాడవచ్చు:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

ఇలా చేస్తే లోపం రాదు.

ఎందుకంటే `Movie` ఇప్పటికే `Identifiable` ను అనుసరిస్తోంది; అందుకే `id:` ను నేరుగా వదిలేయడం మరింత సాధారణమైన విధానం:

```swift
ForEach(lists) { movie in
    // ...
}
```

ఎందుకంటే SwiftUI ప్రతి item ను వేరుచేయడానికి `movie.id` ను ఉపయోగించాలనే విషయం ముందే తెలుసుకుని ఉంటుంది.

## `ForEach` లో వేరుచేసే గుర్తింపు

ఇప్పుడు `ForEach` లో `id` పాత్ర ఏమిటో లోతుగా అర్థం చేసుకుందాం.

ఉదాహరణకు:

```swift
ForEach(lists, id: \.self)
```

దీని అర్థం: element నే వేరుచేసే గుర్తింపుగా ఉపయోగించు.

అలాగే:

```swift
ForEach(lists, id: \.id)
```

అంటే: element లోని `id` field ను వేరుచేసే గుర్తింపుగా ఉపయోగించు.

ఏదైనా ఒక field స్వయంగా uniqueness ను హామీ ఇవ్వగలిగితే, తాత్కాలికంగా దానినీ ఉపయోగించవచ్చు.

ఉదాహరణకు, ప్రతి సినిమాకీ పేరు వేర్వేరుగా ఉంటే, ప్రస్తుతం ఉన్న డేటాలో ఈ విధమైన రాత కూడా సరిగ్గా పనిచేయవచ్చు:

```swift
ForEach(lists, id: \.name)
```

అయితే ఇక్కడ ఒక దాగి ఉన్న సమస్య ఉంది: `name` ఎప్పుడూ ప్రత్యేకంగా ఉండకపోవచ్చు.

తరువాత మీరు అదే పేరుతో ఇంకొక సినిమాను జోడించారని భావించండి; అప్పుడు `name` ప్రతి element ను ఖచ్చితంగా వేరుచేయలేడు.

ఆ పరిస్థితిలో code compile కావచ్చు; కానీ view refresh, update, insert, delete సమయంలో SwiftUI తప్పుగా గుర్తించవచ్చు; దాంతో కாட்சி సరిగా ఉండదు.

కాబట్టి, డేటాను స్థిరంగా వేరుచేయాల్సిన సందర్భంలో, నిజంగా ప్రత్యేకమైన field అయిన `id` ను ఉపయోగించడం మంచిది.

## UUID

`id: 1`, `id: 2` లాగా చేతితో వ్రాయడం సమస్యను పరిష్కరించవచ్చు; అయినప్పటికీ ఒక ప్రమాదం ఉంటుంది: పొరపాటున ఒకే `id` మళ్లీ వ్రాయబడవచ్చు. అప్పుడు ప్రత్యేక గుర్తింపు పనిచేయదు.

ఉదాహరణకు:

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

ఇలా రెండు ఒకే `id` లు వస్తాయి; ప్రత్యేక గుర్తింపు పనిచేయదు.

చేతిపనిలో జరిగే పొరపాట్లను నివారించడానికి, మనం సాధారణంగా `UUID()` ను ఉపయోగిస్తాము.

Swift లో, `UUID()` యాదృచ్ఛికంగా ఒక 128-bit గుర్తింపును సృష్టిస్తుంది. ఇది సాధారణంగా అక్షరాలు, సంఖ్యలతో కూడిన ఒక పొడవైన string గా కనిపిస్తుంది.

ఉదాహరణకు:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

ఇక్కడ `UUID()` వాస్తవానికి `UUID` రకానికి చెందిన ఒక instance ను సృష్టిస్తుంది; దాన్ని స్వయంచాలకంగా సృష్టించబడిన “ప్రత్యేక సంఖ్య”గా అర్థం చేసుకోవచ్చు.

అందువల్ల, ప్రతి సారి సృష్టించబడే value దాదాపుగా ఎప్పుడూ పునరావృతం కాదు; కాబట్టి అది `id` గా ఉపయోగించడానికి చాలా అనుకూలంగా ఉంటుంది.

మనము `Movie` ను ఇలా మార్చవచ్చు:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ఈ కోడ్ అంటే `Movie` నిర్మాణంలోని `id` field కు default గా ఒక కొత్త `UUID` instance value ఇవ్వబడుతుంది.

అంటే, ప్రతిసారి ఒక కొత్త `Movie` సృష్టించినప్పుడు, system ముందుగానే దానికి ఒక ప్రత్యేకమైన `id` ను స్వయంచాలకంగా తయారు చేస్తుంది.

`id` కి ఇప్పటికే default value ఉన్నందున, తరువాత `Movie` instances సృష్టించేటప్పుడు `id` ను చేతితో నింపాల్సిన అవసరం ఉండదు.

ఉదాహరణకు:

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

ఇక్కడ `id` వ్రాయబడకపోయినా, ఈ సినిమా instance కి వాస్తవానికి తన సొంత `id` ఉంటుంది; ఆ value ఇప్పటికే `UUID()` ద్వారా స్వయంచాలకంగా తయారైంది.

ఈ పద్ధతిని ఉపయోగించిన తర్వాత, ప్రతి సినిమాకీ `id` ను చేతితో నింపాల్సిన అవసరం ఉండదు; ఇది code ను తగ్గించడమే కాకుండా duplicate id వల్ల వచ్చే పొరపాట్లను కూడా నివారిస్తుంది.

చివరికి, పైభాగంలో ఒక `Banner` చిత్రాన్ని జోడించి, కంటెంట్ scroll అవ్వడానికి `ScrollView` ను ఉపయోగిస్తే, మొత్తం సినిమా జాబితా view పూర్తవుతుంది.

## సారాంశం

ఈ పాఠంలో, మనం ఒక చాలా ముఖ్యమైన భావాన్ని నేర్చుకున్నాం: `struct`.

`struct` ద్వారా, ఒక సినిమాకు చెందిన అనేక సంబంధిత fields ను ఒకే మొత్తం రూపంలో కలపవచ్చు; పేరు, దర్శకుడు, రేటింగ్‌లను వేర్వేరు array లలో విడగొట్టాల్సిన అవసరం లేదు.

డేటా కలిపిన తర్వాత, `ForEach` ను ఉపయోగించి array లోని ప్రతి సినిమాను ఒక్కొక్కటిగా view లో చూపించవచ్చు.

అదే సమయంలో, `ForEach` లోని “వేరుచేసే గుర్తింపు” అనే భావం పాత్రను కూడా అర్థం చేసుకున్నాం. SwiftUI కి array లోని ప్రతి element ను ఎలా వేరుచేయాలో తెలిసి ఉండాలి; అప్పుడు మాత్రమే view సరిగ్గా చూపించబడుతుంది మరియు నవీకరించబడుతుంది.

అందుకే, `Movie` ను `Identifiable` protocol ను అనుసరించేలా చేసి, దానికి ప్రత్యేకమైన `id` ను ఇచ్చాము.

`id` ను చేతితో నింపేటప్పుడు పొరపాట్లు రాకుండా ఉండేందుకు, system స్వయంచాలకంగా ప్రత్యేక గుర్తింపును సృష్టించే `UUID()` గురించీ మరింతగా నేర్చుకున్నాం.

ఈ పాఠం పూర్తయ్యే సరికి, మీరు ఒక సినిమా జాబితాను పూర్తి చేసినట్టే కాకుండా, SwiftUI లోని ఒక ముఖ్యమైన ఆలోచనా విధానాన్ని కూడా అర్థం చేసుకోవడం ప్రారంభిస్తారు: **మొదట డేటాను సక్రమపరచు, తరువాత ఆ డేటా ఆధారంగా view ని సృష్టించు.**

## పూర్తి కోడ్

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
