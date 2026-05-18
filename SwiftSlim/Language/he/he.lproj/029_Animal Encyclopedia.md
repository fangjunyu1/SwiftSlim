# אנציקלופדיית בעלי חיים 

בשיעור הזה נמשיך לתרגל תצוגות מותאמות אישית והעברת נתונים.

נבנה תצוגת אנציקלופדיית בעלי חיים פשוטה. בדף יוצגו חמישה בעלי חיים, וכאשר מקישים על אחד מהם, תופיע תצוגת פרטים שתציג את התמונה, אזור התפוצה, בית הגידול והתיאור של אותו בעל חיים.

התוצאה:

![view](../../../Resource/029_view.png)

באמצעות הדוגמה הזאת נוכל לתרגל את השילוב בין מבני נתונים, הצגת רשימה, אינטראקציית הקשה ותצוגת Sheet קופצת.

## הכנת חומרי תמונה

תחילה צריך להכין חמש תמונות של בעלי חיים:

- דולפין: `dolphin.jpg`
- ג׳ירפה: `giraffe.jpg`
- אריה: `lion.jpg`
- פנדה: `panda.jpg`
- דוב קוטב: `polarBear.jpg`

אפשר להשתמש בחומרי התמונה הבאים:

[דולפין](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [ג׳ירפה](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [אריה](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [פנדה](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [דוב קוטב](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

לאחר הורדת התמונות, גררו אותן לתיקיית המשאבים `Assets` בפרויקט Xcode.

![assets](../../../Resource/029_assets.png)

חשוב לשים לב שכאשר משתמשים בתמונה בקוד, בדרך כלל אין צורך לכתוב את הסיומת `.jpg`.

לדוגמה, אם שם משאב התמונה הוא `dolphin`, בקוד כותבים:

```swift
Image("dolphin")
```

אם שם התמונה נכתב בצורה שגויה, התמונה לא תוצג כראוי.

הערה: חומרי התמונה שלמעלה מגיעים ממיזמי ויקימדיה. בעת השימוש מומלץ לשמור את קישור התמונה המקורי ואת פרטי המקור.

## יצירת מבנה בעל החיים

בדף הזה לכל בעל חיים יש כמה פרטי מידע:

- שם בעל החיים
- תמונת בעל החיים
- אמוג׳י של בעל החיים
- אזור תפוצה
- בית גידול
- תיאור בעל החיים

אם נפזר את המידע הזה בהרבה משתנים, הקוד יהיה מבולגן יותר. לכן אפשר ליצור מבנה `Animal` ולרכז בתוכו את המידע של בעל חיים אחד.

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
```

בקוד הזה:

- `id`: מזהה ייחודי של בעל החיים.
- `name`: שם בעל החיים.
- `imageName`: שם תמונת בעל החיים.
- `avatarEmoji`: אמוג׳י של בעל החיים.
- `distributionArea`: אזור תפוצה.
- `habitat`: בית גידול.
- `animalDescription`: תיאור בעל החיים.

מתוכם:

```swift
let id = UUID()
```

`id` משמש לזיהוי כל בעל חיים. בהמשך נשתמש ב-`ForEach` כדי להציג את רשימת בעלי החיים, וגם ב-`.sheet(item:)` כדי להציג פרטים לפי בעל החיים שנבחר, ולכן צריך לגרום ל-`Animal` להתאים לפרוטוקול `Identifiable`.

התפקיד של `Identifiable` הוא לומר ל-SwiftUI שלכל בעל חיים יש `id` שבאמצעותו אפשר להבדיל בינו לבין אחרים.

## יצירת נתוני בעלי חיים

לאחר מכן ניצור מערך בעלי חיים בתוך `ContentView`.

במערך נשמור חמישה ערכי `Animal`, וכל ערך `Animal` מייצג בעל חיים אחד.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // דולפין
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מי חוף וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים בעזרת צלילים וידועים בהתנהגותם המשחקית."
        ),
        // ג׳ירפה
        Animal(
            name: "ג׳ירפה",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "סוואנות ויערות פתוחים באפריקה.",
            habitat: "שטחי עשב, סוואנות ויערות פתוחים.",
            animalDescription: "ג׳ירפות הן בעלי החיים היבשתיים הגבוהים ביותר. יש להן צוואר ארוך, רגליים ארוכות, ובדרך כלל הן ניזונות מעלים של עצים גבוהים."
        ),
        // אריה
        Animal(
            name: "אריה",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "נמצאים בעיקר באפריקה שמדרום לסהרה, עם אוכלוסייה קטנה במערב הודו.",
            habitat: "שטחי עשב, סוואנות וחורשות פתוחות.",
            animalDescription: "אריות הם חתולים גדולים וחזקים. בדרך כלל הם חיים בקבוצות הנקראות להקות, ולעיתים קרובות הם מוכרים כמלכי עולם החיות."
        ),
        // פנדה
        Animal(
            name: "פנדה",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "יערות הרריים במרכז סין.",
            habitat: "יערות במבוק באזורים הרריים קרירים ולחים.",
            animalDescription: "פנדות הן דובים הידועים בפרוותם השחורה-לבנה. הן אוכלות בעיקר במבוק והן מן החיות המזוהות ביותר בעולם."
        ),
        // דוב קוטב
        Animal(
            name: "דוב קוטב",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "אזורים ארקטיים סביב הקוטב הצפוני.",
            habitat: "קרח ים, אזורי חוף וסביבות ארקטיות קרות.",
            animalDescription: "דובי קוטב הם דובים גדולים המותאמים לסביבות קרות. הם שחיינים חזקים ותלויים בעיקר בקרח הים כדי לצוד כלבי ים."
        )
    ]

    var body: some View {
        Text("אנציקלופדיית בעלי חיים")
    }
}
```

כאן `animals` הוא מערך:

```swift
let animals: [Animal]
```

`[Animal]` מציין שבמערך הזה נשמרים כמה ערכי `Animal`.

כלומר, `animals` אינו בעל חיים יחיד, אלא קבוצה של בעלי חיים.

## הצגת רשימת בעלי החיים

עכשיו אפשר להשתמש ב-`ForEach` כדי להציג את רשימת בעלי החיים.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

התצוגה:

![view](../../../Resource/029_view1.png)

בקוד הזה:

```swift
ForEach(animals) { animal in
    ...
}
```

המשמעות היא מעבר על מערך `animals`.

בכל מחזור לולאה, `animal` מייצג את בעל החיים שמוצג כרגע.

לדוגמה, במחזור הראשון `animal` הוא דולפין; במחזור השני `animal` הוא ג׳ירפה.

לכן אפשר להציג את המידע של בעל החיים הנוכחי כך:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

כך אפשר להציג את חמשת בעלי החיים.

## הפיכת רשימת בעלי החיים ללחיצה

עכשיו הרשימה כבר מוצגת, אבל עדיין אי אפשר להקיש עליה.

אם רוצים שלאחר הקשה על בעל חיים מסוים תופיע תצוגת פרטים, צריך קודם לתעד את “בעל החיים שנבחר כרגע”.

לכן נוסיף משתנה מצב בתוך `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

כאן `selectedAnimal` הוא ערך אופציונלי מסוג `Animal?`.

המשמעות היא שיכול להיות בו בעל חיים, ויכול להיות שאין בו בעל חיים.

ערך ברירת המחדל הוא `nil`, כלומר בהתחלה לא נבחר אף בעל חיים.

לאחר מכן נהפוך כל שורת בעל חיים ל-`Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

הנקודה החשובה היא שורת הקוד הזאת:

```swift
selectedAnimal = animal
```

כאשר המשתמש מקיש על בעל חיים מסוים, נשמור את אותו בעל חיים בתוך `selectedAnimal`.

לדוגמה, אם המשתמש מקיש על דולפין, `selectedAnimal` ישמור את הדולפין.

אם המשתמש מקיש על פנדה, `selectedAnimal` ישמור את הפנדה.

כלומר, `selectedAnimal` משמש לתיעוד בעל החיים שעליו המשתמש הקיש כרגע.

## תצוגת Sheet קופצת

עכשיו אנחנו כבר יכולים לתעד באמצעות הכפתור את “בעל החיים שעליו הוקש כרגע”.

כעת צריך לממש תצוגה קופצת להצגת פרטי בעל החיים.

![view](../../../Resource/029_view2.png)

ב-SwiftUI אפשר להשתמש ב-`Sheet` כדי לממש אפקט קופץ כזה.

אפשר להבין את `Sheet` כדף זמני שקופץ מעל הדף הנוכחי. לאחר שהמשתמש מסיים לצפות בתוכן, הוא יכול להחליק כלפי מטה כדי לסגור אותו.

## דוגמת Sheet

לפני שנציג בפועל את פרטי בעל החיים, נשתמש בדוגמה פשוטה כדי להבין כיצד `Sheet` קופץ.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("הצג Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("תצוגת Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

התצוגה:

![view](../../../Resource/029_view3.png)

בקוד הזה יצרנו ערך בוליאני:

```swift
@State private var showSheet = false
```

`showSheet` הוא `false` כברירת מחדל, כלומר בהתחלה ה-`Sheet` אינו מוצג.

כאשר מקישים על הכפתור:

```swift
showSheet.toggle()
```

`toggle()` פירושו החלפת הערך הבוליאני.

אם הערך המקורי הוא `false`, לאחר קריאה ל-`toggle()` הוא יהפוך ל-`true`.

אם הערך המקורי הוא `true`, לאחר קריאה ל-`toggle()` הוא יהפוך ל-`false`.

לכן לאחר הקשה על הכפתור, `showSheet` ישתנה מ-`false` ל-`true`.

כאשר `showSheet` הופך ל-`true`, קטע הקוד הבא יציג את ה-`Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("תצוגת Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

קטע הקוד הזה אומר: כאשר `showSheet` הוא `true`, הצג `Sheet`, ובתוך ה-`Sheet` הצג `Text("תצוגת Sheet")`.

התצוגה:

![view](../../../Resource/029_view4.png)

צורת הכתיבה הזאת מתאימה להצגת תוכן קבוע.

לדוגמה, לאחר הקשה על כפתור אפשר להציג דף הגדרות, דף הסבר, דף הודעה וכדומה.

### מיקום כתיבת Sheet

אף על פי ש-`Sheet` הוא תצוגה קופצת, ב-SwiftUI הוא אינו נכתב כתצוגה עצמאית כמו `Text()` או `Image()`, אלא משמש כמשנה תצוגה.

כלומר, `.sheet(...)` דומה למשתנים כמו `.font()`, `.padding()` ו-`.shadow()`, וצריך להוסיף אותו אחרי תצוגה כלשהי.

לדוגמה:

```swift
Button("הצג Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("תצוגת Sheet")
}
```

בדוגמה הזאת, `.sheet` נוסף אחרי `Button`.

כאשר `showSheet` הופך ל-`true`, SwiftUI יציג את ה-`Sheet` ויציג את התוכן שבתוך הסוגריים המסולסלים:

```swift
Text("תצוגת Sheet")
```

עם זאת, בפיתוח בפועל, אם יש בדף כמה כפתורים, בדרך כלל לא מוסיפים `.sheet` לכל כפתור בנפרד.

הגישה הנפוצה יותר היא להוסיף את `.sheet` אחרי התצוגה החיצונית.

לדוגמה:

```swift
VStack {
    Button("הצג Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("תצוגת Sheet")
}
```

הכפתור אחראי לשינוי `showSheet`, והתצוגה החיצונית אחראית להצגת ה-`Sheet` לפי השאלה האם `showSheet` הוא `true`.

## קישור Sheet לערך אופציונלי

קודם למדנו את צורת הכתיבה הזאת:

```swift
.sheet(isPresented: $showSheet) {
    Text("תצוגת Sheet")
}
```

צורת הכתיבה הזאת מתאימה לשליטה בהצגה ובהסתרה של דף קבוע.

אבל בדוגמת אנציקלופדיית בעלי החיים, לא מספיק לדעת “האם להציג `Sheet`”; צריך לדעת גם “על איזה בעל חיים הוקש”.

לדוגמה:

אם המשתמש מקיש על דולפין, ה-`Sheet` צריך להציג את פרטי הדולפין.

אם המשתמש מקיש על פנדה, ה-`Sheet` צריך להציג את פרטי הפנדה.

לכן כאן מתאימה יותר צורת כתיבה אחרת של Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // התוכן שמוצג בתוך Sheet
}
```

בקוד הזה, ה-`Sheet` מקושר לערך אופציונלי `selectedAnimal`.

שימו לב שכאן אחרי `item:` כותבים `$selectedAnimal`, ולא `selectedAnimal`.

הסיבה היא ש-`Sheet` לא רק קורא את הערך של `selectedAnimal`, אלא גם צריך להחליט לפי השינויים שלו האם להופיע.

אפשר להבין את קטע הקוד הזה כך:

- כאשר `selectedAnimal` הוא `nil`, לא מציגים `Sheet`.
- כאשר ל-`selectedAnimal` יש ערך, מציגים `Sheet`.
- כאשר ה-`Sheet` נסגר, SwiftUI יחזיר את `selectedAnimal` ל-`nil`.

SwiftUI יעביר את בעל החיים שנשמר בתוך `selectedAnimal` אל `animal` שבתוך הסוגריים המסולסלים.

כלומר, `.sheet(item:)` לא רק שולט בהצגה, אלא גם מעביר את הנתון שנבחר אל תוך ה-`Sheet`.

## שימוש ב-Sheet להצגת שם בעל החיים

עכשיו לא נמהר ליצור תצוגת פרטים מורכבת.

כדי שהקוד יהיה קל יותר להבנה, נציג תחילה בתוך ה-`Sheet` את שם בעל החיים הנוכחי.

הוסיפו `.sheet(item:)` מחוץ ל-`VStack`:

```swift
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
                        .cornerRadius(20)
                    
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
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

הקטע החשוב ביותר כאן הוא הקוד הזה:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

כאשר ל-`selectedAnimal` יש ערך, ה-`Sheet` יוצג.

`animal` שבתוך הסוגריים המסולסלים הוא בעל החיים שנבחר כרגע.

לכן:

```swift
Text(animal.name)
```

יציג את שם בעל החיים שעליו הוקש כרגע.

לדוגמה, הקשה על `דולפין` תציג `דולפין` בתוך ה-Sheet.

הקשה על `פנדה` תציג `פנדה` בתוך ה-`Sheet`.

כך מימשנו אפקט שבו הקשה על בעלי חיים שונים מציגה שמות שונים ב-Sheet.

הצגת שם בעל החיים:

![view](../../../Resource/029_view5.png)

עם זאת, פרטי בעל החיים לא צריכים להציג רק שם, אלא גם שם, אזור תפוצה, בית גידול ותיאור.

אם נכתוב את כל הקוד הזה בתוך `.sheet`, הקוד יהפוך ארוך ולא נוח לקריאה.

לכן כעת ניצור תצוגה מותאמת אישית חדשה, שתהיה אחראית במיוחד להצגת פרטי בעל החיים.

## יצירת תצוגת פרטי בעל החיים

כעת ניצור תצוגה מותאמת אישית חדשה בשם `AnimalDetailView`.

התצוגה הזאת מקבלת `Animal` ומציגה את פרטי בעל החיים.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**אזור תפוצה**: \(animal.distributionArea)")

                    Divider()

                    Text("**בית גידול**: \(animal.habitat)")

                    Divider()

                    Text("**תיאור בעל החיים**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

התצוגה:

![view](../../../Resource/029_view2.png)

הנקודה החשובה כאן היא:

```swift
var animal: Animal
```

המשמעות היא ש-`AnimalDetailView` צריכה לקבל בעל חיים מבחוץ.

לאחר קבלת בעל החיים, תצוגת הפרטים יכולה להשתמש במידע השונה של אותו בעל חיים:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

כלומר, `AnimalDetailView` אחראית רק להצגת בעל החיים שהועבר אליה.

### טקסט מודגש ב-Markdown

בתצוגת הפרטים כתבנו קוד כזה:

```swift
Text("**בית גידול:** \(animal.habitat)")
```

כאן יש שתי נקודות שצריך להבין.

ראשית, `**בית גידול:**` משתמש בתחביר `Markdown`. טקסט שמוקף בשתי כוכביות יוצג בהדגשה.

שנית, `\()` הוא אינטרפולציית מחרוזת, וניתן להשתמש בו כדי להציג את ערך המשתנה בתוך הטקסט.

קטע הקוד הזה מציג תחילה את `בית גידול:` בהדגשה, ולאחר מכן מציג את בית הגידול של בעל החיים.

## הצגת תצוגת הפרטים בתוך Sheet

לאחר יצירת `AnimalDetailView`, אפשר לחזור ל-`ContentView` ולהחליף את תצוגת השם המקורית שבתוך ה-`Sheet` בתצוגת הפרטים.

במקור זה היה:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

כעת נשנה זאת ל:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

כאן `animal:` הוא שם הפרמטר של `AnimalDetailView`.

`animal` שאחריו הוא בעל החיים הנוכחי שמועבר מ-`.sheet(item:)`.

כלומר, מעבירים את בעל החיים שעליו הוקש כרגע אל `AnimalDetailView` לצורך הצגה.

המבנה המלא:

```swift
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
                        .cornerRadius(20)
                    
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
```

כאשר המשתמש מקיש על בעל חיים:

```swift
selectedAnimal = animal
```

`selectedAnimal` משתנה מ-`nil` לבעל חיים מסוים, וה-`Sheet` מזהה של-`selectedAnimal` יש ערך ומציג את התצוגה.

ה-`Sheet` מעביר את בעל החיים שב-`selectedAnimal` אל התצוגה `AnimalDetailView`, ו-`AnimalDetailView` מציגה את פרטי בעל החיים.

כך מימשנו את הפונקציה שבה הקשה על רשימת בעלי החיים מציגה את פרטי בעל החיים המתאים.

## ההבדל בין שתי צורות הכתיבה של Sheet

עכשיו כבר השתמשנו ב-`.sheet(item:)` כדי להשלים את הצגת תצוגת פרטי בעל החיים.

כאן אפשר לסכם בקצרה את שתי צורות הכתיבה הנפוצות של `Sheet`.

### הראשונה היא קישור לערך בוליאני

```swift
@State private var showSheet = false

Button("הצג Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("תצוגת Sheet")
}
```

צורת הכתיבה הזאת מתאימה להצגת תוכן קבוע, כגון דף הגדרות, דף הסבר, דף הודעה וכדומה.

`showSheet` הוא ערך בוליאני, ויש לו רק שני מצבים: `true` ו-`false`.

כאשר `showSheet` הוא `true`, ה-`Sheet` מוצג.

כאשר `showSheet` הוא `false`, ה-`Sheet` אינו מוצג.

### השנייה היא קישור לערך אופציונלי

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

צורת הכתיבה הזאת מתאימה להצגת תוכן שונה לפי הנתון שנבחר.

בשיעור הזה אנו מקישים על בעלי חיים שונים וצריכים להציג פרטים שונים, ולכן השימוש ב-`.sheet(item:)` מתאים יותר.

## הקוד המלא

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // שם בעל החיים
    let name: String
    
    // תמונת בעל החיים
    let imageName: String
    
    // סמל האמוג׳י של בעל החיים
    let avatarEmoji: String
    
    // אזור תפוצה
    let distributionArea: String
    
    // בית גידול
    let habitat: String
    
    // תיאור בעל החיים
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // דולפין
        Animal(
            name: "דולפין",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "אוקיינוסים חמים וממוזגים ברחבי העולם.",
            habitat: "אוקיינוסים, מי חוף וכמה נהרות גדולים.",
            animalDescription: "דולפינים הם יונקים ימיים חכמים. הם חיים בקבוצות, מתקשרים בעזרת צלילים וידועים בהתנהגותם המשחקית."
        ),
        // ג׳ירפה
        Animal(
            name: "ג׳ירפה",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "סוואנות ויערות פתוחים באפריקה.",
            habitat: "שטחי עשב, סוואנות ויערות פתוחים.",
            animalDescription: "ג׳ירפות הן בעלי החיים היבשתיים הגבוהים ביותר. יש להן צוואר ארוך, רגליים ארוכות, ובדרך כלל הן ניזונות מעלים של עצים גבוהים."
        ),
        // אריה
        Animal(
            name: "אריה",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "נמצאים בעיקר באפריקה שמדרום לסהרה, עם אוכלוסייה קטנה במערב הודו.",
            habitat: "שטחי עשב, סוואנות וחורשות פתוחות.",
            animalDescription: "אריות הם חתולים גדולים וחזקים. בדרך כלל הם חיים בקבוצות הנקראות להקות, ולעיתים קרובות הם מוכרים כמלכי עולם החיות."
        ),
        // פנדה
        Animal(
            name: "פנדה",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "יערות הרריים במרכז סין.",
            habitat: "יערות במבוק באזורים הרריים קרירים ולחים.",
            animalDescription: "פנדות הן דובים הידועים בפרוותם השחורה-לבנה. הן אוכלות בעיקר במבוק והן מן החיות המזוהות ביותר בעולם."
        ),
        // דוב קוטב
        Animal(
            name: "דוב קוטב",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "אזורים ארקטיים סביב הקוטב הצפוני.",
            habitat: "קרח ים, אזורי חוף וסביבות ארקטיות קרות.",
            animalDescription: "דובי קוטב הם דובים גדולים המותאמים לסביבות קרות. הם שחיינים חזקים ותלויים בעיקר בקרח הים כדי לצוד כלבי ים."
        )
    ]
    
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
                            .cornerRadius(20)

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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**אזור תפוצה**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**בית גידול**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**תיאור בעל החיים**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## סיכום

בשיעור הזה השלמנו דף פשוט של אנציקלופדיית בעלי חיים.

תחילה השתמשנו במבנה `Animal` כדי לשמור מידע על בעלי חיים, לאחר מכן השתמשנו במערך כדי לשמור חמישה בעלי חיים, ואז השתמשנו ב-`ForEach` כדי להציג את רשימת בעלי החיים.

כאשר המשתמש מקיש על בעל חיים מסוים, אנחנו שומרים את אותו בעל חיים בתוך `selectedAnimal`:

```swift
selectedAnimal = animal
```

כאשר ל-`selectedAnimal` יש ערך, `.sheet(item:)` יציג את תצוגת הפרטים ויעביר את בעל החיים שנבחר אל `AnimalDetailView`.

הדבר החשוב ביותר בשיעור הזה אינו סגנון הממשק, אלא הבנת מסלול העברת הנתונים:

```swift
הקשה על בעל חיים → selectedAnimal שומר את בעל החיים → Sheet מופיע → AnimalDetailView מציג את הפרטים
```

לאחר שמבינים את המסלול הזה, אפשר בעתיד ליצור עוד פונקציות דומות, כגון פרטי מוצר, פרטי קורס, פרטי מאמר, פרטי איש קשר ועוד.
