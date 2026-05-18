# 사용자 정의 색상

이번 수업에서는 SwiftUI에서 색상을 사용자 정의하는 방법을 배웁니다.

앞선 수업에서 우리는 SwiftUI가 제공하는 기본 색상을 이미 사용해 보았습니다. 예를 들면 다음과 같습니다.

```swift
Color.blue
Color.red
Color.green
```

이 색상들은 사용하기 편리하지만, 실제 App 개발에서는 기본 색상만으로는 보통 충분히 정확하지 않습니다.

예를 들어, 디자인 시안에서는 다음과 같은 색상을 사용할 수 있습니다.

```text
#2c54c2
#4875ed
#213e8d
```

이런 색상을 Hex 색상이라고 합니다.

이번 수업에서는 먼저 SwiftUI가 Hex 색상을 지원하도록 만든 다음, `static`을 사용해 자주 쓰는 색상을 정리합니다.

마지막으로, 사용자 정의 색상을 동물 백과 화면에 적용하고, 그라데이션 배경을 더 사용해 버튼이 더 입체적으로 보이도록 만듭니다.

## 왜 사용자 정의 색상이 필요할까요?

SwiftUI에서는 시스템 색상을 바로 사용할 수 있습니다.

예를 들면 다음과 같습니다.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

여기서 `.blue`는 파란색을 의미하며, 실제로는 `Color.blue`의 축약형입니다.

기본 색상의 장점은 단순하고 편리하다는 점이지만, 선택할 수 있는 색상이 비교적 제한적입니다.

예를 들면 다음과 같습니다.

```swift
Color.blue
```

이 코드는 SwiftUI가 제공하는 기본 파란색만 나타낼 수 있습니다.

![Color.blue](../../../Resource/031_color6.png)

하지만 실제 개발에서는 더 구체적인 색상이 자주 필요합니다.

예를 들어, 같은 파란색이라도 연한 파란색, 진한 파란색, 회청색, 밝은 파란색 등 서로 다른 효과가 있을 수 있습니다.

![More Blue](../../../Resource/031_color5.png)

이때 `Color.blue`만 사용하면 디자인 효과를 그대로 재현하기 어렵습니다.

따라서 SwiftUI가 사용자 정의 색상을 지원하도록 만들어야 합니다.

## Hex 색상이란 무엇일까요?

화면의 색상은 보통 빨강, 초록, 파랑 세 채널로 구성되며, 이것을 RGB라고 합니다.

RGB는 각각 다음을 의미합니다.

```text
Red     // 빨간색
Green   // 초록색
Blue    // 파란색
```

Hex 색상은 RGB 색상을 표현하는 한 가지 방식입니다.

예를 들면 다음과 같습니다.

```swift
#5479FF
```

이 색상 값은 간단히 세 부분으로 이해할 수 있습니다.

```text
54  // 빨간색 채널을 나타냄
79  // 초록색 채널을 나타냄
FF  // 파란색 채널을 나타냄
```

이번 수업에서는 이 숫자들을 계산할 필요도 없고, 16진수 규칙을 깊이 이해할 필요도 없습니다.

지금은 `#5479FF`가 하나의 구체적인 색상을 나타낸다는 것만 알면 됩니다.

앞으로 `#2c54c2`, `#4875ed` 같은 표기를 보면, 먼저 하나의 색상 값으로 이해하면 됩니다.

Sketch, Figma, Photoshop 같은 디자인 도구에서도 이런 색상 값을 자주 볼 수 있습니다.

![color](../../../Resource/031_color.png)

하지만 SwiftUI에서는 기본적으로 다음처럼 직접 작성할 수 없습니다.

```swift
Color(hex: "#5479FF")
```

그래서 `Color` 타입을 직접 확장하여 Hex 문자열로 색상을 만들 수 있도록 해야 합니다.

## Color+Hex.swift 파일 만들기

먼저 새로운 Swift 파일을 만듭니다.

파일 이름은 다음처럼 작성할 수 있습니다.

```text
Color.swift
```

또는 더 명확하게 다음처럼 작성할 수도 있습니다.

```text
Color+Hex.swift
```

여기서는 다음 이름을 더 추천합니다.

```text
Color+Hex.swift
```

Swift 프로젝트에서는 `Color+Hex.swift`와 같은 파일 이름이 흔히 사용됩니다.

이 이름은 이 파일이 `Color`에 Hex 기능을 추가하는 확장 파일이라는 의미입니다.

파일 이름이 코드 실행에 직접 영향을 주지는 않지만, 이 파일의 용도를 더 쉽게 이해할 수 있게 해 줍니다.

## Color(hex:) 코드 추가하기

`Color+Hex.swift` 파일에 아래 코드를 작성합니다.

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

이 코드는 `extension`을 사용해 `Color` 타입을 확장하고, `Color`에 새로운 초기화 메서드를 추가합니다.

```swift
init(hex: String)
```

이 초기화 메서드가 있으면 Hex 문자열을 `Color`에 전달해 사용자 정의 색상을 만들 수 있습니다.

```swift
Color(hex: "#5479FF")
```

이 확장 코드 내부에서는 Hex 문자열을 SwiftUI가 인식할 수 있는 RGB 색상으로 변환합니다.

지금 단계에서는 각 변환 로직을 깊이 이해할 필요는 없습니다. 추가한 `Color(hex:)` 메서드를 통해 Hex 색상 값으로 사용자 정의 색상을 만들 수 있다는 점만 이해하면 됩니다.

## 사용자 정의 색상 사용하기

이제 `ContentView`에서 사용자 정의 색상을 테스트할 수 있습니다.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

표시 효과:

![color](../../../Resource/031_color1.png)

이 예시에서 첫 번째 줄은 시스템 색상을 사용합니다.

```swift
.foregroundStyle(Color.blue)
```

뒤의 세 줄은 사용자 정의 Hex 색상을 사용합니다.

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

비교해 보면, 시스템 파란색에는 하나의 기본 효과만 있다는 것을 알 수 있습니다.

반면 Hex 색상은 더 섬세한 파란색 변화를 표현할 수 있습니다.

이것이 사용자 정의 색상의 가치입니다. 화면 색상을 실제 디자인에 더 가깝게 만들 수 있고, App의 시각 스타일도 더 편하게 제어할 수 있습니다.

## static으로 색상 정리하기

이제 우리는 Hex 문자열로 색상을 만들 수 있습니다.

```swift
Color(hex: "#2c54c2")
```

이 방식은 정상적으로 사용할 수 있지만, 같은 색상이 여러 곳에서 반복해서 등장한다면 이후 유지보수가 불편해집니다.

만약 10곳에 모두 이 색상 값을 작성했다면, 나중에 이 파란색을 수정할 때 하나씩 모두 수정해야 합니다.

이때 `static`을 사용해 자주 쓰는 색상을 한곳에 정리할 수 있습니다.

`Color+Hex.swift` 파일 하단에 아래 코드를 계속 추가합니다.

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

여기서는 `Color`에 세 개의 정적 속성인 `animalBlue`, `animalLightBlue`, `animalDarkBlue`를 추가했습니다. 이들은 각각 깊이가 다른 파란색을 나타냅니다.

이 속성들은 `static`을 사용했기 때문에 `Color` 타입 자체에 속합니다.

사용할 때는 `Color.`를 통해 바로 접근할 수 있습니다.

```swift
Color.animalBlue
```

이 방식은 Hex 문자열을 직접 쓰는 것보다 더 명확합니다.

`Color.animalBlue`를 보면, 이것이 동물 백과에서 사용하는 파란색이라는 것을 알 수 있습니다.

반면 `Color(hex: "#2c54c2")`를 보면 하나의 색상 값이라는 것만 알 수 있고, 구체적으로 어디에 쓰이는지는 쉽게 알기 어렵습니다.

색상을 통합 관리하면 또 다른 장점이 있습니다. 나중에 수정하기 더 쉽습니다.

동물 백과의 메인 색상을 조정하고 싶다면 정의 위치만 수정하면 됩니다.

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

이 색상을 사용하는 모든 곳이 함께 업데이트됩니다.

이것이 `static`으로 색상을 정리하는 의미입니다. 색상 이름을 더 명확하게 만들고, 이후 유지보수도 더 편하게 만듭니다.

## 동물 백과에 적용하기

이제 앞에서 만든 사용자 정의 색상을 이전 동물 백과 화면에 적용할 수 있습니다.

이전 동물 버튼의 배경은 흰색이었습니다.

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

이제 사용자 정의 색상으로 바꿀 수 있습니다.

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

여기서 `Color.animalBlue`는 방금 `Color+Hex.swift`에서 정의한 정적 색상입니다.

버튼 텍스트에는 흰색을 사용합니다.

```swift
.foregroundStyle(Color.white)
```

동물 emoji의 배경에는 반투명 흰색을 사용합니다.

```swift
.background(Color.white.opacity(0.15))
```

이렇게 하면 버튼이 통일된 파란색 시각 스타일을 갖게 됩니다.

이 단계의 핵심은 복잡한 코드를 늘리는 것이 아니라, 앞에서 배운 사용자 정의 색상을 실제 화면에 적용하는 것입니다.

## 그라데이션 배경 사용하기

단일 색상을 사용하는 것 외에도, 여러 색상을 조합해 그라데이션 효과를 만들 수 있습니다.

예를 들어 앞에서 정의한 색상은 다음과 같습니다.

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

이 색상들은 단독으로 사용할 수도 있고, 조합해 그라데이션 배경으로 사용할 수도 있습니다.

SwiftUI에서는 `LinearGradient`를 사용해 선형 그라데이션을 만들 수 있습니다.

예를 들면 다음과 같습니다.

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

이 코드는 왼쪽에서 오른쪽으로 이어지는 그라데이션 배경을 만들며, 색상은 `Color.animalBlue`에서 `Color.animalLightBlue`로 점차 전환됩니다.

여기서 `colors`는 그라데이션에 참여하는 색상을 설정하고, `startPoint`와 `endPoint`는 그라데이션 방향을 제어합니다.

### 그라데이션 효과 테스트하기

간단한 Text를 사용해 그라데이션 배경을 테스트할 수 있습니다.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

표시 효과:

![color](../../../Resource/031_color3.png)

이 예시에서 `Text`의 배경은 더 이상 단일 색상이 아니라, 왼쪽에서 오른쪽으로 점차 변하는 그라데이션 색상입니다.

일반 배경색과 비교하면, 그라데이션 배경은 더 입체적이고 화면에 시각적 포인트를 만들기 쉽습니다.

## 동물 백과에서 그라데이션 배경 사용하기

이제 동물 버튼의 배경색을 다음 코드에서:

```swift
.background(Color.animalBlue)
```

그라데이션 배경으로 변경할 수 있습니다.

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

전체 코드는 다음과 같습니다.

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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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

표시 효과:

![color](../../../Resource/031_color4.png)

이제 동물 버튼은 더 이상 단일 배경색만 갖는 것이 아니라, 왼쪽에서 오른쪽으로 이어지는 그라데이션 효과를 갖습니다.

단색 배경과 비교하면, 그라데이션 배경은 화면을 더 입체적으로 보이게 하며 실제 App의 시각 디자인에 더 가깝게 만들어 줍니다.

## 단색 배경과 그라데이션 배경의 차이

단색 배경은 하나의 색상만 사용합니다.

예를 들면 다음과 같습니다.

```swift
.background(Color.animalBlue)
```

이 방식은 단순하고 명확하며, 대부분의 기본 화면에 적합합니다.

그라데이션 배경은 여러 색상을 사용합니다.

예를 들면 다음과 같습니다.

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

이 방식은 화면을 더 입체적으로 만들 수 있지만, 시각적 복잡도도 더 쉽게 높아질 수 있습니다.

따라서 실제 개발에서는 다음처럼 이해하면 됩니다.

단색 배경은 일반 텍스트, 일반 버튼, 일반 카드, 일반 페이지 배경에 적합합니다.

그라데이션 배경은 강조해야 하는 버튼, 상단 영역, 커버 카드, 기능 진입점 등에 적합합니다.

## 정리

이번 수업에서는 SwiftUI에서 사용자 정의 색상을 사용하는 방법을 배웠습니다.

먼저 Hex 색상을 이해했습니다.

예를 들면 다음과 같습니다.

```text
#2c54c2
```

이 값은 하나의 구체적인 색상을 나타냅니다.

그다음 `extension Color`를 사용해 `Color` 타입을 확장했습니다.

SwiftUI가 아래 방식으로 색상을 만들 수 있게 했습니다.

```swift
Color(hex: "#2c54c2")
```

이어서 `static`을 사용해 자주 쓰는 색상을 정리했습니다.

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

이렇게 하면 다른 뷰에서 바로 사용할 수 있습니다.

```swift
Color.animalBlue
```

매번 Hex 문자열을 쓰는 것보다 이 방식이 더 명확하고, 이후 색상을 한곳에서 수정하기도 더 편리합니다.

마지막으로 `LinearGradient`를 배우고, 사용자 정의 색상을 조합해 그라데이션 배경을 만들었습니다.

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

이번 수업을 통해 “사용자 정의 색상 만들기”에서 “실제 화면에서 색상 사용하기”까지의 과정을 완성했습니다.

앞으로 어떤 색상을 여러 곳에서 반복해서 사용해야 한다면, 우선 `Color` 확장에 정리하는 방식을 고려할 수 있습니다.

이렇게 하면 코드가 더 명확해지고, 화면 스타일도 더 쉽게 통일할 수 있습니다.
