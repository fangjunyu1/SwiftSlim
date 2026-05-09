# מאפיינים מחושבים

בשיעור הזה נלמד בעיקר על מאפיינים מחושבים.

מאפיינים מחושבים משמשים לחישוב תוצאה חדשה על בסיס נתונים קיימים. הם יכולים לחשב ערכים מספריים, וגם תוכן שצריך להופיע ב-views של SwiftUI.

לדוגמה:

```swift
let a = 10
let b = 20
let c = a + b
```

כאן `c` מייצג את התוצאה של חיבור `a` ו-`b`.

בקוד רגיל, צורת כתיבה כזו נפוצה מאוד.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

טיפ: בתוך אירוע ההקשה של `Button` אפשר להריץ קוד Swift רגיל.

אבל אם נכתוב קוד דומה ישירות במאפיינים של view ב-SwiftUI, ניתקל בבעיה.

לדוגמה:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

הקוד הזה יגרום לשגיאה.

נראה ש-`a` ו-`b` כבר נכתבו לפני `c`, ולכן לכאורה אפשר לחשב את הערך של `c`.

אבל בהצהרות מאפיינים של מבנה, אי אפשר להשתמש בכתיבה הזו ישירות.

## למה c לא יכול לחשב ישירות את a + b

כי `a`, `b` ו-`c` אינם קבועים זמניים בתוך אירוע הקשה של כפתור, אלא מאפיינים בתוך ה-view `ContentView`.

בתוך אירוע ההקשה של כפתור, הקוד הזה יכול לפעול כרגיל:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

כי אחרי שהכפתור נלחץ, הקוד רץ לפי הסדר. קודם נוצר `a`, אחר כך נוצר `b`, ולבסוף `c` מחושב באמצעות `a + b`.

אבל כאשר מצהירים על מאפיינים בתוך view, המצב שונה:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

כאן `a`, `b` ו-`c` הם כולם מאפיינים בתוך ה-view `ContentView`.

כאשר ה-view `ContentView` נוצר, Swift צריכה להכין תחילה את המאפיינים האלה. כדי לשמור על תהליך יצירה בטוח, Swift לא מאפשרת לערך ברירת המחדל של מאפיין instance מאוחסן לקרוא ישירות מאפייני instance אחרים באותו instance.

לכן השורה הזו תגרום לשגיאה:

```swift
let c = a + b
```

אפשר להבין זאת בפשטות כך: **כאשר מצהירים על מאפיינים בתוך view, אי אפשר להשתמש ישירות במאפיין רגיל אחד כדי לחשב מאפיין רגיל אחר.**

מאפיין ששומר ערך ישירות נקרא "מאפיין מאוחסן". כדי להקל על ההבנה, אפשר לחשוב עליו זמנית כעל מאפיין רגיל.

לדוגמה:

```swift
let a = 10
```

`a` שומר את `10`.

```swift
let b = 20
```

`b` שומר את `20`.

אבל:

```swift
let c = a + b
```

כאן `c` אינו ערך שנכתב ישירות, אלא ערך שאנחנו רוצים לחשב באמצעות `a + b`.

במצב כזה, שבו "מקבלים תוצאה מנתונים קיימים", מתאים יותר להשתמש במאפיין מחושב.

אפשר לשנות את זה כך:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

כאן `c` הוא מאפיין מחושב.

```swift
var c: Int {
    return a + b
}
```

המשמעות היא: **כאשר צריך להשתמש ב-`c`, קוראים את `a` ואת `b` באותו רגע, ומחזירים את התוצאה של `a + b`.**

לדוגמה:

```swift
Text("c: \(c)")
```

כאשר `Text` מציג את `c`, רק אז מופעל החישוב של `c`.

## מהו מאפיין מחושב?

מאפיין מחושב נראה כמו משתנה, אבל הוא עצמו לא שומר נתונים.

לדוגמה:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

כאן `c` הוא מאפיין מחושב.

הוא לא שומר ערך קבוע כמו מאפיין רגיל, אלא בכל פעם ש-`c` נקרא, הוא מריץ מחדש את הקוד בתוך `{}` ומחזיר את תוצאת החישוב.

אפשר להבין זאת כך:

```swift
var c: Int {
    return a + b
}
```

כאשר צריך להשתמש ב-`c`, מחשבים את `a + b`.

לכן מאפיין מחושב מתאים למצב הזה: **תוצאה לא צריכה להישמר בנפרד, כי אפשר לחשב אותה מנתונים קיימים.**

## צורת כתיבה בסיסית

מאפיין מחושב בדרך כלל כולל שלושה חלקים:

```swift
var c: Int {
    return a + b
}
```

### 1. הצהרה באמצעות `var`

```swift
var c
```

מאפיין מחושב חייב להיות מוכרז באמצעות `var`; אי אפשר להשתמש ב-`let`.

כי מאפיין מחושב אינו ערך מאוחסן קבוע, אלא תוצאה שמחושבת דינמית בכל פעם שהוא נקרא.

### 2. סימון סוג ההחזרה

```swift
var c: Int
```

מאפיין מחושב צריך לציין את סוג ההחזרה שלו.

כאן `c` יחזיר בסופו של דבר מספר שלם, לכן הסוג הוא `Int`.

### 3. שימוש ב-{} לכתיבת לוגיקת החישוב

```swift
{
    return a + b
}
```

בתוך `{}` נכתבת לוגיקת החישוב; כאן מוחזר `a + b`.

## מילת המפתח return

מאפיין מחושב צריך להחזיר תוצאה.

לדוגמה:

```swift
var c: Int {
    return a + b
}
```

כאן `return` אומר: החזר החוצה את תוצאת החישוב `a + b`.

אם המאפיין המחושב מכיל רק ביטוי אחד שמייצר ישירות תוצאה, אפשר להשמיט את `return`:

```swift
var c: Int {
    a + b
}
```

אבל אם המאפיין המחושב מכיל כמה שורות קוד, צריך להשתמש ב-`return` כדי להחזיר את התוצאה באופן ברור.

לדוגמה:

```swift
var totalPriceText: String {
    let total = count * price
    return "סה״כ: \(total) $"
}
```

כאן תהליך החישוב מחולק לשני שלבים.

שלב ראשון, מחשבים תחילה את המחיר הכולל:

```swift
let total = count * price
```

שלב שני, מחברים את המחיר הכולל לטקסט ומחזירים אותו:

```swift
return "סה״כ: \(total) $"
```

אם נסיר את `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "סה״כ: \(total) $"
}
```

הקוד הזה יגרום לשגיאה.

הסיבה היא: **המאפיין המחושב הזה כבר מכיל כמה שורות קוד, ו-Swift כבר לא יכולה לקבוע אוטומטית איזו שורה היא התוצאה הסופית שצריך להחזיר.**

לכן, כאשר במאפיין מחושב יש רק שורת תוצאה אחת, אפשר להשמיט את `return`.

```swift
var c: Int {
    a + b
}
```

כאשר מאפיין מחושב מכיל כמה שורות קוד, מומלץ לכתוב `return` באופן ברור.

```swift
var totalPriceText: String {
    let total = count * price
    return "סה״כ: \(total) $"
}
```

## ההבדל בין מאפיין מחושב למאפיין רגיל

מאפיין רגיל שומר נתונים.

```swift
var c = 30
```

כאן `c` שומר ערך מסוים: `30`.

מאפיין מחושב לא שומר נתונים.

```swift
var c: Int {
    a + b
}
```

כאן `c` לא שומר את `30`. הוא רק מספק דרך חישוב.

כאשר `c` נקרא, Swift מבצעת:

```swift
a + b
```

ואז מחזירה את תוצאת החישוב.

לכן מאפיינים מחושבים מתאימים למצבים שבהם תוצאה מחושבת מנתונים אחרים.

## body הוא גם מאפיין מחושב

אחרי שלמדנו מאפיינים מחושבים, אפשר להבין מחדש את אחד מקטעי הקוד הנפוצים ביותר ב-SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

כאן `body` הוא גם מאפיין מחושב.

הוא מוכרז באמצעות `var`:

```swift
var body
```

יש לו סוג החזרה:

```swift
some View
```

בתוך ה-`{}` שלו מוחזר תוכן של SwiftUI view:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

לכן אפשר להבין את `body` כך: כאשר SwiftUI צריך להציג את ה-view הזה, הוא קורא את `body` ויוצר את הממשק לפי התוכן ש-`body` מחזיר.

אם נכתוב `return`, אפשר להבין זאת כך:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

אבל ב-SwiftUI אנחנו בדרך כלל משמיטים את `return` וכותבים ישירות:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

כאשר נתוני `@State` משתנים, SwiftUI קורא שוב את `body` ומעדכן את הממשק לפי הנתונים החדשים.

לדוגמה:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("ספירה: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

אחרי הקשה על הכפתור, `count` ישתנה.

```swift
count += 1
```

אחרי ש-`count` משתנה, SwiftUI מחשב מחדש את `body`, ולכן גם הטקסט בממשק מתעדכן.

```swift
Text("ספירה: \(count)")
```

זו גם הסיבה שב-SwiftUI הממשק יכול להתרענן אוטומטית אחרי שינויי נתונים.

### לא מומלץ לכתוב חישובים מורכבים בתוך body

מכיוון ש-`body` הוא מאפיין מחושב, הוא עשוי להיקרא ולהתחושב מחדש פעמים רבות.

לדוגמה:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("מספר: \(num)")
            Text("שם: \(name)")
        }
    }
}
```

כאשר `name` משתנה, SwiftUI מחשב מחדש את `body`.

באותו רגע גם הקוד בתוך `body` ירוץ שוב, וגם `num` ייווצר מחדש.

```swift
let num = 10
```

ה-`num` בדוגמה הזו פשוט מאוד, ולכן ההשפעה לא גדולה.

אבל אם בתוך `body` מבוצעים חישובים מורכבים, כמו סינון כמות גדולה של נתונים, מיון, עיבוד תמונות וכדומה, זה עלול להשפיע על חלקות הממשק.

לכן ב-SwiftUI, `body` צריך להיות אחראי בעיקר לתיאור מבנה הממשק.

נתונים זמניים פשוטים אפשר לכתוב בתוך `body`.

חישובים מורכבים אפשר לשקול להעביר למאפיינים מחושבים מחוץ ל-`body`, למתודות או לעיבוד נתונים נפרד.

## דוגמה: כמות ומחיר כולל

כעת נבין מאפיינים מחושבים באמצעות דוגמה פשוטה.

נניח שמחיר היחידה של גזר אחד הוא 2 $, המשתמש יכול להקיש על כפתורים כדי לשנות את כמות הקנייה, והממשק צריך להציג את המחיר הכולל.

דרך חישוב המחיר הכולל:

```
כמות * מחיר יחידה
```

אם נשתמש במשתנה רגיל כדי לשמור את המחיר הכולל, זה יהיה מעט מסורבל.

כי בכל פעם שהכמות משתנה, צריך לעדכן ידנית את המחיר הכולל.

דרך טובה יותר היא להשתמש במאפיין מחושב:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("מחיר: \(price) $")
                Text("כמות: \(count)")
                Text("מחיר כולל: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

תוצאת תצוגה:

![view](../../Resource/024_view.png)

בדוגמה הזו:

```swift
@State private var count = 1
```

`count` מייצג את כמות הגזרים. כאשר מקישים על הכפתור, `count` משתנה.

```swift
private let price = 2
```

`price` מייצג את מחיר היחידה של הגזר. כאן זה ערך קבוע, לכן משתמשים ב-`let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` מייצג את המחיר הכולל.

אין צורך לשמור אותו בנפרד, כי תמיד אפשר לחשב את המחיר הכולל באמצעות `count * price`.

כאשר `count` הוא `1`:

```swift
totalPrice = 1 * 2
```

תוצאת התצוגה היא:

```swift
מחיר כולל: 2 $
```

אחרי הקשה על הכפתור `+`, `count` הופך ל-`2`.

בשלב הזה, כאשר קוראים שוב את `totalPrice`, הוא יחושב מחדש:

```swift
totalPrice = 2 * 2
```

תוצאת התצוגה היא:

```swift
מחיר כולל: 4 $
```

זה התפקיד של מאפיין מחושב: לחשב באופן דינמי תוצאה חדשה על בסיס נתונים קיימים.

## אפשר להשתמש במאפיינים מחושבים לבדיקות

מאפיינים מחושבים יכולים לא רק לחשב ערכים מספריים, אלא גם להחזיר תוצאות בדיקה.

לדוגמה, כאשר אנחנו רוצים שהכמות המינימלית תהיה 1.

כאשר הכמות כבר 1, הכפתור `-` לא צריך להמשיך להקטין.

אפשר להוסיף מאפיין מחושב:

```swift
private var canDecrease: Bool {
    count > 1
}
```

קוד מלא:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("מחיר: \(price) $")
                Text("כמות: \(count)")
                Text("מחיר כולל: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

תוצאת תצוגה:

![view](../../Resource/024_view1.png)

כאן:

```swift
private var canDecrease: Bool {
    count > 1
}
```

הקוד הזה אומר האם אפשר כרגע להקטין.

כאשר `count` גדול מ-`1`:

```swift
canDecrease == true
```

זה אומר שאפשר להקטין.

כאשר `count` שווה ל-`1`:

```swift
canDecrease == false
```

זה אומר שאי אפשר להמשיך להקטין.

### בדיקת תנאי בתוך הכפתור

בכפתור משתמשים ב:

```swift
if canDecrease {
    count -= 1
}
```

רק כאשר `canDecrease` מוערך כ-`true`, אפשר להקטין את `count`.

### שליטה בצבע הקדמי של view

אפשר גם להשתמש ב-`canDecrease` כדי לשלוט בצבע הקדמי של הכפתור:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

כאן משתמשים באופרטור הטרנרי:

```swift
canDecrease ? Color.primary : Color.gray
```

המשמעות של הקוד הזה היא: אם `canDecrease` הוא `true`, השתמש ב-`Color.primary` כצבע קדמי; אם `canDecrease` הוא `false`, השתמש ב-`Color.gray`.

`Color.primary` הוא צבע סמנטי מערכתי שמסופק על ידי SwiftUI. הוא מייצג את צבע הטקסט הראשי בממשק הנוכחי.

במצב בהיר, `Color.primary` בדרך כלל קרוב לשחור; במצב כהה, `Color.primary` בדרך כלל קרוב ללבן.

לכן היתרון בשימוש ב-`Color.primary` הוא שהוא מסתגל אוטומטית למצב בהיר ולמצב כהה.

### שליטה במצב המושבת של view

`disabled` משמש לשליטה אם view נמצא במצב מושבת:

```swift
.disabled(!canDecrease)
```

כאשר `disabled` הוא `false`, אפשר להקיש על ה-view.

כאשר `disabled` הוא `true`, ה-view מושבת ואי אפשר להקיש עליו.

השימוש ב-`canDecrease` כתנאי כאן הופך את הקוד לקל יותר להבנה.

כשאנחנו רואים `canDecrease`, אנחנו יודעים שהוא אומר "האם אפשר להמשיך להקטין כרגע".

### הערה נוספת: למה יש שתי בדיקות?

בתוך הכפתור `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

כאן משתמשים גם ב-`.disabled(!canDecrease)` וגם ב-`if canDecrease` בתוך הכפתור.

`.disabled(!canDecrease)` אחראי להשבית את הכפתור בממשק, כדי שהמשתמש לא יוכל להקיש עליו.

`if canDecrease` אחראי לבדוק שוב לפני שהקוד רץ. הוא מריץ את `count -= 1` רק כאשר מותר להקטין.

זו הגנה כפולה. בפיתוח אמיתי, אם הכפתור כבר מושבת, אפשר להשמיט את הבדיקה הפנימית. אבל בדוגמה לימודית, השארתה עושה את התפקיד של `canDecrease` ברור יותר.

## סיכום

בשיעור הזה למדנו בעיקר מאפיינים מחושבים.

מאפיין מחושב לא שומר ערך ישירות. במקום זאת, כאשר הוא נקרא, הוא מחשב תוצאה מנתונים קיימים.

לדוגמה:

```swift
var c: Int {
    a + b
}
```

כאן אין צורך לשמור את `c` בנפרד, כי אפשר לחשב אותו באמצעות `a + b`.

מאפיין מחושב חייב להיות מוכרז באמצעות `var`, והוא צריך לציין סוג החזרה.

```swift
var canDecrease: Bool {
    count > 1
}
```

מאפיינים מחושבים יכולים להחזיר לא רק ערכים מספריים, אלא גם תוצאות בדיקה, תוכן טקסטואלי ואפילו תוכן של SwiftUI views.

בשיעור הזה למדנו גם את `return`.

`return` פירושו להחזיר תוצאה:

```swift
var totalPriceText: String {
    let total = count * price
    return "סה״כ: \(total) $"
}
```

אם מאפיין מחושב מכיל רק ביטוי אחד שמייצר ישירות תוצאה, אפשר להשמיט את `return`.

```swift
var totalPrice: Int {
    count * price
}
```

בנוסף, הכרנו גם את `Color.primary` ואת `disabled`.

`Color.primary` הוא צבע סמנטי מערכתי של SwiftUI. הוא מתאים אוטומטית את התצוגה לפי מצב בהיר ומצב כהה.

```swift
.foregroundStyle(Color.primary)
```

`disabled` משמש לשליטה אם view מושבת.

```swift
.disabled(true)
```

פירושו מושבת, אי אפשר להקיש.

```swift
.disabled(false)
```

פירושו זמין, אפשר להקיש.

לכן מאפיינים מחושבים נפוצים מאוד ב-SwiftUI. הם יכולים לעזור לנו לארגן תוצאות חישוב, תנאי בדיקה ותוכן מוצג בצורה ברורה יותר.
