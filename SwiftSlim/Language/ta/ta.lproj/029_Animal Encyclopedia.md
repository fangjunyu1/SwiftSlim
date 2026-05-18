# விலங்கு கலைக்களஞ்சியம்

இந்தப் பாடத்தில், தனிப்பயன் View மற்றும் தரவு பரிமாற்றத்தை தொடர்ந்து பயிற்சி செய்வோம்.

நாம் ஒரு எளிய விலங்கு கலைக்களஞ்சிய View உருவாக்கப் போகிறோம். பக்கத்தில் ஐந்து விலங்குகள் காட்டப்படும். ஒரு விலங்கைத் தட்டும்போது, ஒரு விவர View பாப் அப் ஆகி, அந்த விலங்கின் படம், பரவல் பகுதி, வாழ்விடம் மற்றும் விளக்கத்தை காட்டும்.

இறுதி விளைவு:

![view](../../../Resource/029_view.png)

இந்த எடுத்துக்காட்டின் மூலம், தரவு அமைப்பு, பட்டியல் காட்டுதல், தட்டும் செயல்பாடு மற்றும் Sheet பாப் அப் View ஆகியவை எப்படி ஒன்றுடன் ஒன்று சேர்ந்து செயல்படுகின்றன என்பதைப் பயிற்சி செய்யலாம்.

## பட வளங்களைத் தயாரித்தல்

முதலில், ஐந்து விலங்கு படங்களைத் தயாரிக்க வேண்டும்:

- டால்பின்: `dolphin.jpg`
- ஒட்டகச்சிவிங்கி: `giraffe.jpg`
- சிங்கம்: `lion.jpg`
- பாண்டா: `panda.jpg`
- துருவக் கரடி: `polarBear.jpg`

கீழே உள்ள பட வளங்களைப் பயன்படுத்தலாம்:

[டால்பின்](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[ஒட்டகச்சிவிங்கி](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[சிங்கம்](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[பாண்டா](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[துருவக் கரடி](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

படங்களைப் பதிவிறக்கிய பிறகு, அவற்றை Xcode திட்டத்தின் `Assets` வளக் கோப்புறைக்குள் இழுத்து விடுங்கள்.

![assets](../../../Resource/029_assets.png)

கவனிக்க வேண்டியது: குறியீட்டில் படங்களைப் பயன்படுத்தும்போது பொதுவாக `.jpg` பின்னொட்டைப் எழுத வேண்டியதில்லை.

உதாரணமாக, பட வளத்தின் பெயர் `dolphin` என்றால், குறியீட்டில் இவ்வாறு எழுதலாம்:

```swift
Image("dolphin")
```

படத்தின் பெயர் தவறாக எழுதப்பட்டால், படம் சரியாக காட்டப்படாது.

குறிப்பு: மேலுள்ள பட வளங்கள் விக்கிமீடியா திட்டத்திலிருந்து வந்தவை. பயன்படுத்தும்போது மூலப் பட இணைப்பையும் மூலத் தகவலையும் வைத்திருப்பது பரிந்துரைக்கப்படுகிறது.

## விலங்கு அமைப்பை உருவாக்குதல்

இந்தப் பக்கத்தில், ஒவ்வொரு விலங்குக்கும் பல தகவல்கள் உள்ளன:

- விலங்கின் பெயர்
- விலங்கின் படம்
- விலங்கு எமோஜி
- பரவல் பகுதி
- வாழ்விடம்
- விலங்கு விளக்கம்

இந்த தகவல்களை பல தனி மாறிகளாகப் பிரித்துவிட்டால், குறியீடு சீரற்றதாகிவிடும். எனவே, ஒரு விலங்கின் தகவல்களை ஒன்றாக வைத்திருக்க `Animal` என்ற struct-ஐ உருவாக்கலாம்.

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

இந்தக் குறியீட்டில்:

- `id`: விலங்கின் தனித்த அடையாளம்.
- `name`: விலங்கின் பெயர்.
- `imageName`: விலங்கு படத்தின் பெயர்.
- `avatarEmoji`: விலங்கு எமோஜி.
- `distributionArea`: பரவல் பகுதி.
- `habitat`: வாழ்விடம்.
- `animalDescription`: விலங்கு விளக்கம்.

அதில்:

```swift
let id = UUID()
```

ஒவ்வொரு விலங்கையும் அடையாளம் காண `id` பயன்படுத்தப்படுகிறது. பின்னர் `ForEach` மூலம் விலங்கு பட்டியலைக் காட்டப் போகிறோம்; மேலும் `.sheet(item:)` மூலம் தேர்ந்தெடுக்கப்பட்ட விலங்கின் அடிப்படையில் விவர View-ஐ பாப் அப் செய்யப் போகிறோம். அதனால் `Animal` `Identifiable` protocol-ஐ பின்பற்ற வேண்டும்.

`Identifiable` இன் பணி SwiftUI-க்கு இதைச் சொல்வது: ஒவ்வொரு விலங்குக்கும் வேறுபடுத்திக் காட்டக்கூடிய ஒரு `id` உள்ளது.

## விலங்கு தரவை உருவாக்குதல்

அடுத்து, `ContentView`-இல் ஒரு விலங்கு array உருவாக்குகிறோம்.

இந்த array-இல் ஐந்து `Animal` சேமிக்கப்படும். ஒவ்வொரு `Animal`-மும் ஒரு விலங்கைக் குறிக்கும்.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // டால்பின்
        Animal(
            name: "டால்பின்",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "உலகம் முழுவதும் உள்ள சூடான மற்றும் மிதவெப்பக் கடல்கள்.",
            habitat: "கடல்கள், கடலோர நீர்ப்பகுதிகள் மற்றும் சில பெரிய ஆறுகள்.",
            animalDescription: "டால்பின்கள் புத்திசாலியான கடல் பாலூட்டிகள். அவை குழுக்களாக வாழ்கின்றன, ஒலிகளால் தொடர்பு கொள்கின்றன, மேலும் விளையாட்டுத்தனமான நடத்தைக்காக அறியப்படுகின்றன."
        ),
        // ஒட்டகச்சிவிங்கி
        Animal(
            name: "ஒட்டகச்சிவிங்கி",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ஆப்ரிக்காவின் சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            habitat: "புல்வெளிகள், சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            animalDescription: "ஒட்டகச்சிவிங்கிகள் நிலத்தில் வாழும் மிக உயரமான விலங்குகள். அவற்றுக்கு நீண்ட கழுத்தும் நீண்ட கால்களும் உள்ளன; பொதுவாக உயரமான மரங்களின் இலைகளை உண்கின்றன."
        ),
        // சிங்கம்
        Animal(
            name: "சிங்கம்",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "முக்கியமாக சஹாராவின் தெற்குப் பகுதி ஆப்ரிக்காவில் காணப்படுகிறது; மேற்கு இந்தியாவில் ஒரு சிறிய தொகையும் உள்ளது.",
            habitat: "புல்வெளிகள், சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            animalDescription: "சிங்கங்கள் வலிமையான பெரிய பூனைகள். அவை பொதுவாக pride எனப்படும் குழுக்களாக வாழ்கின்றன; விலங்கு உலகின் ராஜாக்கள் என்றும் அறியப்படுகின்றன."
        ),
        // பாண்டா
        Animal(
            name: "பாண்டா",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "மத்திய சீனாவின் மலைக் காடுகள்.",
            habitat: "குளிர்ச்சியும் ஈரப்பதமும் உள்ள மலைப்பகுதிகளில் உள்ள மூங்கில் காடுகள்.",
            animalDescription: "பாண்டாக்கள் கருப்பு-வெள்ளை ரோமத்திற்காக அறியப்படும் கரடிகள். அவை பெரும்பாலும் மூங்கிலை உண்கின்றன; உலகில் எளிதாக அடையாளம் காணப்படும் விலங்குகளில் ஒன்றாகும்."
        ),
        // துருவக் கரடி
        Animal(
            name: "துருவக் கரடி",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "வட துருவத்தைச் சுற்றிய ஆர்க்டிக் பகுதிகள்.",
            habitat: "கடல் பனி, கடலோர பகுதிகள் மற்றும் குளிரான ஆர்க்டிக் சூழல்கள்.",
            animalDescription: "துருவக் கரடிகள் குளிரான சூழலுக்கு ஏற்ப மாறிய பெரிய கரடிகள். அவை திறமையான நீந்திகள்; சீல்களை வேட்டையாட கடல் பனியை பெரிதும் சார்ந்திருக்கின்றன."
        )
    ]

    var body: some View {
        Text("விலங்கு கலைக்களஞ்சியம்")
    }
}
```

இங்குள்ள `animals` ஒரு array:

```swift
let animals: [Animal]
```

`[Animal]` என்பது இந்த array-இல் பல `Animal` மதிப்புகள் சேமிக்கப்படுகின்றன என்பதைக் குறிக்கும்.

அதாவது, `animals` ஒரு விலங்கு அல்ல; அது விலங்குகளின் ஒரு குழு.

## விலங்கு பட்டியலைக் காட்டுதல்

இப்போது, `ForEach` பயன்படுத்தி விலங்கு பட்டியலைக் காட்டலாம்.

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

காட்சி விளைவு:

![view](../../../Resource/029_view1.png)

இந்தக் குறியீட்டில்:

```swift
ForEach(animals) { animal in
    ...
}
```

இது `animals` array-ஐ traverse செய்கிறது என்பதைக் குறிக்கும்.

ஒவ்வொரு loop-இலும், `animal` என்பது தற்போது காட்டப்படும் அந்த விலங்கை குறிக்கும்.

உதாரணமாக, முதல் loop-இல் `animal` என்பது டால்பின்; இரண்டாவது loop-இல் `animal` என்பது ஒட்டகச்சிவிங்கி.

ஆகவே, கீழ்க்கண்ட முறையில் தற்போதைய விலங்கின் தகவலைக் காட்டலாம்:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

இவ்வாறு ஐந்து விலங்குகளையும் காட்டலாம்.

## விலங்கு பட்டியலைத் தட்டக்கூடியதாக மாற்றுதல்

இப்போது பட்டியல் காட்டப்படுகிறது, ஆனால் இன்னும் தட்ட முடியாது.

ஒரு விலங்கைக் தட்டிய பிறகு விவரம் பாப் அப் ஆக வேண்டும் என்றால், முதலில் “தற்போது தேர்ந்தெடுக்கப்பட்ட விலங்கு” என்பதை பதிவு செய்ய வேண்டும்.

அதனால், `ContentView`-இல் ஒரு state variable சேர்க்கிறோம்:

```swift
@State private var selectedAnimal: Animal? = nil
```

இங்குள்ள `selectedAnimal` என்பது `Animal?` என்ற optional value வகை.

அதாவது, அதில் ஒரு விலங்கு இருக்கலாம்; இல்லாமலும் இருக்கலாம்.

இயல்புநிலை `nil`; அதாவது ஆரம்பத்தில் எந்த விலங்கும் தேர்ந்தெடுக்கப்படவில்லை.

பிறகு, ஒவ்வொரு விலங்கு row-வையும் `Button` ஆக மாற்றுகிறோம்:

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

முக்கியமானது இந்தக் குறியீட்டு வரி:

```swift
selectedAnimal = animal
```

பயனர் ஒரு விலங்கைக் தட்டும் போது, அந்த விலங்கை `selectedAnimal`-இல் சேமிக்கிறோம்.

உதாரணமாக, பயனர் டால்பினைத் தட்டினால், `selectedAnimal`-இல் டால்பின் சேமிக்கப்படும்.

பயனர் பாண்டாவைத் தட்டினால், `selectedAnimal`-இல் பாண்டா சேமிக்கப்படும்.

அதாவது, பயனர் தற்போது தட்டியது எந்த விலங்கு என்பதை பதிவு செய்ய `selectedAnimal` பயன்படுத்தப்படுகிறது.

## Sheet பாப் அப் View

இப்போது button மூலம் “தற்போது தட்டப்பட்ட விலங்கு” என்பதை பதிவு செய்ய முடிகிறது.

அடுத்ததாக, விலங்கு விவரத்தைக் காட்ட ஒரு பாப் அப் View உருவாக்க வேண்டும்.

![view](../../../Resource/029_view2.png)

SwiftUI-இல், இத்தகைய பாப் அப் விளைவை உருவாக்க `Sheet` பயன்படுத்தலாம்.

`Sheet`-ஐ தற்காலிகமாக பாப் அப் ஆகும் ஒரு பக்கமாகப் புரிந்துகொள்ளலாம். அது தற்போதைய பக்கத்தின் மேல் தோன்றும்; பயனர் உள்ளடக்கத்தைப் பார்த்த பிறகு கீழே இழுத்து மூடலாம்.

## Sheet எடுத்துக்காட்டு

உண்மையில் விலங்கு விவரத்தைக் காட்டுவதற்கு முன், `Sheet` எவ்வாறு பாப் அப் ஆகிறது என்பதை ஒரு எளிய எடுத்துக்காட்டில் புரிந்துகொள்வோம்.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet காட்டு")
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

காட்சி விளைவு:

![view](../../../Resource/029_view3.png)

இந்தக் குறியீட்டில், நாம் ஒரு Boolean value உருவாக்குகிறோம்:

```swift
@State private var showSheet = false
```

`showSheet` இயல்பாக `false`; அதாவது ஆரம்பத்தில் `Sheet` காட்டப்படாது.

button-ஐ தட்டும் போது:

```swift
showSheet.toggle()
```

`toggle()` என்பது Boolean value-ஐ மாற்றுவது.

முந்தைய மதிப்பு `false` என்றால், `toggle()` அழைத்த பிறகு அது `true` ஆகும்.

முந்தைய மதிப்பு `true` என்றால், `toggle()` அழைத்த பிறகு அது `false` ஆகும்.

ஆகவே, button-ஐ தட்டிய பிறகு, `showSheet` `false`-இலிருந்து `true` ஆக மாறும்.

`showSheet` `true` ஆக மாறும்போது, கீழுள்ள குறியீடு `Sheet`-ஐ பாப் அப் செய்யும்:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

இந்தக் குறியீடு இதைக் குறிக்கும்: `showSheet` `true` ஆக இருக்கும் போது, ஒரு `Sheet` பாப் அப் ஆகும்; அந்த `Sheet`-இல் `Text("Sheet View")` காட்டப்படும்.

காட்சி விளைவு:

![view](../../../Resource/029_view4.png)

இந்த எழுதும் முறை நிலையான உள்ளடக்கத்தை பாப் அப் செய்ய ஏற்றது.

உதாரணமாக, button-ஐ தட்டிய பிறகு அமைப்புப் பக்கம், விளக்கப் பக்கம், அறிவிப்பு பக்கம் போன்றவை பாப் அப் ஆகலாம்.

### Sheet காட்டப்படும் இடம்

`Sheet` ஒரு பாப் அப் View என்றாலும், SwiftUI-இல் அது `Text()` அல்லது `Image()` போல தனி View ஆக நேரடியாக எழுதப்படுவதில்லை; அது ஒரு view modifier ஆகப் பயன்படுத்தப்படுகிறது.

அதாவது, `.sheet(...)` என்பது `.font()`, `.padding()`, `.shadow()` போன்ற modifiers போலவே, ஏதாவது ஒரு View-க்கு பின்னால் சேர்க்கப்பட வேண்டும்.

உதாரணமாக:

```swift
Button("Sheet காட்டு") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

இந்த எடுத்துக்காட்டில், `.sheet` `Button`-க்கு பின்னால் சேர்க்கப்பட்டுள்ளது.

`showSheet` `true` ஆக மாறும் போது, SwiftUI `Sheet`-ஐ பாப் அப் செய்து, braces-க்குள் உள்ள உள்ளடக்கத்தை காட்டும்:

```swift
Text("Sheet View")
```

ஆனால், நடைமுறை development-இல், ஒரு பக்கத்தில் பல buttons இருந்தால், பொதுவாக ஒவ்வொரு button-க்கும் ஒரு `.sheet` சேர்க்கப்படாது.

அதிகம் பயன்படுத்தப்படும் முறை: `.sheet`-ஐ வெளிப்புற View-க்கு பின்னால் சேர்ப்பது.

உதாரணமாக:

```swift
VStack {
    Button("Sheet காட்டு") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

button `showSheet`-ஐ மாற்றும் பொறுப்பை ஏற்கிறது; வெளிப்புற View, `showSheet` `true` ஆக உள்ளதா என்பதைப் பார்த்து `Sheet`-ஐ பாப் அப் செய்யும் பொறுப்பை ஏற்கிறது.

## optional value binding Sheet

முன்பு நாம் கற்ற எழுதும் முறை:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

இந்த முறை ஒரு நிலையான பக்கத்தின் காட்டுதல் மற்றும் மறைத்தலைக் கட்டுப்படுத்த ஏற்றது.

ஆனால் விலங்கு கலைக்களஞ்சிய எடுத்துக்காட்டில், “`Sheet` பாப் அப் ஆக வேண்டுமா” என்பதை மட்டும் அறிந்தால் போதாது; “எந்த விலங்கு தட்டப்பட்டது” என்பதையும் அறிய வேண்டும்.

உதாரணமாக:

பயனர் டால்பினைத் தட்டினால், `Sheet`-இல் டால்பின் விவரம் காட்டப்பட வேண்டும்.

பயனர் பாண்டாவைத் தட்டினால், `Sheet`-இல் பாண்டா விவரம் காட்டப்பட வேண்டும்.

எனவே, இங்கு மற்றொரு Sheet எழுதும் முறை அதிகம் பொருத்தமானது:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet-இல் காட்டப்படும் உள்ளடக்கம்
}
```

இந்தக் குறியீட்டில், `Sheet` ஒரு optional value `selectedAnimal`-க்கு bind செய்யப்பட்டுள்ளது.

இங்கு கவனிக்க வேண்டியது: `item:`-க்கு பின்னால் எழுதப்படுவது `$selectedAnimal`; `selectedAnimal` அல்ல.

ஏனெனில் `Sheet` `selectedAnimal` மதிப்பை மட்டும் வாசிப்பதில்லை; அதன் மாற்றங்களின் அடிப்படையில் பாப் அப் செய்ய வேண்டுமா என்றும் தீர்மானிக்க வேண்டும்.

இந்தக் குறியீட்டை இவ்வாறு புரிந்துகொள்ளலாம்:

- `selectedAnimal` `nil` ஆக இருக்கும்போது, `Sheet` காட்டப்படாது.
- `selectedAnimal`-க்கு மதிப்பு இருக்கும் போது, `Sheet` காட்டப்படும்.
- `Sheet` மூடப்படும் போது, SwiftUI `selectedAnimal`-ஐ மீண்டும் `nil` ஆக மாற்றும்.

SwiftUI, `selectedAnimal`-இல் சேமிக்கப்பட்ட விலங்கை braces-க்குள் உள்ள `animal`-க்கு அனுப்பும்.

அதாவது, `.sheet(item:)` பாப் அப் கட்டுப்பாட்டை மட்டும் செய்யாது; தேர்ந்தெடுக்கப்பட்ட தரவையும் `Sheet`-க்குள் அனுப்பும்.

## Sheet மூலம் விலங்கு பெயரை காட்டுதல்

இப்போது, உடனே சிக்கலான விவர View உருவாக்க வேண்டாம்.

குறியீட்டை எளிதாகப் புரிந்துகொள்ள, முதலில் `Sheet`-இல் தற்போதைய விலங்கின் பெயரை மட்டும் காட்டுவோம்.

`VStack`-க்கு வெளியே `.sheet(item:)` சேர்க்கவும்:

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

இங்கு மிக முக்கியமானது இந்தக் குறியீடு:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal`-க்கு மதிப்பு இருக்கும் போது, `Sheet` பாப் அப் ஆகும்.

braces-க்குள் உள்ள `animal` தான் தற்போது தேர்ந்தெடுக்கப்பட்ட விலங்கு.

ஆகவே:

```swift
Text(animal.name)
```

தற்போது தட்டப்பட்ட விலங்கின் பெயரை காட்டும்.

உதாரணமாக, `டால்பின்` தட்டினால், Sheet-இல் `டால்பின்` காட்டப்படும்.

`பாண்டா` தட்டினால், `Sheet`-இல் `பாண்டா` காட்டப்படும்.

இவ்வாறு, வெவ்வேறு விலங்குகளைத் தட்டும் போது வெவ்வேறு விலங்கு பெயர்கள் பாப் அப் ஆகும் விளைவை உருவாக்கிவிட்டோம்.

விலங்கு பெயரை காட்டுதல்:

![view](../../../Resource/029_view5.png)

ஆனால், விலங்கு விவரம் ஒரு பெயரால் மட்டும் முடிவதில்லை; பெயர், பரவல் பகுதி, வாழ்விடம் மற்றும் விளக்கம் ஆகியவற்றையும் காட்ட வேண்டும்.

இந்தக் குறியீடுகளை எல்லாம் `.sheet`-க்குள் எழுதினால், குறியீடு மிகவும் நீளமாகி வாசிக்க சிரமமாகும்.

எனவே, அடுத்ததாக விலங்கு விவரத்தை மட்டும் காட்டும் புதிய தனிப்பயன் View ஒன்றை உருவாக்குவோம்.

## விலங்கு விவர View உருவாக்குதல்

அடுத்ததாக, `AnimalDetailView` என்ற புதிய தனிப்பயன் View உருவாக்குகிறோம்.

இந்த View ஒரு `Animal`-ஐப் பெறும்; பின்னர் விலங்கு விவரத்தை காட்டும்.

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
                    Text("**பரவல் பகுதி**: \(animal.distributionArea)")

                    Divider()

                    Text("**வாழ்விடம்**: \(animal.habitat)")

                    Divider()

                    Text("**விலங்கு விளக்கம்**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

காட்சி விளைவு:

![view](../../../Resource/029_view2.png)

இங்கு முக்கியமானது:

```swift
var animal: Animal
```

இதன் பொருள்: `AnimalDetailView` வெளியில் இருந்து ஒரு விலங்கைப் பெற வேண்டும்.

விலங்கைப் பெற்ற பிறகு, விவர View அந்த விலங்கின் பல்வேறு தகவல்களைப் பயன்படுத்தலாம்:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

அதாவது, `AnimalDetailView` உள்ளே அனுப்பப்பட்ட விலங்கை காட்டுவதற்கே பொறுப்பு.

### Markdown தடித்த எழுத்து

விவர View-இல், நாம் இவ்வாறு குறியீடு எழுதியுள்ளோம்:

```swift
Text("**வாழ்விடம்:** \(animal.habitat)")
```

இங்கு இரண்டு அறிவுப் புள்ளிகள் உள்ளன.

முதல், `**வாழ்விடம்:**` `Markdown` syntax-ஐ பயன்படுத்துகிறது. இரண்டு நட்சத்திரங்களுக்குள் உள்ள எழுத்து தடித்ததாக காட்டப்படும்.

இரண்டாவது, `\()` என்பது string interpolation. மாறியின் மதிப்பை உரையில் காட்ட இதைப் பயன்படுத்தலாம்.

இந்தக் குறியீடு முதலில் தடித்த `வாழ்விடம்:` உரையை காட்டி, அதன் பிறகு இந்த விலங்கின் வாழ்விடத்தை காட்டும்.

## Sheet-இல் விவர View காட்டுதல்

`AnimalDetailView` உருவாக்கப்பட்ட பிறகு, மீண்டும் `ContentView`-க்கு திரும்பி, `Sheet`-இல் இருந்த பழைய பெயர் View-ஐ விவர View-ஆக மாற்றலாம்.

முன்பு இவ்வாறு இருந்தது:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

இப்போது இவ்வாறு மாற்றலாம்:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

இங்குள்ள `animal:` என்பது `AnimalDetailView`-இன் parameter name.

பின்னுள்ள `animal` என்பது `.sheet(item:)` மூலம் அனுப்பப்பட்ட தற்போதைய விலங்கு.

அதாவது, தற்போதைய தட்டப்பட்ட விலங்கைக் `AnimalDetailView`-க்கு அனுப்பி காட்டுகிறோம்.

முழு அமைப்பு:

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

பயனர் விலங்கைத் தட்டும் போது:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil`-இலிருந்து குறிப்பிட்ட விலங்காக மாறும். `Sheet` `selectedAnimal`-க்கு மதிப்பு இருப்பதை கண்டவுடன் View-ஐ பாப் அப் செய்யும்.

`Sheet`, `selectedAnimal`-இல் உள்ள விலங்கை `AnimalDetailView` View-க்கு அனுப்பும்; `AnimalDetailView` விலங்கு விவரத்தை காட்டும்.

இவ்வாறு, விலங்கு பட்டியலைத் தட்டி, அதற்கான விலங்கு விவரம் பாப் அப் ஆகும் செயல்பாட்டை முடித்துவிட்டோம்.

## Sheet இன் இரண்டு எழுதும் முறைகளின் வேறுபாடு

இப்போது, `.sheet(item:)` பயன்படுத்தி விலங்கு விவர View-ஐ காட்டி முடித்துள்ளோம்.

இங்கு `Sheet`-இன் இரண்டு பொதுவான எழுதும் முறைகளை சுருக்கமாகப் பார்க்கலாம்.

### முதல் முறை Boolean value-க்கு bind செய்வது

```swift
@State private var showSheet = false

Button("Sheet காட்டு") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

இந்த முறை நிலையான உள்ளடக்கத்தை பாப் அப் செய்ய ஏற்றது, உதாரணமாக அமைப்புப் பக்கம், விளக்கப் பக்கம், அறிவிப்பு பக்கம் போன்றவை.

`showSheet` என்பது Boolean value; அதற்கு `true` மற்றும் `false` என்ற இரண்டு நிலைகளே உள்ளன.

`showSheet` `true` என்றால், `Sheet` காட்டப்படும்.

`showSheet` `false` என்றால், `Sheet` காட்டப்படாது.

### இரண்டாவது முறை optional value-க்கு bind செய்வது

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

இந்த முறை தேர்ந்தெடுக்கப்பட்ட தரவின் அடிப்படையில் வெவ்வேறு உள்ளடக்கத்தை பாப் அப் செய்ய ஏற்றது.

இந்தப் பாடத்தில், நாம் வெவ்வேறு விலங்குகளைத் தட்டும் போது வெவ்வேறு விலங்கு விவரங்களை காட்ட வேண்டும். எனவே `.sheet(item:)` பயன்படுத்துவது பொருத்தமானது.

## முழு குறியீடு

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // விலங்கின் பெயர்
    let name: String
    
    // விலங்கின் படம்
    let imageName: String
    
    // விலங்கு குறிச்சின்னம்
    let avatarEmoji: String
    
    // பரவல் பகுதி
    let distributionArea: String
    
    // வாழ்விடம்
    let habitat: String
    
    // விலங்கு விளக்கம்
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // டால்பின்
        Animal(
            name: "டால்பின்",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "உலகம் முழுவதும் உள்ள சூடான மற்றும் மிதவெப்பக் கடல்கள்.",
            habitat: "கடல்கள், கடலோர நீர்ப்பகுதிகள் மற்றும் சில பெரிய ஆறுகள்.",
            animalDescription: "டால்பின்கள் புத்திசாலியான கடல் பாலூட்டிகள். அவை குழுக்களாக வாழ்கின்றன, ஒலிகளால் தொடர்பு கொள்கின்றன, மேலும் விளையாட்டுத்தனமான நடத்தைக்காக அறியப்படுகின்றன."
        ),
        // ஒட்டகச்சிவிங்கி
        Animal(
            name: "ஒட்டகச்சிவிங்கி",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ஆப்ரிக்காவின் சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            habitat: "புல்வெளிகள், சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            animalDescription: "ஒட்டகச்சிவிங்கிகள் நிலத்தில் வாழும் மிக உயரமான விலங்குகள். அவற்றுக்கு நீண்ட கழுத்தும் நீண்ட கால்களும் உள்ளன; பொதுவாக உயரமான மரங்களின் இலைகளை உண்கின்றன."
        ),
        // சிங்கம்
        Animal(
            name: "சிங்கம்",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "முக்கியமாக சஹாராவின் தெற்குப் பகுதி ஆப்ரிக்காவில் காணப்படுகிறது; மேற்கு இந்தியாவில் ஒரு சிறிய தொகையும் உள்ளது.",
            habitat: "புல்வெளிகள், சவானாக்கள் மற்றும் திறந்த காடுகள்.",
            animalDescription: "சிங்கங்கள் வலிமையான பெரிய பூனைகள். அவை பொதுவாக pride எனப்படும் குழுக்களாக வாழ்கின்றன; விலங்கு உலகின் ராஜாக்கள் என்றும் அறியப்படுகின்றன."
        ),
        // பாண்டா
        Animal(
            name: "பாண்டா",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "மத்திய சீனாவின் மலைக் காடுகள்.",
            habitat: "குளிர்ச்சியும் ஈரப்பதமும் உள்ள மலைப்பகுதிகளில் உள்ள மூங்கில் காடுகள்.",
            animalDescription: "பாண்டாக்கள் கருப்பு-வெள்ளை ரோமத்திற்காக அறியப்படும் கரடிகள். அவை பெரும்பாலும் மூங்கிலை உண்கின்றன; உலகில் எளிதாக அடையாளம் காணப்படும் விலங்குகளில் ஒன்றாகும்."
        ),
        // துருவக் கரடி
        Animal(
            name: "துருவக் கரடி",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "வட துருவத்தைச் சுற்றிய ஆர்க்டிக் பகுதிகள்.",
            habitat: "கடல் பனி, கடலோர பகுதிகள் மற்றும் குளிரான ஆர்க்டிக் சூழல்கள்.",
            animalDescription: "துருவக் கரடிகள் குளிரான சூழலுக்கு ஏற்ப மாறிய பெரிய கரடிகள். அவை திறமையான நீந்திகள்; சீல்களை வேட்டையாட கடல் பனியை பெரிதும் சார்ந்திருக்கின்றன."
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
                    Text("**பரவல் பகுதி**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**வாழ்விடம்**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**விலங்கு விளக்கம்**: \(animal.animalDescription)")
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

## சுருக்கம்

இந்தப் பாடத்தில் ஒரு எளிய விலங்கு கலைக்களஞ்சிய பக்கம் உருவாக்கப்பட்டது.

முதலில் `Animal` struct மூலம் விலங்கு தகவல்களைச் சேமித்தோம். பின்னர் array மூலம் ஐந்து விலங்குகளைச் சேமித்தோம். அதன்பின் `ForEach` பயன்படுத்தி விலங்கு பட்டியலைக் காட்டினோம்.

பயனர் ஒரு விலங்கைக் தட்டும் போது, அந்த விலங்கை `selectedAnimal`-இல் சேமிக்கிறோம்:

```swift
selectedAnimal = animal
```

`selectedAnimal`-க்கு மதிப்பு இருக்கும் போது, `.sheet(item:)` விவர View-ஐ பாப் அப் செய்து, தேர்ந்தெடுக்கப்பட்ட விலங்கை `AnimalDetailView`-க்கு அனுப்பும்.

இந்தப் பாடத்தின் மிக முக்கியமானது UI style அல்ல; கீழுள்ள தரவு பரிமாற்றப் பாதையைப் புரிந்துகொள்வதே:

```swift
விலங்கைத் தட்டு → selectedAnimal விலங்கைச் சேமிக்கும் → Sheet பாப் அப் ஆகும் → AnimalDetailView விவரத்தை காட்டும்
```

இந்த பாதையைப் புரிந்துகொண்ட பிறகு, இதைப் போன்ற பல செயல்பாடுகளை உருவாக்கலாம். உதாரணமாக, பொருள் விவரம், பாட விவரம், கட்டுரை விவரம், தொடர்பு விவரம் போன்றவை.
