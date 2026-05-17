# ארגון נתוני בעלי חיים

בשיעור הקודם השלמנו דוגמה פשוטה של אנציקלופדיית בעלי חיים.

![view](../../../Resource/029_view.png)

כאשר המשתמש מקיש על בעל חיים מסוים, העמוד מציג את פרטי בעל החיים באמצעות `Sheet`.

עם זאת, בקוד של השיעור הקודם יש בעיה אחת: נתוני בעלי החיים נכתבו ישירות בתוך `ContentView`.

לדוגמה:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // הצגת רשימת בעלי החיים
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

הקוד הזה יכול לפעול כרגיל, אבל כאשר נתוני בעלי החיים הולכים ומתרבים, `ContentView` יהפוך לארוך מאוד.

`ContentView` אמור בעיקר להיות אחראי להצגת הממשק, אבל עכשיו הוא גם שומר כמות גדולה של נתוני בעלי חיים. הדבר פוגע בקריאות הקוד וגם מקשה על תחזוקה בהמשך.

לכן, בשיעור הזה נעשה דבר אחד:

נוציא את נתוני בעלי החיים מתוך `ContentView`.

## למה להפריד את הנתונים?

ב-SwiftUI, קוד התצוגה בדרך כלל אחראי להצגת הממשק.

לדוגמה:

```swift
Text("דולפין")
Image("dolphin")
```

קטעי הקוד האלה קשורים כולם להצגת הממשק.

אבל נתוני בעלי החיים עצמם, כמו שם בעל החיים, שם התמונה, אזור התפוצה, בית הגידול וטקסט התיאור, אינם מבנה הממשק.

הם דומים יותר לקבוצה של מידע קבוע:

```swift
Animal(
    name: "דולפין",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
    habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
    animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
),
// ...
```

אם כותבים את קוד הממשק ואת קוד הנתונים יחד, הקוד יהפוך בהדרגה למבולגן יותר ויותר.

לכן, אפשר לשים את נתוני בעלי החיים בתוך הטיפוס `Animal`.

## שימוש ב-static לשמירת נתונים קבועים

קודם נראה את צורת הכתיבה לאחר הארגון:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
        ),
        // ...
    ]
}
```

כאן נוספה שורת קוד אחת:

```swift
static let animals: [Animal] = [
    
]
```

`static` מציין מאפיין סטטי.

מאפיין סטטי שייך לטיפוס עצמו, ולא למופע מסוים.

המשפט הזה מעט מופשט, ולכן אפשר להבין אותו באמצעות דוגמה פשוטה.

## מאפיינים רגילים ומאפיינים סטטיים

לדוגמה, נגדיר `Student`:

```swift
struct Student {
    let name: String
}
```

כאן `name` הוא מאפיין רגיל. מאפיין רגיל שייך למופע מסוים.

אם נרצה לגשת ל-`name`, עלינו קודם ליצור תלמיד מסוים:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

כאן `student` הוא מופע. בשלב הזה אפשר להבין אותו כנתון תלמיד מסוים.

מכיוון שלכל תלמיד יכול להיות שם שונה, `name` חייב להיות שייך לתלמיד מסוים.

אבל יש נתונים שאינם שייכים למופע מסוים.

לדוגמה, נרצה להכין קבוצה של נתוני דוגמה לתצוגות מקדימות:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

כאן לפני `previewStudents` מופיע `static`, ולכן זהו מאפיין סטטי.

מאפיין סטטי אינו שייך לתלמיד מסוים, אלא שייך לטיפוס `Student` עצמו.

לכן אין צורך ליצור קודם תלמיד מסוים, ואפשר לגשת אליו ישירות דרך שם הטיפוס:

```swift
print(Student.previewStudents.count)    // 3
```

צורת הגישה כאן היא:

```swift
שם_טיפוס.שם_מאפיין_סטטי
```

כלומר:

```swift
Student.previewStudents
```

באותו אופן, באנציקלופדיית בעלי החיים אפשר לגשת לנתוני בעלי החיים כך:

```swift
Animal.animals
```

## חוזרים אל ContentView

עכשיו נתוני בעלי החיים כבר נשמרו בתוך הטיפוס `Animal`.

לכן כבר אין צורך לכתוב מערך בעלי חיים ארוך מאוד בתוך `ContentView`.

אפשר לשנות זאת ל:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // הצגת רשימת בעלי החיים
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

שורת הקוד הזו פירושה:

```swift
let animals = Animal.animals
```

לקחת מתוך הטיפוס `Animal` את קבוצת נתוני בעלי החיים `animals`, ואז לשמור אותה בקבוע `animals` של התצוגה הנוכחית.

אחרי כתיבה כזו, `ContentView` יהיה תמציתי יותר.

`ContentView` אחראי להצגת הממשק, ו-`Animal.animals` אחראי לספק את נתוני בעלי החיים.

## העברת Animal לקובץ נפרד

בשיעור הקודם, כדי להפוך את הדוגמה לקלה יותר להבנה, כתבנו את `Animal` ואת `ContentView` באותו קובץ.

מכיוון שבאותו שלב הקוד עדיין היה קצר יחסית, לא הייתה בכך בעיה.

אבל עכשיו נתוני בעלי החיים הולכים ומתרבים. אם נמשיך לכתוב את כל הקוד בתוך `ContentView.swift`, הקובץ יהפוך לארוך מאוד וגם יהיה פחות נוח לקריאה.

לכן אפשר לשים את `Animal` בקובץ Swift חדש ונפרד.

ב-Xcode אפשר ליצור קובץ Swift חדש, למשל:

```swift
Animal.swift
```

לאחר מכן מעבירים את המבנה `Animal` אל הקובץ הזה:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
        ),
        // ...
    ]
}
```

אחרי הארגון הזה:

`ContentView.swift` אחראי להצגת הממשק.

`Animal.swift` אחראי לתאר את המבנה של נתוני בעלי החיים.

אף שהם נמצאים בקבצים שונים, כל עוד הם נמצאים באותו פרויקט, `ContentView` עדיין יכול להשתמש ישירות ב-`Animal`.

לדוגמה:

```swift
let animals = Animal.animals
```

כאן אין צורך לייבא בנוסף את `Animal.swift` בתוך `ContentView.swift`.

Swift מזהה באופן אוטומטי את קובצי Swift שנמצאים באותו פרויקט.

## שימוש ב-extension להמשך ארגון הקוד

עכשיו כבר העברנו את נתוני בעלי החיים מתוך `ContentView` אל `Animal`.

עם זאת, המבנה `Animal` עדיין כולל בו-זמנית שני סוגי קוד:

הסוג הראשון הוא המאפיינים של מודל בעל החיים עצמו:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

הסוג השני הוא נתוני בעלי חיים קבועים:

```swift
static let animals: [Animal] = [
    // ...
]
```

כדי להפוך את מבנה הקוד לברור יותר, אפשר להשתמש ב-`extension` כדי להפריד בין שני החלקים האלה.

המשמעות של `extension` היא הרחבה.

היא יכולה להוסיף קוד חדש על בסיס טיפוס קיים.

לדוגמה:

```swift
extension Animal {
    
}
```

זה אומר שאנחנו מרחיבים את הטיפוס `Animal`.

## שמירת נתוני בעלי החיים בתוך extension

אפשר לשנות את `Animal` כך:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
        ),
        // ...
    ]
}
```

אחרי הארגון הזה, מבנה הקוד יהיה ברור יותר.

`struct Animal` אחראי לתאר אילו מאפיינים צריכים להיות לבעל חיים.

`extension Animal` אחראי לשמור קבוצה של נתוני בעלי חיים קבועים.

שימו לב: אף שהעברנו את `animals` אל `extension Animal`, דרך השימוש בו אינה משתנה.

עדיין אפשר להשתמש בו כך:

```swift
let animals = Animal.animals
```

זהו גם מאפיין של `extension`: הוא רק עוזר לנו לארגן קוד, ואינו משנה את דרך הקריאה החיצונית.

## כאשר יש הרבה נתונים, אפשר ליצור קובץ AnimalData נוסף

עכשיו כבר העברנו את `Animal` לקובץ נפרד בשם `Animal.swift`.

אם אין הרבה נתוני בעלי חיים, אפשר לכתוב את `extension Animal` ישירות בתוך `Animal.swift`.

אבל אם נתוני בעלי החיים הולכים ומתרבים, אפשר גם ליצור קובץ נוסף, למשל:

```swift
AnimalData.swift
```

ואז לשים בו את נתוני בעלי החיים הקבועים:

```swift
extension Animal {
    static let animals: [Animal] = [
        // נתוני בעלי חיים
    ]
}
```

אחרי שעושים זאת, חלוקת האחריות בקוד תהיה ברורה יותר:

`Animal.swift` אחראי רק להגדרת מודל בעל החיים.

`AnimalData.swift` אחראי רק לשמירת נתוני בעלי החיים.

`ContentView.swift` אחראי רק להצגת הממשק.

האחריות של כל קובץ ברורה יותר.

שימו לב: `AnimalData.swift` הוא רק שם הקובץ, ולא טיפוס Swift חדש. בתוך הקובץ הזה אנחנו עדיין משתמשים ב-`extension Animal` כדי להוסיף ל-`Animal` נתונים קבועים.

## קוד מלא

להלן הקוד המסודר של `Animal.swift`:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

הקוד המסודר של `AnimalData.swift`:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מים חופיים וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים באמצעות צלילים, וידועים בהתנהגותם המשחקית."
        ),
        Animal(
            name: "ג'ירפה",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "סוואנות וחורשים פתוחים באפריקה.",
            habitat: "שטחי עשב, סוואנות ויערות פתוחים.",
            animalDescription: "ג'ירפות הן בעלי החיים היבשתיים הגבוהים ביותר. יש להן צוואר ארוך, רגליים ארוכות, ובדרך כלל הן ניזונות מעלים של עצים גבוהים."
        ),
        Animal(
            name: "אריה",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "נמצא בעיקר באפריקה שמדרום לסהרה, עם אוכלוסייה קטנה במערב הודו.",
            habitat: "שטחי עשב, סוואנות וחורשים פתוחים.",
            animalDescription: "אריות הם חתולים גדולים וחזקים. הם בדרך כלל חיים בקבוצות הנקראות להקות, ולעיתים קרובות מוכרים כמלכי עולם בעלי החיים."
        ),
        Animal(
            name: "פנדה",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "יערות הרריים במרכז סין.",
            habitat: "יערות במבוק באזורים הרריים קרירים ולחים.",
            animalDescription: "פנדות הן דובים הידועים בפרוותן השחורה-לבנה. הן אוכלות בעיקר במבוק, והן אחד מבעלי החיים המזוהים ביותר בעולם."
        ),
        Animal(
            name: "דוב קוטב",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "אזורים ארקטיים סביב הקוטב הצפוני.",
            habitat: "קרח ים, אזורים חופיים וסביבות ארקטיות קרות.",
            animalDescription: "דובי קוטב הם דובים גדולים המותאמים לסביבות קרות. הם שחיינים חזקים ותלויים בעיקר בקרח הים כדי לצוד כלבי ים."
        )
    ]
}
```

ב-`ContentView.swift`, אפשר להשתמש כך:

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
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

טיפ: בקבצים `Animal.swift` ו-`AnimalData.swift`, השורה הראשונה היא:

```swift
import Foundation
```

בעבר, כאשר כתבנו ממשקי SwiftUI, השתמשנו לעיתים קרובות ב:

```swift
import SwiftUI
```

הסיבה לכך היא ש-`ContentView`, `Text`, `Button` ו-`Color` קשורים כולם לממשק, ולכן כאשר כותבים קובצי ממשק, בדרך כלל צריך לייבא את SwiftUI.

אבל כאן `Animal.swift` ו-`AnimalData.swift` אינם קובצי ממשק. הם משמשים בעיקר להגדרת מודל בעלי החיים ולשמירת נתוני בעלי החיים.

בקוד הזה, `UUID()` צריך את `Foundation`, ולכן מספיק לייבא את `Foundation`.

## סיכום

בשיעור הזה עשינו בעיקר דבר אחד: הוצאנו את נתוני בעלי החיים מתוך `ContentView`.

הכתיבה המקורית הייתה לשים את נתוני בעלי החיים ישירות בתוך `ContentView`. הקוד הזה יכול לפעול, אבל כאשר כמות הנתונים גדלה, קובץ התצוגה יהפוך ארוך יותר ויותר.

לאחר הארגון, `ContentView` אחראי רק להצגת הממשק, ו-`Animal.animals` אחראי לספק את נתוני בעלי החיים.

בשיעור הזה למדנו גם שני נושאים חדשים.

הראשון הוא `static`.

`static` מציין מאפיין סטטי. מאפיין סטטי שייך לטיפוס עצמו, ואפשר לגשת אליו ישירות באמצעות “שם_טיפוס.שם_מאפיין”.

לדוגמה:

```swift
Animal.animals
```

השני הוא `extension`.

`extension` פירושו הרחבה. הוא יכול לפצל את הקוד של אותו טיפוס לחלקים שונים, וכך להפוך את מבנה הקוד לברור יותר.

בדוגמה הזו אנחנו משתמשים ב-`extension Animal` כדי לשמור את נתוני בעלי החיים, וכך המבנה `Animal` עצמו נשאר תמציתי יותר.

בנוסף, `Animal` משמש בעיקר לשמירת מודל נתונים ואינו כותב ישירות ממשק SwiftUI, ולכן כאן משתמשים ב-`import Foundation`.

הנקודה המרכזית בשיעור הזה אינה להפוך את הקוד למורכב יותר, אלא להפוך אותו לקל יותר לקריאה ולתחזוקה.
