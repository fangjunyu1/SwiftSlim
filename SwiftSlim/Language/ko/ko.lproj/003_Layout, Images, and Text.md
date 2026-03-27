# 레이아웃, 이미지, 텍스트

지난 수업에서는 ContentView 코드를 배웠습니다:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

이번 수업에서는 SwiftUI의 기본 레이아웃 메커니즘과 이미지 및 텍스트 사용 방법을 배웁니다. 지난 수업의 기초 위에서, view의 구조와 표시 방식에 대한 이해를 더 깊게 하며, 이러한 지식은 기본적인 화면 레이아웃을 만드는 데 도움을 줍니다.

## SwiftUI의 기본 레이아웃 메커니즘

ContentView를 미리보기하면, 아이콘과 텍스트가 위쪽부터 배치되지 않고 중앙에 정렬되어 있는 것을 볼 수 있습니다.

![Swift](../../RESOURCE/003_view.png)

기본적으로 Stack 컨테이너의 정렬 방식은 `.center`이기 때문에, 자식 뷰도 일반적으로 가운데 정렬된 효과로 보입니다.

### Alignment 정렬 방식

물론 가운데 정렬은 여러 정렬 방식 중 하나일 뿐입니다. 만약 왼쪽 정렬이나 오른쪽 정렬을 원한다면 `alignment`를 사용해 뷰의 정렬 방식을 제어해야 합니다.

```swift
alignment
```

SwiftUI에서 정렬은 보통 두 가지 상황에서 등장합니다:

**1. Stack 컨테이너의 정렬 파라미터**

예를 들어, ContentView에서 아이콘과 텍스트를 왼쪽 정렬하려면:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack`의 `alignment`는 가로 방향 정렬을 제어합니다.

정렬 방식:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack`은 가로 정렬이기 때문에, `alignment`는 세로 방향 정렬을 제어합니다:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack`은 겹쳐서 정렬하는 방식이므로, `alignment`를 통해 가로나 세로 방향 위치를 함께 제어할 수 있습니다:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

`alignment`를 명시하지 않으면, `VStack`, `HStack`, `ZStack`은 모두 기본값으로 `.center`를 사용합니다.

**2. frame 내부의 alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame`이 뷰 자체 크기보다 더 큰 공간을 제공할 때, `alignment`는 그 frame 내부에서 뷰가 어디에 위치할지를 결정합니다. `frame`의 자세한 사용법은 나중에 다시 설명하고, 여기서는 간단히 알아두기만 하면 됩니다.

### Spacer와 공간 분배 메커니즘

`alignment`를 사용하면 뷰를 가로나 세로 방향으로 정렬할 수 있습니다. 하지만 텍스트와 이미지를 양쪽 끝에 배치하고 싶다면, 단순한 정렬 방식만으로는 요구를 충족할 수 없습니다.

예를 들어 [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) 웹사이트 상단 화면처럼, 왼쪽에는 NHK 사이트 아이콘이 있고 오른쪽에는 메뉴 아이콘이 있다고 생각해 봅시다.

![Swift](../../RESOURCE/003_alignment3.png)

이때 `alignment`만 사용하면 NHK 아이콘과 메뉴 아이콘이 모두 한쪽에만 몰리게 됩니다. 양쪽 끝으로 나누어 배치할 수 없기 때문에, 남는 공간을 분배하는 `Spacer`가 필요합니다.

`Spacer`는 레이아웃을 위한 탄성 뷰로, 남는 공간을 자동으로 채워 줍니다.

사용 방법:

```swift
Spacer()
```

예:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

`Image`와 `Text` 사이에 `Spacer`를 추가하면, `Spacer`가 남는 공간을 차지하면서 `Image`와 `Text`를 각각 위와 아래 끝으로 밀어냅니다.

![Swift](../../RESOURCE/003_view1.png)

`Spacer`가 여러 개 있으면:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

남는 공간은 `Spacer`들 사이에 균등하게 분배됩니다.

![Swift](../../RESOURCE/003_spacer.png)

## Image의 표시와 크기 제어

`Image` 뷰는 주로 이미지를 표시하는 데 사용됩니다. 지난 수업에서 배운 SF Symbols 아이콘도 `Image`의 한 가지 사용법이었습니다.

사용 방법:

```swift
Image("imageName")
```

큰따옴표 안에는 이미지 이름을 넣으며, 파일 확장자는 쓰지 않습니다.

### 이미지 표시

먼저, 이미지 한 장을 준비합니다.

![Swift](../../RESOURCE/003_img.jpg)

Xcode에서 Assets 리소스 폴더를 선택하고, 이미지를 Assets 안으로 드래그합니다.

![Swift](../../RESOURCE/003_img1.png)

이제 ContentView에서 `Image`를 사용해 이미지를 표시합니다:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

주의: SwiftUI의 `Image`는 GIF 애니메이션을 재생할 수 없습니다(정적인 프레임만 표시됩니다).

### 이미지 크기 제어

SwiftUI에서 `Image`는 기본적으로 원본 크기로 표시됩니다. 표시 크기를 조절하고 싶다면, 먼저 `resizable`을 사용해 이미지가 크기 조절에 참여할 수 있게 만들고, 그다음 `frame`으로 레이아웃 크기를 지정해야 합니다.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier

`resizable` modifier는 이미지가 원래 크기에 고정되지 않고, 레이아웃 안에서 크기 조절이 가능하도록 합니다.

```swift
.resizable()
```

`resizable()`을 추가해야만 `frame`이 실제로 이미지 표시 크기를 바꿀 수 있습니다.

만약 `resizable`을 생략하면:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame`은 단지 레이아웃 공간만 제공할 뿐이고, 이미지 자체 크기는 변하지 않습니다.

### frame modifier

`frame(width:height)`는 뷰의 너비와 높이를 지정하는 데 사용됩니다.

기본 사용법:

```swift
.frame(width: 10,height: 10)
```

예를 들어, 이미지를 너비 300, 높이 100의 직사각형으로 표시한다면:


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

너비나 높이만 따로 설정할 수도 있습니다:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` 조합을 사용하면, 화면에서 이미지의 표시 크기를 유연하게 제어하면서 크기 조절 능력을 유지할 수 있습니다.

### 비율 조정: scaledToFit와 scaledToFill

`frame`으로 지정한 너비와 높이의 비율이 원본 이미지와 다르면, 이미지가 늘어나거나 찌그러질 수 있습니다.

이미지 비율을 유지하면서 주어진 공간에 맞추고 싶다면, `scaledToFit` 또는 `scaledToFill`을 사용할 수 있습니다.

**scaledToFit**

`scaledToFit`은 이미지의 원래 가로세로 비율을 유지한 상태로, 주어진 공간 안에 완전히 들어가도록 축소·확대합니다. 이미지는 잘리지 않습니다:

```swift
.scaledToFit()
```

또는

```swift
.aspectRatio(contentMode: .fit)
```

이 방식은 이미지 전체를 완전히 보여 주어야 하고, 형태가 찌그러지면 안 되는 장면에 적합합니다.

모든 이미지를 같은 너비와 높이로 강제로 맞추면, 이미지가 늘어나는 상황이 생기기 쉽습니다.

예를 들어:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

비율 조정을 설정하지 않으면, 이미지는 원래 비율을 유지하지 못합니다.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit`을 설정하면 이미지가 원래 비율을 유지할 수 있습니다.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill`도 이미지 비율을 유지하지만, 주어진 공간을 꽉 채웁니다. 비율이 맞지 않으면 넘치는 부분은 잘립니다:

```swift
.scaledToFill()
```

또는

```swift
.aspectRatio(contentMode: .fill)
```

이 방식은 배경 이미지나 배너처럼, 이미지가 전체 영역을 꽉 덮어야 하는 장면에 적합합니다. 특히 배경으로 사용할 때 자주 쓰입니다.

**두 방식의 차이**

![Swift](../../RESOURCE/003_img6.png)

## 텍스트

SwiftUI에서 `Text`는 글자를 표시하는 데 사용됩니다.

기본 사용법:

```swift
Text("FangJunyu")
```

지난 수업에서도 `Text`를 배웠지만, 이번에는 글자 크기와 굵기를 제어해 텍스트를 더 잘 표현하는 방법을 배웁니다.

### 글자 크기

`font` modifier를 사용하면 글자 크기를 조절할 수 있습니다:

```swift
.font(.title)
```

예:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

자주 쓰는 글자 크기(큰 것부터 작은 것 순):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### 글자 굵기

텍스트를 굵게 보이게 하고 싶다면 `fontWeight` modifier를 사용할 수 있습니다:

```swift
.fontWeight(.bold)
```

예:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

자주 쓰는 글자 굵기(얇은 것부터 굵은 것 순):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font`는 글자 크기를, `fontWeight`는 글자 굵기를 제어합니다. 둘을 조합하면 텍스트를 더 풍부하게 표현할 수 있습니다.

## 정리와 실습

지금까지 우리는 SwiftUI의 기본 레이아웃, `Spacer`, `Image`, `Text` 등 기초 지식을 배웠고, 이 정도면 이미 간단한 view를 만드는 데 충분합니다.

예를 들어: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google 화면은 매우 깔끔하며, 이미지와 텍스트가 포함되어 있습니다. 우리는 SwiftUI 관점에서 Google의 화면 구조를 이렇게 분석해 볼 수 있습니다:

1. 전체는 Google 로고, 검색창, 안내 텍스트의 세 부분으로 나뉘며, `VStack`으로 세로 정렬할 수 있습니다
2. Google 로고는 이미지이므로 `Image`로 표시할 수 있습니다
3. 검색창에는 입력창과 아이콘이 있지만, 입력창을 잠시 무시하면 검색 아이콘은 `Image`로 표시할 수 있습니다
4. 안내 문구는 `Text`로 표시하고, 텍스트의 가로 배치는 `HStack`, 글자 색상은 `foregroundStyle`로 제어할 수 있습니다

이런 지식을 직접 연습해 보면, 간단한 view를 만들 수 있을 뿐 아니라 `Image`, `Text` 뷰와 그 modifier에 대한 이해와 활용도 더욱 깊어집니다。
