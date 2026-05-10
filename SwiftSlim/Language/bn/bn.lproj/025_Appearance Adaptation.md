# চেহারা মানিয়ে নেওয়া

এই পাঠে আমরা লাইট মোড ও ডার্ক মোডের চেহারা মানিয়ে নেওয়া শিখব।

iPhone, iPad এবং Mac-এ ব্যবহারকারী লাইট মোড বেছে নিতে পারেন, আবার ডার্ক মোডও বেছে নিতে পারেন।

সিস্টেম ডার্ক মোডে বদলালে, অনেক App-এর ব্যাকগ্রাউন্ড, লেখা এবং আইকনের রঙও বদলে যায়।

যেমন, দিনের বেলায় ইন্টারফেসে হালকা ব্যাকগ্রাউন্ড থাকতে পারে, আর রাতের বেলায় তা গাঢ় ব্যাকগ্রাউন্ডে বদলে যেতে পারে।

![view](../../../Resource/025_view9.png)

সিস্টেমের চেহারা অনুযায়ী ইন্টারফেসের প্রদর্শন স্বয়ংক্রিয়ভাবে সামঞ্জস্য করার এই ক্ষমতাকেই চেহারা মানিয়ে নেওয়া বলা হয়।

## Xcode-এ চেহারা মানিয়ে নেওয়ার প্রিভিউ

চেহারা মানিয়ে নেওয়া শেখার আগে, আমরা আগে দেখব Xcode-এ কীভাবে লাইট মোড ও ডার্ক মোড প্রিভিউ করতে হয়।

`Canvas` এলাকার নিচে `Device Settings` বোতামে ক্লিক করলে `Canvas Device Settings` পপ-আপ খোলা যায়।

![canvas](../../../Resource/025_view.png)

পপ-আপে `Color Scheme` সেটিং দেখা যায়।

![canvas1](../../../Resource/025_view1.png)

এর মধ্যে:

- `Light Appearance` লাইট মোড বোঝায়।
- `Dark Appearance` ডার্ক মোড বোঝায়।

এখান থেকে আমরা প্রিভিউ চেহারা বদলাতে পারি এবং বর্তমান ইন্টারফেস লাইট মোড ও ডার্ক মোডে কেমন দেখায় তা দেখতে পারি।

## পাশাপাশি দুটি চেহারা দেখানো

যদি লাইট মোড ও ডার্ক মোড একসঙ্গে দেখতে চান, তাহলে `Variants` ফিচার ব্যবহার করতে পারেন।

`Canvas` এলাকার নিচে `Variants` বোতামে ক্লিক করে `Color Scheme Variants` নির্বাচন করুন।

![canvas2](../../../Resource/025_view2.png)

নির্বাচনের পর, `Canvas` একই সঙ্গে লাইট মোড ও ডার্ক মোডের প্রিভিউ দেখাবে।

![canvas3](../../../Resource/025_view3.png)

এভাবে দুই ধরনের চেহারায় ইন্টারফেসের পার্থক্য তুলনা করা আরও সুবিধাজনক হয়।

সহজভাবে বললে:

শুধু সাময়িকভাবে লাইট/ডার্ক মোড বদলাতে চাইলে `Canvas Device Settings` ব্যবহার করা যায়।

দুই ধরনের চেহারা একসঙ্গে দেখতে চাইলে `Color Scheme Variants` ব্যবহার করা যায়।

## View ডিফল্টভাবে চেহারার সঙ্গে মানিয়ে নেয়

SwiftUI-তে অনেক সিস্টেম View ডিফল্টভাবেই লাইট মোড ও ডার্ক মোডের সঙ্গে স্বয়ংক্রিয়ভাবে মানিয়ে নেয়।

যেমন:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("হালকা")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("কিছু কিছু কিছু")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![canvas](../../../Resource/025_view4.png)

দেখা যায়, লাইট মোডে আইকন ও শিরোনাম সাধারণত গাঢ় রঙে দেখায়।

ডার্ক মোডে আইকন ও শিরোনাম স্বয়ংক্রিয়ভাবে হালকা রঙে বদলে যায়।

এর কারণ হলো `Text`, `Image` ইত্যাদি SwiftUI View ডিফল্টভাবে সিস্টেমের চেহারা অনুযায়ী রঙ সামঞ্জস্য করে।

অর্থাৎ, আমরা যদি ম্যানুয়ালি কোনো নির্দিষ্ট রঙ না দিই, SwiftUI আমাদের হয়ে চেহারা মানিয়ে নেওয়ার কিছু অংশ সামলায়।

## নির্দিষ্ট রঙ স্বয়ংক্রিয়ভাবে বদলায় না

খেয়াল রাখতে হবে, আমরা যদি ম্যানুয়ালি নির্দিষ্ট রঙ দিই, তাহলে তা লাইট/ডার্ক মোড অনুযায়ী স্বয়ংক্রিয়ভাবে বদলাবে না।

যেমন:

```swift
Text("কিছু কিছু কিছু")
	.foregroundStyle(Color.gray)
```

এখানে লেখাটিকে `Color.gray` নির্দিষ্ট করা হয়েছে, তাই এটি সব সময় ধূসর দেখাবে।

আরও একটি উদাহরণ:

```swift
Text("শিরোনাম")
    .foregroundStyle(Color.white)
```

এই কোড লাইট মোড বা ডার্ক মোড—দুটিতেই সাদা লেখা দেখাবে।

যদি ব্যাকগ্রাউন্ডও হালকা হয়, তাহলে সাদা লেখা স্পষ্ট দেখা নাও যেতে পারে।

তাই চেহারা মানিয়ে নেওয়ার সময় `Color.white`, `Color.black` ধরনের নির্দিষ্ট রঙ ইচ্ছামতো হার্ডকোড করা যতটা সম্ভব এড়ানো উচিত।

অনেক ক্ষেত্রে আগে সিস্টেমের semantic style ব্যবহার করা যায়, যেমন:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

এর মধ্যে:

- `.primary` সাধারণত প্রধান কনটেন্টের জন্য ব্যবহৃত হয়।
- `.secondary` সাধারণত গৌণ কনটেন্টের জন্য ব্যবহৃত হয়।

এগুলো লাইট/ডার্ক মোড অনুযায়ী স্বয়ংক্রিয়ভাবে প্রদর্শন সামঞ্জস্য করে।

## চেহারা অনুযায়ী ভিন্ন কনটেন্ট দেখানো

কখনও আমরা শুধু রঙ পরিবর্তন চাই না, বরং ভিন্ন চেহারায় ভিন্ন কনটেন্টও দেখাতে চাই।

যেমন:

- লাইট মোডে সাধারণ লাইটবাল্ব আইকন দেখানো।
- ডার্ক মোডে জ্বলা লাইটবাল্ব আইকন দেখানো।
- লাইট মোডে শিরোনাম হিসেবে `হালকা` দেখানো।
- ডার্ক মোডে শিরোনাম হিসেবে `গাঢ়` দেখানো।

এ সময় বর্তমান সিস্টেম লাইট মোডে আছে নাকি ডার্ক মোডে আছে তা নির্ণয় করতে হবে।

SwiftUI-তে `colorScheme` environment value দিয়ে বর্তমান চেহারা মোড পাওয়া যায়:

```swift
@Environment(\.colorScheme) private var colorScheme
```

সম্পূর্ণ কোড:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "হালকা" : "গাঢ়"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("কিছু কিছু কিছু")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/025_view5.png)

প্রিভিউ ফলাফল থেকে দেখা যায়, একই View ভিন্ন চেহারা মোডে সম্পূর্ণ একই কনটেন্ট দেখায় না।

লাইট মোডে `Image` সাধারণ লাইটবাল্ব আইকন দেখায়, আর শিরোনাম হিসেবে `হালকা` দেখায়।

ডার্ক মোডে `Image` জ্বলা লাইটবাল্ব আইকন দেখায়, আর শিরোনাম হিসেবে `গাঢ়` দেখায়।

অর্থাৎ, এখানে পরিবর্তন শুধু রঙের নয়; আইকনের নাম এবং শিরোনামের লেখাও বদলে গেছে।

এর কারণ হলো আমরা আইকন ও শিরোনাম সরাসরি `body`-র মধ্যে হার্ডকোড করিনি, বরং `colorScheme` অনুযায়ী ভিন্ন কনটেন্ট হিসাব করেছি।

এই কোডে আমরা দুটি computed property ব্যবহার করেছি:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "হালকা" : "গাঢ়"
}
```

যখন `colorScheme` হলো `.light`, তখন এর মানে বর্তমান মোড লাইট মোড।

যখন `colorScheme` হলো `.dark`, তখন এর মানে বর্তমান মোড ডার্ক মোড।

তাই আমরা ভিন্ন চেহারা মোড অনুযায়ী ভিন্ন আইকন নাম এবং শিরোনাম লেখা ফিরিয়ে দিতে পারি।

এটিও computed property-র একটি সাধারণ ব্যবহার: বর্তমান state অনুযায়ী View-তে দেখানোর কনটেন্ট হিসাব করা।

## @Environment বোঝা

এটি আমাদের `@Environment`-এর সঙ্গে প্রথম পরিচয়।

`@Environment` বোঝা যায় এভাবে: SwiftUI-এর environment থেকে একটি value পড়া।

App চলার সময় সিস্টেম অনেক environment তথ্য দেয়, যেমন:

- বর্তমান ভাষা
- বর্তমান চেহারা মোড
- বর্তমান layout direction
- বর্তমান font size সেটিং

বর্তমান চেহারা মোড পেতে চাইলে আমরা `colorScheme` পড়তে পারি:

```swift
@Environment(\.colorScheme) private var colorScheme
```

এর মধ্যে

```swift
\.colorScheme
```

এর অর্থ environment থেকে `colorScheme` value পড়া।

```swift
private var colorScheme
```

এর অর্থ পড়া value-টি `colorScheme` নামের variable-এ সংরক্ষণ করা।

variable-এর নাম আপনি নিজেই ঠিক করতে পারেন, যেমন এভাবেও লেখা যায়:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

সামনের `\.colorScheme` অপরিবর্তিত থাকলে, এর মানে পড়া হচ্ছে বর্তমান চেহারা মোড।

## colorScheme-এর দুটি সাধারণ মান

`colorScheme`-এর সাধারণত দুটি মান থাকে:

```swift
.light
.dark
```

এগুলো বোঝায়:

- `.light`: লাইট মোড
- `.dark`: ডার্ক মোড

যেমন:

```swift
private var titleName: String {
    colorScheme == .light ? "হালকা" : "গাঢ়"
}
```

এই কোডের অর্থ হলো:

যদি বর্তমান লাইট মোড হয়, তাহলে `colorScheme == .light` সত্য হয় এবং `"হালকা"` ফিরিয়ে দেয়।

না হলে `"গাঢ়"` ফিরিয়ে দেয়।

তাই লাইট মোডে:

```swift
Text(titleName)
```

দেখাবে:

```swift
হালকা
```

ডার্ক মোডে দেখাবে:

```swift
গাঢ়
```

এই পদ্ধতিতে আমরা ভিন্ন চেহারা অনুযায়ী ভিন্ন কনটেন্ট দেখাতে পারি।

## রঙ মানিয়ে নেওয়ার উদাহরণ

লেখা ও আইকন ছাড়াও, কখনও আমাদের নিজে রঙ মানিয়ে নেওয়া সামলাতে হয়।

যেমন:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("টেক্সট")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/025_view6.png)

এই কোডে লেখা সাদা, ব্যাকগ্রাউন্ড কালো।

লাইট মোডে কালো ব্যাকগ্রাউন্ড বেশ স্পষ্ট।

কিন্তু ডার্ক মোডে যদি পুরো ইন্টারফেসের ব্যাকগ্রাউন্ডও কালো হয়, তাহলে এই কালো ব্যাকগ্রাউন্ড সিস্টেম ব্যাকগ্রাউন্ডের সঙ্গে মিশে যাবে এবং যথেষ্ট স্পষ্ট দেখাবে না।

তখন আমরা চেহারা মোড অনুযায়ী লেখার রঙ ও ব্যাকগ্রাউন্ড রঙ বদলাতে পারি:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("টেক্সট")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/025_view7.png)

এখন লাইট মোডে কালো ব্যাকগ্রাউন্ড ও সাদা লেখা।

ডার্ক মোডে সাদা ব্যাকগ্রাউন্ড ও কালো লেখা।

এভাবে যেকোনো চেহারায় লেখা ও ব্যাকগ্রাউন্ডের মধ্যে স্পষ্ট contrast থাকে, ফলে ব্যবহারকারী কনটেন্ট পরিষ্কারভাবে দেখতে পারেন।

## Assets দিয়ে রঙ মানিয়ে নেওয়া

`colorScheme` দিয়ে ম্যানুয়ালি নির্ণয় করার পাশাপাশি, আমরা `Assets` resource color ব্যবহার করেও লাইট/ডার্ক মোড মানিয়ে নিতে পারি।

এই পদ্ধতি App-এর সাধারণ রঙ পরিচালনার জন্য আরও উপযুক্ত।

Xcode project-এ `Assets` resource folder খুঁজে নিন।

![assets](../../../Resource/025_color.png)

`Assets` folder খুলে ফাঁকা স্থানে right-click করুন, `New Color Set` নির্বাচন করুন, এবং একটি নতুন color resource তৈরি করুন।

![assets](../../../Resource/025_color1.png)

এখানে আমরা একটি রঙ তৈরি করি এবং তার নাম দিই `redText`।

![assets](../../../Resource/025_color2.png)

color resource-এ লাইট মোড ও ডার্ক মোডের রঙ আলাদাভাবে সেট করা যায়।

![assets](../../../Resource/025_color3.png)

সংশ্লিষ্ট color area নির্বাচন করার পর, ডান পাশের attribute inspector-এ রঙ পরিবর্তন করা যায়।

উপরের ডান কোণার `Hide or show the Inspectors` বোতামে ক্লিক করে inspector area খুলুন।

তারপর `Show the Attributes inspector` নির্বাচন করুন, নিচে `Show Color Panel` খুঁজে color panel খুলুন।

![assets](../../../Resource/025_color4.png)

color panel-এর রঙে ক্লিক করলে `redText`-এর সংশ্লিষ্ট color area একই সঙ্গে পরিবর্তিত হয়।

এখানে আমরা `redText` এভাবে সেট করছি:

- লাইট মোডে লাল দেখাবে
- ডার্ক মোডে সবুজ দেখাবে

![assets](../../../Resource/025_color5.png)

SwiftUI কোডে ফিরে এসে এই রঙ এভাবে ব্যবহার করা যায়:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

এর মধ্যে:

```swift
Color("redText")
```

এর অর্থ `Assets` থেকে `redText` নামের color resource পড়া।

প্রদর্শনের ফলাফল:

![assets](../../../Resource/025_view8.png)

দেখা যায়, একই `Color("redText")` লাইট মোড ও ডার্ক মোডে ভিন্ন রঙ দেখায়।

এটি বোঝায় যে `Assets` রঙ নিজেও চেহারা মানিয়ে নেওয়া সমর্থন করে।

## colorScheme এবং Assets-এর পার্থক্য

`colorScheme` এবং `Assets`—দুটিই চেহারা মানিয়ে নেওয়া করতে পারে, কিন্তু এগুলোর ব্যবহার-ক্ষেত্র ভিন্ন।

যদি শুধু লাইট/ডার্ক মোড অনুযায়ী লেখার কনটেন্ট, ছবির নাম বা `SF Symbols` নাম বদলাতে হয়, তাহলে `colorScheme` ব্যবহার করা যায়।

যেমন:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

যদি App-এ প্রায়ই ব্যবহৃত রঙ হয়, যেমন theme color, card background color, text color, তাহলে `Assets` color বেশি সুপারিশ করা হয়।

কারণ `Assets` color একাধিক View-তে reuse করা যায়, এবং পরে পরিবর্তন করাও বেশি সুবিধাজনক।

যেমন:

```swift
Color("redText")
```

এভাবে শুধু `Assets`-এ রঙ পরিবর্তন করলেই, যেখানে যেখানে এই রঙ ব্যবহার হয়েছে সেগুলো একসঙ্গে বদলে যাবে।

## সারসংক্ষেপ

এই পাঠে আমরা লাইট মোড ও ডার্ক মোডের চেহারা মানিয়ে নেওয়া শিখেছি।

প্রথমে আমরা শিখেছি কীভাবে Xcode-এর `Canvas`-এ ভিন্ন চেহারা প্রিভিউ করতে হয়, এবং কীভাবে `Color Scheme Variants` ব্যবহার করে লাইট মোড ও ডার্ক মোড একসঙ্গে দেখতে হয়।

তারপর আমরা জেনেছি, SwiftUI-এর `Text`, `Image` ইত্যাদি View ডিফল্টভাবে সিস্টেমের চেহারা অনুযায়ী রঙ স্বয়ংক্রিয়ভাবে মানিয়ে নেয়।

কিন্তু যদি `Color.white` বা `Color.black`-এর মতো নির্দিষ্ট রঙ ম্যানুয়ালি দেওয়া হয়, তাহলে সেই রঙগুলো স্বয়ংক্রিয়ভাবে বদলাবে না।

এরপর আমরা `@Environment` এবং `colorScheme` শিখেছি:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme`-এর মাধ্যমে আমরা বর্তমান মোড লাইট নাকি ডার্ক তা নির্ণয় করতে পারি, এবং ভিন্ন চেহারার জন্য ভিন্ন আইকন, লেখা বা রঙ দেখাতে পারি।

শেষে আমরা `Assets` color শিখেছি।

`Assets` color লাইট মোড ও ডার্ক মোডের রঙ আলাদাভাবে সেট করতে পারে, তাই App-এর সাধারণ color resource পরিচালনার জন্য উপযুক্ত।

চেহারা মানিয়ে নেওয়া App-কে দিন ও রাতে আরও ভালো দেখাতে সাহায্য করে, এবং লেখা অস্পষ্ট বা ব্যাকগ্রাউন্ড দুর্বল দেখানোর মতো সমস্যা এড়াতে পারে।

বাস্তব development-এ আগে SwiftUI-এর ডিফল্ট মানিয়ে নেওয়ার ক্ষমতা এবং `Assets` color ব্যবহার করার পরামর্শ দেওয়া হয়।

যখন ভিন্ন চেহারায় লেখা, আইকন, ছবি বদলাতে হয়, অথবা অল্প কিছু বিশেষ প্রদর্শন effect সামলাতে হয়, তখন `colorScheme` দিয়ে নির্ণয় করুন।

## অতিরিক্ত জ্ঞান: নির্দিষ্ট font size

আগে `font` শেখার সময় আমরা কিছু system font style ব্যবহার করেছি:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`, `.callout` ধরনের system font style ব্যবহার করার পাশাপাশি, font size ম্যানুয়ালিও নির্দিষ্ট করা যায়।

যেমন:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

এখানের:

```swift
.font(.system(size: 100))
```

এর অর্থ font size `100 pt` সেট করা।

`SF Symbols` আইকনের ক্ষেত্রে `font` আইকনের আকারও প্রভাবিত করে।

তাই আইকন বড় করে দেখাতে চাইলে `.font(.system(size:))` দিয়ে size নির্দিষ্ট করা যায়।

যেমন:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

খেয়াল রাখতে হবে, ম্যানুয়ালি font size নির্দিষ্ট করা বেশি flexible হলেও, সাধারণ লেখায় অনেক বেশি fixed font size ব্যবহার করা সুপারিশ করা হয় না।

সাধারণ লেখার ক্ষেত্রে আগে `.title`, `.headline`, `.body`, `.caption` ইত্যাদি system font style ব্যবহার করা উচিত।

এতে বিভিন্ন ডিভাইস এবং ব্যবহারকারীর font setting-এর সঙ্গে আরও ভালোভাবে মানিয়ে নেওয়া যায়।
