# קופת חיסכון

בשיעור הזה נפתח פרויקט פשוט של “קופת חיסכון”. הפונקציונליות שלו פשוטה, אבל הוא כולל לוגיקת אינטראקציה מלאה, ולכן הוא מתאים מאוד למתחילים.

דרך הפרויקט הזה נלמד על `TextField` (שדה קלט), על `border`, וגם על data binding (`$`).

המטרה הסופית היא לממש פרויקט של “קופת חיסכון” שבו אפשר להזין סכום, ללחוץ על כפתור כדי לשמור, ולצבור את הסכום הכולל.

התוצאה:

![Piggy Bank](../../RESOURCE/014_view.png)

## הצגת הסכום הכולל

תחילה אנחנו צריכים להציג בתצוגה את הסכום הכולל של “קופת החיסכון”.

ב-`ContentView`, נצהיר על משתנה שישמור את הסכום הכולל:

```swift
@State private var amount = 0
```

לאחר מכן נשתמש ב-`Text` כדי להציג את הסכום:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

כאן `font` ו-`fontWeight` משמשים להגדרת גודל הגופן ועוביו.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

כאשר `amount` משתנה, גם הסכום הכולל שמוצג ב-`Text` יתרענן אוטומטית.

## הזנת סכום

“קופת החיסכון” לא רק מציגה את הסכום הכולל, אלא גם צריכה לאפשר למשתמש “להזין” את סכום ההפקדה או המשיכה. לשם כך צריך להשתמש ברכיב התצוגה `TextField` של SwiftUI.

### `TextField`

`TextField` הוא רכיב תצוגה ב-SwiftUI להזנת תוכן, ובדרך כלל משמש להזנה בשורה אחת.

`TextField` מספק בעיקר שני סוגי binding:

**1. binding למחרוזת (`String`)**

```swift
TextField("Placeholder", text: $text)
```

זה מתאים להזנת שמות, כותרות או טקסט.

**2. binding לטיפוס מספרי (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

זה מתאים להזנת גיל, שכר, סכום כסף וכדומה.

`format: .number` אומר ששדה הקלט יפרש ויציג את הערך לפי פורמט מספרי.

#### טקסט Placeholder

הפרמטר הראשון של `TextField` הוא placeholder, שנועד להנחות את המשתמש מה להקליד:

```swift
TextField("input your name", text: $text)
```

כאשר שדה הקלט ריק, תופיע בו טקסט אפור שמסביר מה צריך להזין.

![textfield](../../RESOURCE/014_textfield.png)

#### data binding

`TextField` לא שומר את הנתונים בעצמו, ולכן צריך משתנה מקושר שינהל אותם.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

התוכן שהמשתמש מזין נשמר ישירות בתוך המשתנה `text`, ו-`TextField` אחראי רק לממשק ההקלדה.

הסימן `$` מייצג binding:

```swift
$text
```

זה לא משתנה רגיל, אלא ערך מטיפוס `Binding`.

התפקיד שלו הוא ליצור קשר בין התצוגה לנתונים:

כאשר המשתמש מזין תוכן ב-`TextField`, הערך של `text` מתעדכן אוטומטית; וכאשר `text` משתנה, גם `TextField` מתעדכן בהתאם.

למשל:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

כאשר מקלידים בתוך `TextField`, ה-`Text` שמעליו יתעדכן בזמן אמת.

![textField](../../RESOURCE/014_textfield1.png)

### binding לטיפוס מספרי

כאשר צריך להזין מספר, צריך לקשור אותו למשתנה מהטיפוס המתאים:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

כאשר המשתמש מזין סכום, `TextField` יפרש את הקלט ויעדכן אוטומטית את הערך של `number`.

## הוספת שדה קלט

אחרי שהבנו את השימוש הבסיסי ב-`TextField`, נשלב אותו בפרויקט “קופת החיסכון”.

בקופת החיסכון צריך להזין “סכום”, ולכן נשתמש ב-binding לטיפוס מספרי (`Int/Double`) ונוסיף משתנה חדש בשם `number` שישמור את הערך שהמשתמש מזין:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

כעת `TextField` מציג כברירת מחדל את הערך של `number` (שכברירת מחדל הוא `0`).

כאשר מוחקים את התוכן משדה הקלט, יופיע ה-placeholder `"Amount"`.

זה שוב ממחיש ש-`TextField` מציג את הערך של המשתנה המקושר אליו, ולא שומר תוכן בעצמו.

### בעיית הגודל של שדה הקלט

בתצוגה הנוכחית, אפשר לראות של-`TextField` אין מסגרת, הוא מציג רק `0`, ונראה שהתוכן מיושר לשמאל.

כך זה נראה:

![textfield](../../RESOURCE/014_textfield2.png)

זה קורה משום שברירת המחדל של `TextField` היא לתפוס את כל הרוחב של תצוגת האב.

אפשר להוכיח זאת על ידי הוספת צבע רקע:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

התוצאה:

![textfield](../../RESOURCE/014_textfield3.png)

אפשר לראות ש-`TextField` אכן ממלא את כל רוחב השורה.

### הגדרת רוחב קבוע

אם רוצים ששדה הקלט יהיה קומפקטי יותר, אפשר להשתמש ב-`frame` כדי להגביל את הרוחב שלו:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

התוצאה:

![textfield](../../RESOURCE/014_textfield4.png)

### הוספת מסגרת ושוליים פנימיים

מכיוון של-`TextField` אין מסגרת כברירת מחדל, אפשר להוסיף לו סגנון באופן ידני:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

עכשיו שדה הקלט נראה הרבה יותר כמו “שדה קלט סטנדרטי”.

![textfield](../../RESOURCE/014_textfield5.png)

## מסגרת

ב-SwiftUI, `border` משמש להוספת מסגרת לתצוגה.

שימוש בסיסי:

```swift
border(Color.black, width: 1)
```

כאן `Color.black` הוא צבע המסגרת, ו-`width` הוא העובי שלה.

ב-`TextField` נשתמש כך:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

המשמעות היא ששדה הקלט יקבל מסגרת שחורה בעובי של `1 pt`.

אפשר גם לנסות צבעים אחרים, כמו `Color.blue` או `Color.green`, או להגדיל את העובי ל-`width: 2`.

## כפתור ההפקדה

כעת יש לנו משתנה `amount` להצגת הסכום הכולל, `TextField` להזנת סכום, ומשתנה `number` שמקושר לשדה הקלט.

הקוד הנוכחי הוא:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### הוספת כפתור

כעת צריך להוסיף כפתור שיפעיל את פעולת השמירה של הכסף.

```swift
Button("Save") {
    
}
```

### מימוש לוגיקת ההפקדה

אנחנו רוצים לממש מצב שבו המשתמש מזין סכום, לוחץ על הכפתור, והסכום מתווסף אוטומטית לסכום הכולל.

```swift
Button("Save") {
    amount += number
}
```

כאן משתמשים באופרטור השמה מורכב, כדי לצבור את הסכום שהמשתמש הזין (`number`) אל תוך הסכום הכולל (`amount`).

### איפוס סכום הקלט

כעת יש בעיה: בכל פעם שלוחצים על הכפתור, שדה הקלט לא מתנקה.

אם המשתמש מזין `10` ולוחץ על שמירה, בשדה הקלט עדיין יישאר `10`, וזה ישפיע על ההפקדה הבאה.

הסיבה היא ש-`TextField` קשור ל-`number`. כאשר לוחצים על הכפתור, שינינו רק את `amount`, אבל `number` עצמו לא השתנה, ולכן שדה הקלט ממשיך להציג את הערך הישן.

לכן צריך להוסיף לוגיקה של ניקוי: לאחר הלחיצה נוסיף קודם את הסכום, ואז נאפס את הסכום שהוזן:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

כעת, כאשר המשתמש מזין סכום ולוחץ על הכפתור, הסכום מתווסף לסכום הכולל. לאחר מכן `number` חוזר ל-`0`, כדי להכין את שדה הקלט להזנה הבאה.

כך השלמנו את כל לוגיקת ההפקדה של “קופת החיסכון”.

## שיפור התצוגה

אחרי שהפונקציונליות עובדת, אפשר לבצע כמה שיפורים פשוטים למראה: להוסיף תמונת רקע וסגנון לכפתור.

הוספת סגנון לכפתור:

```swift
.buttonStyle(.borderedProminent)
```

הוספת תמונת רקע:

```swift
.background {
    Image("1")
}
```

כעת השלמנו את כל עבודת הפיתוח של “קופת החיסכון”.

## הקוד המלא

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

התוצאה:

![Piggy Bank](../../RESOURCE/014_view.png)

כעת אפשר לנסות להפקיד `100` או אפילו יותר, כדי לבדוק אם יש בעיה בלוגיקה של קופת החיסכון.

אפשר גם להריץ את הפרויקט על סימולטור או על מכשיר פיזי ולחוות את האפליקציה שפיתחנו.

### פלט דיבוג

כדי לוודא שהלוגיקה אכן נכונה, אפשר להוסיף גם קוד דיבוג בתוך הכפתור, וכך לאמת שהסכום שהוזן אכן נכון:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

בכל פעם שמפקידים ולוחצים על הכפתור, אפשר לראות את פלט הדיבוג המתאים וכך לבדוק אם יש בעיה בלוגיקה של הקוד.

```
---Saving---
amount:11
number:0
```
