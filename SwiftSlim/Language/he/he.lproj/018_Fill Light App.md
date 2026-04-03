# אפליקציית Fill Light

בשיעור הזה נבנה אפליקציית fill light מעניינת מאוד. כשהלילה מגיע, אנחנו יכולים לגרום למסך הטלפון להציג צבעים שונים ולהשתמש בו כתאורת מילוי פשוטה.

אפליקציית fill light הזו יכולה להחליף צבעים על ידי הקשה על המסך, והיא גם יכולה לכוונן את הבהירות בעזרת מחוון.

בדוגמה הזו נלמד איך להשתמש ב-`brightness` כדי לכוונן את בהירות התצוגה, ב-`onTapGesture` כדי להוסיף מחוות הקשה לתצוגה, ובפקד `Slider`.

תוצאה:

![Color](../../Resource/018_color.png)

## הצגת צבע

ראשית, נגרום לתצוגה להציג צבע אחד.

ב-SwiftUI, ‏`Color` לא רק מייצג צבע, אלא גם יכול להיות מוצג כתצוגה:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

כאן, ‏`Color.red` מייצג תצוגה אדומה. ‏`.ignoresSafeArea()` גורם לתצוגת הצבע למלא את כל המסך, כך שזה נראה יותר כמו אפקט אמיתי של fill light.

תוצאה:

![Color](../../Resource/018_color1.png)

### מערך צבעים ואינדקס

כרגע מוצג רק צבע אחד. אבל תאורת מילוי בדרך כלל לא כוללת רק צבע אחד. היא יכולה גם להציג כחול, צהוב, סגול, לבן ועוד צבעים.

אנחנו רוצים לעבור בין צבעים שונים כאשר מקישים על המסך. אפשר לשים את הצבעים האלה במערך כדי לנהל אותם בצורה אחידה:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

מערך מתאים לשמירה של "קבוצת נתונים מאותו סוג". כאן, כל איבר במערך הוא `Color`.

אם אנחנו רוצים להציג צבע מסוים, אפשר להשתמש באינדקס:

```swift
colors[0]
```

זה אומר לקרוא את הצבע שנמצא באינדקס `0` במערך, כלומר הצבע הראשון.

עכשיו אפשר לכתוב את הקוד כך:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

כך המסך יציג את הצבע הראשון במערך, כלומר אדום.

### שימוש באינדקס כדי לשלוט בצבע

אם אנחנו צריכים לעבור בין צבעים שונים, אנחנו צריכים משתנה שינהל את האינדקס במקום לכתוב את האינדקס באופן קבוע.

אפשר להשתמש ב-`@State` כדי להכריז על משתנה ששומר את האינדקס:

```swift
@State private var index = 0
```

כאן, ‏`index` מייצג את האינדקס של הצבע הנוכחי.

כאשר `index` משתנה, ‏SwiftUI מחשב מחדש את הממשק ומעדכן את התוכן שמוצג.

ואז נשנה את `colors[0]` המקורי ל:

```swift
colors[index]
```

כך, הצבע שמוצג בתצוגה ייקבע על ידי `index`.

עכשיו הקוד הופך ל:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

כאשר `index` משתנה, גם `colors[index]` יציג צבע שונה.

לדוגמה:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

חשוב לשים לב ש-`index` לא יכול לחרוג מהאינדקס המקסימלי של המערך, אחרת תתרחש שגיאת אינדקס מחוץ לטווח.

## מחוות הקשה

עכשיו אנחנו יכולים להציג צבעים שונים לפי `index`, אבל עדיין אי אפשר להקיש כדי להחליף צבעים.

בשיעור הקודם של "קרוסלת ציטוטים", השתמשנו ב-`Button` כדי לשלוט בהחלפת הציטוטים.

אבל הפעם, אנחנו רוצים "להקיש על כל אזור הצבע" כדי להחליף צבע, ולכן `onTapGesture` מתאים יותר.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

כאשר אנחנו מקישים על תצוגת הצבע, הקוד הזה יופעל:

```swift
index += 1
```

המשמעות היא להגדיל את `index` ב-`1`. אחרי שהאינדקס גדל, ‏`colors[index]` יציג את הצבע הבא במערך.

### `onTapGesture`

`onTapGesture` הוא modifier של מחווה, שמוסיף פעולת הקשה לתצוגה.

שימוש בסיסי:

```swift
.onTapGesture {
    // code
}
```

לדוגמה:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

כאשר מקישים על התצוגה האדומה הזו, הקוד שבתוך הסוגריים המסולסלים רץ, וזה מופיע במסוף:

```swift
Click color
```

באמצעות `onTapGesture`, אפשר להגדיר מה יקרה אחרי שמקישים על תצוגה.

### ההבדל מ-`Button`

קודם למדנו על התצוגה `Button`. גם `Button` וגם `onTapGesture` יכולים לטפל בפעולות הקשה, אבל תרחישי השימוש שלהם אינם זהים לגמרי.

`onTapGesture` מתאים יותר ל"הוספת אפשרות הקשה לתצוגה קיימת", כמו `Color`, ‏`Image`, ‏`Text`, או תצוגה רגילה אחרת.

לעומת זאת, `Button` מתאים יותר כאשר רוצים לייצג כפתור ברור, כמו "אישור", "שליחה" או "מחיקה".

באפליקציית fill light הזו, אנחנו רוצים שפונקציית החלפת הצבע תהיה פשוטה יותר. הקשה על כל אזור הצבע מחליפה את הצבע, ולכן `onTapGesture` הוא בחירה טובה כאן.

## בעיית האינדקס

עכשיו אנחנו יכולים להקיש על המסך ולעבור בין צבעים שונים.

אבל יש כאן בעיה חשובה: **האינדקס עלול לחרוג מגבולות המערך**.

לדוגמה:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

אם נמשיך להקיש על המסך, ‏`index` יהפוך בסוף ל-`4`, ואז תתרחש שגיאת "index out of range".

הסיבה לכך היא שלמערך `colors` יש `4` איברים, אבל האינדקסים מתחילים מ-`0`, ולכן טווח האינדקסים החוקי הוא `0 - 3`, ולא `4`.

אם ניגש אל `colors[4]`, תתרחש שגיאת "index out of range".

בקוד הנוכחי, כל הקשה מגדילה את `index` ב-`1`. אם לא נטפל בזה, בסוף הוא בוודאות יחרוג מהטווח.

לכן, כשמקישים על המסך, אנחנו צריכים לבדוק את האינדקס: אם זה כבר הצבע האחרון, נחזור לצבע הראשון; אחרת נמשיך להוסיף `1`.

אפשר לעשות זאת בעזרת משפט `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

בקוד הזה, ‏`colors.count` מייצג את מספר האיברים במערך.

במערך הנוכחי יש 4 צבעים, לכן:

```swift
colors.count // 4
```

אבל האינדקס המקסימלי הוא לא `4`, אלא `3`, כי הספירה מתחילה מ-`0`.

לכן, האינדקס האחרון צריך להיכתב כך:

```swift
colors.count - 1
```

כלומר:

```swift
4 - 1 = 3
```

הלוגיקה הזו אומרת: אם האינדקס הנוכחי כבר מתאים לצבע האחרון, אפס את האינדקס ל-`0`; אחרת, הגדל אותו ב-`1`.

כך הצבעים יכולים להחליף את עצמם בלולאה.

### שיפור לוגיקת האינדקס

אם אנחנו רוצים להפוך את הקוד לקצר יותר, אפשר גם להשתמש באופרטור תנאי:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

הקוד הזה אומר: אם `index == colors.count - 1` נכון, החזר `0`. אחרת, החזר `index + 1`.

לבסוף, משייכים את התוצאה בחזרה ל-`index`.

עכשיו אפשר להשיג את אפקט החלפת הצבעים.

קוד מלא:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

עכשיו אנחנו יכולים להקיש על המסך ולעבור בין צבעים שונים. אפליקציית fill light בסיסית הושלמה.

## הצגת שם הצבע

אנחנו יכולים להוסיף קבוצה נוספת של טקסטים שמתאימה לצבעים, כך שכאשר הצבע מתחלף, גם שם הצבע הנוכחי יוצג על המסך.

לדוגמה:

- אדום מציג `Red`
- כחול מציג `Blue`
- צהוב מציג `Yellow`
- סגול מציג `Purple`

גם כאן אפשר להשתמש במערך כדי לשמור את שמות הצבעים:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

סדר הטקסטים במערך הזה צריך להתאים בדיוק לסדר הצבעים במערך הצבעים.

אחר כך נוכל להשתמש ב-`Text` כדי להציג את שם הצבע של האינדקס הנוכחי:

```swift
Text(colorsName[index])
```

`Text` מציג את שם הצבע הנוכחי לפי `index`.

נשתמש ב-modifiers כדי לשפר את המראה של `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

כך `Text` יוצג בלבן, בגודל כותרת ובמשקל כתב מודגש.

עכשיו יש לנו תצוגת `Color` במסך מלא. אם אנחנו רוצים ש-`Text` יופיע מעל תצוגת `Color`, צריך להשתמש במכלול הפריסה `ZStack` כדי לשים אותם בשכבות.

```swift
ZStack {
    Color
    Text
}
```

לכן הקוד הופך ל:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

כך הרקע הוא תצוגת הצבע, ומעליה מונחת תצוגת טקסט.

תוצאה:

![Color](../../Resource/018_color2.png)

חשוב לשים לב שב-`ZStack`, תצוגות שנכתבות מאוחר יותר מופיעות בדרך כלל מלפנים. אם `Text` נכתב לפני `Color`, תצוגת `Color` שנכתבת אחר כך עלולה לכסות את `Text`.

## שליטה בבהירות

עכשיו אנחנו יכולים להחליף בין צבעים שונים, אבל ל-fill light יש עוד תכונה חשובה: **כוונון בהירות**.

ב-SwiftUI אפשר להשתמש ב-modifier בשם `brightness` כדי לכוונן את הבהירות של תצוגה.

לדוגמה:

```swift
.brightness(1)
```

אפשר לכתוב:

```swift
colors[index]
    .brightness(0.5)
```

זה הופך את הצבע הנוכחי לבהיר יותר, וקרוב יותר לאפקט של fill light.

טווח הבהירות הוא `0 - 1`. ‏`0` אומר לשמור על הצבע המקורי, וככל שהערך קרוב יותר ל-`1`, כך הצבע נעשה בהיר יותר. ‏`1` מייצג את התוצאה הלבנה הבהירה ביותר.

למרות שאפשר לשלוט ב-`brightness` בתוך הקוד, המשתמש עדיין לא יכול לכוונן אותו ישירות בעצמו.

לכן, צריך להוסיף פקד שניתן לגרור: `Slider`.

## תצוגת `Slider`

ב-SwiftUI, ‏`Slider` הוא פקד שמשמש לבחירת ערך בתוך טווח. Apple מתארת אותו כ"פקד לבחירת ערך מתוך טווח ליניארי תחום".

שימוש בסיסי:

```swift
Slider(value: $value, in: 0...1)
```

הסבר הפרמטרים:

1. `value: $value`: ‏`Slider` צריך להיות מקושר למשתנה.

    כאשר גוררים את המחוון, ערך המשתנה משתנה בו-זמנית. ולהפך, אם המשתנה משתנה, גם המחוון מתעדכן.

    זה דומה מאוד ל-`TextField` שלמדנו קודם. שניהם "מקשרים פקד למשתנה".

    משתנה מקושר צריך את הסימן `$` לפניו כדי לייצג binding.

2. `in: 0...1`: הפרמטר הזה מייצג את טווח הערכים של המחוון.

    כאן, ‏`0...1` אומר שהערך המינימלי הוא `0` והערך המקסימלי הוא `1`.

    כאשר גוררים את המחוון עד שמאלה, המשתנה המקושר קרוב ל-`0`; כאשר גוררים אותו עד ימינה, הוא קרוב ל-`1`.

לדוגמה:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` מקושר למשתנה `value`. כאשר גוררים את המחוון, גם הערך של `value` משתנה בו-זמנית.

מראה:

![Slider](../../Resource/018_slider.png)

כאשר מזיזים את `Slider` שמאלה, הערך המקושר `value` הופך ל-`0`. כאשר מזיזים אותו ימינה, הוא הופך ל-`1`.

### טווח ערכים

טווח הערכים של `Slider` אינו קבוע. אפשר גם לכתוב אותו כך:

```swift
0...100
```

או כטווח אחר.

אבל באפליקציית fill light הזו אנחנו צריכים לשלוט בבהירות, ולכן `0...1` הוא הבחירה המתאימה ביותר.

## שימוש ב-`Slider` כדי לשלוט בבהירות

עכשיו אנחנו צריכים לחבר בין `Slider` לבין `brightness`.

ראשית, יוצרים משתנה לשמירת ערך הבהירות:

```swift
@State private var slider = 0.0
```

כאן, ‏`0.0` הוא ערך מסוג `Double`.

מכיוון ש-`Slider` בדרך כלל מקושר לסוג מספרי, וכאן אנחנו רוצים שהוא ישתנה ברצף, ‏`Double` מתאים יותר. בנוסף, ‏`brightness` יכול לקבל רק ערך מסוג `Double`.

אחר כך מעבירים את הערך הזה אל `brightness`:

```swift
colors[index]
    .brightness(slider)
```

כאשר `slider == 0`, הצבע נשאר במצב ברירת המחדל שלו. ככל ש-`slider` קרוב יותר ל-`1`, כך הצבע נראה בהיר יותר.

### הוספת הפקד `Slider`

לאחר מכן, נוסיף פקד `Slider` כדי לשנות את המשתנה הזה:

```swift
Slider(value: $slider, in: 0...1)
```

כאשר המחוון משתנה, גם הערך של `slider` משתנה, ו-`brightness(slider)` מעדכן את הבהירות באותו הזמן.

זוהי דוגמה טיפוסית מאוד לרעיון ש"המשתנים מניעים את התצוגה" ב-SwiftUI.

### התאמת המראה של `Slider`

כברירת מחדל, ‏`Slider` משתמש ברוחב הזמין.

אנחנו יכולים לתת לו רוחב קבוע:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

לאחר מכן נוסיף עוד כמה modifiers כדי שיהיה קל יותר לראות אותו:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

זה נותן למחוון רקע לבן ופינות מעוגלות, כך שהוא בולט יותר מעל תצוגת `Color`.

לבסוף, נמקם אותו בתחתית המסך.

מכיוון שכבר השתמשנו ב-`ZStack`, אפשר לשים בתוכו `VStack` ולהשתמש ב-`Spacer()` כדי לדחוף את `Slider` כלפי מטה.

## קוד מלא

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

תוצאה:

![Color](../../Resource/018_color.png)

## סיכום

באמצעות הידע שלמדנו קודם, יחד עם מושגים בסיסיים כמו צבעים ומערכים, בנינו אפליקציית fill light מעניינת מאוד.

דרך האפליקציה הזו, למדנו להשתמש ב-`brightness` כדי לכוונן בהירות, ב-`onTapGesture` כדי להוסיף פעולות הקשה לתצוגות, ובפקד `Slider`.

הוספנו `onTapGesture` לתצוגת `Color` כדי להחליף צבעים. השתמשנו גם בפקד `Slider` כדי לשנות משתנה שמנהל את `brightness`, וזהו עוד דוגמה לכך ש"המשתנים מניעים את התצוגה".

גם חזרנו על האופרטור התנאי, השתמשנו ב-`ZStack` כדי להניח תצוגות בשכבות, והשתמשנו במערכים כדי לנהל קבוצת נתונים מאותו סוג. זה עוזר להעמיק את ההבנה שלנו במערכים ובאינדקסים, כולל הבעיה המעשית של הימנעות משגיאות אינדקס מחוץ לטווח.

למרות שהדוגמה הזו אינה מורכבת, היא מחברת הרבה מהרעיונות הבסיסיים שלמדנו קודם. כאשר משלבים אותם בפרויקט קטן אמיתי, קל יותר להבין למה כל מושג משמש.

### תרחיש שימוש אמיתי

דמיינו שאתם מניחים iPhone ישן על השולחן ומשתמשים באפליקציית fill light שפיתחתם בעצמכם כדי לשלוט בצבע האור. זו תהיה חוויה טובה מאוד.

יש הרבה אפליקציות "fill light" ב-App Store, וגם הן לא נראות מורכבות במיוחד.

![AppStore](../../Resource/018_appStore.PNG)

אנחנו יכולים להתחיל מפיתוח של אפליקציות פשוטות ולנסות לפרסם אותן ב-App Store. זה לא רק מגדיל את העניין שלנו בפיתוח, אלא גם מתעד את תהליך הצמיחה שלנו.

### תרגול אחרי השיעור

אתם יכולים להמשיך לחשוב על דרכים להרחיב את אפליקציית fill light הזו, למשל:

- להוסיף עוד צבעים
- להציג את ערך הבהירות הנוכחי
- לשפר את העיצוב של אזור המחוון התחתון

כשתתחילו באמת להשתמש בידע הזה, תגלו שכל מושג שאנחנו לומדים הוא בעצם כלי ליצירת אפליקציות.

ככל שנשלוט ביותר כלים, נוכל ליצור יותר יכולות.
