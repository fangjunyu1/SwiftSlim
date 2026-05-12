# ניהול קבצי Xcode

בשיעור זה נלמד פעולות קבצים נפוצות ב-Xcode.

בשיעורים הקודמים כתבנו את רוב הקוד בתוך `ContentView`. כך קל יותר לצפות בקוד ובתוצאת התצוגה.

לדוגמה:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

אבל באפליקציה אמיתית, בדרך כלל לא נכתוב את כל הקוד בקובץ אחד.

כאשר יש יותר ויותר מסכים, רכיבים ופונקציות, צריך לפצל תצוגות שונות לקבצי SwiftUI שונים.

לדוגמה:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

כך מבנה הקוד ברור יותר, וגם קל יותר לתחזק ולשנות אותו בהמשך.

## למה צריך לנהל קבצים

ב-SwiftUI, מסך או רכיב בדרך כלל יכולים להיכתב כקובץ תצוגה עצמאי.

לדוגמה:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

כאן, `CardView` הוא תצוגת SwiftUI.

אם כל התצוגות נכתבות בתוך `ContentView`, הקוד ילך ויתארך, וגם יהיה קשה יותר לקרוא אותו.

לכן עלינו ללמוד ליצור, לשנות שם ולמחוק קבצים, וגם להשתמש בתיקיות כדי לנהל קובצי קוד שונים.

## יצירת קובץ SwiftUI

ב-Xcode יש בדרך כלל שתי דרכים נפוצות ליצור קובץ SwiftUI:

דרך אחת היא ליצור קובץ ריק, ואז לכתוב את הקוד בעצמנו.

דרך נוספת היא ליצור קובץ מתבנית SwiftUI, כך ש-Xcode ייצור אוטומטית את הקוד הבסיסי.

למתחילים מומלץ יותר להשתמש בקובץ תבנית SwiftUI, כי הוא יוצר אוטומטית את המבנה הבסיסי.

### יצירת קובץ ריק

באזור Navigator בצד שמאל של Xcode, לחצו לחיצה ימנית על מקום ריק או על תיקייה, ובחרו `New Empty File`.

מיקום הפעולה הוא כך:

![xcode](../../../Resource/027_view1.png)

לאחר יצירת קובץ ריק, Xcode בדרך כלל ייצור קובץ Swift ללא שם, למשל `Untitled.swift`.

אפשר לשנות את שמו ל-`TestView.swift`.

בפרויקט SwiftUI, אם הקובץ הזה משמש להצגת תצוגה, בדרך כלל מומלץ להוסיף `View` בסוף השם.

לדוגמה:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

זו אינה חובה, אך היא מאפשרת לנו להבין במבט ראשון שזהו קובץ תצוגה.

לאחר יצירת קובץ ריק, ייתכן שיהיו בקובץ רק הערות ברירת מחדל, וייתכן שהוא יהיה ריק. הדבר תלוי בגרסת Xcode ובדרך היצירה.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

בשלב זה צריך לכתוב ידנית קוד SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

כך נוצר קובץ תצוגת SwiftUI פשוט.

### שינוי שם קובץ

אם לאחר יצירת הקובץ רוצים לשנות את שם הקובץ, אפשר לבחור את הקובץ באזור Navigator בצד שמאל של Xcode, ואז ללחוץ על מקש Enter `⏎`.

![xcode](../../../Resource/027_view2.png)

כך אפשר לשנות את שם הקובץ.

חשוב לשים לב ששינוי שם הקובץ אינו משנה אוטומטית את שם התצוגה בתוך הקוד.

לדוגמה, אחרי שמשנים את שם הקובץ ל-`ProfileView.swift`, ייתכן שבקוד עדיין יופיע `struct TestView: View`.

זה לא בהכרח יגרום לשגיאה, אבל קל שזה ייצור בלבול.

לכן מומלץ לשמור על התאמה בין שם הקובץ לשם התצוגה. לדוגמה, אם שם הקובץ הוא `ProfileView.swift`, גם שם התצוגה יהיה `ProfileView`.

## יצירת קובץ מתבנית SwiftUI

מלבד יצירת קובץ ריק, אפשר גם ליצור ישירות קובץ מתבנית SwiftUI.

באזור Navigator בצד שמאל של Xcode, לחצו לחיצה ימנית על מקום ריק או על תיקייה, ובחרו `New File from Template...`.

מיקום הפעולה הוא כך:

![xcode](../../../Resource/027_view3.png)

בחלון שנפתח אפשר לבחור בחלק העליון פלטפורמות שונות, כגון `iOS`,‏ `macOS` ועוד.

כאן נשאיר את הפלטפורמה שמתאימה לפרויקט הנוכחי. לדוגמה, אם אנחנו יוצרים אפליקציית iOS, נבחר `iOS`.

![xcode](../../../Resource/027_view4.png)

לאחר מכן בחרו למטה `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

לאחר מכן לחצו על `Next`, הזינו שם קובץ ושמרו.

לדוגמה, ניצור קובץ בשם `Test2View.swift`.

Xcode ייצור אוטומטית קוד דומה לזה:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

בהשוואה לקובץ ריק, קובץ התבנית כולל אוטומטית את `import SwiftUI`,‏ `struct`,‏ `body` ו-`#Preview`.

לכן למתחילים, שימוש בקובץ תבנית SwiftUI פשוט יותר וגם מפחית את הסיכוי לשכוח לכתוב קוד.

**טיפ**: מלבד יצירת קובץ בלחיצה ימנית, אפשר גם ללחוץ על כפתור הפלוס בתחתית אזור Navigator בצד שמאל של Xcode כדי ליצור קובץ או תיקייה.

![xcode](../../../Resource/027_view5.png)

## יצירת תיקייה

כאשר יש יותר ויותר קבצים, אפשר להשתמש בתיקיות כדי לנהל אותם.

באזור Navigator בצד שמאל של Xcode, לחצו לחיצה ימנית על מקום ריק או על תיקייה, ובחרו `New Folder`.

לאחר יצירת התיקייה, אפשר לגרור לתוכה קבצים קשורים.

![xcode](../../../Resource/027_view7.png)

תיקיות משמשות בעיקר לסידור מבנה הפרויקט, ואינן משנות את אופן השימוש בתצוגה עצמה.

כל עוד שם התצוגה נכון, עדיין אפשר להשתמש בה מקבצים אחרים באמצעות `TestView()` ו-`Test2View()`.

## מחיקת קובץ או תיקייה

אם רוצים למחוק קובץ או תיקייה, אפשר לבחור את הקובץ המתאים באזור Navigator בצד שמאל של Xcode, ואז ללחוץ לחיצה ימנית ולבחור `Delete`.

אפשר גם לבחור את הקובץ ואז ללחוץ על מקש המחיקה `⌫`.

Xcode יציג חלון אישור מחיקה.

![xcode](../../../Resource/027_view10.png)

בחירה ב-`Move to Trash` פירושה העברת הקובץ לפח האשפה.

אם מופיע `Remove Reference`, פירוש הדבר הוא הסרת ההפניה רק מפרויקט Xcode, בלי למחוק את הקובץ המקורי מהדיסק.

למתחילים, אם מוחקים רק קובץ רגיל שזה עתה נוצר, בדרך כלל אפשר לבחור `Move to Trash`.

## הצגת כמה תצוגות SwiftUI

אחרי שלמדנו ליצור קבצים, אפשר לפצל תצוגות שונות לקבצים שונים.

לדוגמה, ניצור שני קובצי SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` משמש להצגת שם המחבר:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` משמש להצגת רקע הכרטיס:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

לאחר מכן אפשר להשתמש בשתי התצוגות האלה בתוך `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

לאחר ההרצה אפשר לראות ש-`CardView` ו-`AuthorView` מוצגות יחד בהרכבה:

![xcode](../../../Resource/027_view11.png)

בתוצאה הזו, `CardView` משמשת כרקע, ו-`AuthorView` מוצגת מעליה, מפני שהן הונחו בתוך `ZStack`.

בתוך `ContentView`, אנחנו משתמשים בשתי התצוגות דרך `CardView()` ו-`AuthorView()`. הסוגריים `()` שאחרי השם מציינים יצירה ושימוש בתצוגה הזו.

זהו קינון תצוגות נפוץ ב-SwiftUI: בתוך תצוגה אחת אפשר להמשיך להשתמש בתצוגות אחרות.

## קובץ הכניסה

לבסוף, ניזכר מאיפה האפליקציה מתחילה להציג את הממשק.

בפרויקט SwiftUI יש בדרך כלל קובץ כניסה:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

כאן `@main` מציין שזהו מקום הכניסה של האפליקציה.

בתוך `WindowGroup`, אנחנו רואים:

```swift
ContentView()
```

זה אומר שלאחר הפעלת האפליקציה, קודם מוצג `ContentView`.

לאחר מכן, בתוך `ContentView` מוצג גם:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

לכן אפשר להבין את היררכיית התצוגות כך:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

אם נשנה את התצוגה שמוצגת בקובץ הכניסה ל-`CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

אז לאחר הפעלת האפליקציה, יוצג רק `CardView`.

כלומר, `WindowGroup` בקוד הכניסה קובע איזו תצוגה תוצג ראשונה לאחר הפעלת האפליקציה.

ובתוך התצוגה הזו אפשר להמשיך להציג תצוגות אחרות.

## סיכום

בשיעור זה למדנו פעולות נפוצות לניהול קבצים ב-Xcode.

למדנו איך ליצור קובצי SwiftUI, איך לשנות שמות של קבצים, איך ליצור תיקיות, וגם איך למחוק קבצים.

במקביל למדנו גם רעיון חשוב: אפשר לפצל תצוגות SwiftUI לקבצים שונים, ואז להשתמש בהן בתוך תצוגות אחרות.

לדוגמה:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

כאן, `CardView()` ו-`AuthorView()` הן שימוש בתצוגות אחרות בתוך `ContentView`.

לבסוף חזרנו גם על לוגיקת התצוגה של קובץ הכניסה.

כאשר האפליקציה מופעלת, היא נכנסת קודם לקוד הכניסה המסומן ב-`@main`, ואז מציגה את התצוגה שבתוך `WindowGroup`.

זה עוזר לנו להבין שקובצי SwiftUI שונים אינם מבודדים זה מזה. הם יכולים להשתלב זה בזה, ולבסוף להרכיב ממשק אפליקציה שלם.
