# প্রাণী বিশ্বকোষ

এই পাঠে আমরা কাস্টম ভিউ এবং ডেটা পাস করার অনুশীলন চালিয়ে যাব।

আমরা একটি সহজ প্রাণী বিশ্বকোষ ভিউ তৈরি করব। পেজে পাঁচটি প্রাণী দেখানো হবে। কোনো প্রাণীতে ট্যাপ করলে একটি বিস্তারিত ভিউ প্রদর্শিত হবে, যেখানে সেই প্রাণীর ছবি, বিস্তৃতি অঞ্চল, আবাসস্থল এবং বিবরণ দেখানো হবে।

চূড়ান্ত ফলাফল:

![view](../../../Resource/029_view.png)

এই উদাহরণের মাধ্যমে আমরা ডেটা স্ট্রাকচার, তালিকা প্রদর্শন, ট্যাপ ইন্টারঅ্যাকশন এবং Sheet পপ-আপ ভিউ কীভাবে একসঙ্গে কাজ করে তা অনুশীলন করতে পারি।

## ছবির রিসোর্স প্রস্তুত করুন

প্রথমে আমাদের পাঁচটি প্রাণীর ছবি প্রস্তুত করতে হবে:

- ডলফিন: `dolphin.jpg`
- জিরাফ: `giraffe.jpg`
- সিংহ: `lion.jpg`
- পান্ডা: `panda.jpg`
- মেরু ভালুক: `polarBear.jpg`

নিচের ছবির রিসোর্সগুলো ব্যবহার করতে পারেন:

[ডলফিন](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [জিরাফ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [সিংহ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [পান্ডা](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [মেরু ভালুক](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ছবি ডাউনলোড করার পরে, সেগুলো Xcode প্রজেক্টের `Assets` রিসোর্স ফোল্ডারে টেনে আনুন।

![assets](../../../Resource/029_assets.png)

মনে রাখতে হবে, কোডে ছবি ব্যবহার করার সময় সাধারণত `.jpg` এক্সটেনশন লেখার দরকার হয় না।

উদাহরণস্বরূপ, ছবির রিসোর্সের নাম যদি `dolphin` হয়, তাহলে কোডে এভাবে লিখুন:

```swift
Image("dolphin")
```

ছবির নাম ভুল লিখলে ছবি ঠিকভাবে প্রদর্শিত হবে না।

নোট: উপরের ছবির রিসোর্সগুলো Wikimedia প্রকল্প থেকে এসেছে। ব্যবহার করার সময় মূল ছবির লিংক এবং উৎসের তথ্য রেখে দেওয়া ভালো।

## প্রাণী স্ট্রাকচার তৈরি করুন

এই পেজে প্রতিটি প্রাণীর একাধিক তথ্য থাকে:

- প্রাণীর নাম
- প্রাণীর ছবি
- প্রাণীর ইমোজি
- বিস্তৃতি অঞ্চল
- আবাসস্থল
- প্রাণীর বিবরণ

যদি আমরা এসব তথ্য অনেকগুলো আলাদা ভেরিয়েবলে ছড়িয়ে রাখি, কোড তুলনামূলকভাবে বিশৃঙ্খল হয়ে যাবে। তাই আমরা একটি `Animal` স্ট্রাকচার তৈরি করতে পারি এবং একটি প্রাণীর তথ্য একসঙ্গে রাখতে পারি।

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

এই কোডে:

- `id`: প্রাণীর অনন্য পরিচয়।
- `name`: প্রাণীর নাম।
- `imageName`: প্রাণীর ছবির নাম।
- `avatarEmoji`: প্রাণীর ইমোজি।
- `distributionArea`: বিস্তৃতি অঞ্চল।
- `habitat`: আবাসস্থল।
- `animalDescription`: প্রাণীর বিবরণ।

এর মধ্যে:

```swift
let id = UUID()
```

`id` প্রতিটি প্রাণীকে শনাক্ত করতে ব্যবহার করা হয়। পরে আমরা `ForEach` ব্যবহার করে প্রাণীর তালিকা দেখাব এবং `.sheet(item:)` ব্যবহার করে নির্বাচিত প্রাণীর ভিত্তিতে বিস্তারিত দেখাব, তাই `Animal`-কে `Identifiable` প্রোটোকল অনুসরণ করতে হবে।

`Identifiable`-এর ভূমিকা হলো SwiftUI-কে বলা: প্রতিটি প্রাণীর এমন একটি `id` আছে, যা দিয়ে তার পরিচয় আলাদা করা যায়।

## প্রাণীর ডেটা তৈরি করুন

এরপর আমরা `ContentView`-এর মধ্যে একটি প্রাণীর অ্যারে তৈরি করি।

অ্যারেটিতে পাঁচটি `Animal` সংরক্ষিত থাকে, এবং প্রতিটি `Animal` একটি প্রাণীকে বোঝায়।

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ডলফিন
        Animal(
            name: "ডলফিন",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "বিশ্বজুড়ে উষ্ণ ও নাতিশীতোষ্ণ সমুদ্র।",
            habitat: "সমুদ্র, উপকূলীয় জলভাগ এবং কিছু বড় নদী।",
            animalDescription: "ডলফিন বুদ্ধিমান সামুদ্রিক স্তন্যপায়ী প্রাণী। তারা দলে বাস করে, শব্দের মাধ্যমে যোগাযোগ করে এবং তাদের খেলাধুলাপূর্ণ আচরণের জন্য পরিচিত।"
        ),
        // জিরাফ
        Animal(
            name: "জিরাফ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "আফ্রিকার সাভানা এবং খোলা বনভূমি।",
            habitat: "তৃণভূমি, সাভানা এবং খোলা বন।",
            animalDescription: "জিরাফ স্থলভাগের সবচেয়ে লম্বা প্রাণী। তাদের লম্বা গলা ও লম্বা পা আছে, এবং তারা সাধারণত উঁচু গাছের পাতা খায়।"
        ),
        // সিংহ
        Animal(
            name: "সিংহ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "প্রধানত সাহারা মরুভূমির দক্ষিণের আফ্রিকায় পাওয়া যায়, আর পশ্চিম ভারতে একটি ছোট জনসংখ্যা আছে।",
            habitat: "তৃণভূমি, সাভানা এবং খোলা বনভূমি।",
            animalDescription: "সিংহ শক্তিশালী বড় বিড়ালজাতীয় প্রাণী। তারা সাধারণত প্রাইড নামে পরিচিত দলে বাস করে এবং প্রায়ই প্রাণীজগতের রাজা হিসেবে পরিচিত।"
        ),
        // পান্ডা
        Animal(
            name: "পান্ডা",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "মধ্য চীনের পাহাড়ি বন।",
            habitat: "শীতল ও আর্দ্র পাহাড়ি অঞ্চলের বাঁশবন।",
            animalDescription: "পান্ডা তাদের সাদা-কালো লোমের জন্য পরিচিত ভালুক। তারা প্রধানত বাঁশ খায় এবং বিশ্বের সবচেয়ে সহজে চিনে নেওয়া যায় এমন প্রাণীদের একটি।"
        ),
        // মেরু ভালুক
        Animal(
            name: "মেরু ভালুক",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "উত্তর মেরুর চারপাশের আর্কটিক অঞ্চল।",
            habitat: "সমুদ্রের বরফ, উপকূলীয় এলাকা এবং ঠান্ডা আর্কটিক পরিবেশ।",
            animalDescription: "মেরু ভালুক ঠান্ডা পরিবেশের সঙ্গে মানিয়ে নেওয়া বড় ভালুক। তারা দক্ষ সাঁতারু এবং সিল শিকারের জন্য প্রধানত সমুদ্রের বরফের ওপর নির্ভর করে।"
        )
    ]

    var body: some View {
        Text("প্রাণী বিশ্বকোষ")
    }
}
```

এখানে `animals` একটি অ্যারে:

```swift
let animals: [Animal]
```

`[Animal]` মানে এই অ্যারেতে একাধিক `Animal` মান সংরক্ষিত আছে।

অন্যভাবে বললে, `animals` একটি প্রাণী নয়, বরং প্রাণীদের একটি দল।

## প্রাণীর তালিকা দেখান

এখন আমরা `ForEach` ব্যবহার করে প্রাণীর তালিকা দেখাতে পারি।

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/029_view1.png)

এই কোডে:

```swift
ForEach(animals) { animal in
    ...
}
```

এর অর্থ হলো `animals` অ্যারেটি পর্যায়ক্রমে ঘোরা।

প্রতিটি লুপে `animal` বর্তমানে প্রদর্শিত প্রাণীকে বোঝায়।

উদাহরণস্বরূপ, প্রথম লুপে `animal` হলো ডলফিন; দ্বিতীয় লুপে `animal` হলো জিরাফ।

তাই আমরা নিচের উপায়ে বর্তমান প্রাণীর তথ্য দেখাতে পারি:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

এভাবে পাঁচটি প্রাণী দেখানো যায়।

## প্রাণীর তালিকাকে ট্যাপযোগ্য করুন

এখন তালিকাটি দেখানো হয়েছে, কিন্তু এখনো ট্যাপ করা যায় না।

যদি আমরা কোনো প্রাণীতে ট্যাপ করার পরে বিস্তারিত দেখাতে চাই, তাহলে আগে “বর্তমানে নির্বাচিত প্রাণী” রেকর্ড করতে হবে।

তাই `ContentView`-এ একটি স্টেট ভেরিয়েবল যোগ করুন:

```swift
@State private var selectedAnimal: Animal? = nil
```

এখানে `selectedAnimal` হলো `Animal?` টাইপের একটি optional value।

এর অর্থ, এতে একটি প্রাণী থাকতে পারে, আবার কোনো প্রাণী নাও থাকতে পারে।

ডিফল্ট মান হলো `nil`, যার অর্থ শুরুতে কোনো প্রাণী নির্বাচিত নেই।

এরপর আমরা প্রতিটি প্রাণীর সারিকে `Button`-এ পরিবর্তন করি:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

মূল লাইনটি হলো:

```swift
selectedAnimal = animal
```

ব্যবহারকারী যখন কোনো প্রাণীতে ট্যাপ করেন, আমরা সেই প্রাণীটি `selectedAnimal`-এ সংরক্ষণ করি।

উদাহরণস্বরূপ, ব্যবহারকারী ডলফিনে ট্যাপ করলে `selectedAnimal` ডলফিন সংরক্ষণ করে।

ব্যবহারকারী পান্ডায় ট্যাপ করলে `selectedAnimal` পান্ডা সংরক্ষণ করে।

অন্যভাবে বললে, `selectedAnimal` ব্যবহারকারী সদ্য কোন প্রাণীতে ট্যাপ করেছেন তা রেকর্ড করে।

## Sheet ভিউ প্রদর্শন করুন

এখন আমরা বোতামের মাধ্যমে “বর্তমানে ট্যাপ করা প্রাণী” রেকর্ড করতে পারি।

এরপর প্রাণীর বিস্তারিত দেখানোর জন্য একটি প্রদর্শিত ভিউ তৈরি করতে হবে।

![view](../../../Resource/029_view2.png)

SwiftUI-তে এই ধরনের প্রদর্শন প্রভাব তৈরি করতে `Sheet` ব্যবহার করা যায়।

`Sheet`-কে একটি অস্থায়ীভাবে প্রদর্শিত পেজ হিসেবে বোঝা যায়। এটি বর্তমান পেজের উপরে দেখা যায়, এবং ব্যবহারকারী বিষয়বস্তু দেখার পর নিচে সোয়াইপ করে এটি বন্ধ করতে পারেন।

## Sheet উদাহরণ

প্রাণীর বিস্তারিত দেখানোর আগে, আমরা একটি সহজ উদাহরণের মাধ্যমে বুঝব `Sheet` কীভাবে প্রদর্শিত হয়।

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet দেখান")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet ভিউ")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/029_view3.png)

এই কোডে আমরা একটি Boolean মান তৈরি করেছি:

```swift
@State private var showSheet = false
```

`showSheet` ডিফল্টভাবে `false`, যার অর্থ শুরুতে `Sheet` প্রদর্শিত হয় না।

বোতামে ট্যাপ করা হলে:

```swift
showSheet.toggle()
```

`toggle()` মানে Boolean মানটি বদলে দেওয়া।

আগে যদি `false` থাকে, `toggle()` কল করার পরে সেটি `true` হয়ে যায়।

আগে যদি `true` থাকে, `toggle()` কল করার পরে সেটি `false` হয়ে যায়।

তাই বোতামে ট্যাপ করার পরে `showSheet` `false` থেকে `true`-তে পরিবর্তিত হয়।

যখন `showSheet` `true` হয়ে যায়, তখন নিচের কোড `Sheet` প্রদর্শন করে:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ভিউ")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

এই কোডের অর্থ: যখন `showSheet` `true` হয়, তখন একটি `Sheet` প্রদর্শন করা হবে এবং `Sheet`-এর মধ্যে `Text("Sheet ভিউ")` দেখানো হবে।

প্রদর্শনের ফলাফল:

![view](../../../Resource/029_view4.png)

এই ধরনের লেখা স্থির বিষয়বস্তু প্রদর্শনের জন্য উপযোগী।

উদাহরণস্বরূপ, বোতামে ট্যাপ করার পরে সেটিংস পেজ, নির্দেশনা পেজ,প্রম্পট পেজ ইত্যাদি প্রদর্শন করা যায়।

### Sheet কোথায় বসাবেন

যদিও `Sheet` একটি প্রদর্শিত ভিউ, SwiftUI-তে এটি `Text()` বা `Image()`-এর মতো সরাসরি একটি স্বাধীন ভিউ হিসেবে লেখা হয় না। বরং এটি একটি view modifier হিসেবে ব্যবহৃত হয়।

অর্থাৎ, `.sheet(...)` `.font()`, `.padding()` এবং `.shadow()`-এর মতো modifier-এর অনুরূপ। এটিকে কোনো ভিউয়ের পরে যুক্ত করতে হয়।

উদাহরণস্বরূপ:

```swift
Button("Sheet দেখান") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ভিউ")
}
```

এই উদাহরণে `.sheet` `Button`-এর পরে যুক্ত করা হয়েছে।

যখন `showSheet` `true` হয়, SwiftUI `Sheet` প্রদর্শন করে এবং ব্রেসের ভেতরের বিষয়বস্তু দেখায়:

```swift
Text("Sheet ভিউ")
```

তবে বাস্তব ডেভেলপমেন্টে, যদি একটি পেজে একাধিক বোতাম থাকে, সাধারণত প্রতিটি বোতামে আলাদা `.sheet` যোগ করা হয় না।

আরও প্রচলিত পদ্ধতি হলো বাইরের ভিউয়ের পরে `.sheet` যুক্ত করা।

উদাহরণস্বরূপ:

```swift
VStack {
    Button("Sheet দেখান") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ভিউ")
}
```

বোতাম `showSheet` পরিবর্তন করার দায়িত্ব নেয়, আর বাইরের ভিউ `showSheet` `true` কি না তার ভিত্তিতে `Sheet` প্রদর্শনের দায়িত্ব নেয়।

## Optional মানের সঙ্গে Sheet বাঁধুন

আগে আমরা যে লেখার ধরন শিখেছি তা ছিল:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ভিউ")
}
```

এই ধরনটি একটি স্থির পেজের প্রদর্শন ও লুকানো নিয়ন্ত্রণের জন্য উপযোগী।

কিন্তু প্রাণী বিশ্বকোষের উদাহরণে আমাদের শুধু “`Sheet` প্রদর্শন করা হবে কি না” জানা যথেষ্ট নয়, বরং “কোন প্রাণীতে ট্যাপ করা হয়েছে” সেটাও জানতে হবে।

উদাহরণস্বরূপ:

ব্যবহারকারী ডলফিনে ট্যাপ করলে `Sheet`-এ ডলফিনের বিস্তারিত দেখানো উচিত।

ব্যবহারকারী পান্ডায় ট্যাপ করলে `Sheet`-এ পান্ডার বিস্তারিত দেখানো উচিত।

তাই এখানে আরেক ধরনের Sheet লেখা বেশি উপযোগী:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet-এ প্রদর্শিত বিষয়বস্তু
}
```

এই কোডে `Sheet` একটি optional value `selectedAnimal`-এর সঙ্গে বাঁধা আছে।

খেয়াল করুন, `item:`-এর পরে আমরা `$selectedAnimal` লিখি, `selectedAnimal` নয়।

কারণ `Sheet` শুধু `selectedAnimal`-এর মান পড়ে না; তার পরিবর্তনের ভিত্তিতে প্রদর্শন করবে কি না সেটিও নির্ধারণ করতে হয়।

এই কোডটি এভাবে বোঝা যায়:

- যখন `selectedAnimal` `nil`, তখন `Sheet` প্রদর্শিত হয় না।
- যখন `selectedAnimal`-এর মান থাকে, তখন `Sheet` প্রদর্শিত হয়।
- যখন `Sheet` বন্ধ করা হয়, SwiftUI `selectedAnimal`-কে আবার `nil` করে দেয়।

SwiftUI `selectedAnimal`-এ সংরক্ষিত প্রাণীটিকে ব্রেসের ভেতরের `animal`-এ পাঠিয়ে দেয়।

অন্যভাবে বললে, `.sheet(item:)` শুধু প্রদর্শন নিয়ন্ত্রণ করে না, নির্বাচিত ডেটাটিও `Sheet`-এর মধ্যে পাঠায়।

## Sheet ব্যবহার করে প্রাণীর নাম দেখান

এখন আমরা তাড়াহুড়ো করে জটিল বিস্তারিত ভিউ তৈরি করব না।

কোডটি সহজে বোঝার জন্য আগে `Sheet`-এর মধ্যে বর্তমান প্রাণীর নাম দেখাই।

`VStack`-এর বাইরে `.sheet(item:)` যোগ করুন:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

এখানে সবচেয়ে গুরুত্বপূর্ণ অংশ হলো এই কোড:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

যখন `selectedAnimal`-এর মান থাকে, `Sheet` প্রদর্শিত হয়।

ব্রেসের ভেতরের `animal` হলো বর্তমানে নির্বাচিত প্রাণী।

তাই:

```swift
Text(animal.name)
```

এটি বর্তমানে ট্যাপ করা প্রাণীর নাম দেখায়।

উদাহরণস্বরূপ, `ডলফিন`-এ ট্যাপ করলে Sheet-এ `ডলফিন` দেখায়।

`পান্ডা`-তে ট্যাপ করলে `Sheet`-এ `পান্ডা` দেখায়।

এভাবে আমরা ভিন্ন প্রাণীতে ট্যাপ করে ভিন্ন প্রাণীর নাম প্রদর্শনের প্রভাব বাস্তবায়ন করেছি।

প্রাণীর নাম প্রদর্শন:

![view](../../../Resource/029_view5.png)

তবে প্রাণীর বিস্তারিত শুধু একটি নাম দেখানো উচিত নয়। এতে নাম, বিস্তৃতি অঞ্চল, আবাসস্থল এবং বিবরণও দেখানো উচিত।

যদি আমরা এই সব কোড `.sheet`-এর ভেতরে লিখি, কোড খুব দীর্ঘ হয়ে যাবে এবং পড়তে অসুবিধা হবে।

তাই এরপর আমরা একটি নতুন কাস্টম ভিউ তৈরি করব, যা শুধু প্রাণীর বিস্তারিত প্রদর্শনের দায়িত্ব নেবে।

## প্রাণীর বিস্তারিত ভিউ তৈরি করুন

এরপর আমরা `AnimalDetailView` নামে একটি নতুন কাস্টম ভিউ তৈরি করি।

এই ভিউ একটি `Animal` গ্রহণ করে এবং প্রাণীর বিস্তারিত দেখায়।

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**বিস্তৃতি অঞ্চল**: \(animal.distributionArea)")

                    Divider()

                    Text("**আবাসস্থল**: \(animal.habitat)")

                    Divider()

                    Text("**প্রাণীর বিবরণ**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

প্রদর্শনের ফলাফল:

![view](../../../Resource/029_view2.png)

এখানে মূল বিষয় হলো:

```swift
var animal: Animal
```

এর অর্থ `AnimalDetailView`-কে বাইরে থেকে একটি প্রাণী গ্রহণ করতে হবে।

প্রাণীটি গ্রহণ করার পরে বিস্তারিত ভিউ সেই প্রাণীর বিভিন্ন তথ্য ব্যবহার করতে পারে:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

অন্যভাবে বললে, `AnimalDetailView` শুধু এতে পাঠানো প্রাণীটি প্রদর্শনের দায়িত্ব নেয়।

### Markdown গাঢ় লেখা

বিস্তারিত ভিউতে আমরা এরকম কোড লিখেছি:

```swift
Text("**আবাসস্থল:** \(animal.habitat)")
```

এখানে বোঝার জন্য দুটি বিষয় আছে।

প্রথমত, `**আবাসস্থল:**` `Markdown` সিনট্যাক্স ব্যবহার করে। দুইটি তারকার মধ্যে থাকা লেখা গাঢ় হিসেবে প্রদর্শিত হবে।

দ্বিতীয়ত, `\()` হলো string interpolation, যা লেখার মধ্যে ভেরিয়েবলের মান প্রদর্শন করতে পারে।

এই কোড আগে গাঢ় `আবাসস্থল:` দেখায়, তারপর প্রাণীর আবাসস্থল দেখায়।

## Sheet-এ বিস্তারিত ভিউ দেখান

`AnimalDetailView` তৈরি করার পরে আমরা `ContentView`-এ ফিরে যেতে পারি এবং `Sheet`-এর আগের নাম ভিউটি বিস্তারিত ভিউ দিয়ে বদলে দিতে পারি।

আগে ছিল:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

এখন এটিকে বদলে লিখুন:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

এখানে `animal:` হলো `AnimalDetailView`-এর প্যারামিটার নাম।

এর পরের `animal` হলো `.sheet(item:)` থেকে পাঠানো বর্তমান প্রাণী।

অর্থাৎ, বর্তমানে ট্যাপ করা প্রাণীটি `AnimalDetailView`-এ পাঠিয়ে প্রদর্শন করা।

সম্পূর্ণ কাঠামো:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

ব্যবহারকারী যখন কোনো প্রাণীতে ট্যাপ করেন:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` থেকে একটি নির্দিষ্ট প্রাণীতে পরিবর্তিত হয়। `Sheet` যখন দেখে `selectedAnimal`-এর মান আছে, তখন এটি ভিউ প্রদর্শন করে।

`Sheet` `selectedAnimal`-এর প্রাণীটি `AnimalDetailView` ভিউতে পাঠায়, এবং `AnimalDetailView` প্রাণীর বিস্তারিত দেখায়।

এভাবে আমরা প্রাণীর তালিকায় ট্যাপ করলেসংশ্লিষ্ট প্রাণীর বিস্তারিত প্রদর্শনের ফিচার তৈরি করেছি।

## Sheet-এর দুই ধরনের লেখার পার্থক্য

এখন আমরা `.sheet(item:)` ব্যবহার করে প্রাণীর বিস্তারিত ভিউ প্রদর্শন সম্পন্ন করেছি।

এখানে আমরা `Sheet`-এর দুইটি সাধারণ লেখার ধরন সংক্ষেপে সারসংক্ষেপ করতে পারি।

### প্রথম ধরন হলো Boolean মান বাঁধা

```swift
@State private var showSheet = false

Button("Sheet দেখান") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ভিউ")
}
```

এই ধরনটি স্থির বিষয়বস্তু প্রদর্শনের জন্য উপযোগী, যেমন সেটিংস পেজ, নির্দেশনা পেজ,প্রম্পট পেজ ইত্যাদি।

`showSheet` হলো একটি Boolean মান, যার মাত্র দুটি অবস্থা আছে: `true` এবং `false`।

যখন `showSheet` `true`, তখন `Sheet` প্রদর্শিত হয়।

যখন `showSheet` `false`, তখন `Sheet` প্রদর্শিত হয় না।

### দ্বিতীয় ধরন হলো optional value বাঁধা

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

এই ধরনটি নির্বাচিত ডেটার ভিত্তিতে ভিন্ন বিষয়বস্তু প্রদর্শনের জন্য উপযোগী।

এই পাঠে আমরা ভিন্ন প্রাণীতে ট্যাপ করি এবং ভিন্ন প্রাণীর বিস্তারিত দেখাতে হয়, তাই `.sheet(item:)` ব্যবহার করা বেশি উপযুক্ত।

## সম্পূর্ণ কোড

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // প্রাণীর নাম
    let name: String
    
    // প্রাণীর ছবি
    let imageName: String
    
    // প্রাণীর ইমোজি
    let avatarEmoji: String
    
    // বিস্তৃতি অঞ্চল
    let distributionArea: String
    
    // আবাসস্থল
    let habitat: String
    
    // প্রাণীর বিবরণ
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ডলফিন
        Animal(
            name: "ডলফিন",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "বিশ্বজুড়ে উষ্ণ ও নাতিশীতোষ্ণ সমুদ্র।",
            habitat: "সমুদ্র, উপকূলীয় জলভাগ এবং কিছু বড় নদী।",
            animalDescription: "ডলফিন বুদ্ধিমান সামুদ্রিক স্তন্যপায়ী প্রাণী। তারা দলে বাস করে, শব্দের মাধ্যমে যোগাযোগ করে এবং তাদের খেলাধুলাপূর্ণ আচরণের জন্য পরিচিত।"
        ),
        // জিরাফ
        Animal(
            name: "জিরাফ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "আফ্রিকার সাভানা এবং খোলা বনভূমি।",
            habitat: "তৃণভূমি, সাভানা এবং খোলা বন।",
            animalDescription: "জিরাফ স্থলভাগের সবচেয়ে লম্বা প্রাণী। তাদের লম্বা গলা ও লম্বা পা আছে, এবং তারা সাধারণত উঁচু গাছের পাতা খায়।"
        ),
        // সিংহ
        Animal(
            name: "সিংহ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "প্রধানত সাহারা মরুভূমির দক্ষিণের আফ্রিকায় পাওয়া যায়, আর পশ্চিম ভারতে একটি ছোট জনসংখ্যা আছে।",
            habitat: "তৃণভূমি, সাভানা এবং খোলা বনভূমি।",
            animalDescription: "সিংহ শক্তিশালী বড় বিড়ালজাতীয় প্রাণী। তারা সাধারণত প্রাইড নামে পরিচিত দলে বাস করে এবং প্রায়ই প্রাণীজগতের রাজা হিসেবে পরিচিত।"
        ),
        // পান্ডা
        Animal(
            name: "পান্ডা",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "মধ্য চীনের পাহাড়ি বন।",
            habitat: "শীতল ও আর্দ্র পাহাড়ি অঞ্চলের বাঁশবন।",
            animalDescription: "পান্ডা তাদের সাদা-কালো লোমের জন্য পরিচিত ভালুক। তারা প্রধানত বাঁশ খায় এবং বিশ্বের সবচেয়ে সহজে চিনে নেওয়া যায় এমন প্রাণীদের একটি।"
        ),
        // মেরু ভালুক
        Animal(
            name: "মেরু ভালুক",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "উত্তর মেরুর চারপাশের আর্কটিক অঞ্চল।",
            habitat: "সমুদ্রের বরফ, উপকূলীয় এলাকা এবং ঠান্ডা আর্কটিক পরিবেশ।",
            animalDescription: "মেরু ভালুক ঠান্ডা পরিবেশের সঙ্গে মানিয়ে নেওয়া বড় ভালুক। তারা দক্ষ সাঁতারু এবং সিল শিকারের জন্য প্রধানত সমুদ্রের বরফের ওপর নির্ভর করে।"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**বিস্তৃতি অঞ্চল**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**আবাসস্থল**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**প্রাণীর বিবরণ**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## সারাংশ

এই পাঠে আমরা একটি সহজ প্রাণী বিশ্বকোষ পেজ সম্পূর্ণ করেছি।

আমরা আগে `Animal` স্ট্রাকচার ব্যবহার করে প্রাণীর তথ্য সংরক্ষণ করেছি, তারপর একটি অ্যারে ব্যবহার করে পাঁচটি প্রাণী সংরক্ষণ করেছি, এবং শেষে `ForEach` ব্যবহার করে প্রাণীর তালিকা দেখিয়েছি।

ব্যবহারকারী যখন কোনো প্রাণীতে ট্যাপ করেন, আমরা সেই প্রাণীটি `selectedAnimal`-এ সংরক্ষণ করি:

```swift
selectedAnimal = animal
```

যখন `selectedAnimal`-এর মান থাকে, `.sheet(item:)` বিস্তারিত ভিউ প্রদর্শন করে এবং নির্বাচিত প্রাণীটি `AnimalDetailView`-এ পাঠায়।

এই পাঠের সবচেয়ে গুরুত্বপূর্ণ বিষয় ইন্টারফেসের স্টাইল নয়, বরং এই ডেটা পাস করার রুটটি বোঝা:

```swift
প্রাণীতে ট্যাপ → selectedAnimal প্রাণী সংরক্ষণ করে → Sheet প্রদর্শিত হয় → AnimalDetailView বিস্তারিত দেখায়
```

এই রুটটি বোঝার পরে, ভবিষ্যতে আপনি আরও অনেক অনুরূপ ফিচার তৈরি করতে পারবেন, যেমন পণ্যের বিস্তারিত, কোর্সের বিস্তারিত,আর্টিকেলের বিস্তারিত, যোগাযোগের বিস্তারিত ইত্যাদি।
