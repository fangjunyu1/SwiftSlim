# 동물 백과 

이번 수업에서는 사용자 정의 뷰와 데이터 전달을 계속 연습합니다.

우리는 간단한 동물 백과 뷰를 만들 것입니다. 화면에는 다섯 마리의 동물이 표시되고, 어떤 동물을 클릭하면 상세 뷰가 나타나 이 동물의 이미지, 분포 지역, 서식지와 설명을 보여 줍니다.

구현 결과:

![view](../../../Resource/029_view.png)

이 예제를 통해 데이터 구조, 목록 표시, 클릭 상호작용, Sheet 팝업 뷰가 함께 동작하는 방식을 연습할 수 있습니다.

## 이미지 자료 준비

먼저 동물 이미지 다섯 장을 준비해야 합니다.

- 돌고래: `dolphin.jpg`
- 기린: `giraffe.jpg`
- 사자: `lion.jpg`
- 판다: `panda.jpg`
- 북극곰: `polarBear.jpg`

아래 이미지 자료를 사용할 수 있습니다.

[돌고래](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[기린](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[사자](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[판다](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[북극곰](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

이미지를 다운로드한 뒤 Xcode 프로젝트의 `Assets` 리소스 폴더로 드래그합니다.

![assets](../../../Resource/029_assets.png)

주의할 점은 코드에서 이미지를 사용할 때 보통 `.jpg` 확장자를 쓰지 않아도 된다는 것입니다.

예를 들어 이미지 리소스 이름이 `dolphin`이라면 코드에는 이렇게 작성합니다.

```swift
Image("dolphin")
```

이미지 이름을 잘못 쓰면 이미지가 정상적으로 표시되지 않습니다.

참고: 위 이미지 자료는 위키미디어 프로젝트에서 가져온 것이며, 사용할 때는 원본 링크와 출처 정보를 보존하는 것을 권장합니다.

## 동물 구조체 만들기

이 화면에서 각 동물은 여러 정보를 가지고 있습니다.

- 동물 이름
- 동물 이미지
- 동물 이모지
- 분포 지역
- 서식지
- 동물 설명

이 정보를 여러 변수로 흩어 놓으면 코드가 비교적 복잡해집니다. 따라서 `Animal` 구조체를 만들어 한 동물의 정보를 함께 묶을 수 있습니다.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

이 코드에서:

- `id`: 동물의 고유 식별자입니다.
- `name`: 동물 이름입니다.
- `imageName`: 동물 이미지 이름입니다.
- `avatarEmoji`: 동물 이모지입니다.
- `distributionArea`: 분포 지역입니다.
- `habitat`: 서식지입니다.
- `animalDescription`: 동물 설명입니다.

그중:

```swift
let id = UUID()
```

`id`는 각 동물을 식별하는 데 사용됩니다. 뒤에서 `ForEach`를 사용해 동물 목록을 표시하고, `.sheet(item:)`을 사용해 선택된 동물에 따라 상세 화면을 띄울 것이므로 `Animal`이 `Identifiable` 프로토콜을 따르도록 해야 합니다.

`Identifiable`의 역할은 SwiftUI에게 각 동물마다 구분할 수 있는 `id`가 있다고 알려 주는 것입니다.

## 동물 데이터 만들기

이어서 `ContentView` 안에 동물 배열을 만듭니다.

배열에는 다섯 개의 `Animal`이 저장되며, 각각의 `Animal`은 한 마리의 동물을 나타냅니다.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // 돌고래
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // 기린
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // 사자
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // 판다
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // 북극곰
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]

    var body: some View {
        Text("동물 백과")
    }
}
```

여기서 `animals`는 배열입니다.

```swift
let animals: [Animal]
```

`[Animal]`은 이 배열 안에 여러 개의 `Animal`이 저장된다는 뜻입니다.

즉, `animals`는 한 마리의 동물이 아니라 한 묶음의 동물입니다.

## 동물 목록 표시하기

이제 `ForEach`를 사용해 동물 목록을 표시할 수 있습니다.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

표시 결과:

![view](../../../Resource/029_view1.png)

이 코드에서:

```swift
ForEach(animals) { animal in
    ...
}
```

`animals` 배열을 순회한다는 뜻입니다.

각 반복에서 `animal`은 현재 표시하고 있는 그 동물을 의미합니다.

예를 들어 첫 번째 반복에서는 `animal`이 돌고래이고, 두 번째 반복에서는 `animal`이 기린입니다.

따라서 아래 방식으로 현재 동물의 정보를 표시할 수 있습니다.

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

이렇게 하면 다섯 마리 동물을 표시할 수 있습니다.

## 동물 목록을 클릭할 수 있게 만들기

이제 목록은 표시되지만 아직 클릭할 수 없습니다.

어떤 동물을 클릭한 뒤 상세 화면을 띄우려면 먼저 “현재 선택된 동물”을 기록해야 합니다.

따라서 `ContentView`에 상태 변수를 하나 추가합니다.

```swift
@State private var selectedAnimal: Animal? = nil
```

여기서 `selectedAnimal`은 `Animal?`이라는 옵셔널 값 타입입니다.

동물 한 마리가 있을 수도 있고, 아무 동물도 없을 수도 있다는 뜻입니다.

기본값은 `nil`이며, 처음에는 어떤 동물도 선택되지 않았다는 뜻입니다.

그다음 각 동물 행을 `Button`으로 바꿉니다.

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

핵심은 이 코드 한 줄입니다.

```swift
selectedAnimal = animal
```

사용자가 어떤 동물을 클릭하면 그 동물을 `selectedAnimal`에 저장합니다.

예를 들어 사용자가 돌고래를 클릭하면 `selectedAnimal`에는 돌고래가 저장됩니다.

사용자가 판다를 클릭하면 `selectedAnimal`에는 판다가 저장됩니다.

즉, `selectedAnimal`은 사용자가 현재 클릭한 동물이 무엇인지 기록하는 데 사용됩니다.

## Sheet 팝업 뷰

이제 버튼을 통해 “현재 클릭한 동물”을 기록할 수 있습니다.

다음으로 동물 상세 정보를 표시할 팝업 뷰를 구현해야 합니다.

![view](../../../Resource/029_view2.png)

SwiftUI에서는 `Sheet`를 사용해 이런 팝업 효과를 구현할 수 있습니다.

`Sheet`는 임시로 나타나는 페이지라고 이해할 수 있습니다. 현재 화면 위에 표시되며, 사용자는 내용을 확인한 뒤 아래로 스와이프해서 닫을 수 있습니다.

## Sheet 예제

실제로 동물 상세 정보를 표시하기 전에, 먼저 간단한 예제로 `Sheet`가 어떻게 나타나는지 이해해 보겠습니다.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet 표시")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet 뷰")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

표시 결과:

![view](../../../Resource/029_view3.png)

이 코드에서는 불리언 값을 하나 만들었습니다.

```swift
@State private var showSheet = false
```

`showSheet`의 기본값은 `false`이며, 처음에는 `Sheet`를 표시하지 않는다는 뜻입니다.

버튼을 클릭하면:

```swift
showSheet.toggle()
```

`toggle()`은 불리언 값을 전환한다는 뜻입니다.

원래 값이 `false`라면 `toggle()`을 호출한 뒤 `true`가 됩니다.

원래 값이 `true`라면 `toggle()`을 호출한 뒤 `false`가 됩니다.

따라서 버튼을 클릭하면 `showSheet`가 `false`에서 `true`로 바뀝니다.

`showSheet`가 `true`가 되면 아래 코드가 `Sheet`를 띄웁니다.

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet 뷰")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

이 코드는 `showSheet`가 `true`일 때 `Sheet`를 띄우고, `Sheet` 안에 `Text("Sheet 뷰")`를 표시한다는 뜻입니다.

표시 결과:

![view](../../../Resource/029_view4.png)

이 방식은 고정된 내용을 띄우기에 적합합니다.

예를 들어 버튼을 클릭한 뒤 설정 화면, 설명 화면, 안내 화면 등을 띄우는 경우입니다.

### Sheet 표시 위치

`Sheet`는 팝업 뷰이지만 SwiftUI에서는 `Text()`나 `Image()`처럼 독립된 뷰로 직접 작성하는 것이 아니라, 뷰 수정자로 사용합니다.

즉, `.sheet(...)`는 `.font()`, `.padding()`, `.shadow()` 같은 수정자와 비슷하며, 어떤 뷰 뒤에 추가해야 합니다.

예를 들어:

```swift
Button("Sheet 표시") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 뷰")
}
```

이 예제에서는 `.sheet`가 `Button` 뒤에 추가되었습니다.

`showSheet`가 `true`가 되면 SwiftUI가 `Sheet`를 띄우고, 중괄호 안의 내용을 표시합니다.

```swift
Text("Sheet 뷰")
```

하지만 실제 개발에서 한 화면에 버튼이 여러 개 있다면, 보통 각 버튼마다 `.sheet`를 붙이지 않습니다.

더 흔한 방식은 `.sheet`를 바깥쪽 뷰 뒤에 추가하는 것입니다.

예를 들어:

```swift
VStack {
    Button("Sheet 표시") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 뷰")
}
```

버튼은 `showSheet`를 수정하고, 바깥쪽 뷰는 `showSheet`가 `true`인지에 따라 `Sheet`를 띄우는 역할을 합니다.

## 옵셔널 값으로 Sheet 바인딩하기

앞에서 배운 작성 방식은 다음과 같습니다.

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet 뷰")
}
```

이 방식은 고정된 화면의 표시와 숨김을 제어하는 데 적합합니다.

하지만 동물 백과 예제에서는 “`Sheet`를 띄울지 여부”만 알아서는 부족하고, “어떤 동물을 클릭했는지”도 알아야 합니다.

예를 들어:

사용자가 돌고래를 클릭하면 `Sheet` 안에는 돌고래 상세 정보가 표시되어야 합니다.

사용자가 판다를 클릭하면 `Sheet` 안에는 판다 상세 정보가 표시되어야 합니다.

따라서 여기에는 또 다른 Sheet 작성 방식이 더 적합합니다.

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet 안에 표시되는 내용
}
```

이 코드에서 `Sheet`는 옵셔널 값 `selectedAnimal`에 바인딩됩니다.

여기서 주의할 점은 `item:` 뒤에는 `selectedAnimal`이 아니라 `$selectedAnimal`을 작성한다는 것입니다.

`Sheet`는 `selectedAnimal`의 값을 읽기만 하는 것이 아니라, 그 값의 변화에 따라 팝업 여부를 결정해야 하기 때문입니다.

이 코드는 이렇게 이해할 수 있습니다.

- `selectedAnimal`이 `nil`이면 `Sheet`를 표시하지 않습니다.
- `selectedAnimal`에 값이 있으면 `Sheet`를 표시합니다.
- `Sheet`가 닫히면 SwiftUI가 `selectedAnimal`을 다시 `nil`로 바꿉니다.

SwiftUI는 `selectedAnimal` 안에 저장된 동물을 중괄호 안의 `animal`로 전달합니다.

즉, `.sheet(item:)`은 팝업을 제어할 뿐만 아니라 선택된 데이터를 `Sheet` 안으로 전달합니다.

## Sheet로 동물 이름 표시하기

이제 복잡한 상세 뷰를 바로 만들기보다는 먼저 간단하게 시작하겠습니다.

코드를 더 쉽게 이해하기 위해 먼저 `Sheet` 안에 현재 동물 이름을 표시합니다.

`VStack` 바깥쪽에 `.sheet(item:)`을 추가합니다.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

여기서 가장 중요한 것은 이 코드입니다.

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal`에 값이 있으면 `Sheet`가 나타납니다.

중괄호 안의 `animal`이 바로 현재 선택된 동물입니다.

따라서:

```swift
Text(animal.name)
```

현재 클릭한 동물의 이름이 표시됩니다.

예를 들어 `Dolphin`을 클릭하면 Sheet 안에 `Dolphin`이 표시됩니다.

`Panda`를 클릭하면 `Sheet` 안에 `Panda`가 표시됩니다.

이렇게 해서 서로 다른 동물을 클릭하면 서로 다른 동물 이름이 나타나는 효과를 구현했습니다.

동물 이름 표시:

![view](../../../Resource/029_view5.png)

하지만 동물 상세 정보는 이름 하나만 표시해서는 안 되고, 이름, 분포 지역, 서식지와 설명을 함께 표시해야 합니다.

이 코드를 모두 `.sheet` 안에 작성하면 코드가 길어져 읽기 불편해집니다.

그래서 다음에는 동물 상세 정보를 표시하는 역할만 담당하는 새로운 사용자 정의 뷰를 만들겠습니다.

## 동물 상세 뷰 만들기

이어서 새로운 사용자 정의 뷰 `AnimalDetailView`를 만듭니다.

이 뷰는 `Animal` 하나를 받아 동물 상세 정보를 표시합니다.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**분포 지역** ：\(animal.distributionArea)")

                    Divider()

                    Text("**서식지** ：\(animal.habitat)")

                    Divider()

                    Text("**동물 설명** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

표시 결과:

![view](../../../Resource/029_view2.png)

여기서 핵심은 다음입니다.

```swift
var animal: Animal
```

이는 `AnimalDetailView`가 외부에서 동물 하나를 받아야 한다는 뜻입니다.

동물을 받은 뒤 상세 뷰는 이 동물의 여러 정보를 사용할 수 있습니다.

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

즉, `AnimalDetailView`는 전달받은 동물을 표시하는 일만 담당합니다.

### Markdown 굵은 글자

상세 뷰에서는 이런 코드를 작성했습니다.

```swift
Text("**서식지:** \(animal.habitat)")
```

여기에는 두 가지 지식 포인트가 있습니다.

첫째, `**서식지:**`는 `Markdown` 문법을 사용합니다. 별표 두 개로 감싼 문자는 굵게 표시됩니다.

둘째, `\()`는 문자열 보간이며, 변수의 값을 문자열 안에 표시할 수 있습니다.

이 코드는 먼저 굵게 표시된 `서식지:`를 보여 주고, 이어서 이 동물의 서식지를 보여 준다는 뜻입니다.

## Sheet 안에 상세 뷰 표시하기

`AnimalDetailView`를 만든 뒤에는 `ContentView`로 돌아와 `Sheet` 안의 기존 이름 뷰를 상세 뷰로 바꿀 수 있습니다.

원래는 다음과 같았습니다.

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

이제 다음처럼 바꿉니다.

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

여기서 `animal:`은 `AnimalDetailView`의 매개변수 이름입니다.

뒤쪽의 `animal`은 `.sheet(item:)`에서 전달된 현재 동물입니다.

즉, 현재 클릭한 동물을 `AnimalDetailView`로 전달해 표시하는 것입니다.

전체 구조:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

사용자가 동물을 클릭하면:

```swift
selectedAnimal = animal
```

`selectedAnimal`이 `nil`에서 구체적인 동물로 바뀌고, `Sheet`는 `selectedAnimal`에 값이 있음을 감지한 뒤 뷰를 띄웁니다.

`Sheet`는 `selectedAnimal` 안의 동물을 `AnimalDetailView` 뷰로 전달하고, `AnimalDetailView`는 동물 상세 정보를 표시합니다.

이렇게 해서 동물 목록을 클릭하면 해당 동물의 상세 정보가 나타나는 기능을 구현했습니다.

## Sheet 두 가지 작성 방식의 차이

이제 우리는 `.sheet(item:)`을 사용해 동물 상세 뷰 표시를 완성했습니다.

여기서는 `Sheet`의 두 가지 일반적인 작성 방식을 간단히 정리할 수 있습니다.

### 첫 번째는 불리언 값 바인딩입니다

```swift
@State private var showSheet = false

Button("Sheet 표시") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 뷰")
}
```

이 방식은 설정 화면, 설명 화면, 안내 화면처럼 고정된 내용을 띄우기에 적합합니다.

`showSheet`는 불리언 값이며 `true`와 `false` 두 가지 상태만 있습니다.

`showSheet`가 `true`이면 `Sheet`가 표시됩니다.

`showSheet`가 `false`이면 `Sheet`가 표시되지 않습니다.

### 두 번째는 옵셔널 값 바인딩입니다

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

이 방식은 선택된 데이터에 따라 서로 다른 내용을 띄우기에 적합합니다.

이번 수업에서는 서로 다른 동물을 클릭하면 서로 다른 동물 상세 정보를 표시해야 하므로 `.sheet(item:)`을 사용하는 것이 더 적합합니다.

## 전체 코드

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // 동물 이름
    let name: String
    
    // 동물 이미지
    let imageName: String
    
    // 동물 태그 기호
    let avatarEmoji: String
    
    // 분포 지역
    let distributionArea: String
    
    // 서식지
    let habitat: String
    
    // 동물 설명
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // 돌고래
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // 기린
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // 사자
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // 판다
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // 북극곰
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**분포 지역** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**서식지** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**동물 설명** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## 정리

이번 수업에서는 간단한 동물 백과 화면을 완성했습니다.

먼저 `Animal` 구조체로 동물 정보를 저장하고, 다시 배열로 다섯 마리 동물을 저장한 뒤 `ForEach`를 사용해 동물 목록을 표시했습니다.

사용자가 어떤 동물을 클릭하면 그 동물을 `selectedAnimal`에 저장합니다.

```swift
selectedAnimal = animal
```

`selectedAnimal`에 값이 있으면 `.sheet(item:)`이 상세 뷰를 띄우고, 선택된 동물을 `AnimalDetailView`에 전달합니다.

이번 수업에서 가장 중요한 것은 화면 스타일이 아니라 이 데이터 전달 경로를 이해하는 것입니다.

```swift
동물 클릭 → selectedAnimal에 동물 저장 → Sheet 팝업 → AnimalDetailView가 상세 정보 표시
```

이 경로를 이해하면 앞으로 상품 상세, 강의 상세, 글 상세, 연락처 상세 등 더 많은 비슷한 기능을 만들 수 있습니다.
