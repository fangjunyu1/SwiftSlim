# काउंटर

मागील दोन धड्यांमध्ये आपण variables, constants, buttons आणि methods शिकलो.

या धड्यात आपण हे ज्ञान एकत्र करून एक साधे counter application तयार करू.

या उदाहरणात, आपण variable कसे साठवायचे आणि बदलायचे, तसेच variable व्यवस्थापित करण्यासाठी `@State` कसा वापरायचा हे शिकू.

## काउंटर तयार करणे

counter हा सहसा सतत वाढत जाणारी संख्या नोंदवण्यासाठी वापरला जातो. उदाहरणार्थ, उड्या मारण्याची संख्या, धावण्याच्या फेऱ्या इत्यादी count करण्याच्या प्रसंगात.

आता आपण एक साधा counter तयार करू: एक संख्या दाखवायची आणि बटणावर क्लिक केल्यावर ती वाढवायची.

![Num](../../RESOURCE/009_num.png)

### संख्या दाखवणे

सर्वप्रथम, आपण संख्या दाखवण्यासाठी `Text` वापरू.

```swift
Text("0")
```

पण जर संख्या बदलणारी असेल, तर `"0"` असे थेट लिहू नये; त्याऐवजी ती variable मध्ये साठवली पाहिजे.

```swift
var num = 0
```

आणि नंतर `Text` मध्ये तो variable दाखवू:

```swift
Text("\(num)")
```

इथे string interpolation `\\()` वापरून संख्या string मध्ये रूपांतरित करून दाखवली आहे.

### बटणाने संख्या वाढवणे

पुढे, आपण एक बटण जोडू.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

बटणावर क्लिक केल्यावर संख्या वाढावी अशी आपली अपेक्षा आहे.

म्हणून बटणाच्या action मध्ये variable बदलू शकतो:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

या कोडचा अर्थ असा: बटणावर क्लिक झाल्यावर `num + 1` मोजले जाईल, आणि त्याचा परिणाम `num` मध्ये साठवला जाईल.

### अधिक संक्षिप्त syntax

Swift मध्ये यासाठी अधिक संक्षिप्त syntax आहे:

```swift
num += 1
```

हे पुढील syntax सारखेच आहे:

```swift
num = num + 1
```

याला “compound assignment operator” म्हणतात.

Swift मधील काही सामान्य compound assignment operators:

```
+=   बेरीज assignment
-=   वजाबाकी assignment
*=   गुणाकार assignment
/=   भागाकार assignment
%=   बाकी assignment
```

उदाहरणार्थ:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### पूर्ण कोड

आता आपण एक साधा counter लिहू शकतो:

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

पण या अवस्थेत कोड नीट चालणार नाही.

### त्रुटी दिसते

Xcode पुढील संदेश दाखवेल:

```
Cannot assign to property: 'self' is immutable
```

याचा अर्थ property बदलता येत नाही, कारण view immutable आहे.

हे असे का होते?

## SwiftUI ची कार्यपद्धती

SwiftUI मध्ये: **interface डेटा-आधारित असते**, म्हणजे डेटा बदलल्यावर interface आपोआप refresh होते.

पण लक्षात ठेवण्यासारखी गोष्ट म्हणजे, फक्त state (`@State`, `@Binding` इ.) बदलल्यावरच SwiftUI तो बदल monitor करून view refresh करते.

जर आपण सामान्य variable वापरला, तर SwiftUI view तयार होताना त्याची value फक्त एकदाच वाचते. त्यानंतर variable बदलला तरी interface update होत नाही.

उदाहरणार्थ:

```swift
var num = 0   // 0
num = 1   // 0
```

वरील उदाहरणात `num` हा सामान्य variable आहे. त्याची value बदलली असली तरी SwiftUI view update करत नाही, त्यामुळे interface वर सुरुवातीची `0` हीच value दिसते.

![Num](../../RESOURCE/009_state.png)

म्हणून, फक्त data state म्हणून mark केल्यावरच (उदा. `@State`, `@Binding` सारख्या property wrapper च्या मदतीने) SwiftUI त्या बदलावर लक्ष ठेवते आणि view update करते.

## @State property wrapper

SwiftUI मध्ये variable बदलून view update करायचा असेल, तर `@State` वापरणे आवश्यक आहे.

```swift
@State var num = 0
```

`@State` मुळे SwiftUI या variable वर लक्ष ठेवते.

जेव्हा variable बदलतो, तेव्हा SwiftUI view पुन्हा compute करते आणि view update करते.

पूर्ण कोड:

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

आता बटणावर क्लिक केल्यावर:

```swift
num += 1
```

SwiftUI ला `num` बदलल्याचे लक्षात येते आणि ती आपोआप view update करते.

![Num](../../RESOURCE/009_state1.png)

## @State वापरण्याचे नियम

प्रत्यक्ष development मध्ये, `@State` साधारणपणे दोन नियमांचे पालन करते.

### 1. `@State` सहसा `private` सोबत वापरतात

`@State` variable सामान्यतः फक्त सध्याच्या type मध्ये (उदा. सध्याच्या `View` struct मध्ये) वापरला जातो, म्हणून तो सहसा असा लिहिला जातो:

```swift
@State private var num = 0
```

यामुळे इतर views हा variable थेट access किंवा modify करू शकत नाहीत.

आत्तासाठी `private` शिकलेले नसले तरी सोप्या भाषेत असे समजू शकतो:

**`private` ने modify केलेली सामग्री फक्त सध्याच्या view मध्येच वापरता येते; बाहेरील view तिला वापरू शकत नाही.**

### 2. `@State` फक्त सध्याच्या view च्या state साठी वापरतात

`@State` हे सध्याच्या `View` ने स्वतः manage केलेल्या data साठी योग्य आहे.

उदाहरणार्थ, text field मधील मजकूर, switch ची स्थिती.

```swift
@State private var isOn = false
@State private var text = ""
```

जर data अनेक views मध्ये share करायचा असेल, तर `@Binding` किंवा `@Observable` यांसारखे इतर state types वापरावे लागतील.

ही सामग्री पुढील धड्यांमध्ये शिकू.

### कमी करणारे बटण

counter मध्ये फक्त वाढवणे नाही, कमी करणेही शक्य असावे.

आपण `-` बटण जोडू शकतो.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

आणि बटणांना आडव्या रचनेत ठेवण्यासाठी `HStack` वापरू:

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

परिणाम:

![Num](../../RESOURCE/009_num1.png)

`+` बटणावर क्लिक केल्यावर संख्या 1 ने वाढते; `-` बटणावर क्लिक केल्यावर संख्या 1 ने कमी होते.

### reset बटण

आपण आणखी एक reset बटण जोडू शकतो, ज्यामुळे संख्या पुन्हा 0 होईल.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

reset बटणावर क्लिक केल्यावर `num` ला 0 assign केले जाते.

परिणाम:

![Num](../../RESOURCE/009_num2.png)

`0` बटणावर क्लिक केल्यावर संख्या 0 होते.

### custom बटण

सध्या आपले बटण फक्त मजकूर दाखवते:

```swift
Button("+") {

}
```

या syntax मधील बटण फक्त text content दाखवू शकते, जसे `+` किंवा `-`.

पण प्रत्यक्ष development मध्ये आपल्याला बटणाचे रूप अधिक समृद्ध हवे असते, उदाहरणार्थ icons किंवा इतर views वापरून.

SwiftUI मध्ये बटणाच्या display content ला custom करता येते. अशावेळी बटणाची दुसरी syntax वापरता येते:

```swift
Button(action: {

}, label: {

})
```

या syntax मध्ये `action` म्हणजे बटण क्लिक केल्यावर execute होणारा कोड, आणि `label` म्हणजे बटणावर दिसणारा view.

उदाहरणार्थ, बटणावर SF Symbols icon दाखवू शकतो:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

अशा वेळी बटण मजकूराऐवजी icon दाखवते.

### counter interface सुधारणा

counter चे interface अधिक स्पष्ट दिसावे म्हणून, आपण संख्येची display style सुधारू शकतो. उदाहरणार्थ, संख्या मोठी दाखवणे:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

पुढे, बटणांचे display content देखील icons मध्ये बदलू, आणि icon चा आकार थोडा मोठा करू:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

तसेच, decrease button आणि reset button यांनाही icon स्वरूपात बदलू शकतो:

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

आता बटणांवर SF Symbols icons दिसतात, आणि interface अधिक intuitive वाटते.

![Num](../../RESOURCE/009_num3.png)

## सारांश

या धड्यात आपण एक साधा counter तयार करून variables, `Text`, आणि `Button` चा एकत्रित सराव केला. आपण variable मध्ये संख्या साठवली आणि बटणांच्या मदतीने ती वाढवली-कमी केली, तसेच `num += 1` आणि `num -= 1` यांसारखे compound assignment operators शिकले.

या प्रक्रियेत आपण SwiftUI कसे काम करते हे समजून घेतले: interface हे data-driven असते. डेटा बदलल्यावरच interface refresh होते. म्हणून बदलणारी state `@State` मध्ये साठवावी लागते; जेव्हा `@State` variable बदलतो, तेव्हा SwiftUI आपोआप view update करते.

शेवटी आपण interface थोडा सुधारला, `Text` चा font style बदलला, आणि `Button(action:label:)` वापरून button content custom केले, ज्यामुळे बटणांवर icons दाखवता आले आणि counter interface अधिक स्पष्ट व सुंदर झाले.

आता आपण SwiftUI views च्या मूलभूत वापराशी परिचित झालो आहोत. SwiftUI मध्ये बहुतेक interfaces variables द्वारे चालतात. variable बदलला की SwiftUI आपोआप view update करते. त्यामुळे SwiftUI app develop करताना, सर्वप्रथम कोणता data साठवायचा आहे हे डिझाइन करणे आणि त्यानंतर त्या data च्या मदतीने interface व interaction logic तयार करणे ही सामान्य पद्धत असते.

## पूर्ण कोड

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
