# View מותאם אישית

בשיעור זה נלמד דרך כתיבה חשובה מאוד ב-SwiftUI: **View מותאם אישית**.

View מותאם אישית יכול לעטוף מקטע קוד View שחוזר על עצמו ולהפוך אותו ל-View שניתן להשתמש בו שוב ושוב.

בפיתוח App אמיתי, אנחנו נתקלים לעיתים קרובות במצב כזה: המבנה של ממשקים רבים זהה, אך התוכן שמוצג שונה.

לדוגמה, ברשימת פוסטים באתר פורום, כל פוסט עשוי לכלול מידע כמו כותרת, תמונה ומספר לייקים.

![Reddit](../../../Resource/028_view1.png)

ברשימת מוצרים באתר קניות, כל מוצר עשוי לכלול מידע כמו תמונה, שם ומחיר.

![Amazon](../../../Resource/028_view2.png)

המבנה של התכנים האלה דומה; ההבדל הוא רק בנתונים שמוצגים.

אם נכתוב ידנית את הקוד של כל פריט, הקוד יהפוך לארוך מאוד, וגם לא יהיה נוח לשנות אותו בהמשך.

לכן אפשר לעטוף את המבנה המשותף בתוך View מותאם אישית, ולהעביר את התוכן השונה כפרמטרים.

כך אותו View יכול להציג תכנים שונים.

## תרחיש הדרישה

לדוגמה, עכשיו אנחנו רוצים ליצור רשימת הגדרות.

תוצאת התצוגה:

![view](../../../Resource/028_view.png)

ברשימת ההגדרות הזו יש שלושה פריטי הגדרה שונים: `הגדרות`, `תיקייה`, `מוזיקה`.

אף שהאייקונים, הצבעים והכותרות שלהם שונים, המבנה הכללי זהה:

- אייקון בצד שמאל
- צבע רקע של האייקון
- כותרת באמצע
- חץ בצד ימין

אם לא נשתמש ב-View מותאם אישית, ייתכן שנכתוב כך:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("הגדרות")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("תיקייה")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("מוזיקה")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

הקוד הזה יכול להיות מוצג כרגיל, אבל גם הבעיה ברורה מאוד: הקוד של שלושת פריטי ההגדרות כמעט זהה לחלוטין.

הדברים היחידים ששונים הם האייקון, הצבע והכותרת:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("הגדרות")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("תיקייה")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("מוזיקה")
```

כלומר, המבנה של כל פריט הגדרה קבוע, ורק האייקון, הצבע והכותרת שונים.

מצב כזה מתאים מאוד לשימוש ב-View מותאם אישית.

### צל shadow

כאן משתמשים ב-modifier חדש, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` יכול להוסיף צל ל-View.

`radius` מציין את רדיוס הטשטוש של הצל. ככל שהערך גדול יותר, בדרך כלל אזור הפיזור של הצל גדול יותר, והוא נראה רך יותר.

כאן הוא מוגדר כ-`1`, כלומר מוסיפים רק אפקט צל עדין מאוד.

## עטיפת ה-View של פריט ההגדרה

לאחר מכן נעטוף כל פריט הגדרה בתוך View חדש.

אפשר ליצור `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ב-View הזה הגדרנו שלושה properties:

```swift
let icon: String
let color: Color
let title: String
```

ביניהם:

- `icon` מציין את שם האייקון
- `color` מציין את צבע הרקע של האייקון
- `title` מציין את הכותרת של פריט ההגדרה

מכיוון ששלושת התכנים האלה שונים בפריטי הגדרה שונים, אנחנו הופכים אותם לפרמטרים שאפשר להעביר מבחוץ.

## שימוש ב-View מותאם אישית

לאחר שיש לנו `SettingItemView`, אין צורך לכתוב שוב ושוב מקטע גדול של קוד `HStack`.

עכשיו אפשר להשתמש בו כך:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")
```

שורת הקוד הזו פירושה יצירת View של פריט הגדרה והעברת שלושה פרמטרים:

```swift
icon: "gear"
color: Color.blue
title: "הגדרות"
```

לאחר ההעברה, ה-properties שבתוך `SettingItemView` יקבלו את הערכים המתאימים:

- הערך של `icon` הוא `gear`
- הערך של `color` הוא `Color.blue`
- הערך של `title` הוא `"הגדרות"`

לכן בתוך ה-View, `Image(systemName: icon)` יציג אייקון גלגל שיניים, `.background(color)` ישתמש ברקע כחול, ו-`Text(title)` יציג `הגדרות`.

הקוד המלא:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "תיקייה")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "מוזיקה")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/028_view.png)

אפשר לראות שלאחר העטיפה תוצאת התצוגה זהה לקודם, אך הקוד ברור יותר.

בעבר היה צריך לכתוב מקטע `HStack` שלם לכל פריט הגדרה, וכעת מספיקה שורת קוד אחת בלבד:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")
```

זהו תפקידו של View מותאם אישית: **לעטוף מבנה View שחוזר על עצמו, ולהעביר רק את התוכן השונה כפרמטרים.**

## למה אפשר להעביר פרמטרים

כעת נבין בקצרה מדוע View מותאם אישית יכול לקבל פרמטרים.

ב-SwiftUI, View הוא במהותו structure.

לדוגמה:

```swift
struct ContentView: View {
    var body: some View {
        Text("שלום, עולם!")
    }
}
```

כאן `ContentView` הוא structure.

כאשר אנחנו כותבים:

```swift
ContentView()
```

למעשה אנחנו יוצרים View מסוג `ContentView`.

ה-`()` שבסוף מציינים קריאה ל-initialization method שלו; אפשר גם להבין זאת כיצירת ה-View הזה.

מכיוון של-`ContentView` הזה אין properties שצריך להעביר מבחוץ, אפשר לכתוב ישירות:

```swift
ContentView()
```

אבל אם יש בתוך ה-View property שאין לו ערך, צריך להעביר את הערך המתאים בזמן יצירת ה-View.

לדוגמה:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("שם: \(name)")
    }
}
```

כאן `name` הוא property, ואין לו default value.

לכן כאשר יוצרים `ContentView`, חייבים לתת ל-`name` ערך ממשי:

```swift
ContentView(name: "Fang Junyu")
```

כך ה-View יוכל להשתמש בערך הזה בפנים:

```swift
Text("שם: \(name)")
```

זו גם הסיבה שצריך להעביר פרמטרים כאשר יוצרים `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")
```

מכיוון שב-`SettingItemView` יש שלושה properties ללא default values:

```swift
let icon: String
let color: Color
let title: String
```

לכן בזמן יצירת ה-View הזה צריך להעביר אותם פנימה. Swift תשתמש בפרמטרים שהועברו כדי להקצות ערכים ל-properties שבתוך ה-View.

## Initialization method

כעת נבין קצת יותר לעומק את ה-initialization method.

### Default initialization method

כאשר אנחנו מגדירים View רגיל:

```swift
struct ContentView: View {
    var body: some View {
        Text("שלום, עולם!")
    }
}
```

בקוד הזה לא כתבנו initialization method ידנית.

אבל כאשר משתמשים ב-View הזה, אפשר לכתוב כך:

```swift
ContentView()
```

כאן `()` פירושו למעשה יצירת `ContentView`; אפשר להבין זאת גם כקריאה ל-initialization method שלו.

### למה אפשר לקרוא לו אף שלא רואים initialization method?

מפני ש-Swift compiler יוצר עבורנו initialization method באופן אוטומטי.

חשוב לשים לב: **ה-initialization method הזה נוצר אוטומטית, ובדרך כלל לא נראה אותו ישירות בקוד.**

כלומר, אף שלא כתבנו ידנית בתוך `struct` כך:

```swift
init() {

}
```

Swift compiler ייצור עבורנו מאחורי הקלעים בערך initialization method כזה:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("שלום, עולם!")
    }
}
```

לכן אנחנו יכולים לכתוב ישירות:

```swift
ContentView()
```

לכן בקוד אמיתי, בדרך כלל אין צורך לכתוב את ה-initialization method ידנית.

צריך להבין רק דבר אחד: **כאשר יוצרים SwiftUI View, ה-initialization method של אותו View נקרא. גם אם לא כתבנו initialization method ידנית, Swift יכולה ליצור אותו אוטומטית עבורנו.**

### Initialization method עם פרמטרים

אם יש ב-View property ללא default value, לדוגמה:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("שם: \(name)")
    }
}
```

Swift compiler ייצור אוטומטית initialization method עם פרמטר בהתאם ל-property.

אפשר להבין זאת בפשטות כך:

```swift
init(name: String) {
    self.name = name
}
```

כאן:

```swift
init(name: String)
```

פירושו שכאשר יוצרים `ContentView`, צריך להעביר פרמטר `name` מסוג `String`.

כאשר אנחנו כותבים:

```swift
ContentView(name: "Fang Junyu")
```

המשמעות היא: להעביר את `"Fang Junyu"` כפרמטר ל-initialization method.

לאחר מכן, בתוך ה-initialization method יתבצע:

```swift
self.name = name
```

שורת הקוד הזו פירושה: להקצות את `name` שהועבר מבחוץ ל-property `name` של ה-View הנוכחי עצמו.

אפשר להבין זאת בפשטות כך:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("שם: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

כך ה-View יכול להשתמש בערך שהועבר בתוכו.

זהו תהליך ה-initialization של View עם פרמטרים: **כאשר ל-property בתוך ה-View אין default value, צריך להעביר את הפרמטר המתאים בזמן יצירת ה-View, כדי שה-initialization method ישלים את הקצאת הערך ל-property.**

## מצב שבו ל-property יש default value

אם ל-property כבר יש default value, אפשר ליצור את ה-View בלי להעביר פרמטר.

לדוגמה:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("שם: \(name)")
    }
}
```

כאן ל-`name` כבר יש default value:

```swift
"Fang Junyu"
```

לכן כאשר יוצרים `ContentView`, אפשר לכתוב ישירות:

```swift
ContentView()
```

בשלב זה `name` ישתמש ב-default value, והממשק יציג:

```swift
שם: Fang Junyu
```

כמובן, אפשר גם להעביר ערך חדש בזמן יצירת ה-View:

```swift
ContentView(name: "Sam")
```

בשלב זה ה-View ישתמש ב-`"Sam"` שהועבר מבחוץ במקום ב-default value, והממשק יציג:

```swift
שם: Sam
```

כדי להקל על ההבנה, אפשר לדמיין את ה-initialization method ש-Swift compiler יוצר אוטומטית כך:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

כאן `name: String = "Fang Junyu"` פירושו: אם לא מעבירים `name` בזמן יצירת ה-View, משתמשים ב-default value `"Fang Junyu"`; אם מעבירים `name` חדש בזמן יצירת ה-View, משתמשים בערך שהועבר.

כלומר: **אם לא מועבר פרמטר מבחוץ, משתמשים ב-default value של ה-property; אם מועבר פרמטר מבחוץ, משתמשים בערך שהועבר.**

## חזרה אל SettingItemView

עכשיו נחזור לראות את SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

המבנה של ה-View הזה קבוע.

החלקים הקבועים כוללים:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

החלקים השונים כוללים:

```swift
icon
color
title
```

לכן אנחנו הופכים את התוכן השונה ל-properties, ומעבירים אותו כפרמטרים בזמן יצירת ה-View.

כאשר יוצרים פריטי הגדרה שונים, צריך רק להעביר פרמטרים שונים:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")
SettingItemView(icon: "folder", color: Color.brown, title: "תיקייה")
SettingItemView(icon: "music.note", color: Color.purple, title: "מוזיקה")
```

כך אותו `SettingItemView` יכול להציג שלושה פריטי הגדרה שונים.

זו הדרך הנפוצה ביותר להשתמש ב-View מותאם אישית.

## סיכום

בשיעור זה למדנו על View מותאם אישית.

התפקיד המרכזי של View מותאם אישית הוא: **לעטוף קוד View שחוזר על עצמו, כך שניתן יהיה להשתמש בו מחדש.**

בדוגמה זו, המבנה של שלושת פריטי ההגדרות זהה, ורק האייקון, הצבע והכותרת שונים.

לכן יצרנו את `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

לאחר מכן, בזמן השימוש ב-View הזה, אנחנו מעבירים פרמטרים שונים:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "הגדרות")
```

הפרמטרים כאן נכנסים אל תוך `SettingItemView`.

באמצעות השיטה הזו, אפשר להשתמש בפחות קוד כדי ליצור Views עם אותו מבנה אך עם תוכן שונה.

זו גם דרך כתיבה נפוצה מאוד בפיתוח SwiftUI.
