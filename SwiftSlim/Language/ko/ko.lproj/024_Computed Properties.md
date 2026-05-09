# 계산 프로퍼티

이번 수업에서는 계산 프로퍼티를 주로 배웁니다.

계산 프로퍼티는 기존 데이터를 바탕으로 새로운 결과를 계산할 때 사용합니다. 숫자 값을 계산할 수도 있고, SwiftUI 뷰에서 표시해야 하는 내용도 계산할 수 있습니다.

예를 들어:

```swift
let a = 10
let b = 20
let c = a + b
```

여기서 `c`는 `a`와 `b`를 더한 결과를 의미합니다.

일반 코드에서는 이런 작성 방식이 매우 흔합니다.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

팁: `Button`의 클릭 이벤트 안에서는 일반 Swift 코드를 실행할 수 있습니다.

하지만 비슷한 코드를 SwiftUI 뷰의 프로퍼티 안에 직접 작성하면 문제가 발생합니다.

예를 들어:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

이 코드는 오류가 발생합니다.

겉으로 보기에는 `a`와 `b`가 이미 `c`보다 앞에 작성되어 있으므로, `c`의 값을 계산할 수 있을 것처럼 보입니다.

하지만 구조체의 프로퍼티를 선언할 때는 이런 방식을 직접 사용할 수 없습니다.

## 왜 c를 직접 a + b로 계산할 수 없을까?

그 이유는 `a`, `b`, `c`가 버튼 클릭 이벤트 안의 임시 상수가 아니라, `ContentView`라는 뷰의 프로퍼티이기 때문입니다.

버튼 클릭 이벤트 안에서는 다음 코드가 정상적으로 실행됩니다.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

버튼을 클릭한 뒤 코드가 순서대로 실행되기 때문입니다. 먼저 `a`가 만들어지고, 그다음 `b`가 만들어진 뒤, 마지막으로 `a + b`를 사용해 `c`를 계산합니다.

하지만 뷰 내부에서 프로퍼티를 선언할 때는 상황이 다릅니다.

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

여기서 `a`, `b`, `c`는 모두 `ContentView`라는 뷰 안의 프로퍼티입니다.

`ContentView` 뷰가 생성될 때 Swift는 먼저 이 프로퍼티들을 준비해야 합니다. 생성 과정의 안전성을 보장하기 위해 Swift는 한 인스턴스의 저장 프로퍼티 기본값에서 같은 인스턴스의 다른 인스턴스 프로퍼티를 직접 읽는 것을 허용하지 않습니다.

그래서 다음 코드는 오류가 발생합니다.

```swift
let c = a + b
```

간단히 이해하면 다음과 같습니다. **뷰 내부에서 프로퍼티를 선언할 때는 하나의 일반 프로퍼티를 사용해 다른 일반 프로퍼티를 직접 계산할 수 없습니다.**

이렇게 값을 직접 저장하는 프로퍼티를 “저장 프로퍼티”라고 합니다. 이해를 쉽게 하기 위해 지금은 일반 프로퍼티라고 생각해도 됩니다.

예를 들어:

```swift
let a = 10
```

`a`는 `10`을 저장합니다.

```swift
let b = 20
```

`b`는 `20`을 저장합니다.

하지만:

```swift
let c = a + b
```

여기서 `c`는 직접 고정된 값을 저장하는 것이 아니라, `a + b`를 통해 계산되기를 기대하는 값입니다.

이처럼 “기존 데이터를 바탕으로 결과를 얻는” 경우에는 계산 프로퍼티를 사용하는 것이 더 적합합니다.

다음처럼 수정할 수 있습니다.

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

여기서 `c`가 바로 계산 프로퍼티입니다.

```swift
var c: Int {
    return a + b
}
```

이 코드의 의미는 다음과 같습니다. **`c`를 사용해야 할 때 `a`와 `b`를 읽고, `a + b`의 결과를 반환합니다.**

예를 들어:

```swift
Text("c: \(c)")
```

`Text`가 `c`를 표시할 때 `c`의 계산이 실행됩니다.

## 계산 프로퍼티란 무엇인가?

계산 프로퍼티는 변수처럼 보이지만, 그 자체가 데이터를 저장하지는 않습니다.

예를 들어:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

여기서 `c`가 계산 프로퍼티입니다.

계산 프로퍼티는 일반 프로퍼티처럼 고정된 값을 저장하지 않습니다. 대신 `c`를 읽을 때마다 `{}` 안의 코드가 다시 실행되고, 계산된 결과를 반환합니다.

다음처럼 이해할 수 있습니다.

```swift
var c: Int {
    return a + b
}
```

`c`가 필요할 때 `a + b`를 계산합니다.

따라서 계산 프로퍼티는 다음과 같은 상황에 적합합니다. **어떤 결과를 따로 저장할 필요 없이, 기존 데이터를 바탕으로 계산할 수 있는 경우입니다.**

## 기본 작성 방식

계산 프로퍼티는 보통 세 부분으로 구성됩니다.

```swift
var c: Int {
    return a + b
}
```

### 1. `var`로 선언하기

```swift
var c
```

계산 프로퍼티는 반드시 `var`로 선언해야 하며, `let`은 사용할 수 없습니다.

계산 프로퍼티는 고정되어 저장되는 값이 아니라, 읽을 때마다 동적으로 계산되는 결과이기 때문입니다.

### 2. 반환 타입 표시하기

```swift
var c: Int
```

계산 프로퍼티는 반환 타입을 표시해야 합니다.

여기서 `c`는 최종적으로 정수를 반환하므로 타입은 `Int`입니다.

### 3. {} 안에 계산 로직 작성하기

```swift
{
    return a + b
}
```

`{}` 안에는 계산 로직을 작성합니다. 여기서는 `a + b`를 반환합니다.

## return 키워드

계산 프로퍼티는 하나의 결과를 반환해야 합니다.

예를 들어:

```swift
var c: Int {
    return a + b
}
```

여기서 `return`은 `a + b`의 계산 결과를 밖으로 반환한다는 뜻입니다.

계산 프로퍼티 안에 결과를 바로 만들어 내는 표현식이 하나만 있다면 `return`을 생략할 수 있습니다.

```swift
var c: Int {
    a + b
}
```

하지만 계산 프로퍼티 안에 여러 줄의 코드가 있다면, 결과를 명확히 반환하기 위해 `return`을 사용해야 합니다.

예를 들어:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

여기서는 계산 과정이 두 단계로 나뉩니다.

첫 번째 단계에서는 총액을 먼저 계산합니다.

```swift
let total = count * price
```

두 번째 단계에서는 총액을 문자열로 연결한 뒤 반환합니다.

```swift
return "Total：\(total) $"
```

만약 `return`을 제거하면:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

이 코드는 오류가 발생합니다.

이유는 다음과 같습니다. **이 계산 프로퍼티 안에는 이미 여러 줄의 코드가 있기 때문에, Swift가 어떤 줄이 최종적으로 반환해야 할 결과인지 자동으로 판단할 수 없습니다.**

따라서 계산 프로퍼티 안에 결과를 만드는 표현식이 한 줄만 있다면 `return`을 생략할 수 있습니다.

```swift
var c: Int {
    a + b
}
```

계산 프로퍼티 안에 여러 줄의 코드가 있다면 `return`을 명확히 작성하는 것이 좋습니다.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## 계산 프로퍼티와 일반 프로퍼티의 차이

일반 프로퍼티는 데이터를 저장합니다.

```swift
var c = 30
```

여기서 `c`는 구체적인 값인 `30`을 저장합니다.

계산 프로퍼티는 데이터를 저장하지 않습니다.

```swift
var c: Int {
    a + b
}
```

여기서 `c`는 `30`을 저장하지 않습니다. 단지 계산 방법을 제공할 뿐입니다.

`c`를 읽으면 Swift는 다음 코드를 실행합니다.

```swift
a + b
```

그리고 계산 결과를 반환합니다.

따라서 계산 프로퍼티는 다른 데이터를 바탕으로 결과를 계산해야 하는 상황에 적합합니다.

## body도 계산 프로퍼티

계산 프로퍼티를 배운 뒤에는 SwiftUI에서 가장 자주 보게 되는 다음 코드를 다시 이해할 수 있습니다.

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

여기서 `body`도 계산 프로퍼티입니다.

`body`는 `var`로 선언되어 있습니다.

```swift
var body
```

반환 타입도 있습니다.

```swift
some View
```

그리고 `{}` 안에서 반환하는 것은 SwiftUI 뷰 내용입니다.

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

따라서 `body`는 다음과 같이 이해할 수 있습니다. SwiftUI가 이 뷰를 표시해야 할 때 `body`를 읽고, `body`가 반환하는 내용을 바탕으로 인터페이스를 생성합니다.

`return`을 작성하면 다음처럼 이해할 수 있습니다.

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

하지만 SwiftUI에서는 보통 `return`을 생략하고 다음처럼 직접 작성합니다.

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` 데이터가 변경되면 SwiftUI는 `body`를 다시 읽고, 새로운 데이터에 맞게 인터페이스를 업데이트합니다.

예를 들어:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

버튼을 클릭하면 `count`가 변경됩니다.

```swift
count += 1
```

`count`가 변경되면 SwiftUI는 `body`를 다시 계산하므로, 인터페이스 안의 텍스트도 함께 업데이트됩니다.

```swift
Text("count: \(count)")
```

SwiftUI에서 데이터가 변경된 뒤 인터페이스가 자동으로 새로고침되는 이유도 여기에 있습니다.

### body 안에 복잡한 계산을 작성하는 것은 권장하지 않습니다

`body`는 계산 프로퍼티이므로 여러 번 읽히고 다시 계산될 수 있습니다.

예를 들어:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

`name`이 변경되면 SwiftUI는 `body`를 다시 계산합니다.

이때 `body` 안의 코드도 다시 실행되고, `num`도 다시 만들어집니다.

```swift
let num = 10
```

이 예시에서 `num`은 매우 단순하므로 큰 영향은 없습니다.

하지만 `body` 안에서 복잡한 계산을 실행한다면, 예를 들어 대량의 데이터 필터링, 정렬, 이미지 처리 같은 작업을 수행한다면 인터페이스의 부드러운 동작에 영향을 줄 수 있습니다.

따라서 SwiftUI에서 `body`는 주로 인터페이스 구조를 설명하는 역할을 해야 합니다.

간단한 임시 데이터는 `body` 안에 작성해도 됩니다.

복잡한 계산은 `body` 밖의 계산 프로퍼티, 메서드 또는 별도의 데이터 처리 로직으로 분리하는 것을 고려할 수 있습니다.

## 예제: 수량과 총액

이제 간단한 예제를 통해 계산 프로퍼티를 이해해 보겠습니다.

당근 하나의 단가가 2달러라고 가정해 봅시다. 사용자는 버튼을 클릭해 구매 수량을 변경할 수 있고, 인터페이스에는 총액을 표시해야 합니다.

총액의 계산 방식은 다음과 같습니다.

```text
수량 * 단가
```

만약 일반 변수로 총액을 저장한다면 조금 번거로워집니다.

수량이 바뀔 때마다 총액도 직접 업데이트해야 하기 때문입니다.

더 좋은 방식은 계산 프로퍼티를 사용하는 것입니다.

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

표시 효과:

![view](../../Resource/024_view.png)

이 예제에서:

```swift
@State private var count = 1
```

`count`는 당근의 수량을 의미합니다. 버튼을 클릭하면 `count`가 변경됩니다.

```swift
private let price = 2
```

`price`는 당근의 단가를 의미합니다. 여기서는 고정값이므로 `let`을 사용합니다.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice`는 총액을 의미합니다.

총액은 따로 저장할 필요가 없습니다. 총액은 언제나 `count * price`로 계산할 수 있기 때문입니다.

`count`가 `1`일 때:

```swift
totalPrice = 1 * 2
```

표시 결과는 다음과 같습니다.

```swift
totalPrice: 2 $
```

`+` 버튼을 클릭하면 `count`가 `2`가 됩니다.

이때 `totalPrice`를 다시 읽으면 다시 계산됩니다.

```swift
totalPrice = 2 * 2
```

표시 결과는 다음과 같습니다.

```swift
totalPrice: 4 $
```

이것이 계산 프로퍼티의 역할입니다. 기존 데이터를 바탕으로 새로운 결과를 동적으로 계산합니다.

## 계산 프로퍼티는 판단에도 사용할 수 있습니다

계산 프로퍼티는 숫자만 계산할 수 있는 것이 아니라, 판단 결과도 반환할 수 있습니다.

예를 들어 수량의 최솟값을 1로 제한하고 싶다고 가정해 봅시다.

수량이 이미 1일 때는 `-` 버튼을 눌러도 더 줄어들면 안 됩니다.

다음과 같은 계산 프로퍼티를 추가할 수 있습니다.

```swift
private var canDecrease: Bool {
    count > 1
}
```

전체 코드는 다음과 같습니다.

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

표시 효과:

![view](../../Resource/024_view1.png)

여기서:

```swift
private var canDecrease: Bool {
    count > 1
}
```

이 코드는 현재 더 줄일 수 있는지를 나타냅니다.

`count`가 `1`보다 클 때:

```swift
canDecrease == true
```

줄일 수 있다는 뜻입니다.

`count`가 `1`과 같을 때:

```swift
canDecrease == false
```

더 이상 줄일 수 없다는 뜻입니다.

### 버튼 안의 조건 판단

버튼 안에서는 다음 코드를 사용합니다.

```swift
if canDecrease {
    count -= 1
}
```

`canDecrease`가 `true`일 때만 `count`를 줄일 수 있습니다.

### 뷰의 전경색 제어하기

`canDecrease`를 사용해 버튼의 전경색도 제어할 수 있습니다.

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

여기서는 삼항 연산자를 사용했습니다.

```swift
canDecrease ? Color.primary : Color.gray
```

이 코드의 의미는 다음과 같습니다. `canDecrease`가 `true`이면 전경색으로 `Color.primary`를 사용하고, `canDecrease`가 `false`이면 전경색으로 `Color.gray`를 사용합니다.

`Color.primary`는 SwiftUI가 제공하는 시스템 의미 색상입니다. 현재 인터페이스에서 주요 텍스트 색상을 의미합니다.

라이트 모드에서는 `Color.primary`가 보통 검은색에 가깝고, 다크 모드에서는 보통 흰색에 가깝습니다.

따라서 `Color.primary`를 사용하면 라이트 모드와 다크 모드에 자동으로 적응한다는 장점이 있습니다.

### 뷰의 비활성 상태 제어하기

`disabled`는 뷰가 비활성 상태인지 제어할 때 사용합니다.

```swift
.disabled(!canDecrease)
```

`disabled`가 `false`이면 뷰를 클릭할 수 있습니다.

`disabled`가 `true`이면 뷰는 비활성 상태가 되며 클릭할 수 없습니다.

여기서는 `canDecrease`를 판단 조건으로 사용했기 때문에 코드를 더 쉽게 이해할 수 있습니다.

`canDecrease`를 보면 “현재 계속 줄일 수 있는지”를 의미한다는 것을 알 수 있습니다.

### 보충 설명: 왜 두 번 판단할까?

`-` 버튼에서는 다음 코드가 사용됩니다.

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

여기서는 `.disabled(!canDecrease)`도 사용하고, 버튼 내부에서 `if canDecrease`도 사용합니다.

`.disabled(!canDecrease)`는 인터페이스에서 버튼을 비활성화하여 사용자가 클릭할 수 없게 만듭니다.

`if canDecrease`는 코드가 실행되기 전에 한 번 더 판단하여, 줄일 수 있는 경우에만 `count -= 1`을 실행합니다.

이는 이중 보호에 해당합니다. 실제 개발에서는 버튼이 이미 비활성화되어 있다면 내부 판단은 생략할 수 있습니다. 하지만 학습 예제에서는 이를 유지하면 `canDecrease`의 역할을 더 분명하게 보여 줄 수 있습니다.

## 정리

이번 수업에서는 계산 프로퍼티를 주로 배웠습니다.

계산 프로퍼티는 값을 직접 저장하지 않고, 읽힐 때 기존 데이터를 바탕으로 결과를 계산합니다.

예를 들어:

```swift
var c: Int {
    a + b
}
```

여기서 `c`는 따로 저장할 필요가 없습니다. `a + b`를 통해 계산할 수 있기 때문입니다.

계산 프로퍼티는 반드시 `var`로 선언해야 하며, 반환 타입도 표시해야 합니다.

```swift
var canDecrease: Bool {
    count > 1
}
```

계산 프로퍼티는 숫자 값뿐만 아니라 판단 결과, 텍스트 내용, 심지어 SwiftUI 뷰 내용도 반환할 수 있습니다.

이번 수업에서는 `return`도 배웠습니다.

`return`은 결과를 반환한다는 뜻입니다.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

계산 프로퍼티 안에 결과를 직접 만드는 표현식이 하나만 있다면 `return`을 생략할 수 있습니다.

```swift
var totalPrice: Int {
    count * price
}
```

또한 `Color.primary`와 `disabled`도 알아보았습니다.

`Color.primary`는 SwiftUI의 시스템 의미 색상이며, 라이트 모드와 다크 모드에 따라 자동으로 표시 효과가 조정됩니다.

```swift
.foregroundStyle(Color.primary)
```

`disabled`는 뷰를 비활성화할지 제어할 때 사용합니다.

```swift
.disabled(true)
```

비활성화되어 클릭할 수 없다는 뜻입니다.

```swift
.disabled(false)
```

사용 가능하며 클릭할 수 있다는 뜻입니다.

따라서 계산 프로퍼티는 SwiftUI에서 매우 자주 사용됩니다. 계산 결과, 판단 조건, 표시 내용을 더 명확하게 정리하는 데 도움을 줍니다.
