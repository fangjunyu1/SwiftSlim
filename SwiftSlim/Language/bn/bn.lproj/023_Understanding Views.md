# ভিউ বোঝা

এই পাঠে আমরা আবার একদম শুরুতে দেখা `ContentView`-এ ফিরে আসব।

```swift
struct ContentView: View {
    var body: some View {
        Text("হ্যালো, বিশ্ব!")
    }
}
```

প্রথমবার SwiftUI শেখার সময় `ContentView`-এর মধ্যে এমন অনেক কীওয়ার্ড ছিল যা আমরা বুঝতাম না।

যেমন `struct`, `View`, `var`, `body`, `some View` ইত্যাদি কীওয়ার্ড।

তখন হয়তো আমরা শুধু জানতাম: **কোড `body`-এর ভেতরে লিখলে, ইন্টারফেসে বিষয়বস্তু দেখা যাবে।**

এখন আমরা `struct`, ভেরিয়েবল, মেথড এবং প্রোটোকল শিখেছি, তাই এই কোডটি আবার বুঝতে পারি, যাতে SwiftUI ভিউগুলোর পারস্পরিক সম্পর্ক বুঝতে সুবিধা হয়।

## ContentView আবার দেখা

SwiftUI প্রজেক্ট তৈরি করার পর Xcode ডিফল্টভাবে একটি `ContentView` ফাইল তৈরি করে।

উদাহরণ কোড:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("হ্যালো, বিশ্ব!")
        }
        .padding()
    }
}
```

এই কোডকে কয়েকটি অংশে ভাগ করে বোঝা যায়।

প্রথমে:

```swift
import SwiftUI
```

এই লাইনটি SwiftUI ফ্রেমওয়ার্ক import করার অর্থ প্রকাশ করে।

SwiftUI import করার পর আমরা `View`, `Text`, `Image`, `VStack`, `Button` ইত্যাদি SwiftUI ভিউ ব্যবহার করতে পারি।

## ContentView স্ট্রাকচার

এই লাইনটি একটি স্ট্রাকচার তৈরি করার অর্থ প্রকাশ করে:

```swift
struct ContentView: View
```

এর মধ্যে:

```swift
struct ContentView
```

বোঝায় `ContentView` একটি স্ট্রাকচার।

আগের পাঠে আমরা `struct` কাঠামো সম্পর্কে জেনেছি। এটি সম্পর্কিত বিভিন্ন ফিল্ড একত্র করতে পারে, এবং এর মধ্যে property ও method থাকতে পারে।

উদাহরণ:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("হ্যালো, বিশ্ব!")
    }
}
```

এই উদাহরণে `ContentView`-এর মধ্যে তিনটি বিষয় আছে: `name`, `printName` এবং `body`।

অর্থাৎ `struct` সম্পর্কিত property, method এবং ভিউ কনটেন্ট একত্রে সংগঠিত করতে পারে।

![contentView](../../Resource/023_contentVIew.png)

## View একটি protocol

এই লাইনটি আবার দেখি:

```swift
struct ContentView: View 
```

কোলনের পরের `View` বোঝায়: `ContentView` `View` protocol অনুসরণ করছে।

এভাবে বোঝা যায়, `ContentView` যদি SwiftUI ভিউ হতে চায়, তাহলে তাকে `View` protocol-এর প্রয়োজনীয়তা পূরণ করতে হবে।

### Identifiable protocol

আগে মুভি লিস্ট শেখার সময় আমরা `Identifiable` protocol-এর সাথে পরিচিত হয়েছিলাম।

তখন আমাদের `ForEach`-এ `Movie` array traverse করতে হয়েছিল, কিন্তু `Movie` structure-এর কোনো unique identifier ছিল না, তাই সেটি `ForEach` traversal সমর্থন করত না।

তখন আমাদের `Movie` structure-কে `Identifiable` protocol অনুসরণ করাতে হয়েছিল, যাতে `ForEach`-এর unique identifier-এর চাহিদা পূরণ হয়।

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protocol-এর প্রয়োজন: **এই টাইপের নিজেকে শনাক্ত করার জন্য একটি `id` ফিল্ড থাকতে হবে।**

`Movie` একটি `id` ফিল্ড দেওয়ার পর, এটি `Identifiable`-এর প্রয়োজনীয়তা পূরণ করতে পারে।

তাই আমরা যখন `ForEach`-এ এটি ব্যবহার করি, SwiftUI প্রতিটি ডেটাকে আলাদা করে চিনতে পারে।

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protocol

`View` protocol-ও একই রকম।

কোনো টাইপ SwiftUI ভিউ হতে চাইলে, তাকে `View` protocol অনুসরণ করতে হবে।

আর `View` protocol-এর সবচেয়ে গুরুত্বপূর্ণ প্রয়োজন হলো একটি `body` প্রদান করা।

```swift
struct ContentView: View {
    var body: some View {
        Text("হ্যালো, বিশ্ব!")
    }
}
```

এভাবে বোঝা যায়, `View` protocol-এর প্রয়োজন: **শুধু `body` যে SwiftUI ভিউ ফিরিয়ে দেয় সেটিই গ্রহণ করে, আর `ContentView` `body`-এর মাধ্যমে SwiftUI ভিউ দেখায়।**

### View অনুসরণ না করলে কী হবে?

যদি আমরা এভাবে লিখি:

```swift
struct ContentView {
}
```

এটি শুধু একটি সাধারণ structure, SwiftUI ভিউ নয়।

এটি সরাসরি error দেবে না, কারণ সাধারণ structure নিজেই বৈধ Swift code।

কিন্তু যদি আমরা এটিকে preview-তে রাখি:

```swift
#Preview {
    ContentView()
}
```

তখন error হবে।

কারণ: **preview-তে একটি SwiftUI ভিউ দেখাতে হয়, কিন্তু এই `ContentView` `View` protocol অনুসরণ করছে না।**

তাই যদি আমরা চাই `ContentView` interface-এ দেখানো যায়, তাহলে সেটিকে `View` protocol অনুসরণ করাতে হবে:

```swift
struct ContentView: View {
}
```

একই সঙ্গে, `View` protocol-এর প্রয়োজন অনুযায়ী `body` দিতে হবে। `body` না থাকলে compiler তবুও error দেবে।

সঠিক লেখা:

```swift
struct ContentView: View {
    var body: some View {
        Text("হ্যালো, বিশ্ব!")
    }
}
```

এই সময় `ContentView` সত্যিকারের প্রদর্শনযোগ্য SwiftUI ভিউ হয়।

## body হলো ভিউ প্রদর্শনের entry

SwiftUI-তে `body` হলো ভিউ কনটেন্টের entry।

```swift
var body: some View {
    Text("হ্যালো, বিশ্ব!")
}
```

এখানে এটিকে তিন ভাগে ভাগ করা যায়:

**1. var body**

```swift
var body
```

এর অর্থ `body` নামের একটি ভেরিয়েবল সংজ্ঞায়িত করা।

**2. some View**

```swift
: some View
```

এর অর্থ এই `body` একটি ভিউ ফিরিয়ে দেবে।

**3. { ... }**

```swift
{
    Text("হ্যালো, বিশ্ব!")
}
```

এটি প্রদর্শিত ভিউ কনটেন্ট বোঝায়। এই কোডে প্রদর্শিত হচ্ছে একটি `Text` ভিউ।

অর্থাৎ `body`-এর ভেতরে যা লেখা হয়, interface-এ তাই দেখানো হয়।

উদাহরণ:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("নাম:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

এই কোডের অর্থ: **interface-এ vertically arranged content দেখায়, যার মধ্যে দুটি text আছে।**

### body নাম ইচ্ছেমতো বদলানো যায় না

খেয়াল রাখতে হবে, `body` নামটি ইচ্ছেমতো বদলানো যায় না।

যদি এভাবে লেখা হয়:

```swift
struct ContentView: View {
    var content: some View {
        Text("হ্যালো, বিশ্ব!")
    }
}
```

এই `content`-ও একটি view property, কিন্তু এটি `body`-কে প্রতিস্থাপন করতে পারে না।

কারণ `View` protocol যে নামটি চায় সেটি হলো `body`।

## some View কী?

SwiftUI-তে `some View` বোঝায় একটি নির্দিষ্ট ভিউ ফিরিয়ে দেওয়া, শুধু সেই ভিউটির পূর্ণ টাইপ লিখতে হয় না।

```swift
var body: some View
```

অর্থাৎ `some View` মানে টাইপ নেই এমন নয়। আসল টাইপ এখনও আছে, compiler সেই টাইপ জানে, কিন্তু টাইপটি জটিল হতে পারে, তাই Swift আমাদের `some View` ব্যবহার করে সেটি লুকাতে দেয়।

### some কী?

Swift-এ `some` হলো opaque type ঘোষণা করার keyword।

opaque type-এর অর্থ হলো: **return value-এর একটি নির্দিষ্ট টাইপ আছে, compiler জানে সেই নির্দিষ্ট টাইপ কী, কিন্তু আমরা সেই টাইপটি সরাসরি লিখি না।**

উদাহরণ:

```swift
func makeView() -> some View {
    Text("হ্যালো")
}
```

এর অর্থ `makeView` এমন একটি নির্দিষ্ট টাইপ ফিরিয়ে দেবে যা `View` protocol অনুসরণ করে।

### some কেন দরকার?

ভেরিয়েবল শেখার সময় আমরা জেনেছি: **Swift-এর value-গুলোতে স্পষ্টভাবে type annotate করতে হয়, অথবা compiler স্বয়ংক্রিয়ভাবে type infer করে।**

উদাহরণ:

```swift
let a: Int = 10
```

এখানে constant `a` হলো `Int` টাইপ।

SwiftUI ভিউও ব্যতিক্রম নয়। যখন আমরা `body` দিয়ে SwiftUI ভিউ দেখাই, তখন `body`-কে সংশ্লিষ্ট SwiftUI টাইপ ফিরিয়ে দিতে হবে।

যেমন, আমরা যদি `body` দিয়ে একটি `Text` text view দেখাই, তাহলে `body`-কে সংশ্লিষ্ট `Text` টাইপ ফিরিয়ে দিতে হবে।

```swift
var body: Text {
    Text("Fang Junyu")
}
```

এই উদাহরণে `body`-এর ভেতরে প্রদর্শিত হচ্ছে একটি `Text` ভিউ, আর return type-ও `Text`।

শুধু ভেতরের টাইপ এবং ঘোষিত টাইপ মিললেই compiler-এর type consistency-এর শর্ত পূরণ হয়।

**টাইপ অমিল সমস্যা**

যদি আমরা `body`-এর টাইপ `Color` করি, কিন্তু প্রদর্শন করি `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

তাহলে `body`-এর টাইপ এবং ভেতরের কোডের টাইপ মিলবে না, ফলে type mismatch error হবে।

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

তখন আমাদের হাতে `body`-এর return type সংশোধন করতে হবে।

**জটিল ভিউ টাইপ**

বাস্তব development-এ interface সাধারণত শুধু একটি `Text` নয়।

আরও জটিল `VStack` দেখাতে হলে, আমাদের হাতে জটিল return type annotate করতে হবে।

উদাহরণ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("হ্যালো, বিশ্ব!")
    }
}
```

এই কোডের অর্থ একটি `VStack` return করা, আর `VStack`-এর ভেতরে `Image` ও `Text` টাইপের ভিউ আছে।

`body`-এর return type হলো:

```swift
VStack<TupleView<(Image,Text)>>
```

দেখা যাচ্ছে, এই return type খুব জটিল, এবং এখানে আগে না দেখা `TupleView` যুক্ত হয়েছে।

এখানে `TupleView`-কে বোঝা যায়: **একাধিক child view-কে একটি view হিসেবে wrap করা।**

**আরও জটিল ভিউ টাইপ**

যদি আমরা view-তে modifier যোগ করি:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("হ্যালো, বিশ্ব!")
    }
    .padding()
}
```

তাহলে এই view-এর return type খুব জটিল হয়ে যায়, এখানে নির্দিষ্টভাবে বর্ণনা করা সম্ভব নয়।

বর্তমান return type `VStack<TupleView<(Image,Text)>>` modifier বর্ণনা করতে না পারায় error হবে।

**some View return type সহজ করে**

এই ধরনের ক্ষেত্রে SwiftUI একটি সংক্ষিপ্ত সমাধান দেয়, সেটি হলো `some View` দিয়ে লেখা সহজ করা।

যখন আমরা `body`-কে `some View` টাইপে বদলাই:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("হ্যালো, বিশ্ব!")
    }
    .padding()
}
```

প্রতিবার view code বদলালে আর আমাদের পূর্ণ return type লিখতে হয় না।

কারণ `some View` বোঝায় এমন একটি নির্দিষ্ট view return করা যা `View` protocol অনুসরণ করে।

অন্যভাবে বললে, `VStack`, `Image` ইত্যাদি SwiftUI view সবই `View` protocol অনুসরণ করে। modifier যোগ করার পর return হওয়া view type-ও `View` protocol অনুসরণ করে।

তাই এগুলো সব `some View` হিসেবে return করা যায়।

### some View ইচ্ছেমতো যেকোনো view return করতে পারে না

`some View` জটিল type লুকাতে পারলেও, এটি “type নেই” নয়।

এর মূল নিয়ম হলো: **compiler অবশ্যই একটি নির্দিষ্ট return type নির্ধারণ করতে পারতে হবে**।

উদাহরণ:

```swift
var title: some View {
    Text("হ্যালো")
}
```

এখানে return হচ্ছে `Text` ভিউ।

কিন্তু যদি দুটি view return করার চেষ্টা করি, error হবে:

```swift
var title: some View {
    Text("হ্যালো")
    Image(systemName: "star")
}
```

কারণ `some View` শেষ পর্যন্ত একটি view structure return করতে চায়, কিন্তু এখানে দুটি independent view return করার চেষ্টা করা হচ্ছে।

### সমাধান

সমাধান সাধারণত দুই ধরনের: container এবং `@ViewBuilder`।

**1. container দিয়ে wrap করা**

```swift
var title: some View {
    VStack {
        Text("হ্যালো")
        Image(systemName: "star")
    }
}
```

এই কোডে `title` একটি `VStack` return করে, আর `Text` ও `Image` হলো `VStack`-এর ভেতরের child view।

`some View` যে view structure গ্রহণ করছে তা হলো `VStack<...>`, ফলে এটি একটি view structure return করার `some View`-এর প্রয়োজন পূরণ করে। 

এই কারণেই SwiftUI শেখার শুরু থেকেই আমরা সবচেয়ে বাইরের স্তরে `VStack` container দিয়ে view code wrap করার পরামর্শ দিই।

**2. @ViewBuilder ব্যবহার করা**

আমরা `some View`-এর আগে `@ViewBuilder` modifier যোগ করতে পারি:

```swift
@ViewBuilder
var title: some View {
    Text("হ্যালো")
    Image(systemName: "star")
}
```

`@ViewBuilder` একাধিক view-কে একটি return result-এ combine করতে পারে।

এর মূল কাজ এখনও একাধিক view-কে একটি view-তে merge করা, যাতে `some View`-এর একটি view structure return করার প্রয়োজন পূরণ হয়।

### body-তে সরাসরি একাধিক view লেখা যায় কেন?

যদি আমরা `var body`-তে একাধিক view লিখি, যেমন:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("হ্যালো, বিশ্ব!")
}
```

কিছু ক্ষেত্রে এমন `body` error দেবে না।

কারণ `View` protocol-এর `body` defaultভাবে `@ViewBuilder` সমর্থন করে:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protocol-এর source code-এ আমরা দেখতে পাই `body` variable-কে আগে থেকেই `@ViewBuilder` decorate করেছে।

তাই `body` সাধারণ `some View`-এর তুলনায় অতিরিক্ত একটি বিশেষ processing পায়, ফলে SwiftUI স্বয়ংক্রিয়ভাবে একাধিক view-কে একটি view-তে combine করে।

**container ব্যবহার করার পরামর্শ**

শুরু করা শিক্ষার্থীদের বোঝা সহজ করার জন্য, একাধিক view সংগঠিত করতে আগে `VStack`, `HStack`, `ZStack`, `Group` ইত্যাদি container ব্যবহার করার পরামর্শ দেওয়া হয়।

উদাহরণ:

```swift
var body: some View {
    VStack {
        Text("হ্যালো")
        Image(systemName: "star")
    }
}
```

এভাবে code আরও intuitive হয়: **বাইরের স্তর একটি `VStack`, যার ভেতরে দুটি child view আছে।**

## ভিউ ভাগ করা

interface যদি সহজ হয়, আমরা সব code `body`-এর মধ্যে লিখতে পারি।

উদাহরণ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote-এ স্বাগতম")
                Text("সুপ্রভাত")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("আমাকে চাপুন") {
                print("আমাকে চাপুন ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

এই view-এর display style:

![view](../../Resource/023_view1.png)

এই code স্বাভাবিকভাবে চলতে পারে, কিন্তু view code খুব জটিল হলে `body`-এর code ক্রমে লম্বা হবে, পড়া ও পরিবর্তন করার কঠিনতা বাড়তে থাকবে।

তখন আমরা বিভিন্ন area-কে independent view property হিসেবে ভাগ করতে পারি।

### উপরের view ভাগ করা

যেমন, উপরের area আলাদা করা:

```swift
var topHome: some View {
    HStack {
        Text("হোম")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

এখানে `topHome` একটি variable, এটি একটি view return করে।

যেহেতু return হয় view, তাই type এভাবে লেখা যায়:

```swift
some View
```

এটি আসলে `body`-এর মতোই ব্যবহার:

```swift
var topHome: some View { }
var body: some View { }
```

দুটিই variable ব্যবহার করে view দেখায়, return type হলো `some View`।

### অন্যান্য view ভাগ করা

এরপর অন্য অংশগুলো ভাগ করা যায়:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote-এ স্বাগতম")
        Text("সুপ্রভাত")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("আমাকে চাপুন") {
        print("আমাকে চাপুন")
    }
    .buttonStyle(.borderedProminent)
}
```

ভাগ করার পর view variable-গুলো `body`-তে রাখা যায়:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("হোম")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote-এ স্বাগতম")
            Text("সুপ্রভাত")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("আমাকে চাপুন") {
            print("আমাকে চাপুন")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

এখন `body` শুধু page structure বর্ণনা করে:

```swift
topBar
welcomeText
colorList
clickButton
```

প্রতিটি অংশের নির্দিষ্ট implementation নিচের সংশ্লিষ্ট property-তে রাখা হয়েছে।

এইভাবে view ভাগ করলে page structure আরও পরিষ্কার হয়, প্রতিটি view area-এর নিজস্ব নাম থাকে, পড়া আরও সরাসরি হয়।

নির্দিষ্ট কোনো অংশের code পরিবর্তন করতে হলে, জটিল code-এর ভিড়ে খোঁজার বদলে সরাসরি সংশ্লিষ্ট view area খুঁজে পাওয়া যায়।

### some View একটি view return করে

এই view split-এ, যদি আমরা একাধিক view return করার চেষ্টা করি:

```swift
var topBar: some View {
    Text("হোম")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` শুধু একটি view structure return করতে পারে বলে error হবে।

`body`-এর থেকে আলাদা হলো, সাধারণ computed property defaultভাবে `@ViewBuilder` পায় না।

তাই যদি আমাদের একাধিক view return করতে হয়, `VStack`, `HStack` অথবা `Group` container ব্যবহার করে একাধিক view-কে একটি view-তে combine করা যায়।

```swift
var topBar: some View {
    VStack {
        Text("হোম")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

অথবা `@ViewBuilder` যোগ করে view combine করা যায়:

```swift
@ViewBuilder
var topBar: some View {
    Text("হোম")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

এভাবে আমরা একাধিক view return করতে পারি।

### if একাধিক view return করে

উদাহরণ:

```swift
var topHome: some View {
    if step == "হোম" {
        HStack {
            Text("হোম")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("শূন্য")
    }
}
```

এই code-এ `topHome` `step`-এর content অনুযায়ী `HStack` অথবা `Text`—দুই ধরনের ভিন্ন view return করে।

যেহেতু `some View`-এর একটি নির্দিষ্ট concrete return type দরকার, সাধারণ computed property-তে `if`-এর দুই branch সরাসরি ভিন্ন ধরনের view return করতে পারে না, ফলে error হয়।

**সমাধান এখনও container দিয়ে wrap করা, অথবা `@ViewBuilder` modifier ব্যবহার করা।**

### split view-তে parentheses লাগে না কেন

`body`-তে split করা view property ব্যবহার করার সময় আমরা সরাসরি লিখি:

```swift
topBar
welcomeText
colorList
clickButton
```

এভাবে লিখি না:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

কারণ `topBar`, `welcomeText`, `colorList`, `clickButton` হলো variable; এগুলো আসলে computed property, method নয়।

**property ব্যবহার করতে parentheses লাগে না।**

যদি আমরা method হিসেবে লিখি, তবুও similar effect পাওয়া যায়:

```swift
func topBar() -> some View {
    HStack {
        Text("হোম")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

এই code-ও similar effect দিতে পারে, এই method call করলে একটি view return হয়।

ব্যবহার করার সময় লিখতে হবে:

```swift
topBar()
```

SwiftUI-তে যদি শুধু parameter ছাড়া একটি view split করা হয়, computed property ব্যবহার করা বেশি প্রচলিত।

```swift
var topBar: some View { ... }
```

## nested view

কোড property-তে ভাগ করার পাশাপাশি, আমরা নতুন view structure-ও তৈরি করতে পারি।

উদাহরণ:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

এই `PinkColorView` এবং `ContentView` একইভাবে একটি independent SwiftUI view।

যদি `ContentView`-এ এটি দেখাতে হয়, view name-এর পরে `()` যোগ করা যায়।

উদাহরণ:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

এখানে:

```swift
PinkColorView()
```

মানে একটি `PinkColorView` instance তৈরি করা।

কারণ `PinkColorView` `View` protocol অনুসরণ করে, তাই এটি `Text`, `Image`, `Button`-এর মতো অন্য view-র মধ্যে রেখে display করা যায়।

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

এটাই view nesting: একটি view আরেকটি view-এর মধ্যে display হতে পারে।

## view property নাকি নতুন view তৈরি?

view code সহজ হলে সাধারণত code split করার দরকার নেই; code জটিল হলে তবেই view split করার পরামর্শ দেওয়া হয়।

### view property ব্যবহারের পরিস্থিতি

যদি এটি বর্তমান view-এর একটি ছোট অংশ মাত্র হয়, view property ব্যবহার করা যায়।

উদাহরণ:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

এই content সাধারণত শুধু বর্তমান view-তেই ব্যবহৃত হয়।

### নতুন view তৈরির পরিস্থিতি

যদি content তুলনামূলকভাবে independent হয়, অথবা ভবিষ্যতে একাধিক page-এ reuse হতে পারে, তাহলে নতুন view তৈরি করা বেশি উপযুক্ত।

উদাহরণ:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

এটি একটি title view। যদি আমরা এই view-টিকে general component হিসেবে অন্য view-তে reuse করতে চাই।

আমরা একটি নতুন view তৈরি করতে পারি:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

তারপর অন্য জায়গায় ব্যবহার করি:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

এই সময় এই view একটি reusable independent component।

সহজভাবে বলা যায়:

- বর্তমান view-এর content area: `var xxx: some View` ব্যবহার করা যায়
- reusable independent component: নতুন `struct XxxView: View` তৈরি করা যায়
- data pass করতে হয় এমন component: সাধারণত নতুন view তৈরি করাই বেশি উপযুক্ত।

## সারাংশ

এই পাঠে আমরা SwiftUI-এর সবচেয়ে basic কিন্তু সবচেয়ে গুরুত্বপূর্ণ view structure আবার বুঝেছি।

`ContentView` একটি structure, এটি `struct` দিয়ে define করা হয়, page-related code সংগঠিত করতে ব্যবহৃত হয়।

`View` একটি protocol। কোনো structure SwiftUI view হতে চাইলে, সেটিকে `View` protocol অনুসরণ করতে হবে।

`body` হলো `View` protocol আমাদের যে content দিতে বলে; এটি নির্ধারণ করে এই view কী content দেখাবে।

`some View` বোঝায় কোনো এক নির্দিষ্ট view return করা, তার জটিল পূর্ণ type আমাদের লিখতে হয় না।

view code দীর্ঘ হলে, আমরা `var xxx: some View` ব্যবহার করে view code-কে ছোট ছোট area-তে ভাগ করতে পারি।

কোনো content তুলনামূলকভাবে independent হলে, অথবা reuse দরকার হলে, আমরা নতুন view structure তৈরি করতে পারি, এবং অন্য view-তে `XxxView()` দিয়ে সেটি দেখাতে পারি।

সহজভাবে বললে, SwiftUI interface একেকটি view মিলিয়ে তৈরি হয়। একটি page-এ একাধিক ছোট view থাকতে পারে, আর একটি ছোট view-ও আবার অন্য view ধারণ করতে পারে।
