# struct와 class

지난 수업에서는 `struct`를 막 접하기 시작했고, 하나의 구조체를 정의했으며, 프로토콜, `UUID` 같은 지식도 함께 확장해서 배웠습니다.

이제 우리는 `struct` 키워드에 대해 어느 정도의 첫인상은 갖게 되었지만, 아직 정말로 이해했다고 하기는 어렵습니다.

이번 수업에서는 계속해서 `struct`를 핵심 내용으로 다루고, 그와 함께 `class`도 알아보겠습니다. 이 수업을 통해 여러분은 인스턴스가 무엇인지, 생성자가 무엇인지, 그리고 왜 `struct`와 `class`를 사용해 데이터를 조직할 수 있는지를 더 분명하게 알게 될 것입니다.

## 학생 관리 시스템

예를 들어, 지금 우리는 학생 관리 시스템을 개발하려고 합니다. 각 학생은 이름, 성별, 전화번호, 나이, 집 주소 등의 정보를 가지고 있습니다.

이때 우리는 이 정보들을 하나로 묶어서 `Student` 구조체로 정의할 수 있습니다:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

여기서는 `struct`를 사용해 학생 타입을 정의했습니다.

이 `Student` 구조체에는 여러 속성이 포함되어 있습니다:

- `id`: 학생의 고유 식별자
- `name`: 학생 이름
- `sex`: 학생 성별
- `phone`: 학생 전화번호
- `age`: 학생 나이
- `address`: 집 주소

이렇게 하면 원래 흩어져 있던 여러 데이터가 하나의 완전한 "학생"으로 합쳐집니다.

여기서 `Student`는 `Identifiable` 프로토콜도 따르고 있으며, `id` 필드를 정의해서 나중에 `ForEach` 반복문과 함께 데이터를 표시하기 편리하도록 했습니다.

그다음, 우리는 학생 인스턴스를 만들 수 있습니다:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

이 코드는 `Student`라는 구조에 따라 구체적인 학생 데이터를 만들 수 있다는 뜻입니다.

여기서 `Student`는 타입이고, `Student(...)`는 생성된 하나의 인스턴스를 의미합니다.

SwiftUI에서는 이 인스턴스를 변수에 할당한 뒤 화면에 표시할 수 있습니다.

예를 들어:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

이렇게 하면 화면에서 이 학생의 이름 `Fang Junyu`를 볼 수 있습니다.

여기서는 먼저 `Student` 인스턴스를 만들고, 그것을 `student` 변수에 할당한 다음, 마지막으로 `student.name`을 통해 그 속성을 읽었습니다.

## 인스턴스란 무엇인가

`struct`를 막 배우기 시작할 때는 "인스턴스"라는 단어가 아주 낯설게 느껴질 수 있습니다.

하지만 사실 우리는 처음부터 계속 인스턴스를 사용해 왔고, 단지 예전에는 특별히 의식하지 않았을 뿐입니다.

예를 들어:

```swift
let name = "Fang Junyu"
```

여기서 `"Fang Junyu"`는 문자열 값이며, 본질적으로는 `String` 타입의 인스턴스입니다.

이것을 다음과 같이 쓸 수도 있습니다:

```swift
let name = String("Fang Junyu")
```

이 두 가지 방식은 같은 뜻입니다. 즉, `String` 타입의 인스턴스를 만들고 그것을 `name` 변수에 할당하는 것입니다.

마찬가지로 `Int`도 같습니다:

```swift
let num = 3
```

여기서 `3`도 본질적으로는 `Int` 타입의 값이며, `Int`의 인스턴스로 이해할 수도 있습니다.

그러므로 인스턴스는 `struct` 안에서만 나타나는 특별한 개념이 아닙니다.

`String`, `Int`, `Double`, `Bool`, 혹은 우리가 직접 만든 `Student` 모두 인스턴스를 만들 수 있습니다.

그래서 우리가 다음과 같이 쓸 때:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

본질적으로는 `String`이나 `Int`의 인스턴스를 만드는 것과 같고, 단지 `Student`가 우리가 직접 정의한 타입일 뿐입니다.

## 생성자

우리가 인스턴스를 만들 때:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

실제로는 `Student`의 초기화 메서드인 `init`을 호출하고 있는 것입니다.

생성자는 이렇게 이해할 수 있습니다: **인스턴스를 만들 때 속성에 값을 할당하는 일을 맡는 입구입니다.**

즉, 하나의 인스턴스가 정말로 완성되기 전에는 보통 먼저 `init`을 거쳐야 합니다.

예를 들어, 앞서 SwiftUI 뷰 라이프사이클을 배울 때 우리는 이런 코드를 썼습니다:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

여기서 `init()`은 `ContentView` 인스턴스가 생성될 때 실행되고, `onAppear`는 뷰가 실제로 화면에 표시될 때에만 실행됩니다. 즉, 뷰의 생성과 뷰의 표시 시점은 같지 않습니다.

마찬가지로 `Student(...)`를 만들 때도 `Student`의 생성자를 호출하는 것입니다.

### 시스템이 자동으로 만들어 주는 생성자

우리가 `Student`를 정의할 때는 `init`을 직접 쓰지 않았습니다:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

그런데도 우리는 여전히 인스턴스를 직접 만들 수 있습니다:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

생성자를 쓰지 않았는데도 왜 인스턴스를 만들 수 있을까요?

그 이유는 `struct`의 경우 우리가 생성자를 직접 작성하지 않으면, 시스템이 보통 적절한 생성자를 자동으로 만들어 주기 때문입니다.

초보 단계에서는 이것을 간단히 이렇게 이해하면 됩니다: Swift가 초기화 코드를 자동으로 채워 준다.

대략적으로는 시스템이 다음과 같은 코드를 대신 채워 준다고 이해할 수 있습니다:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

여기서 한 가지 세부 사항에 주의해야 합니다:

```swift
let id = UUID()
```

`id`는 이미 기본값을 가지고 있으므로, 인스턴스를 만들 때 우리가 `id`를 다시 직접 전달할 필요는 없습니다.

즉, 기본값이 없는 속성은 보통 생성자에서 전달해야 하고, 이미 기본값이 있는 속성은 보통 그 기본값을 그대로 사용할 수 있습니다.

따라서 `Student` 인스턴스를 만들 때는 `name`, `sex`, `phone`, `age`, `address`만 전달하면 됩니다.

### 컴파일러 힌트

또한 Xcode에서 `Student(...)`를 입력하면, 시스템이 제공하는 매개변수 힌트도 볼 수 있습니다。

![student](../../Resource/022_student.png)

이것 역시 현재 이 타입에 시스템이 자동 생성한 생성자가 실제로 존재한다는 것을 보여 줍니다.

### 직접 생성자 작성하기

시스템이 생성자를 자동으로 만들어 줄 수는 있지만, 때로는 이 기본 초기화 방식이 우리의 요구에 완전히 맞지 않을 수 있습니다.

예를 들어, 이런 `Movie` 구조체가 있다고 합시다:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

시스템이 자동으로 생성한 생성자에 따르면, 인스턴스를 만들 때 우리는 이 세 개의 매개변수를 동시에 모두 전달해야 합니다:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

하지만 지금 우리가 오래된 영화들을 한꺼번에 입력하려고 하는데, 영화 이름만 알고 감독과 평점은 모른다면 조금 번거로워집니다.

왜냐하면 이 경우 우리는 다음처럼만 쓸 수 있기 때문입니다:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

이렇게 해도 동작은 하지만, 매번 `--`를 반복해서 쓰는 것은 불편합니다.

이럴 때 우리는 생성자를 하나 직접 작성할 수 있습니다:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

이렇게 하면 오래된 영화를 만들 때는 `name`만 전달하면 됩니다:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

이것이 직접 생성자를 작성하는 의미 중 하나입니다. **인스턴스를 만드는 방식을 실제 요구에 더 맞게 만들 수 있다는 것**입니다.

### 커스텀 생성자 해석하기

방금 손으로 작성한 이 생성자를 한번 봅시다:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

이 코드의 뜻은 `Movie` 인스턴스를 만들 때 `name`이라는 하나의 매개변수만 넘기면 된다는 것입니다.

그리고 생성자 내부에서 전달된 `name`을 인스턴스 자신의 `name`에 할당하고, `director`와 `rating`에는 기본값 `--`를 줍니다.

여기서 `self`는 "현재 이 인스턴스 자기 자신"을 뜻합니다.

예를 들어:

```swift
self.name = name
```

왼쪽의 `self.name`은 인스턴스 안의 속성을 의미하고, 오른쪽의 `name`은 우리가 넘긴 매개변수를 의미합니다.

이것은 바깥에서 전달된 값을 인스턴스 자신의 속성에 저장하는 것이라고 간단히 이해할 수 있습니다.

모든 속성에 값이 할당되면, 이 인스턴스의 생성은 완료됩니다.

### 생성자 메커니즘

우리가 생성자를 명시적으로 선언하면, 또 하나의 변화가 생깁니다:

원래 시스템이 자동으로 만들어 주던 생성자는 보통 더 이상 직접 사용할 수 없게 됩니다.

예를 들어:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

이 상태에서 다시 이렇게 쓰면:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

컴파일러는 다음과 같은 오류를 냅니다:

```swift
Extra arguments at positions #2, #3 in call
```

이 뜻은 "여분의 매개변수를 전달했다"는 의미입니다.

왜 이런 오류가 생길까요?

그 이유는 현재 `Movie` 구조체 안에는 네가 직접 선언한 이 한 가지 생성자만 있기 때문입니다:

```swift
init(name: String)
```

이 생성자는 `name`이라는 하나의 매개변수만 받고, `director`와 `rating`은 받지 않습니다.

즉, 직접 생성자를 추가하고 나면, 원래 자동으로 생성되던 초기화 방식은 더 이상 그대로 사용할 수 없게 됩니다.

만약 우리가 "이름만 전달하기"와 "완전한 정보 전달하기"를 모두 지원하고 싶다면, 완전한 생성자 하나를 스스로 더 써 줘야 합니다:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

이렇게 하면 서로 다른 두 개의 생성자를 갖게 됩니다.

오래된 영화를 만들 때는 이렇게 쓸 수 있습니다:

```swift
Movie(name: "The Night of the Hunter")
```

완전한 정보를 가진 새 영화를 만들 때는 이렇게 쓸 수 있습니다:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

이런 작성 방식은 하나의 타입이 매개변수 형식만 다르면 여러 생성자를 가질 수 있다는 점도 보여 줍니다.

## 오버로딩이란 무엇인가

여기서 또 하나 필요한 지식을 덧붙이겠습니다.

방금 우리는 `Movie`를 위해 두 개의 `init`을 작성했습니다:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

이처럼 "함수 이름은 같지만 매개변수가 다른" 작성 방식을 "오버로딩"이라고 합니다.

여기서는 두 함수 모두 이름이 `init`이지만, 받는 매개변수가 다르기 때문에 Swift는 네가 어떤 함수를 호출하는지 구분할 수 있습니다.

예를 들어:

```swift
Movie(name: "Days of Heaven")
```

이것은 다음을 호출합니다:

```swift
init(name: String)
```

반면:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

이것은 초기화 메서드의 다른 완전한 버전을 호출합니다.

따라서 오버로딩의 역할은, 같은 타입이 서로 다른 상황에 따라 서로 다른 생성 방식을 제공할 수 있게 하는 것입니다.

## class 알아보기

다음으로 `class`도 간단히 알아봅시다.

Swift에서 자주 쓰는 `struct` 외에도, Java, C#, Kotlin 같은 많은 프로그래밍 언어는 인스턴스를 만들기 위해 `class`를 사용합니다.

Swift에서 `class`의 작성 방식은 `struct`와 매우 비슷합니다.

예를 들어:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

키워드가 `struct`에서 `class`로 바뀐 것만 제외하면, 나머지 부분은 거의 똑같아 보인다는 것을 알 수 있습니다.

인스턴스를 만드는 방식도 매우 비슷합니다:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

그래서 문법 차원에서 보면 `struct`와 `class`는 정말 아주 비슷합니다.

### Struct와 Class의 차이

`struct`와 `class`는 매우 비슷해 보이지만, 완전히 같은 것은 아닙니다.

**1. 초기화 방식이 다르다**

`struct`의 경우 우리가 생성자를 직접 쓰지 않으면, 시스템이 보통 적절한 초기화 메서드를 자동으로 생성합니다.

하지만 `class`의 경우 아직 기본값이 없는 속성이 있다면, 보통 `init`을 직접 작성해야 하며, 그렇지 않으면 오류가 발생합니다.

예를 들어:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

이 `class`는 생성자가 없어서 속성들이 초기화되지 않기 때문에 오류가 발생합니다.

컴파일러는 다음과 비슷한 메시지를 보여 줍니다:

```swift
Class 'Movie' has no initializers
```

따라서 이 예제에서는 `class`에 대해 생성자를 직접 작성해야 합니다。

**2. `struct`는 값 타입이고, `class`는 참조 타입이다**

`struct`는 값 타입이고, `class`는 참조 타입입니다.

초보 단계에서는 이 두 개념을 완전히 이해할 필요는 없고, 간단한 이미지 정도만 있으면 충분합니다.

예를 들어 `struct`는 "새로운 값을 복사하는 것"에 더 가깝습니다.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

여기서는 `user1`을 `user2`에 대입하면 새로운 데이터 복사본이 생기는 것과 같기 때문에, `user2`를 수정해도 `user1`에는 영향을 주지 않습니다.

반면 `class`는 "같은 인스턴스를 함께 가리키는 것"에 더 가깝습니다.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

여기서는 `user1`과 `user2`가 같은 인스턴스를 가리킵니다.

지금 단계에서는 값 타입과 참조 타입의 내부 메커니즘을 완전히 이해할 필요는 없습니다. `struct`는 독립적인 데이터를 저장하는 데 더 적합하고, `class`는 여러 곳에서 같은 인스턴스를 공유해야 할 때 더 적합하다는 정도만 알면 충분합니다.

## 초보 단계에서는 어떻게 선택할까

현재 단계에서는 일반적인 데이터 모델에는 우선 `struct`를 고려하고, 공유와 동기화된 수정이 필요한 데이터에는 `class`를 고려하면 됩니다.

이것이 절대적인 규칙은 아니지만, 초보자에게는 충분히 실용적인 판단 기준입니다.

특히 SwiftUI에서는 많은 경우 `struct`만으로도 대부분의 작업을 해결할 수 있다는 것을 알게 될 것입니다.

또한 많은 프로그래밍 자료에서는 `class`로 만들어진 내용을 "객체"라고 부르기도 합니다. 초보 단계에서는 이것도 그냥 인스턴스로 이해하면 되고, 굳이 엄격하게 구분할 필요는 없습니다.

## 정리

이번 수업에서는 `struct`를 더 깊이 배웠고, 그와 함께 `class`도 알아보았습니다. 둘 다 타입을 정의하는 데 사용할 수 있습니다.

타입은 인스턴스를 만들 수 있습니다. 인스턴스를 만들 때는 생성자인 `init`이 호출됩니다.

`struct`의 경우 생성자를 직접 작성하지 않으면, 시스템이 보통 적절한 생성자를 자동으로 만들어 줍니다. 기본 생성자가 요구를 만족하지 못하면, 우리 스스로 생성자를 작성할 수도 있습니다.

또한 우리는 `struct`와 `class`의 차이에 대해서도 기초적으로 알게 되었습니다. `struct`는 값 타입이고, `class`는 참조 타입입니다. SwiftUI에서는 초보 단계에서 보통 `struct`를 더 자주 접하게 됩니다.

앞으로 뷰 사이의 값 전달, 데이터 모델, 상태 관리를 배울 때에도 이러한 내용은 계속해서 사용될 것입니다.
