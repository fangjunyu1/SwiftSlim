# সিনেমার তালিকা

এই পাঠে আমরা একটি সিনেমার তালিকা তৈরি করব।

![movie](../../Resource/021_movie.png)

তালিকায় প্রতিটি সিনেমার পোস্টার, নাম, পরিচালক এবং রেটিং দেখানো হবে।

এই উদাহরণে আমরা একটি খুব গুরুত্বপূর্ণ বিষয় শিখব: `struct` স্ট্রাকচার। এটি আমাদের একটি সিনেমার একাধিক তথ্যকে একসাথে একটি সম্পূর্ণ সত্তায় সংগঠিত করতে সাহায্য করে। এর পাশাপাশি আমরা `UUID()`、`ForEach`、`Divider` বিভাজক রেখা, এবং কাস্টম অবজেক্ট ব্যবহার করে কীভাবে ডেটা ম্যানেজ করতে হয় সেটিও দেখব।

এই জ্ঞানগুলো পরবর্তী SwiftUI ডেভেলপমেন্টে খুবই সাধারণ। এই পাঠ শেষ করার পর, তুমি শুধু একটি সিনেমার তালিকা বানাতে পারবে না, বরং “কীভাবে একটি ডেটার সেটকে ইন্টারফেসে দেখানো যায়” সেটাও বুঝতে শুরু করবে।

## একক সিনেমা

আমরা প্রথমে একটি একক সিনেমার ইন্টারফেস থেকে শুরু করতে পারি।

![movie](../../Resource/021_movie1.png)

এই ইন্টারফেসের লেআউট মূলত দুটি অংশে গঠিত: বাম পাশে সিনেমার পোস্টার, ডান পাশে সিনেমার পরিচিতি।

### সিনেমার পোস্টার

বাম পাশে সিনেমার পোস্টার দেখানো হয়, আর ছবি দেখানোর জন্য আমরা `Image` ব্যবহার করতে পারি।

উদাহরণ হিসেবে:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

এই কোডের অর্থ হলো `"The Shawshank Redemption"` নামে একটি ছবি দেখানো।

এখানে লক্ষ্য রাখতে হবে, ছবির নামটি অবশ্যই `Assets` রিসোর্স ফোল্ডারে বাস্তবে থাকতে হবে, নইলে ইন্টারফেসে ছবিটি ঠিকভাবে দেখানো যাবে না।

![movie](../../Resource/021_movie2.png)

এই মডিফায়ারগুলোর কাজ যথাক্রমে হলো:

- `resizable()` বোঝায় ছবির আকার পরিবর্তন করা যাবে।
- `scaledToFit()` বোঝায় স্কেল করার সময় মূল অনুপাত বজায় থাকবে, যাতে ছবি টেনে বিকৃত না হয়।
- `frame(height: 180)` বোঝায় ছবির উচ্চতা 180 সেট করা।
- `cornerRadius(10)` বোঝায় ছবির কোণ 10 রেডিয়াসে গোল করা।

এভাবে আমরা উপযুক্ত আকারের এবং গোল কোণযুক্ত একটি সিনেমার পোস্টার পেতে পারি।

![movie](../../Resource/021_movie3.png)

### সিনেমার পরিচিতি

ডান পাশে সিনেমার পরিচিতি দেখানো হয়, যার মধ্যে থাকে সিনেমার নাম, পরিচালক এবং রেটিং।

![movie](../../Resource/021_movie4.png)

এই অংশটি দেখানোর জন্য আমরা `Text` ব্যবহার করতে পারি:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

এই কোডে `.font` ফন্টের আকার বোঝায়, আর `.fontWeight` ফন্টের পুরুত্ব বোঝায়।

“সিনেমার নাম”, “পরিচালকের তথ্য” এবং “রেটিং তথ্য”-এর মধ্যে আরও পরিষ্কার ব্যবধান রাখার জন্য, এখানে সবচেয়ে বাইরের স্তরে `VStack` ব্যবহার করা হয়েছে, এবং সেট করা হয়েছে:

```swift
spacing: 10
```

এর মানে এই `VStack`-এর ভেতরের প্রতিটি কনটেন্ট গ্রুপের মধ্যে ব্যবধান 10।

পরিচালক এবং রেটিংকে আলাদা করে আবার `VStack` দিয়ে মোড়ানোর কারণ হলো, এরা দুটোই “শিরোনাম + বিষয়বস্তু” ধরনের কাঠামোর অন্তর্ভুক্ত। তাই ইন্টারফেসের স্তরবিন্যাস আরও পরিষ্কার হয়, এবং পরে স্টাইল ঠিক করাও সহজ হয়।

এছাড়া `VStack` ডিফল্টভাবে মাঝামাঝি অ্যালাইন হয়। পুরো লেখাকে বাম দিকে অ্যালাইন করতে আমরা সেট করি:

```swift
alignment: .leading
```

এভাবে সিনেমার পরিচিতি অংশটি আরও গোছানো দেখায়।

### বিভাজক রেখা

এখন সিনেমার পরিচিতির কনটেন্টগুলো `spacing` দিয়ে দূরে সরানো হলেও, আলাদা কনটেন্টগুলোর মাঝে পার্থক্য এখনো যথেষ্ট স্পষ্ট নয়।

এই সময় আমরা একটি বিভাজক রেখা যোগ করতে পারি:

```swift
Divider()
```

উদাহরণ হিসেবে:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

এভাবে সিনেমার পরিচিতি অংশে আরও স্পষ্ট বিভাজন দেখা যাবে।

![movie](../../Resource/021_movie4.png)

`Divider` খুবই সহজ কিন্তু খুবই ব্যবহৃত একটি ভিউ, যার কাজ হলো আলাদা কনটেন্টকে পৃথক করা।

`VStack`-এ `Divider()` একটি অনুভূমিক রেখা হিসেবে দেখায়।

`HStack`-এ `Divider()` একটি উল্লম্ব রেখা হিসেবে দেখায়।

এছাড়া `.frame`、`.background`、`.padding` ইত্যাদি উপায়ে `Divider`-এর স্টাইলও পরিবর্তন করা যায়।

উদাহরণ হিসেবে:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

এটি একটি নীল রঙের, 2 পুরুত্বের এবং দুই পাশে প্যাডিংসহ বিভাজক রেখা তৈরি করবে।

![divider](../../Resource/021_divider.png)

### সম্পূর্ণ ইন্টারফেস

শেষে আমরা `HStack` ব্যবহার করে সিনেমার পোস্টার এবং সিনেমার পরিচিতিকে পাশাপাশি সাজাতে পারি।

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

এখানে `HStack(spacing: 20)` বোঝায় বাম ও ডান অংশের মধ্যে 20 ব্যবধান রাখা হবে।

লক্ষ্য রাখতে হবে, `Divider()` এবং আগে আলোচিত `TextField`、`Slider`-এর মতো, ডিফল্টভাবে যতটা সম্ভব উপলব্ধ জায়গা দখল করতে চায়।

তাই ডান পাশের পরিচিতি অংশের বাইরের `VStack`-এর জন্য আমরা একটি নির্দিষ্ট প্রস্থ সেট করি:

```swift
.frame(width: 200)
```

এভাবে বিভাজক রেখা এবং লেখার অংশের প্রস্থ একরকম থাকে, ফলে পুরোটা আরও পরিপাটি দেখায়।

এখান পর্যন্ত আমরা “একক সিনেমা”-র প্রদর্শন ইন্টারফেস সম্পন্ন করলাম।

![movie](../../Resource/021_movie1.png)

## অ্যারে দিয়ে সিনেমা সংরক্ষণ

যদি আমরা একই স্টাইলে একের পর এক একাধিক সিনেমা দেখাতে চাই, তার মানে প্রতিটি সিনেমার জন্য একই ধরনের কোড বারবার লিখতে হবে।

উদাহরণ হিসেবে:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

এভাবে লেখা কোড কাজ করলেও, কোড ক্রমশ বেড়ে যাবে এবং মেইনটেইন করাও খুব ঝামেলার হবে।

ধরো, সব সিনেমার ব্যবধান `20` থেকে `15` করতে হবে, অথবা ডান পাশের প্রস্থ `200` থেকে
`220` করতে হবে, তাহলে প্রতিটি পুনরাবৃত্ত কোড ব্লক হাতে হাতে বদলাতে হবে।

এটি স্পষ্টতই কার্যকর কোনো পদ্ধতি নয়।

আমরা আগে অ্যারে শিখেছি, আর `ForEach` ব্যবহার করে অ্যারের ভিত্তিতে বারবার ভিউ দেখানোর পদ্ধতিও শিখেছি।

উদাহরণ হিসেবে:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

এই পদ্ধতি “শুধু একটি ডেটা” ধরনের ক্ষেত্রে খুব উপযোগী, যেমন কয়েকটি ছবির নামের একটি গ্রুপ।

কিন্তু একটি সিনেমা কেবল একটি মান নয়। এতে অন্তত থাকে:

1. সিনেমার পোস্টার
2. সিনেমার নাম
3. পরিচালক
4. রেটিং

অর্থাৎ, একটি সিনেমা আসলে পরস্পর সম্পর্কিত ডেটার একটি সেট, শুধু আলাদা একটি স্ট্রিং নয়।

যদি আমরা শুধু অ্যারে ব্যবহার করি, তাহলে এই তথ্যগুলো আলাদা করে সংরক্ষণ করতে হবে:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

দেখানোর সময় একই ইনডেক্সের ওপর নির্ভর করে এগুলোকে একে একে মিলিয়ে নিতে হবে:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

এই লেখার সমস্যাটি হলো, এর মেইনটেন্যান্স খরচ অনেক বেশি।

কারণ একটি সিনেমার ডেটা একাধিক অ্যারেতে ছড়িয়ে যায়। যেকোনো একটি অ্যারেতে একটি আইটেম বেশি, কম, বা ক্রম আলাদা হলেই প্রদর্শনের ফল ভুল হবে।

বিশেষ করে নতুন সিনেমা যোগ বা মুছে ফেলার সময়, তোমাকে একসাথে একাধিক অ্যারে বদলাতে হয়, ফলে কিছু বাদ পড়ে যাওয়ার সম্ভাবনা খুব বেশি।

তাহলে “সিনেমার নাম, পরিচালক, রেটিং” এই তথ্যগুলোকে কীভাবে একসাথে একটি সম্পূর্ণ সত্তায় আনা যায়?

তার জন্য দরকার `struct`।

## struct স্ট্রাকচার সংজ্ঞা

Swift-এ `struct` মানে “স্ট্রাকচার”।

তুমি একে “কাস্টম ডেটা টাইপ” হিসেবে ভাবতে পারো, যা একাধিক সম্পর্কিত ফিল্ডকে একত্রে জুড়ে একটি সম্পূর্ণ সত্তা তৈরি করে।

মৌলিক ব্যবহার:

```swift
struct StructName {
	let name: String
}
```

এই কোডে `struct` হলো একটি কীওয়ার্ড, যা বোঝায় আমরা একটি স্ট্রাকচার সংজ্ঞায়িত করছি। `StructName` হলো সেই স্ট্রাকচারের নাম।

কার্লি ব্রেসের ভেতরের অংশ হলো এই স্ট্রাকচারের ফিল্ডগুলো। প্রতিটি ফিল্ডের নাম এবং টাইপ পরিষ্কারভাবে লিখতে হবে।

সাধারণত `struct`-এর নাম বড় হাতের অক্ষর দিয়ে শুরু হয়, যেমন `Movie`、`Student`、`UserInfo`। এটি Swift-এ প্রচলিত নামকরণের ধরন।

তুমি `struct`-কে সহজভাবে একটি খালি প্যাকেজিং বাক্স হিসেবে ভাবতে পারো, যেখানে প্রতিটি ফিল্ড হলো আগেই রাখা একটি খালি জায়গা।

যখন এই জায়গাগুলো এখনো পূরণ হয়নি, তখন এটি শুধু একটি খালি বাক্স। সব ফিল্ডে উপযুক্ত মান পূরণ হলে তবেই এটি একটি সম্পূর্ণ উপহারের বাক্সে পরিণত হয়।

### struct ইনস্ট্যান্স

এর আগে আমরা শুধু স্ট্রাকচারটিই সংজ্ঞায়িত করেছি, যা অনেকটা একটি প্যাকেজিং বাক্সের আকার তৈরি করার মতো।

এখনও আমাদের এর মধ্যে নির্দিষ্ট কনটেন্ট ভরতে হবে, তাহলেই একটি প্রকৃত ব্যবহারযোগ্য “ইনস্ট্যান্স” পাওয়া যাবে।

ইনস্ট্যান্স তৈরি করার সময় সাধারণত স্ট্রাকচারের নামের পরে `()` যোগ করা হয়:

```swift
StructName(...)
```

ব্র্যাকেটের মধ্যে যা লেখা হয়, সেটাই হলো ওই স্ট্রাকচারের জন্য প্রয়োজনীয় ফিল্ডের মান।

উদাহরণ হিসেবে:

```swift
StructName(name: "Fang Junyu")
```

এই কোডের মানে হলো: `StructName` স্ট্রাকচারের ফরম্যাট অনুযায়ী একটি নতুন ইনস্ট্যান্স তৈরি করা, এবং `name` ফিল্ডে `"Fang Junyu"` মান দেওয়া।

যখন আমরা সব প্রয়োজনীয় ফিল্ড পূরণ করি, তখন তা অনেকটা সেই প্যাকেজিং বাক্সটি পূর্ণ করার মতো হয়।

তখন আমরা একটি সম্পূর্ণ স্ট্রাকচার ইনস্ট্যান্স পাই।

### struct প্রপার্টি অ্যাক্সেস

একটি ইনস্ট্যান্স তৈরি হয়ে গেলে, আমরা এর ভেতরের প্রপার্টিগুলো অ্যাক্সেস করতে “ডট সিনট্যাক্স” ব্যবহার করতে পারি।

মৌলিক লেখার ধরন:

```swift
ইনস্ট্যান্স.প্রপার্টির_নাম
```

উদাহরণ হিসেবে:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

এখানে `st` হলো একটি স্ট্রাকচার ইনস্ট্যান্স, আর `st.name` মানে এই ইনস্ট্যান্সের `name` মান পড়া।

তুমি একে এভাবেও ভাবতে পারো: যখন আমরা `st.name` লিখি, তখন যেন ওই প্যাকেজিং বাক্সের নির্দিষ্ট একটি স্থানে রাখা কনটেন্ট পড়ছি।

এই লেখার ধরন পরের SwiftUI ইন্টারফেসে খুবই সাধারণভাবে দেখা যাবে।

ধরো, আমাদের একটি student স্ট্রাকচার আছে, যেখানে নাম, বয়স এবং শ্রেণি রয়েছে, তাহলে ইন্টারফেসে দেখানোর সময় আমরা আলাদাভাবে পড়তে পারি:

```swift
student.name
student.age
student.className
```

এভাবে ডেটা আরও পরিষ্কার হয় এবং ম্যানেজ করাও সহজ হয়।

### struct-এর অবস্থান

শুরুর দিকের শিক্ষার্থীদের জন্য সাধারণত `ContentView`-এর বাইরে স্ট্রাকচার লেখা সুবিধাজনক।

উদাহরণ হিসেবে:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

এভাবে গঠন আরও পরিষ্কার হয় এবং পড়াও সহজ হয়।

তুমি খেয়াল করবে, `ContentView` নিজেও আসলে একটি `struct`।

### Movie স্ট্রাকচার

উপরের ভিত্তির ওপর আমরা এখন একটি সিনেমা স্ট্রাকচার সংজ্ঞায়িত করতে পারি:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

এটি `Movie` নামের একটি স্ট্রাকচার, যাতে `name`、`director` এবং `rating` এই তিনটি ফিল্ড রয়েছে, যা যথাক্রমে সিনেমার নাম, পরিচালক এবং রেটিং বোঝায়।

এভাবে একটি সিনেমার সম্পর্কিত তথ্যগুলো আর একাধিক অ্যারেতে আলাদা করে রাখার প্রয়োজন হয় না, বরং সরাসরি একটি সম্পূর্ণ সত্তায় একত্র করা যায়।

উদাহরণ হিসেবে আমরা এমন একটি সিনেমা ইনস্ট্যান্স তৈরি করতে পারি:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

এই ইনস্ট্যান্সটি “একটি সম্পূর্ণ সিনেমার ডেটা” প্রতিনিধিত্ব করে।

### অ্যারেতে স্ট্রাকচার সংরক্ষণ

আমরা আগে বলেছি, অ্যারে কেবল একই ধরনের ডেটা সংরক্ষণ করতে পারে।

এখন আমাদের `Movie` স্ট্রাকচার আছে, তাই অ্যারে একাধিক `Movie` সংরক্ষণ করতে পারবে।

```swift
let lists: [Movie] = []
```

উদাহরণ হিসেবে:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

এই `lists` অ্যারেতে স্ট্রিং নয়, বরং একাধিক `Movie` ইনস্ট্যান্স সংরক্ষিত থাকে।

অর্থাৎ, অ্যারের প্রতিটি উপাদানই একটি পূর্ণাঙ্গ সিনেমা।

এভাবে যখন আমাদের সিনেমার তালিকা দেখাতে হবে, তখন `ForEach` ব্যবহার করে একে একে প্রতিটি সিনেমা পড়া যাবে।

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

এখানে `movie in` বোঝায়, প্রতিবার লুপ চলার সময় অ্যারে থেকে একটি সিনেমা বের করে অস্থায়ীভাবে `movie` নামে ব্যবহার করা হবে।

এরপর আমরা ব্যবহার করতে পারি:

```swift
movie.name
movie.director
movie.rating
```

এভাবে ওই সিনেমার নাম, পরিচালক ও রেটিং আলাদাভাবে পড়ে ইন্টারফেসে দেখানো যায়।

## ForEach ত্রুটি

এখান পর্যন্ত আমরা সিনেমার অ্যারে এবং ForEach-এর মৌলিক লেখার ধরন সম্পন্ন করেছি।

কিন্তু নিচের কোডটি সরাসরি চালালে:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ত্রুটি দেখাবে:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

এই ত্রুটির মানে হলো, যখন তুমি `id: \.self` লেখো, SwiftUI-কে অ্যারের প্রতিটি উপাদানকেই “একটি ইউনিক আইডেন্টিফায়ার” হিসেবে ব্যবহার করতে হয়।

এই লেখার ধরন `String`、`Int`-এর মতো সহজ টাইপের জন্য উপযুক্ত, কারণ এগুলোকে আলাদা করা তুলনামূলক সহজ।

কিন্তু `Movie` হলো আমাদের তৈরি করা একটি কাস্টম স্ট্রাকচার। `ForEach` জানে না কীভাবে একে নিজেকেই ইউনিক আইডেন্টিফায়ার হিসেবে ব্যবহার করবে, তাই ত্রুটি হয়।

এই সমস্যা সমাধানের সবচেয়ে সাধারণ উপায় হলো: `Movie`-কে `Identifiable` প্রোটোকল অনুসরণ করানো।

## প্রোটোকল

Swift-এ প্রোটোকলকে একধরনের “নিয়ম” বা “চাহিদা” হিসেবে ভাবা যায়।

তুমি এটাকে আন্তর্জাতিক সংস্থার চুক্তির মতোও ভাবতে পারো: যদি কোনো দেশ একটি আন্তর্জাতিক সংস্থায় যোগ দিতে চায়, তবে সাধারণত আগে সেই সংস্থার নির্ধারিত কিছু নিয়ম পূরণ করতে হয়, কিছু তথ্য প্রকাশ করতে হয়, এবং কিছু যৌথ নিয়ম মেনে চলতে হয়। এই শর্তগুলো পূরণ করার পরেই সেখানে যোগ দেওয়া বা কিছু বিষয়ে অংশ নেওয়া যায়।

প্রোটোকলের ধারণাটিও একই রকম।

যখন কোনো টাইপ একটি প্রোটোকল অনুসরণ করতে চায়, তখন তাকে সেই প্রোটোকলের নির্ধারিত বিষয়গুলো পূরণ করতে হয়। এসব শর্ত পূরণ হলেই কেবল সেই টাইপ সংশ্লিষ্ট ফিচার ব্যবহার করতে পারে।

মৌলিক লেখার ধরন:

```swift
struct Movie: Identifiable {
    // ...
}
```

এখানে `: Identifiable` বোঝায় `Movie` `Identifiable` প্রোটোকল অনুসরণ করছে।

যদি একটি টাইপ একাধিক প্রোটোকল অনুসরণ করে, তাহলে কমা দিয়ে আলাদা করা যায়:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable`-এর ক্ষেত্রে সবচেয়ে গুরুত্বপূর্ণ চাহিদা হলো: টাইপের মধ্যে এমন একটি `id` থাকতে হবে, যা দিয়ে সেটি নিজেকে শনাক্ত করতে পারে।

উদাহরণ হিসেবে:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

এখানে `id` অনেকটা পরিচয়পত্র নম্বরের মতো, যা প্রতিটি সিনেমাকে আলাদা করতে ব্যবহার করা হয়।

প্রতিটি সিনেমার `id` আলাদা থাকলে, SwiftUI অ্যারের প্রতিটি উপাদানকে সঠিকভাবে আলাদা করতে পারবে।

উদাহরণ হিসেবে:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

তারপর `ForEach`-এ ব্যবহার করি:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

এভাবে আর ত্রুটি হবে না।

কারণ `Movie` ইতিমধ্যেই `Identifiable` অনুসরণ করছে, তাই আরও প্রচলিত একটি লেখার ধরন হলো সরাসরি `id:` বাদ দেওয়া:

```swift
ForEach(lists) { movie in
    // ...
}
```

কারণ SwiftUI আগেই জানে, প্রতিটি আইটেম আলাদা করতে `movie.id` ব্যবহার করতে হবে।

## ForEach-এর পার্থক্য নির্ধারণকারী আইডি

এখন আমরা `ForEach`-এর `id`-এর ভূমিকা আরও গভীরভাবে বুঝব।

উদাহরণ হিসেবে:

```swift
ForEach(lists, id: \.self)
```

এখানে বোঝায়: উপাদানটিকেই পার্থক্য নির্ধারণকারী আইডি হিসেবে ব্যবহার করা।

আর:

```swift
ForEach(lists, id: \.id)
```

এর মানে: উপাদানের `id` ফিল্ডকে পার্থক্য নির্ধারণকারী আইডি হিসেবে ব্যবহার করা।

যদি কোনো ফিল্ড নিজে থেকেই ইউনিক হওয়ার নিশ্চয়তা দেয়, তাহলে সেটিকেও অস্থায়ীভাবে ব্যবহার করা যায়।

যেমন, যদি প্রতিটি সিনেমার নাম আলাদা হয়, তাহলে নিচের লেখাটিও বর্তমান ডেটায় ঠিকঠাক কাজ করতে পারে:

```swift
ForEach(lists, id: \.name)
```

কিন্তু এখানে একটি লুকানো সমস্যা আছে: `name` সবসময় ইউনিক নাও হতে পারে।

ধরা যাক, পরে তুমি একই নামের আরেকটি সিনেমা যোগ করলে, তখন `name` আর প্রতিটি উপাদানকে নির্ভুলভাবে আলাদা করতে পারবে না।

সে সময় কোড কম্পাইল হলেও, ভিউ রিফ্রেশ, আপডেট, ইনসার্ট বা ডিলিট করার সময় SwiftUI ভুলভাবে শনাক্ত করতে পারে, ফলে প্রদর্শনে সমস্যা হতে পারে।

তাই ডেটাকে স্থিতিশীলভাবে আলাদা করার দরকার হলে, প্রকৃতপক্ষে ইউনিক ফিল্ড `id` ব্যবহার করাই সবচেয়ে ভালো।

## UUID

যদিও `id: 1`、`id: 2` এভাবে হাতে লিখে সমস্যা সমাধান করা যায়, তবুও একটি ঝুঁকি থাকে: ভুল করে একই `id` লিখে ফেলা হতে পারে, তখন ইউনিক আইডেন্টিফায়ার আর কার্যকর থাকবে না।

উদাহরণ হিসেবে:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

এভাবে দুটি একই `id` হয়ে যাবে, আর ইউনিক আইডেন্টিফায়ার অকার্যকর হয়ে যাবে।

হাতে ভুল এড়াতে আমরা সাধারণত `UUID()` ব্যবহার করি।

Swift-এ `UUID()` এলোমেলোভাবে একটি 128-বিট আইডেন্টিফায়ার তৈরি করে। সাধারণত এটি অনেকগুলো অক্ষর ও সংখ্যার একটি দীর্ঘ স্ট্রিং হিসেবে দেখা যায়।

উদাহরণ হিসেবে:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

এখানে `UUID()` আসলে `UUID` টাইপের একটি ইনস্ট্যান্স তৈরি করে। তুমি একে স্বয়ংক্রিয়ভাবে তৈরি হওয়া একটি “ইউনিক নম্বর” হিসেবে ভাবতে পারো।

তাই প্রতিবার তৈরি হওয়া মান প্রায় কখনোই পুনরাবৃত্ত হয় না, ফলে এটি `id` হিসেবে ব্যবহার করার জন্য খুবই উপযুক্ত।

আমরা `Movie`-কে এভাবে পরিবর্তন করতে পারি:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

এই কোডের অর্থ হলো, `Movie` স্ট্রাকচারের `id` ফিল্ডে ডিফল্টভাবে একটি নতুন `UUID` ইনস্ট্যান্স দেওয়া হবে।

অর্থাৎ, প্রতিবার আমরা নতুন `Movie` তৈরি করলে, সিস্টেম আগে থেকেই একটি ইউনিক `id` তৈরি করে দেবে।

`id`-এর যেহেতু ইতিমধ্যেই ডিফল্ট মান আছে, তাই পরে `Movie` ইনস্ট্যান্স তৈরি করার সময় আর হাতে `id` পূরণ করতে হবে না।

উদাহরণ হিসেবে:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

এখানে `id` লেখা না থাকলেও, বাস্তবে এই সিনেমা ইনস্ট্যান্সের নিজস্ব `id` থাকে, শুধু সেই মানটি `UUID()` স্বয়ংক্রিয়ভাবে তৈরি করে দিয়েছে।

এই পদ্ধতি ব্যবহার করলে আর প্রতিটি সিনেমার জন্য হাতে `id` লিখতে হবে না। এতে যেমন কোড কমে, তেমনি একই id লিখে ভুল হওয়ার সম্ভাবনাও এড়ানো যায়।

শেষে আমাদের শুধু উপরে একটি `Banner` ছবি যোগ করতে হবে, আর `ScrollView` ব্যবহার করতে হবে যাতে কনটেন্ট স্ক্রল করা যায়, তাহলেই পুরো সিনেমার তালিকা ভিউ সম্পন্ন হবে।

## সারসংক্ষেপ

এই পাঠে আমরা একটি খুব গুরুত্বপূর্ণ বিষয় শিখেছি: `struct`।

`struct` ব্যবহার করে আমরা একটি সিনেমার একাধিক সম্পর্কিত ফিল্ডকে একত্রে একটি সম্পূর্ণ সত্তায় গুছিয়ে রাখতে পারি, আলাদা আলাদা অ্যারেতে নাম, পরিচালক, রেটিং ভেঙে রাখার বদলে।

ডেটা গুছিয়ে নেওয়ার পর, আমরা `ForEach` ব্যবহার করে অ্যারের প্রতিটি সিনেমাকে একে একে ভিউতে দেখাতে পারি।

একই সঙ্গে আমরা `ForEach`-এর “পার্থক্য নির্ধারণকারী আইডি”-র ভূমিকাও বুঝেছি। SwiftUI-কে জানতে হয় কীভাবে অ্যারের প্রতিটি উপাদানকে আলাদা করতে হবে, তাহলেই ভিউ সঠিকভাবে দেখানো ও আপডেট করা সম্ভব হয়।

তাই আমরা `Movie`-কে `Identifiable` প্রোটোকল অনুসরণ করিয়েছি, এবং তাকে একটি ইউনিক `id` দিয়েছি।

হাতে `id` লিখতে গিয়ে ভুল এড়ানোর জন্য আমরা আরও `UUID()` শিখেছি, যাতে সিস্টেম স্বয়ংক্রিয়ভাবে ইউনিক আইডেন্টিফায়ার তৈরি করে।

এই পাঠ শেষ করার পর, তুমি শুধু সিনেমার তালিকা সম্পন্ন করবে না, বরং SwiftUI-এর একটি গুরুত্বপূর্ণ ধারণাও বুঝতে শুরু করবে: **আগে ডেটা গুছাও, তারপর সেই ডেটার ভিত্তিতে ভিউ তৈরি করো।**

## সম্পূর্ণ কোড

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
