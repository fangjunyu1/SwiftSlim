# תצוגת התחברות

בשיעור הזה נלמד תרחיש שימושי מאוד: תצוגת התחברות.

בין אם מדובר באתר אינטרנט או באפליקציה, במהלך השימוש לעיתים קרובות יש צורך שהמשתמש יתחבר לחשבון שלו ויזין סיסמה.

לדוגמה, דף ההתחברות של GitHub:

![WordPress](../../Resource/019_github.png)

בשיעור הזה ניצור תצוגת התחברות דומה, כדי שהמשתמש יוכל להזין ידנית חשבון וסיסמה, ונבדוק אם יש בעיה כלשהי בתוכן שהוזן.

## פריסה עליונה

נכתוב את הקוד של תצוגת ההתחברות בקובץ `ContentView`.

תחילה, נכתוב את אזור הסימון בחלק העליון של תצוגת ההתחברות. אפשר להכין מראש תמונת אייקון מתאימה ולהניח אותה בתיקיית `Assets`.

![icon](../../Resource/019_icon1.png)

לאחר מכן, השתמשו ב-`Image` וב-modifiers כדי להציג את התמונה:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

ה-modifiers האלה מציינים:

- `resizable()`: מאפשר לשנות את גודל התמונה.
- `scaledToFit()`: משנה את גודל התמונה תוך שמירה על הפרופורציות המקוריות שלה.
- `frame(width: 100)`: מגדיר את רוחב התצוגה של התמונה ל-`100`.

בהמשך, השתמשו ב-`Text` וב-modifiers כדי להציג את כותרת ההתחברות:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

לאחר מכן, השתמשו ב-`VStack` כדי לסדר את התמונה והטקסט בצורה אנכית:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

תוצאה:

![view](../../Resource/019_view.png)

עד כאן, השלמנו את אזור הכותרת בחלק העליון של תצוגת ההתחברות.

### אופטימיזציה של הפריסה

כרגע, התמונה והכותרת נמצאות כברירת מחדל באזור האמצעי של הפריסה הכוללת.

אם אנחנו רוצים שהן ייראו יותר כמו "סימון התחברות בחלק העליון של הדף", אפשר להשתמש ב-`Spacer()` כדי למתוח את השטח שנותר ולגרום לתוכן להופיע קרוב יותר לחלק העליון.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

תוצאה:

![view](../../Resource/019_view1.png)

אבל עכשיו, ‏`Image` ו-`Text` קרובים מדי לחלק העליון של המסך, וזה נראה קצת צפוף.

בשלב הזה, אפשר להשתמש ב-`padding` כדי להוסיף ריווח עליון לכל ה-`VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

תוצאה:

![view](../../Resource/019_view2.png)

כך, אזור הכותרת בחלק העליון של הדף נראה מתאים יותר.

## שם משתמש וסיסמה

דף התחברות בדרך כלל דורש מהמשתמש להזין שם משתמש וסיסמה.

ב-SwiftUI, אפשר להשתמש ב-`TextField` כדי לקבל את התוכן שהמשתמש מזין.

אבל חשוב לשים לב: `TextField` בעצמו לא שומר את נתוני הקלט לאורך זמן, הוא רק רכיב קלט. מה שבאמת שומר את התוכן הזה הוא המשתנים שאנחנו קושרים אליו.

לכן, קודם כול אנחנו צריכים ליצור שני משתני `@State` כדי לשמור את שם המשתמש והסיסמה:

```swift
@State private var user = ""
@State private var password = ""
```

כאשר הערך של משתנה `@State` משתנה, ‏SwiftUI מרענן אוטומטית את התצוגות הקשורות.

לאחר מכן, השתמשו ב-`TextField` כדי לקשור את שני המשתנים האלה:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

כאן, ‏`$user` ו-`$password` מייצגים "binding".

כלומר, כאשר המשתמש מקליד טקסט בשדה הקלט, המשתנה משתנה באותו הזמן; וכאשר המשתנה משתנה, גם התוכן שמוצג בשדה הקלט משתנה באותו הזמן.

הקשר הזה, שבו "התצוגה והנתונים נשארים מסונכרנים זה עם זה", נקרא binding.

שימו לב שכאן צריך להשתמש בכתיבה עם `$`:

```swift
$user
```

כי `TextField` לא צריך מחרוזת רגילה, אלא ערך binding ש"יכול לשנות נתונים בשני הכיוונים".

### הצגת שדות הקלט

נכניס אותם לתוך `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

תוצאת התצוגה:

![view](../../Resource/019_view3.png)

מכיוון ש-`user` ו-`password` כרגע שניהם מחרוזות ריקות כברירת מחדל:

```swift
""
```

לכן שדה הקלט יציג קודם טקסט מציין מקום, למשל:

```swift
input user
```

הטקסט הזה רק רומז למשתמש "מה צריך להזין כאן", והוא לא התוכן שהוזן בפועל.

### אופטימיזציה של שדות הקלט

עכשיו כבר אפשר להשתמש בשדות הקלט, אבל העיצוב ברירת המחדל שלהם פשוט יחסית.

כדי להפוך את הממשק לברור יותר, אפשר להוסיף כותרת לפני שדה הקלט, ולעשות מעט אופטימיזציה פשוטה לעיצוב של השדה עצמו.

לדוגמה, קודם כול נוסיף כותרת:

```swift
Text("Username")
    .fontWeight(.bold)
```

לאחר מכן, השתמשו ב-`HStack` כדי למקם את הכותרת ושדה הקלט באותה שורה:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

אנחנו משתמשים כאן ב-`HStack`, כי אנחנו רוצים "להציג את הכותרת משמאל ואת שדה הקלט מימין".

חשוב לשים לב ש-`TextField` יתפוס כברירת מחדל את השטח הפנוי שנותר.

![color](../../Resource/019_view6.png)

כדי שהגודל של שני שדות הקלט יהיה אחיד יותר, אפשר להשתמש ב-`frame(width:)` כדי להגדיר לו רוחב, כך ששדות הקלט ייראו מסודרים יותר.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

לאחר מכן, הוסיפו גם מסגרת כדי ששדה הקלט יהיה בולט יותר:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

עכשיו, נוסיף גם את שם המשתמש וגם את הסיסמה אל התצוגה `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

תוצאת התצוגה:

![view](../../Resource/019_view4.png)

עד כאן, המשתמש כבר יכול להזין שם משתמש וסיסמה.

## כפתור התחברות

בהמשך, נוסיף כפתור התחברות מתחת לשדות הקלט.

```swift
Button("Sign in") {

}
```

לאחר מכן, השתמשו ב-`buttonStyle` כדי להוסיף לכפתור סגנון מערכת בולט יותר:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

תוצאת התצוגה:

![view](../../Resource/019_view5.png)

כדי לוודא שהכפתור באמת מגיב להקשה, אפשר קודם לכתוב `print` בתוך הכפתור לצורך בדיקה:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

כאשר מקישים על הכפתור, המסוף ידפיס:

```swift
click Sign in
```

זה מראה שהכפתור כבר הגיב בהצלחה לפעולת ההקשה.

## לוגיקת התחברות

עכשיו נוסיף לכפתור ההתחברות את לוגיקת האימות הבסיסית ביותר: **לבדוק אם המשתמש הזין שם משתמש וסיסמה**.

אנחנו רוצים לממש את המצבים הבאים:

- אם המשתמש לא הזין כלום, להדפיס `Empty`
- אם המשתמש הזין רק אחד מהם, לציין מה חסר
- אם גם שם המשתמש וגם הסיסמה הוזנו, להדפיס `Success`

### לא הוזן שום מידע

מכיוון ש-`user` ו-`password` שניהם מחרוזות ריקות כברירת מחדל:

```swift
@State private var user = ""
@State private var password = ""
```

אז כאשר המשתמש לא מזין כלום, הם עדיין יישארו ריקים.

ב-Swift, סוגים כמו `String` יכולים להשתמש ב-`isEmpty` כדי לקבוע אם התוכן ריק.

### המאפיין isEmpty

המאפיין `isEmpty` משמש לעיתים קרובות לבדיקה אם מחרוזות, מערכים ותכנים אחרים הם ריקים.

לדוגמה:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

אם התוכן ריק, ‏`isEmpty` מחזיר `true`; אם התוכן אינו ריק, הוא מחזיר `false`.

לכן, אנחנו יכולים להשתמש בו כדי לקבוע אם שם המשתמש והסיסמה כוללים תוכן שהוזן.

### שימוש ב-isEmpty כדי לבדוק משתנים

אם המשתמש לא הזין שום מידע, אז:

```swift
user.isEmpty // true
password.isEmpty    // true
```

בשלב הזה אפשר לכתוב את התנאי כך:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

הקוד הזה אומר: אם `user` ריק, וגם `password` ריק, אז להדפיס:

```swift
Empty
```

כאן `&&` הוא אופרטור לוגי ומשמעותו "וגם".

כלומר, כל התנאי נכון רק כאשר התנאי שבצד שמאל נכון וגם התנאי שבצד ימין נכון.

לכן, הקוד הזה ירוץ רק כאשר גם שם המשתמש וגם הסיסמה ריקים.

## המשתמש מילא רק חלק

בהמשך, נבחן מצב נוסף: המשתמש מילא רק את שם המשתמש, או רק את הסיסמה.

לדוגמה:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

בשלב הזה, שם המשתמש אינו ריק, אבל הסיסמה ריקה.

אפשר להמשיך להשתמש ב-`isEmpty` כדי לבדוק:

### מצב שבו המשתמש מילא חשבון או סיסמה

אם המשתמש מילא רק את שם המשתמש או את הסיסמה, אנחנו צריכים לתת את ההודעה המתאימה לגבי מה שחסר.

לדוגמה, אם המשתמש מילא רק את שם המשתמש:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

הלוגיקה של הקוד הזה היא: אם שם המשתמש ריק, בקש להזין את שם המשתמש. אחרת, בדוק אם הסיסמה ריקה, ואם היא ריקה, בקש להזין את הסיסמה.

### המשתמש מילא את כל המידע

אם גם שם המשתמש וגם הסיסמה כבר הוזנו, אז `isEmpty` יחזיר `false` עבור שניהם.

בשלב הזה אפשר לכתוב זאת כך:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

כאן `!` מציין "שלילה".

לדוגמה:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

כלומר, `user.isEmpty` משמש כדי לקבוע "האם שם המשתמש ריק", ואילו `!user.isEmpty` משמש כדי לקבוע "האם שם המשתמש אינו ריק".

אותה לוגיקה חלה גם על הסיסמה.

לכן, המשמעות של הקוד הזה היא: שם המשתמש אינו ריק, וגם הסיסמה אינה ריקה.

כאשר שני התנאים האלה מתקיימים, הפלט הוא:

```swift
Success
```

## לוגיקת אימות מלאה

עכשיו נשלב את שלושת המצבים האלה ונכתוב אותם בתוך `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

אפשר להבין את סדר הביצוע של הקוד הזה כך:

בשלב הראשון, קודם כול בודקים:

```swift
if user.isEmpty && password.isEmpty
```

אם גם שם המשתמש וגם הסיסמה ריקים, יודפס מיד `Empty`.

אם שניהם אינם ריקים, נמשיך לבדוק את השורה הזו:

```swift
else if user.isEmpty || password.isEmpty
```

כאן `||` פירושו "או".

כלומר, כל עוד אחד מהתנאים מתקיים, כל התנאי מתקיים.

לכן, כל עוד שם המשתמש ריק, או שהסיסמה ריקה, בלוק הקוד של `else if` ירוץ.

לאחר הכניסה לבלוק הקוד, נבדוק עוד איזה שדה קלט בדיוק לא מולא:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

אם אף אחד משני התנאים הקודמים אינו נכון, פירוש הדבר הוא ששם המשתמש אינו ריק, וגם הסיסמה אינה ריקה.

אז התוכנית תיכנס ל-`else` האחרון:

```swift
print("Success")
```

כך השלמנו את לוגיקת האימות הבסיסית ביותר עבור קלט ההתחברות.

## אימות שם משתמש וסיסמה

הלוגיקה שלמעלה רק בודקת "האם הוזן תוכן או לא".

אבל באפליקציה אמיתית, עצם הזנת התוכן אינה מספיקה. בדרך כלל צריך גם לשלוח את שם המשתמש והסיסמה לשרת לצורך אימות.

אם השרת מאשר ששם המשתמש קיים ושהסיסמה נכונה, הוא יאפשר התחברות; אחרת, הוא יודיע שההתחברות נכשלה.

כדי לתרגל את התהליך הזה, אנחנו יכולים קודם להגדיר בקוד חשבון וסיסמה זמניים כדי לדמות "פרטי התחברות נכונים":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

כאשר גם שם המשתמש וגם הסיסמה אינם ריקים, נשווה אחר כך אם הם נכונים:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

כאן `==` פירושו "האם שווה ל-".

לדוגמה:

```swift
user == userID
```

המשמעות היא: האם שם המשתמש שהמשתמש הזין זהה לחלוטין לשם המשתמש הנכון שהגדרנו? בדיקת הסיסמה פועלת באותה לוגיקה.

לכן, כאשר שם המשתמש והסיסמה שהוזנו שווים לערכים שהוגדרו, יודפס `Success`; כל עוד אחד מהם אינו שווה, יודפס `Input error`.

כך השלמנו "אימות התחברות מדומה" פשוט.

למרות שזו עדיין לא פונקציית התחברות אמיתית שמחוברת לשרת, זה כבר מספיק כדי לעזור לנו להבין: **לאחר שמקישים על הכפתור, אפשר להריץ קוד שונה בהתאם לתנאים שונים**.

## סיכום

בשיעור הזה השלמנו תצוגת התחברות בסיסית, והתמקדנו במיוחד בלמידת "הלוגיקה של שיפוט תוכן הקלט לפי תנאים".

התוכן המרכזי של השיעור הזה הוא: שימוש ב-`isEmpty` כדי לקבוע אם מחרוזת ריקה, ושימוש בפקודות `if` יחד עם אופרטורים לוגיים כדי לטפל במצבים שונים.

ביניהם יש שני אופרטורים לוגיים חשובים מאוד:

- `&&`: פירושו "וגם", שני התנאים חייבים להתקיים
- `||`: פירושו "או", מספיק שתנאי אחד יתקיים

כאשר התנאים האלה מפיקים בסופו של דבר `true` או `false`, פקודת `if` תבצע קוד שונה לפי התוצאה.

באמצעות תצוגת ההתחברות הזאת, כבר התחלנו להיחשף לשיטת פיתוח שמשלבת "ממשק + נתונים + שיפוט לוגי".

## קוד מלא

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
