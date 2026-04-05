# 登录视图

这节课，我们来学习一个非常实用的场景 —— 登录视图。

无论是网站还是 App，在使用过程中，很多时候都需要用户登录账号并输入密码。

例如，GitHub 登录页面：

![WordPress](../../Resource/019_github.png)

这节课中，我们会制作一个类似的登录视图，让用户手动输入账号和密码，并检查输入内容是否有问题。

## 顶部布局

我们将在 `ContentView` 文件中编写登录视图的代码。

首先，我们来编写登录视图顶部的标识区域，你可以先准备一张合适的图标图片，并把它放到 `Assets` 文件夹中。

![icon](../../Resource/019_icon1.png)

然后，使用 `Image` 和修饰符显示图片：

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

这里的几个修饰符表示：

- `resizable()`：让图片可以调整大小。
- `scaledToFit()`：保持图片原本的比例进行缩放。
- `frame(width: 100)`：设置图片显示宽度为 `100`。

接下来，使用 `Text` 和修饰符显示登录标题：

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

然后，使用 `VStack` 把图片和文字上下排列起来：

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

实现效果：

![view](../../Resource/019_view.png)

到这里，我们就完成了登录视图顶部的标题区域。

### 优化布局

现在，图片和标题默认处于整体布局的中间区域。

如果我们希望它们更像一个“页面顶部的登录标识”，就可以使用 `Spacer()` 把剩余空间撑开，让内容靠近顶部显示。

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

实现效果：

![view](../../Resource/019_view1.png)

不过现在，`Image` 和 `Text` 又离屏幕顶部太近，看起来有些拥挤。

这时，我们可以使用 `padding` 给整个 `VStack` 增加顶部间距。

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

实现效果：

![view](../../Resource/019_view2.png)

这样，页面顶部的标题区域看上去更合适一些。

## 用户名和密码

登录页面通常需要用户输入用户名和密码。

在 SwiftUI 中，我们可以使用 `TextField` 来接收用户输入的内容。

但是要注意：`TextField` 自己不会长期保存输入的数据，它只是一个输入控件。真正保存这些输入内容的，是我们绑定给它的变量。

因此，我们需要先创建两个 `@State` 变量，用来保存用户名和密码：

```swift
@State private var user = ""
@State private var password = ""
```

当 `@State` 变量的值发生变化时，SwiftUI 会自动刷新相关视图。

接下来，使用 `TextField` 绑定这两个变量：

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

这里的 `$user` 和 `$password` 表示“绑定”。

也就是说，当用户在输入框输入文字时，变量会同步发生变化；当变量发生变化时，输入框显示的内容也会同步改变。

这个“视图和数据互相同步”的关系，就是绑定。

注意，这里要使用的是带 `$` 的写法：

```swift
$user
```

因为 `TextField` 需要的不是普通的字符串，而是一个“可以双向修改数据”的绑定值。

### 显示输入框

把它们放到 `ContentView` 中：

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

显示效果：

![view](../../Resource/019_view3.png)

因为现在 `user` 和 `password` 默认都是空字符串：

```swift
""
```

所以输入框中会先显示占位文字，例如：

```swift
input user
```

这段文字只是提示用户“这里应该输入什么”，并不是真正的输入内容。

### 优化输入框

现在，输入框已经可以使用了，但默认样式比较简单。

为了让界面更清楚，我们可以在输入框前面添加标题，并对输入框本身做一点简单的样式优化。

例如，先添加一个标题：

```swift
Text("Username")
    .fontWeight(.bold)
```

然后，使用 `HStack` 把标题和输入框放到同一行中：

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

这里使用 `HStack`，是因为我们希望“左边显示标题，右边显示输入框”。

需要注意的是，`TextField` 默认会占用剩余的可用空间。

![color](../../Resource/019_view6.png)

为了让两个输入框的大小更统一，我们可以使用 `frame(width:)` 为它设置一个宽度，让输入框看起来更整齐。

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

再添加一个边框，让输入框更明显一些：

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

现在，我们把用户名和密码都加到 `ContentView` 视图上：

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

显示效果：

![view](../../Resource/019_view4.png)

到这里，用户就可以输入用户名和密码了。

## 登录按钮

下面，我们在输入框底部添加一个登录按钮。

```swift
Button("Sign in") {

}
```

然后，使用 `buttonStyle` 给按钮添加更明显的系统样式：

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

显示效果：

![view](../../Resource/019_view5.png)

为了确认按钮是否真的能响应点击，我们可以先在按钮中写一个 `print` 来测试：

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

当点击按钮时，控制台会输出：

```swift
click Sign in
```

这说明按钮已经成功响应了点击操作。

## 登录逻辑

现在，我们给登录按钮添加一个最基础的校验逻辑：**检测用户是否输入用户名和密码**。

我们希望实现下面几种情况：

- 如果用户什么都没有输入，输出 `Empty`
- 如果用户只输入了其中一项，提示缺少哪一项
- 如果用户名和密码都输入了，输出 `Success`

### 没有输入任何信息

因为 `user` 和 `password` 默认都是空字符串：

```swift
@State private var user = ""
@State private var password = ""
```

所以当用户什么都没输入时，它们仍然是空的。

在 Swift 中，像 `String` 这样的类型可以使用 `isEmpty` 来判断内容是否为空。

### isEmpty 属性

`isEmpty` 常用于检查字符串、数组等内容是否为空。

例如：

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

如果内容为空，`isEmpty` 返回 `true`；如果内容不为空，`isEmpty` 返回 `false`。

因此，我们可以利用它来判断用户名和密码有没有输入内容。

### 使用 isEmpty 检测变量

如果用户没有输入任何信息，那么：

```swift
user.isEmpty // true
password.isEmpty    // true
```

这时，我们可以这样写判断：

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

这段代码表示：如果 `user` 是空的，并且 `password` 也是空的，就输出：

```swift
Empty
```

这里的 `&&` 是逻辑运算符，表示“并且”。

也就是说，左边条件成立，右边条件也成立时，整个判断才成立。

所以，只有当用户名和密码都为空时，这段代码才会执行。

## 用户只填写了一部分

接下来，我们考虑另一种情况：用户只填写了用户名，或者只填写了密码。

例如：

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

这时，用户名不为空，但密码为空。

我们可以继续使用 `isEmpty` 来判断：

### 用户填写账户或密码的情况

如果用户只填写了用户名或者密码，我们需要给出对应的缺失提示。

例如，用户只填写了用户名：

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

这段代码的逻辑是：如果用户名为空，提示填写用户名。否则，检查密码是否为空，如果密码为空，提示填写密码。

### 用户填写了全部信息

如果用户名和密码都已经输入，那么它们的 `isEmpty` 都会返回 `false`。

这时，我们可以写成：

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

这里的 `!` 表示“取反”。

例如：

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

也就是说，`user.isEmpty` 用来判断“用户名是否为空”，`!user.isEmpty` 用来判断“用户名是否不为空”。

密码也是同样的逻辑。

所以，这段代码的含义是：用户名不为空，并且密码也不为空。

当这两个条件都成立时，输出：

```swift
Success
```

## 完整校验逻辑

现在，我们把这三种情况组合起来，写进 `Button` 中：

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

这段代码的执行顺序可以这样理解：

第一步，先判断：

```swift
if user.isEmpty && password.isEmpty
```

如果用户名和密码都为空，就直接输出 `Empty`。

如果都不为空，就继续判断下面这一句：

```swift
else if user.isEmpty || password.isEmpty
```

这里的 `||` 表示“或者”。

也就是说，只要有一个条件成立，整体就成立。

因此，只要用户名为空，或者密码为空，就会执行 `else if` 的代码块。

进入代码块后，再进一步判断到底是哪个输入框没有填：

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

如果前面两个条件都不成立，就说明用户名不为空，密码也不为空。

那么程序就会进入最后的 `else`：

```swift
print("Success")
```

这样，我们就完成了最基础的登录输入校验逻辑。

## 用户名和密码校验

上面的逻辑只是检查“有没有输入内容”。

但在真实的 App 中，仅仅输入内容还不够。通常还需要把用户名和密码发送到服务器进行验证。

如果服务器确认用户名存在，并且密码正确，就允许登录；否则，提示登录失败。

为了练习这个过程，我们可以先在代码里设置一个临时账号和密码，模拟“正确的登录信息”：

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

当用户名和密码都不为空时，再比较它们是否正确：

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

这里的 `==` 表示“是否相等”。

例如：

```swift
user == userID
```

意思是，用户输入的用户名，是否和我们设定的正确用户名完全一致，密码判断也是这个逻辑。

因此，当输入的用户名和密码和设定值相等时，输出 `Success`；只要有一个不相等，就输出 `Input error`。

这样，我们就完成了一个简单的“模拟登录验证”。

虽然它还不是真正连接服务器的登录功能，但已经足够帮助我们理解：**按钮点击后，可以根据不同条件，执行不同的代码**。

## 总结

这节课，我们完成了一个基础的登录视图，并重点学习了“根据条件判断输入内容的逻辑”。

这节课的核心内容是：使用 `isEmpty` 判断字符串是否为空，以及 `if` 语句配合逻辑运算符来处理不同情况。

其中两个很重要的逻辑运算符是：

- `&&`：表示“并且”，两个条件都要满足
- `||`：表示“或者”，只要有一个条件满足即可

当这些条件最终得到 `true` 或 `false` 后，`if` 语句就会根据结果执行不同的代码。

通过这个登录视图，我们已经开始接触“界面 + 数据 + 逻辑判断”三者结合的开发方式。

## 完整代码

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
