# 코스 카드

이번 수업은 단계별 복습 수업이며, 우리는 “코스 카드”를 완성합니다.

이 연습을 통해 앞에서 배운 `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` 등의 내용을 복습하고, 여러 작은 뷰를 하나의 완성된 뷰 모듈로 조합하는 방법을 배울 수 있습니다.

코스 카드 효과:

![view](../../../Resource/026_view.png)

이 코스 카드는 주로 몇 가지 부분으로 구성됩니다.

- 코스 수준: `초급`
- 코스 내용: `20개 이상 강의`
- 코스 제목: `SwiftUI 초급 튜토리얼`
- 코스 설명
- 버튼: `학습 시작`
- 코스 배경: Swift 아이콘과 남색 배경

우리는 `ContentView` 안에서 이 뷰를 완성할 수 있습니다.

## 상단 영역

먼저, 코스 카드의 상단 영역을 만듭니다.

![view](../../../Resource/026_view1.png)

상단 영역의 왼쪽에는 코스 수준을 표시하고, 오른쪽에는 코스 내용을 표시합니다.

이 두 내용은 가로로 배치되므로 `HStack`을 사용할 수 있습니다.

```swift
var topView: some View {
    HStack {
        Text("초급")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20개 이상 강의")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

여기서는 상단 영역을 하나의 계산 속성으로 분리했습니다.

```swift
var topView: some View
```

이렇게 하면 `body`를 더 명확하게 만들 수 있습니다.

상단 영역에서는 주로 다음 내용을 사용했습니다.

- `HStack`: 두 텍스트를 가로로 배치합니다.
- `Text`: 텍스트 내용을 표시합니다.
- `Spacer()`: 왼쪽 텍스트를 왼쪽으로, 오른쪽 텍스트를 오른쪽으로 밀어냅니다.
- `.font(.footnote)`: 더 작은 텍스트 스타일을 설정합니다.
- `.fontWeight(.bold)`: 텍스트를 굵게 설정합니다.
- `.foregroundStyle(Color.white)`: 전경색을 흰색으로 설정합니다.
- `.padding(.vertical, 10)`: 위아래 안쪽 여백을 설정합니다.
- `.padding(.horizontal, 16)`: 좌우 안쪽 여백을 설정합니다.
- `.background(Color.white.opacity(0.15))`: 반투명한 흰색 배경을 설정합니다.
- `.cornerRadius(20)`: 모서리 둥글기를 설정합니다.

여기서 `초급`에는 두 방향의 `.padding()`을 사용했습니다.

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

이렇게 하면 텍스트의 위아래와 좌우에 공간이 생겨 더 태그처럼 보입니다.

`Color.white.opacity(0.15)`는 불투명도가 `15%`인 흰색, 즉 매우 옅은 흰색을 의미합니다.

### 카드 배경 추가하기

앞에서 `topView`를 만들었지만, 뷰를 만들기만 해서는 자동으로 표시되지 않습니다.

SwiftUI에서 실제로 화면에 표시되는 내용은 `body` 안에 작성해야 합니다.

그래서 먼저 `topView`를 `body` 안에 넣어 표시할 수 있습니다.

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

이제 상단 영역이 표시된 것을 볼 수 있습니다.

![view](../../../Resource/026_view2.png)

하지만 `topView` 안의 텍스트는 흰색이고, 기본 배경도 밝은색이기 때문에 라이트 모드에서는 잘 보이지 않을 수 있습니다.

따라서 바깥쪽에 `VStack`을 추가하고, 전체 영역에 안쪽 여백, 배경색, 모서리 둥글기를 설정할 수 있습니다.

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

표시 효과:

![view](../../../Resource/026_view3.png)

여기서 `VStack`에는 현재 `topView` 하나만 들어 있으므로 꼭 필요하지 않은 것처럼 보일 수 있습니다.

하지만 뒤에서 코스 제목, 코스 설명, 버튼 영역을 계속 추가할 것입니다. 이들은 모두 위아래로 배치되는 내용이므로 여기서 미리 `VStack`을 사용하면 이후에 뷰를 계속 조합하기 편합니다.

여기에는 두 개의 `.padding()`이 있으며, 각각의 역할이 다릅니다.

첫 번째 `.padding(20)`은 `.background()` 앞에 작성되어 있습니다.

```swift
.padding(20)
.background(Color.indigo)
```

이것은 카드 내부의 여백, 즉 내용과 배경 가장자리 사이의 거리를 제어합니다.

두 번째 `.padding(30)`은 `.background()` 뒤에 작성되어 있습니다.

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

이것은 카드 외부의 여백, 즉 전체 카드와 화면 가장자리 사이의 거리를 제어합니다.

![view](../../../Resource/026_view4.png)

따라서 같은 `.padding()`이라도 작성 위치가 다르면 효과도 달라집니다.

## 콘텐츠 영역

이어서 코스 카드의 콘텐츠 영역을 만듭니다.

표시 효과:

![view](../../../Resource/026_view5.png)

콘텐츠 영역에는 코스 제목과 코스 설명이 포함됩니다. 이들은 위아래로 배치되므로 `VStack`을 사용합니다.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI 초급 튜토리얼")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("처음부터 SwiftUI를 시작하고, Apple의 선언형 UI 개발을 체계적으로 배웁니다. 명확한 설명과 실용적인 예제를 통해 레이아웃, 상호작용, 상태 관리를 점진적으로 익히고 아름답고 유용한 앱 인터페이스를 만들 수 있습니다.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

표시 효과:

![view](../../../Resource/026_view6.png)

여기서 `VStack`에는 두 개의 매개변수를 사용했습니다.

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading`은 `VStack` 내부의 뷰들을 왼쪽으로 정렬한다는 뜻입니다.

`spacing: 10`은 `VStack` 내부 뷰들 사이에 `10 pt`의 간격을 유지한다는 뜻입니다.

따라서 코스 제목과 코스 설명은 왼쪽에서 시작해 배치되고, 둘 사이에는 일정한 거리가 유지됩니다.

코스 설명은 비교적 깁니다. 전부 표시하면 카드가 매우 높아질 수 있으므로 여기서는 `.lineLimit()`을 사용해 표시 줄 수를 제한합니다.

```swift
.lineLimit(3)
```

이것은 최대 `3`줄까지만 표시한다는 의미입니다. 내용이 제한 줄 수를 초과하면 초과된 부분은 생략됩니다.

### 뷰 왼쪽 정렬

여기서 한 가지 더 주의할 점이 있습니다.

`VStack(alignment: .leading)`은 `VStack` 내부 뷰의 정렬 방식만 제어합니다. `VStack` 자체가 외부 컨테이너 안에서 어디에 놓이는지는 직접 제어하지 않습니다.

예를 들어, 코스 설명이 비교적 짧다면 다음과 같습니다.

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI 초급 튜토리얼")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("간단한 내용입니다.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

표시 효과:

![view](../../../Resource/026_view7.png)

보면, 코스 제목과 코스 설명은 `VStack` 내부에서 왼쪽 정렬되어 있지만, 전체 `VStack`은 카드의 가장 왼쪽에 붙어 있지 않습니다.

이는 내용이 짧을 때 `VStack`의 너비도 비교적 좁아지기 때문입니다. 바깥 컨테이너가 레이아웃할 때, 이 좁은 `VStack`을 가운데에 놓을 수 있습니다.

이렇게 이해할 수 있습니다. `VStack(alignment: .leading)`은 내부 왼쪽 정렬을 담당합니다.
하지만 전체 콘텐츠 영역을 가장 왼쪽으로 밀어주는 역할은 하지 않습니다.

전체 콘텐츠 영역을 실제로 왼쪽에 붙이고 싶다면, 바깥에 `HStack`을 한 겹 더 감싸고 `Spacer()`를 추가할 수 있습니다.

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI 초급 튜토리얼")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("간단한 내용입니다.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

표시 효과:

![view](../../../Resource/026_view8.png)

여기서 `HStack`은 수평 레이아웃입니다.

`Spacer()`는 오른쪽의 남은 공간을 차지하여 왼쪽의 `VStack`을 가장 왼쪽으로 밀어줍니다.

따라서 `HStack + Spacer()`는 전체 콘텐츠 영역의 위치를 제어하는 데 사용할 수 있습니다.

실제 코스 카드에서는 코스 설명이 비교적 길어 보통 더 많은 너비를 차지하므로 이 문제가 뚜렷하지 않을 수 있습니다. 하지만 이 차이를 이해하는 것은 중요합니다. 이후 짧은 텍스트 레이아웃을 만들 때 자주 비슷한 상황을 만나게 됩니다.

### 내부 뷰 사이의 거리 제어하기

앞에서 `VStack` 안에 `spacing: 10`을 작성했습니다.

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing`은 내부 뷰들 사이의 거리를 제어하는 데 사용됩니다.

`spacing`을 설정하지 않아도 `VStack`에는 기본 간격이 있지만, 기본 간격이 항상 원하는 효과에 맞는 것은 아닙니다.

여기서는 코스 제목과 코스 설명이 너무 가까우면 답답해 보일 수 있으므로 다음을 사용합니다.

```swift
spacing: 10
```

이렇게 하면 둘 사이에 약간의 공간이 유지됩니다.

표시 효과:

![view](../../../Resource/026_view9.png)

마찬가지로, 상단 영역과 콘텐츠 영역도 위아래로 배치되므로 `spacing`을 사용해 둘 사이의 거리를 제어할 수 있습니다.

이제 `topView`와 `contentView`를 `body` 안에 넣습니다.

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

표시 효과:

![view](../../../Resource/026_view10.png)

여기서 `VStack(spacing: 20)`은 `topView`와 `contentView` 사이의 거리를 제어합니다.

즉, 다음 코드는:

```swift
VStack(alignment: .leading, spacing: 10)
```

코스 제목과 코스 설명 사이의 거리를 제어합니다.

```swift
VStack(spacing: 20)
```

상단 영역과 콘텐츠 영역 사이의 거리를 제어합니다.

둘 다 `spacing`이지만, 서로 다른 `VStack`에 적용되므로 영향을 미치는 범위도 다릅니다.

이렇게 콘텐츠 영역의 뷰가 완성되었습니다.

## 버튼 영역

이어서 하단 버튼 영역을 만듭니다.

표시 효과:

![view](../../../Resource/026_view11.png)

버튼 영역은 주로 재생 아이콘 하나와 텍스트 한 줄로 구성됩니다.

`Image`를 사용해 재생 아이콘을 표시하고, `Text`를 사용해 버튼 문구를 표시할 수 있습니다.

먼저 버튼 모양을 만들어 봅니다.

```swift
var buttonView: some View {
    HStack {
        Button {
            print("버튼 클릭")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("학습 시작")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

표시 효과:

![view](../../../Resource/026_view12.png)

여기서는 두 개의 `HStack`을 사용했습니다.

안쪽의 `HStack`은 아이콘과 텍스트를 가로로 배치하는 데 사용됩니다.

```swift
HStack {
    Image(systemName: "play.fill")
    Text("학습 시작")
}
```

바깥쪽의 `HStack`은 `Spacer()`와 함께 이 버튼 모양을 왼쪽에 표시하는 데 사용됩니다.

```swift
HStack {
    ...
    Spacer()
}
```

버튼을 클릭하면 콘솔에 `버튼 클릭`이 출력됩니다.

## 기본 카드 완성

이제 상단 영역, 콘텐츠 영역, 버튼 영역을 조합합니다.

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

표시 효과:

![view](../../../Resource/026_view13.png)

여기까지 하면 기본 코스 카드가 완성됩니다.

## Swift 아이콘 배경

마지막으로 카드에 반투명 Swift 아이콘 배경을 추가합니다.

![view](../../../Resource/026_view.png)

앞에서 `Color.indigo`를 배경색으로 사용했습니다. 실제로 `.background()`는 색상을 추가할 수 있을 뿐 아니라 완전한 뷰도 추가할 수 있습니다.

그래서 먼저 전용 배경 뷰를 만들 수 있습니다.

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

이 배경 뷰에서는 `VStack`, `HStack`, `Spacer()`를 사용해 Swift 아이콘을 오른쪽 아래로 밀어냈습니다.

Swift 아이콘은 장식용 배경이므로 여기서는 반투명한 흰색을 사용했습니다.

```swift
Color.white.opacity(0.15)
```

이렇게 하면 아이콘이 너무 두드러지지 않고, 앞쪽의 텍스트 내용에도 영향을 주지 않습니다.

이어서 `backgroundView`를 카드에 추가합니다.

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

구현 효과:

![view](../../../Resource/026_view14.png)

여기서는 두 개의 `.background()`를 연속으로 사용했습니다.

```swift
.background(backgroundView)
.background(Color.indigo)
```

첫 번째 `.background()`는 Swift 아이콘 배경을 추가하는 데 사용됩니다.
두 번째 `.background()`는 남색 배경을 추가하는 데 사용됩니다.

이렇게 하면 Swift 아이콘은 남색 배경 위에 표시되고, 카드 배경의 일부로 나타납니다.

여기서 알 수 있듯이, `.background()`는 색상을 추가할 수 있을 뿐 아니라 사용자 정의 뷰도 추가할 수 있습니다. 여러 개의 `.background()`를 함께 사용하면 더 풍부한 배경 효과를 구현할 수 있습니다.

여기까지 하면 완성된 코스 카드가 만들어집니다.

## 정리

이번 수업에서는 하나의 코스 카드를 통해 SwiftUI에서 자주 사용하는 기본 레이아웃 방식을 복습했습니다.

`Text`로 텍스트를 표시하고, `Image`로 시스템 아이콘을 표시하며, `VStack`, `HStack`, `Spacer()`로 뷰의 배치를 제어했습니다.

`.lineLimit()`도 배웠습니다. 이 메서드는 텍스트가 최대 몇 줄까지 표시될지 제한할 수 있습니다. 내용이 제한을 초과하면 초과된 부분은 생략됩니다.

동시에 `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` 등 자주 사용하는 수정자도 복습했습니다.

이번 수업을 마친 뒤에는 여러 작은 뷰를 하나의 완성된 카드 모듈로 조합할 수 있게 되었습니다.

이것은 SwiftUI 개발에서 매우 흔한 사고방식입니다. 먼저 작은 뷰로 분리하고, 다시 완성된 화면으로 조합합니다.

## 전체 코드

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("초급")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20개 이상 강의")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI 초급 튜토리얼")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("처음부터 SwiftUI를 시작하고, Apple의 선언형 UI 개발을 체계적으로 배웁니다. 명확한 설명과 실용적인 예제를 통해 레이아웃, 상호작용, 상태 관리를 점진적으로 익히고 아름답고 유용한 앱 인터페이스를 만들 수 있습니다.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("버튼 클릭")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("학습 시작")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
