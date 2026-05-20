# 사진 갤러리

이번 수업에서는 사진 갤러리 페이지를 만들어 보겠습니다.

![view](../../../Resource/032_view13.png)

이 예제에서는 `extension`, `self`, 인스턴스에 대한 내용을 복습하고, SwiftUI에서 자주 사용하는 `Shape` 도형을 학습합니다.

이 지식을 활용하면 일반 이미지를 원형, 둥근 사각형, 캡슐형, 타원형 등 다양한 스타일로 자르고, 사진에 테두리 효과를 추가할 수 있습니다.

이번 수업에서는 `Shape`, `clipShape`, `strokeBorder`, `overlay`라는 몇 가지 새로운 내용을 사용합니다.

그중 `clipShape`는 뷰의 모양을 자르는 데 사용하고, `strokeBorder`는 도형 테두리를 그리는 데 사용하며, `overlay`는 뷰 위에 새로운 뷰를 겹쳐 놓는 데 사용합니다.

## 이미지 자료

시작하기 전에 몇 장의 이미지를 준비해야 합니다.

자신의 사진을 사용해도 되고, 이번 수업에서 제공하는 예제 이미지를 사용해도 됩니다.

이번 수업의 사진 예제는 [Pixabay](https://pixabay.com/) 웹사이트에서 가져왔습니다.

[풍경](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [여우](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [건축물](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [꽃](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [백조](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

이미지를 다운로드한 뒤 `Assets` 리소스 폴더에 추가하고, 차례대로 `1`, `2`, `3`, `4`, `5`라고 이름을 지정합니다.

![assets](../../../Resource/032_view17.png)

이렇게 하면 SwiftUI에서 `Image("1")`, `Image("2")` 형식으로 이미지를 표시할 수 있습니다.

## 사진 표시하기

먼저 `ContentView`에서 사진 5장을 표시합니다.

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

표시 효과:

![view](../../../Resource/032_view.png)

이 코드에서는 `ScrollView`를 사용해 사진 목록이 스크롤되도록 만들고, `VStack`을 사용해 여러 이미지를 위에서 아래로 배치합니다.

각 이미지는 `.resizable()`, `.scaledToFit()`, `.frame(width: 300)`을 통해 표시 효과를 설정합니다. 이렇게 하면 이미지가 크기를 조절할 수 있고, 비율을 유지한 채 전체가 표시되며, 이미지 너비도 제한됩니다.

`VStack`에 있는 `.padding(.vertical, 100)`은 위아래 간격을 늘려 첫 번째 사진과 마지막 사진이 화면 가장자리에 너무 붙지 않도록 합니다.

마지막의 `.ignoresSafeArea()`는 스크롤 뷰가 안전 영역을 무시한다는 뜻입니다. 사진을 스크롤할 때 화면 상단과 하단까지 확장되어 페이지가 더 완전하게 보입니다.

하지만 지금 5장의 이미지는 모두 같은 수정자를 사용하고 있습니다.

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

반복되는 코드를 발견하면 `extension`을 사용해 정리하는 것을 고려할 수 있습니다.

## extension으로 이미지 스타일 정리하기

`Image`에 사진 갤러리 전용 메서드를 확장할 수 있습니다.

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

여기서는 `Image` 타입에 `photoGalleryStyle` 메서드를 확장했습니다.

이 메서드 내부에는 앞에서 반복해서 사용한 `.resizable()`, `.scaledToFit()`, `.frame(width: 300)`이 포함되어 있습니다. 다시 말해 이미지 크기 조절, 비율 표시, 너비 설정 코드를 한곳에 정리한 것입니다.

이 확장을 사용하면 기존의 이미지 코드:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

를 다음과 같이 단순화할 수 있습니다.

```swift
Image("1")
    .photoGalleryStyle()
```

이렇게 하면 각 이미지는 `.photoGalleryStyle()`만 호출하면 같은 사진 갤러리 스타일을 적용할 수 있습니다. 코드가 더 간결해지고, 나중에 한 번에 수정하기도 더 편합니다.

## self 이해하기

확장 메서드 안에서 `self`를 작성했습니다.

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

여기서 `self`는 이 메서드를 호출한 현재 이미지 인스턴스를 의미합니다.

예를 들어:

```swift
Image("1")
    .photoGalleryStyle()
```

이 코드에서 `photoGalleryStyle()`은 `Image("1")`이 호출한 것이므로, 메서드 내부의 `self`는 이 `Image("1")` 이미지를 의미합니다.

간단히 이해하면, 누가 이 메서드를 호출했는지에 따라 `self`는 그 대상을 의미합니다.

주의할 점은 SwiftUI의 수정자는 계속해서 새로운 뷰 결과를 반환한다는 것입니다. 따라서 `photoGalleryStyle()`이 반환하는 것은 수정된 뷰이지, 단순히 원래의 `Image` 자체를 반환하는 것은 아닙니다.

## 사진 모양

이제 사진은 정상적으로 표시됩니다. 하지만 이 사진들은 기본적으로 모두 사각형이라 비교적 평범해 보입니다.

사진에 둥근 모서리만 만들고 싶다면 `.cornerRadius()`를 바로 사용할 수 있습니다.

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

표시 효과:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)`은 이미지에 `20 pt` 크기의 둥근 모서리를 추가한다는 뜻입니다. 일반적인 둥근 모서리 이미지라면 이 방식으로 충분합니다.

하지만 `.cornerRadius()`는 둥근 모서리 효과만 처리할 수 있어 일반적인 둥근 사각형 이미지를 만들 때 적합합니다. 사진을 더 다양한 모양으로 만들고 싶다면 이 수정자만으로는 부족합니다.

이때 SwiftUI의 `Shape`를 사용해야 합니다. `Shape`는 다양한 도형을 나타낼 수 있으며, `clipShape`와 함께 사용하면 이미지를 해당 모양으로 자를 수 있습니다.

## Shape 알아보기

SwiftUI에서 `Shape`는 도형을 의미합니다. `View`와 마찬가지로 SwiftUI에서 매우 자주 사용하는 타입입니다.

자주 사용하는 `Shape`에는 원형, 사각형, 둥근 사각형, 캡슐형, 타원형이 있습니다. 서로 다른 도형의 외형을 더 직관적으로 관찰하기 위해 아래 예제에서는 각 도형에 서로 다른 색상과 크기를 설정합니다.

이 예제들에서 `.fill()`은 도형에 색을 채우는 데 사용하고, `.frame()`은 도형의 표시 크기를 설정하는 데 사용합니다. 색상은 서로 다른 도형을 구분하기 위한 것이며, 도형 자체의 고정 색상이 아닙니다.

### Circle 원형

`Circle`은 원형을 의미합니다. 프로필 이미지, 원형 버튼, 원형 이미지 같은 인터페이스 효과에 자주 사용됩니다.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle 사각형

`Rectangle`은 사각형을 의미합니다. 가장 기본적인 도형 중 하나이며, 배경, 영역 분할, 일반 테두리 등을 만드는 데도 사용할 수 있습니다.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle 둥근 사각형

`RoundedRectangle`은 둥근 사각형을 의미합니다. `cornerRadius`는 둥근 모서리의 크기를 설정하는 데 사용합니다.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule 캡슐형

`Capsule`은 캡슐형을 의미합니다. 양쪽 끝이 둥근 호 모양이며, 캡슐 버튼이나 태그 배경 같은 인터페이스 효과에 자주 사용됩니다.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse 타원형

`Ellipse`는 타원형을 의미합니다. `Circle`과 비슷하지만 너비와 높이가 다르면 타원으로 표시됩니다.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

이 예제들을 통해 `Shape` 자체가 직접 도형으로 표시될 수 있음을 알 수 있습니다. 다음에는 이 `Shape`들을 `clipShape`와 함께 사용해 사진을 자르고, 사진이 서로 다른 모양으로 표시되도록 하겠습니다.

## clipShape로 사진 자르기

이제 `clipShape`를 사용해 사진을 서로 다른 모양으로 자를 수 있습니다.

예를 들어 첫 번째 사진을 원형으로 자릅니다.

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

이 코드는 먼저 이미지를 표시한 다음, `Circle()`을 사용해 원형으로 자른다는 뜻입니다.

![view](../../../Resource/032_view2.png)

`clipShape`의 기본 작성 방식은 다음과 같습니다.

```swift
.clipShape(도형)
```

뷰 뒤에 `.clipShape(...)`를 추가하고, 괄호 안에 자르고 싶은 도형을 입력합니다.

예를 들어:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

이제 사진 5장을 각각 서로 다른 모양으로 잘라 보겠습니다.

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

표시 효과:

![view](../../../Resource/032_view8.png)

그중 `Rectangle()`로 자른 결과는 일반 사각형 사진과 비슷해서 시각적 변화가 뚜렷하지 않습니다. 주로 다른 모양과 비교하기 위해 사용합니다.

이제 사진은 더 이상 일반 사각형만이 아니라 서로 다른 모양을 가지게 되었습니다.

## 사진 테두리 추가하기

원형 사진에 테두리를 추가하고 싶다면 `border`를 떠올릴 수 있습니다.

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

하지만 이렇게 얻는 것은 보통 원형 테두리가 아니라 사각형 테두리입니다.

![view](../../../Resource/032_view9.png)

그 이유는 `border`가 `clipShape`로 잘린 모양이 아니라 뷰의 사각형 영역을 기준으로 테두리를 추가하기 때문입니다.

따라서 원형 테두리를 만들고 싶다면 `border`를 직접 사용할 수 없습니다.

## strokeBorder로 도형 테두리 그리기

SwiftUI에서 `strokeBorder`는 이러한 일반적인 `Shape`에 안쪽 테두리를 그릴 수 있습니다.

예를 들어 원형 테두리를 그립니다.

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

이 코드는 `Circle`에 갈색 테두리를 그리고, 테두리 너비를 `10 pt`로 설정한다는 뜻입니다.

![view](../../../Resource/032_view12.png)

여기서 주의할 점은 `strokeBorder`가 사진에 직접 테두리를 추가하는 것이 아니라 `Circle()`이라는 도형에 테두리를 그린다는 것입니다.

즉, 이 코드로 얻는 것은 독립적인 원형 테두리일 뿐이며, 아직 사진과는 관계가 없습니다.

이 원형 테두리를 사진 위에 표시하려면 계속해서 `overlay`를 사용해 테두리를 사진 위에 겹쳐야 합니다.

## overlay로 테두리 겹치기

`overlay`는 현재 뷰 위에 새로운 뷰를 겹쳐 놓을 수 있는 뷰 수정자입니다.

기본 구조는 다음처럼 이해할 수 있습니다.

```swift
현재 뷰
    .overlay {
        겹쳐 놓을 뷰
    }
```

이 예제에서 현재 뷰는 이미 원형으로 잘린 사진입니다.

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

그 위에 겹쳐 놓을 새 뷰는 원형 테두리입니다.

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

따라서 사진과 테두리를 다음처럼 조합할 수 있습니다.

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

여기서 `overlay`는 현재 뷰 위에 새로운 뷰를 겹쳐 놓는다는 뜻입니다.

`overlay` 안에서 테두리는 현재 사진의 표시 범위에 맞춰 겹쳐지므로 `frame`을 따로 설정할 필요가 없습니다. 테두리 모양과 자르는 모양이 같기만 하면 테두리가 사진에 맞게 붙습니다.

![view](../../../Resource/032_view10.png)

최종 효과는 원형 사진 위에 원형 테두리가 덮여 있는 모습입니다.

`ZStack`과 비교하면 `overlay`는 “현재 뷰에 장식을 추가하는” 이런 상황에 더 적합합니다. 사진이 주체이고 테두리는 부가 효과이므로, `overlay`를 사용하면 구조가 더 명확합니다.

## 사진 갤러리 완성하기

이제 각 사진에 해당하는 모양과 테두리를 추가합니다.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

표시 효과:

![view](../../../Resource/032_view13.png)

이렇게 해서 기본적인 사진 갤러리 페이지가 완성되었습니다.

이 페이지에서는 `ScrollView`를 사용해 스크롤 표시를 구현하고, `Image`로 사진을 표시하며, `clipShape`로 사진 모양을 자르고, `overlay`와 `strokeBorder`를 통해 테두리를 추가했습니다.

## 전체 코드

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## 정리

이번 수업에서는 사진 갤러리 페이지를 완성했습니다.

![view](../../../Resource/032_view13.png)

이 예제에서는 먼저 `Image`를 사용해 사진을 표시한 다음, `extension`을 통해 `Image`에 `photoGalleryStyle` 메서드를 확장하여 반복되는 이미지 스타일 코드를 정리했습니다.

그다음 SwiftUI에서 자주 사용하는 `Shape`, 예를 들어 `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule`, `Ellipse`를 학습했습니다. 이러한 도형은 직접 표시할 수도 있고, `clipShape`와 함께 사용해 뷰를 자를 수도 있습니다.

예를 들어:

```swift
.clipShape(Circle())
```

는 뷰를 원형으로 자른다는 뜻입니다.

마지막으로 `overlay`와 `strokeBorder`를 사용해 사진에 해당 모양의 테두리를 추가했습니다. 주의할 점은 `border`는 보통 뷰의 사각형 영역을 기준으로 테두리를 그린다는 것입니다. 테두리가 원형, 캡슐형, 타원형을 따라가게 하려면 같은 `Shape`를 사용해 겹쳐 놓는 방식이 더 적합합니다.

이번 수업을 통해 우리는 사진 갤러리 효과를 완성했을 뿐만 아니라, `Shape`, `clipShape`, `strokeBorder`, `overlay`가 인터페이스에서 어떻게 자주 조합되는지도 이해했습니다.

## 수업 후 연습

### 1. 사진 갤러리 배경 추가하기

사진 갤러리 페이지에 전체 화면 배경 이미지를 추가합니다.

요구 사항: 배경 이미지는 전체 화면을 채울 수 있어야 하며, 안전 영역을 무시해야 합니다.

### 2. 그라데이션 테두리

기존의 단색 테두리를 선형 그라데이션 테두리로 수정합니다.

`LinearGradient`를 사용해 더 풍부한 테두리 효과를 구현해 볼 수 있습니다.

### 3. 실제 사진 프레임 흉내 내기

인터넷에서 실제 사진 프레임 스타일을 찾아보고, `overlay`를 사용해 이미지 프레임을 겹쳐 사진이 실제 액자 효과에 더 가까워지도록 만들어 봅니다.

연습 표시 효과:

![button](../../../Resource/032_view15.jpeg)

### 4. 둥근 버튼 테두리 구현하기

실제 개발에서 버튼은 둥근 사각형 테두리를 자주 사용합니다.

둥근 버튼을 만들어 보고, `RoundedRectangle`과 `strokeBorder`를 사용해 버튼에 둥근 테두리를 추가해 보세요.

연습 표시 효과:

![button](../../../Resource/032_view14.png)

### 생각해 볼 문제

단색 테두리도 사용하고 싶지 않고, 그라데이션 테두리도 사용하고 싶지 않으며, 테두리에 특정 무늬 효과를 표현하고 싶다면 어떻게 구현해야 할까요?

자료를 검색해 `overlay`, `mask`, `ImagePaint` 등의 관련 사용법을 알아볼 수 있습니다.

연습 표시 효과:

![button](../../../Resource/032_view16.png)
