# 저금통 금액 저장하기

지난 수업에서 우리는 간단한 "저금통"을 만들었습니다. 이번 수업에서는 "저금통"의 금액을 영속적으로 저장하는 방법을 배웁니다.

이번 수업의 핵심은 `UserDefaults`와 `@AppStorage` property wrapper이며, 동시에 `onAppear`의 역할과 Optional 타입(`nil`) 사용법도 확장해서 설명합니다.

주의: 이번 수업에서는 지난 수업에서 만든 "저금통" 코드를 이어서 사용해야 합니다.

## 영속 저장 문제

현재 "저금통"의 화면은 매우 간결하고 사용하기도 편리합니다.

![Piggy Bank](../../Resource/014_view.png)

하지만 한 가지 분명한 문제가 있습니다. 화면을 새로 고치거나 앱을 닫을 때마다, "저금통"의 총금액은 다시 0이 되고, 이전에 저장했던 금액도 모두 사라집니다.

즉, 데이터가 실제로 저장된 것이 아닙니다. 다시 말해 지금의 "저금통"은 임시 데이터만 저장할 수 있습니다.

### 왜 영속적으로 저장되지 않을까?

그 이유는 우리가 `@State`로 선언한 변수 때문입니다:

```swift
@State private var amount = 0
```

`@State`로 선언된 변수의 생명주기는 완전히 뷰에 의존합니다.

뷰가 생성될 때 `amount`는 0으로 초기화되고, 뷰가 파괴될 때 `amount`도 함께 사라집니다.

여기서 `amount`에 저장된 데이터는 메모리에만 존재하며, 기기에 저장되지 않습니다.

우리는 `amount`가 뷰의 생명주기에 묶여 있기를 원하지 않습니다. 따라서 데이터 영속 저장을 구현해야 합니다. 다시 말해, 데이터를 기기에 저장해야 합니다.

### "데이터 영속화"란 무엇인가

데이터 영속화는 데이터를 "임시 메모리"에서 "기기 저장소"로 저장하는 것이라고 이해할 수 있습니다.

뷰를 닫거나 앱을 종료해도 데이터는 사라지지 않습니다.

Swift 개발에서 간단한 데이터 영속화는 `UserDefaults`로 구현할 수 있고, 더 복잡한 데이터는 `SwiftData`나 `CoreData`를 사용해야 합니다.

이번 수업에서는 가장 간단한 `UserDefaults`부터 배웁니다.

## UserDefaults

`UserDefaults`는 가벼운 key-value 데이터 저장에 사용되며, `String`, `Int`, `Double`, `Bool` 같은 기본 타입 저장에 자주 쓰입니다.

### 데이터 저장

`UserDefaults`는 `set` 메서드로 데이터를 저장합니다:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults`의 첫 번째 파라미터는 저장할 데이터이며, 여기서는 `String`, `Int` 등의 값을 전달합니다.

두 번째 파라미터 `forKey`는 변수 이름과 비슷한 역할을 하며, `UserDefaults` 안에 어떤 데이터를 저장했는지 식별하는 데 사용됩니다.

### 데이터 읽기

`UserDefaults`는 해당 타입에 맞는 메서드로 데이터를 읽습니다:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

데이터를 읽을 때는 반드시 맞는 타입의 메서드를 사용해야 하며, 그렇지 않으면 오류가 나거나 데이터가 올바르지 않을 수 있습니다.

### UserDefaults 사용 시 주의점

#### 1. Optional 타입을 반환하는 경우

`UserDefaults`에서 데이터를 읽을 때, 일부 메서드는 Optional 타입을 반환합니다.

예:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

이때 `name`의 타입은:

```swift
String?
```

즉, 값이 있을 수도 있고 없을 수도 있다는 뜻입니다.

**왜 Optional 타입을 반환할까?**

이는 `UserDefaults` 안의 어떤 Key에 대해, 그에 대응하는 데이터가 반드시 존재한다고 보장할 수 없기 때문입니다.

예:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

만약 `"City"`라는 Key를 한 번도 저장한 적이 없다면, 읽은 결과는:

```swift
nil
```

강조하고 싶은 점은, `nil`은 데이터가 없다는 뜻이지 빈 문자열이 아니라는 것입니다.

"타입 시스템" 수업에서도 비슷한 상황을 본 적이 있습니다. 데이터 타입 변환에 실패했을 때 Optional 타입이 반환되었습니다.

이때는 `??`를 사용해 기본값을 제공하면서 언래핑할 수 있습니다:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

`UserDefaults`에서 값을 읽어 왔다면 그 값을 사용하고, 읽어 오지 못했다면(`nil`) 기본값을 사용합니다.

#### 2. Optional이 아닌 타입 반환

`UserDefaults`는 `Int`, `Double`, `Bool` 타입을 읽을 때 Optional이 아닌 값을 반환합니다.

예:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

이런 Key들이 한 번도 저장된 적이 없어도, 반환값은 `nil`이 되지 않습니다.

대신 다음과 같은 기본값이 반환됩니다:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. 데이터 양의 제한

`UserDefaults`는 적은 양의 데이터 저장에만 적합합니다. 예를 들어 앱 설정값, 간단한 상태 데이터 등이 여기에 해당합니다.

실제 상황에서는, 대량 데이터나 매우 빈번한 읽기/쓰기가 필요한 데이터 저장에는 적합하지 않습니다.

## "저금통" 금액 저장하기

이제 `UserDefaults`를 사용해 "저금통"의 총금액을 저장하는 코드 로직을 구현할 수 있습니다.

사용자가 버튼을 클릭했을 때, 입력한 금액을 총금액에 더하고, 그 총금액을 `UserDefaults`에 저장합니다.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

이제 데이터 쓰기 로직이 완성되었습니다.

## 데이터 영속 로직 설명

우리가 이미 데이터 저장 로직은 완성했지만, 실제로 실행해 보면 여전히 문제가 있습니다. 화면을 새로 고치거나 앱을 다시 열 때마다 `amount` 변수는 여전히 0입니다.

그 이유는 다음과 같습니다:

```swift
@State private var amount = 0
```

SwiftUI에서 `@State` 변수는 뷰가 생성될 때마다 다시 초기화됩니다.

`UserDefaults` 안에는 `amount` 값이 저장되어 있더라도, 뷰가 다시 로드될 때 `amount`는 여전히 0으로 재설정됩니다.

즉, 지금은 데이터를 `UserDefaults`에 저장하기만 했을 뿐, 뷰 안에서 다시 복원하지는 않은 상태입니다.

그래서 뷰가 로드될 때 `UserDefaults`에서 데이터를 수동으로 읽어와, 다시 `amount`에 대입해야만 전체 데이터 영속화 로직이 완성됩니다.

### 논리적 비유

이 과정을 "교실의 칠판"에 비유해 볼 수 있습니다:

수업 시간에 선생님은 칠판에 내용을 적습니다. 이 내용은 현재 뷰의 상태(`@State`)와 비슷합니다.

수업이 끝나면, 다음 수업을 준비하기 위해 칠판은 지워집니다. 이는 뷰가 파괴되고 `@State` 속 데이터도 사라지는 것과 같습니다.

내용이 사라지지 않도록, 선생님은 미리 수업 자료에 내용을 저장해 둡니다. 이 자료가 바로 `UserDefaults`에 저장된 데이터와 비슷합니다.

다음에 수업을 다시 시작할 때, 칠판은 처음에는 비어 있습니다(`@State` 초기화). 선생님은 자료를 보고 이전 내용을 다시 칠판에 적어야 합니다(`UserDefaults` 읽기).

즉, 칠판은 이전 내용을 자동으로 복원하지 않으며, 반드시 "수업 자료 읽기"(`UserDefaults` 읽기)를 통해 다시 써 넣어야 합니다.

## onAppear로 데이터 읽기

뷰가 표시될 때, `UserDefaults` 안의 값을 수동으로 읽어 `@State`의 `amount` 변수에 대입해야만, 진정한 데이터 영속화가 이루어집니다.

SwiftUI에서는 `onAppear`를 사용해, 뷰가 표시될 때 초기화 로직을 실행할 수 있습니다:

```swift
.onAppear {}
```

`UserDefaults`를 읽는 코드를 `onAppear` 안에 넣습니다:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

뷰가 생성될 때 `amount`는 0으로 초기화되고, 뷰가 화면에 나타날 때 `onAppear`가 호출되어 `UserDefaults`의 값을 읽어 `amount`에 대입합니다. 이렇게 하면 이전에 저장된 총금액을 뷰에 표시할 수 있습니다.

이제 "저금통"의 전체 데이터 영속화 로직이 완성됩니다.

## 전체 코드

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage property wrapper

SwiftUI는 `@AppStorage` property wrapper를 제공하며, 이를 통해 `UserDefaults` 저장 로직을 더 간단하게 만들 수 있습니다.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage`는 `UserDefaults`를 감싼 래퍼입니다. `"amount"`는 `UserDefaults`의 Key에 해당합니다.

뷰가 생성될 때 `UserDefaults`에서 데이터를 읽고, 변수가 바뀌면 자동으로 `UserDefaults`에 저장합니다.

또한 SwiftUI의 상태 갱신 메커니즘도 지원하므로, `@State`처럼 값이 바뀌면 SwiftUI 뷰를 새로 고칩니다.

즉, `@AppStorage`는 데이터 읽기와 저장 로직을 함께 처리해 줍니다. 따라서 더 이상 `UserDefaults`를 직접 호출할 필요가 없고, `onAppear`로 수동으로 데이터를 읽을 필요도 없습니다.

그래서 우리는 코드 안의 `UserDefaults`를 `@AppStorage`로 바꿀 수 있습니다:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## 정리

이번 수업에서는 주로 다음과 같은 내용을 배웠습니다:

먼저, `UserDefaults`는 가벼운 데이터를 저장하는 데 사용되며, 우리는 총금액을 기기에 저장하기 위해 `UserDefaults`를 사용했습니다. `UserDefaults`는 읽기와 쓰기 메서드를 제공하며, Optional 타입 같은 경우도 함께 처리해야 합니다.

다음으로, `@State` 변수는 뷰 안의 임시 상태만 관리하는 데 사용되고, 그 생명주기는 뷰와 동일합니다. 뷰가 다시 생성되면 `@State`도 다시 초기화됩니다.

또한 `UserDefaults`의 데이터를 복원할 때는, `onAppear`를 사용해 뷰가 화면에 나타날 때 `UserDefaults`를 읽고 데이터를 복원하는 방법도 배웠습니다.

마지막으로, `@AppStorage`로 `UserDefaults`를 대체하면, 뷰가 로드될 때 자동으로 데이터를 읽고, 데이터가 바뀔 때 자동으로 다시 저장할 수 있습니다. 따라서 `UserDefaults`와 `onAppear`를 직접 다루는 수동 로직을 대신할 수 있습니다.

이 지식들을 통해 우리는 기본적인 App 데이터 저장 기능을 구현하고, 데이터를 영속적으로 보존할 수 있게 됩니다.

## 수업 후 연습

이제 "저금통"은 금액 저장을 지원하지만, 기능은 아직 완전하지 않습니다.

1. 사용자가 금액을 인출하고 싶을 때를 위한 출금 로직도 설계해야 합니다。
2. 사용자가 금액을 완전히 비우고 싶을 때를 위한 초기화 로직도 필요합니다。
3. 저금통에 이름을 붙이고 싶다면, `String` 타입 데이터를 저장하는 기능도 추가해야 합니다。

이 기능들을 현재 코드 위에 보완하면, "저금통" 기능을 더 완전하게 만들 수 있습니다.

## 확장 지식 - 입력창 기본값 문제

이제 입력창의 상호작용도 더 최적화하여, 입력 경험을 더 편리하게 만들 수 있습니다.

![textfield](../../Resource/015_view.png)

현재 구현에서는 입력창의 기본값이 0입니다. 사용자는 매번 금액을 입력할 때마다 먼저 0을 지우고 새 값을 입력해야 하는데, 이런 상호작용은 그다지 합리적이지 않습니다.

우리는 입력창의 초기값을 0이 아니라 빈 값으로 만들어야 합니다.

그 이유는 `TextField`와 `number`가 양방향으로 바인딩되어 있기 때문입니다:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number`가 0으로 초기화되면, 입력창도 0을 표시하게 됩니다.

따라서 `number`를 빈 값, 즉 `nil`로 바꿔야 합니다.

```swift
@State private var number = nil
```

이때 오류가 발생합니다:

```
Generic parameter 'Value' could not be inferred
```

이것이 바로 "타입 시스템" 수업에서 언급했던 상황입니다. 변수가 자동으로 타입을 추론할 수 없을 때는, 명시적으로 타입을 선언해야 합니다.

왜냐하면 `number`를 `nil`로 설정하면, `nil` 자체에는 어떤 타입 정보도 포함되어 있지 않기 때문입니다. 컴파일러는 이 변수가 `String`인지 `Int`인지 혹은 다른 타입인지 알 수 없어서 오류를 냅니다.

따라서 `number`의 타입을 명시적으로 선언해야 합니다:

```swift
@State private var number:Int? = nil
```

여기서 `Int?`는 Optional 타입을 의미하며, `number`의 값이 `Int`일 수도 있고 `nil`일 수도 있다는 뜻입니다.

이렇게 초기값을 `nil`로 설정하면, 입력창에는 0이 아니라 빈칸이 표시됩니다.

### Optional 언래핑

`number`를 Optional 타입으로 바꾼 뒤에는, 기존 계산 코드가 오류를 일으킵니다:

```swift
amount += number
```

오류 메시지:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

이는 `number`가 이제 `nil`일 수도 있기 때문입니다. 이를 그대로 계산에 사용하면:

```swift
amount += nil
```

와 같은 상황이 됩니다.

당연히 `nil`은 `amount`와 더할 수 없으며, 이는 유효한 연산이 아닙니다.

그래서 Optional 타입을 계산에 사용하기 전에는 먼저 언래핑해야 합니다.

여기서는 `??`를 사용해 기본값을 제공할 수 있습니다:

```swift
amount += number ?? 0
```

`number`가 `nil`이면 기본값 0을 사용하고, 값이 있으면 실제로 입력된 데이터를 사용합니다.

이렇게 하면 계산의 정확성도 보장할 수 있고, 동시에 입력창이 기본적으로 비어 있는 효과도 구현할 수 있습니다. 사용자는 더 이상 입력창에 있는 0을 매번 수동으로 지울 필요가 없습니다.

## 확장 코드

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
