# 보조광 앱

이번 수업에서는 아주 재미있는 보조광 앱을 만들어 보겠습니다. 밤이 되면 휴대폰 화면에 다양한 색을 표시해서 간단한 보조광처럼 사용할 수 있습니다.

이 보조광 앱은 화면을 탭해서 색을 바꿀 수 있고, 슬라이더를 사용해 밝기도 조절할 수 있습니다.

이 예제에서는 `brightness` 로 뷰의 밝기를 조절하는 방법, `onTapGesture` 로 뷰에 탭 제스처를 추가하는 방법, 그리고 `Slider` 컨트롤에 대해 배웁니다.

실행 결과:

![Color](../../Resource/018_color.png)

## 색 표시하기

먼저, 화면에 하나의 색을 표시해 봅시다.

SwiftUI에서 `Color` 는 단순히 색을 나타내는 것뿐만 아니라, 하나의 뷰로도 표시될 수 있습니다.

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

여기서 `Color.red` 는 빨간색 뷰를 의미합니다. `.ignoresSafeArea()` 는 색상 뷰가 화면 전체를 채우도록 해 주기 때문에, 실제 보조광 같은 효과가 납니다.

실행 결과:

![Color](../../Resource/018_color1.png)

### 색 배열과 인덱스

지금은 한 가지 색만 표시되고 있습니다. 하지만 보조광은 보통 한 가지 색만 있는 것이 아닙니다. 파란색, 노란색, 보라색, 흰색 등도 표시할 수 있습니다.

우리는 화면을 탭할 때 다른 색으로 전환되기를 원합니다. 이런 색들을 배열에 넣어서 한 번에 관리할 수 있습니다.

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

배열은 "같은 타입의 데이터 묶음"을 저장하기에 적합합니다. 여기서는 배열의 각 요소가 모두 `Color` 입니다.

특정 색을 표시하고 싶다면 인덱스를 사용할 수 있습니다.

```swift
colors[0]
```

이것은 배열의 `0` 번째 인덱스에 있는 색, 즉 첫 번째 색을 읽는다는 뜻입니다.

이제 코드는 이렇게 쓸 수 있습니다.

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

이렇게 하면 화면에는 배열의 첫 번째 색인 빨간색이 표시됩니다.

### 인덱스로 색 제어하기

서로 다른 색으로 전환하려면, 인덱스를 고정해서 쓰는 대신 인덱스를 관리하는 변수가 필요합니다.

인덱스를 저장할 변수는 `@State` 로 선언할 수 있습니다.

```swift
@State private var index = 0
```

여기서 `index` 는 현재 색의 인덱스를 의미합니다.

`index` 가 바뀌면 SwiftUI 는 화면을 다시 계산하고 표시 내용을 업데이트합니다.

그다음 기존의 `colors[0]` 을 다음처럼 바꿉니다.

```swift
colors[index]
```

이렇게 하면 뷰에 표시되는 색은 `index` 에 의해 결정됩니다.

이제 코드는 다음과 같이 됩니다.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` 가 바뀌면 `colors[index]` 도 다른 색을 표시하게 됩니다.

예를 들면:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

여기서 주의할 점은 `index` 가 배열의 최대 인덱스를 넘으면 안 된다는 것입니다. 그렇지 않으면 배열 범위 초과 오류가 발생합니다.

## 탭 제스처

이제 `index` 에 따라 다른 색을 표시할 수 있지만, 아직 탭해서 색을 바꿀 수는 없습니다.

이전의 "명언 캐러셀" 수업에서는 `Button` 을 사용해 명언 전환을 제어했습니다.

하지만 이번에는 "색이 있는 전체 영역을 탭"해서 색을 바꾸고 싶기 때문에 `onTapGesture` 가 더 적합합니다.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

색상 뷰를 탭하면 다음 코드가 실행됩니다.

```swift
index += 1
```

이것은 `index` 를 `1` 증가시킨다는 뜻입니다. 인덱스가 증가하면 `colors[index]` 는 배열의 다음 색을 표시하게 됩니다.

### `onTapGesture`

`onTapGesture` 는 뷰에 탭 동작을 추가하는 제스처 modifier 입니다.

기본 사용법:

```swift
.onTapGesture {
    // code
}
```

예를 들면:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

이 빨간색 뷰를 탭하면 중괄호 안의 코드가 실행되고, 콘솔에는 다음이 출력됩니다.

```swift
Click color
```

`onTapGesture` 를 사용하면 뷰를 탭한 뒤 어떤 동작을 할지 정할 수 있습니다.

### `Button` 와의 차이

앞에서 `Button` 뷰를 배웠습니다. `Button` 과 `onTapGesture` 는 둘 다 탭 동작을 처리할 수 있지만, 사용되는 상황은 완전히 같지 않습니다.

`onTapGesture` 는 `Color`, `Image`, `Text` 또는 다른 일반적인 뷰처럼 "이미 있는 뷰에 탭 기능을 추가하는 것"에 더 적합합니다.

반면 `Button` 은 "확인", "제출", "삭제"처럼 명확한 버튼을 나타낼 때 더 적합합니다.

이 보조광 앱에서는 색을 바꾸는 기능을 더 단순하게 만들고 싶습니다. 색이 있는 전체 영역을 탭하면 색이 바뀌도록 하면 되므로, 여기서는 `onTapGesture` 가 좋은 선택입니다.

## 인덱스 문제

이제 화면을 탭해서 서로 다른 색으로 전환할 수 있게 되었습니다.

하지만 여기에는 중요한 문제가 있습니다. **인덱스가 배열 범위를 넘어갈 수 있다는 점**입니다.

예를 들면:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

계속해서 화면을 탭하면 `index` 는 결국 `4` 가 되고, 그때 "index out of range" 오류가 발생합니다.

그 이유는 `colors` 배열에 `4` 개의 요소가 있지만, 인덱스는 `0` 부터 시작하기 때문에 유효한 인덱스 범위가 `0 - 3` 이기 때문입니다. `4` 는 아닙니다.

`colors[4]` 에 접근하면 "index out of range" 오류가 발생합니다.

현재 코드에서는 화면을 한 번 탭할 때마다 `index` 가 자동으로 `1` 증가합니다. 이를 처리하지 않으면 결국 범위를 넘게 됩니다.

그래서 화면을 탭할 때 인덱스를 확인해야 합니다. 마지막 색이라면 첫 번째 색으로 돌아가고, 아니면 계속 `1` 증가시키면 됩니다.

이것은 `if` 문으로 구현할 수 있습니다.

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

이 코드에서 `colors.count` 는 배열 요소의 개수를 의미합니다.

현재 배열에는 4개의 색이 있으므로:

```swift
colors.count // 4
```

하지만 최대 인덱스는 `4` 가 아니라 `3` 입니다. 인덱스는 `0` 부터 시작하기 때문입니다.

따라서 마지막 인덱스는 이렇게 써야 합니다.

```swift
colors.count - 1
```

즉:

```swift
4 - 1 = 3
```

이 로직은 현재 인덱스가 이미 마지막 색이라면 `0` 으로 되돌리고, 그렇지 않다면 `1` 증가시킨다는 뜻입니다.

이렇게 하면 색을 순환하면서 바꿀 수 있습니다.

### 인덱스 로직 최적화하기

코드를 더 간결하게 만들고 싶다면 삼항 연산자도 사용할 수 있습니다.

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

이 코드는 `index == colors.count - 1` 이 참이면 `0` 을 반환하고, 그렇지 않으면 `index + 1` 을 반환한다는 뜻입니다.

마지막으로 그 결과를 다시 `index` 에 대입합니다.

이제 색이 바뀌는 효과를 구현할 수 있습니다.

전체 코드:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

이제 화면을 탭해서 서로 다른 색으로 전환할 수 있습니다. 기본적인 보조광 앱이 완성되었습니다.

## 색 이름 표시하기

색에 대응하는 텍스트 그룹을 하나 더 추가하면, 색이 바뀔 때 현재 색 이름도 함께 화면에 표시할 수 있습니다.

예를 들면:

- 빨간색일 때 `Red`
- 파란색일 때 `Blue`
- 노란색일 때 `Yellow`
- 보라색일 때 `Purple`

여기서도 색 이름을 저장하기 위해 배열을 사용할 수 있습니다.

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

이 배열에 들어 있는 텍스트의 순서는 색 배열의 순서와 정확히 일치해야 합니다.

그다음 현재 인덱스에 해당하는 색 이름을 표시하기 위해 `Text` 를 사용할 수 있습니다.

```swift
Text(colorsName[index])
```

`Text` 는 `index` 에 따라 현재 색 이름을 표시합니다.

`Text` 의 표시 스타일을 개선하기 위해 modifier 를 사용해 봅시다.

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

이렇게 하면 `Text` 가 흰색, 큰 제목 크기, 굵은 글꼴로 표시됩니다.

이제 전체 화면을 채우는 `Color` 뷰가 있습니다. `Text` 를 `Color` 뷰 위에 표시하고 싶다면, 둘을 겹쳐 보여 주기 위해 `ZStack` 레이아웃 컨테이너를 사용해야 합니다.

```swift
ZStack {
    Color
    Text
}
```

그러면 코드는 다음과 같이 됩니다.

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

이렇게 하면 배경에는 색상 뷰가 있고, 그 위에 텍스트 뷰가 겹쳐서 표시됩니다.

실행 결과:

![Color](../../Resource/018_color2.png)

주의할 점은 `ZStack` 에서는 나중에 작성된 뷰가 보통 앞쪽에 표시된다는 것입니다. 만약 `Text` 를 `Color` 보다 먼저 작성하면, 뒤에 작성된 `Color` 뷰가 `Text` 를 가릴 수 있습니다.

## 밝기 제어하기

이제 서로 다른 색을 바꿀 수 있게 되었지만, 보조광에는 또 하나의 중요한 기능이 있습니다. 바로 **밝기 조절**입니다.

SwiftUI 에서는 `brightness` modifier 를 사용해 뷰의 밝기를 조절할 수 있습니다.

예를 들면:

```swift
.brightness(1)
```

다음처럼 쓸 수 있습니다.

```swift
colors[index]
    .brightness(0.5)
```

이렇게 하면 현재 색이 더 밝아져서 보조광 효과에 더 가까워집니다.

밝기의 범위는 `0 - 1` 입니다. `0` 은 원래 색을 유지한다는 뜻이고, 값이 `1` 에 가까울수록 색이 더 밝아집니다. `1` 은 가장 밝은 흰색 결과를 의미합니다.

비록 코드에서 `brightness` 를 제어할 수는 있지만, 사용자가 직접 조절할 수는 아직 없습니다.

그래서 드래그할 수 있는 컨트롤인 `Slider` 를 추가해야 합니다.

## `Slider` 뷰

SwiftUI 에서 `Slider` 는 일정 범위 안에서 값을 선택하는 데 사용하는 컨트롤입니다. Apple 은 이를 "제한된 선형 범위에서 값을 선택하는 컨트롤"이라고 설명합니다.

기본 사용법:

```swift
Slider(value: $value, in: 0...1)
```

매개변수 설명:

1. `value: $value`: `Slider` 는 변수에 바인딩되어야 합니다.

    슬라이더를 움직이면 변수 값도 동시에 바뀝니다. 반대로 변수가 바뀌면 슬라이더도 함께 업데이트됩니다.

    이것은 앞에서 배운 `TextField` 와 매우 비슷합니다. 둘 다 "컨트롤을 변수에 바인딩"합니다.

    바인딩을 나타내기 위해 바인딩된 변수 앞에는 `$` 기호를 붙여야 합니다.

2. `in: 0...1`: 이 매개변수는 슬라이더 값의 범위를 나타냅니다.

    여기서 `0...1` 은 최소값이 `0`, 최대값이 `1` 이라는 뜻입니다.

    슬라이더를 완전히 왼쪽으로 옮기면 바인딩된 변수는 `0` 에 가까워지고, 완전히 오른쪽으로 옮기면 `1` 에 가까워집니다.

예를 들면:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` 는 `value` 변수에 바인딩되어 있습니다. 슬라이더를 움직이면 `value` 변수의 값도 동시에 바뀝니다.

표시 예시:

![Slider](../../Resource/018_slider.png)

`Slider` 를 왼쪽으로 움직이면 바인딩된 `value` 가 `0` 이 됩니다. 오른쪽으로 움직이면 `1` 이 됩니다.

### 값의 범위

`Slider` 의 값 범위는 고정되어 있지 않습니다. 다음처럼 쓸 수도 있습니다.

```swift
0...100
```

또는 다른 범위도 가능합니다.

하지만 이 보조광 앱에서는 밝기를 제어해야 하므로 `0...1` 이 가장 적합한 선택입니다.

## `Slider` 로 밝기 제어하기

이제 `Slider` 와 `brightness` 를 연결해야 합니다.

먼저 밝기 값을 저장할 변수를 만듭니다.

```swift
@State private var slider = 0.0
```

여기서 `0.0` 은 `Double` 타입의 값입니다.

`Slider` 는 보통 숫자 타입에 바인딩되고, 여기서는 값이 연속적으로 변해야 하므로 `Double` 이 더 적합합니다. 또한 `brightness` 는 `Double` 값만 받을 수 있습니다.

그다음 이 값을 `brightness` 에 전달합니다.

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` 이면 색은 기본 상태를 유지합니다. `slider` 가 `1` 에 가까울수록 색은 더 밝게 보입니다.

### `Slider` 컨트롤 추가하기

다음으로 이 변수를 변경할 수 있도록 `Slider` 컨트롤을 추가합니다.

```swift
Slider(value: $slider, in: 0...1)
```

슬라이더가 바뀌면 `slider` 값도 함께 바뀌고, `brightness(slider)` 가 동시에 밝기를 업데이트합니다.

이것은 SwiftUI 에서 "변수가 뷰를 구동한다"는 매우 전형적인 예입니다.

### `Slider` 의 모양 조정하기

기본적으로 `Slider` 는 사용 가능한 너비를 사용합니다.

고정된 너비를 줄 수도 있습니다.

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

그다음 더 잘 보이도록 몇 가지 modifier 를 추가합니다.

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

이렇게 하면 슬라이더에 흰색 배경과 둥근 모서리가 생겨서 `Color` 뷰 위에서도 더 잘 보이게 됩니다.

마지막으로 화면 아래쪽에 배치합니다.

이미 `ZStack` 을 사용하고 있으므로, 그 안에 `VStack` 을 넣고 `Spacer()` 를 사용해 `Slider` 를 아래쪽으로 밀어낼 수 있습니다.

## 전체 코드

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

실행 결과:

![Color](../../Resource/018_color.png)

## 요약

이전에 배운 지식과 색상, 배열 같은 기본 개념을 활용해서 아주 흥미로운 보조광 앱을 만들었습니다.

이 보조광 앱을 통해 `brightness` 로 밝기를 조절하는 방법, `onTapGesture` 로 뷰에 탭 동작을 추가하는 방법, 그리고 `Slider` 컨트롤 사용법을 배웠습니다.

색을 바꾸기 위해 `Color` 뷰에 `onTapGesture` 를 추가했습니다. 또한 `brightness` 를 관리하는 변수를 `Slider` 로 바꿀 수 있게 했는데, 이것 역시 "변수가 뷰를 구동한다"는 또 다른 예입니다.

또한 삼항 연산자를 다시 살펴봤고, 뷰를 겹쳐 쌓기 위해 `ZStack` 을 사용했으며, 같은 타입의 데이터 그룹을 관리하기 위해 배열을 사용했습니다. 이는 배열과 인덱스에 대한 이해를 더 깊게 해 주며, 특히 범위를 벗어나는 인덱스 오류를 피하는 실전적인 문제를 생각하게 해 줍니다.

이 예제는 복잡하지 않지만, 앞에서 배운 많은 기본 개념을 하나로 연결해 줍니다. 이런 개념들이 작은 실제 프로젝트 안에서 함께 사용되면, 각각의 개념이 어떤 역할을 하는지 더 쉽게 이해할 수 있습니다.

### 실제 사용 장면

오래된 iPhone 을 책상 위에 두고, 직접 만든 보조광 앱으로 빛의 색을 제어하는 상황을 상상해 보세요. 아주 좋은 경험이 될 것입니다.

App Store 에는 많은 "보조광" 앱이 있고, 그것들도 그리 복잡해 보이지는 않습니다.

![AppStore](../../Resource/018_appStore.PNG)

우리는 간단한 앱부터 개발을 시작해서 App Store 에 올리는 것까지 도전해 볼 수 있습니다. 이것은 개발에 대한 흥미를 높여 줄 뿐 아니라, 우리의 성장 과정도 기록해 줍니다.

### 수업 후 연습

이 보조광 앱을 더 확장하는 방향에 대해 계속 생각해 볼 수 있습니다. 예를 들면:

- 더 많은 색 추가하기
- 현재 밝기 값 표시하기
- 아래쪽 슬라이더 영역 디자인 개선하기

이 지식을 실제로 활용하기 시작하면, 우리가 배우는 각각의 개념이 사실은 앱 개발을 위한 도구라는 것을 알게 됩니다.

더 많은 도구를 익힐수록 더 많은 기능을 만들 수 있습니다.
