# પ્રાણી વિશ્વકોશ 

આ પાઠમાં, આપણે કસ્ટમ વ્યૂ અને ડેટા પાસિંગનો અભ્યાસ ચાલુ રાખીશું.

અમે એક સરળ પ્રાણી વિશ્વકોશ વ્યૂ બનાવવાના છીએ. પેજમાં પાંચ પ્રાણીઓ દેખાશે. જ્યારે કોઈ પ્રાણી પર ક્લિક કરવામાં આવશે, ત્યારે એક વિગતો વ્યૂ પોપ અપ થશે, જેમાં તે પ્રાણીનું ચિત્ર, વિતરણ વિસ્તાર, નિવાસસ્થાન અને વર્ણન દેખાશે.

અંતિમ પરિણામ:

![view](../../../Resource/029_view.png)

આ કેસ દ્વારા, આપણે ડેટા સ્ટ્રક્ચર, સૂચિ પ્રદર્શન, ક્લિક ઇન્ટરૅક્શન અને Sheet પોપ-અપ વ્યૂ વચ્ચેનું સહકાર અભ્યાસ કરી શકીએ છીએ.

## ચિત્ર સામગ્રી તૈયાર કરો

સૌપ્રથમ, આપણે પાંચ પ્રાણી ચિત્રો તૈયાર કરવાની જરૂર છે:

- ડોલ્ફિન: `dolphin.jpg`
- જિરાફ: `giraffe.jpg`
- સિંહ: `lion.jpg`
- પાંડા: `panda.jpg`
- ધ્રુવીય રીંછ: `polarBear.jpg`

તમે નીચેની ચિત્ર સામગ્રીનો ઉપયોગ કરી શકો છો:

[ડોલ્ફિન](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [જિરાફ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [સિંહ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [પાંડા](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ધ્રુવીય રીંછ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ચિત્રો ડાઉનલોડ કર્યા પછી, તેમને Xcode પ્રોજેક્ટના `Assets` રિસોર્સ ફોલ્ડરમાં ખેંચીને મૂકો.

![assets](../../../Resource/029_assets.png)

ધ્યાન રાખવાની વાત એ છે કે કોડમાં ચિત્રનો ઉપયોગ કરતી વખતે સામાન્ય રીતે `.jpg` પ્રત્યય લખવાની જરૂર નથી.

ઉદાહરણ તરીકે, ચિત્ર રિસોર્સનું નામ `dolphin` હોય, તો કોડમાં આ રીતે લખો:

```swift
Image("dolphin")
```

જો ચિત્રનું નામ ખોટું લખાય, તો ચિત્ર સામાન્ય રીતે દેખાશે નહીં.

નોંધ: ઉપરની ચિત્ર સામગ્રી Wikimedia પ્રોજેક્ટમાંથી આવે છે. ઉપયોગ કરતી વખતે મૂળ ચિત્ર લિંક અને સ્રોત માહિતી રાખવાની ભલામણ કરવામાં આવે છે.

## પ્રાણી સ્ટ્રક્ચર બનાવો

આ પેજમાં, દરેક પ્રાણી પાસે ઘણી માહિતી છે:

- પ્રાણીનું નામ
- પ્રાણીનું ચિત્ર
- પ્રાણી ઇમોજી
- વિતરણ વિસ્તાર
- નિવાસસ્થાન
- પ્રાણી વર્ણન

જો આપણે આ માહિતીને ઘણી અલગ-અલગ વેરિએબલ્સમાં ફેલાવી દઈએ, તો કોડ થોડો ગૂંચવણભર્યો બની જશે. તેથી, આપણે એક `Animal` સ્ટ્રક્ચર બનાવી શકીએ છીએ અને એક પ્રાણીની માહિતી એકસાથે રાખી શકીએ છીએ.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

આ કોડમાં:

- `id`: પ્રાણીની અનન્ય ઓળખ.
- `name`: પ્રાણીનું નામ.
- `imageName`: પ્રાણીના ચિત્રનું નામ.
- `avatarEmoji`: પ્રાણી ઇમોજી.
- `distributionArea`: વિતરણ વિસ્તાર.
- `habitat`: નિવાસસ્થાન.
- `animalDescription`: પ્રાણી વર્ણન.

તેમાં:

```swift
let id = UUID()
```

`id` દરેક પ્રાણીને ઓળખવા માટે વપરાય છે. કારણ કે આગળ આપણે `ForEach` વડે પ્રાણી સૂચિ બતાવીશું, અને `.sheet(item:)` વડે પસંદ કરેલા પ્રાણીના આધારે વિગતો પોપ અપ કરીશું, તેથી `Animal` ને `Identifiable` પ્રોટોકોલ અનુસરવાનું જરૂરી છે.

`Identifiable` નું કામ SwiftUI ને કહેવાનું છે: દરેક પ્રાણી પાસે તેની ઓળખ અલગ પાડે એવું `id` હોય છે.

## પ્રાણી ડેટા બનાવો

પછી, આપણે `ContentView` માં એક પ્રાણી array બનાવીએ છીએ.

array માં પાંચ `Animal` સાચવવામાં આવે છે. દરેક `Animal` એક પ્રાણીને રજૂ કરે છે.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ડોલ્ફિન
        Animal(
            name: "ડોલ્ફિન",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "વિશ્વભરના ગરમ અને સમશીતોષ્ણ સમુદ્રો.",
            habitat: "મહાસાગરો, કિનારાના પાણી અને કેટલીક મોટી નદીઓ.",
            animalDescription: "ડોલ્ફિન બુદ્ધિશાળી સમુદ્રી સસ્તન પ્રાણી છે. તેઓ જૂથોમાં રહે છે, અવાજોથી સંચાર કરે છે અને તેમના રમૂજી વર્તન માટે જાણીતા છે."
        ),
        // જિરાફ
        Animal(
            name: "જિરાફ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "આફ્રિકાના સવાણા અને ખુલ્લા વન પ્રદેશો.",
            habitat: "ઘાસના મેદાનો, સવાણા અને ખુલ્લા જંગલો.",
            animalDescription: "જિરાફ જમીન પરના સૌથી ઊંચા પ્રાણીઓ છે. તેમની લાંબી ગરદન અને લાંબા પગ હોય છે, અને તેઓ સામાન્ય રીતે ઊંચા વૃક્ષોના પાંદડા ખાય છે."
        ),
        // સિંહ
        Animal(
            name: "સિંહ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "મુખ્યત્વે સહારા દક્ષિણ આફ્રિકામાં જોવા મળે છે, અને પશ્ચિમ ભારતમાં નાની વસ્તી છે.",
            habitat: "ઘાસના મેદાનો, સવાણા અને ખુલ્લા વન પ્રદેશો.",
            animalDescription: "સિંહ શક્તિશાળી મોટા બિલાડીવર્ગના પ્રાણી છે. તેઓ સામાન્ય રીતે પ્રાઇડ કહેવાતા જૂથોમાં રહે છે અને ઘણી વાર પ્રાણી જગતના રાજા તરીકે ઓળખાય છે."
        ),
        // પાંડા
        Animal(
            name: "પાંડા",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "મધ્ય ચીનના પર્વતીય જંગલો.",
            habitat: "ઠંડા અને ભેજવાળા પર્વતીય વિસ્તારોના બાંસના જંગલો.",
            animalDescription: "પાંડા તેમના કાળા-સફેદ વાળ માટે જાણીતા રીંછ છે. તેઓ મુખ્યત્વે બાંસ ખાય છે અને વિશ્વના સૌથી ઓળખાય એવા પ્રાણીઓમાંના એક છે."
        ),
        // ધ્રુવીય રીંછ
        Animal(
            name: "ધ્રુવીય રીંછ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ઉત્તર ધ્રુવની આસપાસના આર્કટિક પ્રદેશો.",
            habitat: "સમુદ્રી બરફ, કિનારાના વિસ્તારો અને ઠંડા આર્કટિક પર્યાવરણો.",
            animalDescription: "ધ્રુવીય રીંછ ઠંડા પર્યાવરણ માટે અનુકૂળ થયેલા મોટા રીંછ છે. તેઓ શક્તિશાળી તરવૈયા છે અને સીલનો શિકાર કરવા માટે મુખ્યત્વે સમુદ્રી બરફ પર આધાર રાખે છે."
        )
    ]

    var body: some View {
        Text("પ્રાણી વિશ્વકોશ")
    }
}
```

અહીં `animals` એક array છે:

```swift
let animals: [Animal]
```

`[Animal]` બતાવે છે કે આ array માં અનેક `Animal` સાચવાયેલા છે.

અર્થાત્, `animals` એક પ્રાણી નથી, પરંતુ પ્રાણીઓનો એક સમૂહ છે.

## પ્રાણી સૂચિ બતાવો

હવે, આપણે `ForEach` વડે પ્રાણી સૂચિ બતાવી શકીએ છીએ.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

પ્રદર્શન પરિણામ:

![view](../../../Resource/029_view1.png)

આ કોડમાં:

```swift
ForEach(animals) { animal in
    ...
}
```

એનો અર્થ `animals` array ને ટ્રાવર્સ કરવો છે.

દરેક ચક્રમાં, `animal` હાલ દેખાડવામાં આવતા તે પ્રાણીનું પ્રતિનિધિત્વ કરે છે.

ઉદાહરણ તરીકે, પહેલી વાર ચક્ર ચાલે ત્યારે, `animal` ડોલ્ફિન છે; બીજી વાર ચક્ર ચાલે ત્યારે, `animal` જિરાફ છે.

તેથી, આપણે નીચેની રીતથી હાલના પ્રાણીની માહિતી બતાવી શકીએ છીએ:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

આ રીતે, પાંચ પ્રાણીઓ બતાવી શકાય છે.

## પ્રાણી સૂચિને ક્લિક કરી શકાય તેવી બનાવો

હવે સૂચિ દેખાઈ ગઈ છે, પરંતુ તે હજી ક્લિક કરી શકાતી નથી.

જો આપણે કોઈ પ્રાણી પર ક્લિક કર્યા પછી વિગતો પોપ અપ કરવી હોય, તો પહેલા “હાલ પસંદ કરાયેલ પ્રાણી” નોંધવું પડશે.

તેથી, `ContentView` માં એક state variable ઉમેરો:

```swift
@State private var selectedAnimal: Animal? = nil
```

અહીં `selectedAnimal` એક optional value type `Animal?` છે.

તેનો અર્થ એ છે કે તેમાં કોઈ પ્રાણી હોઈ શકે છે, અથવા કોઈ પ્રાણી ન પણ હોઈ શકે.

ડિફોલ્ટ value `nil` છે, એટલે શરૂઆતમાં કોઈ પ્રાણી પસંદ કરાયેલું નથી.

પછી, આપણે દરેક પ્રાણીની row ને `Button` માં બદલીશું:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

મુખ્ય વાત આ એક પંક્તિ છે:

```swift
selectedAnimal = animal
```

જ્યારે વપરાશકર્તા કોઈ પ્રાણી પર ક્લિક કરે છે, ત્યારે આપણે આ પ્રાણીને `selectedAnimal` માં સાચવીએ છીએ.

ઉદાહરણ તરીકે, વપરાશકર્તા ડોલ્ફિન પર ક્લિક કરે, તો `selectedAnimal` માં ડોલ્ફિન સાચવાય છે.

વપરાશકર્તા પાંડા પર ક્લિક કરે, તો `selectedAnimal` માં પાંડા સાચવાય છે.

અર્થાત્, `selectedAnimal` વપરાશકર્તાએ હાલમાં કયું પ્રાણી ક્લિક કર્યું છે તે નોંધવા માટે વપરાય છે.

## Sheet પોપ-અપ વ્યૂ

હવે આપણે બટન દ્વારા “હાલ ક્લિક કરાયેલ પ્રાણી” નોંધવામાં સક્ષમ છીએ.

આગળ, આપણે પ્રાણી વિગતો બતાવવા માટે એક પોપ-અપ વ્યૂ બનાવવો છે.

![view](../../../Resource/029_view2.png)

SwiftUI માં, આ પ્રકારની પોપ-અપ અસર બનાવવા માટે `Sheet` નો ઉપયોગ કરી શકાય છે.

`Sheet` ને એક તાત્કાલિક પોપ-અપ પેજ તરીકે સમજી શકાય. તે હાલના પેજની ઉપર દેખાય છે. વપરાશકર્તા સામગ્રી જોઈ લીધા પછી નીચે સ્વાઇપ કરીને તેને બંધ કરી શકે છે.

## Sheet ઉદાહરણ

ખરેખર પ્રાણી વિગતો બતાવતાં પહેલાં, આપણે એક સરળ ઉદાહરણથી સમજીએ કે `Sheet` કેવી રીતે પોપ અપ થાય છે.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet બતાવો")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet વ્યૂ")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

પ્રદર્શન પરિણામ:

![view](../../../Resource/029_view3.png)

આ કોડમાં, આપણે એક Boolean value બનાવ્યું છે:

```swift
@State private var showSheet = false
```

`showSheet` નું ડિફોલ્ટ value `false` છે, એટલે શરૂઆતમાં `Sheet` દેખાતું નથી.

જ્યારે બટન પર ક્લિક થાય છે:

```swift
showSheet.toggle()
```

`toggle()` નો અર્થ Boolean value ને સ્વિચ કરવો છે.

જો મૂળ value `false` હોય, તો `toggle()` બોલાવ્યા પછી તે `true` બની જશે.

જો મૂળ value `true` હોય, તો `toggle()` બોલાવ્યા પછી તે `false` બની જશે.

તેથી, બટન પર ક્લિક કર્યા પછી, `showSheet` `false` માંથી `true` બને છે.

જ્યારે `showSheet` `true` બને છે, ત્યારે નીચેનો કોડ `Sheet` પોપ અપ કરશે:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet વ્યૂ")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

આ કોડનો અર્થ છે: જ્યારે `showSheet` `true` હોય, ત્યારે એક `Sheet` પોપ અપ કરો અને `Sheet` માં `Text("Sheet વ્યૂ")` બતાવો.

પ્રદર્શન પરિણામ:

![view](../../../Resource/029_view4.png)

આ પ્રકારની લખવાની રીત સ્થિર સામગ્રી પોપ અપ કરવા માટે યોગ્ય છે.

ઉદાહરણ તરીકે, બટન પર ક્લિક કર્યા પછી Settings પેજ, સૂચના પેજ, prompt પેજ વગેરે પોપ અપ કરવી.

### Sheet દેખાડવાની જગ્યા

જોકે `Sheet` એક પોપ-અપ વ્યૂ છે, SwiftUI માં તે `Text()` અથવા `Image()` જેવી રીતે એક સ્વતંત્ર વ્યૂ તરીકે સીધું લખાતું નથી, પરંતુ તે view modifier તરીકે વપરાય છે.

અર્થાત્, `.sheet(...)` અને `.font()`, `.padding()`, `.shadow()` જેવા modifiers સમાન છે. તે બધાને કોઈ વ્યૂની પાછળ ઉમેરવાની જરૂર હોય છે.

ઉદાહરણ તરીકે:

```swift
Button("Sheet બતાવો") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet વ્યૂ")
}
```

આ ઉદાહરણમાં, `.sheet` `Button` ની પાછળ ઉમેરવામાં આવ્યું છે.

જ્યારે `showSheet` `true` બને છે, ત્યારે SwiftUI `Sheet` પોપ અપ કરશે અને curly braces માંની સામગ્રી બતાવશે:

```swift
Text("Sheet વ્યૂ")
```

પરંતુ વાસ્તવિક વિકાસમાં, જો એક પેજમાં ઘણા બટન હોય, તો સામાન્ય રીતે દરેક બટન પાછળ એક `.sheet` ઉમેરવામાં આવતું નથી.

વધુ સામાન્ય રીત છે: `.sheet` ને outer view ની પાછળ ઉમેરવું.

ઉદાહરણ તરીકે:

```swift
VStack {
    Button("Sheet બતાવો") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet વ્યૂ")
}
```

બટન `showSheet` બદલવાની જવાબદારી લે છે, અને outer view `showSheet` `true` છે કે નહીં તેના આધારે `Sheet` પોપ અપ કરવાની જવાબદારી લે છે.

## Optional value binding Sheet

પહેલાં આપણે શીખેલી લખવાની રીત આ હતી:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet વ્યૂ")
}
```

આ રીત એક સ્થિર પેજને દેખાડવા અને છુપાવવાનું નિયંત્રિત કરવા માટે યોગ્ય છે.

પરંતુ પ્રાણી વિશ્વકોશ કેસમાં, આપણે માત્ર “`Sheet` પોપ અપ કરવું કે નહીં” જાણવાની જરૂર નથી; “કયું પ્રાણી ક્લિક થયું છે” તે પણ જાણવું જરૂરી છે.

ઉદાહરણ તરીકે:

વપરાશકર્તા ડોલ્ફિન પર ક્લિક કરે, તો `Sheet` માં ડોલ્ફિનની વિગતો દેખાવવી જોઈએ.

વપરાશકર્તા પાંડા પર ક્લિક કરે, તો `Sheet` માં પાંડાની વિગતો દેખાવવી જોઈએ.

તેથી, અહીં Sheet ની બીજી લખવાની રીત વધુ યોગ્ય છે:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet માં દેખાતી સામગ્રી
}
```

આ કોડમાં, `Sheet` એક optional value `selectedAnimal` સાથે bind થયેલું છે.

અહીં ધ્યાન રાખો કે `item:` પછી `$selectedAnimal` લખાય છે, `selectedAnimal` નહીં.

કારણ કે `Sheet` માત્ર `selectedAnimal` ની value વાંચતું નથી; તે તેની બદલાતી value આધારે પોપ અપ કરવું કે નહીં તે પણ નક્કી કરે છે.

આ કોડને આ રીતે સમજી શકાય:

- જ્યારે `selectedAnimal` `nil` હોય, ત્યારે `Sheet` દેખાતું નથી.
- જ્યારે `selectedAnimal` પાસે value હોય, ત્યારે `Sheet` દેખાય છે.
- જ્યારે `Sheet` બંધ થાય છે, ત્યારે SwiftUI `selectedAnimal` ને ફરી `nil` માં ફેરવી દે છે.

SwiftUI `selectedAnimal` માં સાચવાયેલા પ્રાણીને curly braces માંના `animal` ને આપશે.

અર્થાત્, `.sheet(item:)` માત્ર પોપ-અપ નિયંત્રિત કરતું નથી, પરંતુ પસંદ કરેલો ડેટા `Sheet` માં પણ પસાર કરે છે.

## Sheet માં પ્રાણીનું નામ બતાવો

હવે, આપણે તરત જ જટિલ વિગતો વ્યૂ બનાવવાની ઉતાવળ ન કરીએ.

કોડને સમજવામાં સરળ બનાવવા માટે, પહેલા `Sheet` માં હાલના પ્રાણીનું નામ બતાવીએ.

`VStack` બહાર `.sheet(item:)` ઉમેરો:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

અહીં સૌથી મહત્વપૂર્ણ ભાગ આ કોડ છે:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

જ્યારે `selectedAnimal` પાસે value હોય, ત્યારે `Sheet` પોપ અપ થાય છે.

curly braces માંનું `animal` હાલ પસંદ કરાયેલું પ્રાણી છે.

તેથી:

```swift
Text(animal.name)
```

હાલ ક્લિક કરાયેલા પ્રાણીનું નામ બતાવશે.

ઉદાહરણ તરીકે, `ડોલ્ફિન` પર ક્લિક કરો તો Sheet માં `ડોલ્ફિન` દેખાય છે.

`પાંડા` પર ક્લિક કરો તો `Sheet` માં `પાંડા` દેખાય છે.

આ રીતે, આપણે અલગ-અલગ પ્રાણીઓ પર ક્લિક કરતાં અલગ-અલગ પ્રાણીનું નામ પોપ અપ કરવાની અસર મેળવી છે.

પ્રાણીનું નામ બતાવો:

![view](../../../Resource/029_view5.png)

પરંતુ પ્રાણી વિગતોમાં માત્ર નામ ન દેખાવું જોઈએ; તેમાં નામ, વિતરણ વિસ્તાર, નિવાસસ્થાન અને વર્ણન પણ દેખાવું જોઈએ.

જો આ બધો કોડ `.sheet` ની અંદર જ લખી દઈએ, તો કોડ ખૂબ લાંબો થઈ જશે અને વાંચવામાં અસુવિધાજનક બનશે.

તેથી, હવે આપણે એક નવો કસ્ટમ વ્યૂ બનાવીએ છીએ, જે ખાસ પ્રાણી વિગતો બતાવવાની જવાબદારી લે છે.

## પ્રાણી વિગતો વ્યૂ બનાવો

આગળ, આપણે એક નવો custom view `AnimalDetailView` બનાવીએ છીએ.

આ વ્યૂ એક `Animal` પ્રાપ્ત કરે છે અને પ્રાણી વિગતો બતાવે છે.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**વિતરણ વિસ્તાર**: \(animal.distributionArea)")

                    Divider()

                    Text("**નિવાસસ્થાન**: \(animal.habitat)")

                    Divider()

                    Text("**પ્રાણી વર્ણન**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

પ્રદર્શન પરિણામ:

![view](../../../Resource/029_view2.png)

અહીં મુખ્ય વાત છે:

```swift
var animal: Animal
```

આ બતાવે છે કે `AnimalDetailView` ને બહારથી એક પ્રાણી પ્રાપ્ત કરવાની જરૂર છે.

પ્રાણી મળ્યા પછી, વિગતો વ્યૂ આ પ્રાણીની વિવિધ માહિતીનો ઉપયોગ કરી શકે છે:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

અર્થાત્, `AnimalDetailView` ફક્ત પાસ કરાયેલા પ્રાણીને બતાવવાની જવાબદારી લે છે.

### Markdown bold text

વિગતો વ્યૂમાં, આપણે આ પ્રકારનો કોડ લખ્યો છે:

```swift
Text("**નિવાસસ્થાન:** \(animal.habitat)")
```

અહીં બે જ્ઞાન મુદ્દા છે.

પ્રથમ, `**નિવાસસ્થાન:**` `Markdown` syntax નો ઉપયોગ કરે છે. બે તારાઓથી ઘેરાયેલ લખાણ bold દેખાશે.

બીજું, `\()` string interpolation છે, જે variable ની value ને text માં બતાવી શકે છે.

આ કોડનો અર્થ છે પહેલા bold `નિવાસસ્થાન:` બતાવવું, પછી આ પ્રાણીનું નિવાસસ્થાન બતાવવું.

## Sheet માં વિગતો વ્યૂ બતાવો

`AnimalDetailView` બનાવી લીધા પછી, આપણે `ContentView` પર પાછા જઈ શકીએ છીએ અને `Sheet` માં પહેલાનું નામ વ્યૂ વિગતો વ્યૂથી બદલી શકીએ છીએ.

મૂળ કોડ હતો:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

હવે તેને આ રીતે બદલો:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

અહીં `animal:` `AnimalDetailView` નું parameter name છે.

પાછળનું `animal` `.sheet(item:)` દ્વારા પાસ કરાયેલ હાલનું પ્રાણી છે.

એટલે હાલ ક્લિક કરાયેલ પ્રાણીને `AnimalDetailView` ને બતાવવા માટે પાસ કરવું.

સંપૂર્ણ રચના:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

જ્યારે વપરાશકર્તા પ્રાણી પર ક્લિક કરે છે:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` માંથી ચોક્કસ પ્રાણીમાં બદલાય છે. `Sheet` તપાસે છે કે `selectedAnimal` પાસે value છે, તેથી તે વ્યૂ પોપ અપ કરે છે.

`Sheet` `selectedAnimal` માંનું પ્રાણી `AnimalDetailView` વ્યૂને આપે છે, અને `AnimalDetailView` પ્રાણી વિગતો બતાવે છે.

આ રીતે, આપણે પ્રાણી સૂચિ પર ક્લિક કરતાં સંબંધિત પ્રાણી વિગતો પોપ અપ કરવાની સુવિધા પૂર્ણ કરી છે.

## Sheet ની બે લખવાની રીતનો તફાવત

હવે, આપણે `.sheet(item:)` વડે પ્રાણી વિગતો વ્યૂનું પ્રદર્શન પૂર્ણ કર્યું છે.

અહીં `Sheet` ની બે સામાન્ય લખવાની રીતનો સરળ સારાંશ આપી શકાય છે.

### પહેલી રીત Boolean value bind કરે છે

```swift
@State private var showSheet = false

Button("Sheet બતાવો") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet વ્યૂ")
}
```

આ લખવાની રીત સ્થિર સામગ્રી પોપ અપ કરવા માટે યોગ્ય છે, જેમ કે Settings પેજ, સૂચના પેજ, prompt પેજ વગેરે.

`showSheet` એક Boolean value છે, જેમાં માત્ર `true` અને `false` બે સ્થિતિઓ હોય છે.

જ્યારે `showSheet` `true` હોય, ત્યારે `Sheet` દેખાય છે.

જ્યારે `showSheet` `false` હોય, ત્યારે `Sheet` દેખાતું નથી.

### બીજી રીત optional value bind કરે છે

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

આ લખવાની રીત પસંદ કરેલા ડેટા અનુસાર અલગ સામગ્રી પોપ અપ કરવા માટે યોગ્ય છે.

આ પાઠમાં, આપણે અલગ-અલગ પ્રાણી પર ક્લિક કરીએ ત્યારે અલગ પ્રાણીની વિગતો બતાવવી છે, તેથી `.sheet(item:)` વધુ યોગ્ય છે.

## સંપૂર્ણ કોડ

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // પ્રાણીનું નામ
    let name: String
    
    // પ્રાણીનું ચિત્ર
    let imageName: String
    
    // પ્રાણી લેબલ ચિહ્ન
    let avatarEmoji: String
    
    // વિતરણ વિસ્તાર
    let distributionArea: String
    
    // નિવાસસ્થાન
    let habitat: String
    
    // પ્રાણી વર્ણન
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ડોલ્ફિન
        Animal(
            name: "ડોલ્ફિન",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "વિશ્વભરના ગરમ અને સમશીતોષ્ણ સમુદ્રો.",
            habitat: "મહાસાગરો, કિનારાના પાણી અને કેટલીક મોટી નદીઓ.",
            animalDescription: "ડોલ્ફિન બુદ્ધિશાળી સમુદ્રી સસ્તન પ્રાણી છે. તેઓ જૂથોમાં રહે છે, અવાજોથી સંચાર કરે છે અને તેમના રમૂજી વર્તન માટે જાણીતા છે."
        ),
        // જિરાફ
        Animal(
            name: "જિરાફ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "આફ્રિકાના સવાણા અને ખુલ્લા વન પ્રદેશો.",
            habitat: "ઘાસના મેદાનો, સવાણા અને ખુલ્લા જંગલો.",
            animalDescription: "જિરાફ જમીન પરના સૌથી ઊંચા પ્રાણીઓ છે. તેમની લાંબી ગરદન અને લાંબા પગ હોય છે, અને તેઓ સામાન્ય રીતે ઊંચા વૃક્ષોના પાંદડા ખાય છે."
        ),
        // સિંહ
        Animal(
            name: "સિંહ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "મુખ્યત્વે સહારા દક્ષિણ આફ્રિકામાં જોવા મળે છે, અને પશ્ચિમ ભારતમાં નાની વસ્તી છે.",
            habitat: "ઘાસના મેદાનો, સવાણા અને ખુલ્લા વન પ્રદેશો.",
            animalDescription: "સિંહ શક્તિશાળી મોટા બિલાડીવર્ગના પ્રાણી છે. તેઓ સામાન્ય રીતે પ્રાઇડ કહેવાતા જૂથોમાં રહે છે અને ઘણી વાર પ્રાણી જગતના રાજા તરીકે ઓળખાય છે."
        ),
        // પાંડા
        Animal(
            name: "પાંડા",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "મધ્ય ચીનના પર્વતીય જંગલો.",
            habitat: "ઠંડા અને ભેજવાળા પર્વતીય વિસ્તારોના બાંસના જંગલો.",
            animalDescription: "પાંડા તેમના કાળા-સફેદ વાળ માટે જાણીતા રીંછ છે. તેઓ મુખ્યત્વે બાંસ ખાય છે અને વિશ્વના સૌથી ઓળખાય એવા પ્રાણીઓમાંના એક છે."
        ),
        // ધ્રુવીય રીંછ
        Animal(
            name: "ધ્રુવીય રીંછ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ઉત્તર ધ્રુવની આસપાસના આર્કટિક પ્રદેશો.",
            habitat: "સમુદ્રી બરફ, કિનારાના વિસ્તારો અને ઠંડા આર્કટિક પર્યાવરણો.",
            animalDescription: "ધ્રુવીય રીંછ ઠંડા પર્યાવરણ માટે અનુકૂળ થયેલા મોટા રીંછ છે. તેઓ શક્તિશાળી તરવૈયા છે અને સીલનો શિકાર કરવા માટે મુખ્યત્વે સમુદ્રી બરફ પર આધાર રાખે છે."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**વિતરણ વિસ્તાર**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**નિવાસસ્થાન**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**પ્રાણી વર્ણન**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## સારાંશ

આ પાઠમાં એક સરળ પ્રાણી વિશ્વકોશ પેજ પૂર્ણ કર્યું.

અમે પહેલા `Animal` સ્ટ્રક્ચર વડે પ્રાણી માહિતી સાચવી, પછી array વડે પાંચ પ્રાણીઓ સાચવ્યા, અને પછી `ForEach` વડે પ્રાણી સૂચિ બતાવી.

જ્યારે વપરાશકર્તા કોઈ પ્રાણી પર ક્લિક કરે છે, ત્યારે આપણે આ પ્રાણીને `selectedAnimal` માં સાચવીએ છીએ:

```swift
selectedAnimal = animal
```

જ્યારે `selectedAnimal` પાસે value હોય, ત્યારે `.sheet(item:)` વિગતો વ્યૂ પોપ અપ કરે છે અને પસંદ કરેલા પ્રાણીને `AnimalDetailView` ને આપે છે.

આ પાઠની સૌથી મહત્વપૂર્ણ બાબત interface style નથી, પરંતુ આ data passing route સમજવી છે:

```swift
પ્રાણી પર ક્લિક કરો → selectedAnimal પ્રાણી સાચવે છે → Sheet પોપ અપ થાય છે → AnimalDetailView વિગતો બતાવે છે
```

આ route સમજ્યા પછી, ભવિષ્યમાં વધુ સમાન સુવિધાઓ બનાવી શકાય છે, જેમ કે ઉત્પાદન વિગતો, કોર્સ વિગતો, લેખ વિગતો, સંપર્ક વિગતો વગેરે.
