# കസ്റ്റം View

ഈ പാഠത്തിൽ, SwiftUI എഴുതുന്നതിലെ വളരെ പ്രധാനപ്പെട്ട ഒരു രീതി നാം പഠിക്കും: **കസ്റ്റം View**.

കസ്റ്റം View ആവർത്തിച്ച് വരുന്ന View കോഡിന്റെ ഒരു ഭാഗം പൊതിഞ്ഞുവെച്ച്, പലവട്ടം ഉപയോഗിക്കാനാകുന്ന ഒരു View ആക്കാൻ കഴിയും.

യഥാർത്ഥ App വികസനത്തിൽ, നാം പലപ്പോഴും ഇത്തരമൊരു സാഹചര്യം കാണും: പല ഇന്റർഫേസുകളുടെയും ഘടന ഒരുപോലെയായിരിക്കും, പക്ഷേ കാണിക്കുന്ന ഉള്ളടക്കം വ്യത്യസ്തമായിരിക്കും.

ഉദാഹരണത്തിന്, ഒരു ഫോറം വെബ്സൈറ്റിലെ പോസ്റ്റ് ലിസ്റ്റിൽ, ഓരോ പോസ്റ്റിനും ശീർഷകം, ചിത്രം, ലൈക്ക് എണ്ണം തുടങ്ങിയ വിവരങ്ങൾ ഉണ്ടായിരിക്കാം.

![Reddit](../../../Resource/028_view1.png)

ഒരു ഷോപ്പിംഗ് വെബ്സൈറ്റിലെ ഉൽപ്പന്ന ലിസ്റ്റിൽ, ഓരോ ഉൽപ്പന്നത്തിനും ചിത്രം, പേര്, വില തുടങ്ങിയ വിവരങ്ങൾ ഉണ്ടായിരിക്കാം.

![Amazon](../../../Resource/028_view2.png)

ഈ ഉള്ളടക്കങ്ങളുടെ ഘടന സമാനമാണ്; വ്യത്യാസം കാണിക്കുന്ന ഡാറ്റയിലാണ് മാത്രം.

ഓരോ ഐറ്റത്തിനും കൈകൊണ്ട് കോഡ് എഴുതിയാൽ, കോഡ് വളരെ നീളമുള്ളതാകും, പിന്നീടുള്ള തിരുത്തലുകളും സൗകര്യമില്ലാത്തതാകും.

അതിനാൽ, ഒരേ ഘടനയെ ഒരു കസ്റ്റം View ആയി പൊതിഞ്ഞുവെച്ച്, വ്യത്യസ്തമായ ഉള്ളടക്കം പാരാമീറ്ററുകളായി അതിലേക്ക് നൽകാം.

ഇങ്ങനെ, അതേ View വ്യത്യസ്തമായ ഉള്ളടക്കം കാണിക്കാനാകും.

## ആവശ്യകതാ സാഹചര്യം

ഉദാഹരണത്തിന്, ഇപ്പോൾ നമുക്ക് ഒരു സെറ്റിംഗ്സ് ലിസ്റ്റ് നിർമ്മിക്കേണ്ടതുണ്ട്.

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/028_view.png)

ഈ സെറ്റിംഗ്സ് ലിസ്റ്റിൽ മൂന്ന് വ്യത്യസ്ത സെറ്റിംഗ് ഐറ്റങ്ങൾ ഉണ്ട്: `സെറ്റിംഗ്സ്`, `ഫോൾഡർ`, `സംഗീതം`.

അവയുടെ ഐക്കണുകളും നിറങ്ങളും ശീർഷകങ്ങളും വ്യത്യസ്തമായാലും, മൊത്തത്തിലുള്ള ഘടന ഒരുപോലെയാണ്:

- ഇടത് വശത്തെ ഐക്കൺ
- ഐക്കൺ പശ്ചാത്തല നിറം
- നടുവിലെ ശീർഷകം
- വലത് വശത്തെ അമ്പ്

കസ്റ്റം View ഉപയോഗിക്കാതെ എഴുതുകയാണെങ്കിൽ, നാം ഇങ്ങനെ എഴുതിയേക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("സെറ്റിംഗ്സ്")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ഫോൾഡർ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("സംഗീതം")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

ഈ കോഡ് സാധാരണയായി കാണിക്കാനാകും, പക്ഷേ പ്രശ്നവും വളരെ വ്യക്തമാണ്: മൂന്ന് സെറ്റിംഗ് ഐറ്റങ്ങളുടെയും കോഡ് ഏകദേശം പൂർണ്ണമായി ഒരേപോലെയാണ്.

വ്യത്യസ്തമായിരിക്കുന്നത് ഐക്കൺ, നിറം, ശീർഷകം മാത്രമാണ്:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("സെറ്റിംഗ്സ്")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ഫോൾഡർ")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("സംഗീതം")
```

അതായത്, ഓരോ സെറ്റിംഗ് ഐറ്റത്തിന്റെയും ഘടന സ്ഥിരമാണ്; ഐക്കൺ, നിറം, ശീർഷകം മാത്രമാണ് വ്യത്യസ്തം.

ഇത്തരം സാഹചര്യം കസ്റ്റം View ഉപയോഗിക്കാൻ വളരെ അനുയോജ്യമാണ്.

### നിഴൽ shadow

ഇവിടെ പുതിയ modifier ആയ `.shadow(radius:)` ഉപയോഗിക്കുന്നു:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` ഒരു View-ന് നിഴൽ ചേർക്കാൻ കഴിയും.

`radius` നിഴലിന്റെ blur radius സൂചിപ്പിക്കുന്നു. മൂല്യം കൂടുതലായാൽ, സാധാരണയായി നിഴലിന്റെ വ്യാപന പരിധി കൂടുതലാകും, കൂടാതെ അത് കൂടുതൽ മൃദുവായി കാണപ്പെടും.

ഇവിടെ ഇത് `1` ആയി സജ്ജമാക്കിയിരിക്കുന്നു, അതായത് വളരെ ലഘുവായ ഒരു നിഴൽ പ്രഭാവം മാത്രം ചേർക്കുന്നു.

## സെറ്റിംഗ് ഐറ്റം View പൊതിഞ്ഞുവെക്കൽ

അടുത്തതായി, ഓരോ സെറ്റിംഗ് ഐറ്റവും ഒരു പുതിയ View ആയി പൊതിഞ്ഞുവെക്കാം.

`SettingItemView` സൃഷ്ടിക്കാം:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ഈ View-ൽ, നാം മൂന്ന് properties നിർവചിച്ചിരിക്കുന്നു:

```swift
let icon: String
let color: Color
let title: String
```

അവയിൽ:

- `icon` ഐക്കൺ പേരിനെ സൂചിപ്പിക്കുന്നു
- `color` ഐക്കണിന്റെ പശ്ചാത്തല നിറത്തെ സൂചിപ്പിക്കുന്നു
- `title` സെറ്റിംഗ് ഐറ്റത്തിന്റെ ശീർഷകത്തെ സൂചിപ്പിക്കുന്നു

ഈ മൂന്ന് ഉള്ളടക്കങ്ങളും വ്യത്യസ്ത സെറ്റിംഗ് ഐറ്റങ്ങളിൽ വ്യത്യസ്തമായതിനാൽ, അവയെ പുറത്തുനിന്ന് നൽകാവുന്ന പാരാമീറ്ററുകളാക്കുന്നു.

## കസ്റ്റം View ഉപയോഗിക്കൽ

`SettingItemView` ഉണ്ടാക്കിയ ശേഷം, വലിയൊരു `HStack` കോഡ് വീണ്ടും വീണ്ടും എഴുതേണ്ടതില്ല.

ഇപ്പോൾ ഇങ്ങനെ ഉപയോഗിക്കാം:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")
```

ഈ കോഡ് വരി ഒരു സെറ്റിംഗ് ഐറ്റം View സൃഷ്ടിക്കുകയും മൂന്ന് പാരാമീറ്ററുകൾ നൽകുകയും ചെയ്യുന്നു:

```swift
icon: "gear"
color: Color.blue
title: "സെറ്റിംഗ്സ്"
```

നൽകിയ ശേഷം, `SettingItemView`-ന്റെ ഉള്ളിലെ properties അനുയോജ്യമായ മൂല്യങ്ങൾ നേടും:

- `icon`-ന്റെ മൂല്യം `gear` ആണ്
- `color`-ന്റെ മൂല്യം `Color.blue` ആണ്
- `title`-ന്റെ മൂല്യം `"സെറ്റിംഗ്സ്"` ആണ്

അതുകൊണ്ട്, View-ന്റെ ഉള്ളിലെ `Image(systemName: icon)` ഗിയർ ഐക്കൺ കാണിക്കും, `.background(color)` നീല പശ്ചാത്തലം ഉപയോഗിക്കും, `Text(title)` `സെറ്റിംഗ്സ്` കാണിക്കും.

പൂർണ്ണ കോഡ്:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ഫോൾഡർ")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "സംഗീതം")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/028_view.png)

പൊതിഞ്ഞുവെച്ചതിന് ശേഷം കാണിക്കുന്ന ഫലം മുമ്പത്തെപ്പോലെ തന്നെയാണെങ്കിലും, കോഡ് കൂടുതൽ വ്യക്തമായതായി കാണാം.

മുമ്പ് ഓരോ സെറ്റിംഗ് ഐറ്റത്തിനും മുഴുവൻ `HStack` ഭാഗവും എഴുതേണ്ടിരുന്നു; ഇപ്പോൾ ഒരു കോഡ് വരി മാത്രം മതി:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")
```

ഇതാണ് കസ്റ്റം View-ന്റെ പങ്ക്: **ആവർത്തിച്ച് വരുന്ന View ഘടനയെ പൊതിഞ്ഞുവെച്ച്, വ്യത്യസ്തമായ ഉള്ളടക്കം മാത്രം പാരാമീറ്ററുകളായി നൽകുക.**

## പാരാമീറ്ററുകൾ നൽകാൻ കഴിയുന്നത് എന്തുകൊണ്ട്

അടുത്തതായി, കസ്റ്റം View-ന് പാരാമീറ്ററുകൾ സ്വീകരിക്കാൻ കഴിയുന്നത് എന്തുകൊണ്ടാണെന്ന് ലളിതമായി മനസ്സിലാക്കാം.

SwiftUI-യിൽ, View അടിസ്ഥാനത്തിൽ ഒരു structure ആണ്.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        Text("ഹലോ, ലോകമേ!")
    }
}
```

ഇവിടെ `ContentView` ഒരു structure ആണ്.

നാം എഴുതുമ്പോൾ:

```swift
ContentView()
```

വാസ്തവത്തിൽ നാം ഒരു `ContentView` View സൃഷ്ടിക്കുകയാണ്.

പിന്നിലുള്ള `()` അതിന്റെ initialization method വിളിക്കുന്നതാണെന്ന് സൂചിപ്പിക്കുന്നു; ഈ View സൃഷ്ടിക്കുന്നു എന്നും ഇതിനെ മനസ്സിലാക്കാം.

ഈ `ContentView`-ൽ പുറത്തുനിന്ന് നൽകേണ്ട properties ഇല്ലാത്തതിനാൽ, നേരിട്ട് ഇങ്ങനെ എഴുതാം:

```swift
ContentView()
```

എന്നാൽ View-ൽ മൂല്യം നൽകാത്ത ഒരു property ഉണ്ടെങ്കിൽ, View സൃഷ്ടിക്കുമ്പോൾ അനുയോജ്യമായ മൂല്യം നൽകണം.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("പേര്: \(name)")
    }
}
```

ഇവിടെ `name` ഒരു property ആണ്, അതിന് default value ഇല്ല.

അതുകൊണ്ട് `ContentView` സൃഷ്ടിക്കുമ്പോൾ, `name`-ന് ഒരു നിർദ്ദിഷ്ട മൂല്യം നൽകണം:

```swift
ContentView(name: "Fang Junyu")
```

ഇങ്ങനെ ചെയ്താൽ, View-ന്റെ ഉള്ളിൽ ഈ മൂല്യം ഉപയോഗിക്കാനാകും:

```swift
Text("പേര്: \(name)")
```

`SettingItemView` സൃഷ്ടിക്കുമ്പോൾ പാരാമീറ്ററുകൾ നൽകേണ്ടതിന്റെ കാരണവും ഇതുതന്നെയാണ്:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")
```

കാരണം `SettingItemView`-ൽ default value ഇല്ലാത്ത മൂന്ന് properties ഉണ്ട്:

```swift
let icon: String
let color: Color
let title: String
```

അതുകൊണ്ട് ഈ View സൃഷ്ടിക്കുമ്പോൾ, അവയെ അകത്തേക്ക് നൽകണം. നൽകിയ പാരാമീറ്ററുകൾ Swift, View-ന്റെ ഉള്ളിലെ properties-ക്ക് മൂല്യങ്ങൾ നൽകാൻ ഉപയോഗിക്കും.

## Initialization method

അടുത്തതായി, initialization method കുറച്ച് കൂടി ആഴത്തിൽ മനസ്സിലാക്കാം.

### Default initialization method

നാം ഒരു സാധാരണ View നിർവചിക്കുമ്പോൾ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ഹലോ, ലോകമേ!")
    }
}
```

ഈ കോഡിൽ, initialization method കൈകൊണ്ട് എഴുതിയിട്ടില്ല.

എന്നാൽ ഈ View ഉപയോഗിക്കുമ്പോൾ, ഇങ്ങനെ എഴുതാം:

```swift
ContentView()
```

ഇവിടെ `()` വാസ്തവത്തിൽ `ContentView` സൃഷ്ടിക്കുന്നതിനെ സൂചിപ്പിക്കുന്നു; അതിന്റെ initialization method വിളിക്കുന്നതായും ഇത് മനസ്സിലാക്കാം.

### initialization method ഇല്ലാത്തപോലെ തോന്നിയാലും അത് വിളിക്കാൻ കഴിയുന്നത് എന്തുകൊണ്ട്?

കാരണം Swift compiler നമുക്കായി സ്വയം ഒരു initialization method സൃഷ്ടിക്കുന്നു.

ശ്രദ്ധിക്കേണ്ടത്: **ഈ initialization method സ്വയം സൃഷ്ടിക്കപ്പെടുന്നതാണ്, സാധാരണയായി നാം അതിനെ കോഡിൽ നേരിട്ട് കാണാറില്ല.**

അതായത്, `struct`-ൽ നാം കൈകൊണ്ട് ഇങ്ങനെ എഴുതിയിട്ടില്ലെങ്കിലും:

```swift
init() {

}
```

Swift compiler പിന്നിൽ നമുക്കായി ഏകദേശം ഇത്തരമൊരു initialization method സൃഷ്ടിക്കും:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("ഹലോ, ലോകമേ!")
    }
}
```

അതുകൊണ്ടുതന്നെയാണ് നമുക്ക് നേരിട്ട് ഇങ്ങനെ എഴുതാൻ കഴിയുന്നത്:

```swift
ContentView()
```

അതിനാൽ, യഥാർത്ഥ കോഡിൽ initialization method സാധാരണയായി കൈകൊണ്ട് എഴുതേണ്ടതില്ല.

ഒരൊറ്റ കാര്യം മാത്രം മനസ്സിലാക്കണം: **SwiftUI View സൃഷ്ടിക്കുമ്പോൾ, ആ View-ന്റെ initialization method വിളിക്കപ്പെടും. initialization method നാം കൈകൊണ്ട് എഴുതിയിട്ടില്ലെങ്കിലും, Swift അത് സ്വയം സൃഷ്ടിക്കാം.**

### പാരാമീറ്ററുകളുള്ള initialization method

View-ൽ default value ഇല്ലാത്ത ഒരു property ഉണ്ടെങ്കിൽ, ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("പേര്: \(name)")
    }
}
```

Swift compiler property അനുസരിച്ച് പാരാമീറ്ററുകളുള്ള ഒരു initialization method സ്വയം സൃഷ്ടിക്കും.

ലളിതമായി ഇങ്ങനെ മനസ്സിലാക്കാം:

```swift
init(name: String) {
    self.name = name
}
```

ഇവിടെ:

```swift
init(name: String)
```

അർത്ഥം: `ContentView` സൃഷ്ടിക്കുമ്പോൾ `String` തരം ഉള്ള `name` പാരാമീറ്റർ നൽകണം.

നാം എഴുതുമ്പോൾ:

```swift
ContentView(name: "Fang Junyu")
```

അർത്ഥം: `"Fang Junyu"`-നെ initialization method-ന് പാരാമീറ്ററായി നൽകുന്നു.

അതിനുശേഷം initialization method-ന്റെ ഉള്ളിൽ ഇത് പ്രവർത്തിക്കും:

```swift
self.name = name
```

ഈ കോഡ് വരിയുടെ അർത്ഥം: പുറത്തുനിന്ന് നൽകിയ `name` നിലവിലെ View-ന്റെ സ്വന്തം `name` property-ക്ക് നൽകുക.

ലളിതമായി ഇങ്ങനെ മനസ്സിലാക്കാം:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("പേര്: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ഇങ്ങനെ, View-ന്റെ ഉള്ളിൽ നൽകിയ മൂല്യം ഉപയോഗിക്കാനാകും.

ഇതാണ് പാരാമീറ്ററുകളുള്ള View-ന്റെ initialization പ്രവാഹം: **View-ന്റെ ഉള്ളിലെ property-ക്ക് default value ഇല്ലെങ്കിൽ, View സൃഷ്ടിക്കുമ്പോൾ അനുയോജ്യമായ പാരാമീറ്റർ നൽകണം, അതിലൂടെ initialization method property-ക്ക് മൂല്യം നൽകുന്നത് പൂർത്തിയാക്കും.**

## property-ക്ക് default value ഉള്ള സാഹചര്യം

property-ക്ക് ഇതിനകം default value ഉണ്ടെങ്കിൽ, View സൃഷ്ടിക്കുമ്പോൾ പാരാമീറ്റർ നൽകാതിരിക്കാം.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("പേര്: \(name)")
    }
}
```

ഇവിടെ `name`-ന് ഇതിനകം ഒരു default value ഉണ്ട്:

```swift
"Fang Junyu"
```

അതുകൊണ്ട് `ContentView` സൃഷ്ടിക്കുമ്പോൾ നേരിട്ട് ഇങ്ങനെ എഴുതാം:

```swift
ContentView()
```

അപ്പോൾ `name` default value ഉപയോഗിക്കും, ഇന്റർഫേസ് ഇങ്ങനെ കാണിക്കും:

```swift
പേര്: Fang Junyu
```

തീർച്ചയായും, View സൃഷ്ടിക്കുമ്പോൾ ഒരു പുതിയ മൂല്യം നൽകാനും കഴിയും:

```swift
ContentView(name: "Sam")
```

അപ്പോൾ View default value ഉപയോഗിക്കാതെ പുറത്തുനിന്ന് നൽകിയ `"Sam"` ഉപയോഗിക്കും, ഇന്റർഫേസ് ഇങ്ങനെ കാണിക്കും:

```swift
പേര്: Sam
```

മനസ്സിലാക്കാൻ സൗകര്യത്തിനായി, Swift compiler സ്വയം സൃഷ്ടിക്കുന്ന initialization method ഇങ്ങനെ ലളിതമായി കാണാം:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ഇവിടെ `name: String = "Fang Junyu"` എന്നതിന്റെ അർത്ഥം: View സൃഷ്ടിക്കുമ്പോൾ `name` നൽകാത്ത പക്ഷം default value `"Fang Junyu"` ഉപയോഗിക്കും; View സൃഷ്ടിക്കുമ്പോൾ പുതിയ `name` നൽകിയാൽ, നൽകിയ മൂല്യം ഉപയോഗിക്കും.

അതായത്: **പുറത്തുനിന്ന് പാരാമീറ്റർ നൽകാത്ത പക്ഷം property-യുടെ default value ഉപയോഗിക്കും; പുറത്തുനിന്ന് പാരാമീറ്റർ നൽകിയാൽ, നൽകിയ മൂല്യം ഉപയോഗിക്കും.**

## SettingItemView-ലേക്ക് മടങ്ങുക

ഇപ്പോൾ നാം വീണ്ടും SettingItemView നോക്കാം:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ഈ View-ന്റെ ഘടന സ്ഥിരമാണ്.

സ്ഥിരമായ ഭാഗങ്ങൾ ഉൾപ്പെടുന്നു:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

വ്യത്യസ്തമായ ഭാഗങ്ങൾ ഉൾപ്പെടുന്നു:

```swift
icon
color
title
```

അതുകൊണ്ട്, വ്യത്യസ്തമായ ഉള്ളടക്കത്തെ properties ആക്കി, View സൃഷ്ടിക്കുമ്പോൾ പാരാമീറ്ററുകളായി നൽകുന്നു.

വ്യത്യസ്ത സെറ്റിംഗ് ഐറ്റങ്ങൾ സൃഷ്ടിക്കുമ്പോൾ, വ്യത്യസ്ത പാരാമീറ്ററുകൾ മാത്രം നൽകിയാൽ മതി:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")
SettingItemView(icon: "folder", color: Color.brown, title: "ഫോൾഡർ")
SettingItemView(icon: "music.note", color: Color.purple, title: "സംഗീതം")
```

ഇങ്ങനെ, അതേ `SettingItemView` മൂന്ന് വ്യത്യസ്ത സെറ്റിംഗ് ഐറ്റങ്ങൾ കാണിക്കാനാകും.

ഇതാണ് കസ്റ്റം View ഉപയോഗിക്കുന്ന ഏറ്റവും സാധാരണമായ രീതി.

## സംഗ്രഹം

ഈ പാഠത്തിൽ, നാം കസ്റ്റം View പഠിച്ചു.

കസ്റ്റം View-ന്റെ പ്രധാന പങ്ക്: **ആവർത്തിച്ച് വരുന്ന View കോഡ് പൊതിഞ്ഞുവെച്ച്, അത് വീണ്ടും ഉപയോഗിക്കാനാകുക.**

ഈ ഉദാഹരണത്തിൽ, മൂന്ന് സെറ്റിംഗ് ഐറ്റങ്ങളുടെയും ഘടന ഒരുപോലെയാണ്; ഐക്കൺ, നിറം, ശീർഷകം മാത്രമാണ് വ്യത്യസ്തം.

അതുകൊണ്ട് നാം `SettingItemView` സൃഷ്ടിച്ചു:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

തുടർന്ന്, ഈ View ഉപയോഗിക്കുമ്പോൾ വ്യത്യസ്ത പാരാമീറ്ററുകൾ നൽകുന്നു:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "സെറ്റിംഗ്സ്")
```

ഇവിടെ ഉള്ള പാരാമീറ്ററുകൾ `SettingItemView`-ന്റെ അകത്ത് പ്രവേശിക്കും.

ഈ രീതിയിലൂടെ, കുറച്ച് കോഡ് ഉപയോഗിച്ച് ഒരേ ഘടനയുള്ളെങ്കിലും വ്യത്യസ്ത ഉള്ളടക്കമുള്ള Views സൃഷ്ടിക്കാം.

SwiftUI വികസനത്തിൽ ഇത് വളരെ സാധാരണമായ ഒരു എഴുത്ത് രീതിയുമാണ്.
