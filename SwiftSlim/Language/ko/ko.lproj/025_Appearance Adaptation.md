# 외관 적응

이번 수업에서는 라이트 모드와 다크 모드의 외관 적응을 배웁니다.

iPhone, iPad, Mac에서 사용자는 라이트 모드를 선택할 수도 있고 다크 모드를 선택할 수도 있습니다.

시스템이 다크 모드로 전환되면 많은 App의 배경, 텍스트, 아이콘 색상도 함께 바뀝니다.

예를 들어 낮의 화면은 밝은 배경일 수 있고, 밤의 화면은 어두운 배경으로 바뀔 수 있습니다.

![view](../../../Resource/025_view9.png)

이처럼 시스템 외관에 따라 화면 표시를 자동으로 조정하는 능력을 외관 적응이라고 합니다.

## Xcode에서 외관 적응 미리보기

외관 적응을 배우기 전에 먼저 Xcode에서 라이트 모드와 다크 모드를 미리 보는 방법을 알아보겠습니다.

`Canvas` 영역 하단에서 `Device Settings` 버튼을 클릭하면 `Canvas Device Settings` 팝업을 열 수 있습니다.

![canvas](../../../Resource/025_view.png)

팝업에서 `Color Scheme` 설정을 볼 수 있습니다.

![canvas1](../../../Resource/025_view1.png)

여기에서:

- `Light Appearance`는 라이트 모드를 의미합니다.
- `Dark Appearance`는 다크 모드를 의미합니다.

여기에서 미리보기 외관을 전환하여 현재 화면이 라이트 모드와 다크 모드에서 어떻게 표시되는지 확인할 수 있습니다.

## 두 가지 외관 나란히 표시하기

라이트 모드와 다크 모드를 동시에 보고 싶다면 `Variants` 기능을 사용할 수 있습니다.

`Canvas` 영역 하단에서 `Variants` 버튼을 클릭하고 `Color Scheme Variants`를 선택합니다.

![canvas2](../../../Resource/025_view2.png)

선택하면 `Canvas`가 라이트 모드와 다크 모드의 미리보기 효과를 동시에 표시합니다.

![canvas3](../../../Resource/025_view3.png)

이렇게 하면 두 가지 외관에서 화면 차이를 더 편하게 비교할 수 있습니다.

간단히 말하면:

라이트/다크 모드를 임시로만 전환하고 싶다면 `Canvas Device Settings`를 사용할 수 있습니다.

두 가지 외관을 동시에 보고 싶다면 `Color Scheme Variants`를 사용할 수 있습니다.

## 뷰는 기본적으로 외관에 적응합니다

SwiftUI에서는 많은 시스템 뷰가 기본적으로 라이트 모드와 다크 모드에 자동으로 적응합니다.

예를 들어:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("밝음")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("샘플 텍스트")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

표시 효과:

![canvas](../../../Resource/025_view4.png)

라이트 모드에서는 아이콘과 제목이 보통 어두운 색으로 표시됩니다.

다크 모드에서는 아이콘과 제목이 자동으로 밝은 색으로 바뀝니다.

이는 `Text`, `Image` 등의 SwiftUI 뷰가 기본적으로 시스템 외관에 따라 색상을 조정하기 때문입니다.

즉, 고정 색상을 직접 지정하지 않으면 SwiftUI가 외관 적응의 일부를 대신 처리합니다.

## 고정 색상은 자동으로 반전되지 않습니다

주의해야 할 점은 고정 색상을 직접 지정하면 라이트/다크 모드에 따라 자동으로 반전되지 않는다는 것입니다.

예를 들어:

```swift
Text("샘플 텍스트")
	.foregroundStyle(Color.gray)
```

여기에서 텍스트는 `Color.gray`로 지정되어 있으므로 항상 회색으로 표시됩니다.

또 다른 예입니다:

```swift
Text("제목")
    .foregroundStyle(Color.white)
```

이 코드는 라이트 모드든 다크 모드든 항상 흰색 텍스트를 표시합니다.

배경도 밝은 색이라면 흰색 텍스트가 잘 보이지 않을 수 있습니다.

따라서 외관 적응을 할 때는 `Color.white`, `Color.black` 같은 고정 색상을 함부로 하드 코딩하지 않는 것이 좋습니다.

많은 경우에는 시스템 의미 스타일을 우선 사용할 수 있습니다. 예를 들어:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

여기에서:

- `.primary`는 보통 주요 콘텐츠에 사용됩니다.
- `.secondary`는 보통 보조 콘텐츠에 사용됩니다.

이들은 라이트/다크 모드에 따라 표시 효과를 자동으로 조정합니다.

## 외관에 따라 다른 콘텐츠 표시하기

때로는 색상만 바꾸는 것이 아니라 서로 다른 외관에서 다른 콘텐츠를 표시하고 싶을 수 있습니다.

예를 들어:

- 라이트 모드에서는 일반 전구 아이콘을 표시합니다.
- 다크 모드에서는 빛나는 전구 아이콘을 표시합니다.
- 라이트 모드에서는 제목이 `밝음`으로 표시됩니다.
- 다크 모드에서는 제목이 `어두움`으로 표시됩니다.

이때는 현재 시스템이 라이트 모드인지 다크 모드인지 판단해야 합니다.

SwiftUI에서는 `colorScheme` 환경 값을 통해 현재 외관 모드를 가져올 수 있습니다.

```swift
@Environment(\.colorScheme) private var colorScheme
```

전체 코드:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "밝음" : "어두움"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("샘플 텍스트")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

표시 효과:

![view](../../../Resource/025_view5.png)

미리보기 효과를 보면, 같은 뷰라도 외관 모드가 다르면 표시되는 콘텐츠가 완전히 같지는 않습니다.

라이트 모드에서는 `Image`가 일반 전구 아이콘을 표시하고, 제목은 `밝음`으로 표시됩니다.

다크 모드에서는 `Image`가 빛나는 전구 아이콘을 표시하고, 제목은 `어두움`으로 표시됩니다.

즉, 여기에서 달라진 것은 색상뿐만이 아니라 아이콘 이름과 제목 텍스트 자체도 달라졌습니다.

그 이유는 아이콘과 제목을 `body` 안에 직접 고정해서 쓰지 않고, `colorScheme`에 따라 다른 콘텐츠를 계산했기 때문입니다.

이 코드에서는 두 개의 계산 프로퍼티를 사용했습니다.

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "밝음" : "어두움"
}
```

`colorScheme`이 `.light`이면 현재 라이트 모드라는 뜻입니다.

`colorScheme`이 `.dark`이면 현재 다크 모드라는 뜻입니다.

그래서 서로 다른 외관 모드에 따라 서로 다른 아이콘 이름과 제목 텍스트를 반환할 수 있습니다.

이것도 계산 프로퍼티의 흔한 사용 방식입니다. 현재 상태에 따라 뷰가 표시해야 하는 콘텐츠를 계산합니다.

## @Environment 이해하기

이번이 `@Environment`를 처음 접하는 시간입니다.

`@Environment`는 SwiftUI의 환경에서 값을 읽어 오는 것으로 이해할 수 있습니다.

App이 실행될 때 시스템은 많은 환경 정보를 제공합니다. 예를 들어:

- 현재 언어
- 현재 외관 모드
- 현재 레이아웃 방향
- 현재 글꼴 크기 설정

현재 외관 모드를 가져와야 할 때는 `colorScheme`을 읽을 수 있습니다.

```swift
@Environment(\.colorScheme) private var colorScheme
```

여기에서

```swift
\.colorScheme
```

은 환경에서 `colorScheme` 값을 읽는다는 뜻입니다.

```swift
private var colorScheme
```

은 읽어 온 값을 `colorScheme` 변수에 저장한다는 뜻입니다.

변수 이름은 직접 정할 수 있습니다. 예를 들어 다음처럼 작성해도 됩니다.

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

앞의 `\.colorScheme`이 바뀌지 않는 한, 현재 외관 모드를 읽는다는 의미입니다.

## colorScheme의 두 가지 일반적인 값

`colorScheme`에는 일반적으로 두 가지 값이 있습니다.

```swift
.light
.dark
```

각각의 의미는 다음과 같습니다.

- `.light`: 라이트 모드
- `.dark`: 다크 모드

예를 들어:

```swift
private var titleName: String {
    colorScheme == .light ? "밝음" : "어두움"
}
```

이 코드의 의미는 다음과 같습니다.

현재가 라이트 모드이고 `colorScheme == .light`가 성립하면 `"밝음"`을 반환합니다.

그렇지 않으면 `"어두움"`을 반환합니다.

그래서 라이트 모드에서는:

```swift
Text(titleName)
```

표시되는 것은:

```swift
밝음
```

다크 모드에서는 표시되는 것은:

```swift
어두움
```

이런 방식으로 우리는 외관에 따라 서로 다른 콘텐츠를 표시할 수 있습니다.

## 색상 적응 예시

텍스트와 아이콘 외에도 때로는 색상 적응을 직접 처리해야 할 때가 있습니다.

예를 들어:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("텍스트")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

표시 효과:

![view](../../../Resource/025_view6.png)

이 코드에서는 텍스트가 흰색이고 배경이 검은색입니다.

라이트 모드에서는 검은색 배경이 비교적 뚜렷합니다.

하지만 다크 모드에서 전체 화면 배경도 검은색이라면, 이 검은색 배경이 시스템 배경에 섞여 충분히 선명해 보이지 않을 수 있습니다.

이때는 외관 모드에 따라 텍스트 색상과 배경 색상을 전환할 수 있습니다.

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("텍스트")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

표시 효과:

![view](../../../Resource/025_view7.png)

이제 라이트 모드에서는 검은색 배경과 흰색 텍스트가 표시됩니다.

다크 모드에서는 흰색 배경과 검은색 텍스트가 표시됩니다.

이렇게 하면 어떤 외관에서도 텍스트와 배경의 대비가 뚜렷해지고, 사용자가 콘텐츠를 명확하게 볼 수 있습니다.

## Assets를 사용해 색상 적응하기

`colorScheme`으로 직접 판단하는 것 외에도 `Assets` 리소스 색상을 사용해 라이트/다크 모드에 적응할 수 있습니다.

이 방식은 App에서 공통으로 사용하는 색상을 관리하는 데 더 적합합니다.

Xcode 프로젝트에서 `Assets` 리소스 폴더를 찾습니다.

![assets](../../../Resource/025_color.png)

`Assets` 폴더를 열고 빈 영역을 우클릭한 다음 `New Color Set`을 선택하여 새로운 색상 리소스를 만듭니다.

![assets](../../../Resource/025_color1.png)

여기에서는 색상을 하나 만들고 이름을 `redText`로 지정합니다.

![assets](../../../Resource/025_color2.png)

색상 리소스는 라이트 모드와 다크 모드에서의 색상을 각각 설정할 수 있습니다.

![assets](../../../Resource/025_color3.png)

해당 색상 영역을 선택한 후 오른쪽 속성 검사기에서 색상을 수정할 수 있습니다.

오른쪽 위의 `Hide or show the Inspectors` 버튼을 클릭하여 검사기 영역을 엽니다.

그런 다음 `Show the Attributes inspector`를 선택하고 하단에서 `Show Color Panel`을 찾아 색상 패널을 엽니다.

![assets](../../../Resource/025_color4.png)

색상 패널에서 색상을 클릭하면 `redText`에 해당하는 색상 영역도 함께 바뀝니다.

여기에서는 `redText`를 다음처럼 설정합니다.

- 라이트 모드에서는 빨간색 표시
- 다크 모드에서는 초록색 표시

![assets](../../../Resource/025_color5.png)

SwiftUI 코드로 돌아오면 이 색상을 다음처럼 사용할 수 있습니다.

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

여기에서:

```swift
Color("redText")
```

은 `Assets`에서 `redText`라는 이름의 색상 리소스를 읽는다는 뜻입니다.

표시 효과:

![assets](../../../Resource/025_view8.png)

같은 `Color("redText")`라도 라이트 모드와 다크 모드에서 서로 다른 색상으로 표시되는 것을 볼 수 있습니다.

이는 `Assets` 색상 자체도 외관 적응을 지원한다는 뜻입니다.

## colorScheme과 Assets의 차이

`colorScheme`과 `Assets`는 모두 외관 적응을 구현할 수 있지만, 적합한 사용 시나리오는 다릅니다.

라이트/다크 모드에 따라 텍스트 내용, 이미지 이름 또는 `SF Symbols` 이름만 전환한다면 `colorScheme`을 사용할 수 있습니다.

예를 들어:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

App에서 자주 사용하는 색상, 예를 들어 테마 색상, 카드 배경색, 텍스트 색상이라면 `Assets` 색상을 사용하는 것을 더 권장합니다.

`Assets` 색상은 여러 뷰에서 재사용할 수 있고, 나중에 수정하기도 더 편하기 때문입니다.

예를 들어:

```swift
Color("redText")
```

이렇게 하면 `Assets`에서 색상만 수정해도 이 색상을 사용하는 모든 곳이 함께 바뀝니다.

## 정리

이번 수업에서는 라이트 모드와 다크 모드의 외관 적응을 배웠습니다.

먼저 Xcode의 `Canvas`에서 서로 다른 외관을 미리 보는 방법을 배웠고, `Color Scheme Variants`를 사용해 라이트 모드와 다크 모드를 동시에 보는 방법도 배웠습니다.

그다음 SwiftUI의 `Text`, `Image` 등의 뷰가 기본적으로 시스템 외관에 따라 색상을 자동으로 적응한다는 것을 알았습니다.

하지만 `Color.white` 또는 `Color.black`처럼 고정 색상을 직접 지정하면, 이러한 색상은 자동으로 반전되지 않습니다.

이어서 `@Environment`와 `colorScheme`을 배웠습니다.

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme`을 통해 현재가 라이트 모드인지 다크 모드인지 판단하고, 외관에 따라 서로 다른 아이콘, 텍스트 또는 색상을 표시할 수 있습니다.

마지막으로 `Assets` 색상을 배웠습니다.

`Assets` 색상은 라이트 모드와 다크 모드에서의 색상을 각각 설정할 수 있으며, App에서 공통으로 사용하는 색상 리소스를 관리하는 데 적합합니다.

외관 적응은 App이 낮과 밤 모두에서 더 좋은 표시 효과를 갖도록 해 주며, 텍스트가 잘 보이지 않거나 배경이 뚜렷하지 않은 문제도 피할 수 있습니다.

실제 개발에서는 SwiftUI의 기본 적응 능력과 `Assets` 색상을 우선 사용하는 것을 권장합니다.

서로 다른 외관에서 텍스트, 아이콘, 이미지를 전환해야 하거나 소량의 특수 표시 효과를 처리할 때만 `colorScheme`으로 판단하면 됩니다.

## 확장 지식: 글꼴 크기 지정하기

이전에 `font`를 배울 때 몇 가지 시스템 글꼴 스타일을 사용한 적이 있습니다.

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`, `.callout` 같은 시스템 글꼴 스타일을 사용하는 것 외에도 글꼴 크기를 직접 지정할 수 있습니다.

예를 들어:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

여기에서:

```swift
.font(.system(size: 100))
```

은 글꼴 크기를 `100 pt`로 설정한다는 뜻입니다.

`SF Symbols` 아이콘의 경우에도 `font`는 아이콘 크기에 영향을 줍니다.

따라서 아이콘을 더 크게 표시하고 싶다면 `.font(.system(size:))`로 크기를 지정할 수 있습니다.

예를 들어:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

주의할 점은 글꼴 크기를 직접 지정하면 더 유연하지만, 일반 텍스트에는 고정 글꼴 크기를 많이 사용하는 것을 권장하지 않는다는 것입니다.

일반 텍스트에는 `.title`, `.headline`, `.body`, `.caption` 등의 시스템 글꼴 스타일을 우선 사용하는 것이 좋습니다.

이렇게 하면 서로 다른 기기와 사용자의 글꼴 설정에 더 잘 적응할 수 있습니다.
