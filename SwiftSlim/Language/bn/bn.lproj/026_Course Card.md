# কোর্স কার্ড

এই পাঠটি একটি ধাপভিত্তিক রিভিউ পাঠ। আমরা একটি “কোর্স কার্ড” তৈরি করব।

এই অনুশীলনের মাধ্যমে, আমরা আগে শেখা `Text`、`Image`、`VStack`、`HStack`、`Spacer()`、`.padding()`、`.background()`、`.cornerRadius()` ইত্যাদি বিষয় পুনরায় অনুশীলন করতে পারি, এবং শিখতে পারি কীভাবে একাধিক ছোট view মিলিয়ে একটি সম্পূর্ণ view module তৈরি করা যায়।

কোর্স কার্ডের ফলাফল:

![view](../../../Resource/026_view.png)

এই কোর্স কার্ডে মূলত কয়েকটি অংশ রয়েছে:

- কোর্সের স্তর: `Beginner`
- কোর্সের বিষয়বস্তু: `20+ Lessons`
- কোর্সের শিরোনাম: `SwiftUI Beginner Tutorial`
- কোর্সের বিবরণ
- বোতাম: `Start Learning`
- কোর্সের পটভূমি: Swift icon এবং indigo রঙের background

আমরা `ContentView`-এর মধ্যে এই view সম্পন্ন করতে পারি।

## উপরের অংশ

প্রথমে, কোর্স কার্ডের উপরের অংশ তৈরি করি।

![view](../../../Resource/026_view1.png)

উপরের অংশের বাম পাশে কোর্সের স্তর দেখানো হয়, আর ডান পাশে কোর্সের বিষয়বস্তু দেখানো হয়।

কারণ এই দুটি বিষয় অনুভূমিকভাবে সাজানো, তাই `HStack` ব্যবহার করা যেতে পারে।

```swift
var topView: some View {
    HStack {
        Text("শিক্ষানবিশ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("২০+ পাঠ")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

এখানে আমরা উপরের অংশটিকে একটি computed property হিসেবে আলাদা করেছি:

```swift
var topView: some View
```

এভাবে করলে `body` আরও পরিষ্কার হয়।

উপরের অংশে প্রধানত এই বিষয়গুলো ব্যবহার করা হয়েছে:

- `HStack`: দুটি text-কে অনুভূমিকভাবে সাজায়।
- `Text`: text content দেখায়।
- `Spacer()`: বাম পাশের text-কে বামে ঠেলে দেয়, আর ডান পাশের text-কে ডানে ঠেলে দেয়।
- `.font(.footnote)`: ছোট text style সেট করে।
- `.fontWeight(.bold)`: text bold করে।
- `.foregroundStyle(Color.white)`: foreground color সাদা করে।
- `.padding(.vertical, 10)`: ওপর-নিচের padding সেট করে।
- `.padding(.horizontal, 16)`: বাম-ডানের padding সেট করে।
- `.background(Color.white.opacity(0.15))`: আধা-স্বচ্ছ সাদা background সেট করে।
- `.cornerRadius(20)`: corner radius সেট করে।

এখানে `Beginner`-এ দুই দিকের `.padding()` ব্যবহার করা হয়েছে:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

এতে text-এর ওপর-নিচে এবং বাম-ডানে জায়গা থাকে, ফলে এটি একটি label-এর মতো দেখায়।

`Color.white.opacity(0.15)` মানে opacity `15%`-এর সাদা, অর্থাৎ খুব হালকা সাদা।

### কার্ডের background যোগ করা

আগে আমরা `topView` তৈরি করেছি, কিন্তু শুধু view তৈরি করলে সেটি স্বয়ংক্রিয়ভাবে দেখা যায় না।

SwiftUI-তে, UI-তে সত্যি দেখা যাবে এমন content `body`-র মধ্যে লিখতে হয়।

তাই, আগে `topView`-কে `body`-তে রেখে দেখানো যেতে পারে:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

এখন দেখা যাবে উপরের অংশটি ইতিমধ্যে প্রদর্শিত হয়েছে:

![view](../../../Resource/026_view2.png)

তবে, `topView`-এর text সাদা, আর default background-ও হালকা, তাই light mode-এ এটি স্পষ্ট দেখা নাও যেতে পারে।

তাই আমরা বাইরের স্তরে একটি `VStack` যোগ করতে পারি, তারপর পুরো area-তে padding, background color এবং corner radius সেট করতে পারি:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view3.png)

এখানে `VStack`-এ আপাতত শুধু একটি `topView` রাখা হয়েছে, তাই এটি প্রয়োজনীয় নয় বলে মনে হতে পারে।

কিন্তু পরে আমরা আরও course title, course description এবং button area যোগ করব। এগুলো সবই ওপর-নিচে সাজানো content, তাই এখানে আগে থেকেই `VStack` ব্যবহার করলে পরের view composition সহজ হয়।

এখানে দুটি `.padding()` আছে, কিন্তু তাদের কাজ আলাদা।

প্রথম `.padding(20)` `.background()`-এর আগে লেখা হয়েছে:

```swift
.padding(20)
.background(Color.indigo)
```

এটি কার্ডের ভেতরের padding নিয়ন্ত্রণ করে, অর্থাৎ content এবং background edge-এর মধ্যবর্তী দূরত্ব।

দ্বিতীয় `.padding(30)` `.background()`-এর পরে লেখা হয়েছে:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

এটি কার্ডের বাইরের padding নিয়ন্ত্রণ করে, অর্থাৎ পুরো card এবং screen edge-এর মধ্যবর্তী দূরত্ব।

![view](../../../Resource/026_view4.png)

তাই একই `.padding()` হলেও, কোথায় লেখা হয়েছে তার ওপর effect ভিন্ন হয়।

## কনটেন্ট অংশ

এরপর কোর্স কার্ডের content area তৈরি করি।

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view5.png)

content area-তে course title এবং course description থাকে। এগুলো ওপর-নিচে সাজানো, তাই `VStack` ব্যবহার করা হয়।

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI শিক্ষানবিশ টিউটোরিয়াল")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("শূন্য থেকে SwiftUI শুরু করুন এবং Apple-এর declarative UI development পদ্ধতিগতভাবে শিখুন। স্পষ্ট ব্যাখ্যা এবং ব্যবহারিক উদাহরণের মাধ্যমে, আপনি ধীরে ধীরে layout, interaction এবং state management আয়ত্ত করবেন, যাতে সুন্দর ও কার্যকর app interface তৈরি করতে পারেন।")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view6.png)

এখানে `VStack`-এ দুটি parameter ব্যবহার করা হয়েছে:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` মানে `VStack`-এর ভেতরের view-গুলোকে বাম দিকে align করা।

`spacing: 10` মানে `VStack`-এর ভেতরের view-গুলোর মধ্যে `10 pt` দূরত্ব রাখা।

তাই course title এবং course description বাম দিক থেকে সাজানো হবে, এবং তাদের মধ্যে কিছু দূরত্ব থাকবে।

course description তুলনামূলকভাবে লম্বা। সবটুকু দেখালে card অনেক উঁচু হয়ে যাবে, তাই এখানে `.lineLimit()` ব্যবহার করে দেখানোর line সংখ্যা সীমিত করা হয়েছে:

```swift
.lineLimit(3)
```

এর মানে সর্বোচ্চ `3` line দেখানো হবে। content সীমা ছাড়ালে অতিরিক্ত অংশসংক্ষেপে দেখানো করা হবে।

### view বাম দিকে align করা

এখানে আরও একটি বিষয় খেয়াল করা দরকার।

`VStack(alignment: .leading)` শুধু `VStack`-এর ভেতরের view-গুলোর alignment নিয়ন্ত্রণ করে। এটি সরাসরি `VStack` নিজে বাইরের container-এ কোথায় থাকবে তা নিয়ন্ত্রণ করে না।

যেমন, যদি course description তুলনামূলকভাবে ছোট হয়:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI শিক্ষানবিশ টিউটোরিয়াল")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("শুধু কিছু content।")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view7.png)

দেখা যায়, course title এবং course description যদিও `VStack`-এর ভেতরে বাম দিকে aligned, কিন্তু পুরো `VStack` card-এর একেবারে বাম পাশে চলে যায়নি।

এর কারণ হলো, content ছোট হলে `VStack`-এর width-ও ছোট হয়। বাইরের container layout করার সময়, এই সরু `VStack`-কে মাঝখানে রাখতে পারে।

এভাবে বোঝা যায়: `VStack(alignment: .leading)` ভেতরের বাম alignment-এর জন্য দায়ী।
কিন্তু এটি পুরো content area-কে একেবারে বামে ঠেলে দেওয়ার জন্য দায়ী নয়।

যদি পুরো content area সত্যিই বামে রাখতে চাই, তাহলে বাইরে আরেকটি `HStack` wrap করে `Spacer()` যোগ করা যেতে পারে:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI শিক্ষানবিশ টিউটোরিয়াল")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("শুধু কিছু content।")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view8.png)

এখানে `HStack` একটি horizontal layout।

`Spacer()` ডান পাশের বাকি জায়গা দখল করবে, ফলে বাম পাশের `VStack` একেবারে বাম দিকে ঠেলে যাবে।

তাই `HStack + Spacer()` পুরো content area-এর অবস্থান নিয়ন্ত্রণ করতে ব্যবহার করা যায়।

বাস্তব course card-এ, course description তুলনামূলকভাবে লম্বা এবং সাধারণত বেশি width দখল করে, তাই এই সমস্যা সবসময় স্পষ্ট নাও হতে পারে। কিন্তু এই পার্থক্য বোঝা গুরুত্বপূর্ণ, কারণ পরে short text layout তৈরি করার সময় প্রায়ই একই ধরনের পরিস্থিতি দেখা যায়।

### ভেতরের view-গুলোর দূরত্ব নিয়ন্ত্রণ করা

আগে আমরা `VStack`-এ `spacing: 10` লিখেছি:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ভেতরের view-গুলোর মধ্যে দূরত্ব নিয়ন্ত্রণ করতে ব্যবহৃত হয়।

যদি `spacing` সেট না করা হয়, `VStack`-এরও default spacing থাকে, কিন্তু default spacing সবসময় আমাদের কাঙ্ক্ষিত effect-এর সঙ্গে মিলবে না।

এখানে course title এবং course description খুব কাছে থাকলে ঘিঞ্জি মনে হবে, তাই ব্যবহার করা হয়েছে:

```swift
spacing: 10
```

এতে তাদের মধ্যে কিছুটা জায়গা থাকে।

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view9.png)

একইভাবে, উপরের অংশ এবং content area-ও ওপর-নিচে সাজানো, তাই তাদের মধ্যবর্তী দূরত্ব নিয়ন্ত্রণ করতেও `spacing` ব্যবহার করা যায়।

এখন `topView` এবং `contentView`-কে `body`-তে রাখি:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view10.png)

এখানে `VStack(spacing: 20)` `topView` এবং `contentView`-এর মধ্যবর্তী দূরত্ব নিয়ন্ত্রণ করে।

অর্থাৎ:

```swift
VStack(alignment: .leading, spacing: 10)
```

course title এবং course description-এর মধ্যবর্তী দূরত্ব নিয়ন্ত্রণ করে।

```swift
VStack(spacing: 20)
```

উপরের অংশ এবং content area-এর মধ্যবর্তী দূরত্ব নিয়ন্ত্রণ করে।

দুটিই `spacing`, কিন্তু এগুলো ভিন্ন `VStack`-এ কাজ করে, তাই প্রভাবের পরিসরও ভিন্ন।

এভাবে content area-এর view সম্পন্ন হয়েছে।

## বোতাম অংশ

এরপর নিচের button area তৈরি করি।

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view11.png)

button area মূলত একটি play icon এবং একটি text নিয়ে গঠিত।

আমরা `Image` দিয়ে play icon দেখাতে পারি, এবং `Text` দিয়ে button text দেখাতে পারি।

এখানে আগে একটি button appearance তৈরি করি:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("বোতামে ক্লিক")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("শেখা শুরু করুন")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view12.png)

এখানে দুটি `HStack` ব্যবহার করা হয়েছে:

ভেতরের `HStack` icon এবং text-কে অনুভূমিকভাবে সাজানোর জন্য ব্যবহৃত হয়েছে:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("শেখা শুরু করুন")
}
```

বাইরের `HStack` `Spacer()`-এর সঙ্গে মিলে এই button appearance-কে বাম দিকে দেখায়:

```swift
HStack {
    ...
    Spacer()
}
```

button চাপলে console-এ `বোতামে ক্লিক` output হবে।

## basic card সম্পন্ন

এখন, উপরের অংশ, content area এবং button area একত্র করি:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/026_view13.png)

এ পর্যন্ত একটি basic course card সম্পন্ন হয়েছে।

## Swift icon background

শেষে, কার্ডে একটি আধা-স্বচ্ছ Swift icon background যোগ করি।

![view](../../../Resource/026_view.png)

আগে আমরা background color হিসেবে `Color.indigo` ব্যবহার করেছি। আসলে `.background()` শুধু color যোগ করতে পারে না, একটি সম্পূর্ণ view-ও যোগ করতে পারে।

তাই আমরা আগে একটি আলাদা background view তৈরি করতে পারি:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

এই background view-তে, আমরা `VStack`、`HStack` এবং `Spacer()` ব্যবহার করে Swift icon-কে ডান নিচে ঠেলে দিয়েছি।

কারণ Swift icon শুধু decorative background হিসেবে ব্যবহৃত হচ্ছে, তাই এখানে আধা-স্বচ্ছ সাদা ব্যবহার করা হয়েছে:

```swift
Color.white.opacity(0.15)
```

এতে icon খুব বেশি চোখে পড়ে না, এবং সামনে থাকা text content-এ প্রভাব ফেলে না।

এরপর `backgroundView`-কে card-এ যোগ করি:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

বাস্তবায়নের ফলাফল:

![view](../../../Resource/026_view14.png)

এখানে ধারাবাহিকভাবে দুটি `.background()` ব্যবহার করা হয়েছে:

```swift
.background(backgroundView)
.background(Color.indigo)
```

প্রথম `.background()` Swift icon background যোগ করতে ব্যবহৃত হয়।
দ্বিতীয় `.background()` indigo background যোগ করতে ব্যবহৃত হয়।

এভাবে Swift icon indigo background-এর ওপর দেখা যাবে, এবং card background-এর অংশ হিসেবে প্রদর্শিত হবে।

এখান থেকে দেখা যায়, `.background()` শুধু color যোগ করতে নয়, custom view যোগ করতেও ব্যবহার করা যায়। একাধিক `.background()` একসঙ্গে ব্যবহার করেও আরও সমৃদ্ধ background effect তৈরি করা যায়।

এ পর্যন্ত একটি সম্পূর্ণ course card তৈরি হলো।

## সারাংশ

এই পাঠে একটি course card-এর মাধ্যমে SwiftUI-র সাধারণ basic layout পদ্ধতিগুলো পুনরায় অনুশীলন করা হয়েছে।

আমরা `Text` দিয়ে text দেখিয়েছি, `Image` দিয়ে system icon দেখিয়েছি, এবং `VStack`、`HStack` ও `Spacer()` দিয়ে view arrangement নিয়ন্ত্রণ করেছি।

`.lineLimit()` শিখেছি, যা text সর্বোচ্চ কত line দেখাবে তা সীমিত করতে পারে। content সীমা ছাড়ালে অতিরিক্ত অংশসংক্ষেপে দেখানো করা হয়।

একই সঙ্গে, আমরা `.padding()`、`.background()`、`.cornerRadius()`、`.foregroundStyle()` ইত্যাদি common modifier-ও পুনরায় অনুশীলন করেছি।

এই পাঠ শেষ করার পর, আমরা ইতিমধ্যেই একাধিক ছোট view মিলিয়ে একটি সম্পূর্ণ card module তৈরি করতে পারি।

এটিও SwiftUI development-এ খুব সাধারণ একটি ভাবনা: আগে ছোট view ভাগ করা, তারপর সেগুলো মিলিয়ে সম্পূর্ণ interface তৈরি করা।

## সম্পূর্ণ code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("শিক্ষানবিশ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("২০+ পাঠ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI শিক্ষানবিশ টিউটোরিয়াল")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("শূন্য থেকে SwiftUI শুরু করুন এবং Apple-এর declarative UI development পদ্ধতিগতভাবে শিখুন। স্পষ্ট ব্যাখ্যা এবং ব্যবহারিক উদাহরণের মাধ্যমে, আপনি ধীরে ধীরে layout, interaction এবং state management আয়ত্ত করবেন, যাতে সুন্দর ও কার্যকর app interface তৈরি করতে পারেন।")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("বোতামে ক্লিক")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("শেখা শুরু করুন")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
