# 로그인 상호작용

지난 수업에서는 로그인 뷰를 만들고, 버튼과 판단 로직을 통해 입력 내용에 대한 간단한 검증을 구현했습니다.

이번 수업에서는 지난 수업의 코드를 바탕으로 `SecureField` 비밀번호 입력창, `Alert` 경고창, 그리고 변수에 따라 서로 다른 뷰의 표시를 제어하는 방법을 계속 배워보겠습니다.

이 수업을 통해 로그인 뷰의 기본적인 상호작용 흐름을 더 깊이 이해할 수 있으며, 이것은 많은 앱에서 사용되는 기본 로직이기도 합니다.

## 비밀번호 입력창

지난 수업에서는 비밀번호를 입력하기 위해 `TextField`를 사용했습니다.

하지만 실제 로그인 화면에서는 비밀번호가 보통 직접 표시되지 않고, 점이나 다른 숨김 효과로 표시됩니다. 이렇게 하면 사용자의 개인정보를 보호할 수 있습니다.

SwiftUI에서 비밀번호 입력 전용으로 사용하는 컨트롤은 `SecureField`입니다.

예를 들면:

```swift
SecureField("Password", text: $password)
```

작성 방식은 `TextField`와 매우 비슷하며, 마찬가지로 안내 문구와 바인딩된 변수가 필요합니다.

간단히 이해하면, `SecureField`도 입력창이지만 입력된 내용을 숨겨 준다는 점만 다릅니다.

기존에 비밀번호 입력에 사용하던 `TextField`를 바로 `SecureField`로 바꿀 수 있습니다:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

사용자가 비밀번호를 입력할 때, 화면에는 비밀번호 내용이 직접 표시되지 않습니다.

표시 효과:

![password](../../Resource/020_password.png)

이제 사용자 이름과 비밀번호를 입력하고, 버튼을 클릭한 뒤 입력이 올바른지 판단할 수 있습니다.

### 피드백 메시지 표시

앞에서는 계속 `print`를 사용해 결과를 출력했습니다.

`print`의 내용은 콘솔에만 표시됩니다. 개발자는 Xcode에서 프로그램을 실행할 때 볼 수 있지만, 일반 사용자는 휴대폰에서 이런 메시지를 볼 수 없습니다.

즉, 프로그램이 이미 판단을 완료했더라도 사용자는 입력한 내용이 올바른지 알 수 없습니다.

이럴 때는 화면에 직접 표시되는 안내 방식이 필요합니다.

## Alert 경고창

SwiftUI에서는 `Alert`를 사용해 팝업 안내창을 표시할 수 있습니다.

기본 사용법:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

이 코드는 앞에서 배운 컨트롤보다 조금 더 복잡해 보이지만, 나누어서 이해할 수 있습니다.

`Alert`는 주로 다음 부분으로 구성됩니다:

- `"Title"`: 경고창의 제목
- `isPresented`: 경고창 표시 여부를 제어하는 바인딩된 불리언 값
- `Button(...)`: 경고창의 버튼
- `message:`: 경고창 안에 표시되는 안내 내용

간단히 이해하면, 바인딩된 변수가 `true`가 되면 시스템이 이 안내창을 띄웁니다.

표시 효과:

![alert](../../Resource/020_alert3.png)

대응하는 구조:

![alert](../../Resource/020_alert.png)

### Alert는 modifier입니다

`Alert`도 우리가 앞에서 배운 많은 modifier들과 마찬가지로 어떤 뷰 뒤에 붙습니다.

예를 들어 버튼 뒤에 붙일 수 있습니다:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

또는 바깥쪽 `VStack` 뒤에 붙일 수도 있습니다:

```swift
VStack {
    // ...
}
.alert() {...}
```

즉, `Alert`는 화면 안에 따로 놓이는 독립적인 뷰가 아니라, 특정 뷰에 붙는 하나의 modifier입니다.

간단히 이해하면, `Alert`는 보통 버튼이나 바깥쪽 레이아웃 뒤에 작성하며, 어떤 조건이 만족될 때 안내를 팝업으로 보여 주기 위해 사용합니다.

### Alert 표시하기

`Alert`를 표시하려면 그것을 제어할 변수가 필요합니다.

예를 들어:

```swift
@State private var showAlert = false
```

이 변수는 `Bool` 타입으로, 값은 `true` 또는 `false` 두 가지뿐입니다.

그다음 이것을 `Alert`의 `isPresented`에 바인딩합니다:

```swift
isPresented: $showAlert
```

`showAlert`가 `false`일 때는 경고창이 표시되지 않고, `showAlert`가 `true`일 때 경고창이 나타납니다.

### 버튼으로 경고창 표시하기

이제 가장 간단한 상황부터 구현해 보겠습니다:

사용자가 아무 내용도 입력하지 않은 채 바로 `Sign in` 버튼을 클릭하면, “아직 아무 내용도 입력하지 않았습니다”라고 알려 주는 안내창이 뜨도록 합니다.

먼저, 이 안내창을 제어할 변수를 만듭니다:

```swift
@State private var showEmpty = false
```

그다음 `Button` 뒤에 `Alert`를 추가합니다:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

이어서 버튼 클릭 코드 안에서 조건을 판단합니다:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

만약 `user`와 `password`가 모두 비어 있으면 `showEmpty`를 `true`로 바꿉니다.

그리고 `Alert`가 이 변수에 바인딩되어 있기 때문에, 값이 `true`가 되면 시스템이 자동으로 경고창을 띄웁니다.

표시 효과:

![alert](../../Resource/020_alert1.png)

이렇게 하면 사용자는 버튼을 누른 직후 바로 안내를 볼 수 있고, 개발자가 콘솔에서 `print` 출력을 확인할 필요가 없어집니다.

### 버튼과 경고창 보완하기

앞에서는 “아무것도 입력하지 않은 경우”만 처리했습니다.

우리는 다음 상황들도 처리해야 합니다:

- 사용자 이름을 입력하지 않음
- 비밀번호를 입력하지 않음
- 사용자 이름과 비밀번호를 모두 입력했지만 내용이 틀림

그래서 이런 경우에 맞는 안내도 준비해야 합니다.

먼저 세 개의 새 변수를 추가합니다:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

그다음 버튼 뒤에 대응하는 `Alert`를 계속 추가합니다:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

이어서 버튼 안의 판단 로직을 완성합니다:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

버튼이 사용자가 아무 정보도 입력하지 않았거나, 한 가지 정보를 빠뜨렸거나, 또는 입력 검증에 실패했다고 판단하면, 대응하는 불리언 변수를 `true`로 바꾸고 그에 맞는 `Alert`를 띄우게 됩니다.

여기서는 직접 몇 가지 상황을 테스트해 보는 것을 권장합니다:

- 아무것도 입력하지 않기
- 사용자 이름만 입력하기
- 비밀번호만 입력하기
- 사용자 이름과 비밀번호를 모두 입력하지만 내용이 틀리게 하기
- 사용자 이름과 비밀번호를 모두 입력하고 내용도 올바르게 하기

이렇게 하면 코드에 문제가 있는지 검증할 수 있습니다. 이것은 앱 개발에서 매우 중요한 “테스트” 단계이기도 합니다.

어떤 시나리오에서 프로그램 동작이 올바르지 않다면, 로직에 문제가 있을 수 있고 프로그램에 `Bug`가 생겼다는 뜻입니다.

개발에서 흔히 말하는 `Bug`는 프로그램의 오류, 결함, 또는 기대와 다른 동작을 의미합니다.

## 로그인 뷰 완성하기

앞에서 설명한 `Alert`는 모두 “입력이 잘못되었을 때” 사용자에게 어떻게 안내를 줄 것인가를 다루고 있었습니다.

사용자가 올바른 사용자 이름과 비밀번호를 입력했을 때는, 보통 “경고창”을 띄우지 않고 바로 로그인 이후의 화면으로 들어갑니다.

여기에는 매우 중요한 개념이 하나 있습니다. **변수의 값에 따라 서로 다른 뷰를 표시하는 것**입니다.

예를 들어:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

여기서는 뷰 표시를 관리하기 위해 `Bool` 타입을 사용합니다:

- `login`이 `true`이면 로그인에 성공했다는 뜻이고, 로그인 이후의 내용이 표시됩니다
- `login`이 `false`이면 로그인에 성공하지 않았다는 뜻이고, 로그인 화면이 계속 표시됩니다.

`if` 문은 Swift의 조건문이지만, SwiftUI의 `body` 안에서는 뷰의 표시 로직을 제어하는 데 사용할 수 있습니다.

즉, SwiftUI는 조건의 결과에 따라 지금 어떤 뷰를 보여 주어야 하는지 판단합니다.

이 표시 로직을 현재의 `ContentView` 안에 넣을 수 있습니다:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

여기서는 사용자가 이미 로그인에 성공했는지를 나타내기 위해 `login`이라는 새 변수를 추가했습니다.

그리고 앞에서 작성한 로그인 뷰 코드를 `else` 문 뒤에 넣었습니다.

뷰 표시 로직:

- `login`이 `false`일 때는 아직 로그인에 성공하지 않았다는 뜻이므로, 원래의 로그인 뷰를 계속 표시합니다.
- `login`이 `true`일 때는 로그인 성공을 의미하며, 이때는 로그인 뷰를 더 이상 표시하지 않고 `Login successful`을 표시합니다.

즉, `ContentView`는 `login` 값에 따라 다른 뷰 내용을 표시하게 됩니다.

다음으로 버튼 안의 로그인 성공 로직을 수정해 봅시다:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

사용자가 입력한 사용자 이름과 비밀번호가 모두 올바르면, 우리는 `login`을 `true`로 바꿉니다.

`login` 값이 바뀌는 순간, `ContentView` 안의 `if` 판단 결과도 함께 바뀌고, 화면은 원래의 로그인 뷰에서 `Login successful`로 전환됩니다.

표시 효과는 다음과 같습니다:

![view](../../Resource/020_view.png)

이제 우리는 “조건에 따라 다른 뷰를 표시하는 것”이라는 지식을 실제로 현재 로그인 페이지에 적용한 셈입니다.

실제 앱에서도 보통 이런 방식으로 판단합니다. 즉, 어떤 값에 따라 서로 다른 뷰를 표시하는 방식입니다.

예를 들어, 사용자가 로그인하지 않았을 때는 로그인 페이지를 보여 주고, 로그인에 성공한 뒤에는 다른 화면을 보여 줍니다.

핵심 아이디어는 다음과 같습니다. **변수의 변화를 통해 화면에 무엇을 보여 줄지 제어하는 것**입니다.

## 정리

이번 수업에서는 세 가지 중요한 내용을 배웠습니다:

1. `SecureField`를 사용해 비밀번호를 입력하고, 비밀번호 내용이 화면에 직접 표시되지 않도록 하는 것.
2. `Alert`를 사용해 콘솔 출력만이 아니라 사용자에게 직접 안내 메시지를 보여 주는 것.
3. 변수와 `if` 판단을 사용해 서로 다른 뷰의 표시를 제어하고, 로그인 전후 화면 전환을 구현하는 것.

이러한 지식을 통해 우리는 기본적인 상호작용 효과를 가진 로그인 뷰를 완성할 수 있게 되었고, SwiftUI의 “상태가 바뀌면 화면이 갱신된다”는 개발 사고방식도 더 깊이 이해할 수 있습니다.

## 전체 코드

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## 확장 지식 - 여러 버튼이 있는 Alert

이 수업의 앞부분에서는 가장 기본적인 `Alert`를 사용했는데, 버튼이 하나만 있고 주로 사용자에게 안내를 주는 데 사용되었습니다.

사실 `Alert`에는 여러 개의 버튼을 포함할 수도 있어서, 사용자가 서로 다른 선택을 할 수 있습니다.

예를 들어:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

버튼을 클릭하면 `Ok`, `delete`, `cancel`의 세 가지 선택지가 있는 메시지 박스가 팝업됩니다.

표시 효과:

![alert](../../Resource/020_alert2.png)

서로 다른 버튼을 클릭하면 해당 코드가 실행됩니다.

### Button의 role 속성

여기서 알 수 있듯이, `Alert` 안의 `Button`은 앞에서 배운 일반 버튼 문법과 약간 다릅니다:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

여기에는 추가로 `role`이라는 파라미터가 있습니다.

SwiftUI에서 `role`은 이 버튼이 어떤 종류의 동작에 속하는지를 시스템에 알려 주기 위해 사용됩니다.

대표적인 role은 다음과 같습니다:

- `.cancel`: 취소 동작
- `.destructive`: 삭제 같은 위험한 동작
- `nil`: 일반 동작

서로 다른 `role` 값은 보통 인터페이스의 시각적 스타일에도 차이를 가져옵니다.

예를 들어, 위험한 동작은 종종 더 눈에 띄는 스타일로 표시되어 사용자가 신중하게 클릭하도록 알려 줍니다.

또한 `role`은 버튼에 추가적인 의미 정보를 제공하기 때문에, 화면 읽기 도구(예: Apple 기기의 VoiceOver)가 사용자에게 버튼의 역할을 설명하기 더 쉬워집니다.

따라서 적절한 상황에서 버튼에 `role`을 추가하는 것은 매우 좋은 습관입니다.
