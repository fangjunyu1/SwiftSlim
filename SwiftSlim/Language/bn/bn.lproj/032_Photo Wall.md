# ফটো ওয়াল

এই পাঠে আমরা একটি ফটো ওয়াল পৃষ্ঠা তৈরি করব।

![view](../../../Resource/032_view13.png)

এই উদাহরণে আমরা `extension`, `self` এবং instance সম্পর্কিত জ্ঞান পুনরালোচনা করব, এবং SwiftUI-তে commonly used `Shape` গ্রাফিক শিখব।

এই জ্ঞানগুলোর মাধ্যমে আমরা সাধারণ ছবিকে বৃত্ত, গোলাকার কোণযুক্ত rectangle, capsule, ellipse ইত্যাদি বিভিন্ন style-এ crop করতে পারি, এবং ছবিতে border effect যোগ করতে পারি।

এই পাঠে কয়েকটি নতুন জ্ঞানবিন্দু ব্যবহার করা হবে: `Shape`, `clipShape`, `strokeBorder` এবং `overlay`।

এর মধ্যে `clipShape` view-এর shape crop করতে ব্যবহৃত হয়, `strokeBorder` shape-এর border আঁকতে ব্যবহৃত হয়, আর `overlay` view-এর উপরে নতুন view overlay করতে ব্যবহৃত হয়।

## ছবির উপকরণ

শুরু করার আগে আমাদের কয়েকটি ছবি প্রস্তুত করতে হবে।

আপনি নিজের ছবি ব্যবহার করতে পারেন, অথবা এই পাঠে দেওয়া sample image ব্যবহার করতে পারেন।

এই পাঠের sample photos [Pixabay](https://pixabay.com/) ওয়েবসাইট থেকে নেওয়া হয়েছে:

[ল্যান্ডস্কেপ](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[শিয়াল](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[স্থাপত্য](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[ফুল](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[রাজহাঁস](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

ছবি ডাউনলোড করার পর সেগুলো `Assets` resource folder-এ যোগ করুন, এবং ক্রমানুসারে `1`, `2`, `3`, `4`, `5` নামে নামকরণ করুন।

![assets](../../../Resource/032_view17.png)

এভাবে আমরা SwiftUI-তে `Image("1")`, `Image("2")` ব্যবহার করে ছবি প্রদর্শন করতে পারব।

## ছবি প্রদর্শন

প্রথমে আমরা `ContentView`-এ ৫টি ছবি প্রদর্শন করি:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

প্রদর্শিত ফলাফল:

![view](../../../Resource/032_view.png)

এই কোডে আমরা `ScrollView` ব্যবহার করে photo list-এর scroll display তৈরি করেছি, এবং `VStack` ব্যবহার করে একাধিক ছবিকে ওপর থেকে নিচে সাজিয়েছি।

প্রতিটি ছবিতে `.resizable()`, `.scaledToFit()` এবং `.frame(width: 300)` দিয়ে display effect সেট করা হয়েছে, যাতে ছবি scale হতে পারে, অনুপাত ঠিক রেখে সম্পূর্ণভাবে দেখা যায়, এবং ছবির width সীমিত থাকে।

`VStack`-এর `.padding(.vertical, 100)` উপরের ও নিচের spacing বাড়ানোর জন্য ব্যবহৃত হয়, যাতে প্রথম ও শেষ ছবি screen edge-এর খুব কাছে না থাকে।

শেষের `.ignoresSafeArea()` নির্দেশ করে যে scroll view safe area উপেক্ষা করবে, ফলে ছবি scroll করার সময় screen-এর top ও bottom পর্যন্ত প্রসারিত হতে পারে, এবং পৃষ্ঠার display আরও পূর্ণ দেখায়।

তবে এখন ৫টি ছবিই একই modifier ব্যবহার করছে:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

যখন আমরা repeated code দেখি, তখন `extension` ব্যবহার করে organize করার কথা বিবেচনা করতে পারি।

## extension ব্যবহার করে ছবির style organize করা

আমরা `Image`-এর জন্য ফটো ওয়ালের dedicated method extend করতে পারি:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

এখানে আমরা `Image` type-এর জন্য `photoGalleryStyle` method extend করেছি।

এই method-এর ভিতরে আগের repeated `.resizable()`, `.scaledToFit()` এবং `.frame(width: 300)` রয়েছে। অর্থাৎ, এটি image scaling, proportional display এবং width setting-এর code একসঙ্গে organize করেছে।

এই extension ব্যবহারের পর আগের image code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

এভাবে সরল করা যায়:

```swift
Image("1")
    .photoGalleryStyle()
```

এভাবে প্রতিটি ছবির শুধু `.photoGalleryStyle()` call করলেই একই photo wall style প্রয়োগ হবে। code আরও সংক্ষিপ্ত হবে, এবং পরে একসঙ্গে modify করাও সহজ হবে।

## self বোঝা

extension method-এ আমরা `self` লিখেছি:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

এখানে `self` বলতে এই method call করা current image instance বোঝায়।

যেমন:

```swift
Image("1")
    .photoGalleryStyle()
```

এই code-এ `photoGalleryStyle()` `Image("1")` দ্বারা call করা হয়েছে, তাই method-এর ভিতরের `self` এই `Image("1")` ছবিকে বোঝায়।

সহজভাবে বোঝা যায়: যে এই method call করে, `self` তাকেই বোঝায়।

খেয়াল রাখতে হবে, SwiftUI modifier বারবার নতুন view result return করে। তাই `photoGalleryStyle()` যে result return করে, তা একটি modified view; এটি শুধু original `Image` নিজে নয়।

## ছবির shape

এখন ছবি স্বাভাবিকভাবে display হচ্ছে। তবে এসব ছবির default shape rectangle, দেখতে বেশ সাধারণ।

শুধু ছবিতে rounded corner দিতে চাইলে সরাসরি `.cornerRadius()` ব্যবহার করা যায়:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

প্রদর্শিত ফলাফল:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` নির্দেশ করে ছবিতে `20 pt` rounded corner যোগ করা হচ্ছে। সাধারণ rounded image-এর জন্য এই লেখাটিই যথেষ্ট।

তবে `.cornerRadius()` শুধু rounded corner effect handle করতে পারে, সাধারণ rounded image তৈরির জন্য উপযোগী। যদি আমরা ছবিকে আরও বিভিন্ন shape-এ বদলাতে চাই, কেবল এই modifier যথেষ্ট নয়।

এই সময় SwiftUI-র `Shape` ব্যবহার করতে হবে। `Shape` বিভিন্ন graphics represent করতে পারে; `clipShape`-এর সঙ্গে মিলিয়ে ছবিকে সংশ্লিষ্ট shape-এ crop করা যায়।

## Shape পরিচিতি

SwiftUI-তে `Shape` graphics নির্দেশ করে। এটি `View`-এর মতোই SwiftUI-তে খুব commonly used type।

সাধারণ `Shape`-এর মধ্যে আছে circle, rectangle, rounded rectangle, capsule এবং ellipse। বিভিন্ন graphics-এর appearance আরও intuitiveভাবে দেখার জন্য নিচের উদাহরণে প্রতিটি shape-এ ভিন্ন color ও size সেট করা হয়েছে।

এই উদাহরণগুলোতে `.fill()` shape-এ color fill করতে ব্যবহৃত হয়, আর `.frame()` shape-এর display size সেট করতে ব্যবহৃত হয়। color শুধু বিভিন্ন shape আলাদা করে দেখানোর জন্য, shape-এর fixed color নয়।

### Circle বৃত্ত

`Circle` বৃত্ত নির্দেশ করে। এটি প্রায়ই avatar, circular button, circular image ইত্যাদি interface effect-এ ব্যবহৃত হয়।

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle আয়তক্ষেত্র

`Rectangle` আয়তক্ষেত্র নির্দেশ করে। এটি সবচেয়ে basic graphics-এর একটি, এবং background, separator area বা সাধারণ border তৈরিতেও ব্যবহার করা যায়।

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle গোলাকার কোণযুক্ত আয়তক্ষেত্র

`RoundedRectangle` rounded rectangle নির্দেশ করে। `cornerRadius` rounded corner-এর size সেট করতে ব্যবহৃত হয়।

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule ক্যাপসুল আকৃতি

`Capsule` capsule shape নির্দেশ করে। এর দুই প্রান্ত arc shape, এবং এটি capsule button, tag background ইত্যাদি interface effect-এ commonly used।

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse উপবৃত্ত

`Ellipse` ellipse নির্দেশ করে। এটি `Circle`-এর মতো, কিন্তু width ও height সমান না হলে ellipse হিসেবে প্রদর্শিত হয়।

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

এই উদাহরণগুলো থেকে দেখা যায়, `Shape` নিজেই সরাসরি graphics হিসেবে display হতে পারে। এরপর আমরা এসব `Shape`-কে `clipShape`-এর সঙ্গে ব্যবহার করে photo crop করব, যাতে ছবি বিভিন্ন shape-এ display হয়।

## clipShape ব্যবহার করে ছবি crop করা

এখন আমরা `clipShape` ব্যবহার করে ছবিকে বিভিন্ন shape-এ crop করতে পারি।

যেমন, প্রথম ছবিকে circle-এ crop করা:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

এই code নির্দেশ করে: প্রথমে একটি ছবি display করা, তারপর `Circle()` ব্যবহার করে সেটিকে circle shape-এ crop করা।

![view](../../../Resource/032_view2.png)

`clipShape`-এর basic syntax হলো:

```swift
.clipShape(আকৃতি)
```

view-এর পরে `.clipShape(...)` যোগ করুন, এবং parentheses-এর ভিতরে যে graphic shape-এ crop করতে চান সেটি লিখুন।

যেমন:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

এখন আমরা ৫টি ছবিকে আলাদা আলাদা shape-এ crop করি:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

প্রদর্শিত ফলাফল:

![view](../../../Resource/032_view8.png)

এর মধ্যে `Rectangle()` দিয়ে crop করার effect সাধারণ rectangular photo-এর কাছাকাছি, তাই visual পরিবর্তন স্পষ্ট নয়; এটি মূলত অন্যান্য shape-এর সঙ্গে comparison করার জন্য।

এখন ছবি আর শুধু সাধারণ rectangle নয়, বরং বিভিন্ন shape পেয়েছে।

## ছবিতে border যোগ করা

যদি আমরা circle photo-তে border যোগ করতে চাই, তাহলে হয়তো `border` ব্যবহার করার কথা ভাবতে পারি:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

কিন্তু এভাবে সাধারণত circle border নয়, বরং rectangle border পাওয়া যায়।

![view](../../../Resource/032_view9.png)

এর কারণ হলো `border` view-এর rectangular area অনুযায়ী border যোগ করে, `clipShape`-এর পরে crop হওয়া shape অনুযায়ী border যোগ করে না।

তাই যদি আমরা circle border চাই, সরাসরি `border` ব্যবহার করা যাবে না।

## strokeBorder ব্যবহার করে shape border আঁকা

SwiftUI-তে `strokeBorder` এসব common `Shape`-এর জন্য inner border আঁকতে পারে।

যেমন, একটি circle border আঁকা:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

এই code নির্দেশ করে: `Circle`-এর জন্য একটি brown border আঁকা, border width হলো `10 pt`।

![view](../../../Resource/032_view12.png)

এখানে খেয়াল রাখতে হবে, `strokeBorder` সরাসরি ছবিতে border যোগ করছে না; বরং `Circle()` এই graphic-এর border আঁকছে।

অর্থাৎ এই code থেকে শুধু একটি independent circular border পাওয়া যায়; সেটির সঙ্গে ছবির এখনো কোনো সম্পর্ক নেই।

যদি এই circular border ছবির উপরে দেখাতে চাই, তাহলে `overlay` ব্যবহার করে border-টি ছবির উপর overlay করতে হবে।

## overlay ব্যবহার করে border overlay করা

`overlay` একটি view modifier, যা current view-এর উপর নতুন view overlay করতে পারে।

এর basic structure এভাবে বোঝা যায়:

```swift
বর্তমান ভিউ
    .overlay {
       overlay করা ভিউ
    }
```

এই উদাহরণে current view হলো circle-এ crop করা photo:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

আমরা যে নতুন view overlay করতে চাই, সেটি হলো একটি circular border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

তাই photo এবং border একসঙ্গে combine করা যায়:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

এখানে `overlay` নির্দেশ করে current view-এর উপর একটি নতুন view overlay করা হচ্ছে।

`overlay`-এর ভিতরে border current photo-এর display range অনুসরণ করে overlay হবে, তাই আলাদা করে `frame` সেট করার দরকার নেই। border shape এবং crop shape একই হলেই border ছবির সঙ্গে মিলে যাবে।

![view](../../../Resource/032_view10.png)

শেষ ফলাফল হলো circle photo-এর উপর একটি circular border cover করা হয়েছে।

`ZStack`-এর তুলনায়, `overlay` এই ধরনের “current view-এ decoration যোগ করা” scenario-র জন্য বেশি উপযোগী। photo হলো main content, border শুধু additional effect; তাই `overlay` ব্যবহার করলে structure আরও clear হয়।

## ফটো ওয়াল সম্পূর্ণ করা

এখন আমরা প্রতিটি ছবিতে corresponding shape এবং border যোগ করি:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

প্রদর্শিত ফলাফল:

![view](../../../Resource/032_view13.png)

এভাবে একটি basic photo wall page সম্পূর্ণ হলো।

এই page-এ আমরা `ScrollView` দিয়ে scroll display তৈরি করেছি, `Image` দিয়ে photo display করেছি, `clipShape` দিয়ে photo shape crop করেছি, এবং `overlay` ও `strokeBorder` দিয়ে border যোগ করেছি।

## সম্পূর্ণ কোড

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## সারাংশ

এই পাঠে আমরা একটি photo wall page সম্পূর্ণ করেছি।

![view](../../../Resource/032_view13.png)

এই example-এ আমরা প্রথমে `Image` ব্যবহার করে photo display করেছি, তারপর `extension` ব্যবহার করে `Image`-এর জন্য একটি `photoGalleryStyle` method extend করেছি, যা repeated image style code organize করতে ব্যবহৃত হয়।

এরপর আমরা SwiftUI-তে common `Shape` শিখেছি, যেমন `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` এবং `Ellipse`। এসব graphics শুধু সরাসরি display করা যায় না, `clipShape`-এর সঙ্গে মিলিয়ে view crop করতেও ব্যবহার করা যায়।

যেমন:

```swift
.clipShape(Circle())
```

এর অর্থ হলো view-কে circle shape-এ crop করা।

শেষে আমরা `overlay` এবং `strokeBorder` ব্যবহার করে ছবিতে সংশ্লিষ্ট shape-এর border যোগ করেছি। খেয়াল রাখতে হবে, `border` সাধারণত view-এর rectangular area অনুযায়ী border আঁকে। যদি border-কে circle, capsule বা ellipse অনুসরণ করাতে চান, তাহলে একই `Shape` overlay করা বেশি উপযোগী।

এই পাঠের মাধ্যমে আমরা শুধু photo wall effect সম্পূর্ণ করিনি, বরং interface-এ `Shape`, `clipShape`, `strokeBorder` এবং `overlay`-এর commonly used combination-ও বুঝেছি।

## ক্লাস-পরবর্তী অনুশীলন

### ১、ফটো ওয়ালের background যোগ করুন

ফটো ওয়াল page-এ একটি full-screen background image যোগ করুন।

চাহিদা: background image পুরো screen ভরতে পারবে, এবং safe area উপেক্ষা করবে।

### ২、gradient border

বর্তমান solid-color border-কে linear gradient border-এ বদলান।

আরও rich border effect তৈরি করতে `LinearGradient` ব্যবহার করে দেখতে পারেন।

### ৩、বাস্তবধর্মী photo border

ইন্টারনেটে কিছু real photo frame style search করুন, এবং `overlay` দিয়ে image border overlay করার চেষ্টা করুন, যাতে photo আরও real frame effect-এর কাছাকাছি লাগে।

অনুশীলনের প্রদর্শিত ফলাফল:

![button](../../../Resource/032_view15.jpeg)

### ৪、rounded button border তৈরি করা

প্র্যাকটিক্যাল development-এ button প্রায়ই rounded rectangle border ব্যবহার করে।

একটি rounded button তৈরি করার চেষ্টা করুন, এবং `RoundedRectangle` ও `strokeBorder` ব্যবহার করে button-এ rounded border যোগ করুন।

অনুশীলনের প্রদর্শিত ফলাফল:

![button](../../../Resource/032_view14.png)

### ভাবনার প্রশ্ন

যদি solid-color border ব্যবহার করতে না চান, gradient border-ও ব্যবহার করতে না চান, বরং border-এ কোনো pattern effect দেখাতে চান, তাহলে কীভাবে করা উচিত?

`overlay`, `mask` বা `ImagePaint`-এর মতো related usage সম্পর্কে তথ্য search করে দেখতে পারেন।

অনুশীলনের প্রদর্শিত ফলাফল:

![button](../../../Resource/032_view16.png)
