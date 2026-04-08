# ਫਿਲਮ ਸੂਚੀ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਫਿਲਮ ਸੂਚੀ ਬਣਾਵਾਂਗੇ।

![movie](../../Resource/021_movie.png)

ਇਸ ਸੂਚੀ ਵਿੱਚ ਹਰ ਫਿਲਮ ਦਾ ਪੋਸਟਰ, ਨਾਮ, ਨਿਰਦੇਸ਼ਕ ਅਤੇ ਰੇਟਿੰਗ ਦਿਖਾਈ ਜਾਵੇਗੀ।

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਬਹੁਤ ਮਹੱਤਵਪੂਰਣ ਸੰਕਲਪ ਸਿੱਖਾਂਗੇ: `struct` ਸਰਚਨਾ। ਇਹ ਸਾਨੂੰ ਇੱਕ ਫਿਲਮ ਦੀਆਂ ਕਈ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਇਕੱਠਾ ਕਰਕੇ ਇੱਕ ਪੂਰੇ ਰੂਪ ਵਿੱਚ ਜੋੜਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਇਸ ਤੋਂ ਇਲਾਵਾ, ਅਸੀਂ `UUID()`、`ForEach`、`Divider` ਵੰਡ ਰੇਖਾ, ਅਤੇ ਕਸਟਮ ਆਬਜੈਕਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਾਟਾ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਣਾ ਹੈ, ਇਹ ਵੀ ਵੇਖਾਂਗੇ।

ਇਹ ਗਿਆਨ ਅੱਗੇ ਆਉਣ ਵਾਲੀ SwiftUI ਡਿਵੈਲਪਮੈਂਟ ਵਿੱਚ ਬਹੁਤ ਆਮ ਹੈ। ਇਹ ਪਾਠ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਨਾ ਸਿਰਫ਼ ਇੱਕ ਫਿਲਮ ਸੂਚੀ ਬਣਾ ਸਕੋਗੇ, ਸਗੋਂ “ਇੱਕ ਸਮੂਹ ਡਾਟਾ ਨੂੰ ਇੰਟਰਫੇਸ ਵਜੋਂ ਕਿਵੇਂ ਦਿਖਾਉਣਾ ਹੈ” ਇਹ ਵੀ ਸਮਝਣਾ ਸ਼ੁਰੂ ਕਰੋਗੇ।

## ਇੱਕ ਫਿਲਮ

ਅਸੀਂ ਪਹਿਲਾਂ ਇੱਕ ਇਕੱਲੀ ਫਿਲਮ ਦੇ ਇੰਟਰਫੇਸ ਤੋਂ ਸ਼ੁਰੂ ਕਰ ਸਕਦੇ ਹਾਂ।

![movie](../../Resource/021_movie1.png)

ਇਸ ਇੰਟਰਫੇਸ ਦੀ ਲੇਆਉਟ ਮੁੱਖ ਤੌਰ 'ਤੇ ਦੋ ਭਾਗਾਂ ਤੋਂ ਬਣੀ ਹੈ: ਖੱਬੇ ਪਾਸੇ ਫਿਲਮ ਦਾ ਪੋਸਟਰ ਹੈ ਅਤੇ ਸੱਜੇ ਪਾਸੇ ਫਿਲਮ ਦਾ ਪਰਿਚਯ।

### ਫਿਲਮ ਪੋਸਟਰ

ਖੱਬੇ ਪਾਸੇ ਫਿਲਮ ਦਾ ਪੋਸਟਰ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਅਸੀਂ ਤਸਵੀਰ ਦਿਖਾਉਣ ਲਈ `Image` ਵਰਤ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ ਕਿ `"The Shawshank Redemption"` ਨਾਮ ਦੀ ਇੱਕ ਤਸਵੀਰ ਦਿਖਾਈ ਜਾ ਰਹੀ ਹੈ।

ਇੱਥੇ ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਇਹ ਹੈ ਕਿ ਤਸਵੀਰ ਦਾ ਨਾਮ `Assets` ਸਰੋਤ ਫੋਲਡਰ ਵਿੱਚ ਅਸਲ ਵਿੱਚ ਮੌਜੂਦ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ, ਨਹੀਂ ਤਾਂ ਇੰਟਰਫੇਸ ਇਸ ਤਸਵੀਰ ਨੂੰ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਨਹੀਂ ਦਿਖਾ ਸਕੇਗਾ।

![movie](../../Resource/021_movie2.png)

ਇਨ੍ਹਾਂ ਮੋਡੀਫਾਇਰਾਂ ਦੇ ਕੰਮ ਇਹ ਹਨ:

- `resizable()` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਤਸਵੀਰ ਦਾ ਆਕਾਰ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ।
- `scaledToFit()` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਸਕੇਲ ਕਰਨ ਵੇਲੇ ਮੁੱਢਲਾ ਅਨੁਪਾਤ ਕਾਇਮ ਰਹਿੰਦਾ ਹੈ, ਤਾਂ ਜੋ ਤਸਵੀਰ ਖਿੱਚ ਕੇ ਵਿਗੜੇ ਨਾ।
- `frame(height: 180)` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਤਸਵੀਰ ਦੀ ਉਚਾਈ 180 ਰੱਖੀ ਜਾਂਦੀ ਹੈ।
- `cornerRadius(10)` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਤਸਵੀਰ ਨੂੰ 10 ਰੇਡੀਅਸ ਵਾਲੇ ਗੋਲ ਕੋਨੇ ਦਿੱਤੇ ਜਾਂਦੇ ਹਨ।

ਇਸ ਤਰ੍ਹਾਂ ਸਾਨੂੰ ਢੁੱਕਵੇਂ ਆਕਾਰ ਵਾਲੀ ਅਤੇ ਗੋਲ ਕੋਨਿਆਂ ਵਾਲੀ ਫਿਲਮ ਪੋਸਟਰ ਤਸਵੀਰ ਮਿਲਦੀ ਹੈ।

![movie](../../Resource/021_movie3.png)

### ਫਿਲਮ ਪਰਿਚਯ

ਸੱਜੇ ਪਾਸੇ ਫਿਲਮ ਦਾ ਪਰਿਚਯ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਫਿਲਮ ਦਾ ਨਾਮ, ਨਿਰਦੇਸ਼ਕ ਅਤੇ ਰੇਟਿੰਗ ਸ਼ਾਮਲ ਹੁੰਦੇ ਹਨ।

![movie](../../Resource/021_movie4.png)

ਅਸੀਂ ਇਸ ਹਿੱਸੇ ਨੂੰ ਦਿਖਾਉਣ ਲਈ `Text` ਵਰਤ ਸਕਦੇ ਹਾਂ:

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

ਇਸ ਕੋਡ ਵਿੱਚ `.font` ਫੋਂਟ ਦੇ ਆਕਾਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ ਅਤੇ `.fontWeight` ਫੋਂਟ ਦੀ ਮੋਟਾਈ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

“ਫਿਲਮ ਨਾਮ”, “ਨਿਰਦੇਸ਼ਕ ਜਾਣਕਾਰੀ” ਅਤੇ “ਰੇਟਿੰਗ ਜਾਣਕਾਰੀ” ਵਿਚਕਾਰ ਹੋਰ ਸਪਸ਼ਟ ਦੂਰੀ ਬਣਾਉਣ ਲਈ, ਅਸੀਂ ਇੱਥੇ ਸਭ ਤੋਂ ਬਾਹਰੀ ਪੱਧਰ 'ਤੇ `VStack` ਵਰਤਦੇ ਹਾਂ ਅਤੇ ਇਹ ਸੈੱਟ ਕਰਦੇ ਹਾਂ:

```swift
spacing: 10
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਇਸ `VStack` ਦੇ ਅੰਦਰ ਹਰ ਸਮੂਹ ਦੇ ਵਿਚਕਾਰ ਦੀ ਦੂਰੀ 10 ਹੋਵੇਗੀ।

ਨਿਰਦੇਸ਼ਕ ਅਤੇ ਰੇਟਿੰਗ ਨੂੰ ਵੱਖ-ਵੱਖ `VStack` ਵਿੱਚ ਲਪੇਟਣ ਦਾ ਕਾਰਨ ਇਹ ਹੈ ਕਿ ਦੋਵੇਂ “ਸਿਰਲੇਖ + ਸਮੱਗਰੀ” ਜਿਹੇ ਢਾਂਚੇ ਨਾਲ ਸੰਬੰਧਿਤ ਹਨ। ਇਸ ਨਾਲ ਇੰਟਰਫੇਸ ਦੀ ਪੜਾਅਵਾਰ ਬਣਤਰ ਹੋਰ ਸਪਸ਼ਟ ਹੁੰਦੀ ਹੈ ਅਤੇ ਅੱਗੇ ਚੱਲ ਕੇ ਸ਼ੈਲੀ ਨੂੰ ਬਦਲਣਾ ਵੀ ਆਸਾਨ ਹੁੰਦਾ ਹੈ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, `VStack` ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਵਿਚਕਾਰ ਐਲਾਇਨ ਹੁੰਦਾ ਹੈ। ਸਾਰੇ ਲਿਖਤ ਨੂੰ ਖੱਬੇ ਪਾਸੇ ਐਲਾਇਨ ਕਰਨ ਲਈ, ਅਸੀਂ ਇਹ ਸੈੱਟ ਕਰਦੇ ਹਾਂ:

```swift
alignment: .leading
```

ਇਸ ਤਰ੍ਹਾਂ ਫਿਲਮ ਪਰਿਚਯ ਵਾਲਾ ਹਿੱਸਾ ਹੋਰ ਸੁਥਰਾ ਲੱਗਦਾ ਹੈ।

### ਵੰਡ ਰੇਖਾ

ਹੁਣ, ਭਾਵੇਂ ਫਿਲਮ ਪਰਿਚਯ ਦੀ ਸਮੱਗਰੀ `spacing` ਨਾਲ ਵੱਖਰੀ ਦਿੱਖ ਰਹੀ ਹੈ, ਫਿਰ ਵੀ ਵੱਖਰੀ ਸਮੱਗਰੀ ਦੇ ਵਿਚਕਾਰ ਹੱਦ ਰੇਖਾ ਕਾਫ਼ੀ ਸਪਸ਼ਟ ਨਹੀਂ ਹੈ।

ਇਸ ਵੇਲੇ, ਅਸੀਂ ਇੱਕ ਵੰਡ ਰੇਖਾ ਜੋੜ ਸਕਦੇ ਹਾਂ:

```swift
Divider()
```

ਉਦਾਹਰਨ ਲਈ:

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

ਇਸ ਤਰ੍ਹਾਂ, ਫਿਲਮ ਪਰਿਚਯ ਵਾਲੇ ਹਿੱਸੇ ਵਿੱਚ ਹੋਰ ਸਪਸ਼ਟ ਵੰਡ ਪ੍ਰਭਾਵ ਨਜ਼ਰ ਆਵੇਗਾ।

![movie](../../Resource/021_movie4.png)

`Divider` ਇੱਕ ਬਹੁਤ ਹੀ ਸਧਾਰਣ ਪਰ ਬਹੁਤ ਵਰਤਿਆ ਜਾਣ ਵਾਲਾ view ਹੈ, ਜਿਸਦਾ ਕੰਮ ਵੱਖਰੀ ਸਮੱਗਰੀ ਨੂੰ ਅਲੱਗ ਕਰਨਾ ਹੈ।

`VStack` ਵਿੱਚ, `Divider()` ਇੱਕ ਆੜੀ ਰੇਖਾ ਵਜੋਂ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

`HStack` ਵਿੱਚ, `Divider()` ਇੱਕ ਖੜ੍ਹੀ ਰੇਖਾ ਵਜੋਂ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

ਇਸ ਤੋਂ ਇਲਾਵਾ, `.frame`、`.background`、`.padding` ਆਦਿ ਤਰੀਕਿਆਂ ਨਾਲ `Divider` ਦੀ ਸ਼ੈਲੀ ਵੀ ਬਦਲੀ ਜਾ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

ਇਸ ਨਾਲ ਨੀਲੇ ਰੰਗ ਦੀ, 2 ਮੋਟਾਈ ਵਾਲੀ, ਅਤੇ ਖੱਬੇ-ਸੱਜੇ ਪਾਸੇ padding ਵਾਲੀ ਇੱਕ ਵੰਡ ਰੇਖਾ ਬਣੇਗੀ।

![divider](../../Resource/021_divider.png)

### ਪੂਰਾ ਇੰਟਰਫੇਸ

ਅੰਤ ਵਿੱਚ, ਅਸੀਂ `HStack` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਫਿਲਮ ਪੋਸਟਰ ਅਤੇ ਫਿਲਮ ਪਰਿਚਯ ਨੂੰ ਖੱਬੇ-ਸੱਜੇ ਤਰਤੀਬ ਵਿੱਚ ਰੱਖ ਸਕਦੇ ਹਾਂ।

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

ਇੱਥੇ `HStack(spacing: 20)` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਖੱਬੇ ਅਤੇ ਸੱਜੇ ਦੋਨਾਂ ਹਿੱਸਿਆਂ ਵਿਚਕਾਰ 20 ਦੀ ਦੂਰੀ ਰਹੇਗੀ।

ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਇਹ ਹੈ ਕਿ `Divider()` ਅਤੇ ਪਹਿਲਾਂ ਦੱਸੇ ਗਏ `TextField`、`Slider` ਵਾਂਗ, ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਸੰਭਵ ਹੋ ਸਕਦੀ ਉਪਲਬਧ ਜਗ੍ਹਾ ਘੇਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਨ।

ਇਸ ਲਈ, ਅਸੀਂ ਸੱਜੇ ਪਾਸੇ ਦੇ ਪਰਿਚਯ ਹਿੱਸੇ ਦੀ ਬਾਹਰੀ `VStack` ਲਈ ਇੱਕ ਨਿਸ਼ਚਿਤ ਚੌੜਾਈ ਸੈੱਟ ਕਰਦੇ ਹਾਂ:

```swift
.frame(width: 200)
```

ਇਸ ਤਰ੍ਹਾਂ ਵੰਡ ਰੇਖਾ ਅਤੇ ਲਿਖਤ ਖੇਤਰ ਦੀ ਚੌੜਾਈ ਇੱਕੋ ਜਿਹੀ ਰਹਿੰਦੀ ਹੈ, ਅਤੇ ਸਮੁੱਚੀ ਦਿੱਖ ਹੋਰ ਸੁਥਰੀ ਲੱਗਦੀ ਹੈ।

ਇੱਥੇ ਤੱਕ ਅਸੀਂ “ਇੱਕ ਫਿਲਮ” ਦੀ ਪ੍ਰਦਰਸ਼ਨ ਇੰਟਰਫੇਸ ਪੂਰੀ ਕਰ ਲਈ ਹੈ।

![movie](../../Resource/021_movie1.png)

## array ਵਿੱਚ ਫਿਲਮਾਂ ਸੰਭਾਲਣਾ

ਜੇ ਅਸੀਂ ਕਈ ਫਿਲਮਾਂ ਨੂੰ ਇੱਕੋ ਸ਼ੈਲੀ ਵਿੱਚ ਇਕ ਦੇ ਬਾਅਦ ਇਕ ਦਿਖਾਉਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਹਰ ਫਿਲਮ ਲਈ ਮਿਲਦਾ-ਜੁਲਦਾ ਕੋਡ ਵਾਰ-ਵਾਰ ਲਿਖਣਾ ਪਵੇਗਾ।

ਉਦਾਹਰਨ ਲਈ:

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

ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਿਆ ਕੋਡ ਲੋੜੀਂਦਾ ਪ੍ਰਭਾਵ ਦੇ ਸਕਦਾ ਹੈ, ਪਰ ਕੋਡ ਲਗਾਤਾਰ ਵੱਧਦਾ ਜਾਵੇਗਾ ਅਤੇ ਇਸ ਦੀ ਸੰਭਾਲ ਕਰਨੀ ਕਾਫ਼ੀ ਔਖੀ ਹੋਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਸਾਰੀਆਂ ਫਿਲਮਾਂ ਦੀ spacing ਨੂੰ `20` ਤੋਂ `15` ਕਰਨਾ ਹੋਵੇ, ਜਾਂ ਸੱਜੇ ਪਾਸੇ ਦੀ ਚੌੜਾਈ `200` ਤੋਂ
`220` ਕਰਨੀ ਹੋਵੇ, ਤਾਂ ਹਰ ਦੁਹਰਾਏ ਗਏ ਕੋਡ ਹਿੱਸੇ ਨੂੰ ਹੱਥੀਂ ਸੋਧਣਾ ਪਵੇਗਾ।

ਇਹ ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਇੱਕ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕਾ ਨਹੀਂ ਹੈ।

ਅਸੀਂ ਪਹਿਲਾਂ array ਬਾਰੇ ਸਿੱਖਿਆ ਹੈ, ਅਤੇ ਇਹ ਵੀ ਸਿੱਖਿਆ ਹੈ ਕਿ array ਦੇ ਆਧਾਰ 'ਤੇ view ਨੂੰ ਮੁੜ-ਮੁੜ ਦਿਖਾਉਣ ਲਈ `ForEach` ਕਿਵੇਂ ਵਰਤਣਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

ਇਹ ਤਰੀਕਾ “ਸਿਰਫ਼ ਇੱਕ ਹੀ ਕਿਸਮ ਦਾ ਡਾਟਾ” ਵਾਲੀ ਸਥਿਤੀ ਲਈ ਬਹੁਤ ਉਚਿਤ ਹੈ, ਜਿਵੇਂ ਇੱਕ ਸਮੂਹ ਚਿੱਤਰ ਨਾਮਾਂ ਦਾ।

ਪਰ, ਇੱਕ ਫਿਲਮ ਵਿੱਚ ਸਿਰਫ਼ ਇੱਕ ਹੀ ਮੁੱਲ ਨਹੀਂ ਹੁੰਦਾ। ਇਸ ਵਿੱਚ ਘੱਟੋ-ਘੱਟ ਇਹ ਹੁੰਦੇ ਹਨ:

1. ਫਿਲਮ ਪੋਸਟਰ
2. ਫਿਲਮ ਨਾਮ
3. ਨਿਰਦੇਸ਼ਕ
4. ਰੇਟਿੰਗ

ਅਰਥਾਤ, ਇੱਕ ਫਿਲਮ ਅਸਲ ਵਿੱਚ ਆਪਸੀ ਸੰਬੰਧਿਤ ਡਾਟਾ ਦਾ ਇੱਕ ਸਮੂਹ ਹੈ, ਨਾ ਕਿ ਇਕੱਲਾ string।

ਜੇ ਅਸੀਂ ਸਿਰਫ਼ array ਵਰਤਦੇ ਹਾਂ, ਤਾਂ ਇਸ ਜਾਣਕਾਰੀ ਨੂੰ ਸਿਰਫ਼ ਵੱਖ-ਵੱਖ ਹੀ ਸੰਭਾਲ ਸਕਦੇ ਹਾਂ:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

ਦਿਖਾਉਣ ਵੇਲੇ, ਸਾਨੂੰ ਇੱਕੋ index 'ਤੇ ਨਿਰਭਰ ਕਰਕੇ ਉਨ੍ਹਾਂ ਨੂੰ ਇਕ-ਇਕ ਕਰਕੇ ਮਿਲਾਉਣਾ ਪਵੇਗਾ:

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

ਇਸ ਲਿਖਤ ਤਰੀਕੇ ਦੀ ਸਮੱਸਿਆ ਇਹ ਹੈ ਕਿ ਇਸਦੀ ਸੰਭਾਲ ਦੀ ਲਾਗਤ ਬਹੁਤ ਵੱਧ ਹੈ।

ਕਿਉਂਕਿ ਇੱਕ ਫਿਲਮ ਦਾ ਡਾਟਾ ਕਈ arrays ਵਿੱਚ ਵੰਡਿਆ ਜਾਂਦਾ ਹੈ। ਜੇ ਕਿਸੇ ਇੱਕ array ਵਿੱਚ ਇੱਕ item ਵੱਧ ਹੋਵੇ, ਇੱਕ ਘੱਟ ਹੋਵੇ, ਜਾਂ ਕ੍ਰਮ ਵੱਖਰਾ ਹੋਵੇ, ਤਾਂ ਪ੍ਰਦਰਸ਼ਨ ਦਾ ਨਤੀਜਾ ਗਲਤ ਹੋ ਸਕਦਾ ਹੈ।

ਖ਼ਾਸ ਕਰਕੇ ਜਦੋਂ ਨਵੀਆਂ ਫਿਲਮਾਂ ਸ਼ਾਮਲ ਜਾਂ ਹਟਾਈਆਂ ਜਾਂਦੀਆਂ ਹਨ, ਤੁਹਾਨੂੰ ਇੱਕੋ ਵੇਲੇ ਕਈ arrays ਸੋਧਣੀਆਂ ਪੈਂਦੀਆਂ ਹਨ, ਅਤੇ ਕੁਝ ਨਾ ਕੁਝ ਛੁੱਟ ਜਾਣਾ ਬਹੁਤ ਆਸਾਨ ਹੈ।

ਫਿਰ “ਫਿਲਮ ਨਾਮ, ਨਿਰਦੇਸ਼ਕ, ਰੇਟਿੰਗ” ਵਰਗੀ ਜਾਣਕਾਰੀ ਨੂੰ ਇੱਕ ਸਮੂਹ ਰੂਪ ਵਿੱਚ ਕਿਵੇਂ ਜੋੜਿਆ ਜਾਵੇ?

ਇਸ ਲਈ ਸਾਨੂੰ `struct` ਵਰਤਣੀ ਪਵੇਗੀ।

## `struct` ਸਰਚਨਾ ਦੀ ਪਰਿਭਾਸ਼ਾ

Swift ਵਿੱਚ, `struct` ਦਾ ਅਰਥ “ਸਰਚਨਾ” ਹੁੰਦਾ ਹੈ।

ਤੁਸੀਂ ਇਸਨੂੰ ਇੱਕ “custom data type” ਵਜੋਂ ਸਮਝ ਸਕਦੇ ਹੋ, ਜੋ ਕਈ ਸੰਬੰਧਿਤ fields ਨੂੰ ਇਕੱਠਾ ਕਰਕੇ ਇੱਕ ਸਮੂਹ ਰੂਪ ਬਣਾਉਂਦੀ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
struct StructName {
	let name: String
}
```

ਇਸ ਕੋਡ ਵਿੱਚ, `struct` ਇੱਕ keyword ਹੈ, ਜੋ ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਅਸੀਂ ਇੱਕ ਸਰਚਨਾ ਪਰਿਭਾਸ਼ਤ ਕਰ ਰਹੇ ਹਾਂ। `StructName` ਉਸ ਸਰਚਨਾ ਦਾ ਨਾਮ ਹੈ।

ਕਰਲੀ ਬ੍ਰੇਸਿਜ਼ ਦੇ ਅੰਦਰ ਵਾਲੀ ਸਮੱਗਰੀ ਇਸ ਸਰਚਨਾ ਵਿੱਚ ਸ਼ਾਮਲ fields ਹਨ, ਅਤੇ ਹਰ field ਲਈ ਨਾਮ ਅਤੇ ਕਿਸਮ ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਲਿਖਣੀ ਲਾਜ਼ਮੀ ਹੈ।

ਆਮ ਤੌਰ 'ਤੇ, `struct` ਦਾ ਨਾਮ ਵੱਡੇ ਅੱਖਰ ਨਾਲ ਸ਼ੁਰੂ ਹੁੰਦਾ ਹੈ, ਜਿਵੇਂ `Movie`、`Student`、`UserInfo`। ਇਹ Swift ਵਿੱਚ ਇੱਕ ਆਮ naming convention ਹੈ।

ਤੁਸੀਂ `struct` ਨੂੰ ਸਧਾਰਣ ਤਰੀਕੇ ਨਾਲ ਇੱਕ ਖਾਲੀ ਪੈਕਿੰਗ ਬਾਕਸ ਵਾਂਗ ਸਮਝ ਸਕਦੇ ਹੋ, ਜਿਸ ਵਿੱਚ ਹਰ field ਉਸ ਬਾਕਸ ਵਿੱਚ ਰੱਖੀ ਇੱਕ ਖਾਲੀ ਥਾਂ ਵਾਂਗ ਹੁੰਦੀ ਹੈ।

ਜਦ ਤੱਕ ਇਹ ਥਾਵਾਂ ਭਰੀਆਂ ਨਹੀਂ ਜਾਂਦੀਆਂ, ਇਹ ਸਿਰਫ਼ ਇੱਕ ਖਾਲੀ ਬਾਕਸ ਹੁੰਦਾ ਹੈ। ਜਦੋਂ ਸਾਰੇ fields ਵਿੱਚ ਢੁੱਕਵੇਂ ਮੁੱਲ ਭਰ ਦਿੱਤੇ ਜਾਂਦੇ ਹਨ, ਤਦ ਇਹ ਇੱਕ ਪੂਰਾ ਤੋਹਫ਼ੇ ਵਾਲਾ ਬਾਕਸ ਬਣ ਜਾਂਦਾ ਹੈ।

### `struct` instance

ਪਹਿਲਾਂ ਅਸੀਂ ਸਿਰਫ਼ ਸਰਚਨਾ ਨੂੰ ਹੀ ਪਰਿਭਾਸ਼ਤ ਕੀਤਾ ਸੀ, ਜਿਸਦਾ ਅਰਥ ਹੈ ਕਿ ਅਸੀਂ ਪੈਕਿੰਗ ਬਾਕਸ ਦਾ ਢਾਂਚਾ ਤਿਆਰ ਕੀਤਾ ਸੀ।

ਹੁਣ ਸਾਨੂੰ ਇਸ ਵਿੱਚ ਅਸਲ ਸਮੱਗਰੀ ਭਰਨੀ ਪਏਗੀ, ਤਦ ਹੀ ਸਾਨੂੰ ਇੱਕ ਅਸਲ ਵਰਤੋਂਯੋਗ “instance” ਮਿਲੇਗੀ।

instance ਬਣਾਉਂਦੇ ਸਮੇਂ, ਆਮ ਤੌਰ 'ਤੇ ਸਰਚਨਾ ਦੇ ਨਾਮ ਦੇ ਬਾਅਦ `()` ਜੋੜਿਆ ਜਾਂਦਾ ਹੈ:

```swift
StructName(...)
```

ਇਨ੍ਹਾਂ ਕੌਂਠਾਂ ਦੇ ਅੰਦਰ ਉਹ field values ਭਰੀਆਂ ਜਾਂਦੀਆਂ ਹਨ ਜੋ ਇਸ ਸਰਚਨਾ ਨੂੰ ਚਾਹੀਦੀਆਂ ਹੁੰਦੀਆਂ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
StructName(name: "Fang Junyu")
```

ਇਸ ਕੋਡ ਦਾ ਮਤਲਬ ਹੈ: `StructName` ਸਰਚਨਾ ਦੇ ਫਾਰਮੈਟ ਅਨੁਸਾਰ ਇੱਕ ਨਵੀਂ instance ਬਣਾਓ ਅਤੇ `name` field ਨੂੰ `"Fang Junyu"` ਮੁੱਲ ਦਿਓ।

ਜਦੋਂ ਅਸੀਂ ਸਾਰੀ ਲੋੜੀਂਦੀ field ਸਮੱਗਰੀ ਭਰ ਦਿੰਦੇ ਹਾਂ, ਤਾਂ ਇਹ ਉਸ ਬਾਕਸ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਭਰਨ ਦੇ ਬਰਾਬਰ ਹੁੰਦਾ ਹੈ।

ਉਸ ਵੇਲੇ ਸਾਨੂੰ ਇੱਕ ਪੂਰੀ `struct` instance ਮਿਲ ਜਾਂਦੀ ਹੈ।

### `struct` ਗੁਣਾਂ ਤੱਕ ਪਹੁੰਚ

ਜਦੋਂ ਅਸੀਂ ਇੱਕ instance ਬਣਾ ਲੈਂਦੇ ਹਾਂ, ਤਾਂ ਅਸੀਂ “dot syntax” ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਸਦੇ ਅੰਦਰਲੇ ਗੁਣਾਂ ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦੇ ਹਾਂ।

ਮੂਲ ਲਿਖਤ:

```swift
instance.propertyName
```

ਉਦਾਹਰਨ ਲਈ:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

ਇੱਥੇ `st` ਇੱਕ `struct` instance ਹੈ, ਅਤੇ `st.name` ਦਾ ਮਤਲਬ ਹੈ ਇਸ instance ਦੇ ਅੰਦਰਲੇ `name` ਮੁੱਲ ਨੂੰ ਪੜ੍ਹਨਾ।

ਤੁਸੀਂ ਇਸ ਪੜ੍ਹਨ ਵਾਲੇ ਤਰੀਕੇ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝ ਸਕਦੇ ਹੋ: ਜਦੋਂ ਅਸੀਂ `st.name` ਲਿਖਦੇ ਹਾਂ, ਤਾਂ ਇਹ ਉਸ ਪੈਕਿੰਗ ਬਾਕਸ ਵਿੱਚ ਕਿਸੇ ਖਾਸ ਥਾਂ ਤੇ ਰੱਖੀ ਚੀਜ਼ ਨੂੰ ਪੜ੍ਹਨ ਵਰਗਾ ਹੁੰਦਾ ਹੈ।

ਇਹ ਲਿਖਤ ਤਰੀਕਾ ਅੱਗੇ ਆਉਣ ਵਾਲੇ SwiftUI ਇੰਟਰਫੇਸਾਂ ਵਿੱਚ ਬਹੁਤ ਆਮ ਹੋਵੇਗਾ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਸਾਡੇ ਕੋਲ ਇੱਕ student ਸਰਚਨਾ ਹੈ ਜਿਸ ਵਿੱਚ ਨਾਮ, ਉਮਰ ਅਤੇ ਕਲਾਸ ਸ਼ਾਮਲ ਹਨ, ਤਾਂ ਇੰਟਰਫੇਸ ਵਿੱਚ ਦਿਖਾਉਣ ਵੇਲੇ ਅਸੀਂ ਵੱਖ-ਵੱਖ ਤਰੀਕੇ ਨਾਲ ਪੜ੍ਹ ਸਕਦੇ ਹਾਂ:

```swift
student.name
student.age
student.className
```

ਇਸ ਤਰੀਕੇ ਦਾ ਫਾਇਦਾ ਇਹ ਹੈ ਕਿ ਡਾਟਾ ਹੋਰ ਸਪਸ਼ਟ ਹੁੰਦਾ ਹੈ ਅਤੇ ਇਸਦੀ ਸੰਭਾਲ ਕਰਨੀ ਵੀ ਆਸਾਨ ਹੁੰਦੀ ਹੈ।

### `struct` ਦੀ ਸਥਿਤੀ

ਸ਼ੁਰੂਆਤੀ ਸਿਖਿਆਰਥੀਆਂ ਲਈ, ਆਮ ਤੌਰ 'ਤੇ ਸਰਚਨਾ ਨੂੰ `ContentView` ਤੋਂ ਬਾਹਰ ਲਿਖਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

ਇਸ ਤਰ੍ਹਾਂ ਸਰਚਨਾ ਹੋਰ ਸਪਸ਼ਟ ਹੁੰਦੀ ਹੈ ਅਤੇ ਪੜ੍ਹਨ ਵਿੱਚ ਵੀ ਆਸਾਨੀ ਹੁੰਦੀ ਹੈ।

ਤੁਸੀਂ ਵੇਖੋਗੇ ਕਿ `ContentView` ਖੁਦ ਵੀ ਅਸਲ ਵਿੱਚ ਇੱਕ `struct` ਹੈ।

### `Movie` ਸਰਚਨਾ

ਉੱਪਰਲੇ ਆਧਾਰ ਨਾਲ, ਅਸੀਂ ਹੁਣ ਇੱਕ ਫਿਲਮ ਸਰਚਨਾ ਪਰਿਭਾਸ਼ਤ ਕਰ ਸਕਦੇ ਹਾਂ:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

ਇਹ `Movie` ਨਾਮ ਦੀ ਇੱਕ ਸਰਚਨਾ ਹੈ, ਜਿਸ ਵਿੱਚ `name`、`director` ਅਤੇ `rating` ਨਾਂ ਦੇ ਤਿੰਨ fields ਹਨ, ਜੋ ਕ੍ਰਮਵਾਰ ਫਿਲਮ ਨਾਮ, ਨਿਰਦੇਸ਼ਕ ਅਤੇ ਰੇਟਿੰਗ ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ।

ਇਸ ਤਰ੍ਹਾਂ, ਇੱਕ ਫਿਲਮ ਨਾਲ ਸੰਬੰਧਿਤ ਜਾਣਕਾਰੀ ਨੂੰ ਹੁਣ ਕਈ arrays ਵਿੱਚ ਵੰਡ ਕੇ ਰੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ; ਇਸਨੂੰ ਸਿੱਧੇ ਤੌਰ 'ਤੇ ਇਕੱਠਾ ਕਰਕੇ ਇੱਕ ਪੂਰੇ ਰੂਪ ਵਿੱਚ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਇੱਕ ਫਿਲਮ instance ਬਣਾ ਸਕਦੇ ਹਾਂ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

ਇਹ instance “ਇੱਕ ਪੂਰੇ ਫਿਲਮ ਡਾਟਾ” ਨੂੰ ਦਰਸਾਉਂਦੀ ਹੈ।

### array ਵਿੱਚ ਸਰਚਨਾ ਸੰਭਾਲਣਾ

ਪਹਿਲਾਂ ਅਸੀਂ ਕਿਹਾ ਸੀ ਕਿ array ਸਿਰਫ਼ ਇੱਕੋ ਕਿਸਮ ਦਾ ਡਾਟਾ ਸੰਭਾਲ ਸਕਦੀ ਹੈ।

ਹੁਣ ਸਾਡੇ ਕੋਲ `Movie` ਸਰਚਨਾ ਹੈ, ਇਸ ਲਈ array ਕਈ `Movie` ਸੰਭਾਲ ਸਕਦੀ ਹੈ।

```swift
let lists: [Movie] = []
```

ਉਦਾਹਰਨ ਲਈ:

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

ਇਸ `lists` array ਵਿੱਚ strings ਨਹੀਂ, ਸਗੋਂ ਕਈ `Movie` instances ਸੰਭਾਲੀਆਂ ਗਈਆਂ ਹਨ।

ਅਰਥਾਤ, array ਦਾ ਹਰ element ਇੱਕ ਪੂਰੀ ਫਿਲਮ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, ਜਦੋਂ ਸਾਨੂੰ ਫਿਲਮ ਸੂਚੀ ਦਿਖਾਉਣੀ ਹੋਵੇ, ਤਾਂ ਅਸੀਂ `ForEach` ਰਾਹੀਂ ਹਰ ਫਿਲਮ ਨੂੰ ਇੱਕ-ਇੱਕ ਕਰਕੇ ਪੜ੍ਹ ਸਕਦੇ ਹਾਂ।

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

ਇੱਥੇ `movie in` ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਹਰ loop ਵੇਲੇ array ਵਿਚੋਂ ਇੱਕ ਫਿਲਮ ਕੱਢੀ ਜਾਂਦੀ ਹੈ ਅਤੇ ਉਸ ਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ `movie` ਨਾਮ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ।

ਫਿਰ ਅਸੀਂ ਇਹ ਵਰਤ ਸਕਦੇ ਹਾਂ:

```swift
movie.name
movie.director
movie.rating
```

ਇਸ ਇੱਕ ਫਿਲਮ ਦਾ ਨਾਮ, ਨਿਰਦੇਸ਼ਕ ਅਤੇ ਰੇਟਿੰਗ ਵੱਖ-ਵੱਖ ਪੜ੍ਹ ਕੇ ਇੰਟਰਫੇਸ ਵਿੱਚ ਦਿਖਾਉਣ ਲਈ।

## `ForEach` ਗਲਤੀ

ਇੱਥੇ ਤੱਕ ਅਸੀਂ ਫਿਲਮ array ਅਤੇ `ForEach` ਦੀ ਮੂਲ ਲਿਖਤ ਪੂਰੀ ਕਰ ਲਈ ਹੈ।

ਪਰ ਜੇ ਅਸੀਂ ਹੇਠਾਂ ਦਿੱਤਾ ਕੋਡ ਸਿੱਧਾ ਚਲਾਈਏ:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ਤਾਂ ਗਲਤੀ ਆਵੇਗੀ:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

ਇਸ ਗਲਤੀ ਦਾ ਅਰਥ ਹੈ ਕਿ ਜਦੋਂ ਤੁਸੀਂ `id: \.self` ਲਿਖਦੇ ਹੋ, SwiftUI ਨੂੰ array ਦੇ ਹਰ element ਨੂੰ ਆਪਣੇ ਆਪ ਵਿੱਚ ਇੱਕ “ਇਕ-ਵੱਖਰੀ ਪਹਿਚਾਣ” ਵਜੋਂ ਵਰਤਣਾ ਪੈਂਦਾ ਹੈ ਤਾਂ ਜੋ ਉਹਨਾਂ ਨੂੰ ਅਲੱਗ ਕੀਤਾ ਜਾ ਸਕੇ।

ਇਹ ਲਿਖਤ ਤਰੀਕਾ `String`、`Int` ਵਰਗੀਆਂ ਸਧਾਰਣ ਕਿਸਮਾਂ ਲਈ ਢੁੱਕਵਾਂ ਹੈ, ਕਿਉਂਕਿ ਉਹਨਾਂ ਨੂੰ ਖੁਦ ਅਸਾਨੀ ਨਾਲ ਵੱਖ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਪਰ `Movie` ਇੱਕ custom ਸਰਚਨਾ ਹੈ ਜੋ ਅਸੀਂ ਖੁਦ ਬਣਾਈ ਹੈ, ਅਤੇ `ForEach` ਨੂੰ ਨਹੀਂ ਪਤਾ ਕਿ ਇਸਨੂੰ ਇਕ-ਵੱਖਰੀ ਪਹਿਚਾਣ ਵਜੋਂ ਕਿਵੇਂ ਵਰਤਣਾ ਹੈ, ਇਸ ਲਈ ਗਲਤੀ ਆ ਜਾਂਦੀ ਹੈ।

ਇਸ ਸਮੱਸਿਆ ਦਾ ਸਭ ਤੋਂ ਆਮ ਹੱਲ ਇਹ ਹੈ: `Movie` ਨੂੰ `Identifiable` protocol ਦੀ ਪਾਲਣਾ ਕਰਵਾਉਣਾ।

## ਪ੍ਰੋਟੋਕਾਲ

Swift ਵਿੱਚ, ਪ੍ਰੋਟੋਕਾਲ ਨੂੰ ਇੱਕ ਕਿਸਮ ਦੇ “ਨਿਯਮ” ਜਾਂ “ਲੋੜ” ਵਜੋਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਤੁਸੀਂ ਇਸਨੂੰ ਕਿਸੇ ਅੰਤਰਰਾਸ਼ਟਰੀ ਸੰਸਥਾ ਦੇ ਸਮਝੌਤੇ ਵਾਂਗ ਸਮਝ ਸਕਦੇ ਹੋ: ਜੇ ਕੋਈ ਦੇਸ਼ ਕਿਸੇ ਅੰਤਰਰਾਸ਼ਟਰੀ ਸੰਸਥਾ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਣਾ ਚਾਹੁੰਦਾ ਹੈ, ਤਾਂ ਉਸ ਨੂੰ ਪਹਿਲਾਂ ਉਸ ਸੰਸਥਾ ਦੁਆਰਾ ਨਿਰਧਾਰਤ ਕੁਝ ਨਿਯਮ ਪੂਰੇ ਕਰਨੇ ਪੈਂਦੇ ਹਨ, ਕੁਝ ਡਾਟਾ ਜਨਤਕ ਕਰਨਾ ਪੈਂਦਾ ਹੈ, ਅਤੇ ਕੁਝ ਸਾਂਝੇ ਨਿਯਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰਨੀ ਪੈਂਦੀ ਹੈ। ਇਹ ਸ਼ਰਤਾਂ ਪੂਰੀਆਂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਹੀ ਉਹ ਸ਼ਾਮਲ ਹੋ ਸਕਦਾ ਹੈ ਜਾਂ ਕੁਝ ਕਾਰਜਾਂ ਵਿੱਚ ਹਿੱਸਾ ਲੈ ਸਕਦਾ ਹੈ।

ਪ੍ਰੋਟੋਕਾਲ ਵੀ ਇਸੇ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦਾ ਹੈ।

ਜਦੋਂ ਕੋਈ type ਕਿਸੇ protocol ਦੀ ਪਾਲਣਾ ਕਰਨਾ ਚਾਹੁੰਦੀ ਹੈ, ਤਾਂ ਉਸ ਨੂੰ ਉਸ protocol ਦੁਆਰਾ ਨਿਰਧਾਰਤ ਸਮੱਗਰੀ ਨੂੰ ਪੂਰਾ ਕਰਨਾ ਪੈਂਦਾ ਹੈ। ਇਹ ਲੋੜਾਂ ਪੂਰੀਆਂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਹੀ ਉਹ type ਸੰਬੰਧਿਤ functionality ਵਰਤ ਸਕਦੀ ਹੈ।

ਮੂਲ ਲਿਖਤ:

```swift
struct Movie: Identifiable {
    // ...
}
```

ਇੱਥੇ `: Identifiable` ਦਾ ਅਰਥ ਹੈ ਕਿ `Movie` `Identifiable` protocol ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ।

ਜੇ ਕੋਈ type ਕਈ protocols ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ, ਤਾਂ ਉਨ੍ਹਾਂ ਨੂੰ comma ਨਾਲ ਵੱਖ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` ਲਈ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਣ ਲੋੜ ਇਹ ਹੈ: ਉਸ type ਵਿੱਚ ਇੱਕ `id` ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਜੋ ਉਸਨੂੰ ਖੁਦ ਚਿੰਨ੍ਹਿਤ ਕਰ ਸਕੇ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

ਇੱਥੇ `id` ਪਛਾਣ ਪੱਤਰ ਨੰਬਰ ਵਾਂਗ ਹੈ, ਜੋ ਹਰ ਫਿਲਮ ਨੂੰ ਵੱਖ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਜਦ ਤੱਕ ਹਰ ਫਿਲਮ ਦਾ `id` ਵੱਖਰਾ ਹੈ, SwiftUI array ਦੇ ਹਰ element ਨੂੰ ਠੀਕ ਤਰ੍ਹਾਂ ਵੱਖ ਕਰ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

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

ਫਿਰ `ForEach` ਵਿੱਚ ਇਹ ਵਰਤੋ:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

ਇਸ ਤਰ੍ਹਾਂ ਗਲਤੀ ਨਹੀਂ ਆਏਗੀ।

ਕਿਉਂਕਿ `Movie` ਪਹਿਲਾਂ ਹੀ `Identifiable` ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ, ਇਸ ਲਈ ਹੋਰ ਆਮ ਲਿਖਤ ਤਰੀਕਾ `id:` ਨੂੰ ਸਿੱਧਾ ਛੱਡ ਦੇਣਾ ਹੈ:

```swift
ForEach(lists) { movie in
    // ...
}
```

ਕਿਉਂਕਿ SwiftUI ਪਹਿਲਾਂ ਹੀ ਜਾਣਦੀ ਹੈ ਕਿ ਹਰ item ਨੂੰ ਵੱਖ ਕਰਨ ਲਈ `movie.id` ਵਰਤਣਾ ਹੈ।

## `ForEach` ਦੀ ਵੱਖਰੀ ਪਹਿਚਾਣ

ਹੁਣ ਅਸੀਂ `ForEach` ਵਿੱਚ `id` ਦੀ ਭੂਮਿਕਾ ਨੂੰ ਹੋਰ ਡੂੰਘਾਈ ਨਾਲ ਸਮਝਾਂਗੇ।

ਉਦਾਹਰਨ ਲਈ:

```swift
ForEach(lists, id: \.self)
```

ਇੱਥੇ ਅਰਥ ਹੈ: element ਨੂੰ ਖੁਦ ਵੱਖਰੀ ਪਹਿਚਾਣ ਵਜੋਂ ਵਰਤਣਾ।

ਅਤੇ:

```swift
ForEach(lists, id: \.id)
```

ਦਾ ਅਰਥ ਹੈ: element ਦੇ `id` field ਨੂੰ ਵੱਖਰੀ ਪਹਿਚਾਣ ਵਜੋਂ ਵਰਤਣਾ।

ਜੇ ਕੋਈ field ਆਪੇ ਹੀ uniqueness ਨੂੰ ਯਕੀਨੀ ਬਣਾ ਸਕਦੀ ਹੈ, ਤਾਂ ਉਸਨੂੰ ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਵੀ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਹਰ ਫਿਲਮ ਦਾ ਨਾਮ ਵੱਖਰਾ ਹੋਵੇ, ਤਾਂ ਹੇਠਾਂ ਦਿੱਤੀ ਲਿਖਤ ਮੌਜੂਦਾ ਡਾਟਾ ਵਿੱਚ ਵੀ ਠੀਕ ਕੰਮ ਕਰ ਸਕਦੀ ਹੈ:

```swift
ForEach(lists, id: \.name)
```

ਪਰ ਇੱਥੇ ਇੱਕ ਲੁਕਿਆ ਹੋਇਆ ਸਮੱਸਿਆ ਹੈ: `name` ਹਰ ਵੇਲੇ ਇਕੋ ਇਕ ਨਹੀਂ ਹੁੰਦਾ।

ਮੰਨ ਲਓ ਕਿ ਤੁਸੀਂ ਬਾਅਦ ਵਿੱਚ ਉਸੇ ਨਾਮ ਵਾਲੀ ਹੋਰ ਇੱਕ ਫਿਲਮ ਜੋੜ ਦਿੰਦੇ ਹੋ, ਤਾਂ `name` ਹੁਣ ਹਰ element ਨੂੰ ਸਹੀ ਤਰ੍ਹਾਂ ਵੱਖ ਨਹੀਂ ਕਰ ਸਕੇਗਾ।

ਉਸ ਵੇਲੇ ਕੋਡ compile ਤਾਂ ਹੋ ਸਕਦਾ ਹੈ, ਪਰ view refresh, update, insert ਅਤੇ delete ਸਮੇਂ SwiftUI ਗਲਤ ਪਛਾਣ ਕਰ ਸਕਦੀ ਹੈ, ਜਿਸ ਨਾਲ display ਅਸਧਾਰਣ ਹੋ ਸਕਦੀ ਹੈ।

ਇਸ ਲਈ, ਜਦੋਂ ਡਾਟਾ ਨੂੰ ਸਥਿਰ ਤਰੀਕੇ ਨਾਲ ਵੱਖ ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੋਵੇ, ਤਦ ਅਸਲ ਵਿੱਚ ਇਕੋ ਇਕ field, ਯਾਨੀ `id`, ਵਰਤਣਾ ਸਭ ਤੋਂ ਚੰਗਾ ਹੈ।

## UUID

ਭਾਵੇਂ ਹੱਥੀਂ `id: 1`、`id: 2` ਲਿਖ ਕੇ ਸਮੱਸਿਆ ਹੱਲ ਹੋ ਸਕਦੀ ਹੈ, ਫਿਰ ਵੀ ਇੱਕ ਖਤਰਾ ਰਹਿੰਦਾ ਹੈ: ਗਲਤੀ ਨਾਲ ਇੱਕੋ `id` ਮੁੜ ਲਿਖੀ ਜਾ ਸਕਦੀ ਹੈ, ਅਤੇ ਇਕੋ ਇਕ ਪਹਿਚਾਣ ਨਾਕਾਰਾ ਹੋ ਜਾਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ:

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

ਇਸ ਤਰ੍ਹਾਂ ਦੋ ਇੱਕੋ ਜਿਹੀਆਂ `id` ਹੋ ਜਾਣਗੀਆਂ, ਅਤੇ ਇਕੋ ਇਕ ਪਹਿਚਾਣ ਅਸਰਹੀਣ ਹੋ ਜਾਵੇਗੀ।

ਹੱਥੀਂ ਹੋਣ ਵਾਲੀਆਂ ਗਲਤੀਆਂ ਤੋਂ ਬਚਣ ਲਈ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ `UUID()` ਵਰਤਦੇ ਹਾਂ।

Swift ਵਿੱਚ, `UUID()` ਬੇਤਰਤੀਬੀ ਨਾਲ ਇੱਕ 128-bit ਪਛਾਣਕਾਰ ਬਣਾਉਂਦੀ ਹੈ। ਇਹ ਆਮ ਤੌਰ 'ਤੇ ਅੱਖਰਾਂ ਅਤੇ ਅੰਕਾਂ ਦੀ ਇੱਕ ਲੰਮੀ string ਵਜੋਂ ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

ਇੱਥੇ `UUID()` ਅਸਲ ਵਿੱਚ `UUID` ਕਿਸਮ ਦੀ ਇੱਕ instance ਬਣਾਉਂਦੀ ਹੈ; ਤੁਸੀਂ ਇਸਨੂੰ ਆਪਣੇ ਆਪ ਬਣਨ ਵਾਲੇ “ਇਕੋ ਇਕ ਨੰਬਰ” ਵਜੋਂ ਸਮਝ ਸਕਦੇ ਹੋ।

ਇਸ ਲਈ, ਹਰ ਵਾਰ ਬਣਨ ਵਾਲਾ ਮੁੱਲ ਲਗਭਗ ਕਦੇ ਵੀ ਦੁਹਰਾਇਆ ਨਹੀਂ ਜਾਂਦਾ, ਅਤੇ ਇਸ ਕਰਕੇ ਇਹ `id` ਵਜੋਂ ਵਰਤਣ ਲਈ ਬਹੁਤ ਹੀ ਉਚਿਤ ਹੈ।

ਅਸੀਂ `Movie` ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਬਦਲ ਸਕਦੇ ਹਾਂ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ ਕਿ `Movie` ਸਰਚਨਾ ਦੇ `id` field ਨੂੰ ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਇੱਕ ਨਵੀਂ `UUID` instance ਦੀ value ਦਿੱਤੀ ਜਾਵੇਗੀ।

ਅਰਥਾਤ, ਹਰ ਵਾਰ ਜਦੋਂ ਅਸੀਂ ਇੱਕ ਨਵੀਂ `Movie` ਬਣਾਉਂਦੇ ਹਾਂ, ਸਿਸਟਮ ਪਹਿਲਾਂ ਹੀ ਆਪਣੇ ਆਪ ਸਾਡੇ ਲਈ ਇੱਕ ਇਕੋ ਇਕ `id` ਤਿਆਰ ਕਰ ਦੇਵੇਗਾ।

`id` ਦੀ ਪਹਿਲਾਂ ਹੀ ਇੱਕ ਡਿਫਾਲਟ value ਹੈ, ਇਸ ਲਈ ਬਾਅਦ ਵਿੱਚ `Movie` instances ਬਣਾਉਣ ਵੇਲੇ ਸਾਨੂੰ `id` ਹੱਥੀਂ ਨਹੀਂ ਭਰਨੀ ਪਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ:

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

ਭਾਵੇਂ ਇੱਥੇ `id` ਨਹੀਂ ਲਿਖੀ ਗਈ, ਪਰ ਅਸਲ ਵਿੱਚ ਇਸ ਫਿਲਮ instance ਦੀ ਆਪਣੀ `id` ਹੁੰਦੀ ਹੈ; ਸਿਰਫ਼ ਇਹ ਮੁੱਲ ਪਹਿਲਾਂ ਹੀ `UUID()` ਦੁਆਰਾ ਆਪਣੇ ਆਪ ਤਿਆਰ ਕੀਤਾ ਗਿਆ ਹੁੰਦਾ ਹੈ।

ਇਹ ਤਰੀਕਾ ਵਰਤਣ ਤੋਂ ਬਾਅਦ, ਸਾਨੂੰ ਹਰ ਫਿਲਮ ਲਈ `id` ਹੱਥੀਂ ਭਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ; ਇਸ ਨਾਲ ਨਾ ਸਿਰਫ਼ ਕੋਡ ਦੀ ਮਾਤਰਾ ਘਟਦੀ ਹੈ, ਸਗੋਂ duplicate id ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਗਲਤੀਆਂ ਤੋਂ ਵੀ ਬਚਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਅਖੀਰ ਵਿੱਚ, ਸਾਨੂੰ ਸਿਰਫ਼ ਉੱਪਰ ਇੱਕ `Banner` ਤਸਵੀਰ ਜੋੜਨੀ ਹੈ ਅਤੇ ਸਮੱਗਰੀ ਨੂੰ scroll ਕਰਨ ਯੋਗ ਬਣਾਉਣ ਲਈ `ScrollView` ਵਰਤਣਾ ਹੈ, ਫਿਰ ਪੂਰਾ ਫਿਲਮ ਸੂਚੀ view ਤਿਆਰ ਹੋ ਜਾਵੇਗਾ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਇੱਕ ਬਹੁਤ ਮਹੱਤਵਪੂਰਣ ਸੰਕਲਪ ਸਿੱਖਿਆ: `struct`।

`struct` ਰਾਹੀਂ, ਅਸੀਂ ਇੱਕ ਫਿਲਮ ਦੇ ਕਈ ਸੰਬੰਧਿਤ fields ਨੂੰ ਇੱਕ ਸਮੂਹ ਰੂਪ ਵਿੱਚ ਜੋੜ ਸਕਦੇ ਹਾਂ, ਬਜਾਏ ਇਸਦੇ ਕਿ ਨਾਮ、ਨਿਰਦੇਸ਼ਕ、ਰੇਟਿੰਗ ਨੂੰ ਵੱਖ-ਵੱਖ arrays ਵਿੱਚ ਵੰਡ ਕੇ ਰੱਖੀਏ।

ਡਾਟਾ ਇਕੱਠਾ ਹੋਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ `ForEach` ਦੀ ਵਰਤੋਂ ਕਰਕੇ array ਦੀ ਹਰ ਫਿਲਮ ਨੂੰ ਇੱਕ-ਇੱਕ ਕਰਕੇ view ਵਿੱਚ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

ਇਸਦੇ ਨਾਲ-ਨਾਲ, ਅਸੀਂ `ForEach` ਵਿੱਚ “ਵੱਖਰੀ ਪਹਿਚਾਣ” ਦੀ ਭੂਮਿਕਾ ਨੂੰ ਵੀ ਸਮਝਿਆ। SwiftUI ਲਈ ਇਹ ਜਾਣਨਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ array ਦੇ ਹਰ element ਨੂੰ ਕਿਵੇਂ ਵੱਖ ਕੀਤਾ ਜਾਵੇ, ਤਦ ਹੀ view ਨੂੰ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਦਿਖਾਉਣਾ ਅਤੇ update ਕਰਨਾ ਸੰਭਵ ਹੁੰਦਾ ਹੈ।

ਇਸ ਲਈ, ਅਸੀਂ `Movie` ਨੂੰ `Identifiable` protocol ਦੀ ਪਾਲਣਾ ਕਰਵਾਈ ਅਤੇ ਇਸਨੂੰ ਇੱਕ ਇਕੋ ਇਕ `id` ਦਿੱਤੀ।

`id` ਨੂੰ ਹੱਥੀਂ ਭਰਨ ਵੇਲੇ ਗਲਤੀਆਂ ਤੋਂ ਬਚਣ ਲਈ, ਅਸੀਂ ਅੱਗੇ `UUID()` ਵੀ ਸਿੱਖਿਆ, ਜਿਸ ਨਾਲ ਸਿਸਟਮ ਆਪਣੇ ਆਪ ਇਕੋ ਇਕ ਪਛਾਣ ਬਣਾਂਦਾ ਹੈ।

ਇਹ ਪਾਠ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਨਾ ਸਿਰਫ਼ ਇੱਕ ਫਿਲਮ ਸੂਚੀ ਪੂਰੀ ਕੀਤੀ ਹੈ, ਸਗੋਂ SwiftUI ਵਿੱਚ ਇੱਕ ਮਹੱਤਵਪੂਰਣ ਸੋਚ-ਤਰੀਕੇ ਨੂੰ ਵੀ ਛੂਹ ਲਿਆ ਹੈ: **ਪਹਿਲਾਂ ਡਾਟਾ ਸੁਧਾਰੋ, ਫਿਰ ਉਸ ਡਾਟਾ ਦੇ ਆਧਾਰ 'ਤੇ view ਬਣਾਓ।**

## ਪੂਰਾ ਕੋਡ

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
