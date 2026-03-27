# צבעים מרהיבים

בשיעור הזה נלמד modifiers חזותיים נפוצים ב-SwiftUI, כולל:

- צבע
- צבע חזית
- צבע רקע
- היסט
- שקיפות
- טשטוש

נלמד גם על `Safe Area` (האזור הבטוח).

modifiers אלה משמשים לשליטה באופן שבו התצוגות נראות, וכך הממשק נעשה ברור ומדורג יותר.

## צבע

ב-SwiftUI אפשר להגדיר את צבע הטקסט.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` מייצג צבע כחול, והוא למעשה קיצור של `Color.blue` (בזכות type inference).

צבעים נפוצים כוללים:

```
.black
.green
.yellow
.pink
.gray
...
```

כל אלה הן תכונות סטטיות של `Color`.

![Color](../../RESOURCE/006_color.png)

אפשר לחשוב על `Color` כסוג צבע, ועל `.blue`、`.red` וכן הלאה כערכים קונקרטיים שלו.

### תצוגת `Color`

ב-SwiftUI, גם `Color` עצמו יכול להיות מוצג כתצוגה.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

הקוד הזה יוצר ריבוע אדום בגודל `100×100`.

אפשר גם לגרום לכל הממשק להיות בצבע מסוים:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

לאחר ההרצה אפשר לראות שהצבע האדום לא ממלא את כל המסך, ועדיין נשארים אזורים לבנים בחלק העליון והתחתון של ה-iPhone. כאן נכנס המושג `Safe Area`.

## `Safe Area` (האזור הבטוח)

`Safe Area` הוא אזור שהמערכת משאירה כדי למנוע מצב שבו תוכן יוסתר, והוא כולל:

1. שורת המצב בחלק העליון (שעה, סוללה)

2. פס ה-Home בחלק התחתון

3. אזור ה-notch או ה-Dynamic Island

![Color](../../RESOURCE/006_color3.png)

כברירת מחדל, SwiftUI מגביל את התוכן לאזור הבטוח, ולכן התצוגה לא נמתחת עד לקצוות המסך.

### התעלמות מה-`Safe Area`

אם רוצים שהצבע יכסה את כל המסך, אפשר להשתמש ב-`ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

או ב-`edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

כך התצוגה תימתח על פני כל המסך.

חשוב לדעת ש-`edgesIgnoringSafeArea` הוא סגנון ישן יותר, ומ-iOS 14 והלאה מומלץ להשתמש ב-`ignoresSafeArea`.

## צבע חזית

### modifier בשם `foregroundStyle`

בשיעורים קודמים כבר למדנו להשתמש ב-`foregroundStyle` כדי להגדיר צבע.

למשל:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` הוא חלק ממערכת העיצוב החדשה, והוא תומך בצבעים, gradients, materials ועוד.

![Color](../../RESOURCE/006_color2.png)

### modifier בשם `foregroundColor`

גם `foregroundColor` יכול לשמש להגדרת צבע:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

צורת השימוש דומה ל-`foregroundStyle`.

בגרסאות החדשות של Xcode, Xcode עשוי להציג רמז שלפיו `foregroundColor` עלול להיות מוצא משימוש בגרסאות iOS עתידיות, ולכן עדיף להעדיף את `foregroundStyle`.

## רקע

אם רוצים להוסיף צבע רקע לתצוגה, אפשר להשתמש ב-`background`:

```swift
background(.red)
```

למשל, להוסיף צבע רקע לטקסט:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

כשמסמנים טקסט באפליקציות כמו Word או Chrome, אפשר לראות אפקט דומה של רקע צבעוני.

![Color](../../RESOURCE/006_color16.png)

אם רוצים להגדיל את שטח הרקע, צריך לשלב עם `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

כאן חשוב להבין כלל מרכזי:

ב-SwiftUI, modifiers נבנים מלמעלה למטה. modifier שמופיע מאוחר יותר פועל על התוצאה של מה שמופיע לפניו.

לכן:

```swift
.padding()
.background()
```

זה אומר שהרקע יעטוף את התצוגה אחרי שנוסף לה `padding`.

אם משנים את הסדר:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

הרקע לא יגדל, משום שהוא כבר צויר לפני ה-`padding`.

## דוגמה - אום מרובע עם חור

עכשיו ניצור תצוגה פשוטה של צורה שדומה לאום מרובע.

![Color](../../RESOURCE/006_color8.png)

תחילה ניצור ריבוע לבן בגודל `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

אם רוצים להפוך אותו לעיגול, אפשר להשתמש ב-`cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

כאשר רדיוס הפינות שווה למחצית מהרוחב והגובה, הצורה הופכת לעיגול.

כעת נוסיף רקע כחול:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

ה-`padding` החדש מגדיל את האזור החיצוני, וה-`background` מצייר את הצבע הכחול על אותו אזור חיצוני.

וכך מתקבל אפקט של אום מרובע.

### דרך נוספת לחשוב על זה

מלבד שימוש ברקע, אפשר גם לממש את הצורה הזו באמצעות `ZStack`.

כבר למדנו ש-`ZStack` מאפשר סידור בשכבות. אפשר לחשוב על האום המרובע כשילוב של עיגול ומלבן המונחים זה על גבי זה.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` מניח את התצוגות זו על גבי זו לפי הסדר, כאשר התצוגה שנוספה מאוחר יותר מוצגת מעל.

## דוגמה - שני עיגולים חופפים

הרבה אייקונים מורכבים מהנחה של צורות פשוטות זו על גבי זו, למשל שני עיגולים חופפים.

![Color](../../RESOURCE/006_color14.png)

ראשית ניצור שני עיגולים:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

כיוון שאנחנו רוצים שהעיגולים יוצגו בחפיפה, נשתמש בפריסת `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

בשלב הזה שני העיגולים, שגודלם זהה, חופפים לחלוטין.

אנחנו רוצים חפיפה חלקית בלבד, ולא כיסוי מלא. לשם כך אפשר להשתמש ב-`offset`.

## היסט (`offset`)

`offset` משנה רק את מיקום הציור של התצוגה, בלי להשפיע על חישוב הפריסה של מיכל האב.

צורת השימוש:

```swift
.offset(x:y:)
```

`x` מייצג היסט אופקי, ו-`y` היסט אנכי.

ערך חיובי פירושו תזוזה ימינה או למטה, וערך שלילי פירושו תזוזה שמאלה או למעלה.

אפשר להשתמש ב-`offset` כדי לגרום לשני העיגולים לחפוף חלקית:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

המיקום של העיגול האדום בתוך מנגנון הפריסה לא השתנה, אבל מיקום הציור שלו הוזז `25` נקודות שמאלה. לכן נוצר אפקט חזותי של חפיפה חלקית.

## שקיפות

ב-SwiftUI, `opacity` משמש להגדרת רמת השקיפות של התצוגה.

שימוש בסיסי:

```swift
.opacity(0.5)
```

טווח הערכים של `opacity` הוא בין `0.0` ל-`1.0`, כאשר:

- `0` פירושו שקיפות מלאה
- `1` פירושו אטימות מלאה

אפשר להשתמש ב-`opacity` כדי להגדיר שקיפות לעיגול הכתום:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

כאשר ה-`opacity` של העיגול הכתום מוגדר ל-`0.8`, רמת האטימות שלו היא `80%`. כאשר שני העיגולים חופפים, אזור החפיפה יוצר ערבוב צבעים.

## טשטוש

ב-SwiftUI אפשר להשתמש ב-`blur` כדי להוסיף אפקט טשטוש:

```swift
.blur(radius:10)
```

הפרמטר `radius` מגדיר את רדיוס הטשטוש. ככל שהערך גדול יותר, כך האפקט מטושטש יותר.

אפשר להוסיף טשטוש לשני העיגולים:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

בסופו של דבר אפשר לראות שני עיגולים מטושטשים מאוד.

## סיכום

השיעור הזה התמקד ב-modifiers חזותיים נפוצים ב-SwiftUI, ולמדנו כיצד לשלוט בעזרתם בצבע, במיקום ובאפקטים החזותיים של התצוגות.

באמצעות הדוגמאות ראינו כיצד modifiers שונים פועלים בפועל בתוך ממשק, וגם הכרנו את רעיון ה-`Safe Area`.

אלה modifiers בסיסיים מאוד, וכדאי לתרגל ולהשתמש בהם הרבה. כך יהיה קל יותר לשלוט באפקטים החזותיים של הממשק בפיתוח אמיתי.

### תרגול אחרי השיעור

- הוסיפו שקיפות וטשטוש לתמונה אחת
- צרו שלושה עיגולים חופפים עם רמות שקיפות שונות
- צרו תמונת רקע שממלאת את כל המסך ומתעלמת מה-`Safe Area`
- השתמשו ב-`offset` כדי לשנות את המיקום של כמה תצוגות

מטרת התרגול היא לא לשנן API, אלא לבחון את הקשר בין השינויים החזותיים לבין התנהגות הפריסה.
