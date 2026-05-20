# קיר תמונות

בשיעור הזה ניצור עמוד של קיר תמונות.

![view](../../../Resource/032_view13.png)

בדוגמה הזו נחזור על הידע של `extension`,‏ `self` ומופעים, ונלמד את הצורות `Shape` הנפוצות ב-SwiftUI.

בעזרת הידע הזה נוכל לחתוך תמונות רגילות לצורות שונות, כמו עיגול, מלבן עם פינות מעוגלות, צורת קפסולה ואליפסה, וגם להוסיף לתמונות אפקט של מסגרת.

בשיעור הזה נשתמש בכמה מושגים חדשים: `Shape`,‏ `clipShape`,‏ `strokeBorder` ו-`overlay`.

מביניהם, `clipShape` משמש לחיתוך צורת התצוגה, `strokeBorder` משמש לציור מסגרת של צורה, ו-`overlay` משמש להנחת תצוגה חדשה מעל התצוגה הקיימת.

## חומרי תמונה

לפני שמתחילים, צריך להכין כמה תמונות.

אפשר להשתמש בתמונות משלכם, ואפשר גם להשתמש בתמונות הדוגמה שמסופקות בשיעור הזה.

תמונות הדוגמה בשיעור הזה מגיעות מאתר [Pixabay](https://pixabay.com/):

[נוף](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[שועל](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[מבנה](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[פרחים](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[ברבור](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

לאחר הורדת התמונות, הוסיפו אותן לתיקיית המשאבים `Assets`, וקראו להן לפי הסדר `1`,‏ `2`,‏ `3`,‏ `4`,‏ `5`.

![assets](../../../Resource/032_view17.png)

כך נוכל להציג את התמונות ב-SwiftUI באמצעות `Image("1")`,‏ `Image("2")` וכדומה.

## הצגת תמונות

תחילה נציג 5 תמונות בתוך `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

אפקט התצוגה:

![view](../../../Resource/032_view.png)

בקטע הקוד הזה אנו משתמשים ב-`ScrollView` כדי לאפשר גלילה ברשימת התמונות, וב-`VStack` כדי לסדר כמה תמונות מלמעלה למטה.

כל תמונה משתמשת ב-`.resizable()`,‏ `.scaledToFit()` ו-`.frame(width: 300)` כדי להגדיר את אפקט התצוגה שלה, כך שהתמונה תוכל להשתנות בגודל, לשמור על היחס המקורי ולהגביל את הרוחב שלה.

ה-`.padding(.vertical, 100)` שעל `VStack` משמש להוספת ריווח עליון ותחתון, כדי שהתמונה הראשונה והאחרונה לא יהיו צמודות מדי לקצה המסך.

לבסוף, `.ignoresSafeArea()` אומר לתצוגת הגלילה להתעלם מאזורי הבטיחות, כך שהתמונות יוכלו להימשך עד החלק העליון והתחתון של המסך בזמן גלילה, והעמוד יוצג בצורה מלאה יותר.

עם זאת, כרגע כל 5 התמונות משתמשות באותם modifiers:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

כאשר אנו רואים קוד שחוזר על עצמו, אפשר לשקול לסדר אותו באמצעות `extension`.

## שימוש ב-extension לסידור סגנון התמונה

אפשר להרחיב את `Image` ולהוסיף לה שיטה ייעודית לקיר התמונות:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

כאן הרחבנו את הסוג `Image` והוספנו לו שיטה בשם `photoGalleryStyle`.

בתוך השיטה הזו נמצאים ה-`.resizable()`,‏ `.scaledToFit()` ו-`.frame(width: 300)` שהשתמשנו בהם קודם שוב ושוב. כלומר, היא מרכזת יחד את קוד שינוי הגודל, שמירת היחס והגדרת הרוחב של התמונה.

לאחר שימוש בהרחבה הזו, קוד התמונה המקורי:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

יכול להתקצר ל:

```swift
Image("1")
    .photoGalleryStyle()
```

כך כל תמונה צריכה רק לקרוא ל-`.photoGalleryStyle()` כדי לקבל את אותו סגנון של קיר תמונות. הקוד יהיה קצר יותר, וגם יהיה נוח יותר לשנות אותו באופן אחיד בהמשך.

## הבנת self

בשיטת ההרחבה כתבנו `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

כאן `self` מייצג את מופע התמונה הנוכחי שקורא לשיטה הזו.

לדוגמה:

```swift
Image("1")
    .photoGalleryStyle()
```

בקוד הזה, `photoGalleryStyle()` נקראת על ידי `Image("1")`, ולכן `self` בתוך השיטה מייצג את התמונה `Image("1")`.

אפשר להבין זאת בפשטות כך: מי שקורא לשיטה, `self` מייצג אותו.

חשוב לשים לב שה-modifiers של SwiftUI מחזירים שוב ושוב תוצאה חדשה של תצוגה. לכן `photoGalleryStyle()` מחזירה תצוגה לאחר החלת modifiers, ולא פשוט מחזירה את ה-`Image` המקורית עצמה.

## צורות תמונה

עכשיו התמונות כבר מוצגות בצורה תקינה. אבל כברירת מחדל, כל התמונות הן מלבניות, ולכן הן נראות די רגילות.

אם רק רוצים לתת לתמונה פינות מעוגלות, אפשר להשתמש ישירות ב-`.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

אפקט התצוגה:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` פירושו הוספת פינות מעוגלות בגודל `20 pt` לתמונה. עבור תמונה רגילה עם פינות מעוגלות, הכתיבה הזו כבר מספיקה.

עם זאת, `.cornerRadius()` מטפל רק באפקט של פינות מעוגלות, ומתאים ליצירת תמונות רגילות עם פינות מעוגלות. אם נרצה להפוך תמונות לצורות שונות נוספות, modifier זה לבדו כבר לא מספיק.

בשלב הזה צריך להשתמש ב-`Shape` של SwiftUI. `Shape` יכול לייצג צורות שונות, ובשילוב עם `clipShape` אפשר לחתוך את התמונה לצורה המתאימה.

## היכרות עם Shape

ב-SwiftUI,‏ `Shape` מייצג צורה. כמו `View`, גם הוא סוג נפוץ מאוד ב-SwiftUI.

צורות `Shape` נפוצות כוללות עיגול, מלבן, מלבן עם פינות מעוגלות, קפסולה ואליפסה. כדי לצפות בצורה ישירה יותר במראה של הצורות השונות, הדוגמאות הבאות יתנו לכל צורה צבע וגודל שונים.

בדוגמאות האלה, `.fill()` משמש למילוי הצורה בצבע, ו-`.frame()` משמש להגדרת גודל התצוגה של הצורה. הצבע נועד רק להבדיל בין הצורות השונות, והוא אינו צבע קבוע של הצורה עצמה.

### Circle עיגול

`Circle` מייצג עיגול. הוא נפוץ באפקטים של ממשק כמו אווטאר, כפתור עגול ותמונה עגולה.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle מלבן

`Rectangle` מייצג מלבן. זו אחת הצורות הבסיסיות ביותר, ואפשר להשתמש בה גם ליצירת רקעים, חלוקת אזורים או מסגרות רגילות.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle מלבן עם פינות מעוגלות

`RoundedRectangle` מייצג מלבן עם פינות מעוגלות. `cornerRadius` משמש להגדרת גודל הפינות המעוגלות.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule צורת קפסולה

`Capsule` מייצג צורת קפסולה. שני הקצוות שלה הם קשתות עגולות, והיא נפוצה באפקטים של ממשק כמו כפתורי קפסולה ורקע של תגיות.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse אליפסה

`Ellipse` מייצג אליפסה. הוא דומה ל-`Circle`, אבל כאשר הרוחב והגובה אינם שווים, הוא יוצג כאליפסה.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

באמצעות הדוגמאות האלה אפשר לראות ש-`Shape` עצמו יכול להיות מוצג ישירות כצורה. בהמשך נשתמש ב-`Shape` יחד עם `clipShape` כדי לחתוך תמונות, כך שהתמונות יוצגו בצורות שונות.

## שימוש ב-clipShape לחיתוך תמונות

עכשיו אפשר להשתמש ב-`clipShape` כדי לחתוך תמונות לצורות שונות.

לדוגמה, לחתוך את התמונה הראשונה לעיגול:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

קטע הקוד הזה אומר: קודם מציגים תמונה, ולאחר מכן משתמשים ב-`Circle()` כדי לחתוך אותה לעיגול.

![view](../../../Resource/032_view2.png)

הכתיבה הבסיסית של `clipShape` היא:

```swift
.clipShape(צורה)
```

אחרי התצוגה מוסיפים `.clipShape(...)`, ובסוגריים כותבים את הצורה שאליה רוצים לחתוך.

לדוגמה:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

עכשיו נחתוך את 5 התמונות לצורות שונות:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

אפקט התצוגה:

![view](../../../Resource/032_view8.png)

מביניהן, לאחר חיתוך באמצעות `Rectangle()`, התוצאה דומה לתמונה מלבנית רגילה, ולכן השינוי החזותי אינו ברור. הוא משמש בעיקר להשוואה עם צורות אחרות.

כעת התמונות כבר אינן רק מלבנים רגילים, אלא מקבלות צורות שונות.

## הוספת מסגרת לתמונה

אם נרצה להוסיף מסגרת לתמונה עגולה, ייתכן שנחשוב להשתמש ב-`border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

אבל בדרך כלל התוצאה לא תהיה מסגרת עגולה, אלא מסגרת מלבנית.

![view](../../../Resource/032_view9.png)

הסיבה היא ש-`border` מוסיף מסגרת לפי האזור המלבני של התצוגה, ולא לפי הצורה שנחתכה על ידי `clipShape`.

לכן, אם נרצה מסגרת עגולה, לא נוכל להשתמש ישירות ב-`border`.

## שימוש ב-strokeBorder לציור מסגרת של צורה

ב-SwiftUI,‏ `strokeBorder` יכול לצייר מסגרת פנימית לצורות `Shape` נפוצות כאלה.

לדוגמה, ציור מסגרת עגולה:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

קטע הקוד הזה אומר: לצייר ל-`Circle` מסגרת חומה, ברוחב `10 pt`.

![view](../../../Resource/032_view12.png)

כאן צריך לשים לב ש-`strokeBorder` לא מוסיף מסגרת ישירות לתמונה, אלא מצייר מסגרת עבור הצורה `Circle()`.

כלומר, קטע הקוד הזה יוצר רק מסגרת עגולה עצמאית, שעדיין אינה קשורה לתמונה.

אם רוצים שהמסגרת העגולה הזו תופיע מעל התמונה, צריך להמשיך להשתמש ב-`overlay`, ולהניח את המסגרת על התמונה.

## שימוש ב-overlay להנחת מסגרת מעל התמונה

`overlay` הוא modifier של תצוגה, והוא יכול להניח תצוגה חדשה מעל התצוגה הנוכחית.

אפשר להבין את המבנה הבסיסי שלו כך:

```swift
התצוגה הנוכחית
    .overlay {
        התצוגה המונחת מעל
    }
```

במקרה הזה, התצוגה הנוכחית היא התמונה שכבר נחתכה לעיגול:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

התצוגה החדשה שאנו רוצים להניח מעליה היא מסגרת עגולה:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

לכן אפשר לשלב את התמונה והמסגרת יחד:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

כאן `overlay` אומר להניח תצוגה חדשה מעל התצוגה הנוכחית.

בתוך `overlay`, המסגרת תונח בהתאם לטווח התצוגה של התמונה הנוכחית, ולכן אין צורך להגדיר לה `frame` בנפרד. כל עוד צורת המסגרת וצורת החיתוך זהות, המסגרת תתאים לתמונה.

![view](../../../Resource/032_view10.png)

התוצאה הסופית היא שמעל התמונה העגולה מונחת מסגרת עגולה.

בהשוואה ל-`ZStack`,‏ `overlay` מתאים יותר לתרחיש של “הוספת קישוט לתצוגה הנוכחית”. התמונה היא הגוף המרכזי, והמסגרת היא רק אפקט נוסף, ולכן שימוש ב-`overlay` ברור יותר.

## השלמת קיר התמונות

עכשיו נוסיף לכל תמונה את הצורה והמסגרת המתאימות:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

אפקט התצוגה:

![view](../../../Resource/032_view13.png)

כך הושלם עמוד בסיסי של קיר תמונות.

בעמוד הזה השתמשנו ב-`ScrollView` כדי לממש תצוגה נגללת, ב-`Image` כדי להציג תמונות, ב-`clipShape` כדי לחתוך את צורת התמונות, וב-`overlay` ו-`strokeBorder` כדי להוסיף מסגרות.

## הקוד המלא

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## סיכום

בשיעור הזה השלמנו עמוד של קיר תמונות.

![view](../../../Resource/032_view13.png)

בדוגמה הזו השתמשנו תחילה ב-`Image` כדי להציג תמונות, ולאחר מכן הרחבנו את `Image` באמצעות `extension` והוספנו שיטה בשם `photoGalleryStyle`, המשמשת לסידור קוד סגנון התמונה שחזר על עצמו.

לאחר מכן למדנו על צורות `Shape` נפוצות ב-SwiftUI, למשל `Circle`,‏ `Rectangle`,‏ `RoundedRectangle`,‏ `Capsule` ו-`Ellipse`. הצורות האלה יכולות לא רק להיות מוצגות ישירות, אלא גם לעבוד יחד עם `clipShape` כדי לחתוך תצוגות.

לדוגמה:

```swift
.clipShape(Circle())
```

פירוש הדבר הוא לחתוך את התצוגה לעיגול.

לבסוף השתמשנו ב-`overlay` וב-`strokeBorder` כדי להוסיף לתמונות מסגרות בצורות המתאימות. חשוב לשים לב ש-`border` בדרך כלל מצייר מסגרת לפי האזור המלבני של התצוגה. אם רוצים שהמסגרת תעקוב אחרי עיגול, קפסולה או אליפסה, מתאים יותר להשתמש באותו `Shape` ולהניח אותו מעל.

באמצעות השיעור הזה לא רק השלמנו את אפקט קיר התמונות, אלא גם הבנו את שילוב השימוש הנפוץ של `Shape`,‏ `clipShape`,‏ `strokeBorder` ו-`overlay` בממשק.

## תרגול לאחר השיעור

### 1、הוספת רקע לקיר התמונות

הוסיפו תמונת רקע במסך מלא לעמוד קיר התמונות.

דרישה: תמונת הרקע תוכל למלא את כל המסך ולהתעלם מאזורי הבטיחות.

### 2、מסגרת הדרגתית

שנו את המסגרת החד-צבעית הקיימת למסגרת עם מעבר צבע ליניארי.

אפשר לנסות להשתמש ב-`LinearGradient` כדי ליצור אפקט מסגרת עשיר יותר.

### 3、מסגרת תמונה מדומה

חפשו באינטרנט סגנונות של מסגרות תמונה אמיתיות, ונסו להשתמש ב-`overlay` כדי להניח מסגרת תמונה מעל, כך שהתמונה תיראה קרובה יותר למסגרת אמיתית.

אפקט התצוגה של התרגול:

![button](../../../Resource/032_view15.jpeg)

### 4、מימוש מסגרת לכפתור עם פינות מעוגלות

בפיתוח בפועל, כפתורים משתמשים לעיתים קרובות במסגרת של מלבן עם פינות מעוגלות.

נסו ליצור כפתור עם פינות מעוגלות, ולהשתמש ב-`RoundedRectangle` וב-`strokeBorder` כדי להוסיף לו מסגרת עם פינות מעוגלות.

אפקט התצוגה של התרגול:

![button](../../../Resource/032_view14.png)

### שאלת חשיבה

אם לא רוצים להשתמש במסגרת בצבע יחיד, וגם לא במסגרת הדרגתית, אלא רוצים שהמסגרת תציג אפקט של דוגמה מסוימת, איך אפשר לממש זאת?

אפשר לנסות לחפש חומרי עזר ולהכיר שימושים קשורים כמו `overlay`,‏ `mask` או `ImagePaint`.

אפקט התצוגה של התרגול:

![button](../../../Resource/032_view16.png)
