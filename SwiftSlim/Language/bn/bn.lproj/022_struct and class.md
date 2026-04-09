# struct এবং class

আগের পাঠে আমরা সবে `struct`-এর সাথে পরিচিত হতে শুরু করেছি, একটি স্ট্রাকচার সংজ্ঞায়িত করেছি, আর পাশাপাশি প্রোটোকল, `UUID` ইত্যাদি জ্ঞানও বাড়িয়েছি।

এখন `struct` কীওয়ার্ড সম্পর্কে আমাদের প্রাথমিক ধারণা হয়েছে, কিন্তু এটাকে এখনো পুরোপুরি বোঝা বলা যাবে না।

এই পাঠে আমরা `struct`-কেই মূল বিষয় হিসেবে নিয়ে এগোব, আর সেই সঙ্গে `class` সম্পর্কেও পরিচিত হব। এই পাঠের মাধ্যমে তুমি আরও পরিষ্কারভাবে জানতে পারবে: instance কী, constructor কী, এবং কেন আমরা `struct` ও `class` দিয়ে ডেটা সংগঠিত করতে পারি।

## শিক্ষার্থী ব্যবস্থাপনা সিস্টেম

উদাহরণ হিসেবে, এখন আমরা একটি শিক্ষার্থী ব্যবস্থাপনা সিস্টেম তৈরি করতে চাই। প্রতিটি শিক্ষার্থীর নাম, লিঙ্গ, ফোন, বয়স, বাড়ির ঠিকানা ইত্যাদি তথ্য থাকে।

এই সময় আমরা এসব তথ্য একসাথে মিলিয়ে একটি `Student` স্ট্রাকচার হিসেবে সংজ্ঞায়িত করতে পারি:

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

এখানে আমরা `struct` ব্যবহার করে একটি শিক্ষার্থী টাইপ সংজ্ঞায়িত করেছি।

এই `Student` স্ট্রাকচারের মধ্যে একাধিক property রয়েছে:

- `id`: শিক্ষার্থীর অনন্য পরিচয়
- `name`: শিক্ষার্থীর নাম
- `sex`: শিক্ষার্থীর লিঙ্গ
- `phone`: শিক্ষার্থীর ফোন
- `age`: শিক্ষার্থীর বয়স
- `address`: বাড়ির ঠিকানা

এভাবে আগে ছড়িয়ে থাকা একাধিক ডেটা একত্র হয়ে একটি সম্পূর্ণ "শিক্ষার্থী" হয়ে যায়।

এখানে `Student` `Identifiable` protocol-ও অনুসরণ করছে, এবং একটি `id` ফিল্ড সংজ্ঞায়িত করেছে, যাতে পরে `ForEach` লুপের সাথে ডেটা দেখানো সহজ হয়।

এরপর আমরা একটি শিক্ষার্থী instance তৈরি করতে পারি:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

এই কোডটি বোঝায়, `Student` এই কাঠামো অনুসারে একটি নির্দিষ্ট শিক্ষার্থী ডেটা তৈরি করা যায়।

এখানে `Student` হলো টাইপ, আর `Student(...)` বোঝায় তৈরি করা একটি instance।

SwiftUI-তে আমরা এই instance-টিকে একটি ভেরিয়েবলে অ্যাসাইন করে তারপর দেখাতে পারি।

উদাহরণ হিসেবে:

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

এভাবে আমরা ভিউতে এই শিক্ষার্থীর নাম দেখতে পারি: `Fang Junyu`।

এখানে আমরা প্রথমে একটি `Student` instance তৈরি করেছি, তারপর সেটিকে `student` ভেরিয়েবলে অ্যাসাইন করেছি, এবং শেষে `student.name` দিয়ে তার property পড়েছি।

## instance কী

যখন আমরা প্রথম `struct` শিখতে শুরু করি, তখন "instance" শব্দটি একটু অচেনা লাগতে পারে।

কিন্তু আসলে আমরা শুরু থেকেই instance ব্যবহার করছি, শুধু আগে এটাকে আলাদা করে খেয়াল করিনি।

উদাহরণ হিসেবে:

```swift
let name = "Fang Junyu"
```

এখানে `"Fang Junyu"` একটি string value, আর মূলত এটি `String` টাইপের একটি instance।

আমরা এটাকে এভাবেও লিখতে পারি:

```swift
let name = String("Fang Junyu")
```

এই দুই ধরনের লেখাই একই কথা বোঝায়: একটি `String` টাইপের instance তৈরি করা এবং সেটিকে `name` ভেরিয়েবলে অ্যাসাইন করা।

একইভাবে, `Int`-এর ক্ষেত্রেও তাই:

```swift
let num = 3
```

এখানে `3` মূলত `Int` টাইপের একটি value, এবং এটাকে `Int` instance হিসেবেও বোঝা যায়।

তাই instance এমন কোনো বিশেষ ধারণা নয় যা শুধু `struct`-এ দেখা যায়।

`String`, `Int`, `Double`, `Bool`, বা কাস্টম `Student` যাই হোক না কেন, এগুলোর সবগুলিই instance তৈরি করতে পারে।

তাই, যখন আমরা লিখি:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

মূলত এটা `String` বা `Int`-এর instance তৈরি করার মতোই, শুধু `Student` হলো আমাদের নিজের সংজ্ঞায়িত টাইপ।

## constructor

যখন আমরা একটি instance তৈরি করি:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

আসলে তখন আমরা `Student`-এর initialization method, অর্থাৎ `init`-কেই কল করছি।

constructor-কে তুমি এভাবে বুঝতে পার: **instance তৈরি করার সময় property-তে মান দেওয়ার জন্য এটি হলো প্রবেশদ্বার।**

অর্থাৎ, একটি instance সত্যিকারের তৈরি সম্পূর্ণ হওয়ার আগে সাধারণত তাকে আগে `init`-এর মধ্য দিয়ে যেতে হয়।

উদাহরণ হিসেবে, আগে SwiftUI view lifecycle শেখার সময় আমরা এমন কোড লিখেছিলাম:

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

এখানে `init()` `ContentView` instance তৈরি হওয়ার সময় চালিত হয়, আর `onAppear` তখনই চালিত হয় যখন view সত্যিই স্ক্রিনে দেখানো হয়। অর্থাৎ view তৈরি হওয়া আর view দেখানো একই সময়ে ঘটে না।

একইভাবে, যখন আমরা `Student(...)` তৈরি করি, তখনও আমরা `Student`-এর constructor-ই কল করছি।

### সিস্টেম স্বয়ংক্রিয়ভাবে তৈরি করা constructor

আমরা যখন `Student` সংজ্ঞায়িত করেছিলাম, তখন হাতে `init` লিখিনি:

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

কিন্তু তবুও আমরা সরাসরি instance তৈরি করতে পারি:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor না লিখেও instance তৈরি করা যায় কেন?

কারণ `struct`-এর ক্ষেত্রে, যদি আমরা হাতে constructor না লিখি, তাহলে সিস্টেম সাধারণত আমাদের জন্য স্বয়ংক্রিয়ভাবে একটি উপযুক্ত constructor তৈরি করে দেয়।

শেখার শুরুর পর্যায়ে এটাকে সহজভাবে বোঝা যায় এভাবে: Swift আমাদের হয়ে initialization code নিজে থেকেই পূরণ করে দেয়।

মোটামুটি এভাবে বোঝা যায় যে সিস্টেম আমাদের জন্য নিচের কোডটি তৈরি করে দেয়:

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

এখানে একটি খুঁটিনাটি বিষয় খেয়াল করা দরকার:

```swift
let id = UUID()
```

`id`-এর আগে থেকেই একটি default value আছে, তাই instance তৈরি করার সময় আমাদের আর হাতে `id` পাঠাতে হয় না।

অর্থাৎ, যেসব property-র default value নেই, সেগুলো সাধারণত constructor-এ পাঠাতে হয়; আর যেসব property-র আগে থেকেই default value আছে, সেগুলো সাধারণত সেই আগের default value-টাই ব্যবহার করতে পারে।

তাই `Student` instance তৈরি করার সময় আমাদের শুধু `name`, `sex`, `phone`, `age` এবং `address` পাঠালেই হয়।

### compiler-এর ইঙ্গিত

এছাড়াও, যখন আমরা Xcode-এ `Student(...)` লিখি, তখন সিস্টেম দেওয়া parameter hint-ও দেখতে পাই।

![student](../../Resource/022_student.png)

এটাও আসলে বোঝায়: বর্তমান এই টাইপের জন্য সত্যিই একটি সিস্টেম-স্বয়ংক্রিয়ভাবে তৈরি করা constructor আছে।

### নিজে constructor লেখা

যদিও সিস্টেম স্বয়ংক্রিয়ভাবে constructor তৈরি করতে পারে, তবুও কখনও কখনও এই default initialization পদ্ধতি পুরোপুরি আমাদের প্রয়োজনের সাথে মেলে না।

উদাহরণ হিসেবে, আমাদের একটি `Movie` স্ট্রাকচার আছে:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

সিস্টেম স্বয়ংক্রিয়ভাবে তৈরি করা constructor অনুযায়ী, instance তৈরি করার সময় আমাদের এই তিনটি parameter-ই একসাথে পাঠাতে হবে:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

কিন্তু যদি এখন আমরা কিছু পুরোনো সিনেমার তথ্য যোগ করতে চাই, আর শুধু সিনেমার নামই জানি, পরিচালক আর rating না জানি, তাহলে একটু ঝামেলা হবে।

কারণ তখন আমাদের এভাবে লিখতেই হবে:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

এভাবে কাজ চললেও, প্রতি বার `--` বারবার লেখা সুবিধাজনক নয়।

এ সময় আমরা একটি constructor লিখতে পারি:

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

এভাবে পুরোনো সিনেমা তৈরি করার সময় শুধু `name` পাঠালেই হবে:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

এটাই নিজে constructor লেখার একটি অর্থ: **instance তৈরির পদ্ধতিকে বাস্তব প্রয়োজনের সাথে আরও ভালোভাবে মিলিয়ে নেওয়া।**

### custom constructor বিশ্লেষণ

চলো, একটু আগে হাতে লেখা constructor-টি দেখে নিই:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

এই কোডের অর্থ হলো, `Movie` instance তৈরি করার সময় শুধু একটি `name` parameter পাঠালেই হবে।

এরপর constructor-এর ভেতরে পাঠানো `name`-টিকে instance-এর নিজের `name`-এ অ্যাসাইন করা হবে, আর `director` ও `rating`-কে default value `--` দেওয়া হবে।

এখানে `self` বোঝায় "বর্তমান এই instance নিজেই"।

উদাহরণ হিসেবে:

```swift
self.name = name
```

বাম পাশের `self.name` বোঝায় instance-এর property; ডান পাশের `name` বোঝায় আমরা যে parameter পাঠিয়েছি।

সহজভাবে বোঝা যায়, বাইরে থেকে পাঠানো মানটি instance-এর নিজের property-তে সংরক্ষণ করা হচ্ছে।

যখন সব property-তেই মান দেওয়া শেষ হয়, তখন এই instance তৈরি সম্পন্ন হয়।

### constructor-এর প্রক্রিয়া

যখন আমরা স্পষ্টভাবে একটি constructor declare করি, তখন আরেকটি পরিবর্তনও হয়:

আগে সিস্টেম যে constructor স্বয়ংক্রিয়ভাবে তৈরি করত, সেটা সাধারণত আর সরাসরি ব্যবহার করা যায় না।

উদাহরণ হিসেবে:

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

এখন যদি আমরা আবার এভাবে লিখি:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

তাহলে compiler error দেবে:

```swift
Extra arguments at positions #2, #3 in call
```

এর মানে হলো: তুমি অতিরিক্ত parameter পাঠিয়েছ।

এই error কেন আসে?

কারণ বর্তমান `Movie` স্ট্রাকচারের মধ্যে শুধু তোমার হাতে declare করা এই এক ধরনের constructor-ই আছে:

```swift
init(name: String)
```

এটি শুধু একটি `name` parameter গ্রহণ করে, `director` এবং `rating` গ্রহণ করে না।

অর্থাৎ, তুমি যখন নিজের constructor হাতে যোগ করো, তখন আগে সিস্টেম স্বয়ংক্রিয়ভাবে তৈরি করা initialization পদ্ধতিটি আর সরাসরি ব্যবহার করা যায় না।

যদি আমরা একই সঙ্গে "শুধু নাম পাঠানো" এবং "পূর্ণ তথ্য পাঠানো" - দুইটাই সমর্থন করতে চাই, তাহলে আমাদের নিজেকেই আরেকটি পূর্ণ constructor যোগ করতে হবে:

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

এভাবে আমাদের কাছে দুইটি ভিন্ন constructor হয়ে যায়।

পুরোনো সিনেমা তৈরি করার সময় আমরা এভাবে লিখতে পারি:

```swift
Movie(name: "The Night of the Hunter")
```

আর সম্পূর্ণ তথ্যসহ নতুন সিনেমা তৈরি করার সময় এভাবে লিখতে পারি:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

এই লেখার ধরন এটাও বোঝায়: একই টাইপের একাধিক constructor থাকতে পারে, যতক্ষণ তাদের parameter-এর রূপ আলাদা হয়।

## overload কী

এখানে আরেকটি দরকারি জ্ঞানবিন্দু যোগ করি।

একটু আগে আমরা `Movie`-এর জন্য দুইটি `init` লিখেছি:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

এই ধরনের "একই function name, কিন্তু parameter ভিন্ন" লেখাকে বলা হয় "overload"।

এখানে দুইটি function-এর নামই `init`, কিন্তু তারা ভিন্ন parameter গ্রহণ করে, তাই Swift বুঝতে পারে তুমি কোন function-টি কল করছ।

উদাহরণ হিসেবে:

```swift
Movie(name: "Days of Heaven")
```

এটি কল করবে:

```swift
init(name: String)
```

আর:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

এটি initialization method-এর অন্য পূর্ণ সংস্করণটি কল করবে।

তাই overload-এর কাজ হলো: একই টাইপকে ভিন্ন ভিন্ন পরিস্থিতি অনুযায়ী ভিন্ন সৃষ্টি-পদ্ধতি দেওয়া।

## class পরিচিতি

এরপর আমরা সংক্ষেপে `class` সম্পর্কেও পরিচিত হই।

Swift-এ সাধারণ `struct` ছাড়াও, অনেক programming language instance তৈরি করতে `class` ব্যবহার করে, যেমন Java, C#, Kotlin ইত্যাদি।

Swift-এ `class`-এর লেখার ধরন `struct`-এর খুব কাছাকাছি।

উদাহরণ হিসেবে:

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

তুমি দেখবে, শুধু কীওয়ার্ড `struct` থেকে `class` হয়েছে, বাকিটা প্রায় একই রকম দেখায়।

instance তৈরি করার পদ্ধতিটাও খুব মিল:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

তাই syntax-এর স্তরে `struct` আর `class` সত্যিই খুব কাছাকাছি।

### Struct এবং Class-এর পার্থক্য

যদিও `struct` আর `class` দেখতে খুব মিল, তারা পুরোপুরি এক নয়।

**1. initialization পদ্ধতি ভিন্ন**

`struct`-এর ক্ষেত্রে, যদি হাতে constructor না লেখা হয়, তাহলে সিস্টেম সাধারণত স্বয়ংক্রিয়ভাবে একটি উপযুক্ত initialization method তৈরি করে।

কিন্তু `class`-এর ক্ষেত্রে, যদি এমন property থাকে যার default value নেই, তাহলে সাধারণত হাতে `init` লিখতে হয়, নইলে error হবে।

উদাহরণ হিসেবে:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

এই `class`-এ constructor না থাকায় property-গুলো initialize হয়নি, তাই error হবে।

compiler সাধারণত এ রকম একটি ইঙ্গিত দেখাবে:

```swift
Class 'Movie' has no initializers
```

তাই এই উদাহরণে `class`-এর জন্য হাতে constructor লেখা বাধ্যতামূলক।

**2. `struct` value type, `class` reference type**

`struct` হলো value type, আর `class` হলো reference type।

শেখার শুরুতে এই দুইটি ধারণা পুরোপুরি আয়ত্ত করা দরকার নেই, শুধু প্রাথমিকভাবে জানলেই যথেষ্ট।

উদাহরণ হিসেবে, `struct`-কে "একটি নতুন value কপি করা"-র মতো ভাবা যায়।

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

এখানে `user1`-কে `user2`-এ অ্যাসাইন করার পর, মূলত নতুন একটি ডেটা কপি হয়েছে, তাই `user2` পরিবর্তন করলে `user1` প্রভাবিত হয় না।

অন্যদিকে `class`-কে "একই instance-কে একসাথে নির্দেশ করা"-র মতো ভাবা যায়।

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

এখানে `user1` এবং `user2` একই instance-কে নির্দেশ করে।

এখন value type আর reference type-এর ভিতরের কার্যপ্রণালী পুরোপুরি বোঝার দরকার নেই; শুধু এতটুকু জানলেই যথেষ্ট যে `struct` স্বাধীন ডেটা সংরক্ষণের জন্য বেশি উপযুক্ত, আর `class` এমন ক্ষেত্রে বেশি উপযুক্ত যেখানে একাধিক জায়গা একই instance শেয়ার করবে।

## শুরুর পর্যায়ে কীভাবে নির্বাচন করবে

বর্তমান পর্যায়ে সাধারণ data model-এর জন্য আগে `struct` বিবেচনা করো, আর যেসব data শেয়ার করতে হবে ও সমন্বিতভাবে পরিবর্তন করতে হবে, সেক্ষেত্রে `class` বিবেচনা করো।

এটা কোনো চূড়ান্ত নিয়ম নয়, কিন্তু নতুনদের জন্য এটি যথেষ্ট ব্যবহারিক একটি বিচারপদ্ধতি।

বিশেষ করে SwiftUI-তে তুমি অনেক সময়ই দেখবে, `struct` দিয়েই বেশিরভাগ কাজ হয়ে যায়।

এছাড়াও, অনেক programming material-এ `class` দিয়ে তৈরি জিনিসকে "object" বলাও হয়। শেখার শুরুতে তুমি এটাকে instance হিসেবেই বুঝতে পারো, আলাদা করে পার্থক্য করার দরকার নেই।

## সারাংশ

এই পাঠে আমরা `struct` আরও গভীরভাবে শিখেছি, আর পাশাপাশি `class` সম্পর্কেও পরিচিত হয়েছি। দুটোই type সংজ্ঞায়িত করতে ব্যবহার করা যায়।

type instance তৈরি করতে পারে। instance তৈরি করার সময় constructor, অর্থাৎ `init`, কল হয়।

`struct`-এর ক্ষেত্রে, যদি হাতে constructor না লেখা হয়, তাহলে সিস্টেম সাধারণত একটি উপযুক্ত constructor স্বয়ংক্রিয়ভাবে তৈরি করে। যদি default constructor প্রয়োজন মেটাতে না পারে, তাহলে আমরা নিজেও constructor লিখতে পারি।

এছাড়াও, আমরা `struct` এবং `class`-এর পার্থক্য সম্পর্কেও প্রাথমিকভাবে জেনেছি: `struct` হলো value type, আর `class` হলো reference type। SwiftUI-তে শেখার শুরুতে সাধারণত `struct`-এর সাথেই বেশি দেখা হয়।

পরে যখন আমরা view-তে value pass করা, data model, আর state management শিখব, তখন এসব বিষয় আবারও কাজে লাগবে।
