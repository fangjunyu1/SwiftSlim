# 사용자 정의 보기

이번 수업에서는 SwiftUI에서 매우 중요한 작성 방식인 **사용자 정의 View**를 배웁니다.

사용자 정의 View는 반복되는 View 코드 조각을 캡슐화하여 여러 번 재사용할 수 있는 View로 만들 수 있습니다.

실제 App 개발에서는 이런 상황을 자주 만납니다. 여러 화면의 구조는 같지만 표시되는 내용만 다른 경우입니다.

예를 들어 포럼 웹사이트의 게시글 목록에서 각 게시글은 제목, 이미지, 좋아요 수 등의 정보를 가질 수 있습니다.

![Reddit](../../../Resource/028_view1.png)

쇼핑 웹사이트의 상품 목록에서 각 상품은 이미지, 이름, 가격 등의 정보를 가질 수 있습니다.

![Amazon](../../../Resource/028_view2.png)

이러한 내용의 구조는 비슷하며, 차이는 표시되는 데이터가 다르다는 점뿐입니다.

각 항목을 모두 수동으로 작성하면 코드가 매우 길어지고, 이후 수정하기도 불편합니다.

그래서 동일한 구조를 사용자 정의 View로 캡슐화한 다음, 서로 다른 내용을 파라미터로 전달할 수 있습니다.

이렇게 하면 같은 View가 서로 다른 내용을 표시할 수 있습니다.

## 요구 사항 시나리오

예를 들어, 지금 설정 목록을 만들어야 한다고 가정해 보겠습니다.

표시 결과:

![view](../../../Resource/028_view.png)

이 설정 목록에는 `설정`, `폴더`, `음악`이라는 세 가지 다른 설정 항목이 있습니다.

아이콘, 색상, 제목은 서로 다르지만 전체 구조는 같습니다.

- 왼쪽 아이콘
- 아이콘 배경색
- 가운데 제목
- 오른쪽 화살표

사용자 정의 View를 사용하지 않으면 다음과 같이 작성할 수 있습니다.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("설정")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("폴더")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("음악")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

이 코드는 정상적으로 표시될 수 있지만, 문제도 매우 분명합니다. 세 설정 항목의 코드가 거의 완전히 같습니다.

다른 부분은 아이콘, 색상, 제목뿐입니다.

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("설정")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("폴더")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("음악")
```

즉, 각 설정 항목의 구조는 고정되어 있고, 아이콘, 색상, 제목만 다릅니다.

이런 경우는 사용자 정의 View를 사용하기에 매우 적합합니다.

### 그림자 shadow

여기서는 새로운 modifier인 `.shadow(radius:)`를 사용했습니다.

```swift
.shadow(radius: 1)
```

`.shadow(radius:)`는 View에 그림자를 추가할 수 있습니다.

`radius`는 그림자의 흐림 반경을 의미합니다. 값이 클수록 일반적으로 그림자의 퍼짐 범위가 더 커지고, 더 부드럽게 보입니다.

여기서는 `1`로 설정했으며, 아주 약한 그림자 효과만 추가한다는 뜻입니다.

## 설정 항목 View 캡슐화

다음으로 각 설정 항목을 새로운 View로 캡슐화합니다.

`SettingItemView`를 만들 수 있습니다.

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

이 View에서는 세 가지 property를 정의했습니다.

```swift
let icon: String
let color: Color
let title: String
```

각각의 의미는 다음과 같습니다.

- `icon`은 아이콘 이름을 의미합니다
- `color`는 아이콘 배경색을 의미합니다
- `title`은 설정 항목 제목을 의미합니다

이 세 가지 내용은 설정 항목마다 다르기 때문에, 외부에서 전달할 수 있는 파라미터로 만듭니다.

## 사용자 정의 View 사용하기

`SettingItemView`가 생기면 더 이상 긴 `HStack` 코드를 반복해서 작성할 필요가 없습니다.

이제 다음과 같이 사용할 수 있습니다.

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "설정")
```

이 코드 한 줄은 설정 항목 View를 만들고 세 개의 파라미터를 전달한다는 뜻입니다.

```swift
icon: "gear"
color: Color.blue
title: "설정"
```

전달된 뒤에는 `SettingItemView` 내부의 properties가 각각 대응되는 값을 받습니다.

- `icon`의 값은 `gear`입니다
- `color`의 값은 `Color.blue`입니다
- `title`의 값은 `"설정"`입니다

따라서 View 내부의 `Image(systemName: icon)`은 톱니바퀴 아이콘을 표시하고, `.background(color)`는 파란색 배경을 사용하며, `Text(title)`은 `설정`을 표시합니다.

전체 코드:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "설정")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "폴더")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "음악")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

표시 결과:

![view](../../../Resource/028_view.png)

캡슐화한 뒤에도 표시 결과는 이전과 같지만, 코드는 더 명확해진 것을 볼 수 있습니다.

원래는 각 설정 항목마다 전체 `HStack` 코드를 작성해야 했지만, 이제는 코드 한 줄이면 됩니다.

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "설정")
```

이것이 사용자 정의 View의 역할입니다. **반복되는 View 구조를 캡슐화하고, 서로 다른 내용만 파라미터로 전달하는 것입니다.**

## 파라미터를 전달할 수 있는 이유

다음으로 사용자 정의 View가 왜 파라미터를 받을 수 있는지 간단히 이해해 보겠습니다.

SwiftUI에서 View는 본질적으로 구조체입니다.

예를 들면 다음과 같습니다.

```swift
struct ContentView: View {
    var body: some View {
        Text("안녕하세요, 세상!")
    }
}
```

여기서 `ContentView`는 구조체입니다.

우리가 다음과 같이 작성하면:

```swift
ContentView()
```

실제로는 `ContentView` View를 생성하는 것입니다.

뒤의 `()`는 초기화 메서드를 호출한다는 뜻이며, 이 View를 생성한다고 이해할 수도 있습니다.

이 `ContentView`에는 외부에서 전달해야 하는 properties가 없기 때문에 바로 다음과 같이 작성할 수 있습니다.

```swift
ContentView()
```

하지만 View 안에 값이 없는 property가 있다면, View를 만들 때 해당 값을 전달해야 합니다.

예를 들면 다음과 같습니다.

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("이름: \(name)")
    }
}
```

여기서 `name`은 property이며, 기본값이 없습니다.

그래서 `ContentView`를 만들 때 반드시 `name`에 구체적인 값을 전달해야 합니다.

```swift
ContentView(name: "Fang Junyu")
```

이렇게 해야 View 내부에서 이 값을 사용할 수 있습니다.

```swift
Text("이름: \(name)")
```

이것이 `SettingItemView`를 만들 때 파라미터를 전달해야 하는 이유이기도 합니다.

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "설정")
```

`SettingItemView`에는 기본값이 없는 세 가지 properties가 있기 때문입니다.

```swift
let icon: String
let color: Color
let title: String
```

따라서 이 View를 만들 때 이 값들을 전달해야 합니다. 전달된 파라미터는 Swift가 View 내부 properties에 값을 할당하는 데 사용됩니다.

## 초기화 메서드

다음으로 초기화 메서드를 조금 더 이해해 보겠습니다.

### 기본 초기화 메서드

일반적인 View를 정의할 때:

```swift
struct ContentView: View {
    var body: some View {
        Text("안녕하세요, 세상!")
    }
}
```

이 코드에서는 초기화 메서드를 직접 작성하지 않았습니다.

하지만 이 View를 사용할 때는 다음과 같이 작성할 수 있습니다.

```swift
ContentView()
```

여기서 `()`는 실제로 `ContentView`를 생성한다는 뜻이며, 초기화 메서드를 호출한다고 이해할 수도 있습니다.

### 초기화 메서드가 보이지 않는데도 호출할 수 있는 이유

Swift 컴파일러가 자동으로 초기화 메서드를 만들어 주기 때문입니다.

주의할 점은 **이 초기화 메서드는 자동으로 생성되며, 보통 코드에서 직접 보이지 않는다**는 것입니다.

즉, 우리가 `struct` 안에 직접 다음과 같이 작성하지 않았더라도:

```swift
init() {

}
```

Swift 컴파일러는 뒤에서 대략 다음과 같은 초기화 메서드를 만들어 줍니다.

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("안녕하세요, 세상!")
    }
}
```

그래서 다음과 같이 바로 작성할 수 있는 것입니다.

```swift
ContentView()
```

따라서 실제 코드에서는 보통 초기화 메서드를 직접 작성할 필요가 없습니다.

한 가지만 이해하면 됩니다. **SwiftUI View를 생성할 때는 해당 View의 초기화 메서드가 호출됩니다. 초기화 메서드를 직접 작성하지 않았더라도 Swift가 자동으로 생성할 수 있습니다.**

### 파라미터가 있는 초기화 메서드

View 안에 기본값이 없는 property가 있다면, 예를 들어:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("이름: \(name)")
    }
}
```

Swift 컴파일러는 property를 바탕으로 파라미터가 있는 초기화 메서드를 자동으로 생성합니다.

간단히 다음과 같이 이해할 수 있습니다.

```swift
init(name: String) {
    self.name = name
}
```

여기서:

```swift
init(name: String)
```

은 `ContentView`를 만들 때 `String` 타입의 `name` 파라미터를 전달해야 한다는 뜻입니다.

우리가 다음과 같이 작성하면:

```swift
ContentView(name: "Fang Junyu")
```

이는 `"Fang Junyu"`를 초기화 메서드에 파라미터로 전달한다는 뜻입니다.

그 다음 초기화 메서드 내부에서는 다음 코드가 실행됩니다.

```swift
self.name = name
```

이 코드 한 줄은 외부에서 전달된 `name`을 현재 View 자신의 `name` property에 할당한다는 뜻입니다.

간단히 다음과 같이 이해할 수 있습니다.

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("이름: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

이렇게 하면 View 내부에서 전달된 값을 사용할 수 있습니다.

이것이 파라미터가 있는 View의 초기화 흐름입니다. **View 안의 property에 기본값이 없으면, View를 만들 때 해당 파라미터를 전달해야 하며, 초기화 메서드가 property에 값을 할당합니다.**

## property에 기본값이 있는 경우

property에 이미 기본값이 있다면, View를 만들 때 파라미터를 전달하지 않아도 됩니다.

예를 들면 다음과 같습니다.

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("이름: \(name)")
    }
}
```

여기서 `name`에는 이미 기본값이 있습니다.

```swift
"Fang Junyu"
```

그래서 `ContentView`를 만들 때 바로 다음과 같이 작성할 수 있습니다.

```swift
ContentView()
```

이때 `name`은 기본값을 사용하며, 화면에는 다음과 같이 표시됩니다.

```swift
이름: Fang Junyu
```

물론 View를 만들 때 새로운 값을 전달할 수도 있습니다.

```swift
ContentView(name: "Sam")
```

이때 View는 기본값이 아니라 외부에서 전달된 `"Sam"`을 사용하며, 화면에는 다음과 같이 표시됩니다.

```swift
이름: Sam
```

이해하기 쉽게 Swift 컴파일러가 자동으로 생성하는 초기화 메서드를 다음과 같이 볼 수 있습니다.

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

여기서 `name: String = "Fang Junyu"`는 View를 만들 때 `name`을 전달하지 않으면 기본값 `"Fang Junyu"`를 사용하고, 새로운 `name`을 전달하면 전달된 값을 사용한다는 뜻입니다.

즉, **외부에서 파라미터를 전달하지 않으면 property의 기본값을 사용하고, 외부에서 파라미터를 전달하면 전달된 값을 사용합니다.**

## 다시 SettingItemView로 돌아가기

이제 다시 SettingItemView를 살펴보겠습니다.

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

이 View의 구조는 고정되어 있습니다.

고정된 부분은 다음과 같습니다.

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

서로 다른 부분은 다음과 같습니다.

```swift
icon
color
title
```

그래서 서로 다른 내용을 properties로 만들고, View를 만들 때 파라미터로 전달합니다.

서로 다른 설정 항목을 만들 때는 서로 다른 파라미터만 전달하면 됩니다.

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "설정")
SettingItemView(icon: "folder", color: Color.brown, title: "폴더")
SettingItemView(icon: "music.note", color: Color.purple, title: "음악")
```

이렇게 하면 같은 `SettingItemView`로 세 가지 다른 설정 항목을 표시할 수 있습니다.

이것이 사용자 정의 View를 사용하는 가장 일반적인 방식입니다.

## 정리

이번 수업에서는 사용자 정의 View를 배웠습니다.

사용자 정의 View의 핵심 역할은 **반복되는 View 코드를 캡슐화하여 재사용할 수 있게 만드는 것**입니다.

이번 예제에서는 세 설정 항목의 구조가 같고, 아이콘, 색상, 제목만 다릅니다.

그래서 `SettingItemView`를 만들었습니다.

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

그리고 이 View를 사용할 때 서로 다른 파라미터를 전달합니다.

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "설정")
```

여기의 파라미터는 `SettingItemView` 내부로 들어갑니다.

이 방식을 사용하면 더 적은 코드로 구조는 같지만 내용이 다른 View를 만들 수 있습니다.

이 역시 SwiftUI 개발에서 매우 자주 사용되는 작성 방식입니다.
