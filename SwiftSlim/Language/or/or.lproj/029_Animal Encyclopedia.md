# ପଶୁ ବିଶ୍ୱକୋଷ 

ଏହି ପାଠରେ, ଆମେ କଷ୍ଟମ୍ ଭ୍ୟୁ ଏବଂ ଡାଟା ପାସିଂର ଅଭ୍ୟାସ ଜାରି ରଖିବା।

ଆମେ ଏକ ସରଳ ପଶୁ ବିଶ୍ୱକୋଷ ଭ୍ୟୁ ତିଆରି କରିବା। ପୃଷ୍ଠାରେ ପାଞ୍ଚଟି ପଶୁ ଦେଖାଯିବ। କୌଣସି ପଶୁକୁ କ୍ଲିକ୍ କଲେ, ଏକ ବିବରଣୀ ଭ୍ୟୁ ପପ୍ ଅପ୍ ହେବ, ଯେଉଁଥିରେ ଏହି ପଶୁର ଛବି, ବିତରଣ ଅଞ୍ଚଳ, ବାସସ୍ଥାନ ଏବଂ ବିବରଣୀ ଦେଖାଯିବ।

କାର୍ଯ୍ୟାନୁଷ୍ଠାନ ଫଳାଫଳ:

![view](../../../Resource/029_view.png)

ଏହି ଉଦାହରଣ ମାଧ୍ୟମରେ, ଆମେ ଡାଟା ସ୍ଟ୍ରକ୍ଚର, ତାଲିକା ପ୍ରଦର୍ଶନ, କ୍ଲିକ୍ ଇଣ୍ଟରାକ୍ସନ୍ ଏବଂ Sheet ପପ୍-ଅପ୍ ଭ୍ୟୁର ସମନ୍ୱୟ ଅଭ୍ୟାସ କରିପାରିବା।

## ଛବି ସାମଗ୍ରୀ ପ୍ରସ୍ତୁତ କରନ୍ତୁ

ପ୍ରଥମେ, ଆମକୁ ପାଞ୍ଚଟି ପଶୁ ଛବି ପ୍ରସ୍ତୁତ କରିବାକୁ ପଡିବ:

- ଡଲଫିନ୍: `dolphin.jpg`
- ଜିରାଫ୍: `giraffe.jpg`
- ସିଂହ: `lion.jpg`
- ପାଣ୍ଡା: `panda.jpg`
- ଧ୍ରୁବୀୟ ଭାଲୁ: `polarBear.jpg`

ଆପଣ ନିମ୍ନଲିଖିତ ଛବି ସାମଗ୍ରୀ ବ୍ୟବହାର କରିପାରିବେ:

[ଡଲଫିନ୍](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[ଜିରାଫ୍](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[ସିଂହ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[ପାଣ୍ଡା](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[ଧ୍ରୁବୀୟ ଭାଲୁ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ଛବିଗୁଡ଼ିକ ଡାଉନଲୋଡ୍ କରିବା ପରେ, ସେଗୁଡ଼ିକୁ Xcode ପ୍ରୋଜେକ୍ଟର `Assets` ରିସୋର୍ସ ଫୋଲ୍ଡରକୁ ଟାଣି ଆଣନ୍ତୁ।

![assets](../../../Resource/029_assets.png)

ଧ୍ୟାନ ଦିଅନ୍ତୁ, କୋଡ୍‌ରେ ଛବି ବ୍ୟବହାର କରିବାବେଳେ ସାଧାରଣତଃ `.jpg` ସଫିକ୍ସ ଲେଖିବା ଦରକାର ନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଛବି ରିସୋର୍ସର ନାମ `dolphin` ହେଲେ, କୋଡ୍‌ରେ ଏଭଳି ଲେଖନ୍ତୁ:

```swift
Image("dolphin")
```

ଯଦି ଛବିର ନାମ ଭୁଲ ଲେଖାଯାଏ, ଛବି ସଠିକ୍ ଭାବେ ଦେଖାଯିବ ନାହିଁ।

ଟୀକା: ଉପରୋକ୍ତ ଛବି ସାମଗ୍ରୀ Wikimedia ପ୍ରକଳ୍ପରୁ ଆସିଛି। ବ୍ୟବହାର କରିବାବେଳେ ମୂଳ ଛବି ଲିଙ୍କ୍ ଏବଂ ଉତ୍ସ ସୂଚନା ରଖିବାକୁ ସୁପାରିଶ କରାଯାଏ।

## ପଶୁ ସ୍ଟ୍ରକ୍ଚର ସୃଷ୍ଟି କରନ୍ତୁ

ଏହି ପୃଷ୍ଠାରେ, ପ୍ରତ୍ୟେକ ପଶୁର କିଛି ତଥ୍ୟ ରହେ:

- ପଶୁର ନାମ
- ପଶୁର ଛବି
- ପଶୁର ଇମୋଜି
- ବିତରଣ ଅଞ୍ଚଳ
- ବାସସ୍ଥାନ
- ପଶୁ ବିବରଣୀ

ଯଦି ଆମେ ଏହି ସବୁ ତଥ୍ୟକୁ ଅନେକ ଭିନ୍ନ ଭିନ୍ନ ଭେରିଏବଲ୍‌ରେ ଛିଣ୍ଡାଇ ରଖୁ, କୋଡ୍ ଅବ୍ୟବସ୍ଥିତ ହୋଇଯିବ। ସେହିପାଇଁ, ଆମେ ଏକ `Animal` ସ୍ଟ୍ରକ୍ଚର ସୃଷ୍ଟି କରି, ଗୋଟିଏ ପଶୁର ତଥ୍ୟକୁ ଏକଠା ରଖିପାରିବା।

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

ଏହି କୋଡ୍‌ରେ:

- `id`: ପଶୁର ଏକକ ପରିଚୟ।
- `name`: ପଶୁର ନାମ।
- `imageName`: ପଶୁ ଛବିର ନାମ।
- `avatarEmoji`: ପଶୁ ଇମୋଜି।
- `distributionArea`: ବିତରଣ ଅଞ୍ଚଳ।
- `habitat`: ବାସସ୍ଥାନ।
- `animalDescription`: ପଶୁ ବିବରଣୀ।

ଏଥିରେ:

```swift
let id = UUID()
```

`id` ପ୍ରତ୍ୟେକ ପଶୁକୁ ଚିହ୍ନଟ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। କାରଣ ପରେ ଆମେ `ForEach` ବ୍ୟବହାର କରି ପଶୁ ତାଲିକା ଦେଖାଇବା, ଏବଂ `.sheet(item:)` ବ୍ୟବହାର କରି ଚୟନିତ ପଶୁ ଅନୁସାରେ ବିବରଣୀ ପପ୍ ଅପ୍ କରିବା। ସେହିପାଇଁ `Animal` କୁ `Identifiable` ପ୍ରୋଟୋକଲ୍ ଅନୁସରଣ କରାଇବା ଦରକାର।

`Identifiable` ର କାମ ହେଉଛି SwiftUI କୁ କୁହିବା: ପ୍ରତ୍ୟେକ ପଶୁର ଏକ ଅଲଗା `id` ଅଛି, ଯାହା ତାହାର ପରିଚୟକୁ ପୃଥକ କରିପାରେ।

## ପଶୁ ଡାଟା ସୃଷ୍ଟି କରନ୍ତୁ

ତାପରେ, ଆମେ `ContentView` ଭିତରେ ଏକ ପଶୁ ଆରେ ସୃଷ୍ଟି କରିବା।

ଆରେରେ ପାଞ୍ଚଟି `Animal` ସଞ୍ଚୟ ହେବ, ଏବଂ ପ୍ରତ୍ୟେକ `Animal` ଗୋଟିଏ ପଶୁକୁ ସୂଚାଏ।

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ଡଲଫିନ୍
        Animal(
            name: "ଡଲଫିନ୍",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ବିଶ୍ୱର ଉଷ୍ଣ ଏବଂ ସମଶୀତୋଷ୍ଣ ସମୁଦ୍ର ଅଞ୍ଚଳ।",
            habitat: "ସମୁଦ୍ର, କୂଳାଞ୍ଚଳ ଜଳ ଏବଂ କିଛି ବଡ଼ ନଦୀ।",
            animalDescription: "ଡଲଫିନ୍ ବୁଦ୍ଧିମାନ ସମୁଦ୍ରୀୟ ସ୍ତନ୍ୟପାୟୀ ପଶୁ। ସେମାନେ ଦଳରେ ରହନ୍ତି, ଧ୍ୱନି ମାଧ୍ୟମରେ ଯୋଗାଯୋଗ କରନ୍ତି, ଏବଂ ସେମାନଙ୍କର ଖେଳାଳିଆ ବ୍ୟବହାର ପାଇଁ ପରିଚିତ।"
        ),
        // ଜିରାଫ୍
        Animal(
            name: "ଜିରାଫ୍",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ଆଫ୍ରିକାର ସାଭାନା ଏବଂ ଖୋଲା ବନଅଞ୍ଚଳ।",
            habitat: "ଘାସଭୂମି, ସାଭାନା ଏବଂ ଖୋଲା ଜଙ୍ଗଲ।",
            animalDescription: "ଜିରାଫ୍ ଭୂମିରେ ଥିବା ସବୁଠାରୁ ଲମ୍ବା ପଶୁ। ସେମାନଙ୍କର ଲମ୍ବା ଗଳା ଓ ଲମ୍ବା ପାଦ ଥାଏ, ଏବଂ ସେମାନେ ସାଧାରଣତଃ ଉଚ୍ଚ ଗଛର ପତ୍ର ଖାଆନ୍ତି।"
        ),
        // ସିଂହ
        Animal(
            name: "ସିଂହ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ମୁଖ୍ୟତଃ ସାହାରା ଦକ୍ଷିଣ ଆଫ୍ରିକାରେ ମିଳେ, ଏବଂ ପଶ୍ଚିମ ଭାରତରେ ଏକ ଛୋଟ ଜନସଂଖ୍ୟା ଅଛି।",
            habitat: "ଘାସଭୂମି, ସାଭାନା ଏବଂ ଖୋଲା ବନଅଞ୍ଚଳ।",
            animalDescription: "ସିଂହ ଶକ୍ତିଶାଳୀ ବଡ଼ ବିଲେଇ ପରିବାରର ପଶୁ। ସେମାନେ ସାଧାରଣତଃ ପ୍ରାଇଡ୍ ବୋଲି ଡାକାଯାଉଥିବା ଦଳରେ ରହନ୍ତି, ଏବଂ ପଶୁଜଗତର ରାଜା ଭାବେ ପରିଚିତ।"
        ),
        // ପାଣ୍ଡା
        Animal(
            name: "ପାଣ୍ଡା",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ମଧ୍ୟ ଚୀନର ପାର୍ବତ୍ୟ ବନଅଞ୍ଚଳ।",
            habitat: "ଶୀତଳ ଏବଂ ଆର୍ଦ୍ର ପାର୍ବତ୍ୟ ଅଞ୍ଚଳର ବାଂଶ ଜଙ୍ଗଲ।",
            animalDescription: "ପାଣ୍ଡା ସେମାନଙ୍କର କଳା-ଧଳା ଲୋମ ପାଇଁ ପରିଚିତ ଭାଲୁ। ସେମାନେ ମୁଖ୍ୟତଃ ବାଂଶ ଖାଆନ୍ତି, ଏବଂ ବିଶ୍ୱର ସବୁଠାରୁ ସହଜରେ ପରିଚିତ ପଶୁମାନଙ୍କ ମଧ୍ୟରୁ ଗୋଟିଏ।"
        ),
        // ଧ୍ରୁବୀୟ ଭାଲୁ
        Animal(
            name: "ଧ୍ରୁବୀୟ ଭାଲୁ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ଉତ୍ତର ଧ୍ରୁବ ଚାରିପାଖର ଆର୍କଟିକ୍ ଅଞ୍ଚଳ।",
            habitat: "ସମୁଦ୍ର ବରଫ, କୂଳାଞ୍ଚଳ ଏବଂ ଶୀତଳ ଆର୍କଟିକ୍ ପରିବେଶ।",
            animalDescription: "ଧ୍ରୁବୀୟ ଭାଲୁ ଶୀତଳ ପରିବେଶ ପାଇଁ ଅନୁକୂଳିତ ବଡ଼ ଭାଲୁ। ସେମାନେ ଶକ୍ତିଶାଳୀ ପହଁରୁଆ, ଏବଂ ସିଲ୍ ଶିକାର କରିବା ପାଇଁ ମୁଖ୍ୟତଃ ସମୁଦ୍ର ବରଫ ଉପରେ ନିର୍ଭର କରନ୍ତି।"
        )
    ]

    var body: some View {
        Text("ପଶୁ ବିଶ୍ୱକୋଷ")
    }
}
```

ଏଠାରେ `animals` ଏକ ଆରେ:

```swift
let animals: [Animal]
```

`[Animal]` ଅର୍ଥ ହେଉଛି ଏହି ଆରେରେ ଅନେକ `Animal` ସଞ୍ଚୟ ହୋଇଛି।

ଅର୍ଥାତ୍, `animals` ଗୋଟିଏ ପଶୁ ନୁହେଁ, ବରଂ ଏକ ପଶୁ ଦଳ।

## ପଶୁ ତାଲିକା ଦେଖାନ୍ତୁ

ଏବେ, ଆମେ `ForEach` ବ୍ୟବହାର କରି ପଶୁ ତାଲିକା ଦେଖାଇପାରିବା।

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

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/029_view1.png)

ଏହି କୋଡ୍‌ରେ:

```swift
ForEach(animals) { animal in
    ...
}
```

ଏହା `animals` ଆରେକୁ ଟ୍ରାଭର୍ସ କରିବାକୁ ସୂଚାଏ।

ପ୍ରତ୍ୟେକ ଲୁପ୍ ସମୟରେ, `animal` ଏବେ ଦେଖାଯାଉଥିବା ସେହି ପଶୁକୁ ସୂଚାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ପ୍ରଥମ ଲୁପ୍‌ରେ `animal` ହେଉଛି ଡଲଫିନ୍; ଦ୍ୱିତୀୟ ଲୁପ୍‌ରେ `animal` ହେଉଛି ଜିରାଫ୍।

ସେହିପାଇଁ, ଆମେ ନିମ୍ନଲିଖିତ ଭାବରେ ବର୍ତ୍ତମାନ ପଶୁର ତଥ୍ୟ ଦେଖାଇପାରିବା:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

ଏଭଳି କରି, ପାଞ୍ଚଟି ପଶୁକୁ ଦେଖାଇପାରିବା।

## ପଶୁ ତାଲିକାକୁ କ୍ଲିକ୍ କରିପାରିବା ଯୋଗ୍ୟ କରନ୍ତୁ

ଏବେ ତାଲିକା ଦେଖାଯାଉଛି, କିନ୍ତୁ ଏହାକୁ ଏଯାବତ୍ କ୍ଲିକ୍ କରିହେବ ନାହିଁ।

ଯଦି ଆମେ କୌଣସି ପଶୁକୁ କ୍ଲିକ୍ କରିବା ପରେ ବିବରଣୀ ପପ୍ ଅପ୍ କରିବାକୁ ଚାହୁଁ, ପ୍ରଥମେ “ବର୍ତ୍ତମାନ ଚୟନିତ ପଶୁ” କୁ ରେକର୍ଡ କରିବା ଦରକାର।

ସେହିପାଇଁ, `ContentView` ଭିତରେ ଏକ state variable ଯୋଗ କରନ୍ତୁ:

```swift
@State private var selectedAnimal: Animal? = nil
```

ଏଠାରେ `selectedAnimal` ଏକ optional value type `Animal?`।

ଏହାର ଅର୍ଥ, ଏଥିରେ କୌଣସି ପଶୁ ଥାଇପାରେ, କିମ୍ବା କୌଣସି ପଶୁ ନଥାଇପାରେ।

ଡିଫଲ୍ଟ ମୂଲ୍ୟ `nil`, ଯାହାର ଅର୍ଥ ଆରମ୍ଭରେ କୌଣସି ପଶୁ ଚୟନ ହୋଇନାହିଁ।

ତାପରେ, ପ୍ରତ୍ୟେକ ପଶୁ ରୋକୁ `Button` ରେ ପରିବର୍ତ୍ତନ କରିବା:

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

ମୁଖ୍ୟ ବିଷୟ ହେଉଛି ଏହି କୋଡ୍ ଧାଡ଼ି:

```swift
selectedAnimal = animal
```

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ କୌଣସି ପଶୁକୁ କ୍ଲିକ୍ କରନ୍ତି, ଆମେ ସେହି ପଶୁକୁ `selectedAnimal` ଭିତରେ ସଞ୍ଚୟ କରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ବ୍ୟବହାରକାରୀ ଡଲଫିନ୍ କ୍ଲିକ୍ କଲେ, `selectedAnimal` ଭିତରେ ଡଲଫିନ୍ ସଞ୍ଚୟ ହେବ।

ବ୍ୟବହାରକାରୀ ପାଣ୍ଡା କ୍ଲିକ୍ କଲେ, `selectedAnimal` ଭିତରେ ପାଣ୍ଡା ସଞ୍ଚୟ ହେବ।

ଅର୍ଥାତ୍, `selectedAnimal` ବ୍ୟବହାରକାରୀ ବର୍ତ୍ତମାନ କେଉଁ ପଶୁକୁ କ୍ଲିକ୍ କରିଛନ୍ତି ତାହା ରେକର୍ଡ କରେ।

## Sheet ପପ୍-ଅପ୍ ଭ୍ୟୁ

ଏବେ ଆମେ ବଟନ୍ ମାଧ୍ୟମରେ “ବର୍ତ୍ତମାନ କ୍ଲିକ୍ କରାଯାଇଥିବା ପଶୁ” କୁ ରେକର୍ଡ କରିପାରୁଛୁ।

ପରବର୍ତ୍ତୀରେ, ଆମକୁ ପଶୁ ବିବରଣୀ ଦେଖାଇବା ପାଇଁ ଏକ ପପ୍-ଅପ୍ ଭ୍ୟୁ କାର୍ଯ୍ୟାନୁଷ୍ଠାନ କରିବାକୁ ପଡିବ।

![view](../../../Resource/029_view2.png)

SwiftUI ରେ, ଏହି ପ୍ରକାର ପପ୍-ଅପ୍ ପ୍ରଭାବ ପାଇଁ `Sheet` ବ୍ୟବହାର କରିପାରିବା।

`Sheet` କୁ ଏକ ଅସ୍ଥାୟୀ ଭାବେ ପପ୍ ଅପ୍ ହେଉଥିବା ପୃଷ୍ଠା ଭାବରେ ବୁଝିପାରିବା। ଏହା ବର୍ତ୍ତମାନ ପୃଷ୍ଠାର ଉପରେ ଦେଖାଯାଏ। ବ୍ୟବହାରକାରୀ ବିଷୟବସ୍ତୁ ଦେଖିସାରିଲେ, ତଳକୁ ସ୍ୱାଇପ୍ କରି ଏହାକୁ ବନ୍ଦ କରିପାରନ୍ତି।

## Sheet ଉଦାହରଣ

ପଶୁ ବିବରଣୀ ସତ୍ୟରେ ଦେଖାଇବା ପୂର୍ବରୁ, ଆମେ ପ୍ରଥମେ ଏକ ସରଳ ଉଦାହରଣରେ `Sheet` କିପରି ପପ୍ ଅପ୍ ହୁଏ ତାହା ବୁଝିବା।

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet ଦେଖାନ୍ତୁ")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet ଭ୍ୟୁ")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/029_view3.png)

ଏହି କୋଡ୍‌ରେ, ଆମେ ଏକ Boolean value ସୃଷ୍ଟି କରିଛୁ:

```swift
@State private var showSheet = false
```

`showSheet` ର ଡିଫଲ୍ଟ ମୂଲ୍ୟ `false`, ଯାହାର ଅର୍ଥ ଆରମ୍ଭରେ `Sheet` ଦେଖାଯାଏ ନାହିଁ।

ବଟନ୍ କ୍ଲିକ୍ କରିବାବେଳେ:

```swift
showSheet.toggle()
```

`toggle()` ବୋଲିଲେ Boolean value କୁ ପରିବର୍ତ୍ତନ କରିବା।

ଯଦି ପୂର୍ବରୁ `false` ଥାଏ, `toggle()` କଲା ପରେ ଏହା `true` ହେବ।

ଯଦି ପୂର୍ବରୁ `true` ଥାଏ, `toggle()` କଲା ପରେ ଏହା `false` ହେବ।

ସେହିପାଇଁ, ବଟନ୍ କ୍ଲିକ୍ କଲେ `showSheet` `false` ରୁ `true` କୁ ବଦଳିଯିବ।

ଯେତେବେଳେ `showSheet` `true` ହୁଏ, ନିମ୍ନ କୋଡ୍ `Sheet` ପପ୍ ଅପ୍ କରିବ:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ଭ୍ୟୁ")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ଏହି କୋଡ୍‌ର ଅର୍ଥ: `showSheet` `true` ହେଲେ, ଏକ `Sheet` ପପ୍ ଅପ୍ କରନ୍ତୁ, ଏବଂ `Sheet` ଭିତରେ `Text("Sheet ଭ୍ୟୁ")` ଦେଖାନ୍ତୁ।

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/029_view4.png)

ଏହି ଲେଖନ ପ୍ରକ୍ରିୟା ସ୍ଥିର ବିଷୟବସ୍ତୁ ପପ୍ ଅପ୍ କରିବା ପାଇଁ ଉପଯୁକ୍ତ।

ଉଦାହରଣ ସ୍ୱରୂପ, ବଟନ୍ କ୍ଲିକ୍ କରିବା ପରେ ସେଟିଂସ୍ ପୃଷ୍ଠା, ବ୍ୟାଖ୍ୟା ପୃଷ୍ଠା, ଟିପ୍ସ ପୃଷ୍ଠା ଇତ୍ୟାଦି ପପ୍ ଅପ୍ କରାଯାଇପାରେ।

### Sheet ଦେଖାଯାଉଥିବା ସ୍ଥାନ

ଯଦିଓ `Sheet` ଏକ ପପ୍-ଅପ୍ ଭ୍ୟୁ, SwiftUI ରେ ଏହା `Text()` କିମ୍ବା `Image()` ପରି ସିଧାସଳଖ ଏକ ସ୍ୱତନ୍ତ୍ର ଭ୍ୟୁ ଭାବେ ଲେଖାଯାଏ ନାହିଁ, ବରଂ ଏକ view modifier ଭାବେ ବ୍ୟବହୃତ ହୁଏ।

ଅର୍ଥାତ୍, `.sheet(...)`, `.font()`, `.padding()`, `.shadow()` ଭଳି modifier ମାନଙ୍କ ସହିତ ସମାନ; ଏହାକୁ କୌଣସି ଭ୍ୟୁର ପଛରେ ଯୋଡ଼ିବାକୁ ପଡେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Button("Sheet ଦେଖାନ୍ତୁ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ଭ୍ୟୁ")
}
```

ଏହି ଉଦାହରଣରେ, `.sheet` କୁ `Button` ପଛରେ ଯୋଡ଼ାଯାଇଛି।

ଯେତେବେଳେ `showSheet` `true` ହୁଏ, SwiftUI `Sheet` ପପ୍ ଅପ୍ କରିବ, ଏବଂ curly braces ଭିତରେ ଥିବା ବିଷୟବସ୍ତୁ ଦେଖାଇବ:

```swift
Text("Sheet ଭ୍ୟୁ")
```

କିନ୍ତୁ, ବାସ୍ତବ ବିକାଶରେ, ଯଦି ଏକ ପୃଷ୍ଠାରେ ଅନେକ ବଟନ୍ ରହେ, ସାଧାରଣତଃ ପ୍ରତ୍ୟେକ ବଟନ୍‌କୁ ଏକ `.sheet` ଯୋଡ଼ାଯାଏ ନାହିଁ।

ଅଧିକ ସାଧାରଣ ପ୍ରକ୍ରିୟା ହେଉଛି: `.sheet` କୁ ବାହାର ଭ୍ୟୁର ପଛରେ ଯୋଡ଼ିବା।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
VStack {
    Button("Sheet ଦେଖାନ୍ତୁ") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ଭ୍ୟୁ")
}
```

ବଟନ୍ `showSheet` କୁ ପରିବର୍ତ୍ତନ କରିବାର ଦାୟିତ୍ୱ ନେଉଛି, ଏବଂ ବାହାର ଭ୍ୟୁ `showSheet` `true` କି ନୁହେଁ ତାହା ଅନୁଯାୟୀ `Sheet` ପପ୍ ଅପ୍ କରୁଛି।

## Optional value ବାନ୍ଧିବା Sheet

ପୂର୍ବରୁ ଆମେ ଶିଖିଥିବା ଲେଖନ ପ୍ରକ୍ରିୟା ହେଉଛି:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ଭ୍ୟୁ")
}
```

ଏହି ଲେଖନ ପ୍ରକ୍ରିୟା ଏକ ସ୍ଥିର ପୃଷ୍ଠାର ଦେଖାଇବା ଏବଂ ଲୁଚାଇବାକୁ ନିୟନ୍ତ୍ରଣ କରିବା ପାଇଁ ଉପଯୁକ୍ତ।

କିନ୍ତୁ ପଶୁ ବିଶ୍ୱକୋଷ ଉଦାହରଣରେ, ଆମକୁ କେବଳ “`Sheet` ପପ୍ ଅପ୍ ହେବ କି ନାହିଁ” ଜାଣିଲେ ଚାଲିବ ନାହିଁ; “କେଉଁ ପଶୁକୁ କ୍ଲିକ୍ କରାଗଲା” ମଧ୍ୟ ଜାଣିବାକୁ ପଡିବ।

ଉଦାହରଣ ସ୍ୱରୂପ:

ବ୍ୟବହାରକାରୀ ଡଲଫିନ୍ କ୍ଲିକ୍ କଲେ, `Sheet` ଭିତରେ ଡଲଫିନ୍ ବିବରଣୀ ଦେଖାଯିବା ଉଚିତ।

ବ୍ୟବହାରକାରୀ ପାଣ୍ଡା କ୍ଲିକ୍ କଲେ, `Sheet` ଭିତରେ ପାଣ୍ଡା ବିବରଣୀ ଦେଖାଯିବା ଉଚିତ।

ସେହିପାଇଁ, ଏଠାରେ ଅନ୍ୟ ଏକ Sheet ଲେଖନ ପ୍ରକ୍ରିୟା ବ୍ୟବହାର କରିବା ଅଧିକ ଉପଯୁକ୍ତ:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet ଭିତରେ ଦେଖାଯିବା ବିଷୟବସ୍ତୁ
}
```

ଏହି କୋଡ୍‌ରେ, `Sheet` ଏକ optional value `selectedAnimal` ସହ ବାନ୍ଧାଯାଇଛି।

ଏଠାରେ ଧ୍ୟାନ ଦିଅନ୍ତୁ, `item:` ପଛରେ `$selectedAnimal` ଲେଖାଯାଏ, `selectedAnimal` ନୁହେଁ।

କାରଣ `Sheet` କେବଳ `selectedAnimal` ର ମୂଲ୍ୟ ପଢ଼େ ନାହିଁ, ଏହାର ପରିବର୍ତ୍ତନ ଅନୁସାରେ ପପ୍ ଅପ୍ କରିବ କି ନାହିଁ ମଧ୍ୟ ନିଷ୍ପତ୍ତି କରିବାକୁ ପଡେ।

ଏହି କୋଡ୍‌କୁ ଏଭଳି ବୁଝିପାରିବା:

- `selectedAnimal` `nil` ହେଲେ, `Sheet` ଦେଖାଯିବ ନାହିଁ।
- `selectedAnimal` ରେ ମୂଲ୍ୟ ଥିଲେ, `Sheet` ଦେଖାଯିବ।
- `Sheet` ବନ୍ଦ ହେଲେ, SwiftUI `selectedAnimal` କୁ ପୁଣି `nil` କରିଦେବ।

SwiftUI `selectedAnimal` ଭିତରେ ସଞ୍ଚିତ ପଶୁକୁ curly braces ଭିତରେ ଥିବା `animal` କୁ ପାସ୍ କରିବ।

ଅର୍ଥାତ୍, `.sheet(item:)` କେବଳ ପପ୍-ଅପ୍ ନିୟନ୍ତ୍ରଣ କରେ ନାହିଁ, ଏହା ଚୟନିତ ଡାଟାକୁ `Sheet` ଭିତରକୁ ମଧ୍ୟ ପାସ୍ କରେ।

## Sheet ବ୍ୟବହାର କରି ପଶୁର ନାମ ଦେଖାନ୍ତୁ

ଏବେ, ଆମେ ତୁରନ୍ତ ଜଟିଳ ବିବରଣୀ ଭ୍ୟୁ ସୃଷ୍ଟି କରିବାକୁ ଯିବା ନାହିଁ।

କୋଡ୍ କୁ ସହଜରେ ବୁଝିବା ପାଇଁ, ଆମେ ପ୍ରଥମେ `Sheet` ଭିତରେ ବର୍ତ୍ତମାନ ପଶୁର ନାମ ଦେଖାଇବା।

`VStack` ବାହାରେ `.sheet(item:)` ଯୋଡ଼ନ୍ତୁ:

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

ଏଠାରେ ସବୁଠାରୁ ମୁଖ୍ୟ ହେଉଛି ଏହି କୋଡ୍:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ଯେତେବେଳେ `selectedAnimal` ରେ ମୂଲ୍ୟ ଥାଏ, `Sheet` ପପ୍ ଅପ୍ ହେବ।

curly braces ଭିତରେ ଥିବା `animal` ହେଉଛି ବର୍ତ୍ତମାନ ଚୟନିତ ପଶୁ।

ସେହିପାଇଁ:

```swift
Text(animal.name)
```

ଏହା ବର୍ତ୍ତମାନ କ୍ଲିକ୍ କରାଯାଇଥିବା ପଶୁର ନାମ ଦେଖାଇବ।

ଉଦାହରଣ ସ୍ୱରୂପ, `ଡଲଫିନ୍` କ୍ଲିକ୍ କଲେ, Sheet ଭିତରେ `ଡଲଫିନ୍` ଦେଖାଯାଏ।

`ପାଣ୍ଡା` କ୍ଲିକ୍ କଲେ, `Sheet` ଭିତରେ `ପାଣ୍ଡା` ଦେଖାଯାଏ।

ଏଭଳି କରି, ଆମେ ଭିନ୍ନ ପଶୁକୁ କ୍ଲିକ୍ କଲେ ଭିନ୍ନ ପଶୁର ନାମ ପପ୍ ଅପ୍ ହେବାର ପ୍ରଭାବ ପୂରଣ କରିଦେଲୁ।

ପଶୁର ନାମ ଦେଖାନ୍ତୁ:

![view](../../../Resource/029_view5.png)

କିନ୍ତୁ, ପଶୁ ବିବରଣୀ କେବଳ ଏକ ନାମ ଦେଖାଇବା ଉଚିତ ନୁହେଁ। ଏଥିରେ ନାମ, ବିତରଣ ଅଞ୍ଚଳ, ବାସସ୍ଥାନ ଏବଂ ବିବରଣୀ ଦେଖାଯିବା ଉଚିତ।

ଯଦି ଆମେ ଏହି ସବୁ କୋଡ୍ `.sheet` ଭିତରେ ଲେଖୁ, କୋଡ୍ ବହୁତ ଲମ୍ବା ହୋଇଯିବ ଏବଂ ପଢ଼ିବାକୁ ସୁବିଧାଜନକ ରହିବ ନାହିଁ।

ସେହିପାଇଁ, ପରେ ଆମେ ଏକ ନୂଆ କଷ୍ଟମ୍ ଭ୍ୟୁ ସୃଷ୍ଟି କରିବା, ଯାହା ବିଶେଷ ଭାବରେ ପଶୁ ବିବରଣୀ ଦେଖାଇବାର ଦାୟିତ୍ୱ ନେବ।

## ପଶୁ ବିବରଣୀ ଭ୍ୟୁ ସୃଷ୍ଟି କରନ୍ତୁ

ପରବର୍ତ୍ତୀରେ, ଆମେ `AnimalDetailView` ନାମର ଏକ ନୂଆ କଷ୍ଟମ୍ ଭ୍ୟୁ ସୃଷ୍ଟି କରିବା।

ଏହି ଭ୍ୟୁ ଏକ `Animal` ଗ୍ରହଣ କରେ, ଏବଂ ପଶୁ ବିବରଣୀ ଦେଖାଏ।

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
                    Text("**ବିତରଣ ଅଞ୍ଚଳ** ：\(animal.distributionArea)")

                    Divider()

                    Text("**ବାସସ୍ଥାନ** ：\(animal.habitat)")

                    Divider()

                    Text("**ପଶୁ ବିବରଣୀ** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ଦେଖାଯାଉଥିବା ଫଳାଫଳ:

![view](../../../Resource/029_view2.png)

ଏଠାରେ ମୁଖ୍ୟ ବିଷୟ ହେଉଛି:

```swift
var animal: Animal
```

ଏହାର ଅର୍ଥ `AnimalDetailView` କୁ ବାହାରରୁ ଗୋଟିଏ ପଶୁ ଗ୍ରହଣ କରିବାକୁ ପଡିବ।

ପଶୁ ପାଇଲା ପରେ, ବିବରଣୀ ଭ୍ୟୁ ସେହି ପଶୁର ବିଭିନ୍ନ ତଥ୍ୟ ବ୍ୟବହାର କରିପାରିବ:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

ଅର୍ଥାତ୍, `AnimalDetailView` କେବଳ ପାସ୍ ହୋଇଥିବା ପଶୁକୁ ଦେଖାଇବାର ଦାୟିତ୍ୱ ନେଉଛି।

### Markdown ରେ ଗାଢ଼ ଅକ୍ଷର

ବିବରଣୀ ଭ୍ୟୁରେ, ଆମେ ଏଭଳି କୋଡ୍ ଲେଖିଛୁ:

```swift
Text("**ବାସସ୍ଥାନ:** \(animal.habitat)")
```

ଏଠାରେ ଦୁଇଟି ଜ୍ଞାନବିନ୍ଦୁ ଅଛି।

ପ୍ରଥମ, `**ବାସସ୍ଥାନ:**` `Markdown` ସିଣ୍ଟାକ୍ସ ବ୍ୟବହାର କରେ। ଦୁଇଟି ତାରା ଚିହ୍ନ ଭିତରେ ଥିବା ଟେକ୍ସ୍ଟ ଗାଢ଼ ଭାବରେ ଦେଖାଯାଏ।

ଦ୍ୱିତୀୟ, `\()` ହେଉଛି string interpolation, ଯାହା ଭେରିଏବଲ୍‌ର ମୂଲ୍ୟକୁ ଟେକ୍ସ୍ଟ ଭିତରେ ଦେଖାଇପାରେ।

ଏହି କୋଡ୍ ପ୍ରଥମେ ଗାଢ଼ ହୋଇଥିବା `ବାସସ୍ଥାନ:` ଦେଖାଇବ, ପରେ ଏହି ପଶୁର ବାସସ୍ଥାନ ଦେଖାଇବ।

## Sheet ଭିତରେ ବିବରଣୀ ଭ୍ୟୁ ଦେଖାନ୍ତୁ

`AnimalDetailView` ସୃଷ୍ଟି କରିସାରିଲେ, ଆମେ `ContentView` କୁ ଫେରି, `Sheet` ଭିତରେ ଥିବା ମୂଳ ନାମ ଭ୍ୟୁକୁ ବିବରଣୀ ଭ୍ୟୁ ସହ ପରିବର୍ତ୍ତନ କରିପାରିବା।

ପୂର୍ବରୁ ଥିଲା:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ଏବେ ଏଭଳି ପରିବର୍ତ୍ତନ କରନ୍ତୁ:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ଏଠାରେ `animal:` ହେଉଛି `AnimalDetailView` ର ପାରାମିଟର ନାମ।

ପଛର `animal` ହେଉଛି `.sheet(item:)` ରୁ ପାସ୍ ହୋଇଥିବା ବର୍ତ୍ତମାନ ପଶୁ।

ଅର୍ଥାତ୍, ବର୍ତ୍ତମାନ କ୍ଲିକ୍ କରାଯାଇଥିବା ପଶୁକୁ `AnimalDetailView` କୁ ଦେଖାଇବା ପାଇଁ ପାସ୍ କରାଯାଉଛି।

ପୂର୍ଣ୍ଣ ଗଠନ:

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

ଯେତେବେଳେ ବ୍ୟବହାରକାରୀ ପଶୁକୁ କ୍ଲିକ୍ କରନ୍ତି:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` ରୁ ନିର୍ଦ୍ଦିଷ୍ଟ ପଶୁକୁ ବଦଳିଯାଏ। `Sheet` `selectedAnimal` ରେ ମୂଲ୍ୟ ଥିବାକୁ ଚିହ୍ନଟ କରି ପପ୍ ଅପ୍ ଭ୍ୟୁ ଦେଖାଏ।

`Sheet`, `selectedAnimal` ଭିତରେ ଥିବା ପଶୁକୁ `AnimalDetailView` ଭ୍ୟୁକୁ ପାସ୍ କରେ, ଏବଂ `AnimalDetailView` ପଶୁ ବିବରଣୀ ଦେଖାଏ।

ଏଭଳି କରି, ଆମେ ପଶୁ ତାଲିକାକୁ କ୍ଲିକ୍ କଲେ ସମ୍ବନ୍ଧିତ ପଶୁ ବିବରଣୀ ପପ୍ ଅପ୍ ହେବାର ଫଙ୍କସନ୍ ପୂରଣ କରିଦେଲୁ।

## Sheet ର ଦୁଇ ପ୍ରକାର ଲେଖନ ପ୍ରକ୍ରିୟାର ତଫାତ

ଏବେ, ଆମେ `.sheet(item:)` ବ୍ୟବହାର କରି ପଶୁ ବିବରଣୀ ଭ୍ୟୁ ଦେଖାଇବା ସମାପ୍ତ କରିଛୁ।

ଏଠାରେ `Sheet` ର ଦୁଇଟି ସାଧାରଣ ଲେଖନ ପ୍ରକ୍ରିୟାକୁ ସରଳ ଭାବରେ ସାରାଂଶ କରିପାରିବା।

### ପ୍ରଥମ ପ୍ରକାର ହେଉଛି Boolean value ବାନ୍ଧିବା

```swift
@State private var showSheet = false

Button("Sheet ଦେଖାନ୍ତୁ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ଭ୍ୟୁ")
}
```

ଏହି ଲେଖନ ପ୍ରକ୍ରିୟା ସ୍ଥିର ବିଷୟବସ୍ତୁ ପପ୍ ଅପ୍ କରିବା ପାଇଁ ଉପଯୁକ୍ତ, ଯଥା ସେଟିଂସ୍ ପୃଷ୍ଠା, ବ୍ୟାଖ୍ୟା ପୃଷ୍ଠା, ଟିପ୍ସ ପୃଷ୍ଠା ଇତ୍ୟାଦି।

`showSheet` ଏକ Boolean value, ଯାହାର କେବଳ `true` ଏବଂ `false` ଦୁଇଟି ଅବସ୍ଥା ଅଛି।

`showSheet` `true` ହେଲେ, `Sheet` ଦେଖାଯାଏ।

`showSheet` `false` ହେଲେ, `Sheet` ଦେଖାଯାଏ ନାହିଁ।

### ଦ୍ୱିତୀୟ ପ୍ରକାର ହେଉଛି optional value ବାନ୍ଧିବା

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ଏହି ଲେଖନ ପ୍ରକ୍ରିୟା ଚୟନିତ ଡାଟା ଅନୁଯାୟୀ ଭିନ୍ନ ବିଷୟବସ୍ତୁ ପପ୍ ଅପ୍ କରିବା ପାଇଁ ଉପଯୁକ୍ତ।

ଏହି ପାଠରେ, ଆମେ ଭିନ୍ନ ପଶୁକୁ କ୍ଲିକ୍ କଲେ ଭିନ୍ନ ପଶୁର ବିବରଣୀ ଦେଖାଇବାକୁ ଚାହୁଁ, ସେହିପାଇଁ `.sheet(item:)` ବ୍ୟବହାର କରିବା ଅଧିକ ଉପଯୁକ୍ତ।

## ପୂର୍ଣ୍ଣ କୋଡ୍

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // ପଶୁର ନାମ
    let name: String
    
    // ପଶୁର ଛବି
    let imageName: String
    
    // ପଶୁର ଲେବେଲ୍ ଇମୋଜି
    let avatarEmoji: String
    
    // ବିତରଣ ଅଞ୍ଚଳ
    let distributionArea: String
    
    // ବାସସ୍ଥାନ
    let habitat: String
    
    // ପଶୁ ବିବରଣୀ
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ଡଲଫିନ୍
        Animal(
            name: "ଡଲଫିନ୍",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ବିଶ୍ୱର ଉଷ୍ଣ ଏବଂ ସମଶୀତୋଷ୍ଣ ସମୁଦ୍ର ଅଞ୍ଚଳ।",
            habitat: "ସମୁଦ୍ର, କୂଳାଞ୍ଚଳ ଜଳ ଏବଂ କିଛି ବଡ଼ ନଦୀ।",
            animalDescription: "ଡଲଫିନ୍ ବୁଦ୍ଧିମାନ ସମୁଦ୍ରୀୟ ସ୍ତନ୍ୟପାୟୀ ପଶୁ। ସେମାନେ ଦଳରେ ରହନ୍ତି, ଧ୍ୱନି ମାଧ୍ୟମରେ ଯୋଗାଯୋଗ କରନ୍ତି, ଏବଂ ସେମାନଙ୍କର ଖେଳାଳିଆ ବ୍ୟବହାର ପାଇଁ ପରିଚିତ।"
        ),
        // ଜିରାଫ୍
        Animal(
            name: "ଜିରାଫ୍",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ଆଫ୍ରିକାର ସାଭାନା ଏବଂ ଖୋଲା ବନଅଞ୍ଚଳ।",
            habitat: "ଘାସଭୂମି, ସାଭାନା ଏବଂ ଖୋଲା ଜଙ୍ଗଲ।",
            animalDescription: "ଜିରାଫ୍ ଭୂମିରେ ଥିବା ସବୁଠାରୁ ଲମ୍ବା ପଶୁ। ସେମାନଙ୍କର ଲମ୍ବା ଗଳା ଓ ଲମ୍ବା ପାଦ ଥାଏ, ଏବଂ ସେମାନେ ସାଧାରଣତଃ ଉଚ୍ଚ ଗଛର ପତ୍ର ଖାଆନ୍ତି।"
        ),
        // ସିଂହ
        Animal(
            name: "ସିଂହ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ମୁଖ୍ୟତଃ ସାହାରା ଦକ୍ଷିଣ ଆଫ୍ରିକାରେ ମିଳେ, ଏବଂ ପଶ୍ଚିମ ଭାରତରେ ଏକ ଛୋଟ ଜନସଂଖ୍ୟା ଅଛି।",
            habitat: "ଘାସଭୂମି, ସାଭାନା ଏବଂ ଖୋଲା ବନଅଞ୍ଚଳ।",
            animalDescription: "ସିଂହ ଶକ୍ତିଶାଳୀ ବଡ଼ ବିଲେଇ ପରିବାରର ପଶୁ। ସେମାନେ ସାଧାରଣତଃ ପ୍ରାଇଡ୍ ବୋଲି ଡାକାଯାଉଥିବା ଦଳରେ ରହନ୍ତି, ଏବଂ ପଶୁଜଗତର ରାଜା ଭାବେ ପରିଚିତ।"
        ),
        // ପାଣ୍ଡା
        Animal(
            name: "ପାଣ୍ଡା",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ମଧ୍ୟ ଚୀନର ପାର୍ବତ୍ୟ ବନଅଞ୍ଚଳ।",
            habitat: "ଶୀତଳ ଏବଂ ଆର୍ଦ୍ର ପାର୍ବତ୍ୟ ଅଞ୍ଚଳର ବାଂଶ ଜଙ୍ଗଲ।",
            animalDescription: "ପାଣ୍ଡା ସେମାନଙ୍କର କଳା-ଧଳା ଲୋମ ପାଇଁ ପରିଚିତ ଭାଲୁ। ସେମାନେ ମୁଖ୍ୟତଃ ବାଂଶ ଖାଆନ୍ତି, ଏବଂ ବିଶ୍ୱର ସବୁଠାରୁ ସହଜରେ ପରିଚିତ ପଶୁମାନଙ୍କ ମଧ୍ୟରୁ ଗୋଟିଏ।"
        ),
        // ଧ୍ରୁବୀୟ ଭାଲୁ
        Animal(
            name: "ଧ୍ରୁବୀୟ ଭାଲୁ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ଉତ୍ତର ଧ୍ରୁବ ଚାରିପାଖର ଆର୍କଟିକ୍ ଅଞ୍ଚଳ।",
            habitat: "ସମୁଦ୍ର ବରଫ, କୂଳାଞ୍ଚଳ ଏବଂ ଶୀତଳ ଆର୍କଟିକ୍ ପରିବେଶ।",
            animalDescription: "ଧ୍ରୁବୀୟ ଭାଲୁ ଶୀତଳ ପରିବେଶ ପାଇଁ ଅନୁକୂଳିତ ବଡ଼ ଭାଲୁ। ସେମାନେ ଶକ୍ତିଶାଳୀ ପହଁରୁଆ, ଏବଂ ସିଲ୍ ଶିକାର କରିବା ପାଇଁ ମୁଖ୍ୟତଃ ସମୁଦ୍ର ବରଫ ଉପରେ ନିର୍ଭର କରନ୍ତି।"
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
                    Text("**ବିତରଣ ଅଞ୍ଚଳ** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**ବାସସ୍ଥାନ** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**ପଶୁ ବିବରଣୀ** ：\(animal.animalDescription)")
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

## ସାରାଂଶ

ଏହି ପାଠରେ ଏକ ସରଳ ପଶୁ ବିଶ୍ୱକୋଷ ପୃଷ୍ଠା ପୂରଣ କରାଗଲା।

ଆମେ ପ୍ରଥମେ `Animal` ସ୍ଟ୍ରକ୍ଚର ବ୍ୟବହାର କରି ପଶୁ ତଥ୍ୟ ସଞ୍ଚୟ କଲୁ, ପରେ ଏକ ଆରେ ବ୍ୟବହାର କରି ପାଞ୍ଚଟି ପଶୁ ସଞ୍ଚୟ କଲୁ, ଏବଂ `ForEach` ବ୍ୟବହାର କରି ପଶୁ ତାଲିକା ଦେଖାଇଲୁ।

ବ୍ୟବହାରକାରୀ କୌଣସି ପଶୁକୁ କ୍ଲିକ୍ କଲେ, ଆମେ ସେହି ପଶୁକୁ `selectedAnimal` ଭିତରେ ସଞ୍ଚୟ କରୁ:

```swift
selectedAnimal = animal
```

`selectedAnimal` ରେ ମୂଲ୍ୟ ଥିଲେ, `.sheet(item:)` ବିବରଣୀ ଭ୍ୟୁ ପପ୍ ଅପ୍ କରିବ, ଏବଂ ଚୟନିତ ପଶୁକୁ `AnimalDetailView` କୁ ପାସ୍ କରିବ।

ଏହି ପାଠର ସବୁଠାରୁ ମୁଖ୍ୟ କଥା UI ଶୈଳୀ ନୁହେଁ, ବରଂ ଏହି ଡାଟା ପାସିଂ ପଥକୁ ବୁଝିବା:

```swift
ପଶୁକୁ କ୍ଲିକ୍ କରନ୍ତୁ → selectedAnimal ପଶୁକୁ ସଞ୍ଚୟ କରେ → Sheet ପପ୍ ଅପ୍ ହୁଏ → AnimalDetailView ବିବରଣୀ ଦେଖାଏ
```

ଏହି ପଥକୁ ବୁଝିଲେ, ଆଗାମୀରେ ଏହା ସହିତ ସମାନ ଅଧିକ ଫଙ୍କସନ୍ ତିଆରି କରିପାରିବେ, ଯଥା ପଣ୍ୟ ବିବରଣୀ, କୋର୍ସ ବିବରଣୀ, ଲେଖା ବିବରଣୀ, ସମ୍ପର୍କ ବିବରଣୀ ଇତ୍ୟାଦି।
