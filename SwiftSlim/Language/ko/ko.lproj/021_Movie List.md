# 영화 목록

이 수업에서는 영화 목록을 만들어 보겠습니다.

![movie](../../Resource/021_movie.png)

목록에는 각 영화의 포스터, 이름, 감독, 평점이 표시됩니다.

이 예제에서는 매우 중요한 개념인 `struct` 구조체를 배웁니다. 이것은 한 영화의 여러 정보를 하나의 전체로 묶는 데 도움을 줍니다. 이 밖에도 `UUID()`, `ForEach`, 구분선 `Divider`, 그리고 사용자 정의 객체를 사용해 데이터를 관리하는 방법도 함께 접하게 됩니다.

이러한 지식은 이후 SwiftUI 개발에서 매우 자주 등장합니다. 이 수업을 마친 뒤에는 영화 목록을 만들 수 있을 뿐만 아니라, “데이터 한 묶음을 어떻게 화면으로 보여 주는지”도 이해하기 시작하게 됩니다.

## 단일 영화

먼저 하나의 영화 화면부터 만들어 볼 수 있습니다.

![movie](../../Resource/021_movie1.png)

이 화면의 레이아웃은 주로 두 부분으로 구성됩니다. 왼쪽은 영화 포스터이고, 오른쪽은 영화 소개입니다.

### 영화 포스터

왼쪽에는 영화 포스터가 표시되며, 이미지를 표시하기 위해 `Image`를 사용할 수 있습니다.

예를 들면:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

이 코드는 `"The Shawshank Redemption"`라는 이름의 이미지를 표시한다는 뜻입니다.

여기서 주의해야 할 점은, 이미지 이름이 반드시 `Assets` 리소스 폴더 안에 실제로 존재해야 한다는 것입니다. 그렇지 않으면 화면에서 이 이미지를 올바르게 표시할 수 없습니다.

![movie](../../Resource/021_movie2.png)

이 수식어들의 역할은 각각 다음과 같습니다:

- `resizable()`은 이미지의 크기를 조절할 수 있다는 뜻입니다.
- `scaledToFit()`은 크기를 조절할 때 원래 비율을 유지하여 이미지가 늘어나거나 찌그러지는 것을 막는다는 뜻입니다.
- `frame(height: 180)`은 이미지의 높이를 180으로 설정한다는 뜻입니다.
- `cornerRadius(10)`은 이미지에 반지름 10의 둥근 모서리를 적용한다는 뜻입니다.

이렇게 하면 크기가 적당하고 모서리가 둥근 영화 포스터 이미지를 얻을 수 있습니다.

![movie](../../Resource/021_movie3.png)

### 영화 소개

오른쪽에는 영화 소개가 표시되며, 영화 이름, 감독, 평점이 포함됩니다.

![movie](../../Resource/021_movie4.png)

이 부분은 `Text`를 사용해 표시할 수 있습니다:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

이 코드에서 `.font`는 글자 크기를 나타내고, `.fontWeight`는 글자의 두께를 나타냅니다.

“영화 이름”, “감독 정보”, “평점 정보” 사이의 간격을 더 분명하게 하기 위해, 여기서는 가장 바깥쪽에 `VStack`을 사용하고 다음과 같이 설정합니다:

```swift
spacing: 10
```

이것은 이 `VStack` 안의 각 내용 그룹 사이 간격이 모두 10이라는 뜻입니다.

감독과 평점이 각각 다시 하나의 `VStack`으로 감싸져 있는 이유는 둘 다 “제목 + 내용” 구조에 속하기 때문입니다. 그래서 화면의 계층이 더 명확해지고, 이후 스타일을 계속 조정하기도 더 편리해집니다.

또한 `VStack`은 기본적으로 가운데 정렬입니다. 글자를 전체적으로 왼쪽 정렬로 맞추기 위해 다음과 같이 설정합니다:

```swift
alignment: .leading
```

이렇게 하면 영화 소개 부분이 더 정돈되어 보입니다.

### 구분선

이제 영화 소개의 내용은 `spacing`을 통해 서로 떨어져 있지만, 서로 다른 내용 사이의 경계는 아직 충분히 뚜렷하지 않습니다.

이때 구분선을 추가할 수 있습니다:

```swift
Divider()
```

예를 들면:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

이렇게 하면 영화 소개 부분에 더 뚜렷한 구분 효과가 생깁니다.

![movie](../../Resource/021_movie4.png)

`Divider`는 매우 단순하지만 아주 자주 사용하는 뷰로, 서로 다른 내용을 구분하는 역할을 합니다.

`VStack` 안에서는 `Divider()`가 가로선으로 표시됩니다.

`HStack` 안에서는 `Divider()`가 세로선으로 표시됩니다.

또한 `.frame`, `.background`, `.padding` 등의 방법으로 `Divider`의 스타일도 바꿀 수 있습니다.

예를 들면:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

이렇게 하면 파란색이고 두께가 2이며 좌우에 안쪽 여백이 있는 구분선이 생성됩니다.

![divider](../../Resource/021_divider.png)

### 완전한 화면

마지막으로 `HStack`을 사용해 영화 포스터와 영화 소개를 좌우로 나란히 배치할 수 있습니다.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

여기서 `HStack(spacing: 20)`은 좌우 두 부분 사이에 20의 간격을 둔다는 뜻입니다.

주의해야 할 점은 `Divider()`도 앞에서 살펴본 `TextField`, `Slider`와 마찬가지로, 기본적으로 가능한 한 많은 공간을 차지하려고 한다는 것입니다.

따라서 오른쪽 소개 부분의 바깥쪽 `VStack`에 고정 너비를 설정합니다:

```swift
.frame(width: 200)
```

이렇게 하면 구분선과 글자 영역의 너비를 같게 유지할 수 있어서 전체적으로 더 정돈되어 보입니다.

여기까지 하면 “단일 영화” 표시 화면이 완성됩니다.

![movie](../../Resource/021_movie1.png)

## 배열로 영화 저장하기

여러 영화를 같은 스타일로 차례대로 표시하려면, 각 영화마다 비슷한 코드를 한 번씩 써야 한다는 뜻입니다.

예를 들면:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

이렇게 작성한 코드도 원하는 결과를 얻을 수는 있지만, 코드 양이 점점 많아지고 유지보수도 매우 번거로워집니다.

예를 들어 모든 영화의 간격을 `20`에서 `15`로 바꾸거나, 오른쪽 너비를 `200`에서
`220`으로 바꾸려면 반복되는 코드 조각을 하나하나 손으로 수정해야 합니다.

이것은 분명히 효율적인 방법이 아닙니다.

우리는 앞에서 배열을 배웠고, 또 `ForEach`를 사용해 배열을 기반으로 뷰를 반복해서 표시하는 방법도 배웠습니다.

예를 들면:

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

이 방법은 “데이터가 하나만 있는” 경우, 예를 들면 이미지 이름 묶음 같은 상황을 처리하기에 매우 적합합니다.

하지만 하나의 영화에는 하나의 값만 있는 것이 아닙니다. 적어도 다음이 포함됩니다:

1. 영화 포스터
2. 영화 이름
3. 감독
4. 평점

즉, 하나의 영화는 사실 서로 관련된 데이터의 집합이지, 단순한 하나의 문자열이 아닙니다.

배열만 사용한다면, 이 정보를 따로따로 저장할 수밖에 없습니다:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

표시할 때는 같은 인덱스를 이용해 하나씩 대응시켜야 합니다:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

이 방식의 문제는 유지보수 비용이 매우 높다는 점입니다.

한 영화의 데이터가 여러 배열에 흩어져 있기 때문에, 배열 중 하나라도 항목이 하나 많거나 적거나, 순서가 다르면 표시 결과가 잘못됩니다.

특히 영화를 추가하거나 삭제할 때는 여러 배열을 동시에 수정해야 하므로, 무엇인가를 빠뜨리기 매우 쉽습니다.

그렇다면 “영화 이름, 감독, 평점” 같은 정보를 어떻게 하나의 전체로 묶을 수 있을까요?

여기서 `struct`를 사용해야 합니다.

## struct 구조체 정의

Swift에서 `struct`는 “구조체”입니다.

이것은 여러 관련 필드를 묶어 하나의 전체로 만들 수 있는 “사용자 정의 데이터 타입”으로 이해할 수 있습니다.

기본 사용법:

```swift
struct StructName {
	let name: String
}
```

이 코드에서 `struct`는 구조체를 정의하고 있다는 것을 나타내는 키워드입니다. `StructName`은 구조체의 이름입니다.

중괄호 안의 내용은 이 구조체가 포함하는 필드들이며, 각 필드에는 이름과 타입을 분명하게 적어야 합니다.

보통 `struct`의 이름은 `Movie`, `Student`, `UserInfo`처럼 대문자로 시작합니다. 이것은 Swift에서 흔히 쓰이는 명명 습관입니다.

`struct`는 각 필드가 상자 안에 미리 마련된 빈 공간처럼 되어 있는 빈 상자라고 간단히 이해할 수 있습니다.

이 공간들이 아직 채워지지 않았을 때는 단지 빈 상자일 뿐입니다. 모든 필드가 적절한 값으로 채워졌을 때 비로소 완전한 선물 상자가 됩니다.

### struct 인스턴스

앞에서는 구조체 자체만 정의했는데, 이것은 상자의 형태를 준비한 것과 같습니다.

이제 그 안에 구체적인 내용을 채워야 실제로 사용할 수 있는 “인스턴스”를 얻게 됩니다.

인스턴스를 만들 때는 보통 구조체 이름 뒤에 `()`를 붙입니다:

```swift
StructName(...)
```

괄호 안에 들어가는 것이 바로 이 구조체가 필요로 하는 필드 내용입니다.

예를 들면:

```swift
StructName(name: "Fang Junyu")
```

이 코드는 `StructName` 구조체의 형식에 따라 새로운 인스턴스를 만들고, `name` 필드에 `"Fang Junyu"`라는 값을 넣는다는 뜻입니다.

필요한 모든 필드 내용을 채우고 나면, 그것은 상자를 가득 채운 것과 같습니다.

이때 우리는 완전한 구조체 인스턴스를 얻게 됩니다.

### struct 속성 접근

인스턴스를 만든 뒤에는 “점 문법”을 사용해 그 안의 속성에 접근할 수 있습니다.

기본적인 작성 방식:

```swift
인스턴스.속성이름
```

예를 들면:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

여기서 `st`는 구조체 인스턴스이고, `st.name`은 이 인스턴스 안의 `name` 값을 읽는다는 뜻입니다.

이 읽기 방식을 이렇게 이해할 수 있습니다. `st.name`이라고 쓰는 것은 상자 안 특정 위치에 저장된 내용을 읽는 것과 같습니다.

이런 작성 방식은 이후 SwiftUI 화면에서 매우 자주 등장합니다.

예를 들어 이름, 나이, 반을 포함한 학생 구조체가 있다면, 화면에 표시할 때 다음처럼 각각 읽을 수 있습니다:

```swift
student.name
student.age
student.className
```

이렇게 하면 데이터가 더 명확해지고 관리도 더 쉬워집니다.

### struct 위치

초보자의 경우 보통 구조체를 `ContentView` 바깥에 작성해도 됩니다.

예를 들면:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

이렇게 하면 구조가 더 분명해지고 읽기도 쉬워집니다.

그리고 `ContentView` 자체도 사실 하나의 `struct`라는 점을 알게 될 것입니다.

### Movie 구조체

앞에서 배운 내용을 바탕으로 이제 영화 구조체를 정의할 수 있습니다:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

이것은 `Movie`라는 이름의 구조체이며, `name`, `director`, `rating` 세 개의 필드로 이루어져 있고, 각각 영화 이름, 감독, 평점을 뜻합니다.

이렇게 하면 한 영화와 관련된 정보를 더 이상 여러 배열로 나눠서 저장할 필요 없이, 바로 하나의 전체로 묶을 수 있습니다.

예를 들어, 다음과 같은 영화 인스턴스를 만들 수 있습니다:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

이 인스턴스는 “하나의 완전한 영화 데이터”를 나타냅니다.

### 배열에 구조체 저장하기

앞에서 배열은 같은 타입만 저장할 수 있다고 말했습니다.

이제 우리는 `Movie` 구조체를 가지고 있으므로, 배열은 여러 개의 `Movie`를 저장할 수 있습니다.

```swift
let lists: [Movie] = []
```

예를 들면:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

이 `lists` 배열에 저장되는 것은 문자열이 아니라 여러 개의 `Movie` 인스턴스입니다.

즉, 배열 안의 각 요소가 하나의 완전한 영화입니다.

이렇게 되면 영화 목록을 표시해야 할 때 `ForEach`를 통해 영화들을 하나씩 읽어 올 수 있습니다.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

여기서 `movie in`은 반복할 때마다 배열에서 영화 하나를 꺼내 임시로 `movie`라는 이름을 붙인다는 뜻입니다.

그런 다음 우리는:

```swift
movie.name
movie.director
movie.rating
```

를 사용해 이 영화의 이름, 감독, 평점을 각각 읽어 화면에 표시할 수 있습니다.

## ForEach 오류

여기까지 하면 영화 배열과 `ForEach`의 기본적인 작성 방식은 완성됩니다.

하지만 아래 코드를 바로 실행하면:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

오류가 발생합니다:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

이 오류의 뜻은, `id: \.self`라고 작성하면 SwiftUI가 배열 안의 각 요소 자체를 “고유 식별자”로 사용해야 한다는 것입니다.

이 방식은 `String`, `Int`처럼 단순한 타입에는 적합합니다. 왜냐하면 그런 타입들은 자체적으로 구분하기가 비교적 쉽기 때문입니다.

하지만 `Movie`는 우리가 직접 정의한 사용자 정의 구조체이고, `ForEach`는 이 구조체 자체를 고유 식별자로 어떻게 사용해야 하는지 알지 못하므로 오류가 발생합니다.

이 문제를 해결하는 가장 일반적인 방법은 `Movie`가 `Identifiable` 프로토콜을 따르도록 만드는 것입니다.

## 프로토콜

Swift에서 프로토콜은 일종의 “규칙” 또는 “요구 사항”으로 이해할 수 있습니다.

이것을 국제기구의 협정처럼 생각할 수도 있습니다. 어떤 국가가 특정 국제기구에 가입하려면 보통 그 기구가 제시하는 몇 가지 규칙을 만족하고, 몇 가지 데이터를 공개하고, 공통 규칙을 따라야 합니다. 그런 조건을 충족한 뒤에야 가입하거나 특정 사안에 참여할 수 있습니다.

프로토콜도 이와 비슷한 원리입니다.

어떤 타입이 특정 프로토콜을 따르고자 한다면, 그 프로토콜이 요구하는 내용을 만족해야 합니다. 그런 요구 사항을 충족한 뒤에야 그 타입은 해당 기능을 사용할 수 있습니다.

기본적인 작성 방식:

```swift
struct Movie: Identifiable {
    // ...
}
```

여기서 `: Identifiable`은 `Movie`가 `Identifiable` 프로토콜을 따른다는 뜻입니다.

하나의 타입이 여러 프로토콜을 따른다면 쉼표로 구분해 쓸 수 있습니다:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable`에서 가장 중요한 요구 사항은 그 타입이 자신을 식별할 수 있는 `id`를 가져야 한다는 점입니다.

예를 들면:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

여기서 `id`는 신분증 번호 같은 것으로, 각 영화를 구분하는 데 사용됩니다.

각 영화의 `id`가 모두 다르기만 하면, SwiftUI는 배열 안의 각 요소를 정확하게 구분할 수 있습니다。

예를 들면:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

그리고 `ForEach` 안에서는 다음처럼 사용합니다:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

이렇게 하면 더 이상 오류가 나지 않습니다.

`Movie`가 이미 `Identifiable`을 따르고 있으므로, 더 흔한 작성 방식은 `id:`를 직접 생략하는 것입니다:

```swift
ForEach(lists) { movie in
    // ...
}
```

왜냐하면 SwiftUI는 이미 각 항목을 구분할 때 `movie.id`를 사용해야 한다는 것을 알고 있기 때문입니다.

## ForEach의 구분 식별자

이제 `ForEach`에서 `id`의 역할을 더 깊이 이해해 보겠습니다.

예를 들면:

```swift
ForEach(lists, id: \.self)
```

이것은 요소 자체를 구분 식별자로 사용한다는 뜻입니다.

그리고:

```swift
ForEach(lists, id: \.id)
```

는 요소의 `id` 필드를 구분 식별자로 사용한다는 뜻입니다.

어떤 필드가 그 자체로 유일함을 보장할 수 있다면, 임시로 그것을 사용하는 것도 가능합니다.

예를 들어 각 영화의 이름이 모두 다르다면, 현재 데이터에서는 다음과 같은 작성도 정상적으로 동작할 수 있습니다:

```swift
ForEach(lists, id: \.name)
```

하지만 여기에는 숨은 문제가 하나 있습니다. `name`이 항상 유일하다는 보장은 없습니다.

나중에 같은 이름의 영화를 하나 더 추가한다고 가정해 보면, `name`만으로는 각 요소를 정확히 구분할 수 없게 됩니다.

이 경우 코드는 여전히 컴파일될 수 있지만, 뷰의 새로고침, 업데이트, 삽입, 삭제 과정에서 SwiftUI가 요소를 잘못 식별해 표시 이상이 발생할 수 있습니다.

따라서 데이터를 안정적으로 구분해야 할 때는, 실제로 유일한 필드인 `id`를 사용하는 것이 가장 좋습니다.

## UUID

`id: 1`, `id: 2`처럼 직접 써서 문제를 해결할 수는 있지만, 여전히 한 가지 위험이 있습니다. 실수로 같은 `id`를 중복해서 쓸 수 있고, 그러면 고유 식별자의 효력이 사라집니다.

예를 들면:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

이렇게 되면 같은 `id`가 두 개 생겨서 고유 식별자가 더 이상 유효하지 않게 됩니다.

이런 수작업 오류를 피하기 위해 보통 `UUID()`를 사용합니다.

Swift에서 `UUID()`는 무작위 128비트 식별자를 생성합니다. 보통은 문자와 숫자로 이루어진 긴 문자열 형태로 표시됩니다.

예를 들면:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

여기서 `UUID()`는 실제로 `UUID` 타입의 인스턴스를 만드는 것이며, 자동으로 생성되는 “고유 번호”라고 이해할 수 있습니다.

따라서 매번 생성되는 값은 거의 중복되지 않으므로 `id`로 사용하기에 매우 적합합니다.

`Movie`를 다음과 같이 바꿀 수 있습니다:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

이 코드는 `Movie` 구조체 안의 `id` 필드가 기본적으로 새로운 `UUID` 인스턴스를 갖게 된다는 뜻입니다.

즉, 새로운 `Movie`를 만들 때마다 시스템이 먼저 자동으로 고유한 `id`를 만들어 준다는 의미입니다.

`id`에는 이미 기본값이 있기 때문에, 이후 `Movie` 인스턴스를 만들 때는 더 이상 `id`를 손으로 입력할 필요가 없습니다.

예를 들면:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

여기서는 `id`를 쓰지 않았지만, 실제로 이 영화 인스턴스는 여전히 자신의 `id`를 갖고 있습니다. 다만 그 값이 이미 `UUID()`에 의해 자동으로 생성되었을 뿐입니다.

이 방법을 사용하면 더 이상 각 영화마다 `id`를 손으로 채울 필요가 없습니다. 코드 양을 줄일 뿐만 아니라, 중복된 id 입력으로 생기는 오류도 피할 수 있습니다.

마지막으로, 위쪽에 `Banner` 이미지를 추가하고, 내용이 스크롤될 수 있도록 `ScrollView`를 사용하면 전체 영화 목록 뷰가 완성됩니다.

## 요약

이 수업에서는 매우 중요한 개념인 `struct`를 배웠습니다.

`struct`를 통해 한 영화의 여러 관련 필드를 하나의 전체로 묶을 수 있으며, 이름, 감독, 평점을 여러 배열에 나누어 저장할 필요가 없어집니다.

데이터를 정리한 뒤에는 `ForEach`를 사용해 배열 안의 각 영화를 하나씩 화면에 표시할 수 있습니다.

동시에 우리는 `ForEach` 안에서 “구분 식별자”가 어떤 역할을 하는지도 이해했습니다. SwiftUI는 배열의 각 요소를 어떻게 구분할지 알아야만 뷰를 올바르게 표시하고 업데이트할 수 있습니다.

그래서 `Movie`가 `Identifiable` 프로토콜을 따르도록 만들고, 고유한 `id`를 제공했습니다.

또한 `id`를 수동으로 채울 때 생길 수 있는 실수를 피하기 위해 `UUID()`도 배웠고, 시스템이 자동으로 고유 식별자를 생성하도록 했습니다.

이 수업을 마친 뒤에는 영화 목록을 완성하는 것뿐만 아니라, SwiftUI의 중요한 사고방식 하나에도 닿게 됩니다. 그것은 **먼저 데이터를 정리하고, 그다음 그 데이터에 따라 뷰를 생성하는 것**입니다.

## 전체 코드

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
