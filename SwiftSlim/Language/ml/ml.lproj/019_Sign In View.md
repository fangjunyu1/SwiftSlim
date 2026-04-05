# സൈൻ ഇൻ വ്യൂ

ഈ പാഠത്തിൽ, വളരെ പ്രായോഗികമായ ഒരു ദൃശ്യം പഠിക്കാം, അത് സൈൻ ഇൻ വ്യൂ ആണ്.

അത് ഒരു വെബ്സൈറ്റ് ആയാലും ആപ്പ് ആയാലും, ഉപയോഗിക്കുന്ന സമയത്ത് പലപ്പോഴും ഉപയോക്താവ് തന്റെ അക്കൗണ്ടിൽ സൈൻ ഇൻ ചെയ്യുകയും പാസ്‌വേഡ് നൽകുകയും ചെയ്യേണ്ടിവരും.

ഉദാഹരണത്തിന്, GitHub സൈൻ ഇൻ പേജ്:

![WordPress](../../Resource/019_github.png)

ഈ പാഠത്തിൽ, ഉപയോക്താവ് കൈയോടെ അക്കൗണ്ടും പാസ്‌വേഡും നൽകാൻ കഴിയുന്ന, കൂടാതെ നൽകിയ ഉള്ളടക്കത്തിൽ എന്തെങ്കിലും പ്രശ്നമുണ്ടോ എന്ന് പരിശോധിക്കാനാകുന്ന സമാനമായ ഒരു സൈൻ ഇൻ വ്യൂ നിർമ്മിക്കും.

## മുകളിലെ ലേഔട്ട്

സൈൻ ഇൻ വ്യൂവിന്റെ കോഡ് `ContentView` ഫയലിൽ എഴുതാം.

ആദ്യം, സൈൻ ഇൻ വ്യൂയുടെ മുകളിൽ ഉള്ള തിരിച്ചറിയൽ ഭാഗം തയ്യാറാക്കാം. നിങ്ങൾക്ക് ആദ്യം അനുയോജ്യമായ ഒരു ഐക്കൺ ചിത്രം തയ്യാറാക്കി `Assets` ഫോൾഡറിൽ ഇടാം.

![icon](../../Resource/019_icon1.png)

ശേഷം, ചിത്രം കാണിക്കാൻ `Image`യും modifiers ഉം ഉപയോഗിക്കുക:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ഈ modifiers ന്റെ അർത്ഥം:

- `resizable()`: ചിത്രത്തിന്റെ വലുപ്പം മാറ്റാൻ അനുവദിക്കുന്നു.
- `scaledToFit()`: ചിത്രത്തിന്റെ യഥാർത്ഥ അനുപാതം നിലനിർത്തിക്കൊണ്ട് സ്കെയിൽ ചെയ്യുന്നു.
- `frame(width: 100)`: ചിത്രത്തിന്റെ പ്രദർശന വീതി `100` ആയി ക്രമീകരിക്കുന്നു.

തുടർന്ന്, സൈൻ ഇൻ ശീർഷകം കാണിക്കാൻ `Text`യും modifiers ഉം ഉപയോഗിക്കുക:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

അതിനുശേഷം, ചിത്രംക്കും എഴുത്തിനും ലംബമായി ക്രമീകരിക്കാൻ `VStack` ഉപയോഗിക്കുക:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

ഫലപ്രദർശനം:

![view](../../Resource/019_view.png)

ഇവിടെവരെ, സൈൻ ഇൻ വ്യൂയുടെ മുകളിലെ തലക്കെട്ട് ഭാഗം നാം പൂർത്തിയാക്കി.

### ലേഔട്ട് മെച്ചപ്പെടുത്തുക

ഇപ്പോൾ ചിത്രംയും തലക്കെട്ടും ഡീഫോൾട്ടായി മുഴുവൻ ലേഔട്ടിന്റെ മധ്യഭാഗത്താണ്.

അവ കൂടുതൽ “പേജിന്റെ മുകളിലെ സൈൻ ഇൻ അടയാളം” പോലെ കാണണമെന്ന് നമുക്ക് തോന്നുന്നുവെങ്കിൽ, `Spacer()` ഉപയോഗിച്ച് ശേഷിക്കുന്ന ഇടം വിടർത്തി ഉള്ളടക്കം മുകളിലേക്ക് അടുത്തതായി കാണിക്കാം.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

ഫലപ്രദർശനം:

![view](../../Resource/019_view1.png)

എന്നാൽ ഇപ്പോൾ `Image`യും `Text`യും സ്ക്രീന്റെ മുകളിലേക്ക് വളരെ അടുത്തായി വന്നതിനാൽ അല്പം തിരക്കേറിയതായി തോന്നുന്നു.

ഈ സമയത്ത്, മുഴുവൻ `VStack` നും മുകളിൽ ഇടവിട്ട് നൽകാൻ `padding` ഉപയോഗിക്കാം.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

ഫലപ്രദർശനം:

![view](../../Resource/019_view2.png)

ഇങ്ങനെ ചെയ്താൽ, പേജിന്റെ മുകളിലെ തലക്കെട്ട് ഭാഗം കൂടുതൽ യോജിച്ചതായി കാണപ്പെടുന്നു.

## ഉപയോക്തൃനാമവും പാസ്‌വേഡും

ഒരു സൈൻ ഇൻ പേജിൽ സാധാരണയായി ഉപയോക്താവ് ഉപയോക്തൃനാമവും പാസ്‌വേഡും നൽകേണ്ടിവരും.

SwiftUIയിൽ, ഉപയോക്താവ് നൽകുന്ന ഉള്ളടക്കം സ്വീകരിക്കാൻ `TextField` ഉപയോഗിക്കാം.

പക്ഷേ ശ്രദ്ധിക്കേണ്ട കാര്യമുണ്ട്: `TextField` തന്നെ ഇൻപുട്ട് ഡാറ്റ ദീർഘകാലം സൂക്ഷിക്കുന്നില്ല, അത് ഒരു ഇൻപുട്ട് കൺട്രോൾ മാത്രമാണ്. ആ ഇൻപുട്ട് ഉള്ളടക്കം യഥാർത്ഥത്തിൽ സൂക്ഷിക്കുന്നത് അതിലേക്ക് നാം bind ചെയ്യുന്ന variables ആണ്.

അതിനാൽ ആദ്യം ഉപയോക്തൃനാമവും പാസ്‌വേഡും സൂക്ഷിക്കാൻ രണ്ട് `@State` variables സൃഷ്ടിക്കണം:

```swift
@State private var user = ""
@State private var password = ""
```

`@State` variable ന്റെ value മാറുമ്പോൾ, SwiftUI ബന്ധപ്പെട്ട views സ്വയമേവ refresh ചെയ്യും.

തുടർന്ന്, ഈ രണ്ട് variables bind ചെയ്യാൻ `TextField` ഉപയോഗിക്കുക:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ഇവിടെ `$user`യും `$password`യും “binding” നെയാണ് സൂചിപ്പിക്കുന്നത്.

അതായത്, ഉപയോക്താവ് ഇൻപുട്ട് ബോക്സിൽ ടെക്സ്റ്റ് എഴുതുമ്പോൾ variable ന്റെ value അതേ സമയം മാറും; variable മാറുമ്പോൾ ഇൻപുട്ട് ബോക്സിൽ കാണിക്കുന്ന ഉള്ളടക്കവും അതേ സമയം മാറും.

വ്യൂവും ഡാറ്റയും “ഒന്നിനൊന്ന് സിങ്ക് ആയി തുടരുന്ന” ഈ ബന്ധത്തെയാണ് binding എന്ന് വിളിക്കുന്നത്.

ഇവിടെ `$` അടങ്ങിയ ഈ എഴുത്ത് തന്നെയാണ് ഉപയോഗിക്കേണ്ടതെന്ന് ശ്രദ്ധിക്കുക:

```swift
$user
```

കാരണം `TextField` ന് സാധാരണ string വേണ്ട, “രണ്ട് ദിശകളിലും ഡാറ്റ മാറ്റാൻ കഴിയുന്ന” ഒരു binding value ആണ് വേണ്ടത്.

### ഇൻപുട്ട് ബോക്സുകൾ കാണിക്കൽ

ഇവയെ `ContentView` ൽ ഇടാം:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

പ്രദർശനഫലം:

![view](../../Resource/019_view3.png)

ഇപ്പോൾ `user`യും `password`യും രണ്ടും ഡീഫോൾട്ടായി ശൂന്യമായ strings ആയതിനാൽ:

```swift
""
```

ഇൻപുട്ട് ബോക്സിൽ ആദ്യം placeholder ടെക്സ്റ്റ് കാണിക്കും, ഉദാഹരണത്തിന്:

```swift
input user
```

ഈ ടെക്സ്റ്റ് ഉപയോക്താവിനോട് “ഇവിടെ എന്താണ് നൽകേണ്ടത്” എന്ന് മാത്രം പറയുന്നു, ഇത് യഥാർത്ഥ ഇൻപുട്ട് ഉള്ളടക്കം അല്ല.

### ഇൻപുട്ട് ബോക്സുകൾ മെച്ചപ്പെടുത്തുക

ഇപ്പോൾ ഇൻപുട്ട് ബോക്സുകൾ ഉപയോഗിക്കാൻ കഴിയുന്നു, പക്ഷേ ഡീഫോൾട്ട് ശൈലി താരതമ്യേന ലളിതമാണ്.

ഇന്റർഫേസ് കൂടുതൽ വ്യക്തമായി തോന്നാൻ, ഇൻപുട്ട് ബോക്സിന് മുൻപായി ഒരു ശീർഷകം ചേർക്കുകയും, ഇൻപുട്ട് ബോക്സിന് തന്നെ ചെറിയൊരു ശൈലി മെച്ചപ്പെടുത്തലും ചെയ്യാം.

ഉദാഹരണത്തിന്, ആദ്യം ഒരു ശീർഷകം ചേർക്കുക:

```swift
Text("Username")
    .fontWeight(.bold)
```

അതിനുശേഷം, `HStack` ഉപയോഗിച്ച് ശീർഷകവും ഇൻപുട്ട് ബോക്സും ഒരേ വരിയിൽ വയ്ക്കുക:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ഇവിടെ നാം `HStack` ഉപയോഗിക്കുന്നത് “ഇടത് വശത്ത് ശീർഷകവും വലത് വശത്ത് ഇൻപുട്ട് ബോക്സും” കാണിക്കാനാണ്.

ശ്രദ്ധിക്കേണ്ട മറ്റൊരു കാര്യം, `TextField` ഡീഫോൾട്ടായി ശേഷിക്കുന്ന ലഭ്യമായ ഇടം കൈവശപ്പെടുത്തും എന്നതാണ്.

![color](../../Resource/019_view6.png)

രണ്ട് ഇൻപുട്ട് ബോക്സുകളുടെയും വലുപ്പം കൂടുതൽ ഒരുപോലെ കാണാൻ, `frame(width:)` ഉപയോഗിച്ച് അതിന്റെ വീതി നിശ്ചയിക്കാം, അങ്ങനെ ഇൻപുട്ട് ബോക്സുകൾ കൂടുതൽ ക്രമമായി തോന്നും.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

ശേഷം, ഇൻപുട്ട് ബോക്സ് കൂടുതൽ വ്യക്തമാകാൻ border കൂടി ചേർക്കുക:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ഇപ്പോൾ ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും `ContentView` വ്യൂവിലേക്ക് ചേർക്കാം:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

പ്രദർശനഫലം:

![view](../../Resource/019_view4.png)

ഇവിടേക്കെത്തുമ്പോൾ, ഉപയോക്താവിന് ഉപയോക്തൃനാമവും പാസ്‌വേഡും നൽകാൻ കഴിയും.

## സൈൻ ഇൻ ബട്ടൺ

അടുത്തതായി, ഇൻപുട്ട് ബോക്സുകളുടെ താഴെ ഒരു സൈൻ ഇൻ ബട്ടൺ ചേർക്കാം.

```swift
Button("Sign in") {

}
```

തുടർന്ന്, `buttonStyle` ഉപയോഗിച്ച് ബട്ടണിന് കൂടുതൽ വ്യക്തമാകുന്ന system style നൽകുക:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

പ്രദർശനഫലം:

![view](../../Resource/019_view5.png)

ബട്ടൺ യഥാർത്ഥത്തിൽ ടാപ്പിന് പ്രതികരിക്കുന്നുണ്ടോ എന്ന് ഉറപ്പാക്കാൻ, ആദ്യം ബട്ടണിനുള്ളിൽ ഒരു `print` എഴുതി പരിശോധിക്കാം:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

ബട്ടൺ ടാപ്പ് ചെയ്താൽ, console ൽ ഇത് output ചെയ്യും:

```swift
click Sign in
```

ഇത് ബട്ടൺ വിജയകരമായി ടാപ്പ് പ്രവർത്തനത്തിന് പ്രതികരിച്ചതായി കാണിക്കുന്നു.

## സൈൻ ഇൻ ലജിക്

ഇപ്പോൾ, സൈൻ ഇൻ ബട്ടണിൽ ഏറ്റവും അടിസ്ഥാനപരമായ validation logic ചേർക്കാം: **ഉപയോക്താവ് ഉപയോക്തൃനാമവും പാസ്‌വേഡും നൽകിയിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക**.

നാം താഴെ പറയുന്ന സാഹചര്യങ്ങൾ കൈവരിക്കാൻ ആഗ്രഹിക്കുന്നു:

- ഉപയോക്താവ് ഒന്നും നൽകിയിട്ടില്ലെങ്കിൽ, `Empty` output ചെയ്യുക
- ഉപയോക്താവ് ഇരുവരിൽ ഒന്ന് മാത്രം നൽകിയാൽ, ഏതാണ് missing എന്ന് അറിയിക്കുക
- ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും നൽകിയാൽ, `Success` output ചെയ്യുക

### യാതൊരു വിവരവും നൽകിയിട്ടില്ല

`user`യും `password`യും രണ്ടും ഡീഫോൾട്ടായി ശൂന്യമായ strings ആയതിനാൽ:

```swift
@State private var user = ""
@State private var password = ""
```

ഉപയോക്താവ് ഒന്നും നൽകാത്തപ്പോൾ അവ ശൂന്യമായിരിക്കും.

Swift ൽ, `String` പോലുള്ള types ന് `isEmpty` ഉപയോഗിച്ച് ഉള്ളടക്കം ശൂന്യമാണോ എന്ന് കണ്ടെത്താം.

### isEmpty property

`isEmpty` സാധാരണയായി strings, arrays, മറ്റു ഉള്ളടക്കങ്ങൾ ശൂന്യമാണോ എന്ന് പരിശോധിക്കാൻ ഉപയോഗിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

ഉള്ളടക്കം ശൂന്യമായാൽ `isEmpty` `true` return ചെയ്യും; ശൂന്യമല്ലെങ്കിൽ `false` return ചെയ്യും.

അതിനാൽ, ഉപയോക്തൃനാമത്തിലും പാസ്‌വേഡിലും ഇൻപുട്ട് ഉള്ളടക്കമുണ്ടോ ഇല്ലയോ എന്ന് അറിയാൻ ഇത് ഉപയോഗിക്കാം.

### isEmpty ഉപയോഗിച്ച് variables പരിശോധിക്കൽ

ഉപയോക്താവ് യാതൊരു വിവരവും നൽകിയിട്ടില്ലെങ്കിൽ:

```swift
user.isEmpty // true
password.isEmpty    // true
```

ഈ സമയത്ത്, condition ഇങ്ങനെ എഴുതാം:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

ഈ കോഡിന്റെ അർത്ഥം: `user` ശൂന്യമാണെങ്കിൽ, `password`യും ശൂന്യമാണെങ്കിൽ, ഇത് output ചെയ്യുക:

```swift
Empty
```

ഇവിടെ `&&` ഒരു logical operator ആണ്, അതിന്റെ അർത്ഥം “കൂടാതെ” എന്നാണ്.

അതായത്, ഇടത് വശത്തെ condition true ആയും വലത് വശത്തെ condition true ആയും ഇരിക്കുമ്പോഴാണ് മുഴുവൻ condition true ആകുന്നത്.

അതുകൊണ്ട്, ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും ശൂന്യമായിരിക്കുമ്പോൾ മാത്രമേ ഈ കോഡ് പ്രവർത്തിക്കൂ.

## ഉപയോക്താവ് ഭാഗികമായി മാത്രം പൂരിപ്പിച്ചു

അടുത്തതായി, മറ്റൊരു സാഹചര്യത്തെ പരിഗണിക്കാം: ഉപയോക്താവ് ഉപയോക്തൃനാമം മാത്രം നൽകിയിരിക്കുന്നു, അല്ലെങ്കിൽ പാസ്‌വേഡ് മാത്രം നൽകിയിരിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

ഈ സാഹചര്യത്തിൽ, ഉപയോക്തൃനാമം ശൂന്യമല്ല, പക്ഷേ പാസ്‌വേഡ് ശൂന്യമാണ്.

ഇത് പരിശോധിക്കാൻ `isEmpty` ഉപയോഗിക്കുന്നത് തുടരാം:

### ഉപയോക്താവ് അക്കൗണ്ടോ പാസ്‌വേഡോ നൽകിയിരിക്കുന്ന സാഹചര്യം

ഉപയോക്താവ് ഉപയോക്തൃനാമം മാത്രം അല്ലെങ്കിൽ പാസ്‌വേഡ് മാത്രം നൽകിയാൽ, എന്താണ് ഇല്ലാത്തത് എന്ന് അനുയോജ്യമായ അറിയിപ്പ് നൽകണം.

ഉദാഹരണത്തിന്, ഉപയോക്താവ് ഉപയോക്തൃനാമം മാത്രം നൽകിയാൽ:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

ഈ കോഡിന്റെ ലജിക് ഇതാണ്: ഉപയോക്തൃനാമം ശൂന്യമാണെങ്കിൽ, ഉപയോക്തൃനാമം നൽകാൻ ആവശ്യപ്പെടുക. അല്ലെങ്കിൽ, പാസ്‌വേഡ് ശൂന്യമാണോ എന്ന് പരിശോധിക്കുക; ശൂന്യമാണെങ്കിൽ പാസ്‌വേഡ് നൽകാൻ ആവശ്യപ്പെടുക.

### ഉപയോക്താവ് എല്ലാ വിവരങ്ങളും നൽകി

ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും ഇതിനകം നൽകിയിട്ടുണ്ടെങ്കിൽ, `isEmpty` രണ്ടിനും `false` return ചെയ്യും.

ഈ സമയത്ത്, ഇത് ഇങ്ങനെ എഴുതാം:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ഇവിടെ `!` എന്നത് “negation” എന്നാണ് അർത്ഥം.

ഉദാഹരണത്തിന്:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

അതായത്, `user.isEmpty` “ഉപയോക്തൃനാമം ശൂന്യമാണോ” എന്ന് കണ്ടെത്താൻ ഉപയോഗിക്കുന്നു, എന്നാൽ `!user.isEmpty` “ഉപയോക്തൃനാമം ശൂന്യമല്ലേയോ” എന്ന് കണ്ടെത്താൻ ഉപയോഗിക്കുന്നു.

പാസ്‌വേഡിനും ഇതേ ലജിക് ബാധകമാണ്.

അതുകൊണ്ട്, ഈ കോഡിന്റെ അർത്ഥം: ഉപയോക്തൃനാമം ശൂന്യമല്ല, പാസ്‌വേഡും ശൂന്യമല്ല.

ഈ രണ്ടും true ആയിരിക്കുമ്പോൾ output ആയിരിക്കും:

```swift
Success
```

## പൂർണ്ണ validation logic

ഇപ്പോൾ, ഈ മൂന്ന് സാഹചര്യങ്ങളും ഒന്നിച്ചാക്കി `Button` നുള്ളിൽ എഴുതാം:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

ഈ കോഡിന്റെ execution order ഇങ്ങനെ മനസ്സിലാക്കാം:

ആദ്യ ഘട്ടത്തിൽ, ആദ്യം ഇതാണ് പരിശോധിക്കുന്നത്:

```swift
if user.isEmpty && password.isEmpty
```

ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും ശൂന്യമാണെങ്കിൽ, നേരിട്ട് `Empty` output ചെയ്യും.

രണ്ടും ശൂന്യമല്ലെങ്കിൽ, ഈ വരി പരിശോധിക്കുന്നത് തുടരാം:

```swift
else if user.isEmpty || password.isEmpty
```

ഇവിടെ `||` എന്നത് “അല്ലെങ്കിൽ” എന്നാണ് അർത്ഥം.

അഥവാ, ഒരു condition true ആണെങ്കിൽ മുഴുവൻ condition true ആകും.

അതുകൊണ്ട്, ഉപയോക്തൃനാമം ശൂന്യമാണെങ്കിൽ അല്ലെങ്കിൽ പാസ്‌വേഡ് ശൂന്യമാണെങ്കിൽ `else if` code block പ്രവർത്തിക്കും.

കോഡ് ബ്ലോക്കിനുള്ളിൽ കയറിയശേഷം, ഏത് ഇൻപുട്ട് ബോക്സാണ് പൂരിപ്പിക്കപ്പെടാത്തത് എന്ന് കൂടുതൽ വ്യക്തമായി പരിശോധിക്കാം:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

മുമ്പുള്ള രണ്ട് conditions ഒന്നും true അല്ലെങ്കിൽ, അതിന്റെ അർത്ഥം ഉപയോക്തൃനാമം ശൂന്യമല്ല, പാസ്‌വേഡും ശൂന്യമല്ല എന്നതാണ്.

അപ്പോൾ പ്രോഗ്രാം അവസാന `else` ലേക്ക് കടക്കും:

```swift
print("Success")
```

ഈ രീതിയിൽ, സൈൻ ഇൻ ഇൻപുട്ടിനുള്ള ഏറ്റവും അടിസ്ഥാനപരമായ validation logic നാം പൂർത്തിയാക്കുന്നു.

## ഉപയോക്തൃനാമവും പാസ്‌വേഡും പരിശോധിക്കൽ

മുകളിലെ logic “ഉള്ളടക്കം നൽകിയിട്ടുണ്ടോ ഇല്ലയോ” എന്നത് മാത്രമാണ് പരിശോധിക്കുന്നത്.

പക്ഷേ യഥാർത്ഥ ആപ്പിൽ, ഉള്ളടക്കം നൽകിയത് മാത്രം മതിയാകില്ല. സാധാരണയായി, ഉപയോക്തൃനാമവും പാസ്‌വേഡും verify ചെയ്യാൻ server ലേക്ക് അയയ്ക്കേണ്ടതുണ്ട്.

Server ഉപയോക്തൃനാമം നിലവിലുണ്ടെന്നും പാസ്‌വേഡ് ശരിയാണെന്നും ഉറപ്പാക്കിയാൽ, അത് sign in അനുവദിക്കും; അല്ലെങ്കിൽ sign in പരാജയപ്പെട്ടതായി അറിയിക്കും.

ഈ പ്രക്രിയ പരിശീലിക്കാൻ, ആദ്യം code ൽ ഒരു temporary account ഉം password ഉം സജ്ജമാക്കി, “ശരിയായ sign in വിവരങ്ങൾ” അനുകരിക്കാം:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

ഉപയോക്തൃനാമവും പാസ്‌വേഡും രണ്ടും ശൂന്യമല്ലാത്തപ്പോൾ, അവ ശരിയാണോ എന്ന് അടുത്തതായി താരതമ്യം ചെയ്യാം:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ഇവിടെ `==` എന്നത് “തുല്യമാണോ” എന്നതാണ് അർത്ഥം.

ഉദാഹരണത്തിന്:

```swift
user == userID
```

അതിന്റെ അർത്ഥം, ഉപയോക്താവ് നൽകിയ ഉപയോക്തൃനാമം നാം സജ്ജമാക്കിയ ശരിയായ ഉപയോക്തൃനാമവുമായി കൃത്യമായി പൊരുത്തപ്പെടുന്നുണ്ടോ എന്നതാണ്. പാസ്‌വേഡ് പരിശോധനയും ഇതേ ലജിക് പിന്തുടരുന്നു.

അതുകൊണ്ട്, നൽകിയ ഉപയോക്തൃനാമവും പാസ്‌വേഡും സജ്ജമാക്കിയ values നോട് തുല്യമായാൽ `Success` output ചെയ്യും; അതിൽ ഒന്ന് പോലും തുല്യമല്ലെങ്കിൽ `Input error` output ചെയ്യും.

ഈ രീതിയിൽ, ലളിതമായ ഒരു “mock sign in verification” നാം പൂർത്തിയാക്കുന്നു.

ഇത് ഇപ്പോഴും server ലോട് ബന്ധിപ്പിച്ച യഥാർത്ഥ sign in feature അല്ലെങ്കിലും, ഒരു കാര്യം മനസ്സിലാക്കാൻ ഇത് മതിയാകും: **ബട്ടൺ ടാപ്പ് ചെയ്ത ശേഷം, വ്യത്യസ്ത conditions അനുസരിച്ച് വ്യത്യസ്ത code പ്രവർത്തിപ്പിക്കാം**.

## സംഗ്രഹം

ഈ പാഠത്തിൽ, നാം ഒരു അടിസ്ഥാന സൈൻ ഇൻ വ്യൂ പൂർത്തിയാക്കി, പ്രത്യേകിച്ച് “conditions അനുസരിച്ച് input ഉള്ളടക്കം വിധിയെഴുതുന്ന logic” പഠിച്ചു.

ഈ പാഠത്തിന്റെ പ്രധാന ആശയം: string ശൂന്യമാണോ എന്ന് കണ്ടെത്താൻ `isEmpty` ഉപയോഗിക്കുക, കൂടാതെ വ്യത്യസ്ത സാഹചര്യങ്ങൾ കൈകാര്യം ചെയ്യാൻ logical operators സഹിതം `if` statements ഉപയോഗിക്കുക എന്നതാണ്.

ഇവയിൽ രണ്ട് വളരെ പ്രധാനപ്പെട്ട logical operators ഉണ്ട്:

- `&&`: അർത്ഥം “കൂടാതെ”, രണ്ട് conditions ഉം പൂർണ്ണമാകണം
- `||`: അർത്ഥം “അല്ലെങ്കിൽ”, ഒരു condition മാത്രം പൂർണ്ണമായാലും മതി

ഈ conditions ഒടുവിൽ `true` അല്ലെങ്കിൽ `false` നൽകുമ്പോൾ, `if` statement ഫലത്തിന്റെ അടിസ്ഥാനത്തിൽ വ്യത്യസ്ത code പ്രവർത്തിപ്പിക്കും.

ഈ സൈൻ ഇൻ വ്യൂ മുഖേന, “ഇന്റർഫേസ് + ഡാറ്റ + logical judgment” കൂട്ടിച്ചേർക്കുന്ന development രീതിയുമായി നാം ഇതിനകം പരിചിതരാകാൻ തുടങ്ങി.

## പൂർണ്ണ കോഡ്

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
