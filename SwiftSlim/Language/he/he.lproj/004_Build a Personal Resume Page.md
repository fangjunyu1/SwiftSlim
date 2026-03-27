# בניית עמוד קורות חיים אישי

בשיעור הזה ניצור תצוגת קורות חיים אישית פשוטה, ונלמד את הנושאים הבאים:

- `cornerRadius`
- `spacing`
- `ScrollView`

במהלך הבנייה נחזור על נושאים כמו פריסה, `Text` ו-`Image`, ונממש שליטה ברווחים וכן אפקט של גלילת תוכן.

## קורות חיים אישיים

התוצאה הרצויה:

![Swift](../../RESOURCE/004_img.png)

**נסו קודם להשלים את התרגיל בעצמכם, ורק אחר כך המשיכו לקרוא את ההסבר.**

### יצירת פרויקט

צרו פרויקט iOS חדש, או המשיכו להשתמש בפרויקט שיצרתם קודם.

קוד ברירת המחדל של `ContentView`:

```swift
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
```

כעת מחקו את הקוד והתחילו לכתוב את התוכן שלכם:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### המבנה הכללי

בפיתוח אמיתי נהוג קודם לתכנן את המבנה הכללי של העמוד.

העמוד שלנו כולל:

1. כותרת
2. מידע אישי
3. היכרות אישית

נוסיף `VStack` בשכבה החיצונית ביותר:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` מבטיח סידור אנכי של התצוגות, וגם מאפשר לשלוט באופן הסידור וברווחים ביניהן.

### הכותרת

ראשית ניצור `Text` שיציג את הכותרת.

כאן אציג את שמי באנגלית ככותרת:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

בדרך כלל כותרת נראית גדולה ובולטת יותר, ולכן נשתמש ב-modifiers `font` ו-`fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### סידור

ברירת המחדל של SwiftUI היא יישור למרכז (`center`), ולכן כרגע הכותרת מופיעה במרכז של `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

אנחנו רוצים שהכותרת תופיע בחלק העליון של התצוגה, ולשם כך אפשר להשתמש ב-`Spacer`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` תופס את כל המקום הפנוי ודוחף את `Text` כלפי מעלה.

![Swift](../../RESOURCE/004_img4.png)

### רווח לבן

אם נראה לכם שהטקסט קרוב מדי לחלק העליון, אפשר להשתמש ב-`padding` או ב-`Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

כאן אנחנו מגדירים שול עליון של `20` עבור ה-`VStack`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

אפשר גם להשתמש ב-`Spacer` ולתת לו גובה מסוים דרך `frame`, כדי ליצור רווח בגובה מוגדר.

התוצאה:

![Swift](../../RESOURCE/004_img5.png)

### תמונה

נכין תמונת פרופיל משלנו ונוסיף אותה לתיקיית `Assets`.

![Swift](../../RESOURCE/004_img6.png)

ב-`ContentView` נשתמש ב-`Image` כדי להציג את התמונה:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

מכיוון שהתמונה המקורית גדולה יחסית, נשתמש ב-`frame` כדי לשלוט בגודל שלה.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

בשלב הזה נגלה בעיה:

אם יחס הרוחב-גובה של `frame` שונה מהיחס המקורי של התמונה, התמונה תתעוות.

למשל:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

כדי למנוע עיוות, נשתמש ב-`scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

התפקיד של `scaledToFit` הוא:

להקטין או להגדיל את התמונה ביחס המקורי שלה, בתוך גבולות ה-`frame`, כך שכל התוכן יוצג בשלמותו.

הוא לא מותח בכוח את התמונה כדי למלא את כל ה-`frame`, אלא שומר על יחס הרוחב-גובה ומבצע התאמה עד שאחד הצדדים נצמד לגבול.

כלומר:

- אם רוחב ה-`frame` קטן יותר, קנה המידה יתבסס על הרוחב
- אם גובה ה-`frame` קטן יותר, קנה המידה יתבסס על הגובה
- התמונה תמיד שומרת על הפרופורציות המקוריות שלה, בלי להתעוות

במקרים רבים אפשר לקבוע רק מידה אחת. לדוגמה:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

במקרה כזה המערכת תחשב אוטומטית את הגובה המתאים לפי רוחב `140`, תוך שמירה על היחס המקורי.

אם רוצים יחס חזותי קבוע או למנוע דחיסה בפריסות מורכבות, אפשר להגביל גם רוחב וגם גובה.

### פינות מעוגלות

אם רוצים שהתמונה תוצג עם פינות מעוגלות, אפשר להשתמש ב-`cornerRadius`:

```swift
.cornerRadius(10)
```

למשל:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

מוסיפים `cornerRadius(20)` אחרי modifiers של `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` אומר לחתוך את גבולות התצוגה וליישם רדיוס פינות של `20`.

לאחר הוספת הפינות המעוגלות, ארבע הפינות של התמונה יהפכו למעוגלות, מה שנותן מראה רך ומודרני יותר.

זהו סגנון נפוץ מאוד בעיצוב ממשקים כיום. למשל, אייקוני אפליקציות ב-iOS משתמשים גם הם בצורה של מלבן עם פינות מעוגלות (אם כי אייקוני המערכת משתמשים בצורה רציפה ומתוחכמת יותר, ולא רק בעיגול פשוט של הפינות).

### מידע אישי

כעת נממש את אזור המידע האישי, שמופיע משמאל לתמונה. מהמבנה של הממשק אפשר לראות שהמידע האישי והתמונה מסודרים אופקית, ולכן נשתמש ב-`HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

תוכן המידע האישי עצמו מסודר אנכית.

![Swift](../../RESOURCE/004_img11.png)

לכן נשתמש ב-`HStack` חיצוני, ב-`VStack` עבור המידע האישי, וב-`Text` עבור הטקסטים.

מבנה בסיסי:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**הדגשת שמות השדות**

כדי להבדיל בין שם השדה לערך שלו, אפשר להשתמש ב-`fontWeight` על שם השדה:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**יישור טקסט לשמאל**

ברירת המחדל של `VStack` היא יישור למרכז. אם רוצים שכל הטקסטים יהיו מיושרים לשמאל, צריך להגדיר את היישור:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` פירושו יישור לצד ההתחלתי (בסביבת שפות משמאל לימין זהו צד שמאל).

![Swift](../../RESOURCE/004_img14.png)

### רווחים

אם רוצים להשאיר מרווח קבוע בין המידע האישי לתמונה, כבר למדנו קודם שאפשר להשתמש ב-`Spacer`:

```swift
Spacer()
    .frame(width: 10)
```

אפשר גם להשתמש בפרמטר `spacing` של `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` אומר שהמרווח בין שתי תצוגות-הבן יהיה `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**מהו `spacing`?**

ב-`VStack`、`HStack` ו-`ZStack`, הפרמטר `spacing` שולט במרחק בין תצוגות-הבן.

למשל:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

במקרה הזה, המרווח בין תצוגות-הבן של ה-`VStack` יהיה `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

חשוב לשים לב ש-`spacing` משפיע רק על תצוגות-הבן הישירות, ולא על פריסה פנימית של מיכלים מקוננים.

**שליטה ברווחים בתוך הרשימה**

אם רוצים להגדיל את המרווח בין שדות המידע, הדרך הישירה ביותר היא להגדיר `spacing` ל-`VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

כך המרווח בין כל תצוגות-הבן יהפוך ל-`10 pt`.

אבל אם מתבוננים בממשק, מגלים בעיה:

יש מרווח בין קבוצות השדות, אבל גם בין שם השדה לערך שלו מופיע אותו מרווח בדיוק.

הסיבה היא ש-`spacing` פועל על כל תצוגות-הבן הישירות של המיכל הנוכחי.

במבנה הזה, כל `Text` הוא תצוגת-בן ישירה של ה-`VStack` החיצוני, ולכן המרווח ביניהם אחיד.

אם רוצים שיהיה מרווח בין קבוצות השדות, אבל ששם השדה והערך שלו יישארו צמודים יחסית, אפשר להתייחס לכל זוג “שם שדה + ערך” כיחידה לוגית ולעטוף אותו ב-`VStack` משלו:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

במקרה כזה המבנה משתנה: יש מרווח בין ה-`VStack`-ים החיצוניים, ואילו בתוך כל `VStack` פנימי נשמר המרווח הצפוף של ברירת המחדל. כך לא יופיע רווח מיותר בין שם השדה לערך שלו.

![Swift](../../RESOURCE/004_img18.png)

### היכרות אישית

כעת נממש את אזור ההיכרות האישית.

מבחינת מבנה הממשק, אזור ההיכרות מורכב מכמה שורות טקסט, שמסודרות אנכית.

![Swift](../../RESOURCE/004_img19.png)

לכן אפשר להשתמש ב-`VStack` עם `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**הוספת רווחים**

כרגע אזור המידע האישי ואזור ההיכרות נראים צפופים יחסית, והמראה עדיין לא מספיק נעים.

![Swift](../../RESOURCE/004_img20.png)

מכיוון ששניהם נמצאים באותו מיכל חיצוני, אפשר לשלוט במרווח הכולל דרך המיכל החיצוני:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

התוצאה:

![Swift](../../RESOURCE/004_img21.png)

**רווחים בתוך הרשימה**

אפשר להשתמש ב-`spacing` גם כדי לשלוט במרווח בין שורות הטקסט של ההיכרות:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### השלמת עמוד קורות החיים

כעת המבנה הבסיסי של עמוד קורות החיים שלנו כבר מוכן.

![Swift](../../RESOURCE/004_img.png)

### תצוגה נגללת

כרגע מבנה העמוד מבוסס על `VStack`, וזה עובד היטב כאשר יש מעט שורות טקסט. אבל אם נוסיף 20, 30 או יותר שורות, גובה התוכן יחרוג מגובה המסך.

למשל:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

בשלב הזה יופיעו שתי תופעות:

- התוכן שבתחתית ייחתך
- לא ניתן יהיה לגלול את העמוד

זו אינה בעיה של `VStack`. `VStack` הוא רק מיכל פריסה, והוא לא מספק יכולת גלילה באופן אוטומטי.

**מהו `ScrollView`**

`ScrollView` הוא מיכל שניתן לגלול, והוא מתאים לתוכן רב שגדול מגודל המסך, למשל רשימות אנכיות או אופקיות.

מבנה בסיסי:

```swift
ScrollView {
    ...
}
```

אם רוצים לאפשר גלילה, צריך לעטוף את כל תוכן העמוד בתוך `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

כך כל העמוד הופך לאזור שניתן לגלול. כאשר התוכן גבוה מהמסך, אפשר לגלול אותו בצורה טבעית.

ברירת המחדל של `ScrollView` היא להציג אינדיקטור גלילה. אם רוצים להסתיר אותו, אפשר להגדיר:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## הקוד המלא

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
