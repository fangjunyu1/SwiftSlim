# פריסה, תמונות וטקסט

בשיעור הקודם למדנו את קוד `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

בשיעור הזה נלמד את מנגנון הפריסה ברירת המחדל של SwiftUI, וכן כיצד משתמשים בתמונות ובטקסט. על בסיס השיעור הקודם נעמיק עוד בהבנת מבנה התצוגות ואופן ההצגה שלהן, והידע הזה יאפשר לנו לבנות ממשקים בסיסיים.

## מנגנון הפריסה ברירת המחדל של SwiftUI

כאשר מציגים תצוגה מקדימה של `ContentView`, רואים שהאייקון והטקסט ממורכזים, ולא מסודרים החל מהחלק העליון.

![Swift](../../RESOURCE/003_view.png)

כברירת מחדל, אופן היישור של מיכל `Stack` הוא `.center`, ולכן תתי-התצוגות בדרך כלל מוצגות במרכז.

### `Alignment` יישור

ברור שמרכוז הוא רק אחת מאפשרויות היישור. אם נרצה ליישר לשמאל או לימין, נצטרך להשתמש ב-`alignment` כדי לשלוט ביישור התצוגה.

```swift
alignment
```

ב-SwiftUI, יישור מופיע בדרך כלל בשני מצבים:

**1. פרמטר היישור של מיכל Stack**

למשל, כדי ליישר לשמאל את האייקון והטקסט ב-`ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

ה-`alignment` של `VStack` שולט ביישור האופקי.

אפשרויות יישור:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` הוא סידור אופקי, ולכן ה-`alignment` שלו שולט בכיוון האנכי:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` הוא סידור בשכבות, ולכן `alignment` יכול לשלוט ביישור אופקי או אנכי:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

אם לא מציינים `alignment` במפורש, ברירת המחדל של `VStack`、`HStack` ו-`ZStack` היא `.center`.

**2. יישור בתוך `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

כאשר `frame` מספק גודל גדול יותר מגודל התצוגה עצמה, `alignment` קובע היכן התצוגה תוצב בתוך ה-`frame`. על השימוש ב-`frame` נלמד בהמשך, וכאן מספיק להבין את הרעיון הכללי.

### `Spacer` ומנגנון חלוקת המרחב

`alignment` מאפשר לסדר תצוגות אופקית או אנכית. אבל אם רוצים שטקסט ותמונה יופיעו בשני קצות המסך, יישור לבדו כבר לא מספיק.

למשל, אם נרצה לממש תצוגה עליונה כמו באתר [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), שבה בצד שמאל מופיע אייקון האתר ובצד ימין אייקון התפריט.

![Swift](../../RESOURCE/003_alignment3.png)

אם נשתמש רק ב-`alignment`, שני האייקונים יוצגו באותו צד. לא נוכל לפזר אותם בין ימין לשמאל, ולכן צריך להשתמש ב-`Spacer` כדי לחלק את השטח הפנוי.

`Spacer` הוא תצוגת פריסה גמישה שממלאת אוטומטית את השטח שנותר.

אופן השימוש:

```swift
Spacer()
```

לדוגמה:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

כאשר מוסיפים `Spacer` בין `Image` ל-`Text`, הוא ממלא את המרחב הפנוי ודוחף את `Image` ו-`Text` אל הקצוות העליון והתחתון.

![Swift](../../RESOURCE/003_view1.png)

אם יש כמה `Spacer`-ים:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

המרחב הפנוי יחולק באופן שווה בין ה-`Spacer`-ים.

![Swift](../../RESOURCE/003_spacer.png)

## הצגת תמונות ושליטה בגודלן

תצוגת `Image` משמשת בעיקר להצגת תמונות. האייקונים של `SF Symbols` שלמדנו עליהם בשיעור הקודם הם רק אחד השימושים של `Image`.

אופן השימוש:

```swift
Image("imageName")
```

בתוך המרכאות נמצא שם התמונה, בלי סיומת קובץ.

### הצגת תמונה

ראשית, נכין תמונה אחת.

![Swift](../../RESOURCE/003_img.jpg)

ב-Xcode בחרו את תיקיית המשאבים `Assets`, וגררו אליה את התמונה.

![Swift](../../RESOURCE/003_img1.png)

ב-`ContentView`, נשתמש ב-`Image` כדי להציג את התמונה:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

שימו לב: `Image` של SwiftUI לא תומך בהפעלת אנימציית GIF, אלא רק בהצגת פריים סטטי.

### שליטה בגודל התמונה

ב-SwiftUI, `Image` מוצגת כברירת מחדל בגודל המקורי של התמונה. אם רוצים לשנות את גודל התצוגה, צריך קודם להשתמש ב-`resizable` כדי לאפשר לתוכן התמונה להימתח, ואז להשתמש ב-`frame` כדי לקבוע את גודל הפריסה.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### modifier בשם `resizable`

modifier בשם `resizable` מאפשר לתמונה להשתתף בשינויי גודל במסגרת הפריסה, במקום להישאר בגודל המקורי שלה.

```swift
.resizable()
```

רק לאחר הוספת `resizable()`, ה-`frame` באמת יוכל לשנות את גודל התמונה.

אם משמיטים את `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

ה-`frame` יספק רק שטח פריסה, אבל גודל התמונה עצמה לא ישתנה.

### modifier בשם `frame`

`frame(width:height:)` משמש לקביעת רוחב וגובה התצוגה.

שימוש בסיסי:

```swift
.frame(width: 10,height: 10)
```

למשל, לקבוע לתמונה רוחב `300` וגובה `100`, בצורת מלבן:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

אפשר גם לקבוע רק רוחב או רק גובה:

```swift
.frame(width: 200)
.frame(height: 100)
```

השילוב של `resizable` ו-`frame` מאפשר שליטה גמישה על גודל התמונה בממשק, תוך שמירה על אפשרות ההגדלה וההקטנה שלה.

### יחס קנה מידה: `scaledToFit` ו-`scaledToFill`

כאשר מגדירים עם `frame` יחס רוחב-גובה שאינו תואם ליחס של התמונה, התמונה עלולה להימתח ולהתעוות.

אם רוצים לשמור על יחס הממדים המקורי של התמונה, ובו בזמן לגרום לה להתאים לשטח הפריסה הזמין, אפשר להשתמש ב-`scaledToFit` או ב-`scaledToFill`.

**`scaledToFit`**

`scaledToFit` שומר על יחס הרוחב-גובה המקורי של התמונה, ומקטין או מגדיל אותה כך שתתאים כולה לשטח הזמין, בלי לחתוך אותה:

```swift
.scaledToFit()
```

או:

```swift
.aspectRatio(contentMode: .fit)
```

השיטה הזו מתאימה למצבים שבהם צריך להציג את כל התמונה בלי עיוות.

אם לכל התמונות מגדירים אותו רוחב וגובה, ייתכן שחלק מהן יימתחו.

למשל:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

בלי להגדיר יחס קנה מידה, התמונה לא תוכל להישמר ביחס המקורי שלה.

![Swift](../../RESOURCE/003_img4.png)

הוספת `scaledToFit` תשמור על היחס המקורי:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` גם שומר על יחס התמונה, אבל ממלא את כל השטח הזמין. אם היחסים לא תואמים, החלק העודף ייחתך:

```swift
.scaledToFill()
```

או:

```swift
.aspectRatio(contentMode: .fill)
```

השיטה הזו מתאימה למצבים שבהם רוצים שהתמונה תכסה את כל האזור, למשל כתמונת רקע או banner.

**ההבדל בין השניים**

![Swift](../../RESOURCE/003_img6.png)

## טקסט

ב-SwiftUI, `Text` משמש להצגת טקסט.

שימוש בסיסי:

```swift
Text("FangJunyu")
```

בשיעור הקודם למדנו כבר על `Text`, והשיעור הזה נלמד כיצד לשלוט בגודל הפונט ובעוביו, כדי להפוך את הטקסט לבולט יותר בתצוגה.

### גודל פונט

אפשר להשתמש ב-modifier בשם `font` כדי לשלוט בגודל הטקסט:

```swift
.font(.title)
```

למשל:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

גדלי פונט נפוצים (מהגדול לקטן):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### עובי פונט

אם רוצים להפוך את הטקסט לעבה יותר, אפשר להשתמש ב-modifier בשם `fontWeight`:

```swift
.fontWeight(.bold)
```

למשל:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

משקלי פונט נפוצים (מהדק לעבה):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` שולט בגודל הפונט, ו-`fontWeight` שולט בעובי שלו. אפשר לשלב ביניהם כדי ליצור טקסט בעל נוכחות חזקה יותר.

## סיכום ותרגול

עד כאן למדנו על מנגנון הפריסה ברירת המחדל של SwiftUI, על `Spacer`, על `Image` ועל `Text`. הידע הזה כבר מספיק כדי לפתח כמה תצוגות פשוטות.

למשל: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

הממשק של Google מאוד נקי, והוא כולל תמונה וטקסט. אפשר לנסות לנתח אותו מנקודת המבט של SwiftUI:

1. המבנה הכללי מתחלק לשלושה חלקים: הלוגו של Google, תיבת החיפוש וטקסט ההסבר. אפשר להשתמש ב-`VStack` כדי לסדר אותם אנכית.
2. הלוגו של Google הוא תמונה, ולכן אפשר להציג אותו באמצעות `Image`.
3. תיבת החיפוש כוללת שדה קלט ואייקון. אם מתעלמים כרגע משדה הקלט, אפשר להציג את אייקון החיפוש באמצעות `Image`.
4. טקסט ההסבר מוצג בעזרת `Text`, ואת הסידור האופקי שלו אפשר לממש בעזרת `HStack`. את צבע הטקסט אפשר לשלוט באמצעות `foregroundStyle`.

באמצעות תרגול של הידע הזה נוכל לבנות כמה תצוגות פשוטות, ולהעמיק את ההבנה שלנו לגבי `Image`、`Text` וה-modifiers שלהם.
