# മൃഗ വിജ്ഞാനകോശം 

ഈ പാഠത്തിൽ, കസ്റ്റം വ്യൂകളും ഡാറ്റ കൈമാറ്റവും നാം തുടർന്നു അഭ്യസിക്കും.

നാം ഒരു ലളിതമായ മൃഗ വിജ്ഞാനകോശ വ്യൂ നിർമ്മിക്കും. പേജിൽ അഞ്ച് മൃഗങ്ങൾ കാണിക്കും. ഏതെങ്കിലും മൃഗത്തിൽ ക്ലിക്ക് ചെയ്താൽ, ആ മൃഗത്തിന്റെ ചിത്രം, വ്യാപന പ്രദേശം, ആവാസവ്യവസ്ഥ, വിവരണം എന്നിവ കാണിക്കുന്ന ഒരു വിശദാംശ വ്യൂ പോപ്പ് അപ്പ് ചെയ്യും.

ഫലപ്രദർശനം:

![view](../../../Resource/029_view.png)

ഈ ഉദാഹരണത്തിലൂടെ, ഡാറ്റ ഘടന, ലിസ്റ്റ് പ്രദർശനം, ക്ലിക്ക് ഇടപെടൽ, Sheet പോപ്പ്-അപ്പ് വ്യൂ എന്നിവ തമ്മിലുള്ള ഏകോപനം നാം അഭ്യസിക്കാം.

## ചിത്ര സ്രോതസ്സുകൾ തയ്യാറാക്കുക

ആദ്യം, നമുക്ക് അഞ്ച് മൃഗങ്ങളുടെ ചിത്രങ്ങൾ തയ്യാറാക്കണം:

- ഡോൾഫിൻ: `dolphin.jpg`
- ജിറാഫ്: `giraffe.jpg`
- സിംഹം: `lion.jpg`
- പാണ്ട: `panda.jpg`
- ധ്രുവക്കരടി: `polarBear.jpg`

താഴെ കൊടുത്തിരിക്കുന്ന ചിത്ര സ്രോതസ്സുകൾ ഉപയോഗിക്കാം:

[ഡോൾഫിൻ](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [ജിറാഫ്](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [സിംഹം](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [പാണ്ട](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ധ്രുവക്കരടി](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ചിത്രങ്ങൾ ഡൗൺലോഡ് ചെയ്ത ശേഷം, അവ Xcode പ്രോജക്റ്റിലെ `Assets` റിസോഴ്‌സ് ഫോൾഡറിലേക്ക് ഡ്രാഗ് ചെയ്യുക.

![assets](../../../Resource/029_assets.png)

ശ്രദ്ധിക്കുക: കോഡിൽ ചിത്രം ഉപയോഗിക്കുമ്പോൾ സാധാരണയായി `.jpg` സഫിക്സ് എഴുതേണ്ടതില്ല.

ഉദാഹരണത്തിന്, ചിത്ര റിസോഴ്‌സിന്റെ പേര് `dolphin` ആണെങ്കിൽ, കോഡിൽ ഇങ്ങനെ എഴുതുക:

```swift
Image("dolphin")
```

ചിത്രത്തിന്റെ പേര് തെറ്റായി എഴുതിയാൽ, ചിത്രം ശരിയായി കാണിക്കില്ല.

കുറിപ്പ്: മുകളിലുള്ള ചിത്രങ്ങൾ Wikimedia പദ്ധതികളിൽ നിന്നുള്ളവയാണ്. ഉപയോഗിക്കുമ്പോൾ മൂല ചിത്രം ലിങ്കും സ്രോതസ് വിവരവും സൂക്ഷിക്കുന്നത് ശുപാർശ ചെയ്യുന്നു.

## മൃഗത്തിന്റെ ഘടന സൃഷ്ടിക്കുക

ഈ പേജിൽ, ഓരോ മൃഗത്തിനും നിരവധി വിവരങ്ങൾ ഉണ്ട്:

- മൃഗത്തിന്റെ പേര്
- മൃഗത്തിന്റെ ചിത്രം
- മൃഗത്തിന്റെ ഇമോജി
- വ്യാപന പ്രദേശം
- ആവാസവ്യവസ്ഥ
- മൃഗ വിവരണം

ഈ വിവരങ്ങൾ പല വേർതിരിച്ച വേരിയബിളുകളിലായി ചിതറിച്ചാൽ കോഡ് അല്പം കുഴപ്പമാകും. അതിനാൽ, ഒരു മൃഗത്തിന്റെ വിവരങ്ങൾ ഒറ്റിടത്ത് സൂക്ഷിക്കാൻ നമുക്ക് `Animal` എന്നൊരു ഘടന സൃഷ്ടിക്കാം.

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

ഈ കോഡിൽ:

- `id`: മൃഗത്തിന്റെ ഏകീകൃത തിരിച്ചറിയൽ.
- `name`: മൃഗത്തിന്റെ പേര്.
- `imageName`: മൃഗത്തിന്റെ ചിത്രത്തിന്റെ പേര്.
- `avatarEmoji`: മൃഗത്തിന്റെ ഇമോജി.
- `distributionArea`: വ്യാപന പ്രദേശം.
- `habitat`: ആവാസവ്യവസ്ഥ.
- `animalDescription`: മൃഗ വിവരണം.

ഇവയിൽ:

```swift
let id = UUID()
```

ഓരോ മൃഗത്തെയും തിരിച്ചറിയാൻ `id` ഉപയോഗിക്കുന്നു. പിന്നീട് നാം `ForEach` ഉപയോഗിച്ച് മൃഗങ്ങളുടെ ലിസ്റ്റ് കാണിക്കും, കൂടാതെ തിരഞ്ഞെടുത്ത മൃഗത്തെ അടിസ്ഥാനമാക്കി വിശദാംശങ്ങൾ പോപ്പ് അപ്പ് ചെയ്യാൻ `.sheet(item:)` ഉപയോഗിക്കും. അതിനാൽ `Animal` `Identifiable` പ്രോട്ടോക്കോൾ പാലിക്കണം.

`Identifiable` SwiftUI-നോട് പറയുന്നത് ഇതാണ്: ഓരോ മൃഗത്തിനും തിരിച്ചറിയാൻ കഴിയുന്ന ഒരു `id` ഉണ്ട്.

## മൃഗ ഡാറ്റ സൃഷ്ടിക്കുക

അടുത്തതായി, `ContentView`-ൽ നാം ഒരു മൃഗ array സൃഷ്ടിക്കും.

ഈ array-യിൽ അഞ്ച് `Animal` സൂക്ഷിക്കുന്നു. ഓരോ `Animal`-വും ഒരു മൃഗത്തെ സൂചിപ്പിക്കുന്നു.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ഡോൾഫിൻ
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ജിറാഫ്
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // സിംഹം
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // പാണ്ട
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ധ്രുവക്കരടി
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]

    var body: some View {
        Text("Animal Encyclopedia")
    }
}
```

ഇവിടെ `animals` ഒരു array ആണ്:

```swift
let animals: [Animal]
```

`[Animal]` എന്നത് ഈ array-യിൽ നിരവധി `Animal` മൂല്യങ്ങൾ സൂക്ഷിക്കുന്നുവെന്നർത്ഥമാണ്.

അതായത്, `animals` ഒരു മൃഗമല്ല, മൃഗങ്ങളുടെ ഒരു കൂട്ടമാണ്.

## മൃഗങ്ങളുടെ ലിസ്റ്റ് കാണിക്കുക

ഇപ്പോൾ, `ForEach` ഉപയോഗിച്ച് മൃഗങ്ങളുടെ ലിസ്റ്റ് കാണിക്കാം.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
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

പ്രദർശന ഫലം:

![view](../../../Resource/029_view1.png)

ഈ കോഡിൽ:

```swift
ForEach(animals) { animal in
    ...
}
```

ഇത് `animals` array traverse ചെയ്യുന്നു എന്നാണ് അർത്ഥം.

ഓരോ ലൂപ്പിലും, `animal` ഇപ്പോൾ കാണിക്കുന്ന മൃഗത്തെ സൂചിപ്പിക്കുന്നു.

ഉദാഹരണത്തിന്, ആദ്യ ലൂപ്പിൽ `animal` ഡോൾഫിനാണ്; രണ്ടാമത്തെ ലൂപ്പിൽ `animal` ജിറാഫാണ്.

അതിനാൽ, നിലവിലുള്ള മൃഗത്തിന്റെ വിവരങ്ങൾ താഴെ കാണുന്ന രീതിയിൽ കാണിക്കാം:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

ഇങ്ങനെ, അഞ്ച് മൃഗങ്ങളെയും കാണിക്കാൻ കഴിയും.

## മൃഗങ്ങളുടെ ലിസ്റ്റ് ക്ലിക്ക് ചെയ്യാവുന്നതാക്കുക

ഇപ്പോൾ ലിസ്റ്റ് കാണിക്കുന്നു, പക്ഷേ ഇതുവരെ ക്ലിക്ക് ചെയ്യാൻ കഴിയില്ല.

ഒരു മൃഗത്തിൽ ക്ലിക്ക് ചെയ്ത ശേഷം വിശദാംശം പോപ്പ് അപ്പ് ചെയ്യണമെന്ന് ആഗ്രഹിക്കുന്നുവെങ്കിൽ, ആദ്യം “നിലവിൽ തിരഞ്ഞെടുത്ത മൃഗം” രേഖപ്പെടുത്തണം.

അതിനാൽ, `ContentView`-ൽ ഒരു state variable ചേർക്കുക:

```swift
@State private var selectedAnimal: Animal? = nil
```

ഇവിടെ `selectedAnimal` ഒരു optional type ആയ `Animal?` ആണ്.

അതായത്, ഇതിൽ ഒരു മൃഗം ഉണ്ടാകാം, അല്ലെങ്കിൽ ഒന്നും ഇല്ലാതിരിക്കാം.

ഡീഫോൾട്ട് മൂല്യം `nil` ആണ്. അതായത് തുടക്കത്തിൽ ഒരു മൃഗവും തിരഞ്ഞെടുത്തിട്ടില്ല.

ശേഷം, ഓരോ മൃഗ വരിയും `Button` ആക്കി മാറ്റാം:

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
                .cornerRadius(20)
            
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

പ്രധാനപ്പെട്ടത് ഈ കോഡ് വരിയാണ്:

```swift
selectedAnimal = animal
```

ഉപയോക്താവ് ഏതെങ്കിലും മൃഗത്തിൽ ക്ലിക്ക് ചെയ്യുമ്പോൾ, ആ മൃഗത്തെ `selectedAnimal`-ൽ സൂക്ഷിക്കുന്നു.

ഉദാഹരണത്തിന്, ഉപയോക്താവ് ഡോൾഫിനിൽ ക്ലിക്ക് ചെയ്താൽ, `selectedAnimal` ഡോൾഫിനെയാണ് സൂക്ഷിക്കുന്നത്.

ഉപയോക്താവ് പാണ്ടയിൽ ക്ലിക്ക് ചെയ്താൽ, `selectedAnimal` പാണ്ടയെയാണ് സൂക്ഷിക്കുന്നത്.

അതായത്, ഉപയോക്താവ് നിലവിൽ ഏത് മൃഗത്തിൽ ക്ലിക്ക് ചെയ്തുവെന്ന് രേഖപ്പെടുത്താനാണ് `selectedAnimal` ഉപയോഗിക്കുന്നത്.

## Sheet പോപ്പ്-അപ്പ് വ്യൂ

ഇപ്പോൾ Button മുഖേന “നിലവിൽ ക്ലിക്ക് ചെയ്ത മൃഗം” രേഖപ്പെടുത്താൻ നമുക്ക് കഴിഞ്ഞു.

അടുത്തതായി, മൃഗത്തിന്റെ വിശദാംശങ്ങൾ കാണിക്കാൻ ഒരു പോപ്പ്-അപ്പ് വ്യൂ നടപ്പാക്കണം.

![view](../../../Resource/029_view2.png)

SwiftUI-ൽ, ഇത്തരം പോപ്പ്-അപ്പ് ഫലത്തിനായി `Sheet` ഉപയോഗിക്കാം.

`Sheet` താൽക്കാലികമായി പൊങ്ങി വരുന്ന ഒരു പേജായി മനസ്സിലാക്കാം. ഇത് നിലവിലുള്ള പേജിന്റെ മുകളിലേക്ക് കാണിക്കും. ഉള്ളടക്കം കണ്ട ശേഷം ഉപയോക്താവ് താഴേക്ക് സ്വൈപ്പ് ചെയ്ത് അടയ്ക്കാം.

## Sheet ഉദാഹരണം

മൃഗ വിശദാംശം യഥാർത്ഥത്തിൽ കാണിക്കുന്നതിന് മുമ്പ്, `Sheet` എങ്ങനെ പോപ്പ് അപ്പ് ചെയ്യുന്നു എന്ന് ഒരു ലളിതമായ ഉദാഹരണം ഉപയോഗിച്ച് മനസ്സിലാക്കാം.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Show Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet View")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

പ്രദർശന ഫലം:

![view](../../../Resource/029_view3.png)

ഈ കോഡിൽ, നാം ഒരു Boolean മൂല്യം സൃഷ്ടിച്ചു:

```swift
@State private var showSheet = false
```

`showSheet` ഡീഫോൾട്ടായി `false` ആണ്. അതായത് തുടക്കത്തിൽ `Sheet` കാണിക്കില്ല.

ബട്ടണിൽ ക്ലിക്ക് ചെയ്യുമ്പോൾ:

```swift
showSheet.toggle()
```

`toggle()` എന്നത് Boolean മൂല്യം മാറ്റുകയെന്നർത്ഥമാണ്.

മുമ്പ് `false` ആയിരുന്നെങ്കിൽ, `toggle()` വിളിച്ച ശേഷം അത് `true` ആകും.

മുമ്പ് `true` ആയിരുന്നെങ്കിൽ, `toggle()` വിളിച്ച ശേഷം അത് `false` ആകും.

അതിനാൽ, ബട്ടണിൽ ക്ലിക്ക് ചെയ്ത ശേഷം `showSheet` `false`-ൽ നിന്ന് `true` ആകും.

`showSheet` `true` ആകുമ്പോൾ, താഴെയുള്ള കോഡ് `Sheet` പോപ്പ് അപ്പ് ചെയ്യും:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ഈ കോഡ് അർത്ഥമാക്കുന്നത്: `showSheet` `true` ആയിരിക്കുമ്പോൾ ഒരു `Sheet` പോപ്പ് അപ്പ് ചെയ്ത്, അതിൽ `Text("Sheet View")` കാണിക്കുക.

പ്രദർശന ഫലം:

![view](../../../Resource/029_view4.png)

ഈ രീതിയിലുള്ള എഴുത്ത് സ്ഥിരമായ ഉള്ളടക്കം പോപ്പ് അപ്പ് ചെയ്യാൻ അനുയോജ്യമാണ്.

ഉദാഹരണത്തിന്, ബട്ടണിൽ ക്ലിക്ക് ചെയ്ത ശേഷം Settings പേജ്, വിവരണ പേജ്, സൂചന പേജ് എന്നിവ പോപ്പ് അപ്പ് ചെയ്യുക.

### Sheet കാണിക്കുന്ന സ്ഥാനം

`Sheet` ഒരു പോപ്പ്-അപ്പ് വ്യൂ ആണെങ്കിലും, SwiftUI-ൽ അത് `Text()` അല്ലെങ്കിൽ `Image()` പോലെ നേരിട്ട് സ്വതന്ത്രമായ വ്യൂ ആയി എഴുതുന്നതല്ല. പകരം, അത് ഒരു view modifier ആയി ഉപയോഗിക്കുന്നു.

അതായത്, `.sheet(...)` എന്നത് `.font()`, `.padding()`, `.shadow()` പോലുള്ള modifier-കളെപ്പോലെ തന്നെയാണ്; ഇവയെല്ലാം ഏതെങ്കിലും വ്യൂവിന്റെ പിന്നാലെ ചേർക്കണം.

ഉദാഹരണം:

```swift
Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ഈ ഉദാഹരണത്തിൽ, `.sheet` `Button`-ന്റെ പിന്നാലെ ചേർത്തിരിക്കുന്നു.

`showSheet` `true` ആകുമ്പോൾ, SwiftUI `Sheet` പോപ്പ് അപ്പ് ചെയ്ത് ബ്രേസുകളിലുള്ള ഉള്ളടക്കം കാണിക്കും:

```swift
Text("Sheet View")
```

എന്നാൽ യഥാർത്ഥ വികസനത്തിൽ, ഒരു പേജിൽ പല ബട്ടണുകൾ ഉണ്ടെങ്കിൽ സാധാരണയായി ഓരോ ബട്ടണിനും ഓരോ `.sheet` ചേർക്കാറില്ല.

കൂടുതൽ സാധാരണമായ രീതി: `.sheet` പുറം വ്യൂവിന്റെ പിന്നാലെ ചേർക്കുക.

ഉദാഹരണം:

```swift
VStack {
    Button("Show Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ബട്ടൺ `showSheet` മാറ്റുന്നു; പുറം വ്യൂ `showSheet` `true` ആണോ എന്ന് നോക്കി `Sheet` പോപ്പ് അപ്പ് ചെയ്യുന്നു.

## Optional മൂല്യവുമായി Sheet ബന്ധിപ്പിക്കൽ

മുമ്പ് നാം പഠിച്ച എഴുതൽ രീതി ഇതാണ്:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ഈ രീതി ഒരു സ്ഥിര പേജിന്റെ പ്രദർശനവും മറച്ചുവെയ്ക്കലും നിയന്ത്രിക്കാൻ അനുയോജ്യമാണ്.

എന്നാൽ മൃഗ വിജ്ഞാനകോശ ഉദാഹരണത്തിൽ, “`Sheet` പോപ്പ് അപ്പ് ചെയ്യണോ” എന്നത് മാത്രം അറിയുന്നതുകൊണ്ട് മതിയല്ല; “ക്ലിക്ക് ചെയ്തത് ഏത് മൃഗത്തിലാണ്” എന്നും അറിയണം.

ഉദാഹരണം:

ഉപയോക്താവ് ഡോൾഫിനിൽ ക്ലിക്ക് ചെയ്താൽ, `Sheet`-ൽ ഡോൾഫിൻ വിശദാംശം കാണിക്കണം.

ഉപയോക്താവ് പാണ്ടയിൽ ക്ലിക്ക് ചെയ്താൽ, `Sheet`-ൽ പാണ്ട വിശദാംശം കാണിക്കണം.

അതിനാൽ, ഇവിടെ മറ്റൊരു Sheet എഴുത്ത് രീതി ഉപയോഗിക്കുന്നത് കൂടുതൽ അനുയോജ്യമാണ്:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet-ൽ കാണിക്കുന്ന ഉള്ളടക്കം
}
```

ഈ കോഡിൽ, `Sheet` ഒരു optional മൂല്യമായ `selectedAnimal`-നോട് ബന്ധിപ്പിച്ചിരിക്കുന്നു.

ഇവിടെ ശ്രദ്ധിക്കേണ്ടത്, `item:`-ന് ശേഷം എഴുതുന്നത് `$selectedAnimal` ആണ്, `selectedAnimal` അല്ല.

കാരണം `Sheet` `selectedAnimal`-ന്റെ മൂല്യം വായിക്കുന്നതുമാത്രമല്ല, അതിന്റെ മാറ്റങ്ങൾ അനുസരിച്ച് പോപ്പ് അപ്പ് ചെയ്യണമോ എന്നും തീരുമാനിക്കണം.

ഈ കോഡ് ഇങ്ങനെ മനസ്സിലാക്കാം:

- `selectedAnimal` `nil` ആയിരിക്കുമ്പോൾ, `Sheet` കാണിക്കില്ല.
- `selectedAnimal`-ന് മൂല്യം ഉണ്ടെങ്കിൽ, `Sheet` കാണിക്കും.
- `Sheet` അടയ്ക്കുമ്പോൾ, SwiftUI `selectedAnimal` വീണ്ടും `nil` ആക്കും.

`selectedAnimal`-ൽ സൂക്ഷിച്ചിരിക്കുന്ന മൃഗത്തെ SwiftUI ബ്രേസുകളിലുള്ള `animal`-ലേക്ക് കൈമാറും.

അതായത്, `.sheet(item:)` പോപ്പ്-അപ്പ് നിയന്ത്രിക്കുന്നതുമാത്രമല്ല, തിരഞ്ഞെടുത്ത ഡാറ്റയെ `Sheet`-ലേക്ക് കൈമാറുകയും ചെയ്യുന്നു.

## Sheet ഉപയോഗിച്ച് മൃഗത്തിന്റെ പേര് കാണിക്കുക

ഇപ്പോൾ, സങ്കീർണ്ണമായ വിശദാംശ വ്യൂ ഉടൻ സൃഷ്ടിക്കേണ്ടതില്ല.

കോഡ് കൂടുതൽ എളുപ്പത്തിൽ മനസ്സിലാക്കാൻ, ആദ്യം `Sheet`-ൽ നിലവിലുള്ള മൃഗത്തിന്റെ പേര് മാത്രം കാണിക്കാം.

`VStack`-ന്റെ പുറത്ത് `.sheet(item:)` ചേർക്കുക:

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
                        .cornerRadius(20)
                    
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

ഇവിടെ ഏറ്റവും പ്രധാനപ്പെട്ടത് ഈ കോഡാണ്:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal`-ന് മൂല്യം ഉണ്ടായാൽ, `Sheet` പോപ്പ് അപ്പ് ചെയ്യും.

ബ്രേസുകളിലുള്ള `animal` തന്നെയാണ് നിലവിൽ തിരഞ്ഞെടുത്ത മൃഗം.

അതിനാൽ:

```swift
Text(animal.name)
```

നിലവിൽ ക്ലിക്ക് ചെയ്ത മൃഗത്തിന്റെ പേര് കാണിക്കും.

ഉദാഹരണത്തിന്, `Dolphin`-ൽ ക്ലിക്ക് ചെയ്താൽ, Sheet-ൽ `Dolphin` കാണിക്കും.

`Panda`-യിൽ ക്ലിക്ക് ചെയ്താൽ, `Sheet`-ൽ `Panda` കാണിക്കും.

ഇങ്ങനെ, വ്യത്യസ്ത മൃഗങ്ങളിൽ ക്ലിക്ക് ചെയ്താൽ വ്യത്യസ്ത മൃഗങ്ങളുടെ പേര് പോപ്പ് അപ്പ് ചെയ്യുന്ന ഫലം നാം നേടിയെടുത്തു.

മൃഗത്തിന്റെ പേര് കാണിക്കൽ:

![view](../../../Resource/029_view5.png)

എന്നാൽ മൃഗ വിശദാംശത്തിൽ ഒരു പേര് മാത്രം കാണിക്കരുത്; പേര്, വ്യാപന പ്രദേശം, ആവാസവ്യവസ്ഥ, വിവരണം എന്നിവയും കാണിക്കണം.

ഈ കോഡുകൾ എല്ലാം `.sheet`-നുള്ളിൽ എഴുതിയാൽ, കോഡ് വളരെ നീളുകയും വായിക്കാൻ ബുദ്ധിമുട്ടാകുകയും ചെയ്യും.

അതിനാൽ, അടുത്തതായി മൃഗ വിശദാംശങ്ങൾ കാണിക്കാൻ മാത്രം ഉത്തരവാദിയായ ഒരു പുതിയ കസ്റ്റം വ്യൂ സൃഷ്ടിക്കാം.

## മൃഗ വിശദാംശ വ്യൂ സൃഷ്ടിക്കുക

അടുത്തതായി, `AnimalDetailView` എന്ന പുതിയ കസ്റ്റം വ്യൂ സൃഷ്ടിക്കാം.

ഈ വ്യൂ ഒരു `Animal` സ്വീകരിക്കുകയും മൃഗത്തിന്റെ വിശദാംശങ്ങൾ കാണിക്കുകയും ചെയ്യുന്നു.

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
                    Text("**Distribution Area** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** ：\(animal.habitat)")

                    Divider()

                    Text("**Animal Description** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

പ്രദർശന ഫലം:

![view](../../../Resource/029_view2.png)

ഇവിടെ ശ്രദ്ധിക്കേണ്ടത്:

```swift
var animal: Animal
```

ഇത് `AnimalDetailView` പുറത്തുനിന്ന് ഒരു മൃഗം സ്വീകരിക്കണം എന്നർത്ഥമാണ്.

മൃഗത്തെ സ്വീകരിച്ച ശേഷം, വിശദാംശ വ്യൂ ആ മൃഗത്തിന്റെ വിവിധ വിവരങ്ങൾ ഉപയോഗിക്കാം:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

അതായത്, കൈമാറിയ മൃഗത്തെ കാണിക്കുകയാണ് `AnimalDetailView`-ന്റെ ഏക ഉത്തരവാദിത്തം.

### Markdown ബോൾഡ് എഴുത്ത്

വിശദാംശ വ്യൂവിൽ നാം ഇത്തരത്തിലുള്ള കോഡ് എഴുതിയിട്ടുണ്ട്:

```swift
Text("**Habitat:** \(animal.habitat)")
```

ഇവിടെ രണ്ട് കാര്യങ്ങളുണ്ട്.

ഒന്നാമത്, `**Habitat:**` `Markdown` syntax ഉപയോഗിക്കുന്നു. രണ്ട് നക്ഷത്ര ചിഹ്നങ്ങൾക്കിടയിലെ വാചകം ബോൾഡായി കാണിക്കും.

രണ്ടാമത്, `\()` string interpolation ആണ്; variable-ന്റെ മൂല്യം എഴുത്തിനുള്ളിൽ കാണിക്കാൻ ഇതു സഹായിക്കുന്നു.

ഈ കോഡ് ആദ്യം ബോൾഡായ `Habitat:` കാണിച്ച്, തുടർന്ന് ആ മൃഗത്തിന്റെ ആവാസവ്യവസ്ഥ കാണിക്കുന്നു.

## Sheet-ൽ വിശദാംശ വ്യൂ കാണിക്കുക

`AnimalDetailView` സൃഷ്ടിച്ചതിനുശേഷം, `ContentView`-ലേക്ക് തിരികെ പോയി, `Sheet`-ലുണ്ടായിരുന്ന പഴയ പേര് വ്യൂവിനെ വിശദാംശ വ്യൂവായി മാറ്റാം.

മുൻപ് ഇങ്ങനെ ആയിരുന്നു:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ഇപ്പോൾ ഇങ്ങനെ മാറ്റാം:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ഇവിടെ `animal:` എന്നത് `AnimalDetailView`-ന്റെ parameter പേരാണ്.

പിന്നിലെ `animal` `.sheet(item:)` വഴി കൈമാറിയ നിലവിലുള്ള മൃഗമാണ്.

അതായത്, ഇപ്പോൾ ക്ലിക്ക് ചെയ്ത മൃഗത്തെ `AnimalDetailView`-ലേക്ക് കൈമാറി കാണിക്കുന്നു.

പൂർണ്ണ ഘടന:

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
                        .cornerRadius(20)
                    
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

ഉപയോക്താവ് മൃഗത്തിൽ ക്ലിക്ക് ചെയ്യുമ്പോൾ:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil`-ൽ നിന്ന് ഒരു നിർദ്ദിഷ്ട മൃഗമായി മാറുന്നു. `selectedAnimal`-ന് മൂല്യം ഉണ്ടെന്ന് `Sheet` കണ്ടെത്തിയാൽ, വ്യൂ പോപ്പ് അപ്പ് ചെയ്യും.

`Sheet` `selectedAnimal`-ലുള്ള മൃഗത്തെ `AnimalDetailView` വ്യൂവിലേക്ക് കൈമാറുന്നു; `AnimalDetailView` മൃഗത്തിന്റെ വിശദാംശങ്ങൾ കാണിക്കുന്നു.

ഇങ്ങനെ, മൃഗ ലിസ്റ്റിൽ ക്ലിക്ക് ചെയ്താൽ ബന്ധപ്പെട്ട മൃഗ വിശദാംശം പോപ്പ് അപ്പ് ചെയ്യുന്ന ഫംഗ്ഷൻ നാം നടപ്പാക്കി.

## Sheet എഴുതുന്ന രണ്ട് രീതികളുടെ വ്യത്യാസം

ഇപ്പോൾ, `.sheet(item:)` ഉപയോഗിച്ച് മൃഗ വിശദാംശ വ്യൂയുടെ പ്രദർശനം പൂർത്തിയാക്കി.

ഇവിടെ `Sheet`-ന്റെ രണ്ട് സാധാരണ എഴുതൽ രീതികൾ ചുരുക്കി നോക്കാം.

### ഒന്നാമത്തെ രീതി Boolean മൂല്യവുമായി ബന്ധിപ്പിക്കൽ

```swift
@State private var showSheet = false

Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ഈ രീതി സ്ഥിര ഉള്ളടക്കം പോപ്പ് അപ്പ് ചെയ്യാൻ അനുയോജ്യമാണ്, ഉദാഹരണത്തിന് Settings പേജ്, വിശദീകരണ പേജ്, സൂചന പേജ് മുതലായവ.

`showSheet` ഒരു Boolean മൂല്യമാണ്; അതിന് `true`, `false` എന്നീ രണ്ട് നിലകൾ മാത്രമേ ഉണ്ടാകൂ.

`showSheet` `true` ആയിരിക്കുമ്പോൾ, `Sheet` കാണിക്കും.

`showSheet` `false` ആയിരിക്കുമ്പോൾ, `Sheet` കാണിക്കില്ല.

### രണ്ടാമത്തെ രീതി Optional മൂല്യവുമായി ബന്ധിപ്പിക്കൽ

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

തിരഞ്ഞെടുത്ത ഡാറ്റയെ അടിസ്ഥാനമാക്കി വ്യത്യസ്ത ഉള്ളടക്കം പോപ്പ് അപ്പ് ചെയ്യാൻ ഈ രീതി അനുയോജ്യമാണ്.

ഈ പാഠത്തിൽ, നാം വ്യത്യസ്ത മൃഗങ്ങളിൽ ക്ലിക്ക് ചെയ്യുമ്പോൾ വ്യത്യസ്ത മൃഗങ്ങളുടെ വിശദാംശം കാണിക്കണം. അതിനാൽ `.sheet(item:)` ഉപയോഗിക്കുന്നത് കൂടുതൽ അനുയോജ്യമാണ്.

## പൂർണ്ണ കോഡ്

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // മൃഗത്തിന്റെ പേര്
    let name: String
    
    // മൃഗത്തിന്റെ ചിത്രം
    let imageName: String
    
    // മൃഗത്തിന്റെ ലേബൽ ഇമോജി
    let avatarEmoji: String
    
    // വ്യാപന പ്രദേശം
    let distributionArea: String
    
    // ആവാസവ്യവസ്ഥ
    let habitat: String
    
    // മൃഗ വിവരണം
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ഡോൾഫിൻ
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ജിറാഫ്
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // സിംഹം
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // പാണ്ട
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ധ്രുവക്കരടി
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
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
                            .cornerRadius(20)

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
                    Text("**Distribution Area** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Animal Description** ：\(animal.animalDescription)")
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

## സംഗ്രഹം

ഈ പാഠത്തിൽ ഒരു ലളിതമായ മൃഗ വിജ്ഞാനകോശ പേജ് പൂർത്തിയാക്കി.

ആദ്യം `Animal` ഘടന ഉപയോഗിച്ച് മൃഗ വിവരങ്ങൾ സൂക്ഷിച്ചു, തുടർന്ന് array ഉപയോഗിച്ച് അഞ്ച് മൃഗങ്ങളെ സൂക്ഷിച്ചു, പിന്നെ `ForEach` ഉപയോഗിച്ച് മൃഗങ്ങളുടെ ലിസ്റ്റ് കാണിച്ചു.

ഉപയോക്താവ് ഏതെങ്കിലും മൃഗത്തിൽ ക്ലിക്ക് ചെയ്യുമ്പോൾ, ആ മൃഗത്തെ `selectedAnimal`-ൽ സൂക്ഷിക്കുന്നു:

```swift
selectedAnimal = animal
```

`selectedAnimal`-ന് മൂല്യം ഉണ്ടാകുമ്പോൾ, `.sheet(item:)` വിശദാംശ വ്യൂ പോപ്പ് അപ്പ് ചെയ്ത് തിരഞ്ഞെടുത്ത മൃഗത്തെ `AnimalDetailView`-ലേക്ക് കൈമാറും.

ഈ പാഠത്തിലെ ഏറ്റവും പ്രധാനപ്പെട്ടത് UI ശൈലിയല്ല; താഴെ കാണുന്ന ഡാറ്റ കൈമാറ്റ പാത മനസ്സിലാക്കുന്നതാണ്:

```swift
മൃഗത്തിൽ ക്ലിക്ക് ചെയ്യുക → selectedAnimal മൃഗം സൂക്ഷിക്കുന്നു → Sheet പോപ്പ് അപ്പ് ചെയ്യുന്നു → AnimalDetailView വിശദാംശം കാണിക്കുന്നു
```

ഈ പാത മനസ്സിലാക്കിയ ശേഷം, പിന്നീടു കൂടുതൽ സമാന ഫംഗ്ഷനുകൾ നിർമ്മിക്കാം. ഉദാഹരണത്തിന് ഉൽപ്പന്ന വിശദാംശം, കോഴ്സ് വിശദാംശം, ലേഖന വിശദാംശം, കോൺടാക്റ്റ് വിശദാംശം തുടങ്ങിയവ.
