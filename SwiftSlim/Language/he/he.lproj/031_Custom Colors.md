# צבעים מותאמים אישית

בשיעור זה נלמד כיצד להתאים צבעים ב-SwiftUI.

בשיעורים הקודמים כבר השתמשנו בצבעי ברירת המחדל ש-SwiftUI מספקת, למשל:

```swift
Color.blue
Color.red
Color.green
```

הצבעים האלה נוחים לשימוש, אך בפיתוח App אמיתי צבעי ברירת המחדל בדרך כלל אינם מדויקים מספיק.

לדוגמה, בעיצוב עשויים להופיע צבעים כאלה:

```text
#2c54c2
#4875ed
#213e8d
```

סוג כזה של צבע נקרא צבע Hex.

בשיעור זה קודם נגרום ל-SwiftUI לתמוך בצבעי Hex, ולאחר מכן נשתמש ב-`static` כדי לארגן צבעים נפוצים.

לבסוף, נחיל את הצבעים המותאמים אישית על תצוגת אנציקלופדיית החיות, ונשתמש גם ברקע מעבר צבע כדי לגרום לכפתורים להיראות בעלי שכבות רבות יותר.

## למה צריך צבעים מותאמים אישית?

ב-SwiftUI אפשר להשתמש ישירות בצבעי מערכת.

לדוגמה:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

כאן, `.blue` מציין כחול. למעשה, זו כתיבה מקוצרת של `Color.blue`.

היתרון של צבעי ברירת המחדל הוא שהם פשוטים ונוחים, אך מבחר הצבעים מוגבל יחסית.

לדוגמה:

```swift
Color.blue
```

הוא יכול לייצג רק את הכחול המוגדר כברירת מחדל ש-SwiftUI מספקת.

![Color.blue](../../../Resource/031_color6.png)

אבל בפיתוח בפועל, לעיתים קרובות אנו צריכים צבעים ספציפיים יותר.

לדוגמה, גם אם כולם כחולים, יכולים להיות אפקטים שונים כמו כחול בהיר, כחול כהה, כחול אפרפר וכחול בוהק.

![More Blue](../../../Resource/031_color5.png)

במצב כזה, אם משתמשים רק ב-`Color.blue`, קשה לשחזר את אפקט העיצוב.

לכן, עלינו לגרום ל-SwiftUI לתמוך בצבעים מותאמים אישית.

## מהו צבע Hex?

צבעים במסך מורכבים בדרך כלל משלושה ערוצים: אדום, ירוק וכחול. זהו RGB.

RGB מייצג:

```text
Red     // אדום
Green   // ירוק
Blue    // כחול
```

צבע Hex הוא אחת הדרכים לייצג צבע RGB.

לדוגמה:

```swift
#5479FF
```

אפשר להבין את ערך הצבע הזה בפשטות כשלושה חלקים:

```text
54  // מייצג את ערוץ האדום
79  // מייצג את ערוץ הירוק
FF  // מייצג את ערוץ הכחול
```

בשיעור זה איננו צריכים לחשב את הערכים האלה, וגם לא להבין לעומק את כללי השיטה ההקסדצימלית.

בשלב זה מספיק לדעת ש-`#5479FF` מייצג צבע מסוים.

בעתיד, כאשר נראה כתיבה כמו `#2c54c2` או `#4875ed`, נוכל קודם להבין אותה כערך צבע.

גם בכלי עיצוב כמו Sketch,‏ Figma ו-Photoshop אפשר לראות לעיתים קרובות ערכי צבע דומים.

![color](../../../Resource/031_color.png)

אבל כברירת מחדל, SwiftUI אינה מאפשרת לכתוב כך ישירות:

```swift
Color(hex: "#5479FF")
```

לכן, עלינו להרחיב בעצמנו את הטיפוס `Color`, כדי שיתמוך ביצירת צבעים ממחרוזות Hex.

## יצירת הקובץ Color+Hex.swift

ראשית, ניצור קובץ Swift חדש.

אפשר לקרוא לקובץ:

```text
Color.swift
```

ואפשר גם לכתוב שם ברור יותר:

```text
Color+Hex.swift
```

כאן מומלץ יותר להשתמש בשם:

```text
Color+Hex.swift
```

בפרויקטים של Swift, שמות קבצים כמו `Color+Hex.swift` נפוצים מאוד.

המשמעות היא שזהו קובץ הרחבה שמוסיף ל-`Color` יכולת Hex.

שם הקובץ אינו משפיע ישירות על הרצת הקוד. הוא רק עוזר לנו להבין בקלות רבה יותר את מטרת הקובץ.

## הוספת קוד Color(hex:)

בקובץ `Color+Hex.swift`, כתבו את הקוד הבא:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

קוד זה משתמש ב-`extension` כדי להרחיב את הטיפוס `Color`, ומוסיף ל-`Color` שיטת אתחול חדשה:

```swift
init(hex: String)
```

לאחר שיש לנו את שיטת האתחול הזו, אפשר להעביר מחרוזת Hex אל `Color`, וכך ליצור צבע מותאם אישית:

```swift
Color(hex: "#5479FF")
```

בתוך קוד ההרחבה הזה, מחרוזת ה-Hex מומרת לצבע RGB ש-SwiftUI יכולה לזהות.

בשלב הנוכחי אין צורך להבין לעומק את לוגיקת ההמרה בכל שורה. צריך רק לדעת שהשיטה `Color(hex:)` שנוספה מאפשרת לנו ליצור צבעים מותאמים אישית מערכי צבע Hex.

## שימוש בצבעים מותאמים אישית

כעת אפשר לבדוק צבעים מותאמים אישית בתוך `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

אפקט התצוגה:

![color](../../../Resource/031_color1.png)

בדוגמה זו, השורה הראשונה משתמשת בצבע מערכת:

```swift
.foregroundStyle(Color.blue)
```

שלוש השורות שלאחר מכן משתמשות בצבעי Hex מותאמים אישית:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

באמצעות השוואה אפשר לראות שלכחול של המערכת יש רק אפקט ברירת מחדל אחד.

לעומת זאת, צבעי Hex יכולים לייצג שינויי כחול מדויקים ומפורטים יותר.

זו החשיבות של צבעים מותאמים אישית: הם מאפשרים לצבעי הממשק להיות קרובים יותר לעיצוב האמיתי, וגם מקלים עלינו לשלוט בסגנון החזותי של App.

## שימוש ב-static לארגון צבעים

כעת כבר אפשר ליצור צבעים באמצעות מחרוזות Hex:

```swift
Color(hex: "#2c54c2")
```

כתיבה כזו עובדת היטב, אך אם אותו צבע מופיע שוב ושוב בכמה מקומות, התחזוקה בהמשך תהיה פחות נוחה.

אם ערך הצבע הזה נכתב ב-10 מקומות שונים, אז בעתיד, כאשר נרצה לשנות את הכחול הזה, נצטרך לשנות אותו אחד אחד.

במצב כזה אפשר להשתמש ב-`static` כדי לארגן צבעים נפוצים במקום אחד.

בתחתית הקובץ `Color+Hex.swift`, המשיכו להוסיף את הקוד הבא:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

כאן הוספנו ל-`Color` שלושה מאפיינים סטטיים: `animalBlue`,‏ `animalLightBlue` ו-`animalDarkBlue`. הם מייצגים גוונים שונים של כחול.

מכיוון שהמאפיינים האלה משתמשים ב-`static`, הם שייכים לטיפוס `Color` עצמו.

בעת השימוש, אפשר לגשת אליהם ישירות דרך `Color.`:

```swift
Color.animalBlue
```

כתיבה זו ברורה יותר מאשר כתיבה ישירה של מחרוזת Hex.

כאשר אנו רואים `Color.animalBlue`, אפשר לדעת שהוא מייצג את הכחול המשמש באנציקלופדיית החיות.

אבל כאשר אנו רואים `Color(hex: "#2c54c2")`, אפשר לדעת רק שזהו ערך צבע, וקשה להבין את המטרה הספציפית שלו.

לניהול צבעים במקום אחד יש יתרון נוסף: קל יותר לבצע שינויים בהמשך.

אם נרצה להתאים את הצבע הראשי של אנציקלופדיית החיות, צריך לשנות רק את מקום ההגדרה:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

כל המקומות שמשתמשים בצבע הזה יתעדכנו יחד.

זו המשמעות של שימוש ב-`static` לארגון צבעים: שמות הצבעים ברורים יותר, וגם התחזוקה בהמשך נוחה יותר.

## החלה על אנציקלופדיית החיות

כעת אפשר להחיל את הצבעים המותאמים אישית על תצוגת אנציקלופדיית החיות הקודמת.

בעבר, הרקע של כפתור החיה היה לבן:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

כעת אפשר לשנות אותו לצבע מותאם אישית:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

כאן, `Color.animalBlue` הוא הצבע הסטטי שהגדרנו קודם ב-`Color+Hex.swift`.

טקסט הכפתור משתמש בלבן:

```swift
.foregroundStyle(Color.white)
```

הרקע של ה-emoji של החיה משתמש בלבן שקוף למחצה:

```swift
.background(Color.white.opacity(0.15))
```

כך הכפתור יוצר סגנון חזותי כחול ואחיד.

המוקד של שלב זה אינו הוספת קוד מורכב, אלא יישום אמיתי של הצבעים המותאמים אישית שלמדנו קודם בתוך הממשק.

## שימוש ברקע מעבר צבע

מלבד שימוש בצבע יחיד, אפשר גם לשלב כמה צבעים לאפקט מעבר צבע.

לדוגמה, קודם הגדרנו את הצבעים האלה:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

את הצבעים האלה אפשר להשתמש לא רק בנפרד, אלא גם לשלב כרקע מעבר צבע.

ב-SwiftUI אפשר להשתמש ב-`LinearGradient` כדי ליצור מעבר צבע ליניארי.

לדוגמה:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

קוד זה יוצר רקע מעבר צבע משמאל לימין, שבו הצבע עובר בהדרגה מ-`Color.animalBlue` אל `Color.animalLightBlue`.

כאן, `colors` משמש להגדרת הצבעים המשתתפים במעבר, ו-`startPoint` ו-`endPoint` משמשים לשליטה בכיוון המעבר.

### בדיקת אפקט מעבר הצבע

אפשר להשתמש ב-Text פשוט כדי לבדוק את רקע מעבר הצבע.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

אפקט התצוגה:

![color](../../../Resource/031_color3.png)

בדוגמה זו, הרקע של `Text` כבר אינו צבע יחיד, אלא צבע מעבר שמשתנה בהדרגה משמאל לימין.

בהשוואה לרקע רגיל, רקע מעבר צבע יוצר יותר שכבתיות, וגם קל יותר ליצור באמצעותו נקודת מוקד חזותית בממשק.

## שימוש ברקע מעבר צבע באנציקלופדיית החיות

כעת אפשר לשנות את צבע הרקע של כפתור החיה:

```swift
.background(Color.animalBlue)
```

לרקע מעבר צבע:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

הקוד המלא הוא כדלקמן:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

אפקט התצוגה:

![color](../../../Resource/031_color4.png)

כעת כפתור החיה כבר אינו רק צבע רקע יחיד, אלא יש לו אפקט מעבר צבע משמאל לימין.

בהשוואה לרקע בצבע יחיד, רקע מעבר צבע יכול לגרום לממשק להיראות בעל שכבות רבות יותר, וגם קרוב יותר לעיצוב חזותי של App אמיתי.

## ההבדל בין רקע בצבע יחיד לרקע מעבר צבע

רקע בצבע יחיד משתמש רק בצבע אחד.

לדוגמה:

```swift
.background(Color.animalBlue)
```

כתיבה זו פשוטה וברורה, ומתאימה לרוב הממשקים הבסיסיים.

רקע מעבר צבע משתמש בכמה צבעים.

לדוגמה:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

כתיבה זו יכולה לגרום לממשק להיות בעל שכבות רבות יותר, אך גם עלולה להגדיל את המורכבות החזותית.

לכן, בפיתוח בפועל אפשר להבין זאת כך:

רקע בצבע יחיד מתאים לטקסט רגיל, כפתורים רגילים, כרטיסים רגילים ורקעי עמוד רגילים.

רקע מעבר צבע מתאים לכפתורים מרכזיים, אזורים עליונים, כרטיסי שער, כניסות לפונקציות ומקומות אחרים שצריך להדגיש.

## סיכום

בשיעור זה למדנו כיצד להשתמש בצבעים מותאמים אישית ב-SwiftUI.

ראשית, הכרנו צבעי Hex.

לדוגמה:

```text
#2c54c2
```

הוא מייצג צבע מסוים.

לאחר מכן השתמשנו ב-`extension Color` כדי להרחיב את הטיפוס `Color`.

כך SwiftUI יכולה ליצור צבעים בדרך הבאה:

```swift
Color(hex: "#2c54c2")
```

לאחר מכן השתמשנו ב-`static` כדי לארגן צבעים נפוצים:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

כך אפשר להשתמש בו ישירות בתצוגות אחרות:

```swift
Color.animalBlue
```

בהשוואה לכתיבת מחרוזות Hex בכל פעם, גישה זו ברורה יותר, וגם נוחה יותר לשינוי אחיד של צבעים בהמשך.

לבסוף, למדנו את `LinearGradient`, ושילבנו צבעים מותאמים אישית לרקע מעבר צבע:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

באמצעות שיעור זה השלמנו את התהליך מ"יצירת צבעים מותאמים אישית" ועד "שימוש בצבעים בממשק אמיתי".

בעתיד, כאשר צבע צריך להופיע שוב ושוב בכמה מקומות, אפשר קודם לשקול לארגן אותו בתוך הרחבת `Color`.

כך הקוד יהיה ברור יותר, וגם סגנון הממשק יהיה קל יותר לאיחוד.
