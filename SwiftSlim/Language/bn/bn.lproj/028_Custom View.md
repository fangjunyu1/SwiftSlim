# কাস্টম ভিউ

এই পাঠে আমরা SwiftUI-এর একটি খুব গুরুত্বপূর্ণ লেখার পদ্ধতি শিখব: **কাস্টম ভিউ**।

কাস্টম ভিউ কোনো পুনরাবৃত্ত ভিউ কোডকে আবদ্ধ করে এমন একটি ভিউতে পরিণত করতে পারে, যা বারবার ব্যবহার করা যায়।

বাস্তবে App তৈরি করার সময় আমরা প্রায়ই এমন পরিস্থিতির মুখোমুখি হই: অনেক ইন্টারফেসের গঠন একই, কিন্তু প্রদর্শিত বিষয়বস্তু আলাদা।

যেমন ফোরাম ওয়েবসাইটের পোস্ট তালিকায়, প্রতিটি পোস্টে শিরোনাম, ছবি, লাইক সংখ্যা ইত্যাদি তথ্য থাকতে পারে।

![Reddit](../../../Resource/028_view1.png)

অনলাইন শপিং ওয়েবসাইটের পণ্যের তালিকায়, প্রতিটি পণ্যে ছবি, নাম, দাম ইত্যাদি তথ্য থাকতে পারে।

![Amazon](../../../Resource/028_view2.png)

এই বিষয়বস্তুর গঠন একই ধরনের, পার্থক্য শুধু প্রদর্শিত ডেটায়।

যদি প্রতিটি আইটেমের কোড হাতে একবার করে লিখি, কোড অনেক দীর্ঘ হয়ে যাবে এবং পরবর্তীতে পরিবর্তন করাও সুবিধাজনক হবে না।

তাই আমরা একই গঠনকে একটি কাস্টম ভিউতে আবদ্ধ করতে পারি, তারপর ভিন্ন বিষয়বস্তু প্যারামিটার হিসেবে ভেতরে পাঠাতে পারি।

এভাবে একই ভিউ ভিন্ন বিষয়বস্তু প্রদর্শন করতে পারে।

## চাহিদার দৃশ্য

ধরা যাক, আমরা এখন একটি সেটিংস তালিকা তৈরি করতে চাই।

প্রদর্শনফলাফল:

![view](../../../Resource/028_view.png)

এই সেটিংস তালিকায় তিনটি ভিন্ন সেটিং আইটেম আছে, যথাক্রমে `সেটিংস`, `ফোল্ডার`, `সঙ্গীত`।

যদিও তাদের আইকন, রং এবং শিরোনাম আলাদা, সামগ্রিক গঠন একই:

- বাম পাশের আইকন
- আইকনের পটভূমির রং
- মাঝখানের শিরোনাম
- ডান পাশের তীর

যদি কাস্টম ভিউ ব্যবহার না করি, আমরা হয়তো এভাবে লিখব:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("সেটিংস")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ফোল্ডার")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("সঙ্গীত")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

এই কোডটি স্বাভাবিকভাবে প্রদর্শন করতে পারে, কিন্তু সমস্যাটিও খুব স্পষ্ট: তিনটি সেটিং আইটেমের কোড প্রায় সম্পূর্ণ একই।

ভিন্ন অংশ শুধু আইকন, রং এবং শিরোনাম:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("সেটিংস")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ফোল্ডার")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("সঙ্গীত")
```

অর্থাৎ, প্রতিটি সেটিং আইটেমের গঠননির্দিষ্ট, শুধু আইকন, রং এবং শিরোনাম আলাদা।

এ ধরনের পরিস্থিতি কাস্টম ভিউ ব্যবহারের জন্য খুব উপযুক্ত।

### shadow ছায়া

এখানে একটি নতুন modifier `.shadow(radius:)` ব্যবহার করা হয়েছে:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` ভিউতে ছায়া যোগ করতে পারে।

`radius` ছায়ার ঝাপসা ব্যাসার্ধ বোঝায়। মান যত বড় হবে, ছায়ার বিস্তার সাধারণত তত বড় হবে, দেখতেও আরও নরম লাগবে।

এখানে `1` সেট করা হয়েছে, অর্থাৎ শুধু খুব হালকা একটি ছায়াফলাফল যোগ করা হয়েছে।

## সেটিং আইটেম ভিউ আবদ্ধ করা

এরপর আমরা প্রতিটি সেটিং আইটেমকে একটি নতুন ভিউতে আবদ্ধ করব।

একটি `SettingItemView` তৈরি করা যেতে পারে:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

এই ভিউতে আমরা তিনটি property সংজ্ঞায়িত করেছি:

```swift
let icon: String
let color: Color
let title: String
```

এগুলোর মধ্যে:

- `icon` আইকনের নাম বোঝায়
- `color` আইকনের পটভূমির রং বোঝায়
- `title` সেটিং আইটেমের শিরোনাম বোঝায়

কারণ এই তিনটি বিষয়বস্তু বিভিন্ন সেটিং আইটেমে এক নয়, তাই আমরা এগুলোকে বাইরে থেকে পাঠানো যায় এমন প্যারামিটার বানিয়েছি।

## কাস্টম ভিউ ব্যবহার করা

`SettingItemView` পাওয়ার পর, আমাদের আর বড় একটি `HStack` কোড বারবার লিখতে হবে না।

এখন এভাবে ব্যবহার করা যায়:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")
```

এই লাইন কোডের অর্থ হলো একটি সেটিং আইটেম ভিউ তৈরি করা এবং তিনটি প্যারামিটার পাঠানো:

```swift
icon: "gear"
color: Color.blue
title: "সেটিংস"
```

পাঠানোর পর, `SettingItemView`-এর ভেতরের property-গুলো সংশ্লিষ্ট মান পাবে:

- `icon`-এর মান `gear`
- `color`-এর মান `Color.blue`
- `title`-এর মান `"সেটিংস"`

তাই ভিউর ভেতরের `Image(systemName: icon)` দাঁতযুক্ত চাকা আইকন দেখাবে, `.background(color)` নীল পটভূমি ব্যবহার করবে, আর `Text(title)` `সেটিংস` দেখাবে।

সম্পূর্ণ কোড:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ফোল্ডার")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "সঙ্গীত")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

প্রদর্শনফলাফল:

![view](../../../Resource/028_view.png)

দেখা যায়, আবদ্ধ করার পর প্রদর্শনেরফলাফল আগের মতোই, কিন্তু কোড আরও পরিষ্কার হয়েছে।

আগে প্রতিটি সেটিং আইটেমের জন্য একটি সম্পূর্ণ `HStack` লিখতে হতো, এখন শুধু এক লাইন কোড দরকার:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")
```

এটাই কাস্টম ভিউর কাজ: **পুনরাবৃত্ত ভিউ গঠনকে আবদ্ধ করা, আর শুধু ভিন্ন বিষয়বস্তু প্যারামিটার হিসেবে পাঠানো।**

## কেন প্যারামিটার পাঠানো যায়

এরপর আমরা সহজভাবে বুঝব, কেন কাস্টম ভিউতে প্যারামিটার পাঠানো যায়।

SwiftUI-তে, ভিউ মূলত একটি struct।

যেমন:

```swift
struct ContentView: View {
    var body: some View {
        Text("হ্যালো, ওয়ার্ল্ড!")
    }
}
```

এখানে `ContentView` একটি struct।

যখন আমরা লিখি:

```swift
ContentView()
```

আসলে আমরা একটি `ContentView` ভিউ তৈরি করছি।

শেষের `()` তার initializer কল করা বোঝায়। এটিকে এই ভিউ তৈরি করা হিসেবেও বোঝা যায়।

কারণ এই `ContentView`-এ বাইরে থেকে পাঠাতে হয় এমন কোনো property নেই, তাই সরাসরি লেখা যায়:

```swift
ContentView()
```

কিন্তু যদি ভিউতে এমন property থাকে যার মান দেওয়া হয়নি, তাহলে ভিউ তৈরি করার সময় সংশ্লিষ্ট মান পাঠাতে হবে।

যেমন:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("নাম: \(name)")
    }
}
```

এখানে `name` একটি property, এবং এর কোনো default value নেই।

তাই `ContentView` তৈরি করার সময় `name`-এর জন্য একটি নির্দিষ্ট মান দিতে হবে:

```swift
ContentView(name: "Fang Junyu")
```

এভাবে ভিউর ভেতরে এই মান ব্যবহার করা যাবে:

```swift
Text("নাম: \(name)")
```

এটাই আমরা `SettingItemView` তৈরি করার সময় প্যারামিটার পাঠানোর কারণ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")
```

কারণ `SettingItemView`-এর মধ্যে default value নেই এমন তিনটি property আছে:

```swift
let icon: String
let color: Color
let title: String
```

তাই এই ভিউ তৈরি করার সময় এগুলো ভেতরে পাঠাতে হবে। পাঠানো প্যারামিটারগুলো Swift ব্যবহার করে ভিউর ভেতরের property-তে মান বসায়।

## Initializer

এরপর আমরা initializer আরও এক ধাপ বুঝব।

### ডিফল্ট initializer

যখন আমরা একটি সাধারণ ভিউ সংজ্ঞায়িত করি:

```swift
struct ContentView: View {
    var body: some View {
        Text("হ্যালো, ওয়ার্ল্ড!")
    }
}
```

এই কোডে আমরা হাতে initializer লিখিনি।

কিন্তু এই ভিউ ব্যবহার করার সময় এভাবে লেখা যায়:

```swift
ContentView()
```

এখানের `()` আসলে `ContentView` তৈরি করা বোঝায়। এটিকে initializer কল করা হিসেবেও বোঝা যায়।

### initializer না থাকলেও কেন কল করা যায়?

কারণ Swift compiler আমাদের জন্য স্বয়ংক্রিয়ভাবে একটি initializer তৈরি করে দেয়।

খেয়াল রাখতে হবে, **এই initializer স্বয়ংক্রিয়ভাবে তৈরি হয়, সাধারণত আমরা কোডে সরাসরি এটি দেখতে পাই না।**

অর্থাৎ, যদিও আমরা `struct`-এর মধ্যে হাতে লিখিনি:

```swift
init() {

}
```

কিন্তু Swift compiler পেছনে আমাদের জন্য প্রায় এ রকম একটি initializer তৈরি করে দেয়:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("হ্যালো, ওয়ার্ল্ড!")
    }
}
```

এটাই কেন আমরা সরাসরি লিখতে পারি:

```swift
ContentView()
```

তাই বাস্তব কোডে সাধারণত আমাদের হাতে initializer লিখতে হয় না।

শুধু একটি বিষয় বুঝলেই যথেষ্ট: **SwiftUI ভিউ তৈরি করার সময় ভিউর initializer কল হয়। আমরা হাতে initializer না লিখলেও Swift অনেক সময় আমাদের জন্য সেটি স্বয়ংক্রিয়ভাবে তৈরি করে দিতে পারে।**

### প্যারামিটারসহ initializer

যদি ভিউতে default value নেই এমন একটি property থাকে, যেমন:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("নাম: \(name)")
    }
}
```

Swift compiler property অনুযায়ী স্বয়ংক্রিয়ভাবে একটি প্যারামিটারসহ initializer তৈরি করবে।

সহজভাবে এভাবে বোঝা যায়:

```swift
init(name: String) {
    self.name = name
}
```

এখানে:

```swift
init(name: String)
```

এর অর্থ হলো `ContentView` তৈরি করার সময় `String` টাইপের একটি `name` প্যারামিটার পাঠাতে হবে।

যখন আমরা লিখি:

```swift
ContentView(name: "Fang Junyu")
```

এর অর্থ হলো: `"Fang Junyu"` প্যারামিটার হিসেবে initializer-এ পাঠানো।

তারপর initializer-এর ভেতরে এটিসম্পাদিত হবে:

```swift
self.name = name
```

এই লাইন কোডের অর্থ: বাইরে থেকে পাঠানো `name` বর্তমান ভিউর নিজের `name` property-তেমান বসানো করা।

সহজভাবে এভাবে বোঝা যায়:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("নাম: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

এভাবে ভিউর ভেতরে পাঠানো মান ব্যবহার করা যায়।

এটাই প্যারামিটারসহ ভিউর initialization flow: **যখন ভিউর property-র default value নেই, তখন ভিউ তৈরি করার সময় সংশ্লিষ্ট প্যারামিটার পাঠাতে হয়, যাতে initializer property assignment সম্পন্ন করতে পারে।**

## property-র default value থাকলে

যদি property-র ইতিমধ্যেই default value থাকে, তাহলে ভিউ তৈরি করার সময় প্যারামিটার না পাঠালেও চলে।

যেমন:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("নাম: \(name)")
    }
}
```

এখানে `name`-এর ইতিমধ্যেই একটি default value আছে:

```swift
"Fang Junyu"
```

তাই `ContentView` তৈরি করার সময় সরাসরি লেখা যায়:

```swift
ContentView()
```

এই সময় `name` default value ব্যবহার করবে, ইন্টারফেসে দেখাবে:

```swift
নাম: Fang Junyu
```

অবশ্য, ভিউ তৈরি করার সময় একটি নতুন মানও পাঠানো যায়:

```swift
ContentView(name: "Sam")
```

এই সময় ভিউ বাইরে থেকে পাঠানো `"Sam"` ব্যবহার করবে, default value ব্যবহার করবে না, ইন্টারফেসে দেখাবে:

```swift
নাম: Sam
```

বোঝার সুবিধার জন্য, Swift compiler স্বয়ংক্রিয়ভাবে তৈরি করা initializer-কে সহজভাবে এভাবে ভাবা যায়:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

এখানের `name: String = "Fang Junyu"` বোঝায়: যদি ভিউ তৈরি করার সময় `name` না পাঠানো হয়, তাহলে default value `"Fang Junyu"` ব্যবহার করবে; যদি নতুন `name` পাঠানো হয়, তাহলে পাঠানো মান ব্যবহার করবে।

অর্থাৎ: **বাইরে থেকে প্যারামিটার না পাঠালে property-র default value ব্যবহার হবে; বাইরে থেকে প্যারামিটার পাঠালে পাঠানো মান ব্যবহার হবে।**

## SettingItemView-এ ফিরে দেখা

এখন আমরা আবার SettingItemView দেখি:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

এই ভিউর গঠননির্দিষ্ট।

নির্দিষ্ট অংশগুলোর মধ্যে আছে:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

ভিন্ন অংশগুলোর মধ্যে আছে:

```swift
icon
color
title
```

তাই আমরা ভিন্ন বিষয়বস্তুকে property বানিয়েছি, এবং ভিউ তৈরি করার সময় প্যারামিটার হিসেবে পাঠিয়েছি।

যখন আমরা ভিন্ন সেটিং আইটেম তৈরি করি, তখন শুধু ভিন্ন প্যারামিটার পাঠালেই হবে:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")
SettingItemView(icon: "folder", color: Color.brown, title: "ফোল্ডার")
SettingItemView(icon: "music.note", color: Color.purple, title: "সঙ্গীত")
```

এভাবে একই `SettingItemView` তিনটি ভিন্ন সেটিং আইটেম দেখাতে পারে।

এটাই কাস্টম ভিউর সবচেয়ে সাধারণ ব্যবহারেরপদ্ধতি।

## সারাংশ

এই পাঠে আমরা কাস্টম ভিউ শিখেছি।

কাস্টম ভিউর মূল কাজ হলো: **পুনরাবৃত্ত ভিউ কোড আবদ্ধ করা, যাতে এটি পুনরায় ব্যবহার করা যায়।**

এই উদাহরণে, তিনটি সেটিং আইটেমের গঠন একই, শুধু আইকন, রং এবং শিরোনাম আলাদা।

তাই আমরা একটি `SettingItemView` তৈরি করেছি:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

তারপর এই ভিউ ব্যবহার করার সময় ভিন্ন প্যারামিটার পাঠানো হয়েছে:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "সেটিংস")
```

এখানের প্যারামিটারগুলো `SettingItemView`-এর ভেতরে যাবে।

এইপদ্ধতিে আমরা কম কোড ব্যবহার করে একই গঠন কিন্তু ভিন্ন বিষয়বস্তুসহ ভিউ তৈরি করতে পারি।

এটিও SwiftUI development-এ খুব সাধারণ একটি লেখারপদ্ধতি।
