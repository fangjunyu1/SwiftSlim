# struct ਅਤੇ class

ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਹੁਣੇ ਹੀ `struct` ਨਾਲ ਜਾਣ-ਪਹਿਚਾਣ ਕਰਨੀ ਸ਼ੁਰੂ ਕੀਤੀ ਸੀ, ਇੱਕ structure ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ ਸੀ, ਅਤੇ ਨਾਲ ਹੀ protocol, `UUID` ਵਰਗੀਆਂ ਗੱਲਾਂ ਵੀ ਵਧੇਰੇ ਸਿੱਖੀਆਂ ਸਨ।

ਹੁਣ `struct` keyword ਬਾਰੇ ਸਾਡੀ ਇੱਕ ਮੁੱਢਲੀ ਸਮਝ ਬਣ ਗਈ ਹੈ, ਪਰ ਇਸ ਨੂੰ ਅਜੇ ਵੀ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਮਝ ਲਿਆ ਹੈ, ਇਹ ਨਹੀਂ ਕਿਹਾ ਜਾ ਸਕਦਾ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ `struct` ਨੂੰ ਹੀ ਮੁੱਖ ਵਿਸ਼ਾ ਬਣਾਕੇ ਅੱਗੇ ਵਧਾਂਗੇ, ਅਤੇ ਨਾਲ ਹੀ `class` ਨਾਲ ਵੀ ਜਾਣ-ਪਹਿਚਾਣ ਕਰਾਂਗੇ। ਇਸ ਪਾਠ ਦੇ ਰਾਹੀਂ, ਤੁਹਾਨੂੰ ਹੋਰ ਸਪੱਸ਼ਟ ਹੋਵੇਗਾ: instance ਕੀ ਹੁੰਦਾ ਹੈ, constructor ਕੀ ਹੁੰਦਾ ਹੈ, ਅਤੇ ਅਸੀਂ `struct` ਅਤੇ `class` ਦੀ ਵਰਤੋਂ ਕਰਕੇ data ਨੂੰ ਕਿਉਂ ਵਿਵਸਥਿਤ ਕਰ ਸਕਦੇ ਹਾਂ।

## ਵਿਦਿਆਰਥੀ ਪ੍ਰਬੰਧਨ ਪ੍ਰਣਾਲੀ

ਉਦਾਹਰਨ ਲਈ, ਹੁਣ ਅਸੀਂ ਇੱਕ ਵਿਦਿਆਰਥੀ ਪ੍ਰਬੰਧਨ ਪ੍ਰਣਾਲੀ ਵਿਕਸਿਤ ਕਰਨੀ ਚਾਹੁੰਦੇ ਹਾਂ। ਹਰ ਵਿਦਿਆਰਥੀ ਕੋਲ ਨਾਮ, ਲਿੰਗ, ਫ਼ੋਨ, ਉਮਰ, ਘਰ ਦਾ ਪਤਾ ਆਦਿ ਜਾਣਕਾਰੀ ਹੁੰਦੀ ਹੈ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਇਸ ਜਾਣਕਾਰੀ ਨੂੰ ਇਕੱਠਾ ਕਰਕੇ `Student` structure ਵਜੋਂ ਪਰਿਭਾਸ਼ਿਤ ਕਰ ਸਕਦੇ ਹਾਂ:

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

ਇੱਥੇ ਅਸੀਂ `struct` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੱਕ ਵਿਦਿਆਰਥੀ type ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ ਹੈ।

ਇਸ `Student` structure ਵਿੱਚ ਕਈ properties ਹਨ:

- `id`: ਵਿਦਿਆਰਥੀ ਦੀ ਵਿਲੱਖਣ ਪਛਾਣ
- `name`: ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ
- `sex`: ਵਿਦਿਆਰਥੀ ਦਾ ਲਿੰਗ
- `phone`: ਵਿਦਿਆਰਥੀ ਦਾ ਫ਼ੋਨ
- `age`: ਵਿਦਿਆਰਥੀ ਦੀ ਉਮਰ
- `address`: ਘਰ ਦਾ ਪਤਾ

ਇਸ ਤਰ੍ਹਾਂ, ਪਹਿਲਾਂ ਵੱਖ-ਵੱਖ ਥਾਵਾਂ 'ਤੇ ਮੌਜੂਦ ਕਈ data ਇਕੱਠੇ ਹੋ ਕੇ ਇੱਕ ਪੂਰਾ "ਵਿਦਿਆਰਥੀ" ਬਣ ਜਾਂਦੇ ਹਨ।

ਇੱਥੇ `Student` `Identifiable` protocol ਦੀ ਪਾਲਣਾ ਵੀ ਕਰਦਾ ਹੈ, ਅਤੇ ਇੱਕ `id` field ਪਰਿਭਾਸ਼ਿਤ ਕਰਦਾ ਹੈ, ਤਾਂ ਜੋ ਬਾਅਦ ਵਿੱਚ `ForEach` loop ਨਾਲ data ਦਿਖਾਉਣਾ ਆਸਾਨ ਹੋ ਜਾਵੇ।

ਫਿਰ, ਅਸੀਂ ਇੱਕ ਵਿਦਿਆਰਥੀ instance ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ਇਹ code ਦੱਸਦਾ ਹੈ ਕਿ `Student` ਇਸ structure ਦੇ ਅਨੁਸਾਰ ਇੱਕ ਖਾਸ ਵਿਦਿਆਰਥੀ data ਤਿਆਰ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਇੱਥੇ `Student` type ਹੈ, ਅਤੇ `Student(...)` ਇੱਕ ਬਣਾਇਆ ਗਿਆ instance ਦਰਸਾਉਂਦਾ ਹੈ।

SwiftUI ਵਿੱਚ, ਅਸੀਂ ਇਸ instance ਨੂੰ ਕਿਸੇ variable ਨੂੰ assign ਕਰਕੇ ਫਿਰ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

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

ਇਸ ਤਰ੍ਹਾਂ, ਅਸੀਂ view ਵਿੱਚ ਇਸ ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ `Fang Junyu` ਦੇਖ ਸਕਦੇ ਹਾਂ।

ਇੱਥੇ, ਅਸੀਂ ਪਹਿਲਾਂ `Student` ਦਾ ਇੱਕ instance ਬਣਾਇਆ, ਫਿਰ ਉਸਨੂੰ `student` variable ਨੂੰ assign ਕੀਤਾ, ਅਤੇ ਆਖ਼ਿਰ ਵਿੱਚ `student.name` ਰਾਹੀਂ ਉਸਦੀ property ਪੜ੍ਹੀ।

## instance ਕੀ ਹੈ

ਜਦੋਂ ਅਸੀਂ ਪਹਿਲੀ ਵਾਰ `struct` ਸਿੱਖਣ ਲੱਗਦੇ ਹਾਂ, "instance" ਸ਼ਬਦ ਕੁਝ ਅਣਜਾਣ ਲੱਗ ਸਕਦਾ ਹੈ।

ਪਰ ਅਸਲ ਵਿੱਚ, ਅਸੀਂ ਸ਼ੁਰੂ ਤੋਂ ਹੀ instances ਦੀ ਵਰਤੋਂ ਕਰ ਰਹੇ ਹਾਂ, ਸਿਰਫ਼ ਪਹਿਲਾਂ ਅਸੀਂ ਇਸ ਉੱਤੇ ਖ਼ਾਸ ਧਿਆਨ ਨਹੀਂ ਦਿੱਤਾ ਸੀ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let name = "Fang Junyu"
```

ਇੱਥੇ `"Fang Junyu"` ਇੱਕ string value ਹੈ, ਅਤੇ ਅਸਲ ਵਿੱਚ ਇਹ `String` type ਦਾ ਇੱਕ instance ਹੈ।

ਅਸੀਂ ਇਸ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਵੀ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
let name = String("Fang Junyu")
```

ਇਹ ਦੋਵੇਂ ਲਿਖਣ ਦੇ ਤਰੀਕੇ ਇੱਕੋ ਗੱਲ ਦੱਸਦੇ ਹਨ: `String` type ਦਾ ਇੱਕ instance ਬਣਾਉਣਾ ਅਤੇ ਉਸਨੂੰ `name` variable ਨੂੰ assign ਕਰਨਾ।

ਇਸੇ ਤਰ੍ਹਾਂ, `Int` ਲਈ ਵੀ ਇਹੀ ਗੱਲ ਸਹੀ ਹੈ:

```swift
let num = 3
```

ਇੱਥੇ `3` ਅਸਲ ਵਿੱਚ `Int` type ਦੀ ਇੱਕ value ਹੈ, ਅਤੇ ਇਸਨੂੰ `Int` instance ਵਜੋਂ ਵੀ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਇਸ ਲਈ, instance ਕੋਈ ਅਜਿਹਾ ਖ਼ਾਸ concept ਨਹੀਂ ਜੋ ਸਿਰਫ਼ `struct` ਵਿੱਚ ਹੀ ਵੇਖਣ ਨੂੰ ਮਿਲਦਾ ਹੋਵੇ।

ਚਾਹੇ `String`, `Int`, `Double`, `Bool`, ਜਾਂ custom `Student` ਹੋਵੇ, ਇਹ ਸਭ instances ਬਣਾ ਸਕਦੇ ਹਨ।

ਇਸ ਲਈ, ਜਦੋਂ ਅਸੀਂ ਲਿਖਦੇ ਹਾਂ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ਤਾਂ ਇਹ ਅਸਲ ਵਿੱਚ `String` ਜਾਂ `Int` ਦਾ instance ਬਣਾਉਣ ਵਰਗਾ ਹੀ ਹੈ, ਫ਼ਰਕ ਸਿਰਫ਼ ਇਹ ਹੈ ਕਿ `Student` ਇੱਕ type ਹੈ ਜਿਸਨੂੰ ਅਸੀਂ ਆਪ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ ਹੈ।

## constructor

ਜਦੋਂ ਅਸੀਂ ਇੱਕ instance ਬਣਾਉਂਦੇ ਹਾਂ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ਤਦ ਅਸਲ ਵਿੱਚ ਅਸੀਂ `Student` ਦੀ initialization method, ਯਾਨੀ `init`, ਨੂੰ call ਕਰ ਰਹੇ ਹੁੰਦੇ ਹਾਂ।

ਤੁਸੀਂ constructor ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹੋ: **instance ਬਣਾਉਂਦੇ ਸਮੇਂ properties ਨੂੰ values ਦੇਣ ਲਈ ਇਹ ਇੱਕ ਦਾਖਲਾ-ਬਿੰਦੂ ਹੈ।**

ਮਤਲਬ, ਕੋਈ instance ਸੱਚਮੁੱਚ ਪੂਰਾ ਤਿਆਰ ਹੋਣ ਤੋਂ ਪਹਿਲਾਂ ਆਮ ਤੌਰ 'ਤੇ ਪਹਿਲਾਂ `init` ਵਿਚੋਂ ਲੰਘਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਜਦੋਂ ਅਸੀਂ ਪਹਿਲਾਂ SwiftUI view lifecycle ਸਿੱਖਿਆ ਸੀ, ਤਦ ਅਸੀਂ ਐਸਾ code ਲਿਖਿਆ ਸੀ:

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

ਇੱਥੇ `init()` ਤਦ ਚੱਲਦਾ ਹੈ ਜਦੋਂ `ContentView` instance ਬਣਦਾ ਹੈ, ਜਦਕਿ `onAppear` ਤਦ ਹੀ ਚੱਲਦਾ ਹੈ ਜਦੋਂ view ਅਸਲ ਵਿੱਚ ਸਕ੍ਰੀਨ 'ਤੇ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ। ਅਰਥਾਤ, view ਦਾ ਬਣਨਾ ਅਤੇ view ਦਾ ਦਿਖਣਾ ਇੱਕੋ ਸਮੇਂ ਨਹੀਂ ਹੁੰਦਾ।

ਇਸੇ ਤਰ੍ਹਾਂ, ਜਦੋਂ ਅਸੀਂ `Student(...)` ਬਣਾਉਂਦੇ ਹਾਂ, ਤਦ ਵੀ ਅਸੀਂ `Student` ਦੇ constructor ਨੂੰ call ਕਰ ਰਹੇ ਹੁੰਦੇ ਹਾਂ।

### ਸਿਸਟਮ ਵੱਲੋਂ ਆਪਣੇ ਆਪ ਬਣਾਇਆ ਗਿਆ constructor

ਜਦੋਂ ਅਸੀਂ `Student` ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ ਸੀ, ਤਦ ਅਸੀਂ `init` ਨੂੰ ਹੱਥ ਨਾਲ ਨਹੀਂ ਲਿਖਿਆ ਸੀ:

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

ਫਿਰ ਵੀ, ਅਸੀਂ ਸਿੱਧਾ instance ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor ਲਿਖੇ ਬਿਨਾਂ instance ਕਿਵੇਂ ਬਣ ਸਕਦਾ ਹੈ?

ਕਿਉਂਕਿ `struct` ਲਈ, ਜੇ ਅਸੀਂ constructor ਹੱਥ ਨਾਲ ਨਹੀਂ ਲਿਖਦੇ, ਤਾਂ ਸਿਸਟਮ ਆਮ ਤੌਰ 'ਤੇ ਆਪਣੇ ਆਪ ਸਾਡੇ ਲਈ ਇੱਕ ਉਚਿਤ constructor ਬਣਾ ਦਿੰਦਾ ਹੈ।

ਸਿੱਖਣ ਦੇ ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ, ਇਸਨੂੰ ਸੌਖੇ ਤਰੀਕੇ ਨਾਲ ਐਸੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ: Swift ਸਾਡੇ ਲਈ initialization code ਆਪਣੇ ਆਪ ਪੂਰਾ ਕਰ ਦਿੰਦਾ ਹੈ।

ਲਗਭਗ ਐਸੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ ਕਿ ਸਿਸਟਮ ਸਾਡੇ ਲਈ ਹੇਠਾਂ ਦਿੱਤਾ code ਤਿਆਰ ਕਰਦਾ ਹੈ:

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

ਇੱਥੇ ਇੱਕ ਛੋਟੀ ਜਿਹੀ ਗੱਲ 'ਤੇ ਧਿਆਨ ਦੇਣਾ ਲਾਜ਼ਮੀ ਹੈ:

```swift
let id = UUID()
```

`id` ਕੋਲ ਪਹਿਲਾਂ ਹੀ default value ਹੈ, ਇਸ ਲਈ instance ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ `id` ਨੂੰ ਦੁਬਾਰਾ ਹੱਥ ਨਾਲ pass ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ।

ਮਤਲਬ, ਜਿਨ੍ਹਾਂ properties ਕੋਲ default value ਨਹੀਂ ਹੁੰਦੀ, ਉਹ ਆਮ ਤੌਰ 'ਤੇ constructor ਵਿੱਚ pass ਕਰਣੀਆਂ ਪੈਂਦੀਆਂ ਹਨ; ਅਤੇ ਜਿਨ੍ਹਾਂ properties ਕੋਲ ਪਹਿਲਾਂ ਹੀ default value ਹੁੰਦੀ ਹੈ, ਉਹ ਆਮ ਤੌਰ 'ਤੇ ਉਸੇ value ਨੂੰ ਸਿੱਧਾ ਵਰਤ ਸਕਦੀਆਂ ਹਨ।

ਇਸ ਲਈ `Student` instance ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ ਕੇਵਲ `name`, `sex`, `phone`, `age`, ਅਤੇ `address` pass ਕਰਨੇ ਪੈਂਦੇ ਹਨ।

### compiler ਦੇ hints

ਇਸ ਤੋਂ ਇਲਾਵਾ, ਜਦੋਂ ਅਸੀਂ Xcode ਵਿੱਚ `Student(...)` ਲਿਖਦੇ ਹਾਂ, ਤਾਂ ਸਿਸਟਮ ਵੱਲੋਂ ਦਿੱਤੇ ਗਏ parameter hints ਵੀ ਵੇਖ ਸਕਦੇ ਹਾਂ।

![student](../../Resource/022_student.png)

ਇਹ ਵੀ ਅਸਲ ਵਿੱਚ ਦੱਸਦਾ ਹੈ ਕਿ ਮੌਜੂਦਾ ਇਸ type ਲਈ ਸਿਸਟਮ ਵੱਲੋਂ ਆਪਣੇ ਆਪ ਬਣਾਇਆ ਗਿਆ constructor ਵਾਸਤਵ ਵਿੱਚ ਮੌਜੂਦ ਹੈ।

### ਆਪ constructor ਲਿਖਣਾ

ਹਾਲਾਂਕਿ ਸਿਸਟਮ constructor ਆਪਣੇ ਆਪ ਬਣਾ ਸਕਦਾ ਹੈ, ਪਰ ਕਈ ਵਾਰੀ ਇਹ default initialization ਤਰੀਕਾ ਸਾਡੀਆਂ ਲੋੜਾਂ ਨਾਲ ਪੂਰੀ ਤਰ੍ਹਾਂ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ।

ਉਦਾਹਰਨ ਲਈ, ਸਾਡੇ ਕੋਲ ਇੱਕ `Movie` structure ਹੈ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ਸਿਸਟਮ ਵੱਲੋਂ ਆਪਣੇ ਆਪ ਬਣਾਏ constructor ਦੇ ਮੁਤਾਬਕ, instance ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ ਇਹ ਤਿੰਨੋ parameters ਇਕੱਠੇ pass ਕਰਨੇ ਪੈਂਦੇ ਹਨ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ਪਰ ਜੇ ਹੁਣ ਅਸੀਂ ਕੁਝ ਪੁਰਾਣੀਆਂ ਫ਼ਿਲਮਾਂ ਦਾ data ਭਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ ਅਤੇ ਸਿਰਫ਼ ਫ਼ਿਲਮ ਦਾ ਨਾਮ ਹੀ ਜਾਣਦੇ ਹਾਂ, director ਅਤੇ rating ਨਹੀਂ, ਤਾਂ ਇਹ ਕੁਝ ਔਖਾ ਹੋ ਜਾਂਦਾ ਹੈ।

ਕਿਉਂਕਿ ਫਿਰ ਅਸੀਂ ਸਿਰਫ਼ ਇਸ ਤਰ੍ਹਾਂ ਹੀ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ਹਾਲਾਂਕਿ ਇਹ ਕੰਮ ਕਰਦਾ ਹੈ, ਪਰ ਹਰ ਵਾਰ `--` ਦੁਹਰਾਕੇ ਲਿਖਣਾ ਸੁਵਿਧਾਜਨਕ ਨਹੀਂ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਇੱਕ constructor ਲਿਖ ਸਕਦੇ ਹਾਂ:

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

ਇਸ ਤਰ੍ਹਾਂ, ਪੁਰਾਣੀਆਂ ਫ਼ਿਲਮਾਂ ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ ਸਿਰਫ਼ `name` pass ਕਰਨਾ ਪਵੇਗਾ:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

ਆਪ constructor ਲਿਖਣ ਦਾ ਇੱਕ ਮਤਲਬ ਇਹ ਹੈ: **instance ਬਣਾਉਣ ਦੇ ਤਰੀਕੇ ਨੂੰ ਅਸਲੀ ਲੋੜਾਂ ਨਾਲ ਹੋਰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਮਿਲਾਉਣਾ।**

### custom constructor ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ

ਆਓ, ਹੁਣੇ ਹੀ ਹੱਥ ਨਾਲ ਲਿਖੇ ਗਏ ਇਸ constructor ਨੂੰ ਵੇਖੀਏ:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ਇਸ code ਦਾ ਮਤਲਬ ਹੈ ਕਿ `Movie` instance ਬਣਾਉਂਦੇ ਸਮੇਂ ਸਾਨੂੰ ਕੇਵਲ ਇੱਕ `name` parameter ਦੇਣਾ ਲਾਜ਼ਮੀ ਹੈ।

ਫਿਰ constructor ਦੇ ਅੰਦਰ ਦਿੱਤਾ ਗਿਆ `name`, instance ਦੇ ਆਪਣੇ `name` ਨੂੰ assign ਕੀਤਾ ਜਾਵੇਗਾ, ਅਤੇ `director` ਅਤੇ `rating` ਨੂੰ default value `--` ਦਿੱਤੀ ਜਾਵੇਗੀ।

ਇੱਥੇ `self` ਦਾ ਅਰਥ ਹੈ "ਇਹ ਮੌਜੂਦਾ instance ਆਪ"।

ਉਦਾਹਰਨ ਲਈ:

```swift
self.name = name
```

ਖੱਬੇ ਪਾਸੇ ਵਾਲਾ `self.name` instance ਦੀ property ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ; ਸੱਜੇ ਪਾਸੇ ਵਾਲਾ `name` ਉਸ parameter ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ ਜੋ ਅਸੀਂ ਦਿੱਤਾ ਹੈ।

ਇਸਨੂੰ ਸੌਖੇ ਤਰੀਕੇ ਨਾਲ ਐਸੇ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ ਕਿ ਬਾਹਰੋਂ ਆਈ value ਨੂੰ instance ਦੀ ਆਪਣੀ property ਵਿੱਚ ਸੰਭਾਲਿਆ ਜਾ ਰਿਹਾ ਹੈ।

ਜਦੋਂ ਸਾਰੀਆਂ properties ਨੂੰ values ਮਿਲ ਜਾਂਦੀਆਂ ਹਨ, ਤਾਂ ਇਹ instance ਬਣਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਪੂਰੀ ਹੋ ਜਾਂਦੀ ਹੈ।

### constructor ਦੀ ਕਾਰਵਾਈ

ਜਦੋਂ ਅਸੀਂ ਸਪੱਸ਼ਟ ਤੌਰ 'ਤੇ ਕੋਈ constructor declare ਕਰਦੇ ਹਾਂ, ਤਾਂ ਇੱਕ ਹੋਰ ਬਦਲਾਅ ਵੀ ਹੁੰਦਾ ਹੈ:

ਸਿਸਟਮ ਪਹਿਲਾਂ ਜੋ constructor ਆਪਣੇ ਆਪ ਬਣਾਂਦਾ ਸੀ, ਉਹ ਆਮ ਤੌਰ 'ਤੇ ਹੁਣ ਸਿੱਧਾ ਵਰਤਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ।

ਉਦਾਹਰਨ ਲਈ:

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

ਹੁਣ ਜੇ ਅਸੀਂ ਫਿਰ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖੀਏ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ਤਾਂ compiler error ਦਿਖਾਏਗਾ:

```swift
Extra arguments at positions #2, #3 in call
```

ਇਸਦਾ ਮਤਲਬ ਹੈ: ਤੁਸੀਂ ਵੱਧ parameters pass ਕੀਤੇ ਹਨ।

ਇਹ error ਕਿਉਂ ਆਉਂਦਾ ਹੈ?

ਕਿਉਂਕਿ ਮੌਜੂਦਾ `Movie` structure ਵਿੱਚ ਸਿਰਫ਼ ਇਹ ਇੱਕ constructor ਹੈ, ਜੋ ਤੁਸੀਂ ਹੱਥ ਨਾਲ declare ਕੀਤਾ ਹੈ:

```swift
init(name: String)
```

ਇਹ ਕੇਵਲ `name` parameter ਨੂੰ ਹੀ ਸਵੀਕਾਰ ਕਰਦਾ ਹੈ; `director` ਅਤੇ `rating` ਨੂੰ ਨਹੀਂ।

ਅਰਥਾਤ, ਜਦੋਂ ਤੁਸੀਂ ਆਪਣਾ constructor ਹੱਥ ਨਾਲ ਜੋੜ ਦਿੰਦੇ ਹੋ, ਤਾਂ ਪਹਿਲਾਂ ਸਿਸਟਮ ਵੱਲੋਂ ਆਪਣੇ ਆਪ ਬਣਾਈ ਗਈ initialization style ਹੁਣ ਸਿੱਧੇ ਤੌਰ 'ਤੇ ਵਰਤੀ ਨਹੀਂ ਜਾ ਸਕਦੀ।

ਜੇ ਅਸੀਂ ਇੱਕੋ ਵੇਲੇ "ਕੇਵਲ ਨਾਮ ਦੇਣਾ" ਅਤੇ "ਪੂਰੀ ਜਾਣਕਾਰੀ ਦੇਣਾ" ਦੋਵੇਂ support ਕਰਨਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਸਾਨੂੰ ਆਪ ਹੀ ਇੱਕ ਹੋਰ ਪੂਰਾ constructor ਜੋੜਨਾ ਪਵੇਗਾ:

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

ਇਸ ਤਰ੍ਹਾਂ, ਸਾਡੇ ਕੋਲ ਦੋ ਵੱਖਰੇ constructors ਹੋ ਜਾਂਦੇ ਹਨ।

ਪੁਰਾਣੀ ਫ਼ਿਲਮ ਬਣਾਉਂਦੇ ਸਮੇਂ ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
Movie(name: "The Night of the Hunter")
```

ਅਤੇ ਪੂਰੀ ਜਾਣਕਾਰੀ ਨਾਲ ਨਵੀਂ ਫ਼ਿਲਮ ਬਣਾਉਂਦੇ ਸਮੇਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖ ਸਕਦੇ ਹਾਂ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ਇਹ ਲਿਖਣ ਦੀ ਵਿਧੀ ਇਹ ਵੀ ਦੱਸਦੀ ਹੈ ਕਿ ਇੱਕੋ type ਦੇ ਕਈ constructors ਹੋ ਸਕਦੇ ਹਨ, ਜਦੋਂ ਤਕ ਉਨ੍ਹਾਂ ਦੇ parameters ਦਾ ਰੂਪ ਵੱਖਰਾ ਹੋਵੇ।

## overload ਕੀ ਹੈ

ਇੱਥੇ ਅਸੀਂ ਇੱਕ ਹੋਰ ਲੋੜੀਂਦਾ ਗਿਆਨ-ਬਿੰਦੂ ਜੋੜਦੇ ਹਾਂ।

ਹੁਣੇ ਹੀ ਅਸੀਂ `Movie` ਲਈ ਦੋ `init` ਲਿਖੇ:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

ਇਸ ਤਰ੍ਹਾਂ ਦੀ ਲਿਖਤ, "ਇੱਕੋ function name ਪਰ ਵੱਖਰੇ parameters", ਨੂੰ "overload" ਕਹਿੰਦੇ ਹਨ।

ਇੱਥੇ ਦੋਵੇਂ functions ਦਾ ਨਾਮ `init` ਹੈ, ਪਰ ਕਿਉਂਕਿ ਉਹ ਵੱਖਰੇ parameters ਲੈਂਦੀਆਂ ਹਨ, Swift ਸਮਝ ਸਕਦੀ ਹੈ ਕਿ ਤੁਸੀਂ ਕਿਹੜਾ function call ਕਰ ਰਹੇ ਹੋ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Movie(name: "Days of Heaven")
```

ਇਹ call ਕਰੇਗਾ:

```swift
init(name: String)
```

ਜਦਕਿ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ਇਹ initialization method ਦੇ ਦੂਜੇ ਪੂਰੇ version ਨੂੰ call ਕਰੇਗਾ।

ਇਸ ਲਈ overload ਦਾ ਕੰਮ ਇਹ ਹੈ: ਇੱਕੋ type ਨੂੰ ਵੱਖ-ਵੱਖ ਹਾਲਾਤਾਂ ਦੇ ਮੁਤਾਬਕ ਵੱਖ-ਵੱਖ ਬਣਾਉਣ ਦੇ ਤਰੀਕੇ ਦੇਣਾ।

## class ਨਾਲ ਜਾਣ-ਪਹਿਚਾਣ

ਹੁਣ ਅੱਗੇ, ਸੰਖੇਪ ਵਿੱਚ `class` ਨਾਲ ਵੀ ਜਾਣ-ਪਹਿਚਾਣ ਕਰੀਏ।

Swift ਵਿੱਚ ਆਮ `struct` ਤੋਂ ਇਲਾਵਾ, ਕਈ programming languages instances ਬਣਾਉਣ ਲਈ `class` ਦੀ ਵਰਤੋਂ ਕਰਦੀਆਂ ਹਨ, ਜਿਵੇਂ Java, C#, Kotlin ਆਦਿ।

Swift ਵਿੱਚ `class` ਲਿਖਣ ਦਾ ਤਰੀਕਾ `struct` ਦੇ ਬਹੁਤ ਨੇੜੇ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ `struct` keyword ਦੀ ਥਾਂ `class` ਹੋਣ ਤੋਂ ਇਲਾਵਾ, ਬਾਕੀ ਹਿੱਸੇ ਲਗਭਗ ਇੱਕੋ ਜਿਹੇ ਲੱਗਦੇ ਹਨ।

instance ਬਣਾਉਣ ਦਾ ਤਰੀਕਾ ਵੀ ਬਹੁਤ ਮਿਲਦਾ-ਜੁਲਦਾ ਹੈ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ਇਸ ਲਈ syntax ਦੇ ਪੱਧਰ 'ਤੇ `struct` ਅਤੇ `class` ਸੱਚਮੁੱਚ ਕਾਫ਼ੀ ਮਿਲਦੇ ਹਨ।

### Struct ਅਤੇ Class ਵਿਚਕਾਰ ਫ਼ਰਕ

ਹਾਲਾਂਕਿ `struct` ਅਤੇ `class` ਕਾਫ਼ੀ ਮਿਲਦੇ-ਜੁਲਦੇ ਲੱਗਦੇ ਹਨ, ਪਰ ਉਹ ਪੂਰੀ ਤਰ੍ਹਾਂ ਇੱਕੋ ਨਹੀਂ ਹਨ।

**1. initialization ਦਾ ਤਰੀਕਾ ਵੱਖਰਾ ਹੈ**

`struct` ਲਈ, ਜੇ ਅਸੀਂ constructor ਹੱਥ ਨਾਲ ਨਹੀਂ ਲਿਖਦੇ, ਤਾਂ ਸਿਸਟਮ ਆਮ ਤੌਰ 'ਤੇ ਆਪਣੇ ਆਪ ਇੱਕ ਉਚਿਤ initialization method ਬਣਾ ਦਿੰਦਾ ਹੈ।

ਪਰ `class` ਲਈ, ਜੇ ਕੋਈ ਅਜਿਹੀਆਂ properties ਹਨ ਜਿਨ੍ਹਾਂ ਕੋਲ default value ਨਹੀਂ ਹੈ, ਤਾਂ ਆਮ ਤੌਰ 'ਤੇ `init` ਹੱਥ ਨਾਲ ਲਿਖਣਾ ਪੈਂਦਾ ਹੈ; ਨਹੀਂ ਤਾਂ error ਆਉਂਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ਇਹ `class` error ਦੇਵੇਗੀ ਕਿਉਂਕਿ ਇਸਦੇ ਕੋਲ constructor ਨਹੀਂ ਹੈ, ਇਸ ਲਈ ਇਸ ਦੀਆਂ properties initialize ਨਹੀਂ ਹੁੰਦੀਆਂ।

compiler ਆਮ ਤੌਰ 'ਤੇ ਇਸ ਤਰ੍ਹਾਂ ਦਾ ਸੁਨੇਹਾ ਦਿਖਾਏਗਾ:

```swift
Class 'Movie' has no initializers
```

ਇਸ ਲਈ, ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ `class` ਲਈ constructor ਹੱਥ ਨਾਲ ਲਿਖਣਾ ਲਾਜ਼ਮੀ ਹੈ।

**2. `struct` value type ਹੈ, `class` reference type ਹੈ**

`struct` value type ਹੈ, ਅਤੇ `class` reference type ਹੈ।

ਸਿੱਖਣ ਦੇ ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ, ਇਹ ਦੋ concepts ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਮਝਣ ਦੀ ਲੋੜ ਨਹੀਂ; ਸਿਰਫ਼ ਇੱਕ ਸੌਖੀ ਮੁੱਢਲੀ ਸਮਝ ਕਾਫ਼ੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, `struct` "ਨਵੀਂ value ਦੀ copy" ਵਰਗਾ ਹੋਰ ਲੱਗਦਾ ਹੈ।

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

ਇੱਥੇ `user1` ਨੂੰ `user2` ਨੂੰ assign ਕਰਨ ਤੋਂ ਬਾਅਦ, ਮੂਲ ਤੌਰ 'ਤੇ ਨਵੀਂ data copy ਬਣਦੀ ਹੈ; ਇਸ ਲਈ `user2` ਨੂੰ ਬਦਲਣ ਨਾਲ `user1` 'ਤੇ ਅਸਰ ਨਹੀਂ ਪੈਂਦਾ।

ਦੂਜੇ ਪਾਸੇ, `class` "ਇੱਕੋ instance ਵੱਲ ਇਕੱਠੇ ਇਸ਼ਾਰਾ ਕਰਨਾ" ਵਰਗਾ ਹੋਰ ਲੱਗਦਾ ਹੈ।

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

ਇੱਥੇ `user1` ਅਤੇ `user2` ਇੱਕੋ instance ਵੱਲ ਇਸ਼ਾਰਾ ਕਰਦੇ ਹਨ।

ਇਸ ਵੇਲੇ value type ਅਤੇ reference type ਦੇ ਅੰਦਰੂਨੀ ਤਰੀਕੇ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਮਝਣ ਦੀ ਲੋੜ ਨਹੀਂ; ਸਿਰਫ਼ ਇੰਨਾ ਜਾਣਨਾ ਕਾਫ਼ੀ ਹੈ ਕਿ `struct` ਸੁਤੰਤਰ data ਸੰਭਾਲਣ ਲਈ ਹੋਰ ਉਚਿਤ ਹੈ, ਅਤੇ `class` ਉਹਨਾਂ ਹਾਲਾਤਾਂ ਵਿੱਚ ਹੋਰ ਉਚਿਤ ਹੈ ਜਿੱਥੇ ਕਈ ਥਾਵਾਂ 'ਤੇ ਇੱਕੋ instance share ਕਰਨਾ ਪਵੇ।

## ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ ਕਿਵੇਂ ਚੁਣਨਾ

ਮੌਜੂਦਾ ਪੜਾਅ ਵਿੱਚ, ਆਮ data models ਲਈ ਪਹਿਲਾਂ `struct` ਨੂੰ ਵਿਚਾਰੋ; ਅਤੇ ਜਿੱਥੇ shared data ਅਤੇ synchronized ਬਦਲਾਵ ਦੀ ਲੋੜ ਹੋਵੇ, ਉੱਥੇ `class` ਨੂੰ ਵਿਚਾਰੋ।

ਇਹ ਕੋਈ ਪੂਰਨ ਨਿਯਮ ਨਹੀਂ ਹੈ, ਪਰ ਨਵੇਂ ਸਿਖਣ ਵਾਲਿਆਂ ਲਈ ਇਹ ਕਾਫ਼ੀ ਵਿਹਾਰਕ ਫੈਸਲਾ-ਮਾਪਦੰਡ ਹੈ।

ਖ਼ਾਸ ਤੌਰ 'ਤੇ SwiftUI ਵਿੱਚ, ਤੁਸੀਂ ਕਈ ਵਾਰ ਵੇਖੋਗੇ ਕਿ `struct` ਨਾਲ ਹੀ ਜ਼ਿਆਦਾਤਰ ਕੰਮ ਹੋ ਜਾਂਦਾ ਹੈ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, ਕਈ programming materials ਵਿੱਚ `class` ਨਾਲ ਬਣੀ ਚੀਜ਼ ਨੂੰ "object" ਵੀ ਕਿਹਾ ਜਾਂਦਾ ਹੈ। ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ, ਤੁਸੀਂ ਇਸਨੂੰ ਸਿਰਫ਼ instance ਵਜੋਂ ਸਮਝ ਸਕਦੇ ਹੋ; ਵੱਖਰਾ ਫ਼ਰਕ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ `struct` ਨੂੰ ਹੋਰ ਗਹਿਰਾਈ ਨਾਲ ਸਿੱਖਿਆ, ਅਤੇ ਨਾਲ ਹੀ `class` ਨਾਲ ਵੀ ਜਾਣ-ਪਹਿਚਾਣ ਕੀਤੀ। ਦੋਵੇਂ ਨੂੰ types ਪਰਿਭਾਸ਼ਿਤ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

Types instances ਬਣਾ ਸਕਦੇ ਹਨ। Instance ਬਣਾਉਂਦੇ ਸਮੇਂ constructor, ਯਾਨੀ `init`, call ਹੁੰਦਾ ਹੈ।

`struct` ਲਈ, ਜੇ constructor ਹੱਥ ਨਾਲ ਨਹੀਂ ਲਿਖਿਆ ਜਾਂਦਾ, ਤਾਂ ਸਿਸਟਮ ਆਮ ਤੌਰ 'ਤੇ ਆਪਣੇ ਆਪ ਉਚਿਤ constructor ਬਣਾ ਦਿੰਦਾ ਹੈ। ਜੇ default constructor ਲੋੜਾਂ ਨੂੰ ਪੂਰਾ ਨਹੀਂ ਕਰਦਾ, ਤਾਂ ਅਸੀਂ ਖੁਦ ਵੀ constructor ਲਿਖ ਸਕਦੇ ਹਾਂ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, ਅਸੀਂ `struct` ਅਤੇ `class` ਦੇ ਫ਼ਰਕ ਬਾਰੇ ਵੀ ਮੁੱਢਲੀ ਸਮਝ ਹਾਸਲ ਕੀਤੀ: `struct` value type ਹੈ, ਜਦਕਿ `class` reference type ਹੈ। SwiftUI ਵਿੱਚ ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ 'ਤੇ ਆਮ ਤੌਰ 'ਤੇ `struct` ਨਾਲ ਹੀ ਹੋਰ ਵੱਧ ਮੁਲਾਕਾਤ ਹੁੰਦੀ ਹੈ।

ਅੱਗੇ ਜਦੋਂ ਅਸੀਂ views ਵਿਚਕਾਰ value pass ਕਰਨਾ, data models, ਅਤੇ state management ਸਿੱਖਾਂਗੇ, ਤਾਂ ਇਹ ਸਾਰਾ ਸਮੱਗਰੀ ਮੁੜ ਵਰਤੋਂ ਵਿੱਚ ਆਵੇਗੀ।
