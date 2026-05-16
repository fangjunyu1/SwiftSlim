# प्राणी विश्वकोश 

या धड्यात आपण कस्टम दृश्ये आणि डेटा पाठवण्याचा सराव पुढे सुरू ठेवू.

आपण एक साधे प्राणी विश्वकोश दृश्य तयार करणार आहोत. पेजमध्ये पाच प्राणी दाखवले जातील. एखाद्या प्राण्यावर क्लिक केल्यावर एक तपशील दृश्य पॉप अप होईल, ज्यामध्ये त्या प्राण्याचे चित्र, वितरण क्षेत्र, अधिवास आणि वर्णन दाखवले जाईल.

अंतिम परिणाम:

![view](../../../Resource/029_view.png)

या उदाहरणातून आपण डेटा स्ट्रक्चर, सूची दाखवणे, क्लिक इंटरॅक्शन आणि Sheet पॉप-अप दृश्य यांचा परस्पर समन्वय सरावू शकतो.

## चित्र साहित्य तयार करणे

सर्वप्रथम, आपल्याला पाच प्राण्यांची चित्रे तयार करावी लागतील:

- डॉल्फिन: `dolphin.jpg`
- जिराफ: `giraffe.jpg`
- सिंह: `lion.jpg`
- पांडा: `panda.jpg`
- ध्रुवीय अस्वल: `polarBear.jpg`

खालील चित्र साहित्य वापरता येईल:

[डॉल्फिन](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [जिराफ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [सिंह](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [पांडा](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ध्रुवीय अस्वल](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

चित्रे डाउनलोड केल्यानंतर ती Xcode प्रकल्पातील `Assets` संसाधन फोल्डरमध्ये ड्रॅग करा.

![assets](../../../Resource/029_assets.png)

लक्षात घ्या की कोडमध्ये चित्र वापरताना साधारणपणे `.jpg` प्रत्यय लिहिण्याची गरज नसते.

उदाहरणार्थ, चित्र संसाधनाचे नाव `dolphin` असल्यास, कोडमध्ये असे लिहा:

```swift
Image("dolphin")
```

जर चित्राचे नाव चुकीचे लिहिले, तर चित्र व्यवस्थित दिसणार नाही.

टीप: वरील चित्र साहित्य Wikimedia प्रकल्पातून आले आहे. वापरताना मूळ चित्र दुवे आणि स्रोत माहिती जतन करण्याची शिफारस केली जाते.

## प्राणी स्ट्रक्चर तयार करणे

या पेजमध्ये प्रत्येक प्राण्याची अनेक माहिती असते:

- प्राण्याचे नाव
- प्राण्याचे चित्र
- प्राण्याचा इमोजी
- वितरण क्षेत्र
- अधिवास
- प्राण्याचे वर्णन

जर आपण ही माहिती अनेक स्वतंत्र व्हेरिएबलमध्ये विखुरली, तर कोड गोंधळलेला होईल. म्हणून, आपण `Animal` नावाचे एक स्ट्रक्चर तयार करू शकतो आणि एका प्राण्याची माहिती एकत्र ठेवू शकतो.

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

या कोडमध्ये:

- `id`: प्राण्याची अद्वितीय ओळख.
- `name`: प्राण्याचे नाव.
- `imageName`: प्राण्याच्या चित्राचे नाव.
- `avatarEmoji`: प्राण्याचा इमोजी.
- `distributionArea`: वितरण क्षेत्र.
- `habitat`: अधिवास.
- `animalDescription`: प्राण्याचे वर्णन.

यापैकी:

```swift
let id = UUID()
```

`id` प्रत्येक प्राण्याची ओळख पटवण्यासाठी वापरले जाते. कारण पुढे आपण `ForEach` वापरून प्राण्यांची सूची दाखवणार आहोत, तसेच `.sheet(item:)` वापरून निवडलेल्या प्राण्यानुसार तपशील पॉप अप करणार आहोत. त्यामुळे `Animal` ने `Identifiable` प्रोटोकॉलचे पालन करणे आवश्यक आहे.

`Identifiable` चे काम SwiftUI ला हे सांगणे आहे: प्रत्येक प्राण्याकडे त्याची ओळख वेगळी करण्यासाठी वापरता येणारे `id` आहे.

## प्राणी डेटा तयार करणे

यानंतर आपण `ContentView` मध्ये एक प्राणी array तयार करू.

या array मध्ये पाच `Animal` जतन केले जातात, आणि प्रत्येक `Animal` एक प्राणी दर्शवतो.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // डॉल्फिन
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // जिराफ
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // सिंह
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // पांडा
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ध्रुवीय अस्वल
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

येथील `animals` हा एक array आहे:

```swift
let animals: [Animal]
```

`[Animal]` म्हणजे या array मध्ये अनेक `Animal` जतन केलेले आहेत.

म्हणजेच, `animals` हा एक प्राणी नाही, तर प्राण्यांचा एक गट आहे.

## प्राण्यांची सूची दाखवणे

आता आपण `ForEach` वापरून प्राण्यांची सूची दाखवू शकतो.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
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

दिसणारा परिणाम:

![view](../../../Resource/029_view1.png)

या कोडमध्ये:

```swift
ForEach(animals) { animal in
    ...
}
```

याचा अर्थ `animals` array मधून फेरफटका मारणे.

प्रत्येक लूपमध्ये `animal` म्हणजे सध्या दाखवला जात असलेला प्राणी.

उदाहरणार्थ, पहिल्या लूपमध्ये `animal` डॉल्फिन आहे; दुसऱ्या लूपमध्ये `animal` जिराफ आहे.

म्हणून, आपण खालील पद्धतीने सध्याच्या प्राण्याची माहिती दाखवू शकतो:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

अशा प्रकारे पाचही प्राणी दाखवता येतात.

## प्राण्यांची सूची क्लिक करण्यायोग्य करणे

आता सूची दिसू लागली आहे, पण अजून ती क्लिक करता येत नाही.

एखाद्या प्राण्यावर क्लिक केल्यानंतर तपशील पॉप अप करायचा असल्यास, आधी “सध्या निवडलेला प्राणी” नोंदवावा लागेल.

म्हणून, `ContentView` मध्ये एक state variable जोडा:

```swift
@State private var selectedAnimal: Animal? = nil
```

येथील `selectedAnimal` हा optional value प्रकार `Animal?` आहे.

याचा अर्थ त्यात एखादा प्राणी असू शकतो, किंवा कोणताही प्राणी नसू शकतो.

डीफॉल्ट मूल्य `nil` आहे, म्हणजे सुरुवातीला कोणताही प्राणी निवडलेला नाही.

यानंतर प्रत्येक प्राण्याची ओळ `Button` मध्ये बदला:

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
                .clipShape(Circle())
            
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

मुख्य मुद्दा ही ओळ आहे:

```swift
selectedAnimal = animal
```

वापरकर्ता एखाद्या प्राण्यावर क्लिक करतो तेव्हा आपण तो प्राणी `selectedAnimal` मध्ये जतन करतो.

उदाहरणार्थ, वापरकर्त्याने डॉल्फिनवर क्लिक केले, तर `selectedAnimal` मध्ये डॉल्फिन जतन होईल.

वापरकर्त्याने पांडावर क्लिक केले, तर `selectedAnimal` मध्ये पांडा जतन होईल.

म्हणजेच, वापरकर्त्याने सध्या कोणत्या प्राण्यावर क्लिक केले आहे हे नोंदवण्यासाठी `selectedAnimal` वापरले जाते.

## Sheet पॉप-अप दृश्य

आता आपण बटणाद्वारे “सध्या क्लिक केलेला प्राणी” नोंदवू शकतो.

पुढे, प्राणी तपशील दाखवण्यासाठी एक पॉप-अप दृश्य तयार करायचे आहे.

![view](../../../Resource/029_view2.png)

SwiftUI मध्ये असा पॉप-अप परिणाम तयार करण्यासाठी `Sheet` वापरता येते.

`Sheet` ला तात्पुरते पॉप अप होणारे पेज असे समजू शकतो. ते सध्याच्या पेजच्या वर दिसते; वापरकर्त्याने मजकूर पाहून झाल्यावर खाली स्वाइप करून ते बंद करू शकतो.

## Sheet उदाहरण

प्राण्याचे तपशील प्रत्यक्ष दाखवण्यापूर्वी, `Sheet` कसे पॉप अप होते हे समजण्यासाठी आपण एक साधे उदाहरण पाहू.

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

दिसणारा परिणाम:

![view](../../../Resource/029_view3.png)

या कोडमध्ये आपण एक Boolean value तयार केली आहे:

```swift
@State private var showSheet = false
```

`showSheet` चे डीफॉल्ट मूल्य `false` आहे, म्हणजे सुरुवातीला `Sheet` दाखवले जात नाही.

बटणावर क्लिक केल्यावर:

```swift
showSheet.toggle()
```

`toggle()` म्हणजे Boolean value उलट करणे.

जर मूळ मूल्य `false` असेल, तर `toggle()` कॉल केल्यानंतर ते `true` होईल.

जर मूळ मूल्य `true` असेल, तर `toggle()` कॉल केल्यानंतर ते `false` होईल.

म्हणून, बटणावर क्लिक केल्यानंतर `showSheet` `false` वरून `true` मध्ये बदलेल.

जेव्हा `showSheet` `true` होते, तेव्हा खालील कोड `Sheet` पॉप अप करतो:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

या कोडचा अर्थ असा: जेव्हा `showSheet` `true` असेल, तेव्हा एक `Sheet` पॉप अप करा, आणि `Sheet` मध्ये `Text("Sheet View")` दाखवा.

दिसणारा परिणाम:

![view](../../../Resource/029_view4.png)

ही पद्धत निश्चित मजकूर पॉप अप करण्यासाठी योग्य आहे.

उदाहरणार्थ, बटणावर क्लिक केल्यानंतर सेटिंग्ज पेज, सूचना पेज,सूचना पेज इत्यादी पॉप अप करणे.

### Sheet दाखवण्याचे स्थान

जरी `Sheet` हे पॉप-अप दृश्य असले, तरी SwiftUI मध्ये ते `Text()` किंवा `Image()` प्रमाणे स्वतंत्र दृश्य म्हणून थेट लिहिले जात नाही. ते view modifier म्हणून वापरले जाते.

म्हणजेच, `.sheet(...)`, `.font()`, `.padding()`, `.shadow()` या modifier प्रमाणेच, एखाद्या दृश्याच्या मागे जोडावे लागते.

उदाहरणार्थ:

```swift
Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

या उदाहरणात `.sheet` हे `Button` नंतर जोडले आहे.

जेव्हा `showSheet` `true` होते, तेव्हा SwiftUI `Sheet` पॉप अप करते आणि curly braces मधील मजकूर दाखवते:

```swift
Text("Sheet View")
```

परंतु प्रत्यक्ष विकासात, जर एका पेजमध्ये अनेक बटणे असतील, तर साधारणपणे प्रत्येक बटणाला वेगळे `.sheet` जोडले जात नाही.

अधिक सामान्य पद्धत म्हणजे: बाहेरील दृश्याच्या मागे `.sheet` जोडणे.

उदाहरणार्थ:

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

बटण `showSheet` बदलण्याची जबाबदारी घेते, तर बाहेरील दृश्य `showSheet` `true` आहे की नाही यानुसार `Sheet` पॉप अप करण्याची जबाबदारी घेते.

## Optional value बांधलेले Sheet

आधी आपण शिकलेली पद्धत अशी होती:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ही पद्धत एका निश्चित पेजचे दाखवणे आणि लपवणे नियंत्रित करण्यासाठी योग्य आहे.

परंतु प्राणी विश्वकोश उदाहरणात आपल्याला फक्त “`Sheet` पॉप अप होते का” हे जाणून घेण्यापेक्षा “कोणत्या प्राण्यावर क्लिक झाले” हेही जाणून घ्यावे लागते.

उदाहरणार्थ:

वापरकर्त्याने डॉल्फिनवर क्लिक केले, तर `Sheet` मध्ये डॉल्फिनचे तपशील दिसायला हवेत.

वापरकर्त्याने पांडावर क्लिक केले, तर `Sheet` मध्ये पांडाचे तपशील दिसायला हवेत.

म्हणून येथे Sheet ची दुसरी पद्धत वापरणे अधिक योग्य आहे:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet मध्ये दाखवला जाणारा मजकूर
}
```

या कोडमध्ये `Sheet` एका optional value `selectedAnimal` शी बांधलेले आहे.

येथे लक्षात घ्या: `item:` नंतर `$selectedAnimal` लिहिले आहे, `selectedAnimal` नाही.

कारण `Sheet` फक्त `selectedAnimal` चे मूल्य वाचत नाही, तर त्यातील बदलांनुसार पॉप अप करायचे की नाही हेही ठरवते.

हा कोड असे समजू शकतो:

- जेव्हा `selectedAnimal` `nil` असते, तेव्हा `Sheet` दाखवले जात नाही.
- जेव्हा `selectedAnimal` ला मूल्य असते, तेव्हा `Sheet` दाखवले जाते.
- जेव्हा `Sheet` बंद केले जाते, तेव्हा SwiftUI `selectedAnimal` पुन्हा `nil` करते.

SwiftUI `selectedAnimal` मध्ये जतन केलेला प्राणी curly braces मधील `animal` ला देईल.

म्हणजेच, `.sheet(item:)` फक्त पॉप-अप नियंत्रित करत नाही, तर निवडलेला डेटा `Sheet` मध्येही पाठवते.

## Sheet वापरून प्राण्याचे नाव दाखवणे

आता आपण लगेच गुंतागुंतीचे तपशील दृश्य तयार करणार नाही.

कोड समजायला सोपा व्हावा म्हणून, आधी `Sheet` मध्ये सध्याच्या प्राण्याचे नाव दाखवू.

`VStack` बाहेर `.sheet(item:)` जोडा:

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
                        .clipShape(Circle())
                    
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

येथे सर्वात महत्त्वाचा भाग हा कोड आहे:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

जेव्हा `selectedAnimal` ला मूल्य असते, तेव्हा `Sheet` पॉप अप होते.

curly braces मधील `animal` म्हणजे सध्या निवडलेला प्राणी.

म्हणून:

```swift
Text(animal.name)
```

सध्याच्या क्लिक केलेल्या प्राण्याचे नाव दाखवेल.

उदाहरणार्थ, `Dolphin` वर क्लिक केल्यास Sheet मध्ये `Dolphin` दिसेल.

`Panda` वर क्लिक केल्यास `Sheet` मध्ये `Panda` दिसेल.

अशा प्रकारे आपण वेगवेगळ्या प्राण्यांवर क्लिक केल्यावर वेगवेगळी प्राण्यांची नावे पॉप अप करण्याचा परिणाम साध्य केला.

प्राण्याचे नाव दाखवणे:

![view](../../../Resource/029_view5.png)

परंतु प्राणी तपशीलात फक्त एक नाव नसावे; त्यात नाव, वितरण क्षेत्र, अधिवास आणि वर्णनही दाखवावे.

जर हे सर्व कोड `.sheet` मध्ये लिहिले, तर कोड खूप लांब होईल आणि वाचायला अवघड जाईल.

म्हणून पुढे आपण एक नवीन कस्टम दृश्य तयार करू, जे प्राणी तपशील दाखवण्याची विशेष जबाबदारी घेईल.

## प्राणी तपशील दृश्य तयार करणे

आता आपण `AnimalDetailView` नावाचे एक नवीन कस्टम दृश्य तयार करू.

हे दृश्य एक `Animal` स्वीकारते आणि प्राण्याचे तपशील दाखवते.

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

दिसणारा परिणाम:

![view](../../../Resource/029_view2.png)

येथे मुख्य मुद्दा आहे:

```swift
var animal: Animal
```

याचा अर्थ `AnimalDetailView` ला बाहेरून एक प्राणी स्वीकारावा लागतो.

प्राणी मिळाल्यानंतर, तपशील दृश्य त्या प्राण्याची विविध माहिती वापरू शकते:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

म्हणजेच, `AnimalDetailView` फक्त आत पाठवलेल्या प्राण्याचे प्रदर्शन करण्याची जबाबदारी घेते.

### Markdown ठळक मजकूर

तपशील दृश्यात आपण असा कोड लिहिला:

```swift
Text("**Habitat:** \(animal.habitat)")
```

येथे दोन ज्ञानबिंदू आहेत.

पहिला, `**Habitat:**` ने `Markdown` syntax वापरले आहे. दोन ताऱ्यांमध्ये ठेवलेला मजकूर ठळक दिसतो.

दुसरा, `\()` हे string interpolation आहे, ज्यामुळे व्हेरिएबलचे मूल्य मजकुरात दाखवता येते.

या कोडचा अर्थ आधी ठळक `Habitat:` दाखवणे, आणि नंतर या प्राण्याचा अधिवास दाखवणे असा आहे.

## Sheet मध्ये तपशील दृश्य दाखवणे

`AnimalDetailView` तयार झाल्यानंतर आपण `ContentView` मध्ये परत जाऊन `Sheet` मधील मूळ नाव दृश्य तपशील दृश्याने बदलू शकतो.

मूळ कोड असा होता:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

आता तो असा बदला:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

येथील `animal:` हे `AnimalDetailView` चे parameter name आहे.

मागील `animal` हे `.sheet(item:)` मधून आलेला सध्याचा प्राणी आहे.

म्हणजे सध्या क्लिक केलेला प्राणी `AnimalDetailView` ला दाखवण्यासाठी पाठवला जातो.

पूर्ण रचना:

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
                        .clipShape(Circle())
                    
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

जेव्हा वापरकर्ता प्राण्यावर क्लिक करतो:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` वरून विशिष्ट प्राण्यामध्ये बदलते. `Sheet` ला `selectedAnimal` ला मूल्य आहे हे दिसल्यावर ते दृश्य पॉप अप करते.

`Sheet` `selectedAnimal` मधील प्राणी `AnimalDetailView` दृश्याला पाठवते, आणि `AnimalDetailView` प्राण्याचे तपशील दाखवते.

अशा प्रकारे आपण प्राण्यांच्या सूचीवर क्लिक करून संबंधित प्राण्याचे तपशील पॉप अप करण्याचे कार्य पूर्ण केले.

## Sheet च्या दोन पद्धतींमधील फरक

आता आपण `.sheet(item:)` वापरून प्राणी तपशील दृश्य दाखवणे पूर्ण केले आहे.

येथे `Sheet` च्या दोन सामान्य पद्धती थोडक्यात संक्षेपित करू.

### पहिली पद्धत Boolean value बांधते

```swift
@State private var showSheet = false

Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ही पद्धत निश्चित मजकूर पॉप अप करण्यासाठी योग्य आहे, जसे सेटिंग्ज पेज, सूचना पेज,सूचना पेज इत्यादी.

`showSheet` हे Boolean value आहे, त्याच्या फक्त `true` आणि `false` या दोन अवस्था असतात.

जेव्हा `showSheet` `true` असते, तेव्हा `Sheet` दाखवले जाते.

जेव्हा `showSheet` `false` असते, तेव्हा `Sheet` दाखवले जात नाही.

### दुसरी पद्धत optional value बांधते

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ही पद्धत निवडलेल्या डेटानुसार वेगवेगळा मजकूर पॉप अप करण्यासाठी योग्य आहे.

या धड्यात आपण वेगवेगळ्या प्राण्यांवर क्लिक करतो आणि वेगवेगळ्या प्राण्यांचे तपशील दाखवायचे असतात, त्यामुळे `.sheet(item:)` वापरणे अधिक योग्य आहे.

## पूर्ण कोड

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // प्राण्याचे नाव
    let name: String
    
    // प्राण्याचे चित्र
    let imageName: String
    
    // प्राण्याचा लेबल इमोजी
    let avatarEmoji: String
    
    // वितरण क्षेत्र
    let distributionArea: String
    
    // अधिवास
    let habitat: String
    
    // प्राण्याचे वर्णन
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // डॉल्फिन
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // जिराफ
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // सिंह
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // पांडा
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ध्रुवीय अस्वल
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
                            .clipShape(Circle())

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

## सारांश

या धड्यात आपण एक साधे प्राणी विश्वकोश पेज पूर्ण केले.

आपण आधी `Animal` स्ट्रक्चर वापरून प्राण्याची माहिती जतन केली, नंतर array वापरून पाच प्राणी जतन केले, आणि मग `ForEach` वापरून प्राण्यांची सूची दाखवली.

वापरकर्ता एखाद्या प्राण्यावर क्लिक करतो तेव्हा आपण तो प्राणी `selectedAnimal` मध्ये जतन करतो:

```swift
selectedAnimal = animal
```

जेव्हा `selectedAnimal` ला मूल्य असते, तेव्हा `.sheet(item:)` तपशील दृश्य पॉप अप करते आणि निवडलेला प्राणी `AnimalDetailView` ला पाठवते.

या धड्यात सर्वात महत्त्वाचे म्हणजे UI style नाही, तर ही डेटा पाठवण्याची वाट समजणे आहे:

```swift
प्राण्यावर क्लिक करा → selectedAnimal प्राणी जतन करते → Sheet पॉप अप होते → AnimalDetailView तपशील दाखवते
```

ही वाट समजल्यानंतर पुढे तुम्हीउत्पादन तपशील, कोर्स तपशील, लेख तपशील, संपर्क तपशील इत्यादी अधिक समान कार्ये तयार करू शकता.
