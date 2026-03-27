# SwiftUI 뷰 생명주기

지난 수업에서 우리는 `@State` 변수가 뷰의 생명주기를 따라간다는 것을 알았고, `onAppear`의 기본 사용법도 배웠습니다.

이번 수업에서는 SwiftUI 뷰의 생명주기를 더 깊이 이해해 봅니다. 뷰가 어떻게 생성되고 표시되는지, 뷰 안의 변수가 어떻게 생성되고 다시 만들어지는지, 그리고 `onAppear`, `onDisappear`, `init` 생성자도 함께 배웁니다.

이 지식을 바탕으로, SwiftUI 뷰 전체 구성 과정에 대한 더 완전한 인식을 세울 수 있습니다.

## 앱 시작 순서

iOS 프로젝트를 만들면, Xcode는 기본적으로 두 개의 파일을 생성합니다:

```
ContentView.swift
프로젝트명 + App.swift
```

이 중 `"프로젝트명 + App".swift`는 전체 앱의 진입 파일입니다.

예:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 코드 실행 흐름

우리가 App을 실행할 때(시뮬레이터 또는 실제 기기), 시스템은 먼저 `@main` 키워드를 찾습니다:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

진입 파일을 확인한 뒤, 코드 실행을 시작합니다.

먼저 `App` 구조체로 들어가 `body` 안의 코드를 실행하고, 그다음 `WindowGroup`을 생성한 뒤 그 안의 `ContentView`를 로드합니다.

### WindowGroup의 역할

`WindowGroup`은 창을 관리하는 데 사용됩니다:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS 시스템은 다중 창을 지원하고, iPhone은 보통 하나의 창만 가집니다.

그래서 iPhone에서는 `WindowGroup`이 주로 첫 번째 화면 표시를 관리합니다.

### 뷰 로드 과정

시스템이 `ContentView`를 찾은 뒤:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI는 `body` 안의 코드를 실행한 뒤, 반환된 뷰 구조(`VStack`, `Text` 등)를 바탕으로 인터페이스를 구성하고, 이를 화면에 표시합니다.

이 단계들이 끝나면, 우리는 화면에서 `ContentView`를 볼 수 있게 됩니다.

![ContentView](../../Resource/016_view1.png)

주의할 점은, `body`의 역할은 뷰를 생성하는 것이지 저장하는 것이 아니라는 것입니다.

즉, 뷰가 새로 고쳐질 때마다 SwiftUI는 `body`를 다시 계산하고, 새로운 뷰 구조를 생성합니다.

### 미리보기 뷰 로직

Xcode 미리보기(Canvas)와 실제 실행은 서로 다른 메커니즘입니다.

예를 들어, 진입 파일에 디버그 출력을 하나 추가해 보면:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode에서 ContentView를 미리보기로 볼 때는, 실행이 `@main` 진입점부터 시작되지 않기 때문에 진입 파일 안의 `onAppear`는 트리거되지 않습니다.

하지만 시뮬레이터나 실제 기기에서 실행하면, 시스템은 `@main`부터 시작해 앱 전체 흐름을 실행하므로, 진입점 안의 `onAppear`도 호출되고 디버그 정보가 출력됩니다.

핵심은, Xcode 미리보기는 단지 "부분 렌더링"이며 현재 뷰를 보여 주기 위한 것이라는 점입니다. 반면 시뮬레이터와 실제 기기는 "완전한 실행 환경"을 제공하며, 앱 전체가 실행됩니다.

따라서 App 기능을 테스트할 때는 시뮬레이터 또는 실제 기기를 기준으로 해야 하며, Xcode 미리보기는 완전한 실행 환경을 제공하지 않습니다.

## 뷰의 생명주기

현재 단계에서는 우리의 모든 코드가 ContentView 안에 집중되어 있습니다. 하지만 실제 앱에서는 하나의 App 안에 여러 뷰가 포함되고, 다양한 장면에서 서로 전환됩니다.

예를 들어 "저금통"에서는:

![PiggyBank](../../Resource/016_view.png)

"저금"을 클릭하면 `SaveView`가 표시되고, 저금이 끝나거나 닫으면 `SaveView`가 제거됩니다.

이 과정이 바로 하나의 뷰 생명주기입니다. 뷰가 생성되고, 표시되고, 마지막에 제거됩니다.

### 앱 닫기

App이 닫히면, 모든 뷰가 제거되고 관련 상태도 함께 사라집니다.

따라서 ContentView와 다른 뷰들 역시 메모리에서 제거되며, 앱의 전체 실행 상태도 함께 초기화됩니다.

## 뷰 안 변수의 생명주기

SwiftUI에서 변수의 생명주기는 보통 뷰와 함께 묶여 있습니다.

예:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State 변수

`@State`로 선언한 변수는 뷰의 생명주기에 묶여 있습니다.

```swift
@State private var name = "FangJunyu"
```

뷰가 생성될 때 `name`도 함께 만들어지고, 뷰가 제거될 때 `name`도 함께 사라집니다.

이것이 바로 `UserDefaults` 같은 방법으로 데이터 영속화를 해야 하는 이유입니다.

### body 내부 변수

`body` 안에 정의된 변수:

```swift
var num = 10
```

이 변수의 생명주기는 `body`의 실행 과정에 묶여 있습니다.

SwiftUI의 상태가 바뀌면, 예를 들어:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name`이 바뀌는 순간, `@State`는 데이터 변화가 일어났음을 감지하고 SwiftUI에게 뷰를 다시 계산하라고 알립니다. 그러면 `body`가 다시 계산됩니다.

`body`가 다시 계산될 때는, `body` 안의 모든 코드도 다시 실행되고, `body` 안의 변수(`num` 같은 것들)도 다시 생성됩니다.

이것이 바로 `body` 안에 복잡한 변수를 정의하는 것을 권장하지 않는 이유입니다.

왜냐하면, 뷰가 새로 고쳐질 때마다 `body` 안의 변수는 매번 새로 생성되며, 이는 계산 비용을 늘리고 성능에도 영향을 줄 수 있기 때문입니다.

SwiftUI에서는 데이터의 종류에 따라 서로 다른 관리 방식을 써야 합니다. 뷰 생명주기와 함께 가야 하는 데이터는 `@State`로 저장하고, 일시적인 계산 데이터는 `body` 안에 둘 수 있습니다.

## onAppear와 onDisappear

지난 수업에서 우리는 `onAppear`를 이미 배웠습니다. 뷰가 화면에 나타날 때 `onAppear`가 호출됩니다.

```swift
.onAppear {}
```

예:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode 미리보기나 실제 실행 중에 `onAppear` 안의 디버그 출력을 확인할 수 있습니다.

### onDisappear

`onAppear`에 대응하는 것은 `onDisappear`입니다:

```swift
.onDisappear {}
```

뷰가 닫힐 때 `onDisappear`가 호출됩니다.

예:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

뷰가 제거될 때, `onDisappear` 안의 코드가 실행됩니다.

팁: 현재 단계에서 사용하는 ContentView는 앱의 루트 뷰이므로, 직접 닫거나 제거할 수 없습니다. 따라서 이 단계에서는 `onDisappear`의 실행 효과를 직접 관찰할 수 없습니다.

이후 페이지 이동이나 새로운 뷰 열기를 배우게 되면, 그때 `onDisappear`가 호출되는 것을 볼 수 있습니다.

## 생성과 표시 로직

주의할 점은, 뷰의 생성과 표시가 서로 다른 두 단계라는 것입니다.

뷰가 생성될 때는 struct의 생성자가 호출됩니다:

```swift
init() {}
```

SwiftUI 뷰는 struct 구조이기 때문에:

```swift
struct ContentView: View { ... }
```

뷰 인스턴스가 생성될 때 `init` 생성자가 실행되고, 뷰가 화면에 표시될 때 비로소 `onAppear`가 호출됩니다.

예:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode에서 뷰를 미리보기할 때, 디버그 출력은 다음과 같이 보일 수 있습니다:

```swift
Create ContentView
Show ContentView
```

이것은 먼저 `init`이 실행되어 뷰가 생성되고, 그다음 `body` 안의 코드가 계산되며, 마지막으로 뷰가 화면에 표시되면서 `onAppear`가 실행된다는 뜻입니다.

따라서 뷰의 생성 단계와 표시 단계는 서로 분리되어 있다는 점을 이해해야 합니다.

### init 생성자

`init`은 Swift의 기본 문법으로, `struct`와 `class` 모두에서 정의할 수 있으며, 객체를 초기화하는 데 사용됩니다.

```swift
init() {}
```

SwiftUI에서는 뷰가 생성될 때 시스템이 뷰의 `init` 메서드를 호출하며, 이 메서드를 통해 파라미터를 받거나 데이터를 초기화할 수 있습니다.

직접 `init`을 작성하지 않으면, Swift는 `struct`를 위해 기본 생성자를 자동으로 만들어 줍니다.

ContentView 같은 SwiftUI 뷰에서는, 뷰가 생성될 때 `init`이 실행되고, 뷰가 표시될 때 `onAppear`가 실행됩니다.

따라서 `init`은 뷰가 생성될 때 실행되는 생성자이며, 이후 파라미터를 전달하거나 데이터를 초기화할 때 유용하게 사용됩니다.

## 정리

이번 수업에서는 앱 시작 순서, 즉 진입 파일에서 ContentView 파일까지 이어지는 코드 실행 흐름을 배웠습니다.

또한 SwiftUI 뷰 생명주기를 이해했습니다: 뷰가 생성될 때는 `init`, 화면에 표시될 때는 `onAppear`, 뷰가 제거되거나 닫힐 때는 `onDisappear`가 실행됩니다.

뷰 갱신 메커니즘도 배웠습니다: 뷰는 상태에 의해 구동되며, `@State` 같은 상태가 바뀌면 SwiftUI는 뷰를 새로 고치고 `body`를 다시 계산합니다. 이때 `body` 안의 변수들도 함께 새로 생성됩니다.

변수의 생명주기는 뷰의 생명주기에 묶이고, `body` 안의 임시 데이터는 뷰가 새로 고쳐질 때마다 다시 생성됩니다.

이런 생명주기와 변수의 동작을 이해하면, 코드를 더 잘 조직할 수 있고 앱 로직도 훨씬 더 명확하게 만들 수 있습니다。
