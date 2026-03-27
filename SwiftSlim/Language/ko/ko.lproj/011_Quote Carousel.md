# 명언 캐러셀

이번 수업에서는 "명언 캐러셀" 기능을 구현하고, 배열(Array)과 조건 판단문(if-else) 같은 Swift의 기초 지식을 더 깊이 배웁니다.

우리는 여러 개의 명언을 저장하는 방법과, 버튼 상호작용을 통해 명언이 순환되며 표시되도록 만드는 방법을 살펴봅니다.

![alt text](../../RESOURCE/011_word.png)

## 명언 표시하기

먼저, SwiftUI에서 하나의 명언을 표시해야 합니다.

가장 간단한 방법은 `Text` 뷰를 사용하는 것입니다:

```swift
Text("Slow progress is still progress.")
```

이 코드는 고정된 하나의 명언만 표시할 수 있습니다. 여러 개의 명언을 보여 주고 전환 기능까지 만들고 싶다면, 먼저 명언들을 저장해야 합니다.

하지만 일반적인 문자열 변수는 하나의 명언만 저장할 수 있습니다:

```swift
let sayings = "Slow progress is still progress."
```

여러 개의 명언을 저장하려면, 각각의 명언마다 하나의 변수를 선언해야 합니다:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

하지만 실제 개발에서 이런 방식은 번거롭기만 한 것이 아닙니다. 각 변수가 서로 독립되어 있기 때문에, 유연한 캐러셀 전환 기능을 구현할 수 없습니다.

여러 개의 명언을 편하게 관리하려면, 하나의 데이터 구조에 함께 저장해야 합니다. 그것이 바로 배열(Array)입니다.

배열을 사용하면, 위 코드는 다음과 같이 저장할 수 있습니다:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**팁: 프로그래밍 규칙에서는 여러 개의 요소를 저장하는 배열 변수 이름을 보통 복수형으로 씁니다. 예를 들어 sayings처럼, 이것이 하나의 집합이라는 특성을 더 잘 드러낼 수 있습니다.**

## 배열

Swift에서 배열은 순서가 있는 요소들의 집합을 저장하는 컬렉션이며, 대괄호 `[]`로 표현합니다.

```swift
[]
```

배열 안에는 같은 타입의 여러 요소를 넣을 수 있고, 요소 사이에는 영어 쉼표 `,`를 사용합니다.

예:

```swift
[101, 102, 103, 104, 105]
```

배열은 간단히 한 줄의 기차라고 생각할 수도 있습니다:

![Array](../../RESOURCE/011_array1.png)

기차 전체는 배열 객체를 나타내고, 각 객차는 순서대로 배열되어 있습니다.

### 인덱스와 요소 접근

배열은 순서가 있기 때문에, 시스템은 순서를 기준으로 특정 요소를 찾을 수 있습니다. 이 위치 지정 메커니즘을 인덱스(Index)라고 합니다.

Swift(그리고 대부분의 프로그래밍 언어)에서 배열 인덱스는 1이 아니라 0부터 시작합니다. 즉, 배열의 첫 번째 요소의 인덱스는 0, 두 번째 요소는 1, 이런 식으로 이어집니다.

![Array](../../RESOURCE/011_array2.png)

배열의 특정 요소에 접근하려면, 배열 이름 뒤에 대괄호를 붙이고 그 안에 목표 요소의 인덱스 값을 넣으면 됩니다.

예:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

유효 범위를 벗어난 인덱스에 접근하려고 하면 "인덱스 범위 초과(Index Out of Range)" 문제가 발생합니다. 따라서 배열을 접근할 때는 인덱스가 유효한 범위 안에 있는지 주의해야 합니다.

**인덱스 범위 초과**

예를 들어 배열에 요소가 5개 있다면, 유효한 인덱스 범위는 0에서 4까지입니다. 이때 `sayings[5]`에 접근하려고 하면, 프로그램은 해당 "객차"를 찾지 못해 인덱스 범위 초과 오류를 일으키고, 앱이 충돌할 수 있습니다.

![Array](../../RESOURCE/011_array3.png)

### 배열 다루기

배열은 정적으로 정의하는 것뿐 아니라, 요소 추가, 삭제, 수정도 할 수 있고 길이도 얻을 수 있습니다.

팁: 배열을 수정해야 한다면 `let` 상수가 아니라 `var` 변수로 선언해야 합니다.

**1. 요소 추가**

`append` 메서드를 사용하면 배열 끝에 요소를 추가할 수 있습니다:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. 요소 삭제**

`remove(at:)` 메서드를 사용하면 지정한 요소를 삭제할 수 있습니다:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. 요소 수정**

인덱스를 사용해 배열 요소를 직접 수정할 수 있습니다:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. 배열 길이 세기**

`count` 속성을 사용하면 배열의 요소 개수를 얻을 수 있습니다:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### 배열을 사용해 명언 표시하기

여러 개의 명언을 표시하려면, 명언들을 배열에 저장한 뒤 인덱스로 접근해 표시하면 됩니다.

먼저 ContentView 안에 `sayings` 배열을 만들어 명언을 저장하고, `Text` 뷰에서 인덱스를 사용해 해당 명언을 읽어와 표시합니다:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

여기서 `sayings[0]`은 배열 안의 첫 번째 명언을 뜻합니다.

다른 명언을 표시하고 싶다면, 대괄호 안의 인덱스 값만 바꾸면 됩니다:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### 명언의 인덱스 정의하기

명언 전환 효과를 동적으로 만들려면, `Text` 뷰 안에 인덱스를 "고정"해서 써 둘 수는 없습니다.

현재 표시 중인 인덱스 값을 따로 저장하는 변수가 필요합니다.

SwiftUI에서는 `@State`를 사용해 변경 가능한 인덱스를 선언할 수 있습니다:

```swift
@State private var index = 0
```

SwiftUI는 `@State`로 감싼 변수를 감시합니다. `index`가 변하면 SwiftUI는 뷰를 다시 렌더링하고, 해당 명언을 표시합니다.

이제 `sayings[index]`를 사용해 배열 속 명언을 동적으로 가져옵니다:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

`index` 값이 바뀌면, `Text`는 다른 명언을 표시하게 됩니다.

### 버튼으로 인덱스 제어하기

명언 전환을 제어하기 위해, `Button`을 사용해 `index` 값을 바꿀 수 있습니다. 버튼을 누를 때마다 `index`가 1씩 증가합니다:

```swift
Button("Next") {
    index += 1
}
```

버튼을 클릭하면 `index`의 값이 0에서 1로 바뀌고, 뷰가 새로 고쳐지면서 `Text(sayings[index])`가 다음 명언을 읽어 오게 됩니다.

하지만 여기에는 잠재적인 문제가 하나 있습니다. 버튼을 계속 누르면 `index`가 배열 범위를 넘는 값까지 증가하게 되며, 이로 인해 배열 인덱스 범위 초과 오류가 발생합니다. 예를 들어 `index`가 5가 되면(배열 인덱스 범위는 0~4), 프로그램은 충돌합니다.

배열 인덱스가 범위를 넘지 않도록 하려면, `index`가 배열 범위를 벗어나지 않도록 조건 제어를 넣어야 합니다. 이를 위해 `if-else` 문을 사용할 수 있습니다.

## 조건 제어: if-else 문

`if-else` 문은 Swift에서 가장 자주 쓰이는 조건 분기문으로, 조건이 성립하는지를 판단하고 그 결과에 따라 다른 코드 블록을 실행합니다.

기본 구조:

```swift
if condition {
    // condition이 true일 때 실행되는 코드
} else {
    // condition이 false일 때 실행되는 코드
}
```

`if` 문에서 조건 `condition`은 불리언 값(Bool 타입)이며, true 또는 false가 될 수 있습니다. 조건이 true이면 if 부분의 코드가 실행되고, 그렇지 않으면 else 부분의 코드가 실행됩니다.

예:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

이 예에서 `age` 값은 25입니다. `if` 문은 `age > 18`이 성립하는지 판단하고, 조건이 성립하므로 `"Big Boy"`를 출력합니다.

`else` 부분의 코드가 필요 없다면 생략할 수 있습니다:

```swift
if condition {
    // condition이 true일 때 실행되는 코드
}
```

### 조건으로 인덱스 범위 제어하기

배열 인덱스 범위 초과를 방지하려면, `if` 문을 사용해 `index`가 배열 범위를 넘지 않도록 만들 수 있습니다:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

논리를 분석해 보면: `sayings.count`의 값은 5(총 5개의 명언)이고, 따라서 `sayings.count - 1`의 값은 4입니다. 이것이 배열의 마지막 유효 인덱스입니다.

`index`가 4보다 작을 때 버튼을 눌러 1을 더하는 것은 안전합니다. 하지만 `index`가 4에 도달하면 조건이 더 이상 성립하지 않으므로, 버튼을 눌러도 아무 일도 일어나지 않습니다.

이제 코드는 이미 명언 전환 기능을 구현한 상태입니다:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### 명언 순환시키기

마지막 명언이 표시된 뒤 버튼을 누르면 다시 첫 번째 명언이 표시되도록, 즉 명언이 순환되도록 만들고 싶다면 `else` 부분을 사용하면 됩니다:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

버튼을 누를 때 `index`가 배열의 마지막 요소에 도달하면, `index`는 0으로 재설정되어 명언이 다시 처음부터 순환 표시됩니다.

## 명언 뷰 다듬기

이제 명언 캐러셀의 로직은 완성되었지만, 화면을 조금 더 아름답게 다듬을 수 있습니다.

전체 코드:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

이 예제에서는 `Text` 뷰에 반투명한 흰색 배경과 둥근 모서리를 추가했고, `Button`은 `.borderedProminent` 스타일을 사용했으며, `VStack`에는 배경 이미지가 설정되어 있습니다.

보충 지식: `background()` modifier로 이미지 배경을 처리할 때, 기본 동작은 현재 뷰가 속한 레이아웃 영역을 가능한 한 많이 채우는 것입니다. 많은 경우 안전 영역(Safe Area)까지 자연스럽게 확장되기도 합니다.

이제 우리는 명언 캐러셀 뷰를 구현했습니다.

![SwiftUI View](../../RESOURCE/011_word.png)

## 정리

이번 수업을 통해 우리는 배열을 사용해 여러 개의 명언을 저장하는 방법과, `if` 및 `if-else` 문을 사용해 명언 캐러셀을 구현하는 방법을 익혔습니다.

또한 배열의 기본 조작, 예를 들면 요소 추가, 삭제, 수정, 그리고 배열 인덱스 범위 초과를 방지하는 방법도 함께 배웠습니다.

이 수업은 명언 캐러셀 기능 자체를 설명했을 뿐 아니라, 배열과 조건문이라는 기본적인 사용법을 함께 다루며, 데이터를 처리하고 프로그램 흐름을 제어하는 능력을 익히는 데 도움을 줍니다.

## 확장 지식 - 다중 조건 판단: if-else if-else 문

실제 개발에서는 여러 조건을 동시에 다루어야 하는 경우가 자주 있습니다. 예를 들어 어떤 게임에서 점수가 1이면 이벤트 A, 2이면 이벤트 B, 3이면 이벤트 C가 실행되는 상황을 생각해 볼 수 있습니다.

두 개보다 많은 조건 분기가 있는 상황에서는 `if-else if-else` 문을 사용해 다중 판단을 해야 합니다.

기본 문법:

```swift
if conditionA {
    // conditionA가 true일 때 실행되는 코드
} else if conditionB {
    // conditionB가 true일 때 실행되는 코드
} else if conditionC {
    // conditionC가 true일 때 실행되는 코드
} else {
    // 모든 조건이 성립하지 않을 때 실행되는 코드
}
```

이 경우 프로그램은 순서대로 조건을 검사하고, 처음으로 만족하는 조건의 코드를 실행합니다. 만족하는 조건이 하나도 없으면 else 뒤의 코드가 실행됩니다.

명언 캐러셀에서도 `if-else if-else` 문을 사용해 다중 판단을 할 수 있습니다:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

`index`가 0, 1, 2, 3일 때는 버튼을 누를 때마다 `index += 1`이 실행되고, `index`가 4(마지막 요소)일 때는 `index`를 0으로 재설정하여 순환되도록 만듭니다.

`else` 분기는 혹시라도 잘못된 값이 들어왔을 때를 대비한 안전장치 역할을 합니다. 예를 들어 `index`가 실수로 잘못 수정된 경우를 막을 수 있습니다.

주의할 점은, 여기서 사용한 `==`는 "같은가?"를 판단하는 비교 연산자라는 것입니다. `if` 문이 `index`와 어떤 숫자가 같은지 판단해 true를 반환하면, 뒤의 코드 블록이 실행됩니다. 같지 않다면 다음 `if` 판단으로 넘어갑니다.

이런 다중 조건 판단은 서로 다른 조건 상황에서 서로 다른 코드를 실행해야 할 때 매우 유용합니다。
