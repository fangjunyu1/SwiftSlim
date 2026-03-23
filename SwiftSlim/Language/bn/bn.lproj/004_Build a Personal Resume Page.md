# ব্যক্তিগত জীবনবৃত্তান্ত পেজ তৈরি করা

এই পাঠে আমরা একটি সাধারণ ব্যক্তিগত জীবনবৃত্তান্ত (resume) ভিউ তৈরি করব এবং নিচের বিষয়গুলো শিখব:

- cornerRadius
- spacing
- ScrollView

এটি তৈরি করার সময়, আমরা লেআউট, Text এবং Image এর মতো বিষয়গুলো পুনর্বিবেচনা করব, এবং স্পেসিং (ফাঁকা স্থান) নিয়ন্ত্রণ ও কন্টেন্ট স্ক্রলিং এর প্রভাব বাস্তবায়ন করব।

## ব্যক্তিগত জীবনবৃত্তান্ত

কাঙ্ক্ষিত ফলাফল:

![Swift](../../RESOURCE/004_img.png)

**নিচের আলোচনাটি পড়ার আগে অনুগ্রহ করে প্রথমে নিজে চেষ্টা করুন।**

### প্রজেক্ট তৈরি করা

একটি নতুন iOS প্রজেক্ট তৈরি করুন, অথবা আগের প্রজেক্টটি ব্যবহার করা চালিয়ে যান।

ডিফল্ট ContentView কোড:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

এখন কোডগুলো মুছে ফেলুন এবং নিজের মতো কন্টেন্ট লেখা শুরু করুন:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### সামগ্রিক কাঠামো

বাস্তব ডেভেলপমেন্টে, আমরা সাধারণত প্রথমে সামগ্রিক কাঠামো ডিজাইন করি।

আমাদের পেজে যা যা থাকবে:

1. শিরোনাম (Title)
2. ব্যক্তিগত তথ্য
3. নিজের সম্পর্কে (Introduction)

আমরা সবচেয়ে বাইরের স্তরে একটি VStack যুক্ত করব:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack ভিউগুলোকে উল্লম্বভাবে (vertically) সাজানো নিশ্চিত করে এবং ভিউগুলোর বিন্যাস ও স্পেসিং নিয়ন্ত্রণ করতে পারে।

### শিরোনাম

প্রথমে, আমরা শিরোনাম দেখানোর জন্য একটি Text তৈরি করব।

এখানে, আমি শিরোনাম হিসেবে আমার নিজের ইংরেজি নাম দেখাচ্ছি:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

শিরোনাম সাধারণত বড় এবং বোল্ড করা থাকে, তাই এখানে আমরা font এবং fontWeight মডিফায়ার ব্যবহার করব:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### লেআউট বা বিন্যাস

SwiftUI-এর ডিফল্ট অ্যালাইনমেন্ট হলো center (মাঝখানে), তাই এখন শিরোনামটি ContentView-এর ঠিক মাঝখানে দেখাচ্ছে।

![Swift](../../RESOURCE/004_img3.png)

আমাদের শিরোনামটিকে ভিউয়ের একেবারে উপরে দেখাতে হবে, এ জন্য লেআউট ঠিক করতে আমরা Spacer ব্যবহার করতে পারি:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer বাকি থাকা সব জায়গা দখল করে নেয়, যার ফলে Text-টি কন্টেইনারের উপরের দিকে চলে যায়।

![Swift](../../RESOURCE/004_img4.png)

### ফাঁকা জায়গা (Whitespace)

যদি মনে হয় যে লেখাটি উপরের প্রান্তের খুব কাছাকাছি আছে, তবে padding বা Spacer ব্যবহার করা যেতে পারে।

**১. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

VStack-এর padding ব্যবহার করে উপরের মার্জিন ২০ সেট করা হয়েছে।

**২. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

আপনি চাইলে Spacer-ও ব্যবহার করতে পারেন, এর frame-এর উচ্চতা (height) সেট করে নির্দিষ্ট মাপের ফাঁকা জায়গা পাওয়া যায়।

ফলাফল:

![Swift](../../RESOURCE/004_img5.png)

### ছবি (Image)

আপনার নিজের একটি প্রোফাইল ছবি নিন এবং সেটি Assets ফোল্ডারে যুক্ত করুন।

![Swift](../../RESOURCE/004_img6.png)

ছবিটি দেখানোর জন্য ContentView-তে Image ব্যবহার করুন:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

যেহেতু ছবির আসল সাইজ অনেক বড় হতে পারে, তাই ডিসপ্লে সাইজ নিয়ন্ত্রণ করতে আমাদের frame ব্যবহার করতে হবে।

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

এই পর্যায়ে আমরা একটি সমস্যা দেখতে পাব:

যদি frame-এর প্রস্থ ও উচ্চতার অনুপাত (aspect ratio) ছবির মূল অনুপাতের সাথে না মেলে, তাহলে ছবিটি বিকৃত (deformed) হয়ে যাবে।

উদাহরণস্বরূপ:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

ছবির বিকৃতি এড়াতে, আমাদের scaledToFit ব্যবহার করতে হবে:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit-এর কাজ হলো:

নির্দিষ্ট frame-এর মধ্যে ছবির মূল অনুপাত ঠিক রেখে ছবিটিকে জুম (স্কেল) করা এবং সম্পূর্ণ ছবিটি দেখানো।

এটি frame পূর্ণ করার জন্য জোর করে ছবিকে টেনে বড় করে না, বরং প্রস্থ ও উচ্চতার অনুপাত অপরিবর্তিত রেখে আনুপাতিকভাবে স্কেল করে যতক্ষণ না যেকোনো একদিক সীমানায় স্পর্শ করে।

এর মানে হলো:

- যদি frame-এর প্রস্থ ছোট হয়, তবে ছবিটি প্রস্থকে রেফারেন্স হিসেবে নিয়ে স্কেল হবে।
- যদি frame-এর উচ্চতা ছোট হয়, তবে ছবিটি উচ্চতাকে রেফারেন্স হিসেবে নিয়ে স্কেল হবে।
- ছবিটি সবসময় তার আসল অনুপাত বজায় রাখবে এবং বিকৃত হবে না।

সাধারণত যেকোনো একদিকের মাপ সেট করলেই চলে। উদাহরণস্বরূপ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

এতে সিস্টেম ১৪০ প্রস্থের ওপর ভিত্তি করে স্বয়ংক্রিয়ভাবে সঠিক উচ্চতা হিসাব করে নেবে এবং ছবির অনুপাত ঠিক রাখবে।

যদি ভিজ্যুয়াল অনুপাত ঠিক রাখতে হয় বা জটিল লেআউটে ছবি সংকুচিত হওয়া এড়াতে চান, তবে একই সাথে প্রস্থ এবং উচ্চতা উভয়ই নির্দিষ্ট করে দেওয়া যেতে পারে।

### কোণা গোলাকার করা (Corner Radius)

আপনি যদি ছবিটি গোলাকার কোণাযুক্ত (rounded corners) হিসেবে দেখাতে চান, তবে cornerRadius মডিফায়ার ব্যবহার করতে পারেন:

```swift
.cornerRadius(10)
```

উদাহরণস্বরূপ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image-এর মডিফায়ারগুলোর শেষে cornerRadius(20) যোগ করা হয়েছে।

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) মানে হলো ভিউয়ের সীমানা কেটে ফেলা হবে এবং ২০ ব্যাসার্ধের (radius) একটি গোলাকার রূপ দেওয়া হবে।

রাউন্ডেড কর্নার যোগ করার পর, ছবির চারদিকের কোণাগুলো বৃত্তাকার হয়ে যাবে, যা দেখতে আরও মসৃণ ও আধুনিক মনে হয়।

বর্তমান ইউজার ইন্টারফেস ডিজাইনে এই ধরনের স্টাইল খুবই সাধারণ, যেমন iOS-এর অ্যাপ আইকনগুলোতে গোলাকার চতুর্ভুজ (rounded rectangle) আকার ব্যবহার করা হয় (যদিও সিস্টেম আইকনগুলো শুধু সাধারণ গোলাকার নয়, বরং কন্টিনিউয়াস কার্ভেচার বা স্কুইর্কেল আকৃতির হয়)।

### ব্যক্তিগত তথ্য

এখন আমরা ছবির বাম দিকে ব্যক্তিগত তথ্যের অংশটি তৈরি করব। ইন্টারফেস কাঠামো দেখে বোঝা যায়, ব্যক্তিগত তথ্য এবং ছবিটি পাশাপাশি (horizontally) সাজানো আছে, তাই এর জন্য HStack ব্যবহার করতে হবে।

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

ব্যক্তিগত তথ্যের কন্টেন্টগুলো উল্লম্বভাবে (vertically) সাজানো আছে।

![Swift](../../RESOURCE/004_img11.png)

তাই, বাইরের স্তরে HStack, ব্যক্তিগত তথ্যের জন্য VStack এবং টেক্সট কন্টেন্টের জন্য Text ব্যবহার করতে হবে।

প্রাথমিক কাঠামো:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**ফিল্ডের শিরোনাম বোল্ড করা**

ফিল্ডের নাম এবং এর ভ্যালুর মধ্যে পার্থক্য বোঝাতে, ফিল্ডের নামে fontWeight ব্যবহার করা যেতে পারে:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**টেক্সট বাম দিকে সারিবদ্ধ করা (Left Align)**

VStack ডিফল্টভাবে মাঝখানে (center) সারিবদ্ধ থাকে। যদি সব লেখা বাম দিকে রাখতে চান, তবে এর অ্যালাইনমেন্ট সেট করতে হবে:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading বলতে বাম দিক অনুযায়ী সারিবদ্ধ করাকে বোঝায় (বাম-থেকে-ডান ভাষার পরিবেশে)।

![Swift](../../RESOURCE/004_img14.png)

### স্পেসিং (Spacing)

ব্যক্তিগত তথ্য ও ছবির মাঝে নির্দিষ্ট ফাঁকা জায়গা রাখতে চাইলে, আমরা আগে যেমন Spacer দিয়ে ফাঁকা স্থান তৈরি করা শিখেছি সেটি করতে পারি:

```swift
Spacer()
    .frame(width: 10)
```

অথবা HStack-এর spacing প্যারামিটারও ব্যবহার করা যেতে পারে:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 মানে হলো দুটি চাইল্ড ভিউয়ের (সাব-ভিউ) মাঝের দূরত্ব হবে ৩০ pt।

![Swift](../../RESOURCE/004_img15.png)

**spacing কী?**

VStack, HStack এবং ZStack-এর ভেতরে, spacing সাব-ভিউগুলোর মধ্যকার দূরত্ব নিয়ন্ত্রণ করতে পারে।

উদাহরণস্বরূপ:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack-এর সাব-ভিউগুলোর মাঝখানের দূরত্ব ১০pt সেট করা হবে।

![Swift](../../RESOURCE/004_img16.png)

মনে রাখতে হবে যে, spacing শুধুমাত্র "সরাসরি চাইল্ড ভিউ (direct child views)" এর ওপর কাজ করে, এটি নেস্টেড (ভিতরে থাকা) কন্টেইনারের ভিতরের লেআউটে কোনো প্রভাব ফেলে না।

**তালিকার ভেতরের স্পেসিং নিয়ন্ত্রণ করা**

যদি ফিল্ডগুলোর মাঝে দূরত্ব বাড়াতে চান, তবে সবচেয়ে সহজ উপায় হলো VStack-এ spacing সেট করা:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

এতে করে প্রতিটি চাইল্ড ভিউয়ের মাঝের দূরত্ব ১০ pt হয়ে যাবে।

তবে ইন্টারফেসটি খেয়াল করলে একটি সমস্যা দেখা যাবে:

ফিল্ড গ্রুপগুলোর মাঝে দূরত্ব তৈরি হয়েছে, কিন্তু একই সাথে ফিল্ডের নাম এবং ভ্যালুর মাঝেও সমান দূরত্ব তৈরি হয়ে গেছে।

এর কারণ হলো spacing বর্তমান কন্টেইনারের সব সরাসরি সাব-ভিউয়ের ওপর কাজ করে।

এই কাঠামোতে, প্রতিটি Text বাইরের VStack-এর সরাসরি চাইল্ড ভিউ, তাই সবার মাঝেই সমান স্পেস তৈরি হয়েছে।

যদি আপনি চান যে ফিল্ড গ্রুপগুলোর মাঝে দূরত্ব থাকবে, কিন্তু ফিল্ডের নাম ও ভ্যালু একসাথে কাছাকাছি থাকবে, তবে "ফিল্ডের নাম + ভ্যালু"-কে একটি লজিক্যাল গ্রুপ ধরে সেগুলোকে আলাদা VStack-এর ভেতরে রাখতে পারেন:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

এখন কাঠামোটি এমন হলো যে, বাইরের VStack-গুলোর মাঝে নির্দিষ্ট স্পেস আছে, কিন্তু ভেতরের VStack-এ ডিফল্ট কাছাকাছি স্পেসিং আছে। তাই ফিল্ডের নাম ও ভ্যালুর মাঝে কোনো অতিরিক্ত ফাঁকা জায়গা থাকবে না।

![Swift](../../RESOURCE/004_img18.png)

### নিজের সম্পর্কে (Introduction)

এরপর আমরা 'নিজের সম্পর্কে' বা ইন্ট্রোডাকশন অংশটি তৈরি করব।

ইন্টারফেসের কাঠামো দেখলে বোঝা যায়, ইন্ট্রোডাকশনে অনেকগুলো লাইনের টেক্সট আছে, যা উল্লম্বভাবে সাজানো।

![Swift](../../RESOURCE/004_img19.png)

তাই, Text-এর সাথে VStack ব্যবহার করা যেতে পারে:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**স্পেসিং বাড়ানো**

এখন ব্যক্তিগত তথ্য এবং ইন্ট্রোডাকশন অংশটি একে অপরের খুব কাছাকাছি আছে, যা দেখতে ভালো লাগছে না।

![Swift](../../RESOURCE/004_img20.png)

যেহেতু এগুলো সব একই বাইরের কন্টেইনারে আছে, আমরা বাইরের কন্টেইনারে সামগ্রিক স্পেসিং নিয়ন্ত্রণ করতে পারি:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ফলাফল:

![Swift](../../RESOURCE/004_img21.png)

**লিস্টের স্পেসিং**

ইন্ট্রোডাকশন টেক্সটের লাইনগুলোর মাঝে দূরত্ব সেট করতে spacing ব্যবহার করুন:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ব্যক্তিগত জীবনবৃত্তান্ত সম্পন্ন করা

এখন, আমাদের ব্যক্তিগত জীবনবৃত্তান্তের প্রাথমিক কাঠামো তৈরি হয়ে গেছে।

![Swift](../../RESOURCE/004_img.png)

### স্ক্রল ভিউ (ScrollView)

বর্তমানে পেজ স্ট্রাকচারে VStack ব্যবহার করা হয়েছে। ইন্ট্রোডাকশন টেক্সট কম থাকলে কোনো সমস্যা নেই, কিন্তু যদি এটি বেড়ে ২০, ৩০ বা আরও বেশি লাইন হয়, তবে কন্টেন্টের উচ্চতা স্ক্রিনকে ছাড়িয়ে যাবে।

উদাহরণস্বরূপ:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

এ সময় দুটো ঘটনা ঘটবে:

- নিচের দিকের কন্টেন্টগুলো কাটা পড়বে
- পেজটি স্ক্রল করা যাবে না

এটি VStack-এর কোনো সমস্যা নয়, VStack শুধুই একটি লেআউট কন্টেইনার, এটি নিজে থেকে স্ক্রল করার সুবিধা দেয় না।

**ScrollView কী?**

ScrollView হলো একটি স্ক্রলযোগ্য কন্টেইনার, যা স্ক্রিনের আকারের চেয়ে বড় কন্টেন্ট দেখানোর জন্য উপযুক্ত। যেমন: ভার্টিক্যাল বা হরাইজন্টাল লিস্ট।

প্রাথমিক কাঠামো:

```swift
ScrollView {
    ...
}
```

স্ক্রলিং ইফেক্ট পেতে হলে, সম্পূর্ণ পেজের কন্টেন্টকে একটি ScrollView-এর ভেতরে রাখতে হবে:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

এভাবে, সম্পূর্ণ পেজটি একটি স্ক্রলযোগ্য এরিয়া হয়ে যাবে, এবং কন্টেন্ট স্ক্রিনের উচ্চতার চেয়ে বড় হলে তা স্বাভাবিকভাবেই স্ক্রল করা যাবে।

ScrollView ডিফল্টভাবে স্ক্রলবার ইন্ডিকেটর দেখায়। যদি আপনি স্ক্রলবারটি লুকাতে চান, তবে এটি সেট করতে পারেন:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## সম্পূর্ণ কোড

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```