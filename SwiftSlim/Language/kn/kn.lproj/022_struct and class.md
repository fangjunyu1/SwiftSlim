# struct ಮತ್ತು class

ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ, ನಾವು ಇಷ್ಟೇ `struct` ಅನ್ನು ಪರಿಚಯವಾಗಿ ನೋಡಲು ಪ್ರಾರಂಭಿಸಿದ್ದೇವೆ, ಒಂದು structure ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿದ್ದೇವೆ, ಜೊತೆಗೆ protocol, `UUID` ಮುಂತಾದ ವಿಷಯಗಳನ್ನೂ ಹೆಚ್ಚುವರಿಯಾಗಿ ಕಲಿತಿದ್ದೇವೆ.

ಈಗ `struct` keyword ಬಗ್ಗೆ ನಮಗೆ ಆರಂಭಿಕ ಅರ್ಥವಾಗಿದೆ, ಆದರೆ ಅದನ್ನು ನಿಜವಾಗಿಯೂ ಸಂಪೂರ್ಣವಾಗಿ ಅರ್ಥ ಮಾಡಿಕೊಂಡಿದ್ದೇವೆ ಎಂದು ಇನ್ನೂ ಹೇಳಲಾಗುವುದಿಲ್ಲ.

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು `struct` ಅನ್ನು ಮುಖ್ಯ ವಿಷಯವಾಗಿ ಮುಂದುವರಿಸುತ್ತೇವೆ, ಮತ್ತು ಜೊತೆಯಾಗಿ `class`ನ್ನೂ ಪರಿಚಯಿಸಿಕೊಳ್ಳುತ್ತೇವೆ. ಈ ಪಾಠದ ಮೂಲಕ, instance ಎಂದರೆ ಏನು, constructor ಎಂದರೆ ಏನು, ಮತ್ತು ನಾವು `struct` ಮತ್ತು `class` ಬಳಸಿ data ಅನ್ನು ಏಕೆ ಸಂಘಟಿಸಬಹುದು ಎಂಬುದು ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ.

## ವಿದ್ಯಾರ್ಥಿ ನಿರ್ವಹಣಾ ವ್ಯವಸ್ಥೆ

ಉದಾಹರಣೆಗೆ, ಈಗ ನಾವು ಒಂದು ವಿದ್ಯಾರ್ಥಿ ನಿರ್ವಹಣಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಲು ಬಯಸುತ್ತೇವೆ. ಪ್ರತಿ ವಿದ್ಯಾರ್ಥಿಗೂ ಹೆಸರು, ಲಿಂಗ, ಫೋನ್, ವಯಸ್ಸು, ಮನೆಯ ವಿಳಾಸ ಇತ್ಯಾದಿ ಮಾಹಿತಿಗಳು ಇರುತ್ತವೆ.

ಈ ಸಮಯದಲ್ಲಿ, ನಾವು ಈ ಮಾಹಿತಿಗಳನ್ನೆಲ್ಲ ಒಂದುಗೂಡಿಸಿ `Student` structure ಆಗಿ ವ್ಯಾಖ್ಯಾನಿಸಬಹುದು:

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

ಇಲ್ಲಿ ನಾವು `struct` ಅನ್ನು ಬಳಸಿ ಒಂದು ವಿದ್ಯಾರ್ಥಿ type ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿದ್ದೇವೆ.

ಈ `Student` structure ನಲ್ಲಿ ಹಲವು properties ಸೇರಿವೆ:

- `id`: ವಿದ್ಯಾರ್ಥಿಯ ಏಕೈಕ ಗುರುತು
- `name`: ವಿದ್ಯಾರ್ಥಿಯ ಹೆಸರು
- `sex`: ವಿದ್ಯಾರ್ಥಿಯ ಲಿಂಗ
- `phone`: ವಿದ್ಯಾರ್ಥಿಯ ಫೋನ್
- `age`: ವಿದ್ಯಾರ್ಥಿಯ ವಯಸ್ಸು
- `address`: ಮನೆಯ ವಿಳಾಸ

ಈ ರೀತಿ, ಮೊದಲು ಬೇರೆ ಬೇರೆ ಇದ್ದ ಹಲವು data ಸೇರಿ ಒಂದು ಸಂಪೂರ್ಣ "ವಿದ್ಯಾರ್ಥಿ" ಆಗುತ್ತದೆ.

ಇಲ್ಲಿನ `Student` `Identifiable` protocol-ನನ್ನೂ ಅನುಸರಿಸುತ್ತದೆ, ಮತ್ತು `id` field ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ, ಇದರಿಂದ ಮುಂದೆ `ForEach` loop ಜೊತೆಗೆ data ಪ್ರದರ್ಶನ ಸುಲಭವಾಗುತ್ತದೆ.

ನಂತರ, ನಾವು ಒಂದು ವಿದ್ಯಾರ್ಥಿ instance ಅನ್ನು ರಚಿಸಬಹುದು:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ಈ code ಹೇಳುವುದೇನಂದರೆ, `Student` ಎಂಬ ರಚನೆಯ ಆಧಾರದ ಮೇಲೆ ಒಂದು ನಿರ್ದಿಷ್ಟ ವಿದ್ಯಾರ್ಥಿ data ಅನ್ನು ರಚಿಸಬಹುದು.

ಇಲ್ಲಿ `Student` type ಆಗಿದೆ, ಮತ್ತು `Student(...)` ಎಂದರೆ ರಚಿಸಲಾದ ಒಂದು instance.

SwiftUI ನಲ್ಲಿ, ನಾವು ಈ instance ಅನ್ನು ಒಂದು variable ಗೆ assign ಮಾಡಿ ನಂತರ ಅದನ್ನು ಪ್ರದರ್ಶಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

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

ಈ ರೀತಿಯಾಗಿ, view ನಲ್ಲಿ ಈ ವಿದ್ಯಾರ್ಥಿಯ ಹೆಸರು `Fang Junyu` ಅನ್ನು ನೋಡಬಹುದು.

ಇಲ್ಲಿ, ಮೊದಲಿಗೆ ನಾವು `Student` instance ರಚಿಸಿದ್ದೇವೆ, ನಂತರ ಅದನ್ನು `student` variable ಗೆ assign ಮಾಡಿದ್ದೇವೆ, ಕೊನೆಯಲ್ಲಿ `student.name` ಮೂಲಕ ಅದರ property ಅನ್ನು ಓದಿದ್ದೇವೆ.

## instance ಎಂದರೆ ಏನು

ನಾವು `struct` ಕಲಿಯಲು ಶುರು ಮಾಡಿದಾಗ, "instance" ಎಂಬ ಪದ ತುಂಬಾ ಹೊಸದಾಗಿ ಕಾಣಬಹುದು.

ಆದರೆ ವಾಸ್ತವವಾಗಿ, ನಾವು ಮೊದಲಿನಿಂದಲೇ instances ಅನ್ನು ಬಳಸುತ್ತಿದ್ದೇವೆ, ಕೇವಲ ಅದನ್ನು ವಿಶೇಷವಾಗಿ ಗಮನಿಸಿರಲಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

```swift
let name = "Fang Junyu"
```

ಇಲ್ಲಿ `"Fang Junyu"` ಒಂದು string value ಆಗಿದೆ, ಮತ್ತು ಅದರ ಮೂಲಸ್ವರೂಪದಲ್ಲಿ ಅದು `String` type‌ನ instance ಆಗಿದೆ.

ಇದನ್ನು ನಾವು ಹೀಗೆ ಕೂಡ ಬರೆಯಬಹುದು:

```swift
let name = String("Fang Junyu")
```

ಈ ಎರಡೂ ಬರವಣಿಗೆಗಳು ಒಂದೇ ಅರ್ಥವನ್ನು ಸೂಚಿಸುತ್ತವೆ: `String` type‌ನ instance ರಚಿಸಿ ಅದನ್ನು `name` variable ಗೆ assign ಮಾಡುವುದು.

ಹಾಗೆಯೇ, `Int` ಗೂ ಇದೇ ಅನ್ವಯಿಸುತ್ತದೆ:

```swift
let num = 3
```

ಇಲ್ಲಿ `3` ಮೂಲತಃ `Int` type‌ನ value ಆಗಿದ್ದು, ಅದನ್ನು `Int` instance ಎಂದೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ಆದ್ದರಿಂದ, instance ಎಂಬುದು `struct` ಒಳಗೆ ಮಾತ್ರ ಕಾಣುವ ವಿಶೇಷ ಕಲ್ಪನೆ ಅಲ್ಲ.

`String`, `Int`, `Double`, `Bool`, ಅಥವಾ custom `Student` ಯಾವುದು ಆಗಿರಲಿ, ಇವೆಲ್ಲವೂ instances ರಚಿಸಬಹುದು.

ಆದ್ದರಿಂದ, ನಾವು ಹೀಗೆ ಬರೆಯುವಾಗ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ಇದು ಮೂಲಭೂತವಾಗಿ `String` ಅಥವಾ `Int` instance ರಚಿಸುವಂತೆಯೇ ಆಗಿದೆ, ವ್ಯತ್ಯಾಸವೆಂದರೆ `Student` ಅನ್ನು ನಾವು ಸ್ವತಃ ವ್ಯಾಖ್ಯಾನಿಸಿದ type ಆಗಿದೆ.

## constructor

ನಾವು ಒಂದು instance ರಚಿಸುವಾಗ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ವಾಸ್ತವವಾಗಿ ನಾವು `Student`-ನ initialization method ಆದ `init`-ಅನ್ನು call ಮಾಡುತ್ತಿದ್ದೇವೆ.

constructor ಅನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: **instance ರಚಿಸುವಾಗ properties ಗೆ values ನೀಡುವ ಪ್ರವೇಶದ್ವಾರ ಇದು.**

ಅಂದರೆ, ಒಂದು instance ನಿಜವಾಗಿ ಪೂರ್ಣವಾಗಿ ರಚನೆಯಾಗುವ ಮೊದಲು, ಅದು ಸಾಮಾನ್ಯವಾಗಿ ಮೊದಲು `init` ಮೂಲಕ ಹೋಗಬೇಕು.

ಉದಾಹರಣೆಗೆ, ಹಿಂದೆ SwiftUI view lifecycle ಕಲಿತಾಗ ನಾವು ಈ ರೀತಿಯ code ಬರೆದಿದ್ದೇವೆ:

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

ಇಲ್ಲಿ `init()` `ContentView` instance ರಚನೆಯಾಗುವಾಗ ನಡೆಯುತ್ತದೆ, ಆದರೆ `onAppear` view ನಿಜವಾಗಿಯೂ screen ಮೇಲೆ ತೋರಿಸಿದಾಗ ಮಾತ್ರ ನಡೆಯುತ್ತದೆ. ಅಂದರೆ, view ರಚನೆ ಮತ್ತು view ಪ್ರದರ್ಶನ ಒಂದೇ ಸಮಯದಲ್ಲಿರುವುದಿಲ್ಲ.

ಅದೇ ರೀತಿ, ನಾವು `Student(...)` ರಚಿಸುವಾಗಲೂ `Student`-ನ constructor ಅನ್ನು call ಮಾಡುತ್ತಿದ್ದೇವೆ.

### ವ್ಯವಸ್ಥೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸುವ constructor

ನಾವು `Student` ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿದಾಗ, `init` ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯಲಿಲ್ಲ:

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

ಆದರೂ ಸಹ, ನಾವು ನೇರವಾಗಿ instance ರಚಿಸಬಹುದು:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor ಬರೆಯದೆ instance ರಚಿಸಲು ಸಾಧ್ಯವಾಗುವುದಕ್ಕೆ ಕಾರಣವೇನು?

ಏಕೆಂದರೆ `struct`ಗಾಗಿ, ನಾವು constructor ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯದಿದ್ದರೆ, ವ್ಯವಸ್ಥೆ ಸಾಮಾನ್ಯವಾಗಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಒಂದು ಸರಿಯಾದ constructor ಅನ್ನು ರಚಿಸುತ್ತದೆ.

ಕಲಿಕೆಯ ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ ಇದನ್ನು ಸರಳವಾಗಿ ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: Swift ನಮ್ಮ ಪರವಾಗಿ initialization code ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತುಂಬುತ್ತದೆ.

ಸರಿಸುಮಾರು, ವ್ಯವಸ್ಥೆ ನಮ್ಮಗಾಗಿ ಈ ಕೆಳಗಿನ code ಅನ್ನು ತುಂಬಿಸುತ್ತದೆ ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು:

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

ಇಲ್ಲಿ ಒಂದು ಸಣ್ಣ ವಿಷಯ ಗಮನಿಸಬೇಕಿದೆ:

```swift
let id = UUID()
```

`id` ಗೆ ಈಗಾಗಲೇ default value ಇದೆ, ಆದ್ದರಿಂದ instance ರಚಿಸುವಾಗ ನಾವು `id` ಅನ್ನು ಮತ್ತೆ ಕೈಯಾರೆ ಕೊಡಬೇಕಾಗಿಲ್ಲ.

ಅಂದರೆ, default value ಇಲ್ಲದ properties ಅನ್ನು ಸಾಮಾನ್ಯವಾಗಿ constructor ನಲ್ಲಿ ಕೊಡಬೇಕು; ಈಗಾಗಲೇ default value ಇರುವ properties ಗಳು ಆ ಮೂಲ default value ಯನ್ನೇ ನೇರವಾಗಿ ಬಳಸಬಹುದು.

ಆದ್ದರಿಂದ, `Student` instance ರಚಿಸುವಾಗ ನಮಗೆ `name`, `sex`, `phone`, `age`, ಮತ್ತು `address` ಮಾತ್ರ ಕೊಡಬೇಕಾಗುತ್ತದೆ.

### compiler ಸೂಚನೆಗಳು

ಇದರ ಜೊತೆಗೆ, Xcode ನಲ್ಲಿ ನಾವು `Student(...)` ಎಂದು ಟೈಪ್ ಮಾಡಿದಾಗ, ವ್ಯವಸ್ಥೆ ಕೊಡುವ parameter hints ನ್ನೂ ನೋಡಬಹುದು.

![student](../../Resource/022_student.png)

ಇದು ಪ್ರಸ್ತುತ ಈ type ಗೆ ವ್ಯವಸ್ಥೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಿದ constructor ನಿಜವಾಗಿಯೂ ಇದೆ ಎಂಬುದನ್ನೂ ತೋರಿಸುತ್ತದೆ.

### ನಾವು ಸ್ವತಃ constructor ಬರೆಯುವುದು

ವ್ಯವಸ್ಥೆ constructor ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಬಹುದಾದರೂ, ಕೆಲವೊಮ್ಮೆ ಈ default initialization ವಿಧಾನವು ನಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ ಸಂಪೂರ್ಣವಾಗಿ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, ನಮ್ಮ ಬಳಿ `Movie` structure ಇದೆ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ವ್ಯವಸ್ಥೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಿದ constructor ಪ್ರಕಾರ, instance ರಚಿಸುವಾಗ ನಾವು ಈ ಮೂರೂ parameters ಗಳನ್ನು ಒಂದೇ ಸಮಯದಲ್ಲಿ ಕೊಡಬೇಕು:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ಆದರೆ ಈಗ ನಾವು ಕೆಲವು ಹಳೆಯ ಸಿನಿಮಾಗಳ data ನಮೂದಿಸಬೇಕು, ಮತ್ತು ಸಿನಿಮಾ ಹೆಸರನ್ನು ಮಾತ್ರ ತಿಳಿದಿದ್ದೇವೆ, director ಹಾಗೂ rating ಗೊತ್ತಿಲ್ಲ ಎಂದರೆ, ಇದು ಸ್ವಲ್ಪ ಅಸೌಕರ್ಯವಾಗುತ್ತದೆ.

ಏಕೆಂದರೆ ಆಗ ನಾವು ಹೀಗೆ ಮಾತ್ರ ಬರೆಯಬಹುದು:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ಇದು ಕೆಲಸ ಮಾಡಿದರೂ, ಪ್ರತಿಸಾರಿ `--` ಅನ್ನು ಪುನರಾವರ್ತಿಸಿ ಬರೆಯುವುದು ಅನುಕೂಲಕರವಲ್ಲ.

ಆ ಸಮಯದಲ್ಲಿ, ನಾವು ಒಂದು constructor ಬರೆಯಬಹುದು:

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

ಈ ರೀತಿ, ಹಳೆಯ ಸಿನಿಮಾಗಳನ್ನು ರಚಿಸುವಾಗ `name` ಮಾತ್ರ ಕೊಟ್ಟರೆ ಸಾಕಾಗುತ್ತದೆ:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

ಇದು ನಾವು ಸ್ವತಃ constructor ಬರೆಯುವ ಒಂದು ಅರ್ಥ: **instance ರಚಿಸುವ ವಿಧಾನವನ್ನು ನೈಜ ಅಗತ್ಯಗಳಿಗೆ ಇನ್ನಷ್ಟು ಹೊಂದುವಂತೆ ಮಾಡುವುದು.**

### custom constructor ಅನ್ನು ವಿಶ್ಲೇಷಿಸುವುದು

ಇದೀಗ ನಾವು ಕೈಯಾರೆ ಬರೆದ ಈ constructor ಅನ್ನು ನೋಡೋಣ:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ಈ code ನ ಅರ್ಥವೆಂದರೆ, `Movie` instance ರಚಿಸುವಾಗ ಒಂದು `name` parameter ಮಾತ್ರ ಕೊಟ್ಟರೆ ಸಾಕು.

ಅನಂತರ constructor ಒಳಗೆ, ಕೊಟ್ಟಿರುವ `name` ಅನ್ನು instance ನ ಸ್ವಂತ `name` ಗೆ assign ಮಾಡಲಾಗುತ್ತದೆ, ಮತ್ತು `director` ಹಾಗೂ `rating` ಗೆ default value `--` ನೀಡಲಾಗುತ್ತದೆ.

ಇಲ್ಲಿ `self` ಎಂದರೆ "ಈ ಪ್ರಸ್ತುತ instance ತಾನೇ".

ಉದಾಹರಣೆಗೆ:

```swift
self.name = name
```

ಎಡಭಾಗದ `self.name` instance ಒಳಗಿನ property ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ; ಬಲಭಾಗದ `name` ನಾವು ಕೊಟ್ಟ parameter ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಇದನ್ನು ಸರಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದಾದರೆ, ಹೊರಗಿನಿಂದ ಬಂದ value ಅನ್ನು instance ನ ಸ್ವಂತ property ಯಲ್ಲಿ ಉಳಿಸುವುದು.

ಎಲ್ಲ properties ಗಳಿಗೂ values assign ಆದ ನಂತರ, ಈ instance ರಚನೆ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆ.

### constructor ಕಾರ್ಯವಿಧಾನ

ನಾವು ಸ್ಪಷ್ಟವಾಗಿ ಒಂದು constructor ಅನ್ನು declare ಮಾಡಿದಾಗ, ಮತ್ತೊಂದು ಬದಲಾವಣೆಯೂ ಆಗುತ್ತದೆ:

ವ್ಯವಸ್ಥೆ ಮೊದಲಿಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಿದ constructor ಅನ್ನು ಸಾಮಾನ್ಯವಾಗಿ ನೇರವಾಗಿ ಬಳಸಲು ಆಗುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

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

ಈಗ ನಾವು ಮತ್ತೆ ಹೀಗೆ ಬರೆದರೆ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler error ತೋರಿಸುತ್ತದೆ:

```swift
Extra arguments at positions #2, #3 in call
```

ಇದರಿಂದ ಅರ್ಥ: ನೀನು ಹೆಚ್ಚುವರಿ parameters ಕೊಟ್ಟಿದ್ದೀಯೆ.

ಈ error ಏಕೆ ಬರುತ್ತದೆ?

ಏಕೆಂದರೆ ಪ್ರಸ್ತುತ `Movie` structure ಒಳಗೆ ನೀನು ಕೈಯಾರೆ declare ಮಾಡಿದ ಈ ಒಂದು constructor ಮಾತ್ರ ಇದೆ:

```swift
init(name: String)
```

ಇದು `name` ಎಂಬ ಒಂದೇ parameter ಅನ್ನು ಸ್ವೀಕರಿಸುತ್ತದೆ; `director` ಮತ್ತು `rating` ಅನ್ನು ಸ್ವೀಕರಿಸುವುದಿಲ್ಲ.

ಅಂದರೆ, ನೀನು ನಿನ್ನದೇ constructor ಕೈಯಾರೆ ಸೇರಿಸಿದ ನಂತರ, ಮೊದಲಿನ ಸ್ವಯಂಚಾಲಿತ initialization ವಿಧಾನವನ್ನು ನೇರವಾಗಿ ಬಳಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

ನಾವು "ಹೆಸರು ಮಾತ್ರ ಕೊಡುವುದು" ಮತ್ತು "ಪೂರ್ಣ ಮಾಹಿತಿಯನ್ನು ಕೊಡುವುದು" ಎರಡನ್ನೂ support ಮಾಡಬೇಕೆಂದರೆ, ಮತ್ತೊಂದು ಸಂಪೂರ್ಣ constructor ಅನ್ನು ನಾವು ಸ್ವತಃ ಸೇರಿಸಬೇಕಾಗುತ್ತದೆ:

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

ಈ ರೀತಿ, ನಮ್ಮ ಬಳಿ ಎರಡು ಬೇರೆ constructors ಇರುತ್ತವೆ.

ಹಳೆಯ ಸಿನಿಮಾವನ್ನು ರಚಿಸುವಾಗ, ನಾವು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
Movie(name: "The Night of the Hunter")
```

ಪೂರ್ಣ ಮಾಹಿತಿಯೊಂದಿಗೆ ಹೊಸ ಸಿನಿಮಾವನ್ನು ರಚಿಸುವಾಗ, ನಾವು ಹೀಗೆ ಬರೆಯಬಹುದು:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ಈ ರೀತಿಯ ಬರವಣಿಗೆ, ಒಂದೇ type ಗೆ parameters ರೂಪ ಬೇರೆ ಇದ್ದರೆ ಅನೇಕ constructors ಇರಬಹುದು ಎಂಬುದನ್ನೂ ತೋರಿಸುತ್ತದೆ.

## overload ಎಂದರೆ ಏನು

ಇಲ್ಲಿ ಮತ್ತೊಂದು ಅಗತ್ಯ ಜ್ಞಾನವನ್ನು ಸೇರಿಸೋಣ.

ಇದೀಗ ನಾವು `Movie` ಗಾಗಿ ಎರಡು `init`ಗಳನ್ನು ಬರೆದಿದ್ದೇವೆ:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

ಈ ರೀತಿಯ ಬರವಣಿಗೆ, ಅಂದರೆ "ಒಂದೇ function name ಆದರೆ ಬೇರೆ parameters", ಇದನ್ನು "overload" ಎಂದು ಕರೆಯುತ್ತಾರೆ.

ಇಲ್ಲಿ ಎರಡೂ functions ಹೆಸರು `init` ಆಗಿದ್ದರೂ, ಅವು ಬೇರೆ parameters ಪಡೆಯುವುದರಿಂದ, Swift ನೀನು ಯಾವ function ಅನ್ನು call ಮಾಡುತ್ತಿದ್ದೀಯೆ ಎಂಬುದನ್ನು ಗುರುತಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Movie(name: "Days of Heaven")
```

ಇದು call ಮಾಡುವುದೇ:

```swift
init(name: String)
```

ಮತ್ತೊಂದು ಕಡೆ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ಇದು initialization method‌ನ ಇನ್ನೊಂದು ಸಂಪೂರ್ಣ version ಅನ್ನು call ಮಾಡುತ್ತದೆ.

ಹೀಗಾಗಿ overload ನ ಪಾತ್ರವೆಂದರೆ, ಒಂದೇ type ಗೆ ಬೇರೆ ಬೇರೆ ಸಂದರ್ಭಗಳಿಗೆ ಬೇರೆ ಬೇರೆ ರಚನಾ ವಿಧಾನಗಳನ್ನು ಒದಗಿಸಲು ಅವಕಾಶ ಕೊಡುವುದು.

## class ಪರಿಚಯ

ಮುಂದೆ, ಸಂಕ್ಷಿಪ್ತವಾಗಿ `class`ನ್ನೂ ಪರಿಚಯಿಸಿಕೊಳ್ಳೋಣ.

Swift ನಲ್ಲಿ ಸಾಮಾನ್ಯವಾದ `struct` ಹೊರತಾಗಿ, ಅನೇಕ programming languages instances ರಚಿಸಲು `class` ಅನ್ನು ಬಳಸುತ್ತವೆ, ಉದಾಹರಣೆಗೆ Java, C#, Kotlin ಮುಂತಾದವು.

Swift ನಲ್ಲಿ `class` ಬರೆಯುವ ವಿಧಾನ `struct`ಗೆ ತುಂಬ ಹತ್ತಿರವಾಗಿದೆ.

ಉದಾಹರಣೆಗೆ:

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

ನೀನು ಗಮನಿಸುವುದು ಏನೆಂದರೆ, `struct` keyword ಬದಲು `class` ಆಗಿರುವುದನ್ನು ಹೊರತುಪಡಿಸಿ, ಉಳಿದ ಭಾಗಗಳು ಬಹುತೇಕ ಒಂದೇ ರೀತಿಯಾಗಿ ಕಾಣುತ್ತವೆ.

instance ರಚಿಸುವ ವಿಧಾನವೂ ಬಹಳ ಹತ್ತಿರವಾಗಿರುತ್ತದೆ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ಹೀಗಾಗಿ syntax ಮಟ್ಟದಲ್ಲಿ `struct` ಮತ್ತು `class` ನಿಜವಾಗಿಯೂ ತುಂಬ ಹೋಲಿಕೆ ಹೊಂದಿವೆ.

### Struct ಮತ್ತು Class ನಡುವಿನ ವ್ಯತ್ಯಾಸ

`struct` ಮತ್ತು `class` ತುಂಬ ಹೋಲುತ್ತಿದ್ದರೂ, ಅವು ಸಂಪೂರ್ಣ ಒಂದೇ ಅಲ್ಲ.

**1. initialization ವಿಧಾನ ಬೇರೆ**

`struct`ಗಾಗಿ, ನಾವು constructor ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯದಿದ್ದರೆ, ವ್ಯವಸ್ಥೆ ಸಾಮಾನ್ಯವಾಗಿ ಸರಿಯಾದ initialization method ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸುತ್ತದೆ.

ಆದರೆ `class`ಗಾಗಿ, default value ಇಲ್ಲದ properties ಇದ್ದರೆ, ಸಾಮಾನ್ಯವಾಗಿ `init` ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯಬೇಕು; ಇಲ್ಲದಿದ್ದರೆ error ಬರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ಈ `class` ಗೆ constructor ಇಲ್ಲದ ಕಾರಣ properties initialize ಆಗುವುದಿಲ್ಲ, ಆದ್ದರಿಂದ error ಬರುತ್ತದೆ.

compiler ಸಾಮಾನ್ಯವಾಗಿ ಈ ರೀತಿಯ ಸೂಚನೆಯನ್ನು ತೋರಿಸುತ್ತದೆ:

```swift
Class 'Movie' has no initializers
```

ಆದ್ದರಿಂದ, ಈ ಉದಾಹರಣೆಯಲ್ಲಿ `class`ಗಾಗಿ constructor ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯುವುದು ಅಗತ್ಯ.

**2. `struct` ಒಂದು value type, `class` ಒಂದು reference type**

`struct` value type ಆಗಿದೆ, ಮತ್ತು `class` reference type ಆಗಿದೆ.

ಕಲಿಕೆಯ ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ, ಈ ಎರಡು concepts ಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತಿಳಿದುಕೊಳ್ಳುವ ಅಗತ್ಯವಿಲ್ಲ; ಸರಳವಾದ ಆರಂಭಿಕ ಕಲ್ಪನೆ ಇದ್ದರೆ ಸಾಕು.

ಉದಾಹರಣೆಗೆ, `struct` ಎಂದರೆ "ಹೊಸ value ಯ copy" ಎಂಬ ಕಲ್ಪನೆಗೆ ಹೆಚ್ಚು ಹತ್ತಿರ.

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

ಇಲ್ಲಿ `user1` ಅನ್ನು `user2` ಗೆ assign ಮಾಡಿದ ನಂತರ, ಮೂಲತಃ ಹೊಸ data copy ಆಗುತ್ತದೆ, ಆದ್ದರಿಂದ `user2` ಅನ್ನು ಬದಲಿಸಿದರೂ `user1` ಮೇಲೆ ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ.

ಇನ್ನೊಂದು ಕಡೆ, `class` ಎಂದರೆ "ಒಂದೇ instance ಗೆ ಸೇರಿ ಸೂಚಿಸುವುದು" ಎಂಬ ಕಲ್ಪನೆಗೆ ಹೆಚ್ಚು ಹತ್ತಿರ.

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

ಇಲ್ಲಿ `user1` ಮತ್ತು `user2` ಒಂದೇ instance ಅನ್ನು ಸೂಚಿಸುತ್ತವೆ.

ಈಗ value type ಮತ್ತು reference type ಒಳಗಿನ ಮೂಲ ಕಾರ್ಯವಿಧಾನವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕಾಗಿಲ್ಲ; `struct` ಸ್ವತಂತ್ರ data ಉಳಿಸಲು ಹೆಚ್ಚು ಸೂಕ್ತ, ಮತ್ತು `class` ಅನೇಕ ಕಡೆ ಒಂದೇ instance share ಮಾಡಬೇಕಾದ ಸಂದರ್ಭಗಳಲ್ಲಿ ಹೆಚ್ಚು ಸೂಕ್ತ ಎಂದು ತಿಳಿದಿದ್ದರೆ ಸಾಕು.

## ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ ಹೇಗೆ ಆಯ್ಕೆಮಾಡಬೇಕು

ಪ್ರಸ್ತುತ ಹಂತದಲ್ಲಿ ಸಾಮಾನ್ಯ data models ಗಾಗಿ ಮೊದಲು `struct` ಅನ್ನು ಪರಿಗಣಿಸಬೇಕು; shared data ಮತ್ತು synchronized changes ಬೇಕಾದರೆ `class` ಅನ್ನು ಪರಿಗಣಿಸಬೇಕು.

ಇದು ಸಂಪೂರ್ಣ ನಿಯಮವಲ್ಲ, ಆದರೆ ಆರಂಭಿಕರಿಗೆ ಸಾಕಷ್ಟು ಉಪಯುಕ್ತವಾದ ನಿರ್ಧಾರ ವಿಧಾನವಾಗಿದೆ.

ವಿಶೇಷವಾಗಿ SwiftUI ನಲ್ಲಿ, ಅನೇಕ ಬಾರಿ `struct` ಒಂದರಲ್ಲೇ ಹೆಚ್ಚಿನ ಕೆಲಸ ಸಾಧ್ಯವಾಗುವುದನ್ನು ನೀನು ಕಾಣುವೆ.

ಇದಲ್ಲದೆ, ಅನೇಕ programming materialsಗಳಲ್ಲಿ `class` ಮೂಲಕ ರಚಿಸಲಾದದ್ದನ್ನು "object" ಎಂದೂ ಕರೆಯುತ್ತಾರೆ. ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ, ಅದನ್ನು instance ಎಂದು ಸರಳವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಂಡರೆ ಸಾಕು; ಅವುಗಳನ್ನು ಬಲವಂತವಾಗಿ ಬೇರ್ಪಡಿಸುವ ಅಗತ್ಯವಿಲ್ಲ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು `struct` ಅನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ಕಲಿತಿದ್ದೇವೆ, ಮತ್ತು ಜೊತೆಯಲ್ಲಿ `class`ನ್ನೂ ಪರಿಚಯಿಸಿಕೊಂಡಿದ್ದೇವೆ. ಇವೆರಡನ್ನೂ types ಅನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಲು ಬಳಸಬಹುದು.

Types instances ಅನ್ನು ರಚಿಸಬಹುದು. Instance ರಚಿಸುವಾಗ constructor, ಅಂದರೆ `init`, call ಆಗುತ್ತದೆ.

`struct`ಗಾಗಿ, ನಾವು constructor ಅನ್ನು ಕೈಯಾರೆ ಬರೆಯದಿದ್ದರೆ, ವ್ಯವಸ್ಥೆ ಸಾಮಾನ್ಯವಾಗಿ ಸರಿಯಾದ constructor ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸುತ್ತದೆ. Default constructor ಅಗತ್ಯಗಳನ್ನು ಪೂರೈಸದಿದ್ದರೆ, ನಾವು ಸ್ವತಃ constructor ಅನ್ನು ಬರೆಯಬಹುದು.

ಇದರ ಜೊತೆಗೆ, `struct` ಮತ್ತು `class` ನಡುವಿನ ವ್ಯತ್ಯಾಸದ ಬಗ್ಗೆ ಪ್ರಾಥಮಿಕ ತಿಳುವಳಿಕೆಯೂ ನಮಗೆ ಬಂದಿದೆ: `struct` value type ಆಗಿದ್ದು, `class` reference type ಆಗಿದೆ. SwiftUI ಯಲ್ಲಿ ಆರಂಭಿಕ ಹಂತದಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚು ಕಾಣಿಸಿಕೊಳ್ಳುವುದು `struct` ಆಗಿರುತ್ತದೆ.

ಮುಂದೆ views ನಡುವೆ value pass ಮಾಡುವುದು, data models ಮತ್ತು state management ಕಲಿಯುವಾಗ, ಈ ಎಲ್ಲ ವಿಷಯಗಳೂ ಮುಂದುವರಿದು ಬಳಕೆಯಾಗುತ್ತವೆ.
