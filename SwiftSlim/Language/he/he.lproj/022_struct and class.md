# struct ו-class

בשיעור הקודם, רק התחלנו להכיר את `struct`, הגדרנו מבנה אחד, וגם הרחבנו את הלמידה לנושאים כמו פרוטוקולים, `UUID` ועוד נקודות ידע.

עכשיו כבר יש לנו היכרות ראשונית עם מילת המפתח `struct`, אבל עדיין אי אפשר לומר שאנחנו באמת מבינים אותה.

בשיעור הזה נמשיך לקחת את `struct` כתוכן המרכזי, ובדרך נכיר גם את `class`. דרך השיעור הזה תבין בצורה ברורה יותר: מהו instance, מהו constructor, ולמה אנחנו יכולים להשתמש ב-`struct` וב-`class` כדי לארגן נתונים.

## מערכת לניהול תלמידים

לדוגמה, עכשיו אנחנו רוצים לפתח מערכת לניהול תלמידים. לכל תלמיד יש מידע כמו שם, מין, טלפון, גיל, כתובת מגורים וכן הלאה.

בשלב הזה, אנחנו יכולים לחבר את כל המידע הזה יחד ולהגדיר אותו כמבנה `Student`:

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

כאן אנחנו משתמשים ב-`struct` כדי להגדיר טיפוס של תלמיד.

המבנה `Student` הזה כולל כמה properties:

- `id`: המזהה הייחודי של התלמיד
- `name`: שם התלמיד
- `sex`: מין התלמיד
- `phone`: הטלפון של התלמיד
- `age`: גיל התלמיד
- `address`: כתובת המגורים

כך, כמה נתונים שהיו מפוזרים במקור מתחברים יחד ל"תלמיד" שלם.

כאן `Student` גם מציית ל-protocol בשם `Identifiable`, ומגדיר שדה `id`, כדי שיהיה נוח בהמשך להציג נתונים יחד עם לולאת `ForEach`.

לאחר מכן, אנחנו יכולים ליצור instance של תלמיד:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

הקוד הזה אומר שעל פי המבנה `Student`, אפשר ליצור נתונים קונקרטיים של תלמיד.

כאן `Student` הוא הטיפוס, ו-`Student(...)` מייצג instance שנוצר.

ב-SwiftUI, אנחנו יכולים להקצות את ה-instance הזה למשתנה, ואז להציג אותו.

לדוגמה:

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

כך אנחנו יכולים לראות בתוך ה-view את השם של התלמיד הזה: `Fang Junyu`.

כאן קודם יצרנו instance של `Student`, אחר כך הקצינו אותו למשתנה `student`, ולבסוף קראנו את ה-property שלו דרך `student.name`.

## מהו instance

כשאנחנו רק מתחילים ללמוד `struct`, יכול להיות שהמילה "instance" תרגיש לנו זרה.

אבל למעשה, אנחנו משתמשים ב-instances כבר מההתחלה, פשוט קודם לא שמנו לב לזה במיוחד.

לדוגמה:

```swift
let name = "Fang Junyu"
```

כאן `"Fang Junyu"` הוא ערך מחרוזת, ובעצם הוא instance של הטיפוס `String`.

אנחנו יכולים גם לכתוב את זה כך:

```swift
let name = String("Fang Junyu")
```

שתי צורות הכתיבה האלו אומרות את אותו הדבר: ליצור instance של הטיפוס `String`, ולהקצות אותו למשתנה `name`.

באותו אופן, גם לגבי `Int` זה נכון:

```swift
let num = 3
```

כאן `3` הוא בעצם ערך מטיפוס `Int`, ואפשר גם להבין אותו כ-`Int` instance.

לכן, instance הוא לא מושג מיוחד שמופיע רק בתוך `struct`.

בין אם זה `String`, `Int`, `Double`, `Bool`, או ה-`Student` המותאם אישית, כולם יכולים ליצור instances.

לכן, כשאנחנו כותבים:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

זה בעצם אותו דבר כמו ליצור instance של `String` או `Int`, רק ש-`Student` הוא טיפוס שאנחנו הגדרנו בעצמנו.

## constructor

כשאנחנו יוצרים instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

בפועל, אנחנו קוראים למתודת האתחול של `Student`, כלומר `init`.

אפשר להבין constructor כך: **זוהי נקודת הכניסה שאחראית להקצות ערכים ל-properties בזמן יצירת instance.**

כלומר, לפני ש-instance נוצר באמת באופן מלא, בדרך כלל הוא צריך קודם לעבור דרך `init`.

לדוגמה, כשהכרנו קודם את מחזור החיים של SwiftUI views, כתבנו קוד כזה:

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

כאן `init()` רץ כאשר instance של `ContentView` נוצר, ואילו `onAppear` רץ רק כשה-view באמת מוצג על המסך. כלומר, יצירת view והצגת view הן לא אותו רגע.

באותו אופן, כשאנחנו יוצרים `Student(...)`, אנחנו בעצם קוראים גם ל-constructor של `Student`.

### constructor שנוצר אוטומטית על ידי המערכת

כשאנחנו הגדרנו את `Student`, לא כתבנו ידנית `init`:

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

אבל למרות זאת, אנחנו עדיין יכולים ליצור instance ישירות:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

למה אפשר ליצור instance בלי לכתוב constructor?

כי עבור `struct`, אם אנחנו לא כותבים constructor ידנית, המערכת בדרך כלל מייצרת עבורנו אוטומטית constructor מתאים.

בשלב ההתחלתי של הלמידה, אפשר להבין את זה בפשטות כך: Swift משלימה בשבילנו אוטומטית את קוד האתחול.

באופן כללי אפשר להבין שהמערכת משלימה עבורנו את הקוד הבא:

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

כאן צריך לשים לב לפרט קטן:

```swift
let id = UUID()
```

ל-`id` כבר יש ערך ברירת מחדל, ולכן בזמן יצירת instance אין צורך שנעביר שוב את `id` ידנית.

כלומר, properties שאין להן ערך ברירת מחדל בדרך כלל צריך להעביר ב-constructor; ו-properties שכבר יש להן ערך ברירת מחדל בדרך כלל יכולות להשתמש ישירות בערך הזה.

לכן, כשאנחנו יוצרים instance של `Student`, אנחנו צריכים להעביר רק את `name`, `sex`, `phone`, `age` ו-`address`.

### רמזים מה-compiler

בנוסף, כשאנחנו מקלידים `Student(...)` בתוך Xcode, אנחנו יכולים גם לראות את רמזי הפרמטרים שהמערכת מספקת.

![student](../../Resource/022_student.png)

זה בעצם גם מראה שלטיפוס הנוכחי באמת יש constructor שנוצר אוטומטית על ידי המערכת.

### לכתוב constructor בעצמנו

למרות שהמערכת יכולה ליצור constructor אוטומטית, לפעמים דרך האתחול ברירת המחדל הזו לא מתאימה לגמרי לצרכים שלנו.

לדוגמה, יש לנו מבנה `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

לפי ה-constructor שנוצר אוטומטית על ידי המערכת, כשאנחנו יוצרים instance, אנחנו חייבים להעביר את שלושת הפרמטרים האלה יחד:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

אבל אם עכשיו אנחנו רוצים להזין אצווה של סרטים ישנים, ויודעים רק את שם הסרט ולא יודעים את הבמאי או את הדירוג, זה יהיה קצת לא נוח.

כי אז אנחנו יכולים לכתוב רק כך:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

אמנם זה עובד, אבל לא נוח לכתוב `--` שוב ושוב בכל פעם.

בשלב הזה, אנחנו יכולים לכתוב constructor:

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

כך, כשאנחנו יוצרים סרטים ישנים, צריך להעביר רק `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

זו אחת המשמעויות של כתיבת constructor בעצמנו: **להפוך את צורת יצירת ה-instance למתאימה יותר לצרכים אמיתיים.**

### ניתוח של custom constructor

בואו נסתכל על ה-constructor שכתבנו ידנית קודם:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

המשמעות של הקוד הזה היא שכאשר יוצרים instance של `Movie`, צריך להעביר רק פרמטר אחד, `name`.

לאחר מכן, בתוך ה-constructor, ה-`name` שהועבר יוקצה ל-`name` של ה-instance עצמו, ול-`director` ול-`rating` יינתן ערך ברירת המחדל `--`.

כאן `self` פירושו "ה-instance הנוכחי הזה עצמו".

לדוגמה:

```swift
self.name = name
```

ה-`self.name` שבצד שמאל מייצג את ה-property שבתוך ה-instance; ה-`name` שבצד ימין מייצג את הפרמטר שהעברנו.

אפשר להבין את זה בפשטות כשמירת הערך שהועבר מבחוץ בתוך ה-property של ה-instance עצמו.

כאשר כל ה-properties מקבלות ערכים, יצירת ה-instance הזה מושלמת.

### המנגנון של constructor

כאשר אנחנו מצהירים במפורש על constructor, מתרחש גם שינוי נוסף:

ה-constructor שהמערכת יצרה אוטומטית קודם לכן בדרך כלל כבר לא ניתן לשימוש ישיר.

לדוגמה:

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

עכשיו אם נכתוב שוב כך:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ה-compiler יחזיר שגיאה:

```swift
Extra arguments at positions #2, #3 in call
```

המשמעות היא: העברת פרמטרים מיותרים.

למה השגיאה הזו מופיעה?

כי במבנה `Movie` הנוכחי יש רק את סוג ה-constructor הזה, שהצהרת עליו ידנית:

```swift
init(name: String)
```

הוא מקבל רק פרמטר אחד `name`, ואינו מקבל `director` ו-`rating`.

כלומר, אחרי שאתה מוסיף ידנית constructor משלך, צורת האתחול שנוצרה אוטומטית במקור כבר לא ניתנת לשימוש ישיר.

אם אנחנו רוצים לתמוך גם ב"להעביר רק שם" וגם ב"להעביר מידע מלא", אז אנחנו צריכים להוסיף בעצמנו constructor מלא נוסף:

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

כך, יש לנו שני constructors שונים.

כשיוצרים סרט ישן, אפשר לכתוב כך:

```swift
Movie(name: "The Night of the Hunter")
```

וכשיוצרים סרט חדש עם מידע מלא, אפשר לכתוב כך:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

צורת הכתיבה הזאת גם מראה שלאותו טיפוס יכולים להיות כמה constructors, כל עוד צורות הפרמטרים שלהם שונות.

## מהו overload

כאן נוסיף עוד נקודת ידע נחוצה.

הרגע כתבנו שני `init` עבור `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

צורת הכתיבה הזו, "אותו שם פונקציה אבל פרמטרים שונים", נקראת "overload".

כאן, שתי הפונקציות נקראות `init`, אבל מכיוון שהן מקבלות פרמטרים שונים, Swift יכולה להבחין לאיזו פונקציה אתה קורא.

לדוגמה:

```swift
Movie(name: "Days of Heaven")
```

יקרא אל:

```swift
init(name: String)
```

ואילו:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

יקרא לגרסה המלאה השנייה של מתודת האתחול.

לכן, התפקיד של overload הוא: לאפשר לאותו טיפוס לספק דרכי יצירה שונות לפי תרחישים שונים.

## היכרות עם class

בהמשך, נכיר בקצרה גם את `class`.

מלבד `struct` הנפוץ ב-Swift, שפות תכנות רבות משתמשות ב-`class` כדי ליצור instances, כמו Java, C#, Kotlin ועוד.

ב-Swift, צורת הכתיבה של `class` קרובה מאוד לזו של `struct`.

לדוגמה:

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

תראה שלמעט זה שמילת המפתח משתנה מ-`struct` ל-`class`, שאר החלקים נראים כמעט אותו דבר.

גם צורת יצירת ה-instance דומה מאוד:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

לכן, ברמת התחביר, `struct` ו-`class` באמת מאוד דומים.

### ההבדל בין Struct ל-Class

למרות ש-`struct` ו-`class` נראים מאוד דומים, הם לא זהים לחלוטין.

**1. דרך האתחול שונה**

עבור `struct`, אם לא נכתוב constructor ידנית, המערכת בדרך כלל תיצור אוטומטית מתודת אתחול מתאימה.

אבל עבור `class`, אם יש properties שעדיין אין להן ערך ברירת מחדל, בדרך כלל צריך לכתוב `init` ידנית, אחרת תופיע שגיאה.

לדוגמה:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

ה-`class` הזה יגרום לשגיאה, כי אין לו constructor ולכן ה-properties לא מאותחלות.

ה-compiler יציג משהו דומה ל:

```swift
Class 'Movie' has no initializers
```

לכן, בדוגמה הזאת, `class` חייב לכלול constructor שנכתב ידנית.

**2. `struct` הוא value type, ו-`class` הוא reference type**

`struct` הוא value type, ו-`class` הוא reference type.

בשלב ההתחלתי של הלמידה, לא צריך לשלוט לגמרי בשני המושגים האלה; מספיק רק להבין אותם באופן בסיסי.

לדוגמה, `struct` דומה יותר ל"להעתיק ערך חדש".

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

כאן, אחרי שמקצים את `user1` ל-`user2`, זה כאילו העתקנו נתונים חדשים, ולכן שינוי של `user2` לא משפיע על `user1`.

לעומת זאת, `class` דומה יותר ל"להצביע יחד על אותו instance".

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

כאן `user1` ו-`user2` מצביעים על אותו instance.

עכשיו אין צורך להבין לגמרי את המנגנון הפנימי של value type ו-reference type; מספיק רק לדעת ש-`struct` מתאים יותר לשמירת נתונים עצמאיים, בעוד `class` מתאים יותר למצבים שבהם כמה מקומות צריכים לשתף את אותו instance.

## איך לבחור בשלב ההתחלתי

בשלב הנוכחי, עבור data models רגילים, עדיף קודם לשקול `struct`; כאשר צריך נתונים משותפים ושינויים מסונכרנים, אז לשקול `class`.

זה לא כלל מוחלט, אבל עבור מתחילים זו דרך שיפוט מספיק מעשית.

במיוחד ב-SwiftUI, בהרבה מקרים תראה ש-`struct` כבר יכול לבצע את רוב העבודה.

בנוסף, בהרבה חומרי תכנות, גם למה שנוצר על ידי `class` קוראים "object". בשלב ההתחלתי, אפשר פשוט להבין את זה כ-instance, בלי צורך להבדיל בכוונה ביניהם.

## סיכום

בשיעור הזה למדנו את `struct` בצורה עמוקה יותר, ובדרך גם הכרנו את `class`; את שניהם אפשר להשתמש כדי להגדיר טיפוסים.

טיפוסים יכולים ליצור instances. כש-instance נוצר, נקרא constructor, כלומר `init`.

עבור `struct`, אם לא כותבים constructor ידנית, המערכת בדרך כלל יוצרת אוטומטית constructor מתאים. אם ה-default constructor לא עונה על הצרכים, אנחנו יכולים גם לכתוב constructor בעצמנו.

בנוסף, קיבלנו גם הבנה ראשונית של ההבדל בין `struct` ל-`class`: `struct` הוא value type, ואילו `class` הוא reference type. ב-SwiftUI, בשלב ההתחלתי, מה שפוגשים בדרך כלל לעיתים קרובות יותר הוא `struct`.

בהמשך, כשנלמד על העברת values בין views, data models ו-state management, כל התוכן הזה ימשיך להיות בשימוש.
