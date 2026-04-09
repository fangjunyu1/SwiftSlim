# struct ഉം class ഉം

മുൻ പാഠത്തിൽ, നാം `struct`നെ ഇപ്പോഴാണ് പരിചയപ്പെടാൻ തുടങ്ങിയത്, ഒരു structure നിർവചിച്ചു, കൂടാതെ protocol, `UUID` എന്നിവ പോലുള്ള അറിവുകളും കൂടുതൽ പഠിച്ചു.

ഇപ്പോൾ `struct` keyword നെ കുറിച്ച് നമുക്ക് ഒരു പ്രാഥമിക ധാരണയുണ്ട്, പക്ഷേ അതിനെ യഥാർത്ഥത്തിൽ പൂർണ്ണമായി മനസ്സിലാക്കി എന്നു ഇപ്പോഴും പറയാനാകില്ല.

ഈ പാഠത്തിൽ, നാം `struct`നെ പ്രധാന വിഷയമാക്കി തുടരും, അതോടൊപ്പം `class`നെയും പരിചയപ്പെടും. ഈ പാഠം വഴി, instance എന്നത് എന്താണ്, constructor എന്നത് എന്താണ്, കൂടാതെ `struct`യും `class`യും ഉപയോഗിച്ച് data എങ്ങനെ ക്രമീകരിക്കാം എന്നതും കൂടുതൽ വ്യക്തമായി മനസ്സിലാകും.

## വിദ്യാർത്ഥി മാനേജ്മെന്റ് സംവിധാനം

ഉദാഹരണത്തിന്, ഇപ്പോൾ നാം ഒരു വിദ്യാർത്ഥി മാനേജ്മെന്റ് സംവിധാനം വികസിപ്പിക്കണമെന്ന് കരുതുക. ഓരോ വിദ്യാർത്ഥിക്കും പേര്, ലിംഗം, ഫോൺ, പ്രായം, വീട്ടുവിലാസം എന്നിവ പോലുള്ള വിവരങ്ങൾ ഉണ്ടായിരിക്കും.

ഈ സമയത്ത്, ഈ വിവരങ്ങളെല്ലാം ഒരുമിപ്പിച്ച് `Student` structure ആയി നിർവചിക്കാം:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

ഇവിടെ `struct` ഉപയോഗിച്ച് ഒരു വിദ്യാർത്ഥി type നിർവചിക്കുന്നു.

ഈ `Student` structure-ൽ നിരവധി properties ഉണ്ട്:

- `id`: വിദ്യാർത്ഥിയുടെ ഏകതാന തിരിച്ചറിയൽ
- `name`: വിദ്യാർത്ഥിയുടെ പേര്
- `sex`: വിദ്യാർത്ഥിയുടെ ലിംഗം
- `phone`: വിദ്യാർത്ഥിയുടെ ഫോൺ
- `age`: വിദ്യാർത്ഥിയുടെ പ്രായം
- `address`: വീട്ടുവിലാസം

ഇങ്ങനെ, മുൻപ് ചിതറിക്കിടന്ന പല dataകളും ചേർന്നു ഒരു സമ്പൂർണ "വിദ്യാർത്ഥി" ആയി മാറുന്നു.

ഇവിടെയുള്ള `Student` `Identifiable` protocol-നെയും പിന്തുടരുന്നു, കൂടാതെ `id` field നിർവചിക്കുന്നു. അതിനാൽ പിന്നീട് `ForEach` loop ഉപയോഗിച്ച് data കാണിക്കുന്നത് എളുപ്പമാകും.

അതിനുശേഷം, നമുക്ക് ഒരു വിദ്യാർത്ഥിയുടെ instance സൃഷ്ടിക്കാം:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ഈ code എന്നതിന്റെ അർത്ഥം, `Student` എന്ന ഘടനപ്രകാരം ഒരു നിർദ്ദിഷ്ട വിദ്യാർത്ഥി data സൃഷ്ടിക്കാനാകുന്നു എന്നതാണ്.

ഇവിടെ `Student` type ആണ്, `Student(...)` എന്നാൽ സൃഷ്ടിച്ച ഒരു instance ആണ്.

SwiftUIയിൽ, ഈ instance ഒരു variable-നു assign ചെയ്ത് ശേഷം അത് പ്രദർശിപ്പിക്കാം.

ഉദാഹരണത്തിന്:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

ഈ രീതിയിൽ, viewയിൽ ഈ വിദ്യാർത്ഥിയുടെ പേര് `Fang Junyu` കാണാൻ കഴിയും.

ഇവിടെ ആദ്യം നാം `Student` instance സൃഷ്ടിച്ചു, തുടർന്ന് അത് `student` variable-നു assign ചെയ്തു, ഒടുവിൽ `student.name` വഴി അതിലെ property വായിച്ചു.

## instance എന്താണ്

`struct` പഠനം തുടങ്ങുമ്പോൾ "instance" എന്ന വാക്ക് വളരെ അന്യമായി തോന്നാം.

പക്ഷേ യാഥാർത്ഥ്യത്തിൽ, നാം തുടക്കം മുതൽ തന്നെ instances ഉപയോഗിച്ചുവരുന്നു, മുൻപ് അതിനെ പ്രത്യേകം ശ്രദ്ധിച്ചില്ലെന്നുമാത്രം.

ഉദാഹരണത്തിന്:

```swift
let name = "Fang Junyu"
```

ഇവിടെ `"Fang Junyu"` ഒരു string value ആണ്, അതിന്റെ അടിസ്ഥാനത്തിൽ അത് `String` typeന്റെ ഒരു instance ആണ്.

ഇത് നാം ഇങ്ങനെ എഴുതുകയും ചെയ്യാം:

```swift
let name = String("Fang Junyu")
```

ഈ രണ്ടു എഴുതൽ രീതികളും ഒരേ കാര്യം സൂചിപ്പിക്കുന്നു: `String` typeന്റെ ഒരു instance സൃഷ്ടിച്ച് അത് `name` variable-നു assign ചെയ്യുക.

അതുപോലെ തന്നെ, `Int` നും ഇതേ കാര്യം ബാധകമാണ്:

```swift
let num = 3
```

ഇവിടെ `3` അടിസ്ഥാനത്തിൽ `Int` typeന്റെ ഒരു value ആണ്, അതിനെ `Int` instance എന്നായും മനസ്സിലാക്കാം.

അതുകൊണ്ട്, instance എന്നത് `struct`-ലേ മാത്രം കാണുന്ന ഒരു പ്രത്യേക ധാരണയല്ല.

`String`, `Int`, `Double`, `Bool`, അല്ലെങ്കിൽ custom `Student` ആയാലും, ഇവയെല്ലാം instances സൃഷ്ടിക്കാനാകും.

അതുകൊണ്ട്, നാം ഇങ്ങനെ എഴുതുമ്പോൾ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ഇത് അടിസ്ഥാനത്തിൽ `String` അല്ലെങ്കിൽ `Int` instance സൃഷ്ടിക്കുന്നതുപോലെ തന്നെയാണ്; വ്യത്യാസം `Student` നാം തന്നെ നിർവചിച്ച type ആണെന്നതാണ്.

## constructor

നാം ഒരു instance സൃഷ്ടിക്കുമ്പോൾ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

യഥാർത്ഥത്തിൽ നാം `Student`-ന്റെ initialization method ആയ `init` നെ call ചെയ്യുകയാണ്.

constructor നെ ഇങ്ങനെ മനസ്സിലാക്കാം: **ഒരു instance സൃഷ്ടിക്കുമ്പോൾ properties-ന് values നൽകുന്നതിനുള്ള പ്രവേശനകവാടമാണിത്.**

അതായത്, ഒരു instance യഥാർത്ഥത്തിൽ പൂർണ്ണമായി സൃഷ്ടിക്കപ്പെടുന്നതിന് മുമ്പ് സാധാരണയായി അത് ആദ്യം `init` വഴി കടക്കണം.

ഉദാഹരണത്തിന്, മുൻപ് SwiftUI view lifecycle പഠിക്കുമ്പോൾ നാം ഇങ്ങനെയുള്ള code എഴുതി:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

ഇവിടെ `init()` `ContentView` instance സൃഷ്ടിക്കുമ്പോൾ പ്രവർത്തിക്കുന്നു, എന്നാൽ `onAppear` view യഥാർത്ഥത്തിൽ screen-ൽ കാണിക്കുമ്പോൾ മാത്രമേ പ്രവർത്തിക്കൂ. അതായത്, view സൃഷ്ടിക്കപ്പെടുന്നതും view പ്രദർശിപ്പിക്കപ്പെടുന്നതും ഒരേ സമയം അല്ല.

അതു പോലെ തന്നെ, നാം `Student(...)` സൃഷ്ടിക്കുമ്പോഴും `Student`-ന്റെ constructor-നെയാണ് call ചെയ്യുന്നത്.

### സിസ്റ്റം സ്വയമേവ സൃഷ്ടിക്കുന്ന constructor

നാം `Student` നിർവചിക്കുമ്പോൾ `init` കൈകൊണ്ട് എഴുതിയിരുന്നില്ല:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

എന്നിരുന്നാലും നമുക്ക് നേരിട്ട് instance സൃഷ്ടിക്കാൻ സാധിക്കുന്നു:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor എഴുതാതെയും instance സൃഷ്ടിക്കാനാകുന്നതെന്തുകൊണ്ട്?

കാരണം `struct` നു വേണ്ടി, നാം constructor കൈകൊണ്ട് എഴുതിയില്ലെങ്കിൽ, സാധാരണയായി സിസ്റ്റം നമ്മുക്കായി അനുയോജ്യമായ constructor സ്വയം സൃഷ്ടിക്കും.

പഠനത്തിന്റെ തുടക്കത്തിൽ ഇത് ഇങ്ങനെ ലളിതമായി മനസ്സിലാക്കാം: Swift initialization code നമ്മുടെ പകരം സ്വയം പൂരിപ്പിക്കുന്നു.

ഏകദേശമായി പറഞ്ഞാൽ, സിസ്റ്റം നമ്മുക്കായി താഴെപ്പറയുന്ന code പൂരിപ്പിക്കുന്നു എന്ന് മനസ്സിലാക്കാം:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

ഇവിടെ ഒരു ചെറിയ കാര്യത്തിൽ ശ്രദ്ധ വേണം:

```swift
let id = UUID()
```

`id`-ക്ക് ഇതിനകം തന്നെ default value ഉണ്ട്, അതിനാൽ instance സൃഷ്ടിക്കുമ്പോൾ `id` നാം വീണ്ടും കൈകൊണ്ട് നൽകേണ്ടതില്ല.

അതായത്, default value ഇല്ലാത്ത properties സാധാരണ constructor-ൽ നൽകണം; default value ഇതിനകം ഉള്ള properties ആ അതേ default value നേരിട്ട് ഉപയോഗിക്കാം.

അതുകൊണ്ട് `Student` instance സൃഷ്ടിക്കുമ്പോൾ നമുക്ക് `name`, `sex`, `phone`, `age`, `address` ഇവ മാത്രം നൽകേണ്ടതുണ്ട്.

### compiler സൂചനകൾ

കൂടാതെ, Xcode-ൽ `Student(...)` എന്ന് ടൈപ്പ് ചെയ്യുമ്പോൾ, സിസ്റ്റം നൽകുന്ന parameter hints നമുക്ക് കാണാനും കഴിയും.

![student](../../Resource/022_student.png)

ഇതും ഇപ്പോഴുള്ള ഈ type-ന് സിസ്റ്റം സ്വയം സൃഷ്ടിച്ച constructor യഥാർത്ഥത്തിൽ ഉണ്ടെന്നു കാണിക്കുന്നു.

### constructor നമ്മൾ സ്വയം എഴുതുന്നത്

സിസ്റ്റം constructor സ്വയം സൃഷ്ടിക്കാമെങ്കിലും, ചിലപ്പോൾ ഈ default initialization രീതി നമ്മുടെ ആവശ്യങ്ങളോട് പൂർണ്ണമായി പൊരുത്തപ്പെടില്ല.

ഉദാഹരണത്തിന്, നമുക്കൊരു `Movie` structure ഉണ്ട്:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

സിസ്റ്റം സ്വയം സൃഷ്ടിച്ച constructor പ്രകാരം, instance സൃഷ്ടിക്കുമ്പോൾ ഈ മൂന്ന് parameters നമുക്ക് ഒരുമിച്ചെല്ലാം നൽകണം:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

പക്ഷേ ഇപ്പോൾ നമുക്ക് ചില പഴയ സിനിമകളുടെ data ചേർക്കണം, അതിൽ സിനിമയുടെ പേര് മാത്രം അറിയാം, director ഉം rating ഉം അറിയില്ലെങ്കിൽ, അത് കുറച്ച് ബുദ്ധിമുട്ടാകും.

കാരണം അപ്പോൾ നമുക്ക് ഇങ്ങനെ മാത്രമേ എഴുതാനാകൂ:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ഇത് പ്രവർത്തിച്ചാലും, ഓരോ തവണയും `--` ആവർത്തിച്ച് എഴുതുന്നത് സൗകര്യമല്ല.

അപ്പോൾ നമുക്ക് ഒരു constructor എഴുതാം:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ഇങ്ങനെ ചെയ്താൽ, പഴയ സിനിമകൾ സൃഷ്ടിക്കുമ്പോൾ `name` മാത്രം നൽകിയാൽ മതി:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

ഇതാണ് constructor നമ്മൾ സ്വയം എഴുതുന്നതിനുള്ള ഒരു അർത്ഥം: **instance സൃഷ്ടിക്കുന്ന രീതി യഥാർത്ഥ ആവശ്യങ്ങൾക്ക് കൂടുതൽ അനുയോജ്യമാക്കുക.**

### custom constructor വിശകലനം

ഇപ്പോൾ നാം കൈകൊണ്ട് എഴുതിയ ഈ constructor നോക്കാം:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ഈ code ന്റെ അർത്ഥം, `Movie` instance സൃഷ്ടിക്കുമ്പോൾ `name` എന്ന ഒരു parameter മാത്രം നൽകിയാൽ മതി എന്നതാണ്.

അതിനുശേഷം constructor-ന്റെ ഉള്ളിൽ നൽകിയ `name` instance-ന്റെ സ്വന്തം `name`-ലേക്ക് assign ചെയ്യും, കൂടാതെ `director`ക്കും `rating`ക്കും default value ആയി `--` നൽകും.

ഇവിടെ `self` എന്നത് "ഈ ഇപ്പോഴുള്ള instance തന്നെയാണ്" എന്നർത്ഥം.

ഉദാഹരണത്തിന്:

```swift
self.name = name
```

ഇടതുവശത്തുള്ള `self.name` instance-യിലെ property-യെ സൂചിപ്പിക്കുന്നു; വലതുവശത്തുള്ള `name` നാം നൽകിയ parameter-നെ സൂചിപ്പിക്കുന്നു.

ഇത് ലളിതമായി മനസ്സിലാക്കുമ്പോൾ, പുറത്തുനിന്ന് നൽകിയ value instance-ന്റെ സ്വന്തം property-യിൽ സൂക്ഷിക്കപ്പെടുന്നു എന്നാണ്.

എല്ലാ properties-ക്കും values നൽകിയാൽ, ഈ instance സൃഷ്ടിക്കൽ പൂർത്തിയാകും.

### constructor യുടെ പ്രവർത്തനരീതി

നാം വ്യക്തമായി ഒരു constructor declare ചെയ്യുമ്പോൾ, മറ്റൊരു മാറ്റവും സംഭവിക്കുന്നു:

സിസ്റ്റം മുമ്പ് സ്വയം സൃഷ്ടിച്ച constructor ഇനി സാധാരണയായി നേരിട്ട് ഉപയോഗിക്കാൻ കഴിയില്ല.

ഉദാഹരണത്തിന്:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ഇപ്പോൾ നാം വീണ്ടും ഇങ്ങനെ എഴുതിയാൽ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler error കാണിക്കും:

```swift
Extra arguments at positions #2, #3 in call
```

അതിന്റെ അർത്ഥം: നീ അധിക parameters നൽകി.

ഈ error എന്തുകൊണ്ടാണ് വരുന്നത്?

കാരണം ഇപ്പോഴുള്ള `Movie` structure-യിൽ നീ കൈകൊണ്ട് declare ചെയ്ത ഈ ഒരു constructor മാത്രമേ ഉള്ളൂ:

```swift
init(name: String)
```

ഇത് `name` എന്ന ഒരു parameter മാത്രം സ്വീകരിക്കും; `director`യും `rating`യും സ്വീകരിക്കില്ല.

അതായത്, നീ നിന്റെ സ്വന്തം constructor കൈകൊണ്ട് ചേർത്ത ശേഷം, മുമ്പുണ്ടായിരുന്ന സ്വയമേവ സൃഷ്ടിച്ച initialization style ഇനി നേരിട്ട് ഉപയോഗിക്കാൻ കഴിയില്ല.

നമുക്ക് "പേര് മാത്രം നൽകുക" എന്നും "പൂർണ്ണ വിവരങ്ങൾ നൽകുക" എന്നും രണ്ട് രീതികളെയും support ചെയ്യണമെങ്കിൽ, നാം തന്നെ ഒരു പൂർണ്ണ constructor കൂടി ചേർക്കണം:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ഇങ്ങനെ ചെയ്താൽ, നമുക്ക് രണ്ട് വ്യത്യസ്ത constructors ഉണ്ടാകും.

പഴയ സിനിമ സൃഷ്ടിക്കുമ്പോൾ നമുക്ക് ഇങ്ങനെ എഴുതാം:

```swift
Movie(name: "The Night of the Hunter")
```

പൂർണ്ണ വിവരങ്ങളുള്ള പുതിയ സിനിമ സൃഷ്ടിക്കുമ്പോൾ നമുക്ക് ഇങ്ങനെ എഴുതാം:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ഈ എഴുതുന്ന രീതി, ഒരേ type-ന് വ്യത്യസ്ത parameter രൂപങ്ങളോടെ നിരവധി constructors ഉണ്ടാകാമെന്നതും കാണിക്കുന്നു.

## overload എന്താണ്

ഇവിടെ നാം മറ്റൊരു ആവശ്യമായ അറിവ് കൂടി ചേർക്കാം.

ഇപ്പോൾതന്നെ നാം `Movie`-ക്കായി രണ്ട് `init`കൾ എഴുതിയിട്ടുണ്ട്:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

ഇതുപോലുള്ള, "അതേ function name, പക്ഷേ വ്യത്യസ്ത parameters" എന്ന രീതിയിലുള്ള എഴുതൽ "overload" എന്നാണ് വിളിക്കുന്നത്.

ഇവിടെ രണ്ട് functions-ക്കും `init` എന്ന പേരാണെങ്കിലും, അവ സ്വീകരിക്കുന്ന parameters വ്യത്യസ്തമായതിനാൽ, Swift നിനക്ക് ഏത് function ആണ് call ചെയ്യുന്നതെന്ന് തിരിച്ചറിയാൻ കഴിയും.

ഉദാഹരണത്തിന്:

```swift
Movie(name: "Days of Heaven")
```

ഇത് call ചെയ്യുന്നത്:

```swift
init(name: String)
```

അതേസമയം:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ഇത് initialization method-ന്റെ മറ്റൊരു പൂർണ്ണ version-നെ call ചെയ്യും.

അതുകൊണ്ട് overload ന്റെ പാട്, ഒരേ type-ന് വ്യത്യസ്ത സാഹചര്യങ്ങൾക്കനുസരിച്ച് വ്യത്യസ്ത സൃഷ്ടിവഴികൾ നൽകാൻ അനുവദിക്കുന്നതാണ്.

## class പരിചയം

തുടർന്ന്, ചുരുക്കത്തിൽ `class` നെയും പരിചയപ്പെടാം.

Swift-ൽ സാധാരണ ഉപയോഗിക്കുന്ന `struct` പുറമെ, Java, C#, Kotlin പോലുള്ള പല programming languages instances സൃഷ്ടിക്കാൻ `class` ഉപയോഗിക്കുന്നു.

Swift-ൽ `class` എഴുതുന്ന രീതി `struct`-നോട് വളരെ സാമ്യമുള്ളതാണ്.

ഉദാഹരണത്തിന്:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

`struct` keyword പകരം `class` ഉപയോഗിച്ചതൊഴിച്ചാൽ, ബാക്കിയുള്ള ഭാഗങ്ങൾ ഏകദേശം ഒരുപോലെ തോന്നും എന്ന് നീ കാണും.

instance സൃഷ്ടിക്കുന്ന രീതിയും വളരെ സാമ്യമുള്ളതാണ്:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

അതുകൊണ്ട് syntax തലത്തിൽ `struct`യും `class`യും ശരിക്കും വളരെ സമാനമാണ്.

### Struct നും Class നും ഇടയിലെ വ്യത്യാസം

`struct`യും `class`യും വളരെ സാമ്യമുള്ളതായി തോന്നുന്നുവെങ്കിലും, അവ പൂർണ്ണമായി ഒരേ അല്ല.

**1. initialization രീതി വ്യത്യസ്തമാണ്**

`struct`-നു വേണ്ടി, നാം constructor കൈകൊണ്ട് എഴുതിയില്ലെങ്കിൽ, സാധാരണയായി സിസ്റ്റം അനുയോജ്യമായ initialization method സ്വയം സൃഷ്ടിക്കും.

പക്ഷേ `class`-നു വേണ്ടി, default value ഇല്ലാത്ത properties ഉണ്ടെങ്കിൽ, സാധാരണ `init` കൈകൊണ്ട് എഴുതണം; ഇല്ലെങ്കിൽ error ഉണ്ടാകും.

ഉദാഹരണത്തിന്:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ഈ `class`-ൽ constructor ഇല്ലാത്തതിനാൽ properties initialize ആകില്ല, അതിനാൽ error വരും.

compiler സാധാരണ ഇങ്ങനെ ഒരു സന്ദേശം കാണിക്കും:

```swift
Class 'Movie' has no initializers
```

അതുകൊണ്ട് ഈ ഉദാഹരണത്തിൽ `class`-നു constructor കൈകൊണ്ട് എഴുതുന്നത് നിർബന്ധമാണ്.

**2. `struct` ഒരു value type ആണ്, `class` ഒരു reference type ആണ്**

`struct` ഒരു value type ആണ്, `class` ഒരു reference type ആണ്.

പഠനത്തിന്റെ തുടക്കത്തിൽ ഈ രണ്ട് ആശയങ്ങളും പൂർണ്ണമായി കൈവശം വേണമെന്നില്ല; ലളിതമായ ഒരു ധാരണ മതിയാകും.

ഉദാഹരണത്തിന്, `struct` "പുതിയ value-യുടെ copy" എന്ന ആശയത്തോട് കൂടുതലായി സാമ്യമുള്ളതാണ്.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

ഇവിടെ `user1`നെ `user2`ന് assign ചെയ്ത ശേഷം, അടിസ്ഥാനത്തിൽ പുതിയ data copy ഉണ്ടാകുന്നു. അതിനാൽ `user2`നെ മാറ്റിയാലും `user1`നെ ബാധിക്കില്ല.

അതേസമയം, `class` "ഒരേ instance-നെ ഒരുമിച്ച് സൂചിപ്പിക്കുന്നത്" എന്ന ആശയത്തോട് കൂടുതലായി സാമ്യമുള്ളതാണ്.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

ഇവിടെ `user1`യും `user2`യും ഒരേ instance-നെ സൂചിപ്പിക്കുന്നു.

ഇപ്പോൾ value type, reference type എന്നിവയുടെ ഉള്ളറ പ്രവർത്തനം പൂർണ്ണമായി മനസ്സിലാക്കേണ്ടതില്ല; `struct` സ്വതന്ത്ര data സംഭരിക്കാൻ കൂടുതൽ അനുയോജ്യമാണ്, അതേസമയം `class` പല ഇടങ്ങളിലും ഒരേ instance share ചെയ്യേണ്ടപ്പോൾ കൂടുതൽ അനുയോജ്യമാണ് എന്ന് അറിയുന്നതു മതി.

## ആരംഭഘട്ടത്തിൽ എങ്ങനെ തിരഞ്ഞെടുക്കണം

ഇപ്പോഴത്തെ ഘട്ടത്തിൽ സാധാരണ data model-കൾക്കായി ആദ്യം `struct` പരിഗണിക്കുക; shared dataയും synchronized മാറ്റങ്ങളും ആവശ്യമുള്ളപ്പോൾ `class` പരിഗണിക്കുക.

ഇത് ഒരു പൂർണ്ണ നിയമമല്ല, പക്ഷേ തുടക്കക്കാർക്ക് വളരെ പ്രായോഗികമായ വിധിനിർണ്ണയ മാർഗമാണ്.

പ്രത്യേകിച്ച് SwiftUI-ൽ, പലപ്പോഴും `struct` ഉപയോഗിച്ചുകൊണ്ട് തന്നെ ഭൂരിഭാഗം ജോലികളും ചെയ്യാൻ കഴിയുമെന്ന് നീ കാണും.

കൂടാതെ, പല programming materials-ലും `class` ഉപയോഗിച്ച് സൃഷ്ടിക്കപ്പെട്ടതിനെ "object" എന്നും വിളിക്കും. തുടക്കഘട്ടത്തിൽ, അതിനെ instance എന്ന നിലയിൽ തന്നെ മനസ്സിലാക്കാം; അവയെ പ്രത്യേകിച്ച് വേർതിരിച്ച് ചിന്തിക്കേണ്ടതില്ല.

## സംഗ്രഹം

ഈ പാഠത്തിൽ, നാം `struct` നെ കൂടുതൽ ആഴത്തിൽ പഠിച്ചു, കൂടാതെ `class` നെയും പരിചയപ്പെട്ടു. ഇരു ഘടകങ്ങളും types നിർവചിക്കാൻ ഉപയോഗിക്കാം.

Types instances സൃഷ്ടിക്കാൻ കഴിയും. Instance സൃഷ്ടിക്കുമ്പോൾ constructor, അതായത് `init`, call ചെയ്യപ്പെടും.

`struct`-നു വേണ്ടി, constructor കൈകൊണ്ട് എഴുതിയില്ലെങ്കിൽ, സാധാരണയായി സിസ്റ്റം അനുയോജ്യമായ constructor സ്വയം സൃഷ്ടിക്കും. Default constructor ആവശ്യങ്ങൾ നിറവേറ്റുന്നില്ലെങ്കിൽ, നമുക്ക് constructor സ്വയം എഴുതാനും കഴിയും.

കൂടാതെ, `struct`-നും `class`-നും ഇടയിലെ വ്യത്യാസത്തെക്കുറിച്ചും നമുക്ക് അടിസ്ഥാനപരമായ ധാരണ ലഭിച്ചു: `struct` value type ആണ്, `class` reference type ആണ്. SwiftUI-ൽ തുടക്കഘട്ടത്തിൽ സാധാരണയായി കൂടുതൽ കാണപ്പെടുന്നത് `struct` ആണ്.

പിന്നീട് views തമ്മിൽ value pass ചെയ്യുന്നത്, data models, state management എന്നിവ പഠിക്കുമ്പോൾ, ഈ ഉള്ളടക്കങ്ങൾ വീണ്ടും വീണ്ടും ഉപയോഗിക്കപ്പെടും.
