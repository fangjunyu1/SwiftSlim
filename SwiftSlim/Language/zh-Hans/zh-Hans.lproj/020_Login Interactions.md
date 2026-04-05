# 登录交互

上一节课，我们制作了一个登录视图，并通过按钮和判断逻辑，实现了对输入内容的简单校验。

这节课，我们继续以上一节课的代码为基础，学习 `SecureField` 密码输入框、`Alert` 警告框，以及如何根据变量控制不同视图的显示。

通过这节课，你可以进一步理解登录视图的基本交互流程，这也是很多 App 中都会用到的基础逻辑。

## 密码输入框

上节课，我们使用 `TextField` 来输入密码。

但是在真实的登录界面里，密码通常不会直接显示出来，而是会显示成圆点或其他隐藏效果，这样可以保护用户的隐私。

在 SwiftUI 中，专门用于输入密码的控件是 `SecureField`。

例如：

```swift
SecureField("Password", text: $password)
```

它的写法和 `TextField` 很像，同样需要一个提示文字，以及一个绑定的变量。

可以简单的理解为：`SecureField` 也是一个输入框，只不过它会把输入的内容隐藏起来。

我们可以直接把原来输入密码用的 `TextField` 改成 `SecureField`：

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

当用户输入密码时，界面上就不会直接显示密码内容了。

显示效果：

![password](../../Resource/020_password.png)

现在，我们可以输入用户名和密码，点击按钮后判断输入是否正确。

### 显示反馈提示

我们在前面一直使用 `print` 输出结果。

`print` 的内容只会显示在控制台中，开发者在 Xcode 里运行程序时可以看到， 但普通用户在手机上是看不到这些提示的。

也就是说，虽然程序已经完成了判断，但用户并不知道输入内容是否正确。

这时候，就需要一种能直接显示在界面上的提示方式。

## Alert 警告框

在 SwiftUI 中，我们可以使用 `Alert` 来弹出提示框。

基本用法：

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

这段代码看起来比前面的控件复杂一些，我们可以拆开理解。

`Alert` 主要包含下面几个部分：

- `"Title"`：警告框的标题
- `isPresented`：一个绑定的布尔值，用来控制警告框是否显示
- `Button(...)`：警告框的按钮
- `message:`：警告框中显示的提示内容

可以简单地理解为，当绑定的变量变成 `true` 时，系统就会弹出这个提示框。

显示效果：

![alert](../../Resource/020_alert3.png)

对应结构：

![alert](../../Resource/020_alert.png)

### Alert 是修饰符

`Alert` 和我们前面学过的很多修饰符一样，也是加在某个视图后面。

例如，它可以修饰在按钮后面：

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

也可以修饰在外层的 `VStack` 后面：

```swift
VStack {
    // ...
}
.alert() {...}
```

也就是说，`Alert` 不是单独摆在界面里的视图，而是依附在某个视图上的一个修饰符。

可以简单的理解为，`Alert` 一般写在按钮或者外层布局后面，用来在某个条件满足时弹出提示。

### 显示 Alert

如果想要显示 `Alert`，就需要一个变量来控制它。

例如：

```swift
@State private var showAlert = false
```

这个变量是 `Bool` 类型，也就是只有两个值：`true` 或 `false`。

然后把它绑定给 `Alert` 的 `isPresented`：

```swift
isPresented: $showAlert
```

当 `showAlert` 是 `false` 时，警告框不会显示；当 `showAlert` 是 `true` 时，弹出警告框。

### 通过按钮显示警告框

现在，先来实现一个最简单的场景：

当用户什么都没有输入，就直接点击 `Sign in` 按钮时，弹出一个提示框告诉他“你还没有输入内容”。

首先，创建一个变量来控制这个提示框：

```swift
@State private var showEmpty = false
```

然后，在 `Button` 后面添加一个 `Alert`：

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

接着，在按钮点击的代码里进行判断：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

如果 `user` 和 `password` 都是空的，就把 `showEmpty` 改成 `true`。

而 `Alert` 又绑定了这个变量，所以当它变成 `true` 时，系统就会自动弹出提示框。

显示效果：

![alert](../../Resource/020_alert1.png)

这样，用户点击按钮后，就能立刻看到提示，而不需要开发者去控制台里查看 `print` 输出。

### 完善按钮和警告框

前面，我们只处理了“什么都没填写”的情况。

我们还需要处理下面几种情况：

- 用户名没填
- 密码没填
- 用户名和密码都填写了，但输入错误

所以，我们还需要为这些情况准备对应的提示。

首先，新增三个变量：

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

然后继续在按钮后面添加对应的 `Alert`：

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

接着，完善按钮中的判断逻辑：

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

当按钮判断用户没有填写任何信息、漏填了一项信息，或者输入校验失败时，就会把对应的布尔变量改为 `true`，然后弹出对应的 `Alert`。

这里建议你自己测试几种情况：

- 什么都不填
- 只填写用户名
- 只填写密码
- 用户名和密码都填写，但内容错误
- 用户名和密码都填写，并且内容正确

以验证我们的代码是否存在问题，这也是 App 开发中非常重要的“测试”环节。

如果某个场景下程序表现不对，就说明逻辑中可能存在问题，程序中出现了 `Bug`。

开发中常说的 `Bug`，就是指程序中的错误、漏洞，或者不符合预期的行为。

## 完成登录视图

前面讲的 `Alert`，都是在处理“输入错误”时如何给用户提示。

当用户输入正确的用户名和密码，我们通常不会弹出“警告框”，而是直接进入登录后的界面。

这里涉及到一个非常重要的知识点：**根据变量的值，显示不同的视图。**

例如：

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

在这里，我们使用 `Bool` 类型管理视图的显示：

- 如果 `login` 是 `true`，表示已经登录成功，显示登录后的内容
- 如果 `login` 是 `false`，说明没有登录成功，继续显示登录界面。

虽然 `if` 语句是 Swift 的条件判断语句，但在 SwiftUI 的 `body` 中，它可以用来控制视图的显示逻辑。

也就是说，SwiftUI 会根据条件的结果，判断当前应该显示哪一个视图。

我们可以把这个显示逻辑，放到当前的 `ContentView` 中：

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// 原来登录视图的代码
		}
	}
}
```

这里，我们新增了一个 `login` 变量，用来表示用户是否已经登录成功。

然后，把前面已经写好的登录视图代码，放到 `else` 语句后面。

视图显示逻辑：

- 当 `login` 为 `false` 时，表示还没有登录成功，继续显示原来的登录视图。
- 当 `login` 为 `true`，表示登录成功，此时不再显示登录视图，而是显示 `Login successful`。

也就是说，`ContentView` 会根据 `login` 的值不同，显示不同的视图内容。

接下来，我们再修改按钮中的登录成功逻辑：

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

当用户输入的用户名和密码都正确时，我们就把 `login` 改为 `true`。

一旦 `login` 的值发生变化，`ContentView` 中的 `if` 判断结果也会跟着改变，界面就会从原来的登录视图，切换成 `Login successful`。

显示效果如下：

![view](../../Resource/020_view.png)

现在，我们就把“根据条件判断显示不同视图”的知识，真正用到了当前这个登录页面中。

在实际的 App 中，通常也是这种判断方式，根据某一个值显示不同的视图。

例如，用户没有登录时，显示登录页；用户登录成功后，就显示另一个界面。

核心思路就是：**通过变量的变化，控制界面显示什么内容。**

## 总结

这节课，我们学习了三个重要内容：

1. 使用 `SecureField` 输入密码，让密码内容不会直接显示在界面上。
2. 使用 `Alert` 向用户显示提示信息，而不是只在控制台上输出。
3. 使用变量和 `if` 判断控制不同视图的显示，实现登录前和登录后的界面切换。

通过这些知识的学习，我们已经能够完成一个具备基础交互效果的登录视图，并进一步理解 SwiftUI 中“状态改变，界面更新”的开发思路。

## 完整代码

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

## 扩展知识 - 多个按钮的 Alert

前面这节课中，我们使用的是最基础的 `Alert`，只有一个按钮，主要用来提示用户。

其实，`Alert` 还可以包含多个按钮，让用户做出不同选择。

例如：

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

当点击按钮后，会弹出一个带有三个选项的提示框：`Ok`、`delete` 和 `cancel`。

显示效果：

![alert](../../Resource/020_alert2.png)

点击不同按钮时，会执行对应的代码。

### Button 的 role 属性

这里你会发现，`Alert` 中的 `Button` 和我们前面学习的普通按钮写法有一点不同：

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

这里多了一个 `role` 参数。

在 SwiftUI 中，`role` 用来告诉系统：这个按钮属于什么类型的操作。

常见的几种角色有：

- `.cancel`：取消操作
- `.destructive`：危险操作，例如删除
- `nil`：普通操作

不同的 `role`，在界面上的样式通常也会有区别。

例如，危险操作常常会显示为更醒目的样式，提醒用户要谨慎点击。

此外，`role` 还会为按钮提供额外的语义信息，方便屏幕阅读器（例如 Apple 设备上的旁白）提示用户按钮的作用。

所以，在合适的场景下，给按钮添加 `role` 是一个很好的习惯。
