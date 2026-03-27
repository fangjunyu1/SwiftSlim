# ഒരു വ്യക്തിഗത റിസ്യൂം പേജ് നിർമ്മിക്കുക

ഈ പാഠത്തിൽ നാം ഒരു ലളിതമായ വ്യക്തിഗത റിസ്യൂം view നിർമ്മിക്കും. അതോടൊപ്പം താഴെ പറയുന്ന അറിവുകളും പഠിക്കും:

- `cornerRadius`
- `spacing`
- `ScrollView`

നിർമ്മാണപ്രക്രിയയിൽ layout, `Text`, `Image` പോലുള്ള അറിവുകൾ ആവർത്തിച്ച് നോക്കും. കൂടാതെ spacing control ചെയ്യാനും content scroll ചെയ്യാനുമുള്ള മാർഗങ്ങളും പഠിക്കും.

## വ്യക്തിഗത റിസ്യൂം

ലക്ഷ്യമിടുന്ന ഫലം:

![Swift](../../RESOURCE/004_img.png)

**താഴെയുള്ള വിശദീകരണം വായിക്കുന്നതിന് മുമ്പ് ഇത് സ്വതന്ത്രമായി പൂർത്തിയാക്കാൻ ആദ്യം ശ്രമിക്കുക.**

### Project സൃഷ്ടിക്കുക

ഒരു പുതിയ iOS project സൃഷ്ടിക്കുകയോ, മുമ്പത്തെ project തുടർന്നും ഉപയോഗിക്കുകയോ ചെയ്യാം.

Default `ContentView` code:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

ഇപ്പോൾ code clear ചെയ്ത് സ്വന്തം content എഴുതിത്തുടങ്ങാം:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### ആകെ ഘടന

യഥാർത്ഥ development-ൽ സാധാരണയായി ആദ്യം നാം overall structure design ചെയ്യാറുണ്ട്.

നമ്മുടെ page-ൽ ഉൾപ്പെടുന്നത്:

1. ശീർഷകം
2. വ്യക്തിഗത വിവരം
3. വ്യക്തിപരമായ പരിചയം

എല്ലാത്തിനും പുറത്ത് ആദ്യം ഒരു `VStack` ചേർക്കാം:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` views vertical ആയി ക്രമീകരിക്കപ്പെടുമെന്ന് ഉറപ്പാക്കും; കൂടാതെ views-ന്റെ arrangement ഉം spacing ഉം നിയന്ത്രിക്കാനും കഴിയും.

### ശീർഷകം

ആദ്യം title കാണിക്കാൻ ഒരു `Text` സൃഷ്ടിക്കാം.

ഇവിടെ title ആയി എന്റെ ഇംഗ്ലീഷ് പേര് കാണിക്കും:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

ശീർഷകം സാധാരണയായി വലുതും bold ഉം ആയിരിക്കും. അതിനായി `font`, `fontWeight` modifiers ഉപയോഗിക്കാം:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### ലേയൗട്ട് ക്രമീകരണം

SwiftUI-യുടെ default alignment `center` ആണ്. ഇപ്പോൾ title `ContentView`-ന്റെ മദ്ധ്യത്തിലാണ് കാണുന്നത്.

![Swift](../../RESOURCE/004_img3.png)

ഇത് view-യുടെ മുകളിലായി കാണിക്കാൻ `Spacer` ഉപയോഗിച്ച് layout adjust ചെയ്യാം:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` ശേഷിക്കുന്ന മുഴുവൻ സ്ഥലം കൈക്കൊള്ളും; അതിനാൽ `Text` container-ന്റെ മുകളിലേക്ക് നീങ്ങും.

![Swift](../../RESOURCE/004_img4.png)

### ഒഴിഞ്ഞ ഇടം

Text top-ന് വളരെ അടുത്തായി തോന്നുന്നുവെങ്കിൽ `padding` അല്ലെങ്കിൽ `Spacer` ഉപയോഗിക്കാം.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

ഇത് `VStack`-ന്റെ top padding `20` ആയി ക്രമീകരിക്കുന്നു.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

അതുപോലെ `Spacer`-ക്കും `frame` height നല്കി, നിശ്ചിത ഉയരമുള്ള ഇടം സൃഷ്ടിക്കാം.

ഫലം:

![Swift](../../RESOURCE/004_img5.png)

### ചിത്രം

നമ്മുടെ സ്വന്തം ഒരു portrait ചിത്രം തയ്യാറാക്കി `Assets` resources folder-ലേക്ക് ചേർക്കാം.

![Swift](../../RESOURCE/004_img6.png)

`ContentView`-ൽ `Image` ഉപയോഗിച്ച് ചിത്രം കാണിക്കുക:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

ചിത്രത്തിന്റെ original size താരതമ്യേന വലുതായതിനാൽ, `frame` ഉപയോഗിച്ച് display size നിയന്ത്രിക്കണം.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ഇപ്പോൾ ഒരു പ്രശ്നം കാണാം:

`frame`-ന്റെ width, height ratio ചിത്രത്തിന്റെ original ratio-യോട് ഒത്തുപോകുന്നില്ലെങ്കിൽ ചിത്രം distort ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ചിത്രം distort ആവുന്നത് ഒഴിവാക്കാൻ `scaledToFit` ഉപയോഗിക്കണം:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit`-ന്റെ പ്രവർത്തനം:

നൽകിയിരിക്കുന്ന `frame` പരിധിക്കുള്ളിൽ, original aspect ratio നിലനിർത്തി ചിത്രത്തെ scale ചെയ്യുകയും മുഴുവൻ ചിത്രം കാണിക്കുകയും ചെയ്യുന്നു.

ഇത് image-നെ മുഴുവൻ `frame` നിറയ്ക്കാൻ നിർബന്ധിച്ച് stretch ചെയ്യില്ല. Width-height ratio മാറ്റാതെ proportional ആയി scale ചെയ്യും; ഒടുവിൽ ഒരു edge മാത്രം boundary-യുമായി ഒത്തുചേരും.

അതായത്:

- `frame`-ന്റെ width കുറവാണെങ്കിൽ, ചിത്രം width-നെ ആശ്രയിച്ച് scale ചെയ്യും.
- `frame`-ന്റെ height കുറവാണെങ്കിൽ, ചിത്രം height-നെ ആശ്രയിച്ച് scale ചെയ്യും.
- ചിത്രം എല്ലായ്പ്പോഴും original ratio നിലനിർത്തും; distort ആകില്ല.

സാധാരണയായി ഒരു dimension മാത്രം നിശ്ചയിക്കാം. ഉദാഹരണത്തിന്:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

ഇങ്ങനെ ചെയ്താൽ `140` width അടിസ്ഥാനമാക്കി system സ്വയം യോജിച്ച height കണക്കാക്കുകയും aspect ratio നിലനിർത്തുകയും ചെയ്യും.

Visual ratio സ്ഥിരമായി വേണമെങ്കിൽ, അല്ലെങ്കിൽ സങ്കീർണ്ണമായ layout-ുകളിൽ ചിത്രം compress ആവാതിരിക്കാൻ width, height രണ്ടും constrain ചെയ്യാം.

### Rounded corners

ചിത്രം rounded corners ഉപയോഗിച്ച് കാണിക്കണമെങ്കിൽ `cornerRadius` modifier ഉപയോഗിക്കാം:

```swift
.cornerRadius(10)
```

ഉദാഹരണത്തിന്:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

`Image` modifiers-ന്റെ അവസാനം `cornerRadius(20)` ചേർക്കുക.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` എന്നത് view-ന്റെ boundary cut ചെയ്ത് `20` radius ഉള്ള rounded corners പ്രയോഗിക്കുന്നു എന്നർത്ഥം.

Rounded corners ചേർത്തതിന് ശേഷം ചിത്രത്തിന്റെ നാല് മൂലകളും arc രൂപത്തിലാകും; അതിനാൽ visual effect കൂടുതൽ സുന്ദരവും ആധുനികവുമായിരിക്കും.

ഇത്തരം design style ഇപ്പോഴത്തെ UI design-ൽ വളരെ സാധാരണമാണ്. ഉദാഹരണത്തിന് iOS app icons rounded rectangle രൂപത്തിലാണ് (എങ്കിലും system icons continuous curvature ഉള്ള superellipse ആണ്, ലളിതമായ corner radius അല്ല).

### വ്യക്തിഗത വിവരങ്ങൾ

ഇപ്പോൾ ചിത്രത്തിന്റെ ഇടതു വശത്ത് വരുന്ന personal information area സൃഷ്ടിക്കാം. UI structure നോക്കിയാൽ, personal information ഉം image ഉം horizontal ആയി ക്രമീകരിച്ചിരിക്കുന്നതായി കാണാം. അതിനാൽ `HStack` വേണം.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Personal information content vertical ആയി ക്രമീകരിക്കപ്പെടുന്നു.

![Swift](../../RESOURCE/004_img11.png)

അതുകൊണ്ട് പുറത്തുള്ളത് `HStack`, personal information-ക്കായി `VStack`, text content-ക്കായി `Text` ഉപയോഗിക്കാം.

അടിസ്ഥാന structure:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Field titles bold ആക്കുക**

Field name-വും field value-വും വേർതിരിക്കാൻ field titles-ന് `fontWeight` നൽകാം:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Text left align ചെയ്യുക**

`VStack` default ആയി centered ആണ്. എല്ലാ text-ഉം left align വേണമെങ്കിൽ alignment നിശ്ചയിക്കണം:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` എന്നത് left alignment ആണ് (left-to-right language environments-ൽ).

![Swift](../../RESOURCE/004_img14.png)

### Spacing

Personal information-നും ചിത്രത്തിനും ഇടയിൽ fixed spacing വേണമെങ്കിൽ മുമ്പ് പഠിച്ച പോലെ `Spacer` ഉപയോഗിച്ച് ഒഴിഞ്ഞിടം നൽകാം:

```swift
Spacer()
    .frame(width: 10)
```

അതുപോലെ `HStack`-ന്റെ `spacing` parameter-ും ഉപയോഗിക്കാം:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` എന്നത് രണ്ടു child views-ക്കിടയിലെ ദൂരം `30 pt` ആണെന്നർത്ഥം.

![Swift](../../RESOURCE/004_img15.png)

**`spacing` എന്താണ്?**

`VStack`, `HStack`, `ZStack` എന്നിവയിൽ `spacing` child views തമ്മിലുള്ള ദൂരം നിയന്ത്രിക്കുന്നു.

ഉദാഹരണത്തിന്:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack`-ലുള്ള child views തമ്മിലുള്ള spacing `10pt` ആക്കും.

![Swift](../../RESOURCE/004_img16.png)

ശ്രദ്ധിക്കേണ്ടത്: `spacing` നേരിട്ട് ഉള്ള child views-ന് മാത്രമേ ബാധകമായുള്ളു; nested containers-ന്റെ ഉള്ളിലെ layout-നെ അത് ബാധിക്കില്ല.

**List-ന്റെ ഉള്ളിലെ spacing നിയന്ത്രിക്കുക**

Fields തമ്മിൽ spacing കൂട്ടണം എങ്കിൽ ഏറ്റവും നേരായ മാർഗം `VStack`-ൽ `spacing` നൽകുന്നതാണ്:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

ഇതിലൂടെ എല്ലാ child views-ക്കിടയിലും `10 pt` spacing ലഭിക്കും.

പക്ഷേ UI നോക്കുമ്പോൾ ഒരു പ്രശ്നം കാണാം:

Field groups തമ്മിലും spacing ഉണ്ട്; അതേ സമയം field name-ക്കും value-ക്കും ഇടയിലും അതേ spacing തന്നെയുണ്ട്.

അതിന് കാരണം `spacing` നിലവിലെ container-ിലെ എല്ലാ direct child views-ക്കും തുല്യമായി ബാധകമാണ്.

ഈ structure-ൽ ഓരോ `Text`-വും outer `VStack`-ന്റെ direct child ആണ്; അതിനാൽ spacing ഒരേപോലെയായിരിക്കും.

Field groups തമ്മിൽ spacing വേണം, പക്ഷേ field name-വും value-വും default compact spacing-ൽ തുടരണമെങ്കിൽ, “field name + field value” എന്നത് ഒരു logical unit ആയി കണക്കാക്കി പുറത്തേക്ക് `VStack` ഉപയോഗിച്ച് wrap ചെയ്യാം:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

ഇപ്പോൾ structure ഇങ്ങനെ മാറും: outer `VStack` തമ്മിൽ spacing ലഭിക്കും, inner `VStack`-ലുള്ള name-വില value ഇടയിൽ default compact spacing തുടരും. അതിനാൽ അനാവശ്യമായ extra gaps ഉണ്ടാകില്ല.

![Swift](../../RESOURCE/004_img18.png)

### വ്യക്തിപരമായ പരിചയം

ഇപ്പോൾ personal introduction area നിർമ്മിക്കാം.

UI structure നോക്കിയാൽ, introduction content ഒന്നിലധികം lines ഉള്ള text ആണെന്നും അത് vertical ആയി ക്രമീകരിച്ചിരിക്കുന്നുവെന്നും കാണാം.

![Swift](../../RESOURCE/004_img19.png)

അതുകൊണ്ട് `VStack` + `Text` ഉപയോഗിക്കാം:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Spacing കൂട്ടുക**

ഇപ്പോൾ personal information ഉം personal introduction ഉം ഒട്ടും വായുസഞ്ചാരമില്ലാത്ത പോലെ തോന്നും; style അത്ര സുന്ദരമല്ല.

![Swift](../../RESOURCE/004_img20.png)

ഇവ രണ്ടും ഒരേ outer container-നുള്ളിലാണെന്നതിനാൽ, overall spacing അവിടെ തന്നെ നിയന്ത്രിക്കാം:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ഫലം:

![Swift](../../RESOURCE/004_img21.png)

**List spacing**

Personal introduction texts തമ്മിലുള്ള spacing നിശ്ചയിക്കാൻ:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### വ്യക്തിഗത റിസ്യൂം പൂർത്തിയാക്കുക

ഇപ്പോൾ നമ്മുടെ വ്യക്തിഗത റിസ്യൂമിന്റെ അടിസ്ഥാന ഘടന പൂർത്തിയായി.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

ഇപ്പോൾ page structure `VStack` ഉപയോഗിച്ചാണ്. Introduction text കുറവായിരിക്കുമ്പോൾ പ്രശ്നമില്ല. പക്ഷേ 20, 30 അല്ലെങ്കിൽ അതിലും കൂടുതൽ texts ചേർത്താൽ content height screen-നെ കവിയും.

ഉദാഹരണത്തിന്:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

അപ്പോൾ രണ്ട് കാര്യങ്ങൾ കാണാം:

- താഴെയുള്ള content cut off ആകുന്നു
- page scroll ചെയ്യാൻ കഴിയുന്നില്ല

ഇത് `VStack`-ന്റെ പ്രശ്നമല്ല. `VStack` ഒരു layout container മാത്രമാണ്; അത് scroll ability സ്വയം നൽകുന്നില്ല.

**`ScrollView` എന്താണ്**

`ScrollView` ഒരു scroll ചെയ്യാവുന്ന container ആണ്; screen size-നെ കവിയുന്ന വലിയ content-ുകൾക്കാണ് ഇത് അനുയോജ്യം. ഉദാഹരണത്തിന് vertical അല്ലെങ്കിൽ horizontal lists.

അടിസ്ഥാന structure:

```swift
ScrollView {
    ...
}
```

Scroll effect വേണമെങ്കിൽ page മുഴുവൻ content-ഉം `ScrollView`-ൽ wrap ചെയ്യണം:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

ഇപ്പോൾ page മുഴുവനും ഒരു scrollable area ആകുന്നു. Content screen height-നെ കവിയുമ്പോൾ അത് സ്വാഭാവികമായി scroll ചെയ്യും.

`ScrollView` default ആയി scrollbar indicator കാണിക്കും. Scrollbar മറയ്ക്കണമെങ്കിൽ:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## പൂർണ്ണ കോഡ്

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
