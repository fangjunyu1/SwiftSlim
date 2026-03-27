# 다채로운 색상

이번 수업에서는 SwiftUI에서 자주 쓰이는 시각적 modifier를 배웁니다. 포함되는 내용은 다음과 같습니다:

- 색상
- 전경색
- 배경색
- 오프셋
- 투명도
- 블러

또한 Safe Area(안전 영역)도 함께 배웁니다.

이러한 modifier들은 뷰의 시각적 표현을 제어하여, 화면을 더 분명하고 계층감 있게 만들어 줍니다.

## 색상

SwiftUI에서는 텍스트의 색상을 설정할 수 있습니다.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue`는 파란색을 의미하며, 실제로는 `Color.blue`의 축약형입니다(타입 추론).

자주 쓰는 색상 예시:

```
.black
.green
.yellow
.pink
.gray
...
```

이들은 모두 `Color`의 정적 속성입니다.

![Color](../../RESOURCE/006_color.png)

`Color`는 색상 타입이고, `.blue`, `.red` 같은 값은 그 구체적인 색상이라고 이해하면 됩니다.

### Color 뷰

SwiftUI에서 `Color`는 하나의 뷰로도 표시될 수 있습니다.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

이 코드는 100×100 크기의 빨간 정사각형을 생성합니다.

전체 화면을 하나의 색으로 표시할 수도 있습니다:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

실행해 보면 빨간색이 화면 전체를 완전히 채우지 않고, iPhone의 위아래는 여전히 흰색으로 남아 있는 것을 볼 수 있습니다. 여기에는 Safe Area(안전 영역)의 개념이 관련됩니다.

## Safe Area(안전 영역)

Safe Area는 시스템이 콘텐츠가 가려지지 않도록 남겨 두는 영역입니다. 여기에는 다음이 포함됩니다:

1. 위쪽 상태 표시줄(시간, 배터리)

2. 아래쪽 홈 인디케이터 영역

3. 노치(notch) 또는 Dynamic Island 영역

![Color](../../RESOURCE/006_color3.png)

SwiftUI는 기본적으로 내용을 안전 영역 안에 제한하므로, 뷰가 화면 가장자리까지 확장되지 않습니다.

### Safe Area 무시하기

색상이 화면 전체를 채우게 하려면 `ignoresSafeArea`를 사용할 수 있습니다:

```swift
Color.red
    .ignoresSafeArea()
```

또는 `edgesIgnoringSafeArea`를 사용할 수도 있습니다:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

이렇게 하면 뷰가 화면 전체로 확장됩니다.

주의할 점은, `edgesIgnoringSafeArea`는 비교적 예전 방식이며, iOS 14부터는 `ignoresSafeArea` 사용이 권장된다는 것입니다.

## 전경색

### foregroundStyle modifier

이전 수업에서 `foregroundStyle`로 색상을 설정하는 방법을 배웠습니다.

예:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle`은 새로운 스타일 시스템으로, 색상뿐 아니라 그라디언트, 재질(material) 등도 지원합니다.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier

`foregroundColor`로도 색상을 설정할 수 있습니다:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

사용 방식은 `foregroundStyle`과 같습니다.

최신 Xcode 버전에서는 `foregroundColor`가 앞으로의 iOS 버전에서 deprecated될 가능성이 있다는 경고가 표시되므로, 우선적으로 `foregroundStyle`을 사용하는 것이 권장됩니다.

## 배경

뷰에 배경색을 추가하고 싶다면 `background`를 사용할 수 있습니다:

```swift
background(.red)
```

예를 들어, 텍스트에 배경색을 추가하면:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome 같은 App에서 텍스트를 선택할 때 비슷한 배경색 효과를 볼 수 있습니다.

![Color](../../RESOURCE/006_color16.png)

배경 영역을 더 넓히고 싶다면 `padding`과 함께 사용해야 합니다:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

여기서 한 가지 중요한 규칙이 있습니다:

SwiftUI modifier는 위에서 아래로 차례대로 뷰를 구성합니다. 뒤에 쓰인 modifier는 앞 단계에서 만들어진 결과에 적용됩니다.

즉:

```swift
.padding()
.background()
```

이 순서는, 배경이 padding이 적용된 뒤의 뷰 전체를 감싼다는 뜻입니다.

반대로 순서를 바꾸면:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

배경은 커지지 않습니다. 왜냐하면 배경이 뒤쪽 `padding`까지 감싸지 않기 때문입니다.

## 예제 - 네모 모서리 너트

이제 간단한 네모 모서리 너트 모양의 뷰를 만들어 봅시다.

![Color](../../RESOURCE/006_color8.png)

먼저 50 × 50 크기의 흰색 사각형을 만듭니다:

```swift
Color.white
    .frame(width: 50, height: 50)
```

원형으로 만들고 싶다면 `cornerRadius`를 사용합니다:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

모서리 반지름이 가로세로의 절반과 같아지면 원형이 됩니다.

이제 파란 배경을 추가해 봅시다:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

추가된 `padding`이 바깥 영역을 넓혀 주고, `background`는 그 바깥 영역 위에 파란색을 그립니다.

이렇게 해서 네모 모서리 너트 같은 효과가 완성됩니다.

### 또 다른 방식

배경색으로 네모 모서리 너트를 만드는 것 외에도, `ZStack`으로도 구현할 수 있습니다.

앞에서 배운 것처럼 `ZStack`은 겹쳐서 정렬하는 데 사용됩니다. 네모 모서리 너트도 하나의 원과 하나의 사각형이 겹쳐진 것으로 볼 수 있습니다.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack`은 뷰를 순서대로 겹쳐 놓으며, 나중에 추가된 뷰가 위쪽에 표시됩니다.

## 예제 - 겹쳐진 두 개의 원

많은 아이콘은 간단한 도형을 겹쳐서 만들어집니다. 예를 들어 두 개의 겹쳐진 원이 있습니다.

![Color](../../RESOURCE/006_color14.png)

먼저 두 개의 원을 만듭니다:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

두 원이 겹쳐 보여야 하므로 `ZStack` 레이아웃을 사용합니다:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

이 상태에서는 크기가 같은 두 원이 완전히 겹쳐집니다.

우리가 원하는 것은 완전히 덮는 것이 아니라 일부만 겹치는 모습이므로, `offset`을 사용해 위치를 약간 이동시켜야 합니다.

## 오프셋

`offset`은 뷰가 그려지는 위치만 바꾸고, 부모 뷰의 레이아웃 계산에는 영향을 주지 않습니다.

사용 방법:

```swift
.offset(x:y:)
```

`x`는 가로 방향 이동량, `y`는 세로 방향 이동량입니다.

양수는 오른쪽/아래쪽으로, 음수는 왼쪽/위쪽으로 이동함을 의미합니다.

`offset`을 사용해 두 원이 일부만 겹치도록 만들면:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

빨간 원은 레이아웃상의 위치는 변하지 않았지만, 실제로 그려지는 위치가 왼쪽으로 25pt 이동합니다. 그래서 두 원이 일부만 겹쳐 보이게 됩니다.

## 투명도

SwiftUI에서 `opacity`는 뷰의 투명도를 설정하는 데 사용됩니다.

기본 사용법:

```swift
.opacity(0.5)
```

`opacity`의 값 범위는 0.0에서 1.0까지이며:

- 0은 완전히 투명
- 1은 불투명

오렌지색 원의 투명도를 설정해 보면:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

오렌지색 원의 `opacity`를 0.8로 설정하면 불투명도가 80%가 되며, 두 원이 겹치는 부분에서 색이 섞이는 시각적 효과가 생깁니다.

## 블러

SwiftUI에서는 `blur`를 사용해 흐림 효과를 줄 수 있습니다:

```swift
.blur(radius:10)
```

`radius`는 블러 반경을 정의하며, 값이 클수록 더 흐릿해집니다.

두 원에 블러 효과를 추가하면:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

결과적으로, 매우 흐릿한 두 개의 원을 볼 수 있습니다.

## 정리

이번 수업에서는 SwiftUI에서 자주 쓰이는 시각적 modifier를 중심으로, 색상, 위치, 시각 효과를 modifier로 어떻게 제어하는지 배웠습니다.

구체적인 예제를 통해 다양한 시각 modifier가 실제 화면에서 어떤 역할을 하는지 확인했고, 안전 영역에 대한 지식도 함께 익혔습니다.

이들은 모두 매우 기초적인 modifier이므로, 많이 연습하고 자주 사용해 보면 실제 개발에서 화면 효과를 더 분명하게 제어하는 데 큰 도움이 됩니다.

### 수업 후 연습

- 이미지 하나에 투명도와 블러 효과 추가하기
- 서로 다른 투명도를 가진 원 세 개를 겹쳐 보기
- 화면 전체를 채우는 배경 이미지를 만들고 안전 영역 무시하기
- `offset`을 사용해 여러 뷰의 위치 조정하기

이 연습의 목적은 API를 암기하는 것이 아니라, 시각 변화와 레이아웃 동작 사이의 관계를 직접 관찰하는 데 있습니다。
