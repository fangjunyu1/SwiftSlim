# ഫോട്ടോ ഗാലറി

ഈ പാഠത്തിൽ, നാം ഒരു ഫോട്ടോ ഗാലറി പേജ് നിർമ്മിക്കും.

![view](../../../Resource/032_view13.png)

ഈ ഉദാഹരണത്തിൽ, `extension`, `self`, instance എന്നിവയുടെ അറിവ് നാം ആവർത്തിച്ച് പഠിക്കുകയും SwiftUI-യിൽ സാധാരണയായി ഉപയോഗിക്കുന്ന `Shape` ഗ്രാഫിക്‌സ് പഠിക്കുകയും ചെയ്യും.

ഈ അറിവുകൾ ഉപയോഗിച്ച് സാധാരണ ചിത്രങ്ങളെ വൃത്തം, വൃത്താകാര കോണുകളുള്ള ചതുരം, ക്യാപ്സൂൾ ആകൃതി, എലിപ്സ് തുടങ്ങിയ വ്യത്യസ്ത ശൈലികളിലേക്ക് മുറിക്കാനും ഫോട്ടോകൾക്ക് border effect ചേർക്കാനും കഴിയും.

ഈ പാഠത്തിൽ ചില പുതിയ അറിവുകൾ ഉപയോഗിക്കും: `Shape`, `clipShape`, `strokeBorder`, `overlay`.

അവയിൽ, `clipShape` ഒരു view-യുടെ ആകൃതി മുറിക്കാൻ ഉപയോഗിക്കുന്നു, `strokeBorder` shape border വരയ്ക്കാൻ ഉപയോഗിക്കുന്നു, `overlay` നിലവിലെ view-ന്റെ മുകളിൽ പുതിയ view അടുക്കാൻ ഉപയോഗിക്കുന്നു.

## ചിത്രം അസറ്റുകൾ

ആരംഭിക്കുന്നതിന് മുമ്പ്, നമുക്ക് ചില ചിത്രങ്ങൾ തയ്യാറാക്കണം.

നിങ്ങൾക്ക് സ്വന്തം ഫോട്ടോകൾ ഉപയോഗിക്കാം, അല്ലെങ്കിൽ ഈ പാഠത്തിൽ നൽകിയിരിക്കുന്ന ഉദാഹരണ ചിത്രങ്ങൾ ഉപയോഗിക്കാം.

ഈ പാഠത്തിലെ ഫോട്ടോ ഉദാഹരണങ്ങൾ [Pixabay](https://pixabay.com/) വെബ്സൈറ്റിൽ നിന്നുള്ളതാണ്:

[ലാൻഡ്‌സ്‌കേപ്പ്](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [കുറുക്കൻ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [കെട്ടിടം](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [പൂവ്](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [ഹംസം](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

ചിത്രങ്ങൾ ഡൗൺലോഡ് ചെയ്ത ശേഷം, അവയെ `Assets` resource folder-ലേക്ക് ചേർക്കുക, തുടർന്ന് ക്രമമായി `1`, `2`, `3`, `4`, `5` എന്നിങ്ങനെ പേരിടുക.

![assets](../../../Resource/032_view17.png)

ഇങ്ങനെ ചെയ്താൽ, SwiftUI-യിൽ `Image("1")`, `Image("2")` എന്ന രീതിയിൽ ചിത്രങ്ങൾ കാണിക്കാൻ കഴിയും.

## ഫോട്ടോകൾ കാണിക്കൽ

ആദ്യം, നാം `ContentView`-യിൽ 5 ഫോട്ടോകൾ കാണിക്കുന്നു:

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

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/032_view.png)

ഈ കോഡിൽ, ഫോട്ടോ ലിസ്റ്റ് scroll ചെയ്യാൻ `ScrollView` ഉപയോഗിക്കുന്നു, കൂടാതെ ഒന്നിലധികം ചിത്രങ്ങൾ മുകളിൽ നിന്ന് താഴേക്ക് നിരത്താൻ `VStack` ഉപയോഗിക്കുന്നു.

ഓരോ ചിത്രത്തിനും `.resizable()`, `.scaledToFit()`, `.frame(width: 300)` എന്നിവ ഉപയോഗിച്ച് display effect സജ്ജീകരിക്കുന്നു. ഇതിലൂടെ ചിത്രം scale ചെയ്യാനും, ratio നിലനിർത്തി പൂർണ്ണമായി കാണിക്കാനും, ചിത്രത്തിന്റെ വീതി നിയന്ത്രിക്കാനും കഴിയും.

`VStack`-ലെ `.padding(.vertical, 100)` മുകളിലും താഴെയും ഇടവേള കൂട്ടാൻ ഉപയോഗിക്കുന്നു. ഇതോടെ ആദ്യ ഫോട്ടോയും അവസാന ഫോട്ടോയും screen edge-ിനോട് വളരെ ചേർന്ന് കാണുന്നതു ഒഴിവാക്കാം.

അവസാനത്തെ `.ignoresSafeArea()` എന്നത് scroll view safe area അവഗണിക്കുമെന്ന് സൂചിപ്പിക്കുന്നു. ഫോട്ടോകൾ scroll ചെയ്യുമ്പോൾ screen-ന്റെ മുകളിലേക്കും താഴേക്കും നീളാൻ കഴിയുന്നതിനാൽ പേജ് കൂടുതൽ പൂർണ്ണമായി കാണാം.

എന്നാൽ ഇപ്പോൾ 5 ചിത്രങ്ങളും ഒരേ modifiers ആണ് ഉപയോഗിക്കുന്നത്:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

ആവർത്തിക്കുന്ന code കാണുമ്പോൾ, അത് ക്രമീകരിക്കാൻ `extension` ഉപയോഗിക്കുന്നത് പരിഗണിക്കാം.

## extension ഉപയോഗിച്ച് ചിത്രം style ക്രമീകരിക്കൽ

`Image`-ന് ഫോട്ടോ ഗാലറിക്കായി പ്രത്യേകമായ ഒരു method നാം extend ചെയ്യാം:

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

ഇവിടെ, നാം `Image` type-ിന് `photoGalleryStyle` എന്ന method ചേർത്തിരിക്കുന്നു.

ഈ method-ന്റെ ഉള്ളിൽ മുമ്പ് ആവർത്തിച്ച് ഉപയോഗിച്ച `.resizable()`, `.scaledToFit()`, `.frame(width: 300)` എന്നിവ ഉൾപ്പെടുന്നു. അതായത്, image scaling, proportional display, width setting എന്നിവയുടെ code ഇതിൽ ഒരുമിച്ച് ക്രമീകരിച്ചിരിക്കുന്നു.

ഈ extension ഉപയോഗിച്ചതിന് ശേഷം, പഴയ image code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ഇങ്ങനെ ലളിതമാക്കാം:

```swift
Image("1")
    .photoGalleryStyle()
```

ഇങ്ങനെ ചെയ്താൽ, ഓരോ ചിത്രവും `.photoGalleryStyle()` വിളിച്ചാൽ മതി. അതേ photo gallery style പ്രയോഗിക്കപ്പെടും. code കൂടുതൽ ചുരുങ്ങും, പിന്നിട് ഒരേ സമയം തിരുത്താനും കൂടുതൽ സൗകര്യം ഉണ്ടാകും.

## self മനസ്സിലാക്കൽ

extension method-ൽ നാം `self` എഴുതിയിട്ടുണ്ട്:

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

ഇവിടെയുള്ള `self` ഈ method വിളിക്കുന്ന നിലവിലെ image instance-നെ സൂചിപ്പിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
Image("1")
    .photoGalleryStyle()
```

ഈ code-ൽ, `photoGalleryStyle()` വിളിക്കുന്നത് `Image("1")` ആണ്. അതിനാൽ method-ന്റെ ഉള്ളിലെ `self` ഈ `Image("1")` ചിത്രത്തെയാണ് സൂചിപ്പിക്കുന്നത്.

ലളിതമായി മനസ്സിലാക്കാം: ആരാണ് ഈ method വിളിക്കുന്നത്, `self` അവനെയോ അതെയോ സൂചിപ്പിക്കുന്നു.

ശ്രദ്ധിക്കേണ്ടത്, SwiftUI modifiers തുടർച്ചയായി പുതിയ view result മടക്കിനൽകുന്നു എന്നതാണ്. അതിനാൽ `photoGalleryStyle()` മടക്കിനൽകുന്നത് modifier ചെയ്ത view ആണ്; യഥാർത്ഥ `Image` തന്നെയെ മാത്രം ലളിതമായി മടക്കിനൽകുന്നതല്ല.

## ഫോട്ടോ ആകൃതികൾ

ഇപ്പോൾ ഫോട്ടോകൾ സാധാരണയായി കാണിക്കാനാകുന്നു. എന്നാൽ ഈ ഫോട്ടോകൾ default ആയി ചതുരാകൃതിയിലാണ്, അതിനാൽ അവ സാധാരണയായി തോന്നും.

ഫോട്ടോകൾക്ക് rounded corners മാത്രം വേണമെങ്കിൽ, നേരിട്ട് `.cornerRadius()` ഉപയോഗിക്കാം:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

കാണിക്കുന്ന ഫലം:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` എന്നത് ചിത്രത്തിന് `20 pt` corner radius ചേർക്കുന്നു എന്നർത്ഥമാണ്. സാധാരണ rounded-corner image തയ്യാറാക്കാൻ ഈ എഴുത്ത് മതിയാകും.

എന്നാൽ `.cornerRadius()` rounded-corner effect മാത്രം കൈകാര്യം ചെയ്യുന്നു. സാധാരണ rounded-corner image-കൾക്ക് ഇത് അനുയോജ്യമാണ്. ഫോട്ടോകളെ കൂടുതൽ വ്യത്യസ്ത ആകൃതികളാക്കണമെങ്കിൽ ഈ modifier മാത്രം മതിയാകില്ല.

ഈ സമയത്ത് SwiftUI-യിലെ `Shape` ഉപയോഗിക്കണം. `Shape` വ്യത്യസ്ത graphics-നെ സൂചിപ്പിക്കാം; `clipShape`-നൊപ്പം ഉപയോഗിച്ചാൽ ചിത്രം ബന്ധപ്പെട്ട ആകൃതിയിലേക്ക് crop ചെയ്യാം.

## Shape പരിചയപ്പെടുക

SwiftUI-യിൽ `Shape` ഒരു graphic-നെ സൂചിപ്പിക്കുന്നു. `View` പോലെ തന്നെ, SwiftUI-യിൽ ഇത് വളരെ സാധാരണയായി ഉപയോഗിക്കുന്ന type ആണ്.

സാധാരണ `Shape`-കളിൽ circle, rectangle, rounded rectangle, capsule, ellipse എന്നിവ ഉൾപ്പെടുന്നു. വ്യത്യസ്ത graphics-ന്റെ രൂപം കൂടുതൽ നേരിട്ട് കാണാൻ, താഴെയുള്ള ഉദാഹരണങ്ങളിൽ ഓരോ graphic-നും വ്യത്യസ്ത നിറവും വലിപ്പവും നൽകുന്നു.

ഈ ഉദാഹരണങ്ങളിൽ, `.fill()` graphic-ന് നിറം നിറയ്ക്കാൻ ഉപയോഗിക്കുന്നു, `.frame()` graphic-ന്റെ display size സജ്ജീകരിക്കാൻ ഉപയോഗിക്കുന്നു. നിറങ്ങൾ വ്യത്യസ്ത graphics വേർതിരിക്കാൻ മാത്രമാണ്; അവ graphic-ന്റെ സ്ഥിരമായ നിറങ്ങളല്ല.

### Circle വൃത്തം

`Circle` വൃത്തത്തെ സൂചിപ്പിക്കുന്നു. ഇത് സാധാരണയായി avatar, circular button, circular image തുടങ്ങിയ interface effects-ൽ ഉപയോഗിക്കുന്നു.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle ചതുരം

`Rectangle` ചതുരത്തെ സൂചിപ്പിക്കുന്നു. ഇത് ഏറ്റവും അടിസ്ഥാന graphics-കളിൽ ഒന്നാണ്. background, divided area, സാധാരണ border എന്നിവ നിർമ്മിക്കാനും ഉപയോഗിക്കാം.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle വൃത്താകാര കോണുകളുള്ള ചതുരം

`RoundedRectangle` വൃത്താകാര കോണുകളുള്ള ചതുരത്തെ സൂചിപ്പിക്കുന്നു. `cornerRadius` കോണുകളുടെ വൃത്താകാര വലിപ്പം സജ്ജീകരിക്കാൻ ഉപയോഗിക്കുന്നു.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule ക്യാപ്സൂൾ ആകൃതി

`Capsule` ക്യാപ്സൂൾ ആകൃതിയെ സൂചിപ്പിക്കുന്നു. അതിന്റെ രണ്ടു അറ്റങ്ങളും arc രൂപത്തിലാണ്. capsule button, tag background തുടങ്ങിയ interface effects-ൽ ഇത് സാധാരണയായി ഉപയോഗിക്കുന്നു.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse എലിപ്സ്

`Ellipse` എലിപ്സ് ആകൃതിയെ സൂചിപ്പിക്കുന്നു. ഇത് `Circle`-നെപ്പോലെയാണ്, പക്ഷേ width, height വ്യത്യസ്തമായിരിക്കുമ്പോൾ ellipse ആയി കാണിക്കും.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ഈ ഉദാഹരണങ്ങൾ വഴി, `Shape` തന്നെ നേരിട്ട് graphic ആയി കാണിക്കാനാകുമെന്ന് കാണാം. അടുത്തതായി, ഈ `Shape`-കൾ `clipShape`-നൊപ്പം ഉപയോഗിച്ച് ഫോട്ടോകൾ crop ചെയ്ത് വ്യത്യസ്ത ആകൃതികളിൽ കാണിക്കും.

## clipShape ഉപയോഗിച്ച് ഫോട്ടോകൾ crop ചെയ്യൽ

ഇപ്പോൾ, `clipShape` ഉപയോഗിച്ച് ഫോട്ടോകളെ വ്യത്യസ്ത ആകൃതികളിലേക്ക് crop ചെയ്യാം.

ഉദാഹരണത്തിന്, ആദ്യ ഫോട്ടോ വൃത്തമായി crop ചെയ്യുക:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

ഈ code പറയുന്നത്: ആദ്യം ഒരു ചിത്രം കാണിക്കുക, തുടർന്ന് `Circle()` ഉപയോഗിച്ച് അതിനെ വൃത്തമായി crop ചെയ്യുക.

![view](../../../Resource/032_view2.png)

`clipShape`-ന്റെ അടിസ്ഥാന എഴുത്ത് ഇതാണ്:

```swift
.clipShape(ആകൃതി)
```

view-ന്റെ പിന്നാലെ `.clipShape(...)` ചേർക്കുക. brackets-ന്റെ ഉള്ളിൽ crop ചെയ്യേണ്ട graphic എഴുതുക.

ഉദാഹരണത്തിന്:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ഇപ്പോൾ, നാം 5 ഫോട്ടോകളെയും വ്യത്യസ്ത ആകൃതികളിലേക്ക് crop ചെയ്യുന്നു:

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

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/032_view8.png)

ഇതിൽ `Rectangle()` ഉപയോഗിച്ച് crop ചെയ്ത ഫലം സാധാരണ ചതുരാകാര ഫോട്ടോയോട് അടുത്തതാണ്, അതിനാൽ ദൃശ്യപരമായ മാറ്റം വ്യക്തമല്ല. ഇത് പ്രധാനമായും മറ്റു ആകൃതികളുമായി താരതമ്യം ചെയ്യാനാണ് ഉപയോഗിക്കുന്നത്.

ഇപ്പോൾ ഫോട്ടോകൾ സാധാരണ ചതുരങ്ങൾ മാത്രമല്ല; അവയ്ക്ക് വ്യത്യസ്ത ആകൃതികളുണ്ട്.

## ഫോട്ടോ border ചേർക്കൽ

ഒരു circular photo-യ്ക്ക് border ചേർക്കണമെങ്കിൽ, നമുക്ക് `border` ഉപയോഗിക്കാമെന്ന് തോന്നാം:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

എന്നാൽ ഇതിലൂടെ സാധാരണയായി circular border ലഭിക്കില്ല; പകരം rectangular border ആണ് ലഭിക്കുക.

![view](../../../Resource/032_view9.png)

കാരണം `border` view-ന്റെ rectangular area അനുസരിച്ചാണ് border ചേർക്കുന്നത്; `clipShape` crop ചെയ്തശേഷമുള്ള shape അനുസരിച്ച് അല്ല.

അതുകൊണ്ട് circular border വേണമെങ്കിൽ, നേരിട്ട് `border` ഉപയോഗിക്കാൻ പറ്റില്ല.

## strokeBorder ഉപയോഗിച്ച് shape border വരയ്ക്കൽ

SwiftUI-യിൽ, `strokeBorder` ഈ സാധാരണ `Shape`-കൾക്ക് inner border വരയ്ക്കാൻ ഉപയോഗിക്കാം.

ഉദാഹരണത്തിന്, ഒരു circular border വരയ്ക്കുക:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

ഈ code പറയുന്നത്: `Circle`-ന് brown border വരയ്ക്കുക, border width `10 pt` ആണ്.

![view](../../../Resource/032_view12.png)

ഇവിടെ ശ്രദ്ധിക്കേണ്ടത്, `strokeBorder` നേരിട്ട് ഫോട്ടോയ്ക്ക് border ചേർക്കുന്നതല്ല. പകരം അത് `Circle()` എന്ന graphic-ിന് border വരയ്ക്കുന്നു.

അതായത്, ഈ code വഴി ലഭിക്കുന്നത് ഒരു സ്വതന്ത്ര circular border മാത്രമാണ്; ഇത് ഇപ്പോഴും ഫോട്ടോയുമായി ബന്ധപ്പെടുത്തിയിട്ടില്ല.

ഈ circular border ഫോട്ടോയുടെ മുകളിൽ കാണിക്കണമെങ്കിൽ, border ഫോട്ടോയുടെ മുകളിൽ അടുക്കാൻ `overlay` തുടർന്നും ഉപയോഗിക്കണം.

## overlay ഉപയോഗിച്ച് border അടുക്കൽ

`overlay` നിലവിലെ view-ന്റെ മുകളിൽ പുതിയ view അടുക്കാൻ കഴിയുന്ന ഒരു view modifier ആണ്.

അതിന്റെയുടെ അടിസ്ഥാന ഘടന ഇങ്ങനെ മനസ്സിലാക്കാം:

```swift
നിലവിലെ view
    .overlay {
        അടുക്കുന്ന view
    }
```

ഈ ഉദാഹരണത്തിൽ, നിലവിലെ view എന്നത് ഇതിനകം circle ആയി crop ചെയ്ത ഫോട്ടോയാണ്:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

മുകളിലേക്ക് അടുക്കേണ്ട പുതിയ view ഒരു circular border ആണ്:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

അതിനാൽ, ഫോട്ടോയും border-വും ഇങ്ങനെ കൂട്ടിച്ചേർക്കാം:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ഇവിടെ `overlay` നിലവിലെ view-ന്റെ മുകളിൽ ഒരു പുതിയ view അടുക്കുന്നു എന്നാണ് അർത്ഥം.

`overlay`-യിൽ, border നിലവിലെ ഫോട്ടോയുടെ display range പിന്തുടർന്ന് അടുക്കും. അതിനാൽ വേർതിരിച്ച് `frame` സജ്ജീകരിക്കേണ്ടതില്ല. border shape-വും clipping shape-വും ഒരുപോലെ ആണെങ്കിൽ, border ഫോട്ടോയോട് ചേർന്ന് പൊരുത്തപ്പെടും.

![view](../../../Resource/032_view10.png)

അവസാന ഫലം: circular photo-യുടെ മുകളിൽ circular border മൂടിക്കിടക്കുന്നു.

`ZStack`-നുമായി താരതമ്യം ചെയ്യുമ്പോൾ, “നിലവിലെ view-യ്ക്ക് decoration ചേർക്കൽ” പോലുള്ള സാഹചര്യങ്ങൾക്ക് `overlay` കൂടുതൽ അനുയോജ്യമാണ്. ഫോട്ടോയാണ് പ്രധാന ഉള്ളടക്കം; border അധിക effect മാത്രമാണ്. അതിനാൽ `overlay` ഉപയോഗിക്കുന്നത് കൂടുതൽ വ്യക്തമാണ്.

## ഫോട്ടോ ഗാലറി പൂർത്തിയാക്കൽ

ഇപ്പോൾ, ഓരോ ഫോട്ടോയ്ക്കും ബന്ധപ്പെട്ട shape-വും border-വും ചേർക്കാം:

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

കാണിക്കുന്ന ഫലം:

![view](../../../Resource/032_view13.png)

ഇങ്ങനെ, ഒരു അടിസ്ഥാന photo gallery page പൂർത്തിയായി.

ഈ പേജിൽ, scrollable display സാക്ഷാത്കരിക്കാൻ `ScrollView` ഉപയോഗിച്ചു, ഫോട്ടോകൾ കാണിക്കാൻ `Image` ഉപയോഗിച്ചു, photo shape crop ചെയ്യാൻ `clipShape` ഉപയോഗിച്ചു, border ചേർക്കാൻ `overlay`യും `strokeBorder`യും ഉപയോഗിച്ചു.

## പൂർണ്ണ code

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

## സംഗ്രഹം

ഈ പാഠത്തിൽ, നാം ഒരു photo gallery page പൂർത്തിയാക്കി.

![view](../../../Resource/032_view13.png)

ഈ ഉദാഹരണത്തിൽ, ആദ്യം `Image` ഉപയോഗിച്ച് ഫോട്ടോകൾ കാണിച്ചു. തുടർന്ന് `extension` വഴി `Image`-ന് `photoGalleryStyle` method ചേർത്ത് ആവർത്തിക്കുന്ന image style code ക്രമീകരിച്ചു.

തുടർന്ന്, SwiftUI-യിലെ സാധാരണ `Shape`-കൾ പഠിച്ചു, ഉദാഹരണത്തിന് `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule`, `Ellipse`. ഈ graphics നേരിട്ട് കാണിക്കാനാകുന്നതുപോലെ, `clipShape`-നൊപ്പം ഉപയോഗിച്ച് view crop ചെയ്യാനും കഴിയും.

ഉദാഹരണത്തിന്:

```swift
.clipShape(Circle())
```

ഇത് view-നെ circle ആയി crop ചെയ്യുന്നു എന്നാണ് അർത്ഥം.

അവസാനം, ഫോട്ടോകൾക്ക് ബന്ധപ്പെട്ട shape border ചേർക്കാൻ `overlay`യും `strokeBorder`യും ഉപയോഗിച്ചു. ശ്രദ്ധിക്കേണ്ടത്, `border` സാധാരണയായി view-ന്റെ rectangular area അനുസരിച്ചാണ് border വരയ്ക്കുന്നത്. border circle, capsule അല്ലെങ്കിൽ ellipse പിന്തുടരണമെങ്കിൽ, അതേ `Shape` overlay ചെയ്യുന്നതാണ് കൂടുതൽ അനുയോജ്യം.

ഈ പാഠത്തിലൂടെ, നാം photo gallery effect പൂർത്തിയാക്കിയതോടൊപ്പം interface-ൽ `Shape`, `clipShape`, `strokeBorder`, `overlay` എന്നിവയുടെ സാധാരണ കൂട്ടിച്ചേർക്കൽ രീതിയും മനസ്സിലാക്കി.

## പാഠത്തിനു ശേഷമുള്ള അഭ്യാസം

### 1、ഫോട്ടോ ഗാലറി background ചേർക്കുക

photo gallery page-ന് ഒരു full-screen background image ചേർക്കുക.

ആവശ്യം: background image മുഴുവൻ screen നിറയ്ക്കുകയും safe area അവഗണിക്കുകയും വേണം.

### 2、gradient border

നിലവിലുള്ള single-color border-കളെ linear gradient border-കളാക്കി മാറ്റുക.

കൂടുതൽ സമ്പന്നമായ border effect ഉണ്ടാക്കാൻ `LinearGradient` ഉപയോഗിച്ച് ശ്രമിക്കാം.

### 3、യഥാർത്ഥ ഫോട്ടോ ഫ്രെയിം അനുകരണം

internet-ൽ ചില യഥാർത്ഥ photo frame styles തിരയുക. തുടർന്ന് `overlay` ഉപയോഗിച്ച് image frame അടുക്കി, ഫോട്ടോകൾ കൂടുതൽ real picture frame പോലെ കാണാൻ ശ്രമിക്കുക.

Exercise display result:

![button](../../../Resource/032_view15.jpeg)

### 4、rounded button border സാക്ഷാത്കരിക്കുക

യഥാർത്ഥ development-ൽ, buttons പലപ്പോഴും rounded rectangle border ഉപയോഗിക്കുന്നു.

ഒരു rounded button നിർമ്മിക്കാൻ ശ്രമിക്കുക, തുടർന്ന് `RoundedRectangle`യും `strokeBorder`യും ഉപയോഗിച്ച് button-ന് rounded border ചേർക്കുക.

Exercise display result:

![button](../../../Resource/032_view14.png)

### ചിന്താ ചോദ്യം

single-color border ഉപയോഗിക്കാനും gradient border ഉപയോഗിക്കാനും താൽപര്യമില്ലാതെ, border-ന് ഏതെങ്കിലും pattern effect കാണിക്കണമെങ്കിൽ അത് എങ്ങനെ സാക്ഷാത്കരിക്കണം?

ബന്ധപ്പെട്ട usage-കൾ മനസ്സിലാക്കാൻ `overlay`, `mask`, `ImagePaint` തുടങ്ങിയ വിവരങ്ങൾ തിരഞ്ഞ് പഠിക്കാം.

Exercise display result:

![button](../../../Resource/032_view16.png)
