# כרטיס קורס

שיעור זה הוא שיעור חזרה של שלב. נבנה בו “כרטיס קורס”.

באמצעות התרגול הזה נוכל לחזור על `Text`, ‏`Image`, ‏`VStack`, ‏`HStack`, ‏`Spacer()`, ‏`.padding()`, ‏`.background()`, ‏`.cornerRadius()` ועוד נושאים שלמדנו קודם, וללמוד כיצד לשלב כמה תצוגות קטנות למודול תצוגה שלם.

תוצאה של כרטיס הקורס:

![view](../../../Resource/026_view.png)

כרטיס הקורס הזה כולל בעיקר כמה חלקים:

- רמת הקורס: `מתחיל`
- תוכן הקורס: `20+ שיעורים`
- כותרת הקורס: `מדריך SwiftUI למתחילים`
- תיאור הקורס
- כפתור: `התחלת הלמידה`
- רקע הקורס: סמל Swift ורקע בצבע אינדיגו

אפשר להשלים את התצוגה הזו בתוך `ContentView`.

## האזור העליון

ראשית, ניצור את האזור העליון של כרטיס הקורס.

![view](../../../Resource/026_view1.png)

בצד שמאל של האזור העליון מוצגת רמת הקורס, ובצד ימין מוצג תוכן הקורס.

מכיוון ששני התכנים האלה מסודרים אופקית, אפשר להשתמש ב־`HStack`.

```swift
var topView: some View {
    HStack {
        Text("מתחיל")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ שיעורים")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

כאן פיצלנו את האזור העליון למאפיין מחושב:

```swift
var topView: some View
```

היתרון בכך הוא שאפשר לשמור על `body` ברור יותר.

האזור העליון משתמש בעיקר בתכנים הבאים:

- `HStack`: מסדר שני טקסטים בצורה אופקית.
- `Text`: מציג תוכן טקסטואלי.
- `Spacer()`: דוחף את הטקסט השמאלי שמאלה ואת הטקסט הימני ימינה.
- `.font(.footnote)`: מגדיר סגנון טקסט קטן יותר.
- `.fontWeight(.bold)`: מגדיר את הטקסט כמודגש.
- `.foregroundStyle(Color.white)`: מגדיר את צבע החזית ללבן.
- `.padding(.vertical, 10)`: מגדיר ריווח פנימי אנכי.
- `.padding(.horizontal, 16)`: מגדיר ריווח פנימי אופקי.
- `.background(Color.white.opacity(0.15))`: מגדיר רקע לבן חצי שקוף.
- `.cornerRadius(20)`: מגדיר פינות מעוגלות.

כאן `מתחיל` משתמש ב־`.padding()` בשני כיוונים:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

כך אפשר לתת לטקסט מרווח גם למעלה ולמטה וגם משמאל ומימין, והוא נראה יותר כמו תגית.

`Color.white.opacity(0.15)` מציין לבן עם אטימות של `15%`, כלומר לבן עדין מאוד.

### הוספת רקע לכרטיס

קודם יצרנו את `topView`, אבל עצם יצירת התצוגה אינה גורמת לה להופיע אוטומטית.

ב־SwiftUI, התוכן שמוצג בפועל בממשק צריך להיכתב בתוך `body`.

לכן אפשר קודם להכניס את `topView` לתוך `body` כדי להציג אותו:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

כעת נראה שהאזור העליון כבר מוצג:

![view](../../../Resource/026_view2.png)

עם זאת, מכיוון שהטקסט ב־`topView` הוא לבן והרקע ברירת המחדל גם בהיר, במצב בהיר ייתכן שיהיה קשה לראות אותו.

לכן אפשר להוסיף מבחוץ `VStack`, ואז להגדיר לכל האזור ריווח פנימי, צבע רקע ופינות מעוגלות:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view3.png)

ה־`VStack` כאן מכיל כרגע רק `topView`, ולכן נראה כאילו הוא אינו הכרחי.

אבל בהמשך נוסיף גם את כותרת הקורס, תיאור הקורס ואזור הכפתור. כל אלה הם תכנים שמסודרים אנכית, ולכן שימוש מוקדם ב־`VStack` יקל על שילוב התצוגות בהמשך.

כאן יש שני שימושים ב־`.padding()`, והתפקידים שלהם שונים.

ה־`.padding(20)` הראשון נכתב לפני `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

הוא שולט במרווח הפנימי של הכרטיס, כלומר במרחק בין התוכן לבין שולי הרקע.

ה־`.padding(30)` השני נכתב אחרי `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

הוא שולט במרווח החיצוני של הכרטיס, כלומר במרחק בין כל הכרטיס לבין שולי המסך.

![view](../../../Resource/026_view4.png)

לכן גם כאשר משתמשים באותו `.padding()`, המיקום שבו כותבים אותו משפיע על התוצאה.

## אזור התוכן

לאחר מכן ניצור את אזור התוכן של כרטיס הקורס.

תוצאת התצוגה:

![view](../../../Resource/026_view5.png)

אזור התוכן כולל את כותרת הקורס ואת תיאור הקורס. הם מסודרים אחד מתחת לשני, ולכן משתמשים ב־`VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("מדריך SwiftUI למתחילים")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("התחילו מאפס עם SwiftUI ולמדו באופן שיטתי את פיתוח ממשקי המשתמש ההצהרתי של Apple. באמצעות הסברים ברורים ודוגמאות מעשיות, תרכשו בהדרגה שליטה בפריסה, באינטראקציה ובניהול מצב, כדי לבנות ממשקי אפליקציה יפים ושימושיים.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view6.png)

ב־`VStack` כאן משתמשים בשני פרמטרים:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` מציין שהתצוגות שבתוך `VStack` יהיו מיושרות לצד המוביל.

`spacing: 10` מציין שבין התצוגות שבתוך `VStack` יישמר מרווח של `10 pt`.

לכן כותרת הקורס ותיאור הקורס יתחילו מאותו צד, וביניהם יישמר מרחק מסוים.

תיאור הקורס ארוך יחסית. אם מציגים את כולו, הכרטיס יהפוך לגבוה מאוד, ולכן כאן משתמשים ב־`.lineLimit()` כדי להגביל את מספר השורות:

```swift
.lineLimit(3)
```

המשמעות היא להציג לכל היותר `3` שורות. כאשר התוכן חורג ממספר השורות המוגבל, החלק העודף יקוצר.

### יישור התצוגה לצד המוביל

יש כאן עוד נקודה שכדאי לשים לב אליה.

`VStack(alignment: .leading)` שולט רק באופן היישור של התצוגות הפנימיות בתוך `VStack`; הוא אינו שולט ישירות במיקום של `VStack` עצמו בתוך המכל החיצוני.

לדוגמה, אם תיאור הקורס קצר יחסית:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("מדריך SwiftUI למתחילים")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("רק קצת תוכן.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view7.png)

אפשר לראות שכותרת הקורס ותיאור הקורס אמנם מיושרים לצד המוביל בתוך `VStack`, אבל כל ה־`VStack` עצמו אינו נצמד לצד השמאלי ביותר של הכרטיס.

הסיבה היא שכאשר התוכן קצר יחסית, גם הרוחב של `VStack` יהיה צר יחסית. בעת הפריסה, המכל החיצוני עשוי למקם את ה־`VStack` הצר יותר במרכז.

אפשר להבין זאת כך: `VStack(alignment: .leading)` אחראי על יישור פנימי לצד המוביל.
אבל הוא אינו אחראי לדחוף את כל אזור התוכן אל הצד השמאלי ביותר.

אם רוצים שכל אזור התוכן באמת ייצמד לצד, אפשר לעטוף אותו מבחוץ ב־`HStack` ולהוסיף `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("מדריך SwiftUI למתחילים")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("רק קצת תוכן.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view8.png)

ה־`HStack` כאן הוא פריסה אופקית.

`Spacer()` יתפוס את השטח הפנוי בצד ימין, וכך ידחוף את ה־`VStack` שבצד שמאל אל הצד השמאלי ביותר.

לכן אפשר להשתמש ב־`HStack + Spacer()` כדי לשלוט במיקום של כל אזור התוכן.

בכרטיס הקורס בפועל, תיאור הקורס ארוך יחסית ובדרך כלל יתפוס רוחב רב יותר, ולכן הבעיה הזו לא בהכרח תהיה בולטת. אבל חשוב להבין את ההבדל הזה, כי כאשר יוצרים בהמשך פריסות עם טקסט קצר, נתקלים לעיתים קרובות במצבים דומים.

### שליטה במרווח בין התצוגות הפנימיות

קודם כתבנו בתוך `VStack` את `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` משמש לשליטה במרווח בין התצוגות הפנימיות.

אם לא מגדירים `spacing`, גם ל־`VStack` יהיה מרווח ברירת מחדל, אבל המרווח הזה לא תמיד מתאים לתוצאה הרצויה.

כאן, אם כותרת הקורס ותיאור הקורס קרובים מדי זה לזה, הם ייראו צפופים, ולכן משתמשים ב־:

```swift
spacing: 10
```

כדי להשאיר ביניהם מעט מרווח.

תוצאת התצוגה:

![view](../../../Resource/026_view9.png)

באופן דומה, גם האזור העליון ואזור התוכן מסודרים אחד מתחת לשני, וגם ביניהם אפשר להשתמש ב־`spacing` כדי לשלוט במרחק.

כעת נכניס את `topView` ואת `contentView` לתוך `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view10.png)

כאן `VStack(spacing: 20)` שולט במרחק בין `topView` לבין `contentView`.

כלומר:

```swift
VStack(alignment: .leading, spacing: 10)
```

שולט במרחק בין כותרת הקורס לבין תיאור הקורס.

```swift
VStack(spacing: 20)
```

שולט במרחק בין האזור העליון לבין אזור התוכן.

שניהם משתמשים ב־`spacing`, אבל הם פועלים על `VStack` שונים, ולכן גם טווח ההשפעה שלהם שונה.

כך מסתיימת יצירת תצוגת אזור התוכן.

## אזור הכפתור

לאחר מכן ניצור את אזור הכפתור התחתון.

תוצאת התצוגה:

![view](../../../Resource/026_view11.png)

אזור הכפתור מורכב בעיקר מסמל הפעלה ומקטע טקסט.

אפשר להשתמש ב־`Image` כדי להציג את סמל ההפעלה, וב־`Text` כדי להציג את טקסט הכפתור.

כאן ניצור תחילה מראה של כפתור:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("לחיצה על הכפתור")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("התחלת הלמידה")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view12.png)

כאן משתמשים בשני `HStack`:

ה־`HStack` הפנימי משמש לסידור הסמל והטקסט בצורה אופקית:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("התחלת הלמידה")
}
```

ה־`HStack` החיצוני, יחד עם `Spacer()`, משמש להצגת מראה הכפתור בצד שמאל:

```swift
HStack {
    ...
    Spacer()
}
```

כאשר לוחצים על הכפתור, יודפס במסוף `לחיצה על הכפתור`.

## השלמת הכרטיס הבסיסי

כעת נשלב את האזור העליון, אזור התוכן ואזור הכפתור:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

תוצאת התצוגה:

![view](../../../Resource/026_view13.png)

עד כאן הושלם כרטיס קורס בסיסי.

## רקע סמל Swift

לבסוף נוסיף לכרטיס רקע חצי שקוף של סמל Swift.

![view](../../../Resource/026_view.png)

קודם השתמשנו ב־`Color.indigo` כצבע רקע. למעשה, מלבד צבע, `.background()` יכול להוסיף גם תצוגה שלמה.

לכן אפשר קודם ליצור תצוגת רקע ייעודית:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

בתצוגת הרקע הזו אנחנו משתמשים ב־`VStack`, ‏`HStack` ו־`Spacer()` כדי לדחוף את סמל Swift אל הפינה הימנית התחתונה.

מכיוון שסמל Swift משמש רק כקישוט ברקע, כאן משתמשים בלבן חצי שקוף:

```swift
Color.white.opacity(0.15)
```

כך הסמל לא יהיה בולט מדי ולא ישפיע על הטקסט שמעליו.

לאחר מכן נוסיף את `backgroundView` לכרטיס:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

התוצאה:

![view](../../../Resource/026_view14.png)

כאן משתמשים פעמיים ברצף ב־`.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

ה־`.background()` הראשון משמש להוספת רקע סמל Swift.
ה־`.background()` השני משמש להוספת רקע בצבע אינדיגו.

כך סמל Swift יוצג מעל הרקע בצבע אינדיגו, ויופיע כחלק מרקע הכרטיס.

מכאן אפשר לראות ש־`.background()` יכול להוסיף לא רק צבע, אלא גם תצוגה מותאמת אישית. אפשר גם לשלב כמה `.background()` יחד כדי ליצור אפקטי רקע עשירים יותר.

עד כאן הושלם כרטיס קורס מלא.

## סיכום

בשיעור הזה חזרנו, באמצעות כרטיס קורס, על שיטות פריסה בסיסיות ונפוצות ב־SwiftUI.

השתמשנו ב־`Text` כדי להציג טקסט, ב־`Image` כדי להציג סמל מערכת, וב־`VStack`, ‏`HStack` ו־`Spacer()` כדי לשלוט בסידור התצוגות.

למדנו את `.lineLimit()`, שיכול להגביל את מספר השורות המרבי של טקסט. כאשר התוכן חורג מהמגבלה, החלק העודף יקוצר.

במקביל חזרנו גם על `.padding()`, ‏`.background()`, ‏`.cornerRadius()`, ‏`.foregroundStyle()` ועוד משנים נפוצים.

לאחר השלמת השיעור הזה, אנחנו כבר יכולים לשלב כמה תצוגות קטנות למודול כרטיס שלם.

זו גם דרך חשיבה נפוצה מאוד בפיתוח SwiftUI: קודם מפרקים לתצוגות קטנות, ואז משלבים אותן לממשק שלם.

## הקוד המלא

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("מתחיל")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ שיעורים")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("מדריך SwiftUI למתחילים")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("התחילו מאפס עם SwiftUI ולמדו באופן שיטתי את פיתוח ממשקי המשתמש ההצהרתי של Apple. באמצעות הסברים ברורים ודוגמאות מעשיות, תרכשו בהדרגה שליטה בפריסה, באינטראקציה ובניהול מצב, כדי לבנות ממשקי אפליקציה יפים ושימושיים.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("לחיצה על הכפתור")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("התחלת הלמידה")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
