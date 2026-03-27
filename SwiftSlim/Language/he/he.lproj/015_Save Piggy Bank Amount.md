# שמירת הסכום של קופת החיסכון

בשיעור הקודם מימשנו “קופת חיסכון” פשוטה. בשיעור הזה נלמד כיצד לשמור את הסכום שלה בצורה מתמשכת (`persistent`).

בשיעור הזה נתמקד בעיקר ב-`UserDefaults` וב-`@AppStorage`, ובמקביל נרחיב גם על התפקיד של `onAppear` ועל אופן השימוש בטיפוסים אופציונליים (`nil`).

חשוב לשים לב: בשיעור הזה צריך להמשיך להשתמש בקוד של “קופת החיסכון” מהשיעור הקודם.

## בעיית השמירה המתמשכת

כרגע, הממשק של “קופת החיסכון” פשוט ונוח מאוד לשימוש.

![Piggy Bank](../../Resource/014_view.png)

אבל יש בעיה בולטת: בכל פעם שמרעננים את התצוגה או סוגרים את האפליקציה, הסכום הכולל של קופת החיסכון חוזר ל-`0`, וכל הסכום שנצבר קודם אובד.

זה אומר שהנתונים לא באמת נשמרים. במילים אחרות, כרגע “קופת החיסכון” יכולה לשמור רק נתונים זמניים.

### למה אי אפשר לשמור בצורה מתמשכת?

הסיבה היא שאנחנו משתמשים במשתנה שהוצהר עם `@State`:

```swift
@State private var amount = 0
```

החיים של משתנה שהוצהר עם `@State` תלויים לחלוטין בתצוגה.

כאשר התצוגה נוצרת, `amount` מאותחל ל-`0`; וכאשר התצוגה נהרסת, גם `amount` נהרס.

הנתונים של `amount` קיימים רק בזיכרון, ולא נשמרים במכשיר.

אם אנחנו לא רוצים ש-`amount` יהיה קשור לחיים של התצוגה, צריך לממש שמירת נתונים מתמשכת — כלומר לשמור את הנתונים במכשיר.

### מהי “שמירת נתונים מתמשכת”

אפשר להבין שמירת נתונים מתמשכת כתהליך של העברת הנתונים מ“זיכרון זמני” אל “אחסון במכשיר”.

כך, גם אם סוגרים את התצוגה או את האפליקציה, הנתונים לא הולכים לאיבוד.

בפיתוח עם Swift, עבור “שמירת נתונים מתמשכת” פשוטה אפשר להשתמש ב-`UserDefaults`; ואילו עבור נתונים מורכבים יותר משתמשים ב-`SwiftData` או `CoreData`.

בשיעור הזה נלמד קודם את `UserDefaults`, שהוא הפתרון הפשוט ביותר.

## `UserDefaults`

`UserDefaults` מיועד לשמירת נתוני key-value קלים, והוא נפוץ לאחסון של `String`、`Int`、`Double`、`Bool` וכדומה.

### שמירת נתונים

`UserDefaults` משתמש במתודה `set` כדי לשמור נתונים:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

הפרמטר הראשון של `UserDefaults` הוא הנתון שרוצים לשמור, למשל `String` או `Int`.

הפרמטר השני, `forKey`, דומה לשם של משתנה, והוא משמש כדי לזהות את הנתון השמור.

### קריאת נתונים

`UserDefaults` קורא נתונים באמצעות מתודות תואמות:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

בזמן קריאה, חייבים להשתמש במתודה שמתאימה לטיפוס הנכון, אחרת עלולות להופיע שגיאות או שיתקבלו נתונים לא נכונים.

### דברים שחשוב לדעת על `UserDefaults`

#### 1. החזרה של טיפוס אופציונלי

כאשר משתמשים ב-`UserDefaults` כדי לקרוא נתונים, חלק מהמתודות מחזירות טיפוס אופציונלי (`Optional`).

למשל:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

הטיפוס של `name` שמוחזר הוא:

```swift
String?
```

כלומר, ייתכן שיש ערך, וייתכן שאין.

**למה מוחזר טיפוס אופציונלי?**

כי ייתכן שב-`UserDefaults` אין בכלל נתון שמקושר ל-Key מסוים.

למשל:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

אם מעולם לא נשמר Key בשם `"City"`, תוצאת הקריאה תהיה:

```swift
nil
```

חשוב להדגיש ש-`nil` פירושו שאין נתון, ולא מחרוזת ריקה.

בשיעור “מערכת הטיפוסים” נתקלנו בבעיה דומה: כאשר המרת טיפוס נכשלת, מתקבל טיפוס אופציונלי.

במקרה כזה צריך להשתמש ב-`??` כדי לספק ערך ברירת מחדל ולבצע `unwrap`:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

אם `UserDefaults` מצליח לקרוא נתון, ישתמשו בו; ואם לא (`nil`), ייעשה שימוש בערך ברירת המחדל.

#### 2. החזרה של טיפוס לא אופציונלי

כאשר `UserDefaults` קורא ערכים מסוג `Int`、`Double` ו-`Bool`, הוא מחזיר טיפוס לא אופציונלי.

למשל:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

גם אם מעולם לא נשמר ערך עבור המפתחות האלה, ערך ההחזרה לא יהיה `nil`.

במקום זה יוחזרו ערכי ברירת מחדל:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. מגבלת כמות הנתונים

`UserDefaults` מתאים רק לשמירת כמות קטנה של נתונים, כמו הגדרות של האפליקציה או מצבים פשוטים.

בפיתוח אמיתי, הוא לא מתאים לשמירת כמויות גדולות של נתונים או לנתונים שנקראים ונכתבים בתדירות גבוהה.

## שמירת הסכום של “קופת החיסכון”

עכשיו אפשר להשתמש ב-`UserDefaults` כדי לממש את לוגיקת השמירה של הסכום הכולל של “קופת החיסכון”.

כאשר המשתמש לוחץ על הכפתור, הסכום שהוזן מתווסף לסכום הכולל, ואז הסכום הכולל נשמר ב-`UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

כעת מימשנו את לוגיקת הכתיבה של הנתונים.

## הסבר על לוגיקת השמירה המתמשכת

למרות שכבר השלמנו את קוד הכתיבה של הנתונים, בהרצה אמיתית עדיין נגלה שבכל פעם שמרעננים את התצוגה או פותחים מחדש את האפליקציה, המשתנה `amount` נשאר `0`.

הסיבה לכך היא:

```swift
@State private var amount = 0
```

ב-SwiftUI, משתנה `@State` מאותחל מחדש בכל פעם שהתצוגה נוצרת.

למרות שהערך של `amount` נשמר בתוך `UserDefaults`, כאשר התצוגה נטענת מחדש, `amount` עדיין מתאפס ל-`0`.

זה אומר שכרגע רק שמרנו את הנתונים אל `UserDefaults`, אבל לא החזרנו אותם אל התצוגה.

לכן, כאשר התצוגה נטענת, צריך לקרוא ידנית את הנתונים מתוך `UserDefaults` ולהציב אותם בחזרה בתוך `amount`, ורק כך תושלם כל לוגיקת השמירה המתמשכת.

### אנלוגיה לוגית

אפשר להבין את התהליך הזה כ“לוח בכיתה”:

במהלך השיעור, המורה כותב על הלוח. התוכן הזה דומה למצב הנוכחי של התצוגה (`@State`).

כאשר השיעור מסתיים, מנקים את הלוח כדי להכין אותו לשיעור הבא. זה דומה לכך שהתצוגה נהרסת, והנתונים שב-`@State` נמחקים.

כדי שהחומר לא יאבד, המורה שומר אותו מראש בתוך חומרי השיעור. חומרי השיעור האלה דומים לנתונים ששמורים ב-`UserDefaults`.

כאשר מתחיל השיעור הבא, הלוח ריק בתחילה (`@State` מאותחל מחדש), והמורה צריך לכתוב עליו שוב את החומר לפי חומרי השיעור (כלומר, לקרוא מתוך `UserDefaults`).

חשוב להבין: הלוח לא משחזר את התוכן הישן אוטומטית. חייבים “לקרוא מחומרי השיעור” (כלומר, לקרוא מ-`UserDefaults`) כדי להחזיר אותו.

## קריאת נתונים באמצעות `onAppear`

כאשר התצוגה מופיעה, צריך לקרוא ידנית את הערך מ-`UserDefaults` ולהציב אותו במשתנה `amount` של `@State`, וכך לממש שמירת נתונים אמיתית.

ב-SwiftUI אפשר להשתמש ב-`onAppear` כדי להריץ לוגיקת אתחול כאשר התצוגה מוצגת:

```swift
.onAppear {}
```

נמקם את קוד הקריאה של `UserDefaults` בתוך `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

כאשר התצוגה נוצרת, `amount` מאותחל ל-`0`; כאשר התצוגה מופיעה, `onAppear` מופעל, קורא מתוך `UserDefaults` ומציב את הערך בתוך `amount`. כך התצוגה תוכל להציג את הסכום הכולל שנשמר בפעם הקודמת.

כעת כל לוגיקת השמירה המתמשכת של “קופת החיסכון” הושלמה.

## הקוד המלא

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## עטיפת התכונה `@AppStorage`

SwiftUI מספקת את עטיפת התכונה `@AppStorage`, שיכולה לפשט את לוגיקת השמירה של `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` הוא מעטפת מעל `UserDefaults`, וה-`"amount"` הוא ה-Key המתאים ב-`UserDefaults`.

כאשר התצוגה נוצרת, הערך נקרא מתוך `UserDefaults`; וכאשר המשתנה משתנה, הערך נכתב אוטומטית בחזרה אל `UserDefaults`.

הוא גם משתלב עם מנגנון העדכון של SwiftUI, וכמו `@State`, הוא ירענן את התצוגה כאשר הערך משתנה.

במילים אחרות, `@AppStorage` יכול לממש גם את הקריאה וגם את השמירה של הנתונים, בלי צורך לקרוא ידנית ל-`UserDefaults`, וגם בלי להשתמש ב-`onAppear` כדי לקרוא נתונים באופן ידני.

לכן אפשר להחליף את `UserDefaults` בקוד שלנו ב-`@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## סיכום

בשיעור הזה למדנו בעיקר את הנקודות הבאות:

ראשית, `UserDefaults` משמש לשמירת נתונים קלים. השתמשנו בו כדי לשמור את הסכום הכולל במכשיר. הוא מספק דרכים לקרוא ולכתוב נתונים, וגם מחייב אותנו להתמודד עם טיפוסים אופציונליים במקרים מסוימים.

שנית, משתני `@State` משמשים רק לניהול מצב זמני בתוך התצוגה, והחיים שלהם קשורים לתצוגה עצמה. כאשר התצוגה נוצרת מחדש, גם `@State` מאותחל מחדש.

לאחר מכן, כדי להחזיר נתונים מ-`UserDefaults`, למדנו להשתמש ב-`onAppear` כדי לקרוא אותם בזמן שהתצוגה מופיעה.

ולבסוף, השתמשנו ב-`@AppStorage` כדי להחליף את `UserDefaults`, וכך לקרוא את הנתונים אוטומטית בעת טעינת התצוגה, ולכתוב אותם אוטומטית בעת שינוי הערך — במקום לנהל ידנית גם את `UserDefaults` וגם את `onAppear`.

באמצעות הידע הזה, אפשר לממש יכולת בסיסית של שמירת נתונים באפליקציה, כך שהנתונים יישמרו לאורך זמן.

## תרגול אחרי השיעור

כעת “קופת החיסכון” כבר תומכת בשמירת סכום, אבל הפונקציונליות שלה עדיין לא שלמה.

1. אם המשתמש צריך להוציא כסף, צריך לתכנן את לוגיקת המשיכה המתאימה.
2. אם המשתמש רוצה לאפס את הסכום, צריך גם לממש לוגיקת איפוס.
3. אם רוצים להוסיף שם לקופת החיסכון, צריך גם לשמור נתון מסוג `String`.

אפשר להמשיך לפתח על גבי הבסיס הקיים, ולהפוך את קופת החיסכון לשלמה יותר.

## הרחבה - בעיית ערך ברירת המחדל של שדה הקלט

כעת אפשר לשפר עוד את האינטראקציה עם שדה הקלט, כדי שההזנה תהיה נוחה יותר.

![textfield](../../Resource/015_view.png)

במימוש הנוכחי, ערך ברירת המחדל של שדה הקלט הוא `0`. כלומר, בכל פעם שהמשתמש רוצה להזין סכום, הוא צריך קודם למחוק את ה-`0`, ורק אחר כך להקליד את המספר החדש. זו חוויית שימוש לא נוחה.

עדיף ששדה הקלט יהיה ריק כבר בהתחלה, ולא יציג `0`.

הסיבה לכך היא ש-`TextField` ו-`number` קשורים זה לזה בקשר דו-כיווני:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

כאשר `number` מאותחל ל-`0`, גם שדה הקלט מציג `0`.

לכן צריך לשנות את `number` לערך ריק, כלומר `nil`.

```swift
@State private var number = nil
```

בשלב הזה תופיע שגיאה:

```
Generic parameter 'Value' could not be inferred
```

זה בדיוק המצב שלמדנו עליו בפרק “מערכת הטיפוסים”: כאשר אי אפשר להסיק אוטומטית את הטיפוס של משתנה, חייבים להצהיר עליו במפורש.

מכיוון שהצבנו `nil` בתוך `number`, ול-`nil` עצמו אין מידע על טיפוס, הקומפיילר לא יכול לדעת האם המשתנה הזה הוא `String`、`Int` או משהו אחר, ולכן תופיע שגיאה.

לכן צריך להצהיר במפורש על הטיפוס של `number`:

```swift
@State private var number:Int? = nil
```

כאן `Int?` מייצג טיפוס אופציונלי (`Optional`), כלומר הערך של `number` יכול להיות `Int` או `nil`.

כך, כאשר מאתחלים אותו ל-`nil`, שדה הקלט יוצג כריק במקום כ-`0`.

### חילוץ ערך מתוך טיפוס אופציונלי

אחרי ש-`number` הוגדר כטיפוס אופציונלי, קוד החישוב הקודם יתחיל להציג שגיאה:

```swift
amount += number
```

ההודעה תהיה:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

הסיבה היא שעכשיו `number` יכול להיות גם `nil`. אם נשתמש בו ישירות בחישוב, המצב יהיה כאילו כתבנו:

```swift
amount += nil
```

וזו כמובן פעולה לא חוקית.

לכן, כאשר משתמשים בטיפוס אופציונלי בתוך חישוב, צריך קודם לבצע `unwrap`.

כאן אפשר להשתמש ב-`??` כדי לספק ערך ברירת מחדל:

```swift
amount += number ?? 0
```

כאשר `number` הוא `nil`, ישתמשו בערך ברירת המחדל `0`; וכאשר ל-`number` יש ערך, ישתמשו בערך האמיתי שהוזן.

כך גם נשמור על חישוב תקין, וגם נשיג אפקט של שדה קלט ריק כברירת מחדל, בלי שהמשתמש יצטרך למחוק את `0` בכל פעם.

## קוד מורחב

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
