# מתחילים מ-ContentView

## הכנה לפני השיעור

בשיעור הזה נתחיל מקובץ `ContentView.swift` ונכיר בצורה מסודרת את המבנה הבסיסי של SwiftUI, כולל:

- הערות
- מבנה View
- פריסות `VStack` / `HStack` / `ZStack`
- אייקוני `SF Symbols`
- modifiers של תצוגות
- קוד תצוגה מקדימה `#Preview`

ראשית, מצאו את פרויקט Xcode שיצרתם קודם ולחצו פעמיים על קובץ `.xcodeproj`.

באזור ה-`Navigator` בצד שמאל בחרו את הקובץ `ContentView.swift`.

שימו לב: בכל פתיחה של הפרויקט, ייתכן שה-Canvas יציג `"Preview paused"`. לחיצה על כפתור הרענון תחזיר את התצוגה המקדימה.

![Swift](../../RESOURCE/002_view7.png)

## היכרות עם ContentView

קוד `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

למרות שהקוד קצר יחסית, הוא כבר מכיל את המבנה המרכזי של SwiftUI.

### 1. הערות

בראש הקובץ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

אלה הערות של הקובץ, המשמשות לרישום מידע כמו שם הקובץ, שם הפרויקט, היוצר ותאריך היצירה.

ב-Swift משתמשים ב-`//` כדי לכתוב הערה בשורה אחת:

```swift
// זו הערה
```

הערות משפרות את קריאות הקוד ועוזרות למפתחים להבין את הלוגיקה שלו.

בפיתוח אמיתי, קוד עלול להיות קשה להבנה. בלי הערות, עלול לקרות שאחרי שלושה ימים כבר לא תבינו את הקוד של עצמכם.

לכן, הוספת הערות באופן יזום בזמן הכתיבה היא הרגל פיתוח טוב. אפשר להשתמש בהן כדי לתעד את הלוגיקה של הקוד ולהקל על התחזוקה בהמשך.


**השבתה זמנית של קוד**

אפשר גם להשתמש בהערות כדי להשבית קוד באופן זמני ולעזור באיתור תקלות.

למשל:

```
A
B
C
```

נניח ש-`A`、`B`、`C` הם שלושה קטעי קוד, ואחד מהם גורם לשגיאה. אפשר להוסיף הערה זמנית ולבדוק.

קודם נוסיף הערה ל-`A`:

```
// A
B
C
```

אם אחרי השבתת `A` הקוד חוזר לעבוד תקין, סימן שהבעיה נמצאת ב-`A`.

אם גם אחרי השבתת `A` עדיין יש בעיה, אפשר להשבית את `B`, וכך הלאה, עד שמוצאים את קטע הקוד הבעייתי.

בפיתוח נתקלים בלא מעט בעיות, ולעיתים קרובות צריך להיעזר בהשבתה זמנית של קוד כדי להבין את מקור התקלה. זה עוזר לאתר את הקוד הבעייתי ולמצוא את ה-BUG.

ב-Xcode אפשר להשתמש בקיצור המקלדת:

```
Command ⌘ + /
```

כדי להוסיף או להסיר הערות במהירות.


### 2. ייבוא מסגרת SwiftUI

```swift
import SwiftUI
```

שורת קוד זו אומרת לייבא את מסגרת `SwiftUI`.

טיפוסים כמו `View`、`Text`、`Image` ו-`VStack` ב-SwiftUI מגיעים מהמסגרת הזו.

אם לא מייבאים את `SwiftUI`, Xcode יציג שגיאה:

```
Cannot find type 'View' in scope
```

כלומר, הקומפיילר לא מצליח לזהות את הטיפוס `View`.


### 3. מבנה ה-View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

בפעם הראשונה שרואים את המבנה הזה, הוא עלול להרגיש זר, כי הוא כולל מילות מפתח כמו `struct`、`View`、`var`、`body` ו-`some`.

עדיין לא למדנו את כל המילים האלו, וכרגע מספיק להבין שהקוד הזה יוצר תצוגה בשם `ContentView`.

אפשר לחשוב על `View` כעל לוח ציור, שעליו אנחנו יכולים לצייר, והכלים לציור הם SwiftUI.

לדוגמה:

![Swift](../../RESOURCE/002_view.png)

בתמונה למעלה מוצגים שלושה עמודים, ובפועל כל אחד מהם הוא `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

כשמפתחים אפליקציה עם SwiftUI, כל עמוד הוא `View`.

### 4. קוד SwiftUI

בתוך ה-`View` מופיע קוד SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

הקוד הזה אומר: יש כאן פריסה אנכית שמציגה אייקון וטקסט.

![Swift](../../RESOURCE/002_view1.png)


#### פריסת `VStack`

```swift
VStack { }  // פריסה אנכית
```

`VStack` הוא מיכל פריסה אנכי. התצוגות שבתוכו מסודרות מלמעלה למטה.

![Swift](../../RESOURCE/002_view8.png)

ב-SwiftUI יש שלוש פריסות נפוצות:

- `VStack` —— סידור אנכי
- `HStack` —— סידור אופקי
- `ZStack` —— סידור בשכבות (ציר Z)

```swift
HStack { }  // סידור אופקי
ZStack { }  // סידור בשכבות
```

המחשה של שלושת סוגי הפריסה:

![Swift](../../RESOURCE/002_view2.png)

למשל, אם נשתמש ב-`HStack`:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

אפשר לראות שהאייקון של כדור הארץ והטקסט מוצגים כעת זה לצד זה.

![Swift](../../RESOURCE/002_view3.png)

כשאנחנו רוצים סידור אופקי, משתמשים ב-`HStack`. כשצריך פריסה בשכבות, משתמשים ב-`ZStack`.


#### `Image` ו-`SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

קטע הקוד הזה מציג אייקון של כדור הארץ, שמגיע ממערכת האייקונים של Apple בשם `SF Symbols`.

![Swift](../../RESOURCE/002_view9.png)

משמעות הקוד היא: להציג אייקון של כדור הארץ, בגודל גדול, ובצבע הדגשה.

מעבר לאייקון של כדור הארץ, אפשר להציג גם אייקונים אחרים.

לדוגמה, הצגת תיק גב:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**איך מציגים אייקונים אחרים?**

צריך להשתמש בספריית האייקונים הרשמית של Apple, כלומר `SF Symbols`.

פתחו את האתר הרשמי של Apple Developer והורידו את [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

פתחו את אפליקציית `SF Symbols`.

![Swift](../../RESOURCE/002_sf1.png)

בצד שמאל תראו קטגוריות של סמלים, ובצד ימין את האייקונים המתאימים.

בלחיצה ימנית על אייקון אפשר לבחור באפשרות “העתקת שם אחד”, וכך לקבל את המחרוזת המתאימה לו.

למשל:

```
"globe"
"backpack"
"heart"
```

אם תכניסו את שם האייקון שהועתק אל תוך `Image(systemName:)`, תוכלו להציג אייקון שונה.

שימו לב: לכל אייקון ב-`SF Symbols` יש גרסת מערכת מינימלית נתמכת. אם גרסת המערכת נמוכה מדי, ייתכן שהאייקון לא יוצג. אפשר לבדוק את מידע התאימות באפליקציית `SF Symbols`.

#### Modifiers

ב-SwiftUI, modifier הוא דרך לשנות את המראה או ההתנהגות של תצוגה.

אפשר לחשוב על modifier כמו על בגד: אותה תצוגה, אבל עם “לבוש” שונה, תיראה אחרת.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` ו-`foregroundStyle` הם modifiers של תצוגת `Image`. הם משנים את המראה שלה בלי לשנות את תוכן התמונה עצמה.


**1. `imageScale`**

```swift
.imageScale(.large)
```

modifier זה שולט בגודל של אייקוני `SF Symbols`:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

אפשר לנסות את האפשרויות השונות ולראות איך גודל הסמל משתנה.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` שולט בצבע החזית.

`.tint` מייצג את צבע ההדגשה של הסביבה הנוכחית (`accent color`), שב-iOS הוא כחול כברירת מחדל.

אם נרצה לשנות את צבע החזית לאדום:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### תצוגת `Text`

`Text` היא תצוגת טקסט, ומשמשת להצגת מחרוזות.

```swift
Text("Hello, world!")
```

למשל, הצגת השם שלי:

```swift
Text("FangJunyu")
```

שימו לב: מחרוזות חייבות להיות עטופות במרכאות כפולות `""`.

אפשר לנסות להציג את השם שלכם, מספר טלפון, ועוד.

#### `padding` שוליים פנימיים

ב-SwiftUI, `padding` מוסיף מרווח בין תוכן התצוגה לבין הגבולות שלה. זהו שול פנימי (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

הקוד למעלה אומר להוסיף מרווח ברירת מחדל של המערכת לתצוגת `HStack`.

**מהו `padding`?**

`padding` מתאר את השטח הריק בין תוכן התצוגה לבין הגבול שלה.

בתמונה הבאה, לאחר שהגדרנו `padding` ל-`HStack` הכחול, האזור הכחול “מתכווץ” פנימה, ונראה כאילו הוא קטן מעט.

![Swift](../../RESOURCE/002_view6.png)

**שוליים ברירת מחדל**

modifier בשם `padding()` משתמש במרווח הסטנדרטי המומלץ על ידי המערכת.

```swift
.padding()
```

בפלטפורמות והקשרים שונים, הערך הזה יכול להשתנות. למשל:

- ב-iOS הוא בדרך כלל בערך `16 pt`
- ב-macOS או watchOS המרווח הסטנדרטי יכול להיות גדול יותר או קטן יותר, בהתאם לכללי העיצוב של אותה פלטפורמה

**שוליים מותאמים אישית**

אפשר גם להגדיר שוליים מסוימים בלבד.

1. קביעת כיוון יחיד

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

פירוש הכיוונים:

- `.top`: שול עליון
- `.bottom`: שול תחתון
- `.leading`: שול קדמי
- `.trailing`: שול אחורי

![Swift](../../RESOURCE/002_view12.png)

שימו לב: `leading` ו-`trailing` מותאמים אוטומטית לכיוון השפה. למשל, בסביבת ערבית (`RTL`) הם יתהפכו אוטומטית.

2. קביעת כמה כיוונים יחד

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**הסרת שוליים**

אם לא רוצים שום שוליים, אפשר להשתמש ב-`.padding(0)`:

```swift
.padding(0)
```

או פשוט למחוק את modifier ה-`padding`:

```swift
// .padding()
```


### 6. קוד התצוגה המקדימה `Preview`

```swift
#Preview {
    ContentView()
}
```

הקוד הזה אומר לייצר ב-Canvas תצוגה מקדימה של `ContentView`.

שימו לב: `#Preview` הוא תחביר חדש שהוצג ב-Swift 5.9 / Xcode 15. לפני כן נהגו להשתמש במבנה `PreviewProvider`.

**מה קורה אם משביתים את Preview?**

אם נוסיף הערה ל-Preview:

```swift
// #Preview {
//    ContentView()
// }
```

ה-Canvas כבר לא יציג תוכן שניתן לרנדר.

![Swift](../../RESOURCE/002_xcode.png)

זאת משום ש-`#Preview` הוא זה ששולט על הצגת התצוגה המקדימה ב-Canvas.

כאשר רוצים לצפות בתצוגת SwiftUI ב-Xcode, צריך להוסיף קוד `#Preview`. אם לא צריך תצוגה מקדימה, אפשר להשבית או למחוק אותו.

## סיכום

למרות שבקובץ `ContentView.swift` אין הרבה קוד, הוא מכסה כמה מהמושגים המרכזיים של SwiftUI. עבור מתחילים הוא עלול להיראות לא מוכר, אך פירוק של מבנה הקוד עוזר לבנות היכרות ראשונית עם SwiftUI.

נעבור בקצרה על מה שלמדנו בשיעור הזה: קודם למדנו על הערות `//`, שאפשר להשתמש בהן כדי להסביר את לוגיקת הקוד או להשבית קוד באופן זמני.

לאחר מכן הבנו שקובץ SwiftUI חייב לייבא את מסגרת `SwiftUI`:

```swift
import SwiftUI
```

אם לא מייבאים את המסגרת, הקומפיילר לא יוכל לזהות טיפוסים כמו `View`.

לאחר מכן הכרנו את המבנה הבסיסי של תצוגת SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

כאשר `ContentView` הוא שם התצוגה.

למדנו גם על שלושה מיכלי פריסה נפוצים: `VStack` (סידור אנכי), `HStack` (סידור אופקי) ו-`ZStack` (סידור בשכבות).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

הקוד הזה אומר: להציג מיכל בסידור אנכי, שבתוכו מוצגים אייקון וטקסט.

`Image` יכול להציג אייקוני `SF Symbols`, ובאמצעות modifiers אפשר לשלוט בגודל ובצבע שלהם.

תצוגת `Text` משמשת להצגת תוכן טקסטואלי.

`padding` מוסיף מרחב שקוף מסביב לתצוגה.

ולבסוף, `#Preview` משמש להצגת התצוגה המקדימה בתוך ה-Canvas.


### תרגול אחרי השיעור

למתחילים, תוכן השיעור הזה עלול להרגיש מעט מורכב. אפשר לחזק את ההבנה באמצעות תרגול נוסף:

- לשנות את שם האייקון של `SF Symbols`
- לשנות את צבע החזית של האייקון לשחור
- להחליף את `VStack` ב-`HStack`
- להשבית זמנית את `Image` או `Text` ולבחון איך התצוגה המקדימה משתנה

### בונוס: השלמת קוד (`Code Completion`)

בזמן כתיבת קוד, ייתכן שכבר שמתם לב ש-Xcode מציג אוטומטית רשימת אפשרויות זמינות.

למשל, כשמשנים את modifier בשם `imageScale`:

```swift
.imageScale(.)
```

Xcode יציג את האפשרויות הזמינות:

![Swift](../../RESOURCE/002_view10.png)

זהו מנגנון השלמת הקוד (`Code Completion`), המבוסס על הסקת טיפוסים והצעות של חברי enum. הוא יכול לשפר את מהירות ההקלדה ולהפחית טעויות.

בשיעורים הבאים נציג רשמית את נושא ה-enum, וכרגע מספיק להכיר אותו ברמה ראשונית.
