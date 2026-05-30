# କଷ୍ଟମ ଦୃଶ୍ୟ

ଏହି ପାଠରେ, ଆମେ SwiftUI ର ଏକ ବହୁତ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ଲେଖନ ପ୍ରକାର ଶିଖିବା: **କଷ୍ଟମ View**।

କଷ୍ଟମ View ପୁନରାବୃତ୍ତି ହେଉଥିବା View କୋଡର ଏକ ଅଂଶକୁ ପ୍ୟାକ୍ କରି, ଏହାକୁ ବାରମ୍ବାର ବ୍ୟବହାର କରିପାରିବା ଏକ View କରିପାରେ।

ବାସ୍ତବ App ବିକାଶରେ, ଆମେ ପ୍ରାୟତଃ ଏହି ପରିସ୍ଥିତିକୁ ଦେଖୁଥାଉ: ଅନେକ ଇଣ୍ଟରଫେସର ଗଠନ ସମାନ ଥାଏ, କିନ୍ତୁ ଦେଖାଯାଉଥିବା ବିଷୟବସ୍ତୁ ଭିନ୍ନ ଥାଏ।

ଯେପରି, ଫୋରମ୍ ୱେବସାଇଟର ପୋଷ୍ଟ ତାଲିକାରେ, ପ୍ରତ୍ୟେକ ପୋଷ୍ଟରେ ଶୀର୍ଷକ, ଛବି, ଲାଇକ୍ ସଂଖ୍ୟା ଇତ୍ୟାଦି ତଥ୍ୟ ଥାଇପାରେ।

![Reddit](../../../Resource/028_view1.png)

ଶପିଂ ୱେବସାଇଟର ପଣ୍ୟ ତାଲିକାରେ, ପ୍ରତ୍ୟେକ ପଣ୍ୟରେ ଛବି, ନାମ ଏବଂ ଦାମ ଇତ୍ୟାଦି ତଥ୍ୟ ଥାଇପାରେ।

![Amazon](../../../Resource/028_view2.png)

ଏହି ବିଷୟବସ୍ତୁଗୁଡ଼ିକର ଗଠନ ସମାନ ପ୍ରକାରର; ତଫାତ କେବଳ ଦେଖାଯାଉଥିବା ଡେଟାରେ ଥାଏ।

ଯଦି ପ୍ରତ୍ୟେକ ଆଇଟମ୍ ପାଇଁ ହାତରେ କୋଡ୍ ଲେଖାଯାଏ, କୋଡ୍ ବହୁତ ଲମ୍ବା ହେବ, ଏବଂ ପରେ ପରିବର୍ତ୍ତନ କରିବା ମଧ୍ୟ ସୁବିଧାଜନକ ହେବ ନାହିଁ।

ତେଣୁ, ଆମେ ସମାନ ଗଠନକୁ ଏକ କଷ୍ଟମ View ଭିତରେ ପ୍ୟାକ୍ କରିପାରୁ, ଏବଂ ଭିନ୍ନ ବିଷୟବସ୍ତୁକୁ ପାରାମିଟର ଭାବେ ଭିତରକୁ ପଠାଇପାରୁ।

ଏଭଳି କଲେ, ସେହି ଏକେ View ଭିନ୍ନ ବିଷୟବସ୍ତୁ ଦେଖାଇପାରେ।

## ଆବଶ୍ୟକତା ପରିଦୃଶ୍ୟ

ଯେପରି, ଏବେ ଆମେ ଏକ ସେଟିଂସ୍ ତାଲିକା ତିଆରି କରିବାକୁ ଯାଉଛୁ।

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/028_view.png)

ଏହି ସେଟିଂସ୍ ତାଲିକାରେ ତିନୋଟି ଭିନ୍ନ ସେଟିଂସ୍ ଆଇଟମ୍ ଅଛି: `ସେଟିଂସ୍`, `ଫୋଲ୍ଡର`, `ସଙ୍ଗୀତ`।

ଯଦିଓ ସେଗୁଡ଼ିକର ଆଇକନ୍, ରଙ୍ଗ ଏବଂ ଶୀର୍ଷକ ଭିନ୍ନ, କିନ୍ତୁ ସମଗ୍ର ଗଠନ ସମାନ:

- ବାମ ପଟରେ ଆଇକନ୍
- ଆଇକନ୍ ପୃଷ୍ଠଭୂମି ରଙ୍ଗ
- ମଧ୍ୟରେ ଶୀର୍ଷକ
- ଡାହାଣ ପଟରେ ତୀର

ଯଦି କଷ୍ଟମ View ବ୍ୟବହାର ନକରିବା, ଆମେ ସମ୍ଭବତଃ ଏହିପରି ଲେଖିବୁ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("ସେଟିଂସ୍")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("ଫୋଲ୍ଡର")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("ସଙ୍ଗୀତ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

ଏହି କୋଡ୍ ସାଧାରଣ ଭାବେ ଦେଖାଯାଇପାରେ, କିନ୍ତୁ ସମସ୍ୟା ମଧ୍ୟ ବହୁତ ସ୍ପଷ୍ଟ: ତିନୋଟି ସେଟିଂସ୍ ଆଇଟମ୍‌ର କୋଡ୍ ପ୍ରାୟ ପୂରାପୂରି ସମାନ।

ଭିନ୍ନ ଥିବା କଥା କେବଳ ଆଇକନ୍, ରଙ୍ଗ ଏବଂ ଶୀର୍ଷକ:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("ସେଟିଂସ୍")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("ଫୋଲ୍ଡର")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("ସଙ୍ଗୀତ")
```

ଅର୍ଥାତ, ପ୍ରତ୍ୟେକ ସେଟିଂସ୍ ଆଇଟମ୍‌ର ଗଠନ ସ୍ଥିର, କେବଳ ଆଇକନ୍, ରଙ୍ଗ ଏବଂ ଶୀର୍ଷକ ଭିନ୍ନ।

ଏହି ପରିସ୍ଥିତି କଷ୍ଟମ View ବ୍ୟବହାର ପାଇଁ ବହୁତ ଉପଯୁକ୍ତ।

### ଛାୟା shadow

ଏଠାରେ ଏକ ନୂତନ modifier `.shadow(radius:)` ବ୍ୟବହାର କରାଯାଇଛି:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` View କୁ ଛାୟା ଯୋଡ଼ିପାରେ।

`radius` ଛାୟାର blur radius କୁ ସୂଚାଏ। ମୂଲ୍ୟ ଯେତେ ବଡ଼ ହୁଏ, ସାଧାରଣତଃ ଛାୟାର ପ୍ରସାରଣ ଅଞ୍ଚଳ ତେତେ ବଡ଼ ହୁଏ, ଏବଂ ଏହା ଅଧିକ ମୃଦୁ ଦେଖାଯାଏ।

ଏଠାରେ ଏହାକୁ `1` କରାଯାଇଛି, ଯାହାର ଅର୍ଥ କେବଳ ଏକ ବହୁତ ହାଲୁକା ଛାୟା ପ୍ରଭାବ ଯୋଡ଼ାଯାଉଛି।

## ସେଟିଂସ୍ ଆଇଟମ୍ View କୁ ପ୍ୟାକ୍ କରିବା

ପରେ, ଆମେ ପ୍ରତ୍ୟେକ ସେଟିଂସ୍ ଆଇଟମ୍ କୁ ଏକ ନୂତନ View ଭିତରେ ପ୍ୟାକ୍ କରିବା।

ଏକ `SettingItemView` ତିଆରି କରିପାରିବା:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ଏହି View ଭିତରେ, ଆମେ ତିନୋଟି properties ପରିଭାଷିତ କରିଛୁ:

```swift
let icon: String
let color: Color
let title: String
```

ସେଗୁଡ଼ିକ ମଧ୍ୟରେ:

- `icon` ଆଇକନ୍ ନାମକୁ ସୂଚାଏ
- `color` ଆଇକନ୍ ପୃଷ୍ଠଭୂମି ରଙ୍ଗକୁ ସୂଚାଏ
- `title` ସେଟିଂସ୍ ଆଇଟମ୍ ଶୀର୍ଷକକୁ ସୂଚାଏ

ଯେହେତୁ ଏହି ତିନୋଟି ବିଷୟ ଭିନ୍ନ ସେଟିଂସ୍ ଆଇଟମ୍‌ରେ ଭିନ୍ନ ହୁଏ, ତେଣୁ ଆମେ ସେଗୁଡ଼ିକୁ ବାହାରୁ ପଠାଯାଇପାରୁଥିବା ପାରାମିଟର କରିଦେଉ।

## କଷ୍ଟମ View ବ୍ୟବହାର କରିବା

`SettingItemView` ଥିବା ପରେ, ଆମେ ଆଉ ଏକ ବଡ଼ `HStack` କୋଡ୍ ବାରମ୍ବାର ଲେଖିବାକୁ ପଡ଼େ ନାହିଁ।

ଏବେ ଏହିପରି ବ୍ୟବହାର କରିପାରିବା:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")
```

ଏହି କୋଡ୍ ଲାଇନ୍ ଏକ ସେଟିଂସ୍ ଆଇଟମ୍ View ତିଆରି କରୁଛି ଏବଂ ତିନୋଟି ପାରାମିଟର ପଠାଉଛି ବୋଲି ସୂଚାଏ:

```swift
icon: "gear"
color: Color.blue
title: "ସେଟିଂସ୍"
```

ପଠାଇବା ପରେ, `SettingItemView` ଭିତରର properties ନିଜନିଜ ସମ୍ବନ୍ଧିତ ମୂଲ୍ୟ ପାଇବ:

- `icon` ର ମୂଲ୍ୟ `gear`
- `color` ର ମୂଲ୍ୟ `Color.blue`
- `title` ର ମୂଲ୍ୟ `"ସେଟିଂସ୍"`

ତେଣୁ, View ଭିତରର `Image(systemName: icon)` ଗିୟର୍ ଆଇକନ୍ ଦେଖାଇବ, `.background(color)` ନୀଳ ପୃଷ୍ଠଭୂମି ବ୍ୟବହାର କରିବ, ଏବଂ `Text(title)` `ସେଟିଂସ୍` ଦେଖାଇବ।

ପୂର୍ଣ୍ଣ କୋଡ୍:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "ଫୋଲ୍ଡର")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "ସଙ୍ଗୀତ")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/028_view.png)

ଦେଖିପାରିବା ଯେ, ପ୍ୟାକ୍ କରିବା ପରେ ଦେଖାଯାଉଥିବା ଫଳାଫଳ ପୂର୍ବବତ୍ ରହିଛି, କିନ୍ତୁ କୋଡ୍ ଅଧିକ ସ୍ପଷ୍ଟ ହୋଇଛି।

ପୂର୍ବରୁ ପ୍ରତ୍ୟେକ ସେଟିଂସ୍ ଆଇଟମ୍ ପାଇଁ ଏକ ପୁରା `HStack` ଅଂଶ ଲେଖିବାକୁ ପଡ଼ୁଥିଲା, ଏବେ କେବଳ ଏକ ଲାଇନ୍ କୋଡ୍ ପର୍ଯ୍ୟାପ୍ତ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")
```

ଏହାହିଁ କଷ୍ଟମ View ର କାମ: **ପୁନରାବୃତ୍ତି ହେଉଥିବା View ଗଠନକୁ ପ୍ୟାକ୍ କରିବା, ଏବଂ କେବଳ ଭିନ୍ନ ବିଷୟବସ୍ତୁକୁ ପାରାମିଟର ଭାବେ ପଠାଇବା।**

## ପାରାମିଟର କାହିଁକି ପଠାଇପାରିବା

ପରେ, ଆମେ ସରଳ ଭାବେ ବୁଝିବା ଯେ କଷ୍ଟମ View କାହିଁକି ପାରାମିଟର ଗ୍ରହଣ କରିପାରେ।

SwiftUI ରେ, View ମୂଳତଃ ଏକ structure।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ନମସ୍କାର, ବିଶ୍ୱ!")
    }
}
```

ଏଠାରେ `ContentView` ଏକ structure।

ଯେତେବେଳେ ଆମେ ଲେଖୁଛୁ:

```swift
ContentView()
```

ବାସ୍ତବରେ ଆମେ ଏକ `ContentView` View ତିଆରି କରୁଛୁ।

ପଛରେ ଥିବା `()` ଏହାର initialization method କୁ କଲ୍ କରାଯାଉଛି ବୋଲି ସୂଚାଏ; ଏହାକୁ ଏହି View ତିଆରି କରିବା ବୋଲି ମଧ୍ୟ ବୁଝିପାରିବା।

କାରଣ ଏହି `ContentView` ରେ ବାହାରୁ ପଠାଇବାକୁ ପଡ଼ିବା properties ନାହିଁ, ତେଣୁ ସିଧାସଳଖ ଏହିପରି ଲେଖିପାରିବା:

```swift
ContentView()
```

କିନ୍ତୁ, ଯଦି View ଭିତରେ ମୂଲ୍ୟ ଦିଆଯାଇନଥିବା property ଥାଏ, ତେବେ View ତିଆରି କରିବାବେଳେ ସମ୍ବନ୍ଧିତ ମୂଲ୍ୟ ପଠାଇବାକୁ ପଡ଼େ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ନାମ: \(name)")
    }
}
```

ଏଠାରେ `name` ଏକ property, ଏବଂ ଏହାର default value ନାହିଁ।

ତେଣୁ `ContentView` ତିଆରି କରିବାବେଳେ, `name` ପାଇଁ ନିଶ୍ଚିତ ଏକ ମୂଲ୍ୟ ଦେବା ଆବଶ୍ୟକ:

```swift
ContentView(name: "Fang Junyu")
```

ଏହା କଲେ, View ଭିତରେ ଏହି ମୂଲ୍ୟକୁ ବ୍ୟବହାର କରିପାରିବ:

```swift
Text("ନାମ: \(name)")
```

ଏହାହିଁ `SettingItemView` ତିଆରି କରିବାବେଳେ ପାରାମିଟର ପଠାଇବାକୁ ପଡ଼ିବାର କାରଣ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")
```

କାରଣ `SettingItemView` ଭିତରେ default value ନଥିବା ତିନୋଟି properties ଅଛି:

```swift
let icon: String
let color: Color
let title: String
```

ତେଣୁ ଏହି View ତିଆରି କରିବାବେଳେ, ସେଗୁଡ଼ିକୁ ଭିତରକୁ ପଠାଇବାକୁ ପଡ଼େ। ପଠାଯାଇଥିବା ପାରାମିଟରଗୁଡ଼ିକୁ Swift View ଭିତରର properties କୁ ମୂଲ୍ୟ ଦେବା ପାଇଁ ବ୍ୟବହାର କରେ।

## Initialization method

ପରେ, initialization method କୁ ଆଉ କିଛି ଗଭୀରରେ ବୁଝିବା।

### Default initialization method

ଯେତେବେଳେ ଆମେ ଏକ ସାଧାରଣ View ପରିଭାଷିତ କରୁଛୁ:

```swift
struct ContentView: View {
    var body: some View {
        Text("ନମସ୍କାର, ବିଶ୍ୱ!")
    }
}
```

ଏହି କୋଡ୍‌ରେ, ଆମେ ହାତରେ initialization method ଲେଖିନାହିଁ।

କିନ୍ତୁ ଯେତେବେଳେ ଆମେ ଏହି View ବ୍ୟବହାର କରୁଛୁ, ଏଭଳି ଲେଖିପାରୁ:

```swift
ContentView()
```

ଏଠାରେ `()` ବାସ୍ତବରେ `ContentView` ତିଆରି କରାଯାଉଛି ବୋଲି ସୂଚାଏ; ଏହାକୁ ଏହାର initialization method କୁ କଲ୍ କରାଯାଉଛି ବୋଲି ମଧ୍ୟ ବୁଝିପାରିବା।

### initialization method ନଦେଖାଗଲେ ମଧ୍ୟ କାହିଁକି କଲ୍ କରିପାରୁ?

କାରଣ Swift compiler ଆମ ପାଇଁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ଏକ initialization method ସୃଷ୍ଟି କରିଦିଏ।

ଧ୍ୟାନ ଦେବା ଆବଶ୍ୟକ: **ଏହି initialization method ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି ହୁଏ, ଆମେ ସାଧାରଣତଃ କୋଡ୍ ଭିତରେ ଏହାକୁ ସିଧାସଳଖ ଦେଖୁନାହୁଁ।**

ଅର୍ଥାତ, ଯଦିଓ ଆମେ `struct` ଭିତରେ ହାତରେ ଏହା ଲେଖିନାହୁଁ:

```swift
init() {

}
```

ତଥାପି Swift compiler ପଛପଟରେ ଆମ ପାଇଁ ଏହିପରି ଏକ initialization method ସୃଷ୍ଟି କରେ:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("ନମସ୍କାର, ବିଶ୍ୱ!")
    }
}
```

ସେଥିପାଇଁ ଆମେ ସିଧାସଳଖ ଲେଖିପାରୁ:

```swift
ContentView()
```

ତେଣୁ, ବାସ୍ତବ କୋଡ୍‌ରେ, ସାଧାରଣତଃ initialization method କୁ ହାତରେ ଲେଖିବା ଆବଶ୍ୟକ ନାହିଁ।

କେବଳ ଏକ କଥା ବୁଝିଲେ ହେଲା: **SwiftUI View ତିଆରି କରିବାବେଳେ, ସେହି View ର initialization method କଲ୍ ହୁଏ। ଯଦି ଆମେ ହାତରେ initialization method ନଲେଖିଥାଉ, Swift ତଥାପି ଏହାକୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି କରିପାରେ।**

### ପାରାମିଟର ସହିତ initialization method

ଯଦି View ଭିତରେ default value ନଥିବା ଏକ property ଥାଏ, ଯେପରି:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ନାମ: \(name)")
    }
}
```

Swift compiler property ଅନୁସାରେ ସ୍ୱୟଂଚାଳିତ ଭାବେ ପାରାମିଟର ସହିତ initialization method ସୃଷ୍ଟି କରେ।

ସରଳ ଭାବେ ଏହାକୁ ଏଭଳି ବୁଝିପାରିବା:

```swift
init(name: String) {
    self.name = name
}
```

ଏଠାରେ:

```swift
init(name: String)
```

ଅର୍ଥ ହେଉଛି `ContentView` ତିଆରି କରିବାବେଳେ `String` ପ୍ରକାରର `name` ପାରାମିଟର ପଠାଇବାକୁ ପଡ଼ିବ।

ଯେତେବେଳେ ଆମେ ଲେଖୁଛୁ:

```swift
ContentView(name: "Fang Junyu")
```

ଅର୍ଥ ହେଉଛି: `"Fang Junyu"` କୁ initialization method ପାଇଁ ପାରାମିଟର ଭାବେ ପଠାଇବା।

ତାପରେ initialization method ଭିତରେ ଏହା ଚାଲିବ:

```swift
self.name = name
```

ଏହି କୋଡ୍ ଲାଇନ୍‌ର ଅର୍ଥ: ବାହାରୁ ପଠାଯାଇଥିବା `name` କୁ ବର୍ତ୍ତମାନ View ର ନିଜ `name` property କୁ ଅସାଇନ୍ କରିବା।

ସରଳ ଭାବେ ଏଭଳି ବୁଝିପାରିବା:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ନାମ: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ଏଭଳି କଲେ, View ଭିତରେ ପଠାଯାଇଥିବା ମୂଲ୍ୟକୁ ବ୍ୟବହାର କରିପାରିବ।

ଏହାହିଁ ପାରାମିଟର ସହିତ View ର initialization ପ୍ରକ୍ରିୟା: **View ଭିତରର property ର default value ନଥିଲେ, View ତିଆରି କରିବାବେଳେ ସମ୍ବନ୍ଧିତ ପାରାମିଟର ପଠାଇବାକୁ ପଡ଼େ, ଯାହାଦ୍ୱାରା initialization method property କୁ ମୂଲ୍ୟ ଦେବା ସମ୍ପୂର୍ଣ୍ଣ କରେ।**

## property ର default value ଥିବା ପରିସ୍ଥିତି

ଯଦି property ର ପୂର୍ବରୁ default value ଥାଏ, ତେବେ View ତିଆରି କରିବାବେଳେ ପାରାମିଟର ପଠାଇବା ଆବଶ୍ୟକ ନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ନାମ: \(name)")
    }
}
```

ଏଠାରେ `name` ର ପୂର୍ବରୁ ଏକ default value ଅଛି:

```swift
"Fang Junyu"
```

ତେଣୁ `ContentView` ତିଆରି କରିବାବେଳେ ସିଧାସଳଖ ଲେଖିପାରିବା:

```swift
ContentView()
```

ଏହି ସମୟରେ, `name` default value ବ୍ୟବହାର କରିବ, ଏବଂ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବ:

```swift
ନାମ: Fang Junyu
```

ନିଶ୍ଚୟ, View ତିଆରି କରିବାବେଳେ ଏକ ନୂତନ ମୂଲ୍ୟ ମଧ୍ୟ ପଠାଇପାରିବା:

```swift
ContentView(name: "Sam")
```

ଏହି ସମୟରେ, View default value ବ୍ୟବହାର ନକରି, ବାହାରୁ ପଠାଯାଇଥିବା `"Sam"` ବ୍ୟବହାର କରିବ, ଏବଂ ଇଣ୍ଟରଫେସ୍ ଦେଖାଇବ:

```swift
ନାମ: Sam
```

ବୁଝିବାକୁ ସୁବିଧା ପାଇଁ, Swift compiler ସ୍ୱୟଂଚାଳିତ ଭାବେ ସୃଷ୍ଟି କରୁଥିବା initialization method କୁ ସରଳ ଭାବେ ଏଭଳି ଭାବିପାରିବା:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ଏଠାରେ `name: String = "Fang Junyu"` ର ଅର୍ଥ: View ତିଆରି କରିବାବେଳେ `name` ପଠାଯାଇନଥିଲେ default value `"Fang Junyu"` ବ୍ୟବହାର କର; View ତିଆରି କରିବାବେଳେ ନୂତନ `name` ପଠାଯାଇଥିଲେ ପଠାଯାଇଥିବା ମୂଲ୍ୟ ବ୍ୟବହାର କର।

ଅର୍ଥାତ: **ବାହାରୁ ପାରାମିଟର ନପଠାଯାଇଥିଲେ property ର default value ବ୍ୟବହାର ହୁଏ; ବାହାରୁ ପାରାମିଟର ପଠାଯାଇଥିଲେ ପଠାଯାଇଥିବା ମୂଲ୍ୟ ବ୍ୟବହାର ହୁଏ।**

## SettingItemView କୁ ପୁଣି ଦେଖିବା

ଏବେ ଆମେ ପୁଣି SettingItemView କୁ ଦେଖିବା:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ଏହି View ର ଗଠନ ସ୍ଥିର।

ସ୍ଥିର ଅଂଶଗୁଡ଼ିକ ହେଲା:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

ଭିନ୍ନ ଅଂଶଗୁଡ଼ିକ ହେଲା:

```swift
icon
color
title
```

ତେଣୁ, ଆମେ ଭିନ୍ନ ବିଷୟବସ୍ତୁକୁ properties କରୁଛୁ, ଏବଂ View ତିଆରି କରିବାବେଳେ ପାରାମିଟର ଭାବେ ପଠାଉଛୁ।

ଯେତେବେଳେ ଆମେ ଭିନ୍ନ ସେଟିଂସ୍ ଆଇଟମ୍ ତିଆରି କରୁଛୁ, କେବଳ ଭିନ୍ନ ପାରାମିଟର ପଠାଇବାକୁ ପଡ଼େ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")
SettingItemView(icon: "folder", color: Color.brown, title: "ଫୋଲ୍ଡର")
SettingItemView(icon: "music.note", color: Color.purple, title: "ସଙ୍ଗୀତ")
```

ଏଭଳି କଲେ, ସେହି ଏକେ `SettingItemView` ତିନୋଟି ଭିନ୍ନ ସେଟିଂସ୍ ଆଇଟମ୍ ଦେଖାଇପାରିବ।

ଏହା କଷ୍ଟମ View ର ସବୁଠୁ ସାଧାରଣ ବ୍ୟବହାର ପ୍ରକାର।

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ କଷ୍ଟମ View ଶିଖିଲୁ।

କଷ୍ଟମ View ର ମୂଳ କାମ ହେଉଛି: **ପୁନରାବୃତ୍ତି ହେଉଥିବା View କୋଡ୍‌କୁ ପ୍ୟାକ୍ କରିବା, ଯାହାଦ୍ୱାରା ଏହାକୁ ପୁଣି ବ୍ୟବହାର କରିପାରିବା।**

ଏହି ଉଦାହରଣରେ, ତିନୋଟି ସେଟିଂସ୍ ଆଇଟମ୍‌ର ଗଠନ ସମାନ, କେବଳ ଆଇକନ୍, ରଙ୍ଗ ଏବଂ ଶୀର୍ଷକ ଭିନ୍ନ।

ତେଣୁ ଆମେ ଏକ `SettingItemView` ତିଆରି କଲୁ:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ତାପରେ, ଏହି View ବ୍ୟବହାର କରିବାବେଳେ ଭିନ୍ନ ପାରାମିଟର ପଠାଉଛୁ:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "ସେଟିଂସ୍")
```

ଏଠାରେ ଥିବା ପାରାମିଟରଗୁଡ଼ିକ `SettingItemView` ଭିତରକୁ ଯିବ।

ଏହି ପ୍ରକାରରେ, ଆମେ କମ୍ କୋଡ୍ ବ୍ୟବହାର କରି ସମାନ ଗଠନ କିନ୍ତୁ ଭିନ୍ନ ବିଷୟବସ୍ତୁ ଥିବା Views ତିଆରି କରିପାରୁ।

ଏହା SwiftUI ବିକାଶରେ ବହୁତ ସାଧାରଣ ଏକ ଲେଖନ ପ୍ରକାର ମଧ୍ୟ।
