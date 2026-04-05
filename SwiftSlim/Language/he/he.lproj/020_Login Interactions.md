# אינטראקציות התחברות

בשיעור הקודם יצרנו תצוגת התחברות, ובעזרת כפתורים ולוגיקת בדיקה מימשנו אימות פשוט של התוכן שהוזן.

בשיעור הזה נמשיך להתבסס על הקוד מהשיעור הקודם, נלמד על שדה הזנת הסיסמה `SecureField`, על תיבת האזהרה `Alert`, וגם על איך לשלוט בתצוגה של מסכים שונים לפי משתנים.

דרך השיעור הזה תוכל להבין טוב יותר את זרימת האינטראקציה הבסיסית של תצוגת התחברות, וזו גם לוגיקה בסיסית שנעשה בה שימוש בהרבה אפליקציות.

## שדה הזנת סיסמה

בשיעור הקודם השתמשנו ב-`TextField` כדי להזין סיסמה.

אבל בממשק התחברות אמיתי, הסיסמה בדרך כלל לא מוצגת ישירות, אלא מופיעה כנקודות או עם אפקט הסתרה אחר, כדי להגן על הפרטיות של המשתמש.

ב-SwiftUI, הרכיב שמיועד במיוחד להזנת סיסמה הוא `SecureField`.

לדוגמה:

```swift
SecureField("Password", text: $password)
```

אופן הכתיבה שלו דומה מאוד ל-`TextField`, והוא גם דורש טקסט רמז ומשתנה מקושר.

אפשר להבין זאת בפשטות כך: `SecureField` הוא גם שדה קלט, רק שהוא מסתיר את התוכן שמוזן אליו.

אנחנו יכולים להחליף ישירות את ה-`TextField` ששימש קודם להזנת הסיסמה ב-`SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

כאשר המשתמש יזין סיסמה, תוכן הסיסמה לא יוצג ישירות על הממשק.

אפקט תצוגה:

![password](../../Resource/020_password.png)

עכשיו אנחנו יכולים להזין שם משתמש וסיסמה, ולאחר לחיצה על הכפתור לבדוק אם הקלט נכון.

### הצגת הודעות משוב

קודם לכן השתמשנו כל הזמן ב-`print` כדי להדפיס תוצאות.

התוכן של `print` מופיע רק בקונסול. מפתחים יכולים לראות אותו כאשר הם מריצים את התוכנית ב-Xcode, אבל משתמשים רגילים בטלפון לא יכולים לראות את ההודעות האלה.

כלומר, למרות שהתוכנית כבר ביצעה את הבדיקה, המשתמש עדיין לא יודע אם התוכן שהוזן נכון.

בשלב הזה, אנחנו צריכים דרך להציג הודעות ישירות על הממשק.

## תיבת אזהרה Alert

ב-SwiftUI אפשר להשתמש ב-`Alert` כדי להציג תיבת הודעה קופצת.

שימוש בסיסי:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

קטע הקוד הזה נראה מעט מורכב יותר מהפקדים הקודמים, אבל אפשר להבין אותו אם מפרקים אותו.

`Alert` כולל בעיקר את החלקים הבאים:

- `"Title"`: הכותרת של תיבת האזהרה
- `isPresented`: ערך בוליאני מקושר שמשמש לשליטה בשאלה האם תיבת האזהרה תוצג
- `Button(...)`: הכפתור שבתוך תיבת האזהרה
- `message:`: תוכן ההודעה שמוצג בתוך תיבת האזהרה

אפשר להבין זאת בפשטות כך: כאשר המשתנה המקושר הופך ל-`true`, המערכת תקפיץ את תיבת ההודעה הזו.

אפקט תצוגה:

![alert](../../Resource/020_alert3.png)

מבנה תואם:

![alert](../../Resource/020_alert.png)

### Alert הוא Modifier

כמו הרבה מה-Modifiers שלמדנו קודם, גם `Alert` מתווסף אחרי תצוגה מסוימת.

לדוגמה, אפשר להצמיד אותו אחרי כפתור:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

אפשר גם להצמיד אותו אחרי ה-`VStack` החיצוני:

```swift
VStack {
    // ...
}
.alert() {...}
```

כלומר, `Alert` אינו תצוגה עצמאית שמונחת בנפרד בממשק, אלא Modifier שמחובר לתצוגה מסוימת.

אפשר להבין זאת בפשטות כך: בדרך כלל כותבים `Alert` אחרי כפתור או אחרי הפריסה החיצונית, כדי להקפיץ הודעה כאשר תנאי מסוים מתקיים.

### הצגת Alert

אם אנחנו רוצים להציג `Alert`, צריך משתנה שינהל אותו.

לדוגמה:

```swift
@State private var showAlert = false
```

המשתנה הזה הוא מסוג `Bool`, כלומר יש לו רק שני ערכים: `true` או `false`.

לאחר מכן קושרים אותו ל-`isPresented` של `Alert`:

```swift
isPresented: $showAlert
```

כאשר `showAlert` הוא `false`, תיבת האזהרה לא תוצג; כאשר `showAlert` הוא `true`, תיבת האזהרה תקפוץ.

### הצגת תיבת האזהרה דרך כפתור

עכשיו נתחיל לממש את התרחיש הפשוט ביותר:

כאשר המשתמש לא מזין שום דבר בכלל ולוחץ ישירות על הכפתור `Sign in`, תקפוץ תיבת הודעה שתאמר לו: "עדיין לא הזנת שום תוכן".

קודם כל, צור משתנה שישלוט בתיבת ההודעה הזו:

```swift
@State private var showEmpty = false
```

לאחר מכן, הוסף `Alert` אחרי `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

בהמשך, בצע את הבדיקה בתוך קוד הלחיצה על הכפתור:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

אם גם `user` וגם `password` ריקים, נשנה את `showEmpty` ל-`true`.

ומכיוון ש-`Alert` קשור למשתנה הזה, כאשר הוא יהפוך ל-`true`, המערכת תציג אוטומטית את תיבת האזהרה.

אפקט תצוגה:

![alert](../../Resource/020_alert1.png)

כך, אחרי שהמשתמש ילחץ על הכפתור, הוא יוכל לראות מיד את ההודעה, בלי שהמפתח יצטרך לבדוק את הפלט של `print` בקונסול.

### שיפור הכפתור ותיבות האזהרה

קודם לכן טיפלנו רק במקרה שבו "שום דבר לא מולא".

אנחנו עדיין צריכים לטפל במצבים הבאים:

- שם המשתמש לא מולא
- הסיסמה לא מולאה
- גם שם המשתמש וגם הסיסמה מולאו, אבל הקלט שגוי

לכן אנחנו גם צריכים להכין הודעות מתאימות למצבים האלה.

ראשית, הוסף שלושה משתנים חדשים:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

לאחר מכן המשך להוסיף את ה-`Alert` המתאים אחרי הכפתור:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

בהמשך, השלם את לוגיקת ההחלטה בתוך הכפתור:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

כאשר הכפתור קובע שהמשתמש לא מילא שום מידע, השאיר שדה אחד ריק, או שנכשלה בדיקת הקלט, הוא ישנה את המשתנה הבוליאני המתאים ל-`true`, ואז ה-`Alert` המתאים יקפוץ.

כאן אני ממליץ לך לבדוק בעצמך כמה מצבים:

- לא למלא כלום
- למלא רק את שם המשתמש
- למלא רק את הסיסמה
- למלא גם שם משתמש וגם סיסמה, אבל עם תוכן שגוי
- למלא גם שם משתמש וגם סיסמה, והתוכן נכון

כך נוכל לוודא אם יש בעיה בקוד שלנו. זהו גם שלב "בדיקות" חשוב מאוד בפיתוח אפליקציות.

אם בתרחיש מסוים התוכנית מתנהגת לא נכון, זה אומר שייתכן שיש בעיה בלוגיקה, ושהופיע `Bug` בתוכנית.

מה שבפיתוח נהוג לקרוא לו `Bug` מתייחס לשגיאה, לפגם, או להתנהגות שאינה עומדת בציפיות.

## השלמת תצוגת ההתחברות

כל ה-`Alert` שדיברנו עליהם קודם עסקו באיך לתת למשתמש הודעה כאשר "הקלט שגוי".

כאשר המשתמש מזין את שם המשתמש והסיסמה הנכונים, בדרך כלל לא נקפיץ "תיבת אזהרה", אלא ניכנס ישירות לממשק שלאחר ההתחברות.

כאן מדובר בנקודת ידע חשובה מאוד: **הצגת תצוגות שונות לפי הערך של משתנה.**

לדוגמה:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

כאן אנחנו משתמשים בסוג `Bool` כדי לנהל את התצוגה:

- אם `login` הוא `true`, זה אומר שההתחברות כבר הצליחה, ומוצג התוכן שלאחר ההתחברות
- אם `login` הוא `false`, זה אומר שההתחברות לא הצליחה, וממשק ההתחברות ממשיך להיות מוצג.

למרות שפקודת `if` היא פקודת תנאי ב-Swift, בתוך ה-`body` של SwiftUI אפשר להשתמש בה כדי לשלוט בלוגיקת התצוגה של מסכים.

כלומר, SwiftUI יקבע איזו תצוגה אמורה להופיע כרגע לפי תוצאת התנאי.

אנחנו יכולים לשים את לוגיקת התצוגה הזו בתוך ה-`ContentView` הנוכחי:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

כאן הוספנו משתנה חדש, `login`, שמשמש כדי לציין האם המשתמש כבר התחבר בהצלחה.

לאחר מכן, שמנו מאחורי משפט ה-`else` את הקוד של תצוגת ההתחברות שכבר כתבנו קודם.

לוגיקת תצוגה:

- כאשר `login` הוא `false`, זה אומר שההתחברות עדיין לא הצליחה, ולכן תצוגת ההתחברות המקורית ממשיכה להופיע.
- כאשר `login` הוא `true`, זה אומר שההתחברות הצליחה, ובשלב הזה תצוגת ההתחברות כבר לא תוצג, ובמקומה יוצג `Login successful`.

כלומר, `ContentView` יציג תוכן שונה בהתאם לערך של `login`.

בהמשך, בוא נשנה את לוגיקת ההצלחה של ההתחברות בתוך הכפתור:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

כאשר גם שם המשתמש וגם הסיסמה שהוזנו על ידי המשתמש נכונים, נשנה את `login` ל-`true`.

ברגע שערך `login` משתנה, גם תוצאת בדיקת ה-`if` בתוך `ContentView` משתנה, והממשק יעבור מתצוגת ההתחברות המקורית ל-`Login successful`.

אפקט התצוגה הוא כך:

![view](../../Resource/020_view.png)

עכשיו באמת יישמנו את הידע של "הצגת תצוגות שונות לפי תנאים" בתוך דף ההתחברות הנוכחי הזה.

באפליקציות אמיתיות, בדרך כלל פועלים באותו אופן: מציגים תצוגות שונות לפי ערך מסוים.

לדוגמה, כאשר המשתמש לא מחובר, מציגים את דף ההתחברות; אחרי שהמשתמש מתחבר בהצלחה, מציגים ממשק אחר.

הרעיון המרכזי הוא: **לשלוט במה שמוצג בממשק דרך שינויים במשתנים.**

## סיכום

בשיעור הזה למדנו שלושה דברים חשובים:

1. להשתמש ב-`SecureField` כדי להזין סיסמה, כך שתוכן הסיסמה לא יוצג ישירות בממשק.
2. להשתמש ב-`Alert` כדי להציג הודעות למשתמש, במקום להציג אותן רק בקונסול.
3. להשתמש במשתנים ובתנאי `if` כדי לשלוט בתצוגה של מסכים שונים, ולממש מעבר בין הממשק שלפני ההתחברות לבין זה שאחריה.

באמצעות הידע הזה, אנחנו כבר מסוגלים להשלים תצוגת התחברות עם אפקטים בסיסיים של אינטראקציה, ולהבין טוב יותר את רעיון הפיתוח של SwiftUI: "המצב משתנה, והממשק מתעדכן".

## קוד מלא

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## ידע מורחב - Alert עם כמה כפתורים

בחלק הקודם של השיעור השתמשנו ב-`Alert` הבסיסי ביותר, שיש בו רק כפתור אחד והוא משמש בעיקר כדי להציג למשתמש הודעה.

למעשה, `Alert` יכול לכלול גם כמה כפתורים, כדי לאפשר למשתמש לבצע בחירות שונות.

לדוגמה:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

כאשר לוחצים על הכפתור, תופיע תיבת הודעה עם שלוש אפשרויות: `Ok`, `delete`, ו-`cancel`.

אפקט תצוגה:

![alert](../../Resource/020_alert2.png)

לחיצה על כפתורים שונים תבצע את הקוד המתאים.

### המאפיין role של Button

כאן תשים לב שה-`Button` שבתוך `Alert` שונה מעט מהתחביר של כפתור רגיל שלמדנו קודם:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

כאן נוסף פרמטר נוסף, `role`.

ב-SwiftUI, `role` משמש כדי לומר למערכת לאיזה סוג פעולה שייך הכפתור הזה.

כמה תפקידים נפוצים הם:

- `.cancel`: פעולת ביטול
- `.destructive`: פעולה מסוכנת, למשל מחיקה
- `nil`: פעולה רגילה

ערכי `role` שונים מביאים בדרך כלל גם להבדלים בסגנון החזותי של הממשק.

לדוגמה, פעולות מסוכנות מוצגות לעיתים קרובות בסגנון בולט יותר כדי להזכיר למשתמש ללחוץ בזהירות.

בנוסף, `role` מספק גם מידע סמנטי נוסף עבור הכפתור, מה שמקל על קוראי מסך (כמו VoiceOver במכשירי Apple) להסביר למשתמש את מטרת הכפתור.

לכן, במצבים מתאימים, הוספת `role` לכפתור היא הרגל טוב מאוד.
