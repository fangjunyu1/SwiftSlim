# ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ 

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಕಸ್ಟಮ್ ವೀಕ್ಷಣೆಗಳು ಮತ್ತು ಡೇಟಾ ಪಾಸ್ ಮಾಡುವ ಅಭ್ಯಾಸವನ್ನು ಮುಂದುವರಿಸುತ್ತೇವೆ.

ನಾವು ಸರಳವಾದ ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ ವೀಕ್ಷಣೆಯನ್ನು ನಿರ್ಮಿಸಲಿದ್ದೇವೆ. ಪುಟದಲ್ಲಿ ಐದು ಪ್ರಾಣಿಗಳು ಕಾಣಿಸುತ್ತವೆ. ಯಾವುದಾದರೂ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, ಆ ಪ್ರಾಣಿಯ ಚಿತ್ರ, ವಿತರಣಾ ಪ್ರದೇಶ, ವಾಸಸ್ಥಳ ಮತ್ತು ವಿವರಣೆಯನ್ನು ತೋರಿಸುವ ವಿವರ ವೀಕ್ಷಣೆ ಪಾಪ್ ಅಪ್ ಆಗುತ್ತದೆ.

ಕಾರ್ಯಗತ ಫಲಿತಾಂಶ:

![view](../../../Resource/029_view.png)

ಈ ಉದಾಹರಣೆಯ ಮೂಲಕ, ಡೇಟಾ ರಚನೆ, ಪಟ್ಟಿಯಲ್ಲಿ ಪ್ರದರ್ಶನ, ಕ್ಲಿಕ್ ಸಂವಹನ ಮತ್ತು Sheet ಪಾಪ್ ಅಪ್ ವೀಕ್ಷಣೆಗಳ ನಡುವಿನ ಸಹಕಾರವನ್ನು ಅಭ್ಯಾಸಿಸಬಹುದು.

## ಚಿತ್ರ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸಿದ್ಧಪಡಿಸುವುದು

ಮೊದಲು, ನಾವು ಐದು ಪ್ರಾಣಿಗಳ ಚಿತ್ರಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಬೇಕು:

- ಡಾಲ್ಫಿನ್: `dolphin.jpg`
- ಜಿರಾಫೆ: `giraffe.jpg`
- ಸಿಂಹ: `lion.jpg`
- ಪಾಂಡಾ: `panda.jpg`
- ಧ್ರುವ ಕರಡಿ: `polarBear.jpg`

ಕೆಳಗಿನ ಚಿತ್ರ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಬಳಸಬಹುದು:

[ಡಾಲ್ಫಿನ್](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [ಜಿರಾಫೆ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [ಸಿಂಹ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [ಪಾಂಡಾ](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [ಧ್ರುವ ಕರಡಿ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

ಚಿತ್ರಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ನಂತರ, ಅವನ್ನು Xcode ಯೋಜನೆಯ `Assets` ಸಂಪನ್ಮೂಲ ಫೋಲ್ಡರ್‌ಗೆ ಎಳೆಯಿರಿ.

![assets](../../../Resource/029_assets.png)

ಗಮನಿಸಬೇಕಾದ ವಿಷಯವೇನೆಂದರೆ, ಕೋಡ್‌ನಲ್ಲಿ ಚಿತ್ರವನ್ನು ಬಳಸುವಾಗ ಸಾಮಾನ್ಯವಾಗಿ `.jpg` ವಿಸ್ತರಣೆಯನ್ನು ಬರೆಯಬೇಕಾಗಿಲ್ಲ.

ಉದಾಹರಣೆಗೆ, ಚಿತ್ರ ಸಂಪನ್ಮೂಲದ ಹೆಸರು `dolphin` ಆಗಿದ್ದರೆ, ಕೋಡ್‌ನಲ್ಲಿ ಹೀಗೆ ಬರೆಯಿರಿ:

```swift
Image("dolphin")
```

ಚಿತ್ರದ ಹೆಸರನ್ನು ತಪ್ಪಾಗಿ ಬರೆದರೆ, ಚಿತ್ರ ಸರಿಯಾಗಿ ಪ್ರದರ್ಶವಾಗುವುದಿಲ್ಲ.

ಟಿಪ್ಪಣಿ: ಮೇಲಿನ ಚಿತ್ರ ಸಂಪನ್ಮೂಲಗಳು ವಿಕಿಮೀಡಿಯಾ ಯೋಜನೆಯಿಂದ ಬಂದಿವೆ. ಬಳಸುವಾಗ ಮೂಲ ಚಿತ್ರದ ಲಿಂಕ್ ಮತ್ತು ಮೂಲದ ಮಾಹಿತಿಯನ್ನು ಉಳಿಸಿಕೊಳ್ಳುವುದು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ.

## ಪ್ರಾಣಿ ರಚನೆಯನ್ನು ಸೃಷ್ಟಿಸುವುದು

ಈ ಪುಟದಲ್ಲಿ, ಪ್ರತಿಯೊಂದು ಪ್ರಾಣಿಗೂ ಹಲವು ಮಾಹಿತಿ ಅಂಶಗಳಿವೆ:

- ಪ್ರಾಣಿಯ ಹೆಸರು
- ಪ್ರಾಣಿಯ ಚಿತ್ರ
- ಪ್ರಾಣಿಯ ಇಮೋಜಿ
- ವಿತರಣಾ ಪ್ರದೇಶ
- ವಾಸಸ್ಥಳ
- ಪ್ರಾಣಿಯ ವಿವರಣೆ

ಈ ಮಾಹಿತಿಯನ್ನು ಅನೇಕ ಬೇರೆ ಬೇರೆ ಚರಗಳಾಗಿ ಚದುರಿಸಿದರೆ, ಕೋಡ್ ಗೊಂದಲವಾಗಬಹುದು. ಆದ್ದರಿಂದ, ಒಂದು ಪ್ರಾಣಿಯ ಮಾಹಿತಿಯನ್ನು ಒಟ್ಟಿಗೆ ಇಡಲು ನಾವು `Animal` ರಚನೆಯನ್ನು ಸೃಷ್ಟಿಸಬಹುದು.

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

ಈ ಕೋಡ್‌ನಲ್ಲಿ:

- `id`: ಪ್ರಾಣಿಯ ಅನನ್ಯ ಗುರುತು.
- `name`: ಪ್ರಾಣಿಯ ಹೆಸರು.
- `imageName`: ಪ್ರಾಣಿಯ ಚಿತ್ರದ ಹೆಸರು.
- `avatarEmoji`: ಪ್ರಾಣಿಯ ಇಮೋಜಿ.
- `distributionArea`: ವಿತರಣಾ ಪ್ರದೇಶ.
- `habitat`: ವಾಸಸ್ಥಳ.
- `animalDescription`: ಪ್ರಾಣಿಯ ವಿವರಣೆ.

ಇವುಗಳಲ್ಲಿ:

```swift
let id = UUID()
```

`id` ಪ್ರತಿಯೊಂದು ಪ್ರಾಣಿಯನ್ನು ಗುರುತಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಮುಂದೆ ನಾವು ಪ್ರಾಣಿಗಳ ಪಟ್ಟಿಯನ್ನು ತೋರಿಸಲು `ForEach` ಬಳಸುತ್ತೇವೆ, ಮತ್ತು ಆಯ್ಕೆಯಾದ ಪ್ರಾಣಿಯನ್ನು ಆಧರಿಸಿ ವಿವರಗಳನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಲು `.sheet(item:)` ಅನ್ನು ಸಹ ಬಳಸುತ್ತೇವೆ. ಆದ್ದರಿಂದ `Animal` ಅನ್ನು `Identifiable` ಪ್ರೋಟೋಕಾಲ್ ಅನುಸರಿಸುವಂತೆ ಮಾಡಬೇಕು.

`Identifiable` ನ ಕೆಲಸ SwiftUI ಗೆ ಹೇಳುವುದಾಗಿದೆ: ಪ್ರತಿಯೊಂದು ಪ್ರಾಣಿಗೂ ತನ್ನದೇ ಆದ ಗುರುತಿಸಬಹುದಾದ `id` ಇದೆ.

## ಪ್ರಾಣಿ ಡೇಟಾ ಸೃಷ್ಟಿಸುವುದು

ನಂತರ, ನಾವು `ContentView` ನಲ್ಲಿ ಪ್ರಾಣಿ ಅರೇ ಒಂದನ್ನು ಸೃಷ್ಟಿಸುತ್ತೇವೆ.

ಅರೇಯಲ್ಲಿ ಐದು `Animal` ಗಳನ್ನು ಸಂಗ್ರಹಿಸಲಾಗುತ್ತದೆ. ಪ್ರತಿಯೊಂದು `Animal` ಒಂದು ಪ್ರಾಣಿಯನ್ನು ಸೂಚಿಸುತ್ತದೆ.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // ಡಾಲ್ಫಿನ್
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ಜಿರಾಫೆ
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // ಸಿಂಹ
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // ಪಾಂಡಾ
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ಧ್ರುವ ಕರಡಿ
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]

    var body: some View {
        Text("ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ")
    }
}
```

ಇಲ್ಲಿನ `animals` ಒಂದು ಅರೇ:

```swift
let animals: [Animal]
```

`[Animal]` ಎಂದರೆ ಈ ಅರೇಯಲ್ಲಿ ಹಲವು `Animal` ಗಳು ಸಂಗ್ರಹವಾಗಿವೆ.

ಅಂದರೆ, `animals` ಒಂದು ಪ್ರಾಣಿ ಅಲ್ಲ, ಪ್ರಾಣಿಗಳ ಒಂದು ಗುಂಪು.

## ಪ್ರಾಣಿ ಪಟ್ಟಿಯನ್ನು ಪ್ರದರ್ಶಿಸುವುದು

ಈಗ, ನಾವು `ForEach` ಬಳಸಿ ಪ್ರಾಣಿ ಪಟ್ಟಿಯನ್ನು ಪ್ರದರ್ಶಿಸಬಹುದು.

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

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/029_view1.png)

ಈ ಕೋಡ್‌ನಲ್ಲಿ:

```swift
ForEach(animals) { animal in
    ...
}
```

ಇದು `animals` ಅರೇಯನ್ನು ಕ್ರಮವಾಗಿ ಸಂಚರಿಸುತ್ತದೆ.

ಪ್ರತಿ ಲೂಪ್‌ನಲ್ಲಿ, `animal` ಎಂದರೆ ಈಗ ಪ್ರದರ್ಶಿಸಲಾಗುತ್ತಿರುವ ಆ ಪ್ರಾಣಿ.

ಉದಾಹರಣೆಗೆ, ಮೊದಲ ಲೂಪ್‌ನಲ್ಲಿ `animal` ಡಾಲ್ಫಿನ್; ಎರಡನೇ ಲೂಪ್‌ನಲ್ಲಿ `animal` ಜಿರಾಫೆ.

ಆದ್ದರಿಂದ, ಕೆಳಗಿನ ವಿಧಾನದಿಂದ ಪ್ರಸ್ತುತ ಪ್ರಾಣಿಯ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಬಹುದು:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

ಹೀಗೆ ಮಾಡಿದರೆ ಐದು ಪ್ರಾಣಿಗಳನ್ನೂ ಪ್ರದರ್ಶಿಸಬಹುದು.

## ಪ್ರಾಣಿ ಪಟ್ಟಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಬಹುದಾಗಿಸುವುದು

ಈಗ ಪಟ್ಟಿ ಪ್ರದರ್ಶವಾಗಿದೆ, ಆದರೆ ಇನ್ನೂ ಕ್ಲಿಕ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಯಾವುದಾದರೂ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದ ನಂತರ ವಿವರಗಳನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಲು, ಮೊದಲು “ಪ್ರಸ್ತುತ ಆಯ್ಕೆಯಾದ ಪ್ರಾಣಿ” ಯನ್ನು ದಾಖಲಿಸಬೇಕು.

ಆದ್ದರಿಂದ, `ContentView` ನಲ್ಲಿ ಒಂದು ಸ್ಥಿತಿ ಚರವನ್ನು ಸೇರಿಸಿ:

```swift
@State private var selectedAnimal: Animal? = nil
```

ಇಲ್ಲಿನ `selectedAnimal` ಒಂದು ಆಯ್ಕೆಯ ಮೌಲ್ಯ ಪ್ರಕಾರ `Animal?`.

ಅದರರ್ಥ ಅದರಲ್ಲಿ ಒಂದು ಪ್ರಾಣಿ ಇರಬಹುದು, ಅಥವಾ ಯಾವುದೇ ಪ್ರಾಣಿ ಇರದಿರಬಹುದು.

ಪೂರ್ವನಿಯೋಜಿತ ಮೌಲ್ಯ `nil`, ಅಂದರೆ ಆರಂಭದಲ್ಲಿ ಯಾವುದೇ ಪ್ರಾಣಿಯೂ ಆಯ್ಕೆಯಾಗಿಲ್ಲ.

ನಂತರ, ಪ್ರತಿಯೊಂದು ಪ್ರಾಣಿ ಸಾಲನ್ನು `Button` ಆಗಿ ಬದಲಾಯಿಸುತ್ತೇವೆ:

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

ಮುಖ್ಯವಾದುದು ಈ ಒಂದು ಸಾಲು:

```swift
selectedAnimal = animal
```

ಬಳಕೆದಾರರು ಯಾವುದಾದರೂ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, ನಾವು ಆ ಪ್ರಾಣಿಯನ್ನು `selectedAnimal` ನಲ್ಲಿ ಉಳಿಸುತ್ತೇವೆ.

ಉದಾಹರಣೆಗೆ, ಬಳಕೆದಾರರು ಡಾಲ್ಫಿನ್ ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, `selectedAnimal` ನಲ್ಲಿ ಉಳಿಯುವುದು ಡಾಲ್ಫಿನ್.

ಬಳಕೆದಾರರು ಪಾಂಡಾ ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, `selectedAnimal` ನಲ್ಲಿ ಉಳಿಯುವುದು ಪಾಂಡಾ.

ಅಂದರೆ, `selectedAnimal` ಬಳಕೆದಾರರು ಪ್ರಸ್ತುತ ಯಾವ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದ್ದಾರೆ ಎಂಬುದನ್ನು ದಾಖಲಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ.

## Sheet ಪಾಪ್ ಅಪ್ ವೀಕ್ಷಣೆ

ಈಗ ನಾವು ಬಟನ್ ಮೂಲಕ “ಪ್ರಸ್ತುತ ಕ್ಲಿಕ್ ಮಾಡಿದ ಪ್ರಾಣಿ” ಯನ್ನು ದಾಖಲಿಸಬಹುದು.

ಮುಂದೆ, ಪ್ರಾಣಿ ವಿವರಗಳನ್ನು ತೋರಿಸಲು ಒಂದು ಪಾಪ್ ಅಪ್ ವೀಕ್ಷಣೆಯನ್ನು ನಿರ್ಮಿಸಬೇಕು.

![view](../../../Resource/029_view2.png)

SwiftUI ಯಲ್ಲಿ, ಈ ರೀತಿಯ ಪಾಪ್ ಅಪ್ ಪರಿಣಾಮವನ್ನು ಮಾಡಲು `Sheet` ಬಳಸಬಹುದು.

`Sheet` ಅನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಪಾಪ್ ಅಪ್ ಆಗುವ ಪುಟವೆಂದು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಬಹುದು. ಅದು ಪ್ರಸ್ತುತ ಪುಟದ ಮೇಲೆ ಕಾಣಿಸುತ್ತದೆ. ಬಳಕೆದಾರರು ವಿಷಯವನ್ನು ನೋಡಿ ಮುಗಿಸಿದ ನಂತರ, ಕೆಳಗೆ ಸ್ವೈಪ್ ಮಾಡಿ ಮುಚ್ಚಬಹುದು.

## Sheet ಉದಾಹರಣೆ

ನಿಜವಾಗಿ ಪ್ರಾಣಿ ವಿವರಗಳನ್ನು ತೋರಿಸುವ ಮೊದಲು, `Sheet` ಹೇಗೆ ಪಾಪ್ ಅಪ್ ಆಗುತ್ತದೆ ಎಂಬುದನ್ನು ಸರಳ ಉದಾಹರಣೆಯಿಂದ ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("ಶೀಟ್ ತೋರಿಸಿ")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/029_view3.png)

ಈ ಕೋಡ್‌ನಲ್ಲಿ, ನಾವು ಒಂದು ಬುಲಿಯನ್ ಮೌಲ್ಯವನ್ನು ಸೃಷ್ಟಿಸಿದ್ದೇವೆ:

```swift
@State private var showSheet = false
```

`showSheet` ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ `false`, ಅಂದರೆ ಆರಂಭದಲ್ಲಿ `Sheet` ಪ್ರದರ್ಶವಾಗುವುದಿಲ್ಲ.

ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ:

```swift
showSheet.toggle()
```

`toggle()` ಎಂದರೆ ಬುಲಿಯನ್ ಮೌಲ್ಯವನ್ನು ಬದಲಿಸುವುದು.

ಮೊದಲು `false` ಆಗಿದ್ದರೆ, `toggle()` ಕರೆ ಮಾಡಿದ ನಂತರ ಅದು `true` ಆಗುತ್ತದೆ.

ಮೊದಲು `true` ಆಗಿದ್ದರೆ, `toggle()` ಕರೆ ಮಾಡಿದ ನಂತರ ಅದು `false` ಆಗುತ್ತದೆ.

ಆದ್ದರಿಂದ, ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದ ನಂತರ `showSheet` `false` ಇಂದ `true` ಆಗುತ್ತದೆ.

`showSheet` `true` ಆದಾಗ, ಕೆಳಗಿನ ಕೋಡ್ `Sheet` ಅನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡುತ್ತದೆ:

```swift
.sheet(isPresented: $showSheet) {
    Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ಈ ಕೋಡ್ ಅರ್ಥ: `showSheet` `true` ಆಗಿರುವಾಗ, ಒಂದು `Sheet` ಪಾಪ್ ಅಪ್ ಮಾಡಿ, ಆ `Sheet` ನಲ್ಲಿ `Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")` ತೋರಿಸಿ.

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/029_view4.png)

ಈ ಬರವಣಿಗೆ ಸ್ಥಿರ ವಿಷಯವನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಲು ಸೂಕ್ತವಾಗಿದೆ.

ಉದಾಹರಣೆಗೆ, ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿದ ನಂತರ ಸೆಟ್ಟಿಂಗ್ ಪುಟ, ವಿವರಣೆ ಪುಟ, ಸೂಚನೆ ಪುಟ ಇತ್ಯಾದಿ ಪಾಪ್ ಅಪ್ ಮಾಡುವುದು.

### Sheet ಪ್ರದರ್ಶನದ ಸ್ಥಾನ

`Sheet` ಪಾಪ್ ಅಪ್ ವೀಕ್ಷಣೆ ಆಗಿದ್ದರೂ, SwiftUI ಯಲ್ಲಿ ಅದು `Text()` ಅಥವಾ `Image()` ಹಾಗೆ ಸ್ವತಂತ್ರ ವೀಕ್ಷಣೆಯಾಗಿ ನೇರವಾಗಿ ಬರೆಯುವುದಿಲ್ಲ. ಬದಲಾಗಿ, ಅದನ್ನು ಒಂದು ವೀಕ್ಷಣೆ ಮಾರ್ಪಡಕವಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ.

ಅಂದರೆ, `.sheet(...)`, `.font()`, `.padding()`, `.shadow()` ಮುಂತಾದ ಮಾರ್ಪಡಕಗಳಂತೆ, ಯಾವುದಾದರೂ ವೀಕ್ಷಣೆಯ ನಂತರ ಸೇರಿಸಬೇಕು.

ಉದಾಹರಣೆಗೆ:

```swift
Button("ಶೀಟ್ ತೋರಿಸಿ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
}
```

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, `.sheet` ಅನ್ನು `Button` ನಂತರ ಸೇರಿಸಲಾಗಿದೆ.

`showSheet` `true` ಆದಾಗ, SwiftUI `Sheet` ಅನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಿ, ಕೊಕ್ಕು ಕುಳಿತಿರುವ ವಿಷಯವನ್ನು ತೋರಿಸುತ್ತದೆ:

```swift
Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
```

ಆದರೆ, ನಿಜವಾದ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ, ಒಂದು ಪುಟದಲ್ಲಿ ಹಲವು ಬಟನ್‌ಗಳಿದ್ದರೆ, ಸಾಮಾನ್ಯವಾಗಿ ಪ್ರತಿಯೊಂದು ಬಟನ್‌ಗೂ ಪ್ರತ್ಯೇಕ `.sheet` ಸೇರಿಸುವುದಿಲ್ಲ.

ಹೆಚ್ಚು ಸಾಮಾನ್ಯವಾದ ವಿಧಾನವೆಂದರೆ: `.sheet` ಅನ್ನು ಹೊರಗಿನ ವೀಕ್ಷಣೆಯ ನಂತರ ಸೇರಿಸುವುದು.

ಉದಾಹರಣೆಗೆ:

```swift
VStack {
    Button("ಶೀಟ್ ತೋರಿಸಿ") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
}
```

ಬಟನ್ `showSheet` ಅನ್ನು ಬದಲಿಸುವ ಕೆಲಸ ಮಾಡುತ್ತದೆ. ಹೊರಗಿನ ವೀಕ್ಷಣೆ `showSheet` `true` ಆಗಿದೆಯೇ ಎಂದು ನೋಡಿ `Sheet` ಪಾಪ್ ಅಪ್ ಮಾಡುವ ಜವಾಬ್ದಾರಿ ವಹಿಸುತ್ತದೆ.

## ಆಯ್ಕೆಯ ಮೌಲ್ಯಕ್ಕೆ Sheet ಅನ್ನು ಬಾಂಡ್ ಮಾಡುವುದು

ಹಿಂದೆ ನಾವು ಕಲಿತ ಬರವಣಿಗೆ ಹೀಗಿತ್ತು:

```swift
.sheet(isPresented: $showSheet) {
    Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
}
```

ಈ ಬರವಣಿಗೆ ಒಂದು ಸ್ಥಿರ ಪುಟದ ತೋರಿಕೆ ಮತ್ತು ಮರೆಯಾಗುವಿಕೆಯನ್ನು ನಿಯಂತ್ರಿಸಲು ಸೂಕ್ತವಾಗಿದೆ.

ಆದರೆ ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ ಉದಾಹರಣೆಯಲ್ಲಿ, ನಾವು ಕೇವಲ “`Sheet` ಪಾಪ್ ಅಪ್ ಆಗಬೇಕೇ ಬೇಡವೇ” ಎನ್ನುವುದನ್ನು ಮಾತ್ರ ತಿಳಿದುಕೊಳ್ಳಬೇಕಿಲ್ಲ. “ಯಾವ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಲಾಗಿದೆ” ಎಂಬುದನ್ನೂ ತಿಳಿದುಕೊಳ್ಳಬೇಕು.

ಉದಾಹರಣೆಗೆ:

ಬಳಕೆದಾರರು ಡಾಲ್ಫಿನ್ ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, `Sheet` ನಲ್ಲಿ ಡಾಲ್ಫಿನ್ ವಿವರಗಳು ತೋರಬೇಕು.

ಬಳಕೆದಾರರು ಪಾಂಡಾ ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, `Sheet` ನಲ್ಲಿ ಪಾಂಡಾ ವಿವರಗಳು ತೋರಬೇಕು.

ಆದ್ದರಿಂದ, ಇಲ್ಲಿ ಮತ್ತೊಂದು Sheet ಬರವಣಿಗೆ ಹೆಚ್ಚು ಸೂಕ್ತವಾಗಿದೆ:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet ನಲ್ಲಿ ತೋರಿಸುವ ವಿಷಯ
}
```

ಈ ಕೋಡ್‌ನಲ್ಲಿ, `Sheet` ಒಂದು ಆಯ್ಕೆಯ ಮೌಲ್ಯ `selectedAnimal` ಗೆ ಬಾಂಡ್ ಆಗಿದೆ.

ಇಲ್ಲಿ ಗಮನಿಸಬೇಕಾದುದು: `item:` ನಂತರ ಬರೆಯಬೇಕಾದುದು `$selectedAnimal`, `selectedAnimal` ಅಲ್ಲ.

ಏಕೆಂದರೆ `Sheet` ಕೇವಲ `selectedAnimal` ಮೌಲ್ಯವನ್ನು ಓದುವುದಲ್ಲ; ಅದರ ಬದಲಾವಣೆಯನ್ನು ಆಧರಿಸಿ ಪಾಪ್ ಅಪ್ ಆಗಬೇಕೇ ಬೇಡವೇ ಎಂಬುದನ್ನೂ ನಿರ್ಧರಿಸಬೇಕು.

ಈ ಕೋಡ್ ಅನ್ನು ಹೀಗೆ ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಬಹುದು:

- `selectedAnimal` `nil` ಆಗಿರುವಾಗ, `Sheet` ಪ್ರದರ್ಶವಾಗುವುದಿಲ್ಲ.
- `selectedAnimal` ಗೆ ಮೌಲ್ಯ ಇದ್ದಾಗ, `Sheet` ಪ್ರದರ್ಶವಾಗುತ್ತದೆ.
- `Sheet` ಮುಚ್ಚಿದಾಗ, SwiftUI `selectedAnimal` ಅನ್ನು ಮತ್ತೆ `nil` ಆಗಿ ಬದಲಿಸುತ್ತದೆ.

SwiftUI `selectedAnimal` ನಲ್ಲಿ ಉಳಿದಿರುವ ಪ್ರಾಣಿಯನ್ನು ಕೊಕ್ಕುಗಳಲ್ಲಿರುವ `animal` ಗೆ ಕಳುಹಿಸುತ್ತದೆ.

ಅಂದರೆ, `.sheet(item:)` ಕೇವಲ ಪಾಪ್ ಅಪ್ ನಿಯಂತ್ರಿಸುವುದಲ್ಲ, ಆಯ್ಕೆಯಾದ ಡೇಟಾವನ್ನೂ `Sheet` ಒಳಗೆ ಕಳುಹಿಸುತ್ತದೆ.

## Sheet ಬಳಸಿ ಪ್ರಾಣಿಯ ಹೆಸರನ್ನು ಪ್ರದರ್ಶಿಸುವುದು

ಈಗ ನಾವು ಇನ್ನೂ ಸಂಕೀರ್ಣವಾದ ವಿವರ ವೀಕ್ಷಣೆಯನ್ನು ತಕ್ಷಣ ಸೃಷ್ಟಿಸಬೇಡ.

ಕೋಡ್ ಸುಲಭವಾಗಿ ಅರ್ಥವಾಗಲು, ಮೊದಲು `Sheet` ನಲ್ಲಿ ಪ್ರಸ್ತುತ ಪ್ರಾಣಿಯ ಹೆಸರನ್ನು ತೋರಿಸೋಣ.

`VStack` ಹೊರಗೆ `.sheet(item:)` ಸೇರಿಸಿ:

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

ಇಲ್ಲಿ ಅತ್ಯಂತ ಮುಖ್ಯವಾದುದು ಈ ಕೋಡ್:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal` ಗೆ ಮೌಲ್ಯ ಇದ್ದಾಗ, `Sheet` ಪಾಪ್ ಅಪ್ ಆಗುತ್ತದೆ.

ಕೊಕ್ಕುಗಳಲ್ಲಿರುವ `animal` ಪ್ರಸ್ತುತ ಆಯ್ಕೆಯಾದ ಪ್ರಾಣಿ.

ಆದ್ದರಿಂದ:

```swift
Text(animal.name)
```

ಪ್ರಸ್ತುತ ಕ್ಲಿಕ್ ಮಾಡಿದ ಪ್ರಾಣಿಯ ಹೆಸರನ್ನು ತೋರಿಸುತ್ತದೆ.

ಉದಾಹರಣೆಗೆ, `Dolphin` ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, Sheet ನಲ್ಲಿ `Dolphin` ತೋರಿಸುತ್ತದೆ.

`Panda` ಕ್ಲಿಕ್ ಮಾಡಿದರೆ, `Sheet` ನಲ್ಲಿ `Panda` ತೋರಿಸುತ್ತದೆ.

ಈ ರೀತಿಯಾಗಿ, ಬೇರೆ ಬೇರೆ ಪ್ರಾಣಿಗಳನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ ಬೇರೆ ಬೇರೆ ಪ್ರಾಣಿಯ ಹೆಸರು ಪಾಪ್ ಅಪ್ ಆಗುವ ಪರಿಣಾಮವನ್ನು ನಾವು ಸಾಧಿಸಿದ್ದೇವೆ.

ಪ್ರಾಣಿಯ ಹೆಸರನ್ನು ಪ್ರದರ್ಶಿಸುವುದು:

![view](../../../Resource/029_view5.png)

ಆದರೆ, ಪ್ರಾಣಿ ವಿವರಗಳು ಕೇವಲ ಒಂದು ಹೆಸರನ್ನು ಮಾತ್ರ ತೋರಿಸಬಾರದು. ಹೆಸರು, ವಿತರಣಾ ಪ್ರದೇಶ, ವಾಸಸ್ಥಳ ಮತ್ತು ವಿವರಣೆಗಳನ್ನು ತೋರಿಸಬೇಕು.

ಈ ಎಲ್ಲ ಕೋಡ್‌ಗಳನ್ನು `.sheet` ಒಳಗೆ ಬರೆದರೆ, ಕೋಡ್ ತುಂಬಾ ದೀರ್ಘವಾಗುತ್ತದೆ ಮತ್ತು ಓದಲು ಅನುಕೂಲಕರವಾಗುವುದಿಲ್ಲ.

ಆದ್ದರಿಂದ, ಮುಂದಾಗಿ ನಾವು ಪ್ರಾಣಿ ವಿವರಗಳನ್ನು ಪ್ರದರ್ಶಿಸುವ ಜವಾಬ್ದಾರಿಯಿರುವ ಹೊಸ ಕಸ್ಟಮ್ ವೀಕ್ಷಣೆಯನ್ನು ಸೃಷ್ಟಿಸುತ್ತೇವೆ.

## ಪ್ರಾಣಿ ವಿವರ ವೀಕ್ಷಣೆಯನ್ನು ಸೃಷ್ಟಿಸುವುದು

ಮುಂದೆ, ನಾವು `AnimalDetailView` ಎನ್ನುವ ಹೊಸ ಕಸ್ಟಮ್ ವೀಕ್ಷಣೆಯನ್ನು ಸೃಷ್ಟಿಸುತ್ತೇವೆ.

ಈ ವೀಕ್ಷಣೆ ಒಂದು `Animal` ಸ್ವೀಕರಿಸುತ್ತದೆ ಮತ್ತು ಪ್ರಾಣಿ ವಿವರಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ.

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
                    Text("**ವಿತರಣಾ ಪ್ರದೇಶ**: \(animal.distributionArea)")

                    Divider()

                    Text("**ವಾಸಸ್ಥಳ**: \(animal.habitat)")

                    Divider()

                    Text("**ಪ್ರಾಣಿ ವಿವರಣೆ**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ಪ್ರದರ್ಶನ ಫಲಿತಾಂಶ:

![view](../../../Resource/029_view2.png)

ಇಲ್ಲಿ ಮುಖ್ಯವಾದುದು:

```swift
var animal: Animal
```

ಇದು `AnimalDetailView` ಹೊರಗಿನಿಂದ ಒಂದು ಪ್ರಾಣಿಯನ್ನು ಸ್ವೀಕರಿಸಬೇಕು ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

ಪ್ರಾಣಿಯನ್ನು ಸ್ವೀಕರಿಸಿದ ನಂತರ, ವಿವರ ವೀಕ್ಷಣೆ ಆ ಪ್ರಾಣಿಯ ವಿವಿಧ ಮಾಹಿತಿಯನ್ನು ಬಳಸಬಹುದು:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

ಅಂದರೆ, `AnimalDetailView` ಕೇವಲ ಒಳಬಂದ ಪ್ರಾಣಿಯನ್ನು ಪ್ರದರ್ಶಿಸುವ ಜವಾಬ್ದಾರಿ ಮಾತ್ರ ವಹಿಸುತ್ತದೆ.

### Markdown ದಪ್ಪ ಅಕ್ಷರ

ವಿವರ ವೀಕ್ಷಣೆಯಲ್ಲಿ, ನಾವು ಇಂತಹ ಕೋಡ್ ಬರೆದಿದ್ದೇವೆ:

```swift
Text("**ವಾಸಸ್ಥಳ:** \(animal.habitat)")
```

ಇಲ್ಲಿ ಎರಡು ಜ್ಞಾನಾಂಶಗಳಿವೆ.

ಮೊದಲದು, `**ವಾಸಸ್ಥಳ:**` `Markdown` ವ್ಯಾಕರಣವನ್ನು ಬಳಸುತ್ತದೆ. ಎರಡು ನಕ್ಷತ್ರಗಳ ನಡುವೆ ಇರುವಪಠ್ಯ ದಪ್ಪವಾಗಿ ತೋರಿಸಲಾಗುತ್ತದೆ.

ಎರಡನೆಯದು, `\()` ಎಂಬುದು ಸ್ಟ್ರಿಂಗ್ ಇಂಟರ್‌ಪೊಲೇಷನ್. ಇದು ಚರದ ಮೌಲ್ಯವನ್ನು ಪಠ್ಯದಲ್ಲಿ ತೋರಿಸಬಹುದು.

ಈ ಕೋಡ್ ಮೊದಲು ದಪ್ಪವಾದ `ವಾಸಸ್ಥಳ:` ಅನ್ನು ತೋರಿಸಿ, ನಂತರ ಈ ಪ್ರಾಣಿಯ ವಾಸಸ್ಥಳವನ್ನು ತೋರಿಸುತ್ತದೆ.

## Sheet ನಲ್ಲಿ ವಿವರ ವೀಕ್ಷಣೆಯನ್ನು ಪ್ರದರ್ಶಿಸುವುದು

`AnimalDetailView` ಸೃಷ್ಟಿಸಿದ ನಂತರ, ನಾವು ಮತ್ತೆ `ContentView` ಗೆ ಹೋಗಿ, `Sheet` ಒಳಗಿನ ಮೂಲ ಹೆಸರು ವೀಕ್ಷಣೆಯನ್ನು ವಿವರ ವೀಕ್ಷಣೆಯಿಂದ ಬದಲಾಯಿಸಬಹುದು.

ಮೂಲವಾಗಿ ಹೀಗಿತ್ತು:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ಈಗ ಹೀಗೆ ಬದಲಾಯಿಸಿ:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ಇಲ್ಲಿನ `animal:` ಎನ್ನುವುದು `AnimalDetailView` ನ ಪ್ಯಾರಾಮೀಟರ್ ಹೆಸರು.

ಹಿಂದಿನ `animal` `.sheet(item:)` ಮೂಲಕ ಬಂದಿರುವ ಪ್ರಸ್ತುತ ಪ್ರಾಣಿ.

ಅಂದರೆ ಪ್ರಸ್ತುತ ಕ್ಲಿಕ್ ಮಾಡಿದ ಪ್ರಾಣಿಯನ್ನು `AnimalDetailView` ಗೆ ಪ್ರದರ್ಶನಕ್ಕಾಗಿ ಕಳುಹಿಸುವುದು.

ಸಂಪೂರ್ಣ ರಚನೆ:

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

ಬಳಕೆದಾರರು ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ:

```swift
selectedAnimal = animal
```

`selectedAnimal` `nil` ಇಂದ ನಿರ್ದಿಷ್ಟ ಪ್ರಾಣಿಯಾಗಿ ಬದಲಾಗುತ್ತದೆ. `Sheet` `selectedAnimal` ಗೆ ಮೌಲ್ಯ ಇದೆ ಎಂದು ಕಂಡಾಗ ವೀಕ್ಷಣೆಯನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡುತ್ತದೆ.

`Sheet` `selectedAnimal` ನಲ್ಲಿರುವ ಪ್ರಾಣಿಯನ್ನು `AnimalDetailView` ವೀಕ್ಷಣೆಗೆ ಕಳುಹಿಸುತ್ತದೆ. `AnimalDetailView` ಪ್ರಾಣಿ ವಿವರಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ.

ಹೀಗೆ, ನಾವು ಪ್ರಾಣಿ ಪಟ್ಟಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ ಸಂಬಂಧಿತ ಪ್ರಾಣಿ ವಿವರಗಳು ಪಾಪ್ ಅಪ್ ಆಗುವ ಕಾರ್ಯವನ್ನು ಸಾಧಿಸಿದ್ದೇವೆ.

## Sheet ನ ಎರಡು ಬರವಣಿಗೆಗಳ ವ್ಯತ್ಯಾಸ

ಈಗ, `.sheet(item:)` ಬಳಸಿ ಪ್ರಾಣಿ ವಿವರ ವೀಕ್ಷಣೆಯ ಪ್ರದರ್ಶನವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

ಇಲ್ಲಿ `Sheet` ನ ಎರಡು ಸಾಮಾನ್ಯ ಬರವಣಿಗೆಗಳನ್ನು ಸರಳವಾಗಿ ಸಂಕ್ಷಿಪ್ತಗೊಳಿಸಬಹುದು.

### ಮೊದಲದು ಬುಲಿಯನ್ ಮೌಲ್ಯಕ್ಕೆ ಬಾಂಡ್ ಮಾಡುವುದು

```swift
@State private var showSheet = false

Button("ಶೀಟ್ ತೋರಿಸಿ") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("ಶೀಟ್ ವೀಕ್ಷಣೆ")
}
```

ಈ ಬರವಣಿಗೆ ಸ್ಥಿರ ವಿಷಯವನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಲು ಸೂಕ್ತವಾಗಿದೆ. ಉದಾಹರಣೆಗೆ ಸೆಟ್ಟಿಂಗ್ ಪುಟ, ವಿವರಣೆ ಪುಟ, ಸೂಚನೆ ಪುಟ ಇತ್ಯಾದಿ.

`showSheet` ಒಂದು ಬುಲಿಯನ್ ಮೌಲ್ಯ. ಅದಕ್ಕೆ `true` ಮತ್ತು `false` ಎಂಬ ಎರಡು ಸ್ಥಿತಿಗಳಷ್ಟೇ ಇವೆ.

`showSheet` `true` ಆಗಿರುವಾಗ, `Sheet` ಪ್ರದರ್ಶವಾಗುತ್ತದೆ.

`showSheet` `false` ಆಗಿರುವಾಗ, `Sheet` ಪ್ರದರ್ಶವಾಗುವುದಿಲ್ಲ.

### ಎರಡನೆಯದು ಆಯ್ಕೆಯ ಮೌಲ್ಯಕ್ಕೆ ಬಾಂಡ್ ಮಾಡುವುದು

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ಈ ಬರವಣಿಗೆ ಆಯ್ಕೆಯಾದ ಡೇಟಾವನ್ನು ಆಧರಿಸಿ ಬೇರೆ ಬೇರೆ ವಿಷಯವನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಲು ಸೂಕ್ತವಾಗಿದೆ.

ಈ ಪಾಠದಲ್ಲಿ, ನಾವು ಬೇರೆ ಬೇರೆ ಪ್ರಾಣಿಗಳನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ ಬೇರೆ ಬೇರೆ ಪ್ರಾಣಿಯ ವಿವರಗಳನ್ನು ತೋರಿಸಬೇಕಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ `.sheet(item:)` ಬಳಸುವುದು ಹೆಚ್ಚು ಸೂಕ್ತ.

## ಸಂಪೂರ್ಣ ಕೋಡ್

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // ಪ್ರಾಣಿಯ ಹೆಸರು
    let name: String
    
    // ಪ್ರಾಣಿಯ ಚಿತ್ರ
    let imageName: String
    
    // ಪ್ರಾಣಿಯ ಟ್ಯಾಗ್ ಸಂಕೇತ
    let avatarEmoji: String
    
    // ವಿತರಣಾ ಪ್ರದೇಶ
    let distributionArea: String
    
    // ವಾಸಸ್ಥಳ
    let habitat: String
    
    // ಪ್ರಾಣಿಯ ವಿವರಣೆ
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // ಡಾಲ್ಫಿನ್
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ಜಿರಾಫೆ
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // ಸಿಂಹ
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // ಪಾಂಡಾ
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // ಧ್ರುವ ಕರಡಿ
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
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
                    Text("**ವಿತರಣಾ ಪ್ರದೇಶ**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**ವಾಸಸ್ಥಳ**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**ಪ್ರಾಣಿ ವಿವರಣೆ**: \(animal.animalDescription)")
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

## ಸಾರಾಂಶ

ಈ ಪಾಠದಲ್ಲಿ ಸರಳವಾದ ಪ್ರಾಣಿ ವಿಶ್ವಕೋಶ ಪುಟವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ.

ಮೊದಲು `Animal` ರಚನೆಯನ್ನು ಬಳಸಿ ಪ್ರಾಣಿ ಮಾಹಿತಿಯನ್ನು ಉಳಿಸಿದ್ದೇವೆ. ನಂತರ ಅರೇ ಬಳಸಿ ಐದು ಪ್ರಾಣಿಗಳನ್ನು ಉಳಿಸಿ, `ForEach` ಬಳಸಿ ಪ್ರಾಣಿ ಪಟ್ಟಿಯನ್ನು ಪ್ರದರ್ಶಿಸಿದ್ದೇವೆ.

ಬಳಕೆದಾರರು ಯಾವುದಾದರೂ ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದಾಗ, ನಾವು ಆ ಪ್ರಾಣಿಯನ್ನು `selectedAnimal` ನಲ್ಲಿ ಉಳಿಸುತ್ತೇವೆ:

```swift
selectedAnimal = animal
```

`selectedAnimal` ಗೆ ಮೌಲ್ಯ ಇದ್ದಾಗ, `.sheet(item:)` ವಿವರ ವೀಕ್ಷಣೆಯನ್ನು ಪಾಪ್ ಅಪ್ ಮಾಡಿ, ಆಯ್ಕೆಯಾದ ಪ್ರಾಣಿಯನ್ನು `AnimalDetailView` ಗೆ ಕಳುಹಿಸುತ್ತದೆ.

ಈ ಪಾಠದಲ್ಲಿ ಅತ್ಯಂತ ಮುಖ್ಯವಾದುದು ಇಂಟರ್ಫೇಸ್ ಶೈಲಿ ಅಲ್ಲ, ಈ ಡೇಟಾ ಪಾಸ್ ಮಾಡುವ ಮಾರ್ಗವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು:

```swift
ಪ್ರಾಣಿಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ → selectedAnimal ನಲ್ಲಿ ಪ್ರಾಣಿ ಉಳಿಯುತ್ತದೆ → Sheet ಪಾಪ್ ಅಪ್ ಆಗುತ್ತದೆ → AnimalDetailView ವಿವರಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
```

ಈ ಮಾರ್ಗವನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಂಡ ನಂತರ, ಮುಂದೆ ಉತ್ಪನ್ನ ವಿವರ, ಕೋರ್ಸ್ ವಿವರ, ಲೇಖನ ವಿವರ, ಸಂಪರ್ಕ ವಿವರಗಳಂತಹ ಇನ್ನಷ್ಟು ಹೋಲುವ ಕಾರ್ಯಗಳನ್ನು ನಿರ್ಮಿಸಬಹುದು.
