# 반복문과 목록

이번 수업에서는 Swift의 `for` 반복문과 SwiftUI의 `ForEach`를 배웁니다.

이 둘은 모두 배열 안의 요소를 순서대로 읽는 데 도움을 줍니다. 실제 개발에서는 여러 데이터를 하나씩 꺼내서 처리하거나 화면에 표시해야 하는 경우가 많고, 반복문은 이런 작업을 수행하는 중요한 도구입니다.

우리가 웹페이지를 보거나 App을 사용할 때, 많은 목록이나 항목을 자주 보게 됩니다. 이런 내용은 보통 먼저 `배열`에 저장한 뒤, 다시 `반복문`을 통해 하나씩 꺼내어 마지막에 화면에 표시합니다.

예를 들어, Google의 검색 결과 목록을 보면:

![Google](../../Resource/017_google.png)

검색 결과 목록의 각 항목은 보통 하나의 데이터에 대응하며, 반복문을 통해 순서대로 표시됩니다.

그래서 `배열`과 `반복문`은 자주 함께 등장합니다. `배열`은 여러 데이터를 저장하고, `반복문`은 그 데이터를 순서대로 꺼내 같은 작업을 수행합니다.

이제 가장 기본적인 `for` 반복문부터 시작해 보겠습니다.

## 카운트다운

예를 들어, 카운트다운 기능을 흉내 내기 위해 `“5、4、3、2、1”`을 순서대로 출력한다고 가정해 봅시다.

가장 직접적인 작성 방법은 다음과 같습니다.

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

이 방법도 카운트다운 기능을 흉내 낼 수는 있지만, 내용이 많아지면 매우 반복적으로 보이고 나중에 수정하기도 불편합니다.

이럴 때는 먼저 데이터를 배열에 넣고, `for` 반복문을 사용해 순서대로 출력할 수 있습니다.

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

이렇게 작성하면 더 간결하고 확장도 쉽습니다. 카운트다운 숫자가 많아져도 `print`를 한 줄씩 반복해서 작성할 필요 없이, 반복문이 배열의 각 요소를 자동으로 처리하면 됩니다.

이 코드를 버튼 안에 넣어서 테스트할 수도 있습니다.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

버튼을 클릭하면 `for` 반복문이 배열의 순서대로 `countDown` 안의 각 정수를 하나씩 꺼내 콘솔에 출력합니다.

이제 `for` 반복문이 어떻게 동작하는지 살펴보겠습니다.

## for 반복문

`for` 반복문은 한 묶음의 데이터를 순서대로 처리할 때 사용하며, 가장 흔한 대상은 배열과 범위입니다.

기본 형식:

```swift
for 요소 in 배열 또는 범위 {
    실행할 코드
}
```

예를 들어, 방금의 카운트다운 코드는 다음과 같습니다.

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

여기서 `i`는 현재 꺼낸 요소를 의미하고, `in` 뒤에는 반복할 데이터인 `countDown` 배열이 옵니다.

이 코드는 프로그램이 `countDown` 배열에서 요소를 순서대로 하나씩 꺼내고, 꺼낼 때마다 잠시 `i`라는 이름으로 가리킨 뒤, 중괄호 안의 코드를 실행한다는 뜻입니다.

실행 과정을 이해해 보면:

* 첫 번째로 꺼내는 값은 `5`이므로, 이때 `i`의 값은 `5`입니다.
* `print(i)`를 실행하면 `5`가 출력됩니다.
* 그다음 다음 요소인 `4`를 꺼냅니다.
* 다시 `print(i)`를 실행하면 `4`가 출력됩니다.

뒤의 `3`、`2`、`1`도 같은 방식으로 순서대로 실행됩니다.

![for](../../Resource/017_for.png)

배열의 모든 요소를 다 처리하면 `for` 반복문은 자동으로 종료됩니다.

우리는 `for` 반복문을 통해 배열의 각 요소를 얻고, 카운트다운 같은 기능을 구현할 수 있습니다.

**팁**: `i`는 for 반복문에서 매우 흔히 사용하는 이름으로, 현재 꺼낸 요소를 나타내는 데 사용됩니다. 하지만 고정된 문법은 아니므로 다른 영어 이름을 사용해도 됩니다.

예를 들어, 각 요소를 나타내기 위해 `num`을 사용할 수도 있습니다.

```swift
for num in countDown {
    print(num)
}
```

중괄호 안에서도 현재 꺼낸 요소를 나타내기 위해 `num`을 사용해야 합니다.

### 반복 범위

`for` 반복문은 배열뿐 아니라 범위도 반복할 수 있습니다.

예를 들어, `50` 이하의 양의 정수 합계를 계산하려면 `1`부터 `50`까지의 모든 정수를 차례대로 더해야 합니다.

가장 직접적인 작성 방법은 아마 다음과 같을 것입니다.

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

이 방법의 문제는 모든 숫자를 손으로 직접 써야 한다는 점입니다. 번거롭고 실제 개발 상황에도 적합하지 않습니다.

이럴 때는 범위 연산자와 `for` 반복문을 함께 사용하면 됩니다.

앞의 “연산자” 장에서 이미 범위 연산자를 배웠습니다.

```swift
1...3   // 1, 2, 3
```

여기서 `...`는 닫힌 범위를 의미하며, 시작값과 끝값을 모두 포함합니다.

따라서 여기서는 `1`부터 `50`까지의 정수 범위를 `for` 반복문에 사용할 수 있습니다.

```swift
for i in 1...50 {
    
}
```

이 숫자들을 더해야 하므로, 합계를 저장할 변수도 하나 필요합니다.

```swift
var count = 0
```

그다음 반복할 때마다 현재 꺼낸 숫자를 `count`에 더해 주면 됩니다.

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

이 코드는 다음 의미를 가집니다.

* `count`는 현재까지의 합계를 저장합니다.
* `for` 반복문은 `1`부터 `50`까지의 정수를 차례대로 꺼냅니다.
* 정수를 하나 꺼낼 때마다 `count += i`를 한 번 실행합니다.
* 반복이 끝나면 `count` 안에는 최종 합계가 저장됩니다.

이렇게 해서 `50` 이하 모든 양의 정수의 합을 구할 수 있습니다.

마찬가지로 `1`부터 `100`까지의 정수 합계를 구하고 싶다면 범위만 바꾸면 됩니다.

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` 반복문은 배열뿐 아니라 하나의 범위도 반복할 수 있습니다. 이렇게 데이터를 순서대로 반복 처리하는 능력은 개발에서 매우 자주 쓰입니다.

이 기능은 숫자를 하나하나 더하는 과정이나 다른 비슷한 반복 작업을 손으로 직접 작성하지 않고도, 많은 반복 작업을 자동으로 처리하도록 도와줍니다.

## SwiftUI에서의 반복

앞에서 본 `for` 반복문은 Swift 언어 자체의 기능입니다.

하지만 SwiftUI에서는 뷰 구조 안에서 `for`를 직접 사용해 뷰를 생성할 수 없습니다.

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

그 이유는 `VStack` 안에는 SwiftUI 뷰가 들어가야 하는데, 일반적인 `for` 반복문 자체는 뷰가 아니기 때문입니다.

SwiftUI에서 배열의 내용에 따라 화면 요소를 반복해서 만들고 싶다면 `ForEach`를 사용해야 합니다.

예를 들어, 한 그룹의 모든 구성원 이름을 표시하려면 이렇게 작성할 수 있습니다.

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

표시 결과:

![for1](../../Resource/017_for1.png)

이제 각 `Text`에 같은 modifier를 추가해 보겠습니다.

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

이제 각 `Text`는 더 작고 더 굵은 글꼴로 표시됩니다.

표시 결과:

![](../../Resource/017_for2.png)

modifier를 사용하면 화면은 더 보기 좋아지지만, 코드도 더 길고 반복적으로 됩니다.

이름이 더 많아지거나, 이후에 글꼴·색상 등의 스타일을 한꺼번에 수정하려면 같은 코드를 많이 반복해서 쓰고 고쳐야 하므로 번거롭고 유지보수도 어렵습니다.

이럴 때는 먼저 이름들을 배열에 넣고, SwiftUI의 `ForEach`를 사용해 배열의 데이터를 바탕으로 뷰를 반복 생성할 수 있습니다.

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

이 코드는 더 간결하며, `ForEach`가 배열의 각 요소를 순서대로 읽어 대응하는 내용을 화면에 표시합니다.

나중에 이름을 추가할 때도 `names` 배열의 내용만 바꾸면 되고, 매번 `Text`와 복잡한 modifier를 반복해서 추가할 필요가 없습니다.

## ForEach

`ForEach`는 SwiftUI에서 뷰를 반복 생성하는 데 사용하는 구조입니다. SwiftUI에서의 `for` 반복문과 비슷한 구조라고 이해하면 됩니다.

기본 사용법:

```swift
ForEach(배열, id: \.self) { 요소 in
    SwiftUI 코드
}
```

예를 들어, 방금의 그룹 이름 예시는 다음과 같습니다.

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

이 코드는 다음을 의미합니다.

`names`는 반복할 배열, 즉 표시할 데이터입니다.

`id:\.self`는 배열 안의 요소 자체를 사용해 각 요소를 구분한다는 뜻입니다.

현재 예시에서 배열에는 문자열이 저장되어 있습니다.

```swift
["Sam", "John", "Wathon", "Bob"]
```

따라서 SwiftUI는 "Sam"、"John"、"Wathon"、"Bob" 같은 문자열 자체를 사용해 서로 다른 내용을 구분합니다.

초보 단계에서 자주 만나는 String, Int 같은 단순한 배열은 보통 먼저 다음처럼 작성하면 됩니다.

```swift
id: \.self
```

지금은 이 한 가지 작성법만 먼저 기억하면 됩니다. 더 많은 id 규칙은 아직 깊이 알 필요가 없습니다.

`item in`의 `item`은 현재 꺼낸 요소를 의미합니다.

예를 들어, 첫 번째 반복에서는 `item`이 `"Sam"`이고, 두 번째 반복에서는 `item`이 `"John"`입니다.

따라서:

```swift
Text(item)
```

은 차례대로 다음과 같이 됩니다.

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

즉, 이 코드의 역할은 `names` 배열에서 각 이름을 하나씩 꺼내, 이름마다 하나의 `Text` 뷰를 생성하는 것입니다.

### 실행 과정

실행 과정은 다음처럼 이해할 수 있습니다.

* `ForEach`가 먼저 `names` 배열의 첫 번째 요소 `"Sam"`을 읽습니다.
* `item`이 잠시 `"Sam"`을 가리킵니다.
* `Text(item)`이 `"Sam"`을 표시합니다.
* 다음으로 `"John"`을 읽습니다.
* 같은 뷰 코드를 다시 반복 실행합니다.

마지막에는 배열 안의 모든 이름이 화면에 표시됩니다.

이렇게 작성하면 이름이 많아져도 `Text`를 여러 개 반복해서 쓸 필요 없이, 배열 내용만 수정하면 됩니다.

### 사진 반복하기

`ForEach`는 텍스트뿐 아니라 이미지, 색상, 또는 다른 SwiftUI 뷰도 표시할 수 있습니다.

예를 들어, 우리가 4장의 사진을 준비했다고 해 봅시다.

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

이 네 장의 사진을 Xcode의 Assets 폴더로 드래그합니다.

![image](../../Resource/017_for3.png)

`ForEach`를 사용하지 않으면 각 이미지를 직접 하나씩 작성해야 합니다.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

표시 결과:

![image](../../Resource/017_for4.png)

이렇게 작성해도 기능은 구현되지만, 코드가 비교적 길어집니다.

이미지가 많아질수록 `Image` 코드도 더 많이 반복해서 작성해야 합니다.

나중에 이미지 크기를 한꺼번에 수정하고 싶어도 하나씩 직접 수정해야 합니다.

이럴 때는 이미지 이름을 배열에 넣고, `ForEach`를 사용해 이미지 뷰를 반복 생성할 수 있습니다.

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

여기서 `images`는 문자열 배열이고, 배열의 각 요소는 이미지 이름입니다.

`ForEach(images, id: \.self)`는 `images` 배열의 각 요소를 순서대로 읽고, 요소 자체로 각 항목을 구분한 뒤, 현재 요소를 바탕으로 대응하는 뷰를 생성한다는 뜻입니다.

예를 들어, 처음 읽은 값이 `"430F9BEF"`라면:

```swift
Image(item)
```

은 다음과 같습니다.

```swift
Image("430F9BEF")
```

뒤의 이미지들도 같은 방식으로 순서대로 표시됩니다.

![image](../../Resource/017_for4.png)

여기서도 여전히 다음을 사용합니다.

```swift
id: \.self
```

이유는 앞과 같습니다. `images` 배열의 요소도 단순한 문자열 타입이기 때문에, 초보 단계에서는 요소 자체를 바로 구분 기준으로 사용하면 됩니다.

이것은 하나의 고정 공식처럼 간단히 이해할 수 있습니다.

**`ForEach`가 `String`이나 `Int` 같은 단순한 배열을 반복할 때는, 보통 `id: \.self`를 작성합니다.**

### 이미지 추가하기

나중에 이미지를 더 추가해야 한다면, 배열의 내용만 수정하면 됩니다.

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

새로운 `Image` 코드를 반복해서 작성할 필요는 없습니다.

이미지가 많다면 `ScrollView`와 함께 사용할 수도 있습니다. 그렇지 않으면 내용이 화면을 넘어가서 모두 미리 볼 수 없습니다.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### 이미지 수정하기

이미지 스타일을 한꺼번에 수정해야 한다면, `ForEach` 내부의 코드만 수정하면 됩니다.

예를 들어, 너비를 `80`으로 바꾸는 경우:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

이렇게 하면 모든 이미지가 함께 수정되고, 하나씩 고칠 필요가 없습니다.

이것이 `ForEach`의 중요한 역할 중 하나입니다.

**여러 뷰의 구조는 같고 내용만 다를 때, 뷰 코드는 한 번만 작성하고, 배열의 데이터가 무엇을 표시할지 결정하도록 만들 수 있습니다.**

## 정리

이번 수업에서는 `for` 반복문과 `ForEach`를 배웠습니다.

`for` 반복문은 배열이나 범위 안의 요소를 순서대로 처리할 때 사용하며, 데이터 처리에 더 가깝습니다.

`ForEach`는 SwiftUI에서 배열의 내용을 바탕으로 뷰를 반복 생성할 때 사용하며, 화면 표시 쪽에 더 가깝습니다.

현재 초보 단계에서 `ForEach`의 가장 흔한 작성법은 다음과 같습니다.

```swift
ForEach(배열, id: \.self) { 요소 in
    SwiftUI 코드
}
```

여기서 `id: \.self`는 요소 자체를 사용해 각 요소를 구분한다는 뜻입니다.

배열의 내용이 `String`、`Int` 같은 단순한 타입일 때는, 보통 먼저 이 한 가지 작성법을 사용하면 됩니다.

앞으로 웹페이지나 App을 보다가 반복되는 글자, 이미지, 또는 다른 목록형 내용을 본다면, SwiftUI에서는 이런 내용이 보통 먼저 배열에 들어가고, 다시 `ForEach`를 통해 하나씩 표시된다는 점을 떠올릴 수 있습니다.
