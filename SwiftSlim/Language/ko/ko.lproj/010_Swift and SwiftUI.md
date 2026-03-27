# Swift와 SwiftUI

Apple 플랫폼 개발을 배울 때, 많은 튜토리얼은 Swift와 SwiftUI를 따로 설명하는 경향이 있습니다. 이렇게 되면 초보자는 둘이 완전히 독립된 두 기술이라고 오해하며, 전체 흐름이 끊어진 것처럼 느끼기 쉽습니다.

하지만 실제로는 Swift와 SwiftUI는 깊이 결합된 하나의 전체입니다. Swift는 프로그래밍 언어로서 로직과 데이터를 담당하고, SwiftUI는 Swift 위에 구축된 사용자 인터페이스 프레임워크로서 뷰의 렌더링과 상호작용을 담당합니다.

이번 수업은 다음과 같은 명확한 인식 틀을 세우는 데 도움을 줍니다: Swift란 무엇인가, SwiftUI란 무엇인가, 그리고 이 둘이 코드 안에서 어떻게 협력하는가.

## Swift란 무엇인가?

Swift는 Apple이 만든 현대적인 프로그래밍 언어로, iOS, macOS, watchOS, tvOS 등의 플랫폼용 앱을 개발하는 데 사용됩니다.

![swift](../../RESOURCE/010_swift.png)

Swift는 강타입 정적 언어이며, 설계상 안전성을 더 중시합니다. 그래서 null pointer, 범위 초과 같은 많은 흔한 프로그래밍 오류를 줄여 주며, C와 Objective-C와도 자연스럽게 통합될 수 있습니다.

실제 개발에서 Swift는 주로 앱의 로직 부분을 담당합니다. 예를 들면 데이터 처리, 네트워크 요청, 저장 작업 등이 여기에 해당합니다.

## SwiftUI란 무엇인가?

SwiftUI는 Apple이 2019년에 발표한 새로운 UI 구축 프레임워크입니다. SwiftUI는 선언형 프로그래밍 방식을 채택하여, 개발자가 더 간결한 코드로 화면 구조와 상호작용 동작을 설명할 수 있게 해 줍니다.

![swiftui](../../RESOURCE/010_swiftui.png)

선언형 프로그래밍이란, 개발자가 시스템에게 "무엇을 보여 주고 싶은지"만 알려 주면, 시스템이 데이터 변화에 따라 자동으로 뷰를 새로 고친다는 의미입니다. 더 이상 화면 상태를 직접 수동으로 갱신할 필요가 없기 때문에, UI 개발의 복잡성이 크게 줄어듭니다.

SwiftUI의 핵심은 뷰 컴포넌트(`Text`, `Image`, `Button` 등)와 레이아웃 컨테이너(`VStack`, `HStack`, `ZStack`)입니다. 이 구성 요소들은 데이터 바인딩과 상태 관리를 통해 상호작용하며, 화면이 데이터 변화에 반응하고 자동으로 갱신되도록 합니다.

## Swift와 SwiftUI는 어떻게 협력할까?

Swift와 SwiftUI의 역할은 다음과 같이 정리할 수 있습니다:

**1. Swift: 로직과 데이터 처리**

Swift는 주로 데이터를 관리하고, 상태를 저장하고, 로직을 실행하는 데 사용됩니다. 이런 코드는 보통 화면 렌더링에 직접 영향을 주지 않고, 데이터와 동작을 처리하는 역할을 맡습니다.

예를 들어, Swift에서 데이터를 처리하는 코드:

```swift
let markdown = try? String(contentsOf: url)
```

이런 코드는 변수 선언, 상수 정의, 함수, 제어 흐름 등을 포함하며, 화면 표시 자체를 직접 바꾸지는 않습니다.

**2. SwiftUI: 화면 선언과 렌더링**

SwiftUI는 사용자 인터페이스의 레이아웃과 내용을 구성하는 데 사용되며, 주로 화면 렌더링과 뷰 상호작용을 담당합니다.

예를 들어 SwiftUI로 텍스트 뷰를 하나 만들면:

```swift
Text("SwiftSlim")
```

이런 코드는 화면 요소를 만들고 제어하는 코드이며, 사용자 인터페이스와 직접 관련됩니다.

### 기본 예제

아래는 간단한 SwiftUI 예제입니다:

```swift
// ContentView.swift

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

이 예제에서:

**SwiftUI 코드**: `VStack`, `Image`, `Text`, `padding`은 모두 SwiftUI에 속하며, 화면 표시와 레이아웃을 담당합니다.

**Swift 코드**: 파일 상단의 `//` 주석과 `import SwiftUI`는 Swift 코드 구조에 속합니다. 하단의 `#Preview`는 Xcode 미리보기를 위한 매크로이며, 실제 화면 렌더링에는 참여하지 않습니다.

### 발전된 예제

실제 프로젝트에서는 Swift와 SwiftUI가 자주 섞여 사용되며, 서로가 잘하는 일을 맡습니다:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

이 예제에서:

**SwiftUI 코드**: `@State`는 SwiftUI 특유의 property wrapper로, 뷰의 가변 상태를 선언하는 데 사용됩니다. `Button`과 `Text`는 SwiftUI 뷰 컴포넌트로서, 화면 표시와 사용자 상호작용을 담당합니다.

**Swift 코드**: `private var name`과 `func printName()`는 Swift 코드로서, 데이터를 저장하고 로직을 실행하는 역할을 하며, 화면 렌더링 자체를 직접 담당하지는 않습니다.

사용자가 버튼을 클릭하면, SwiftUI는 버튼 안의 동작 코드를 트리거합니다:

```swift
Button("Print") {
    printName()
}
```

여기서 `Button`은 SwiftUI 컴포넌트이고, 실제로 실행되는 `printName()` 함수는 Swift 코드이며, 구체적인 로직 처리를 담당합니다.

이러한 협력 덕분에 Swift와 SwiftUI는 자연스럽게 결합됩니다. Swift는 데이터와 로직을 맡고, SwiftUI는 사용자 인터페이스를 맡습니다.

## Swift와 SwiftUI 코드는 보통 어디에 작성할까?

SwiftUI에서 화면은 `body` 속성이 반환하는 뷰를 통해 구성됩니다. 따라서 화면을 설명하는 코드는 보통 모두 `body` 안에 작성됩니다.

예:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

이 예에서 `Text`는 SwiftUI 뷰 컴포넌트이므로, 반드시 `body` 안에 작성해야 합니다. SwiftUI는 `body`를 읽어 화면을 생성하기 때문입니다.

화면과 직접 관련 없는 코드, 예를 들어 변수, 함수, 데이터 처리 로직은 보통 `body` 바깥에 작성합니다. 예:

```swift
struct ContentView: View {

    // Swift：데이터 또는 로직
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：화면
    var body: some View {
        Text(name)
    }
}
```

주의할 점은, `body` 안에서도 여전히 Swift 문법을 사용할 수 있다는 것입니다. 예를 들어 `if`, `for` 같은 제어 흐름 문은 SwiftUI 뷰 생성 과정을 제어하는 데 사용될 수 있습니다:

```
if isLogin {
    Text("Welcome")
}
```

따라서 SwiftUI 개발에서는 이렇게 단순하게 이해할 수 있습니다: 뷰 코드(`Text`, `Image`, `Button` 등)는 보통 `body` 안에 쓰고, 데이터와 로직 코드(변수, 함수 등)는 보통 `body` 바깥에 씁니다.

## Swift 파일

학습이 더 깊어지면 MVVM 아키텍처도 접하게 됩니다. 여기서 ViewModel과 Model 계층은 보통 순수 Swift 코드로 이루어지며, 뷰 계층(SwiftUI)과 완전히 분리됩니다.

예를 들어, 앱 상태를 관리하는 클래스:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

또는 데이터 구조를 설명하는 구조체:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

이런 파일들의 역할은 데이터를 관리하고 영속화하는 것이며, 직접 화면에 표시되지는 않습니다. 따라서 완전히 Swift에 속합니다.

## 역사적 배경

Swift와 SwiftUI의 관계를 제대로 이해하려면, Apple 개발 기술이 어떻게 발전해 왔는지도 알아둘 필요가 있습니다. 2026년까지 이 기술 스택은 여러 번의 반복을 거쳤습니다.

### Swift의 역사

Swift가 등장하기 전에는 Objective-C가 Apple 플랫폼의 주요 프로그래밍 언어였으며, C 언어와 혼합 프로그래밍도 지원했습니다. 문법이 비교적 장황해서 초보자에게는 진입 장벽이 높았습니다:

```Obj-c
// Objective-C 문법
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014년, Apple은 WWDC에서 Swift 언어를 발표했습니다. Swift는 문법이 더 현대적이고, 타입 안전성도 더 높아서, 점차 Objective-C를 대체하며 주류 개발 언어가 되었습니다:

```swift
// Swift 문법
let name = "Fang"
print("Hello, \(name)")
```

하지만 그렇다고 해서 Objective-C가 완전히 역사 속으로 사라진 것은 아닙니다. 많은 기존 프로젝트와 하위 프레임워크에서는 여전히 널리 사용되고 있습니다. 기본 문법을 이해해 두면 오래된 프로젝트를 유지보수하거나 시스템 하부 구조를 이해하는 데 여전히 가치가 있습니다.

### SwiftUI의 역사

SwiftUI가 등장하기 전에는, iOS는 **UIKit**, macOS는 **AppKit**을 사용했습니다. 이 두 프레임워크는 "명령형" 프로그래밍 방식을 사용했습니다. 개발자는 Storyboard에서 컨트롤을 드래그하거나 직접 코드를 작성해 뷰 상태를 제어해야 했고, 코드 양이 많고 유지보수 비용도 높았으며, 화면 로직이 복잡할수록 이런 문제가 더 두드러졌습니다.

![storyboard](../../RESOURCE/010_xcode.png)

2019년, Apple은 WWDC에서 SwiftUI를 공식 발표했습니다. SwiftUI는 "선언형" 프로그래밍 패러다임을 도입해 UI 개발 과정을 크게 단순화했습니다.

![storyboard](../../RESOURCE/010_xcode1.png)

주목할 점은, SwiftUI가 완전히 독립된 바닥 구현은 아니라는 것입니다. 각 플랫폼에서 SwiftUI는 본질적으로 UIKit(iOS)이나 AppKit(macOS)와 연결되고 협력하며, 내부적으로는 여전히 이 두 프레임워크에 의존해 동작합니다.

### Swift와 UIKit/AppKit의 관계

Swift는 범용 프로그래밍 언어로서 Apple의 각 플랫폼에서 실행될 수 있지만, UIKit이나 AppKit을 완전히 대체하는 것은 아닙니다. 복잡한 UI 요구사항이 있거나, SwiftUI가 아직 지원하지 않는 기능이 필요한 경우에는 여전히 UIKit이나 AppKit의 도움이 필요합니다.

예를 들어 UIKit은 복잡한 뷰 컨트롤러 관리, 애니메이션 효과, 제스처 인식 등에서 매우 성숙하며, 많은 실제 생산 환경 검증을 거쳤습니다. SwiftUI 역시 이런 부분의 능력이 계속 강화되고 있지만, 일부 경계 상황에서는 여전히 한계가 존재합니다.

그래서 많은 개발자들은 프로젝트 안에서 SwiftUI와 UIKit(또는 AppKit)을 혼합해서 사용하며, 각각의 장점을 최대한 활용합니다.

이 관점에서 보면 SwiftUI는 UIKit / AppKit에 대한 더 높은 수준의 래퍼라고 이해할 수 있습니다. SwiftUI를 배우는 동시에 UIKit과 AppKit의 기본 개념도 적절히 알아 두면, 오래된 프로젝트를 유지보수하거나 복잡한 기능을 구현할 때 더 합리적인 기술 선택을 할 수 있습니다.

## 정리

**Swift**: 주로 로직 작성, 데이터 처리, 제어 흐름 등에 사용되며, 뷰 레이아웃과는 직접 관련이 없습니다.

**SwiftUI**: 선언형 방식으로 사용자 인터페이스를 만드는 데 사용되며, 뷰 내용과 레이아웃 코드는 SwiftUI에 속합니다.

실제 개발에서는 Swift와 SwiftUI를 보통 함께 사용합니다. Swift는 로직을 처리하고, SwiftUI는 화면을 처리합니다.

Objective-C와 UIKit에서 Swift와 SwiftUI로 이어지는 흐름 속에서, Apple의 개발 환경은 점점 더 현대적이고 간결한 프로그래밍 방식으로 이동하고 있습니다. 하지만 UIKit과 AppKit 역시 많은 전통적인 프로젝트에서 여전히 무시할 수 없는 존재입니다.

Swift와 SwiftUI의 관계를 이해하면, 우리는 iOS/macOS 개발을 더 효율적으로 진행할 수 있고, 오래된 프로젝트를 유지보수할 때도 더 합리적인 기술 선택을 할 수 있게 됩니다。
