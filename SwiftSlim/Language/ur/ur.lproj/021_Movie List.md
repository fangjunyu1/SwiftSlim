# فلموں کی فہرست

اس سبق میں ہم ایک فلموں کی فہرست بنائیں گے۔

![movie](../../Resource/021_movie.png)

فہرست میں ہر فلم کا پوسٹر، نام، ہدایت کار اور ریٹنگ دکھائی جائے گی۔

اس مثال میں ہم ایک بہت اہم تصور سیکھیں گے: `struct` اسٹرکچر۔ یہ ہمیں ایک فلم کی کئی معلومات کو ایک مکمل اکائی میں جوڑنے میں مدد دیتا ہے۔ اس کے علاوہ ہم `UUID()`، `ForEach`، تقسیمی لکیر `Divider`، اور کس طرح کسٹم آبجیکٹس کے ذریعے ڈیٹا منظم کیا جاتا ہے، ان سب سے بھی واقف ہوں گے۔

یہ معلومات بعد کی SwiftUI ڈیولپمنٹ میں بہت عام ہیں۔ اس سبق کے بعد آپ نہ صرف ایک فلموں کی فہرست بنا سکیں گے بلکہ یہ بھی سمجھنا شروع کریں گے کہ "ڈیٹا کے ایک مجموعے کو انٹرفیس کی شکل میں کیسے دکھایا جاتا ہے"۔

## ایک فلم

ہم پہلے ایک واحد فلم کے انٹرفیس سے شروعات کر سکتے ہیں۔

![movie](../../Resource/021_movie1.png)

اس انٹرفیس کی ترتیب بنیادی طور پر دو حصوں پر مشتمل ہے: بائیں جانب فلم کا پوسٹر ہے، اور دائیں جانب فلم کا تعارف۔

### فلم کا پوسٹر

بائیں طرف فلم کا پوسٹر دکھایا جاتا ہے، اور ہم تصویر دکھانے کے لیے `Image` استعمال کر سکتے ہیں۔

مثال کے طور پر:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

اس کوڈ کا مطلب ہے کہ `"The Shawshank Redemption"` نام کی ایک تصویر دکھائی جائے۔

یہاں اس بات پر توجہ دینی چاہیے کہ تصویر کا نام واقعی `Assets` ریسورس فولڈر میں موجود ہونا چاہیے، ورنہ انٹرفیس یہ تصویر درست طور پر نہیں دکھا پائے گا۔

![movie](../../Resource/021_movie2.png)

ان موڈیفائرز کے افعال یہ ہیں:

- `resizable()` کا مطلب ہے کہ تصویر کا سائز بدلا جا سکتا ہے۔
- `scaledToFit()` کا مطلب ہے کہ اسکیل کرتے وقت اصل تناسب برقرار رہے گا تاکہ تصویر کھنچے یا بگڑے نہیں۔
- `frame(height: 180)` کا مطلب ہے کہ تصویر کی اونچائی 180 رکھی گئی ہے۔
- `cornerRadius(10)` کا مطلب ہے کہ تصویر کے کونے 10 کے رداس کے ساتھ گول کیے گئے ہیں۔

اس طرح ہمیں مناسب سائز اور گول کناروں والا فلمی پوسٹر مل جائے گا۔

![movie](../../Resource/021_movie3.png)

### فلم کا تعارف

دائیں جانب فلم کا تعارف دکھایا جاتا ہے، جس میں فلم کا نام، ہدایت کار اور ریٹنگ شامل ہوتی ہے۔

![movie](../../Resource/021_movie4.png)

ہم اس حصے کو دکھانے کے لیے `Text` استعمال کر سکتے ہیں:

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

اس کوڈ میں `.font` فونٹ کے سائز کو ظاہر کرتا ہے، اور `.fontWeight` فونٹ کی موٹائی کو ظاہر کرتا ہے۔

تاکہ "فلم کا نام"، "ہدایت کار کی معلومات" اور "ریٹنگ کی معلومات" کے درمیان وقفہ زیادہ واضح ہو، یہاں سب سے بیرونی سطح پر `VStack` استعمال کیا گیا ہے، اور یہ سیٹنگ رکھی گئی ہے:

```swift
spacing: 10
```

اس کا مطلب ہے کہ اس `VStack` کے اندر ہر مواد کے گروپ کے درمیان فاصلہ 10 ہوگا۔

ہدایت کار اور ریٹنگ کو الگ الگ `VStack` میں لپیٹنے کی وجہ یہ ہے کہ دونوں "عنوان + مواد" جیسی ساخت رکھتے ہیں۔ اس لیے انٹرفیس کی سطحیں زیادہ واضح ہو جاتی ہیں، اور بعد میں اسٹائل کو ایڈجسٹ کرنا بھی آسان ہو جاتا ہے۔

اس کے علاوہ، `VStack` بطورِ ڈیفالٹ درمیان میں الائن ہوتا ہے۔ تاکہ سارا متن بائیں طرف سیدھا ہو، ہم یہ سیٹ کرتے ہیں:

```swift
alignment: .leading
```

اس طرح فلمی تعارف والا حصہ زیادہ منظم نظر آتا ہے۔

### تقسیمی لکیر

اب اگرچہ فلمی تعارف کا مواد `spacing` کے ذریعے الگ کیا گیا ہے، پھر بھی مختلف حصوں کے درمیان سرحد کافی واضح نہیں ہے۔

اس وقت ہم ایک تقسیمی لکیر شامل کر سکتے ہیں:

```swift
Divider()
```

مثال کے طور پر:

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

اس طرح فلمی تعارف والے حصے میں واضح تقسیم کا اثر پیدا ہو جائے گا۔

![movie](../../Resource/021_movie4.png)

`Divider` ایک بہت سادہ مگر بہت عام استعمال ہونے والا view ہے، جس کا کام مختلف مواد کو الگ کرنا ہے۔

`VStack` میں `Divider()` ایک افقی لکیر کے طور پر دکھائی دیتا ہے۔

`HStack` میں `Divider()` ایک عمودی لکیر کے طور پر دکھائی دیتا ہے۔

اس کے علاوہ `.frame`، `.background`، `.padding` وغیرہ کے ذریعے `Divider` کے انداز کو بھی تبدیل کیا جا سکتا ہے۔

مثال کے طور پر:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

یہ ایک نیلی تقسیمی لکیر بنائے گا جس کی موٹائی 2 ہوگی اور بائیں دائیں اندرونی فاصلہ موجود ہوگا۔

![divider](../../Resource/021_divider.png)

### مکمل انٹرفیس

آخر میں ہم `HStack` استعمال کر سکتے ہیں تاکہ فلم کا پوسٹر اور فلمی تعارف کو بائیں اور دائیں ترتیب میں رکھا جا سکے۔

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

یہاں `HStack(spacing: 20)` کا مطلب ہے کہ بائیں اور دائیں دونوں حصوں کے درمیان 20 کا فاصلہ رکھا گیا ہے۔

یہ بات قابلِ توجہ ہے کہ `Divider()` بھی، بالکل پہلے بیان کیے گئے `TextField` اور `Slider` کی طرح، بطورِ ڈیفالٹ ممکنہ حد تک دستیاب جگہ گھیرنے کی کوشش کرتا ہے۔

اسی لیے ہم دائیں جانب تعارفی حصے کے بیرونی `VStack` کو ایک مقررہ چوڑائی دیتے ہیں:

```swift
.frame(width: 200)
```

اس طرح تقسیمی لکیر اور متن والے حصے کی چوڑائی ایک جیسی رہے گی، اور مجموعی ترتیب زیادہ صاف نظر آئے گی۔

یہاں تک ہم "ایک فلم" کا ڈسپلے انٹرفیس مکمل کر چکے ہیں۔

![movie](../../Resource/021_movie1.png)

## فلموں کو ارے میں محفوظ کرنا

اگر ہم کئی فلموں کو ایک ہی انداز میں ایک کے بعد ایک دکھانا چاہتے ہیں، تو اس کا مطلب ہے کہ ہر فلم کے لیے ملتا جلتا کوڈ بار بار لکھنا پڑے گا۔

مثال کے طور پر:

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

اگرچہ ایسا کوڈ مطلوبہ نتیجہ دے سکتا ہے، لیکن کوڈ مزید لمبا ہوتا جائے گا اور اس کی دیکھ بھال بہت مشکل ہو جائے گی۔

مثلاً اگر ہمیں تمام فلموں کے درمیان فاصلہ `20` سے بدل کر `15` کرنا ہو، یا دائیں حصے کی چوڑائی `200` سے بدل کر
`220` کرنی ہو، تو ہمیں ہر دہرائے گئے کوڈ ٹکڑے کو دستی طور پر تبدیل کرنا پڑے گا۔

واضح ہے کہ یہ مؤثر طریقہ نہیں ہے۔

ہم پہلے ارے سیکھ چکے ہیں، اور یہ بھی کہ `ForEach` کے ذریعے ارے کی بنیاد پر بار بار views کیسے دکھائے جاتے ہیں۔

مثال کے طور پر:

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

یہ طریقہ ان صورتوں کے لیے بہت موزوں ہے جہاں "صرف ایک ہی قسم کا ڈیٹا" ہو، جیسے تصویروں کے ناموں کا ایک مجموعہ۔

لیکن ایک فلم صرف ایک قدر نہیں ہوتی۔ کم از کم اس میں یہ چیزیں شامل ہوتی ہیں:

1. فلم کا پوسٹر
2. فلم کا نام
3. ہدایت کار
4. ریٹنگ

یعنی ایک فلم دراصل باہم مربوط معلومات کا ایک مجموعہ ہے، نہ کہ صرف ایک الگ سٹرنگ۔

اگر ہم صرف ارے استعمال کریں، تو ہم اس معلومات کو صرف الگ الگ محفوظ کر سکتے ہیں:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

اور دکھانے کے وقت ہمیں ایک ہی انڈیکس کے ذریعے ان کو آپس میں ملانا پڑے گا:

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

اس طرزِ تحریر کا مسئلہ یہ ہے کہ اس کی دیکھ بھال کی لاگت بہت زیادہ ہے۔

کیونکہ ایک فلم کا ڈیٹا کئی اروں میں بکھرا ہوا ہوتا ہے، اگر کسی ایک ارے میں ایک اضافی عنصر ہو، ایک عنصر کم ہو جائے، یا ترتیب مختلف ہو، تو ڈسپلے کا نتیجہ غلط ہو جائے گا۔

خاص طور پر جب آپ فلمیں شامل یا حذف کرتے ہیں تو آپ کو ایک ہی وقت میں کئی ارے تبدیل کرنے پڑتے ہیں، اور کچھ نہ کچھ چھوٹ جانا بہت آسان ہوتا ہے۔

تو پھر "فلم کا نام، ہدایت کار، ریٹنگ" جیسی معلومات کو ایک اکائی میں کیسے جوڑا جائے؟

اس کے لیے ہمیں `struct` کی ضرورت ہوتی ہے۔

## `struct` کی تعریف

Swift میں `struct` کا مطلب "اسٹرکچر" ہوتا ہے۔

آپ اسے "کسٹم ڈیٹا ٹائپ" کے طور پر سمجھ سکتے ہیں، جو کئی باہم مربوط فیلڈز کو ایک اکائی میں جمع کر سکتا ہے۔

بنیادی استعمال:

```swift
struct StructName {
	let name: String
}
```

اس کوڈ میں `struct` ایک کلیدی لفظ ہے، جس کا مطلب ہے کہ ہم ایک اسٹرکچر تعریف کر رہے ہیں۔ `StructName` اس اسٹرکچر کا نام ہے۔

کروشی بریکٹس کے اندر کا مواد وہ فیلڈز ہیں جو اس اسٹرکچر میں شامل ہیں، اور ہر فیلڈ کے لیے نام اور ٹائپ واضح طور پر درج کرنا ضروری ہے۔

عام طور پر `struct` کا نام بڑے حرف سے شروع ہوتا ہے، جیسے `Movie`، `Student`، `UserInfo`۔ یہ Swift میں ایک عام naming convention ہے۔

آپ `struct` کو ایک خالی پیکنگ باکس کے طور پر سمجھ سکتے ہیں، جس میں ہر فیلڈ ایک پہلے سے طے شدہ خالی جگہ کی طرح ہے۔

جب تک ان خانوں میں مواد نہیں بھرا جاتا، یہ صرف ایک خالی باکس ہے۔ صرف اس وقت جب تمام فیلڈز مناسب قدروں سے بھر دی جاتی ہیں، یہ ایک مکمل تحفے کے ڈبے کی طرح بن جاتا ہے۔

### `struct` کا instance

ابھی ہم نے صرف اسٹرکچر کو تعریف کیا ہے، یعنی باکس کی شکل تیار کی ہے۔

اب ہمیں اس میں حقیقی مواد بھرنا ہوگا تاکہ ایک قابلِ استعمال "instance" حاصل ہو سکے۔

instance بناتے وقت عام طور پر اسٹرکچر کے نام کے بعد `()` لگایا جاتا ہے:

```swift
StructName(...)
```

ان گول بریکٹس کے اندر وہ فیلڈ ویلیوز لکھی جاتی ہیں جن کی اس اسٹرکچر کو ضرورت ہوتی ہے۔

مثال کے طور پر:

```swift
StructName(name: "Fang Junyu")
```

اس کوڈ کا مطلب ہے: `StructName` اسٹرکچر کے مطابق ایک نیا instance بنائیں، اور اس کے `name` فیلڈ کو `"Fang Junyu"` کی قدر دیں۔

جب ہم تمام مطلوبہ فیلڈز کی قدریں بھر دیتے ہیں تو یہ گویا باکس کے اندر مکمل مواد بھر دینے کے برابر ہوتا ہے۔

اس وقت ہمیں ایک مکمل اسٹرکچر instance مل جاتا ہے۔

### `struct` کی properties تک رسائی

جب ہم instance بنا لیتے ہیں، تو ہم اس کی اندرونی properties تک رسائی کے لیے "dot syntax" استعمال کر سکتے ہیں۔

بنیادی لکھنے کا طریقہ:

```swift
instance.propertyName
```

مثال کے طور پر:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

یہاں `st` اسٹرکچر کا ایک instance ہے، اور `st.name` کا مطلب ہے اس instance کے `name` کی قدر کو پڑھنا۔

اس طریقے کو یوں سمجھا جا سکتا ہے کہ جب ہم `st.name` لکھتے ہیں تو گویا ہم باکس کے اندر ایک خاص خانے میں رکھا ہوا مواد پڑھ رہے ہوتے ہیں۔

اس قسم کی لکھائی بعد کے SwiftUI انٹرفیسز میں بہت کثرت سے دکھائی دے گی۔

مثلاً اگر ہمارے پاس ایک طالب علم کا اسٹرکچر ہو جس میں نام، عمر اور کلاس شامل ہوں، تو انٹرفیس میں دکھاتے وقت ہم الگ الگ یوں پڑھ سکتے ہیں:

```swift
student.name
student.age
student.className
```

اس طریقے کا فائدہ یہ ہے کہ ڈیٹا زیادہ واضح ہو جاتا ہے، اور اس کا انتظام بھی آسان ہو جاتا ہے۔

### `struct` کی جگہ

ابتدائی سیکھنے والوں کے لیے عموماً اسٹرکچر کو `ContentView` کے باہر لکھنا زیادہ آسان ہوتا ہے۔

مثال کے طور پر:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

اس طرح اسٹرکچر زیادہ واضح رہتا ہے، اور اسے پڑھنا بھی آسان ہوتا ہے۔

آپ یہ بھی دیکھیں گے کہ `ContentView` خود بھی دراصل ایک `struct` ہے۔

### `Movie` اسٹرکچر

اوپر کی بنیاد کے ساتھ اب ہم فلم کے لیے ایک اسٹرکچر تعریف کر سکتے ہیں:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

یہ `Movie` نام کا ایک اسٹرکچر ہے، جس میں تین فیلڈز ہیں: `name`، `director` اور `rating`، جو بالترتیب فلم کا نام، ہدایت کار اور ریٹنگ کو ظاہر کرتے ہیں۔

اس طرح ایک فلم سے متعلق معلومات کو اب کئی اروں میں تقسیم کرنے کی ضرورت نہیں رہتی، بلکہ انہیں براہِ راست ایک مکمل اکائی کے طور پر جمع کیا جا سکتا ہے۔

مثال کے طور پر ہم ایسا ایک فلمی instance بنا سکتے ہیں:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

یہ instance "ایک مکمل فلمی ڈیٹا سیٹ" کی نمائندگی کرتا ہے۔

### اسٹرکچر کو ارے میں محفوظ کرنا

ہم نے پہلے کہا تھا کہ ایک ارے صرف ایک ہی قسم کا ڈیٹا محفوظ کرتا ہے۔

اب چونکہ ہمارے پاس `Movie` اسٹرکچر موجود ہے، اس لیے ارے میں کئی `Movie` محفوظ کیے جا سکتے ہیں۔

```swift
let lists: [Movie] = []
```

مثال کے طور پر:

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

اس ارے `lists` میں سٹرنگز نہیں بلکہ کئی `Movie` instances محفوظ ہیں۔

یعنی ارے کا ہر عنصر ایک مکمل فلم ہے۔

اس طرح جب ہمیں فلموں کی فہرست دکھانی ہو، تو ہم `ForEach` کے ذریعے ایک ایک فلم کو باری باری پڑھ سکتے ہیں۔

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

یہاں `movie in` کا مطلب ہے کہ ہر چکر میں ارے سے ایک فلم نکالی جاتی ہے اور عارضی طور پر اسے `movie` کہا جاتا ہے۔

پھر ہم:

```swift
movie.name
movie.director
movie.rating
```

کے ذریعے اس فلم کا نام، ہدایت کار اور ریٹنگ الگ الگ پڑھ کر انٹرفیس میں دکھا سکتے ہیں۔

## `ForEach` کی خرابی

یہاں تک ہم فلموں کے ارے اور `ForEach` کی بنیادی لکھائی مکمل کر چکے ہیں۔

لیکن اگر ہم یہ کوڈ براہِ راست چلائیں:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

تو ایک خرابی ظاہر ہوگی:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

اس خرابی کا مطلب یہ ہے کہ جب آپ `id: \.self` لکھتے ہیں، تو SwiftUI کو ارے کے ہر عنصر کو "منفرد شناخت" کے طور پر استعمال کرنا پڑتا ہے تاکہ وہ انہیں ایک دوسرے سے الگ کر سکے۔

یہ طرزِ تحریر `String` اور `Int` جیسے سادہ ٹائپس کے لیے مناسب ہے، کیونکہ انہیں خود ان کی بنیاد پر نسبتاً آسانی سے پہچانا جا سکتا ہے۔

لیکن `Movie` ہمارا اپنا بنایا ہوا اسٹرکچر ہے، اور `ForEach` نہیں جانتا کہ خود اس اسٹرکچر کو ایک منفرد شناخت کے طور پر کیسے استعمال کرے، اسی لیے یہ خرابی آتی ہے۔

اس مسئلے کا سب سے عام حل یہ ہے کہ `Movie` کو `Identifiable` پروٹوکول کے مطابق بنایا جائے۔

## پروٹوکول

Swift میں پروٹوکول کو ایک طرح کے "قواعد" یا "مطالبات" کے طور پر سمجھا جا سکتا ہے۔

اس کی مثال ایک بین الاقوامی تنظیم کے معاہدے کی طرح دی جا سکتی ہے: اگر کوئی ملک کسی بین الاقوامی تنظیم میں شامل ہونا چاہے، تو اسے عام طور پر پہلے اس تنظیم کے کچھ قواعد پورے کرنے ہوتے ہیں، کچھ معلومات مہیا کرنی ہوتی ہیں، اور مشترک اصولوں کی پابندی کرنی ہوتی ہے۔ ان شرائط کو پورا کرنے کے بعد ہی وہ اس میں شامل ہو سکتا ہے یا کچھ معاملات میں حصہ لے سکتا ہے۔

پروٹوکول بھی اسی منطق سے کام کرتا ہے۔

جب کوئی ٹائپ کسی پروٹوکول کے مطابق ہونا چاہتی ہے، تو اسے ان تقاضوں کو پورا کرنا ہوتا ہے جو وہ پروٹوکول طے کرتا ہے۔ ان تقاضوں کو پورا کرنے کے بعد ہی وہ ٹائپ متعلقہ فیچرز استعمال کر سکتی ہے۔

بنیادی لکھائی:

```swift
struct Movie: Identifiable {
    // ...
}
```

یہاں `: Identifiable` کا مطلب ہے کہ `Movie`، `Identifiable` پروٹوکول کی پابندی کرتی ہے۔

اگر ایک ٹائپ کئی پروٹوکولز کو ایک ساتھ فالو کرتی ہو، تو انہیں کوما سے الگ کیا جا سکتا ہے:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` کے لیے سب سے اہم شرط یہ ہے کہ اس ٹائپ میں ایک `id` ہو جو خود اس کی شناخت کر سکے۔

مثال کے طور پر:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

یہاں `id` شناختی نمبر کی طرح ہے، جو ہر فلم کو دوسری سے الگ کرنے کے لیے استعمال ہوتا ہے۔

جب تک ہر فلم کا `id` مختلف ہوگا، SwiftUI ارے کے ہر عنصر کو درست طور پر الگ پہچان سکے گا۔

مثال کے طور پر:

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

پھر `ForEach` میں یوں استعمال کریں:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

تب یہ خرابی نہیں آئے گی۔

چونکہ `Movie` پہلے ہی `Identifiable` کے مطابق ہے، اس لیے ایک اور زیادہ عام لکھائی یہ ہے کہ `id:` کو مکمل طور پر چھوڑ دیا جائے:

```swift
ForEach(lists) { movie in
    // ...
}
```

کیونکہ SwiftUI پہلے ہی جانتا ہے کہ ہر عنصر کو الگ کرنے کے لیے `movie.id` استعمال کرنا ہے۔

## `ForEach` میں شناختی id

اب ہم `ForEach` میں `id` کے کردار کو تھوڑا اور گہرائی سے سمجھتے ہیں۔

مثال کے طور پر:

```swift
ForEach(lists, id: \.self)
```

یہاں اس کا مطلب ہے: خود عنصر کو شناختی نشان کے طور پر استعمال کرنا۔

اور:

```swift
ForEach(lists, id: \.id)
```

اس کا مطلب ہے: عنصر کے `id` فیلڈ کو شناختی نشان کے طور پر استعمال کرنا۔

اگر کوئی فیلڈ خود ہی انفرادیت کی ضمانت دے سکتی ہو، تو اسے بھی عارضی طور پر استعمال کیا جا سکتا ہے۔

مثال کے طور پر اگر ہر فلم کا نام مختلف ہو، تو موجودہ ڈیٹا میں یہ لکھائی بھی درست کام کر سکتی ہے:

```swift
ForEach(lists, id: \.name)
```

لیکن یہاں ایک پوشیدہ مسئلہ ہے: `name` لازماً ہمیشہ منفرد نہیں ہوتا۔

فرض کریں بعد میں آپ ایک اور فلم شامل کرتے ہیں جس کا نام پہلے جیسا ہی ہے، تو `name` اب ہر عنصر کو درست طور پر الگ نہیں کر پائے گا۔

ایسی صورت میں کوڈ شاید پھر بھی compile ہو جائے، لیکن view کو اپ ڈیٹ کرتے وقت، insert، delete یا modify کرتے وقت SwiftUI عناصر کو غلط طور پر پہچان سکتا ہے، جس سے ڈسپلے میں خرابی آ سکتی ہے۔

اسی لیے جب ڈیٹا کو مستقل اور قابلِ اعتماد انداز میں الگ کرنا ضروری ہو، تو بہترین انتخاب واقعی منفرد فیلڈ یعنی `id` ہے۔

## UUID

اگرچہ `id: 1`، `id: 2` کو دستی طور پر لکھنا مسئلہ حل کر سکتا ہے، پھر بھی ایک خطرہ باقی رہتا ہے: ممکن ہے ہم غلطی سے ایک ہی `id` دوبارہ لکھ دیں، اور منفرد شناخت بے معنی ہو جائے۔

مثال کے طور پر:

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

اس طرح دو ایک جیسے `id` سامنے آ جائیں گے، اور منفرد شناخت ناکام ہو جائے گی۔

دستی غلطیوں سے بچنے کے لیے ہم عموماً `UUID()` استعمال کرتے ہیں۔

Swift میں `UUID()` ایک 128-bit شناختی نمبر بے ترتیب طور پر پیدا کرتا ہے۔ یہ عام طور پر حروف اور اعداد پر مشتمل ایک لمبی سٹرنگ جیسا دکھائی دیتا ہے۔

مثال کے طور پر:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

یہاں `UUID()` دراصل `UUID` ٹائپ کا ایک instance بناتا ہے؛ آپ اسے خودکار طور پر پیدا ہونے والے "منفرد نمبر" کے طور پر سمجھ سکتے ہیں۔

اسی لیے ہر بار بننے والی قدر تقریباً کبھی دہرائی نہیں جاتی، اور یہ `id` کے طور پر استعمال کرنے کے لیے بہت موزوں ہے۔

ہم `Movie` کو یوں تبدیل کر سکتے ہیں:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

اس کوڈ کا مطلب ہے کہ `Movie` اسٹرکچر میں `id` فیلڈ کو بطورِ ڈیفالٹ ایک نئے `UUID` instance کی قدر دی جائے گی۔

یعنی ہر بار جب ہم ایک نیا `Movie` بنائیں گے، نظام خودکار طور پر ہمارے لیے پہلے ایک منفرد `id` پیدا کرے گا۔

چونکہ `id` کے پاس پہلے ہی ڈیفالٹ ویلیو موجود ہے، اس لیے بعد میں `Movie` instances بناتے وقت ہمیں دستی طور پر `id` نہیں بھرنا پڑے گا۔

مثال کے طور پر:

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

اگرچہ یہاں `id` لکھا نہیں گیا، لیکن عملی طور پر ہر فلمی instance کے پاس پھر بھی اپنا `id` ہوتا ہے؛ بس یہ قدر `UUID()` کے ذریعے خودکار طور پر بن چکی ہوتی ہے۔

اس طریقے کے بعد ہمیں ہر فلم کے لیے الگ سے `id` لکھنے کی ضرورت نہیں رہتی، جس سے نہ صرف کوڈ کم ہوتا ہے بلکہ ایک جیسے id لکھ دینے کی غلطیوں سے بھی بچا جا سکتا ہے۔

آخر میں ہمیں صرف اوپر ایک `Banner` تصویر شامل کرنی ہے اور `ScrollView` استعمال کرنا ہے تاکہ مواد اسکرول ہو سکے، اور یوں پوری فلموں کی فہرست کا صفحہ مکمل ہو جائے گا۔

## خلاصہ

اس سبق میں ہم نے ایک بہت اہم تصور سیکھا: `struct`۔

`struct` کے ذریعے ہم ایک فلم کی کئی متعلقہ فیلڈز کو ایک مکمل اکائی میں جمع کر سکتے ہیں، بجائے اس کے کہ نام، ہدایت کار اور ریٹنگ کو کئی الگ اروں میں تقسیم کریں۔

ڈیٹا کو ایک جگہ جمع کرنے کے بعد ہم `ForEach` استعمال کر کے ارے میں موجود ہر فلم کو ایک ایک کر کے view میں دکھا سکتے ہیں۔

اسی کے ساتھ ہم نے `ForEach` میں "شناختی id" کے کردار کو بھی سمجھا۔ SwiftUI کو یہ جاننا ضروری ہوتا ہے کہ ارے کے ہر عنصر کو کیسے الگ پہچانا جائے تاکہ view کو درست طور پر دکھایا اور اپ ڈیٹ کیا جا سکے۔

اسی لیے ہم نے `Movie` کو `Identifiable` پروٹوکول کے مطابق بنایا، اور اسے ایک منفرد `id` دیا۔

دستی طور پر `id` بھرنے میں غلطیوں سے بچنے کے لیے ہم نے `UUID()` بھی سیکھا، جو سسٹم کو خودکار طور پر منفرد شناختی نمبر بنانے دیتا ہے۔

اس سبق کے بعد آپ نے نہ صرف ایک فلموں کی فہرست مکمل کی، بلکہ SwiftUI کے ایک اہم طریقۂ کار سے بھی واقفیت حاصل کی: **پہلے ڈیٹا کو منظم کریں، پھر اسی بنیاد پر view تیار کریں۔**

## مکمل کوڈ

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
