# ફોટો ગેલેરી

આ પાઠમાં, આપણે એક ફોટો ગેલેરી પેજ બનાવશું.

![view](../../../Resource/032_view13.png)

આ ઉદાહરણમાં, આપણે `extension`, `self` અને instance સંબંધિત જ્ઞાનની સમીક્ષા કરીશું, અને SwiftUI માં સામાન્ય રીતે વપરાતા `Shape` ગ્રાફિક્સ શીખીશું.

આ જ્ઞાન દ્વારા, આપણે સામાન્ય તસવીરોને વર્તુળ, ગોળ ખૂણાવાળો ચોરસ, કેપ્સ્યુલ, અંડાકાર વગેરે અલગ અલગ શૈલીઓમાં કાપી શકીએ છીએ, અને ફોટામાં બોર્ડર અસર ઉમેરી શકીએ છીએ.

આ પાઠમાં કેટલાક નવા જ્ઞાનબિંદુઓ વપરાશે: `Shape`, `clipShape`, `strokeBorder` અને `overlay`.

તેમાં, `clipShape` view ના આકારને કાપવા માટે વપરાય છે, `strokeBorder` આકારની બોર્ડર દોરવા માટે વપરાય છે, અને `overlay` વર્તમાન view ની ઉપર નવો view ચડાવવા માટે વપરાય છે.

## ઇમેજ સામગ્રી

શરૂઆત કરતા પહેલાં, આપણે કેટલીક તસવીરો તૈયાર કરવાની જરૂર છે.

તમે તમારી પોતાની તસવીરો વાપરી શકો છો, અથવા આ પાઠમાં આપવામાં આવેલી નમૂના તસવીરો વાપરી શકો છો.

આ પાઠની નમૂના તસવીરો [Pixabay](https://pixabay.com/) વેબસાઇટ પરથી લેવામાં આવી છે:

[ભૂદૃશ્ય](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [શિયાળ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [ઈમારત](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [ફૂલ](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [હંસ](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

તસવીરો ડાઉનલોડ કર્યા પછી, તેમને `Assets` રિસોર્સ ફોલ્ડરમાં ઉમેરો, અને અનુક્રમે `1`, `2`, `3`, `4`, `5` નામ આપો.

![assets](../../../Resource/032_view17.png)

આ રીતે, આપણે SwiftUI માં `Image("1")`, `Image("2")` વગેરે દ્વારા તસવીરો બતાવી શકીએ છીએ.

## ફોટા બતાવવું

સૌપ્રથમ, આપણે `ContentView` માં 5 ફોટા બતાવીએ છીએ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

દેખાવ પરિણામ:

![view](../../../Resource/032_view.png)

આ કોડમાં, આપણે `ScrollView` દ્વારા ફોટા યાદીને સ્ક્રોલ કરી શકાય તેવી બનાવીએ છીએ, અને `VStack` દ્વારા અનેક તસવીરોને ઉપરથી નીચે ગોઠવીએ છીએ.

દરેક તસવીર `.resizable()`, `.scaledToFit()` અને `.frame(width: 300)` દ્વારા તેની દર્શાવવાની અસર સેટ કરે છે, જેથી તસવીર સ્કેલ થઈ શકે, સંપૂર્ણ અનુપાત જાળવી શકે, અને તેની પહોળાઈ મર્યાદિત રહે.

`VStack` પરનો `.padding(.vertical, 100)` ઉપર અને નીચેનું અંતર વધારવા માટે વપરાય છે, જેથી પહેલી અને છેલ્લી તસવીર સ્ક્રીનના કિનારાને અતિશય ચોંટેલી ન લાગે.

છેલ્લું `.ignoresSafeArea()` દર્શાવે છે કે scroll view safe area ને અવગણે છે, જેથી તસવીરો સ્ક્રોલ કરતી વખતે સ્ક્રીનની ઉપર અને નીચે સુધી વિસ્તરી શકે, અને પેજ વધુ પૂર્ણ રીતે દેખાય.

પરંતુ, હાલમાં 5 તસવીરોમાં બધા જ સમાન modifiers વપરાયા છે:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

જ્યારે આપણે પુનરાવર્તિત કોડ જોઈએ છીએ, ત્યારે તેને ગોઠવવા માટે `extension` નો વિચાર કરી શકીએ છીએ.

## extension વડે ઇમેજ શૈલી ગોઠવવી

અમે `Image` માટે ફોટો ગેલેરીને અનુરૂપ એક વિશેષ method વિસ્તારી શકીએ છીએ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

અહીં, અમે `Image` type માટે એક `photoGalleryStyle` method વિસ્તારી છે.

આ method માં પહેલાં વારંવાર વપરાયેલી `.resizable()`, `.scaledToFit()` અને `.frame(width: 300)` સામેલ છે. એટલે કે, તે તસવીરના સ્કેલિંગ, અનુપાત સાથે દેખાવ અને પહોળાઈ સેટ કરવાના કોડને એક સાથે ગોઠવે છે.

આ extension વાપર્યા પછી, મૂળ ઇમેજ કોડ:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

આ રીતે સરળ બનાવી શકાય છે:

```swift
Image("1")
    .photoGalleryStyle()
```

આ રીતે, દરેક તસવીરને માત્ર `.photoGalleryStyle()` બોલાવવાની જરૂર છે, અને તે જ ફોટો ગેલેરી શૈલી લાગુ થશે. કોડ વધુ સરળ બનશે, અને પછીથી એકસરખો ફેરફાર કરવો પણ વધુ સુવિધાજનક રહેશે.

## self સમજવું

extension method માં, આપણે `self` લખ્યું છે:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

અહીંનું `self`, આ method બોલાવતી વર્તમાન image instance ને દર્શાવે છે.

ઉદાહરણ તરીકે:

```swift
Image("1")
    .photoGalleryStyle()
```

આ કોડમાં, `photoGalleryStyle()` ને `Image("1")` દ્વારા બોલાવવામાં આવે છે, તેથી method ની અંદરનું `self` આ `Image("1")` તસવીર દર્શાવે છે.

સરળ રીતે સમજીએ તો: જે આ method બોલાવે છે, `self` તે જ દર્શાવે છે.

ધ્યાન રાખવાની વાત એ છે કે SwiftUI ના modifiers સતત નવા view પરિણામો પરત કરે છે. તેથી, `photoGalleryStyle()` એક modified view પરત કરે છે, માત્ર મૂળ `Image` પોતે નહીં.

## ફોટાના આકાર

હવે, ફોટા સામાન્ય રીતે દેખાઈ શકે છે. પરંતુ, આ ફોટા ડિફોલ્ટ રીતે ચોરસ/આયતાકાર હોય છે, તેથી દેખાવ સામાન્ય લાગે છે.

જો તમે માત્ર ફોટાને ગોળ ખૂણા આપવા માંગતા હો, તો સીધું `.cornerRadius()` વાપરી શકો છો:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

દેખાવ પરિણામ:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` નો અર્થ છે તસવીરમાં `20 pt` નો corner radius ઉમેરવો. સામાન્ય ગોળ ખૂણાવાળી તસવીર બનાવવા માટે આ લખાણ પહેલેથી પૂરતું છે.

પરંતુ, `.cornerRadius()` માત્ર ગોળ ખૂણાની અસર સંભાળી શકે છે, અને સામાન્ય ગોળ ખૂણાવાળી તસવીરો બનાવવા માટે યોગ્ય છે. જો આપણે ફોટાને વધુ અલગ અલગ આકારોમાં ફેરવવા માંગીએ, તો માત્ર આ modifier પૂરતું નથી.

આ સમયે, SwiftUI માં `Shape` વાપરવાની જરૂર પડે છે. `Shape` અલગ અલગ ગ્રાફિક્સ દર્શાવી શકે છે, અને `clipShape` સાથે તેનો ઉપયોગ કરીને તસવીરને અનુરૂપ આકારમાં કાપી શકાય છે.

## Shape ઓળખવું

SwiftUI માં, `Shape` ગ્રાફિક દર્શાવે છે. `View` ની જેમ, તે પણ SwiftUI માં ખૂબ સામાન્ય રીતે વપરાતો type છે.

સામાન્ય `Shape` માં વર્તુળ, ચોરસ/આયત, ગોળ ખૂણાવાળો આયત, કેપ્સ્યુલ અને અંડાકાર સામેલ છે. અલગ અલગ ગ્રાફિક્સનો દેખાવ વધુ સ્પષ્ટ રીતે જોવા માટે, નીચેના ઉદાહરણોમાં દરેક ગ્રાફિકને અલગ રંગ અને કદ આપવામાં આવ્યું છે.

આ ઉદાહરણોમાં, `.fill()` ગ્રાફિકમાં રંગ ભરવા માટે વપરાય છે, અને `.frame()` ગ્રાફિકનું દર્શાવવાનું કદ સેટ કરવા માટે વપરાય છે. રંગો માત્ર અલગ અલગ ગ્રાફિક્સ વચ્ચે ભેદ કરવા માટે છે, તે ગ્રાફિક્સના સ્થાયી રંગ નથી.

### Circle વર્તુળ

`Circle` વર્તુળ દર્શાવે છે. તે સામાન્ય રીતે avatar, વર્તુળાકાર button, વર્તુળાકાર image વગેરે interface અસર માટે વપરાય છે.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle આયત

`Rectangle` આયત દર્શાવે છે. તે સૌથી મૂળભૂત ગ્રાફિક્સમાંનું એક છે, અને background, વિભાજિત વિસ્તાર અથવા સામાન્ય border બનાવવા માટે પણ વાપરી શકાય છે.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle ગોળ ખૂણાવાળો આયત

`RoundedRectangle` ગોળ ખૂણાવાળો આયત દર્શાવે છે. `cornerRadius` ગોળ ખૂણાનો કદ સેટ કરવા માટે વપરાય છે.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule કેપ્સ્યુલ આકાર

`Capsule` કેપ્સ્યુલ આકાર દર્શાવે છે. તેના બંને છેડા ગોળ વક્ર હોય છે, અને તે સામાન્ય રીતે capsule buttons, tag background વગેરે interface અસર માટે વપરાય છે.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse અંડાકાર

`Ellipse` અંડાકાર દર્શાવે છે. તે `Circle` જેવું છે, પરંતુ પહોળાઈ અને ઊંચાઈ અલગ હોય ત્યારે અંડાકાર તરીકે દેખાય છે.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

આ ઉદાહરણો દ્વારા જોઈ શકાય છે કે `Shape` પોતે સીધું ગ્રાફિક તરીકે બતાવી શકાય છે. હવે આગળ, આપણે આ `Shape` ને `clipShape` સાથે વાપરીને ફોટા કાપીશું, જેથી ફોટા અલગ અલગ આકારમાં દેખાય.

## clipShape વડે ફોટા કાપવા

હવે, આપણે `clipShape` વડે ફોટાને અલગ અલગ આકારમાં કાપી શકીએ છીએ.

ઉદાહરણ તરીકે, પહેલી તસવીરને વર્તુળમાં કાપવી:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

આ કોડ દર્શાવે છે: પહેલા એક તસવીર બતાવો, પછી `Circle()` વડે તેને વર્તુળમાં કાપો.

![view](../../../Resource/032_view2.png)

`clipShape` ની મૂળભૂત લખવાની રીત છે:

```swift
.clipShape(આકાર)
```

view પછી `.clipShape(...)` ઉમેરો, અને કૌંસમાં કાપવા માટેનો ગ્રાફિક ભરો.

ઉદાહરણ તરીકે:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

હવે, આપણે 5 તસવીરોને અલગ અલગ આકારમાં કાપીએ છીએ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

દેખાવ પરિણામ:

![view](../../../Resource/032_view8.png)

તેમાં, `Rectangle()` વડે કાપ્યા પછીનું પરિણામ સામાન્ય આયતાકાર ફોટા જેવું જ લાગે છે, તેથી દૃશ્યમાન ફેરફાર ખાસ સ્પષ્ટ નથી; તે મુખ્યત્વે અન્ય આકારો સાથે સરખામણી માટે વપરાય છે.

હવે, ફોટા માત્ર સામાન્ય આયત નથી રહ્યા, પરંતુ તેમની પાસે અલગ અલગ આકાર છે.

## ફોટાની બોર્ડર ઉમેરવી

જો આપણે વર્તુળાકાર ફોટામાં border ઉમેરવી હોય, તો કદાચ `border` વાપરવાનું વિચારીશું:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

પરંતુ, આવી રીતે સામાન્ય રીતે વર્તુળ border નહીં, પરંતુ આયતાકાર border મળે છે.

![view](../../../Resource/032_view9.png)

કારણ એ છે કે `border` view ના આયતાકાર વિસ્તારમાં border ઉમેરે છે, `clipShape` દ્વારા કાપ્યા પછીના આકાર પ્રમાણે નહીં.

તેથી, જો આપણે વર્તુળ border માંગતા હોઈએ, તો `border` સીધું વાપરી શકતા નથી.

## strokeBorder વડે આકારની બોર્ડર દોરવી

SwiftUI માં, `strokeBorder` આ સામાન્ય `Shape` માટે અંદરની border દોરી શકે છે.

ઉદાહરણ તરીકે, વર્તુળ border દોરવી:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

આ કોડનો અર્થ છે: `Circle` માટે ભૂરી border દોરવી, border ની પહોળાઈ `10 pt` રાખવી.

![view](../../../Resource/032_view12.png)

અહીં ધ્યાન રાખવું જરૂરી છે કે `strokeBorder` સીધું ફોટામાં border ઉમેરતું નથી, પરંતુ `Circle()` આ ગ્રાફિક માટે border દોરે છે.

અથવા કહીએ તો, આ કોડથી ફક્ત એક સ્વતંત્ર વર્તુળાકાર border મળે છે; તેનો ફોટા સાથે હજી કોઈ સંબંધ નથી.

જો આ વર્તુળાકાર border ફોટાની ઉપર દેખાડવી હોય, તો border ને ફોટા ઉપર ચડાવવા માટે આગળ `overlay` વાપરવાની જરૂર છે.

## overlay વડે border ચડાવવી

`overlay` એક view modifier છે, જે વર્તમાન view ની ઉપર નવો view ચડાવી શકે છે.

તેની મૂળભૂત રચનાને આ રીતે સમજી શકાય છે:

```swift
વર્તમાન view
    .overlay {
        ઉપર ચડાવાતો view
    }
```

આ ઉદાહરણમાં, વર્તમાન view એ પહેલેથી વર્તુળમાં કાપેલો ફોટો છે:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

અમે ઉપર ચડાવવા માંગતા નવા view તરીકે એક વર્તુળાકાર border છે:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

તેથી, ફોટા અને border ને સાથે જોડીને આ રીતે લખી શકાય છે:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

અહીં `overlay` નો અર્થ છે વર્તમાન view ની ઉપર નવો view ચડાવવો.

`overlay` માં, border વર્તમાન ફોટાના દર્શાવવાના વિસ્તારને અનુસરીને ચડે છે, તેથી અલગથી `frame` સેટ કરવાની જરૂર નથી. જ્યાં સુધી border નો આકાર અને clip shape એકસરખા હોય, ત્યાં સુધી border ફોટાને ચુસ્ત રીતે અનુસરે છે.

![view](../../../Resource/032_view10.png)

અંતિમ અસર એ છે કે વર્તુળાકાર ફોટાની ઉપર વર્તુળાકાર border આવરી લેવામાં આવે છે.

`ZStack` સાથે સરખાવીએ તો, `overlay` આ પ્રકારના “વર્તમાન view માં સજાવટ ઉમેરવા” માટે વધુ યોગ્ય છે. ફોટો મુખ્ય ભાગ છે, border માત્ર વધારાની અસર છે, તેથી `overlay` વાપરવાથી અર્થ વધુ સ્પષ્ટ થાય છે.

## ફોટો ગેલેરી પૂર્ણ કરવી

હવે, આપણે દરેક ફોટામાં અનુરૂપ આકાર અને border ઉમેરીએ છીએ:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

દેખાવ પરિણામ:

![view](../../../Resource/032_view13.png)

આ રીતે, એક આધારભૂત ફોટો ગેલેરી પેજ પૂર્ણ થાય છે.

આ પેજમાં, આપણે `ScrollView` વડે સ્ક્રોલ display બનાવ્યો, `Image` વડે ફોટા બતાવ્યા, `clipShape` વડે ફોટાના આકાર કાપ્યા, અને `overlay` તથા `strokeBorder` વડે border ઉમેર્યા.

## સંપૂર્ણ કોડ

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## સારાંશ

આ પાઠમાં, આપણે એક ફોટો ગેલેરી પેજ પૂર્ણ કર્યું.

![view](../../../Resource/032_view13.png)

આ ઉદાહરણમાં, આપણે પહેલા `Image` વડે ફોટા બતાવ્યા, પછી `extension` દ્વારા `Image` માટે `photoGalleryStyle` method વિસ્તારી, જેથી પુનરાવર્તિત image style કોડ ગોઠવી શકાય.

પછી, આપણે SwiftUI માં સામાન્ય `Shape` શીખ્યા, જેમ કે `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` અને `Ellipse`. આ ગ્રાફિક્સ માત્ર સીધા દેખાડી શકાય તેવું જ નથી, પરંતુ `clipShape` સાથે view કાપવા માટે પણ વાપરી શકાય છે.

ઉદાહરણ તરીકે:

```swift
.clipShape(Circle())
```

તેનો અર્થ છે view ને વર્તુળમાં કાપવું.

છેલ્લે, આપણે `overlay` અને `strokeBorder` વડે ફોટામાં અનુરૂપ આકારની border ઉમેરી. ધ્યાન રાખવાની વાત એ છે કે `border` સામાન્ય રીતે view ના આયતાકાર વિસ્તાર પ્રમાણે border દોરે છે. જો border ને વર્તુળ, કેપ્સ્યુલ અથવા અંડાકારને અનુસરાવવી હોય, તો એ જ `Shape` ને overlay તરીકે વાપરવું વધુ યોગ્ય છે.

આ પાઠ દ્વારા, આપણે માત્ર ફોટો ગેલેરી અસર પૂર્ણ કરી નહીં, પણ interface માં `Shape`, `clipShape`, `strokeBorder` અને `overlay` ની સામાન્ય સંયુક્ત વાપરવાની રીત પણ સમજી.

## પાઠ પછીના અભ્યાસ

### 1、ફોટો ગેલેરી background ઉમેરો

ફોટો ગેલેરી પેજમાં full-screen background image ઉમેરો.

આવશ્યકતા: background image આખી screen ભરવી જોઈએ અને safe area ને અવગણવી જોઈએ.

### 2、gradient border

હાલની single-color borders ને linear gradient borders માં ફેરવો.

વધુ સમૃદ્ધ border અસર બનાવવા માટે `LinearGradient` વાપરીને પ્રયત્ન કરી શકો છો.

### 3、simulation photo frame

ઇન્ટરનેટ પર કેટલીક વાસ્તવિક photo frame શૈલીઓ શોધો, અને `overlay` વડે image frame ચડાવવાનો પ્રયાસ કરો, જેથી ફોટા વધુ વાસ્તવિક frame જેવા દેખાય.

અભ્યાસનું દેખાવ પરિણામ:

![button](../../../Resource/032_view15.jpeg)

### 4、ગોળ ખૂણાવાળી button border બનાવો

વાસ્તવિક development માં, buttons ઘણીવાર ગોળ ખૂણાવાળી આયતાકાર border વાપરે છે.

કૃપા કરીને ગોળ ખૂણાવાળો button બનાવવાનો પ્રયાસ કરો, અને `RoundedRectangle` તથા `strokeBorder` વડે button માં ગોળ ખૂણાવાળી border ઉમેરો.

અભ્યાસનું દેખાવ પરિણામ:

![button](../../../Resource/032_view14.png)

### વિચાર પ્રશ્ન

જો single-color border પણ વાપરવી ન હોય, gradient border પણ વાપરવી ન હોય, પરંતુ border કોઈ pattern effect બતાવે તેવું ઇચ્છતા હોઈએ, તો તેને કેવી રીતે અમલમાં મૂકવું?

`overlay`, `mask` અથવા `ImagePaint` જેવી સંબંધિત વાપરવાની રીતો સમજવા માટે માહિતી શોધવાનો પ્રયાસ કરી શકો છો.

અભ્યાસનું દેખાવ પરિણામ:

![button](../../../Resource/032_view16.png)
