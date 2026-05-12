# Xcode 파일 관리

이번 수업에서는 Xcode에서 자주 사용하는 파일 작업을 배워 보겠습니다.

앞의 수업에서는 대부분의 코드를 `ContentView` 안에 작성했습니다. 이렇게 하면 코드와 표시 결과를 관찰하기 쉽습니다.

예를 들면:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

하지만 실제 App에서는 보통 모든 코드를 하나의 파일 안에 작성하지 않습니다.

화면, 컴포넌트, 기능이 점점 많아지면 서로 다른 뷰를 서로 다른 SwiftUI 파일로 분리해야 합니다.

예를 들면:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

이렇게 하면 코드 구조가 더 명확해지고, 이후 유지보수와 수정도 쉬워집니다.

## 파일을 관리해야 하는 이유

SwiftUI에서 하나의 화면이나 하나의 컴포넌트는 보통 하나의 독립적인 뷰 파일로 작성할 수 있습니다.

예를 들면:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

여기서 `CardView`는 하나의 SwiftUI 뷰입니다.

모든 뷰를 `ContentView` 안에 작성하면 코드가 점점 길어지고 읽기도 점점 어려워집니다.

따라서 우리는 파일을 만들고, 이름을 바꾸고, 삭제하는 방법과 폴더를 사용해 서로 다른 코드 파일을 관리하는 방법을 배워야 합니다.

## SwiftUI 파일 만들기

Xcode에서 SwiftUI 파일을 만드는 일반적인 방법은 두 가지입니다.

하나는 빈 파일을 만든 다음 직접 코드를 작성하는 방법입니다.

다른 하나는 SwiftUI 템플릿 파일을 만들어 Xcode가 기본 코드를 자동으로 생성하게 하는 방법입니다.

초보자에게는 SwiftUI 템플릿 파일을 사용하는 것을 더 권장합니다. 기본 구조를 자동으로 생성해 주기 때문입니다.

### 빈 파일 만들기

Xcode 왼쪽의 Navigator 영역에서 빈 공간이나 폴더를 마우스 오른쪽 버튼으로 클릭한 다음 `New Empty File`을 선택합니다.

작업 위치는 다음과 같습니다.

![xcode](../../../Resource/027_view1.png)

빈 파일을 만든 뒤 Xcode는 보통 `Untitled.swift`와 같은 이름 없는 Swift 파일을 생성합니다.

이 파일의 이름을 `TestView.swift`로 바꿀 수 있습니다.

SwiftUI 프로젝트에서 이 파일이 하나의 뷰를 표시하는 데 사용된다면, 보통 이름 뒤에 `View`를 붙이는 것을 권장합니다.

예를 들면:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

강제 규칙은 아니지만, 이렇게 하면 이 파일이 뷰 파일이라는 것을 한눈에 알 수 있습니다.

빈 파일을 만든 뒤 파일 안에는 기본 주석만 있을 수도 있고, 비어 있을 수도 있습니다. 이는 Xcode 버전과 생성 방식에 따라 달라집니다.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

이때 SwiftUI 코드를 직접 작성해야 합니다.

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

이렇게 하면 간단한 SwiftUI 뷰 파일이 만들어집니다.

### 파일 이름 바꾸기

파일을 만든 뒤 파일 이름을 수정하고 싶다면, Xcode 왼쪽 Navigator 영역에서 파일을 선택한 다음 return 키 `⏎`를 누르면 됩니다.

![xcode](../../../Resource/027_view2.png)

이렇게 하면 파일 이름을 수정할 수 있습니다.

주의할 점은, 파일 이름을 수정해도 코드 안의 뷰 이름이 자동으로 수정되지는 않는다는 것입니다.

예를 들어 파일 이름을 `ProfileView.swift`로 바꾼 뒤에도, 코드 안에는 여전히 `struct TestView: View`가 남아 있을 수 있습니다.

이것이 반드시 오류를 일으키는 것은 아니지만, 혼란을 만들기 쉽습니다.

따라서 파일 이름과 뷰 이름을 일치시키는 것을 권장합니다. 예를 들어 파일 이름이 `ProfileView.swift`라면, 뷰 이름도 `ProfileView`를 사용합니다.

## SwiftUI 템플릿 파일 만들기

빈 파일을 만드는 것 외에도 SwiftUI 템플릿 파일을 직접 만들 수 있습니다.

Xcode 왼쪽 Navigator 영역에서 빈 공간이나 폴더를 마우스 오른쪽 버튼으로 클릭한 다음 `New File from Template...`을 선택합니다.

작업 위치는 다음과 같습니다.

![xcode](../../../Resource/027_view3.png)

팝업 창 상단에서는 `iOS`, `macOS` 등 서로 다른 플랫폼을 선택할 수 있습니다.

여기서는 현재 프로젝트에 해당하는 플랫폼을 선택한 상태로 두면 됩니다. 예를 들어 iOS App을 만들고 있다면 `iOS`를 선택합니다.

![xcode](../../../Resource/027_view4.png)

그런 다음 아래에서 `SwiftUI View`를 선택합니다.

![xcode](../../../Resource/027_view12.png)

그런 다음 `Next`를 클릭하고, 파일 이름을 입력한 뒤 저장합니다.

예를 들어 `Test2View.swift`를 하나 만듭니다.

Xcode는 아래와 비슷한 코드를 자동으로 생성합니다.

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

빈 파일과 비교하면, 템플릿 파일에는 `import SwiftUI`, `struct`, `body`, `#Preview`가 자동으로 포함됩니다.

따라서 초보자에게는 SwiftUI 템플릿 파일을 사용하는 것이 더 간단하고, 코드를 빠뜨릴 가능성도 더 낮습니다.

**팁**: 마우스 오른쪽 버튼을 클릭해 파일을 만드는 것 외에도, Xcode 왼쪽 Navigator 하단의 더하기 버튼을 클릭해 파일이나 폴더를 만들 수도 있습니다.

![xcode](../../../Resource/027_view5.png)

## 폴더 만들기

파일이 점점 많아지면 폴더를 사용해 관리할 수 있습니다.

Xcode 왼쪽 Navigator 영역에서 빈 공간이나 폴더를 마우스 오른쪽 버튼으로 클릭한 다음 `New Folder`를 선택합니다.

폴더를 만든 뒤 관련 파일을 폴더 안으로 드래그할 수 있습니다.

![xcode](../../../Resource/027_view7.png)

폴더는 주로 프로젝트 구조를 정리하는 데 사용되며, 뷰 자체의 사용 방식은 바꾸지 않습니다.

뷰 이름만 올바르면 다른 파일에서도 여전히 `TestView()`, `Test2View()`와 같은 방식으로 사용할 수 있습니다.

## 파일 또는 폴더 삭제하기

파일이나 폴더를 삭제하고 싶다면, Xcode 왼쪽 Navigator 영역에서 해당 파일을 선택한 다음 마우스 오른쪽 버튼을 클릭하고 `Delete`를 선택하면 됩니다.

파일을 선택한 뒤 delete 키 `⌫`를 눌러도 됩니다.

Xcode는 삭제 확인 창을 표시합니다.

![xcode](../../../Resource/027_view10.png)

`Move to Trash`를 선택하면 파일을 휴지통으로 이동한다는 뜻입니다.

`Remove Reference`가 보인다면, Xcode 프로젝트에서 참조만 제거하고 디스크의 원본 파일은 삭제하지 않는다는 뜻입니다.

초보자라면 방금 직접 만든 일반 파일을 삭제하는 경우, 보통 `Move to Trash`를 선택하면 됩니다.

## 여러 SwiftUI 뷰 표시하기

파일을 만드는 방법을 배운 뒤에는 서로 다른 뷰를 서로 다른 파일로 분리할 수 있습니다.

예를 들어 SwiftUI 파일 두 개를 만듭니다.

```swift
AuthorView.swift
CardView.swift
```

`AuthorView`는 작성자 이름을 표시하는 데 사용합니다.

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView`는 카드 배경을 표시하는 데 사용합니다.

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

그런 다음 `ContentView` 안에서 이 두 뷰를 사용할 수 있습니다.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

실행하면 `CardView`와 `AuthorView`가 함께 조합되어 표시되는 것을 볼 수 있습니다.

![xcode](../../../Resource/027_view11.png)

이 효과에서 `CardView`는 배경 역할을 하고, `AuthorView`는 위쪽에 표시됩니다. 이는 두 뷰가 `ZStack` 안에 놓여 있기 때문입니다.

`ContentView` 안에서 우리는 `CardView()`와 `AuthorView()`를 통해 이 두 뷰를 사용합니다. 이름 뒤의 `()`는 이 뷰를 생성하고 사용한다는 뜻입니다.

이것이 SwiftUI에서 자주 사용하는 뷰 중첩입니다. 하나의 뷰 안에서 다른 뷰를 계속 사용할 수 있습니다.

## 진입 파일

마지막으로 App이 어디에서부터 화면을 표시하기 시작하는지 다시 살펴보겠습니다.

SwiftUI 프로젝트에는 보통 하나의 진입 파일이 있습니다.

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

여기서 `@main`은 이것이 App의 진입 위치임을 나타냅니다.

`WindowGroup` 안에서 우리는 다음 코드를 볼 수 있습니다.

```swift
ContentView()
```

이는 App이 시작된 뒤 먼저 `ContentView`를 표시한다는 뜻입니다.

그리고 `ContentView` 안에는 다시 다음 내용이 표시됩니다.

```swift
ZStack {
    CardView()
    AuthorView()
}
```

따라서 뷰 계층은 다음과 같이 이해할 수 있습니다.

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

진입 파일에서 표시할 뷰를 `CardView`로 바꾸면:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

그러면 App이 시작된 뒤에는 `CardView`만 표시됩니다.

즉, 진입 코드 안의 `WindowGroup`은 App이 시작된 뒤 가장 먼저 표시할 뷰를 결정합니다.

그리고 이 뷰 내부에서는 다른 뷰를 계속 표시할 수 있습니다.

## 정리

이번 수업에서는 Xcode에서 자주 사용하는 파일 관리 작업을 배웠습니다.

SwiftUI 파일을 만드는 방법, 파일 이름을 바꾸는 방법, 폴더를 만드는 방법, 그리고 파일을 삭제하는 방법을 알아보았습니다.

동시에 중요한 개념도 배웠습니다. SwiftUI 뷰는 서로 다른 파일로 분리한 뒤 다른 뷰 안에서 사용할 수 있습니다.

예를 들면:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

여기서 `CardView()`와 `AuthorView()`는 `ContentView` 안에서 다른 뷰를 사용하는 것입니다.

마지막으로 진입 파일의 표시 로직도 다시 살펴보았습니다.

App이 시작되면 먼저 `@main` 표시가 있는 진입 코드로 들어간 뒤, `WindowGroup` 안의 뷰를 표시합니다.

이것은 서로 다른 SwiftUI 파일이 고립되어 있는 것이 아니라, 서로 조합되어 최종적으로 완전한 App 화면을 구성한다는 점을 이해하는 데 도움이 됩니다.
