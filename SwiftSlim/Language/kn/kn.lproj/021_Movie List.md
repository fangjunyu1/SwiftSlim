# ಚಲನಚಿತ್ರ ಪಟ್ಟಿ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಒಂದು ಚಲನಚಿತ್ರ ಪಟ್ಟಿಯನ್ನು ತಯಾರಿಸುತ್ತೇವೆ.

![movie](../../Resource/021_movie.png)

ಈ ಪಟ್ಟಿಯಲ್ಲಿ ಪ್ರತಿ ಚಲನಚಿತ್ರದ ಪೋಸ್ಟರ್, ಹೆಸರು, ನಿರ್ದೇಶಕ ಮತ್ತು ರೇಟಿಂಗ್ ತೋರಿಸಲಾಗುತ್ತದೆ.

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, ನಾವು ಒಂದು ಬಹಳ ಮುಖ್ಯವಾದ ಜ್ಞಾನಬಿಂದು ಕಲಿಯುತ್ತೇವೆ: `struct` ರಚನೆ. ಇದು ಒಂದು ಚಲನಚಿತ್ರದ ಹಲವು ಮಾಹಿತಿಗಳನ್ನು ಒಂದು ಒಟ್ಟು ಘಟಕವಾಗಿ ಸೇರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ. ಇದರ ಜೊತೆಗೆ, ನಾವು `UUID()`、`ForEach`、`Divider` ವಿಭಜಕ ರೇಖೆ, ಮತ್ತು ಕಸ್ಟಮ್ ಆಬ್ಜೆಕ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ ಡೇಟಾವನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸಬೇಕು ಎಂಬುದನ್ನೂ ಕಲಿಯುತ್ತೇವೆ.

ಈ ಜ್ಞಾನವು ಮುಂದಿನ SwiftUI ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ಬಹಳ ಸಾಮಾನ್ಯವಾಗಿದೆ. ಈ ಪಾಠವನ್ನು ಮುಗಿಸಿದ ನಂತರ, ನೀವು ಒಂದು ಚಲನಚಿತ್ರ ಪಟ್ಟಿಯನ್ನು ಮಾಡಬಲ್ಲುದಷ್ಟೇ ಅಲ್ಲ, “ಡೇಟಾದ ಒಂದು ಗುಂಪನ್ನು ಇಂಟರ್ಫೇಸ್ ಆಗಿ ಹೇಗೆ ತೋರಿಸಬೇಕು” ಎಂಬುದನ್ನೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಪ್ರಾರಂಭಿಸುತ್ತೀರಿ.

## ಏಕ ಚಲನಚಿತ್ರ

ನಾವು ಮೊದಲಿಗೆ ಒಂದು ಚಲನಚಿತ್ರದ ಇಂಟರ್ಫೇಸ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಬಹುದು.

![movie](../../Resource/021_movie1.png)

ಈ ಇಂಟರ್ಫೇಸ್‌ನ ವಿನ್ಯಾಸ ಮುಖ್ಯವಾಗಿ ಎರಡು ಭಾಗಗಳಿಂದ ಕೂಡಿದೆ: ಎಡಭಾಗದಲ್ಲಿ ಚಲನಚಿತ್ರದ ಪೋಸ್ಟರ್, ಬಲಭಾಗದಲ್ಲಿ ಚಲನಚಿತ್ರದ ಪರಿಚಯ.

### ಚಲನಚಿತ್ರ ಪೋಸ್ಟರ್

ಎಡಭಾಗದಲ್ಲಿ ಚಲನಚಿತ್ರದ ಪೋಸ್ಟರ್ ತೋರಿಸಲಾಗುತ್ತದೆ, ಮತ್ತು ಚಿತ್ರವನ್ನು ತೋರಿಸಲು ನಾವು `Image` ಅನ್ನು ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ `"The Shawshank Redemption"` ಎಂಬ ಹೆಸರಿನ ಚಿತ್ರವನ್ನು ತೋರಿಸುವುದು.

ಇಲ್ಲಿ ಗಮನಿಸಬೇಕಾದದ್ದು ಏನೆಂದರೆ, ಚಿತ್ರದ ಹೆಸರು `Assets` ಸಂಪನ್ಮೂಲ ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ನಿಜವಾಗಿಯೂ ಇರಬೇಕು; ಇಲ್ಲದಿದ್ದರೆ ಇಂಟರ್ಫೇಸ್ ಆ ಚಿತ್ರವನ್ನು ಸರಿಯಾಗಿ ತೋರಿಸಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.

![movie](../../Resource/021_movie2.png)

ಈ modifier‌ಗಳ ಕಾರ್ಯಗಳು ಕ್ರಮವಾಗಿ ಇವು:

- `resizable()` ಎಂದರೆ ಚಿತ್ರದ ಗಾತ್ರವನ್ನು ಬದಲಾಯಿಸಬಹುದು.
- `scaledToFit()` ಎಂದರೆ scale ಮಾಡುವಾಗ ಮೂಲ ಅನುಪಾತವನ್ನು ಉಳಿಸುತ್ತದೆ, ಹೀಗಾಗಿ ಚಿತ್ರ ಎಳೆಯಲ್ಪಟ್ಟು ವಿಕೃತವಾಗುವುದಿಲ್ಲ.
- `frame(height: 180)` ಎಂದರೆ ಚಿತ್ರದ ಎತ್ತರವನ್ನು 180ಕ್ಕೆ ಹೊಂದಿಸುತ್ತದೆ.
- `cornerRadius(10)` ಎಂದರೆ ಚಿತ್ರಕ್ಕೆ 10 ರ rounded corners ಕೊಡುತ್ತದೆ.

ಈ ರೀತಿಯಲ್ಲಿ, ಸರಿಯಾದ ಗಾತ್ರ ಮತ್ತು rounded corners ಹೊಂದಿರುವ ಒಂದು ಚಲನಚಿತ್ರ ಪೋಸ್ಟರ್ ಚಿತ್ರವನ್ನು ಪಡೆಯಬಹುದು.

![movie](../../Resource/021_movie3.png)

### ಚಲನಚಿತ್ರ ಪರಿಚಯ

ಬಲಭಾಗದಲ್ಲಿ ಚಲನಚಿತ್ರದ ಪರಿಚಯ ತೋರಿಸಲಾಗುತ್ತದೆ, ಇದರಲ್ಲಿ ಚಲನಚಿತ್ರದ ಹೆಸರು, ನಿರ್ದೇಶಕ ಮತ್ತು ರೇಟಿಂಗ್ ಸೇರಿರುತ್ತವೆ.

![movie](../../Resource/021_movie4.png)

ಈ ಭಾಗವನ್ನು ತೋರಿಸಲು ನಾವು `Text` ಅನ್ನು ಬಳಸಬಹುದು:

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

ಈ ಕೋಡ್‌ನಲ್ಲಿ, `.font` ಅಕ್ಷರದ ಗಾತ್ರವನ್ನು ಸೂಚಿಸುತ್ತದೆ, ಮತ್ತು `.fontWeight` ಅಕ್ಷರದ ದಪ್ಪವನ್ನು ಸೂಚಿಸುತ್ತದೆ.

“ಚಲನಚಿತ್ರದ ಹೆಸರು”, “ನಿರ್ದೇಶಕ ಮಾಹಿತಿ” ಮತ್ತು “ರೇಟಿಂಗ್ ಮಾಹಿತಿ”ಗಳ ನಡುವೆ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾದ ಅಂತರ ಇರಲು, ಇಲ್ಲಿ ಅತ್ಯಂತ ಹೊರಗಿನ ಪದರದಲ್ಲಿ `VStack` ಅನ್ನು ಬಳಸಲಾಗಿದೆ, ಮತ್ತು ಹೀಗೆ ಹೊಂದಿಸಲಾಗಿದೆ:

```swift
spacing: 10
```

ಇದರ ಅರ್ಥ, ಈ `VStack` ಒಳಗಿನ ಪ್ರತಿಯೊಂದು ವಿಷಯ ಗುಂಪಿನ ನಡುವಿನ ಅಂತರ 10 ಆಗಿರುತ್ತದೆ.

ನಿರ್ದೇಶಕ ಮತ್ತು ರೇಟಿಂಗ್‌ಗಳನ್ನು ತಲಾ ಮತ್ತೊಂದು `VStack` ನಲ್ಲಿ ಸುತ್ತುವ ಕಾರಣವೇನೆಂದರೆ, ಅವು ಎರಡೂ “ಶೀರ್ಷಿಕೆ + ವಿಷಯ” ಎಂಬ ರಚನೆಗೆ ಸೇರಿವೆ. ಆದ್ದರಿಂದ, ಇಂಟರ್ಫೇಸ್‌ನ ಪದರಗಳು ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾಗುತ್ತವೆ ಮತ್ತು ನಂತರ ಸ್ಟೈಲ್ ಅನ್ನು ತಿದ್ದುಪಡಿಸಲು ಇನ್ನಷ್ಟು ಸುಲಭವಾಗುತ್ತದೆ.

ಅದರ ಜೊತೆಗೆ, `VStack` ಡೀಫಾಲ್ಟ್ ಆಗಿ ಮಧ್ಯಕ್ಕೆ align ಆಗಿರುತ್ತದೆ. ಸಂಪೂರ್ಣ ಪಠ್ಯವನ್ನು ಎಡಬದಿಗೆ align ಮಾಡಲು, ನಾವು ಹೀಗೆ ಹೊಂದಿಸುತ್ತೇವೆ:

```swift
alignment: .leading
```

ಇದರಿಂದ ಚಲನಚಿತ್ರ ಪರಿಚಯದ ಭಾಗ ಇನ್ನಷ್ಟು ಸರಿಹೊಂದಿದಂತೆ ಕಾಣುತ್ತದೆ.

### ವಿಭಜಕ ರೇಖೆ

ಈಗ, ಚಲನಚಿತ್ರ ಪರಿಚಯದ ವಿಷಯಗಳನ್ನು `spacing` ಮೂಲಕ ಬೇರ್ಪಡಿಸಿದ್ದರೂ, ವಿಭಿನ್ನ ವಿಷಯಗಳ ನಡುವಿನ ಗಡಿ ಇನ್ನೂ ಸಾಕಷ್ಟು ಸ್ಪಷ್ಟವಾಗಿಲ್ಲ.

ಈ ಸಂದರ್ಭದಲ್ಲಿ, ನಾವು ಒಂದು ವಿಭಜಕ ರೇಖೆಯನ್ನು ಸೇರಿಸಬಹುದು:

```swift
Divider()
```

ಉದಾಹರಣೆಗೆ:

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

ಈ ರೀತಿಯಲ್ಲಿ, ಚಲನಚಿತ್ರ ಪರಿಚಯದ ಭಾಗದಲ್ಲಿ ಹೆಚ್ಚು ಸ್ಪಷ್ಟವಾದ ವಿಭಜನೆ ಪರಿಣಾಮ ಉಂಟಾಗುತ್ತದೆ.

![movie](../../Resource/021_movie4.png)

`Divider` ಒಂದು ತುಂಬಾ ಸರಳವಾದರೂ ತುಂಬಾ ಹೆಚ್ಚು ಬಳಸಲಾಗುವ view ಆಗಿದೆ; ಇದರ ಕೆಲಸ ವಿಭಿನ್ನ ವಿಷಯಗಳನ್ನು ಬೇರ್ಪಡಿಸುವುದು.

`VStack` ಒಳಗೆ, `Divider()` ಒಂದು ಸಮತಲ ರೇಖೆಯಾಗಿ ಕಾಣಿಸುತ್ತದೆ.

`HStack` ಒಳಗೆ, `Divider()` ಒಂದು ಲಂಬ ರೇಖೆಯಾಗಿ ಕಾಣಿಸುತ್ತದೆ.

ಇದರ ಜೊತೆಗೆ, `.frame`、`.background`、`.padding` ಮುಂತಾದ ವಿಧಾನಗಳಿಂದ `Divider` ನ ಶೈಲಿಯನ್ನು ಕೂಡ ಬದಲಾಯಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

ಇದು 2 ದಪ್ಪದ, ನೀಲಿ ಬಣ್ಣದ ಮತ್ತು ಎರಡೂ ಬದಿಯಲ್ಲಿ horizontal padding ಇರುವ ವಿಭಜಕ ರೇಖೆಯನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ.

![divider](../../Resource/021_divider.png)

### ಸಂಪೂರ್ಣ ಇಂಟರ್ಫೇಸ್

ಕೊನೆಯದಾಗಿ, `HStack` ಬಳಸಿ ಚಲನಚಿತ್ರದ ಪೋಸ್ಟರ್ ಮತ್ತು ಚಲನಚಿತ್ರ ಪರಿಚಯವನ್ನು ಪಕ್ಕಪಕ್ಕನೆ ಜೋಡಿಸಬಹುದು.

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

ಇಲ್ಲಿ, `HStack(spacing: 20)` ಎಂದರೆ ಎಡ ಮತ್ತು ಬಲ ಭಾಗಗಳ ನಡುವೆ 20 ಅಂತರವನ್ನು ಉಳಿಸುವುದು.

ಗಮನಿಸಬೇಕಾದುದು ಏನೆಂದರೆ, `Divider()` ಕೂಡ ಮೊದಲು ನೋಡಿದ `TextField` ಮತ್ತು `Slider` ಗಳಂತೆ, ಡೀಫಾಲ್ಟ್ ಆಗಿ ಲಭ್ಯವಿರುವ ಜಾಗವನ್ನು ಸಾಧ್ಯವಾದಷ್ಟು ಹೆಚ್ಚು ಬಳಸಲು ಪ್ರಯತ್ನಿಸುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಬಲಭಾಗದ ಪರಿಚಯದ ಹೊರಗಿನ `VStack` ಗೆ ನಾವು ಒಂದು ನಿಶ್ಚಿತ ಅಗಲವನ್ನು ಹೊಂದಿಸುತ್ತೇವೆ:

```swift
.frame(width: 200)
```

ಇದರ ಮೂಲಕ ವಿಭಜಕ ರೇಖೆ ಮತ್ತು ಪಠ್ಯ ಪ್ರದೇಶದ ಅಗಲ ಒಂದೇ ಆಗಿ ಉಳಿದು, ಒಟ್ಟಾರೆ ವಿನ್ಯಾಸ ಇನ್ನಷ್ಟು ಸರಿಯಾಗಿ ಕಾಣುತ್ತದೆ.

ಇಲ್ಲಿಯವರೆಗೆ, ನಾವು “ಏಕ ಚಲನಚಿತ್ರ” ಪ್ರದರ್ಶನದ ಇಂಟರ್ಫೇಸ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

![movie](../../Resource/021_movie1.png)

## array ಯಲ್ಲಿ ಚಲನಚಿತ್ರಗಳನ್ನು ಉಳಿಸುವುದು

ನಾವು ಒಂದೇ ಶೈಲಿಯಲ್ಲಿ ಅನೇಕ ಚಲನಚಿತ್ರಗಳನ್ನು ಒಂದರ ಹಿಂದೆ ಇನ್ನೊಂದನ್ನು ತೋರಿಸಲು ಬಯಸಿದರೆ, ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರಕ್ಕೂ ಹೋಲಿಕೆಯ ಕೋಡ್ ಬರೆಯಬೇಕಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

ಈ ರೀತಿಯ ಕೋಡ್ ಗುರಿ ಸಾಧಿಸಬಹುದು, ಆದರೆ ಕೋಡ್ ಕ್ರಮೇಣ ಹೆಚ್ಚಾಗುತ್ತದೆ ಮತ್ತು ಅದರ ನಿರ್ವಹಣೆ ತುಂಬಾ ಕಷ್ಟಕರವಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, ಎಲ್ಲ ಚಲನಚಿತ್ರಗಳ ನಡುವಿನ ಅಂತರವನ್ನು `20` ರಿಂದ `15` ಗೆ ಬದಲಾಯಿಸಬೇಕು, ಅಥವಾ ಬಲಭಾಗದ ಅಗಲವನ್ನು `200` ರಿಂದ
`220` ಗೆ ಬದಲಾಯಿಸಬೇಕು ಎಂದರೆ, ಪ್ರತಿಯೊಂದು ಪುನರಾವರ್ತಿತ ಕೋಡ್ ಭಾಗವನ್ನೂ ಕೈಯಿಂದ ತಿದ್ದಬೇಕಾಗುತ್ತದೆ.

ಇದು ಸ್ಪಷ್ಟವಾಗಿಯೇ ಪರಿಣಾಮಕಾರಿ ವಿಧಾನವಲ್ಲ.

ನಾವು ಮೊದಲು arrayಗಳನ್ನು ಕಲಿತಿದ್ದೇವೆ, ಹಾಗೆಯೇ array ಆಧಾರದ ಮೇಲೆ viewಗಳನ್ನು ಮರುಮರು ತೋರಿಸಲು `ForEach` ಬಳಕೆಯನ್ನೂ ಕಲಿತಿದ್ದೇವೆ.

ಉದಾಹರಣೆಗೆ:

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

ಈ ವಿಧಾನ “ಒಂದು ಮಾತ್ರ ಡೇಟಾ” ಇರುವ ಸಂದರ್ಭಗಳಿಗೆ ತುಂಬಾ ಸೂಕ್ತವಾಗಿದೆ, ಉದಾಹರಣೆಗೆ ಚಿತ್ರಗಳ ಹೆಸರುಗಳ ಗುಂಪು.

ಆದರೆ ಒಂದು ಚಲನಚಿತ್ರದಲ್ಲಿ ಕೇವಲ ಒಂದು ಮೌಲ್ಯ ಮಾತ್ರ ಇರುವುದಿಲ್ಲ. ಅದರಲ್ಲಿ ಕನಿಷ್ಠ ಇವುಗಳಿರುತ್ತವೆ:

1. ಚಲನಚಿತ್ರದ ಪೋಸ್ಟರ್
2. ಚಲನಚಿತ್ರದ ಹೆಸರು
3. ನಿರ್ದೇಶಕ
4. ರೇಟಿಂಗ್

ಅಂದರೆ, ಒಂದು ಚಲನಚಿತ್ರವೆಂದರೆ ವಾಸ್ತವವಾಗಿ ಸಂಬಂಧಿತ ಡೇಟಾದ ಒಂದು ಗುಂಪು, ಕೇವಲ ಒಂದು string ಅಲ್ಲ.

ನಾವು ಕೇವಲ arrayಗಳನ್ನು ಮಾತ್ರ ಬಳಸಿದರೆ, ಈ ಮಾಹಿತಿಯನ್ನು ಬೇರೆಬೇರೆ ಆಗಿ ಮಾತ್ರ ಉಳಿಸಬಹುದು:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

ಪ್ರದರ್ಶನದ ಸಮಯದಲ್ಲಿ, ನಾವು ಅದೇ index ಮೇಲೆ ಅವಲಂಬಿಸಿ ಅವನ್ನು ಒಂದೊಂದಾಗಿ ಹೊಂದಿಸಬೇಕು:

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

ಈ ರೀತಿಯ ಬರವಣಿಗೆಯ ಸಮಸ್ಯೆ ಎಂದರೆ, ಇದರ ನಿರ್ವಹಣಾ ವೆಚ್ಚ ಬಹಳ ಹೆಚ್ಚಿನದು.

ಏಕೆಂದರೆ, ಒಂದು ಚಲನಚಿತ್ರದ ಡೇಟಾ ಹಲವು arrayಗಳಲ್ಲಿ ಚದರಿಹೋಗುತ್ತದೆ. ಒಂದೇ arrayಯಲ್ಲಿ ಒಂದು ಅಂಶ ಹೆಚ್ಚು ಇದ್ದರೂ, ಒಂದು ಅಂಶ ಕಡಿಮೆ ಇದ್ದರೂ ಅಥವಾ ಕ್ರಮ ಬದಲಾಗಿದ್ದರೂ, ಪ್ರದರ್ಶನದ ಫಲಿತಾಂಶ ತಪ್ಪಾಗುತ್ತದೆ.

ವಿಶೇಷವಾಗಿ, ಚಲನಚಿತ್ರಗಳನ್ನು ಸೇರಿಸುವಾಗ ಅಥವಾ ಅಳಿಸುವಾಗ, ಅನೇಕ arrayಗಳನ್ನು ಒಂದೇ ಸಮಯದಲ್ಲಿ ತಿದ್ದುಪಡಿಸಬೇಕಾಗುತ್ತದೆ, ಮತ್ತು ಏನಾದರೂ ಮಿಸ್ ಆಗುವುದು ತುಂಬಾ ಸುಲಭ.

ಹಾಗಾದರೆ, “ಚಲನಚಿತ್ರದ ಹೆಸರು, ನಿರ್ದೇಶಕ ಮತ್ತು ರೇಟಿಂಗ್” ಮುಂತಾದ ಮಾಹಿತಿಯನ್ನು ಒಂದೇ ಒಟ್ಟು ರೂಪವಾಗಿ ಹೇಗೆ ಸೇರಿಸಬಹುದು?

ಇದಕ್ಕಾಗಿ `struct` ಬೇಕಾಗುತ್ತದೆ.

## struct ರಚನೆಯನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುವುದು

Swift ನಲ್ಲಿ, `struct` ಎಂದರೆ “ರಚನೆ”.

ನೀವು ಇದನ್ನು “ಕಸ್ಟಮ್ ಡೇಟಾ ಪ್ರಕಾರ” ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು, ಇದು ಹಲವು ಸಂಬಂಧಿತ fields ಅನ್ನು ಸೇರಿಸಿ ಒಂದು ಸಂಪೂರ್ಣ ಘಟಕ ಮಾಡುತ್ತದೆ.

ಮೂಲ ಬಳಕೆ:

```swift
struct StructName {
	let name: String
}
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ, `struct` ಎಂದರೆ ನಾವು ಒಂದು ರಚನೆಯನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತಿದ್ದೇವೆ ಎಂದು ಸೂಚಿಸುವ keyword. `StructName` ಎನ್ನುವುದು ಆ ರಚನೆಯ ಹೆಸರು.

Curly braces ಒಳಗಿನ ವಿಷಯವು ಆ ರಚನೆಯ fields ಆಗಿದ್ದು, ಪ್ರತಿಯೊಂದು field ನ ಹೆಸರನ್ನೂ ಮತ್ತು ಅದರ type ನ್ನೂ ಸ್ಪಷ್ಟವಾಗಿ ಬರೆಯಬೇಕು.

ಸಾಮಾನ್ಯವಾಗಿ, `struct` ಹೆಸರು ದೊಡ್ಡ ಅಕ್ಷರದಿಂದ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ, ಉದಾಹರಣೆಗೆ `Movie`, `Student`, `UserInfo`. ಇದು Swift ನಲ್ಲಿ ಸಾಮಾನ್ಯ naming convention ಆಗಿದೆ.

ನೀವು `struct` ಅನ್ನು ಸರಳವಾಗಿ ಒಂದು ಖಾಲಿ ಪೆಟ್ಟಿಗೆ ಎಂದುಕೊಳ್ಳಬಹುದು; ಅದರೊಳಗಿನ ಪ್ರತಿಯೊಂದು field ಎಂದರೆ ಮುಂಚಿತವಾಗಿ ಕಾಯ್ದಿರಿಸಿದ ಖಾಲಿ ಸ್ಥಳ.

ಈ ಸ್ಥಳಗಳು ಇನ್ನೂ ತುಂಬದಿರುವಾಗ, ಅದು ಕೇವಲ ಒಂದು ಖಾಲಿ ಪೆಟ್ಟಿಗೆಯಷ್ಟೇ. ಎಲ್ಲಾ fields ಸರಿಯಾದ valuesಗಳಿಂದ ತುಂಬಿದಾಗ ಮಾತ್ರ ಅದು ಒಂದು ಪೂರ್ಣ ಉಡುಗೊರೆ ಪೆಟ್ಟಿಗೆಯಾಗುತ್ತದೆ.

### struct instance

ಮೊದಲು ನಾವು ಕೇವಲ ರಚನೆಯನ್ನು ಮಾತ್ರ ವ್ಯಾಖ್ಯಾನಿಸಿದ್ದೇವೆ, ಇದು ಒಂದು ಪೆಟ್ಟಿಗೆಯ ಆಕಾರವನ್ನು ತಯಾರಿಸಿದಂತಾಗಿದೆ.

ಇದೀಗ, ಅದರೊಳಗೆ ನಿಜವಾದ ವಿಷಯವನ್ನು ತುಂಬಬೇಕಾಗಿದೆ; ಆಗ ಮಾತ್ರ ಉಪಯೋಗಿಸಬಹುದಾದ ನಿಜವಾದ “instance” ಸಿಗುತ್ತದೆ.

Instance ಸೃಷ್ಟಿಸುವಾಗ, ಸಾಮಾನ್ಯವಾಗಿ ರಚನೆಯ ಹೆಸರಿನ ನಂತರ `()` ಸೇರಿಸಲಾಗುತ್ತದೆ:

```swift
StructName(...)
```

Parentheses ಒಳಗೆ ಬರೆಯುವುದೇ ಆ ರಚನೆಗೆ ಬೇಕಾದ field values ಆಗಿದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
StructName(name: "Fang Junyu")
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ: `StructName` ರಚನೆಯ ರೂಪಕ್ಕೆ ಅನುಗುಣವಾಗಿ ಹೊಸ instance ಅನ್ನು ಸೃಷ್ಟಿಸಿ, `name` field ಗೆ `"Fang Junyu"` value ನೀಡುವುದು.

ನಾವು ಎಲ್ಲಾ ಅಗತ್ಯ fields ಅನ್ನು ತುಂಬಿದಾಗ, ಅದು ಆ ಪೆಟ್ಟಿಗೆಯನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತುಂಬಿದಂತಾಗುತ್ತದೆ.

ಆ ಸಮಯದಲ್ಲಿ, ನಮಗೆ ಒಂದು ಪೂರ್ಣ struct instance ಸಿಗುತ್ತದೆ.

### struct properties ಅನ್ನು ಪ್ರವೇಶಿಸುವುದು

ಒಮ್ಮೆ instance ಸೃಷ್ಟಿಯಾದ ನಂತರ, ಅದರ ಒಳಗಿನ properties ಗಳನ್ನು ಪ್ರವೇಶಿಸಲು “dot syntax” ಬಳಸಬಹುದು.

ಮೂಲ ಬರವಣಿಗೆ:

```swift
instance.propertyName
```

ಉದಾಹರಣೆಗೆ:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

ಇಲ್ಲಿ `st` ಒಂದು struct instance ಆಗಿದ್ದು, `st.name` ಎಂದರೆ ಆ instance ನ `name` value ಓದುವುದು.

ನೀವು ಇದನ್ನು ಹೀಗೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು: `st.name` ಎಂದು ಬರೆಯುವುದು ಅಂದರೆ ಆ ಪೆಟ್ಟಿಗೆಯ ಒಂದು ನಿರ್ದಿಷ್ಟ ಸ್ಥಳದಲ್ಲಿರುವ ವಿಷಯವನ್ನು ಓದಿದಂತಾಗಿದೆ.

ಈ ರೀತಿಯ ಬರವಣಿಗೆ ಮುಂದಿನ SwiftUI ಇಂಟರ್ಫೇಸ್‌ಗಳಲ್ಲಿ ತುಂಬಾ ಸಾಮಾನ್ಯವಾಗಿರುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, ನಮ್ಮ ಬಳಿ ಹೆಸರು, ವಯಸ್ಸು ಮತ್ತು ತರಗತಿಯನ್ನು ಹೊಂದಿರುವ student structure ಇದ್ದರೆ, ಇಂಟರ್ಫೇಸ್‌ನಲ್ಲಿ ತೋರಿಸುವಾಗ ನಾವು ಬೇರೆಬೇರೆ ಓದಬಹುದು:

```swift
student.name
student.age
student.className
```

ಈ ವಿಧಾನದಿಂದ ಡೇಟಾ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ ಮತ್ತು ಅದನ್ನು ನಿರ್ವಹಿಸುವುದೂ ಸುಲಭವಾಗುತ್ತದೆ.

### struct ನ ಸ್ಥಾನ

ಆರಂಭಿಕರಿಗೆ ಸಾಮಾನ್ಯವಾಗಿ structure ಅನ್ನು `ContentView` ಹೊರಗೆ ಬರೆಯಬಹುದು.

ಉದಾಹರಣೆಗೆ:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

ಈ ರೀತಿಯಲ್ಲಿ, ರಚನೆ ಇನ್ನಷ್ಟು ಸ್ಪಷ್ಟವಾಗುತ್ತದೆ ಮತ್ತು ಓದಲು ಸಹ ಸುಲಭವಾಗುತ್ತದೆ.

`ContentView` ಸ್ವತಃ ಕೂಡ ನಿಜವಾಗಿ ಒಂದು `struct` ಆಗಿದೆ ಎಂಬುದನ್ನು ನೀವು ಗಮನಿಸುತ್ತೀರಿ.

### Movie ರಚನೆ

ಮೇಲಿನ ಅಡಿಪಾಯದ ಆಧಾರದಲ್ಲಿ, ಈಗ ನಾವು ಚಲನಚಿತ್ರದ ರಚನೆಯನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಬಹುದು:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

ಇದು `Movie` ಎಂಬ ರಚನೆ; ಇದರಲ್ಲಿ `name`, `director`, ಮತ್ತು `rating` ಎಂಬ ಮೂರು fields ಇವೆ, ಅವು ಕ್ರಮವಾಗಿ ಚಲನಚಿತ್ರದ ಹೆಸರು, ನಿರ್ದೇಶಕ, ಮತ್ತು ರೇಟಿಂಗ್ ಅನ್ನು ಸೂಚಿಸುತ್ತವೆ.

ಈ ರೀತಿಯಲ್ಲಿ, ಒಂದು ಚಲನಚಿತ್ರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ ಮಾಹಿತಿಯನ್ನು ಇನ್ನು ಮುಂದೆ ಹಲವು arrayಗಳಿಗೆ ವಿಭಜಿಸಿ ಉಳಿಸುವ ಅಗತ್ಯವಿಲ್ಲ; ಅದನ್ನು ನೇರವಾಗಿ ಒಂದು ಸಂಪೂರ್ಣ ಘಟಕವಾಗಿ ಸೇರಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ನಾವು ಈ ರೀತಿಯ ಒಂದು ಚಲನಚಿತ್ರ instance ಅನ್ನು ಸೃಷ್ಟಿಸಬಹುದು:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

ಈ instance “ಒಂದು ಪೂರ್ಣ ಚಲನಚಿತ್ರ ಡೇಟಾ”ವನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ.

### array ಯಲ್ಲಿ structures ಅನ್ನು ಉಳಿಸುವುದು

ನಾವು ಮೊದಲು ಹೇಳಿದ್ದೇವೆ: array ಗಳು ಒಂದೇ ರೀತಿಯ type ಅನ್ನು ಮಾತ್ರ ಉಳಿಸಬಹುದು.

ಈಗ ನಮ್ಮ ಬಳಿ `Movie` structure ಇದೆ, ಆದ್ದರಿಂದ array ಹಲವು `Movie` ಗಳನ್ನು ಉಳಿಸಬಹುದು.

```swift
let lists: [Movie] = []
```

ಉದಾಹರಣೆಗೆ:

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

ಈ `lists` array ನಲ್ಲಿ strings ಉಳಿಯುವುದಿಲ್ಲ; ಬದಲಿಗೆ ಹಲವು `Movie` instances ಉಳಿಯುತ್ತವೆ.

ಅಂದರೆ, array ಯಲ್ಲಿರುವ ಪ್ರತಿಯೊಂದು element ಕೂಡ ಒಂದು ಸಂಪೂರ್ಣ ಚಲನಚಿತ್ರವಾಗಿರುತ್ತದೆ.

ಈ ರೀತಿಯಲ್ಲಿ, ಚಲನಚಿತ್ರ ಪಟ್ಟಿಯನ್ನು ತೋರಿಸಬೇಕಾದಾಗ, `ForEach` ಮೂಲಕ ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರವನ್ನು ಒಂದರ ಹಿಂದೆ ಒಂದನ್ನು ಓದಬಹುದು.

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

ಇಲ್ಲಿ `movie in` ಎಂದರೆ, ಪ್ರತಿಯೊಂದು loop ಸಮಯದಲ್ಲೂ array ಯಿಂದ ಒಂದು ಚಲನಚಿತ್ರವನ್ನು ತೆಗೆದು ಅದಕ್ಕೆ ತಾತ್ಕಾಲಿಕವಾಗಿ `movie` ಎಂಬ ಹೆಸರು ನೀಡಲಾಗುತ್ತದೆ.

ಆ ಬಳಿಕ, ನಾವು ಬಳಸಬಹುದು:

```swift
movie.name
movie.director
movie.rating
```

ಇವುಗಳ ಮೂಲಕ ಆ ಚಲನಚಿತ್ರದ ಹೆಸರು, ನಿರ್ದೇಶಕ ಮತ್ತು ರೇಟಿಂಗ್ ಅನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಓದಿ, ಇಂಟರ್ಫೇಸ್‌ನಲ್ಲಿ ತೋರಿಸಬಹುದು.

## ForEach ದೋಷ

ಇಲ್ಲಿಯವರೆಗೆ, ನಾವು ಚಲನಚಿತ್ರ array ಮತ್ತು `ForEach` ನ ಮೂಲ ಬರವಣಿಗೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

ಆದರೆ ಕೆಳಗಿನ ಕೋಡ್ ಅನ್ನು ನೇರವಾಗಿ ಚಾಲನೆ ಮಾಡಿದರೆ:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ದೋಷ ತೋರಿಸುತ್ತದೆ:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

ಈ ದೋಷದ ಅರ್ಥ ಏನೆಂದರೆ, ನೀವು `id: \.self` ಎಂದು ಬರೆಯುವಾಗ, SwiftUI ಗೆ array ಯಲ್ಲಿರುವ ಪ್ರತಿಯೊಂದು element ನ್ನೂ “ಒಂದು ಅನನ್ಯ ಗುರುತು” ಎಂದು ಪರಿಗಣಿಸಬೇಕಾಗುತ್ತದೆ.

ಈ ರೀತಿಯ ಬರವಣಿಗೆ `String` ಮತ್ತು `Int` ತರಹದ ಸರಳ type ಗಳಿಗೆ ಸೂಕ್ತ, ಏಕೆಂದರೆ ಅವುಗಳನ್ನು ಪ್ರತ್ಯೇಕಿಸುವುದು ಸಹಜವಾಗಿ ಸುಲಭ.

ಆದರೆ `Movie` ನಾವು ವ್ಯಾಖ್ಯಾನಿಸಿದ custom structure ಆಗಿದೆ, ಮತ್ತು `ForEach` ಗೆ ಅದನ್ನೇ ಅನನ್ಯ ಗುರುತಾಗಿ ಹೇಗೆ ಬಳಸಬೇಕು ಎಂಬುದು ಗೊತ್ತಿಲ್ಲ, ಆದ್ದರಿಂದ ದೋಷ ಬರುತ್ತದೆ.

ಈ ಸಮಸ್ಯೆಯನ್ನು ಪರಿಹರಿಸುವ ಸಾಮಾನ್ಯ ವಿಧಾನವೆಂದರೆ `Movie` ಅನ್ನು `Identifiable` protocol ಗೆ ಹೊಂದಿಸುವುದು.

## ಪ್ರೋಟೋಕಾಲ್

Swift ನಲ್ಲಿ, protocol ಅನ್ನು ಒಂದು ರೀತಿಯ “ನಿಯಮ” ಅಥವಾ “ಅವಶ್ಯಕತೆ” ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ನೀವು ಅದನ್ನು ಅಂತರರಾಷ್ಟ್ರೀಯ ಸಂಸ್ಥೆಯ ಒಪ್ಪಂದದಂತೆ ಭಾವಿಸಬಹುದು: ಒಂದು ದೇಶವು ಯಾವುದಾದರೂ ಅಂತರರಾಷ್ಟ್ರೀಯ ಸಂಸ್ಥೆಗೆ ಸೇರಲು ಬಯಸಿದರೆ, ಸಾಮಾನ್ಯವಾಗಿ ಆ ಸಂಸ್ಥೆ ಸೂಚಿಸುವ ಕೆಲವು ನಿಯಮಗಳನ್ನು ಪೂರೈಸಬೇಕು, ಕೆಲವು ಡೇಟಾವನ್ನು ಬಹಿರಂಗಪಡಿಸಬೇಕು, ಮತ್ತು ಕೆಲವು ಸಾಮಾನ್ಯ ನಿಯಮಗಳನ್ನು ಪಾಲಿಸಬೇಕು. ಈ ಷರತ್ತುಗಳು ಪೂರ್ತಿಯಾದ ನಂತರವೇ ಅದು ಆ ಸಂಸ್ಥೆಯಲ್ಲಿ ಸೇರಬಹುದು ಅಥವಾ ಕೆಲವು ವಿಷಯಗಳಲ್ಲಿ ಭಾಗವಹಿಸಬಹುದು.

ಪ್ರೋಟೋಕಾಲ್‌ಗಳ ತತ್ವವೂ ಹೀಗೆಯೇ ಇರುತ್ತದೆ.

ಯಾವುದೇ type ಒಂದು ನಿರ್ದಿಷ್ಟ protocol ಅನ್ನು ಅನುಸರಿಸಬೇಕೆಂದರೆ, ಅದು ಆ protocol ನಿಗದಿಪಡಿಸಿದ ವಿಷಯಗಳನ್ನು ಪೂರೈಸಬೇಕು. ಈ ಅವಶ್ಯಕತೆಗಳು ಪೂರ್ಣಗೊಂಡ ಬಳಿಕವೇ ಆ type ಸಂಬಂಧಿತ ಕಾರ್ಯಗಳನ್ನು ಬಳಸಬಹುದು.

ಮೂಲ ಬರವಣಿಗೆ:

```swift
struct Movie: Identifiable {
    // ...
}
```

ಇಲ್ಲಿ `: Identifiable` ಎಂದರೆ `Movie` `Identifiable` protocol ಅನ್ನು ಅನುಸರಿಸುತ್ತದೆ.

ಒಂದು type ಅನೇಕ protocols ಅನ್ನು ಅನುಸರಿಸಿದರೆ, ಅವನ್ನು comma ಮೂಲಕ ಬೇರ್ಪಡಿಸಬಹುದು:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` ಗೆ ಅತ್ಯಂತ ಮುಖ್ಯವಾದ ಅವಶ್ಯಕತೆ ಎಂದರೆ, ಆ type ಬಳಿ ತನ್ನನ್ನು ಗುರುತಿಸಬಲ್ಲ `id` ಇರಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

ಇಲ್ಲಿ `id` ಒಂದು ಗುರುತಿನ ಚೀಟಿ ಸಂಖ್ಯೆಯಂತೆ, ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರವನ್ನು ಬೇರ್ಪಡಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರದ `id` ವಿಭಿನ್ನವಾಗಿರುವವರೆಗೆ, SwiftUI array ಯಲ್ಲಿರುವ ಪ್ರತಿಯೊಂದು element ನ್ನೂ ಸರಿಯಾಗಿ ಬೇರ್ಪಡಿಸಬಹುದು.

ಉದಾಹರಣೆಗೆ:

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

ನಂತರ `ForEach` ನಲ್ಲಿ ಹೀಗೆ ಬಳಸುತ್ತೇವೆ:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

ಈ ರೀತಿ ದೋಷ ಉಂಟಾಗುವುದಿಲ್ಲ.

ಏಕೆಂದರೆ `Movie` ಈಗಾಗಲೇ `Identifiable` ಗೆ ಹೊಂದಿಕೊಂಡಿದೆ, ಆದ್ದರಿಂದ ಇನ್ನಷ್ಟು ಸಾಮಾನ್ಯವಾದ ಬರವಣಿಗೆಯೆಂದರೆ `id:` ನ್ನೇ ನೇರವಾಗಿ ಬಿಟ್ಟಿಡುವುದು:

```swift
ForEach(lists) { movie in
    // ...
}
```

ಯಾಕೆಂದರೆ SwiftUI ಗೆ ಪ್ರತಿಯೊಂದು item ಅನ್ನು ಬೇರ್ಪಡಿಸಲು `movie.id` ಬಳಸಬೇಕೆಂದು ಈಗಾಗಲೇ ಗೊತ್ತಿದೆ.

## ForEach ನ ವಿಭಿನ್ನತೆ ಗುರುತು

ಈಗ ನಾವು `ForEach` ಒಳಗಿನ `id` ಯ ಪಾತ್ರವನ್ನು ಇನ್ನಷ್ಟು ಆಳವಾಗಿ ತಿಳಿದುಕೊಳ್ಳೋಣ.

ಉದಾಹರಣೆಗೆ:

```swift
ForEach(lists, id: \.self)
```

ಇದರಿಂದ element ನ್ನೇ ವಿಭಿನ್ನತೆ ಗುರುತಾಗಿ ಬಳಸುವುದು ಎಂದು ಅರ್ಥ.

ಮತ್ತೊಂದು:

```swift
ForEach(lists, id: \.id)
```

ಎಂದರೆ element ನ `id` field ಅನ್ನು ವಿಭಿನ್ನತೆ ಗುರುತಾಗಿ ಬಳಸುವುದು.

ಯಾವುದೇ ಒಂದು field ತಾನೇ ಅನನ್ಯತೆಯನ್ನು ಖಚಿತಪಡಿಸಬಲ್ಲದ್ದಾದರೆ, ಅದನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿಯೂ ಬಳಸಬಹುದು.

ಉದಾಹರಣೆಗೆ, ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರದ ಹೆಸರೂ ವಿಭಿನ್ನವಾಗಿದ್ದರೆ, ಪ್ರಸ್ತುತ ಡೇಟಾದ ಮೇಲೆ ಕೆಳಗಿನ ಬರವಣಿಗೆಯೂ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡಬಹುದು:

```swift
ForEach(lists, id: \.name)
```

ಆದರೆ ಇಲ್ಲಿ ಒಂದು ಅಡಗಿದ ಸಮಸ್ಯೆ ಇದೆ: `name` ಯಾವಾಗಲೂ ಅನನ್ಯವಾಗಿರಬೇಕೆಂಬುದಿಲ್ಲ.

ಮುಂದೆ ನೀನು ಅದೇ ಹೆಸರಿನ ಮತ್ತೊಂದು ಚಲನಚಿತ್ರ ಸೇರಿಸಿದರೆ, ಆಗ `name` ಪ್ರತಿಯೊಂದು element ನ್ನೂ ನಿಖರವಾಗಿ ಬೇರ್ಪಡಿಸಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.

ಅಂಥ ಸಂದರ್ಭದಲ್ಲಿ, ಕೋಡ್ compile ಆದರೂ ಸಹ, view refresh, update, insert ಅಥವಾ delete ಮಾಡುವಾಗ SwiftUI ತಪ್ಪಾಗಿ ಗುರುತಿಸಬಹುದು, ಇದರಿಂದ ಪ್ರದರ್ಶನದ ಸಮಸ್ಯೆಗಳು ಉಂಟಾಗಬಹುದು.

ಆದ್ದರಿಂದ, ಡೇಟಾವನ್ನು ಸ್ಥಿರವಾಗಿ ಬೇರ್ಪಡಿಸಬೇಕಾದಾಗ ನಿಜವಾಗಿಯೂ ಅನನ್ಯವಾಗಿರುವ field ಅಂದರೆ `id` ಬಳಸುವುದೇ ಉತ್ತಮ.

## UUID

`id: 1`, `id: 2` ಎಂದು ಕೈಯಾರೆ ಬರೆಯುವುದರಿಂದ ಸಮಸ್ಯೆ ಬಗೆಹರಿಯಬಹುದು, ಆದರೆ ಇನ್ನೂ ಒಂದು ಅಪಾಯ ಇದೆ: ತಪ್ಪಾಗಿ ಒಂದೇ `id` ಮತ್ತೆ ಬರಬಹುದು, ಆಗ ಅನನ್ಯ ಗುರುತು ಅಮಾನ್ಯವಾಗುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

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

ಈ ರೀತಿಯಾಗಿ ಎರಡು ಒಂದೇ `id` ಗಳು ಉಂಟಾಗುತ್ತವೆ, ಮತ್ತು ಅನನ್ಯ ಗುರುತು ತನ್ನ ಮಾನ್ಯತೆಯನ್ನು ಕಳೆದುಕೊಳ್ಳುತ್ತದೆ.

ಕೈಚಳಕದ ತಪ್ಪುಗಳನ್ನು ತಪ್ಪಿಸಲು, ಸಾಮಾನ್ಯವಾಗಿ ನಾವು `UUID()` ಬಳಸುತ್ತೇವೆ.

Swift ನಲ್ಲಿ, `UUID()` ಒಂದು 128-bit ಗುರುತನ್ನು ಯಾದೃಚ್ಛಿಕವಾಗಿ ನಿರ್ಮಿಸುತ್ತದೆ. ಇದು ಸಾಮಾನ್ಯವಾಗಿ ಅಕ್ಷರಗಳು ಮತ್ತು ಅಂಕೆಗಳಿಂದ ಕೂಡಿದ ಒಂದು ಉದ್ದವಾದ string ರೂಪದಲ್ಲಿ ಕಾಣುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

ಇಲ್ಲಿ `UUID()` ನಿಜವಾಗಿ `UUID` type ನ instance ಒಂದನ್ನು ರಚಿಸುತ್ತದೆ; ನೀವು ಇದನ್ನು ಸ್ವಯಂ ಸೃಷ್ಟಿಯಾಗುವ “ಅನನ್ಯ ಸಂಖ್ಯೆ” ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು.

ಆದ್ದರಿಂದ, ಪ್ರತಿ ಬಾರಿ ಸೃಷ್ಟಿಯಾಗುವ values ಬಹುತೇಕ ಯಾವತ್ತೂ ಪುನರಾವರ್ತಿಯಾಗುವುದಿಲ್ಲ; ಹೀಗಾಗಿ `id` ಆಗಿ ಬಳಸಲು ಇದು ಅತ್ಯಂತ ಸೂಕ್ತ.

ನಾವು `Movie` ಅನ್ನು ಹೀಗೆ ಬದಲಾಯಿಸಬಹುದು:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ಈ ಕೋಡ್‌ನ ಅರ್ಥ, `Movie` ರಚನೆಯೊಳಗಿನ `id` field ಗೆ ಡೀಫಾಲ್ಟ್ ಆಗಿಯೇ ಹೊಸ `UUID` instance ನೀಡಲಾಗುತ್ತದೆ.

ಅಂದರೆ, ಪ್ರತಿ ಬಾರಿ ನಾವು ಹೊಸ `Movie` ಸೃಷ್ಟಿಸಿದಾಗ, ವ್ಯವಸ್ಥೆ ಮೊದಲೇ ಒಂದು ಅನನ್ಯ `id` ನಿರ್ಮಿಸಿ ಕೊಡುತ್ತದೆ.

`id` ಗೆ ಈಗಾಗಲೇ default value ಇರುವುದರಿಂದ, ನಂತರ `Movie` instances ಸೃಷ್ಟಿಸುವಾಗ `id` ಅನ್ನು ಕೈಯಾರೆ ತುಂಬಬೇಕಾಗುವುದಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ:

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

ಇಲ್ಲಿ `id` ಅನ್ನು ಬರೆಯದಿದ್ದರೂ, ವಾಸ್ತವದಲ್ಲಿ ಈ ಚಲನಚಿತ್ರ instance ಗೆ ತನ್ನದೇ ಆದ `id` ಇರುತ್ತದೆ; ಆ value ಅನ್ನು `UUID()` ಸ್ವಯಂಚಾಲಿತವಾಗಿ ನಿರ್ಮಿಸಿದೆ.

ಈ ವಿಧಾನವನ್ನು ಬಳಸಿದ ನಂತರ, ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರಕ್ಕೂ ಕೈಯಾರೆ `id` ತುಂಬುವ ಅಗತ್ಯವಿರುವುದಿಲ್ಲ. ಇದರಿಂದ ಕೋಡ್ ಪ್ರಮಾಣ ಕಡಿಮೆಯಾಗುವುದಷ್ಟೇ ಅಲ್ಲ, ಮರುಕಳಿಸುವ id ಗಳಿಂದಾಗುವ ತಪ್ಪುಗಳನ್ನೂ ತಪ್ಪಿಸಬಹುದು.

ಕೊನೆಯಲ್ಲಿ, ಮೇಲ್ಭಾಗದಲ್ಲಿ ಒಂದು `Banner` ಚಿತ್ರವನ್ನು ಸೇರಿಸಿ, ವಿಷಯವನ್ನು scroll ಮಾಡಬಹುದಾಗಿಸಲು `ScrollView` ಬಳಸಿದರೆ, ಸಂಪೂರ್ಣ ಚಲನಚಿತ್ರ ಪಟ್ಟಿಯ view ಸಿದ್ಧವಾಗುತ್ತದೆ.

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಬಹಳ ಮುಖ್ಯವಾದ ಜ್ಞಾನಬಿಂದು `struct` ಅನ್ನು ಕಲಿತಿದ್ದೇವೆ.

`struct` ಮೂಲಕ, ಒಂದು ಚಲನಚಿತ್ರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ ಹಲವು fields ಅನ್ನು ಒಂದೇ ಘಟಕವಾಗಿ ಗೂಡಿಸಬಹುದು; ಹೆಸರು, ನಿರ್ದೇಶಕ, ರೇಟಿಂಗ್‌ಗಳನ್ನು ಬೇರೆ ಬೇರೆ array ಗಳಲ್ಲಿ ಹಂಚಿ ಇಡುವ ಅಗತ್ಯವಿಲ್ಲ.

ಡೇಟಾವನ್ನು ಗೂಡಿಸಿದ ನಂತರ, `ForEach` ಬಳಸಿ array ಯಲ್ಲಿರುವ ಪ್ರತಿಯೊಂದು ಚಲನಚಿತ್ರವನ್ನು ಒಂದೊಂದಾಗಿ view ನಲ್ಲಿ ತೋರಿಸಬಹುದು.

ಅದೇ ಸಮಯದಲ್ಲಿ, `ForEach` ಒಳಗಿನ “ವಿಭಿನ್ನತೆ ಗುರುತು” ಯ ಪಾತ್ರವನ್ನೂ ನಾವು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೇವೆ. SwiftUI ಗೆ array ಯ ಪ್ರತಿಯೊಂದು element ಅನ್ನು ಹೇಗೆ ಬೇರ್ಪಡಿಸಬೇಕು ಎಂಬುದು ತಿಳಿದಿರಬೇಕು; ಆಗ ಮಾತ್ರ view ಅನ್ನು ಸರಿಯಾಗಿ ತೋರಿಸಿ update ಮಾಡಬಹುದು.

ಆದ್ದರಿಂದ, ನಾವು `Movie` ಅನ್ನು `Identifiable` protocol ಗೆ ಹೊಂದಿಸಿ, ಅದಕ್ಕೆ ಒಂದು ಅನನ್ಯ `id` ನೀಡಿದ್ದೇವೆ.

`id` ಅನ್ನು ಕೈಯಾರೆ ತುಂಬುವಾಗಾಗುವ ತಪ್ಪುಗಳನ್ನು ತಪ್ಪಿಸಲು, ನಾವು `UUID()` ನ್ನೂ ಕಲಿತಿದ್ದೇವೆ; ಇದರಿಂದ ವ್ಯವಸ್ಥೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಅನನ್ಯ ಗುರುತನ್ನು ರಚಿಸುತ್ತದೆ.

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಕೇವಲ ಚಲನಚಿತ್ರ ಪಟ್ಟಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವುದಲ್ಲ, SwiftUI ಯಲ್ಲಿನ ಒಂದು ಪ್ರಮುಖ ಯೋಚನಾ ವಿಧಾನವನ್ನೂ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಪ್ರಾರಂಭಿಸುತ್ತೀರಿ: **ಮೊದಲು ಡೇಟಾವನ್ನು ಗೂಡಿಸಿ, ನಂತರ ಆ ಡೇಟಾದ ಆಧಾರದಲ್ಲಿ view ಅನ್ನು ನಿರ್ಮಿಸಿ.**

## ಸಂಪೂರ್ಣ ಕೋಡ್

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
