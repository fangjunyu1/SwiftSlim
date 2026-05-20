# ଫଟୋ ଗ୍ୟାଲେରୀ

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ଫଟୋ ଗ୍ୟାଲେରୀ ପୃଷ୍ଠା ତିଆରି କରିବୁ।

![view](../../../Resource/032_view13.png)

ଏହି ଉଦାହରଣରେ, ଆମେ `extension`, `self` ଏବଂ instance ସମ୍ପର୍କିତ ଜ୍ଞାନ ପୁନରାବୃତ୍ତି କରିବୁ, ଏବଂ SwiftUI ରେ ସାଧାରଣତଃ ବ୍ୟବହୃତ `Shape` ଗ୍ରାଫିକ୍ସ ଶିଖିବୁ।

ଏହି ଜ୍ଞାନ ଦ୍ୱାରା, ଆମେ ସାଧାରଣ ଛବିକୁ ବୃତ୍ତ, ଗୋଲାକାର କୋଣ ଥିବା ଆୟତ, କ୍ୟାପ୍ସୁଲ୍ ଆକାର, ଏଲିପ୍ସ ଇତ୍ୟାଦି ଭିନ୍ନ ଶୈଳୀରେ କାଟିପାରିବୁ, ଏବଂ ଫଟୋରେ ବର୍ଡର ପ୍ରଭାବ ଯୋଗ କରିପାରିବୁ।

ଏହି ପାଠରେ କିଛି ନୂତନ ଜ୍ଞାନ ବିନ୍ଦୁ ବ୍ୟବହାର ହେବ: `Shape`, `clipShape`, `strokeBorder` ଏବଂ `overlay`।

ଏଥିରେ, `clipShape` ଭ୍ୟୁର ଆକାର କାଟିବା ପାଇଁ, `strokeBorder` ଆକୃତିର ବର୍ଡର ଅଙ୍କିବା ପାଇଁ, ଏବଂ `overlay` ଭ୍ୟୁର ଉପରେ ନୂତନ ଭ୍ୟୁ ରଖିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

## ଛବି ସାମଗ୍ରୀ

ଆରମ୍ଭ କରିବା ପୂର୍ବରୁ, ଆମେ କିଛି ଛବି ପ୍ରସ୍ତୁତ କରିବା ଆବଶ୍ୟକ।

ଆପଣ ନିଜ ଫଟୋ ବ୍ୟବହାର କରିପାରିବେ, କିମ୍ବା ଏହି ପାଠରେ ଦିଆଯାଇଥିବା ଉଦାହରଣ ଛବି ବ୍ୟବହାର କରିପାରିବେ।

ଏହି ପାଠର ଫଟୋ ଉଦାହରଣଗୁଡ଼ିକ [Pixabay](https://pixabay.com/) ୱେବସାଇଟରୁ ନିଆଯାଇଛି:

[ଦୃଶ୍ୟ](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [ଶିଆଳ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [ଭବନ](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [ଫୁଲ](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [ହଂସ](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

ଛବିଗୁଡ଼ିକ ଡାଉନଲୋଡ୍ କରିବା ପରେ, ସେଗୁଡ଼ିକୁ `Assets` ରିସୋର୍ସ ଫୋଲ୍ଡରରେ ଯୋଡ଼ନ୍ତୁ, ଏବଂ କ୍ରମକ୍ରମେ `1`, `2`, `3`, `4`, `5` ଭାବେ ନାମ ଦିଅନ୍ତୁ।

![assets](../../../Resource/032_view17.png)

ଏପରି କଲେ, ଆମେ SwiftUI ରେ `Image("1")`, `Image("2")` ଭଳି ଲେଖି ଛବି ଦେଖାଇପାରିବୁ।

## ଫଟୋ ଦେଖାଇବା

ପ୍ରଥମେ, ଆମେ `ContentView` ଭିତରେ 5ଟି ଫଟୋ ଦେଖାଇବୁ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![view](../../../Resource/032_view.png)

ଏହି କୋଡ୍‌ରେ, ଆମେ `ScrollView` ବ୍ୟବହାର କରି ଫଟୋ ତାଲିକାର ସ୍କ୍ରୋଲିଂ ଦେଖାଣି ସୃଷ୍ଟି କରିଛୁ, ଏବଂ `VStack` ବ୍ୟବହାର କରି ଅନେକ ଛବିକୁ ଉପରୁ ତଳକୁ ସଜାଇଛୁ।

ପ୍ରତ୍ୟେକ ଛବିରେ `.resizable()`, `.scaledToFit()` ଏବଂ `.frame(width: 300)` ମାଧ୍ୟମରେ ଛବିର ଦେଖାଣି ପ୍ରଭାବ ସେଟ୍ କରାଯାଇଛି, ଯାହା ଛବିକୁ ସ୍କେଲ୍ କରିବା, ଅନୁପାତ ରଖି ପୂର୍ଣ୍ଣ ଭାବେ ଦେଖାଇବା, ଏବଂ ଛବିର ପ୍ରସ୍ଥ ସୀମିତ କରିବାକୁ ସମ୍ଭବ କରେ।

`VStack` ଉପରେ ଥିବା `.padding(.vertical, 100)` ଉପର ଏବଂ ତଳ ଖାଲି ଜାଗା ବଢ଼ାଇବା ପାଇଁ, ଯେପରି ପ୍ରଥମ ଏବଂ ଶେଷ ଫଟୋ ସ୍କ୍ରିନ୍ କଣ୍ଠକୁ ଅତିକ୍ରମରେ ଲଗି ନଯାଏ।

ଶେଷର `.ignoresSafeArea()` ର ଅର୍ଥ ହେଉଛି ସ୍କ୍ରୋଲ୍ ଭ୍ୟୁ ସେଫ୍ ଏରିଆକୁ ଅନଦେଖା କରିବ, ଯାହା ଦ୍ୱାରା ଫଟୋ ସ୍କ୍ରୋଲ୍ କରିବାବେଳେ ସ୍କ୍ରିନର ଶୀର୍ଷ ଏବଂ ତଳ ପର୍ଯ୍ୟନ୍ତ ବିସ୍ତାରିତ ହୋଇପାରେ, ଏବଂ ପୃଷ୍ଠା ଅଧିକ ପୂର୍ଣ୍ଣ ଭାବେ ଦେଖାଯାଏ।

କିନ୍ତୁ, ବର୍ତ୍ତମାନ 5ଟି ଛବି ସମାନ modifier ବ୍ୟବହାର କରୁଛି:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

ଯେତେବେଳେ ଆମେ ପୁନରାବୃତ୍ତ କୋଡ୍ ଦେଖୁଛୁ, ସେତେବେଳେ `extension` ବ୍ୟବହାର କରି ସେଥିକୁ ସଜାଇବା ବିଚାର କରିପାରିବୁ।

## extension ବ୍ୟବହାର କରି ଛବି ଶୈଳୀ ସଜାଇବା

ଆମେ `Image` ପାଇଁ ଫଟୋ ଗ୍ୟାଲେରୀ ନିମନ୍ତେ ଏକ ବିଶେଷ ପ୍ରଣାଳୀ ବିସ୍ତାର କରିପାରିବୁ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ଏଠାରେ, ଆମେ `Image` ପ୍ରକାରକୁ `photoGalleryStyle` ନାମକ ଏକ ପ୍ରଣାଳୀ ସହିତ ବିସ୍ତାର କରିଛୁ।

ଏହି ପ୍ରଣାଳୀର ଭିତରେ ପୂର୍ବରୁ ପୁନରାବୃତ୍ତି ହୋଇଥିବା `.resizable()`, `.scaledToFit()` ଏବଂ `.frame(width: 300)` ରହିଛି। ଅର୍ଥାତ, ଏହା ଛବି ସ୍କେଲିଂ, ଅନୁପାତିକ ଦେଖାଣି ଏବଂ ପ୍ରସ୍ଥ ସେଟିଂ କୋଡ୍‌ଗୁଡ଼ିକୁ ଏକଠା କରେ।

ଏହି extension ବ୍ୟବହାର କରିବା ପରେ, ପୂର୍ବରୁ ଥିବା ଛବି କୋଡ୍:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ଏଭଳି ସରଳ କରିପାରିବ:

```swift
Image("1")
    .photoGalleryStyle()
```

ଏପରି କଲେ, ପ୍ରତ୍ୟେକ ଛବିକୁ କେବଳ `.photoGalleryStyle()` କଲ୍ କରିବା ଦରକାର, ଏବଂ ସମାନ ଫଟୋ ଗ୍ୟାଲେରୀ ଶୈଳୀ ଲାଗୁ ହେବ। କୋଡ୍ ଅଧିକ ସରଳ ହେବ, ଏବଂ ପରେ ଏକାସାଥିରେ ସଂଶୋଧନ କରିବା ମଧ୍ୟ ସହଜ ହେବ।

## self ବୁଝିବା

extension ପ୍ରଣାଳୀରେ, ଆମେ `self` ଲେଖିଛୁ:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ଏଠାରେ `self` ଅର୍ଥ, ଏହି ପ୍ରଣାଳୀକୁ କଲ୍ କରୁଥିବା ବର୍ତ୍ତମାନର ଛବି instance।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Image("1")
    .photoGalleryStyle()
```

ଏହି କୋଡ୍‌ରେ, `photoGalleryStyle()` କୁ `Image("1")` କଲ୍ କରୁଛି, ତେଣୁ ପ୍ରଣାଳୀ ଭିତରର `self` ଏହି `Image("1")` ଛବିକୁ ସୂଚାଏ।

ସହଜ ଭାବେ ବୁଝିଲେ: ଯିଏ ଏହି ପ୍ରଣାଳୀକୁ କଲ୍ କରେ, `self` ସେହି ଜିନିଷକୁ ସୂଚାଏ।

ଏଠାରେ ଧ୍ୟାନ ଦିଅନ୍ତୁ, SwiftUI ର modifier ଗୁଡ଼ିକ ଲଗାତାର ନୂତନ view result ଫେରାଇଥାଏ। ତେଣୁ, `photoGalleryStyle()` ଯାହା ଫେରାଏ, ସେହିଟା modifier ଲାଗିଥିବା ଏକ view, କେବଳ ମୂଳ `Image` ନୁହେଁ।

## ଫଟୋ ଆକୃତି

ବର୍ତ୍ତମାନ, ଫଟୋଗୁଡ଼ିକ ସାମାନ୍ୟ ଭାବେ ଦେଖାଯାଉଛି। କିନ୍ତୁ ଏହି ଫଟୋଗୁଡ଼ିକ ଡିଫଲ୍ଟରେ ଆୟତାକାର, ଦେଖିବାକୁ ସାଧାରଣ ଲାଗେ।

ଯଦି କେବଳ ଫଟୋକୁ ଗୋଲାକାର କୋଣ ଦେବାକୁ ଚାହୁଁଛୁ, ସିଧାସଳଖ `.cornerRadius()` ବ୍ୟବହାର କରିପାରିବୁ:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` ର ଅର୍ଥ ହେଉଛି ଛବିକୁ `20 pt` ର ଗୋଲାକାର କୋଣ ଦେବା। ସାଧାରଣ ଗୋଲାକାର କୋଣ ଥିବା ଛବି ପାଇଁ, ଏହି ଲେଖା ପ୍ରଚୁର।

କିନ୍ତୁ, `.cornerRadius()` କେବଳ ଗୋଲାକାର କୋଣ ପ୍ରଭାବକୁ ସମ୍ଭାଳିପାରେ, ସାଧାରଣ rounded image ପାଇଁ ଏହା ଉପଯୁକ୍ତ। ଯଦି ଆମେ ଫଟୋକୁ ଅଧିକ ବିଭିନ୍ନ ଆକୃତିରେ ପରିଣତ କରିବାକୁ ଚାହୁଁ, କେବଳ ଏହି modifier ପର୍ଯ୍ୟାପ୍ତ ନୁହେଁ।

ଏହି ସମୟରେ SwiftUI ର `Shape` ବ୍ୟବହାର କରିବା ଦରକାର। `Shape` ଭିନ୍ନ ଭିନ୍ନ ଗ୍ରାଫିକ୍ ଆକୃତିକୁ ସୂଚାଇପାରେ, ଏବଂ `clipShape` ସହ ମିଶାଇଲେ ଛବିକୁ ସେହି ଆକୃତିରେ କାଟିପାରିବ।

## Shape ପରିଚୟ

SwiftUI ରେ, `Shape` ର ଅର୍ଥ ହେଉଛି ଗ୍ରାଫିକ୍ ଆକୃତି। `View` ପରି, ଏହା ମଧ୍ୟ SwiftUI ରେ ବହୁତ ସାଧାରଣ ଭାବେ ବ୍ୟବହୃତ ଏକ ପ୍ରକାର।

ସାଧାରଣ `Shape` ମଧ୍ୟରେ ବୃତ୍ତ, ଆୟତ, ଗୋଲାକାର କୋଣ ଥିବା ଆୟତ, କ୍ୟାପ୍ସୁଲ୍ ଆକାର ଏବଂ ଏଲିପ୍ସ ରହିଛି। ଭିନ୍ନ ଗ୍ରାଫିକ୍‌ର ଦେଖାଣିକୁ ଅଧିକ ସ୍ପଷ୍ଟ ଭାବରେ ଦେଖିବା ପାଇଁ, ତଳର ଉଦାହରଣରେ ପ୍ରତ୍ୟେକ ଗ୍ରାଫିକ୍‌କୁ ଭିନ୍ନ ରଙ୍ଗ ଏବଂ ଆକାର ଦିଆଯିବ।

ଏହି ଉଦାହରଣଗୁଡ଼ିକରେ, `.fill()` ଆକୃତିକୁ ରଙ୍ଗରେ ପୂରଣ କରିବା ପାଇଁ, ଏବଂ `.frame()` ଆକୃତିର ଦେଖାଣି ଆକାର ସେଟ୍ କରିବା ପାଇଁ ବ୍ୟବହୃତ। ରଙ୍ଗ କେବଳ ଭିନ୍ନ ଗ୍ରାଫିକ୍‌କୁ ଅଲଗା କରିବା ପାଇଁ, ସେଗୁଡ଼ିକ ଗ୍ରାଫିକ୍‌ର ନିଜସ୍ୱ ସ୍ଥିର ରଙ୍ଗ ନୁହେଁ।

### Circle ବୃତ୍ତ

`Circle` ବୃତ୍ତକୁ ସୂଚାଏ। ଏହା ପ୍ରାୟତଃ avatar, ବୃତ୍ତାକାର button, ବୃତ୍ତାକାର ଛବି ଇତ୍ୟାଦି UI ପ୍ରଭାବ ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle ଆୟତ

`Rectangle` ଆୟତକୁ ସୂଚାଏ। ଏହା ସବୁଠାରୁ ମୂଳ ଗ୍ରାଫିକ୍‌ମଧ୍ୟରୁ ଗୋଟିଏ, ଏବଂ background, ଅଞ୍ଚଳ ବିଭାଜନ କିମ୍ବା ସାଧାରଣ border ତିଆରି ପାଇଁ ବ୍ୟବହୃତ ହୋଇପାରେ।

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle ଗୋଲାକାର କୋଣ ଥିବା ଆୟତ

`RoundedRectangle` ଗୋଲାକାର କୋଣ ଥିବା ଆୟତକୁ ସୂଚାଏ। `cornerRadius` କୋଣର ଗୋଲାଇ ଆକାର ସେଟ୍ କରିବା ପାଇଁ ବ୍ୟବହୃତ।

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule କ୍ୟାପ୍ସୁଲ୍ ଆକାର

`Capsule` କ୍ୟାପ୍ସୁଲ୍ ଆକାରକୁ ସୂଚାଏ। ଏହାର ଦୁଇ ପାର୍ଶ୍ୱ ଅର୍କ୍ ଆକୃତିର, ଏବଂ ଏହା ପ୍ରାୟତଃ capsule button, tag background ଇତ୍ୟାଦି UI ପ୍ରଭାବରେ ବ୍ୟବହୃତ ହୁଏ।

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ଏଲିପ୍ସ

`Ellipse` ଏଲିପ୍ସକୁ ସୂଚାଏ। ଏହା `Circle` ସହ ସମାନ, କିନ୍ତୁ ପ୍ରସ୍ଥ ଓ ଉଚ୍ଚତା ଅସମାନ ହେଲେ, ଏହା ଏଲିପ୍ସ ଭାବେ ଦେଖାଯାଏ।

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

ଏହି ଉଦାହରଣଗୁଡ଼ିକ ଦ୍ୱାରା ଦେଖିପାରିବା, `Shape` ନିଜେ ସିଧାସଳଖ ଗ୍ରାଫିକ୍ ଭାବେ ଦେଖାଯାଇପାରେ। ପରେ, ଆମେ ଏହି `Shape` ଗୁଡ଼ିକୁ `clipShape` ସହ ମିଶାଇ ଫଟୋ କାଟିବୁ, ଯାହା ଫଟୋକୁ ଭିନ୍ନ ଆକୃତିରେ ଦେଖାଇବ।

## clipShape ବ୍ୟବହାର କରି ଫଟୋ କାଟିବା

ବର୍ତ୍ତମାନ, ଆମେ `clipShape` ବ୍ୟବହାର କରି ଫଟୋକୁ ଭିନ୍ନ ଆକୃତିରେ କାଟିପାରିବୁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ପ୍ରଥମ ଫଟୋକୁ ବୃତ୍ତ ଆକାରରେ କାଟିବା:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ: ପ୍ରଥମେ ଗୋଟିଏ ଛବି ଦେଖାଇବା, ତାପରେ `Circle()` ବ୍ୟବହାର କରି ଏହାକୁ ବୃତ୍ତରେ କାଟିବା।

![view](../../../Resource/032_view2.png)

`clipShape` ର ମୂଳ ଲେଖା ହେଉଛି:

```swift
.clipShape(ଆକୃତି)
```

ଭ୍ୟୁର ପଛରେ `.clipShape(...)` ଯୋଡ଼ନ୍ତୁ, ଏବଂ ବ୍ରାକେଟ୍ ଭିତରେ ଯେଉଁ ଗ୍ରାଫିକ୍ ଆକୃତିରେ କାଟିବାକୁ ଚାହୁଁଛନ୍ତି, ସେହିଟି ଲେଖନ୍ତୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ବର୍ତ୍ତମାନ, ଆମେ 5ଟି ଫଟୋକୁ ଭିନ୍ନ ଆକୃତିରେ କାଟିବୁ:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![view](../../../Resource/032_view8.png)

ଏଥିରେ, `Rectangle()` ଦ୍ୱାରା କାଟାଯାଇଥିବା ପ୍ରଭାବ ସାଧାରଣ ଆୟତାକାର ଫଟୋ ସହ ମିଳିଥାଏ, ସେଥିପାଇଁ ଚକ୍ଷୁଗୋଚର ପରିବର୍ତ୍ତନ ସ୍ପଷ୍ଟ ନୁହେଁ; ଏହା ପ୍ରଧାନତଃ ଅନ୍ୟ ଆକୃତି ସହ ତୁଳନା ପାଇଁ ବ୍ୟବହୃତ।

ବର୍ତ୍ତମାନ, ଫଟୋଗୁଡ଼ିକ କେବଳ ସାଧାରଣ ଆୟତ ନୁହେଁ, ଭିନ୍ନ ଆକୃତି ଥିବା ଫଟୋ ହୋଇଛି।

## ଫଟୋ ବର୍ଡର ଯୋଡ଼ିବା

ଯଦି ଆମେ ବୃତ୍ତାକାର ଫଟୋରେ ବର୍ଡର ଯୋଡ଼ିବାକୁ ଚାହୁଁ, ହୋଇପାରେ `border` ବ୍ୟବହାର କରିବାକୁ ଭାବିବୁ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

କିନ୍ତୁ, ଏଭଳି କଲେ ସାଧାରଣତଃ ବୃତ୍ତାକାର ବର୍ଡର ମିଳେନାହିଁ, ବରଂ ଗୋଟିଏ ଆୟତାକାର ବର୍ଡର ମିଳେ।

![view](../../../Resource/032_view9.png)

କାରଣ `border` ଭ୍ୟୁର ଆୟତାକାର ଅଞ୍ଚଳ ଅନୁସାରେ ବର୍ଡର ଯୋଡ଼େ, `clipShape` ଦ୍ୱାରା କାଟାଯାଇଥିବା ଆକୃତି ଅନୁସାରେ ନୁହେଁ।

ତେଣୁ, ଯଦି ଆମେ ବୃତ୍ତାକାର ବର୍ଡର ଚାହୁଁ, ସିଧାସଳଖ `border` ବ୍ୟବହାର କରିପାରିବୁ ନାହିଁ।

## strokeBorder ବ୍ୟବହାର କରି ଆକୃତି ବର୍ଡର ଅଙ୍କିବା

SwiftUI ରେ, `strokeBorder` ଏହି ସାଧାରଣ `Shape` ଗୁଡ଼ିକୁ ଭିତରମୁଖୀ ବର୍ଡର ଅଙ୍କିପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଗୋଟିଏ ବୃତ୍ତାକାର ବର୍ଡର ଅଙ୍କିବା:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ: `Circle` ପାଇଁ ଗୋଟିଏ ଧୂସର-ବାଦାମୀ ବର୍ଡର ଅଙ୍କାଯାଉଛି, ଏବଂ ବର୍ଡରର ପ୍ରସ୍ଥ `10 pt`।

![view](../../../Resource/032_view12.png)

ଏଠାରେ ଧ୍ୟାନ ଦିଅନ୍ତୁ, `strokeBorder` ସିଧାସଳଖ ଫଟୋରେ ବର୍ଡର ଯୋଡ଼ୁନାହିଁ, ବରଂ `Circle()` ଏହି ଗ୍ରାଫିକ୍ ପାଇଁ ବର୍ଡର ଅଙ୍କୁଛି।

ଅର୍ଥାତ, ଏହି କୋଡ୍‌ର ଫଳରେ କେବଳ ଗୋଟିଏ ସ୍ୱତନ୍ତ୍ର ବୃତ୍ତାକାର ବର୍ଡର ମିଳେ, ଏବଂ ଏହାର ଫଟୋ ସହ ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ସମ୍ପର୍କ ନାହିଁ।

ଯଦି ଏହି ବୃତ୍ତାକାର ବର୍ଡରକୁ ଫଟୋର ଉପରେ ଦେଖାଇବାକୁ ଚାହୁଁ, ତେବେ `overlay` ବ୍ୟବହାର କରିବାକୁ ପଡ଼ିବ, ଯାହା ଦ୍ୱାରା ବର୍ଡରକୁ ଫଟୋ ଉପରେ ରଖାଯାଏ।

## overlay ବ୍ୟବହାର କରି ବର୍ଡର ଉପରେ ରଖିବା

`overlay` ଗୋଟିଏ view modifier, ଯାହା ବର୍ତ୍ତମାନର view ଉପରେ ନୂତନ view ରଖିପାରେ।

ଏହାର ମୂଳ ଗଠନକୁ ଏଭଳି ବୁଝିପାରିବା:

```swift
ବର୍ତ୍ତମାନ ଭ୍ୟୁ
    .overlay {
        ଉପରେ ରଖାଯାଇଥିବା ଭ୍ୟୁ
    }
```

ଏହି ଉଦାହରଣରେ, ବର୍ତ୍ତମାନର view ହେଉଛି ବୃତ୍ତରେ କାଟାଯାଇଥିବା ଫଟୋ:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

ଆମେ ଯେଉଁ ନୂତନ view ଉପରେ ରଖିବାକୁ ଚାହୁଁଛୁ, ସେହା ହେଉଛି ଗୋଟିଏ ବୃତ୍ତାକାର ବର୍ଡର:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

ତେଣୁ, ଫଟୋ ଏବଂ ବର୍ଡରକୁ ଏଭଳି ମିଶାଇପାରିବା:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ଏଠାରେ `overlay` ର ଅର୍ଥ ହେଉଛି ବର୍ତ୍ତମାନ view ଉପରେ ଗୋଟିଏ ନୂତନ view ରଖିବା।

`overlay` ଭିତରେ, ବର୍ଡର ବର୍ତ୍ତମାନର ଫଟୋର ଦେଖାଣି ଅଞ୍ଚଳକୁ ଅନୁସରଣ କରି ରଖାଯାଏ, ସେଥିପାଇଁ ଆଉ ଅଲଗା `frame` ସେଟ୍ କରିବା ଦରକାର ନାହିଁ। ବର୍ଡର ଆକୃତି ଏବଂ କାଟିବା ଆକୃତି ଏକେ ଥିଲେ, ବର୍ଡର ଫଟୋ ସହ ଠିକ୍ ଭାବେ ମିଳିଯିବ।

![view](../../../Resource/032_view10.png)

ଅନ୍ତିମ ପ୍ରଭାବ ହେଉଛି, ବୃତ୍ତାକାର ଫଟୋର ଉପରେ ଗୋଟିଏ ବୃତ୍ତାକାର ବର୍ଡର ଢାକି ରହିଛି।

`ZStack` ସହ ତୁଳନା କଲେ, `overlay` ଏହି ପ୍ରକାରର “ବର୍ତ୍ତମାନ view ପାଇଁ ସଜାଣି ଯୋଡ଼ିବା” ଦୃଶ୍ୟପଟରେ ଅଧିକ ଉପଯୁକ୍ତ। ଫଟୋ ହେଉଛି ମୁଖ୍ୟ ଅଂଶ, ବର୍ଡର କେବଳ ଅତିରିକ୍ତ ପ୍ରଭାବ, ତେଣୁ `overlay` ବ୍ୟବହାର କଲେ ଅଧିକ ସ୍ପଷ୍ଟ ଲାଗେ।

## ଫଟୋ ଗ୍ୟାଲେରୀ ସମ୍ପୂର୍ଣ୍ଣ କରିବା

ବର୍ତ୍ତମାନ, ଆମେ ପ୍ରତ୍ୟେକ ଫଟୋକୁ ସମ୍ବନ୍ଧିତ ଆକୃତି ଏବଂ ବର୍ଡର ଯୋଡ଼ିବୁ:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ଦେଖାଯାଉଥିବା ପ୍ରଭାବ:

![view](../../../Resource/032_view13.png)

ଏପରି କରି, ଗୋଟିଏ ମୂଳ ଫଟୋ ଗ୍ୟାଲେରୀ ପୃଷ୍ଠା ସମ୍ପୂର୍ଣ୍ଣ ହେଲା।

ଏହି ପୃଷ୍ଠାରେ, ଆମେ `ScrollView` ବ୍ୟବହାର କରି ସ୍କ୍ରୋଲ୍ ଦେଖାଣି ସୃଷ୍ଟି କରିଛୁ, `Image` ବ୍ୟବହାର କରି ଫଟୋ ଦେଖାଇଛୁ, `clipShape` ବ୍ୟବହାର କରି ଫଟୋର ଆକୃତି କାଟିଛୁ, ଏବଂ `overlay` ଓ `strokeBorder` ମାଧ୍ୟମରେ ବର୍ଡର ଯୋଡ଼ିଛୁ।

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ଫଟୋ ଗ୍ୟାଲେରୀ ପୃଷ୍ଠା ସମ୍ପୂର୍ଣ୍ଣ କଲୁ।

![view](../../../Resource/032_view13.png)

ଏହି ଉଦାହରଣରେ, ଆମେ ପ୍ରଥମେ `Image` ବ୍ୟବହାର କରି ଫଟୋ ଦେଖାଇଲୁ, ତାପରେ `extension` ଦ୍ୱାରା `Image` ପାଇଁ `photoGalleryStyle` ନାମକ ଏକ ପ୍ରଣାଳୀ ବିସ୍ତାର କଲୁ, ଯାହା ପୁନରାବୃତ୍ତ ଛବି ଶୈଳୀ କୋଡ୍ ସଜାଇବା ପାଇଁ ବ୍ୟବହୃତ।

ତାପରେ, ଆମେ SwiftUI ର ସାଧାରଣ `Shape` ଶିଖିଲୁ, ଯେପରି `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ଏବଂ `Ellipse`। ଏହି ଗ୍ରାଫିକ୍‌ଗୁଡ଼ିକ କେବଳ ସିଧାସଳଖ ଦେଖାଯାଇପାରେ ନୁହେଁ, `clipShape` ସହ ମିଶି view କାଟିବା ପାଇଁ ମଧ୍ୟ ବ୍ୟବହୃତ ହୋଇପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
.clipShape(Circle())
```

ଏହାର ଅର୍ଥ ହେଉଛି view କୁ ବୃତ୍ତ ଆକାରରେ କାଟିବା।

ଶେଷରେ, ଆମେ `overlay` ଏବଂ `strokeBorder` ବ୍ୟବହାର କରି ଫଟୋରେ ସମ୍ବନ୍ଧିତ ଆକୃତିର ବର୍ଡର ଯୋଡ଼ିଲୁ। ଧ୍ୟାନ ଦେବା ଦରକାର, `border` ସାଧାରଣତଃ view ର ଆୟତାକାର ଅଞ୍ଚଳ ଅନୁସାରେ ବର୍ଡର ଅଙ୍କେ। ଯଦି ବର୍ଡରକୁ ବୃତ୍ତ, କ୍ୟାପ୍ସୁଲ୍ ଆକାର କିମ୍ବା ଏଲିପ୍ସ ଅନୁସାରେ ଚଳିବାକୁ ଚାହୁଁ, ସମାନ `Shape` ବ୍ୟବହାର କରି ଉପରେ ରଖିବା ଅଧିକ ଉପଯୁକ୍ତ।

ଏହି ପାଠ ମାଧ୍ୟମରେ, ଆମେ କେବଳ ଫଟୋ ଗ୍ୟାଲେରୀ ପ୍ରଭାବ ସମ୍ପୂର୍ଣ୍ଣ କଲୁ ନୁହେଁ, ବରଂ UI ରେ `Shape`, `clipShape`, `strokeBorder` ଏବଂ `overlay` ର ସାଧାରଣ ସଂଯୋଗ ପ୍ରଣାଳୀକୁ ମଧ୍ୟ ବୁଝିଲୁ।

## ପାଠ ପରବର୍ତ୍ତୀ ଅଭ୍ୟାସ

### 1. ଫଟୋ ଗ୍ୟାଲେରୀ background ଯୋଡ଼ନ୍ତୁ

ଫଟୋ ଗ୍ୟାଲେରୀ ପୃଷ୍ଠାକୁ ଗୋଟିଏ full-screen background image ଯୋଡ଼ନ୍ତୁ।

ଆବଶ୍ୟକତା: background image ସମ୍ପୂର୍ଣ୍ଣ ସ୍କ୍ରିନ୍ ଭରିପାରିବ, ଏବଂ safe area ଅନଦେଖା କରିବ।

### 2. ଗ୍ରାଡିଏଣ୍ଟ ବର୍ଡର

ବର୍ତ୍ତମାନର ଏକରଙ୍ଗା ବର୍ଡରକୁ linear gradient border ରେ ପରିବର୍ତ୍ତନ କରନ୍ତୁ।

ଅଧିକ ସମୃଦ୍ଧ ବର୍ଡର ପ୍ରଭାବ ପାଇଁ `LinearGradient` ବ୍ୟବହାର କରି ଚେଷ୍ଟା କରନ୍ତୁ।

### 3. ବାସ୍ତବ ଫଟୋ ବର୍ଡର ଅନୁକରଣ

ଇଣ୍ଟରନେଟରେ କିଛି ବାସ୍ତବ ଫଟୋ ବର୍ଡର ଶୈଳୀ ଖୋଜନ୍ତୁ, ଏବଂ `overlay` ବ୍ୟବହାର କରି ଛବି ବର୍ଡର ଉପରେ ରଖିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ, ଯାହା ଫଟୋକୁ ଅଧିକ ବାସ୍ତବ frame ପରି ଦେଖାଇବ।

ଅଭ୍ୟାସ ଦେଖାଣି ପ୍ରଭାବ:

![button](../../../Resource/032_view15.jpeg)

### 4. ଗୋଲାକାର କୋଣ ଥିବା button border ତିଆରି କରନ୍ତୁ

ବାସ୍ତବ ବିକାଶରେ, button ଗୁଡ଼ିକ ପ୍ରାୟତଃ rounded rectangle border ବ୍ୟବହାର କରେ।

ଗୋଟିଏ rounded button ତିଆରି କରିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ, ଏବଂ `RoundedRectangle` ଓ `strokeBorder` ବ୍ୟବହାର କରି button ପାଇଁ rounded border ଯୋଡ଼ନ୍ତୁ।

ଅଭ୍ୟାସ ଦେଖାଣି ପ୍ରଭାବ:

![button](../../../Resource/032_view14.png)

### ଚିନ୍ତନ ପ୍ରଶ୍ନ

ଯଦି ଆପଣ ଏକରଙ୍ଗା ବର୍ଡର ବ୍ୟବହାର କରିବାକୁ ନାହିଁ, ଗ୍ରାଡିଏଣ୍ଟ ବର୍ଡର ବ୍ୟବହାର କରିବାକୁ ମଧ୍ୟ ନାହିଁ, ବରଂ ବର୍ଡରକୁ କୌଣସି ପ୍ୟାଟର୍ନ ଭଳି ପ୍ରଭାବ ଦେବାକୁ ଚାହୁଁଛନ୍ତି, ତେବେ କିପରି କରିବେ?

ସୂଚନା ଖୋଜି, `overlay`, `mask` କିମ୍ବା `ImagePaint` ଭଳି ସମ୍ବନ୍ଧିତ ବ୍ୟବହାର ବୁଝିବାକୁ ଚେଷ୍ଟା କରିପାରିବେ।

ଅଭ୍ୟାସ ଦେଖାଣି ପ୍ରଭାବ:

![button](../../../Resource/032_view16.png)
