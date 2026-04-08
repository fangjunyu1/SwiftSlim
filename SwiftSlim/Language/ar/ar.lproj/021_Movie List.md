# قائمة الأفلام

في هذا الدرس، سننشئ قائمة أفلام.

![movie](../../Resource/021_movie.png)

ستعرض القائمة ملصق كل فيلم، واسمه، والمخرج، والتقييم.

في هذا المثال، سنتعلم نقطة معرفية مهمة جدًا: البنية `struct`. فهي تساعدنا على جمع عدة معلومات تخص فيلمًا واحدًا في كيان واحد. إضافة إلى ذلك، سنتعرف أيضًا إلى `UUID()` و`ForEach` وخط الفصل `Divider`، وكيفية استخدام كائنات مخصصة لإدارة البيانات.

هذه المعارف شائعة جدًا في تطوير SwiftUI لاحقًا. وبعد إنهاء هذا الدرس، لن تتمكن فقط من إنشاء قائمة أفلام، بل ستبدأ أيضًا في فهم "كيفية عرض مجموعة من البيانات على الواجهة".

## فيلم واحد

يمكننا أن نبدأ أولًا من واجهة فيلم واحد.

![movie](../../Resource/021_movie1.png)

يتكوّن تخطيط هذه الواجهة أساسًا من جزأين: على اليسار ملصق الفيلم، وعلى اليمين معلومات الفيلم.

### ملصق الفيلم

الجزء المعروض على اليسار هو ملصق الفيلم، ويمكننا استخدام `Image` لعرض الصورة.

على سبيل المثال:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

يمثل هذا المقطع عرض صورة اسمها `"The Shawshank Redemption"`.

يجب الانتباه هنا إلى أن اسم الصورة يجب أن يكون موجودًا فعلًا داخل مجلد الموارد `Assets`، وإلا فلن تتمكن الواجهة من عرض هذه الصورة بشكل صحيح.

![movie](../../Resource/021_movie2.png)

وظائف هذه المعدلات هي:

- `resizable()` تعني أن الصورة يمكن تغيير حجمها.
- `scaledToFit()` تعني الحفاظ على النسبة الأصلية أثناء التحجيم لتجنب تمدد الصورة وتشوهها.
- `frame(height: 180)` تعني ضبط ارتفاع الصورة على 180.
- `cornerRadius(10)` تعني تعيين زوايا مستديرة بمقدار 10 للصورة.

وبهذه الطريقة، يمكننا الحصول على صورة ملصق فيلم بحجم مناسب مع زوايا مستديرة.

![movie](../../Resource/021_movie3.png)

### معلومات الفيلم

الجزء المعروض على اليمين هو معلومات الفيلم، وتشمل اسم الفيلم، والمخرج، والتقييم.

![movie](../../Resource/021_movie4.png)

يمكننا استخدام `Text` لعرض هذا الجزء:

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

في هذا المقطع، تشير `.font` إلى حجم الخط، وتشير `.fontWeight` إلى سماكة الخط.

ولجعل المسافات بين "اسم الفيلم" و"معلومات المخرج" و"معلومات التقييم" أوضح، استخدمنا هنا `VStack` في الطبقة الخارجية، وعيّنا:

```swift
spacing: 10
```

وهذا يعني أن المسافة بين كل مجموعة من المحتوى داخل هذا `VStack` هي 10.

أما سبب استخدام `VStack` منفصل لكل من المخرج والتقييم، فهو أن كليهما ينتمي إلى بنية من نوع "عنوان + محتوى". لذلك ستصبح طبقات الواجهة أوضح، وسيكون تعديل النمط لاحقًا أسهل أيضًا.

إضافة إلى ذلك، يكون `VStack` بمحاذاة وسطية افتراضيًا. ولكي يكون النص كله بمحاذاة إلى اليسار، نضبط:

```swift
alignment: .leading
```

وبذلك يبدو جزء معلومات الفيلم أكثر ترتيبًا.

### خط الفصل

الآن، رغم أن محتوى معلومات الفيلم أصبح متباعدًا عبر `spacing`، فإن حدود الفصل بين العناصر المختلفة ما تزال غير واضحة بما يكفي.

في هذه الحالة، يمكننا إضافة خط فصل:

```swift
Divider()
```

على سبيل المثال:

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

وبهذه الطريقة، سيظهر في جزء معلومات الفيلم تأثير فصل أوضح.

![movie](../../Resource/021_movie4.png)

`Divider` هو عنصر بسيط جدًا لكنه كثير الاستخدام، ووظيفته فصل المحتوى المختلف عن بعضه.

في `VStack`، يظهر `Divider()` على شكل خط أفقي.

وفي `HStack`، يظهر `Divider()` على شكل خط عمودي.

إضافة إلى ذلك، يمكننا أيضًا تعديل نمط `Divider` عبر `.frame` و`.background` و`.padding` وغيرها.

على سبيل المثال:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

سيؤدي هذا إلى إنشاء خط فصل أزرق بسماكة 2 ومع حشوة أفقية على الجانبين.

![divider](../../Resource/021_divider.png)

### الواجهة الكاملة

أخيرًا، يمكننا استخدام `HStack` لترتيب ملصق الفيلم ومعلومات الفيلم جنبًا إلى جنب.

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

يشير `HStack(spacing: 20)` هنا إلى ترك مسافة قدرها 20 بين الجزأين الأيمن والأيسر.

ويجب الانتباه إلى أن `Divider()`، مثل `TextField` و`Slider` اللذين تحدثنا عنهما سابقًا، يحاول افتراضيًا شغل المساحة المتاحة قدر الإمكان.

لذلك، نعيّن عرضًا ثابتًا لـ `VStack` الخارجية في الجزء الوصفي على اليمين:

```swift
.frame(width: 200)
```

وبهذا يمكن أن يبقى عرض خط الفصل ومنطقة النص متطابقين، فيبدو الشكل العام أكثر ترتيبًا.

وهنا نكون قد أكملنا واجهة عرض "فيلم واحد".

![movie](../../Resource/021_movie1.png)

## استخدام المصفوفة لحفظ الأفلام

إذا أردنا عرض عدة أفلام بالتنسيق نفسه واحدًا بعد الآخر، فهذا يعني أن علينا كتابة كود مشابه لكل فيلم.

على سبيل المثال:

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

رغم أن كتابة الكود بهذه الطريقة تحقق النتيجة المطلوبة، فإن الكود سيزداد أكثر فأكثر، كما أن صيانته ستكون مزعجة جدًا.

فمثلًا، إذا احتجنا إلى تعديل المسافة بين جميع الأفلام من `20` إلى `15`، أو تعديل عرض الجزء الأيمن من `200` إلى
`220`، فسنضطر إلى تعديل كل مقطع مكرر يدويًا.

ومن الواضح أن هذه ليست طريقة فعالة.

لقد تعلمنا سابقًا المصفوفات، وتعلمنا أيضًا استخدام `ForEach` لتكرار عرض الواجهات اعتمادًا على المصفوفة.

على سبيل المثال:

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

هذه الطريقة مناسبة جدًا لمعالجة حالة "وجود عنصر بيانات واحد فقط"، مثل مجموعة من أسماء الصور.

لكن الفيلم الواحد لا يحتوي على قيمة واحدة فقط. فهو يتضمن على الأقل:

1. ملصق الفيلم
2. اسم الفيلم
3. المخرج
4. التقييم

أي أن الفيلم في الحقيقة مجموعة من البيانات المرتبطة، وليس مجرد سلسلة نصية منفردة.

إذا استخدمنا المصفوفات فقط، فلن يكون أمامنا سوى حفظ هذه المعلومات بشكل منفصل:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

وعند العرض، سنعتمد على الفهرس نفسه لمطابقة هذه القيم واحدة تلو الأخرى:

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

المشكلة في هذه الكتابة هي أن تكلفة الصيانة مرتفعة جدًا.

لأن بيانات الفيلم الواحد تصبح موزعة على عدة مصفوفات، وما إن توجد مصفوفة بها عنصر زائد أو ناقص أو يختلف ترتيبها، حتى تصبح نتيجة العرض خاطئة.

وخصوصًا عند إضافة فيلم جديد أو حذف فيلم، يجب عليك تعديل عدة مصفوفات في الوقت نفسه، ومن السهل جدًا أن تفوتك نقطة ما.

فكيف يمكننا جمع معلومات مثل "اسم الفيلم، والمخرج، والتقييم" في كيان واحد؟

هنا نحتاج إلى استخدام `struct`.

## تعريف البنية struct

في Swift، تعني `struct` "بنية".

ويمكنك فهمها على أنها "نوع بيانات مخصص" قادر على جمع عدة حقول مرتبطة معًا لتكوين كيان واحد.

الاستخدام الأساسي:

```swift
struct StructName {
	let name: String
}
```

في هذا المقطع، `struct` هي الكلمة المفتاحية التي تشير إلى أننا نعرّف بنية. و`StructName` هو اسم هذه البنية.

أما المحتوى داخل الأقواس المعقوفة فهو الحقول التي تحتويها هذه البنية، ويجب كتابة اسم كل حقل ونوعه بوضوح.

وعادةً يبدأ اسم `struct` بحرف كبير، مثل `Movie` و`Student` و`UserInfo`. وهذه عادة تسمية شائعة في Swift.

يمكنك أن تفهم `struct` ببساطة على أنها صندوق تغليف فارغ، وكل حقل فيها يشبه موضعًا فارغًا مخصصًا داخل هذا الصندوق.

وعندما لا تكون هذه المواضع قد امتلأت بعد، فإنه يظل مجرد صندوق فارغ. وفقط عندما نملأ كل الحقول بقيم مناسبة، يتحول إلى صندوق هدية مكتمل.

### مثيل struct

فيما سبق كنا فقط نعرّف البنية نفسها، وهذا يعادل تجهيز شكل صندوق التغليف.

لكننا ما زلنا بحاجة إلى ملء المحتوى الفعلي بداخلها، حتى نحصل على "مثيل" حقيقي قابل للاستخدام.

وعند إنشاء مثيل، نضيف عادةً `()` بعد اسم البنية:

```swift
StructName(...)
```

وما نكتبه داخل الأقواس هو محتوى الحقول المطلوب لهذه البنية.

على سبيل المثال:

```swift
StructName(name: "Fang Junyu")
```

يعني هذا المقطع: إنشاء مثيل جديد وفق صيغة البنية `StructName`، وإسناد القيمة `"Fang Junyu"` إلى الحقل `name`.

وعندما نملأ كل الحقول المطلوبة، فكأننا قد ملأنا صندوق التغليف بالكامل.

وعندها نحصل على مثيل بنية مكتمل.

### الوصول إلى خصائص struct

بعد إنشاء مثيل، يمكننا استخدام "صيغة النقطة" للوصول إلى الخصائص الداخلية فيه.

الكتابة الأساسية:

```swift
المثيل.اسم_الخاصية
```

على سبيل المثال:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

هنا `st` هو مثيل بنية، و`st.name` تعني قراءة قيمة `name` من هذا المثيل.

ويمكنك فهم هذه الطريقة على النحو التالي: عندما نكتب `st.name`، فكأننا نقرأ المحتوى المحفوظ في موضع معيّن داخل صندوق التغليف هذا.

ستظهر هذه الكتابة كثيرًا جدًا في واجهات SwiftUI لاحقًا.

فمثلًا، إذا كان لدينا هيكل طالب يتضمن الاسم والعمر والصف، فيمكننا عند العرض على الواجهة قراءة:

```swift
student.name
student.age
student.className
```

وفائدة هذا الأسلوب أن البيانات تصبح أوضح وأسهل في الإدارة.

### موضع struct

بالنسبة للمبتدئين، يمكن عادةً كتابة البنية خارج `ContentView`.

على سبيل المثال:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

وبهذه الطريقة يصبح الهيكل أوضح وأسهل في القراءة.

وستلاحظ أن `ContentView` نفسه هو أيضًا `struct`.

### البنية Movie

وبالاعتماد على ما سبق، يمكننا الآن تعريف بنية خاصة بالفيلم:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

هذه بنية اسمها `Movie`، وتتكون من ثلاثة حقول هي `name` و`director` و`rating`، وتمثل على الترتيب اسم الفيلم، والمخرج، والتقييم.

وبذلك لم نعد بحاجة إلى تفكيك المعلومات المرتبطة بفيلم واحد إلى عدة مصفوفات، بل يمكننا جمعها مباشرة في كيان واحد.

على سبيل المثال، يمكننا إنشاء مثيل فيلم بالشكل التالي:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

ويمثل هذا المثيل "بيانات فيلم كاملة".

### استخدام المصفوفة لحفظ البنى

لقد ذكرنا سابقًا أن المصفوفة لا يمكنها حفظ إلا عناصر من النوع نفسه.

والآن بعد أن أصبح لدينا هيكل `Movie`، يمكن للمصفوفة أن تحفظ عدة عناصر من `Movie`.

```swift
let lists: [Movie] = []
```

على سبيل المثال:

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

هذا يعني أن المصفوفة `lists` لا تحفظ سلاسل نصية، بل عدة مثيلات من `Movie`.

أي أن كل عنصر داخل المصفوفة يمثل فيلمًا كاملًا.

وبهذه الطريقة، عندما نحتاج إلى عرض قائمة الأفلام، يمكننا استخدام `ForEach` لقراءة كل فيلم بالتتابع.

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

يشير `movie in` هنا إلى أنه في كل دورة تكرار سيتم أخذ فيلم واحد من المصفوفة وتسميته مؤقتًا `movie`.

وبعد ذلك يمكننا استخدام:

```swift
movie.name
movie.director
movie.rating
```

لقراءة اسم هذا الفيلم، ومخرجه، وتقييمه، ثم عرضها على الواجهة.

## خطأ ForEach

إلى هنا نكون قد أكملنا الصياغة الأساسية لمصفوفة الأفلام و`ForEach`.

لكن عند تشغيل هذا المقطع مباشرة:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ستظهر رسالة الخطأ:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

ومعنى هذا الخطأ أنه عندما تكتب `id: \.self`، فإن SwiftUI تحتاج إلى اعتبار كل عنصر من عناصر المصفوفة نفسه "معرّفًا فريدًا" للتمييز بين العناصر.

هذه الكتابة مناسبة للأنواع البسيطة مثل `String` و`Int`، لأن التمييز بينها يكون سهلًا بطبيعته.

لكن `Movie` هو هيكل مخصص أنشأناه نحن، و`ForEach` لا يعرف كيف يعتبر الكيان نفسه معرّفًا فريدًا، لذلك يظهر الخطأ.

ولحل هذه المشكلة، فإن الطريقة الأكثر شيوعًا هي جعل `Movie` يلتزم بالبروتوكول `Identifiable`.

## البروتوكول

في Swift، يمكن فهم البروتوكول على أنه نوع من "القواعد" أو "المتطلبات".

ويمكن تشبيهه باتفاقيات المنظمات الدولية: إذا أرادت دولة ما الانضمام إلى منظمة دولية معينة، فعليها عادةً أولًا استيفاء بعض القواعد التي تطرحها المنظمة، والإفصاح عن بعض البيانات، والالتزام بمجموعة من القواعد المشتركة. وبعد تحقيق هذه الشروط فقط يمكنها الانضمام أو المشاركة في بعض الشؤون.

والبروتوكولات تعمل بمنطق مشابه.

فعندما يريد نوع ما الالتزام ببروتوكول معين، فعليه استيفاء المحتوى الذي يفرضه ذلك البروتوكول. وبعد استيفاء هذه المتطلبات فقط يستطيع هذا النوع استخدام الوظائف المقابلة.

الكتابة الأساسية:

```swift
struct Movie: Identifiable {
    // ...
}
```

يشير `: Identifiable` هنا إلى أن `Movie` يلتزم بالبروتوكول `Identifiable`.

وإذا كان نوع ما يلتزم بعدة بروتوكولات، فيمكن فصلها بفاصلة:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

وبالنسبة إلى `Identifiable`، فأهم متطلب فيه هو أن يحتوي النوع على `id` يمكنه من خلاله التعريف بنفسه.

على سبيل المثال:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

إن `id` هنا يشبه رقم الهوية، ويُستخدم للتمييز بين كل فيلم وآخر.

وما دامت قيمة `id` لكل فيلم مختلفة، فستتمكن SwiftUI من التمييز بشكل صحيح بين كل عنصر في المصفوفة.

على سبيل المثال:

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

ثم نستخدم داخل `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

وبذلك لن يظهر الخطأ.

ولأن `Movie` أصبح بالفعل ملتزمًا بـ `Identifiable`، فهناك كتابة أكثر شيوعًا وهي حذف `id:` مباشرة:

```swift
ForEach(lists) { movie in
    // ...
}
```

لأن SwiftUI تعرف بالفعل أنها ستستخدم `movie.id` للتمييز بين كل عنصر.

## معرّف التمييز في ForEach

سنفهم الآن بشكل أعمق دور `id` في `ForEach`.

على سبيل المثال:

```swift
ForEach(lists, id: \.self)
```

وهذا يعني: استخدام العنصر نفسه كمعرّف تمييز.

أما:

```swift
ForEach(lists, id: \.id)
```

فمعناه: استخدام الحقل `id` في العنصر كمعرّف تمييز.

وإذا كان هناك حقل ما يمكنه ضمان التفرد بطبيعته، فيمكن استخدامه مؤقتًا أيضًا.

فمثلًا إذا كانت أسماء كل الأفلام مختلفة، فقد تعمل الكتابة التالية بشكل طبيعي مع البيانات الحالية:

```swift
ForEach(lists, id: \.name)
```

لكن توجد هنا مشكلة خفية: `name` ليس مضمونًا أن يكون فريدًا دائمًا.

إذا أضفت لاحقًا فيلمًا آخر بالاسم نفسه، فلن يعود `name` قادرًا على التمييز بدقة بين كل عنصر.

في هذه الحالة، ورغم أن الكود قد يستمر في التجميع، فإن SwiftUI قد تواجه أخطاء في التعرف عند تحديث العرض أو إدراج العناصر أو حذفها، ما يؤدي إلى عرض غير طبيعي.

لذلك، عندما نحتاج إلى تمييز ثابت للبيانات، فمن الأفضل استخدام الحقل الفريد الحقيقي، أي `id`.

## UUID

رغم أن كتابة `id: 1` و`id: 2` يدويًا يمكن أن تحل المشكلة، فلا يزال هناك خطر يتمثل في احتمال كتابة `id` مكرر عن طريق الخطأ، وعندها يفقد المعرّف الفريد فعاليته.

على سبيل المثال:

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

وهكذا يظهر لدينا `id` متطابقان، فيفقد المعرّف الفريد فعاليته.

ولتجنّب الأخطاء اليدوية، نستخدم عادةً `UUID()`.

في Swift، ينشئ `UUID()` معرّفًا عشوائيًا بطول 128 بت. وغالبًا ما يظهر على شكل سلسلة طويلة من الأحرف والأرقام.

على سبيل المثال:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

إن `UUID()` هنا في الحقيقة ينشئ مثيلًا من النوع `UUID`، ويمكنك فهمه على أنه "رقم فريد" يُنشأ تلقائيًا.

ولذلك، فإن القيم التي ينشئها تكاد لا تتكرر أبدًا، مما يجعله مناسبًا جدًا للاستخدام كـ `id`.

يمكننا تعديل `Movie` إلى الشكل التالي:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

يعني هذا المقطع أن الحقل `id` داخل بنية `Movie` سيُمنح افتراضيًا مثيلًا جديدًا من `UUID`.

أي أنه في كل مرة ننشئ فيها `Movie` جديدًا، سيولّد لنا النظام أولًا `id` فريدًا تلقائيًا.

وبما أن `id` يملك بالفعل قيمة افتراضية، فلن نحتاج بعد ذلك إلى تعبئة `id` يدويًا عند إنشاء مثيلات `Movie`.

على سبيل المثال:

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

ورغم أننا لم نكتب `id` هنا، فإن مثيل الفيلم هذا ما يزال يملك `id` خاصًا به، لكن هذه القيمة وُلدت تلقائيًا بواسطة `UUID()`.

وبعد استخدام هذه الطريقة، لن نعود بحاجة إلى تعبئة `id` يدويًا لكل فيلم، وهذا لا يقلل حجم الكود فقط، بل يمنع أيضًا الأخطاء الناتجة عن تكرار قيم id.

وأخيرًا، يكفي أن نضيف صورة `Banner` في الأعلى، ونستخدم `ScrollView` لجعل المحتوى قابلًا للتمرير، حتى نكمل واجهة قائمة الأفلام بالكامل.

## الخلاصة

في هذا الدرس، تعلمنا نقطة معرفية مهمة جدًا: `struct`.

ومن خلال `struct`، يمكننا جمع عدة حقول مرتبطة بفيلم واحد في كيان واحد، بدلًا من تفكيك الاسم والمخرج والتقييم إلى عدة مصفوفات منفصلة.

وبعد تنظيم البيانات، يمكننا استخدام `ForEach` لعرض كل فيلم في المصفوفة واحدًا بعد الآخر داخل الواجهة.

وفي الوقت نفسه، فهمنا أيضًا دور "معرّف التمييز" داخل `ForEach`، إذ يجب أن تعرف SwiftUI كيف تميّز بين كل عنصر في المصفوفة حتى تتمكن من عرض الواجهة وتحديثها بشكل صحيح.

لذلك جعلنا `Movie` يلتزم بالبروتوكول `Identifiable`، ووفّرنا له `id` فريدًا.

ولتجنّب الأخطاء عند تعبئة `id` يدويًا، تعلمنا أيضًا `UUID()` لكي يولّد النظام المعرّف الفريد تلقائيًا.

وبعد إنهاء هذا الدرس، لن تكون قد أكملت قائمة أفلام فقط، بل ستبدأ أيضًا في لمس فكرة مهمة في SwiftUI: **نظّم البيانات أولًا، ثم أنشئ الواجهة اعتمادًا على البيانات.**

## الكود الكامل

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
