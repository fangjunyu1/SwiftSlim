# লেআউট, ছবি এবং টেক্সট

গত ক্লাসে, আমরা ContentView কোড শিখেছি:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

আজকের ক্লাসে, আমরা SwiftUI এর ডিফল্ট লেআউট মেকানিজম এবং ছবি ও টেক্সট ব্যবহারের পদ্ধতি শিখব। আগের ক্লাসের উপর ভিত্তি করে, আমরা ভিউগুলোর গঠন এবং প্রদর্শনের পদ্ধতি সম্পর্কে আরও ভালোভাবে বুঝতে পারব, যা আমাদের প্রাথমিক ইন্টারফেস লেআউট তৈরিতে সাহায্য করবে।

## SwiftUI এর ডিফল্ট লেআউট মেকানিজম

ContentView প্রিভিউ করার সময়, আমরা দেখতে পাব যে আইকন এবং টেক্সট উপর থেকে শুরু না হয়ে বরং মাঝামাঝি (center) প্রদর্শিত হচ্ছে।

![Swift](../../RESOURCE/003_view.png)

ডিফল্টভাবে, Stack কন্টেইনারের অ্যালাইনমেন্ট (alignment) হলো .center, তাই এর ভেতরের ভিউগুলো সাধারণত কেন্দ্রে প্রদর্শিত হয়।

### Alignment (অ্যালাইনমেন্ট)

স্পষ্টতই সেন্টার অ্যালাইনমেন্ট হলো কেবল একটি ধরন, যদি আমরা বাম দিকে বা ডান দিকে অ্যালাইন করতে চাই, তবে ভিউয়ের অ্যালাইনমেন্ট নিয়ন্ত্রণ করতে alignment ব্যবহার করতে হবে।

```swift
alignment
```

SwiftUI তে, অ্যালাইনমেন্ট সাধারণত দুটি পরিস্থিতিতে দেখা যায়:

**১. Stack কন্টেইনারের অ্যালাইনমেন্ট প্যারামিটার**

উদাহরণস্বরূপ, ContentView এর আইকন এবং টেক্সট বাম দিকে অ্যালাইন করা হলো:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack এর alignment অনুভূমিক (horizontal) দিকের অ্যালাইনমেন্ট নিয়ন্ত্রণ করে।

অ্যালাইনমেন্টের ধরন:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack হলো অনুভূমিকভাবে সাজানো, এর alignment উল্লম্ব (vertical) দিকের অ্যালাইনমেন্ট নিয়ন্ত্রণ করে:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack হলো ওভারল্যাপিং ভাবে সাজানো, এর alignment অনুভূমিক বা উল্লম্ব দিকের অ্যালাইনমেন্ট নিয়ন্ত্রণ করতে পারে:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

যদি স্পষ্টভাবে alignment উল্লেখ না করা হয়, তবে VStack, HStack এবং ZStack এর ডিফল্ট মান .center হয়।

**২. frame এর ভেতরের alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

যখন frame এর দেওয়া আকার ভিউয়ের নিজস্ব আকারের চেয়ে বড় হয়, তখন alignment নির্ধারণ করে যে ভিউটি frame এর ভেতরে কোথায় অবস্থান করবে। frame এর বিস্তারিত ব্যবহার আমরা পরবর্তীতে শিখব, আপাতত শুধু এইটুকু জেনে রাখি।

### Spacer এবং স্পেস ডিস্ট্রিবিউশন মেকানিজম

alignment ভিউগুলোকে অনুভূমিক বা উল্লম্ব দিকে সাজাতে সাহায্য করে। কিন্তু, যখন আমরা চাই টেক্সট এবং ছবি দুই প্রান্তে প্রদর্শিত হোক, তখন শুধুমাত্র অ্যালাইনমেন্ট দিয়ে আমাদের প্রয়োজন মেটানো সম্ভব হয় না।

উদাহরণস্বরূপ, আমরা যখন [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) ওয়েবসাইটের শীর্ষ ভিউ তৈরি করতে চাই, যার বাম দিকে NHK ওয়েবসাইটের আইকন এবং ডান দিকে সাইট ডিরেক্টরির আইকন থাকবে।

![Swift](../../RESOURCE/003_alignment3.png)

যদি আমরা শুধুমাত্র alignment ব্যবহার করি, তবে NHK ওয়েবসাইটের আইকন এবং সাইট ডিরেক্টরি আইকন উভয়ই কেবল এক দিকে প্রদর্শিত হবে। দুটি আইকনকে বাম এবং ডান প্রান্তে ভাগ করা সম্ভব হবে না, তাই অবশিষ্ট স্পেস বা জায়গা বন্টন করার জন্য Spacer এর প্রয়োজন।

Spacer হলো লেআউটের জন্য একটি নমনীয় (flexible) ভিউ, যা স্বয়ংক্রিয়ভাবে অবশিষ্ট স্পেস পূরণ করতে পারে।

ব্যবহারের পদ্ধতি:

```swift
Spacer()
```

উদাহরণস্বরূপ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

যখন আমরা Image এবং Text এর মাঝখানে Spacer যোগ করি, তখন Spacer অবশিষ্ট স্পেস পূরণ করে Image এবং Text কে যথাক্রমে উপরে এবং নিচের দুই প্রান্তে ঠেলে দেয়।

![Swift](../../RESOURCE/003_view1.png)

যদি একাধিক Spacer থাকে:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

অবশিষ্ট স্পেসগুলো Spacer এর মাধ্যমে সমানভাবে ভাগ হয়ে যাবে।

![Swift](../../RESOURCE/003_spacer.png)

## Image প্রদর্শন এবং সাইজ নিয়ন্ত্রণ

Image ভিউ প্রধানত ছবি প্রদর্শনের জন্য ব্যবহৃত হয়, গত ক্লাসে শেখা SF Symbols আইকনগুলো হলো Image এর একটি ব্যবহার মাত্র।

ব্যবহারের পদ্ধতি:

```swift
Image("imageName")
```

Image এর ডাবল কোটেশনের ভেতরে ছবির নাম লিখতে হয়, এক্সটেনশন (যেমন .png, .jpg) লেখার প্রয়োজন নেই।

### ছবি প্রদর্শন

প্রথমে, আমরা একটি ছবি প্রস্তুত করি।

![Swift](../../RESOURCE/003_img.jpg)

Xcode থেকে Assets ফোল্ডারটি নির্বাচন করুন এবং ছবিটি টেনে (drag) Assets এর ভেতরে ছেড়ে দিন।

![Swift](../../RESOURCE/003_img1.png)

ContentView এ, ছবি প্রদর্শনের জন্য Image ব্যবহার করুন:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

লক্ষণীয়: SwiftUI এর Image জিফ (GIF) অ্যানিমেশন প্লে করা সমর্থন করে না (শুধুমাত্র স্ট্যাটিক ফ্রেম দেখাতে পারে)।

### ছবির সাইজ নিয়ন্ত্রণ

SwiftUI তে, Image ডিফল্টভাবে ছবির আসল সাইজে প্রদর্শিত হয়। যদি ছবির সাইজ পরিবর্তন করতে চান, তবে প্রথমে ছবিটিকে স্কেলযোগ্য (zoomable) করার জন্য resizable ব্যবহার করতে হবে, তারপর লেআউট সাইজ নির্দিষ্ট করার জন্য frame ব্যবহার করতে হবে।

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable মডিফায়ার

resizable মডিফায়ার ছবিকে তার আসল সাইজে স্থির না রেখে লেআউটের সাথে সাথে স্কেল (ছোট/বড়) হওয়ার অনুমতি দেয়।

```swift
.resizable()
```

শুধুমাত্র resizable() যোগ করলেই frame প্রকৃতভাবে ছবির প্রদর্শিত সাইজ পরিবর্তন করতে পারে।

যদি resizable বাদ দেওয়া হয়:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame শুধুমাত্র ছবির জন্য লেআউট স্পেস প্রদান করবে, কিন্তু ছবির আসল সাইজ পরিবর্তন হবে না।

### frame মডিফায়ার

frame(width:height) ভিউয়ের প্রস্থ (width) এবং উচ্চতা (height) নির্দিষ্ট করার জন্য ব্যবহৃত হয়।

প্রাথমিক ব্যবহার:

```swift
.frame(width: 10,height: 10)
```

উদাহরণস্বরূপ, ছবিটিকে একটি আয়তক্ষেত্র হিসেবে সেট করা হলো যার width ৩০০ এবং height ১০০।

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

আপনি চাইলে শুধুমাত্র প্রস্থ অথবা শুধুমাত্র উচ্চতাও আলাদাভাবে সেট করতে পারেন:

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame এর সংমিশ্রণ ইন্টারফেসে ছবির সাইজ নমনীয়ভাবে নিয়ন্ত্রণ করতে পারে এবং একই সাথে স্কেল করার ক্ষমতা বজায় রাখে।

### স্কেল রেশিও: scaledToFit এবং scaledToFill

যখন frame দ্বারা সেট করা প্রস্থ এবং উচ্চতার অনুপাত (ratio) ছবির সাথে মেলে না, তখন ছবিটি প্রসারিত বা বিকৃত (distorted) হতে পারে।

যদি আমরা ছবির অনুপাত ঠিক রেখে ছবিটিকে উপলব্ধ লেআউট স্পেসের সাথে মানিয়ে নিতে চাই, তবে আমরা scaledToFit বা scaledToFill ব্যবহার করতে পারি।

**scaledToFit**

scaledToFit ছবির আসল প্রস্থ-উচ্চতার অনুপাত বজায় রাখে এবং উপলব্ধ স্পেসে পুরোপুরি ফিট করার জন্য ছবিকে স্কেল করে, এটি ছবিকে ক্রপ (crop) করে না:

```swift
.scaledToFit()
```

অথবা

```swift
.aspectRatio(contentMode: .fit)
```

এই পদ্ধতিটি এমন পরিস্থিতিতে উপযুক্ত যেখানে ছবিটিকে সম্পূর্ণ প্রদর্শন করতে হবে এবং বিকৃত হওয়া এড়াতে হবে।

যদি প্রতিটি ছবিতে একই প্রস্থ এবং উচ্চতা সেট করা হয়, তবে ছবির প্রসারিত (stretching) হওয়া অনিবার্য।

উদাহরণস্বরূপ:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

স্কেল রেশিও সেট না করলে, ছবিটি তার আসল অনুপাত অনুযায়ী প্রদর্শিত হতে পারে না।

![Swift](../../RESOURCE/003_img4.png)

scaledToFit সেট করলে ছবিটি তার আসল অনুপাত বজায় রাখতে পারে।

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill ও ছবির অনুপাত বজায় রাখে, তবে এটি সম্পূর্ণ উপলব্ধ স্পেসটি পূরণ করে। যদি অনুপাত না মেলে, তবে অতিরিক্ত অংশটুকু ক্রপ (crop) বা কেটে ফেলা হয়:

```swift
.scaledToFill()
```

অথবা

```swift
.aspectRatio(contentMode: .fill)
```

এই পদ্ধতিটি এমন পরিস্থিতিতে উপযুক্ত যেখানে পুরো এরিয়াটি ছবি দিয়ে ঢেকে দেওয়া প্রয়োজন, যেমন ব্যাকগ্রাউন্ড ইমেজ বা ব্যানার হিসেবে। ব্যাকগ্রাউন্ড হিসেবে ছবি ব্যবহারের ক্ষেত্রে এটি কার্যকর।

**উভয়ের মধ্যে পার্থক্য**

![Swift](../../RESOURCE/003_img6.png)

## টেক্সট (Text)

SwiftUI তে, Text ব্যবহৃত হয় লেখা বা অক্ষর প্রদর্শন করার জন্য।

প্রাথমিক ব্যবহার:

```swift
Text("FangJunyu")
```

আমরা আগের ক্লাসে Text সম্পর্কে শিখেছি, এই ক্লাসে আমরা শিখব কীভাবে ফন্টের আকার এবং গুরুত্ব (boldness/thickness) নিয়ন্ত্রণ করে ভিউয়ের মধ্যে লেখাকে আরও আকর্ষণীয় করে তোলা যায়।

### ফন্টের সাইজ

ফন্টের সাইজ নিয়ন্ত্রণ করতে font মডিফায়ার ব্যবহার করা হয়:

```swift
.font(.title)
```

উদাহরণস্বরূপ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

সাধারণত ব্যবহৃত ফন্টের সাইজ (বড় থেকে ছোট):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### ফন্টের গুরুত্ব (Weight/Thickness)

যদি লেখাকে গাঢ় (bold) করতে চান, তবে fontWeight মডিফায়ার ব্যবহার করতে পারেন:

```swift
.fontWeight(.bold)
```

উদাহরণস্বরূপ:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

সাধারণত ব্যবহৃত ফন্টের গুরুত্ব (হালকা থেকে গাঢ়):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font ফন্টের সাইজ নিয়ন্ত্রণ করে এবং fontWeight ফন্টের গুরুত্ব বা গাঢ়তা নিয়ন্ত্রণ করে। লেখার সৌন্দর্য বাড়াতে এই দুটি একসাথে ব্যবহার করা যেতে পারে।

## সারসংক্ষেপ এবং অনুশীলন

এখন পর্যন্ত, আমরা SwiftUI এর ডিফল্ট লেআউট, Spacer, Image এবং Text এর মতো মৌলিক বিষয়গুলো শিখেছি। সাধারণ কিছু ভিউ তৈরি করার জন্য এই জ্ঞানটুকু যথেষ্ট।

উদাহরণস্বরূপ: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google এর ইন্টারফেসটি খুবই পরিষ্কার, এতে ছবি এবং টেক্সট রয়েছে। আমরা SwiftUI এর দৃষ্টিকোণ থেকে Google এর ইন্টারফেসের গঠন বিশ্লেষণ করার চেষ্টা করতে পারি:

১. পুরো ইন্টারফেসটি তিনটি অংশে বিভক্ত: Google আইকন, সার্চ বক্স এবং প্রম্পট টেক্সট। এগুলোর জন্য VStack ব্যবহার করে উল্লম্বভাবে সাজানো যেতে পারে।
২. Google আইকনটি একটি ছবি, এটি Image ব্যবহার করে দেখানো যেতে পারে।
৩. সার্চ বক্সের ভেতরে ইনপুট বক্স এবং আইকন রয়েছে। ইনপুট বক্সটি উপেক্ষা করলে, সার্চ আইকনটি Image ব্যবহার করে দেখানো যেতে পারে।
৪. প্রম্পট টেক্সটগুলো Text ব্যবহার করে দেখানো হয়। টেক্সটগুলো অনুভূমিকভাবে সাজাতে HStack ব্যবহার করা যেতে পারে এবং ফন্টের রঙ foregroundStyle দিয়ে নিয়ন্ত্রণ করা যায়।

এই বিষয়গুলো অনুশীলন করার মাধ্যমে, আমরা কিছু সাধারণ ভিউ তৈরি করতে পারি এবং Image ও Text ভিউ এবং এদের মডিফায়ারগুলোর ব্যবহার সম্পর্কে আমাদের ধারণা আরও স্পষ্ট করতে পারি।
