# লগইন ইন্টারঅ্যাকশন

আগের ক্লাসে আমরা একটি লগইন ভিউ তৈরি করেছি, এবং বাটন ও শর্তের লজিকের মাধ্যমে ইনপুট কনটেন্টের সহজ যাচাই করেছি।

এই ক্লাসে আমরা আগের ক্লাসের কোডকে ভিত্তি করে `SecureField` পাসওয়ার্ড ইনপুট বক্স, `Alert` সতর্কতা বক্স, এবং কীভাবে ভেরিয়েবলের ভিত্তিতে ভিন্ন ভিউ দেখাতে হয় তা শিখব।

এই ক্লাসের মাধ্যমে তুমি লগইন ভিউয়ের মৌলিক ইন্টারঅ্যাকশন ফ্লো আরও ভালোভাবে বুঝতে পারবে, আর এটি অনেক অ্যাপেই ব্যবহৃত একটি মৌলিক লজিক।

## পাসওয়ার্ড ইনপুট বক্স

গত ক্লাসে আমরা পাসওয়ার্ড ইনপুট করতে `TextField` ব্যবহার করেছি।

কিন্তু বাস্তব লগইন ইন্টারফেসে পাসওয়ার্ড সাধারণত সরাসরি দেখা যায় না, বরং ডট বা অন্য কোনো লুকানো ইফেক্ট হিসেবে দেখানো হয়, যাতে ব্যবহারকারীর গোপনীয়তা সুরক্ষিত থাকে।

SwiftUI-তে পাসওয়ার্ড ইনপুটের জন্য বিশেষভাবে ব্যবহৃত কন্ট্রোলটি হলো `SecureField`।

উদাহরণস্বরূপ:

```swift
SecureField("Password", text: $password)
```

এটির লেখার ধরন `TextField`-এর সাথে খুবই মিল, একইভাবে একটি ইঙ্গিতমূলক লেখা এবং একটি বাউন্ড ভেরিয়েবল দরকার হয়।

সহজভাবে বোঝা যায়: `SecureField`-ও একটি ইনপুট বক্স, তবে এটি ইনপুট করা কনটেন্ট লুকিয়ে রাখে।

আমরা পাসওয়ার্ড ইনপুটের জন্য আগে ব্যবহার করা `TextField`-কে সরাসরি `SecureField` দিয়ে বদলে দিতে পারি:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

যখন ব্যবহারকারী পাসওয়ার্ড ইনপুট করবে, তখন ইন্টারফেসে পাসওয়ার্ডের কনটেন্ট সরাসরি দেখা যাবে না।

দেখানোর ফলাফল:

![password](../../Resource/020_password.png)

এখন আমরা ব্যবহারকারীর নাম ও পাসওয়ার্ড ইনপুট করতে পারি, এবং বাটনে ক্লিক করার পর ইনপুট সঠিক কিনা তা যাচাই করতে পারি।

### প্রতিক্রিয়া বার্তা দেখানো

এর আগে আমরা সবসময় ফলাফল আউটপুট করতে `print` ব্যবহার করেছি।

`print`-এর কনটেন্ট শুধু কনসোলে দেখা যায়; ডেভেলপার Xcode-এ প্রোগ্রাম চালানোর সময় এটি দেখতে পারে, কিন্তু সাধারণ ব্যবহারকারী ফোনে এই বার্তাগুলো দেখতে পায় না।

অর্থাৎ, প্রোগ্রাম যাচাই সম্পন্ন করলেও ব্যবহারকারী জানে না যে ইনপুট করা কনটেন্ট সঠিক কিনা।

এই সময় আমাদের এমন একটি উপায় দরকার, যা সরাসরি ইন্টারফেসে বার্তা দেখাতে পারে।

## Alert সতর্কতা বক্স

SwiftUI-তে আমরা `Alert` ব্যবহার করে একটি পপ-আপ বার্তা বক্স দেখাতে পারি।

মৌলিক ব্যবহার:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

এই কোডটি আগের কন্ট্রোলগুলোর চেয়ে একটু জটিল দেখাতে পারে, কিন্তু আমরা এটিকে ভেঙে বুঝতে পারি।

`Alert` মূলত নিচের কয়েকটি অংশ নিয়ে গঠিত:

- `"Title"`: সতর্কতা বক্সের শিরোনাম
- `isPresented`: একটি বাউন্ড বুলিয়ান মান, যা সতর্কতা বক্স দেখানো হবে কিনা তা নিয়ন্ত্রণ করে
- `Button(...)`: সতর্কতা বক্সের বাটন
- `message:`: সতর্কতা বক্সে দেখানো বার্তার কনটেন্ট

সহজভাবে বোঝা যায়, যখন বাউন্ড ভেরিয়েবলের মান `true` হয়, তখন সিস্টেম এই বার্তা বক্সটি দেখাবে।

দেখানোর ফলাফল:

![alert](../../Resource/020_alert3.png)

সংশ্লিষ্ট গঠন:

![alert](../../Resource/020_alert.png)

### Alert একটি modifier

আগে শেখা অনেক modifier-এর মতো, `Alert`-ও কোনো একটি ভিউয়ের পরে যোগ করা হয়।

উদাহরণস্বরূপ, এটি বাটনের পরে যোগ করা যেতে পারে:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

আবার এটি বাইরের `VStack`-এর পরেও যোগ করা যেতে পারে:

```swift
VStack {
    // ...
}
.alert() {...}
```

অর্থাৎ, `Alert` ইন্টারফেসে আলাদা করে রাখা কোনো স্বতন্ত্র ভিউ নয়; এটি কোনো নির্দিষ্ট ভিউয়ের সাথে যুক্ত একটি modifier।

সহজভাবে বোঝা যায়, `Alert` সাধারণত বাটন বা বাইরের layout-এর পরে লেখা হয়, যাতে নির্দিষ্ট শর্ত পূরণ হলে এটি একটি বার্তা দেখাতে পারে।

### Alert দেখানো

যদি `Alert` দেখাতে চাই, তাহলে সেটি নিয়ন্ত্রণ করার জন্য একটি ভেরিয়েবল দরকার হবে।

উদাহরণস্বরূপ:

```swift
@State private var showAlert = false
```

এই ভেরিয়েবলটি `Bool` টাইপের, অর্থাৎ এর মাত্র দুটি মান থাকতে পারে: `true` বা `false`।

এরপর এটিকে `Alert`-এর `isPresented`-এর সাথে bind করতে হবে:

```swift
isPresented: $showAlert
```

যখন `showAlert` হবে `false`, তখন সতর্কতা বক্স দেখা যাবে না; আর যখন `showAlert` হবে `true`, তখন সতর্কতা বক্স পপ-আপ হবে।

### বাটনের মাধ্যমে সতর্কতা বক্স দেখানো

এখন আগে একটি সবচেয়ে সহজ পরিস্থিতি বাস্তবায়ন করি:

যখন ব্যবহারকারী কিছুই ইনপুট না করে সরাসরি `Sign in` বাটনে ক্লিক করবে, তখন একটি বার্তা বক্স দেখিয়ে তাকে বলা হবে, “তুমি এখনও কোনো কনটেন্ট ইনপুট করনি”।

প্রথমে, এই বার্তা বক্স নিয়ন্ত্রণের জন্য একটি ভেরিয়েবল তৈরি করো:

```swift
@State private var showEmpty = false
```

তারপর `Button`-এর পরে একটি `Alert` যোগ করো:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

এরপর বাটনে ক্লিকের কোডে শর্ত যাচাই করো:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

যদি `user` এবং `password` দুটোই খালি থাকে, তাহলে আমরা `showEmpty`-কে `true` করে দেব।

আর `Alert` এই ভেরিয়েবলের সাথে bind করা আছে, তাই এটি `true` হলে সিস্টেম স্বয়ংক্রিয়ভাবে বার্তা বক্স দেখাবে।

দেখানোর ফলাফল:

![alert](../../Resource/020_alert1.png)

এভাবে ব্যবহারকারী বাটনে ক্লিক করার পর সঙ্গে সঙ্গে বার্তাটি দেখতে পারবে, এবং ডেভেলপারকে `print` আউটপুট দেখতে কনসোলে যেতে হবে না।

### বাটন ও সতর্কতা বক্স উন্নত করা

এর আগে আমরা শুধু “কিছুই লেখা হয়নি” এই পরিস্থিতি সামলেছি।

আমাদের আরও নিচের কয়েকটি অবস্থা সামলাতে হবে:

- ব্যবহারকারীর নাম লেখা হয়নি
- পাসওয়ার্ড লেখা হয়নি
- ব্যবহারকারীর নাম ও পাসওয়ার্ড লেখা হয়েছে, কিন্তু ইনপুট ভুল

তাই এই অবস্থাগুলোর জন্যও আমাদের উপযুক্ত বার্তা প্রস্তুত করতে হবে।

প্রথমে, আরও তিনটি ভেরিয়েবল যোগ করি:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

তারপর বাটনের পরে সংশ্লিষ্ট `Alert`-গুলো যোগ করতে থাকো:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

এরপর বাটনের ভেতরের যাচাই লজিকটি সম্পূর্ণ করো:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

যখন বাটনের শর্তে দেখা যাবে যে ব্যবহারকারী কোনো তথ্যই দেয়নি, একটি তথ্য বাদ দিয়েছে, বা ইনপুট যাচাই ব্যর্থ হয়েছে, তখন সংশ্লিষ্ট বুলিয়ান ভেরিয়েবল `true` হয়ে যাবে, তারপর উপযুক্ত `Alert` দেখানো হবে।

এখানে আমি তোমাকে কয়েকটি অবস্থা নিজে পরীক্ষা করতে বলব:

- কিছুই লিখবে না
- শুধু ব্যবহারকারীর নাম লিখবে
- শুধু পাসওয়ার্ড লিখবে
- ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোই লিখবে, কিন্তু কনটেন্ট ভুল হবে
- ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোই লিখবে, এবং কনটেন্ট সঠিক হবে

এর মাধ্যমে আমরা যাচাই করতে পারি যে আমাদের কোডে কোনো সমস্যা আছে কিনা; এটি অ্যাপ ডেভেলপমেন্টে খুবই গুরুত্বপূর্ণ একটি “testing” ধাপ।

যদি কোনো পরিস্থিতিতে প্রোগ্রামের আচরণ ঠিক না হয়, তাহলে বোঝা যাবে লজিকে সমস্যা থাকতে পারে এবং প্রোগ্রামে `Bug` দেখা দিয়েছে।

ডেভেলপমেন্টে যাকে `Bug` বলা হয়, সেটি হলো প্রোগ্রামের ত্রুটি, ফাঁক, বা প্রত্যাশার সাথে না মেলা আচরণ।

## লগইন ভিউ সম্পূর্ণ করা

আগে যেসব `Alert` বলা হয়েছে, সেগুলো সবই “ইনপুট ভুল” হলে কীভাবে ব্যবহারকারীকে বার্তা দিতে হয় তা নিয়ে।

যখন ব্যবহারকারী সঠিক ব্যবহারকারীর নাম ও পাসওয়ার্ড ইনপুট করে, তখন আমরা সাধারণত “সতর্কতা বক্স” দেখাই না; বরং সরাসরি লগইনের পরের ইন্টারফেসে চলে যাই।

এখানে একটি খুব গুরুত্বপূর্ণ ধারণা আছে: **ভেরিয়েবলের মান অনুযায়ী ভিন্ন ভিউ দেখানো।**

উদাহরণস্বরূপ:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

এখানে আমরা ভিউ দেখানো নিয়ন্ত্রণ করতে `Bool` টাইপ ব্যবহার করছি:

- যদি `login` হয় `true`, তাহলে বোঝায় লগইন সফল হয়েছে এবং লগইনের পরের কনটেন্ট দেখানো হবে
- যদি `login` হয় `false`, তাহলে বোঝায় লগইন সফল হয়নি, এবং লগইন ইন্টারফেস দেখানো চলতে থাকবে।

যদিও `if` স্টেটমেন্ট Swift-এর একটি শর্তমূলক স্টেটমেন্ট, SwiftUI-এর `body`-এর মধ্যে এটি ভিউ দেখানোর লজিক নিয়ন্ত্রণে ব্যবহার করা যায়।

অর্থাৎ, শর্তের ফলাফলের ভিত্তিতে SwiftUI ঠিক করবে এখন কোন ভিউটি দেখানো উচিত।

আমরা এই দেখানোর লজিকটি বর্তমান `ContentView`-এর মধ্যে রাখতে পারি:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

এখানে আমরা নতুন একটি `login` ভেরিয়েবল যোগ করেছি, যা ব্যবহারকারী সফলভাবে লগইন করেছে কিনা তা বোঝাতে ব্যবহৃত হয়।

তারপর আগে লেখা লগইন ভিউয়ের কোডটি `else`-এর পরে রেখেছি।

ভিউ দেখানোর লজিক:

- যখন `login` হবে `false`, তখন বোঝায় এখনও লগইন সফল হয়নি, তাই আগের লগইন ভিউ-ই দেখানো হবে।
- যখন `login` হবে `true`, তখন বোঝায় লগইন সফল হয়েছে; তখন লগইন ভিউ আর দেখানো হবে না, বরং `Login successful` দেখানো হবে।

অর্থাৎ, `ContentView` `login`-এর মান অনুযায়ী ভিন্ন ভিন্ন ভিউ কনটেন্ট দেখাবে।

এরপর আমরা বাটনের ভেতরে লগইন সফল হওয়ার লজিকটি সংশোধন করি:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

যখন ব্যবহারকারীর ইনপুট করা ব্যবহারকারীর নাম ও পাসওয়ার্ড দুটোই সঠিক হবে, তখন আমরা `login`-কে `true` করে দেব।

একবার `login`-এর মান বদলে গেলে, `ContentView`-এর `if` শর্তের ফলাফলও বদলে যাবে, আর ইন্টারফেস আগের লগইন ভিউ থেকে `Login successful`-এ বদলে যাবে।

দেখানোর ফলাফল নিচের মতো:

![view](../../Resource/020_view.png)

এখন আমরা “শর্ত অনুযায়ী ভিন্ন ভিউ দেখানো” এই জ্ঞানটি সত্যিই বর্তমান লগইন পেজে ব্যবহার করেছি।

বাস্তব অ্যাপেও সাধারণত এভাবেই বিচার করা হয়, অর্থাৎ কোনো একটি মানের ভিত্তিতে ভিন্ন ভিউ দেখানো হয়।

উদাহরণস্বরূপ, ব্যবহারকারী লগইন না করলে লগইন পেজ দেখানো হয়; লগইন সফল হলে অন্য একটি ইন্টারফেস দেখানো হয়।

মূল ধারণা হলো: **ভেরিয়েবলের পরিবর্তনের মাধ্যমে ইন্টারফেসে কী কনটেন্ট দেখানো হবে তা নিয়ন্ত্রণ করা।**

## সারসংক্ষেপ

এই ক্লাসে আমরা তিনটি গুরুত্বপূর্ণ বিষয় শিখেছি:

1. পাসওয়ার্ড ইনপুট করতে `SecureField` ব্যবহার করা, যাতে পাসওয়ার্ডের কনটেন্ট সরাসরি ইন্টারফেসে দেখা না যায়।
2. ব্যবহারকারীকে বার্তা দেখাতে `Alert` ব্যবহার করা, শুধু কনসোলে আউটপুট দেখানোর বদলে।
3. ভেরিয়েবল ও `if` শর্ত ব্যবহার করে ভিন্ন ভিউ দেখানো নিয়ন্ত্রণ করা, এবং লগইনের আগে ও পরে ইন্টারফেস বদলানো।

এই জ্ঞানগুলোর মাধ্যমে আমরা এখন একটি মৌলিক ইন্টারঅ্যাকশন-সমৃদ্ধ লগইন ভিউ সম্পূর্ণ করতে পারি, এবং SwiftUI-তে “স্টেট পরিবর্তিত হলে ইন্টারফেস আপডেট হয়” এই ডেভেলপমেন্ট ধারণাটিও আরও ভালোভাবে বুঝতে পারি।

## সম্পূর্ণ কোড

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## অতিরিক্ত জ্ঞান - একাধিক বাটনসহ Alert

আগের এই ক্লাসে আমরা সবচেয়ে মৌলিক `Alert` ব্যবহার করেছি, যেখানে শুধু একটি বাটন ছিল এবং মূলত ব্যবহারকারীকে বার্তা দেওয়ার জন্য এটি ব্যবহৃত হয়েছে।

আসলে `Alert`-এ একাধিক বাটনও থাকতে পারে, যাতে ব্যবহারকারী বিভিন্ন সিদ্ধান্ত নিতে পারে।

উদাহরণস্বরূপ:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

বাটনে ক্লিক করার পর তিনটি অপশনসহ একটি বার্তা বক্স দেখানো হবে: `Ok`, `delete` এবং `cancel`।

দেখানোর ফলাফল:

![alert](../../Resource/020_alert2.png)

ভিন্ন বাটনে ক্লিক করলে সংশ্লিষ্ট কোড কার্যকর হবে।

### Button-এর role প্রপার্টি

এখানে তুমি লক্ষ্য করবে, `Alert`-এর ভেতরের `Button` আগের শেখা সাধারণ বাটনের লেখার ধরন থেকে একটু আলাদা:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

এখানে অতিরিক্ত একটি `role` প্যারামিটার রয়েছে।

SwiftUI-তে `role` ব্যবহার করে সিস্টেমকে জানানো হয়: এই বাটনটি কোন ধরনের কাজের জন্য।

সাধারণ কয়েকটি role হলো:

- `.cancel`: বাতিল করার কাজ
- `.destructive`: ঝুঁকিপূর্ণ কাজ, যেমন ডিলিট
- `nil`: সাধারণ কাজ

ভিন্ন `role` অনুযায়ী ইন্টারফেসে স্টাইলও সাধারণত আলাদা হয়।

উদাহরণস্বরূপ, ঝুঁকিপূর্ণ কাজগুলো প্রায়ই আরও চোখে পড়ার মতো স্টাইলে দেখানো হয়, যাতে ব্যবহারকারী সতর্ক হয়ে ক্লিক করে।

এছাড়া `role` বাটনের জন্য অতিরিক্ত অর্থবহ তথ্যও দেয়, যা স্ক্রিন রিডারকে (যেমন Apple ডিভাইসের VoiceOver) ব্যবহারকারীকে বাটনের কাজ বোঝাতে সাহায্য করে।

তাই উপযুক্ত পরিস্থিতিতে বাটনে `role` যোগ করা একটি খুব ভালো অভ্যাস।
