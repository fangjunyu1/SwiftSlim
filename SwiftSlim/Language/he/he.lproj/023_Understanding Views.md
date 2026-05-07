# הבנת Views

בשיעור הזה נחזור אל ה-`ContentView` המקורי.

```swift
struct ContentView: View {
    var body: some View {
        Text("שלום, עולם!")
    }
}
```

כשפגשנו את SwiftUI בפעם הראשונה, היו בתוך `ContentView` הרבה מילות מפתח שלא הבנו.

למשל `struct`, `View`, `var`, `body`, `some View` ועוד מילות מפתח.

באותו זמן אולי ידענו רק את זה: **אם כותבים קוד בתוך `body`, התוכן יופיע בממשק.**

עכשיו, אחרי שלמדנו `struct`, משתנים, מתודות ופרוטוקולים, אפשר להבין מחדש את הקוד הזה ולהשתמש בו כדי להבין את הקשר בין views ב-SwiftUI.

## חזרה על ContentView

לאחר יצירת פרויקט SwiftUI, Xcode יוצר כברירת מחדל קובץ `ContentView`.

קוד הדוגמה הוא:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("שלום, עולם!")
        }
        .padding()
    }
}
```

אפשר להבין את הקוד הזה על ידי פירוק שלו לכמה חלקים.

קודם כול:

```swift
import SwiftUI
```

השורה הזו מייבאת את framework בשם SwiftUI.

אחרי שמייבאים את SwiftUI, אפשר להשתמש ב-views של SwiftUI כמו `View`, `Text`, `Image`, `VStack`, ו-`Button`.

## המבנה ContentView

שורת הקוד הזו יוצרת מבנה:

```swift
struct ContentView: View
```

מתוכה:

```swift
struct ContentView
```

אומרת ש-`ContentView` הוא מבנה.

בשיעור הקודם למדנו על `struct`. הוא יכול לקבץ יחד שדות קשורים, והוא יכול להכיל properties ומתודות.

לדוגמה:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("שלום, עולם!")
    }
}
```

בדוגמה הזו, `ContentView` מכיל שלושה דברים: `name`, `printName` ו-`body`.

כלומר, `struct` יכול לקבץ יחד properties, מתודות ותוכן view שקשורים זה לזה.

![contentView](../../Resource/023_contentVIew.png)

## View הוא פרוטוקול

נמשיך להסתכל על שורת הקוד הזו:

```swift
struct ContentView: View 
```

ה-`View` שאחרי הנקודתיים אומר ש-`ContentView` מציית לפרוטוקול `View`.

אפשר להבין זאת כך: אם `ContentView` רוצה להפוך ל-SwiftUI view, הוא חייב לעמוד בדרישות של הפרוטוקול `View`.

### הפרוטוקול Identifiable

כשלמדנו קודם על רשימת הסרטים, נתקלנו בפרוטוקול `Identifiable`.

באותו זמן היינו צריכים לעבור על array של `Movie` בתוך `ForEach`, אבל למבנה `Movie` לא היה מזהה ייחודי, ולכן לא היה אפשר להשתמש בו ישירות עם `ForEach`.

לכן היינו צריכים לגרום למבנה `Movie` לציית לפרוטוקול `Identifiable`, כדי שיעמוד בדרישה של `ForEach` למזהה ייחודי.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

הפרוטוקול `Identifiable` דורש: **לטיפוס הזה חייב להיות שדה `id` שמזהה אותו.**

אחרי ש-`Movie` מספק שדה `id`, הוא יכול לעמוד בדרישות של `Identifiable`.

כך, כשאנחנו משתמשים בו בתוך `ForEach`, SwiftUI יכול לזהות כל פריט נתונים.

```swift
ForEach(lists) { movie in
    // ...
}
```

### הפרוטוקול View

הפרוטוקול `View` עובד באותה צורה.

אם טיפוס רוצה להפוך ל-SwiftUI view, הוא צריך לציית לפרוטוקול `View`.

הדרישה החשובה ביותר של הפרוטוקול `View` היא לספק `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("שלום, עולם!")
    }
}
```

אפשר להבין את הדרישה של הפרוטוקול `View` כך: **הוא מקבל את ה-SwiftUI view ש-`body` מחזיר, ו-`ContentView` מציג SwiftUI views דרך `body`.**

### מה קורה אם לא מצייתים ל-View?

אם נכתוב כך:

```swift
struct ContentView {
}
```

זה רק מבנה רגיל, לא SwiftUI view.

זה לא יגרום לשגיאה ישירות, כי מבנה רגיל הוא קוד Swift תקין.

אבל אם נשים אותו בתוך preview:

```swift
#Preview {
    ContentView()
}
```

תופיע שגיאה.

הסיבה היא: **preview צריך להציג SwiftUI view, אבל ה-`ContentView` הזה לא מציית לפרוטוקול `View`.**

לכן, אם אנחנו רוצים ש-`ContentView` יוכל להופיע בממשק, צריך לגרום לו לציית לפרוטוקול `View`:

```swift
struct ContentView: View {
}
```

במקביל, צריך לספק `body` כפי שהפרוטוקול `View` דורש. אם אין `body`, ה-compiler עדיין יציג שגיאה.

הכתיבה הנכונה:

```swift
struct ContentView: View {
    var body: some View {
        Text("שלום, עולם!")
    }
}
```

בשלב הזה `ContentView` הוא SwiftUI view אמיתי שאפשר להציג.

## body הוא נקודת הכניסה להצגת view

ב-SwiftUI, `body` הוא נקודת הכניסה לתוכן של view.

```swift
var body: some View {
    Text("שלום, עולם!")
}
```

אפשר לחלק זאת לשלושה חלקים:

**1. var body**

```swift
var body
```

זה מגדיר משתנה בשם `body`.

**2. some View**

```swift
: some View
```

זה אומר שה-`body` הזה מחזיר view.

**3. { ... }**

```swift
{
    Text("שלום, עולם!")
}
```

זה מייצג את תוכן ה-view שמוצג. בקוד הזה התוכן המוצג הוא view מסוג `Text`.

במילים אחרות, מה שנכתוב בתוך `body` הוא מה שיופיע בממשק.

לדוגמה:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("שם:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

הקוד הזה אומר: **בממשק מוצג תוכן המסודר אנכית, ובתוכו שני טקסטים.**

### אי אפשר לשנות את השם body בחופשיות

חשוב לשים לב שאי אפשר לשנות את השם `body` בחופשיות.

אם נכתוב:

```swift
struct ContentView: View {
    var content: some View {
        Text("שלום, עולם!")
    }
}
```

ה-`content` הזה הוא גם property של view, אבל הוא לא יכול להחליף את `body`.

זאת משום שהשם שהפרוטוקול `View` דורש הוא `body`.

## מהו some View?

ב-SwiftUI, `some View` פירושו החזרת view מסוים, אבל בלי לכתוב את הטיפוס המלא של ה-view הזה.

```swift
var body: some View
```

כלומר, `some View` לא אומר שאין טיפוס. הטיפוס האמיתי עדיין קיים, וה-compiler מכיר את הטיפוס הזה, אבל הטיפוס יכול להיות מורכב, ולכן Swift מאפשרת לנו להסתיר אותו באמצעות `some View`.

### מהו some?

ב-Swift, `some` היא מילת מפתח להצהרה על opaque type.

Opaque type פירושו: **לערך המוחזר יש טיפוס קונקרטי, וה-compiler יודע מהו הטיפוס הקונקרטי הזה, אבל אנחנו לא כותבים את הטיפוס הקונקרטי ישירות.**

לדוגמה:

```swift
func makeView() -> some View {
    Text("שלום")
}
```

זה אומר ש-`makeView` מחזירה טיפוס קונקרטי שמציית לפרוטוקול `View`.

### למה צריך some?

כשלמדנו משתנים, למדנו ש: **ערכים ב-Swift צריכים או annotation מפורש של טיפוס, או שה-compiler צריך להסיק את הטיפוס שלהם אוטומטית.**

לדוגמה:

```swift
let a: Int = 10
```

כאן הקבוע `a` הוא מטיפוס `Int`.

SwiftUI views אינם יוצאי דופן. כשאנחנו משתמשים ב-`body` כדי להציג SwiftUI view, `body` צריך להחזיר את טיפוס ה-SwiftUI המתאים.

לדוגמה, אם אנחנו משתמשים ב-`body` כדי להציג view מסוג `Text`, צריך ש-`body` יחזיר את הטיפוס `Text` המתאים.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

בדוגמה הזו, ה-view שמוצג בתוך `body` הוא `Text`, וגם טיפוס ההחזרה הוא `Text`.

רק כאשר הטיפוס הפנימי מתאים לטיפוס המוצהר, מתקיימת דרישת עקביות הטיפוסים של ה-compiler.

**בעיה של אי התאמת טיפוסים**

אם נגדיר את הטיפוס של `body` כ-`Color`, אבל נציג `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

הטיפוס של `body` והטיפוס של הקוד הפנימי לא מתאימים, ולכן תתרחש שגיאת אי התאמת טיפוסים.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

בשלב הזה צריך לשנות ידנית את טיפוס ההחזרה של `body`.

**טיפוסי view מורכבים**

בפיתוח אמיתי, ממשק בדרך כלל לא מכיל רק `Text` אחד.

אם אנחנו צריכים להציג `VStack` מורכב יותר, נצטרך לכתוב ידנית טיפוס החזרה מורכב.

לדוגמה:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("שלום, עולם!")
    }
}
```

הקוד הזה מחזיר `VStack`, ובתוך ה-`VStack` יש views מטיפוס `Image` ו-`Text`.

טיפוס ההחזרה של `body` הוא:

```swift
VStack<TupleView<(Image,Text)>>
```

אפשר לראות שטיפוס ההחזרה הזה מורכב מאוד, והוא גם מציג את `TupleView`, שלא ראינו קודם.

כאן אפשר להבין את `TupleView` כך: **עטיפה של כמה child views ל-view אחד.**

**טיפוסי view מורכבים עוד יותר**

אם נוסיף modifiers ל-view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("שלום, עולם!")
    }
    .padding()
}
```

אז טיפוס ההחזרה של ה-view הזה נעשה מורכב מאוד ואי אפשר לתאר אותו כאן בפירוט.

טיפוס ההחזרה הקיים `VStack<TupleView<(Image,Text)>>` כבר לא יכול לתאר את ה-modifiers, ולכן תתרחש שגיאה.

**some View מפשט את טיפוס ההחזרה**

למצב הזה SwiftUI מספקת פתרון קצר: להשתמש ב-`some View` כדי לפשט את הקוד.

כאשר משנים את `body` לטיפוס `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("שלום, עולם!")
    }
    .padding()
}
```

כבר אין צורך לכתוב את טיפוס ההחזרה המלא בכל פעם שמשנים את קוד ה-view.

הסיבה היא ש-`some View` פירושו להחזיר view קונקרטי שמציית לפרוטוקול `View`.

במילים אחרות, SwiftUI views כמו `VStack` ו-`Image` כולם מצייתים לפרוטוקול `View`. לאחר הוספת modifiers, גם טיפוס ה-view שמוחזר עדיין מציית לפרוטוקול `View`.

לכן את כולם אפשר להחזיר כ-`some View`.

### some View לא יכול להחזיר כל view בחופשיות

למרות ש-`some View` יכול להסתיר טיפוסים מורכבים, הוא לא "חסר טיפוס".

הכלל המרכזי שלו הוא: **ה-compiler חייב להיות מסוגל לקבוע טיפוס החזרה קונקרטי אחד**.

לדוגמה:

```swift
var title: some View {
    Text("שלום")
}
```

כאן מוחזר view מסוג `Text`.

אבל אם ננסה להחזיר שני views, תתרחש שגיאה:

```swift
var title: some View {
    Text("שלום")
    Image(systemName: "star")
}
```

זאת משום ש-`some View` צריך בסופו של דבר להחזיר מבנה view אחד, אבל כאן אנחנו מנסים להחזיר שני views עצמאיים.

### פתרון

בדרך כלל יש שני פתרונות: container ו-`@ViewBuilder`.

**1. לעטוף עם container**

```swift
var title: some View {
    VStack {
        Text("שלום")
        Image(systemName: "star")
    }
}
```

בקוד הזה, `title` מחזיר `VStack`, ואילו `Text` ו-`Image` הם child views בתוך ה-`VStack`.

מבנה ה-view ש-`some View` מקבל הוא `VStack<...>`, וכך הוא עומד בדרישה ש-`some View` יחזיר מבנה view אחד. 

זאת גם הסיבה שמתחילת לימוד SwiftUI אנחנו ממליצים לעטוף את קוד ה-view ב-container חיצוני מסוג `VStack`.

**2. להשתמש ב-@ViewBuilder**

אפשר גם להוסיף את ה-modifier `@ViewBuilder` לפני `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("שלום")
    Image(systemName: "star")
}
```

`@ViewBuilder` יכול לשלב כמה views לתוצאת החזרה אחת.

במהותו, הוא עדיין ממזג כמה views ל-view אחד, כדי לעמוד בדרישה ש-`some View` יחזיר מבנה view אחד.

### למה body יכול להכיל ישירות כמה views?

אם נכתוב כמה views בתוך `var body`, למשל:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("שלום, עולם!")
}
```

במקרים מסוימים, ה-`body` הזה לא יציג שגיאה.

הסיבה היא ש-`body` בפרוטוקול `View` תומך ב-`@ViewBuilder` כברירת מחדל:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

בקוד המקור של הפרוטוקול `View`, אפשר לראות ש-`@ViewBuilder` כבר משנה את המשתנה `body`.

לכן, בהשוואה ל-`some View` רגיל, ל-`body` יש שכבת טיפול מיוחדת נוספת, כך ש-SwiftUI עוזר לנו אוטומטית לשלב כמה views ל-view אחד.

**להשתמש קודם ב-containers**

כדי להקל על מתחילים להבין, מומלץ להשתמש תחילה ב-containers כמו `VStack`, `HStack`, `ZStack` ו-`Group` כדי לארגן כמה views.

לדוגמה:

```swift
var body: some View {
    VStack {
        Text("שלום")
        Image(systemName: "star")
    }
}
```

כך הקוד אינטואיטיבי יותר: **השכבה החיצונית היא `VStack`, ובתוכה יש שני child views.**

## פיצול views

אם הממשק פשוט, אפשר לכתוב את כל הקוד בתוך `body`.

לדוגמה:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("ברוכים הבאים ל-Qinote")
                Text("בוקר טוב")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("לחץ עליי") {
                print("לחץ עליי ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

סגנון התצוגה של ה-view הזה:

![view](../../Resource/023_view1.png)

הקוד הזה יכול לפעול כרגיל, אבל אם קוד ה-view נעשה מורכב מאוד, הקוד בתוך `body` נעשה ארוך יותר ויותר, וקשה יותר לקרוא ולשנות אותו.

בשלב הזה אפשר לפצל אזורים שונים ל-view properties עצמאיות.

### פיצול ה-view העליון

לדוגמה, נפצל החוצה את האזור העליון:

```swift
var topHome: some View {
    HStack {
        Text("בית")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

כאן `topHome` הוא משתנה שמחזיר view.

מכיוון שהוא מחזיר view, אפשר לכתוב את הטיפוס שלו כך:

```swift
some View
```

זה בעצם אותו שימוש כמו `body`:

```swift
var topHome: some View { }
var body: some View { }
```

שניהם משתמשים במשתנים כדי להציג views, ולשניהם טיפוס החזרה `some View`.

### פיצול views נוספים

לאחר מכן ממשיכים לפצל חלקים נוספים:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("ברוכים הבאים ל-Qinote")
        Text("בוקר טוב")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("לחץ עליי") {
        print("לחץ עליי")
    }
    .buttonStyle(.borderedProminent)
}
```

אחרי הפיצול, אפשר לשים את משתני ה-view בתוך `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("בית")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("ברוכים הבאים ל-Qinote")
            Text("בוקר טוב")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("לחץ עליי") {
            print("לחץ עליי")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

עכשיו `body` אחראי רק לתיאור מבנה העמוד:

```swift
topBar
welcomeText
colorList
clickButton
```

היישום הספציפי של כל חלק נמצא ב-property המתאימה למטה.

דרך הפיצול הזו של views יכולה להפוך את מבנה העמוד לברור יותר. לכל אזור view יש שם משלו, ולכן קל יותר לקרוא את הקוד.

כשמשנים חלק מסוים בקוד, אפשר למצוא ישירות את אזור ה-view המתאים, במקום לחפש בתוך הרבה קוד מורכב.

### some View מחזיר view אחד

ב-view המפוצל הזה, אם ננסה להחזיר כמה views:

```swift
var topBar: some View {
    Text("בית")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

תופיע שגיאה, כי `some View` יכול להחזיר רק מבנה view אחד.

בשונה מ-`body`, ל-computed properties רגילות אין `@ViewBuilder` כברירת מחדל.

לכן, אם אנחנו צריכים להחזיר כמה views, אפשר להשתמש ב-container מסוג `VStack`, `HStack` או `Group` כדי לשלב כמה views לאחד.

```swift
var topBar: some View {
    VStack {
        Text("בית")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

או להוסיף `@ViewBuilder` כדי לשלב views:

```swift
@ViewBuilder
var topBar: some View {
    Text("בית")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

כך אפשר להחזיר כמה views.

### if שמחזיר כמה views

לדוגמה:

```swift
var topHome: some View {
    if step == "בית" {
        HStack {
            Text("בית")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("ריק")
    }
}
```

בקוד הזה, `topHome` מחזיר `HStack` או `Text` לפי התוכן של `step`, ואלה שני טיפוסי view שונים.

מכיוון ש-`some View` דורש טיפוס החזרה קונקרטי אחד מוגדר, שתי הזרועות של `if` ב-computed property רגילה לא יכולות להחזיר ישירות טיפוסי view שונים, ולכן תופיע שגיאה.

**הפתרון הוא עדיין לעטוף אותן ב-container או להשתמש ב-`@ViewBuilder`.**

### למה views מפוצלים לא משתמשים בסוגריים

כשמשתמשים ב-view properties שחילצנו בתוך `body`, כותבים אותן ישירות:

```swift
topBar
welcomeText
colorList
clickButton
```

ולא כך:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

זאת משום ש-`topBar`, `welcomeText`, `colorList` ו-`clickButton` הם משתנים. ליתר דיוק, הם computed properties, לא מתודות.

**Properties לא צריכות סוגריים.**

אם נכתוב זאת כמתודה, אפשר להשיג אפקט דומה:

```swift
func topBar() -> some View {
    HStack {
        Text("בית")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

גם הקוד הזה יכול להשיג אפקט דומה. קריאה למתודה הזו מחזירה view.

כשמשתמשים בה, צריך לכתוב:

```swift
topBar()
```

ב-SwiftUI, אם רק מחלצים view שלא צריך פרמטרים, נפוץ יותר להשתמש ב-computed property.

```swift
var topBar: some View { ... }
```

## Views מקוננים

מלבד פיצול הקוד ל-properties, אפשר גם ליצור מבני view חדשים.

לדוגמה:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

ה-`PinkColorView` הזה, כמו `ContentView`, הוא SwiftUI view עצמאי.

אם צריך להציג אותו בתוך `ContentView`, אפשר להוסיף `()` אחרי שם ה-view.

לדוגמה:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

כאן:

```swift
PinkColorView()
```

פירושו ליצור instance של `PinkColorView`.

מכיוון ש-`PinkColorView` מציית לפרוטוקול `View`, אפשר למקם אותו בתוך views אחרים ולהציג אותו בדיוק כמו `Text`, `Image` ו-`Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

זהו קינון של views: view אחד יכול להיות מוצג בתוך view אחר.

## View property או view חדש?

כאשר קוד ה-view פשוט, בדרך כלל אין צורך לפצל אותו. רק כאשר הקוד נעשה מורכב יותר, מומלץ לפצל views.

### מתי להשתמש ב-view properties

אם זה רק חלק קטן מהתוכן ב-view הנוכחי, אפשר להשתמש ב-view property.

לדוגמה:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

חלקי התוכן האלה בדרך כלל משמשים רק ב-view הנוכחי.

### מתי ליצור view חדש

אם התוכן עצמאי יחסית, או שאולי ישמש מחדש בכמה עמודים בעתיד, מתאים יותר ליצור view חדש.

לדוגמה:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

זהו title view. אם נרצה להשתמש ב-view הזה כרכיב שניתן לשימוש חוזר ב-views אחרים.

אפשר ליצור view חדש:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

ואז להשתמש בו במקום אחר:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

בשלב הזה, ה-view הזה הוא רכיב עצמאי שניתן לשימוש חוזר.

אפשר לסכם זאת בפשטות:

- אזורי תוכן של ה-view הנוכחי יכולים להשתמש ב-`var xxx: some View`
- רכיבים עצמאיים לשימוש חוזר יכולים להיווצר כ-`struct XxxView: View` חדש
- רכיבים שצריכים לקבל נתונים מתאימים בדרך כלל יותר כ-views חדשים.

## סיכום

בשיעור הזה הבנו מחדש את מבנה ה-view הבסיסי והחשוב ביותר ב-SwiftUI.

`ContentView` הוא מבנה. הוא מוגדר באמצעות `struct`, ומשמש לארגון קוד שקשור לעמוד.

`View` הוא פרוטוקול. אם מבנה רוצה להפוך ל-SwiftUI view, הוא צריך לציית לפרוטוקול `View`.

`body` הוא התוכן שהפרוטוקול `View` דורש מאיתנו לספק, והוא קובע מה ה-view הזה מציג.

`some View` פירושו להחזיר view קונקרטי מסוים, בלי צורך לכתוב את הטיפוס המלא והמורכב שלו.

כאשר קוד ה-view מתארך, אפשר להשתמש ב-`var xxx: some View` כדי לפצל את קוד ה-view לכמה אזורים קטנים.

כאשר חלק מהתוכן עצמאי יחסית או צריך שימוש חוזר, אפשר ליצור מבנה view חדש ולהציג אותו ב-views אחרים באמצעות `XxxView()`.

בפשטות, ממשקי SwiftUI מורכבים מ-views שמשולבים יחד. עמוד אחד יכול להכיל כמה views קטנים, ו-view קטן יכול גם להכיל views אחרים.
