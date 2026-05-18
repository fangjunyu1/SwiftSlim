# 동물 데이터 정리하기

지난 수업에서는 간단한 동물 백과사전 예제를 완성했습니다.

![view](../../../Resource/029_view.png)

사용자가 어떤 동물을 클릭하면, 페이지는 `Sheet`를 통해 동물 상세 정보를 팝업으로 표시합니다.

하지만 지난 수업의 코드에는 한 가지 문제가 있었습니다. 동물 데이터가 `ContentView` 안에 직접 작성되어 있었습니다.

예를 들면 다음과 같습니다.

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 동물 목록 표시
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

이 코드는 정상적으로 실행될 수 있지만, 동물 데이터가 점점 많아지면 `ContentView`가 매우 길어집니다.

`ContentView`는 원래 주로 화면을 표시하는 역할을 해야 하지만, 지금은 많은 동물 데이터까지 저장하고 있습니다. 이렇게 되면 코드를 읽기 어려워지고, 이후 유지보수도 불편해집니다.

따라서 이번 수업에서는 한 가지 일을 하려고 합니다.

동물 데이터를 `ContentView`에서 분리해 정리합니다.

## 왜 데이터를 분리해야 할까요?

SwiftUI에서 뷰 코드는 보통 화면을 표시하는 역할을 합니다.

예를 들면 다음과 같습니다.

```swift
Text("Dolphin")
Image("dolphin")
```

이 코드들은 모두 화면 표시와 관련이 있습니다.

하지만 동물 데이터 자체, 예를 들어 동물 이름, 이미지 이름, 분포 지역, 서식지, 설명 텍스트는 화면 구조가 아닙니다.

이 데이터들은 고정된 자료 묶음에 더 가깝습니다.

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

화면 코드와 데이터 코드를 모두 한곳에 작성하면, 코드는 점점 더 복잡해집니다.

그래서 동물 데이터를 `Animal` 타입 안에 넣을 수 있습니다.

## static으로 고정 데이터 저장하기

먼저 정리한 뒤의 작성 방식을 살펴보겠습니다.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

여기에는 새로운 코드 한 줄이 추가되었습니다.

```swift
static let animals: [Animal] = [
    
]
```

`static`은 정적 속성을 의미합니다.

정적 속성은 특정한 하나의 인스턴스에 속하지 않고, 타입 자체에 속합니다.

이 말은 조금 추상적이므로, 간단한 예제로 이해해 보겠습니다.

## 일반 속성과 정적 속성

예를 들어 `Student`를 하나 정의합니다.

```swift
struct Student {
    let name: String
}
```

여기서 `name`은 일반 속성이며, 일반 속성은 특정한 하나의 인스턴스에 속합니다.

`name`에 접근하려면 먼저 구체적인 학생을 하나 만들어야 합니다.

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

여기서 `student`는 하나의 인스턴스이며, 먼저 구체적인 학생 데이터 한 개로 이해해도 됩니다.

학생마다 이름이 다를 수 있으므로, `name`은 반드시 구체적인 학생에 속해야 합니다.

하지만 어떤 데이터는 특정한 하나의 인스턴스에 속하지 않습니다.

예를 들어 미리보기용 예제 데이터 묶음을 준비하려고 한다고 가정해 보겠습니다.

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

여기서 `previewStudents` 앞에는 `static`이 있으므로, 이것은 정적 속성입니다.

정적 속성은 어떤 한 학생에 속하지 않고, `Student`라는 타입 자체에 속합니다.

따라서 어떤 학생을 먼저 만들 필요 없이, 타입 이름을 통해 바로 접근할 수 있습니다.

```swift
print(Student.previewStudents.count)    // 3
```

여기서 접근 방식은 다음과 같습니다.

```swift
타입이름.정적속성이름
```

즉 다음과 같습니다.

```swift
Student.previewStudents
```

마찬가지로 동물 백과사전에서는 다음과 같이 동물 데이터에 접근할 수 있습니다.

```swift
Animal.animals
```

## ContentView로 돌아가기

이제 동물 데이터는 이미 `Animal` 타입 안에 저장되었습니다.

그래서 `ContentView` 안에 긴 동물 배열을 다시 작성할 필요가 없습니다.

다음과 같이 바꿀 수 있습니다.

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 동물 목록 표시
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

이 코드 한 줄은 다음을 의미합니다.

```swift
let animals = Animal.animals
```

`Animal` 타입에서 `animals`라는 동물 데이터 묶음을 가져와 현재 뷰의 `animals` 상수에 저장합니다.

이렇게 작성하면 `ContentView`가 더 간결해집니다.

`ContentView`는 화면 표시를 담당하고, `Animal.animals`는 동물 데이터 제공을 담당합니다.

## Animal을 별도 파일로 분리하기

지난 수업에서는 예제를 더 쉽게 이해할 수 있도록 `Animal`과 `ContentView`를 같은 파일에 작성했습니다.

당시에는 코드가 많지 않았기 때문에 이렇게 작성해도 문제가 없었습니다.

하지만 이제 동물 데이터가 점점 많아지고 있습니다. 모든 코드를 계속 `ContentView.swift` 안에 작성하면 파일이 매우 길어지고 읽기도 불편해집니다.

그래서 `Animal`을 새로운 Swift 파일에 따로 넣을 수 있습니다.

Xcode에서 새로운 Swift 파일을 만들 수 있습니다. 예를 들면 다음과 같습니다.

```swift
Animal.swift
```

그다음 `Animal` 구조체를 이 파일로 이동합니다.

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

이렇게 정리하면 다음과 같습니다.

`ContentView.swift`는 화면 표시를 담당합니다.

`Animal.swift`는 동물 데이터의 구조를 설명하는 역할을 합니다.

두 파일이 서로 다른 파일에 있어도, 같은 프로젝트 안에 있기만 하면 `ContentView`는 여전히 `Animal`을 바로 사용할 수 있습니다.

예를 들면 다음과 같습니다.

```swift
let animals = Animal.animals
```

여기서는 `ContentView.swift` 안에서 `Animal.swift`를 추가로 import할 필요가 없습니다.

Swift는 같은 프로젝트 안의 Swift 파일을 자동으로 인식합니다.

## extension으로 코드 계속 정리하기

이제 동물 데이터를 `ContentView`에서 `Animal` 안으로 옮겼습니다.

하지만 `Animal` 구조체 안에는 여전히 두 종류의 코드가 함께 들어 있습니다.

첫 번째는 동물 모델 자체의 속성입니다.

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

두 번째는 고정된 동물 데이터입니다.

```swift
static let animals: [Animal] = [
    // ...
]
```

코드 구조를 더 명확하게 만들기 위해 `extension`을 사용해서 이 두 부분을 분리할 수 있습니다.

`extension`은 확장을 의미합니다.

기존 타입을 기반으로 새로운 코드를 계속 추가할 수 있습니다.

예를 들면 다음과 같습니다.

```swift
extension Animal {
    
}
```

이것은 우리가 `Animal` 타입을 확장하고 있다는 의미입니다.

## 동물 데이터를 extension 안에 넣기

`Animal`을 다음과 같이 바꿀 수 있습니다.

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

이렇게 정리하면 코드 구조가 더 명확해집니다.

`struct Animal`은 하나의 동물이 어떤 속성을 가져야 하는지 설명하는 역할을 합니다.

`extension Animal`은 고정된 동물 데이터 묶음을 저장하는 역할을 합니다.

주의할 점은, `animals`가 `extension Animal` 안으로 이동했지만 사용 방식은 변하지 않는다는 것입니다.

여전히 다음과 같이 사용할 수 있습니다.

```swift
let animals = Animal.animals
```

이것도 `extension`의 특징 중 하나입니다. 코드를 정리하는 데 도움을 줄 뿐, 외부에서 호출하는 방식은 바꾸지 않습니다.

## 데이터가 많을 때는 AnimalData 파일을 다시 만들 수 있습니다

이제 `Animal`은 별도의 `Animal.swift` 파일에 들어 있습니다.

동물 데이터가 적다면 `extension Animal`도 `Animal.swift` 안에 바로 작성할 수 있습니다.

하지만 동물 데이터가 점점 많아진다면, 예를 들어 다음과 같은 파일을 하나 더 만들 수도 있습니다.

```swift
AnimalData.swift
```

그다음 고정 동물 데이터를 그 안에 넣습니다.

```swift
extension Animal {
    static let animals: [Animal] = [
        // 동물 데이터
    ]
}
```

이렇게 하면 코드의 역할 분담이 더 명확해집니다.

`Animal.swift`는 동물 모델 정의만 담당합니다.

`AnimalData.swift`는 동물 데이터 저장만 담당합니다.

`ContentView.swift`는 화면 표시만 담당합니다.

각 파일의 책임이 더 명확해집니다.

주의할 점은, `AnimalData.swift`는 파일 이름일 뿐 새로운 Swift 타입이 아니라는 것입니다. 이 파일 안에서도 여전히 `extension Animal`을 통해 `Animal`에 고정 데이터를 추가합니다.

## 전체 코드

아래는 정리한 뒤의 `Animal.swift` 코드입니다.

```swift
import Foundation

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

정리한 뒤의 `AnimalData.swift` 코드입니다.

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

`ContentView.swift`에서는 다음과 같이 사용할 수 있습니다.

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
```

참고: `Animal.swift`와 `AnimalData.swift` 파일의 첫 번째 줄에는 모두 다음을 작성했습니다.

```swift
import Foundation
```

이전에 SwiftUI 화면을 작성할 때는 자주 다음을 사용했습니다.

```swift
import SwiftUI
```

그 이유는 `ContentView`, `Text`, `Button`, `Color` 같은 내용이 모두 화면과 관련되어 있기 때문입니다. 그래서 화면 파일을 작성할 때는 보통 SwiftUI를 import해야 합니다.

하지만 여기의 `Animal.swift`와 `AnimalData.swift`는 화면 파일이 아닙니다. 이 파일들은 주로 동물 모델을 정의하고 동물 데이터를 저장하는 데 사용됩니다.

이 코드에서는 `UUID()`를 사용하려면 `Foundation`이 필요하므로, `Foundation`만 import하면 됩니다.

## 정리

이번 수업에서는 주로 한 가지 일을 했습니다. 동물 데이터를 `ContentView`에서 분리해 정리했습니다.

기존 작성 방식은 동물 데이터를 `ContentView` 안에 직접 작성하는 것이었습니다. 이렇게 해도 코드는 실행될 수 있지만, 데이터가 많아지면 뷰 파일이 점점 길어집니다.

정리한 뒤에는 `ContentView`가 화면 표시만 담당하고, `Animal.animals`가 동물 데이터 제공을 담당합니다.

이번 수업에서는 두 가지 새로운 지식도 배웠습니다.

첫 번째는 `static`입니다.

`static`은 정적 속성을 의미합니다. 정적 속성은 타입 자체에 속하며, “타입이름.속성이름” 방식으로 바로 접근할 수 있습니다.

예를 들면 다음과 같습니다.

```swift
Animal.animals
```

두 번째는 `extension`입니다.

`extension`은 확장을 의미합니다. 같은 타입의 코드를 나누어 작성할 수 있어 코드 구조를 더 명확하게 만들 수 있습니다.

이 예제에서는 `extension Animal`을 사용해 동물 데이터를 저장하여, `Animal` 구조체 자체를 더 간결하게 만들었습니다.

또한 `Animal`은 주로 데이터 모델을 저장하고 SwiftUI 화면을 직접 작성하지 않으므로, 여기서는 `import Foundation`을 사용합니다.

이번 수업의 핵심은 코드를 더 복잡하게 만드는 것이 아니라, 코드를 더 읽기 쉽고 유지보수하기 쉽게 만드는 것입니다.
