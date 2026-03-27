# 저금통

이번 수업에서는 간단한 "저금통" 프로젝트를 만들어 봅니다. 기능은 단순하지만, 완전한 상호작용 로직이 포함되어 있어 초보자가 입문하기에 매우 적합합니다.

이 프로젝트를 통해 `TextField`(입력창), `border` 테두리, 그리고 데이터 바인딩(`$`)을 배우게 됩니다.

최종 목표는 금액을 입력하고, 버튼을 눌러 저장한 뒤, 총액에 누적되도록 하는 "저금통" 프로젝트를 완성하는 것입니다.

구현 결과:

![Piggy Bank](../../RESOURCE/014_view.png)

## 총금액 표시하기

먼저, 화면에 "저금통"의 총금액을 표시해야 합니다.

ContentView 안에서 "저금통"의 총금액을 저장하는 변수를 하나 선언합니다.

```swift
@State private var amount = 0
```

그다음 `Text`를 사용해 이 금액을 표시합니다:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

여기서는 `.font`와 `.fontWeight`를 사용해 글자의 크기와 굵기를 설정합니다.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

`amount`가 바뀌면, `Text`에 표시되는 총금액도 자동으로 갱신됩니다.

## 금액 입력하기

"저금통"은 총금액을 보여 주는 것뿐 아니라, 사용자가 입금/출금할 금액을 "입력"할 수 있어야 합니다. 이를 위해 SwiftUI의 뷰 컨트롤 `TextField`를 사용해야 합니다.

### TextField

`TextField`는 SwiftUI에서 내용을 입력하기 위한 뷰 컨트롤이며, 보통 한 줄 입력에 사용됩니다.

`TextField`는 주로 두 가지 바인딩 형식을 제공합니다:

**1. 문자열 타입(String) 바인딩**

```swift
TextField("Placeholder", text: $text)
```

이것은 이름, 제목 같은 텍스트 입력에 적합합니다.

**2. 숫자 타입(Int/Double) 바인딩**

```swift
TextField("Amount", value: $number, format: .number)
```

이것은 나이, 급여, 금액 같은 숫자 입력에 적합합니다.

`format: .number`는 이 입력창이 "숫자 형식"으로 내용을 해석하고 표시한다는 뜻입니다.

#### 텍스트 플레이스홀더

`TextField`의 첫 번째 파라미터는 플레이스홀더(Placeholder)이며, 사용자가 어떤 내용을 입력해야 하는지 안내합니다:

```swift
TextField("input your name", text: $text)
```

입력창이 비어 있을 때는 회색 안내 문구가 표시됩니다.

![textfield](../../RESOURCE/014_textfield.png)

#### 데이터 바인딩

`TextField`는 입력 내용을 영구적으로 저장해 주지 않으며, 바인딩된 변수를 통해 데이터를 관리해야 합니다.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

사용자가 입력한 내용은 직접 `text` 변수에 저장됩니다. `TextField`는 입력 인터페이스만 담당합니다.

`$`는 바인딩(Binding)을 의미합니다:

```swift
$text
```

이것은 일반 변수가 아니라 `Binding` 타입입니다.

그 역할은 뷰와 데이터 사이의 연결을 만드는 것입니다:

사용자가 `TextField`에 내용을 입력하면 `text`가 자동으로 갱신되고, `text`가 바뀌면 `TextField`도 함께 갱신됩니다.

예:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

`TextField`에 내용을 입력하면, 위쪽의 `Text`가 실시간으로 같은 내용을 표시합니다.

![textField](../../RESOURCE/014_textfield1.png)

### 숫자 타입 바인딩

숫자를 입력해야 한다면, 그에 맞는 타입의 변수를 바인딩해야 합니다:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

사용자가 금액을 입력하면, `TextField`는 입력 내용을 숫자로 해석하고 `number`의 값을 자동으로 갱신합니다.

## 입력창 추가하기

`TextField`의 기본 사용법을 이해한 뒤, 이제 이를 "저금통" 프로젝트에 적용해 봅니다.

"저금통"에서는 "금액"을 입력해야 하므로, 우리는 "숫자 타입(Int/Double) 바인딩" 방식을 사용하고, 사용자가 입력한 금액을 저장할 `number` 변수를 추가합니다:

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
		}
    }
}
```

이제 `TextField`는 기본적으로 `number`의 값(기본값은 0)을 표시합니다.

입력 내용을 모두 지우면 플레이스홀더 `"Amount"`가 표시됩니다.

이것은 다시 한 번, `TextField`가 스스로 내용을 저장하는 것이 아니라, 바인딩된 변수의 값을 표시한다는 것을 보여 줍니다.

### 입력창 크기 문제

현재 화면을 보면 `TextField`에는 테두리가 없고, 0 하나만 표시되며, 내용은 왼쪽 정렬처럼 보입니다.

효과는 다음과 같습니다:

![textfield](../../RESOURCE/014_textfield2.png)

이는 `TextField`가 기본적으로 부모 뷰의 전체 너비를 차지하기 때문입니다.

배경색을 추가해 보면 이를 확인할 수 있습니다:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

효과:

![textfield](../../RESOURCE/014_textfield3.png)

`TextField`가 실제로 한 줄 전체 너비를 채우고 있다는 것을 볼 수 있습니다.

### 고정 너비 설정

입력창을 더 컴팩트하게 만들고 싶다면, `frame`을 사용해 너비를 제한할 수 있습니다:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

효과:

![textfield](../../RESOURCE/014_textfield4.png)

### 테두리와 내부 여백 추가하기

`TextField`는 기본적으로 테두리가 없으므로, 스타일을 직접 추가할 수 있습니다:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

이제 이 입력창은 더 "표준적인 입력창"처럼 보입니다.

![textfield](../../RESOURCE/014_textfield5.png)

## 테두리

SwiftUI에서 `border`는 뷰에 테두리를 추가하는 데 사용됩니다.

기본 사용법:

```swift
border(Color.black, width: 1)
```

여기서 `Color.black`은 테두리 색상, `width`는 테두리의 두께를 의미합니다.

`TextField`에서는 다음과 같이 사용합니다:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

이것은 입력창에 검은색, 두께 1 pt의 테두리를 추가한다는 뜻입니다.

다른 색상, 예를 들어 `Color.blue`, `Color.green`을 시도해 보거나, `width: 2`처럼 더 굵은 테두리도 적용해 볼 수 있습니다.

## 저금 버튼

이제 우리에게는 총금액을 표시하는 `amount` 변수, 금액을 입력하는 `TextField`, 그리고 입력창과 바인딩된 `number` 변수가 있습니다.

현재 코드는 다음과 같습니다:

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
		}
    }
}
```

### 버튼 추가하기

이제 저금 동작을 실행할 버튼을 추가해야 합니다.

```swift
Button("Save") {
    
}
```

### 저금 로직 구현하기

우리가 원하는 것은 사용자가 금액을 입력하고 버튼을 누르면, 그 금액이 자동으로 총금액에 누적되는 것입니다.


```swift
Button("Save") {
    amount += number
}
```

여기서는 "복합 대입 연산자"를 사용해, 사용자가 입력한 금액 `number`를 총금액 `amount`에 더하고 있습니다.

### 입력 금액 초기화하기

이제 한 가지 문제가 있습니다. 버튼을 누를 때마다 입력창의 금액이 자동으로 비워지지 않습니다.

예를 들어 사용자가 10을 입력하고 저장을 누른 뒤에도, 입력창에는 여전히 10이 남아 있습니다. 이것은 다음 저금 입력에 영향을 줍니다.

이는 `TextField`가 `number`에 바인딩되어 있기 때문입니다. 버튼을 클릭할 때 우리는 `amount`만 수정했고, `number`는 바뀌지 않았으므로 입력창에는 여전히 이전 값이 표시됩니다.

따라서 버튼을 누른 뒤에는 입력 금액을 먼저 총액에 더하고, 그다음 입력값을 초기화하는 로직을 추가해야 합니다:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

이제 사용자가 금액을 입력하고 버튼을 클릭하면, 입력 금액이 총금액에 누적되고, `number`는 0으로 재설정되어 다음 입력을 준비하게 됩니다.

이렇게 해서 "저금통"의 모든 저금 로직을 구현할 수 있습니다.

## 화면 다듬기

기능 구현이 끝난 뒤에는, 배경 이미지와 버튼 스타일을 추가해 화면을 간단히 다듬을 수 있습니다.

버튼 스타일 추가:

```swift
.buttonStyle(.borderedProminent)
```

배경 이미지 추가:

```swift
.background {
    Image("1")
}
```

이제 저금통 프로젝트 전체를 완성했습니다.

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

구현 결과:

![Piggy Bank](../../RESOURCE/014_view.png)

이제 100이나 그 이상의 금액을 저금해 보면서, "저금통" 로직에 문제가 없는지 확인해 볼 수 있습니다.

또는 이 "저금통"을 시뮬레이터나 실제 기기에서 실행해 보며, 우리가 만든 앱을 직접 체험할 수도 있습니다.

### 디버그 출력

로직이 올바른지 확인하기 위해, 버튼 안에 디버그 로직을 추가해 입력 금액이 제대로 처리되는지도 검증할 수 있습니다:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

매번 저금을 하고 버튼을 클릭할 때마다, 해당 디버그 출력을 통해 코드 로직에 문제가 없는지 확인할 수 있습니다.

```
---Saving---
amount:11
number:0
```
