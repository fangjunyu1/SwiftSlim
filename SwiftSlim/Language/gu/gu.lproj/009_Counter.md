# કાઉન્ટર

પાછલા બે પાઠોમાં આપણે variables, constants, buttons અને methods શીખ્યા હતા.

આ પાઠમાં આપણે આ જ્ઞાનને જોડીને એક સરળ counter App બનાવશું.

આ ઉદાહરણમાં આપણે variable save અને change કરવું, અને variable ને manage કરવા માટે `@State` નો ઉપયોગ શીખીશું.

## counter બનાવવું

counter સામાન્ય રીતે સતત વધતી સંખ્યા record કરવા માટે વપરાય છે. જેમ કે jump rope count, running laps count વગેરે.

હવે આપણે એક સરળ counter બનાવીએ: screen પર એક number દેખાય અને button click કરતાં તે number વધે.

![Num](../../RESOURCE/009_num.png)

### number બતાવવું

સૌપ્રથમ આપણે `Text` વડે number બતાવીએ.

```swift
Text("0")
```

પણ જો number બદલાવાનો હોય, તો `"0"` ને hard-code ન કરવો જોઈએ; તેના બદલે number ને variable માં save કરવું જોઈએ.

```swift
var num = 0
```

પછી `Text` માં variable બતાવો:

```swift
Text("\(num)")
```

અહીં string interpolation `\()` નો ઉપયોગ કરીને number ને string માં ફેરવીને બતાવવામાં આવે છે.

### button થી number વધારવું

હવે એક button ઉમેરીએ.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

button click થાય ત્યારે number વધવો જોઈએ.

એટલે button ની અંદર variable ને બદલી શકાય:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

આ code નો અર્થ છે: button click થાય ત્યારે `num + 1` ગણવામાં આવે છે અને result ફરી `num` ને assign થાય છે.

### વધુ ટૂંકો syntax

Swift આ માટે વધુ સરળ syntax આપે છે:

```swift
num += 1
```

આ નીચેના જેટલું જ છે:

```swift
num = num + 1
```

આને compound assignment operator કહેવામાં આવે છે.

Swift માં સામાન્ય compound assignment operators:

```
+=   ઉમેરણી assignment
-=   બાદબાકી assignment
*=   ગુણાકાર assignment
/=   ભાગાકાર assignment
%=   remainder assignment
```

ઉદાહરણ તરીકે:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### સંપૂર્ણ code

હવે આપણે એક સરળ counter લખી શકીએ:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

પણ અત્યારે આ code યોગ્ય રીતે run નહીં થાય.

### error કેમ આવે છે

Xcode બતાવશે:

```
Cannot assign to property: 'self' is immutable
```

એનો અર્થ કે property ને બદલી શકાતી નથી, કારણ કે view immutable છે.

એવું કેમ?

## SwiftUI કેવી રીતે કામ કરે છે

SwiftUI માં **interface data-driven હોય છે**. એટલે data બદલાય ત્યારે interface આપમેળે refresh થાય છે.

પરંતુ ધ્યાન આપો: SwiftUI ફક્ત state (`@State`, `@Binding` વગેરે) બદલાય ત્યારે જ ફેરફાર observe કરે છે અને view ને refresh કરે છે.

જો સામાન્ય variable વપરાય, તો SwiftUI view create સમયે ફક્ત એક જ વાર તેની value વાંચે છે. પછી variable બદલાય તો પણ interface update થતું નથી.

ઉદાહરણ તરીકે:

```swift
var num = 0   // 0
num = 1   // 0
```

ઉપરના ઉદાહરણમાં `num` સામાન્ય variable છે. તેની value બદલાય છે, પણ SwiftUI view update કરતું નથી, એટલે screen પર પહેલાનું `0` જ દેખાશે.

![Num](../../RESOURCE/009_state.png)

એટલે data ને state તરીકે mark કરવામાં આવે ત્યારે જ SwiftUI તેને monitor કરીને view update કરે છે.

## `@State` property wrapper

SwiftUI માં variable ને બદલીને view update કરવો હોય, તો `@State` જરૂરી છે.

```swift
@State var num = 0
```

`@State` SwiftUI ને આ variable પર નજર રાખવા દે છે.

જ્યારે variable બદલાય, ત્યારે SwiftUI view ફરી calculate કરે છે અને view update કરે છે.

પૂર્ણ code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

હવે button click કરતાં:

```swift
num += 1
```

SwiftUI ધ્યાન આપે છે કે `num` બદલાયું છે, અને પછી interface આપમેળે update થાય છે.

![Num](../../RESOURCE/009_state1.png)

## `@State` ના ઉપયોગના નિયમો

actual development માં `@State` સામાન્ય રીતે બે નિયમો અનુસરે છે.

### 1. `@State` સામાન્ય રીતે `private` સાથે વપરાય

`@State` variable સામાન્ય રીતે માત્ર હાલના type (જેમ કે હાલના `View` struct) માં જ વપરાય છે, તેથી તેને આમ લખવામાં આવે છે:

```swift
@State private var num = 0
```

આથી બીજા views સીધા આ variable ને access અથવા modify કરી શકતા નથી.

હજુ `private` શીખ્યા નથી, તો સરળ રીતે આવું સમજો:

**`private` થી ચિહ્નિત content ફક્ત હાલના view ની અંદર જ વાપરી શકાય છે.**

### 2. `@State` ફક્ત હાલના view ની state માટે

`@State` એ data માટે યોગ્ય છે જે હાલનું `View` પોતે manage કરે છે.

જેમ કે text field નું content, switch ની સ્થિતિ વગેરે.

```swift
@State private var isOn = false
@State private var text = ""
```

જો data ઘણા views વચ્ચે share કરવો હોય, તો `@Binding` અથવા `@Observable` જેવા બીજા state types વાપરવા પડે.

આ બાબતો આગળના પાઠોમાં શીખીશું.

### ઘટાડવાનો button

counter માં ફક્ત વધારો જ નહીં, ઘટાડો પણ હોઈ શકે.

અમે `-` button ઉમેરી શકીએ:

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

પછી buttons ને horizontal ગોઠવવા માટે `HStack` વાપરીએ:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

પરિણામ:

![Num](../../RESOURCE/009_num1.png)

`+` button click કરતાં number `1` વધે છે; `-` button click કરતાં `1` ઘટે છે.

### reset button

અમે એક reset button પણ ઉમેરી શકીએ, જે number ને ફરી `0` કરે.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

reset button click થાય ત્યારે `num` ને `0` assign થાય છે.

પરિણામ:

![Num](../../RESOURCE/009_num2.png)

`0` button click કરતાં number ફરી `0` બની જાય છે.

### custom button

હાલમાં અમારા buttons ફક્ત text બતાવે છે:

```swift
Button("+") {

}
```

આ રીતે લખેલા button ફક્ત text content બતાવે છે, જેમ કે `+` અથવા `-`.

પરંતુ actual development માં અમે button ને વધુ સમૃદ્ધ દેખાવ આપવા માંગીએ, જેમ કે icon અથવા બીજા views બતાવીને.

SwiftUI button નું displayed content customize કરવાની મંજૂરી આપે છે. તે માટે `Button` નો બીજો syntax વપરાય છે:

```swift
Button(action: {

}, label: {

})
```

અહીં `action` button click થાય ત્યારે ચાલતો code છે, અને `label` button માટે બતાવાતો view છે.

ઉદાહરણ તરીકે, button ને SF Symbols icon સાથે બતાવી શકાય:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

આ રીતે button હવે text ના બદલે icon બતાવે છે.

### counter interface ને વધુ સારું બનાવવું

counter interface વધુ સ્પષ્ટ બનાવવા માટે number ની style પણ બદલી શકાય, જેમ કે મોટું font:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

હવે buttons ના label ને પણ icons માં ફેરવો અને icon size થોડું મોટું કરો:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

એ જ રીતે decrease button અને reset button ને પણ icon સ્વરૂપમાં બદલી શકાય:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

હવે buttons SF Symbols icons બતાવે છે, અને interface વધુ સ્પષ્ટ લાગે છે.

![Num](../../RESOURCE/009_num3.png)

## સારાંશ

આ પાઠમાં એક સરળ counter બનાવીને આપણે variables, `Text` અને `Button` નો સંયુક્ત ઉપયોગ કર્યો. variable દ્વારા number save કર્યો અને buttons વડે number વધારવો કે ઘટાડવો તે નિયંત્રિત કર્યું. સાથે compound assignment operators જેમ કે `num += 1` અને `num -= 1` પણ શીખ્યા.

બનાવવાની પ્રક્રિયામાં આપણે SwiftUI કેવી રીતે કામ કરે છે તે પણ સમજ્યું: interface data-driven છે. data બદલાય ત્યારે interface refresh થાય છે. તેથી બદલાઈ શકતી state save કરવા માટે `@State` જરૂરી છે. જ્યારે `@State` variable બદલાય, ત્યારે SwiftUI view આપમેળે update કરે છે.

છેલ્લે interface ને થોડું optimize પણ કર્યું: `Text` માટે font style બદલી, અને `Button(action:label:)` વડે button ના content ને customize કરીને icon બતાવ્યાં. આથી counter interface વધુ સ્પષ્ટ અને સુંદર બન્યું.

હવે આપણે SwiftUI views કેવી રીતે કામ કરે છે તેની મૂળભૂત સમજ મેળવી છે. SwiftUI માં મોટાભાગના interfaces variables દ્વારા ચલાવવામાં આવે છે. જ્યારે variables બદલાય છે, ત્યારે SwiftUI view આપમેળે update કરે છે. તેથી SwiftUI App બનાવતી વખતે આપણે પહેલા કયો data save કરવો છે તે વિચારીએ, અને પછી એ data આધારે interface અને interaction logic બનાવીયે.

## સંપૂર્ણ code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
