# কাস্টম রং

এই পাঠে আমরা SwiftUI-তে কীভাবে কাস্টম রং ব্যবহার করতে হয় তা শিখব।

আগের পাঠগুলোতে আমরা SwiftUI-এর দেওয়া ডিফল্ট রং ব্যবহার করেছি, যেমন:

```swift
Color.blue
Color.red
Color.green
```

এই রংগুলো ব্যবহার করা খুব সুবিধাজনক, কিন্তু বাস্তব App ডেভেলপমেন্টে ডিফল্ট রং সাধারণত যথেষ্ট নির্ভুল নয়।

উদাহরণস্বরূপ, ডিজাইন ফাইলে এমন রং ব্যবহার করা হতে পারে:

```text
#2c54c2
#4875ed
#213e8d
```

এই ধরনের রংকে Hex রং বলা হয়।

এই পাঠে আমরা প্রথমে SwiftUI-কে Hex রং সমর্থন করতে দেব, তারপর `static` ব্যবহার করে সাধারণভাবে ব্যবহৃত রংগুলো সাজিয়ে রাখব।

শেষে আমরা কাস্টম রং প্রাণী বিশ্বকোষ ভিউতে প্রয়োগ করব এবং আরও এক ধাপ এগিয়ে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড ব্যবহার করব, যাতে বোতামটি আরও স্তরবিন্যাসপূর্ণ দেখায়।

## কেন কাস্টম রং দরকার?

SwiftUI-তে আমরা সরাসরি সিস্টেম রং ব্যবহার করতে পারি।

উদাহরণস্বরূপ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

এখানে `.blue` নীল রং বোঝায়। এটি আসলে `Color.blue`-এর সংক্ষিপ্ত লেখা।

ডিফল্ট রঙের সুবিধা হলো সহজ এবং সুবিধাজনক, কিন্তু রঙের পছন্দ তুলনামূলকভাবে সীমিত।

উদাহরণস্বরূপ:

```swift
Color.blue
```

এটি শুধু SwiftUI-এর দেওয়া ডিফল্ট নীল রং বোঝাতে পারে।

![Color.blue](../../../Resource/031_color6.png)

কিন্তু বাস্তব ডেভেলপমেন্টে আমাদের প্রায়ই আরও নির্দিষ্ট রং দরকার হয়।

উদাহরণস্বরূপ, সবই নীল হলেও হালকা নীল, গাঢ় নীল, ধূসর নীল, উজ্জ্বল নীল ইত্যাদি আলাদা প্রভাব থাকতে পারে।

![More Blue](../../../Resource/031_color5.png)

এই সময় শুধু `Color.blue` ব্যবহার করলে ডিজাইনের প্রভাব পুনরুদ্ধার করা কঠিন হয়।

তাই আমাদের SwiftUI-কে কাস্টম রং সমর্থন করাতে হবে।

## Hex রং কী?

স্ক্রিনের রং সাধারণত লাল, সবুজ এবং নীল — এই তিনটি চ্যানেল দিয়ে গঠিত, অর্থাৎ RGB।

RGB আলাদাভাবে বোঝায়:

```text
Red     // লাল
Green   // সবুজ
Blue    // নীল
```

Hex রং হলো RGB রঙের একটি প্রকাশ পদ্ধতি।

উদাহরণস্বরূপ:

```swift
#5479FF
```

এই রঙের মানটি সহজভাবে তিন ভাগে বোঝা যায়:

```text
54  // লাল চ্যানেল বোঝায়
79  // সবুজ চ্যানেল বোঝায়
FF  // নীল চ্যানেল বোঝায়
```

এই পাঠে আমাদের এই মানগুলো গণনা করতে হবে না, এবং হেক্সাডেসিমাল নিয়মও গভীরভাবে বুঝতে হবে না।

এখন শুধু জানা দরকার: `#5479FF` একটি নির্দিষ্ট রং বোঝায়।

ভবিষ্যতে যখন আমরা `#2c54c2`, `#4875ed`-এর মতো লেখা দেখব, তখন আগে এটিকে একটি রঙের মান হিসেবে বুঝতে পারি।

Sketch, Figma, Photoshop-এর মতো ডিজাইন টুলেও প্রায়ই এ ধরনের রঙের মান দেখা যায়।

![color](../../../Resource/031_color.png)

কিন্তু SwiftUI ডিফল্টভাবে সরাসরি এভাবে লিখতে পারে না:

```swift
Color(hex: "#5479FF")
```

তাই আমাদের নিজে `Color` টাইপ প্রসারিত করতে হবে, যাতে এটি Hex স্ট্রিং দিয়ে রং তৈরি করতে পারে।

## Color+Hex.swift ফাইল তৈরি করা

প্রথমে আমরা একটি নতুন Swift ফাইল তৈরি করি।

ফাইলের নাম এভাবে লেখা যেতে পারে:

```text
Color.swift
```

আরও পরিষ্কারভাবে এভাবেও লেখা যায়:

```text
Color+Hex.swift
```

এখানে বেশি সুপারিশ করা হচ্ছে:

```text
Color+Hex.swift
```

Swift প্রজেক্টে `Color+Hex.swift`-এর মতো ফাইলের নাম খুব সাধারণ।

এটি বোঝায় যে এই ফাইলটি `Color`-এ Hex ক্ষমতা যোগ করার একটি এক্সটেনশন ফাইল।

ফাইলের নাম সরাসরি কোড চালনায় প্রভাব ফেলে না; এটি শুধু আমাদের ফাইলটিরব্যবহার আরও সহজে বুঝতে সাহায্য করে।

## Color(hex:) কোড যোগ করা

`Color+Hex.swift` ফাইলে নিচের কোড লিখুন:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
```

এই কোডটি `extension` ব্যবহার করে `Color` টাইপ প্রসারিত করেছে এবং `Color`-এ একটি নতুনইনিশিয়ালাইজার যোগ করেছে:

```swift
init(hex: String)
```

এইইনিশিয়ালাইজার থাকার পরে আমরা Hex স্ট্রিং `Color`-এ পাঠিয়ে একটি কাস্টম রং তৈরি করতে পারি:

```swift
Color(hex: "#5479FF")
```

এই এক্সটেনশন কোডের ভেতরে Hex স্ট্রিংকে SwiftUI চিনতে পারে এমন RGB রঙে রূপান্তর করা হয়।

এই পর্যায়ে প্রতিটি লাইনের রূপান্তর লজিক গভীরভাবে বোঝার দরকার নেই। শুধু বুঝতে হবে, যোগ করা `Color(hex:)` মেথড আমাদের Hex রঙের মান দিয়ে কাস্টম রং তৈরি করতে দেয়।

## কাস্টম রং ব্যবহার করা

এখন আমরা `ContentView`-এ কাস্টম রং পরীক্ষা করতে পারি।

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)

            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))

            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))

            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

প্রদর্শনের ফলাফল:

![color](../../../Resource/031_color1.png)

এই উদাহরণে, প্রথম লাইনে সিস্টেম রং ব্যবহার করা হয়েছে:

```swift
.foregroundStyle(Color.blue)
```

পরের তিন লাইনে কাস্টম Hex রং ব্যবহার করা হয়েছে:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

তুলনা করলে দেখা যায়, সিস্টেম নীল রঙের শুধু একটি ডিফল্ট প্রভাব আছে।

কিন্তু Hex রং আরও সূক্ষ্ম নীল পরিবর্তন প্রকাশ করতে পারে।

এটাই কাস্টম রঙের মূল্য: এটি ইন্টারফেসের রংকে বাস্তব ডিজাইনের আরও কাছাকাছি আনতে পারে, এবং App-এর ভিজ্যুয়াল স্টাইল নিয়ন্ত্রণ করাও সহজ করে।

## static ব্যবহার করে রং সাজানো

এখন আমরা Hex স্ট্রিং দিয়ে রং তৈরি করতে পারি:

```swift
Color(hex: "#2c54c2")
```

এই লেখাটি স্বাভাবিকভাবে ব্যবহার করা যায়, কিন্তু একই রং যদি একাধিক জায়গায় বারবার দেখা যায়, পরে রক্ষণাবেক্ষণ করা সুবিধাজনক নয়।

যদি ১০টি জায়গায় একই রঙের মান লেখা থাকে, পরে এই নীল রং পরিবর্তন করতে চাইলে একে একে সব জায়গায়পরিবর্তন করতে হবে।

এই সময় আমরা `static` ব্যবহার করে সাধারণভাবে ব্যবহৃত রংগুলো এক জায়গায় সাজিয়ে রাখতে পারি।

`Color+Hex.swift` ফাইলের নিচে নিচের কোড আরও যোগ করুন:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

এখানে আমরা `Color`-এ তিনটি static property যোগ করেছি: `animalBlue`, `animalLightBlue` এবং `animalDarkBlue`। এগুলো আলাদা আলাদা গভীরতার নীল রং বোঝায়।

কারণ এই propertyগুলো `static` ব্যবহার করেছে, তাই এগুলো `Color` টাইপের নিজের অন্তর্গত।

ব্যবহারের সময় সরাসরি `Color.` দিয়েঅ্যাক্সেস করা যায়:

```swift
Color.animalBlue
```

এই লেখাটি সরাসরি Hex স্ট্রিং লেখার চেয়ে বেশি পরিষ্কার।

যখন আমরা `Color.animalBlue` দেখি, তখন বুঝতে পারি এটি প্রাণী বিশ্বকোষে ব্যবহৃত নীল রং বোঝায়।

আর `Color(hex: "#2c54c2")` দেখলে শুধু বোঝা যায় এটি একটি রঙের মান, কিন্তু এর নির্দিষ্টব্যবহার বোঝা সহজ নয়।

এক জায়গায় রংপরিচালনা করার আরেকটি সুবিধা আছে: পরেপরিবর্তন করা সহজ।

যদি প্রাণী বিশ্বকোষের প্রধান রংসমন্বয় করতে চাই, শুধুসংজ্ঞার স্থানেপরিবর্তন করতে হবে:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

এই রং ব্যবহার করা সব জায়গা একসঙ্গেআপডেট হবে।

এটাই `static` ব্যবহার করে রং সাজানোরঅর্থ: রঙের নাম আরও পরিষ্কার করা, এবং পরে রক্ষণাবেক্ষণ আরও সুবিধাজনক করা।

## প্রাণী বিশ্বকোষে প্রয়োগ করা

এখন আমরা কাস্টম রং আগের প্রাণী বিশ্বকোষ ভিউতে প্রয়োগ করতে পারি।

আগে প্রাণী বোতামের ব্যাকগ্রাউন্ড ছিল সাদা:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

এখন আমরা এটিকে কাস্টম রঙে बदलাতে পারি:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

এখানকার `Color.animalBlue` হলো আমরাএইমাত্র `Color+Hex.swift`-এসংজ্ঞায়িত করা static রং।

বোতামের লেখায় সাদা রং ব্যবহার করা হয়েছে:

```swift
.foregroundStyle(Color.white)
```

প্রাণী emoji-এর ব্যাকগ্রাউন্ডে অর্ধস্বচ্ছ সাদা রং ব্যবহার করা হয়েছে:

```swift
.background(Color.white.opacity(0.15))
```

এভাবে বোতামটি একটিএকীভূত নীল ভিজ্যুয়াল স্টাইল তৈরি করে।

এই ধাপেরমূল বিষয় জটিল কোডযোগ করা নয়, বরংআগে শেখা কাস্টম রং বাস্তব ইন্টারফেসে প্রয়োগ করা।

## গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড ব্যবহার করা

একটি একক রং ব্যবহারের পাশাপাশি, আমরা একাধিক রং একত্র করে গ্রেডিয়েন্ট প্রভাবও তৈরি করতে পারি।

উদাহরণস্বরূপ, আমরাআগে এই রংগুলোসংজ্ঞায়িত করেছি:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

এই রংগুলো শুধু আলাদাভাবে ব্যবহার করা যায় না, গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড হিসেবেওসমন্বয় করা যায়।

SwiftUI-তে `LinearGradient` ব্যবহার করে linear gradient তৈরি করা যায়।

উদাহরণস্বরূপ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

এই কোডটি বাম থেকে ডানে একটি গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড তৈরি করবে, যেখানে রং `Color.animalBlue` থেকে ধীরে ধীরে `Color.animalLightBlue`-এ পরিবর্তিত হবে।

এর মধ্যে `colors` গ্রেডিয়েন্টে অংশ নেওয়া রংসেট করতে ব্যবহৃত হয়, আর `startPoint` ও `endPoint` গ্রেডিয়েন্টের দিক নিয়ন্ত্রণ করে।

### গ্রেডিয়েন্ট প্রভাব পরীক্ষা করা

আমরা একটি সহজ Text দিয়ে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড পরীক্ষা করতে পারি।

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

প্রদর্শনের ফলাফল:

![color](../../../Resource/031_color3.png)

এই উদাহরণে, `Text`-এর ব্যাকগ্রাউন্ড আর একক রং নয়; এটি বাম থেকে ডানে ধীরে ধীরে পরিবর্তিত গ্রেডিয়েন্ট রং।

সাধারণ ব্যাকগ্রাউন্ড রঙের তুলনায়, গ্রেডিয়েন্ট ব্যাকগ্রাউন্ডে বেশি স্তর থাকে, এবং ইন্টারফেসে ভিজ্যুয়াল ফোকাস তৈরি করাও সহজ হয়।

## প্রাণী বিশ্বকোষে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড ব্যবহার করা

এখন আমরা প্রাণী বোতামের ব্যাকগ্রাউন্ড রং:

```swift
.background(Color.animalBlue)
```

গ্রেডিয়েন্ট ব্যাকগ্রাউন্ডেপরিবর্তন করতে পারি:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

সম্পূর্ণ কোডনিচে দেওয়া হলো:

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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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

প্রদর্শনের ফলাফল:

![color](../../../Resource/031_color4.png)

এখন প্রাণী বোতাম আর শুধু একক ব্যাকগ্রাউন্ড রং নয়, বরং বাম থেকে ডানে গ্রেডিয়েন্ট প্রভাব রয়েছে।

একক রঙের ব্যাকগ্রাউন্ডের তুলনায়, গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড ইন্টারফেসকে আরও স্তরবিন্যাসপূর্ণ দেখাতে পারে, এবং বাস্তব App-এর ভিজ্যুয়াল ডিজাইনের কাছাকাছিও আনতে পারে।

## একক রঙের ব্যাকগ্রাউন্ড এবং গ্রেডিয়েন্ট ব্যাকগ্রাউন্ডের পার্থক্য

একক রঙের ব্যাকগ্রাউন্ড শুধু একটি রং ব্যবহার করে।

উদাহরণস্বরূপ:

```swift
.background(Color.animalBlue)
```

এই লেখাটি সহজ ও পরিষ্কার, এবং বেশিরভাগমৌলিক ইন্টারফেসের জন্য উপযুক্ত।

গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড একাধিক রং ব্যবহার করে।

উদাহরণস্বরূপ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

এই লেখাটি ইন্টারফেসে আরও স্তর যোগ করতে পারে, কিন্তু ভিজ্যুয়াল জটিলতাও সহজে বাড়িয়ে দিতে পারে।

তাই বাস্তব ডেভেলপমেন্টে এভাবে বোঝা যায়:

একক রঙের ব্যাকগ্রাউন্ড সাধারণ লেখা, সাধারণ বোতাম, সাধারণ কার্ড এবং সাধারণ পেজ ব্যাকগ্রাউন্ডের জন্য উপযুক্ত।

গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড গুরুত্বপূর্ণ বোতাম, উপরের এলাকা, কভার কার্ড, ফিচার এন্ট্রি ইত্যাদি জোর দিয়ে দেখানোর অবস্থানের জন্য উপযুক্ত।

## সারাংশ

এই পাঠে আমরা SwiftUI-তে কীভাবে কাস্টম রং ব্যবহার করতে হয় তা শিখেছি।

প্রথমে আমরা Hex রং সম্পর্কে জেনেছি।

উদাহরণস্বরূপ:

```text
#2c54c2
```

এটি একটি নির্দিষ্ট রং বোঝায়।

তারপর আমরা `extension Color` ব্যবহার করে `Color` টাইপ প্রসারিত করেছি।

যাতে SwiftUI নিচেরপদ্ধতিে রং তৈরি করতে পারে:

```swift
Color(hex: "#2c54c2")
```

এরপর আমরা `static` ব্যবহার করে সাধারণভাবে ব্যবহৃত রং সাজিয়েছি:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

এভাবে অন্য ভিউতে সরাসরি ব্যবহার করা যায়:

```swift
Color.animalBlue
```

প্রতিবার Hex স্ট্রিং লেখার তুলনায়, এইপদ্ধতিটি আরও পরিষ্কার এবং পরে একত্রে রংপরিবর্তন করাও আরও সুবিধাজনক।

শেষে আমরা `LinearGradient` শিখেছি এবং কাস্টম রংগুলোসমন্বয় করে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড তৈরি করেছি:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

এই পাঠের মাধ্যমে আমরা “কাস্টম রং তৈরি করা” থেকে “বাস্তব ইন্টারফেসে রং ব্যবহার করা” পর্যন্ত প্রক্রিয়াটি সম্পন্ন করেছি।

ভবিষ্যতে, কোনো রং যদি একাধিক জায়গায় বারবার ব্যবহার করতে হয়, তাহলে সেটি আগে `Color` এক্সটেনশনে সাজিয়ে রাখার কথা ভাবা যায়।

এতে কোড আরও পরিষ্কার হবে, এবং ইন্টারফেসের স্টাইলও আরও সহজেএকীভূত রাখা যাবে।