# ContentView부터 시작하기

## 수업 전 준비

이번 수업에서는 ContentView.swift 파일부터 시작해 SwiftUI의 기본 구조를 체계적으로 익힙니다. 포함되는 내용은 다음과 같습니다:

- 주석
- View 구조
- VStack / HStack / ZStack 레이아웃
- SF Symbols 아이콘
- 뷰 수식어(modifier)
- 미리보기 코드 #Preview

먼저, 이전에 만든 Xcode 프로젝트를 찾아 .xcodeproj 파일을 더블 클릭합니다.

왼쪽 Navigator 탐색 영역에서 ContentView.swift 파일을 선택합니다.

주의: 프로젝트를 열 때마다 Canvas에 "Preview paused"가 표시될 수 있습니다. 새로고침 버튼을 클릭하면 미리보기가 다시 활성화됩니다.

![Swift](../../RESOURCE/002_view7.png)

## ContentView 알아보기

ContentView 코드:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

코드는 많지 않지만, SwiftUI의 핵심 구조를 이미 담고 있습니다.

### 1. 주석

파일 상단:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

이것은 파일 주석으로, 파일 정보가 기록되어 있습니다. 여기에는 파일 이름, 프로젝트 이름, 작성자, 생성 시간이 포함됩니다.

Swift에서는 `//`를 사용해 한 줄 주석을 작성합니다:

```swift
// 이것은 주석입니다
```

주석은 코드의 가독성을 높이고, 개발자가 코드 로직을 이해하는 데 도움을 줍니다.

실제 개발에서는 코드가 난해해질 수 있습니다. 주석을 남기지 않으면, 사흘 뒤에 자기 코드조차 이해하지 못하는 상황을 만날 수 있습니다.

그래서 코드를 작성하는 과정에서 스스로 주석을 추가하는 것은 좋은 개발 습관입니다. 주석을 통해 코드 로직을 기록하면, 이후 유지보수가 훨씬 쉬워집니다.

**코드를 임시로 비활성화하기**

주석은 코드를 일시적으로 막아 두는 데도 사용할 수 있어, 문제를 추적할 때 유용합니다.

예를 들어:

```
A
B
C
```

A, B, C는 세 개의 코드 조각이고, 그중 하나에 오류가 있다고 가정해 봅시다. 이때 코드를 임시로 주석 처리해 문제를 찾을 수 있습니다.

먼저 A에 주석을 추가합니다:

```
// A
B
C
```

A를 주석 처리한 뒤 코드가 정상으로 돌아오면, A에 문제가 있었다는 뜻입니다.

A를 주석 처리해도 여전히 문제가 있다면, 다시 B를 주석 처리하고 같은 방식으로 계속 확인할 수 있습니다.

개발 과정에서는 많은 문제를 마주하게 되며, 주석을 활용해 원인을 추적하는 경우가 많습니다. 이런 방식은 문제가 있는 코드를 빠르게 찾고 버그의 원인을 파악하는 데 도움이 됩니다.

Xcode에서는 다음 단축키를 사용할 수 있습니다:

```
Command ⌘ + /
```

이 단축키로 주석을 빠르게 추가하거나 제거할 수 있습니다.

### 2. SwiftUI 프레임워크 가져오기

```swift
import SwiftUI
```

이 코드는 SwiftUI 프레임워크를 가져온다는 뜻입니다.

SwiftUI의 `View`, `Text`, `Image`, `VStack` 같은 타입은 모두 이 프레임워크에서 옵니다.

SwiftUI 프레임워크를 가져오지 않으면, Xcode는 다음과 같은 오류를 표시합니다:

```
Cannot find type 'View' in scope
```

즉, 컴파일러가 `View` 타입을 인식하지 못한다는 뜻입니다.

### 3. View 구조

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

처음 이 View 구조를 보면 낯설게 느껴질 수 있습니다. 왜냐하면 여기에는 `struct`, `View`, `var`, `body`, `some` 같은 키워드가 들어 있기 때문입니다.

아직 이 키워드들을 배우지 않았더라도 괜찮습니다. 지금은 이 코드가 `ContentView`라는 이름의 View를 하나 만든다는 것만 알면 충분합니다.

여기서 View는 하나의 화판처럼 이해해도 됩니다. 그리고 그 위에 그림을 그리는 도구가 바로 SwiftUI입니다.

예를 들어:

![Swift](../../RESOURCE/002_view.png)

위 그림에는 세 개의 페이지가 보이는데, 실제로는 세 개의 View입니다.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

SwiftUI로 앱을 개발할 때는, 각 페이지가 하나의 View라고 볼 수 있습니다.

### 4. SwiftUI 코드

View 안에는 다음과 같은 SwiftUI 코드가 들어 있습니다:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

이 SwiftUI 코드는 세로 레이아웃 안에 하나의 아이콘과 하나의 텍스트를 표시한다는 뜻입니다.

![Swift](../../RESOURCE/002_view1.png)

#### VStack 레이아웃

```swift
VStack { }  // 세로 레이아웃
```

`VStack`은 세로 방향 레이아웃 컨테이너입니다. 내부의 뷰가 위에서 아래로 정렬됩니다.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI에서 자주 쓰는 세 가지 레이아웃:

- VStack —— 세로 정렬
- HStack —— 가로 정렬
- ZStack —— 겹쳐서 정렬(Z축)

```swift
HStack { }  // 가로 정렬
ZStack { }  // 겹침 정렬
```

각 레이아웃의 정렬 방식 예시:

![Swift](../../RESOURCE/002_view2.png)

예를 들어 HStack을 사용해 가로 정렬을 만들면:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

지구 아이콘과 텍스트가 가로로 나란히 표시됩니다.

![Swift](../../RESOURCE/002_view3.png)

가로 정렬이 필요할 때는 `HStack`, 겹쳐서 배치할 때는 `ZStack`을 사용합니다.

#### Image와 SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

이 코드는 지구 아이콘 하나를 표시합니다. 이 아이콘은 Apple의 SF Symbols 아이콘 시스템에서 옵니다.

![Swift](../../RESOURCE/002_view9.png)

코드의 의미는 지구 아이콘을 크고, 강조색으로 표시하는 것입니다.

우리는 지구 아이콘뿐 아니라 다른 아이콘도 표시할 수 있습니다.

예를 들어 배낭 아이콘:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**다른 아이콘은 어떻게 표시할까요?**

Apple이 공식 제공하는 시스템 아이콘 라이브러리인 SF Symbols를 사용하면 됩니다.

Apple Developer 공식 웹사이트에서 [SF Symbols](https://developer.apple.com/sf-symbols/)를 다운로드합니다.

![Swift](../../RESOURCE/002_sf.png)

SF Symbols 앱을 열어 봅니다.

![Swift](../../RESOURCE/002_sf1.png)

왼쪽에는 심볼 분류가, 오른쪽에는 해당 아이콘이 표시됩니다.

아이콘을 우클릭해 "이름 1개 복사하기"을 선택하면, 그 이름이 문자열로 복사됩니다.

예:

```
"globe"
"backpack"
"heart"
```

복사한 아이콘 이름을 `Image(systemName:)` 안에 넣으면, 다른 아이콘을 표시할 수 있습니다.

주의: 각 SF Symbols 아이콘에는 최소 지원 시스템 버전이 있습니다. 시스템 버전이 너무 낮으면 아이콘이 표시되지 않을 수 있으므로, SF Symbols 앱에서 호환성 정보를 확인해야 합니다.

#### modifier

SwiftUI에서 modifier는 뷰의 외형이나 동작을 바꾸는 방법입니다.

modifier를 옷처럼 생각해도 됩니다. 같은 사람이라도 다른 옷을 입으면 보이는 모습이 달라지듯, 뷰도 modifier에 따라 달라집니다.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

여기서 `imageScale`과 `foregroundStyle`은 `Image` 뷰의 modifier입니다. `Image`의 내용 자체를 바꾸지는 않고, 그 외형을 꾸며 줍니다.

**1. imageScale**

```swift
.imageScale(.large)
```

이 modifier는 SF Symbols 아이콘의 크기를 조절합니다:

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

서로 다른 옵션으로 바꾸어 보면, SF Symbols의 표시 크기가 달라지는 것을 볼 수 있습니다.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle`은 전경색을 제어합니다.

`.tint`는 현재 환경의 강조색(accent color)을 의미하며, 기본적으로 iOS에서는 파란색입니다.

전경색을 빨간색으로 바꾸고 싶다면:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text 뷰

`Text`는 문자열을 표시하는 텍스트 뷰입니다.

```swift
Text("Hello, world!")
```

예를 들어, 내 이름을 표시한다면:

```swift
Text("FangJunyu")
```

주의: 문자열은 반드시 `""` 큰따옴표로 감싸야 합니다.

여러분은 자신의 이름, 전화번호 등도 직접 표시해 볼 수 있습니다.

#### padding 여백

SwiftUI에서 `padding`은 뷰의 내용과 경계 사이에 여백을 추가하는 데 사용되며, 내부 여백(padding / content inset)에 해당합니다.

```swift
HStack {
    ...
}
.padding()
```

위 코드는 `HStack` 뷰에 시스템 기본 여백을 추가한다는 뜻입니다.

**padding이란 무엇인가요?**

`padding`은 "뷰 내용과 그 경계 사이의 빈 공간"을 의미합니다.

아래 그림에서 파란색 `HStack`에 `padding`을 적용하면, 파란 영역이 안쪽으로 줄어든 것처럼 보이며, 시각적으로 한 겹 작아진 느낌이 납니다.

![Swift](../../RESOURCE/002_view6.png)

**기본 여백**

`padding()` modifier는 기본적으로 시스템이 권장하는 표준 간격을 사용합니다.

```swift
.padding()
```

이 값은 플랫폼과 문맥에 따라 조금 다를 수 있습니다. 예를 들어:

- iOS에서는 보통 약 16 pt입니다
- macOS나 watchOS에서는 시스템 표준 간격이 다를 수 있으며, 각 플랫폼의 디자인 규범에 따라 더 크거나 작을 수 있습니다

**사용자 지정 여백**

특정 방향에만 개별적으로 여백을 줄 수도 있습니다.

1. 한 방향만 설정

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

방향 설명:

- .top: 위쪽 여백
- .bottom: 아래쪽 여백
- .leading: 앞쪽 여백
- .trailing: 뒤쪽 여백

![Swift](../../RESOURCE/002_view12.png)

주의: `leading`과 `trailing`은 언어 방향에 따라 자동으로 맞춰집니다. 예를 들어 아랍어(RTL) 환경에서는 자동으로 반전됩니다.

2. 여러 방향 동시에 설정

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

배열을 사용해 여러 방향을 동시에 지정할 수 있습니다. 배열의 구체적인 사용법은 이후 튜토리얼에서 더 자세히 설명하겠지만, 여기서는 이런 문법이 있다는 정도만 알면 됩니다.

3. 가로 또는 세로 방향 설정

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

이것은 다음과 같습니다:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**여백 제거하기**

여백이 전혀 필요 없다면 `.padding(0)`을 사용할 수 있습니다:

```swift
.padding(0)
```

또는 `padding` modifier를 직접 제거해도 됩니다:

```swift
// .padding()
```

### 6. Preview 미리보기 코드

```swift
#Preview {
    ContentView()
}
```

이 코드는 Canvas 안에서 `ContentView`의 미리보기를 생성한다는 뜻입니다.

주의: `#Preview`는 Swift 5.9 / Xcode 15에서 도입된 새로운 문법입니다. 그 이전에는 `PreviewProvider` 구조를 사용했습니다.

**Preview를 주석 처리하면 무슨 일이 생길까요?**

만약 Preview를 주석 처리하면:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas에는 더 이상 렌더링할 내용이 표시되지 않습니다.

![Swift](../../RESOURCE/002_xcode.png)

즉, `#Preview`가 Canvas에 어떤 뷰를 미리 보여 줄지 제어하는 역할을 한다는 뜻입니다.

Xcode에서 SwiftUI view를 미리보고 싶다면 `#Preview` 코드를 추가하면 됩니다. 반대로 미리보기가 필요 없으면 `#Preview` 코드를 주석 처리하거나 삭제할 수 있습니다.

## 정리

ContentView.swift 파일의 코드는 많지 않지만, 실제로는 SwiftUI의 여러 핵심 개념을 이미 포함하고 있습니다. 초보자에게는 낯설게 느껴질 수 있지만, 구조를 하나씩 분해해서 보면 SwiftUI의 기본적인 인식을 세울 수 있습니다.

이번 수업을 돌아보면, 먼저 `//` 주석을 배웠고, 주석으로 코드 로직을 설명하거나 코드를 임시로 비활성화할 수 있다는 점을 알게 되었습니다.

그다음으로 SwiftUI 파일은 반드시 SwiftUI 프레임워크를 가져와야 한다는 점을 배웠습니다:

```swift
import SwiftUI
```

프레임워크를 가져오지 않으면, 컴파일러는 `View` 같은 타입을 인식할 수 없습니다.

그리고 SwiftUI view의 기본 구조도 익혔습니다:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

여기서 `ContentView`는 view의 이름입니다.

또한 세 가지 자주 쓰는 레이아웃 컨테이너인 `VStack`(세로 정렬), `HStack`(가로 정렬), `ZStack`(겹침 정렬)도 배웠습니다.

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

이 코드는 세로 정렬 컨테이너 하나를 표시하고, 그 안에 아이콘 하나와 텍스트 하나를 보여 준다는 뜻입니다.

`Image`는 SF Symbols 아이콘을 표시할 수 있고, modifier를 통해 아이콘 크기와 색상을 제어할 수 있습니다.

`Text` 뷰는 텍스트 내용을 표시합니다.

`padding`은 뷰 주변에 투명한 여백 공간을 추가합니다.

마지막으로 `#Preview` 미리보기 코드를 통해 Canvas에서 view를 미리 볼 수 있다는 점도 알게 되었습니다.

### 수업 후 연습

초보자에게는 이번 수업 내용이 조금 복잡하게 느껴질 수 있습니다. 다음과 같은 연습을 통해 이해를 더 깊게 할 수 있습니다:

- SF Symbols 아이콘 이름 바꾸기
- 아이콘의 전경색을 검은색으로 바꾸기
- VStack을 HStack으로 바꾸기
- Image나 Text를 주석 처리하고, 미리보기 변화 관찰하기

### 보너스: 코드 완성(Code Completion)

코드를 입력할 때 주의 깊게 보면, Xcode가 자동으로 사용 가능한 옵션 목록을 보여 주는 것을 이미 눈치챘을 수도 있습니다.

예를 들어 `imageScale` modifier를 수정할 때:

```swift
.imageScale(.)
```

Xcode는 사용 가능한 옵션을 보여 줍니다:

![Swift](../../RESOURCE/002_view10.png)

이것은 코드 완성(Code Completion) 기능에 속합니다. 타입 추론과 enum 멤버 제안을 기반으로 하며, 입력 효율을 높이고 오류를 줄이는 데 도움을 줍니다.

이후 수업에서 enum(열거형)을 정식으로 소개하겠지만, 지금은 이런 기능이 있다는 정도만 간단히 알아두면 됩니다。
