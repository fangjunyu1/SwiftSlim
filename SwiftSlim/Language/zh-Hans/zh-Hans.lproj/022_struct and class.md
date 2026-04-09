# struct 和 class

上节课，我们刚开始接触 `struct`，定义了一个结构体，还扩展学习了协议、`UUID` 等知识点。

现在，我们对 `struct` 关键字已经有了初步认识，但还不能算真正理解。

这节课，我们继续以 `struct` 为核心内容，并顺便认识一下 `class`。通过这节课的学习，你会更清楚地知道：什么是实例、什么是构造函数，以及为什么我们可以用 `struct` 和 `class` 来组织数据。

## 学生管理系统

例如，我们现在要开发一个学生管理系统。每个学生都有名称、性别、电话、年龄、家庭住址等信息。

这时候，我们就可以把这些信息组合到一起，定义成一个 `Student` 结构体：

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

这里我们使用 `struct` 定义了一个学生类型。

这个 `Student` 结构体中，包含了多个属性：

- `id`：学生的唯一标识
- `name`：学生名称
- `sex`：学生性别
- `phone`：学生电话
- `age`：学生年龄
- `address`：家庭住址

这样一来，原本分散的多个数据，就被组合成了一个完整的“学生”。

这里的 `Student` 还遵循 `Identifiable` 协议，并定义了一个 `id` 字段，方便后续配合 `ForEach` 循环显示数据。

然后，我们可以创建一个学生实例：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

这段代码表示，按照 `Student` 这个结构，可以创建出一个具体的学生数据。

其中，`Student` 是类型，`Student(...)` 表示创建的一个实例。

在 SwiftUI 中，我们可以将这个实例赋值给一个变量，然后显示出来。

例如：

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

这样，我们就可以在视图中，看到这个学生的名字：`Fang Junyu`。

在这里，我们先创建了一个 `Student` 实例，然后把它赋值给 `student` 变量，最后通过 `student.name` 读取其中的属性。

## 什么是实例

当我们刚开始学习 `struct` 时，可能会觉得“实例”这个词很陌生。

但实际上，我们从一开始就在使用实例，只是以前没有特别注意。

例如：

```swift
let name = "Fang Junyu"
```

这里的 `"Fang Junyu"` 是一个字符串值，它本质上就是一个 `String` 类型的实例。

我们也可以写成：

```swift
let name = String("Fang Junyu")
```

这两种写法表达的是同一件事：创建一个 `String` 类型的实例，并把它赋值给变量 `name`。

同样地，`Int` 也是如此：

```swift
let num = 3
```

这里的 `3`，本质上就是一个 `Int` 类型的值，也可以理解为一个 `Int` 实例。

所以，实例并不是只在 `struct` 里才会出现的特殊概念。

无论是 `String`、`Int`、`Double`、`Bool`，还是自定义的 `Student`，它们都可以创建实例。

因此，当我们写：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

本质上和创建 `String`、`Int` 的实例是一样的，只不过 `Student` 是我们自己定义的类型而已。

## 构造函数

当我们创建一个实例时：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

实际上，就是在调用 `Student` 的初始化方法，也就是 `init`。

你可以把构造函数理解为：**创建实例时，负责给属性赋值的入口。**

也就是说，一个实例在真正创建完成之前，通常都要先经过 `init`。

例如，在前面学习 SwiftUI 视图生命周期时，我们写过这样的代码：

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

这里的 `init()` 会在 `ContentView` 实例被创建时执行，而 `onAppear` 则是在视图真正显示到界面上时才执行。也就是说，视图的创建和显示并不是同一时机。

同理，当我们创建 `Student(...)` 时，也就是在调用 `Student` 的构造函数。

### 系统自动生成的构造函数

我们在定义 `Student` 的时候，并没有手动写出 `init`：

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

但是，我们仍然可以直接创建实例：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

为什么在没有构造函数的情况下，可以创建实例呢？

因为对于 `struct` 来说，如果我们没有手动编写构造函数，系统通常会自动帮我们生成一个合适的构造函数。

在初学阶段，可以简单地理解为：Swift 帮我们自动补上了初始化代码。

可以大致理解为，系统会帮我们补出下面的代码：

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

这里要注意一个细节：

```swift
let id = UUID()
```

`id` 已经有默认值了，所以在创建实例时，不需要我们再手动传入 `id`。

也就是说，没有默认值的属性，通常需要在构造函数中传入；已经有默认值的属性，通常可以直接使用原来的默认值。

因此，当我们创建 `Student` 实例时，只需要传入 `name`、`sex`、`phone`、`age` 和 `address`。

### 编译器提示

此外，当我们在 Xcode 中输入 `Student(...)` 时，也能看到系统给出的参数提示。

![student](../../Resource/022_student.png)

这其实也说明：当前这个类型确实存在一个系统自动生成的构造函数。

### 自己编写构造函数

虽然系统可以自动生成构造函数，但有时候，这个默认的初始化方式并不完全符合我们的需求。

例如，我们有一个 `Movie` 结构体：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

按照系统自动生成的构造函数，我们在创建实例时，必须同时传入这三个参数：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

但是，如果我们现在要录入一批老电影，只知道电影名字，不知道导演和评分，就会比较麻烦。

因为我们只能这样写：

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

虽然可以工作，但每次都重复写 `--`，并不方便。

这时，我们就可以编写一个构造函数：

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

这样一来，我们创建老电影时，只需要传入 `name`：

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

这就是自己编写构造函数的意义之一：**让实例的创建方式更符合实际需求。**

### 解析自定义构造函数

我们来看一下刚才这个手写的构造函数：

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

这个代码的含义为，创建 `Movie` 实例时，只要求传入一个 `name` 参数。

然后，构造函数内部会把传入的 `name` 赋值给实例自己的 `name`，给 `director` 和 `rating` 一个默认值 `--`。

这里的 `self` 表示“当前这个实例本身”。

例如：

```swift
self.name = name
```

左边的 `self.name`，表示实例中的属性；右边的 `name`，表示我们传入的参数。

可以简单理解为，把外面传入的值，保存到实例自己的属性中。

当所有属性都完成赋值后，这个实例就创建完成了。

### 构造函数机制

当我们显式声明了一个构造函数后，还会带来一个变化：

系统原本自动生成的那个构造函数，通常就不能直接使用了。

例如：

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

现在我们再这样写：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

编译器就会报错：

```swift
Extra arguments at positions #2, #3 in call
```

意思是：你传入了多余的参数。

为什么会出现这个报错呢？

因为当前这个 `Movie` 结构体里，只有你手动声明的这一种构造函数：

```swift
init(name: String)
```

它只接受一个参数 `name`，并不接受 `director` 和 `rating`。

也就是说，当你手动添加了自己的构造函数后，原本自动生成的那种初始化方式，就不能再直接用了。

如果我们既希望支持“只传入名称”，又希望支持“传入完整信息”，就需要自己再补写一个完整的构造函数：

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

这样，我们就有了两个不同的构造函数。

创建老电影时，可以这样写：

```swift
Movie(name: "The Night of the Hunter")
```

创建信息完整的新电影时，可以这样写：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

这种写法也说明：同一个类型可以拥有多个构造函数，只要它们的参数形式不同即可。

## 什么是重载

这里再补充一个必要知识点。

刚才我们为 `Movie` 写了两个 `init`：

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

这种“同一个函数名，但参数不同”的写法，叫做“重载”。

在这里，两个函数都叫 `init`，但是它们接收的参数不一样，所以 Swift 可以区分你调用的函数。

例如：

```swift
Movie(name: "Days of Heaven")
```

会调用：

```swift
init(name: String)
```

而：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

会调用另一个完整版本的初始化方法。

所以，重载的作用就是：让同一个类型可以根据不同场景，提供不同的创建方式。

## 认识 class

接下来，我们再简单认识一下 `class`。

除了 Swift 中常见的 `struct`，很多编程语言都会使用 `class` 来创建实例，例如 Java、C#、Kotlin 等。

在 Swift 中，`class` 的写法和 `struct` 非常接近。

例如：

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

你会发现，除了关键字从 `struct` 变成了 `class`，其他部分看起来几乎一样。

创建实例的方式也很相似：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

所以，在语法层面，`struct` 和 `class` 确实很像。

### Struct 和 Class 的区别

虽然 `struct` 和 `class` 看起来很像，但它们并不完全相同。

**1. 初始化方式不同**

对于 `struct` 来说，如果没有手动写构造函数，系统通常会自动生成合适的初始化方法。

但对于 `class` 来说，如果有属性还没有默认值，那么通常需要手动编写 `init`，否则就会报错。

例如：

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

这个 `class` 因为没有构造函数，导致属性未被初始化而报错。

编译器会提示类似：

```swift
Class 'Movie' has no initializers
```

所以，在这个例子里，`class` 必须手动编写构造函数。

**2. struct 是值类型，class 是引用类型**

`struct` 是值类型，`class` 是引用类型。

初学阶段，不需要掌握这两个概念，只需要有一个简单的了解即可。

例如，`struct` 更像“复制一份新的值”。

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

这里把 `user1` 赋值给 `user2` 后，相当于复制了一份新的数据，所以修改 `user2`，不会影响 `user1`。

而 `class` 更像“共同指向同一个实例”。

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

这里的 `user1` 和 `user2` 指向的是同一个实例。

现在我们不需要完全理解值类型和引用类型的底层机制，只需要知道 `struct` 更适合保存独立数据，`class` 更适合多个地方共享同一个实例。

## 初学阶段如何选择

对于当前阶段，普通的数据模型优先考虑 `struct`，需要共享、同步修改的数据，再考虑 `class`。

这并不是绝对规则，但对于初学者来讲，是一个足够实用的判断方式。

特别是在 SwiftUI 中，很多时候你会发现，`struct` 已经可以完成大部分工作。

此外，在很多编程资料中，也会把 `class` 创建出来的内容叫做“对象”。初学阶段，你可以先把它理解为实例，不必刻意区分。

## 总结

这节课，我们深入学习了 `struct`，还顺便认识了 `class`，两者都可以用来定义类型。

类型可以创建实例。创建实例时，会调用构造函数，也就是 `init`。

对于 `struct` 来说，如果没有手动编写构造函数，系统通常会自动生成一个合适的构造函数。如果默认的构造函数不满足需求，我们也就有手动编写构造函数。

此外，我们还初步了解了 `struct` 和 `class` 的区别：`struct` 是值类型，`class` 是引用类型。在 SwiftUI 中，初学阶段更常接触的通常是 `struct`。

后面当我们学习视图传值、数据模型和状态管理时，这些内容都会继续用到。
