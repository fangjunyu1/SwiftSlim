# ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ 

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਕਸਟਮ View ਅਤੇ ਡਾਟਾ ਪਾਸ ਕਰਨ ਦੀ ਹੋਰ ਪ੍ਰੈਕਟਿਸ ਕਰਾਂਗੇ।

ਅਸੀਂ ਇੱਕ ਸਧਾਰਣ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ View ਬਣਾਵਾਂਗੇ। ਪੇਜ ਵਿੱਚ ਪੰਜ ਜਾਨਵਰ ਦਿਖਾਏ ਜਾਣਗੇ। ਜਦੋਂ ਕਿਸੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕੀਤਾ ਜਾਵੇਗਾ, ਤਾਂ ਇੱਕ ਵੇਰਵਾ View ਖੁੱਲ੍ਹੇਗਾ, ਜਿਸ ਵਿੱਚ ਉਸ ਜਾਨਵਰ ਦੀ ਤਸਵੀਰ, ਵੰਡ ਖੇਤਰ, ਰਹਿਣ-ਸਥਾਨ ਅਤੇ ਵੇਰਵਾ ਦਿਖੇਗਾ।

ਨਤੀਜਾ:

![view](../../../Resource/029_view.png)

ਇਸ ਉਦਾਹਰਨ ਰਾਹੀਂ, ਅਸੀਂ ਡਾਟਾ ਸਟ੍ਰਕਚਰ, ਲਿਸਟ ਦਿਖਾਉਣ, ਕਲਿੱਕ ਇੰਟਰੈਕਸ਼ਨ ਅਤੇ Sheet ਪੌਪ-ਅੱਪ View ਦੇ ਆਪਸੀ ਕੰਮ ਨੂੰ ਅਭਿਆਸ ਕਰ ਸਕਦੇ ਹਾਂ।

## ਤਸਵੀਰ ਸਮੱਗਰੀ ਤਿਆਰ ਕਰੋ

ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਸਾਨੂੰ ਜਾਨਵਰਾਂ ਦੀਆਂ ਪੰਜ ਤਸਵੀਰਾਂ ਤਿਆਰ ਕਰਨੀਆਂ ਹਨ:

- ਡਾਲਫਿਨ: `dolphin.jpg`
- ਜਿਰਾਫ਼: `giraffe.jpg`
- ਸ਼ੇਰ: `lion.jpg`
- ਪਾਂਡਾ: `panda.jpg`
- ਧ੍ਰੁਵੀ ਭਾਲੂ: `polarBear.jpg`

ਤੁਸੀਂ ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਤਸਵੀਰਾਂ ਵਰਤ ਸਕਦੇ ਹੋ:

[ਡਾਲਫਿਨ](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [ਜਿਰਾਫ਼](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [ਸ਼ੇਰ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [ਪਾਂਡਾ](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ਧ੍ਰੁਵੀ ਭਾਲੂ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ਤਸਵੀਰਾਂ ਡਾਊਨਲੋਡ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਉਨ੍ਹਾਂ ਨੂੰ Xcode ਪ੍ਰੋਜੈਕਟ ਦੇ `Assets` ਸਰੋਤ ਫੋਲਡਰ ਵਿੱਚ ਘਸੀਟੋ।

![assets](../../../Resource/029_assets.png)

ਧਿਆਨ ਦੇਣ ਵਾਲੀ ਗੱਲ ਇਹ ਹੈ ਕਿ ਕੋਡ ਵਿੱਚ ਤਸਵੀਰ ਵਰਤਦੇ ਸਮੇਂ ਆਮ ਤੌਰ ’ਤੇ `.jpg` suffix ਲਿਖਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੁੰਦੀ।

ਉਦਾਹਰਨ ਲਈ, ਜੇ ਤਸਵੀਰ ਸਰੋਤ ਦਾ ਨਾਮ `dolphin` ਹੈ, ਤਾਂ ਕੋਡ ਵਿੱਚ ਇਹ ਲਿਖੋ:

```swift
Image("dolphin")
```

ਜੇ ਤਸਵੀਰ ਦਾ ਨਾਮ ਗਲਤ ਲਿਖਿਆ ਗਿਆ, ਤਾਂ ਤਸਵੀਰ ਠੀਕ ਤਰ੍ਹਾਂ ਨਹੀਂ ਦਿਖੇਗੀ।

ਨੋਟ: ਉੱਪਰ ਦਿੱਤੀਆਂ ਤਸਵੀਰਾਂ Wikimedia ਪ੍ਰੋਜੈਕਟ ਤੋਂ ਹਨ। ਵਰਤਦੇ ਸਮੇਂ ਮੂਲ ਤਸਵੀਰ ਦਾ ਲਿੰਕ ਅਤੇ ਸਰੋਤ ਜਾਣਕਾਰੀ ਸੰਭਾਲ ਕੇ ਰੱਖਣ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ।

## ਜਾਨਵਰ ਸਟ੍ਰਕਚਰ ਬਣਾਓ

ਇਸ ਪੇਜ ਵਿੱਚ ਹਰ ਜਾਨਵਰ ਕੋਲ ਕਈ ਜਾਣਕਾਰੀਆਂ ਹਨ:

- ਜਾਨਵਰ ਦਾ ਨਾਮ
- ਜਾਨਵਰ ਦੀ ਤਸਵੀਰ
- ਜਾਨਵਰ ਦਾ emoji
- ਵੰਡ ਖੇਤਰ
- ਰਹਿਣ-ਸਥਾਨ
- ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ

ਜੇ ਅਸੀਂ ਇਹ ਜਾਣਕਾਰੀਆਂ ਬਹੁਤ ਸਾਰੇ variables ਵਿੱਚ ਵੱਖ-ਵੱਖ ਰੱਖੀਏ, ਤਾਂ ਕੋਡ ਕਾਫ਼ੀ ਬਿਖਰਿਆ ਹੋ ਜਾਵੇਗਾ। ਇਸ ਲਈ, ਅਸੀਂ ਇੱਕ `Animal` structure ਬਣਾ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਇੱਕ ਜਾਨਵਰ ਦੀ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਰੱਖੀ ਜਾ ਸਕੇ।

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

ਇਸ ਕੋਡ ਵਿੱਚ:

- `id`: ਜਾਨਵਰ ਦੀ ਵਿਲੱਖਣ ਪਹਿਚਾਣ।
- `name`: ਜਾਨਵਰ ਦਾ ਨਾਮ।
- `imageName`: ਜਾਨਵਰ ਦੀ ਤਸਵੀਰ ਦਾ ਨਾਮ।
- `avatarEmoji`: ਜਾਨਵਰ ਦਾ emoji।
- `distributionArea`: ਵੰਡ ਖੇਤਰ।
- `habitat`: ਰਹਿਣ-ਸਥਾਨ।
- `animalDescription`: ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ।

ਇਨ੍ਹਾਂ ਵਿੱਚ:

```swift
let id = UUID()
```

`id` ਹਰ ਜਾਨਵਰ ਨੂੰ ਪਛਾਣਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। ਕਿਉਂਕਿ ਅੱਗੇ ਅਸੀਂ `ForEach` ਨਾਲ ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ਦਿਖਾਵਾਂਗੇ, ਅਤੇ `.sheet(item:)` ਨਾਲ ਚੁਣੇ ਗਏ ਜਾਨਵਰ ਦੇ ਅਧਾਰ ’ਤੇ ਵੇਰਵਾ ਖੋਲ੍ਹਾਂਗੇ, ਇਸ ਲਈ `Animal` ਨੂੰ `Identifiable` protocol ਦੀ ਪਾਲਣਾ ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

`Identifiable` ਦਾ ਕੰਮ SwiftUI ਨੂੰ ਇਹ ਦੱਸਣਾ ਹੈ: ਹਰ ਜਾਨਵਰ ਕੋਲ ਇੱਕ ਅਜਿਹਾ `id` ਹੈ ਜਿਸ ਨਾਲ ਉਸ ਦੀ ਪਹਿਚਾਣ ਵੱਖ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ।

## ਜਾਨਵਰ ਡਾਟਾ ਬਣਾਓ

ਫਿਰ, ਅਸੀਂ `ContentView` ਵਿੱਚ ਇੱਕ ਜਾਨਵਰਾਂ ਵਾਲਾ array ਬਣਾਉਂਦੇ ਹਾਂ।

Array ਵਿੱਚ ਪੰਜ `Animal` ਸੰਭਾਲੇ ਜਾਂਦੇ ਹਨ। ਹਰ `Animal` ਇੱਕ ਜਾਨਵਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ਡਾਲਫਿਨ
        Animal(
            name: "ਡਾਲਫਿਨ",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ਦੁਨੀਆ ਭਰ ਦੇ ਗਰਮ ਅਤੇ ਮਧਿਮ ਸਮੁੰਦਰ।",
            habitat: "ਸਮੁੰਦਰ, ਤਟਵਰਤੀ ਪਾਣੀ ਅਤੇ ਕੁਝ ਵੱਡੀਆਂ ਨਦੀਆਂ।",
            animalDescription: "ਡਾਲਫਿਨ ਬੁੱਧੀਮਾਨ ਸਮੁੰਦਰੀ ਸਤਨਧਾਰੀ ਹਨ। ਉਹ ਸਮੂਹਾਂ ਵਿੱਚ ਰਹਿੰਦੀਆਂ ਹਨ, ਆਵਾਜ਼ਾਂ ਨਾਲ ਸੰਚਾਰ ਕਰਦੀਆਂ ਹਨ, ਅਤੇ ਆਪਣੇ ਖੇਡਣ ਵਾਲੇ ਸੁਭਾਅ ਲਈ ਜਾਣੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।"
        ),
        // ਜਿਰਾਫ਼
        Animal(
            name: "ਜਿਰਾਫ਼",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ਅਫਰੀਕਾ ਦੇ ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲੀ ਖੇਤਰ।",
            habitat: "ਘਾਹਦਾਰ ਮੈਦਾਨ, ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲ।",
            animalDescription: "ਜਿਰਾਫ਼ ਧਰਤੀ ਉੱਤੇ ਸਭ ਤੋਂ ਲੰਮੇ ਜਾਨਵਰ ਹਨ। ਉਨ੍ਹਾਂ ਦੀ ਲੰਮੀ ਗਰਦਨ ਅਤੇ ਲੰਮੇ ਪੈਰ ਹੁੰਦੇ ਹਨ, ਅਤੇ ਉਹ ਆਮ ਤੌਰ ’ਤੇ ਉੱਚੇ ਦਰੱਖ਼ਤਾਂ ਦੇ ਪੱਤੇ ਖਾਂਦੇ ਹਨ।"
        ),
        // ਸ਼ੇਰ
        Animal(
            name: "ਸ਼ੇਰ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ਮੁੱਖ ਤੌਰ ’ਤੇ ਸਹਾਰਾ ਦੇ ਦੱਖਣੀ ਅਫਰੀਕਾ ਵਿੱਚ, ਅਤੇ ਪੱਛਮੀ ਭਾਰਤ ਵਿੱਚ ਇੱਕ ਛੋਟੀ ਆਬਾਦੀ।",
            habitat: "ਘਾਹਦਾਰ ਮੈਦਾਨ, ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲੀ ਖੇਤਰ।",
            animalDescription: "ਸ਼ੇਰ ਤਾਕਤਵਰ ਵੱਡੀਆਂ ਬਿੱਲੀਆਂ ਹਨ। ਉਹ ਆਮ ਤੌਰ ’ਤੇ prides ਕਹੇ ਜਾਣ ਵਾਲੇ ਸਮੂਹਾਂ ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ, ਅਤੇ ਅਕਸਰ ਜਾਨਵਰ ਜਗਤ ਦੇ ਰਾਜੇ ਵਜੋਂ ਜਾਣੇ ਜਾਂਦੇ ਹਨ।"
        ),
        // ਪਾਂਡਾ
        Animal(
            name: "ਪਾਂਡਾ",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ਚੀਨ ਦੇ ਮੱਧ ਖੇਤਰਾਂ ਦੇ ਪਹਾੜੀ ਜੰਗਲ।",
            habitat: "ਠੰਢੇ ਅਤੇ ਨਮੀ ਵਾਲੇ ਪਹਾੜੀ ਖੇਤਰਾਂ ਦੇ ਬਾਂਸ ਦੇ ਜੰਗਲ।",
            animalDescription: "ਪਾਂਡਾ ਕਾਲੇ-ਸਫੈਦ ਰੋਂਏ ਲਈ ਜਾਣੇ ਜਾਣ ਵਾਲੇ ਭਾਲੂ ਹਨ। ਉਹ ਮੁੱਖ ਤੌਰ ’ਤੇ ਬਾਂਸ ਖਾਂਦੇ ਹਨ ਅਤੇ ਦੁਨੀਆ ਦੇ ਸਭ ਤੋਂ ਆਸਾਨੀ ਨਾਲ ਪਛਾਣੇ ਜਾਣ ਵਾਲੇ ਜਾਨਵਰਾਂ ਵਿੱਚੋਂ ਇੱਕ ਹਨ।"
        ),
        // ਧ੍ਰੁਵੀ ਭਾਲੂ
        Animal(
            name: "ਧ੍ਰੁਵੀ ਭਾਲੂ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ਉੱਤਰੀ ਧ੍ਰੁਵ ਦੇ ਆਲੇ-ਦੁਆਲੇ ਦੇ ਆਰਕਟਿਕ ਖੇਤਰ।",
            habitat: "ਸਮੁੰਦਰੀ ਬਰਫ਼, ਤਟਵਰਤੀ ਖੇਤਰ ਅਤੇ ਠੰਢੇ ਆਰਕਟਿਕ ਵਾਤਾਵਰਣ।",
            animalDescription: "ਧ੍ਰੁਵੀ ਭਾਲੂ ਠੰਢੇ ਵਾਤਾਵਰਣ ਲਈ ਅਨੁਕੂਲ ਵੱਡੇ ਭਾਲੂ ਹਨ। ਉਹ ਮਜ਼ਬੂਤ ਤੈਰਾਕ ਹਨ ਅਤੇ ਸੀਲਾਂ ਦਾ ਸ਼ਿਕਾਰ ਕਰਨ ਲਈ ਮੁੱਖ ਤੌਰ ’ਤੇ ਸਮੁੰਦਰੀ ਬਰਫ਼ ’ਤੇ ਨਿਰਭਰ ਕਰਦੇ ਹਨ।"
        )
    ]

    var body: some View {
        Text("ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼")
    }
}
```

ਇੱਥੇ `animals` ਇੱਕ array ਹੈ:

```swift
let animals: [Animal]
```

`[Animal]` ਦਾ ਅਰਥ ਹੈ ਕਿ ਇਸ array ਵਿੱਚ ਕਈ `Animal` ਸੰਭਾਲੇ ਗਏ ਹਨ।

ਅਰਥਾਤ, `animals` ਇੱਕ ਜਾਨਵਰ ਨਹੀਂ, ਸਗੋਂ ਜਾਨਵਰਾਂ ਦਾ ਇੱਕ ਸਮੂਹ ਹੈ।

## ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ਦਿਖਾਓ

ਹੁਣ, ਅਸੀਂ `ForEach` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ਦਿਖਾ ਸਕਦੇ ਹਾਂ।

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
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

ਦਿਖਾਵਟ:

![view](../../../Resource/029_view1.png)

ਇਸ ਕੋਡ ਵਿੱਚ:

```swift
ForEach(animals) { animal in
    ...
}
```

ਇਸਦਾ ਅਰਥ ਹੈ `animals` array ਵਿੱਚੋਂ ਗੁਜ਼ਰਨਾ।

ਹਰ ਵਾਰ loop ਚੱਲਣ ਤੇ, `animal` ਇਸ ਵੇਲੇ ਦਿਖਾਏ ਜਾ ਰਹੇ ਜਾਨਵਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਪਹਿਲੇ loop ਵਿੱਚ `animal` ਡਾਲਫਿਨ ਹੈ; ਦੂਜੇ loop ਵਿੱਚ `animal` ਜਿਰਾਫ਼ ਹੈ।

ਇਸ ਲਈ, ਅਸੀਂ ਹੇਠਾਂ ਦਿੱਤੇ ਤਰੀਕੇ ਨਾਲ ਮੌਜੂਦਾ ਜਾਨਵਰ ਦੀ ਜਾਣਕਾਰੀ ਦਿਖਾ ਸਕਦੇ ਹਾਂ:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

ਇਸ ਤਰ੍ਹਾਂ, ਪੰਜ ਜਾਨਵਰ ਦਿਖਾਏ ਜਾ ਸਕਦੇ ਹਨ।

## ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ਨੂੰ ਕਲਿੱਕਯੋਗ ਬਣਾਓ

ਹੁਣ ਲਿਸਟ ਦਿਖ ਰਹੀ ਹੈ, ਪਰ ਅਜੇ ਇਸ ’ਤੇ ਕਲਿੱਕ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।

ਜੇ ਅਸੀਂ ਕਿਸੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ ਵੇਰਵਾ ਖੋਲ੍ਹਣਾ ਚਾਹੁੰਦੇ ਹਾਂ, ਤਾਂ ਪਹਿਲਾਂ “ਮੌਜੂਦਾ ਚੁਣਿਆ ਗਿਆ ਜਾਨਵਰ” ਰਿਕਾਰਡ ਕਰਨਾ ਪਵੇਗਾ।

ਇਸ ਲਈ, `ContentView` ਵਿੱਚ ਇੱਕ state variable ਜੋੜੋ:

```swift
@State private var selectedAnimal: Animal? = nil
```

ਇੱਥੇ `selectedAnimal` ਇੱਕ optional value type `Animal?` ਹੈ।

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ ਇਸ ਵਿੱਚ ਇੱਕ ਜਾਨਵਰ ਹੋ ਸਕਦਾ ਹੈ, ਜਾਂ ਕੋਈ ਜਾਨਵਰ ਨਹੀਂ ਹੋ ਸਕਦਾ।

Default value `nil` ਹੈ, ਜਿਸਦਾ ਅਰਥ ਹੈ ਕਿ ਸ਼ੁਰੂ ਵਿੱਚ ਕੋਈ ਜਾਨਵਰ ਚੁਣਿਆ ਨਹੀਂ ਗਿਆ।

ਫਿਰ, ਅਸੀਂ ਹਰ ਜਾਨਵਰ ਵਾਲੀ row ਨੂੰ `Button` ਵਿੱਚ ਬਦਲਦੇ ਹਾਂ:

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
                .clipShape(Circle())
            
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

ਮੁੱਖ ਗੱਲ ਇਹ ਕੋਡ ਲਾਈਨ ਹੈ:

```swift
selectedAnimal = animal
```

ਜਦੋਂ user ਕਿਸੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕਰਦਾ ਹੈ, ਅਸੀਂ ਉਸ ਜਾਨਵਰ ਨੂੰ `selectedAnimal` ਵਿੱਚ ਸੰਭਾਲਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, user ਡਾਲਫਿਨ ’ਤੇ ਕਲਿੱਕ ਕਰਦਾ ਹੈ, ਤਾਂ `selectedAnimal` ਵਿੱਚ ਡਾਲਫਿਨ ਸੰਭਾਲੀ ਜਾਂਦੀ ਹੈ।

user ਪਾਂਡਾ ’ਤੇ ਕਲਿੱਕ ਕਰਦਾ ਹੈ, ਤਾਂ `selectedAnimal` ਵਿੱਚ ਪਾਂਡਾ ਸੰਭਾਲਿਆ ਜਾਂਦਾ ਹੈ।

ਅਰਥਾਤ, `selectedAnimal` ਇਹ ਰਿਕਾਰਡ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ ਕਿ user ਨੇ ਇਸ ਵੇਲੇ ਕਿਹੜੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕੀਤਾ ਹੈ।

## Sheet ਪੌਪ-ਅੱਪ View

ਹੁਣ ਅਸੀਂ Button ਰਾਹੀਂ “ਮੌਜੂਦਾ ਕਲਿੱਕ ਕੀਤਾ ਜਾਨਵਰ” ਰਿਕਾਰਡ ਕਰ ਸਕਦੇ ਹਾਂ।

ਅੱਗੇ, ਸਾਨੂੰ ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ ਦਿਖਾਉਣ ਲਈ ਇੱਕ ਪੌਪ-ਅੱਪ View ਬਣਾਉਣਾ ਹੈ।

![view](../../../Resource/029_view2.png)

SwiftUI ਵਿੱਚ, ਇਸ ਤਰ੍ਹਾਂ ਦਾ ਪੌਪ-ਅੱਪ ਪ੍ਰਭਾਵ ਬਣਾਉਣ ਲਈ `Sheet` ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

`Sheet` ਨੂੰ ਇੱਕ ਅਸਥਾਈ ਤੌਰ ’ਤੇ ਖੁੱਲ੍ਹਣ ਵਾਲੇ ਪੇਜ ਵਜੋਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ। ਇਹ ਮੌਜੂਦਾ ਪੇਜ ਦੇ ਉੱਪਰ ਦਿਖਦਾ ਹੈ। ਸਮੱਗਰੀ ਦੇਖਣ ਤੋਂ ਬਾਅਦ user ਇਸਨੂੰ ਹੇਠਾਂ swipe ਕਰਕੇ ਬੰਦ ਕਰ ਸਕਦਾ ਹੈ।

## Sheet ਉਦਾਹਰਨ

ਜਾਨਵਰ ਵੇਰਵਾ ਅਸਲ ਵਿੱਚ ਦਿਖਾਉਣ ਤੋਂ ਪਹਿਲਾਂ, ਅਸੀਂ ਪਹਿਲਾਂ ਇੱਕ ਸਧਾਰਣ ਉਦਾਹਰਨ ਨਾਲ ਸਮਝਦੇ ਹਾਂ ਕਿ `Sheet` ਕਿਵੇਂ ਖੁੱਲ੍ਹਦਾ ਹੈ।

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet ਦਿਖਾਓ")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet View")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ਦਿਖਾਵਟ:

![view](../../../Resource/029_view3.png)

ਇਸ ਕੋਡ ਵਿੱਚ, ਅਸੀਂ ਇੱਕ Boolean value ਬਣਾਈ ਹੈ:

```swift
@State private var showSheet = false
```

`showSheet` ਦਾ default `false` ਹੈ, ਜਿਸਦਾ ਅਰਥ ਹੈ ਕਿ ਸ਼ੁਰੂ ਵਿੱਚ `Sheet` ਨਹੀਂ ਦਿਖਦਾ।

Button ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੇ:

```swift
showSheet.toggle()
```

`toggle()` ਦਾ ਅਰਥ Boolean value ਨੂੰ ਬਦਲਣਾ ਹੈ।

ਜੇ ਪਹਿਲਾਂ `false` ਸੀ, ਤਾਂ `toggle()` ਕਾਲ ਕਰਨ ਤੋਂ ਬਾਅਦ ਇਹ `true` ਬਣ ਜਾਵੇਗਾ।

ਜੇ ਪਹਿਲਾਂ `true` ਸੀ, ਤਾਂ `toggle()` ਕਾਲ ਕਰਨ ਤੋਂ ਬਾਅਦ ਇਹ `false` ਬਣ ਜਾਵੇਗਾ।

ਇਸ ਲਈ, Button ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ `showSheet` `false` ਤੋਂ `true` ਹੋ ਜਾਵੇਗਾ।

ਜਦੋਂ `showSheet` `true` ਬਣ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਹੇਠਾਂ ਦਿੱਤਾ ਕੋਡ `Sheet` ਖੋਲ੍ਹੇਗਾ:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ: ਜਦੋਂ `showSheet` `true` ਹੋਵੇ, ਇੱਕ `Sheet` ਖੋਲ੍ਹੋ, ਅਤੇ `Sheet` ਵਿੱਚ `Text("Sheet View")` ਦਿਖਾਓ।

ਦਿਖਾਵਟ:

![view](../../../Resource/029_view4.png)

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ ਸਥਿਰ ਸਮੱਗਰੀ ਵਾਲਾ ਪੇਜ ਖੋਲ੍ਹਣ ਲਈ ਢੁਕਵਾਂ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, Button ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ settings page, explanation page, prompt page ਆਦਿ ਖੁੱਲ੍ਹ ਸਕਦੇ ਹਨ।

### Sheet ਦਿਖਾਉਣ ਦੀ ਥਾਂ

ਭਾਵੇਂ `Sheet` ਇੱਕ ਪੌਪ-ਅੱਪ View ਹੈ, ਪਰ SwiftUI ਵਿੱਚ ਇਹ `Text()` ਜਾਂ `Image()` ਵਾਂਗ ਸਿੱਧੇ ਤੌਰ ’ਤੇ ਇੱਕ ਅਲੱਗ View ਵਜੋਂ ਨਹੀਂ ਲਿਖਿਆ ਜਾਂਦਾ। ਇਹ ਇੱਕ view modifier ਵਜੋਂ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

ਅਰਥਾਤ, `.sheet(...)` ਵੀ `.font()`, `.padding()`, `.shadow()` ਵਰਗੇ modifiers ਵਾਂਗ ਹੈ। ਇਸਨੂੰ ਕਿਸੇ View ਦੇ ਪਿੱਛੇ ਜੋੜਨਾ ਪੈਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Button("Sheet ਦਿਖਾਓ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ, `.sheet` ਨੂੰ `Button` ਦੇ ਪਿੱਛੇ ਜੋੜਿਆ ਗਿਆ ਹੈ।

ਜਦੋਂ `showSheet` `true` ਬਣਦਾ ਹੈ, SwiftUI `Sheet` ਖੋਲ੍ਹੇਗਾ ਅਤੇ braces ਵਿੱਚ ਦਿੱਤੀ ਸਮੱਗਰੀ ਦਿਖਾਏਗਾ:

```swift
Text("Sheet View")
```

ਪਰ ਅਸਲ development ਵਿੱਚ, ਜੇ ਇੱਕ ਪੇਜ ਵਿੱਚ ਕਈ buttons ਹਨ, ਤਾਂ ਆਮ ਤੌਰ ’ਤੇ ਹਰ Button ’ਤੇ ਵੱਖਰਾ `.sheet` ਨਹੀਂ ਜੋੜਿਆ ਜਾਂਦਾ।

ਹੋਰ ਆਮ ਤਰੀਕਾ ਹੈ: `.sheet` ਨੂੰ ਬਾਹਰੀ View ਦੇ ਪਿੱਛੇ ਜੋੜਨਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
VStack {
    Button("Sheet ਦਿਖਾਓ") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

Button `showSheet` ਨੂੰ ਬਦਲਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ, ਅਤੇ ਬਾਹਰੀ View `showSheet` ਦੇ `true` ਹੋਣ ਜਾਂ ਨਾ ਹੋਣ ਦੇ ਅਧਾਰ ’ਤੇ `Sheet` ਖੋਲ੍ਹਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

## Optional value ਨਾਲ Sheet bind ਕਰਨਾ

ਪਿਛਲੇ ਹਿੱਸੇ ਵਿੱਚ ਅਸੀਂ ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ ਸਿੱਖਿਆ ਸੀ:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ਇਹ ਲਿਖਣ ਦਾ ਤਰੀਕਾ ਇੱਕ ਸਥਿਰ ਪੇਜ ਦੇ ਦਿਖਾਉਣ ਅਤੇ ਲੁਕਾਉਣ ਨੂੰ control ਕਰਨ ਲਈ ਢੁਕਵਾਂ ਹੈ।

ਪਰ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਦੇ case ਵਿੱਚ, ਸਾਨੂੰ ਸਿਰਫ਼ “ਕੀ `Sheet` ਖੋਲ੍ਹਣਾ ਹੈ” ਜਾਣਨਾ ਕਾਫ਼ੀ ਨਹੀਂ; ਸਾਨੂੰ ਇਹ ਵੀ ਜਾਣਨਾ ਹੈ ਕਿ “ਕਿਹੜੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕੀਤਾ ਗਿਆ ਹੈ”।

ਉਦਾਹਰਨ ਲਈ:

user ਡਾਲਫਿਨ ’ਤੇ ਕਲਿੱਕ ਕਰੇ, ਤਾਂ `Sheet` ਵਿੱਚ ਡਾਲਫਿਨ ਦਾ ਵੇਰਵਾ ਦਿਖਣਾ ਚਾਹੀਦਾ ਹੈ।

user ਪਾਂਡਾ ’ਤੇ ਕਲਿੱਕ ਕਰੇ, ਤਾਂ `Sheet` ਵਿੱਚ ਪਾਂਡਾ ਦਾ ਵੇਰਵਾ ਦਿਖਣਾ ਚਾਹੀਦਾ ਹੈ।

ਇਸ ਲਈ, ਇੱਥੇ Sheet ਦੀ ਇੱਕ ਹੋਰ ਲਿਖਤ ਹੋਰ ਢੁਕਵੀ ਹੈ:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet ਵਿੱਚ ਦਿਖਾਈ ਜਾਣ ਵਾਲੀ ਸਮੱਗਰੀ
}
```

ਇਸ ਕੋਡ ਵਿੱਚ, `Sheet` ਇੱਕ optional value `selectedAnimal` ਨਾਲ bind ਕੀਤਾ ਗਿਆ ਹੈ।

ਧਿਆਨ ਦਿਓ, `item:` ਤੋਂ ਬਾਅਦ `$selectedAnimal` ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ, `selectedAnimal` ਨਹੀਂ।

ਕਿਉਂਕਿ `Sheet` ਸਿਰਫ਼ `selectedAnimal` ਦੀ value ਨਹੀਂ ਪੜ੍ਹਦਾ, ਸਗੋਂ ਇਸਦੀ ਤਬਦੀਲੀ ਦੇ ਅਧਾਰ ’ਤੇ ਇਹ ਫੈਸਲਾ ਵੀ ਕਰਦਾ ਹੈ ਕਿ ਖੁੱਲ੍ਹਣਾ ਹੈ ਜਾਂ ਨਹੀਂ।

ਇਸ ਕੋਡ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝਿਆ ਜਾ ਸਕਦਾ ਹੈ:

- ਜਦੋਂ `selectedAnimal` `nil` ਹੈ, `Sheet` ਨਹੀਂ ਦਿਖਦਾ।
- ਜਦੋਂ `selectedAnimal` ਕੋਲ value ਹੈ, `Sheet` ਦਿਖਦਾ ਹੈ।
- ਜਦੋਂ `Sheet` ਬੰਦ ਕੀਤਾ ਜਾਂਦਾ ਹੈ, SwiftUI `selectedAnimal` ਨੂੰ ਮੁੜ `nil` ਕਰ ਦੇਵੇਗਾ।

SwiftUI `selectedAnimal` ਵਿੱਚ ਸੰਭਾਲੇ ਜਾਨਵਰ ਨੂੰ braces ਵਿੱਚਲੇ `animal` ਨੂੰ ਦੇ ਦੇਵੇਗਾ।

ਅਰਥਾਤ, `.sheet(item:)` ਸਿਰਫ਼ ਪੌਪ-ਅੱਪ ਨੂੰ control ਨਹੀਂ ਕਰਦਾ, ਇਹ ਚੁਣਿਆ ਗਿਆ ਡਾਟਾ ਵੀ `Sheet` ਵਿੱਚ ਪਾਸ ਕਰਦਾ ਹੈ।

## Sheet ਨਾਲ ਜਾਨਵਰ ਦਾ ਨਾਮ ਦਿਖਾਓ

ਹੁਣ, ਅਸੀਂ ਤੁਰੰਤ complex detail View ਬਣਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ।

ਕੋਡ ਨੂੰ ਸਮਝਣ ਵਿੱਚ ਆਸਾਨ ਬਣਾਉਣ ਲਈ, ਪਹਿਲਾਂ `Sheet` ਵਿੱਚ ਮੌਜੂਦਾ ਜਾਨਵਰ ਦਾ ਨਾਮ ਦਿਖਾਈਏ।

`VStack` ਦੇ ਬਾਹਰ `.sheet(item:)` ਜੋੜੋ:

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
                        .clipShape(Circle())
                    
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

ਇੱਥੇ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਨ ਇਹ ਕੋਡ ਹੈ:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ਜਦੋਂ `selectedAnimal` ਕੋਲ value ਹੈ, `Sheet` ਖੁੱਲ੍ਹੇਗਾ।

braces ਵਿੱਚਲਾ `animal` ਮੌਜੂਦਾ ਚੁਣਿਆ ਗਿਆ ਜਾਨਵਰ ਹੈ।

ਇਸ ਲਈ:

```swift
Text(animal.name)
```

ਇਹ ਮੌਜੂਦਾ ਕਲਿੱਕ ਕੀਤੇ ਜਾਨਵਰ ਦਾ ਨਾਮ ਦਿਖਾਏਗਾ।

ਉਦਾਹਰਨ ਲਈ, `ਡਾਲਫਿਨ` ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੇ Sheet ਵਿੱਚ `ਡਾਲਫਿਨ` ਦਿਖੇਗਾ।

`ਪਾਂਡਾ` ’ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੇ `Sheet` ਵਿੱਚ `ਪਾਂਡਾ` ਦਿਖੇਗਾ।

ਇਸ ਤਰ੍ਹਾਂ, ਅਸੀਂ ਵੱਖ-ਵੱਖ ਜਾਨਵਰਾਂ ’ਤੇ ਕਲਿੱਕ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਜਾਨਵਰਾਂ ਦੇ ਨਾਮ ਪੌਪ-ਅੱਪ ਵਿੱਚ ਦਿਖਾਉਣ ਦਾ ਪ੍ਰਭਾਵ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ।

ਜਾਨਵਰ ਦਾ ਨਾਮ ਦਿਖਾਉਣਾ:

![view](../../../Resource/029_view5.png)

ਪਰ ਜਾਨਵਰ ਵੇਰਵੇ ਵਿੱਚ ਸਿਰਫ਼ ਇੱਕ ਨਾਮ ਨਹੀਂ ਦਿਖਣਾ ਚਾਹੀਦਾ। ਇਸ ਵਿੱਚ ਨਾਮ, ਵੰਡ ਖੇਤਰ, ਰਹਿਣ-ਸਥਾਨ ਅਤੇ ਵੇਰਵਾ ਵੀ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।

ਜੇ ਇਹ ਸਾਰਾ ਕੋਡ `.sheet` ਦੇ ਅੰਦਰ ਲਿਖ ਦਿੱਤਾ ਜਾਵੇ, ਤਾਂ ਕੋਡ ਬਹੁਤ ਲੰਮਾ ਹੋ ਜਾਵੇਗਾ ਅਤੇ ਪੜ੍ਹਨਾ ਔਖਾ ਹੋਵੇਗਾ।

ਇਸ ਲਈ, ਅੱਗੇ ਅਸੀਂ ਇੱਕ ਨਵਾਂ ਕਸਟਮ View ਬਣਾਵਾਂਗੇ, ਜੋ ਖ਼ਾਸ ਤੌਰ ’ਤੇ ਜਾਨਵਰ ਵੇਰਵਾ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੋਵੇਗਾ।

## ਜਾਨਵਰ ਵੇਰਵਾ View ਬਣਾਓ

ਅੱਗੇ, ਅਸੀਂ ਇੱਕ ਨਵਾਂ ਕਸਟਮ View `AnimalDetailView` ਬਣਾਉਂਦੇ ਹਾਂ।

ਇਹ View ਇੱਕ `Animal` ਪ੍ਰਾਪਤ ਕਰਦਾ ਹੈ ਅਤੇ ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ ਦਿਖਾਉਂਦਾ ਹੈ।

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
                    Text("**ਵੰਡ ਖੇਤਰ**: \(animal.distributionArea)")

                    Divider()

                    Text("**ਰਹਿਣ-ਸਥਾਨ**: \(animal.habitat)")

                    Divider()

                    Text("**ਜਾਨਵਰ ਵੇਰਵਾ**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ਦਿਖਾਵਟ:

![view](../../../Resource/029_view2.png)

ਇੱਥੇ ਮੁੱਖ ਗੱਲ ਹੈ:

```swift
var animal: Animal
```

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ `AnimalDetailView` ਨੂੰ ਬਾਹਰੋਂ ਇੱਕ ਜਾਨਵਰ ਪ੍ਰਾਪਤ ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

ਜਾਨਵਰ ਪ੍ਰਾਪਤ ਕਰਨ ਤੋਂ ਬਾਅਦ, detail View ਇਸ ਜਾਨਵਰ ਦੀਆਂ ਵੱਖ-ਵੱਖ ਜਾਣਕਾਰੀਆਂ ਵਰਤ ਸਕਦਾ ਹੈ:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

ਅਰਥਾਤ, `AnimalDetailView` ਸਿਰਫ਼ ਪਾਸ ਕੀਤੇ ਜਾਨਵਰ ਨੂੰ ਦਿਖਾਉਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੈ।

### Markdown ਮੋਟਾ ਟੈਕਸਟ

detail View ਵਿੱਚ, ਅਸੀਂ ਇਹ ਕੋਡ ਲਿਖਿਆ ਹੈ:

```swift
Text("**ਰਹਿਣ-ਸਥਾਨ:** \(animal.habitat)")
```

ਇੱਥੇ ਦੋ ਗਿਆਨ-ਬਿੰਦੂ ਹਨ।

ਪਹਿਲਾ, `**ਰਹਿਣ-ਸਥਾਨ:**` `Markdown` syntax ਵਰਤਦਾ ਹੈ। ਦੋ ਤਾਰਿਆਂ ਨਾਲ ਘਿਰਿਆ ਟੈਕਸਟ ਮੋਟਾ ਦਿਖੇਗਾ।

ਦੂਜਾ, `\()` string interpolation ਹੈ, ਜਿਸ ਨਾਲ variable ਦੀ value ਟੈਕਸਟ ਵਿੱਚ ਦਿਖਾਈ ਜਾ ਸਕਦੀ ਹੈ।

ਇਸ ਕੋਡ ਦਾ ਅਰਥ ਹੈ ਪਹਿਲਾਂ ਮੋਟਾ `ਰਹਿਣ-ਸਥਾਨ:` ਦਿਖਾਉਣਾ, ਫਿਰ ਇਸ ਜਾਨਵਰ ਦਾ ਰਹਿਣ-ਸਥਾਨ ਦਿਖਾਉਣਾ।

## Sheet ਵਿੱਚ detail View ਦਿਖਾਓ

`AnimalDetailView` ਬਣਾਉਣ ਤੋਂ ਬਾਅਦ, ਅਸੀਂ `ContentView` ’ਤੇ ਵਾਪਸ ਜਾ ਕੇ `Sheet` ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ name View ਨੂੰ detail View ਨਾਲ ਬਦਲ ਸਕਦੇ ਹਾਂ।

ਪਹਿਲਾਂ ਇਹ ਸੀ:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ਹੁਣ ਇਸ ਵਿੱਚ ਬਦਲੋ:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ਇੱਥੇ `animal:` `AnimalDetailView` ਦੇ parameter ਦਾ ਨਾਮ ਹੈ।

ਇਸ ਤੋਂ ਬਾਅਦ ਵਾਲਾ `animal` `.sheet(item:)` ਰਾਹੀਂ ਆਇਆ ਮੌਜੂਦਾ ਜਾਨਵਰ ਹੈ।

ਅਰਥਾਤ, ਮੌਜੂਦਾ ਕਲਿੱਕ ਕੀਤਾ ਜਾਨਵਰ `AnimalDetailView` ਨੂੰ ਦਿਖਾਉਣ ਲਈ ਪਾਸ ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

ਪੂਰਾ structure:

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
                        .clipShape(Circle())
                    
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

ਜਦੋਂ user ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕਰਦਾ ਹੈ:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` ਤੋਂ ਇੱਕ ਖ਼ਾਸ ਜਾਨਵਰ ਬਣ ਜਾਂਦਾ ਹੈ। `Sheet` ਜਦੋਂ ਵੇਖਦਾ ਹੈ ਕਿ `selectedAnimal` ਕੋਲ value ਹੈ, ਤਾਂ View ਖੋਲ੍ਹਦਾ ਹੈ।

`Sheet` `selectedAnimal` ਵਿੱਚਲੇ ਜਾਨਵਰ ਨੂੰ `AnimalDetailView` View ਨੂੰ ਪਾਸ ਕਰਦਾ ਹੈ, ਅਤੇ `AnimalDetailView` ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ ਦਿਖਾਉਂਦਾ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ, ਅਸੀਂ ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ’ਤੇ ਕਲਿੱਕ ਕਰਕੇ ਸੰਬੰਧਿਤ ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ ਖੋਲ੍ਹਣ ਵਾਲੀ function ਪੂਰੀ ਕਰ ਲਈ ਹੈ।

## Sheet ਦੀਆਂ ਦੋ ਲਿਖਤਾਂ ਵਿਚਲਾ ਫਰਕ

ਹੁਣ, ਅਸੀਂ `.sheet(item:)` ਨਾਲ ਜਾਨਵਰ detail View ਦਿਖਾਉਣਾ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ।

ਇੱਥੇ ਅਸੀਂ `Sheet` ਦੀਆਂ ਦੋ ਆਮ ਲਿਖਤਾਂ ਦਾ ਸਧਾਰਣ summary ਕਰ ਸਕਦੇ ਹਾਂ।

### ਪਹਿਲੀ ਲਿਖਤ Boolean value ਨਾਲ bind ਕਰਨਾ ਹੈ

```swift
@State private var showSheet = false

Button("Sheet ਦਿਖਾਓ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

ਇਹ ਲਿਖਤ ਸਥਿਰ ਸਮੱਗਰੀ ਖੋਲ੍ਹਣ ਲਈ ਢੁਕਵੀ ਹੈ, ਜਿਵੇਂ settings page, explanation page, prompt page ਆਦਿ।

`showSheet` ਇੱਕ Boolean value ਹੈ, ਜਿਸਦੇ ਸਿਰਫ਼ ਦੋ states ਹਨ: `true` ਅਤੇ `false`।

ਜਦੋਂ `showSheet` `true` ਹੈ, `Sheet` ਦਿਖਦਾ ਹੈ।

ਜਦੋਂ `showSheet` `false` ਹੈ, `Sheet` ਨਹੀਂ ਦਿਖਦਾ।

### ਦੂਜੀ ਲਿਖਤ optional value ਨਾਲ bind ਕਰਨਾ ਹੈ

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ਇਹ ਲਿਖਤ ਚੁਣੇ ਗਏ ਡਾਟਾ ਦੇ ਅਧਾਰ ’ਤੇ ਵੱਖ-ਵੱਖ ਸਮੱਗਰੀ ਖੋਲ੍ਹਣ ਲਈ ਢੁਕਵੀ ਹੈ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਵੱਖ-ਵੱਖ ਜਾਨਵਰਾਂ ’ਤੇ ਕਲਿੱਕ ਕਰਦੇ ਹਾਂ ਅਤੇ ਵੱਖ-ਵੱਖ ਜਾਨਵਰਾਂ ਦੇ ਵੇਰਵੇ ਦਿਖਾਉਣੇ ਹੁੰਦੇ ਹਨ, ਇਸ ਲਈ `.sheet(item:)` ਵਰਤਣਾ ਹੋਰ ਢੁਕਵਾਂ ਹੈ।

## ਪੂਰਾ ਕੋਡ

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // ਜਾਨਵਰ ਦਾ ਨਾਮ
    let name: String
    
    // ਜਾਨਵਰ ਦੀ ਤਸਵੀਰ
    let imageName: String
    
    // ਜਾਨਵਰ ਦਾ emoji
    let avatarEmoji: String
    
    // ਵੰਡ ਖੇਤਰ
    let distributionArea: String
    
    // ਰਹਿਣ-ਸਥਾਨ
    let habitat: String
    
    // ਜਾਨਵਰ ਦਾ ਵੇਰਵਾ
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ਡਾਲਫਿਨ
        Animal(
            name: "ਡਾਲਫਿਨ",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "ਦੁਨੀਆ ਭਰ ਦੇ ਗਰਮ ਅਤੇ ਮਧਿਮ ਸਮੁੰਦਰ।",
            habitat: "ਸਮੁੰਦਰ, ਤਟਵਰਤੀ ਪਾਣੀ ਅਤੇ ਕੁਝ ਵੱਡੀਆਂ ਨਦੀਆਂ।",
            animalDescription: "ਡਾਲਫਿਨ ਬੁੱਧੀਮਾਨ ਸਮੁੰਦਰੀ ਸਤਨਧਾਰੀ ਹਨ। ਉਹ ਸਮੂਹਾਂ ਵਿੱਚ ਰਹਿੰਦੀਆਂ ਹਨ, ਆਵਾਜ਼ਾਂ ਨਾਲ ਸੰਚਾਰ ਕਰਦੀਆਂ ਹਨ, ਅਤੇ ਆਪਣੇ ਖੇਡਣ ਵਾਲੇ ਸੁਭਾਅ ਲਈ ਜਾਣੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।"
        ),
        // ਜਿਰਾਫ਼
        Animal(
            name: "ਜਿਰਾਫ਼",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ਅਫਰੀਕਾ ਦੇ ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲੀ ਖੇਤਰ।",
            habitat: "ਘਾਹਦਾਰ ਮੈਦਾਨ, ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲ।",
            animalDescription: "ਜਿਰਾਫ਼ ਧਰਤੀ ਉੱਤੇ ਸਭ ਤੋਂ ਲੰਮੇ ਜਾਨਵਰ ਹਨ। ਉਨ੍ਹਾਂ ਦੀ ਲੰਮੀ ਗਰਦਨ ਅਤੇ ਲੰਮੇ ਪੈਰ ਹੁੰਦੇ ਹਨ, ਅਤੇ ਉਹ ਆਮ ਤੌਰ ’ਤੇ ਉੱਚੇ ਦਰੱਖ਼ਤਾਂ ਦੇ ਪੱਤੇ ਖਾਂਦੇ ਹਨ।"
        ),
        // ਸ਼ੇਰ
        Animal(
            name: "ਸ਼ੇਰ",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "ਮੁੱਖ ਤੌਰ ’ਤੇ ਸਹਾਰਾ ਦੇ ਦੱਖਣੀ ਅਫਰੀਕਾ ਵਿੱਚ, ਅਤੇ ਪੱਛਮੀ ਭਾਰਤ ਵਿੱਚ ਇੱਕ ਛੋਟੀ ਆਬਾਦੀ।",
            habitat: "ਘਾਹਦਾਰ ਮੈਦਾਨ, ਸਵਾਨਾ ਅਤੇ ਖੁੱਲ੍ਹੇ ਜੰਗਲੀ ਖੇਤਰ।",
            animalDescription: "ਸ਼ੇਰ ਤਾਕਤਵਰ ਵੱਡੀਆਂ ਬਿੱਲੀਆਂ ਹਨ। ਉਹ ਆਮ ਤੌਰ ’ਤੇ prides ਕਹੇ ਜਾਣ ਵਾਲੇ ਸਮੂਹਾਂ ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ, ਅਤੇ ਅਕਸਰ ਜਾਨਵਰ ਜਗਤ ਦੇ ਰਾਜੇ ਵਜੋਂ ਜਾਣੇ ਜਾਂਦੇ ਹਨ।"
        ),
        // ਪਾਂਡਾ
        Animal(
            name: "ਪਾਂਡਾ",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ਚੀਨ ਦੇ ਮੱਧ ਖੇਤਰਾਂ ਦੇ ਪਹਾੜੀ ਜੰਗਲ।",
            habitat: "ਠੰਢੇ ਅਤੇ ਨਮੀ ਵਾਲੇ ਪਹਾੜੀ ਖੇਤਰਾਂ ਦੇ ਬਾਂਸ ਦੇ ਜੰਗਲ।",
            animalDescription: "ਪਾਂਡਾ ਕਾਲੇ-ਸਫੈਦ ਰੋਂਏ ਲਈ ਜਾਣੇ ਜਾਣ ਵਾਲੇ ਭਾਲੂ ਹਨ। ਉਹ ਮੁੱਖ ਤੌਰ ’ਤੇ ਬਾਂਸ ਖਾਂਦੇ ਹਨ ਅਤੇ ਦੁਨੀਆ ਦੇ ਸਭ ਤੋਂ ਆਸਾਨੀ ਨਾਲ ਪਛਾਣੇ ਜਾਣ ਵਾਲੇ ਜਾਨਵਰਾਂ ਵਿੱਚੋਂ ਇੱਕ ਹਨ।"
        ),
        // ਧ੍ਰੁਵੀ ਭਾਲੂ
        Animal(
            name: "ਧ੍ਰੁਵੀ ਭਾਲੂ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ਉੱਤਰੀ ਧ੍ਰੁਵ ਦੇ ਆਲੇ-ਦੁਆਲੇ ਦੇ ਆਰਕਟਿਕ ਖੇਤਰ।",
            habitat: "ਸਮੁੰਦਰੀ ਬਰਫ਼, ਤਟਵਰਤੀ ਖੇਤਰ ਅਤੇ ਠੰਢੇ ਆਰਕਟਿਕ ਵਾਤਾਵਰਣ।",
            animalDescription: "ਧ੍ਰੁਵੀ ਭਾਲੂ ਠੰਢੇ ਵਾਤਾਵਰਣ ਲਈ ਅਨੁਕੂਲ ਵੱਡੇ ਭਾਲੂ ਹਨ। ਉਹ ਮਜ਼ਬੂਤ ਤੈਰਾਕ ਹਨ ਅਤੇ ਸੀਲਾਂ ਦਾ ਸ਼ਿਕਾਰ ਕਰਨ ਲਈ ਮੁੱਖ ਤੌਰ ’ਤੇ ਸਮੁੰਦਰੀ ਬਰਫ਼ ’ਤੇ ਨਿਰਭਰ ਕਰਦੇ ਹਨ।"
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
                            .clipShape(Circle())

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
                    Text("**ਵੰਡ ਖੇਤਰ**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**ਰਹਿਣ-ਸਥਾਨ**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**ਜਾਨਵਰ ਵੇਰਵਾ**: \(animal.animalDescription)")
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

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਇੱਕ ਸਧਾਰਣ ਜਾਨਵਰ ਵਿਸ਼ਵਕੋਸ਼ ਪੇਜ ਪੂਰਾ ਕੀਤਾ ਗਿਆ।

ਅਸੀਂ ਪਹਿਲਾਂ `Animal` structure ਨਾਲ ਜਾਨਵਰ ਜਾਣਕਾਰੀ ਸੰਭਾਲੀ, ਫਿਰ array ਨਾਲ ਪੰਜ ਜਾਨਵਰ ਸੰਭਾਲੇ, ਅਤੇ ਫਿਰ `ForEach` ਨਾਲ ਜਾਨਵਰਾਂ ਦੀ ਲਿਸਟ ਦਿਖਾਈ।

ਜਦੋਂ user ਕਿਸੇ ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ ਕਰਦਾ ਹੈ, ਅਸੀਂ ਉਸ ਜਾਨਵਰ ਨੂੰ `selectedAnimal` ਵਿੱਚ ਸੰਭਾਲਦੇ ਹਾਂ:

```swift
selectedAnimal = animal
```

ਜਦੋਂ `selectedAnimal` ਕੋਲ value ਹੁੰਦੀ ਹੈ, `.sheet(item:)` detail View ਖੋਲ੍ਹਦਾ ਹੈ ਅਤੇ ਚੁਣਿਆ ਗਿਆ ਜਾਨਵਰ `AnimalDetailView` ਨੂੰ ਪਾਸ ਕਰਦਾ ਹੈ।

ਇਸ ਪਾਠ ਦੀ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਨ ਗੱਲ interface style ਨਹੀਂ, ਸਗੋਂ ਡਾਟਾ ਪਾਸ ਕਰਨ ਵਾਲੇ ਇਸ ਰਸਤੇ ਨੂੰ ਸਮਝਣਾ ਹੈ:

```swift
ਜਾਨਵਰ ’ਤੇ ਕਲਿੱਕ → selectedAnimal ਜਾਨਵਰ ਸੰਭਾਲਦਾ ਹੈ → Sheet ਖੁੱਲ੍ਹਦਾ ਹੈ → AnimalDetailView ਵੇਰਵਾ ਦਿਖਾਉਂਦਾ ਹੈ
```

ਇਸ ਰਸਤੇ ਨੂੰ ਸਮਝਣ ਤੋਂ ਬਾਅਦ, ਅੱਗੇ ਹੋਰ ਮਿਲਦੇ-ਜੁਲਦੇ functions ਬਣਾਏ ਜਾ ਸਕਦੇ ਹਨ, ਜਿਵੇਂ product details, course details, article details, contact details ਆਦਿ।
