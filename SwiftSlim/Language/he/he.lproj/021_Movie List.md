# רשימת סרטים

בשיעור הזה ניצור רשימת סרטים.

![movie](../../Resource/021_movie.png)

ברשימה יוצגו הפוסטר, השם, הבמאי והדירוג של כל סרט.

בדוגמה הזו נלמד נקודת ידע חשובה מאוד: מבנה ה־`struct`. הוא יכול לעזור לנו לשלב כמה פרטי מידע של סרט אחד לכדי מכלול אחד. בנוסף לכך, ניחשף גם ל־`UUID()`‎, ל־`ForEach`‎, לקו ההפרדה `Divider`, וכן לאופן שבו משתמשים באובייקטים מותאמים אישית כדי לנהל נתונים.

הידע הזה נפוץ מאוד בהמשך הפיתוח עם SwiftUI. אחרי שתסיים את השיעור הזה, לא רק שתוכל ליצור רשימת סרטים, אלא גם תתחיל להבין "איך מציגים קבוצת נתונים כממשק".

## סרט יחיד

אנחנו יכולים להתחיל קודם מהממשק של סרט יחיד.

![movie](../../Resource/021_movie1.png)

הפריסה של הממשק הזה מורכבת בעיקר משני חלקים: בצד שמאל נמצא פוסטר הסרט, ובצד ימין נמצאת הצגת הסרט.

### פוסטר הסרט

בצד שמאל מוצג פוסטר הסרט, ואנחנו יכולים להשתמש ב־`Image` כדי להציג את התמונה.

לדוגמה:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

הקוד הזה אומר שמוצגת תמונה בשם `"The Shawshank Redemption"`.

כאן צריך לשים לב ששם התמונה חייב באמת להתקיים בתיקיית המשאבים `Assets`, אחרת הממשק לא יוכל להציג את התמונה הזו בצורה נכונה.

![movie](../../Resource/021_movie2.png)

התפקידים של המודיפיירים האלה הם בהתאמה:

- `resizable()` אומר שניתן לשנות את גודל התמונה.
- `scaledToFit()` אומר שבזמן שינוי הגודל נשמר היחס המקורי, כדי למנוע מתיחה ועיוות של התמונה.
- `frame(height: 180)` אומר שגובה התמונה מוגדר ל־180.
- `cornerRadius(10)` אומר שמוגדרת לתמונה פינת עיגול ברדיוס 10.

כך אפשר לקבל תמונת פוסטר של סרט בגודל מתאים ועם פינות מעוגלות.

![movie](../../Resource/021_movie3.png)

### הצגת הסרט

בצד ימין מוצגת הצגת הסרט, כולל שם הסרט, הבמאי והדירוג.

![movie](../../Resource/021_movie4.png)

אנחנו יכולים להשתמש ב־`Text` כדי להציג את החלק הזה:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

בקוד הזה, `.font` מייצג את גודל הגופן, ו־`.fontWeight` מייצג את עובי הגופן.

כדי ליצור מרווח ברור יותר בין "שם הסרט", "מידע על הבמאי" ו"מידע על הדירוג", כאן משתמשים ב־`VStack` בשכבה החיצונית ביותר, ומגדירים:

```swift
spacing: 10
```

כלומר, המרווח בין כל קבוצת תוכן בתוך ה־`VStack` הזה הוא 10.

הסיבה לכך שהבמאי והדירוג עטופים כל אחד שוב ב־`VStack` משלו היא ששניהם שייכים למבנה של "כותרת + תוכן". לכן השכבות של הממשק יהיו ברורות יותר, וגם יהיה לנו נוח יותר להמשיך לכוונן את הסגנון בהמשך.

בנוסף, `VStack` מיושר למרכז כברירת מחדל. כדי ליישר את כל הטקסט לשמאל, נגדיר:

```swift
alignment: .leading
```

כך חלק הצגת הסרט ייראה מסודר יותר.

### קו הפרדה

עכשיו, למרות שהתוכן בהצגת הסרט נפתח באמצעות `spacing`, הגבול בין התכנים השונים עדיין לא מספיק ברור.

בשלב הזה נוכל להוסיף קו הפרדה:

```swift
Divider()
```

לדוגמה:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

כך חלק הצגת הסרט יקבל אפקט הפרדה ברור יותר.

![movie](../../Resource/021_movie4.png)

`Divider` הוא View פשוט מאוד אך נפוץ מאוד, שתפקידו להפריד בין תכנים שונים.

בתוך `VStack`, ‏`Divider()` מוצג כקו אופקי.

בתוך `HStack`, ‏`Divider()` מוצג כקו אנכי.

בנוסף, אפשר גם לשנות את הסגנון של `Divider` באמצעות `.frame`, `.background`, `.padding` ועוד.

לדוגמה:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

זה ייצור קו הפרדה כחול, בעובי 2, עם ריווח פנימי אופקי משני הצדדים.

![divider](../../Resource/021_divider.png)

### ממשק מלא

לבסוף, נוכל להשתמש ב־`HStack` כדי לסדר את פוסטר הסרט ואת הצגת הסרט זה לצד זה.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

כאן, `HStack(spacing: 20)` פירושו להשאיר רווח של 20 בין שני החלקים, הימני והשמאלי.

חשוב לשים לב ש־`Divider()`‎, כמו `TextField` ו־`Slider` שראינו קודם, מנסה כברירת מחדל לתפוס כמה שיותר מקום פנוי.

לכן אנחנו מגדירים רוחב קבוע ל־`VStack` החיצוני של חלק ההצגה בצד ימין:

```swift
.frame(width: 200)
```

כך אפשר לשמור על רוחב זהה של קו ההפרדה ושל אזור הטקסט, והמראה הכללי יהיה מסודר יותר.

עד כאן השלמנו את ממשק התצוגה של "סרט יחיד".

![movie](../../Resource/021_movie1.png)

## שמירת סרטים במערך

אם אנחנו רוצים להציג כמה סרטים בזה אחר זה באותו סגנון, זה אומר שכל סרט יצטרך קוד דומה שנכתב שוב.

לדוגמה:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

למרות שקוד כזה יכול להשיג את האפקט, הקוד ילך ויתארך, וגם יהיה מאוד קשה לתחזק אותו.

למשל, אם צריך לשנות את המרווח של כל הסרטים מ־`20` ל־`15`, או לשנות את הרוחב בצד ימין מ־`200` ל־
`220`, יהיה צורך לשנות ידנית כל קטע קוד שחוזר על עצמו.

ברור שזו לא שיטה יעילה.

כבר למדנו קודם על מערכים, וגם למדנו להשתמש ב־`ForEach` כדי להציג Views שוב ושוב על סמך מערך.

לדוגמה:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

השיטה הזו מתאימה מאוד למקרים שבהם יש "רק נתון אחד", כמו קבוצה של שמות תמונות.

אבל סרט אחד לא מכיל רק ערך אחד. הוא כולל לפחות:

1. פוסטר הסרט
2. שם הסרט
3. הבמאי
4. הדירוג

כלומר, סרט הוא למעשה קבוצה של נתונים קשורים, ולא רק מחרוזת בודדת.

אם נשתמש רק במערכים, נוכל לשמור את המידע הזה רק בנפרד:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

בעת ההצגה, נצטרך להסתמך על אותו אינדקס כדי להתאים ביניהם אחד לאחד:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

הבעיה בגישה הזו היא שעלות התחזוקה גבוהה מאוד.

מכיוון שהנתונים של סרט אחד מתפזרים על פני כמה מערכים, מספיק שלמערך אחד יהיה פריט אחד יותר, פריט אחד פחות או סדר שונה, ותוצאת התצוגה תהיה שגויה.

במיוחד כשמוסיפים או מוחקים סרטים, צריך לעדכן כמה מערכים בו־זמנית, וקל מאוד לפספס משהו.

אז איך נוכל לשלב מידע כמו "שם הסרט, הבמאי והדירוג" לכדי מכלול אחד?

לשם כך צריך להשתמש ב־`struct`.

## הגדרת מבנה struct

ב־Swift, ‏`struct` הוא "מבנה".

אפשר להבין אותו כ"סוג נתונים מותאם אישית" שיכול לשלב כמה שדות קשורים ביחד ולהפוך אותם למכלול אחד.

שימוש בסיסי:

```swift
struct StructName {
	let name: String
}
```

בקוד הזה, `struct` היא מילת המפתח שמציינת שאנחנו מגדירים מבנה. `StructName` הוא השם של המבנה.

התוכן שבין הסוגריים המסולסלים הוא השדות שהמבנה הזה מכיל, וכל שדה חייב לכלול בבירור שם וסוג.

בדרך כלל, שם של `struct` יתחיל באות גדולה, כמו `Movie`, ‏`Student` או `UserInfo`. זוהי מוסכמת שמות נפוצה ב־Swift.

אפשר להבין את `struct` בפשטות כקופסה ריקה, שבה כל שדה הוא כמו מקום ריק שמור בתוך הקופסה.

כאשר המקומות האלו עדיין לא מולאו, זו רק קופסה ריקה. רק אחרי שכל השדות מתמלאים בערכים מתאימים היא הופכת לקופסת מתנה שלמה.

### מופע של struct

קודם רק הגדרנו את המבנה עצמו, וזה שקול להכנת הצורה של קופסת האריזה.

אנחנו עדיין צריכים למלא בו תוכן ממשי כדי לקבל "מופע" אמיתי שאפשר להשתמש בו.

כשיוצרים מופע, בדרך כלל מוסיפים `()` אחרי שם המבנה:

```swift
StructName(...)
```

מה שממלאים בתוך הסוגריים הוא תוכן השדות שהמבנה הזה דורש.

לדוגמה:

```swift
StructName(name: "Fang Junyu")
```

הקוד הזה אומר: לפי הפורמט של המבנה `StructName`, ליצור מופע חדש ולהקצות לשדה `name` את הערך `"Fang Junyu"`.

כאשר אנחנו ממלאים את כל תוכן השדות הנדרש, זה כמו למלא את הקופסה הזו עד הסוף.

בשלב הזה אנחנו מקבלים מופע שלם של המבנה.

### גישה למאפייני struct

אחרי שיצרנו מופע, אפשר להשתמש ב"תחביר נקודה" כדי לגשת למאפיינים הפנימיים שלו.

כתיבה בסיסית:

```swift
instance.propertyName
```

לדוגמה:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

כאן `st` הוא מופע של מבנה, ו־`st.name` אומר לקרוא את הערך `name` מתוך המופע הזה.

אפשר להבין את דרך הקריאה הזו כך: כשאנחנו כותבים `st.name`, זה כמו לקרוא את התוכן שמאוחסן במקום מסוים בתוך הקופסה הזו.

צורת הכתיבה הזו תהיה נפוצה מאוד בממשקי SwiftUI בהמשך.

לדוגמה, אם יש לנו מבנה תלמיד שמכיל שם, גיל וכיתה, אז בעת ההצגה בממשק נוכל לקרוא בנפרד:

```swift
student.name
student.age
student.className
```

היתרון בכך הוא שהנתונים נעשים ברורים יותר וגם נוחים יותר לניהול.

### מיקום ה־struct

למתחילים, בדרך כלל אפשר לכתוב את המבנה מחוץ ל־`ContentView`.

לדוגמה:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

כך המבנה יהיה ברור יותר ויהיה גם קל יותר לקריאה.

תוכל לגלות שגם `ContentView` עצמו הוא בעצם `struct`.

### מבנה Movie

עם הבסיס הקודם, אנחנו כבר יכולים להגדיר מבנה של סרט:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

זהו מבנה בשם `Movie`, שמורכב משלושה שדות: `name`, ‏`director` ו־`rating`, שמייצגים בהתאמה את שם הסרט, הבמאי והדירוג.

כך, המידע שקשור לסרט אחד כבר לא צריך להיות מפורק לכמה מערכים, אלא אפשר לשלב אותו ישירות לכדי מכלול אחד.

לדוגמה, נוכל ליצור מופע כזה של סרט:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

המופע הזה מייצג "נתונים מלאים של סרט אחד".

### שמירת מבנים במערך

אמרנו קודם שמערך יכול לשמור רק סוג אחד.

עכשיו כבר יש לנו את המבנה `Movie`, ולכן המערך יכול לשמור כמה `Movie`.

```swift
let lists: [Movie] = []
```

לדוגמה:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

במערך `lists` הזה לא נשמרות מחרוזות, אלא כמה מופעים של `Movie`.

כלומר, כל איבר במערך הוא סרט שלם אחד.

כך, כשנצטרך להציג את רשימת הסרטים, נוכל להשתמש ב־`ForEach` כדי לקרוא כל סרט בזה אחר זה.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

כאן `movie in` אומר שבכל חזרה של הלולאה, יילקח סרט אחד מהמערך ויקבל זמנית את השם `movie`.

ואז נוכל להשתמש ב־:

```swift
movie.name
movie.director
movie.rating
```

כדי לקרוא בהתאמה את שם הסרט, הבמאי והדירוג של הסרט הזה, ולהציג אותם בממשק.

## שגיאת ForEach

עד כאן כבר השלמנו את הכתיבה הבסיסית של מערך הסרטים ושל `ForEach`.

אבל אם מריצים ישירות את הקוד הבא:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

תופיע שגיאה:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

המשמעות של השגיאה הזו היא שכאשר כותבים `id: \.self`, SwiftUI צריך להתייחס לכל אחד מהאיברים במערך עצמו כאל "מזהה ייחודי" כדי להבדיל ביניהם.

צורת הכתיבה הזו מתאימה לסוגים פשוטים כמו `String` ו־`Int`, משום שקל יותר להבדיל ביניהם.

אבל `Movie` הוא מבנה מותאם אישית שהגדרנו בעצמנו, ו־`ForEach` לא יודע איך להשתמש במבנה עצמו בתור מזהה ייחודי, ולכן מתקבלת השגיאה.

הדרך הנפוצה ביותר לפתור את הבעיה הזו היא לגרום ל־`Movie` להתאים לפרוטוקול `Identifiable`.

## פרוטוקול

ב־Swift, אפשר להבין פרוטוקול כסוג של "כלל" או "דרישה".

אפשר להבין אותו כמו הסכם בארגון בינלאומי: אם מדינה רוצה להצטרף לארגון בינלאומי מסוים, בדרך כלל היא צריכה קודם לעמוד בכמה כללים שהארגון מציב, לפרסם כמה נתונים ולכבד כמה כללים משותפים. רק לאחר שמתקיימים התנאים האלה היא יכולה להצטרף או להשתתף בעניינים מסוימים.

גם פרוטוקולים עובדים בצורה דומה.

כאשר סוג מסוים רוצה להתאים לפרוטוקול כלשהו, עליו לעמוד בתוכן שהפרוטוקול דורש. רק לאחר שהדרישות הללו מתקיימות, אותו סוג יכול להשתמש בפונקציונליות המתאימה.

כתיבה בסיסית:

```swift
struct Movie: Identifiable {
    // ...
}
```

כאן, `: Identifiable` אומר ש־`Movie` מתאים לפרוטוקול `Identifiable`.

אם סוג כלשהו מתאים לכמה פרוטוקולים, אפשר להפריד ביניהם באמצעות פסיקים:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

במקרה של `Identifiable`, הדרישה החשובה ביותר היא שלסוג יהיה `id` שיכול לזהות אותו.

לדוגמה:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

כאן ה־`id` הוא כמו מספר תעודת זהות, והוא משמש כדי להבדיל בין כל סרט.

כל עוד ה־`id` של כל סרט שונה, SwiftUI יוכל להבדיל נכון בין כל איבר במערך.

לדוגמה:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

ואז משתמשים ב־`ForEach` כך:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

כך כבר לא תהיה שגיאה.

מכיוון ש־`Movie` כבר מתאים ל־`Identifiable`, צורת כתיבה נפוצה יותר היא פשוט להשמיט את `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

כי SwiftUI כבר יודע להשתמש ב־`movie.id` כדי להבדיל בין כל פריט.

## מזהה ההבחנה של ForEach

להלן נבין לעומק את התפקיד של `id` בתוך `ForEach`.

לדוגמה:

```swift
ForEach(lists, id: \.self)
```

כאן המשמעות היא: להשתמש באיבר עצמו בתור מזהה הבחנה.

ואילו:

```swift
ForEach(lists, id: \.id)
```

פירושו: להשתמש בשדה `id` של האיבר בתור מזהה הבחנה.

אם שדה מסוים יכול להבטיח ייחודיות בעצמו, אפשר גם להשתמש בו זמנית.

למשל, אם השם של כל סרט שונה, ייתכן שגם הכתיבה הבאה תעבוד כראוי עם הנתונים הנוכחיים:

```swift
ForEach(lists, id: \.name)
```

אבל כאן יש בעיה נסתרת: `name` לא בהכרח יישאר תמיד ייחודי.

נניח שבהמשך תוסיף עוד סרט עם אותו שם, ואז `name` כבר לא יוכל להבדיל במדויק בין כל איבר.

במצב כזה, גם אם הקוד עדיין יתקמפל, SwiftUI עלול לזהות איברים בצורה שגויה בעת רענון, עדכון, הוספה או מחיקה של Views, וכך להוביל לבעיות תצוגה.

לכן, כשצריך להבדיל בין נתונים באופן יציב, עדיף להשתמש בשדה שהוא באמת ייחודי, כלומר `id`.

## UUID

אמנם כתיבה ידנית של `id: 1`, `id: 2` יכולה לפתור את הבעיה, אבל עדיין יש סיכון אחד: אפשר בטעות לכתוב `id` כפול, ואז המזהה הייחודי יאבד את התוקף שלו.

לדוגמה:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

כך ייווצרו שני `id` זהים, והמזהה הייחודי יאבד את תוקפו.

כדי להימנע מטעויות ידניות, בדרך כלל משתמשים ב־`UUID()`.

ב־Swift, ‏`UUID()` יוצר באופן אקראי מזהה בן 128 ביט. בדרך כלל הוא מוצג כמחרוזת ארוכה של אותיות ומספרים.

לדוגמה:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

כאן, `UUID()` למעשה יוצר מופע מסוג `UUID`; אפשר להבין אותו בתור "מספר ייחודי" שנוצר אוטומטית.

לכן, הערכים שנוצרים בכל פעם כמעט אף פעם לא חוזרים על עצמם, ולכן הם מתאימים מאוד לשימוש כ־`id`.

אפשר לשנות את `Movie` כך:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

הקוד הזה אומר שהשדה `id` בתוך המבנה `Movie` יקבל כברירת מחדל מופע חדש של `UUID`.

כלומר, בכל פעם שניצור `Movie` חדש, המערכת תייצר לנו קודם אוטומטית `id` ייחודי.

מכיוון של־`id` כבר יש ערך ברירת מחדל, מאוחר יותר כבר לא נצטרך למלא ידנית את `id` כשניצור מופעים של `Movie`.

לדוגמה:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

למרות שכאן לא נכתב `id`, בפועל למופע הסרט הזה עדיין יש `id` משלו; פשוט הערך הזה כבר נוצר אוטומטית על ידי `UUID()`.

אחרי שנשתמש בדרך הזו, כבר לא נצטרך למלא ידנית `id` לכל סרט, מה שלא רק מפחית את כמות הקוד, אלא גם מונע טעויות שנגרמות בגלל id כפול.

בסוף, כל מה שנצטרך הוא להוסיף בחלק העליון תמונת `Banner`, ולהשתמש ב־`ScrollView` כדי שהתוכן יוכל לגלול, וכך תושלם כל תצוגת רשימת הסרטים.

## סיכום

בשיעור הזה למדנו נקודת ידע חשובה מאוד: `struct`.

באמצעות `struct`, אנחנו יכולים לשלב כמה שדות קשורים של סרט אחד לכדי מכלול אחד, במקום לפצל את השם, הבמאי והדירוג לכמה מערכים נפרדים.

לאחר שהנתונים משולבים, אפשר להשתמש ב־`ForEach` כדי להציג את כל הסרטים שבמערך אחד אחרי השני ב־View.

במקביל, הבנו גם את התפקיד של "מזהה ההבחנה" בתוך `ForEach`: SwiftUI חייב לדעת איך להבדיל בין כל איבר במערך כדי להציג ולעדכן את ה־View בצורה נכונה.

לכן גרמנו ל־`Movie` להתאים לפרוטוקול `Identifiable`, וסיפקנו לו `id` ייחודי.

כדי להימנע מטעויות בעת מילוי ידני של `id`, למדנו גם על `UUID()`, כדי שהמערכת תיצור אוטומטית את המזהה הייחודי.

אחרי שתסיים את השיעור הזה, לא רק שתשלים את רשימת הסרטים, אלא גם תתחיל לגעת בדרך חשיבה חשובה ב־SwiftUI: **קודם מארגנים את הנתונים, ואז מייצרים את ה־View על סמך הנתונים.**

## קוד מלא

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
