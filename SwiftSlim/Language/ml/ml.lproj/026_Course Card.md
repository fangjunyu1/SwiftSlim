# കോഴ്‌സ് കാർഡ്

ഈ പാഠം ഒരു ഘട്ടപരമായ റിവ്യൂ പാഠമാണ്. ഇവിടെ നമ്മൾ ഒരു “കോഴ്‌സ് കാർഡ്” പൂർത്തിയാക്കും.

ഈ പരിശീലനത്തിലൂടെ മുമ്പ് പഠിച്ച `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` തുടങ്ങിയവ ആവർത്തിച്ച് അഭ്യസിക്കുകയും, നിരവധി ചെറിയ വ്യൂകളെ ചേർത്ത് ഒരു പൂർണ്ണമായ വ്യൂ മോഡ്യൂളാക്കി മാറ്റുന്നത് പഠിക്കുകയും ചെയ്യാം.

കോഴ്‌സ് കാർഡിന്റെ ഫലം:

![view](../../../Resource/026_view.png)

ഈ കോഴ്‌സ് കാർഡിൽ പ്രധാനമായി ചില ഭാഗങ്ങൾ ഉൾപ്പെടുന്നു:

- കോഴ്‌സ് നില: `Beginner`
- കോഴ്‌സ് ഉള്ളടക്കം: `20+ Lessons`
- കോഴ്‌സ് തലക്കെട്ട്: `SwiftUI Beginner Tutorial`
- കോഴ്‌സ് വിവരണം
- ബട്ടൺ: `Start Learning`
- കോഴ്‌സ് പശ്ചാത്തലം: Swift ഐക്കണും ഇൻഡിഗോ നിറത്തിലുള്ള പശ്ചാത്തലവും

ഈ വ്യൂ `ContentView`-ൽ പൂർത്തിയാക്കാം.

## മുകളിൽ ഉള്ള ഭാഗം

ആദ്യം, കോഴ്‌സ് കാർഡിന്റെ മുകളിലുള്ള ഭാഗം തയ്യാറാക്കാം.

![view](../../../Resource/026_view1.png)

മുകളിൽ ഇടതുവശത്ത് കോഴ്‌സ് നിലയും വലതുവശത്ത് കോഴ്‌സ് ഉള്ളടക്കവും കാണിക്കും.

ഈ രണ്ട് ഉള്ളടക്കങ്ങളും കിടത്തായി നിരത്തേണ്ടതിനാൽ `HStack` ഉപയോഗിക്കാം.

```swift
var topView: some View {
    HStack {
        Text("തുടക്കക്കാരൻ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ പാഠങ്ങൾ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ഇവിടെ മുകളിൽ ഉള്ള ഭാഗം ഒരു കംപ്യൂട്ടഡ് പ്രോപ്പർട്ടിയായി വേർതിരിച്ചിരിക്കുന്നു:

```swift
var topView: some View
```

ഇങ്ങനെ ചെയ്യുന്നതിന്റെ ഗുണം `body` കൂടുതൽ വ്യക്തമായി കാണപ്പെടുന്നതാണ്.

മുകളിൽ ഉള്ള ഭാഗത്തിൽ പ്രധാനമായി ഉപയോഗിച്ചിരിക്കുന്നത് ഇവയാണ്:

- `HStack`: രണ്ട് ടെക്സ്റ്റുകളെ കിടത്തായി നിരത്തുന്നു.
- `Text`: വാചക ഉള്ളടക്കം കാണിക്കുന്നു.
- `Spacer()`: ഇടതുവശത്തെ ടെക്സ്റ്റിനെ ഇടത്തേക്ക്, വലതുവശത്തെ ടെക്സ്റ്റിനെ വലത്തേക്ക് തള്ളുന്നു.
- `.font(.footnote)`: ചെറിയ ടെക്സ്റ്റ് ശൈലി സജ്ജീകരിക്കുന്നു.
- `.fontWeight(.bold)`: ടെക്സ്റ്റ് ബോൾഡാക്കുന്നു.
- `.foregroundStyle(Color.white)`: മുൻനിര നിറം വെളുപ്പായി സജ്ജീകരിക്കുന്നു.
- `.padding(.vertical, 10)`: മുകളിലും താഴെയും ഉള്ള ആന്തരിക ഇടവിടം സജ്ജീകരിക്കുന്നു.
- `.padding(.horizontal, 16)`: ഇടത്തും വലത്തും ഉള്ള ആന്തരിക ഇടവിടം സജ്ജീകരിക്കുന്നു.
- `.background(Color.white.opacity(0.15))`: അർധസുതാര്യമായ വെളുത്ത പശ്ചാത്തലം സജ്ജീകരിക്കുന്നു.
- `.cornerRadius(20)`: വട്ടമൂലകൾ സജ്ജീകരിക്കുന്നു.

ഇവിടെ `Beginner` രണ്ട് ദിശകളിലുള്ള `.padding()` ഉപയോഗിക്കുന്നു:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

ഇങ്ങനെ ചെയ്താൽ വാചകത്തിന് മുകളിലും താഴെയും ഇടത്തും വലത്തും ഇടം ലഭിക്കും, അതിനാൽ അത് ഒരു ടാഗ് പോലെ തോന്നും.

`Color.white.opacity(0.15)` എന്നത് `15%` അപാകതയുള്ള വെളുപ്പ് എന്നാണ് അർത്ഥം. അതായത് വളരെ മങ്ങിയ വെളുപ്പ്.

### കാർഡ് പശ്ചാത്തലം ചേർക്കുക

മുമ്പ് നമ്മൾ `topView` സൃഷ്ടിച്ചു. പക്ഷേ ഒരു വ്യൂ സൃഷ്ടിച്ചതുകൊണ്ട് മാത്രം അത് സ്വയം കാണിക്കപ്പെടില്ല.

SwiftUI-ൽ, യഥാർത്ഥത്തിൽ ഇന്റർഫേസിൽ കാണിക്കേണ്ട ഉള്ളടക്കം `body`-യിൽ എഴുതണം.

അതിനാൽ ആദ്യം `topView` നെ `body`-യിൽ വച്ച് കാണിക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ഇപ്പോൾ മുകളിൽ ഉള്ള ഭാഗം ഇതിനകം കാണിച്ചിരിക്കുന്നതായി കാണാം:

![view](../../../Resource/026_view2.png)

എന്നാൽ `topView`-യിലെ വാചകം വെളുപ്പായതും ഡിഫോൾട്ട് പശ്ചാത്തലം സാധാരണയായി ഇളം നിറമുള്ളതുമായതിനാൽ, ലൈറ്റ് മോഡിൽ അത് വ്യക്തമാകാതെ പോകാം.

അതിനാൽ പുറത്തായി ഒരു `VStack` ചേർത്ത്, മുഴുവൻ ഭാഗത്തിനും ആന്തരിക ഇടവിടം, പശ്ചാത്തല നിറം, വട്ടമൂലകൾ എന്നിവ സജ്ജീകരിക്കാം:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view3.png)

ഇവിടെയുള്ള `VStack`-ൽ ഇപ്പോൾ ഒരു `topView` മാത്രമാണ് ഉള്ളത്. അതിനാൽ ഇത് അത്യാവശ്യമല്ലെന്ന് തോന്നാം.

പക്ഷേ പിന്നെ നാം കോഴ്‌സ് തലക്കെട്ട്, കോഴ്‌സ് വിവരണം, ബട്ടൺ ഭാഗം എന്നിവ കൂടി ചേർക്കും. അവ എല്ലാം മുകളിലிருந்து താഴേക്കുള്ള ഉള്ളടക്കങ്ങളായതിനാൽ, ഇവിടെ മുമ്പേ `VStack` ഉപയോഗിക്കുന്നത് പിന്നീട് വ്യൂകൾ കൂട്ടിച്ചേർക്കാൻ സൗകര്യപ്രദമാണ്.

ഇവിടെ രണ്ട് `.padding()` ഉണ്ട്. അവയുടെ പ്രവർത്തനം വ്യത്യസ്തമാണ്.

ആദ്യത്തെ `.padding(20)` `.background()`-ന് മുമ്പാണ് എഴുതിയത്:

```swift
.padding(20)
.background(Color.indigo)
```

ഇത് നിയന്ത്രിക്കുന്നത് കാർഡിന്റെ ഉള്ളിലെ ഇടവിടമാണ്. അതായത് ഉള്ളടക്കവും പശ്ചാത്തലത്തിന്റെ അരികും തമ്മിലുള്ള ദൂരം.

രണ്ടാമത്തെ `.padding(30)` `.background()`-ന് ശേഷമാണ് എഴുതിയത്:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

ഇത് നിയന്ത്രിക്കുന്നത് കാർഡിന്റെ പുറത്തെ ഇടവിടമാണ്. അതായത് മുഴുവൻ കാർഡും സ്ക്രീൻ അരികും തമ്മിലുള്ള ദൂരം.

![view](../../../Resource/026_view4.png)

അതിനാൽ ഒരേ `.padding()` ആയാലും, അത് എഴുതുന്ന സ്ഥാനം മാറുമ്പോൾ ഫലവും മാറും.

## ഉള്ളടക്ക ഭാഗം

അടുത്തതായി കോഴ്‌സ് കാർഡിന്റെ ഉള്ളടക്ക ഭാഗം തയ്യാറാക്കാം.

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view5.png)

ഉള്ളടക്ക ഭാഗത്തിൽ കോഴ്‌സ് തലക്കെട്ടും കോഴ്‌സ് വിവരണവും ഉൾപ്പെടുന്നു. അവ മുകളിലും താഴെയും നിരത്തപ്പെടുന്നതിനാൽ `VStack` ഉപയോഗിക്കുന്നു.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI തുടക്കക്കാരുടെ ട്യൂട്ടോറിയൽ")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("പൂജ്യത്തിൽ നിന്ന് SwiftUI ആരംഭിച്ച് Apple-ന്റെ പ്രഖ്യാപനാത്മക UI വികസനം ക്രമമായി പഠിക്കുക. വ്യക്തമായ വിശദീകരണങ്ങളും പ്രായോഗിക ഉദാഹരണങ്ങളും വഴി, ലേഔട്ട്, ഇടപെടൽ, സ്റ്റേറ്റ് മാനേജ്മെന്റ് എന്നിവ ക്രമേണ കൈവശപ്പെടുത്തി മനോഹരവും ഉപയോഗപ്രദവുമായ ആപ്പ് ഇന്റർഫേസുകൾ നിർമ്മിക്കാം.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view6.png)

ഇവിടെയുള്ള `VStack` രണ്ട് പാരാമീറ്ററുകൾ ഉപയോഗിക്കുന്നു:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` എന്നത് `VStack`-ന്റെ ഉള്ളിലുള്ള വ്യൂകൾ ഇടത് അലൈൻ ചെയ്യുക എന്നാണ് അർത്ഥം.

`spacing: 10` എന്നത് `VStack`-ന്റെ ഉള്ളിലുള്ള വ്യൂകൾ തമ്മിൽ `10 pt` ഇടവിടം നിലനിർത്തുക എന്നാണ് അർത്ഥം.

അതിനാൽ കോഴ്‌സ് തലക്കെട്ടും കോഴ്‌സ് വിവരണവും ഇടതുവശത്തിൽ നിന്ന് നിരത്തപ്പെടും. അവയ്ക്കിടയിൽ ഒരു നിശ്ചിത ദൂരവും ഉണ്ടായിരിക്കും.

കോഴ്‌സ് വിവരണം കുറച്ച് നീളമുള്ളതാണ്. മുഴുവൻ കാണിച്ചാൽ കാർഡ് വളരെ ഉയരമുള്ളതാകും. അതിനാൽ ഇവിടെ `.lineLimit()` ഉപയോഗിച്ച് കാണിക്കുന്ന വരികളുടെ എണ്ണം പരിമിതപ്പെടുത്തുന്നു:

```swift
.lineLimit(3)
```

ഇത് പരമാവധി `3` വരി മാത്രം കാണിക്കണമെന്ന് പറയുന്നു. ഉള്ളടക്കം ഈ പരിധി കടന്നാൽ അധിക ഭാഗം ചുരുക്കി കാണിക്കും.

### വ്യൂ ഇടത് അലൈൻ ചെയ്യുക

ഇവിടെ മറ്റൊരു കാര്യം ശ്രദ്ധിക്കണം.

`VStack(alignment: .leading)` എന്നത് `VStack`-ന്റെ ഉള്ളിലുള്ള വ്യൂകളുടെ അലൈൻമെന്റ് മാത്രം നിയന്ത്രിക്കുന്നു. അത് `VStack` തന്നെ പുറത്തുള്ള കണ്ടെയ്നറിലെ സ്ഥാനത്തെ നേരിട്ട് നിയന്ത്രിക്കില്ല.

ഉദാഹരണത്തിന്, കോഴ്‌സ് വിവരണം കുറച്ച് ചെറുതാണെങ്കിൽ:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI തുടക്കക്കാരുടെ ട്യൂട്ടോറിയൽ")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("ചില ഉള്ളടക്കം മാത്രം.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view7.png)

കാണാം: കോഴ്‌സ് തലക്കെട്ടും വിവരണവും `VStack`-ന്റെ ഉള്ളിൽ ഇടത് അലൈൻ ചെയ്തിട്ടുണ്ടെങ്കിലും, മുഴുവൻ `VStack` കാർഡിന്റെ ഏറ്റവും ഇടതുവശത്തേക്ക് ചേർന്നിട്ടില്ല.

കാരണം ഉള്ളടക്കം കുറച്ചാണെങ്കിൽ `VStack`-ന്റെ വീതിയും കുറയും. പുറത്തുള്ള കണ്ടെയ്നർ ലേഔട്ട് ചെയ്യുമ്പോൾ ഈ കുറച്ച് വീതിയുള്ള `VStack`-നെ മദ്ധ്യഭാഗത്ത് വയ്ക്കാൻ ഇടയുണ്ട്.

ഇങ്ങനെ മനസ്സിലാക്കാം: `VStack(alignment: .leading)` ഉള്ളിലെ ഇടത് അലൈൻമെന്റിന് ഉത്തരവാദിയാണ്.
പക്ഷേ മുഴുവൻ ഉള്ളടക്ക ഭാഗത്തെ ഏറ്റവും ഇടത്തേക്ക് തള്ളാനുള്ള ഉത്തരവാദിത്വം അതിന് ഇല്ല.

മുഴുവൻ ഉള്ളടക്ക ഭാഗം യഥാർത്ഥത്തിൽ ഇടതുവശത്ത് ചേർന്ന് കാണിക്കണമെങ്കിൽ, പുറത്തായി വീണ്ടും ഒരു `HStack` മൂടി അതിൽ `Spacer()` ചേർക്കാം:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI തുടക്കക്കാരുടെ ട്യൂട്ടോറിയൽ")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("ചില ഉള്ളടക്കം മാത്രം.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view8.png)

ഇവിടെയുള്ള `HStack` ഒരു കിടത്തായ ലേഔട്ടാണ്.

`Spacer()` വലതുവശത്തെ ശേഷിക്കുന്ന ഇടം കൈവശപ്പെടുത്തും. അതുവഴി ഇടതുവശത്തെ `VStack` ഏറ്റവും ഇടത്തേക്ക് തള്ളപ്പെടും.

അതിനാൽ `HStack + Spacer()` മുഴുവൻ ഉള്ളടക്ക ഭാഗത്തിന്റെ സ്ഥാനം നിയന്ത്രിക്കാൻ ഉപയോഗിക്കാം.

യഥാർത്ഥ കോഴ്‌സ് കാർഡിൽ കോഴ്‌സ് വിവരണം കുറച്ച് നീളമുള്ളതാണ്. സാധാരണയായി അത് കൂടുതൽ വീതി കൈവശപ്പെടുത്തും. അതിനാൽ ഈ പ്രശ്നം എല്ലായ്പ്പോഴും വ്യക്തമാകണമെന്നില്ല. പക്ഷേ ഈ വ്യത്യാസം മനസ്സിലാക്കുന്നത് പ്രധാനമാണ്, കാരണം പിന്നീട് ചെറു ടെക്സ്റ്റ് ലേഔട്ടുകൾ നിർമ്മിക്കുമ്പോൾ ഇത്തരമൊരു സാഹചര്യം പലപ്പോഴും വരാം.

### ഉള്ളിലെ വ്യൂകൾ തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കുക

മുമ്പ് നാം `VStack`-ൽ `spacing: 10` എഴുതി:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ഉള്ളിലെ വ്യൂകൾ തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കാൻ ഉപയോഗിക്കുന്നു.

`spacing` സജ്ജീകരിക്കാത്ത പക്ഷവും `VStack`-ന് ഡിഫോൾട്ട് ഇടവിടം ഉണ്ടായിരിക്കും. പക്ഷേ ആ ഡിഫോൾട്ട് ഇടവിടം നമ്മൾ ആഗ്രഹിക്കുന്ന ഫലവുമായി എല്ലായ്പ്പോഴും പൊരുത്തപ്പെടണമെന്നില്ല.

ഇവിടെ കോഴ്‌സ് തലക്കെട്ടും വിവരണവും വളരെ അടുത്തായാൽ തിരക്കേറിയതായി തോന്നും. അതിനാൽ ഉപയോഗിക്കുന്നത്:

```swift
spacing: 10
```

അവയ്‌ക്കിടയിൽ കുറച്ച് ഇടം നിലനിർത്താൻ.

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view9.png)

അതുപോലെ, മുകളിൽ ഉള്ള ഭാഗവും ഉള്ളടക്ക ഭാഗവും മുകളിലും താഴെയും നിരത്തപ്പെടുന്നവയാണ്. അവയ്ക്കിടയിലെ ദൂരവും `spacing` ഉപയോഗിച്ച് നിയന്ത്രിക്കാം.

ഇപ്പോൾ `topView`യും `contentView`യും `body`-യിൽ വയ്ക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view10.png)

ഇവിടെയുള്ള `VStack(spacing: 20)` `topView`യും `contentView`യും തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കുന്നു.

അതായത്:

```swift
VStack(alignment: .leading, spacing: 10)
```

ഇത് കോഴ്‌സ് തലക്കെട്ടും കോഴ്‌സ് വിവരണവും തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കുന്നു.

```swift
VStack(spacing: 20)
```

ഇത് മുകളിൽ ഉള്ള ഭാഗവും ഉള്ളടക്ക ഭാഗവും തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കുന്നു.

ഇവ രണ്ടും `spacing` തന്നെയാണ്. പക്ഷേ വ്യത്യസ്ത `VStack`-കളിൽ പ്രവർത്തിക്കുന്നതിനാൽ അവയുടെ സ്വാധീന പരിധിയും വ്യത്യസ്തമാണ്.

ഇങ്ങനെ ഉള്ളടക്ക ഭാഗത്തിന്റെ വ്യൂ പൂർത്തിയായി.

## ബട്ടൺ ഭാഗം

അടുത്തതായി താഴെയുള്ള ബട്ടൺ ഭാഗം തയ്യാറാക്കാം.

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view11.png)

ബട്ടൺ ഭാഗം പ്രധാനമായി ഒരു പ്ലേ ഐക്കണും ഒരു വാചകവും ചേർന്നതാണ്.

പ്ലേ ഐക്കൺ കാണിക്കാൻ `Image` ഉപയോഗിക്കാം. ബട്ടൺ വാചകം കാണിക്കാൻ `Text` ഉപയോഗിക്കാം.

ഇവിടെ ആദ്യം ഒരു ബട്ടൺ രൂപം തയ്യാറാക്കാം:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("ബട്ടൺ ക്ലിക്ക് ചെയ്തു")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("പഠനം ആരംഭിക്കുക")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view12.png)

ഇവിടെ രണ്ട് `HStack` ഉപയോഗിച്ചിരിക്കുന്നു:

അകത്തെ `HStack` ഐക്കണും വാചകവും കിടത്തായി നിരത്താൻ ഉപയോഗിക്കുന്നു:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("പഠനം ആരംഭിക്കുക")
}
```

പുറത്തെ `HStack` `Spacer()`-നൊപ്പം ചേർന്ന് ഈ ബട്ടൺ രൂപം ഇടതുവശത്ത് കാണിക്കാൻ ഉപയോഗിക്കുന്നു:

```swift
HStack {
    ...
    Spacer()
}
```

ബട്ടൺ ക്ലിക്ക് ചെയ്യുമ്പോൾ കോൺസോളിൽ `ബട്ടൺ ക്ലിക്ക് ചെയ്തു` എന്ന് ഔട്ട്‌പുട്ട് ചെയ്യും.

## അടിസ്ഥാന കാർഡ് പൂർത്തിയായി

ഇപ്പോൾ മുകളിൽ ഉള്ള ഭാഗം, ഉള്ളടക്ക ഭാഗം, ബട്ടൺ ഭാഗം എന്നിവ കൂട്ടിച്ചേർക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/026_view13.png)

ഇതുവരെ ഒരു അടിസ്ഥാന കോഴ്‌സ് കാർഡ് പൂർത്തിയായി.

## Swift ഐക്കൺ പശ്ചാത്തലം

അവസാനം, കാർഡിൽ ഒരു അർധസുതാര്യ Swift ഐക്കൺ പശ്ചാത്തലം ചേർക്കാം.

![view](../../../Resource/026_view.png)

മുമ്പ് നാം `Color.indigo` പശ്ചാത്തല നിറമായി ഉപയോഗിച്ചിരുന്നു. വാസ്തവത്തിൽ `.background()` നിറം ചേർക്കുന്നതിനു പുറമെ ഒരു പൂർണ്ണമായ വ്യൂയും ചേർക്കാം.

അതിനാൽ ആദ്യം ഒരു പ്രത്യേക പശ്ചാത്തല വ്യൂ സൃഷ്ടിക്കാം:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ഈ പശ്ചാത്തല വ്യൂയിൽ `VStack`, `HStack`, `Spacer()` എന്നിവ ഉപയോഗിച്ച് Swift ഐക്കണിനെ വലത് താഴെ കോണിലേക്ക് തള്ളുന്നു.

Swift ഐക്കൺ ഒരു അലങ്കാര പശ്ചാത്തലമായി മാത്രം ഉപയോഗിക്കുന്നതിനാൽ ഇവിടെ അർധസുതാര്യമായ വെളുപ്പ് ഉപയോഗിക്കുന്നു:

```swift
Color.white.opacity(0.15)
```

ഇതുവഴി ഐക്കൺ അതിയായി ശ്രദ്ധ പിടിച്ചുപറ്റില്ല, മുന്നിലുള്ള ടെക്സ്റ്റ് ഉള്ളടക്കത്തെ ബാധിക്കുകയുമില്ല.

അടുത്തതായി `backgroundView` കാർഡിൽ ചേർക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

നടപ്പാക്കിയ ഫലം:

![view](../../../Resource/026_view14.png)

ഇവിടെ തുടർച്ചയായി രണ്ട് `.background()` ഉപയോഗിച്ചിരിക്കുന്നു:

```swift
.background(backgroundView)
.background(Color.indigo)
```

ആദ്യത്തെ `.background()` Swift ഐക്കൺ പശ്ചാത്തലം ചേർക്കാൻ ഉപയോഗിക്കുന്നു.
രണ്ടാമത്തെ `.background()` ഇൻഡിഗോ നിറത്തിലുള്ള പശ്ചാത്തലം ചേർക്കാൻ ഉപയോഗിക്കുന്നു.

ഇങ്ങനെ Swift ഐക്കൺ ഇൻഡിഗോ പശ്ചാത്തലത്തിന്മുകളിൽ കാണിക്കും, കൂടാതെ കാർഡ് പശ്ചാത്തലത്തിന്റെ ഭാഗമായും പ്രത്യക്ഷപ്പെടും.

ഇവിടെ നിന്ന് `.background()` നിറം ചേർക്കുന്നതിനൊപ്പം കസ്റ്റം വ്യൂയും ചേർക്കാമെന്ന് കാണാം. ഒന്നിലധികം `.background()` ചേർത്ത് കൂടുതൽ സമ്പന്നമായ പശ്ചാത്തല ഫലങ്ങൾ സൃഷ്ടിക്കാനും കഴിയും.

ഇതോടെ ഒരു പൂർണ്ണമായ കോഴ്‌സ് കാർഡ് പൂർത്തിയായി.

## സംഗ്രഹം

ഈ പാഠത്തിൽ ഒരു കോഴ്‌സ് കാർഡിലൂടെ SwiftUI-യിലെ സാധാരണ അടിസ്ഥാന ലേഔട്ട് രീതികൾ ആവർത്തിച്ചു.

വാചകം കാണിക്കാൻ `Text` ഉപയോഗിച്ചു, സിസ്റ്റം ഐക്കൺ കാണിക്കാൻ `Image` ഉപയോഗിച്ചു, വ്യൂകളുടെ നിരത്തൽ നിയന്ത്രിക്കാൻ `VStack`, `HStack`, `Spacer()` എന്നിവ ഉപയോഗിച്ചു.

`.lineLimit()` പഠിച്ചു. ഇത് ടെക്സ്റ്റ് പരമാവധി എത്ര വരി കാണിക്കണമെന്ന് നിയന്ത്രിക്കാൻ കഴിയും. ഉള്ളടക്കം പരിധി കടന്നാൽ അധിക ഭാഗം ചുരുക്കി കാണിക്കും.

അതോടൊപ്പം `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` തുടങ്ങിയ സാധാരണ ഉപയോഗിക്കുന്ന മോഡിഫയറുകളും ആവർത്തിച്ചു.

ഈ പാഠം പൂർത്തിയാക്കിയ ശേഷം, നിരവധി ചെറിയ വ്യൂകളെ ചേർത്ത് ഒരു പൂർണ്ണമായ കാർഡ് മോഡ്യൂൾ നിർമ്മിക്കാൻ നമുക്ക് കഴിയും.

ഇതും SwiftUI വികസനത്തിൽ വളരെ സാധാരണമായ ഒരു ചിന്താഗതിയാണ്: ആദ്യം ചെറിയ വ്യൂകളായി വേർതിരിക്കുക, പിന്നെ അവയെ ചേർത്ത് പൂർണ്ണമായ ഇന്റർഫേസ് നിർമ്മിക്കുക.

## പൂർണ്ണ കോഡ്

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("തുടക്കക്കാരൻ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ പാഠങ്ങൾ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI തുടക്കക്കാരുടെ ട്യൂട്ടോറിയൽ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("പൂജ്യത്തിൽ നിന്ന് SwiftUI ആരംഭിച്ച് Apple-ന്റെ പ്രഖ്യാപനാത്മക UI വികസനം ക്രമമായി പഠിക്കുക. വ്യക്തമായ വിശദീകരണങ്ങളും പ്രായോഗിക ഉദാഹരണങ്ങളും വഴി, ലേഔട്ട്, ഇടപെടൽ, സ്റ്റേറ്റ് മാനേജ്മെന്റ് എന്നിവ ക്രമേണ കൈവശപ്പെടുത്തി മനോഹരവും ഉപയോഗപ്രദവുമായ ആപ്പ് ഇന്റർഫേസുകൾ നിർമ്മിക്കാം.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("ബട്ടൺ ക്ലിക്ക് ചെയ്തു")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("പഠനം ആരംഭിക്കുക")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
