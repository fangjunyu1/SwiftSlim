# 버튼을 작동시키기

이번 수업에서는 `Button` 버튼, `print`를 이용한 디버그 출력, 그리고 Swift 함수에 대해 배웁니다.

이 내용들은 SwiftUI 상호작용 프로그래밍의 기초입니다.

## 버튼

버튼은 우리가 가장 자주 접하는 UI 컨트롤입니다. 다운로드, 열기, 종료 같은 작업이 필요할 때 보통 버튼을 누르게 됩니다.

예를 들어 App Store에서는 "받기" 버튼을 눌러 App을 다운로드합니다.

![Button](../../RESOURCE/008_button.png)

SwiftUI에서는 버튼을 `Button`으로 표현합니다.

기본 사용법:

```swift
Button("") {
    
}
```

구조는 두 부분으로 나눌 수 있습니다:

```swift
Button("버튼 텍스트") {
    버튼을 눌렀을 때 실행되는 코드
}
```

예:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

실행하면 `Start` 버튼 하나가 표시됩니다.

![Button](../../RESOURCE/008_button1.png)

사용자가 버튼을 누르면 `{}` 안의 코드가 실행됩니다.

주의할 점은, `Button`은 SwiftUI의 화면 컨트롤(View)이기 때문에 반드시 `body` 안에 작성해야 한다는 것입니다.

### buttonStyle modifier

SwiftUI에서 `Button`은 시스템이 내장한 버튼 스타일을 제공하며, `buttonStyle` modifier를 통해 사용할 수 있습니다.

예:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle`은 시스템이 제공하는 버튼 스타일을 적용합니다.

자주 사용하는 옵션은 다음과 같습니다:

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

각 스타일의 차이는 주로 버튼에 테두리가 있는지, 배경이 있는지, 시각적 강조가 얼마나 강한지에 있습니다.

## print 출력

프로그래밍에서는 프로그램이 특정 코드까지 실행되었는지 확인해야 하는 경우가 많습니다.

Swift는 디버그 정보를 출력하기 위해 `print` 함수를 제공합니다.

기본 사용법:

```swift
print("Hello")
```

이 코드는 텍스트를 Console(콘솔)에 출력합니다.

### 버튼이 잘 동작하는지 확인하기

버튼 안에 `print`를 넣어, 버튼이 실제로 눌렸는지 테스트할 수 있습니다.

```swift
Button("Start") {
    print("Test 123")
}
```

버튼을 클릭하면 Console에 다음이 출력됩니다:

```
Test 123
```

이것은 버튼이 성공적으로 트리거되었음을 의미합니다.

![Button](../../RESOURCE/008_button3.png)

주의: `print`는 Swift 코드이지, 화면 컨트롤이 아닙니다. 따라서 직접 `body` 안에 둘 수 없으며, 그렇게 하면 오류가 납니다.

예를 들어, 아래처럼 쓰면 잘못된 코드입니다:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // 오류: body는 반드시 View를 반환해야 함
    }
}
```

SwiftUI에서 `body`는 화면 구조를 설명하는 곳이므로, `Text`, `Button`, `Image` 같은 화면 컨트롤(View)만 들어갈 수 있습니다.

일반 코드(계산 로직, `print` 등)는 반드시 버튼, 함수, 혹은 다른 이벤트 처리기 안에 넣어야 합니다.

### Console 콘솔

`print`의 출력 내용은 Xcode의 Console(콘솔)에 표시됩니다.

Console이 보이지 않는다면, 오른쪽 아래의 Show the Debug Area 버튼으로 디버그 영역을 열고, 다시 Show the Console 버튼을 눌러 콘솔을 표시할 수 있습니다.

![](../../RESOURCE/008_button4.png)

Console 왼쪽 아래에는 `Executable`과 `Previews`라는 두 개의 탭이 있습니다.

![](../../RESOURCE/008_button5.png)

이 두 탭은 서로 다른 실행 환경에 대응합니다. Canvas에서 미리보기 중이라면 `print` 출력은 `Previews` 탭에 표시되고, 시뮬레이터나 실제 기기에서 앱을 실행 중이라면 출력은 `Executable` 탭에 표시됩니다.

그래서 `print`가 보이지 않는다고 느껴질 때는, 먼저 올바른 탭을 선택했는지 확인해야 합니다.

## 예제 - ASCII 문자 그림

일부 코드 프로젝트에서는 ASCII 문자 그림을 자주 볼 수 있습니다.

문자 그림은 일반 문자로 만든 그림입니다. 예를 들어:

![ASCII](../../RESOURCE/008_ascii.png)

우리는 버튼과 `print`를 이용해 하나의 ASCII 문자 그림을 출력할 수 있습니다.

예제 코드:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

버튼을 클릭하면 Console에 다음이 출력됩니다:

```
 /\_/\
( o.o )
 > ^ <
```

주의: 문자열 안의 `\`는 `\\`로 써야 합니다. 백슬래시는 문자열에서 이스케이프 문자이기 때문입니다.

## 함수

버튼 안에 직접 코드를 작성할 수는 있습니다.

예:

```swift
Button("Start") {
    print("Hello")
}
```

코드가 적다면 이렇게 써도 괜찮습니다. 하지만 실제 개발에서는 하나의 버튼이 실행하는 로직이 훨씬 많아질 수 있습니다.

예를 들어:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // 더 많은 코드가 있을 수 있음
}
```

코드가 점점 많아지면, 이를 버튼 내부에 직접 작성하는 방식은 화면 코드를 지저분하게 만들고, 읽기와 유지보수도 어려워집니다.

그래서 보통은 이런 코드를 하나의 함수로 정리한 뒤, 버튼 안에서 그 함수를 호출합니다.

### 함수란 무엇인가

함수는 반복해서 사용할 수 있는 코드 덩어리입니다.

어떤 코드를 실행해야 할 때, 그 함수를 호출하기만 하면 함수 내부의 코드가 실행됩니다.

이렇게 하면 코드 구조가 더 분명해지고, 재사용도 쉬워집니다.

### 기본 문법

Swift에서는 함수 정의에 **func** 키워드를 사용합니다:

```swift
func randomInt() {
    // code
}
```

이 코드는 하나의 함수를 정의합니다.

`randomInt`는 함수 이름으로, 이 코드 조각을 식별하는 역할을 합니다.

`()`는 매개변수가 들어가는 자리입니다. 여기서 외부에서 전달된 데이터를 받을 수 있습니다. 데이터가 필요 없다면 비워 두면 됩니다.

`{}` 안은 함수의 코드 영역이며, 실행되어야 할 코드는 모두 여기에 작성합니다.

예:

```swift
func getName() {
    print("FangJunyu")
}
```

이 함수의 역할은 텍스트 한 줄을 출력하는 것입니다.

### 함수 호출

함수를 정의하는 것은 그 코드를 준비해 두는 것일 뿐이며, 실제로 실행하려면 함수를 호출해야 합니다.

호출 방법은 함수 이름 뒤에 `()`를 붙이는 것입니다:

```swift
getName()
```

프로그램이 이 줄에 도달하면, `getName` 함수 안의 코드가 실행됩니다.

완전한 예:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

실행하면 Console에는 다음이 출력됩니다:

```
FangJunyu
```

### SwiftUI에서 함수 사용하기

SwiftUI 뷰에서는 함수는 보통 `body` 바깥에 작성합니다.

예:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

버튼을 클릭하면 `getName()` 함수가 호출됩니다.

이렇게 하면 화면 코드는 간결하게 유지되고, 구체적인 로직은 함수에서 처리할 수 있습니다.

### 함수 매개변수

어떤 함수는 서로 다른 데이터를 받아, 그에 따라 다른 작업을 해야 할 때가 있습니다.

예를 들어, 함수가 고정된 `"FangJunyu"`만 출력하는 대신, 서로 다른 이름을 출력할 수 있기를 원한다고 해 봅시다.

이때 매개변수를 사용할 수 있습니다. 매개변수는 함수를 호출할 때 전달하는 데이터라고 이해하면 됩니다.

예:

```swift
func getName(name: String) {
    print(name)
}
```

이 함수에는 `name`이라는 새 매개변수가 추가되었습니다. `name`은 매개변수 이름이고, `String`은 매개변수 타입입니다.

즉, 이 함수는 `String` 타입의 데이터를 하나 받아야 한다는 의미입니다.

이제 함수가 데이터를 필요로 하므로, 호출할 때 반드시 그 데이터를 함께 제공해야 합니다.

```swift
getName(name: "Sam")
```

호출할 때 `"Sam"`을 전달하면, 함수 내부에서는 그 값을 사용해 출력합니다.

실행 결과:

```
Sam
```

## 예제 - 함수를 사용해 ASCII 문자 그림 출력하기

앞선 예제에서는 `print`를 버튼 안에 직접 작성했습니다.

하지만 문자 그림이 더 복잡해지면 코드가 길어지게 됩니다. 이때 로직을 함수 안으로 옮기면 화면 코드를 더 깔끔하게 유지할 수 있습니다.

예제 코드:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

실행 후 버튼을 클릭하면 Console에는 다음이 출력됩니다:

```
 /\_/\
( o.o )
 > ^ <
```

여기에서는 두 가지 일이 일어납니다. 사용자가 버튼을 누르면:

1. 버튼이 `printCat()` 함수를 호출합니다
2. 함수 안의 `print` 코드가 실행됩니다

이렇게 하면 화면 코드는 이벤트를 트리거하는 역할만 맡고, 구체적인 로직은 함수 안에서 처리하게 됩니다.

실제 개발에서도 대부분의 버튼 동작은 함수로 구현됩니다.

## 정리

이번 수업에서는 세 가지 중요한 내용을 배웠습니다:

**1. Button 버튼**

`Button`은 SwiftUI에서 동작을 트리거하기 위한 컨트롤입니다.

```swift
Button("Start") {

}
```

사용자가 버튼을 클릭하면, 중괄호 안의 코드가 실행됩니다.

**2.print 출력**

`print`는 Console에 디버그 정보를 출력하는 데 사용됩니다.

```swift
print("Hello")
```

개발자는 Console을 통해 프로그램의 실행 상태를 확인할 수 있습니다.

**3. 함수**

함수는 반복해서 사용할 수 있는 코드 조각입니다.

```swift
func sayHello() {
    print("Hello")
}
```

함수 호출:

```swift
sayHello()
```

함수가 데이터를 받아야 한다면, 매개변수를 사용할 수 있습니다:

```swift
func sayHello(name: String) {
    print(name)
}
```

이후 수업에서는 더 많은 SwiftUI 컨트롤과, 데이터가 화면과 어떻게 상호작용하는지를 계속 배우게 됩니다。

## 연습

다음 연습을 시도해 보세요:

1. 버튼 하나를 만들고, 버튼 텍스트를 `"Hello"`로 설정하기
2. 버튼을 클릭했을 때 Console에 `Hello Swift` 출력하기
3. 출력 코드를 함수 안에 작성하고, 버튼에서 그 함수를 호출하기
