# ଚଳଚ୍ଚିତ୍ର ତାଲିକା

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ତାଲିକା ତିଆରି କରିବୁ।

![movie](../../Resource/021_movie.png)

ଏହି ତାଲିକାରେ ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରର ପୋଷ୍ଟର, ନାମ, ନିର୍ଦ୍ଦେଶକ ଏବଂ ରେଟିଂ ଦେଖାଯିବ।

ଏହି ଉଦାହରଣରେ, ଆମେ ଗୋଟିଏ ବହୁତ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ଧାରଣା ଶିଖିବୁ: `struct` ଗଠନ। ଏହା ଆମକୁ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରର ଅନେକ ତଥ୍ୟକୁ ଏକାଠି କରି ଗୋଟିଏ ସମଗ୍ର ରୂପ ଦେବାରେ ସାହାଯ୍ୟ କରେ। ଏହା ସହିତ, ଆମେ `UUID()`、`ForEach`、`Divider` ବିଭାଜକ ରେଖା, ଏବଂ କଷ୍ଟମ ଅବଜେକ୍ଟ ବ୍ୟବହାର କରି ଡାଟା କିପରି ପରିଚାଳନା କରିବା ତାହା ମଧ୍ୟ ଦେଖିବୁ।

ଏହି ଜ୍ଞାନଗୁଡ଼ିକ ପରବର୍ତ୍ତୀ SwiftUI ଡିଭେଲପମେଣ୍ଟରେ ବହୁତ ସାଧାରଣ। ଏହି ପାଠ ଶେଷ କଲେ, ଆପଣ କେବଳ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ତାଲିକା ତିଆରି କରିପାରିବେ ନୁହେଁ, ବରଂ “କିପରି ଗୋଟିଏ ଡାଟା ଗୁଛକୁ ଇଣ୍ଟରଫେସ ଭାବେ ଦେଖାଯାଏ” ତାହା ମଧ୍ୟ ବୁଝିବାକୁ ଆରମ୍ଭ କରିବେ।

## ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର

ଆମେ ପ୍ରଥମେ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରର ଇଣ୍ଟରଫେସ ତିଆରି କରିବାରୁ ଆରମ୍ଭ କରିପାରୁ।

![movie](../../Resource/021_movie1.png)

ଏହି ଇଣ୍ଟରଫେସର ଲେଆଉଟ୍ ମୁଖ୍ୟତଃ ଦୁଇଟି ଅଂଶରୁ ଗଠିତ: ବାମପଟେ ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର, ଡାହାଣପଟେ ଚଳଚ୍ଚିତ୍ର ପରିଚୟ।

### ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର

ବାମପଟେ ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର ଦେଖାଯାଏ, ଆମେ ଛବି ଦେଖାଇବା ପାଇଁ `Image` ବ୍ୟବହାର କରିପାରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

ଏହି କୋଡ୍ର ଅର୍ଥ ହେଉଛି `"The Shawshank Redemption"` ନାମର ଗୋଟିଏ ଛବି ଦେଖାଯାଉଛି।

ଏଠାରେ ଧ୍ୟାନ ଦେବାକୁ ପଡ଼େ ଯେ, ଛବିର ନାମ `Assets` ରିସୋର୍ସ ଫୋଲ୍ଡରରେ ପ୍ରକୃତରେ ଥିବା ଦରକାର, ନହେଲେ ଇଣ୍ଟରଫେସ ଠିକ୍ ଭାବରେ ଏହି ଛବିକୁ ଦେଖାଇପାରିବ ନାହିଁ।

![movie](../../Resource/021_movie2.png)

ଏହି କିଛି ମୋଡିଫାୟରର କାମ ହେଉଛି:

- `resizable()` ର ଅର୍ଥ ହେଉଛି ଛବିର ଆକାର ବଦଳାଯାଇପାରେ।
- `scaledToFit()` ର ଅର୍ଥ ହେଉଛି ସ୍କେଲ୍ କରିବାବେଳେ ମୂଳ ଅନୁପାତ ରହିଥାଏ, ଯାହାଦ୍ୱାରା ଛବି ଟାଣି ଭାଙ୍ଗିଯାଏ ନାହିଁ।
- `frame(height: 180)` ର ଅର୍ଥ ହେଉଛି ଛବିର ଉଚ୍ଚତା 180 କରାଯାଏ।
- `cornerRadius(10)` ର ଅର୍ଥ ହେଉଛି ଛବିକୁ 10 ର ଗୋଲାକାର କୋଣ ଦିଆଯାଏ।

ଏଭଳି ଭାବେ, ଆମେ ଉପଯୁକ୍ତ ଆକାରର ଏବଂ ଗୋଲାକାର କୋଣ ଥିବା ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର ଛବି ପାଇପାରୁ।

![movie](../../Resource/021_movie3.png)

### ଚଳଚ୍ଚିତ୍ର ପରିଚୟ

ଡାହାଣପଟେ ଚଳଚ୍ଚିତ୍ର ପରିଚୟ ଦେଖାଯାଏ, ଯାହାରେ ଚଳଚ୍ଚିତ୍ରର ନାମ, ନିର୍ଦ୍ଦେଶକ ଏବଂ ରେଟିଂ ରହିଛି।

![movie](../../Resource/021_movie4.png)

ଏହି ଅଂଶକୁ ଦେଖାଇବା ପାଇଁ ଆମେ `Text` ବ୍ୟବହାର କରିପାରୁ:

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

ଏହି କୋଡ୍ରେ `.font` ଫଣ୍ଟର ଆକାରକୁ ଦର୍ଶାଏ, ଏବଂ `.fontWeight` ଫଣ୍ଟର ଘନତାକୁ ଦର୍ଶାଏ।

“ଚଳଚ୍ଚିତ୍ର ନାମ”, “ନିର୍ଦ୍ଦେଶକ ସୂଚନା” ଏବଂ “ରେଟିଂ ସୂଚନା” ମଧ୍ୟରେ ଅଧିକ ସ୍ପଷ୍ଟ ଅନ୍ତର ରଖିବା ପାଇଁ, ଏଠାରେ ଆମେ ସବୁଠାରୁ ବାହାର ସ୍ତରରେ `VStack` ବ୍ୟବହାର କରୁଛୁ ଏବଂ ସେଟ୍ କରୁଛୁ:

```swift
spacing: 10
```

ଏହାର ଅର୍ଥ ହେଉଛି ଏହି `VStack` ଭିତରେ ପ୍ରତ୍ୟେକ ଗୋଷ୍ଠୀ ମଧ୍ୟରେ ଅନ୍ତର 10 ହେବ।

ନିର୍ଦ୍ଦେଶକ ଏବଂ ରେଟିଂକୁ ପ୍ରତ୍ୟେକ ଅଲଗା `VStack` ରେ ପୁଣି ମୁଡ଼ି ରଖାଯାଇଥିବାର କାରଣ ହେଉଛି ସେମାନେ ଦୁଇଜଣେ “ଶୀର୍ଷକ + ବିଷୟବସ୍ତୁ” ଭଳି ଗଠନର ଅଂଶ। ତେଣୁ ଇଣ୍ଟରଫେସର ସ୍ତରବିନ୍ୟାସ ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ, ଏବଂ ପରେ ଶୈଳୀ ସମଯୋଜନ କରିବା ମଧ୍ୟ ସହଜ ହୁଏ।

ତା ସହିତ, `VStack` ଡିଫଲ୍ଟ ଭାବରେ ମଝିରେ ସରିଖା ହୁଏ। ସମସ୍ତ ଟେକ୍ଷ୍ଟକୁ ବାମପଟକୁ ସରିଖା କରିବା ପାଇଁ, ଆମେ ସେଟ୍ କରୁଛୁ:

```swift
alignment: .leading
```

ଏଭଳି ଚଳଚ୍ଚିତ୍ର ପରିଚୟ ଅଂଶ ଅଧିକ ସୁସଂଗଠିତ ଦେଖାଯାଏ।

### ବିଭାଜକ ରେଖା

ବର୍ତ୍ତମାନ, ଯଦିଓ ଚଳଚ୍ଚିତ୍ର ପରିଚୟର ବିଷୟବସ୍ତୁ `spacing` ଦ୍ୱାରା ଅଲଗା ହୋଇଛି, ତଥାପି ଭିନ୍ନ ବିଷୟବସ୍ତୁ ମଧ୍ୟରେ ସୀମାରେଖା ଏଯାଏଁ ପର୍ଯ୍ୟାପ୍ତ ସ୍ପଷ୍ଟ ନୁହେଁ।

ଏହି ସମୟରେ, ଆମେ ଗୋଟିଏ ବିଭାଜକ ରେଖା ଯୋଡ଼ିପାରୁ:

```swift
Divider()
```

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଏଭଳି, ଚଳଚ୍ଚିତ୍ର ପରିଚୟ ଅଂଶରେ ଅଧିକ ସ୍ପଷ୍ଟ ବିଭାଜନ ପ୍ରଭାବ ଦେଖାଯିବ।

![movie](../../Resource/021_movie4.png)

`Divider` ଗୋଟିଏ ବହୁତ ସରଳ କିନ୍ତୁ ଅତ୍ୟନ୍ତ ସାଧାରଣ view, ଯାହାର କାମ ହେଉଛି ଭିନ୍ନ ବିଷୟବସ୍ତୁକୁ ଅଲଗା କରିବା।

`VStack` ଭିତରେ, `Divider()` ଗୋଟିଏ ଅନୁନ୍ନତ ରେଖା ଭାବରେ ଦେଖାଯାଏ।

`HStack` ଭିତରେ, `Divider()` ଗୋଟିଏ ଉର୍ଦ୍ଧ୍ୱାଧର ରେଖା ଭାବରେ ଦେଖାଯାଏ।

ଏହା ସହିତ, `.frame`、`.background`、`.padding` ଇତ୍ୟାଦି ଉପାୟରେ `Divider` ର ଶୈଳୀକୁ ବଦଳାଯାଇପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

ଏହା ଗୋଟିଏ ନୀଳ ରଙ୍ଗର, 2 ମାପର ଘନତା ଥିବା, ଏବଂ ବାମ-ଡାହାଣପଟେ padding ଥିବା ବିଭାଜକ ରେଖା ସୃଷ୍ଟି କରିବ।

![divider](../../Resource/021_divider.png)

### ସମ୍ପୂର୍ଣ୍ଣ ଇଣ୍ଟରଫେସ

ଶେଷରେ, ଆମେ `HStack` ବ୍ୟବହାର କରି ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର ଏବଂ ଚଳଚ୍ଚିତ୍ର ପରିଚୟକୁ ବାମ-ଡାହାଣ ଦିଗରେ ସଜାଇପାରୁ।

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

ଏଠାରେ `HStack(spacing: 20)` ର ଅର୍ଥ ହେଉଛି ବାମ ଏବଂ ଡାହାଣ ଦୁଇଟି ଅଂଶ ମଧ୍ୟରେ 20 ର ଅନ୍ତର ରଖାଯିବ।

ଧ୍ୟାନ ଦେବା ଯୋଗ୍ୟ କଥା ହେଉଛି, `Divider()` ଏବଂ ଆଗରୁ କୁହାଯାଇଥିବା `TextField`、`Slider` ଭଳି, ଡିଫଲ୍ଟ ଭାବରେ ଯଥାସମ୍ଭବ ଉପଲବ୍ଧ ସ୍ଥାନକୁ ଦଖଳ କରିବାକୁ ଚେଷ୍ଟା କରେ।

ତେଣୁ, ଆମେ ଡାହାଣପଟର ପରିଚୟ ଅଂଶର ବାହାର `VStack` ପାଇଁ ଗୋଟିଏ ନିଶ୍ଚିତ ପ୍ରସ୍ଥ ସେଟ୍ କରୁଛୁ:

```swift
.frame(width: 200)
```

ଏଭଳି କଲେ ବିଭାଜକ ରେଖା ଏବଂ ଟେକ୍ଷ୍ଟ ଅଞ୍ଚଳର ପ୍ରସ୍ଥ ସମାନ ରହିବ, ଏବଂ ସମଗ୍ର ଇଣ୍ଟରଫେସ ଅଧିକ ସୁସଂଗଠିତ ଦେଖାଯିବ।

ଏଯାଏଁ, ଆମେ “ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର” ର ପ୍ରଦର୍ଶନ ଇଣ୍ଟରଫେସ ସମ୍ପୂର୍ଣ୍ଣ କରିସାରିଛୁ।

![movie](../../Resource/021_movie1.png)

## array ରେ ଚଳଚ୍ଚିତ୍ର ସଞ୍ଚୟ

ଯଦି ଆମେ ଅନେକ ଚଳଚ୍ଚିତ୍ରକୁ ଏକେଇ ଶୈଳୀରେ କ୍ରମକ୍ରମେ ଦେଖାଇବାକୁ ଚାହୁଁଛୁ, ତେବେ ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ର ପାଇଁ ସମାନ କୋଡ୍ ପୁଣିଥରେ ଲେଖିବାକୁ ପଡ଼ିବ।

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଏଭଳି ଲେଖାଯାଇଥିବା କୋଡ୍ ଫଳାଫଳ ଦେଇପାରେ, କିନ୍ତୁ କୋଡ୍ କ୍ରମେ ବଢ଼ିଚାଲିବ ଏବଂ ଏହାର ରକ୍ଷାପୋଷଣ ବହୁତ କଷ୍ଟକର ହେବ।

ଉଦାହରଣ ସ୍ୱରୂପ, ସମସ୍ତ ଚଳଚ୍ଚିତ୍ରର ଅନ୍ତରକୁ `20` ରୁ `15` କରିବାକୁ ହେଲେ, କିମ୍ବା ଡାହାଣପଟର ପ୍ରସ୍ଥକୁ `200` ରୁ
`220` କରିବାକୁ ହେଲେ, ପ୍ରତ୍ୟେକ ପୁନରାବୃତ୍ତ କୋଡ୍ ଖଣ୍ଡକୁ ହାତରେ ବଦଳାଇବାକୁ ପଡ଼ିବ।

ଏହା ସ୍ପଷ୍ଟଭାବେ ଗୋଟିଏ କାର୍ଯ୍ୟକ୍ଷମ ପ୍ରଣାଳୀ ନୁହେଁ।

ଆମେ ପୂର୍ବରୁ array ବିଷୟରେ ଶିଖିଛୁ, ଏବଂ array ଆଧାରରେ ପୁନରାବୃତ୍ତ ଭାବରେ view ଦେଖାଇବା ପାଇଁ `ForEach` କିପରି ବ୍ୟବହାର କରିବା ମଧ୍ୟ ଶିଖିଛୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଏହି ପ୍ରଣାଳୀ “କେବଳ ଗୋଟିଏ ପ୍ରକାର ଡାଟା” ଥିବା ପରିସ୍ଥିତି ପାଇଁ ବହୁତ ଉପଯୁକ୍ତ, ଯଥା ଛବି ନାମମାନଙ୍କ ଗୋଟିଏ ଗୋଷ୍ଠୀ।

କିନ୍ତୁ, ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରରେ କେବଳ ଗୋଟିଏ ମୂଲ୍ୟ ନଥାଏ। ଏଥିରେ କମରେ କମ ଏଗୁଡ଼ିକ ରହେ:

1. ଚଳଚ୍ଚିତ୍ର ପୋଷ୍ଟର
2. ଚଳଚ୍ଚିତ୍ର ନାମ
3. ନିର୍ଦ୍ଦେଶକ
4. ରେଟିଂ

ଅର୍ଥାତ୍, ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ଆସଲରେ ପରସ୍ପର ସମ୍ବନ୍ଧିତ ଡାଟାର ଗୋଟିଏ ଗୁଛ, ଏକାକୀ string ନୁହେଁ।

ଯଦି ଆମେ କେବଳ array ବ୍ୟବହାର କରୁ, ତେବେ ଏହି ସୂଚନାକୁ ଅଲଗା ଅଲଗା ରଖିବାକୁ ପଡ଼ିବ:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

ଦେଖାଇବା ବେଳେ, ସମାନ index ଉପରେ ଭରସା କରି ଏଗୁଡ଼ିକୁ ଏକେକରେ ମେଳ କରିବାକୁ ପଡ଼ିବ:

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

ଏହି ଲେଖନ ପ୍ରଣାଳୀର ସମସ୍ୟା ହେଉଛି, ଏହାର ରକ୍ଷାପୋଷଣ ଖର୍ଚ୍ଚ ବହୁତ ଅଧିକ।

କାରଣ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରର ଡାଟା ଅନେକ array ମଧ୍ୟରେ ଛିଣ୍ଡିଯାଏ। କେବଳ ଗୋଟିଏ array ରେ ଗୋଟିଏ item ଅଧିକ, ଗୋଟିଏ item କମ, କିମ୍ବା କ୍ରମ ଭିନ୍ନ ହେଲେ ମଧ୍ୟ ପ୍ରଦର୍ଶନର ଫଳାଫଳ ଭୁଲ୍ ହୋଇଯାଇପାରେ।

ବିଶେଷକରି ନୂଆ ଚଳଚ୍ଚିତ୍ର ଯୋଡ଼ିବା କିମ୍ବା କାଢ଼ିବା ସମୟରେ, ଆପଣଙ୍କୁ ଏକାସାଥିରେ ଅନେକ array ବଦଳାଇବାକୁ ପଡ଼େ, ଏବଂ କିଛି ଛାଡ଼ିଯିବା ବହୁତ ସହଜ।

ତେବେ, “ଚଳଚ୍ଚିତ୍ର ନାମ, ନିର୍ଦ୍ଦେଶକ, ରେଟିଂ” ଭଳି ତଥ୍ୟଗୁଡ଼ିକୁ ଗୋଟିଏ ସମଗ୍ର ରୂପକୁ କିପରି ଏକାଠି କରିବା?

ଏଥିପାଇଁ `struct` ବ୍ୟବହାର କରିବାକୁ ପଡ଼ିବ।

## `struct` ଗଠନ ପରିଭାଷା

Swift ଭିତରେ, `struct` ର ଅର୍ଥ ହେଉଛି “ଗଠନ”।

ଆପଣ ଏହାକୁ ଗୋଟିଏ “କଷ୍ଟମ ଡାଟା ଟାଇପ୍” ଭାବେ ବୁଝିପାରନ୍ତି, ଯାହା ଅନେକ ସମ୍ବନ୍ଧିତ field କୁ ଏକାଠି କରି ଗୋଟିଏ ସମଗ୍ର ରୂପ ଦେଇପାରେ।

ମୂଳ ବ୍ୟବହାର:

```swift
struct StructName {
	let name: String
}
```

ଏହି କୋଡ୍ରେ, `struct` ହେଉଛି ଗୋଟିଏ keyword, ଯାହା ଦର୍ଶାଏ ଯେ ଆମେ ଗୋଟିଏ ଗଠନ ପରିଭାଷା କରୁଛୁ। `StructName` ହେଉଛି ଗଠନର ନାମ।

କୁନିଆ ବ୍ରାକେଟ୍ ଭିତରେ ଥିବା ବିଷୟବସ୍ତୁ ହେଉଛି ଏହି ଗଠନର field ଗୁଡ଼ିକ, ଏବଂ ପ୍ରତ୍ୟେକ field ପାଇଁ ନାମ ଏବଂ ପ୍ରକାର ସ୍ପଷ୍ଟ ଭାବରେ ଲେଖିବା ଆବଶ୍ୟକ।

ସାଧାରଣତଃ, `struct` ର ନାମ ବଡ଼ ଅକ୍ଷରରେ ଆରମ୍ଭ ହୋଇଥାଏ, ଯଥା `Movie`、`Student`、`UserInfo`। ଏହା Swift ରେ ସାଧାରଣ naming convention।

ଆପଣ `struct` କୁ ସରଳ ଭାବରେ ଗୋଟିଏ ଖାଲି ଉପହାର ବକ୍ସ ଭଳି ବୁଝିପାରନ୍ତି, ଯେଉଁଠାରେ ପ୍ରତ୍ୟେକ field ହେଉଛି ସେହି ବକ୍ସ ଭିତରେ ରଖାଯାଇଥିବା ଗୋଟିଏ ଖାଲି ସ୍ଥାନ।

ଯେତେବେଳେ ଏହି ସ୍ଥାନଗୁଡ଼ିକ ଏଯାଏଁ ଭରାଯାଇନାହିଁ, ସେତେବେଳେ ଏହା କେବଳ ଗୋଟିଏ ଖାଲି ବକ୍ସ। କେବଳ ସମସ୍ତ field ରେ ଉପଯୁକ୍ତ ମୂଲ୍ୟ ଭରାଗଲେ ଏହା ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ ଉପହାର ବକ୍ସ ହୁଏ।

### `struct` ଇନ୍‌ଷ୍ଟାନ୍ସ

ଆଗରୁ ଆମେ କେବଳ ଗଠନକୁ ପରିଭାଷା କରିଥିଲୁ, ଅର୍ଥାତ୍ ଗୋଟିଏ ଉପହାର ବକ୍ସର ଆକୃତି ପ୍ରସ୍ତୁତ କରିଥିଲୁ।

ଏବେ ଆମକୁ ତାହାରେ ପ୍ରକୃତ ବିଷୟବସ୍ତୁ ଭରିବାକୁ ପଡ଼ିବ, ତେବେ ହେଲେ ଆମେ ଗୋଟିଏ ପ୍ରକୃତ “instance” ପାଇବୁ ଯାହାକୁ ବ୍ୟବହାର କରାଯାଇପାରିବ।

instance ସୃଷ୍ଟି କରିବାବେଳେ, ସାଧାରଣତଃ ଗଠନର ନାମ ପରେ `()` ଯୋଡ଼ାଯାଏ:

```swift
StructName(...)
```

ଏହି ପେରେନ୍ଥେସିସ୍ ଭିତରେ ଗଠନ ପାଇଁ ଆବଶ୍ୟକ field ବିଷୟବସ୍ତୁ ଭରାଯାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
StructName(name: "Fang Junyu")
```

ଏହି କୋଡ୍ର ଅର୍ଥ ହେଉଛି: `StructName` ଗଠନର ଫର୍ମାଟ୍ ଅନୁଯାୟୀ ଗୋଟିଏ ନୂଆ instance ସୃଷ୍ଟି କର, ଏବଂ `name` field କୁ `"Fang Junyu"` ମୂଲ୍ୟ ଦିଅ।

ଯେତେବେଳେ ଆମେ ଆବଶ୍ୟକ ସମସ୍ତ field ବିଷୟବସ୍ତୁ ଭରିଦେଉ, ସେତେବେଳେ ଏହା ମାନେ ଉପହାର ବକ୍ସକୁ ପୁରା ଭରିଦେବା ସମାନ।

ସେତେବେଳେ ଆମେ ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ `struct` instance ପାଉ।

### `struct` ଗୁଣଧର୍ମକୁ ପ୍ରବେଶ

ଗୋଟିଏ instance ସୃଷ୍ଟି ହେବା ପରେ, ଆମେ “dot syntax” ବ୍ୟବହାର କରି ତାହାର ଭିତରର ଗୁଣଧର୍ମଗୁଡ଼ିକୁ ପ୍ରବେଶ କରିପାରୁ।

ମୂଳ ଲେଖନ:

```swift
instance.propertyName
```

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

ଏଠାରେ `st` ହେଉଛି ଗୋଟିଏ `struct` instance, ଏବଂ `st.name` ର ଅର୍ଥ ହେଉଛି ଏହି instance ଭିତରର `name` ମୂଲ୍ୟକୁ ପଢ଼ିବା।

ଆପଣ ଏହି ପଢ଼ିବା ପ୍ରଣାଳୀକୁ ଏଭଳି ବୁଝିପାରନ୍ତି: ଯେତେବେଳେ ଆମେ `st.name` ଲେଖୁଛୁ, ସେତେବେଳେ ମନେ ଯେଉଁପରି ଉପହାର ବକ୍ସର ଗୋଟିଏ ନିର୍ଦ୍ଦିଷ୍ଟ ସ୍ଥାନରେ ରଖାଯାଇଥିବା ବିଷୟବସ୍ତୁକୁ ପଢ଼ୁଛୁ।

ଏହି ପ୍ରଣାଳୀ ପରବର୍ତ୍ତୀ SwiftUI ଇଣ୍ଟରଫେସରେ ବହୁତ ସାଧାରଣ ହେବ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଯଦି ଆମ ପାଖରେ ନାମ, ବୟସ୍ ଏବଂ କ୍ଲାସ୍ ଥିବା ଗୋଟିଏ student ଗଠନ ଥାଏ, ତେବେ ଇଣ୍ଟରଫେସରେ ଦେଖାଇବା ବେଳେ ଆମେ ପୃଥକ ଭାବରେ ପଢ଼ିପାରୁ:

```swift
student.name
student.age
student.className
```

ଏଭଳି କରିବାର ଲାଭ ହେଉଛି, ଡାଟା ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ ଏବଂ ପରିଚାଳନା କରିବା ମଧ୍ୟ ସହଜ ହୁଏ।

### `struct` ର ସ୍ଥାନ

ଆରମ୍ଭକାରୀମାନଙ୍କ ପାଇଁ, ସାଧାରଣତଃ ଗଠନକୁ `ContentView` ବାହାରେ ଲେଖାଯାଇପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

ଏଭଳି କଲେ ଗଠନ ଅଧିକ ସ୍ପଷ୍ଟ ହୁଏ, ଏବଂ ପଢ଼ିବାକୁ ମଧ୍ୟ ସହଜ ହୁଏ।

ଆପଣ ଦେଖିବେ ଯେ `ContentView` ନିଜେ ମଧ୍ୟ ପ୍ରକୃତରେ ଗୋଟିଏ `struct`।

### `Movie` ଗଠନ

ଉପରୋକ୍ତ ଆଧାର ସହିତ, ଆମେ ଏବେ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ଗଠନ ପରିଭାଷା କରିପାରୁ:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

ଏହା `Movie` ନାମକ ଗୋଟିଏ ଗଠନ, ଯେଉଁଥିରେ `name`、`director` ଏବଂ `rating` ନାମର ତିନୋଟି field ଅଛି, ଯାହା କ୍ରମଶଃ ଚଳଚ୍ଚିତ୍ର ନାମ, ନିର୍ଦ୍ଦେଶକ ଏବଂ ରେଟିଂକୁ ଦର୍ଶାଏ।

ଏଭଳି ହେଲେ, ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ସମ୍ବନ୍ଧୀୟ ସୂଚନାକୁ ଆଉ ଅନେକ array ରେ ଭାଗ କରି ରଖିବାକୁ ପଡ଼ିବ ନାହିଁ, ବରଂ ସିଧାସଳଖ ଏକାଠି କରି ଗୋଟିଏ ସମଗ୍ର ରୂପ ଦିଆଯାଇପାରିବ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଆମେ ଏପରି ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର instance ସୃଷ୍ଟି କରିପାରୁ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

ଏହି instance “ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ ଚଳଚ୍ଚିତ୍ର ଡାଟା” କୁ ପ୍ରତିନିଧିତ୍ୱ କରେ।

### array ରେ ଗଠନ ସଞ୍ଚୟ

ପୂର୍ବରୁ ଆମେ କହିଥିଲୁ ଯେ array କେବଳ ଏକେ ପ୍ରକାରର ଡାଟା ସଞ୍ଚୟ କରିପାରେ।

ଏବେ ଆମ ପାଖରେ `Movie` ଗଠନ ଅଛି, ତେଣୁ array ଅନେକ `Movie` ସଞ୍ଚୟ କରିପାରିବ।

```swift
let lists: [Movie] = []
```

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଏହି `lists` array ଭିତରେ string ନୁହେଁ, ବରଂ ଅନେକ `Movie` instance ସଞ୍ଚୟ ହୋଇଛି।

ଅର୍ଥାତ୍, array ର ପ୍ରତ୍ୟେକ element ହେଉଛି ଗୋଟିଏ ସମ୍ପୂର୍ଣ୍ଣ ଚଳଚ୍ଚିତ୍ର।

ଏଭଳି, ଯେତେବେଳେ ଆମକୁ ଚଳଚ୍ଚିତ୍ର ତାଲିକା ଦେଖାଇବାକୁ ହେବ, ଆମେ `ForEach` ବ୍ୟବହାର କରି ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରକୁ ଏକେକରେ ପଢ଼ିପାରୁ।

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

ଏଠାରେ `movie in` ର ଅର୍ଥ ହେଉଛି ପ୍ରତ୍ୟେକ loop ସମୟରେ array ରୁ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର କାଢ଼ାଯାଏ ଏବଂ ତାହାକୁ ଅସ୍ଥାୟୀ ଭାବରେ `movie` ନାମ ଦିଆଯାଏ।

ତାପରେ, ଆମେ ବ୍ୟବହାର କରିପାରୁ:

```swift
movie.name
movie.director
movie.rating
```

ଏହି ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରର ନାମ, ନିର୍ଦ୍ଦେଶକ ଏବଂ ରେଟିଂକୁ ପୃଥକ ଭାବରେ ପଢ଼ିବା ଏବଂ ଇଣ୍ଟରଫେସରେ ଦେଖାଇବା ପାଇଁ।

## `ForEach` ତ୍ରୁଟି

ଏଯାଏଁ, ଆମେ ଚଳଚ୍ଚିତ୍ର array ଏବଂ `ForEach` ର ମୂଳ ଲେଖନ ସମାପ୍ତ କରିଛୁ।

କିନ୍ତୁ ଯଦି ଆମେ ସିଧାସଳଖ ନିମ୍ନଲିଖିତ କୋଡ୍ ଚଲାଉ:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ତେବେ ତ୍ରୁଟି ଆସିବ:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

ଏହି ତ୍ରୁଟିର ଅର୍ଥ ହେଉଛି, ଯେତେବେଳେ ଆପଣ `id: \.self` ଲେଖନ୍ତି, SwiftUI ଙ୍କୁ array ର ପ୍ରତ୍ୟେକ element କୁ ନିଜେ “ଏକକ ପରିଚୟ” ଭାବେ ବ୍ୟବହାର କରି ତାହାମାନଙ୍କୁ ଅଲଗା କରିବାକୁ ପଡ଼େ।

ଏହି ଲେଖନ ପ୍ରଣାଳୀ `String`、`Int` ଭଳି ସରଳ type ପାଇଁ ଉପଯୁକ୍ତ, କାରଣ ସେମାନଙ୍କୁ ନିଜେ ଅଲଗା କରିବା ସହଜ।

କିନ୍ତୁ `Movie` ହେଉଛି ଆମେ ନିଜେ ପରିଭାଷା କରିଥିବା ଗୋଟିଏ custom ଗଠନ, ଏବଂ `ForEach` ଜାଣେ ନାହିଁ ଯେ ଏହାକୁ କିପରି ଏକକ ପରିଚୟ ଭାବେ ବ୍ୟବହାର କରିବା, ତେଣୁ ତ୍ରୁଟି ହୁଏ।

ଏହି ସମସ୍ୟାର ସବୁଠାରୁ ସାଧାରଣ ସମାଧାନ ହେଉଛି: `Movie` କୁ `Identifiable` protocol ଅନୁସରଣ କରାଇବା।

## ପ୍ରୋଟୋକଲ୍

Swift ରେ, ପ୍ରୋଟୋକଲ୍ କୁ ଗୋଟିଏ ପ୍ରକାରର “ନିୟମ” କିମ୍ବା “ଆବଶ୍ୟକତା” ଭାବରେ ବୁଝାଯାଇପାରେ।

ଆପଣ ଏହାକୁ ଆନ୍ତର୍ଜାତୀୟ ସଂଗଠନର ଚୁକ୍ତି ଭଳି ବୁଝିପାରନ୍ତି: ଯଦି ଗୋଟିଏ ଦେଶ କୌଣସି ଆନ୍ତର୍ଜାତୀୟ ସଂଗଠନରେ ଯୋଗ ଦେବାକୁ ଚାହେଁ, ତେବେ ପ୍ରଥମେ ସେହି ସଂଗଠନର କିଛି ନିୟମ ପୂରଣ କରିବାକୁ, କିଛି ତଥ୍ୟ ସାର୍ବଜନୀନ କରିବାକୁ, ଏବଂ ସାଧାରଣ ନିୟମ ମାନିବାକୁ ପଡ଼େ। ଏହି ସର୍ତ୍ତଗୁଡ଼ିକ ପୂରଣ ହେଲା ପରେ ମାତ୍ର ସେ ଯୋଗଦେଇପାରେ କିମ୍ବା କିଛି କାର୍ଯ୍ୟରେ ଭାଗ ନେଇପାରେ।

ପ୍ରୋଟୋକଲ୍ ମଧ୍ୟ ଏହିପରି ତର୍କରେ କାମ କରେ।

ଯେତେବେଳେ କୌଣସି type କୌଣସି ପ୍ରୋଟୋକଲ୍ ଅନୁସରଣ କରିବାକୁ ଚାହେଁ, ସେତେବେଳେ ତାହାକୁ ଏହି ପ୍ରୋଟୋକଲ୍ ନିର୍ଦ୍ଦିଷ୍ଟ କରିଥିବା ବିଷୟବସ୍ତୁ ପୂରଣ କରିବାକୁ ପଡ଼େ। ଏହି ଆବଶ୍ୟକତାଗୁଡ଼ିକ ପୂରଣ ହେଲା ପରେ ମାତ୍ର ସେହି type ସମ୍ବନ୍ଧିତ functionality ବ୍ୟବହାର କରିପାରିବ।

ମୂଳ ଲେଖନ:

```swift
struct Movie: Identifiable {
    // ...
}
```

ଏଠାରେ `: Identifiable` ର ଅର୍ଥ ହେଉଛି `Movie` `Identifiable` protocol ଅନୁସରଣ କରେ।

ଯଦି ଗୋଟିଏ type ଅନେକ protocol ଅନୁସରଣ କରେ, ତେବେ ସେଗୁଡ଼ିକୁ କମା ଦେଇ ଅଲଗା କରାଯାଇପାରେ:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` ପାଇଁ ସବୁଠାରୁ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ଆବଶ୍ୟକତା ହେଉଛି: ସେହି type ଭିତରେ ନିଜକୁ ଚିହ୍ନଟ କରିପାରୁଥିବା ଗୋଟିଏ `id` ଥିବା ଦରକାର।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

ଏଠାରେ `id` ଗୋଟିଏ ପରିଚୟପତ୍ର ସଂଖ୍ୟା ଭଳି, ଯାହା ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରକୁ ଅଲଗା କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

ଯେପର୍ଯ୍ୟନ୍ତ ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରର `id` ଭିନ୍ନ ରହେ, SwiftUI array ର ପ୍ରତ୍ୟେକ element କୁ ଠିକ୍ ଭାବରେ ଅଲଗା କରିପାରିବ।

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ତାପରେ `ForEach` ଭିତରେ ବ୍ୟବହାର କରନ୍ତୁ:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

ଏଭଳି କଲେ ଆଉ ତ୍ରୁଟି ଆସିବ ନାହିଁ।

କାରଣ `Movie` ପୂର୍ବରୁ `Identifiable` ଅନୁସରଣ କରୁଛି, ତେଣୁ ଅଧିକ ସାଧାରଣ ଲେଖନ ହେଉଛି `id:` କୁ ସିଧାସଳଖ ଛାଡ଼ିଦେବା:

```swift
ForEach(lists) { movie in
    // ...
}
```

କାରଣ SwiftUI ଆଗରୁ ଜାଣେ ଯେ ପ୍ରତ୍ୟେକ item କୁ ଅଲଗା କରିବା ପାଇଁ `movie.id` ବ୍ୟବହାର କରିବାକୁ ହେବ।

## `ForEach` ର ଅଲଗା ପରିଚୟ

ଏବେ, ଆମେ `ForEach` ଭିତରେ `id` ର ଭୂମିକାକୁ ଆହୁରି ଗଭୀରଭାବେ ବୁଝିବୁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
ForEach(lists, id: \.self)
```

ଏଠାରେ ଅର୍ଥ ହେଉଛି: element ନିଜକୁ ଅଲଗା ପରିଚୟ ଭାବେ ବ୍ୟବହାର କର।

ଏବଂ:

```swift
ForEach(lists, id: \.id)
```

ର ଅର୍ଥ ହେଉଛି: element ର `id` field କୁ ଅଲଗା ପରିଚୟ ଭାବେ ବ୍ୟବହାର କର।

ଯଦି କୌଣସି field ନିଜେ uniqueness ନିଶ୍ଚିତ କରିପାରେ, ତେବେ ତାହାକୁ ଅସ୍ଥାୟୀ ଭାବରେ ମଧ୍ୟ ବ୍ୟବହାର କରାଯାଇପାରେ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଯଦି ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରର ନାମ ଭିନ୍ନ ଥାଏ, ତେବେ ନିମ୍ନଲିଖିତ ଲେଖନ ବର୍ତ୍ତମାନ ଡାଟାରେ ମଧ୍ୟ ସଠିକ ଭାବେ କାମ କରିପାରେ:

```swift
ForEach(lists, id: \.name)
```

କିନ୍ତୁ ଏଠାରେ ଗୋଟିଏ ଲୁଚିଥିବା ସମସ୍ୟା ଅଛି: `name` ସବୁବେଳେ ଅଦ୍ୱିତୀୟ ହେବ ନାହିଁ।

ଧରନ୍ତୁ, ପରେ ଆପଣ ସେହି ନାମର ଆଉ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ଯୋଡ଼ିଲେ, ତେବେ `name` ଆଉ ପ୍ରତ୍ୟେକ element କୁ ସଠିକ ଭାବରେ ଅଲଗା କରିପାରିବ ନାହିଁ।

ସେହି ସମୟରେ, କୋଡ୍ compile ହେବାକୁ ଥାଇପାରେ, କିନ୍ତୁ view refresh, update, insert, delete ସମୟରେ SwiftUI ଭୁଲ୍ ଚିହ୍ନଟ କରିପାରେ, ଫଳରେ ପ୍ରଦର୍ଶନ ଅସ୍ୱାଭାବିକ ହୋଇପାରେ।

ତେଣୁ, ଯେତେବେଳେ ଡାଟାକୁ ସ୍ଥିର ଭାବରେ ଅଲଗା କରିବା ଆବଶ୍ୟକ, ସେତେବେଳେ ପ୍ରକୃତରେ ଅଦ୍ୱିତୀୟ field ଅର୍ଥାତ୍ `id` ବ୍ୟବହାର କରିବା ଭଲ।

## UUID

ହାତରେ `id: 1`、`id: 2` ଭଳି ଲେଖିଦେଲେ ସମସ୍ୟାର ସମାଧାନ ହେବାକୁ ଥାଏ, ତଥାପି ଏକ ଝୁମ୍ପ ରହିଯାଏ: ଭୁଲକରି ଏକେ `id` ପୁଣି ଲେଖାଯାଇପାରେ, ଏବଂ ଏକକ ପରିଚୟ ନିଷ୍ପ୍ରଭ ହୋଇଯିବ।

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଏଭଳି ଦୁଇଟି ସମାନ `id` ହୋଇଯିବ, ଏବଂ ଏକକ ପରିଚୟ ଅକାର୍ଯ୍ୟକାରୀ ହେବ।

ହାତର ଭୁଲକୁ ଏଡ଼ାଇବା ପାଇଁ, ଆମେ ସାଧାରଣତଃ `UUID()` ବ୍ୟବହାର କରୁ।

Swift ଭିତରେ, `UUID()` ଯାଦୃଚ୍ଛିକ ଭାବରେ ଗୋଟିଏ 128-bit ପରିଚୟ ସୃଷ୍ଟି କରେ। ସାଧାରଣତଃ ଏହା ଅକ୍ଷର ଏବଂ ସଂଖ୍ୟାର ଏକ ଲମ୍ବା string ଭାବରେ ଦେଖାଯାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

ଏଠାରେ `UUID()` ପ୍ରକୃତରେ `UUID` ପ୍ରକାରର ଗୋଟିଏ instance ସୃଷ୍ଟି କରେ; ଆପଣ ଏହାକୁ ଆପେଆପେ ଉତ୍ପାଦିତ ଗୋଟିଏ “ଅଦ୍ୱିତୀୟ ସଂଖ୍ୟା” ଭାବରେ ବୁଝିପାରନ୍ତି।

ତେଣୁ, ପ୍ରତ୍ୟେକଥର ସୃଷ୍ଟି ହେଉଥିବା ମୂଲ୍ୟ ପ୍ରାୟ କେବେ ପୁନରାବୃତ୍ତ ହୁଏ ନାହିଁ, ସେହିପାଇଁ ଏହା `id` ଭାବେ ବ୍ୟବହାର କରିବା ପାଇଁ ବହୁତ ଉପଯୁକ୍ତ।

ଆମେ `Movie` କୁ ଏଭଳି ବଦଳାଇପାରୁ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ଏହି କୋଡ୍ର ଅର୍ଥ ହେଉଛି `Movie` ଗଠନର `id` field ଡିଫଲ୍ଟ ଭାବରେ ଗୋଟିଏ ନୂଆ `UUID` instance ର ମୂଲ୍ୟ ପାଇବ।

ଅର୍ଥାତ୍, ପ୍ରତ୍ୟେକଥର ଆମେ ଗୋଟିଏ ନୂଆ `Movie` ସୃଷ୍ଟି କରିବାବେଳେ, ସିଷ୍ଟମ୍ ଆଗରୁ ଆପେଆପେ ଗୋଟିଏ ଅଦ୍ୱିତୀୟ `id` ତିଆରି କରିଦେବ।

`id` ର ଆଗରୁ ଡିଫଲ୍ଟ ମୂଲ୍ୟ ଅଛି, ତେଣୁ ପରେ `Movie` instance ସୃଷ୍ଟି କରିବାବେଳେ `id` ହାତରେ ଭରିବାକୁ ପଡ଼ିବ ନାହିଁ।

ଉଦାହରଣ ସ୍ୱରୂପ:

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

ଯଦିଓ ଏଠାରେ `id` ଲେଖାଯାଇନାହିଁ, ତଥାପି ପ୍ରକୃତରେ ଏହି ଚଳଚ୍ଚିତ୍ର instance ର ନିଜସ୍ୱ `id` ରହେ; କେବଳ ଏହାର ମୂଲ୍ୟ `UUID()` ଦ୍ୱାରା ଆପେଆପେ ସୃଷ୍ଟି ହୋଇଯାଇଛି।

ଏହି ପ୍ରଣାଳୀ ବ୍ୟବହାର କରିବା ପରେ, ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ର ପାଇଁ ଆଉ ହାତରେ `id` ଭରିବାକୁ ପଡ଼ିବ ନାହିଁ; ଏହା ଦ୍ୱାରା କୋଡ୍ କମିଥାଏ ଏବଂ duplicate `id` ରୁ ହେଉଥିବା ତ୍ରୁଟି ମଧ୍ୟ ଏଡ଼ାଯାଏ।

ଶେଷରେ, ଆମକୁ କେବଳ ଉପରେ ଗୋଟିଏ `Banner` ଛବି ଯୋଡ଼ିବାକୁ ଏବଂ ବିଷୟବସ୍ତୁକୁ scroll କରାଯାଇପାରିବା ପାଇଁ `ScrollView` ବ୍ୟବହାର କରିବାକୁ ହେବ, ତେବେ ସମ୍ପୂର୍ଣ୍ଣ ଚଳଚ୍ଚିତ୍ର ତାଲିକା view ସମ୍ପୂର୍ଣ୍ଣ ହେବ।

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ ଗୋଟିଏ ବହୁତ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ଧାରଣା ଶିଖିଲୁ: `struct`।

`struct` ମାଧ୍ୟମରେ, ଆମେ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ରର ଅନେକ ସମ୍ବନ୍ଧିତ field କୁ ଗୋଟିଏ ସମଗ୍ର ରୂପରେ ଏକାଠି କରିପାରୁ, ନାମ、ନିର୍ଦ୍ଦେଶକ、ରେଟିଂକୁ ଭିନ୍ନ ଭିନ୍ନ array ରେ ଭାଗ କରି ରଖିବାର ଆବଶ୍ୟକତା ନାହିଁ।

ଡାଟାକୁ ଏକାଠି କରିବା ପରେ, ଆମେ `ForEach` ବ୍ୟବହାର କରି array ଭିତରେ ଥିବା ପ୍ରତ୍ୟେକ ଚଳଚ୍ଚିତ୍ରକୁ view ଭିତରେ ଏକେକରେ ଦେଖାଇପାରୁ।

ସେହି ସହିତ, ଆମେ `ForEach` ଭିତରେ “ଅଲଗା ପରିଚୟ” ର ଭୂମିକାକୁ ମଧ୍ୟ ବୁଝିଲୁ। SwiftUI କୁ ଜାଣିବା ଦରକାର ଯେ array ର ପ୍ରତ୍ୟେକ element କୁ କିପରି ଅଲଗା କରିବା, ତେବେ ମାତ୍ର view କୁ ସଠିକ ଭାବରେ ଦେଖାଇବା ଏବଂ update କରିବା ସମ୍ଭବ ହେବ।

ସେହିପାଇଁ, ଆମେ `Movie` କୁ `Identifiable` protocol ଅନୁସରଣ କରାଇଲୁ ଏବଂ ଏହାକୁ ଗୋଟିଏ ଅଦ୍ୱିତୀୟ `id` ଦେଲୁ।

`id` ହାତରେ ଭରିବା ସମୟରେ ତ୍ରୁଟି ଏଡ଼ାଇବା ପାଇଁ, ଆମେ ଆଉ ଆଗକୁ ବଢ଼ି `UUID()` ଶିଖିଲୁ, ଯାହା ଦ୍ୱାରା ସିଷ୍ଟମ୍ ଆପେଆପେ ଅଦ୍ୱିତୀୟ ପରିଚୟ ସୃଷ୍ଟି କରେ।

ଏହି ପାଠ ଶେଷ କରିବା ପରେ, ଆପଣ କେବଳ ଗୋଟିଏ ଚଳଚ୍ଚିତ୍ର ତାଲିକା ପୂରା କରିନାହାନ୍ତି, ବରଂ SwiftUI ର ଗୋଟିଏ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ଚିନ୍ତାଧାରାକୁ ମଧ୍ୟ ସ୍ପର୍ଶ କରିଛନ୍ତି: **ପ୍ରଥମେ ଡାଟାକୁ ସଂଗଠିତ କର, ପରେ ସେହି ଡାଟା ଆଧାରରେ view ସୃଷ୍ଟି କର।**

## ସମ୍ପୂର୍ଣ୍ଣ କୋଡ୍

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
