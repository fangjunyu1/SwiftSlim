# সাইন-ইন ভিউ

এই পাঠে আমরা একটি খুবই ব্যবহারিক দৃশ্য শিখব, সেটি হলো সাইন-ইন ভিউ।

ওয়েবসাইট হোক বা অ্যাপ, ব্যবহার করার সময় অনেক ক্ষেত্রেই ব্যবহারকারীকে অ্যাকাউন্টে সাইন ইন করে পাসওয়ার্ড দিতে হয়।

উদাহরণ হিসেবে, GitHub-এর সাইন-ইন পেজ:

![WordPress](../../Resource/019_github.png)

এই পাঠে আমরা এমন একটি সাইন-ইন ভিউ তৈরি করব, যেখানে ব্যবহারকারী হাতে অ্যাকাউন্ট ও পাসওয়ার্ড ইনপুট করবে, আর আমরা দেখব ইনপুট করা কনটেন্টে কোনো সমস্যা আছে কি না।

## উপরের লেআউট

আমরা `ContentView` ফাইলে সাইন-ইন ভিউয়ের কোড লিখব।

প্রথমে, সাইন-ইন ভিউয়ের উপরের পরিচয়চিহ্নের অংশটি তৈরি করি। আপনি আগে থেকে একটি উপযুক্ত আইকন ছবি প্রস্তুত করে তা `Assets` ফোল্ডারে রাখতে পারেন।

![icon](../../Resource/019_icon1.png)

তারপর, `Image` এবং মডিফায়ার ব্যবহার করে ছবিটি দেখান:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

এখানকার কয়েকটি মডিফায়ারের অর্থ হলো:

- `resizable()`: ছবিটির আকার পরিবর্তন করা যাবে।
- `scaledToFit()`: ছবির মূল অনুপাত বজায় রেখে স্কেল করবে।
- `frame(width: 100)`: ছবির প্রদর্শন প্রস্থ `100` সেট করে।

এরপর, `Text` এবং মডিফায়ার ব্যবহার করে সাইন-ইন শিরোনাম দেখান:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

তারপর, `VStack` ব্যবহার করে ছবি ও লেখাকে উপর-নিচে সাজান:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

ফলাফল:

![view](../../Resource/019_view.png)

এ পর্যন্ত আমরা সাইন-ইন ভিউয়ের উপরের শিরোনাম অংশটি সম্পন্ন করেছি।

### লেআউট অপ্টিমাইজ করা

এখন ছবি ও শিরোনাম ডিফল্টভাবে পুরো লেআউটের মাঝামাঝি জায়গায় আছে।

যদি আমরা চাই এগুলো আরও "পেজের উপরের সাইন-ইন চিহ্ন"-এর মতো দেখাক, তাহলে `Spacer()` ব্যবহার করে বাকি জায়গা প্রসারিত করে কনটেন্টকে উপরের দিকে আনতে পারি।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

ফলাফল:

![view](../../Resource/019_view1.png)

কিন্তু এখন `Image` এবং `Text` স্ক্রিনের একদম ওপরে চলে গেছে, তাই কিছুটা গাদাগাদি লাগছে।

এই সময় আমরা `padding` ব্যবহার করে পুরো `VStack`-এর উপরে কিছু ফাঁক যোগ করতে পারি।

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

ফলাফল:

![view](../../Resource/019_view2.png)

এভাবে পেজের উপরের শিরোনাম অংশটি আরও মানানসই দেখায়।

## ব্যবহারকারীর নাম এবং পাসওয়ার্ড

সাইন-ইন পেজে সাধারণত ব্যবহারকারীকে ব্যবহারকারীর নাম এবং পাসওয়ার্ড ইনপুট করতে হয়।

SwiftUI-তে আমরা `TextField` ব্যবহার করে ব্যবহারকারীর ইনপুট নেওয়া কনটেন্ট গ্রহণ করতে পারি।

তবে খেয়াল রাখতে হবে: `TextField` নিজে দীর্ঘ সময় ইনপুট ডেটা সংরক্ষণ করে না, এটি শুধু একটি ইনপুট কন্ট্রোল। আসলে এই ইনপুট ডেটা সংরক্ষণ করে সেই ভ্যারিয়েবল, যেটির সঙ্গে আমরা এটি bind করি।

তাই আগে আমাদের দুটি `@State` ভ্যারিয়েবল তৈরি করতে হবে, যেগুলো ব্যবহারকারীর নাম এবং পাসওয়ার্ড সংরক্ষণ করবে:

```swift
@State private var user = ""
@State private var password = ""
```

যখন `@State` ভ্যারিয়েবলের মান পরিবর্তিত হয়, SwiftUI স্বয়ংক্রিয়ভাবে সংশ্লিষ্ট ভিউ রিফ্রেশ করে।

এরপর, `TextField` ব্যবহার করে এই দুই ভ্যারিয়েবল bind করুন:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

এখানে `$user` এবং `$password` বলতে "binding" বোঝানো হয়েছে।

অর্থাৎ, ব্যবহারকারী যখন ইনপুট বক্সে লেখা টাইপ করে, ভ্যারিয়েবলের মানও একই সঙ্গে বদলায়; আর ভ্যারিয়েবলের মান বদলালে ইনপুট বক্সে দেখানো কনটেন্টও একই সঙ্গে বদলে যায়।

ভিউ এবং ডেটা "একসঙ্গে সিঙ্ক হয়ে যাওয়ার" এই সম্পর্কটিকেই binding বলা হয়।

খেয়াল করুন, এখানে `$`-সহ এই লেখাটি ব্যবহার করতে হবে:

```swift
$user
```

কারণ `TextField`-এর দরকার সাধারণ string নয়, বরং এমন একটি binding value যা "দুই দিক থেকেই ডেটা পরিবর্তন করতে পারে"।

### ইনপুট বক্স দেখানো

এগুলোকে `ContentView`-এ রাখি:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

দেখানোর ফলাফল:

![view](../../Resource/019_view3.png)

কারণ এখন `user` এবং `password` ডিফল্টভাবে দুটিই খালি string:

```swift
""
```

তাই ইনপুট বক্সে আগে placeholder লেখা দেখাবে, যেমন:

```swift
input user
```

এই লেখাটি শুধু ব্যবহারকারীকে জানায় "এখানে কী ইনপুট করা উচিত", এটি আসল ইনপুট কনটেন্ট নয়।

### ইনপুট বক্স অপ্টিমাইজ করা

এখন ইনপুট বক্স ব্যবহার করা যাচ্ছে, কিন্তু ডিফল্ট স্টাইল তুলনামূলকভাবে সহজ।

ইন্টারফেসকে আরও পরিষ্কার করতে আমরা ইনপুট বক্সের আগে একটি শিরোনাম যোগ করতে পারি, এবং ইনপুট বক্সের উপর কিছু সহজ স্টাইল অপ্টিমাইজেশন করতে পারি।

উদাহরণ হিসেবে, আগে একটি শিরোনাম যোগ করি:

```swift
Text("Username")
    .fontWeight(.bold)
```

তারপর, `HStack` ব্যবহার করে শিরোনাম ও ইনপুট বক্সকে একই লাইনে রাখুন:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

এখানে `HStack` ব্যবহার করা হয়েছে কারণ আমরা চাই "বাম দিকে শিরোনাম, ডান দিকে ইনপুট বক্স"।

খেয়াল রাখুন, `TextField` ডিফল্টভাবে বাকি খালি জায়গা দখল করে নেয়।

![color](../../Resource/019_view6.png)

দুটি ইনপুট বক্সের আকারকে আরও একরকম দেখানোর জন্য আমরা `frame(width:)` ব্যবহার করে এর প্রস্থ নির্ধারণ করতে পারি, যাতে ইনপুট বক্সগুলো আরও গোছানো দেখায়।

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

এরপর একটি বর্ডার যোগ করুন, যাতে ইনপুট বক্স আরও স্পষ্ট দেখা যায়:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

এখন আমরা ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোকেই `ContentView` ভিউতে যোগ করি:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

দেখানোর ফলাফল:

![view](../../Resource/019_view4.png)

এ পর্যন্ত ব্যবহারকারী ব্যবহারকারীর নাম ও পাসওয়ার্ড ইনপুট করতে পারবে।

## সাইন-ইন বাটন

এখন আমরা ইনপুট বক্সের নিচে একটি সাইন-ইন বাটন যোগ করব।

```swift
Button("Sign in") {

}
```

এরপর, `buttonStyle` ব্যবহার করে বাটনে আরও স্পষ্ট system style যোগ করুন:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

দেখানোর ফলাফল:

![view](../../Resource/019_view5.png)

বাটনটি সত্যিই ট্যাপের প্রতিক্রিয়া দিচ্ছে কি না নিশ্চিত করতে, আমরা আগে বাটনের ভেতরে একটি `print` লিখে পরীক্ষা করতে পারি:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

বাটনে ট্যাপ করলে, কনসোলে আউটপুট হবে:

```swift
click Sign in
```

এতে বোঝা যায় বাটনটি সফলভাবে ট্যাপের প্রতিক্রিয়া দিয়েছে।

## সাইন-ইন লজিক

এখন আমরা সাইন-ইন বাটনে সবচেয়ে মৌলিক যাচাই-লজিক যোগ করব: **ব্যবহারকারী ব্যবহারকারীর নাম এবং পাসওয়ার্ড ইনপুট করেছে কি না তা পরীক্ষা করা**।

আমরা নিচের কয়েকটি অবস্থা বাস্তবায়ন করতে চাই:

- ব্যবহারকারী কিছুই ইনপুট না করলে `Empty` আউটপুট হবে
- ব্যবহারকারী শুধু একটি ইনপুট করলে, কোনটি অনুপস্থিত তা জানানো হবে
- ব্যবহারকারীর নাম এবং পাসওয়ার্ড দুটোই ইনপুট করা থাকলে `Success` আউটপুট হবে

### কোনো তথ্য ইনপুট করা হয়নি

কারণ `user` এবং `password` ডিফল্টভাবে দুটিই খালি string:

```swift
@State private var user = ""
@State private var password = ""
```

তাই ব্যবহারকারী কিছুই ইনপুট না করলে এগুলো এখনও খালিই থাকবে।

Swift-এ `String`-এর মতো টাইপে `isEmpty` ব্যবহার করে কনটেন্ট খালি কি না বোঝা যায়।

### `isEmpty` প্রপার্টি

`isEmpty` সাধারণত string, array ইত্যাদির কনটেন্ট খালি কি না পরীক্ষা করতে ব্যবহৃত হয়।

উদাহরণ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

কনটেন্ট খালি হলে `isEmpty` `true` রিটার্ন করে; আর খালি না হলে `false` রিটার্ন করে।

তাই ব্যবহারকারীর নাম ও পাসওয়ার্ডে ইনপুট আছে কি না, তা বোঝার জন্য আমরা এটি ব্যবহার করতে পারি।

### `isEmpty` দিয়ে ভ্যারিয়েবল পরীক্ষা

যদি ব্যবহারকারী কোনো তথ্য ইনপুট না করে, তাহলে:

```swift
user.isEmpty // true
password.isEmpty    // true
```

এই সময় আমরা শর্তটি এভাবে লিখতে পারি:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

এই কোডের মানে হলো: যদি `user` খালি হয় এবং `password`-ও খালি হয়, তাহলে আউটপুট হবে:

```swift
Empty
```

এখানে `&&` হলো একটি logical operator, যার অর্থ "এবং"।

অর্থাৎ, বাম পাশের শর্ত সত্য এবং ডান পাশের শর্তও সত্য হলে তবেই পুরো শর্ত সত্য হবে।

তাই শুধু তখনই এই কোড চলবে, যখন ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোই খালি থাকবে।

## ব্যবহারকারী শুধু আংশিক পূরণ করেছে

এরপর, আমরা আরেকটি অবস্থা বিবেচনা করি: ব্যবহারকারী শুধু ব্যবহারকারীর নাম দিয়েছে, অথবা শুধু পাসওয়ার্ড দিয়েছে।

উদাহরণ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

এই সময় ব্যবহারকারীর নাম খালি নয়, কিন্তু পাসওয়ার্ড খালি।

আমরা `isEmpty` ব্যবহার করেই যাচাই চালিয়ে যেতে পারি:

### ব্যবহারকারী অ্যাকাউন্ট বা পাসওয়ার্ড পূরণ করেছে এমন অবস্থা

ব্যবহারকারী যদি শুধু ব্যবহারকারীর নাম অথবা শুধু পাসওয়ার্ড ইনপুট করে, তাহলে কোনটি অনুপস্থিত তা জানাতে হবে।

উদাহরণ হিসেবে, ব্যবহারকারী যদি শুধু ব্যবহারকারীর নাম ইনপুট করে:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

এই কোডের লজিক হলো: যদি ব্যবহারকারীর নাম খালি থাকে, তাহলে ব্যবহারকারীর নাম লিখতে বলবে। নইলে, পাসওয়ার্ড খালি কি না পরীক্ষা করবে; পাসওয়ার্ড খালি হলে পাসওয়ার্ড লিখতে বলবে।

### ব্যবহারকারী সব তথ্য পূরণ করেছে

যদি ব্যবহারকারীর নাম এবং পাসওয়ার্ড দুটোই ইনপুট করা থাকে, তাহলে এদের `isEmpty` দুটিই `false` রিটার্ন করবে।

এই সময় আমরা এভাবে লিখতে পারি:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

এখানে `!`-এর অর্থ "উল্টো" বা negation।

উদাহরণ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

অর্থাৎ, `user.isEmpty` দিয়ে বোঝা হয় "ব্যবহারকারীর নাম খালি কি না", আর `!user.isEmpty` দিয়ে বোঝা হয় "ব্যবহারকারীর নাম খালি নয়"।

পাসওয়ার্ডের ক্ষেত্রেও একই লজিক প্রযোজ্য।

তাই এই কোডের মানে হলো: ব্যবহারকারীর নাম খালি নয়, এবং পাসওয়ার্ডও খালি নয়।

যখন এই দুটি শর্তই সত্য হবে, আউটপুট হবে:

```swift
Success
```

## সম্পূর্ণ যাচাই লজিক

এখন আমরা এই তিনটি অবস্থাকে একসঙ্গে মিলিয়ে `Button`-এর মধ্যে লিখি:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

এই কোডের execution order এভাবে বোঝা যেতে পারে:

প্রথম ধাপে, আগে পরীক্ষা করা হয়:

```swift
if user.isEmpty && password.isEmpty
```

যদি ব্যবহারকারীর নাম এবং পাসওয়ার্ড দুটোই খালি হয়, তাহলে সরাসরি `Empty` আউটপুট হবে।

যদি দুটোই খালি না হয়, তাহলে নিচের এই লাইনটি পরীক্ষা করা হবে:

```swift
else if user.isEmpty || password.isEmpty
```

এখানে `||`-এর অর্থ "অথবা"।

অর্থাৎ, যেকোনো একটি শর্ত সত্য হলেই পুরো শর্ত সত্য হবে।

তাই ব্যবহারকারীর নাম খালি থাকুক বা পাসওয়ার্ড খালি থাকুক, `else if`-এর কোড ব্লক চালু হবে।

কোড ব্লকে ঢোকার পর, কোন ইনপুট বক্সটি ফাঁকা আছে তা আরও নির্দিষ্টভাবে পরীক্ষা করা হয়:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

যদি আগের দুইটি শর্তের কোনোটিই সত্য না হয়, তাহলে বোঝায় ব্যবহারকারীর নাম খালি নয়, পাসওয়ার্ডও খালি নয়।

তখন প্রোগ্রাম শেষের `else`-এ প্রবেশ করবে:

```swift
print("Success")
```

এভাবে আমরা সবচেয়ে মৌলিক সাইন-ইন ইনপুট যাচাই-লজিক সম্পন্ন করলাম।

## ব্যবহারকারীর নাম এবং পাসওয়ার্ড যাচাই

উপরের লজিক শুধু "কিছু ইনপুট করা হয়েছে কি না" তা পরীক্ষা করে।

কিন্তু বাস্তব অ্যাপে শুধু কিছু ইনপুট করলেই যথেষ্ট নয়। সাধারণত ব্যবহারকারীর নাম ও পাসওয়ার্ড সার্ভারে পাঠিয়ে যাচাই করতে হয়।

যদি সার্ভার নিশ্চিত করে যে ব্যবহারকারীর নাম আছে এবং পাসওয়ার্ড সঠিক, তাহলে সাইন-ইন অনুমোদিত হবে; না হলে সাইন-ইন ব্যর্থ হয়েছে বলে জানাবে।

এই প্রক্রিয়াটি অনুশীলনের জন্য, আমরা আগে কোডে একটি অস্থায়ী অ্যাকাউন্ট ও পাসওয়ার্ড সেট করতে পারি, যা "সঠিক সাইন-ইন তথ্য" অনুকরণ করবে:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

যখন ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোই খালি নয়, তখন আমরা তুলনা করে দেখি এগুলো সঠিক কি না:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

এখানে `==`-এর অর্থ "সমান কি না"।

উদাহরণ:

```swift
user == userID
```

এর অর্থ হলো, ব্যবহারকারী যে ব্যবহারকারীর নাম ইনপুট করেছে, তা কি আমরা সেট করা সঠিক ব্যবহারকারীর নামের সঙ্গে পুরোপুরি মিলে? পাসওয়ার্ড যাচাইও একই লজিকে হয়।

তাই, ইনপুট করা ব্যবহারকারীর নাম ও পাসওয়ার্ড যদি নির্ধারিত মানের সঙ্গে মিলে যায়, তাহলে `Success` আউটপুট হবে; যেকোনো একটি না মিললেই `Input error` আউটপুট হবে।

এভাবে আমরা একটি সহজ "মক সাইন-ইন যাচাই" সম্পন্ন করলাম।

যদিও এটি এখনো সার্ভারের সঙ্গে যুক্ত বাস্তব সাইন-ইন ফিচার নয়, তবুও এটি আমাদের বোঝার জন্য যথেষ্ট: **বাটনে ক্লিক করার পর, ভিন্ন ভিন্ন শর্ত অনুযায়ী ভিন্ন ভিন্ন কোড চালানো যায়**।

## সারসংক্ষেপ

এই পাঠে আমরা একটি মৌলিক সাইন-ইন ভিউ তৈরি করেছি, এবং বিশেষভাবে "শর্ত অনুযায়ী ইনপুট বিচার করার লজিক" শিখেছি।

এই পাঠের মূল বিষয় হলো: `isEmpty` ব্যবহার করে string খালি কি না যাচাই করা, এবং `if` statement-এর সঙ্গে logical operator মিলিয়ে ভিন্ন ভিন্ন পরিস্থিতি সামলানো।

এদের মধ্যে দুটি খুব গুরুত্বপূর্ণ logical operator হলো:

- `&&`: অর্থ "এবং", দুইটি শর্তই পূরণ হতে হবে
- `||`: অর্থ "অথবা", যেকোনো একটি শর্ত পূরণ হলেই হবে

যখন এই শর্তগুলো শেষ পর্যন্ত `true` বা `false` দেয়, তখন `if` statement ফলাফলের ভিত্তিতে ভিন্ন কোড চালায়।

এই সাইন-ইন ভিউয়ের মাধ্যমে আমরা ইতিমধ্যেই "ইন্টারফেস + ডেটা + লজিক্যাল বিচার" এই তিনটির সমন্বয়ে তৈরি ডেভেলপমেন্ট পদ্ধতির সঙ্গে পরিচিত হতে শুরু করেছি।

## সম্পূর্ণ কোড

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
