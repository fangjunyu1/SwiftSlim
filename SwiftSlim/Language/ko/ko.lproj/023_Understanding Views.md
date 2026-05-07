# View 이해하기

이번 수업에서는 처음의 `ContentView`로 다시 돌아갑니다.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

우리가 처음 SwiftUI를 접했을 때, `ContentView` 안에는 이해하지 못하는 키워드가 많이 있었습니다.

예를 들어 `struct`, `View`, `var`, `body`, `some View` 같은 키워드들입니다.

그때 우리는 아마도 **코드를 `body` 안에 쓰면, 화면에 내용이 표시된다** 정도만 알고 있었을 것입니다.

이제 우리는 `struct`, 변수, 메서드, 프로토콜을 배웠으므로, 이 코드를 다시 이해하면서 SwiftUI view 사이의 관계를 파악할 수 있습니다.

## ContentView 다시 보기

SwiftUI 프로젝트를 만들면, Xcode는 기본적으로 `ContentView` 파일을 생성합니다.

예제 코드는 다음과 같습니다:

```swift
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
```

이 코드는 몇 부분으로 나누어 이해할 수 있습니다.

먼저:

```swift
import SwiftUI
```

이 코드 줄은 SwiftUI framework를 가져온다는 뜻입니다.

SwiftUI를 가져온 뒤에야 `View`, `Text`, `Image`, `VStack`, `Button` 같은 SwiftUI view를 사용할 수 있습니다.

## ContentView 구조체

이 코드 줄은 하나의 구조체를 만든다는 뜻입니다:

```swift
struct ContentView: View
```

그중:

```swift
struct ContentView
```

는 `ContentView`가 하나의 구조체라는 뜻입니다.

지난 수업에서 우리는 `struct` 구조를 알아보았습니다. 이것은 서로 다른 필드 구조를 하나로 묶을 수 있고, 속성과 메서드를 포함할 수 있습니다.

예를 들어:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

이 예제에서 `ContentView` 안에는 `name`, `printName`, `body` 세 가지 내용이 들어 있습니다.

즉 `struct`는 관련된 속성, 메서드, view 내용을 함께 구성할 수 있습니다.

![contentView](../../Resource/023_contentVIew.png)

## View는 프로토콜입니다

이 코드 줄을 계속 보겠습니다:

```swift
struct ContentView: View 
```

콜론 뒤의 `View`는 `ContentView`가 `View` 프로토콜을 따른다는 뜻입니다.

이렇게 이해할 수 있습니다. `ContentView`가 SwiftUI view가 되려면, `View` 프로토콜의 요구 사항을 만족해야 합니다.

### Identifiable 프로토콜

앞에서 영화 목록을 배울 때, 우리는 `Identifiable` 프로토콜을 접했습니다.

그때 `ForEach` 안에서 `Movie` 배열을 순회해야 했지만, `Movie` 구조에는 고유 식별자가 없어서 `ForEach` 순회를 지원하지 않았습니다.

그래서 `Movie` 구조가 `Identifiable` 프로토콜을 따르도록 해서, `ForEach`가 요구하는 고유 식별자 조건을 만족시켜야 했습니다.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` 프로토콜의 요구 사항은 **이 타입이 자신을 식별하는 `id` 필드를 가져야 한다**는 것입니다.

`Movie`가 `id` 필드를 제공하면, `Identifiable`의 요구 사항을 만족할 수 있습니다.

이렇게 하면 우리가 `ForEach`에서 사용할 때, SwiftUI가 각 데이터를 식별할 수 있습니다.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View 프로토콜

`View` 프로토콜도 마찬가지입니다.

어떤 타입이 SwiftUI view가 되려면, `View` 프로토콜을 따라야 합니다.

그리고 `View` 프로토콜의 가장 중요한 요구 사항은 `body`를 제공하는 것입니다.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

이렇게 이해할 수 있습니다. `View` 프로토콜은 **`body`가 반환하는 SwiftUI view만 받아들이며, `ContentView`는 `body`를 통해 SwiftUI view를 표시한다**고 요구합니다.

### View를 따르지 않으면 어떻게 될까요?

만약 이렇게 쓴다면:

```swift
struct ContentView {
}
```

이것은 그냥 일반 구조체일 뿐, SwiftUI view가 아닙니다.

일반 구조체 자체는 유효한 Swift 코드이므로 바로 오류가 나지는 않습니다.

하지만 이것을 preview에 넣으면:

```swift
#Preview {
    ContentView()
}
```

이때 오류가 발생합니다.

이유는 **preview는 SwiftUI view를 표시해야 하는데, 이 `ContentView`는 `View` 프로토콜을 따르지 않기 때문**입니다.

따라서 `ContentView`가 화면에 표시되기를 원한다면, `View` 프로토콜을 따르게 해야 합니다:

```swift
struct ContentView: View {
}
```

동시에 `View` 프로토콜 요구 사항에 따라 `body`를 제공해야 합니다. `body`가 없으면 compiler는 여전히 오류를 표시합니다.

올바른 작성 방법:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

이때 `ContentView`는 실제로 표시할 수 있는 SwiftUI view가 됩니다.

## body는 view 표시의 진입점입니다

SwiftUI에서 `body`는 view 내용의 진입점입니다.

```swift
var body: some View {
    Text("Hello, world!")
}
```

여기는 세 부분으로 나눌 수 있습니다:

**1. var body**

```swift
var body
```

`body`라는 이름의 변수를 정의한다는 뜻입니다.

**2. some View**

```swift
: some View
```

이 `body`가 하나의 view를 반환한다는 뜻입니다.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

표시될 view 내용을 나타냅니다. 이 코드에서는 `Text` view가 표시됩니다.

즉 `body` 안에 무엇을 쓰느냐에 따라 화면에 무엇이 표시될지가 결정됩니다.

예를 들어:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

이 코드는 **화면에 세로로 배치된 내용이 표시되고, 그 안에 두 개의 텍스트가 있다**는 뜻입니다.

### body 이름은 마음대로 바꿀 수 없습니다

주의해야 할 점은 `body`라는 이름은 마음대로 바꿀 수 없다는 것입니다.

만약 이렇게 쓴다면:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

이 `content`도 view 속성이지만, `body`를 대신할 수 없습니다.

왜냐하면 `View` 프로토콜이 요구하는 이름은 바로 `body`이기 때문입니다.

## some View란 무엇인가요?

SwiftUI에서 `some View`는 구체적인 view를 반환한다는 뜻입니다. 다만 그 view의 전체 타입을 직접 쓸 필요가 없습니다.

```swift
var body: some View
```

즉 `some View`는 타입이 없다는 뜻이 아닙니다. 실제 타입은 여전히 존재하고 compiler도 그 타입을 알고 있지만, 그 타입이 매우 복잡할 수 있으므로 Swift는 `some View`를 사용해 그것을 숨길 수 있게 합니다.

### some은 무엇인가요?

Swift에서 `some`은 opaque type을 선언하는 데 사용하는 키워드입니다.

Opaque type의 의미는 **반환값에는 구체적인 타입이 있고, compiler는 그 구체적인 타입이 무엇인지 알지만, 우리는 그 타입을 직접 쓰지 않는다**는 것입니다.

예를 들어:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

이것은 `makeView`가 `View` 프로토콜을 따르는 구체적인 타입을 반환한다는 뜻입니다.

### 왜 some이 필요할까요?

변수를 배울 때 우리는 **Swift의 값은 명시적으로 타입을 표시하거나, compiler가 자동으로 타입을 추론해야 한다**는 것을 배웠습니다.

예를 들어:

```swift
let a: Int = 10
```

여기서 상수 `a`의 타입은 `Int`입니다.

SwiftUI view도 예외가 아닙니다. `body`를 사용해 SwiftUI view를 표시할 때, `body`는 해당 SwiftUI 타입을 반환해야 합니다.

예를 들어 `body`를 사용해 `Text` 텍스트 view를 표시한다면, `body`는 해당 `Text` 타입을 반환해야 합니다.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

이 예제에서 `body` 내부에 표시되는 것은 `Text` view이고, 반환 타입도 `Text`입니다.

내부 타입과 선언된 타입이 일치할 때만 compiler의 타입 일치 요구 사항을 만족합니다.

**타입 불일치 문제**

만약 `body`의 타입을 `Color`로 설정했지만 표시하는 것이 `Text`라면:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body`의 타입과 내부 코드의 타입이 일치하지 않으므로 타입 불일치 오류가 발생합니다.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

이때는 `body`의 반환 타입을 직접 수정해야 합니다.

**복잡한 view 타입**

실제 개발에서 화면은 보통 `Text` 하나만 있지 않습니다.

더 복잡한 `VStack`을 표시해야 한다면, 복잡한 반환 타입을 직접 표시해야 합니다.

예를 들어:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

이 코드는 `VStack`을 반환하며, `VStack` 내부에는 `Image`와 `Text` 타입의 view가 있다는 뜻입니다.

`body`의 반환 타입은:

```swift
VStack<TupleView<(Image,Text)>>
```

볼 수 있듯이 이 반환 타입은 매우 복잡하며, 이전에 보지 못한 `TupleView`도 새로 등장했습니다.

여기서 `TupleView`는 **여러 child view를 하나의 view로 감싸는 것**으로 이해할 수 있습니다.

**더 복잡한 view 타입**

만약 view에 modifier를 추가하면:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

그러면 이 view의 반환 타입은 매우 복잡해져서 여기서 구체적으로 설명할 수 없습니다.

기존 반환 타입 `VStack<TupleView<(Image,Text)>>`는 modifier를 설명할 수 없으므로 오류가 발생합니다.

**some View는 반환 타입을 단순하게 합니다**

이런 상황을 위해 SwiftUI는 간결한 해결 방법을 제공합니다. 바로 `some View`를 사용해 작성 방식을 단순화하는 것입니다.

`body`를 `some View` 타입으로 바꾸면:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

view 코드를 수정할 때마다 전체 반환 타입을 다시 쓸 필요가 없습니다.

왜냐하면 `some View`는 `View` 프로토콜을 따르는 구체적인 view를 반환한다는 뜻이기 때문입니다.

다시 말해 `VStack`, `Image` 등 SwiftUI view는 모두 `View` 프로토콜을 따릅니다. modifier를 추가한 뒤 반환되는 view 타입도 여전히 `View` 프로토콜을 따릅니다.

그래서 그것들은 모두 `some View`로 반환될 수 있습니다.

### some View는 아무 view나 마음대로 반환할 수 없습니다

`some View`는 복잡한 타입을 숨길 수 있지만, "타입이 없다"는 뜻은 아닙니다.

핵심 규칙은 **compiler가 하나의 구체적인 반환 타입을 확정할 수 있어야 한다**는 것입니다.

예를 들어:

```swift
var title: some View {
    Text("Hello")
}
```

여기서 반환되는 view는 `Text`입니다.

하지만 두 개의 view를 반환하려고 하면 오류가 발생합니다:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

왜냐하면 `some View`는 최종적으로 하나의 view 구조를 반환해야 하는데, 여기서는 두 개의 독립된 view를 반환하려고 하기 때문입니다.

### 해결 방법

해결 방법은 보통 두 가지입니다. container와 `@ViewBuilder`입니다.

**1. container로 감싸기**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

이 코드에서 `title`은 하나의 `VStack`을 반환하고, `Text`와 `Image`는 `VStack` 안의 child view입니다.

`some View`가 받는 view 구조는 하나의 `VStack<...>`이므로, `some View`가 하나의 view 구조를 반환해야 한다는 요구 사항을 만족합니다. 

이것이 SwiftUI를 처음 배울 때부터 가장 바깥쪽에 `VStack` container를 사용해 view 코드를 감싸라고 권하는 이유입니다.

**2. @ViewBuilder 사용하기**

`some View` 앞에 `@ViewBuilder` modifier를 추가할 수도 있습니다:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder`는 여러 view를 하나의 반환 결과로 조합할 수 있습니다.

본질은 여전히 여러 view를 하나의 view로 합쳐서, `some View`가 하나의 view 구조를 반환해야 한다는 요구 사항을 만족시키는 것입니다.

### body에는 왜 여러 view를 직접 쓸 수 있을까요?

만약 `var body` 안에 여러 view를 작성하면, 예를 들어:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

어떤 경우에는 이런 `body`가 오류를 내지 않습니다.

이유는 `View` 프로토콜 안의 `body`가 기본적으로 `@ViewBuilder`를 지원하기 때문입니다:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` 프로토콜의 source code에서 `@ViewBuilder`가 이미 `body` 변수를 수식하고 있음을 볼 수 있습니다.

따라서 `body`는 일반적인 `some View`보다 한 층 더 특별한 처리를 가지고 있고, SwiftUI가 자동으로 여러 view를 하나의 view로 조합해 줍니다.

**container 사용을 추천합니다**

초보자가 더 쉽게 이해할 수 있도록, 여러 view를 구성할 때는 먼저 `VStack`, `HStack`, `ZStack`, `Group` 같은 container를 사용하는 것을 추천합니다.

예를 들어:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

이렇게 하면 코드가 더 직관적입니다. **바깥쪽은 하나의 `VStack`이고, 안에는 두 개의 child view가 있습니다.**

## view 나누기

화면이 비교적 단순하다면 모든 코드를 `body` 안에 쓸 수 있습니다.

예를 들어:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote에 오신 것을 환영합니다")
                Text("좋은 아침입니다")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("클릭해 주세요") {
                print("클릭해 주세요 ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

이 view의 표시 스타일:

![view](../../Resource/023_view1.png)

이 코드는 정상적으로 실행될 수 있지만, view 코드가 매우 복잡해지면 `body` 안의 코드가 점점 길어지고, 읽고 수정하기 어려워집니다.

이때 서로 다른 영역을 독립적인 view 속성으로 나눌 수 있습니다.

### 상단 view 나누기

예를 들어 상단 영역을 분리합니다:

```swift
var topHome: some View {
    HStack {
        Text("홈")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

여기서 `topHome`은 하나의 변수가 되며, 하나의 view를 반환합니다.

반환되는 것이 view이므로, 타입은 이렇게 쓸 수 있습니다:

```swift
some View
```

이것은 사실 `body`와 같은 사용 방식입니다:

```swift
var topHome: some View { }
var body: some View { }
```

둘 다 변수를 사용해 view를 표시하고, 반환 타입은 `some View`입니다.

### 다른 view 나누기

그다음 다른 부분도 계속 나눕니다:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote에 오신 것을 환영합니다")
        Text("좋은 아침입니다")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("클릭해 주세요") {
        print("클릭해 주세요")
    }
    .buttonStyle(.borderedProminent)
}
```

나눈 뒤에는 view 변수를 `body` 안에 넣을 수 있습니다:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("홈")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote에 오신 것을 환영합니다")
            Text("좋은 아침입니다")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("클릭해 주세요") {
            print("클릭해 주세요")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

이제 `body`는 페이지 구조를 설명하는 일만 담당합니다:

```swift
topBar
welcomeText
colorList
clickButton
```

각 부분의 구체적인 구현은 아래의 해당 속성 안에 있습니다.

이런 방식으로 view를 나누면 페이지 구조가 더 명확해지고, 각 view 영역에 이름이 있으므로 읽기가 더 직관적입니다.

어떤 부분의 코드를 수정할 때도 복잡한 코드 속에서 찾는 것이 아니라, 해당 view 영역을 바로 찾을 수 있습니다.

### some View는 하나의 view를 반환합니다

이렇게 나눈 view 안에서 여러 view를 반환하려고 하면:

```swift
var topBar: some View {
    Text("홈")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View`는 하나의 view 구조만 반환할 수 있으므로 오류가 발생합니다.

`body`와 다르게 일반 computed property에는 기본적으로 `@ViewBuilder`가 없습니다.

따라서 여러 view를 반환해야 한다면, `VStack`, `HStack` 또는 `Group` container를 사용해 여러 view를 하나로 조합할 수 있습니다.

```swift
var topBar: some View {
    VStack {
        Text("홈")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

또는 `@ViewBuilder`를 추가해 view를 조합할 수 있습니다:

```swift
@ViewBuilder
var topBar: some View {
    Text("홈")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

이렇게 하면 여러 view를 반환할 수 있습니다.

### if가 여러 view를 반환하는 경우

예를 들어:

```swift
var topHome: some View {
    if step == "홈" {
        HStack {
            Text("홈")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("없음")
    }
}
```

이 코드에서 `topHome`은 `step`의 내용에 따라 `HStack` 또는 `Text`라는 두 가지 다른 타입의 view를 반환합니다.

`some View`는 확정된 하나의 구체적인 반환 타입이 필요하므로, 일반 computed property 안에서 `if`의 두 branch가 서로 다른 타입의 view를 직접 반환할 수 없고 오류가 발생합니다.

**해결 방법은 여전히 container로 감싸거나 `@ViewBuilder` modifier를 사용하는 것입니다.**

### 나눈 view에는 왜 괄호를 쓰지 않을까요?

`body` 안에서 분리한 view 속성을 사용할 때, 우리는 직접 이렇게 씁니다:

```swift
topBar
welcomeText
colorList
clickButton
```

이렇게 쓰지 않습니다:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

왜냐하면 `topBar`, `welcomeText`, `colorList`, `clickButton`은 변수이기 때문입니다. 이 변수는 사실 computed property이지, 메서드가 아닙니다.

**속성에는 괄호가 필요 없습니다.**

만약 메서드로 작성해도 비슷한 효과를 구현할 수 있습니다:

```swift
func topBar() -> some View {
    HStack {
        Text("홈")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

이 코드도 비슷한 효과를 구현할 수 있습니다. 이 메서드를 호출하면 하나의 view가 반환됩니다.

사용할 때는 이렇게 써야 합니다:

```swift
topBar()
```

SwiftUI에서는 전달할 parameter가 없는 view를 나누기만 한다면, computed property 방식을 사용하는 것이 더 흔합니다.

```swift
var topBar: some View { ... }
```

## 중첩 view

코드를 속성으로 나누는 것 외에도, 새로운 view 구조체를 만들 수 있습니다.

예를 들어:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

이 `PinkColorView`는 `ContentView`와 마찬가지로 독립적인 SwiftUI view입니다.

`ContentView` 안에서 표시해야 한다면, view 이름 뒤에 `()`를 붙이면 됩니다.

예를 들어:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

여기서:

```swift
PinkColorView()
```

는 `PinkColorView` 인스턴스를 만든다는 뜻입니다.

`PinkColorView`가 `View` 프로토콜을 따르므로, `Text`, `Image`, `Button`처럼 다른 view 안에 넣어 표시할 수 있습니다.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

이것이 view 중첩입니다. 하나의 view는 다른 view 안에 표시될 수 있습니다.

## view 속성인가, 새로운 view인가?

view 코드가 비교적 단순할 때는 보통 코드를 나눌 필요가 없습니다. 코드가 비교적 복잡할 때만 view를 나누는 것을 권장합니다.

### view 속성을 사용하는 경우

현재 view 안의 작은 내용 영역일 뿐이라면, view 속성을 사용할 수 있습니다.

예를 들어:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

이런 내용은 보통 현재 view 안에서만 사용됩니다.

### 새로운 view를 만드는 경우

이 내용들이 비교적 독립적이거나, 앞으로 여러 페이지에서 재사용될 수 있다면, 새로운 view를 만드는 것이 더 적합합니다.

예를 들어:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

이것은 제목 view입니다. 이 view를 공통 component로 만들어 다른 view에서 재사용하고 싶을 수 있습니다.

새로운 view를 만들 수 있습니다:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

그다음 다른 곳에서 사용합니다:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

이때 이 view는 재사용 가능한 독립 component가 됩니다.

간단히 정리하면:

- 현재 view의 내용 영역: `var xxx: some View`를 사용할 수 있습니다
- 재사용 가능한 독립 component: 새로운 `struct XxxView: View`를 만들 수 있습니다
- 데이터를 전달해야 하는 component: 보통 새로운 view를 만드는 것이 더 적합합니다.

## 정리

이번 수업에서는 SwiftUI에서 가장 기본적이면서도 가장 중요한 view 구조를 다시 이해했습니다.

`ContentView`는 구조체입니다. `struct`로 정의되며, 페이지와 관련된 코드를 조직하는 데 사용됩니다.

`View`는 프로토콜입니다. 어떤 구조체가 SwiftUI view가 되려면, `View` 프로토콜을 따라야 합니다.

`body`는 `View` 프로토콜이 우리에게 제공하라고 요구하는 내용입니다. 이 view가 어떤 내용을 표시할지 결정합니다.

`some View`는 어떤 구체적인 view를 반환한다는 뜻이며, 그 복잡한 전체 타입을 쓸 필요가 없습니다.

view 코드가 길어질 때, `var xxx: some View`를 사용해 view 코드를 여러 작은 영역으로 나눌 수 있습니다.

어떤 내용이 비교적 독립적이거나 재사용이 필요할 때, 새로운 view 구조체를 만들고 다른 view에서 `XxxView()`를 통해 표시할 수 있습니다.

간단히 말해, SwiftUI의 화면은 하나하나의 view를 조합해 만들어집니다. 하나의 페이지는 여러 작은 view를 포함할 수 있고, 작은 view도 다시 다른 view를 포함할 수 있습니다.
