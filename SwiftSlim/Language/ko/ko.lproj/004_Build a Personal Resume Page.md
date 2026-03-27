# 개인 이력서 페이지 만들기

이번 수업에서는 간단한 개인 이력서 뷰를 만들며, 다음 내용을 배웁니다:

- cornerRadius
- spacing
- ScrollView

구성 과정에서 레이아웃, Text, Image 등의 지식을 복습하고, 간격 제어와 내용 스크롤 효과도 함께 구현합니다.

## 개인 이력서

목표 화면:

![Swift](../../RESOURCE/004_img.png)

**먼저 스스로 한 번 만들어 본 뒤, 아래 설명을 계속 읽어 보세요.**

### 프로젝트 생성

새로운 iOS 프로젝트를 만들거나, 이전 프로젝트를 계속 사용해도 됩니다.

기본 ContentView 코드는 다음과 같습니다:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

이제 코드를 비우고, 직접 내용을 작성해 봅시다:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### 전체 구조

실제 개발에서는 보통 먼저 전체 구조를 설계합니다.

우리 페이지에는 다음이 포함됩니다:

1. 제목
2. 개인 정보
3. 자기소개

가장 바깥쪽에 `VStack`을 추가합니다:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack`은 뷰를 세로로 정렬해 주며, 뷰의 배치와 간격도 제어할 수 있습니다.

### 제목

먼저 제목을 표시하는 `Text`를 만듭니다.

여기서는 제 영어 이름을 제목으로 표시하겠습니다:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

제목은 보통 더 크고 굵게 표시하므로, `font`와 `fontWeight` modifier를 사용합니다:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### 배치

SwiftUI의 기본 정렬 방식은 `center`이므로, 지금은 제목이 ContentView의 가운데에 표시됩니다.

![Swift](../../RESOURCE/004_img3.png)

제목을 화면 상단에 배치하려면, `Spacer`를 사용해 레이아웃을 조정할 수 있습니다:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer`는 남는 공간을 차지하면서 `Text`를 컨테이너의 위쪽으로 밀어 올립니다.

![Swift](../../RESOURCE/004_img4.png)

### 여백

텍스트가 화면 상단에 너무 가까워 보인다면, `padding`이나 `Spacer`를 사용할 수 있습니다.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

`VStack`의 위쪽 여백을 20으로 설정합니다.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer`에 `frame` 높이를 주어, 원하는 높이만큼의 빈 공간을 만들 수도 있습니다.

구현 결과:

![Swift](../../RESOURCE/004_img5.png)

### 이미지

자신의 프로필 사진을 준비해 Assets 리소스 폴더에 넣습니다.

![Swift](../../RESOURCE/004_img6.png)

그리고 ContentView에서 `Image`로 사진을 표시합니다:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

이미지 원본 크기가 비교적 크기 때문에, `frame`으로 표시 크기를 제어해야 합니다.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

이때 한 가지 문제가 생깁니다:

`frame`의 가로세로 비율이 원본 이미지와 다르면, 이미지가 찌그러집니다.

예:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

이미지가 변형되지 않게 하려면 `scaledToFit`을 사용해야 합니다:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit`의 역할은:

주어진 `frame` 범위 안에서 이미지의 원래 비율을 유지한 채 크기를 조절하고, 이미지 내용을 온전히 보여 주는 것입니다.

즉, 이미지를 억지로 `frame` 전체에 늘려 맞추지 않고, 비율을 유지하면서 축소 또는 확대해 한쪽 변이 경계에 딱 맞을 때까지 조정합니다.

이 의미는 다음과 같습니다:

- `frame`의 너비가 더 작으면, 너비를 기준으로 축소됩니다
- `frame`의 높이가 더 작으면, 높이를 기준으로 축소됩니다
- 이미지는 항상 원래 비율을 유지하며 찌그러지지 않습니다

보통은 한 방향의 크기만 설정해도 됩니다. 예:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

이렇게 하면 시스템이 너비 140을 기준으로 적절한 높이를 자동 계산하며, 비율도 유지합니다.

시각적 비율을 고정하거나, 복잡한 레이아웃에서 압축되는 것을 피하고 싶다면 너비와 높이를 함께 제한해도 됩니다.

### 둥근 모서리

이미지를 둥근 모서리 형태로 표시하고 싶다면 `cornerRadius` modifier를 사용할 수 있습니다:

```swift
.cornerRadius(10)
```

예:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image의 modifier 뒤에 `cornerRadius(20)`을 추가합니다.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)`은 뷰의 경계를 잘라내고, 반지름 20의 둥근 모서리를 적용한다는 뜻입니다.

둥근 모서리를 적용하면 이미지의 네 모서리가 부드러운 곡선으로 바뀌어, 시각적으로 더 부드럽고 현대적인 느낌을 줍니다.

이러한 디자인 스타일은 현재 UI 디자인에서 매우 흔하며, 예를 들어 iOS 앱 아이콘도 둥근 사각형 형태를 사용합니다(다만 시스템 아이콘은 단순한 모서리 반경이 아니라 연속 곡률의 슈퍼타원 형태를 사용합니다).

### 개인 정보

이제 이미지 왼쪽의 개인 정보 영역을 만들어 봅시다. 화면 구조를 보면, 개인 정보와 이미지는 가로로 배치되어 있으므로 `HStack`을 사용해야 합니다.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

개인 정보 내용 자체는 세로로 배치됩니다.

![Swift](../../RESOURCE/004_img11.png)

따라서 바깥쪽은 `HStack`, 개인 정보 부분은 `VStack`, 텍스트 내용은 `Text`를 사용합니다.

기본 구조:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**필드 제목 굵게 표시하기**

필드 이름과 필드 값을 구분하기 위해, 필드 이름에는 `fontWeight`를 적용할 수 있습니다:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**텍스트 왼쪽 정렬**

`VStack`은 기본적으로 가운데 정렬입니다. 모든 텍스트를 왼쪽 정렬하고 싶다면 정렬 방식을 설정해야 합니다:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading`은 왼쪽에서 오른쪽으로 읽는 언어 환경에서 왼쪽 정렬을 의미합니다.

![Swift](../../RESOURCE/004_img14.png)

### 간격

개인 정보와 이미지 사이에 일정한 간격을 두고 싶다면, 앞에서 배운 것처럼 `Spacer`로 여백을 만들 수도 있습니다:

```swift
Spacer()
    .frame(width: 10)
```

또는 `HStack`의 `spacing` 파라미터를 사용할 수도 있습니다:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30`은 두 자식 뷰 사이의 간격이 30 pt라는 뜻입니다.

![Swift](../../RESOURCE/004_img15.png)

**spacing이란 무엇인가요?**

`VStack`, `HStack`, `ZStack`에서 `spacing`은 자식 뷰들 사이의 거리를 제어합니다.

예:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

이 경우 `VStack` 안의 자식 뷰 간 간격이 10pt가 됩니다.

![Swift](../../RESOURCE/004_img16.png)

주의할 점은, `spacing`은 "직접 자식 뷰"에만 적용되고, 중첩된 컨테이너 내부 레이아웃에는 영향을 주지 않는다는 것입니다.

**목록 내부 간격 제어**

필드들 사이에 간격을 늘리고 싶다면, 가장 직접적인 방법은 `VStack`에 `spacing`을 설정하는 것입니다:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

이렇게 하면 모든 자식 뷰 사이의 간격이 10 pt로 바뀝니다.

하지만 화면을 보면 한 가지 문제가 있습니다:

필드 그룹 사이에도 간격이 생기고, 필드 이름과 값 사이에도 똑같은 간격이 생깁니다.

이는 `spacing`이 현재 컨테이너의 모든 직접 자식 뷰에 적용되기 때문입니다.

이 구조에서는 각각의 `Text`가 모두 바깥 `VStack`의 직접 자식이기 때문에, 간격이 동일하게 적용됩니다.

필드 그룹 사이에는 간격을 두고, 필드 이름과 값 사이에는 기본적인 촘촘한 간격을 유지하고 싶다면, "필드 이름 + 필드 값"을 하나의 논리적 그룹으로 보고 바깥을 `VStack`으로 감싸면 됩니다:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

이렇게 하면 바깥 `VStack` 사이에만 간격이 생기고, 안쪽 `VStack` 안에서는 기본적으로 더 촘촘한 간격을 유지하게 됩니다. 따라서 필드 이름과 값 사이에는 불필요한 여백이 생기지 않습니다.

![Swift](../../RESOURCE/004_img18.png)

### 자기소개

이제 자기소개 영역을 만들어 봅시다.

화면 구조상 소개 내용은 여러 줄 텍스트로 이루어져 있으며, 세로 방향으로 배치됩니다.

![Swift](../../RESOURCE/004_img19.png)

따라서 `VStack`과 `Text`를 사용할 수 있습니다:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**간격 늘리기**

이제 개인 정보와 자기소개 부분이 조금 답답해 보이고, 스타일도 그다지 예쁘지 않습니다.

![Swift](../../RESOURCE/004_img20.png)

이 둘은 같은 바깥 컨테이너 안에 있으므로, 바깥 컨테이너에서 전체 간격을 조절할 수 있습니다:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

구현 결과:

![Swift](../../RESOURCE/004_img21.png)

**목록 간격**

`spacing`을 사용해 자기소개 텍스트 사이 간격을 조정할 수 있습니다:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### 개인 이력서 완성

이제 개인 이력서의 기본 틀이 완성되었습니다.

![Swift](../../RESOURCE/004_img.png)

### 스크롤 뷰

현재 페이지 구조는 `VStack`을 사용하고 있으므로, 소개 문장이 적을 때는 문제가 없습니다. 하지만 20개, 30개 또는 그 이상으로 늘어나면, 내용 높이가 화면을 초과하게 됩니다.

예:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

이때 두 가지 현상이 나타납니다:

- 아래쪽 내용이 잘립니다
- 페이지를 스크롤할 수 없습니다

이것은 `VStack`의 문제가 아닙니다. `VStack`은 단지 레이아웃 컨테이너일 뿐이며, 자동으로 스크롤 기능을 제공하지 않습니다.

**ScrollView란 무엇인가요**

`ScrollView`는 스크롤 가능한 컨테이너로, 화면 크기를 초과하는 많은 양의 내용에 적합합니다. 예를 들어 세로 목록이나 가로 목록에 사용할 수 있습니다.

기본 구조:

```swift
ScrollView {
    ...
}
```

스크롤 효과를 구현하려면, 페이지 전체 내용을 `ScrollView`로 감싸야 합니다:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

이렇게 하면 페이지 전체가 하나의 스크롤 가능한 영역이 되어, 내용이 화면 높이를 초과할 때 자연스럽게 스크롤할 수 있습니다.

`ScrollView`는 기본적으로 스크롤바 표시기를 보여 줍니다. 표시기를 숨기고 싶다면 다음과 같이 설정할 수 있습니다:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## 전체 코드

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
