# 로그인 뷰

이번 수업에서는 아주 실용적인 장면인 로그인 뷰를 배워 보겠습니다.

웹사이트든 앱이든 사용 과정에서 사용자에게 계정 로그인과 비밀번호 입력이 필요한 경우가 많습니다.

예를 들어, GitHub 로그인 페이지입니다.

![WordPress](../../Resource/019_github.png)

이번 수업에서는 사용자가 계정과 비밀번호를 직접 입력하고, 입력한 내용에 문제가 있는지 확인할 수 있는 비슷한 로그인 뷰를 만들어 보겠습니다.

## 상단 레이아웃

로그인 뷰의 코드는 `ContentView` 파일에 작성하겠습니다.

먼저 로그인 뷰 상단의 표시 영역을 작성해 봅시다. 적절한 아이콘 이미지를 미리 준비해서 `Assets` 폴더에 넣어 둘 수 있습니다.

![icon](../../Resource/019_icon1.png)

그다음 `Image` 와 modifier를 사용해 이미지를 표시합니다.

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

여기서 각 modifier의 의미는 다음과 같습니다.

- `resizable()`: 이미지 크기를 조절할 수 있게 합니다.
- `scaledToFit()`: 이미지의 원래 비율을 유지한 채 크기를 조절합니다.
- `frame(width: 100)`: 이미지의 표시 너비를 `100` 으로 설정합니다.

이어서 `Text` 와 modifier를 사용해 로그인 제목을 표시합니다.

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

그다음 `VStack` 을 사용해 이미지와 텍스트를 세로로 배치합니다.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

실행 결과:

![view](../../Resource/019_view.png)

여기까지 하면 로그인 뷰 상단의 제목 영역이 완성됩니다.

### 레이아웃 최적화

지금은 이미지와 제목이 기본적으로 전체 레이아웃의 가운데 영역에 놓여 있습니다.

이것들이 더 “페이지 상단의 로그인 표시”처럼 보이게 하고 싶다면, `Spacer()` 를 사용해 남은 공간을 늘려서 내용이 위쪽에 가깝게 보이도록 할 수 있습니다.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

실행 결과:

![view](../../Resource/019_view1.png)

하지만 이제 `Image` 와 `Text` 가 화면 위쪽에 너무 가까워져서 조금 답답해 보입니다.

이때는 `padding` 을 사용해 `VStack` 전체에 위쪽 여백을 추가할 수 있습니다.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

실행 결과:

![view](../../Resource/019_view2.png)

이렇게 하면 페이지 상단의 제목 영역이 더 자연스럽게 보입니다.

## 사용자 이름과 비밀번호

로그인 페이지에서는 보통 사용자가 사용자 이름과 비밀번호를 입력해야 합니다.

SwiftUI에서는 사용자가 입력한 내용을 받기 위해 `TextField` 를 사용할 수 있습니다.

하지만 주의할 점이 있습니다. `TextField` 자체가 입력 데이터를 오래 저장하는 것은 아니고, 단지 입력 컨트롤일 뿐입니다. 실제로 이 입력 내용을 저장하는 것은 여기에 바인딩한 변수입니다.

따라서 먼저 사용자 이름과 비밀번호를 저장할 두 개의 `@State` 변수를 만들어야 합니다.

```swift
@State private var user = ""
@State private var password = ""
```

`@State` 변수의 값이 바뀌면 SwiftUI는 관련된 뷰를 자동으로 새로 고칩니다.

이어서 `TextField` 를 사용해 이 두 변수를 바인딩합니다.

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

여기서 `$user` 와 `$password` 는 “바인딩”을 의미합니다.

즉, 사용자가 입력 상자에 글자를 입력하면 변수의 값도 동시에 바뀌고, 변수가 바뀌면 입력 상자에 표시되는 내용도 동시에 바뀝니다.

이처럼 “뷰와 데이터가 서로 동기화되는” 관계를 바인딩이라고 합니다.

여기서는 `$` 가 붙은 형태를 사용해야 한다는 점에 주의하세요.

```swift
$user
```

왜냐하면 `TextField` 가 필요한 것은 일반 문자열이 아니라, “양방향으로 데이터를 수정할 수 있는” 바인딩 값이기 때문입니다.

### 입력창 표시하기

이것들을 `ContentView` 안에 넣어 봅시다.

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

표시 결과:

![view](../../Resource/019_view3.png)

지금 `user` 와 `password` 는 둘 다 기본값이 빈 문자열이기 때문에,

```swift
""
```

입력창에는 먼저 placeholder 텍스트가 표시됩니다. 예를 들면:

```swift
input user
```

이 텍스트는 사용자에게 “여기에 무엇을 입력해야 하는지”를 알려 주는 안내일 뿐, 실제 입력된 내용은 아닙니다.

### 입력창 최적화하기

이제 입력창은 사용할 수 있지만, 기본 스타일은 비교적 단순합니다.

화면을 더 분명하게 만들기 위해 입력창 앞에 제목을 추가하고, 입력창 자체에도 간단한 스타일 조정을 할 수 있습니다.

예를 들어 먼저 제목을 추가합니다.

```swift
Text("Username")
    .fontWeight(.bold)
```

그다음 `HStack` 을 사용해서 제목과 입력창을 같은 줄에 배치합니다.

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

여기서 `HStack` 을 사용하는 이유는 “왼쪽에는 제목, 오른쪽에는 입력창”을 표시하고 싶기 때문입니다.

주의할 점은 `TextField` 가 기본적으로 남은 사용 가능한 공간을 차지한다는 것입니다.

![color](../../Resource/019_view6.png)

두 입력창의 크기를 더 통일감 있게 보이게 하려면 `frame(width:)` 를 사용해 너비를 지정할 수 있고, 그러면 입력창이 더 정돈되어 보입니다.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

그다음 입력창이 더 잘 보이도록 테두리도 추가합니다.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

이제 사용자 이름과 비밀번호를 모두 `ContentView` 뷰에 추가해 봅시다.

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

표시 결과:

![view](../../Resource/019_view4.png)

여기까지 하면 사용자는 사용자 이름과 비밀번호를 입력할 수 있게 됩니다.

## 로그인 버튼

다음으로 입력창 아래에 로그인 버튼을 추가합니다.

```swift
Button("Sign in") {

}
```

그다음 `buttonStyle` 을 사용해 버튼에 더 눈에 띄는 시스템 스타일을 적용합니다.

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

표시 결과:

![view](../../Resource/019_view5.png)

버튼이 실제로 탭에 반응하는지 확인하기 위해, 먼저 버튼 안에 `print` 를 써서 테스트할 수 있습니다.

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

버튼을 탭하면 콘솔에 다음이 출력됩니다.

```swift
click Sign in
```

이것은 버튼이 탭 동작에 성공적으로 반응했다는 뜻입니다.

## 로그인 로직

이제 로그인 버튼에 가장 기본적인 검증 로직을 추가해 보겠습니다. **사용자가 사용자 이름과 비밀번호를 입력했는지 확인하는 것**입니다.

우리는 다음과 같은 상황을 구현하고 싶습니다.

- 사용자가 아무것도 입력하지 않았다면 `Empty` 를 출력하기
- 둘 중 하나만 입력했다면 무엇이 빠졌는지 알려 주기
- 사용자 이름과 비밀번호가 모두 입력되었다면 `Success` 를 출력하기

### 아무 정보도 입력하지 않은 경우

`user` 와 `password` 는 둘 다 기본적으로 빈 문자열이므로,

```swift
@State private var user = ""
@State private var password = ""
```

사용자가 아무것도 입력하지 않으면 그대로 비어 있게 됩니다.

Swift에서는 `String` 같은 타입이 `isEmpty` 를 사용해 내용이 비어 있는지 판단할 수 있습니다.

### isEmpty 속성

`isEmpty` 는 문자열, 배열, 기타 내용이 비어 있는지 확인할 때 자주 사용됩니다.

예를 들면:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

내용이 비어 있으면 `isEmpty` 는 `true` 를 반환하고, 비어 있지 않으면 `false` 를 반환합니다.

따라서 이것을 사용해 사용자 이름과 비밀번호에 입력 내용이 있는지 판단할 수 있습니다.

### isEmpty로 변수 확인하기

사용자가 아무 정보도 입력하지 않았다면,

```swift
user.isEmpty // true
password.isEmpty    // true
```

이때 조건은 다음과 같이 쓸 수 있습니다.

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

이 코드는 “`user` 가 비어 있고, `password` 도 비어 있으면 다음을 출력한다”는 뜻입니다.

```swift
Empty
```

여기서 `&&` 는 논리 연산자로, “그리고”를 의미합니다.

즉, 왼쪽 조건이 참이고 오른쪽 조건도 참일 때만 전체 조건이 참이 됩니다.

따라서 이 코드는 사용자 이름과 비밀번호가 둘 다 비어 있을 때만 실행됩니다.

## 사용자가 일부만 입력한 경우

다음으로 다른 상황을 생각해 봅시다. 사용자가 사용자 이름만 입력했거나, 비밀번호만 입력한 경우입니다.

예를 들면:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

이때 사용자 이름은 비어 있지 않지만, 비밀번호는 비어 있습니다.

계속해서 `isEmpty` 를 사용해 확인할 수 있습니다.

### 사용자가 계정 또는 비밀번호를 입력한 상황

사용자가 사용자 이름만 입력했거나 비밀번호만 입력했다면, 무엇이 빠졌는지에 대한 알맞은 안내를 주어야 합니다.

예를 들어 사용자가 사용자 이름만 입력했다면 다음과 같이 쓸 수 있습니다.

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

이 코드의 로직은 다음과 같습니다. 사용자 이름이 비어 있으면 사용자 이름 입력을 요청합니다. 그렇지 않으면 비밀번호가 비어 있는지 확인하고, 비어 있다면 비밀번호 입력을 요청합니다.

### 사용자가 모든 정보를 입력한 경우

사용자 이름과 비밀번호가 모두 입력되어 있다면 `isEmpty` 는 둘 다 `false` 를 반환합니다.

이때는 다음과 같이 쓸 수 있습니다.

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

여기서 `!` 는 “부정”을 의미합니다.

예를 들면:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

즉, `user.isEmpty` 는 “사용자 이름이 비어 있는지”를 판단하는 데 쓰이고, `!user.isEmpty` 는 “사용자 이름이 비어 있지 않은지”를 판단하는 데 쓰입니다.

비밀번호도 같은 로직을 따릅니다.

따라서 이 코드의 의미는 “사용자 이름이 비어 있지 않고, 비밀번호도 비어 있지 않다”는 것입니다.

이 두 조건이 모두 참이면 출력은 다음과 같습니다.

```swift
Success
```

## 완전한 검증 로직

이제 이 세 가지 상황을 합쳐서 `Button` 안에 작성해 봅시다.

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

이 코드의 실행 순서는 다음과 같이 이해할 수 있습니다.

첫 번째 단계에서 먼저 이것을 확인합니다.

```swift
if user.isEmpty && password.isEmpty
```

사용자 이름과 비밀번호가 모두 비어 있다면 바로 `Empty` 를 출력합니다.

둘 다 비어 있는 것이 아니라면, 다음 줄을 계속 확인합니다.

```swift
else if user.isEmpty || password.isEmpty
```

여기서 `||` 는 “또는”을 의미합니다.

즉, 조건 중 하나만 참이어도 전체 조건이 참이 됩니다.

따라서 사용자 이름이 비어 있거나 비밀번호가 비어 있으면 `else if` 코드 블록이 실행됩니다.

코드 블록 안으로 들어간 뒤에는 어떤 입력창이 비어 있는지 더 자세히 확인합니다.

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

앞의 두 조건이 모두 참이 아니라면, 이는 사용자 이름이 비어 있지 않고 비밀번호도 비어 있지 않다는 뜻입니다.

그러면 프로그램은 마지막 `else` 로 들어갑니다.

```swift
print("Success")
```

이렇게 해서 가장 기본적인 로그인 입력 검증 로직을 완성하게 됩니다.

## 사용자 이름과 비밀번호 검증

위의 로직은 단지 “입력 내용이 있는지 없는지”만 확인합니다.

하지만 실제 앱에서는 내용만 입력했다고 해서 충분하지 않습니다. 보통은 사용자 이름과 비밀번호를 서버로 보내서 검증해야 합니다.

서버가 사용자 이름이 존재하고 비밀번호가 올바르다고 확인하면 로그인을 허용하고, 그렇지 않으면 로그인 실패를 알려 줍니다.

이 과정을 연습하기 위해, 먼저 코드 안에 임시 계정과 비밀번호를 설정해서 “올바른 로그인 정보”를 흉내 낼 수 있습니다.

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

사용자 이름과 비밀번호가 모두 비어 있지 않을 때, 다음으로 그것들이 올바른지 비교합니다.

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

여기서 `==` 는 “같은지 여부”를 의미합니다.

예를 들면:

```swift
user == userID
```

이것은 사용자가 입력한 사용자 이름이 우리가 설정한 올바른 사용자 이름과 완전히 같은지 여부를 뜻합니다. 비밀번호 확인도 같은 로직을 따릅니다.

따라서 입력한 사용자 이름과 비밀번호가 설정한 값과 같으면 `Success` 를 출력하고, 둘 중 하나라도 다르면 `Input error` 를 출력합니다.

이렇게 해서 간단한 “모의 로그인 검증”을 완성할 수 있습니다.

아직은 서버에 연결된 실제 로그인 기능은 아니지만, 이것만으로도 우리가 다음을 이해하는 데 충분합니다. **버튼을 탭한 뒤에는 서로 다른 조건에 따라 서로 다른 코드가 실행될 수 있다**는 것입니다.

## 요약

이번 수업에서는 기본적인 로그인 뷰를 완성했고, 특히 “조건에 따라 입력 내용을 판단하는 로직”을 중점적으로 배웠습니다.

이번 수업의 핵심 내용은 문자열이 비어 있는지 판단하기 위해 `isEmpty` 를 사용하는 것과, 논리 연산자와 함께 `if` 문을 사용해 다양한 상황을 처리하는 것입니다.

그중에서도 아주 중요한 논리 연산자가 두 가지 있습니다.

- `&&`: “그리고”를 의미하며, 두 조건이 모두 만족되어야 합니다
- `||`: “또는”을 의미하며, 한 조건만 만족해도 됩니다

이 조건들이 최종적으로 `true` 또는 `false` 를 만들면, `if` 문은 그 결과에 따라 서로 다른 코드를 실행합니다.

이 로그인 뷰를 통해 우리는 이미 “화면 + 데이터 + 논리 판단”을 결합하는 개발 방식에 접하기 시작했습니다.

## 전체 코드

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
