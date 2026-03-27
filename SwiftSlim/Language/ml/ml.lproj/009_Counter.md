# കൗണ്ടർ

മുൻ രണ്ട് പാഠങ്ങളിൽ variables, constants, buttons, methods എന്നിവ പഠിച്ചു.

ഈ പാഠത്തിൽ ആ അറിവുകൾ ഒന്നിച്ചുചേർത്ത് ഒരു ലളിതമായ counter app നിർമ്മിക്കാം.

ഈ ഉദാഹരണത്തിൽ variable എങ്ങനെ save ചെയ്യാം, മാറ്റാം, കൂടാതെ `@State` ഉപയോഗിച്ച് variable manage ചെയ്യാം എന്നും പഠിക്കും.

## Counter നടപ്പാക്കുക

Counter തുടർച്ചയായി കൂടിക്കൊണ്ടിരിക്കുന്ന ഒരു quantity രേഖപ്പെടുത്താൻ സാധാരണമായി ഉപയോഗിക്കുന്നു. ഉദാഹരണത്തിന് skipping count, running laps തുടങ്ങിയ counting സാഹചര്യങ്ങൾ.

ഇപ്പോൾ ഒരു ലളിതമായ counter സൃഷ്ടിക്കാം: ഒരു number കാണിക്കുകയും, button click ചെയ്താൽ ആ number കൂടുകയും ചെയ്യട്ടെ.

![Num](../../RESOURCE/009_num.png)

### Number കാണിക്കുക

ആദ്യം `Text` ഉപയോഗിച്ച് number കാണിക്കാം.

```swift
Text("0")
```

പക്ഷേ number മാറിക്കൊണ്ടിരിയ്ക്കണമെങ്കിൽ fixed `"0"` നേരിട്ട് എഴുതാൻ പറ്റില്ല; പകരം അത് save ചെയ്യാൻ variable ഉപയോഗിക്കണം.

```swift
var num = 0
```

തുടർന്ന് `Text`-ൽ variable കാണിക്കുക:

```swift
Text("\(num)")
```

ഇവിടെ string interpolation `\()` ഉപയോഗിച്ച് number-നെ string ആക്കി display ചെയ്യുന്നു.

### Button ഉപയോഗിച്ച് number കൂട്ടുക

അടുത്തതായി ഒരു button ചേർക്കാം.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Button click ചെയ്താൽ number കൂടണമെന്ന് നമുക്ക് വേണം.

അതുകൊണ്ട് button-നുള്ളിൽ variable മാറ്റാം:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

ഈ code-ന്റെ അർത്ഥം: button click ചെയ്യുമ്പോൾ `num + 1` calculate ചെയ്തു result `num`-ലേക്ക് assign ചെയ്യുക.

### കൂടുതൽ ലളിതമായ syntax

Swift ഇനിയും ലളിതമായ ഒരു syntax നൽകുന്നു:

```swift
num += 1
```

ഇത് താഴെപ്പറയുന്നതിന് തുല്യമാണ്:

```swift
num = num + 1
```

ഇത്തരം syntax-നെ “compound assignment operator” എന്ന് പറയുന്നു.

Swift-ൽ സാധാരണ compound assignment operators:

```
+=   കൂട്ടിച്ചേർത്ത് assign ചെയ്യുക
-=   കുറച്ച് assign ചെയ്യുക
*=   ഗുണിച്ച് assign ചെയ്യുക
/=   bölിച്ച് assign ചെയ്യുക
%=   remainder assign ചെയ്യുക
```

ഉദാഹരണത്തിന്:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### പൂർണ്ണ കോഡ്

ഇപ്പോൾ ഒരു ലളിതമായ counter എഴുതാം:

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

എന്നാൽ ഈ code ഇപ്പോൾ ശരിയായി പ്രവർത്തിക്കില്ല.

### വരുന്ന error

Xcode ഇങ്ങനെ prompt ചെയ്യും:

```
Cannot assign to property: 'self' is immutable
```

അത് property modify ചെയ്യാൻ കഴിയില്ല, കാരണം view immutable ആണെന്നർത്ഥം.

ഇത് എന്തുകൊണ്ട്?

## SwiftUI എങ്ങനെ പ്രവർത്തിക്കുന്നു

SwiftUI-ൽ: **UI data-driven ആണ്**. അതായത് data മാറുമ്പോൾ UI സ്വയം refresh ചെയ്യും.

പക്ഷേ ശ്രദ്ധിക്കേണ്ടത്: state (`@State`, `@Binding` പോലുള്ള) മാറുമ്പോഴാണ് SwiftUI ആ മാറ്റം observe ചെയ്ത് view refresh ചെയ്യുന്നത്.

സാധാരണ variable ഉപയോഗിച്ചാൽ SwiftUI view create ചെയ്യുന്ന സമയത്ത് ഒരിക്കൽ മാത്രം അതിന്റെ value വായിക്കും; പിന്നീട് അത് മാറിയാലും UI update ചെയ്യുകയില്ല.

ഉദാഹരണത്തിന്:

```swift
var num = 0   // 0
num = 1   // 0
```

മുകളിലുള്ള ഉദാഹരണത്തിൽ `num` ഒരു സാധാരണ variable ആണ്. അതിന്റെ value മാറിയിട്ടും SwiftUI view update ചെയ്യില്ല; UI ഇപ്പോഴും തുടക്കത്തിലെ `0` തന്നെയാകും കാണിക്കുക.

![Num](../../RESOURCE/009_state.png)

അതുകൊണ്ട് data state ആയി mark ചെയ്താൽ മാത്രമേ (`@State`, `@Binding` പോലുള്ള property wrappers ഉപയോഗിച്ച്) SwiftUI അതിലെ മാറ്റം observe ചെയ്ത് view update ചെയ്യൂ.

## `@State` property wrapper

SwiftUI-ൽ variable modify ചെയ്യുകയും view update ചെയ്യുകയും വേണമെങ്കിൽ `@State` നിർബന്ധമാണ്.

```swift
@State var num = 0
```

`@State` SwiftUI-നെ ഈ variable observe ചെയ്യാൻ പ്രാപ്തമാക്കുന്നു.

Variable മാറുമ്പോൾ SwiftUI view വീണ്ടും calculate ചെയ്ത് update ചെയ്യും.

പൂർണ്ണ കോഡ്:

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

ഇപ്പോൾ button click ചെയ്താൽ:

```swift
num += 1
```

SwiftUI `num` മാറിയതായി കണ്ടെത്തുകയും view സ്വയം update ചെയ്യുകയും ചെയ്യും.

![Num](../../RESOURCE/009_state1.png)

## `@State` ഉപയോഗിക്കുന്ന നിയമങ്ങൾ

യഥാർത്ഥ development-ൽ `@State` സാധാരണമായി രണ്ട് നിയമങ്ങൾ പിന്തുടരും.

### 1. `@State` സാധാരണ `private`-നൊപ്പം ഉപയോഗിക്കുന്നു

`@State` variables സാധാരണയായി നിലവിലെ type-നുള്ളിൽ മാത്രം (ഉദാ: നിലവിലെ `View` struct-ൽ) ഉപയോഗിക്കുന്നതിനാൽ പൊതുവെ ഇങ്ങനെ എഴുതും:

```swift
@State private var num = 0
```

ഇതിലൂടെ മറ്റു views ഈ variable നേരിട്ട് access ചെയ്യുന്നതും modify ചെയ്യുന്നതും ഒഴിവാക്കാം.

`private` നാം ഇനിയും പഠിച്ചിട്ടില്ല; ഇപ്പോൾ ഇത് ലളിതമായി ഇങ്ങനെ മനസ്സിലാക്കാം:

**`private` ഉപയോഗിച്ച് അടയാളപ്പെടുത്തിയ content നിലവിലെ view-ൽ മാത്രമേ ഉപയോഗിക്കാനാകൂ; പുറത്തുള്ള views-ന് അത് ഉപയോഗിക്കാനാകില്ല.**

### 2. `@State` നിലവിലെ view-ന്റെ state-ക്കായി മാത്രം

`@State` നിലവിലെ `View` തന്നെ manage ചെയ്യുന്ന data-ക്കാണ് അനുയോജ്യം.

ഉദാഹരണത്തിന് input field content, switch state തുടങ്ങിയവ.

```swift
@State private var isOn = false
@State private var text = ""
```

Data ഒന്നിലധികം views തമ്മിൽ share ചെയ്യണമെങ്കിൽ `@Binding` അല്ലെങ്കിൽ `@Observable` പോലുള്ള മറ്റ് state types ഉപയോഗിക്കണം.

ഇവയെക്കുറിച്ച് പിന്നീടുള്ള പാഠങ്ങളിൽ പഠിക്കും.

### കുറയ്ക്കുന്ന ബട്ടൺ

Counter-ൽ increase മാത്രമല്ല, decrease ഉം വേണം.

അതിനായി `-` button ചേർക്കാം.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

ശേഷം buttons horizontal ആയി ക്രമീകരിക്കാൻ `HStack` ഉപയോഗിക്കുക:

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

ഫലം:

![Num](../../RESOURCE/009_num1.png)

`+` button click ചെയ്താൽ number 1 കൂടും; `-` button click ചെയ്താൽ number 1 കുറയും.

### Reset button

Number വീണ്ടും `0` ആക്കാൻ ഒരു reset button-ും ചേർക്കാം.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Reset button click ചെയ്താൽ `num`-ന് `0` assign ചെയ്യും.

ഫലം:

![Num](../../RESOURCE/009_num2.png)

`0` button click ചെയ്താൽ number `0` ആകും.

### Custom button

ഇപ്പോൾ വരെ നമ്മുടെ buttons text മാത്രമേ കാണിച്ചിട്ടുള്ളൂ:

```swift
Button("+") {

}
```

ഈ syntax ഉപയോഗിച്ച് സൃഷ്ടിച്ച button-ന് text മാത്രം കാണിക്കാൻ കഴിയും, ഉദാഹരണത്തിന് `+` അല്ലെങ്കിൽ `-`.

യഥാർത്ഥ development-ൽ button-ന്റെ appearance കൂടുതൽ സമ്പന്നമാകണം എന്ന് നാം ആഗ്രഹിക്കും; ഉദാഹരണത്തിന് icons അല്ലെങ്കിൽ മറ്റ് views ഉപയോഗിക്കുക.

SwiftUI button-ന്റെ display content customize ചെയ്യാൻ അനുവദിക്കുന്നു. അതിനായി button-ന്റെ മറ്റൊരു syntax ഉപയോഗിക്കാം:

```swift
Button(action: {

}, label: {

})
```

ഈ syntax-ൽ `action` button click ചെയ്തപ്പോൾ execute ചെയ്യുന്ന code ആണ്; `label` button-ൽ കാണിക്കേണ്ട view ആണ്.

ഉദാഹരണത്തിന് button-ൽ ഒരു SF Symbols icon കാണിക്കാം:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

ഇപ്പോൾ button text അല്ല, icon ആണ് കാണിക്കുക.

### Counter UI കൂടുതൽ മെച്ചപ്പെടുത്തുക

Counter interface കൂടുതൽ വ്യക്തമായിരിക്കാനായി number-ന്റെ display style മാറ്റാം. ഉദാഹരണത്തിന് number വലുതാക്കാം:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

തുടർന്ന് button display content-വും icon ആക്കി, അതിന്റെ size അല്പം വലുതാക്കാം:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

അതു പോലെ decrease button ഉം reset button ഉം icon form-ലാക്കാം:

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

ഇപ്പോൾ buttons SF Symbols icons കാണിക്കും; UI കൂടുതൽ intuitive ആയിരിക്കും.

![Num](../../RESOURCE/009_num3.png)

## സംഗ്രഹം

ഈ പാഠത്തിൽ ഒരു ലളിതമായ counter നടപ്പിലാക്കുന്നതിലൂടെ variables, `Text`, `Button` എന്നിവയുടെ സംയുക്ത ഉപയോഗം അഭ്യസിച്ചു. Number save ചെയ്യാൻ variable ഉപയോഗിക്കുകയും, buttons വഴി number കൂട്ടുകയും കുറക്കുകയും ചെയ്തു. അതോടൊപ്പം `num += 1`, `num -= 1` പോലുള്ള compound assignment operators-വും പഠിച്ചു.

നടപ്പാക്കൽ പ്രക്രിയയിൽ SwiftUI എങ്ങനെ പ്രവർത്തിക്കുന്നു എന്നും മനസ്സിലാക്കി: UI data-driven ആണ്. Data മാറുമ്പോഴേ UI refresh ചെയ്യൂ. അതിനാൽ mutable state save ചെയ്യാൻ `@State` ഉപയോഗിക്കണം; `@State` variable മാറുമ്പോൾ SwiftUI view സ്വയം update ചെയ്യും.

അവസാനം UI-യെ ചെറിയ രീതിയിൽ optimize ചെയ്തു: `Text`-ന്റെ font style adjust ചെയ്തു, `Button(action:label:)` ഉപയോഗിച്ച് button content customize ചെയ്തു, button-ൽ icons കാണിക്കാൻ സാധ്യമാക്കി. ഇതിലൂടെ counter UI കൂടുതൽ വ്യക്തവും മനോഹരവും ആയി.

ഇപ്പോൾ SwiftUI view-ന്റെ അടിസ്ഥാന ഉപയോഗരീതിയെ നാം സ്പർശിച്ചു കഴിഞ്ഞു. SwiftUI-ൽ ഭൂരിഭാഗം UI-യും variables വഴി നിയന്ത്രിക്കപ്പെടുന്നു. Variable മാറുമ്പോൾ SwiftUI സ്വയം view update ചെയ്യും. അതിനാൽ SwiftUI app നിർമ്മിക്കുമ്പോൾ സാധാരണയായി ആദ്യം save ചെയ്യേണ്ട data design ചെയ്യുകയും, പിന്നീട് അതിന്റെ അടിസ്ഥാനത്തിൽ UIയും interaction logic-ഉം നിർമിക്കുകയും ചെയ്യുന്നു.

## പൂർണ്ണ കോഡ്

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
