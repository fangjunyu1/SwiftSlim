# ફિલ્મ યાદી

આ પાઠમાં, આપણે એક ફિલ્મ યાદી બનાવશો.

![movie](../../Resource/021_movie.png)

યાદીમાં દરેક ફિલ્મનું પોસ્ટર, નામ, દિગ્દર્શક અને રેટિંગ બતાવવામાં આવશે.

આ ઉદાહરણમાં, આપણે એક ખૂબ જ મહત્વપૂર્ણ મુદ્દો શીખીશું: `struct` રચના. તે એક ફિલ્મની ઘણી માહિતી એક સંપૂર્ણ એકમમાં જોડવામાં મદદ કરી શકે છે. આ ઉપરાંત, આપણે `UUID()`、`ForEach`、`Divider` વિભાગ રેખા અને કસ્ટમ ઑબ્જેક્ટ્સનો ઉપયોગ કરીને ડેટા કેવી રીતે મેનેજ કરવો તે પણ શીખીશું.

આ જ્ઞાન આગળના SwiftUI વિકાસમાં ખૂબ સામાન્ય છે. આ પાઠ શીખ્યા પછી, તમે માત્ર ફિલ્મ યાદી બનાવી શકશો એટલું જ નહીં, પણ “એક ડેટાના સમૂહને ઈન્ટરફેસ તરીકે કેવી રીતે બતાવવું” તે પણ સમજવા લાગશો.

## એકલ ફિલ્મ

અમે પહેલા એક ફિલ્મના ઈન્ટરફેસથી શરૂઆત કરી શકીએ.

![movie](../../Resource/021_movie1.png)

આ ઈન્ટરફેસનું લેઆઉટ મુખ્યત્વે બે ભાગોથી બનેલું છે: ડાબી બાજુ ફિલ્મનું પોસ્ટર છે, અને જમણી બાજુ ફિલ્મનો પરિચય છે.

### ફિલ્મનું પોસ્ટર

ડાબી બાજુ ફિલ્મનું પોસ્ટર બતાવવામાં આવે છે, અને અમે ચિત્ર બતાવવા માટે `Image` નો ઉપયોગ કરી શકીએ.

ઉદાહરણ તરીકે:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

આ કોડનો અર્થ છે કે `"The Shawshank Redemption"` નામનું ચિત્ર બતાવવામાં આવે છે.

અહીં ધ્યાન રાખવાની જરૂર છે કે ચિત્રનું નામ `Assets` રિસોર્સ ફોલ્ડરમાં ખરેખર હાજર હોવું જોઈએ, નહીં તો ઈન્ટરફેસ આ ચિત્રને યોગ્ય રીતે બતાવી શકશે નહીં.

![movie](../../Resource/021_movie2.png)

આ મોડિફાયરોના કાર્યો અનુક્રમે આ પ્રમાણે છે:

- `resizable()` નો અર્થ છે કે ચિત્રનું કદ બદલાવી શકાય છે.
- `scaledToFit()` નો અર્થ છે કે સ્કેલ કરતી વખતે મૂળ પ્રમાણ જળવાઈ રહે, જેથી ચિત્ર ખેંચાઈને વિકૃત ન થાય.
- `frame(height: 180)` નો અર્થ છે કે ચિત્રની ઊંચાઈ 180 નક્કી કરવામાં આવે છે.
- `cornerRadius(10)` નો અર્થ છે કે ચિત્રને 10 ના ગોળ ખૂણા અપાય છે.

આ રીતે, આપણે યોગ્ય કદ અને ગોળ ખૂણાવાળું ફિલ્મ પોસ્ટર ચિત્ર મેળવી શકીએ છીએ.

![movie](../../Resource/021_movie3.png)

### ફિલ્મનો પરિચય

જમણી બાજુ ફિલ્મનો પરિચય બતાવવામાં આવે છે, જેમાં ફિલ્મનું નામ, દિગ્દર્શક અને રેટિંગ શામેલ છે.

![movie](../../Resource/021_movie4.png)

આ ભાગ બતાવવા માટે આપણે `Text` નો ઉપયોગ કરી શકીએ:

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

આ કોડમાં, `.font` ફૉન્ટનું કદ દર્શાવે છે, અને `.fontWeight` ફૉન્ટની જાડાઈ દર્શાવે છે.

“ફિલ્મનું નામ”, “દિગ્દર્શકની માહિતી” અને “રેટિંગ માહિતી” વચ્ચે વધુ સ્પષ્ટ અંતર રહે તે માટે, અહીં બહારની સ્તરે `VStack` નો ઉપયોગ કરવામાં આવ્યો છે અને સેટ કરવામાં આવ્યું છે:

```swift
spacing: 10
```

આનો અર્થ એ છે કે આ `VStack` ની અંદર દરેક સામગ્રી સમૂહ વચ્ચેનું અંતર 10 છે.

દિગ્દર્શક અને રેટિંગને અલગથી ફરી એક `VStack` થી આવરવાના કારણ એ છે કે તેઓ બંને “શીર્ષક + સામગ્રી” જેવી રચનાનો ભાગ છે. તેથી ઈન્ટરફેસની સ્તરબદ્ધતા વધુ સ્પષ્ટ બને છે અને પછી સ્ટાઇલ એડજસ્ટ કરવી પણ વધુ સરળ બને છે.

ઉપરાંત, `VStack` મૂળરૂપે મધ્યમાં એલાઇન થાય છે. આખા લખાણને ડાબી બાજુ એલાઇન કરવા માટે, અમે સેટ કરીએ છીએ:

```swift
alignment: .leading
```

આથી ફિલ્મ પરિચયનો ભાગ વધુ ગોઠવાયેલો લાગે છે.

### વિભાગ રેખા

હવે, ફિલ્મના પરિચયમાં રહેલી સામગ્રી `spacing` દ્વારા અલગ કરવામાં આવી છે, પરંતુ અલગ સામગ્રી વચ્ચેની સરહદ હજુ પૂરતી સ્પષ્ટ નથી.

આ સમયે, આપણે વિભાગ રેખા ઉમેરી શકીએ:

```swift
Divider()
```

ઉદાહરણ તરીકે:

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

આ રીતે, ફિલ્મ પરિચયનો ભાગ વધુ સ્પષ્ટ વિભાગ અસર પ્રાપ્ત કરશે.

![movie](../../Resource/021_movie4.png)

`Divider` એક ખૂબ જ સરળ પરંતુ ઘણી વાર ઉપયોગમાં લેવાતો view છે, જેના કામનું મૂળ તત્વ અલગ સામગ્રીને અલગ કરવાનું છે.

`VStack` માં, `Divider()` આડી રેખા તરીકે દેખાય છે.

`HStack` માં, `Divider()` ઊભી રેખા તરીકે દેખાય છે.

આ ઉપરાંત, `.frame`、`.background`、`.padding` વગેરે દ્વારા `Divider` ની સ્ટાઇલમાં ફેરફાર પણ કરી શકાય છે.

ઉદાહરણ તરીકે:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

આ 2 જાડાઈની અને બન્ને બાજુ આડું પેડિંગ ધરાવતી નીલી વિભાગ રેખા બનાવશે.

![divider](../../Resource/021_divider.png)

### સંપૂર્ણ ઈન્ટરફેસ

છેલ્લે, આપણે `HStack` નો ઉપયોગ કરીને ફિલ્મનું પોસ્ટર અને ફિલ્મનો પરિચય બાજુ બાજુ ગોઠવી શકીએ.

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

અહીં, `HStack(spacing: 20)` નો અર્થ છે કે ડાબા અને જમણા ભાગ વચ્ચે 20 નું અંતર રાખવામાં આવશે.

ધ્યાન રાખવાનું છે કે `Divider()` પણ અગાઉ જોવાયેલા `TextField` અને `Slider` જેવી રીતે મૂળરૂપે શક્ય તેટલી ઉપલબ્ધ જગ્યા લેવાનો પ્રયાસ કરે છે.

તેથી, અમે જમણી બાજુના પરિચય ભાગના બહારના `VStack` માટે એક નિશ્ચિત પહોળાઈ સેટ કરીએ છીએ:

```swift
.frame(width: 200)
```

આ રીતે વિભાગ રેખા અને લખાણ વિસ્તારની પહોળાઈ સમાન રહી શકે છે, જેથી આખું દૃશ્ય વધુ ગોઠવાયેલું લાગે છે.

અહીં સુધી, આપણે “એકલ ફિલ્મ” માટેનું પ્રદર્શન ઈન્ટરફેસ પૂર્ણ કર્યું છે.

![movie](../../Resource/021_movie1.png)

## એરેમાં ફિલ્મો સાચવવી

જો આપણે એક જ સ્ટાઇલમાં ઘણી ફિલ્મો એક પછી એક બતાવવી હોય, તો તેનો અર્થ છે કે દરેક ફિલ્મ માટે એકસરખો કોડ ફરી લખવો પડશે.

ઉદાહરણ તરીકે:

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

આ રીતે લખાયેલ કોડ અસર તો મેળવી શકે છે, પરંતુ કોડ સતત વધતો જશે અને તેની જાળવણી બહુ મુશ્કેલ બનશે.

ઉદાહરણ તરીકે, જો બધાં ફિલ્મો વચ્ચેનું અંતર `20` થી `15` કરવું હોય, અથવા જમણી બાજુની પહોળાઈ `200` થી
`220` કરવી હોય, તો દરેક પુનરાવર્તિત કોડને હાથથી બદલવો પડશે.

આ સ્પષ્ટ રીતે અસરકારક પદ્ધતિ નથી.

અમે અગાઉ એરે શીખ્યાં હતાં, અને `ForEach` નો ઉપયોગ કરીને એરેના આધાર પર view ને પુનરાવર્તિત રીતે બતાવવું પણ શીખ્યાં હતાં.

ઉદાહરણ તરીકે:

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

આ રીત “માત્ર એક જ પ્રકારનું ડેટા” હોય એવી પરિસ્થિતિ માટે ખૂબ યોગ્ય છે, જેમ કે થોડાં ચિત્રોના નામોનો સમૂહ.

પરંતુ એક ફિલ્મમાં માત્ર એક જ મૂલ્ય નથી. તેમાં ઓછામાં ઓછું આ શામેલ છે:

1. ફિલ્મનું પોસ્ટર
2. ફિલ્મનું નામ
3. દિગ્દર્શક
4. રેટિંગ

એટલે કે, એક ફિલ્મ હકીકતમાં સંબંધિત ડેટાનો સમૂહ છે, માત્ર એક સ્ટ્રિંગ નથી.

જો આપણે ફક્ત એરેનો ઉપયોગ કરીએ, તો આ માહિતી ફક્ત અલગ અલગ રીતે જ સાચવી શકીએ:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

બતાવતી વખતે, એ જ ઇન્ડેક્સ પર આધાર રાખીને અમારે તેમને એક પછી એક મેળવો પડશે:

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

આ લખાણની સમસ્યા એ છે કે તેની જાળવણીનો ખર્ચ ખૂબ ઊંચો છે.

કારણ કે એક ફિલ્મનો ડેટા ઘણા એરેમાં ફેલાઈ જાય છે. કોઈ પણ એક એરેમાં એક આઇટમ વધુ હોય, ઓછો હોય અથવા ક્રમ અલગ હોય, તો પ્રદર્શનનું પરિણામ ખોટું આવશે.

ખાસ કરીને ફિલ્મ ઉમેરતી કે કાઢતી વખતે, તમારે એક સાથે અનેક એરે બદલવા પડે છે, અને કંઈક રહી જવું ખૂબ સરળ છે.

તો પછી “ફિલ્મનું નામ, દિગ્દર્શક અને રેટિંગ” જેવી માહિતીને એક સંપૂર્ણ એકમમાં કેવી રીતે જોડવી?

તે માટે `struct` જરૂરી છે.

## struct રચનાની વ્યાખ્યા

Swift માં, `struct` નો અર્થ “રચના” થાય છે.

તમે તેને એક “કસ્ટમ ડેટા પ્રકાર” તરીકે સમજી શકો છો, જે અનેક સંબંધિત fields ને જોડીને એક સંપૂર્ણ એકમ બનાવી શકે છે.

મૂળ ઉપયોગ:

```swift
struct StructName {
	let name: String
}
```

આ કોડમાં, `struct` એ keyword છે, જે સૂચવે છે કે આપણે રચના વ્યાખ્યાયિત કરી રહ્યા છીએ. `StructName` એ આ રચનાનું નામ છે.

કર્લી બ્રેસિસની અંદરની સામગ્રી આ રચનામાં સમાવાયેલા fields છે, અને દરેક field માટે તેનું નામ અને પ્રકાર સ્પષ્ટ રીતે લખવું પડે છે.

સામાન્ય રીતે, `struct` નું નામ મોટા અક્ષરથી શરૂ થાય છે, જેમ કે `Movie`、`Student`、`UserInfo`। આ Swift માં પ્રચલિત naming convention છે.

તમે `struct` ને એક ખાલી બોક્સ તરીકે સરળતાથી સમજી શકો, જેમાં દરેક field એ બોક્સની અંદર પૂર્વનિર્ધારિત ખાલી જગ્યા જેવી છે.

જ્યારે આ જગ્યાઓ હજુ સુધી ભરાઈ નથી, ત્યારે તે માત્ર ખાલી બોક્સ છે. જ્યારે બધા fields યોગ્ય values થી ભરાઈ જાય, ત્યારે તે પૂર્ણ ગિફ્ટ બોક્સ બની જાય છે.

### struct instance

અગાઉ આપણે ફક્ત રચનાની જ વ્યાખ્યા કરી હતી, જે એક બોક્સના આકાર તૈયાર કરવા જેવી વાત છે.

હવે, અમારે તેની અંદર વાસ્તવિક સામગ્રી ભરવાની છે, ત્યારે જ આપણને સાચી “instance” મળશે, જેનો ઉપયોગ કરી શકાય.

Instance બનાવતી વખતે, સામાન્ય રીતે રચનાના નામ પછી `()` ઉમેરવામાં આવે છે:

```swift
StructName(...)
```

પેરેન્ટિસિસની અંદર જે લખાય છે, તે આ રચનાને જરૂરી field values છે.

ઉદાહરણ તરીકે:

```swift
StructName(name: "Fang Junyu")
```

આ કોડનો અર્થ છે: `StructName` રચનાના સ્વરૂપ મુજબ નવી instance બનાવવી અને `name` field ને `"Fang Junyu"` value આપવી.

જ્યારે આપણે તમામ જરૂરી field contents ભરી દઈએ, ત્યારે તે જાણે આ બોક્સને સંપૂર્ણ રીતે ભરી દેવું છે.

આ સમયે, આપણને સંપૂર્ણ struct instance મળે છે.

### struct properties ઍક્સેસ કરવી

જ્યારે આપણે instance બનાવી લઈએ, ત્યારે તેના આંતરિક properties સુધી પહોંચવા માટે “dot syntax” નો ઉપયોગ કરી શકીએ.

મૂળ લખાણ:

```swift
instance.propertyName
```

ઉદાહરણ તરીકે:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

અહીં `st` એક struct instance છે, અને `st.name` નો અર્થ થાય છે કે આ instance માંથી `name` value વાંચવી.

તમે આ વાંચવાની પદ્ધતિને આ રીતે સમજી શકો: જ્યારે આપણે `st.name` લખીએ છીએ, ત્યારે જાણે આ બોક્સની અંદરના ચોક્કસ સ્થાનમાં રાખેલી સામગ્રી વાંચી રહ્યા હોઈએ.

આ પ્રકારનું લખાણ આગળ SwiftUI ઈન્ટરફેસમાં ખૂબ જ સામાન્ય રહેશે.

ઉદાહરણ તરીકે, જો અમારી પાસે એક student structure હોય, જેમાં નામ, ઉંમર અને વર્ગ હોય, તો ઈન્ટરફેસ પર બતાવતી વખતે આપણે અલગ અલગ રીતે વાંચી શકીએ:

```swift
student.name
student.age
student.className
```

આ રીતે કરવાથી ડેટા વધુ સ્પષ્ટ બને છે અને તેનું મેનેજમેન્ટ પણ સરળ બને છે.

### struct ની સ્થિતિ

શરુઆત કરનારાઓ માટે, સામાન્ય રીતે structure ને `ContentView` ની બહાર લખી શકાય છે.

ઉદાહરણ તરીકે:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

આ રીતે રચના વધુ સ્પષ્ટ બને છે અને વાંચવામાં પણ વધુ સરળ બને છે.

તમે નોંધશો કે `ContentView` પોતે પણ ખરેખર એક `struct` જ છે.

### Movie રચના

આ પહેલાંની પૃષ્ઠભૂમિ સાથે, આપણે હવે ફિલ્મ માટેની રચના વ્યાખ્યાયિત કરી શકીએ:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

આ `Movie` નામની રચના છે, જેમાં `name`, `director` અને `rating` નામનાં ત્રણ fields છે, જે અનુક્રમે ફિલ્મનું નામ, દિગ્દર્શક અને રેટિંગ દર્શાવે છે.

આ રીતે, ફિલ્મ સંબંધિત માહિતી હવે અનેક એરેમાં અલગ અલગ સંગ્રહિત કરવાની જરૂર રહેતી નથી; તેને સીધી એક પૂર્ણ એકમમાં જોડીને રાખી શકાય છે.

ઉદાહરણ તરીકે, આપણે આવી ફિલ્મ instance બનાવી શકીએ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

આ instance “એક પૂર્ણ ફિલ્મ ડેટા”નું પ્રતિનિધિત્વ કરે છે.

### એરેમાં structures સાચવવી

અમે પહેલાં કહ્યું હતું કે એરે ફક્ત એક જ પ્રકારનો ડેટા સાચવી શકે છે.

હવે, આપણું `Movie` structure છે, એટલે એરે અનેક `Movie` સાચવી શકે છે.

```swift
let lists: [Movie] = []
```

ઉદાહરણ તરીકે:

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

આ `lists` એરેમાં strings સાચવવામાં આવતા નથી, પણ અનેક `Movie` instances સાચવવામાં આવે છે.

એટલે કે, એરેનું દરેક element એક સંપૂર્ણ ફિલ્મ છે.

આ રીતે, જ્યારે આપણે ફિલ્મ યાદી બતાવવી હોય, ત્યારે `ForEach` દ્વારા એક પછી એક ફિલ્મ વાંચી શકીએ છીએ.

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

અહીં `movie in` નો અર્થ છે કે દરેક લૂપ વખતે એરેમાંથી એક ફિલ્મ લેવામાં આવશે અને તેને તાત્કાલિક `movie` નામ આપવામાં આવશે.

પછી, આપણે ઉપયોગ કરી શકીએ:

```swift
movie.name
movie.director
movie.rating
```

જે દ્વારા આ ફિલ્મનું નામ, દિગ્દર્શક અને રેટિંગ અલગ અલગ રીતે વાંચીને ઈન્ટરફેસમાં બતાવી શકાય.

## ForEach ભૂલ

અહીં સુધી, આપણે ફિલ્મ એરે અને `ForEach` નું મૂળ લખાણ પૂર્ણ કર્યું છે.

પરંતુ જો તમે નીચેનો કોડ સીધો ચલાવો:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

તો ભૂલ દેખાશે:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

આ ભૂલનો અર્થ એ છે કે જ્યારે તમે `id: \.self` લખો છો, ત્યારે SwiftUI ને એરેના દરેક element ને જ “અનન્ય ઓળખ” તરીકે માનવી પડે છે, જેથી તે તેમને અલગ કરી શકે.

આ પ્રકારનું લખાણ `String` અને `Int` જેવા સરળ પ્રકારો માટે યોગ્ય છે, કારણ કે તેઓને સ્વભાવથી અલગ પાડવું સરળ હોય છે.

પરંતુ `Movie` એ આપણે વ્યાખ્યાયિત કરેલું custom structure છે, અને `ForEach` ને ખબર નથી કે તેને પોતાને અનન્ય ઓળખ તરીકે કેવી રીતે વાપરવું, એટલે ભૂલ આવે છે.

આ સમસ્યાનું સૌથી સામાન્ય સમાધાન એ છે કે `Movie` ને `Identifiable` protocol અનુસરાવવું.

## પ્રોટોકોલ

Swift માં, પ્રોટોકોલને “નિયમ” અથવા “જરૂરિયાત” તરીકે સમજી શકાય છે.

તમે તેને આંતરરાષ્ટ્રીય સંસ્થાના કરાર જેવું પણ સમજી શકો: જો કોઈ દેશ કોઈ આંતરરાષ્ટ્રીય સંસ્થામાં જોડાવા માગે, તો સામાન્ય રીતે પહેલાં તેને તે સંસ્થાના નિયમો પૂરા કરવા પડે, કેટલીક માહિતી જાહેર કરવી પડે અને કેટલાક સામાન્ય નિયમોનું પાલન કરવું પડે. આ શરતો પૂરી કર્યા પછી જ તે જોડાઈ શકે કે કેટલીક બાબતોમાં ભાગ લઈ શકે.

પ્રોટોકોલનો વિચાર પણ આવો જ છે.

જ્યારે કોઈ પ્રકાર કોઈ પ્રોટોકોલ અનુસરવા માગે છે, ત્યારે તેને તે પ્રોટોકોલ દ્વારા નક્કી કરાયેલ સામગ્રી પૂર્ણ કરવી પડે છે. આ જરૂરિયાતો પૂર્ણ થાય ત્યારે જ તે પ્રકાર સંબંધિત સુવિધાઓનો ઉપયોગ કરી શકે છે.

મૂળ લખાણ:

```swift
struct Movie: Identifiable {
    // ...
}
```

અહીં `: Identifiable` નો અર્થ છે કે `Movie` `Identifiable` protocol અનુસરે છે.

જો કોઈ પ્રકાર અનેક protocols અનુસરે, તો તેમને comma થી અલગ કરી શકાય:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` માટે સૌથી મહત્વપૂર્ણ જરૂરીયાત એ છે કે તે પ્રકાર પાસે `id` હોવું જોઈએ, જેના દ્વારા તે પોતાને ઓળખાવી શકે.

ઉદાહરણ તરીકે:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

અહીં `id` ઓળખપત્ર નંબર જેવું છે, જે દરેક ફિલ્મને અલગ પાડવા માટે વપરાય છે.

જ્યારે સુધી દરેક ફિલ્મનું `id` અલગ હોય, ત્યારે સુધી SwiftUI એરેના દરેક element ને યોગ્ય રીતે અલગ કરી શકે છે.

ઉદાહરણ તરીકે:

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

પછી `ForEach` માં આ રીતે લખીએ:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

આ રીતે ભૂલ નહીં આવે.

કારણ કે `Movie` પહેલેથી જ `Identifiable` અનુસરે છે, વધુ સામાન્ય રીતે સીધું `id:` છોડીને લખાય છે:

```swift
ForEach(lists) { movie in
    // ...
}
```

કારણ કે SwiftUI પહેલેથી જ જાણે છે કે દરેક item ને અલગ પાડવા માટે `movie.id` નો ઉપયોગ કરવો.

## ForEach નું ફરક પાડતું ઓળખચિહ્ન

હવે આપણે `ForEach` માં `id` ની ભૂમિકા વધુ ઊંડાણથી સમજીએ.

ઉદાહરણ તરીકે:

```swift
ForEach(lists, id: \.self)
```

અહીં તેનો અર્થ છે: element ને જ ફરક પાડતું ઓળખચિહ્ન તરીકે વાપરવું.

અને:

```swift
ForEach(lists, id: \.id)
```

એનો અર્થ છે: element ના `id` field ને ફરક પાડતું ઓળખચિહ્ન તરીકે વાપરવું.

જો કોઈ field પોતે જ અનન્ય હોવાની ખાતરી આપી શકે, તો તેને તાત્કાલિક રીતે પણ વાપરી શકાય.

ઉદાહરણ તરીકે, જો દરેક ફિલ્મનું નામ અલગ હોય, તો હાલના ડેટા માટે નીચેનું લખાણ પણ યોગ્ય રીતે કામ કરી શકે:

```swift
ForEach(lists, id: \.name)
```

પણ અહીં એક છુપાયેલ સમસ્યા છે: `name` હંમેશા અનન્ય હોય જ એવું નથી.

ધારો કે પછી તમે એ જ નામની બીજી ફિલ્મ ઉમેરો, તો `name` પછી દરેક element ને ચોક્કસ રીતે અલગ કરી શકશે નહીં.

તે સમયે, કોડ compile તો થઈ શકે, પરંતુ view refresh, update, insert અથવા delete કરતી વખતે SwiftUI ખોટી ઓળખ કરી શકે છે, જે પ્રદર્શન સમસ્યાઓનું કારણ બને છે.

આથી, જ્યારે ડેટાને સ્થિર રીતે અલગ પાડવાની જરૂર હોય, ત્યારે ખરેખર અનન્ય field એટલે કે `id` નો ઉપયોગ કરવો વધુ સારું છે.

## UUID

હાથથી `id: 1`, `id: 2` લખીને સમસ્યા હલ થઈ શકે છે, પરંતુ હજી પણ એક જોખમ રહે છે: ભૂલથી સમાન `id` લખાઈ શકે, અને પછી અનન્ય ઓળખ અમાન્ય બની જાય.

ઉદાહરણ તરીકે:

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

આ રીતે બે સમાન `id` બની જશે, અને અનન્ય ઓળખચિહ્નની માન્યતા ખોવાઈ જશે.

હાથની ભૂલો ટાળવા માટે, આપણે સામાન્ય રીતે `UUID()` નો ઉપયોગ કરીએ છીએ.

Swift માં, `UUID()` રેન્ડમ રીતે 128-bit ઓળખચિહ્ન બનાવે છે. સામાન્ય રીતે તે અક્ષરો અને અંકોની લાંબી string તરીકે દેખાય છે.

ઉદાહરણ તરીકે:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

અહીં `UUID()` ખરેખર `UUID` પ્રકારની instance બનાવે છે; તમે તેને આપમેળે બનતા “અનન્ય નંબર” તરીકે સમજી શકો છો.

આથી, દરેક વખતે બનેલા values લગભગ ક્યારેય પુનરાવર્તિત થતા નથી, એટલે તેને `id` તરીકે વાપરવા માટે ખૂબ અનુકૂળ છે.

અમે `Movie` ને આ રીતે બદલી શકીએ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

આ કોડનો અર્થ છે કે `Movie` રચનામાંનું `id` field મૂળરૂપે નવા `UUID` instance થી ભરાઈ જશે.

એટલે કે, દરેક વખતે જ્યારે આપણે નવું `Movie` બનાવીએ, ત્યારે સિસ્ટમ આપમેળે પહેલેથી જ અનન્ય `id` બનાવી દેશે.

`id` પાસે પહેલેથી default value છે, એટલે પછી `Movie` instances બનાવતી વખતે હાથથી `id` લખવાની જરૂર રહેશે નહીં.

ઉદાહરણ તરીકે:

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

અહીં `id` લખાયેલું ન હોવા છતાં, હકીકતમાં આ ફિલ્મ instance પાસે પોતાનું `id` હોય છે; બસ આ value પહેલેથી જ `UUID()` દ્વારા આપમેળે બનાવાઈ ગઈ હોય છે.

આ રીત વાપર્યા પછી, દરેક ફિલ્મ માટે હાથથી `id` ભરવાની જરૂર રહેશે નહીં. તે ફક્ત કોડ ઘટાડે છે એટલું જ નહીં, પરંતુ સમાન id લખાઈ જવાના કારણે થતી ભૂલો પણ ટાળે છે.

છેલ્લે, આપણે ઉપર એક `Banner` ચિત્ર ઉમેરવું અને `ScrollView` નો ઉપયોગ કરવો, જેથી સામગ્રી scroll કરી શકાય, અને આ રીતે આખું ફિલ્મ યાદી view પૂર્ણ થશે.

## સારાંશ

આ પાઠમાં, આપણે એક ખૂબ જ મહત્વપૂર્ણ મુદ્દો શીખ્યો: `struct`.

`struct` દ્વારા, આપણે એક ફિલ્મના અનેક સંબંધિત fields ને એક સંપૂર્ણ એકમમાં ગોઠવી શકીએ છીએ, નામ, દિગ્દર્શક અને રેટિંગને અલગ અલગ એરેમાં વહેંચવાને બદલે.

ડેટાને ગોઠવી લીધા પછી, આપણે `ForEach` નો ઉપયોગ કરીને એરેની દરેક ફિલ્મને એક પછી એક view માં બતાવી શકીએ છીએ.

તે સાથે સાથે, આપણે `ForEach` માં “ફરક પાડતી ઓળખ” ની ભૂમિકા પણ સમજી. SwiftUI ને ખબર હોવી જોઈએ કે એરેના દરેક element ને કેવી રીતે અલગ પાડવો, જેથી view યોગ્ય રીતે બતાવી અને અપડેટ કરી શકાય.

એટલે જ આપણે `Movie` ને `Identifiable` protocol અનુસરાવ્યું અને તેને અનન્ય `id` આપ્યું.

હાથથી `id` ભરતી વખતે થતી ભૂલો ટાળવા માટે, આપણે વધુમાં `UUID()` પણ શીખ્યું, જેથી સિસ્ટમ આપમેળે અનન્ય ઓળખચિહ્ન બનાવી શકે.

આ પાઠ પૂર્ણ કર્યા પછી, તમે ફક્ત ફિલ્મ યાદી પૂર્ણ નહીં કરો, પણ SwiftUI ની એક મહત્વપૂર્ણ વિચારસરણીને પણ સમજવા લાગશો: **પહેલા ડેટાને ગોઠવો, પછી તે ડેટાના આધાર પર view બનાવો.**

## સંપૂર્ણ કોડ

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
