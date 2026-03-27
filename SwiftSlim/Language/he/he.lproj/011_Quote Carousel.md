# קרוסלת ציטוטים

בשיעור הזה נממש פונקציונליות של "קרוסלת ציטוטים", ונעמיק ביסודות של Swift כמו מערכים (`Array`) ומשפטי תנאי (`if-else`).

נראה איך לשמור כמה ציטוטים, ואיך לממש מעבר מחזורי ביניהם באמצעות אינטראקציה עם כפתור.

![alt text](../../RESOURCE/011_word.png)

## הצגת ציטוט

תחילה, נצטרך להציג ציטוט אחד ב-SwiftUI.

הדרך הפשוטה ביותר היא להשתמש בתצוגת `Text`:

```swift
Text("Slow progress is still progress.")
```

הקוד הזה יכול להציג רק ציטוט קבוע אחד. אם רוצים להציג כמה ציטוטים ולאפשר מעבר ביניהם, צריך קודם לשמור אותם.

אבל משתנה רגיל מסוג מחרוזת יכול לשמור רק ציטוט אחד:

```swift
let sayings = "Slow progress is still progress."
```

אם רוצים לשמור כמה ציטוטים, צריך להצהיר על משתנה עבור כל אחד מהם:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

אבל בפיתוח אמיתי, הדרך הזאת גם מסורבלת וגם לא גמישה, כי כל משתנה עומד בפני עצמו, ולכן קשה לממש מעבר דינמי בין הציטוטים.

כדי לנהל כמה ציטוטים בצורה נוחה, צריך להשתמש במבנה נתונים ששומר אותם יחד, וזהו מערך (`Array`).

אחרי שמשתמשים במערך, אפשר לכתוב את הקוד למעלה כך:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**טיפ:** לפי כללי כתיבה מקובלים בתכנות, נהוג לתת למשתנה שמחזיק כמה פריטים שם בצורת רבים, כמו `sayings`, כדי לשקף שמדובר באוסף.

## מערכים

ב-Swift, מערך הוא אוסף של איברים מסודרים, והוא מיוצג באמצעות סוגריים מרובעים `[]`.

```swift
[]
```

בתוך מערך אפשר לכלול כמה איברים מאותו סוג, וביניהם מפרידים בעזרת פסיקים `,`.

למשל:

```swift
[101, 102, 103, 104, 105]
```

אפשר להבין מערך בצורה פשוטה כמו רכבת:

![Array](../../RESOURCE/011_array1.png)

כל הרכבת מייצגת את אובייקט המערך, וכל קרון מסודר לפי הסדר שלו.

### אינדקס וגישה לאיברים

מכיוון שהמערך מסודר, המערכת יכולה לאתר איברים מסוימים לפי המיקום שלהם. מנגנון המיקום הזה נקרא אינדקס (`Index`).

ב-Swift (וגם ברוב שפות התכנות), האינדקס של מערך מתחיל מ-`0`, ולא מ-`1`. כלומר, האיבר הראשון נמצא באינדקס `0`, השני ב-`1`, וכן הלאה.

![Array](../../RESOURCE/011_array2.png)

אם רוצים לגשת לאיבר מסוים בתוך המערך, מספיק לכתוב את שם המערך ואחריו סוגריים מרובעים שבתוכם האינדקס הרצוי.

למשל:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

אם מנסים לגשת לאינדקס שנמצא מחוץ לטווח החוקי של המערך, תתרחש שגיאה מסוג “Index Out of Range”. לכן חשוב להיזהר ולוודא שהאינדקס נמצא בתחום התקין.

**חריגה מהטווח של אינדקס**

למשל, אם במערך יש רק 5 איברים, טווח האינדקסים החוקי הוא מ-`0` עד `4`. אם ננסה לגשת אל `sayings[5]`, התוכנית לא תמצא "קרון" מתאים, ותתקבל שגיאת חריגה מהטווח שעלולה לגרום לאפליקציה לקרוס.

![Array](../../RESOURCE/011_array3.png)

### פעולות על מערך

מערכים לא רק תומכים בהגדרה סטטית, אלא גם מאפשרים להוסיף, למחוק, לשנות איברים, וגם לבדוק את אורך המערך.

טיפ: אם רוצים לשנות מערך, חייבים להכריז עליו בעזרת `var`, ולא בעזרת `let`.

**1. הוספת איבר**

אפשר להשתמש במתודה `append` כדי להוסיף איבר לסוף המערך:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. מחיקת איבר**

באמצעות המתודה `remove(at:)` אפשר למחוק איבר מסוים מתוך המערך:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. שינוי איבר**

אפשר לשנות איבר במערך ישירות דרך האינדקס:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. ספירת אורך המערך**

באמצעות המאפיין `count` אפשר לקבל את מספר האיברים שבמערך:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### שימוש במערך כדי להציג ציטוטים

כדי להציג כמה ציטוטים, אפשר לשמור אותם במערך, ואז לגשת אליהם דרך אינדקס ולהציג אותם.

ראשית, ניצור ב-`ContentView` מערך בשם `sayings` שישמור את הציטוטים, ואז בתוך `Text` נציג את הציטוט המתאים לפי אינדקס:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

כאן `sayings[0]` מייצג את הציטוט הראשון במערך.

אם רוצים להציג ציטוט אחר, מספיק לשנות את ערך האינדקס שבתוך הסוגריים:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### הגדרת האינדקס של הציטוט

כדי לממש אפקט דינמי של מעבר בין ציטוטים, אי אפשר “לקבוע” את האינדקס ישירות בתוך `Text`.

צריך ליצור משתנה נפרד שישמור את האינדקס שמוצג כרגע.

ב-SwiftUI, אפשר להשתמש ב-`@State` כדי להכריז על אינדקס משתנה:

```swift
@State private var index = 0
```

SwiftUI יעקוב אחרי המשתנה שעוטף אותו `@State`, וכאשר `index` ישתנה, SwiftUI ירנדר מחדש את התצוגה ויציג את הציטוט המתאים.

לאחר מכן נשתמש ב-`sayings[index]` כדי לקבל באופן דינמי את הציטוט מתוך המערך:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

כאשר הערך של `index` משתנה, ה-`Text` יציג ציטוט אחר.

### שליטה באינדקס באמצעות כפתור

כדי לשלוט במעבר בין הציטוטים, אפשר להשתמש ב-`Button` כדי לשנות את הערך של `index`. בכל לחיצה, `index` יגדל ב-1:

```swift
Button("Next") {
    index += 1
}
```

כאשר לוחצים על הכפתור, הערך של `index` משתנה מ-`0` ל-`1`, התצוגה מתרעננת, ו-`Text(sayings[index])` יציג את הציטוט הבא.

אבל יש כאן בעיה פוטנציאלית: אם לוחצים על הכפתור שוב ושוב, `index` עלול לעלות לערך שחורג מגבולות המערך. למשל, כאשר `index` יגיע ל-`5` (בעוד שטווח האינדקסים הוא `0` עד `4`), התוכנית תקרוס.

כדי למנוע חריגה מהטווח, צריך להוסיף בקרה שתבטיח ש-`index` לא יעבור את גבולות המערך. אפשר לעשות זאת באמצעות משפטי `if-else`.

## בקרה תנאית: משפטי `if-else`

`if-else` הוא אחד ממשפטי התנאי הנפוצים ביותר ב-Swift. הוא משמש לבדיקה אם תנאי כלשהו מתקיים, ובהתאם לכך להרצת קטעי קוד שונים.

מבנה בסיסי:

```swift
if condition {
    // קוד שמתבצע כאשר condition הוא true
} else {
    // קוד שמתבצע כאשר condition הוא false
}
```

בתוך `if`, התנאי `condition` הוא ערך בוליאני (`Bool`), כלומר `true` או `false`. כאשר התנאי הוא `true`, מתבצע הקוד של `if`; אחרת מתבצע הקוד של `else`.

למשל:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

בדוגמה הזו, הערך של `age` הוא `25`, והמשפט `if` בודק האם `age > 18` מתקיים. מכיוון שהתנאי נכון, יודפס `"Big Boy"`.

אם לא צריך את חלק ה-`else`, אפשר להשמיט אותו:

```swift
if condition {
    // קוד שמתבצע כאשר condition הוא true
}
```

### שימוש בתנאי כדי לשלוט בטווח האינדקס

כדי למנוע חריגה מהטווח של המערך, אפשר להשתמש ב-`if` כדי לוודא ש-`index` לא עובר את גבולות המערך:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

ניתוח הלוגיקה: הערך של `sayings.count` הוא `5` (יש 5 ציטוטים), ולכן `sayings.count - 1` שווה ל-`4`, וזהו האינדקס החוקי האחרון במערך.

כאשר `index` קטן מ-`4`, בטוח לבצע `index += 1`. ברגע ש-`index` מגיע ל-`4`, התנאי כבר לא מתקיים, ולחיצה נוספת על הכפתור לא תגרום לשום שינוי.

כעת הקוד כבר מממש מעבר בין ציטוטים:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### מעבר מחזורי בין ציטוטים

אם נרצה שלאחר הציטוט האחרון, לחיצה נוספת תחזיר שוב לציטוט הראשון, אפשר להשתמש בחלק `else` כדי לממש מחזוריות:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

כאשר לוחצים על הכפתור, ואם `index` כבר הגיע לאיבר האחרון במערך, הוא יתאפס ל-`0` ויתחיל מחזור חדש של הצגת הציטוטים.

## שיפור תצוגת הציטוטים

עכשיו לוגיקת הקרוסלה כבר פועלת, אבל עדיין אפשר לשפר את הממשק כדי שייראה יפה יותר.

קוד מלא:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

בדוגמה הזאת, לתצוגת `Text` נוסף רקע לבן שקוף למחצה ופינות מעוגלות; הכפתור משתמש בסגנון `.borderedProminent`; ול-`VStack` נוסף רקע של תמונה.

הרחבה קטנה: כאשר משתמשים ב-`background()` כדי לטפל בתמונת רקע, ברירת המחדל שלו היא לנסות למלא את אזור הפריסה של התצוגה הנוכחית ככל האפשר. במקרים רבים הוא גם יוכל להתרחב באופן טבעי אל ה-`Safe Area`.

כעת מימשנו את תצוגת קרוסלת הציטוטים.

![SwiftUI View](../../RESOURCE/011_word.png)

## סיכום

באמצעות השיעור הזה למדנו איך להשתמש במערכים כדי לשמור כמה ציטוטים, ואיך להשתמש ב-`if` וב-`if-else` כדי לממש קרוסלה של ציטוטים.

הכרנו גם את הפעולות הבסיסיות על מערכים, כמו הוספה, מחיקה, שינוי איברים, וגם איך למנוע חריגה מהטווח של אינדקסים.

השיעור הזה לא רק הסביר איך מממשים קרוסלה של ציטוטים, אלא גם שילב שימוש בסיסי במערכים ובמשפטי תנאי, וכך עזר לנו להבין טוב יותר איך מטפלים בנתונים ואיך שולטים בזרימת התוכנית.

## הרחבה - בדיקת תנאים מרובים: `if-else if-else`

בפיתוח אמיתי יש לעיתים קרובות צורך לטפל בכמה תנאים שונים. למשל, במשחק כלשהו אפשר להפעיל אירוע A כאשר הניקוד שווה ל-`1`, אירוע B כאשר הוא שווה ל-`2`, אירוע C כאשר הוא שווה ל-`3`, וכן הלאה.

כאשר יש יותר משני מסלולי תנאי, משתמשים במבנה `if-else if-else`.

תחביר בסיסי:

```swift
if conditionA {
    // קוד שמתבצע כאשר conditionA הוא true
} else if conditionB {
    // קוד שמתבצע כאשר conditionB הוא true
} else if conditionC {
    // קוד שמתבצע כאשר conditionC הוא true
} else {
    // קוד שמתבצע כאשר אף תנאי לא מתקיים
}
```

במקרה כזה, התוכנית בודקת את התנאים לפי הסדר, ומבצעת את הקטע של התנאי הראשון שמתקיים. אם אף תנאי לא מתקיים, יתבצע הקוד שאחרי `else`.

גם בקרוסלת הציטוטים אפשר להשתמש ב-`if-else if-else` כדי לבצע בדיקה מרובת תנאים:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

כאשר `index` שווה ל-`0`、`1`、`2` או `3`, כל לחיצה תבצע `index += 1`; וכאשר `index` שווה ל-`4` (האיבר האחרון), הוא יתאפס ל-`0` וכך תיווצר מחזוריות.

הענף `else` משמש כגיבוי, כדי למנוע מצב של ערך לא חוקי (למשל אם `index` שונה בטעות).

חשוב לשים לב שכאן `==` פירושו “האם שווה ל-”. אם משפט `if` בודק האם `index` שווה למספר מסוים, ותוצאת ההשוואה היא `true`, קטע הקוד שלאחר מכן יתבצע. אם לא, התוכנית תמשיך לבדוק את התנאי הבא.

בדיקה מרובת תנאים כזו שימושית מאוד כשצריך להריץ קטעי קוד שונים במצבים שונים.
