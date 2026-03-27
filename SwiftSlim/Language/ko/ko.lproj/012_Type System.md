# 타입 시스템

앞선 수업들에서 우리는 변수를 배웠고, 변수가 서로 다른 타입의 데이터를 저장할 수 있다는 것도 알고 있습니다.

예를 들어:

```swift
var hello = "Hello, World"
```

여기서 `hello`는 한 줄의 텍스트를 저장하므로, 그 타입은 `String`입니다.

이제부터는 타입(Type)의 개념, 명시적 타입 선언, 타입 추론을 체계적으로 배워서, 변수의 본질을 더 깊이 이해해 봅시다.

## 타입이란 무엇인가

Swift에서는 모든 값이 명확한 타입을 가집니다. 타입은 그 값이 무엇인지, 그리고 무엇을 할 수 있는지를 결정합니다.

예를 들어:

- 42는 `Int`(정수)입니다
- `"Hello"`는 `String`(문자열)입니다
- `true`는 `Bool`(불리언 값)입니다

이들은 서로 다른 타입에 속하고, 용도도 다릅니다.

## Swift의 대표적인 기본 타입

입문 단계에서 가장 자주 만나는 타입은 다음과 같습니다:

- String: 문자열(텍스트)
- Int: 정수
- Double: 부동소수점 수(소수 포함, 더 높은 정밀도)
- Bool: 불리언 값(true/false)

이 외에도 Float(부동소수점 수이지만 Double보다 정밀도가 낮아 보통 덜 사용됨), Character(단일 문자, 예: `"A"`, `"!"`) 같은 타입도 있습니다.

### 타입 선언(명시적 타입)

Swift에서는 변수를 선언할 때 타입을 직접 지정할 수 있습니다:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

변수 이름 뒤에 `: 타입`을 붙여 변수의 타입을 선언합니다.

배열 타입은 `: [타입]` 형태로 작성합니다:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

이 코드에서 `scores` 배열은 `Int` 타입 요소만 저장할 수 있고, `tags`는 `String` 타입 요소만 저장할 수 있습니다.

명시적 타입 선언은 코드의 의도를 더 분명하게 해 주고, 어떤 상황에서는 타입 추론 오류를 피하는 데도 도움이 됩니다.

## 타입 추론

많은 경우에는 타입을 명시적으로 적지 않아도 됩니다:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

그 이유는 Swift 컴파일러가 "초기값"을 보고 자동으로 타입을 추론하기 때문입니다.

## 명시적 선언과 타입 추론

앞선 수업에서는 이런 명시적 선언을 먼저 도입하지 않았습니다. 예:

```swift
var age: Int = 18
```

대신 타입 추론 방식부터 우선 사용했습니다:

```swift
var age = 18
```

이 예에서 두 문법은 같은 의미입니다. 둘 다 `age`는 `Int` 타입으로 결정됩니다. 비교해 보면 타입 추론 방식이 더 간결합니다.

초기 단계에서 명시적 선언을 강조하지 않은 이유는, 타입 추론이 코드 안의 추가 정보를 줄여 주기 때문입니다. 그만큼 입문 단계에서의 이해 부담도 낮아집니다.

## 왜 타입이 필요한가

Swift는 강타입 언어(Strongly Typed Language)입니다.

즉: 한 번 변수의 타입이 결정되면, 마음대로 다른 타입으로 바꿀 수 없습니다.

예:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

첫 번째 `20`은 `Int` 타입이므로 `age`에 대입할 수 있습니다. 두 번째 `"20"`은 `String` 타입이고, `Int`와 일치하지 않기 때문에 오류가 납니다.

`nums`는 `[Int]` 타입 배열이므로 정수만 저장할 수 있고, 문자열을 섞어 넣을 수 없습니다.

타입은 데이터 사용을 제약하여, 컴파일 단계에서 타입 불일치 문제를 발견할 수 있게 해 줍니다. 이를 통해 타입 혼란으로 인한 BUG를 줄이고, 코드의 안정성과 유지보수성을 높일 수 있습니다.

## 언제 명시적으로 타입을 선언해야 할까

Swift는 타입을 자동으로 추론할 수 있지만, 어떤 상황에서는 컴파일러가 추론하지 못하거나 잘못 추론할 수도 있습니다. 이럴 때는 수동으로 타입을 선언해야 합니다.

**1. 빈 배열**

빈 배열을 만들 때는 반드시 타입을 명시해야 합니다:

```swift
var nums: [Int] = []
```

타입을 쓰지 않으면:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

컴파일러는 빈 배열만 보고는 배열 요소의 타입을 추론할 수 없기 때문에, 컴파일 오류가 발생합니다.

**2. 잘못된 추론 피하기**

```swift
var value = 10   // Int
```

이 예에서 `10`은 `Double`로도 표현할 수 있지만, 소수점이 없기 때문에 컴파일러는 기본적으로 `Int`로 추론합니다.

만약 `value`를 부동소수점 수로 표현하고 싶다면, 타입을 명시해야 합니다:

```swift
var value: Double = 10   // Double
```

타입 추론 결과가 기대와 다를 때는, 명시적 타입 선언이나 리터럴 형태 조정을 통해 올바른 타입을 보장해야 합니다.

**3. 사용자 정의 타입**

뒤에서 사용자 정의 타입도 배우게 되는데, 이런 타입을 사용할 때도 보통 명시적 선언이 필요합니다:

```swift
var info: GameInfo
var users: [User] = []
```

이 역시 빈 배열과 같은 이유입니다. 컴파일러는 빈 값만으로는 타입을 자동 추론할 수 없습니다.

## 타입 변환

Swift에서는 서로 다른 타입 사이가 자동으로 변환되지 않으며, 반드시 수동으로 변환해야 합니다.

예를 들어 서로 다른 타입의 숫자 두 개를 더하면:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

이 코드에서 `a`는 `Int`, `b`는 `Double` 타입입니다. 타입이 다르기 때문에 바로 계산할 수 없습니다.

연산하기 전에, 둘 중 하나를 같은 타입으로 변환해야 합니다:

```swift
var result = Double(a) + b
```

이 코드는 `Int` 타입인 `a`를 `Double` 타입으로 변환한 뒤, `b`와 더해 그 결과를 `result`에 대입합니다.

주의할 점은, 타입 변환이 원래 변수의 타입을 바꾸는 것은 아니라는 것입니다. 예를 들어 `Double(a)`는 `a`의 `Int` 타입 자체를 바꾸지 않고, 연산에 사용할 새로운 `Double` 값을 하나 만들어 냅니다.

다른 타입도 비슷한 방식으로 변환할 수 있습니다. 즉, 목표 타입 + `()` 형태로, 변환할 값을 안에 넣으면 됩니다. 예:

```
Int()、Double()、String()
```

예제:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

주의할 점은, 모든 타입 변환이 항상 원하는 방식으로 성공하는 것은 아니라는 것입니다. 예를 들어 `Double → Int`에서는 소수 부분이 그대로 잘려 나가며, 반올림되지 않습니다.

## 타입 별칭

Swift에서는 기존 타입에 별칭을 붙여, 코드 의미를 더 분명하게 만들 수도 있습니다:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

여기서 `UserID`는 본질적으로 여전히 `Int`이며, 타입 자체는 바뀌지 않았습니다. 다만 이름이 더 의미 있어졌을 뿐입니다.

코드 양이 많고 타입 구조가 복잡한 프로젝트에서는 타입 별칭이 코드를 더 읽기 쉽게 만들어 줍니다.

## 타입 예제

이제 간단한 예제를 통해 타입이 실제 개발에서 어떤 역할을 하는지 살펴봅시다.

### 변수 만들기

먼저 `age`라는 변수를 만듭니다:

```swift
var age = 20
```

이 변수를 SwiftUI에서 표시하고 수정해야 하므로, `@State`를 사용해 선언해야 합니다:

```swift
@State private var age = 20
```

`private`는 이전에 언급했듯이, 이 변수가 현재 뷰 안에서만 사용된다는 뜻입니다. 이후 더 자세히 배우게 됩니다.

### SwiftUI에서 데이터 표시하기

SwiftUI에서 `age` 변수를 표시해 보면:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

이제 화면에는 다음이 표시됩니다:

```swift
age: 20
```

### 데이터 수정하기

이제 `age`를 수정하는 두 개의 버튼을 추가해 봅시다:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### 실행 결과

`changeAge1`을 클릭하면, `age`에는 18이 대입됩니다:

```swift
age = 18
```

18은 `Int` 타입이며 `age`의 타입과 일치하므로, 대입이 성공합니다.

`changeAge2`는 오류가 발생합니다:

```swift
age = "18"
```

오류 메시지:

```
Cannot assign value of type 'String' to type 'Int'
```

이는 `"18"`이 `String` 타입이기 때문입니다(문자열은 `""`로 감싸야 합니다). 하지만 `age`는 `Int` 타입이므로, 타입이 일치하지 않아 대입할 수 없습니다.

### 왜 오류가 날까?

핵심은 이 코드 줄에 있습니다:

```swift
@State private var age = 20   // Int
```

타입을 명시적으로 선언하지 않았더라도, 초기값 `20`이 `Int` 타입이기 때문에 컴파일러는 `age`를 자동으로 `Int` 타입으로 추론합니다.

한 번 타입이 결정되면, 다른 타입의 값을 다시 대입할 수 없습니다.

그리고 `changeAge2` 버튼의 오류는 "실행 중(runtime)"에 발생하는 것이 아니라, 컴파일 단계에서 바로 발생합니다. 즉, 코드가 아예 컴파일되지 않습니다.

이것 역시 Swift 강타입 시스템의 장점입니다. 코드를 작성하는 시점에 타입 문제를 미리 발견할 수 있기 때문입니다.

### 올바른 작성법

잘못된 코드를 삭제한 뒤에는:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

`changeAge1` 버튼을 누르면, 뷰는 다음과 같이 갱신됩니다:

```
age: 18
```

### 명시적 타입 선언(선택 사항)

정의할 때 타입을 명확히 지정할 수도 있습니다:

```swift
@State private var age: Int = 20
```

이런 방식은 타입을 더 분명하게 보여 주지만, 단순한 장면에서는 반드시 필요한 것은 아닙니다.

## 정리

이번 수업에서는 Swift의 타입 시스템과, 타입 시스템이 실제 개발에서 어떤 역할을 하는지 배웠습니다.

Swift에서는 모든 값이 명확한 타입을 가지며, 타입은 데이터의 의미와 그 데이터가 참여할 수 있는 연산을 결정합니다.

Swift는 강타입 언어이므로, 변수의 타입이 한 번 결정되면 다른 타입의 값을 다시 대입할 수 없습니다. 이런 제약은 컴파일 단계에서 오류를 발견하게 해 주므로, 실행 중 문제를 줄이고 코드 안전성을 높여 줍니다.

변수 타입은 초기값을 기준으로 자동 추론될 수도 있고, 명시적으로 선언할 수도 있습니다. 어떤 경우(예: 빈 배열, 잘못된 타입 추론, 사용자 정의 타입)에는 컴파일러가 올바르게 추론하지 못하므로, 이럴 때는 반드시 명시적 선언이 필요합니다.

서로 다른 타입 사이에는 자동 변환이 없으며, `Int()`, `Double()`, `String()` 같은 방식으로 명시적으로 변환해야 합니다.

타입은 별칭도 가질 수 있습니다. 특히 복잡한 프로젝트에서는 타입 별칭이 가독성을 높여 줍니다.

타입은 단순한 데이터 표식이 아니라, 하나의 제약 메커니즘이기도 합니다. 이를 통해 데이터 사용이 안전하고, 명확하며, 통제 가능해집니다.

## 확장 지식 - Optional 타입

타입 변환을 할 때, 어떤 작업은 실패할 수 있습니다.

예를 들어 `String`을 `Double`로 변환할 때:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

여기서 `Double(input)`이 반환하는 것은 `Double`이 아니라:

```
Double?
```

즉 Optional 타입입니다.

### 왜 Optional 타입이 반환될까?

문자열의 내용은 확정되어 있지 않기 때문입니다. `"3.14"`는 `Double`로 변환할 수 있지만, `"Hello"`는 `Double`로 변환할 수 없습니다.

즉, 이 작업은 성공할 수도 있고 실패할 수도 있습니다.

그래서 Swift는 이런 불확실성을 표현하기 위해 Optional 타입을 사용합니다.

### Optional 타입이란?

Optional 타입은 "값이 있을 수도 있고, 없을 수도 있다"는 뜻입니다.

예:

```
Double?
```

이 타입은 값이 있으면 출력 시 `Optional(...)`로 표시되고, 값이 없으면 `nil`을 반환합니다.

주의할 점은, `nil`은 "값이 없음"을 뜻하며, 0이나 빈 문자열이 아니라는 것입니다.

### 예제

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

출력:

```
pi:Optional(3.14)
```

이것은 문자열이 성공적으로 `Double`로 변환되어 3.14를 얻었지만, 타입이 `Double?`이기 때문에 Optional 안에 감싸져 있다는 뜻입니다.

변환이 실패하면:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

출력:

```
pi: nil
```

`"Hello"`는 `Double` 타입으로 변환할 수 없기 때문에, 변환이 실패하고 `nil`이 반환됩니다.

### Optional(...)은 무엇일까?

우리가 Optional 타입을 직접 출력하면:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift는 그 "디버그 설명"을 표시합니다:

```
Optional(3.14)
```

이것은 실제 데이터의 일부가 아니라, 현재 값이 "Optional 타입"이며 그 내부에 하나의 값이 들어 있다는 힌트입니다.

### Optional 풀어내기

실제 개발에서는 보통 Optional 타입 안에서 실제 값을 꺼내 써야 합니다. 이 과정을 언래핑(Unwrapping)이라고 합니다.

가장 흔한 방법 중 하나는 `??`를 사용해 기본값을 제공하는 것입니다:

```
??
```

이것을 Nil-Coalescing Operator(널 병합 연산자)라고 부릅니다.

예:

```swift
name ?? "FangJunyu"
```

이 코드는 `name`에 값이 있으면 그 값을 반환하고, `nil`이면 기본값 `"FangJunyu"`를 사용한다는 뜻입니다.

주의할 점은, 기본값의 타입은 Optional 내부 타입과 일치해야 한다는 것입니다.

### ??로 기본값 제공하기

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

출력:

```
pi: 30
```

`input`이 `Double` 타입으로 변환될 때 성공하면, 실제 값을 출력합니다. 변환이 실패하면 `??`가 제공한 기본값을 출력합니다.

만약 변환이 실패하면:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

출력:

```
pi: 10
```

여기서는 `input`을 `Double`로 변환할 때 실패하여 `nil`이 반환되고, `??`가 `nil`을 대신해 기본값을 제공합니다.

Optional 타입은 "값이 있을 수도 있고 없을 수도 있는" 상황을 표현하는 데 사용됩니다.

타입 변환처럼 실패할 가능성이 있는 연산에서 Swift는 프로그램의 안전성을 보장하기 위해 Optional 타입을 반환합니다.

그 안의 값을 사용해야 할 때는, `??`를 통해 기본값을 제공함으로써, `nil`이 나타나더라도 여전히 합리적인 결과를 얻을 수 있습니다。
