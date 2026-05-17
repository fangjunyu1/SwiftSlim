# প্রাণীর ডেটা সাজানো

গত পাঠে আমরা একটি সহজ প্রাণী বিশ্বকোষের উদাহরণ সম্পন্ন করেছি।

![view](../../../Resource/029_view.png)

যখন ব্যবহারকারী কোনো প্রাণীতে ট্যাপ করে, পেজটি `Sheet` ব্যবহার করে প্রাণীর বিস্তারিত তথ্য পপ আপ করে দেখায়।

তবে গত পাঠের কোডে একটি সমস্যা ছিল: প্রাণীর ডেটা সরাসরি `ContentView`-এর ভিতরে লেখা ছিল।

উদাহরণ:

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
            // প্রাণীর তালিকা দেখান
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

এই কোডটি স্বাভাবিকভাবে চলতে পারে, কিন্তু প্রাণীর ডেটা যত বেশি হবে, `ContentView` তত দীর্ঘ হয়ে যাবে।

`ContentView` মূলত ইন্টারফেস দেখানোর দায়িত্বে থাকা উচিত, কিন্তু এখন এটি অনেক প্রাণীর ডেটাও সংরক্ষণ করছে। এতে কোড পড়া কঠিন হয় এবং পরে রক্ষণাবেক্ষণ করাও অসুবিধাজনক হয়।

তাই এই পাঠে আমরা একটি কাজ করব:

প্রাণীর ডেটা `ContentView` থেকে আলাদা করে সাজাব।

## কেন ডেটা আলাদা করতে হবে?

SwiftUI-তে ভিউ কোড সাধারণত ইন্টারফেস প্রদর্শনের দায়িত্বে থাকে।

উদাহরণ:

```swift
Text("Dolphin")
Image("dolphin")
```

এই কোডগুলো ইন্টারফেস প্রদর্শনের সঙ্গে সম্পর্কিত।

কিন্তু প্রাণীর ডেটা নিজে, যেমন প্রাণীর নাম, ছবির নাম, বিস্তৃতি অঞ্চল, বাসস্থান এবং বর্ণনা—এগুলো ইন্টারফেসের কাঠামো নয়।

এগুলো বরং একগুচ্ছ স্থির তথ্যের মতো:

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

যদি ইন্টারফেস কোড এবং ডেটা কোড সব একসঙ্গে লেখা হয়, কোড ধীরে ধীরে অগোছালো হয়ে যাবে।

তাই আমরা প্রাণীর ডেটা `Animal` টাইপের মধ্যে রাখতে পারি।

## স্থির ডেটা সংরক্ষণে static ব্যবহার করা

প্রথমে সাজানোর পরের লেখার পদ্ধতি দেখি:

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

এখানে একটি নতুন লাইন যোগ হয়েছে:

```swift
static let animals: [Animal] = [
    
]
```

`static` মানে স্থির প্রপার্টি।

স্থির প্রপার্টি টাইপটির নিজের অন্তর্গত, কোনো নির্দিষ্ট ইনস্ট্যান্সের অন্তর্গত নয়।

এই কথাটি কিছুটা বিমূর্ত, আমরা একটি সহজ উদাহরণের মাধ্যমে বুঝতে পারি।

## সাধারণ প্রপার্টি এবং স্থির প্রপার্টি

ধরা যাক, আমরা একটি `Student` সংজ্ঞায়িত করি:

```swift
struct Student {
    let name: String
}
```

এখানে `name` হলো সাধারণ প্রপার্টি। সাধারণ প্রপার্টি কোনো নির্দিষ্ট ইনস্ট্যান্সের অন্তর্গত।

যদি আমরা `name` অ্যাক্সেস করতে চাই, তাহলে আগে একটি নির্দিষ্ট ছাত্র তৈরি করতে হবে:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

এখানে `student` হলো একটি ইনস্ট্যান্স। আপাতত এটিকে একটি নির্দিষ্ট ছাত্র-ডেটা হিসেবে বোঝা যায়।

কারণ প্রত্যেক ছাত্রের নাম আলাদা হতে পারে, তাই `name` নির্দিষ্ট ছাত্রের ওপরই রাখতে হয়।

কিন্তু কিছু ডেটা কোনো নির্দিষ্ট ইনস্ট্যান্সের অন্তর্গত নয়।

উদাহরণস্বরূপ, আমরা প্রিভিউ করার জন্য একগুচ্ছ উদাহরণ ডেটা প্রস্তুত করতে চাই:

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

এখানে `previewStudents`-এর সামনে `static` আছে, তাই এটি একটি স্থির প্রপার্টি।

স্থির প্রপার্টি কোনো একজন ছাত্রের অন্তর্গত নয়; এটি `Student` টাইপটির নিজের অন্তর্গত।

তাই আমাদের আগে কোনো ছাত্র তৈরি করতে হয় না, সরাসরি টাইপের নাম দিয়ে অ্যাক্সেস করা যায়:

```swift
print(Student.previewStudents.count)    // 3
```

এখানে অ্যাক্সেস করার পদ্ধতি হলো:

```swift
TypeName.staticPropertyName
```

অর্থাৎ:

```swift
Student.previewStudents
```

একইভাবে, প্রাণী বিশ্বকোষে আমরা এভাবে প্রাণীর ডেটা অ্যাক্সেস করতে পারি:

```swift
Animal.animals
```

## ContentView-এ ফিরে আসা

এখন প্রাণীর ডেটা `Animal` টাইপে সংরক্ষণ করা হয়েছে।

তাই `ContentView`-এর ভিতরে আর দীর্ঘ প্রাণী অ্যারে লিখতে হবে না।

আমরা এটিকে বদলে এভাবে লিখতে পারি:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // প্রাণীর তালিকা দেখান
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

এই কোড লাইনটির অর্থ হলো:

```swift
let animals = Animal.animals
```

`Animal` টাইপ থেকে `animals` নামের প্রাণীর ডেটা বের করে বর্তমান ভিউর `animals` কনস্ট্যান্টে সংরক্ষণ করা।

এভাবে লেখার পরে `ContentView` আরও সংক্ষিপ্ত হয়।

`ContentView` ইন্টারফেস দেখানোর দায়িত্বে থাকে, আর `Animal.animals` প্রাণীর ডেটা সরবরাহ করার দায়িত্বে থাকে।

## Animal-কে আলাদা ফাইলে ভাগ করা

গত পাঠে উদাহরণটি সহজে বোঝার জন্য আমরা `Animal` এবং `ContentView` একই ফাইলে লিখেছিলাম।

কারণ তখন কোড তুলনামূলকভাবে কম ছিল, এভাবে লেখা সমস্যা ছিল না।

কিন্তু এখন প্রাণীর ডেটা ক্রমে বাড়তে থাকলে, যদি সব কোড `ContentView.swift`-এর ভিতরেই রাখা হয়, ফাইলটি খুব দীর্ঘ হয়ে যাবে এবং পড়তেও অসুবিধা হবে।

তাই আমরা `Animal`-কে আলাদা একটি নতুন Swift ফাইলে রাখতে পারি।

Xcode-এ একটি নতুন Swift ফাইল তৈরি করা যায়, যেমন:

```swift
Animal.swift
```

তারপর `Animal` স্ট্রাক্টটিকে এই ফাইলে সরিয়ে নেওয়া যায়:

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

এভাবে সাজানোর পরে:

`ContentView.swift` ইন্টারফেস দেখানোর দায়িত্বে থাকে।

`Animal.swift` প্রাণীর ডেটার গঠন বর্ণনার দায়িত্বে থাকে।

যদিও এগুলো আলাদা ফাইলে রাখা হয়েছে, যতক্ষণ তারা একই প্রজেক্টে থাকে, `ContentView` এখনও সরাসরি `Animal` ব্যবহার করতে পারে।

উদাহরণ:

```swift
let animals = Animal.animals
```

এখানে `ContentView.swift`-এ অতিরিক্তভাবে `Animal.swift` ইমপোর্ট করার দরকার নেই।

Swift একই প্রজেক্টের Swift ফাইলগুলো স্বয়ংক্রিয়ভাবে চিনে নেয়।

## কোড আরও সাজাতে extension ব্যবহার করা

এখন আমরা প্রাণীর ডেটা `ContentView` থেকে সরিয়ে `Animal`-এর ভিতরে এনেছি।

তবে `Animal` স্ট্রাক্টের ভিতরে এখনও দুই ধরনের কোড একসঙ্গে রয়েছে:

প্রথম ধরনের কোড হলো প্রাণী মডেলের নিজস্ব প্রপার্টি:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

দ্বিতীয় ধরনের কোড হলো স্থির প্রাণীর ডেটা:

```swift
static let animals: [Animal] = [
    // ...
]
```

কোডের কাঠামো আরও পরিষ্কার করতে আমরা `extension` ব্যবহার করে এই দুই অংশ আলাদা করতে পারি।

`extension`-এর অর্থ হলো এক্সটেনশন বা সম্প্রসারণ।

এটি বিদ্যমান টাইপের ভিত্তিতে নতুন কোড যোগ করতে পারে।

উদাহরণ:

```swift
extension Animal {
    
}
```

এর অর্থ হলো আমরা `Animal` টাইপটি সম্প্রসারণ করছি।

## প্রাণীর ডেটা extension-এ রাখা

আমরা `Animal`-কে এভাবে বদলাতে পারি:

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

এভাবে সাজানোর পরে কোডের কাঠামো আরও পরিষ্কার হয়।

`struct Animal` একটি প্রাণীর কী কী প্রপার্টি থাকা উচিত তা বর্ণনার দায়িত্বে থাকে।

`extension Animal` একগুচ্ছ স্থির প্রাণীর ডেটা সংরক্ষণের দায়িত্বে থাকে।

খেয়াল করুন, যদিও `animals`-কে `extension Animal`-এর মধ্যে সরানো হয়েছে, ব্যবহার করার পদ্ধতি বদলায়নি।

আমরা এখনও এভাবে ব্যবহার করতে পারি:

```swift
let animals = Animal.animals
```

এটিও `extension`-এর একটি বৈশিষ্ট্য: এটি শুধু কোড সাজাতে সাহায্য করে, বাইরের কল করার পদ্ধতি বদলায় না।

## ডেটা বেশি হলে আবার AnimalData ফাইল তৈরি করা যায়

এখন আমরা `Animal`-কে আলাদা `Animal.swift` ফাইলে রেখেছি।

যদি প্রাণীর ডেটা কম হয়, তাহলে সরাসরি `extension Animal`-ও `Animal.swift`-এর ভিতরে লেখা যায়।

কিন্তু যদি প্রাণীর ডেটা ক্রমে বাড়তে থাকে, তাহলে আরও একটি ফাইল তৈরি করা যায়, যেমন:

```swift
AnimalData.swift
```

তারপর স্থির প্রাণীর ডেটা সেখানে রাখা যায়:

```swift
extension Animal {
    static let animals: [Animal] = [
        // প্রাণীর ডেটা
    ]
}
```

এভাবে করলে কোডের দায়িত্বের বিভাজন আরও পরিষ্কার হয়:

`Animal.swift` শুধু প্রাণী মডেল সংজ্ঞায়িত করার দায়িত্বে থাকে।

`AnimalData.swift` শুধু প্রাণীর ডেটা সংরক্ষণের দায়িত্বে থাকে।

`ContentView.swift` শুধু ইন্টারফেস দেখানোর দায়িত্বে থাকে।

প্রতিটি ফাইলের দায়িত্ব আরও পরিষ্কার হয়।

খেয়াল করুন, `AnimalData.swift` শুধু ফাইলের নাম, নতুন কোনো Swift টাইপ নয়। এই ফাইলের ভিতরে এখনও `extension Animal` ব্যবহার করে `Animal`-এ স্থির ডেটা যোগ করা হচ্ছে।

## সম্পূর্ণ কোড

নিচে সাজানোর পরের `Animal.swift` কোড:

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

সাজানোর পরের `AnimalData.swift` কোড:

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

`ContentView.swift`-এ এভাবে ব্যবহার করা যায়:

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

টিপ: `Animal.swift` এবং `AnimalData.swift` ফাইলের প্রথম লাইনে লেখা হয়েছে:

```swift
import Foundation
```

আগে আমরা SwiftUI ইন্টারফেস লেখার সময় প্রায়ই ব্যবহার করেছি:

```swift
import SwiftUI
```

কারণ `ContentView`, `Text`, `Button`, `Color`—এসব বিষয়বস্তু ইন্টারফেসের সঙ্গে সম্পর্কিত, তাই ইন্টারফেস ফাইল লেখার সময় সাধারণত SwiftUI ইমপোর্ট করতে হয়।

কিন্তু এখানে `Animal.swift` এবং `AnimalData.swift` ইন্টারফেস ফাইল নয়। এগুলো মূলত প্রাণী মডেল সংজ্ঞায়িত করা এবং প্রাণীর ডেটা সংরক্ষণ করার জন্য ব্যবহৃত হয়।

এই কোডে `UUID()` ব্যবহার করতে `Foundation` দরকার, তাই শুধু `Foundation` ইমপোর্ট করলেই হবে।

## সারাংশ

এই পাঠে আমরা মূলত একটি কাজ করেছি: প্রাণীর ডেটা `ContentView` থেকে সাজিয়ে আলাদা করেছি।

আগের লেখার পদ্ধতি ছিল প্রাণীর ডেটা সরাসরি `ContentView`-এর ভিতরে লেখা। এতে কোড চলতে পারে, কিন্তু ডেটা বাড়লে ভিউ ফাইল ক্রমে দীর্ঘ হয়।

সাজানোর পরে, `ContentView` শুধু ইন্টারফেস দেখানোর দায়িত্বে থাকে, আর `Animal.animals` প্রাণীর ডেটা সরবরাহ করার দায়িত্বে থাকে।

এই পাঠে আমরা আরও দুইটি নতুন জ্ঞান শিখেছি।

প্রথমটি হলো `static`।

`static` মানে স্থির প্রপার্টি। স্থির প্রপার্টি টাইপটির নিজের অন্তর্গত, এবং “টাইপের নাম.প্রপার্টির নাম” পদ্ধতিতে সরাসরি অ্যাক্সেস করা যায়।

উদাহরণ:

```swift
Animal.animals
```

দ্বিতীয়টি হলো `extension`।

`extension` মানে সম্প্রসারণ। এটি একই টাইপের কোড আলাদা করে লিখতে পারে, ফলে কোডের কাঠামো আরও পরিষ্কার হয়।

এই উদাহরণে, আমরা `extension Animal` ব্যবহার করে প্রাণীর ডেটা সংরক্ষণ করেছি, যাতে `Animal` স্ট্রাক্ট নিজে আরও সংক্ষিপ্ত হয়।

এছাড়া, `Animal` মূলত ডেটা মডেল সংরক্ষণ করে, সরাসরি SwiftUI ইন্টারফেস লেখা হয় না, তাই এখানে `import Foundation` ব্যবহার করা হয়েছে।

এই পাঠের মূল বিষয় কোডকে আরও জটিল করা নয়, বরং কোডকে আরও সহজে পড়া ও রক্ষণাবেক্ষণযোগ্য করা।
