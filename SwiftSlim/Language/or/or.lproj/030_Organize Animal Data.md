# ପଶୁ ତଥ୍ୟକୁ ସଜାଇବା

ପୂର୍ବ ପାଠରେ, ଆମେ ଏକ ସରଳ ପଶୁ ବିଶ୍ୱକୋଷ ଉଦାହରଣ ସମ୍ପୂର୍ଣ୍ଣ କରିଥିଲୁ।

![view](../../../Resource/029_view.png)

ଉପଯୋଗକର୍ତ୍ତା କୌଣସି ପଶୁକୁ ଟ୍ୟାପ୍ କଲେ, ପୃଷ୍ଠା `Sheet` ମାଧ୍ୟମରେ ପଶୁର ବିବରଣୀ ଦେଖାଇବ।

କିନ୍ତୁ, ପୂର୍ବ ପାଠର କୋଡ୍‌ରେ ଏକ ସମସ୍ୟା ଥିଲା: ପଶୁ ତଥ୍ୟ ସିଧାସଳଖ `ContentView` ଭିତରେ ଲେଖାଯାଇଥିଲା।

ଉଦାହରଣ:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // ପଶୁ ତାଲିକା ଦେଖାନ୍ତୁ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ଏହି କୋଡ୍ ସଠିକ୍ ଭାବରେ ଚାଲିପାରେ, କିନ୍ତୁ ପଶୁ ତଥ୍ୟ ବଢ଼ିବା ସହିତ `ContentView` ବହୁତ ଲମ୍ବା ହୋଇଯିବ।

`ContentView` ମୂଳତଃ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ ହେବା ଉଚିତ, କିନ୍ତୁ ଏବେ ଏଥିରେ ବହୁତ ପଶୁ ତଥ୍ୟ ମଧ୍ୟ ସଞ୍ଚିତ ଅଛି। ଏହା କୋଡ୍ ପଢ଼ିବାକୁ ପ୍ରଭାବିତ କରେ ଏବଂ ପରବର୍ତ୍ତୀ ରକ୍ଷାଣାବେକ୍ଷଣକୁ ଅସୁବିଧାଜନକ କରେ।

ତେଣୁ, ଏହି ପାଠରେ ଆମେ ଗୋଟିଏ କାମ କରିବୁ:

ପଶୁ ତଥ୍ୟକୁ `ContentView` ରୁ ବାହାରକୁ ସଜାଇବା।

## କାହିଁକି ତଥ୍ୟକୁ ଅଲଗା କରିବା ଦରକାର?

SwiftUI ରେ, ଭ୍ୟୁ କୋଡ୍ ସାଧାରଣତଃ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ।

ଉଦାହରଣ:

```swift
Text("Dolphin")
Image("dolphin")
```

ଏହି କୋଡ୍‌ଗୁଡ଼ିକ ସବୁ ଇଣ୍ଟରଫେସ୍ ପ୍ରଦର୍ଶନ ସହିତ ସମ୍ବନ୍ଧିତ।

କିନ୍ତୁ ପଶୁ ତଥ୍ୟ ନିଜେ, ଯେପରିକି ପଶୁର ନାମ, ଛବିର ନାମ, ବିତରଣ କ୍ଷେତ୍ର, ବାସସ୍ଥାନ, ବର୍ଣ୍ଣନା ଲେଖା, ଏଗୁଡ଼ିକ ଇଣ୍ଟରଫେସ୍ ଗଠନ ନୁହେଁ।

ସେଗୁଡ଼ିକ ଅଧିକରେ ଏକ ସ୍ଥିର ତଥ୍ୟ ସମୂହ ପରି:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

ଯଦି ଇଣ୍ଟରଫେସ୍ କୋଡ୍ ଏବଂ ତଥ୍ୟ କୋଡ୍ ସବୁକିଛି ଏକାଠି ଲେଖାଯାଏ, କୋଡ୍ ଧୀରେ ଧୀରେ ଅଧିକ ଅସ୍ପଷ୍ଟ ହୋଇଯିବ।

ତେଣୁ, ଆମେ ପଶୁ ତଥ୍ୟକୁ `Animal` ପ୍ରକାର ଭିତରେ ରଖିପାରୁ।

## static ବ୍ୟବହାର କରି ସ୍ଥିର ତଥ୍ୟ ସଞ୍ଚୟ କରିବା

ପ୍ରଥମେ ସଜାଇବା ପରେ ଲେଖା ପଦ୍ଧତିକୁ ଦେଖିବା:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

ଏଠାରେ ଗୋଟିଏ ନୂଆ କୋଡ୍ ଲାଇନ୍ ଯୋଡ଼ାଯାଇଛି:

```swift
static let animals: [Animal] = [
    
]
```

`static` ଅର୍ଥ ସ୍ଥିର ଗୁଣ।

ସ୍ଥିର ଗୁଣ ପ୍ରକାର ନିଜର ହୁଏ, କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ ଇନ୍‌ଷ୍ଟାନ୍ସ୍‌ର ନୁହେଁ।

ଏହି ବାକ୍ୟଟି କିଛି ଅବ୍ୟକ୍ତ ଲାଗିପାରେ, ଆମେ ଏକ ସରଳ ଉଦାହରଣ ଦ୍ୱାରା ବୁଝିପାରିବା।

## ସାଧାରଣ ଗୁଣ ଏବଂ ସ୍ଥିର ଗୁଣ

ଉଦାହରଣ ସ୍ୱରୂପ, ଆମେ ଗୋଟିଏ `Student` ପରିଭାଷା କରୁ:

```swift
struct Student {
    let name: String
}
```

ଏଠାରେ `name` ଏକ ସାଧାରଣ ଗୁଣ, ସାଧାରଣ ଗୁଣ କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ ଇନ୍‌ଷ୍ଟାନ୍ସ୍‌ର ହୁଏ।

ଯଦି ଆମେ `name` କୁ ଅଭିଗମ କରିବାକୁ ଚାହୁଁ, ପ୍ରଥମେ ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ଛାତ୍ର ସୃଷ୍ଟି କରିବା ଦରକାର:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ଏଠାରେ `student` ଗୋଟିଏ ଇନ୍‌ଷ୍ଟାନ୍ସ୍, ଏହାକୁ ପ୍ରଥମେ ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ଛାତ୍ର ତଥ୍ୟ ଭାବରେ ମଧ୍ୟ ବୁଝିପାରିବେ।

କାରଣ ପ୍ରତ୍ୟେକ ଛାତ୍ରର ନାମ ଭିନ୍ନ ହୋଇପାରେ, ସେହିପାଇଁ `name` କୁ ନିର୍ଦ୍ଦିଷ୍ଟ ଛାତ୍ର ଉପରେ ରଖିବା ଦରକାର।

କିନ୍ତୁ, କିଛି ତଥ୍ୟ କୌଣସି ନିର୍ଦ୍ଦିଷ୍ଟ ଇନ୍‌ଷ୍ଟାନ୍ସ୍‌ର ନୁହେଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଆମେ ପ୍ରିଭ୍ୟୁ ପାଇଁ ଏକ ନମୁନା ତଥ୍ୟ ସମୂହ ପ୍ରସ୍ତୁତ କରିବାକୁ ଚାହୁଁ:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

ଏଠାରେ `previewStudents` ପୂର୍ବରୁ `static` ଅଛି, ତେଣୁ ଏହା ସ୍ଥିର ଗୁଣ।

ସ୍ଥିର ଗୁଣ କୌଣସି ଗୋଟିଏ ଛାତ୍ରର ନୁହେଁ, ବରଂ `Student` ପ୍ରକାର ନିଜର।

ସେହିପାଇଁ, ଆମେ ପ୍ରଥମେ କୌଣସି ଛାତ୍ର ସୃଷ୍ଟି କରିବା ଦରକାର ନାହିଁ, ସିଧାସଳଖ ପ୍ରକାର ନାମ ଦ୍ୱାରା ଅଭିଗମ କରିପାରିବା:

```swift
print(Student.previewStudents.count)    // 3
```

ଏଠାରେ ଅଭିଗମ ପଦ୍ଧତି ହେଉଛି:

```swift
ପ୍ରକାରନାମ.ସ୍ଥିରଗୁଣନାମ
```

ଅର୍ଥାତ୍:

```swift
Student.previewStudents
```

ସେହିପରି, ପଶୁ ବିଶ୍ୱକୋଷରେ, ଆମେ ପଶୁ ତଥ୍ୟକୁ ଏଭଳି ଅଭିଗମ କରିପାରୁ:

```swift
Animal.animals
```

## ContentView କୁ ଫେରିବା

ବର୍ତ୍ତମାନ, ପଶୁ ତଥ୍ୟ ପୂର୍ବରୁ `Animal` ପ୍ରକାରରେ ସଞ୍ଚିତ ହୋଇଛି।

ସେହିପାଇଁ `ContentView` ଭିତରେ ଆଉ ବହୁତ ଲମ୍ବା ପଶୁ ଆରେ ଲେଖିବା ଦରକାର ନାହିଁ।

ଆମେ ଏଭଳି ବଦଳାଇପାରୁ:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // ପଶୁ ତାଲିକା ଦେଖାନ୍ତୁ
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ଏହି କୋଡ୍ ଲାଇନ୍‌ର ଅର୍ଥ:

```swift
let animals = Animal.animals
```

`Animal` ପ୍ରକାରରୁ `animals` ନାମକ ପଶୁ ତଥ୍ୟ ସମୂହକୁ ନେଇ, ପରେ ଏହାକୁ ବର୍ତ୍ତମାନ ଭ୍ୟୁର `animals` କନ୍ଷ୍ଟାଣ୍ଟରେ ସଞ୍ଚୟ କରାଯାଏ।

ଏଭଳି ଲେଖିଲେ, `ContentView` ଅଧିକ ସରଳ ହେବ।

`ContentView` ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ, `Animal.animals` ପଶୁ ତଥ୍ୟ ଯୋଗାଇବା ପାଇଁ ଦାୟୀ।

## Animal କୁ ଅଲଗା ଫାଇଲ୍‌ରେ ଭାଗ କରିବା

ପୂର୍ବ ପାଠରେ, ଉଦାହରଣକୁ ସହଜରେ ବୁଝିବା ପାଇଁ, ଆମେ `Animal` ଏବଂ `ContentView` କୁ ଏକେ ଫାଇଲ୍‌ରେ ଲେଖିଥିଲୁ।

କାରଣ ସେତେବେଳେ କୋଡ୍ ଅଳ୍ପ ଥିଲା, ଏଭଳି ଲେଖିଲେ ସମସ୍ୟା ନଥିଲା।

କିନ୍ତୁ ଏବେ ପଶୁ ତଥ୍ୟ ବଢ଼ୁଛି, ଯଦି ସମସ୍ତ କୋଡ୍‌କୁ ଆଗକୁ ମଧ୍ୟ `ContentView.swift` ଭିତରେ ଲେଖାଯାଏ, ଫାଇଲ୍ ବହୁତ ଲମ୍ବା ହେବ ଏବଂ ପଢ଼ିବାକୁ ଅସୁବିଧା ହେବ।

ତେଣୁ, ଆମେ `Animal` କୁ ଅଲଗା ଏକ ନୂଆ Swift ଫାଇଲ୍‌ରେ ରଖିପାରୁ।

Xcode ରେ, ଆପଣ ଗୋଟିଏ ନୂଆ Swift ଫାଇଲ୍ ସୃଷ୍ଟି କରିପାରିବେ, ଯେପରିକି:

```swift
Animal.swift
```

ତାପରେ `Animal` ସ୍ଟ୍ରକ୍ଟକୁ ଏହି ଫାଇଲ୍‌କୁ ସରାନ୍ତୁ:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

ଏଭଳି ସଜାଇଲା ପରେ:

`ContentView.swift` ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ।

`Animal.swift` ପଶୁ ତଥ୍ୟର ଗଠନ ବର୍ଣ୍ଣନା କରିବା ପାଇଁ ଦାୟୀ।

ଯଦିଓ ସେଗୁଡ଼ିକ ଭିନ୍ନ ଫାଇଲ୍‌ରେ ରହିଛି, ସେମାନେ ଏକେ ପ୍ରୋଜେକ୍ଟରେ ଥିଲେ, `ContentView` ତଥାପି ସିଧାସଳଖ `Animal` ବ୍ୟବହାର କରିପାରିବ।

ଉଦାହରଣ:

```swift
let animals = Animal.animals
```

ଏଠାରେ `ContentView.swift` ଭିତରେ ଅତିରିକ୍ତଭାବେ `Animal.swift` ଇମ୍ପୋର୍ଟ କରିବା ଦରକାର ନାହିଁ।

Swift ଏକେ ପ୍ରୋଜେକ୍ଟର Swift ଫାଇଲ୍‌ଗୁଡ଼ିକୁ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଚିହ୍ନିବ।

## extension ବ୍ୟବହାର କରି କୋଡ୍‌କୁ ଆଗକୁ ସଜାଇବା

ବର୍ତ୍ତମାନ, ଆମେ ପଶୁ ତଥ୍ୟକୁ `ContentView` ରୁ `Animal` ଭିତରକୁ ସରାଇଛୁ।

ତଥାପି, `Animal` ସ୍ଟ୍ରକ୍ଟ ଭିତରେ ଏବେ ମଧ୍ୟ ଦୁଇ ପ୍ରକାର କୋଡ୍ ସମୟକାଳୀନ ଭାବରେ ରହିଛି:

ପ୍ରଥମ ପ୍ରକାର ହେଉଛି ପଶୁ ମଡେଲ୍ ନିଜର ଗୁଣଗୁଡ଼ିକ:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

ଦ୍ୱିତୀୟ ପ୍ରକାର ହେଉଛି ସ୍ଥିର ପଶୁ ତଥ୍ୟ:

```swift
static let animals: [Animal] = [
    // ...
]
```

କୋଡ୍ ଗଠନକୁ ଅଧିକ ସ୍ପଷ୍ଟ କରିବା ପାଇଁ, ଆମେ `extension` ବ୍ୟବହାର କରି ଏହି ଦୁଇ ଭାଗକୁ ଅଲଗା କରିପାରୁ।

`extension` ର ଅର୍ଥ ହେଉଛି ବିସ୍ତାର।

ଏହା ମୂଳ ପ୍ରକାରର ଆଧାରରେ ନୂଆ କୋଡ୍ ଯୋଡ଼ିବାକୁ ଦେଇଥାଏ।

ଉଦାହରଣ:

```swift
extension Animal {
    
}
```

ଏହାର ଅର୍ଥ ହେଉଛି ଆମେ `Animal` ପ୍ରକାରକୁ ବିସ୍ତାର କରୁଛୁ।

## ପଶୁ ତଥ୍ୟକୁ extension ଭିତରେ ରଖିବା

ଆମେ `Animal` କୁ ଏଭଳି ବଦଳାଇପାରୁ:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

ଏଭଳି ସଜାଇଲା ପରେ, କୋଡ୍ ଗଠନ ଅଧିକ ସ୍ପଷ୍ଟ ହେବ।

`struct Animal` ଏକ ପଶୁରେ କେଉଁ କେଉଁ ଗୁଣ ଥିବା ଉଚିତ ତାହା ବର୍ଣ୍ଣନା କରିବା ପାଇଁ ଦାୟୀ।

`extension Animal` ଏକ ସ୍ଥିର ପଶୁ ତଥ୍ୟ ସମୂହ ସଞ୍ଚୟ କରିବା ପାଇଁ ଦାୟୀ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, `animals` କୁ `extension Animal` ଭିତରକୁ ସରାଇଲେ ମଧ୍ୟ, ବ୍ୟବହାର ପଦ୍ଧତି ବଦଳାଏ ନାହିଁ।

ଆମେ ଏବେ ମଧ୍ୟ ଏଭଳି ବ୍ୟବହାର କରିପାରୁ:

```swift
let animals = Animal.animals
```

ଏହା ମଧ୍ୟ `extension` ର ଏକ ବୈଶିଷ୍ଟ୍ୟ: ଏହା କେବଳ କୋଡ୍‌କୁ ସଜାଇବାରେ ସାହାଯ୍ୟ କରେ, ବାହ୍ୟ କଲ୍ ପଦ୍ଧତିକୁ ବଦଳାଏ ନାହିଁ।

## ତଥ୍ୟ ଅଧିକ ହେଲେ, ପୁନି AnimalData ଫାଇଲ୍ ସୃଷ୍ଟି କରିପାରିବେ

ବର୍ତ୍ତମାନ, ଆମେ `Animal` କୁ ଅଲଗା `Animal.swift` ଫାଇଲ୍‌ରେ ରଖିଛୁ।

ଯଦି ପଶୁ ତଥ୍ୟ ଅଳ୍ପ, `extension Animal` କୁ ସିଧାସଳଖ `Animal.swift` ଭିତରେ ମଧ୍ୟ ଲେଖିପାରିବେ।

କିନ୍ତୁ, ଯଦି ପଶୁ ତଥ୍ୟ ଅଧିକ ବଢ଼ିଯାଏ, ଆପଣ ଆଉ ଗୋଟିଏ ଫାଇଲ୍ ସୃଷ୍ଟି କରିପାରିବେ, ଯେପରିକି:

```swift
AnimalData.swift
```

ତାପରେ ସ୍ଥିର ପଶୁ ତଥ୍ୟକୁ ତାହାରେ ରଖନ୍ତୁ:

```swift
extension Animal {
    static let animals: [Animal] = [
        // ପଶୁ ତଥ୍ୟ
    ]
}
```

ଏଭଳି କଲା ପରେ, କୋଡ୍‌ର ଦାୟିତ୍ୱ ବିଭାଗ ଅଧିକ ସ୍ପଷ୍ଟ ହେବ:

`Animal.swift` କେବଳ ପଶୁ ମଡେଲ୍ ପରିଭାଷା କରିବା ପାଇଁ ଦାୟୀ।

`AnimalData.swift` କେବଳ ପଶୁ ତଥ୍ୟ ସଞ୍ଚୟ କରିବା ପାଇଁ ଦାୟୀ।

`ContentView.swift` କେବଳ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ।

ପ୍ରତ୍ୟେକ ଫାଇଲ୍‌ର ଦାୟିତ୍ୱ ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ, `AnimalData.swift` କେବଳ ଫାଇଲ୍ ନାମ, ନୂଆ Swift ପ୍ରକାର ନୁହେଁ। ଏହି ଫାଇଲ୍‌ରେ ଏବେ ମଧ୍ୟ `extension Animal` ମାଧ୍ୟମରେ `Animal` କୁ ସ୍ଥିର ତଥ୍ୟ ଯୋଡ଼ାଯାଉଛି।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

ନିମ୍ନରେ ସଜାଇବା ପରେ `Animal.swift` କୋଡ୍ ଅଛି:

```swift
import Foundation

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

ସଜାଇବା ପରେ `AnimalData.swift` କୋଡ୍:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

`ContentView.swift` ଭିତରେ, ଏଭଳି ବ୍ୟବହାର କରିପାରିବେ:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
```

ଟିପ୍: `Animal.swift` ଏବଂ `AnimalData.swift` ଫାଇଲ୍‌ରେ, ପ୍ରଥମ ଲାଇନ୍‌ରେ ଏହା ଲେଖାଯାଇଛି:

```swift
import Foundation
```

ପୂର୍ବରୁ ଆମେ SwiftUI ଇଣ୍ଟରଫେସ୍ ଲେଖିବା ସମୟରେ, ସାଧାରଣତଃ ଏହା ବ୍ୟବହାର କରୁଥିଲୁ:

```swift
import SwiftUI
```

କାରଣ `ContentView`, `Text`, `Button`, `Color` ଏହି ବିଷୟଗୁଡ଼ିକ ସବୁ ଇଣ୍ଟରଫେସ୍ ସହିତ ସମ୍ବନ୍ଧିତ, ତେଣୁ ଇଣ୍ଟରଫେସ୍ ଫାଇଲ୍ ଲେଖିବା ବେଳେ ସାଧାରଣତଃ SwiftUI ଇମ୍ପୋର୍ଟ କରିବା ଦରକାର।

କିନ୍ତୁ ଏଠାରେ `Animal.swift` ଏବଂ `AnimalData.swift` ଦୁହିଁଟି ଇଣ୍ଟରଫେସ୍ ଫାଇଲ୍ ନୁହେଁ, ସେଗୁଡ଼ିକ ମୁଖ୍ୟତଃ ପଶୁ ମଡେଲ୍ ପରିଭାଷା କରିବା ଏବଂ ପଶୁ ତଥ୍ୟ ସଞ୍ଚୟ କରିବା ପାଇଁ ବ୍ୟବହୃତ।

ଏହି କୋଡ୍‌ରେ, `UUID()` ପାଇଁ `Foundation` ଦରକାର, ସେହିପାଇଁ `Foundation` ଇମ୍ପୋର୍ଟ କଲେ ହେଲା।

## ସାରାଂଶ

ଏହି ପାଠରେ ଆମେ ମୁଖ୍ୟତଃ ଗୋଟିଏ କାମ କରିଲୁ: ପଶୁ ତଥ୍ୟକୁ `ContentView` ରୁ ବାହାରକୁ ସଜାଇଲୁ।

ମୂଳ ଲେଖା ପଦ୍ଧତି ଥିଲା ପଶୁ ତଥ୍ୟକୁ ସିଧାସଳଖ `ContentView` ଭିତରେ ଲେଖିବା। ଏଭଳି କୋଡ୍ ଚାଲିପାରେ, କିନ୍ତୁ ତଥ୍ୟ ବଢ଼ିଲେ ଭ୍ୟୁ ଫାଇଲ୍ ଦୀର୍ଘ ହୋଇଯିବ।

ସଜାଇଲା ପରେ, `ContentView` କେବଳ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବା ପାଇଁ ଦାୟୀ, `Animal.animals` ପଶୁ ତଥ୍ୟ ଯୋଗାଇବା ପାଇଁ ଦାୟୀ।

ଏହି ପାଠରେ ଆମେ ଆଉ ଦୁଇଟି ନୂଆ ଜ୍ଞାନ ମଧ୍ୟ ଶିଖିଲୁ।

ପ୍ରଥମଟି ହେଉଛି `static`।

`static` ର ଅର୍ଥ ସ୍ଥିର ଗୁଣ। ସ୍ଥିର ଗୁଣ ପ୍ରକାର ନିଜର ହୁଏ, “ପ୍ରକାରନାମ.ଗୁଣନାମ” ପଦ୍ଧତିରେ ସିଧାସଳଖ ଅଭିଗମ କରାଯାଇପାରେ।

ଉଦାହରଣ:

```swift
Animal.animals
```

ଦ୍ୱିତୀୟଟି ହେଉଛି `extension`।

`extension` ର ଅର୍ଥ ବିସ୍ତାର। ଏହା ଏକେ ପ୍ରକାରର କୋଡ୍‌କୁ ଭାଗ କରି ଲେଖିବାକୁ ଦେଇଥାଏ, ଯାହା କୋଡ୍ ଗଠନକୁ ଅଧିକ ସ୍ପଷ୍ଟ କରେ।

ଏହି ଉଦାହରଣରେ, ଆମେ `extension Animal` ବ୍ୟବହାର କରି ପଶୁ ତଥ୍ୟ ସଞ୍ଚୟ କଲୁ, ଯାହାରେ `Animal` ସ୍ଟ୍ରକ୍ଟ ନିଜେ ଅଧିକ ସରଳ ହୋଇଗଲା।

ଏହା ସହିତ, `Animal` ମୁଖ୍ୟତଃ ତଥ୍ୟ ମଡେଲ୍ ସଞ୍ଚୟ କରେ, SwiftUI ଇଣ୍ଟରଫେସ୍ ସିଧାସଳଖ ଲେଖେ ନାହିଁ, ସେହିପାଇଁ ଏଠାରେ `import Foundation` ବ୍ୟବହାର କରାଯାଇଛି।

ଏହି ପାଠର ମୁଖ୍ୟ ଉଦ୍ଦେଶ୍ୟ କୋଡ୍‌କୁ ଅଧିକ ଜଟିଳ କରିବା ନୁହେଁ, ବରଂ କୋଡ୍‌କୁ ଅଧିକ ପଢ଼ିବା ସହଜ ଏବଂ ରକ୍ଷାଣାବେକ୍ଷଣ ସହଜ କରିବା।
