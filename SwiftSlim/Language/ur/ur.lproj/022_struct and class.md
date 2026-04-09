# struct اور class

پچھلے سبق میں ہم نے ابھی `struct` سے تعارف شروع ہی کیا تھا، ایک structure define کیا تھا، اور ساتھ ہی protocol، `UUID` وغیرہ جیسے نکات بھی مزید سیکھے تھے۔

اب ہمارے پاس `struct` keyword کے بارے میں ایک ابتدائی سمجھ موجود ہے، لیکن ابھی یہ نہیں کہا جا سکتا کہ ہم اسے واقعی سمجھ چکے ہیں۔

اس سبق میں ہم `struct` کو ہی بنیادی موضوع کے طور پر آگے بڑھائیں گے، اور ساتھ ہی `class` سے بھی تعارف کریں گے۔ اس سبق کے ذریعے آپ زیادہ واضح طور پر سمجھ سکیں گے: instance کیا ہے، constructor کیا ہے، اور ہم `struct` اور `class` کو استعمال کرکے data کو کیوں منظم کر سکتے ہیں۔

## طلبہ انتظامی نظام

مثال کے طور پر، اب ہم ایک طلبہ انتظامی نظام تیار کرنا چاہتے ہیں۔ ہر طالب علم کے پاس نام، جنس، فون، عمر، گھر کا پتہ وغیرہ جیسی معلومات ہوتی ہیں۔

اس وقت ہم ان معلومات کو اکٹھا کرکے ایک `Student` structure کے طور پر define کر سکتے ہیں:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

یہاں ہم `struct` کو استعمال کرتے ہوئے ایک طالب علم type define کر رہے ہیں۔

اس `Student` structure میں کئی properties شامل ہیں:

- `id`: طالب علم کی منفرد شناخت
- `name`: طالب علم کا نام
- `sex`: طالب علم کی جنس
- `phone`: طالب علم کا فون
- `age`: طالب علم کی عمر
- `address`: گھر کا پتہ

اس طرح، اصل میں بکھرا ہوا متعدد data مل کر ایک مکمل “طالب علم” بن جاتا ہے۔

یہاں کا `Student`، `Identifiable` protocol کی بھی پیروی کرتا ہے، اور ایک `id` field define کرتا ہے، تاکہ بعد میں `ForEach` loop کے ساتھ data دکھانا آسان ہو۔

پھر، ہم ایک طالب علم کا instance بنا سکتے ہیں:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

یہ code ظاہر کرتا ہے کہ `Student` نامی اس structure کے مطابق ایک مخصوص طالب علم کا data بنایا جا سکتا ہے۔

اس میں `Student` type ہے، اور `Student(...)` ایک بنائے گئے instance کو ظاہر کرتا ہے۔

SwiftUI میں ہم اس instance کو ایک variable کو assign کر سکتے ہیں، اور پھر اسے ظاہر کر سکتے ہیں۔

مثال کے طور پر:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

اس طرح ہم view میں اس طالب علم کا نام `Fang Junyu` دیکھ سکتے ہیں۔

یہاں ہم نے پہلے ایک `Student` instance بنایا، پھر اسے `student` variable کو assign کیا، اور آخر میں `student.name` کے ذریعے اس کی property پڑھی۔

## instance کیا ہے

جب ہم `struct` سیکھنا شروع کرتے ہیں تو ممکن ہے کہ “instance” کا لفظ ہمیں بہت اجنبی لگے۔

لیکن حقیقت میں، ہم شروع ہی سے instance استعمال کر رہے ہوتے ہیں، بس پہلے ہم نے اس پر خاص توجہ نہیں دی۔

مثال کے طور پر:

```swift
let name = "Fang Junyu"
```

یہاں `"Fang Junyu"` ایک string value ہے، اور اپنی اصل میں یہ `String` type کا ایک instance ہے۔

ہم اسے یوں بھی لکھ سکتے ہیں:

```swift
let name = String("Fang Junyu")
```

یہ دونوں انداز ایک ہی بات ظاہر کرتے ہیں: `String` type کا ایک instance بنانا اور اسے `name` variable کو assign کرنا۔

اسی طرح `Int` بھی:

```swift
let num = 3
```

یہاں `3` اپنی اصل میں `Int` type کی value ہے، اور اسے ایک `Int` instance کے طور پر بھی سمجھا جا سکتا ہے۔

لہٰذا instance کوئی ایسا خاص concept نہیں ہے جو صرف `struct` میں ہی آتا ہو۔

چاہے وہ `String` ہو، `Int` ہو، `Double` ہو، `Bool` ہو، یا ہمارا خود define کیا ہوا `Student` ہو، یہ سب instance بنا سکتے ہیں۔

اس لیے جب ہم لکھتے ہیں:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

تو اپنی اصل میں یہ `String` یا `Int` کے instance بنانے ہی جیسا ہے، صرف فرق یہ ہے کہ `Student` ایک type ہے جو ہم نے خود define کیا ہے۔

## constructor

جب ہم ایک instance بناتے ہیں:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

تو دراصل ہم `Student` کے initialization method یعنی `init` کو call کر رہے ہوتے ہیں۔

آپ constructor کو یوں سمجھ سکتے ہیں: **یہ وہ entry point ہے جو instance بنتے وقت properties کو values assign کرنے کی ذمہ داری رکھتا ہے۔**

یعنی ایک instance کے واقعی بننے سے پہلے، عام طور پر اسے پہلے `init` سے گزرنا ہوتا ہے۔

مثال کے طور پر، جب ہم نے پہلے SwiftUI view lifecycle سیکھی تھی، تو ہم نے ایسا code لکھا تھا:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

یہاں `init()` اس وقت چلتا ہے جب `ContentView` کا instance بنتا ہے، جبکہ `onAppear` تب چلتا ہے جب view واقعی screen پر ظاہر ہوتا ہے۔ یعنی view کا بننا اور دکھائی دینا ایک ہی وقت نہیں ہوتا۔

اسی طرح، جب ہم `Student(...)` بناتے ہیں، تو ہم `Student` کے constructor کو call کر رہے ہوتے ہیں۔

### system کے ذریعے خودکار طور پر بننے والا constructor

جب ہم نے `Student` کو define کیا تھا، تو ہم نے `init` کو خود نہیں لکھا تھا:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

لیکن اس کے باوجود ہم براہ راست ایک instance بنا سکتے ہیں:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor کے بغیر بھی instance کیوں بنایا جا سکتا ہے؟

کیونکہ `struct` کے لیے، اگر ہم constructor خود نہ لکھیں، تو system عموماً ہمارے لیے ایک مناسب constructor خودکار طور پر بنا دیتا ہے۔

ابتدائی مرحلے میں اسے یوں آسانی سے سمجھا جا سکتا ہے: Swift ہمارے لیے initialization code خود مکمل کر دیتا ہے۔

تقریباً یہ سمجھا جا سکتا ہے کہ system ہمارے لیے درج ذیل code مکمل کرتا ہے:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

یہاں ایک چھوٹی سی detail پر توجہ دینی چاہیے:

```swift
let id = UUID()
```

`id` کے پاس پہلے سے default value موجود ہے، اس لیے instance بناتے وقت ہمیں `id` کو manually pass کرنے کی ضرورت نہیں ہوتی۔

یعنی جن properties کے پاس default value نہیں ہوتی، انہیں عام طور پر constructor میں pass کرنا پڑتا ہے؛ اور جن properties کے پاس پہلے سے default value ہو، وہ عموماً اسی value کو براہ راست استعمال کر سکتی ہیں۔

لہٰذا، جب ہم `Student` کا instance بناتے ہیں، تو ہمیں صرف `name`، `sex`، `phone`، `age` اور `address` pass کرنے کی ضرورت ہوتی ہے۔

### compiler hints

اس کے علاوہ، جب ہم Xcode میں `Student(...)` لکھتے ہیں، تو ہمیں system کی طرف سے parameter hints بھی نظر آتی ہیں۔

![student](../../Resource/022_student.png)

یہ دراصل یہ بھی ظاہر کرتا ہے کہ موجودہ type کے پاس واقعی system کا خودکار طور پر بنایا گیا constructor موجود ہے۔

### اپنا constructor خود لکھنا

اگرچہ system خودکار طور پر constructor بنا سکتا ہے، لیکن بعض اوقات یہ default initialization طریقہ ہماری ضروریات کے مکمل مطابق نہیں ہوتا۔

مثال کے طور پر، ہمارے پاس ایک `Movie` structure ہے:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

system کے خودکار constructor کے مطابق، instance بناتے وقت ہمیں یہ تینوں parameters ایک ساتھ pass کرنے پڑتے ہیں:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

لیکن اگر اب ہمیں پرانی فلموں کا ایک batch درج کرنا ہو اور ہمیں صرف فلم کا نام معلوم ہو، director اور rating معلوم نہ ہوں، تو یہ کچھ مشکل ہو جائے گا۔

کیونکہ پھر ہم صرف یوں ہی لکھ سکتے ہیں:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

اگرچہ یہ کام کر جاتا ہے، لیکن ہر بار `--` دہرانا آسان نہیں ہوتا۔

اس وقت ہم ایک constructor لکھ سکتے ہیں:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

اس طرح، پرانی فلمیں بناتے وقت ہمیں صرف `name` pass کرنا ہوگا:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

یہی اپنے constructor خود لکھنے کا ایک مطلب ہے: **instance بنانے کے طریقے کو حقیقی ضروریات کے زیادہ مطابق بنانا۔**

### custom constructor کی وضاحت

آئیے اب اس constructor کو دیکھتے ہیں جو ہم نے خود لکھا تھا:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

اس code کا مطلب یہ ہے کہ `Movie` کا instance بناتے وقت صرف ایک `name` parameter pass کرنا ضروری ہے۔

پھر constructor کے اندر، pass کیا گیا `name` instance کے اپنے `name` کو assign ہو جاتا ہے، اور `director` اور `rating` کو ایک default value `--` دے دی جاتی ہے۔

یہاں `self` کا مطلب ہے “یہ موجودہ instance خود”۔

مثال کے طور پر:

```swift
self.name = name
```

بائیں طرف `self.name` instance کے اندر property کو ظاہر کرتا ہے؛ دائیں طرف `name` اس parameter کو ظاہر کرتا ہے جو ہم نے pass کیا۔

اسے سادہ طور پر یوں سمجھا جا سکتا ہے کہ باہر سے آنے والی value کو instance کی اپنی property میں محفوظ کیا جا رہا ہے۔

جب تمام properties کو values assign ہو جاتی ہیں، تو یہ instance مکمل طور پر بن جاتا ہے۔

### constructor mechanism

جب ہم واضح طور پر ایک constructor declare کر دیتے ہیں، تو اس کے ساتھ ایک اور تبدیلی بھی آتی ہے:

وہ constructor جو system نے پہلے خودکار طور پر بنایا تھا، عموماً اب براہ راست استعمال نہیں کیا جا سکتا۔

مثال کے طور پر:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

اب اگر ہم دوبارہ یوں لکھیں:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

تو compiler error دے گا:

```swift
Extra arguments at positions #2, #3 in call
```

اس کا مطلب ہے: آپ نے اضافی arguments pass کیے ہیں۔

یہ error کیوں آتی ہے؟

کیونکہ موجودہ `Movie` structure میں صرف وہی ایک constructor موجود ہے جسے آپ نے خود declare کیا ہے:

```swift
init(name: String)
```

یہ صرف ایک parameter `name` قبول کرتا ہے، `director` اور `rating` قبول نہیں کرتا۔

یعنی، جب آپ اپنا constructor خود شامل کرتے ہیں، تو system کی طرف سے پہلے خودکار طور پر بننے والا initialization طریقہ عام طور پر براہ راست استعمال نہیں کیا جا سکتا۔

اگر ہم چاہتے ہیں کہ “صرف نام دینا” اور “مکمل معلومات دینا” دونوں طریقے support ہوں، تو ہمیں ایک مکمل constructor بھی خود لکھنا پڑے گا:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

اس طرح ہمارے پاس دو مختلف constructors ہو جاتے ہیں۔

پرانی فلمیں بناتے وقت ہم یوں لکھ سکتے ہیں:

```swift
Movie(name: "The Night of the Hunter")
```

اور مکمل معلومات والی نئی فلمیں بناتے وقت ہم یوں لکھ سکتے ہیں:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

یہ لکھنے کا انداز یہ بھی ظاہر کرتا ہے کہ ایک ہی type کے پاس کئی constructors ہو سکتے ہیں، جب تک ان کے parameters کی شکل مختلف ہو۔

## overloading کیا ہے

یہاں ایک اور ضروری نکتہ بھی شامل کر لیتے ہیں۔

ابھی ہم نے `Movie` کے لیے دو `init` لکھے:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

یہ انداز کہ “function name ایک ہی ہو، لیکن parameters مختلف ہوں”، “overloading” کہلاتا ہے۔

یہاں دونوں functions کا نام `init` ہے، لیکن یہ مختلف parameters لیتے ہیں، اس لیے Swift پہچان سکتا ہے کہ آپ کون سا function call کر رہے ہیں۔

مثال کے طور پر:

```swift
Movie(name: "Days of Heaven")
```

یہ call کرے گا:

```swift
init(name: String)
```

اور:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

یہ initialization method کے دوسرے مکمل version کو call کرے گا۔

لہٰذا overloading کا کردار یہ ہے: ایک ہی type کو مختلف حالات کے مطابق مختلف creation طریقے فراہم کرنا۔

## class سے تعارف

اب آگے ہم مختصراً `class` سے بھی تعارف کرتے ہیں۔

Swift میں عام طور پر استعمال ہونے والے `struct` کے علاوہ، بہت سی programming languages instance بنانے کے لیے `class` بھی استعمال کرتی ہیں، جیسے Java، C#، Kotlin وغیرہ۔

Swift میں `class` لکھنے کا انداز `struct` سے بہت ملتا جلتا ہے۔

مثال کے طور پر:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

آپ دیکھیں گے کہ `struct` سے `class` میں صرف keyword بدلا ہے، باقی حصے تقریباً ویسے ہی نظر آتے ہیں۔

instance بنانے کا طریقہ بھی بہت ملتا جلتا ہے:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

اس لیے syntax کی سطح پر `struct` اور `class` واقعی بہت ملتے جلتے ہیں۔

### Struct اور Class کا فرق

اگرچہ `struct` اور `class` بہت ایک جیسے دکھائی دیتے ہیں، لیکن یہ مکمل طور پر ایک جیسے نہیں ہیں۔

**1. initialization کا طریقہ مختلف ہے**

`struct` کے لیے، اگر ہم constructor خود نہ لکھیں، تو system عموماً خودکار طور پر ایک مناسب initialization method بنا دیتا ہے۔

لیکن `class` کے لیے، اگر کچھ properties کے پاس default value نہ ہو، تو عموماً `init` کو خود لکھنا پڑتا ہے، ورنہ error آتی ہے۔

مثال کے طور پر:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

اس `class` میں constructor نہ ہونے کی وجہ سے properties initialize نہیں ہوتیں، اور error آتی ہے۔

compiler عموماً کچھ یوں hint دیتا ہے:

```swift
Class 'Movie' has no initializers
```

لہٰذا اس مثال میں `class` کے لیے constructor خود لکھنا ضروری ہے۔

**2. `struct` ایک value type ہے، جبکہ `class` ایک reference type ہے**

`struct` ایک value type ہے، اور `class` ایک reference type ہے۔

ابتدائی مرحلے میں، ان دونوں concepts کو مکمل طور پر سمجھنا ضروری نہیں، صرف ایک سادہ سمجھ کافی ہے۔

مثال کے طور پر، `struct` زیادہ اس طرح ہے جیسے “ایک نئی value copy بنانا”۔

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

یہاں `user1` کو `user2` کو assign کرنے کے بعد، گویا data کی ایک نئی copy بن گئی، اس لیے `user2` میں تبدیلی `user1` کو متاثر نہیں کرتی۔

جبکہ `class` زیادہ اس طرح ہے جیسے “ایک ہی instance کی طرف مشترکہ اشارہ کرنا”۔

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

یہاں `user1` اور `user2` ایک ہی instance کی طرف اشارہ کرتے ہیں۔

فی الحال ہمیں value type اور reference type کے اندرونی mechanism کو مکمل طور پر سمجھنے کی ضرورت نہیں، صرف یہ جاننا کافی ہے کہ `struct` آزاد data محفوظ کرنے کے لیے زیادہ مناسب ہے، جبکہ `class` اس صورت کے لیے بہتر ہے جہاں کئی جگہوں کو ایک ہی instance شیئر کرنا ہو۔

## ابتدائی مرحلے میں کیسے انتخاب کریں

موجودہ مرحلے میں، عام data model کے لیے پہلے `struct` کو ترجیح دیں، اور جس data کو share کرنا ہو اور synchronized طریقے سے modify کرنا ہو، اس کے لیے `class` پر غور کریں۔

یہ کوئی مطلق اصول نہیں ہے، لیکن ابتدائی سیکھنے والوں کے لیے یہ کافی عملی فیصلہ کرنے کا طریقہ ہے۔

خاص طور پر SwiftUI میں، آپ اکثر دیکھیں گے کہ `struct` پہلے ہی زیادہ تر کام انجام دے سکتا ہے۔

اس کے علاوہ، بہت سے programming materials میں `class` سے بننے والی چیز کو “object” بھی کہا جاتا ہے۔ ابتدائی مرحلے میں آپ اسے instance کے طور پر ہی سمجھ سکتے ہیں، الگ سے فرق کرنے کی ضرورت نہیں۔

## خلاصہ

اس سبق میں ہم نے `struct` کو زیادہ گہرائی سے سیکھا، اور ساتھ ہی `class` سے بھی تعارف حاصل کیا؛ یہ دونوں types define کرنے کے لیے استعمال ہو سکتے ہیں۔

types instance بنا سکتے ہیں۔ جب instance بنتا ہے، تو constructor یعنی `init` call ہوتا ہے۔

`struct` کے لیے، اگر ہم constructor خود نہ لکھیں، تو system عموماً ایک مناسب constructor خودکار طور پر بنا دیتا ہے۔ اگر default constructor ضرورت پوری نہ کرے، تو ہم constructor خود بھی لکھ سکتے ہیں۔

اس کے علاوہ، ہم نے `struct` اور `class` کے فرق کو بھی ابتدائی طور پر سمجھا: `struct` ایک value type ہے، اور `class` ایک reference type ہے۔ SwiftUI میں ابتدائی مرحلے پر عام طور پر زیادہ سامنا `struct` ہی سے ہوتا ہے۔

بعد میں جب ہم view میں value passing، data model اور state management سیکھیں گے، تو یہ سب مواد مسلسل کام آئے گا۔
