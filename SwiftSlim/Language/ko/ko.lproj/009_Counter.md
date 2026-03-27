# 카운터

앞의 두 수업에서 우리는 변수, 상수, 버튼, 함수에 대해 배웠습니다.

이번 수업에서는 이 지식들을 함께 사용해, 간단한 카운터 앱을 만들어 봅니다.

이 예제에서 우리는 변수를 저장하고 변경하는 방법, 그리고 `@State`로 변수를 관리하는 방법을 배우게 됩니다.

## 카운터 구현하기

카운터는 계속 누적되어야 하는 수를 기록할 때 자주 사용됩니다. 예를 들어 줄넘기 횟수, 달리기 바퀴 수 같은 장면입니다.

이제 간단한 카운터를 만들어 봅시다: 숫자 하나와 버튼을 표시하고, 버튼을 누르면 숫자가 증가하도록 합니다.

![Num](../../RESOURCE/009_num.png)

### 숫자 표시하기

먼저 `Text`로 숫자를 표시합니다.

```swift
Text("0")
```

하지만 숫자가 바뀌어야 한다면 `"0"`을 직접 고정해 쓸 수 없고, 변수를 사용해 숫자를 저장해야 합니다.

```swift
var num = 0
```

그다음 `Text`에서 이 변수를 표시합니다:

```swift
Text("\(num)")
```

여기서는 문자열 보간 `\()`를 사용해 숫자를 문자열로 바꿔 표시합니다.

### 버튼으로 숫자 증가시키기

다음으로 버튼을 추가합니다.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

버튼이 눌렸을 때 숫자가 증가하기를 원합니다.

따라서 버튼 안에서 변수를 수정할 수 있습니다:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

이 코드는 버튼을 클릭할 때 `num + 1`을 계산하고, 그 결과를 다시 `num`에 대입한다는 뜻입니다.

### 더 간단한 문법

Swift는 더 간결한 문법도 제공합니다:

```swift
num += 1
```

이 문법은 다음과 같습니다:

```swift
num = num + 1
```

이것을 "복합 대입 연산자"라고 합니다.

Swift에서 자주 쓰는 복합 대입 연산자는 다음과 같습니다:

```
+=   덧셈 대입
-=   뺄셈 대입
*=   곱셈 대입
/=   나눗셈 대입
%=   나머지 대입
```

예:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### 전체 코드

이제 간단한 카운터를 이렇게 작성할 수 있습니다:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

하지만 이 코드는 지금 상태로는 정상적으로 실행되지 않습니다.

### 오류가 발생하는 이유

Xcode는 다음과 같이 알려 줍니다:

```
Cannot assign to property: 'self' is immutable
```

즉, 뷰가 불변이기 때문에 속성을 수정할 수 없다는 뜻입니다.

왜 이런 일이 생길까요?

## SwiftUI의 동작 원리

SwiftUI에서는: **화면이 데이터에 의해 구동됩니다.** 즉, 데이터가 바뀌면 화면도 자동으로 새로 고쳐집니다.

하지만 주의할 점은, 상태(`@State`, `@Binding` 등)가 변할 때만 SwiftUI가 그 변화를 감지하고 화면을 새로 고친다는 것입니다.

일반 변수를 사용하면, SwiftUI는 뷰가 처음 생성될 때 한 번만 값을 읽습니다. 그 뒤에 변수가 바뀌더라도 화면은 갱신되지 않습니다.

예:

```swift
var num = 0   // 0
num = 1   // 0
```

위 예에서 `num`은 일반 변수입니다. 값은 바뀌었지만 SwiftUI는 화면을 업데이트하지 않으므로, 화면에는 여전히 처음의 0이 표시됩니다.

![Num](../../RESOURCE/009_state.png)

그래서 데이터가 상태로 표시되어 있을 때(`@State`, `@Binding` 같은 property wrapper를 사용할 때)만, SwiftUI는 그 변화를 자동으로 감지하고 뷰를 갱신합니다.

## @State property wrapper

SwiftUI에서 변수를 수정하고 화면도 함께 갱신하려면 반드시 `@State`를 사용해야 합니다.

```swift
@State var num = 0
```

`@State`는 SwiftUI가 이 변수를 추적하도록 만듭니다.

변수가 바뀌면 SwiftUI는 뷰를 다시 계산하고, 뷰를 갱신합니다.

전체 코드:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

이제 버튼을 클릭할 때:

```swift
num += 1
```

SwiftUI는 `num`이 바뀐 것을 감지하고, 자동으로 뷰를 다시 업데이트합니다.

![Num](../../RESOURCE/009_state1.png)

## @State 사용 규칙

실제 개발에서 `@State`는 보통 두 가지 규칙을 따릅니다.

### 1. @State는 보통 private와 함께 사용

`@State` 변수는 보통 현재 타입(예: 현재 View 구조체) 안에서만 사용되므로, 일반적으로 다음처럼 작성합니다:

```swift
@State private var num = 0
```

이렇게 하면 다른 뷰가 이 변수를 직접 접근하거나 수정하는 것을 막을 수 있습니다.

아직 `private`는 배우지 않았으므로, 지금은 이렇게 간단히 이해하면 됩니다:

**private로 수식된 내용은 현재 뷰 안에서만 사용할 수 있고, 바깥 뷰에서는 사용할 수 없습니다.**

### 2. @State는 현재 뷰의 상태에만 사용

`@State`는 현재 View가 스스로 관리하는 데이터에 적합합니다.

예를 들어, 입력창의 내용이나 스위치의 상태 같은 것들입니다.

```swift
@State private var isOn = false
@State private var text = ""
```

만약 데이터가 여러 뷰 사이에서 공유되어야 한다면, `@Binding`이나 `@Observable` 같은 다른 상태 타입을 사용해야 합니다.

이 내용은 이후 수업에서 배우게 됩니다.

### 감소 버튼

카운터는 증가뿐 아니라 감소도 할 수 있어야 합니다.

우리는 `-` 버튼을 하나 추가할 수 있습니다.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

그리고 버튼들을 `HStack`으로 가로 정렬합니다:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

효과:

![Num](../../RESOURCE/009_num1.png)

`+` 버튼을 누르면 숫자가 1 증가하고, `-` 버튼을 누르면 숫자가 1 감소합니다.

### 리셋 버튼

숫자를 다시 0으로 돌리는 reset 버튼도 추가할 수 있습니다.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

reset 버튼을 누르면 `num`이 0으로 대입됩니다.

효과:

![Num](../../RESOURCE/009_num2.png)

`0` 버튼을 누르면 숫자가 0으로 바뀝니다.

### 사용자 정의 버튼

현재 버튼은 아직 텍스트만 표시할 수 있습니다:

```swift
Button("+") {

}
```

이런 방식의 버튼은 `+`, `-` 같은 텍스트만 표시할 수 있습니다.

실제 개발에서는 버튼의 외형을 더 풍부하게 만들고 싶을 때가 많습니다. 예를 들어 아이콘이나 다른 뷰를 표시하고 싶을 수 있습니다.

SwiftUI는 버튼의 표시 내용을 직접 커스터마이즈할 수 있도록 허용하며, 이때는 버튼의 또 다른 문법을 사용할 수 있습니다:

```swift
Button(action: {

}, label: {

})
```

이 문법에서 `action`은 버튼 클릭 시 실행되는 코드이고, `label`은 버튼에 표시될 뷰입니다.

예를 들어 버튼에 SF Symbols 아이콘을 표시할 수 있습니다:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

이렇게 하면 버튼은 더 이상 텍스트가 아니라 아이콘을 표시하게 됩니다.

### 카운터 화면 다듬기

카운터 화면을 더 분명하게 보이도록, 숫자 표시 스타일도 조정할 수 있습니다. 예를 들어 숫자를 더 크게 표시하면:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

이제 버튼의 표시 내용도 아이콘으로 바꾸고, 아이콘 크기도 적절히 키워 봅시다:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

마찬가지로 감소 버튼과 리셋 버튼도 아이콘 형식으로 바꿀 수 있습니다:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

이제 버튼들은 SF Symbols 아이콘을 표시하게 되고, 화면도 더 직관적으로 보이게 됩니다.

![Num](../../RESOURCE/009_num3.png)

## 정리

이번 수업에서는 간단한 카운터를 구현하며, 변수, `Text`, `Button`의 사용을 종합적으로 연습했습니다. 우리는 변수에 숫자를 저장하고, 버튼으로 숫자를 증가시키거나 감소시키며, `num += 1`, `num -= 1` 같은 복합 대입 연산자도 함께 배웠습니다.

구현 과정에서 SwiftUI의 동작 방식도 이해했습니다: 화면은 데이터에 의해 구동됩니다. 데이터가 바뀔 때만 화면이 새로 고쳐집니다. 따라서 변할 수 있는 상태를 저장하려면 `@State`를 사용해야 하며, `@State` 변수가 바뀌면 SwiftUI는 자동으로 뷰를 업데이트합니다.

마지막으로 화면을 간단히 다듬어, `Text`의 글꼴 스타일을 조정하고 `Button(action:label:)`로 버튼 내용을 사용자 정의해 아이콘을 표시하도록 만들었습니다. 덕분에 카운터 화면은 더 분명하고 보기 좋게 되었습니다.

이제 우리는 SwiftUI 뷰의 기본 사용 방식에 이미 닿았습니다. SwiftUI에서는 대부분의 화면이 변수에 의해 구동됩니다. 변수가 바뀌면 SwiftUI가 자동으로 뷰를 갱신합니다. 따라서 SwiftUI 앱을 개발할 때는, 먼저 어떤 데이터를 저장할지 설계하고, 그 데이터를 바탕으로 화면과 상호작용 로직을 구축하는 경우가 많습니다.

## 전체 코드

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
