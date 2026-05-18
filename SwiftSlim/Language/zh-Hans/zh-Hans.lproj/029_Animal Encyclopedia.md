# 动物百科 

这节课，我们继续练习自定义视图和数据传递。

我们要制作一个简单的动物百科视图。页面中会显示五个动物，当点击某个动物时，会弹出一个详情视图，显示这个动物的图片、分布区域、栖息地和描述。

实现效果：

![view](../../../Resource/029_view.png)

通过这个案例，我们可以练习数据结构、列表显示、点击交互和 Sheet 弹出视图之间的配合。

## 准备图片素材

首先，我们需要准备五张动物图片：

- 海豚：`dolphin.jpg`
- 长颈鹿：`giraffe.jpg`
- 狮子：`lion.jpg`
- 熊猫：`panda.jpg`
- 北极熊：`polarBear.jpg`

可以使用下面这些图片素材：

[海豚](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[长颈鹿](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[狮子](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[熊猫](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[北极熊](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

下载图片后，将图片拖入 Xcode 项目的 `Assets` 资源文件夹中。

![assets](../../../Resource/029_assets.png)

需要注意的是，在代码中使用图片时，通常不需要写 `.jpg` 后缀。

例如，图片资源名称是 `dolphin`，代码中就写：

```swift
Image("dolphin")
```

如果图片名称写错，图片就无法正常显示。

注：上述图片素材来自维基媒体项目，使用时建议保留原图链接和来源信息。

## 创建动物结构

在这个页面中，每一只动物都有多项信息：

- 动物名称
- 动物图片
- 动物表情符号
- 分布区域
- 栖息地
- 动物描述

如果我们把这些信息分散成很多变量，代码会比较混乱。因此，我们可以创建一个 `Animal` 结构，把一只动物的信息放在一起。

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

在这段代码中：

- `id`：动物的唯一标识。
- `name`：动物名称。
- `imageName`：动物图片名称。
- `avatarEmoji`：动物表情符号。
- `distributionArea`：分布区域。
- `habitat`：栖息地。
- `animalDescription`：动物描述。

其中：

```swift
let id = UUID()
```

`id` 用来标识每一只动物。因为后面我们会使用 `ForEach` 显示动物列表，并且还会使用 `.sheet(item:)` 根据选中的动物弹出详情，所以需要让 `Animal` 遵循 `Identifiable` 协议。

`Identifiable` 的作用是告诉 SwiftUI：每一只动物都有一个可以区分身份的 `id`。

## 创建动物数据

接着，我们在 `ContentView` 中创建一个动物数组。

数组中保存五个 `Animal`，每一个 `Animal` 都表示一只动物。

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // 海豚
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // 长颈鹿
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // 狮子
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // 熊猫
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // 北极熊
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
        Text("Animal Encyclopedia")
    }
}
```

这里的 `animals` 是一个数组：

```swift
let animals: [Animal]
```

`[Animal]` 表示这个数组中保存的是多个 `Animal`。

也就是说，`animals` 不是一只动物，而是一组动物。

## 显示动物列表

现在，我们可以使用 `ForEach` 显示动物列表。

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

显示效果：

![view](../../../Resource/029_view1.png)

在这段代码中：

```swift
ForEach(animals) { animal in
    ...
}
```

表示遍历 `animals` 数组。

每次循环时，`animal` 表示当前正在显示的那一只动物。

例如，第一次循环时，`animal` 是海豚；第二次循环时，`animal` 是长颈鹿。

所以，我们可以通过下面的方式显示当前动物的信息：

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

这样，就可以把五只动物显示出来。

## 让动物列表可以点击

现在列表已经显示出来了，但是还不能点击。

如果希望点击某只动物后弹出详情，我们需要先记录“当前选中的动物”。

因此，在 `ContentView` 中添加一个状态变量：

```swift
@State private var selectedAnimal: Animal? = nil
```

这里的 `selectedAnimal` 是一个可选值类型 `Animal?`。

表示它可能有一只动物，也可能没有动物。

默认值是 `nil`，表示一开始没有选中任何动物。

然后，我们把每一行动物改成 `Button`：

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

重点是这一行代码：

```swift
selectedAnimal = animal
```

当用户点击某一只动物时，我们就把这只动物保存到 `selectedAnimal` 中。

例如，用户点击海豚，`selectedAnimal` 保存的就是海豚。

用户点击熊猫，`selectedAnimal` 保存的就是熊猫。

也就是说，`selectedAnimal` 用来记录用户当前点击的是哪一只动物。

## Sheet 弹出视图

现在我们已经可以通过按钮记录“当前点击的动物”了。

接下来，我们需要实现一个弹出视图，用来显示动物详情。

![view](../../../Resource/029_view2.png)

在 SwiftUI 中，可以使用 `Sheet` 实现这种弹出效果。

`Sheet` 可以理解为一个临时弹出的页面。它会显示在当前页面上方，用户查看完内容后，可以向下滑动关闭。

## Sheet 示例

在真正显示动物详情之前，我们先用一个简单的例子理解 `Sheet` 是如何弹出的。

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Show Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet View")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

显示效果：

![view](../../../Resource/029_view3.png)

这段代码中，我们创建了一个布尔值：

```swift
@State private var showSheet = false
```

`showSheet` 默认是 `false`，表示一开始不显示 `Sheet`。

当点击按钮时：

```swift
showSheet.toggle()
```

`toggle()` 表示切换布尔值。

如果原来是 `false`，调用 `toggle()` 后就会变成 `true`。

如果原来是 `true`，调用 `toggle()` 后就会变成 `false`。

所以，点击按钮后，`showSheet` 会从 `false` 变成 `true`。

当 `showSheet` 变成 `true` 时，下面这段代码就会弹出 `Sheet`：

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

这段代码表示：当 `showSheet` 为 `true` 时，弹出一个 `Sheet`，并在 `Sheet` 中显示 `Text("Sheet View")`。

显示效果：

![view](../../../Resource/029_view4.png)

这种写法适合弹出固定内容。

例如，点击按钮后弹出设置页面、说明页面、提示页面等。

### Sheet 显示位置

虽然 `Sheet` 是一个弹出视图，但在 SwiftUI 中，它不是像 `Text()`、`Image()` 那样直接写成一个独立视图，而是作为一个视图修饰符使用。

也就是说，`.sheet(...)` 和 `.font()`、`.padding()`、`.shadow()` 这些修饰符类似，都需要添加到某个视图后面。

例如：

```swift
Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

在这个例子中，`.sheet` 添加到了 `Button` 后面。

当 `showSheet` 变成 `true` 时，SwiftUI 就会弹出 `Sheet`，并显示花括号中的内容：

```swift
Text("Sheet View")
```

不过，在实际开发中，如果一个页面中有多个按钮，通常不会给每个按钮都添加一个 `.sheet`。

更常见的做法是：把 `.sheet` 添加到外层视图后面。

例如：

```swift
VStack {
    Button("Show Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

按钮负责修改 `showSheet`，外层视图负责根据 `showSheet` 是否为 `true` 来弹出 `Sheet`。

## 可选值绑定 Sheet

前面我们学习的写法是：

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

这种写法适合控制一个固定页面的显示和隐藏。

但是在动物百科案例中，我们不只是要知道“是否弹出 `Sheet`”，还要知道“点击的是哪一只动物”。

例如：

用户点击海豚，`Sheet` 中应该显示海豚详情。

用户点击熊猫，`Sheet` 中应该显示熊猫详情。

所以，这里更适合使用另一种 Sheet 写法：

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet 中显示的内容
}
```

在这段代码中，`Sheet` 绑定了一个可选值 `selectedAnimal`。

这里要注意，`item:` 后面写的是 `$selectedAnimal`，不是 `selectedAnimal`。

因为 `Sheet` 不只是读取 `selectedAnimal` 的值，还需要根据它的变化来决定是否弹出。

这段代码可以这样理解：

- 当 `selectedAnimal` 是 `nil` 时，不显示 `Sheet`。
- 当 `selectedAnimal` 有值时，显示 `Sheet`。
- 当 `Sheet` 被关闭时，SwiftUI 会把 `selectedAnimal` 重新变回 `nil`。

SwiftUI 会把 `selectedAnimal` 中保存的动物传给花括号中的 `animal`。

也就是说，`.sheet(item:)` 不只是控制弹出，还会把选中的数据传进 `Sheet`。

## 使用 Sheet 显示动物名称

现在，我们先不要急着创建复杂的详情视图。

为了让代码更容易理解，我们先在 `Sheet` 中显示当前动物的名称。

在 `VStack` 外面添加 `.sheet(item:)`：

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

这里最重要的是这段代码：

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

当 `selectedAnimal` 有值时，`Sheet` 会弹出。

花括号中的 `animal`，就是当前选中的动物。

所以：

```swift
Text(animal.name)
```

会显示当前点击的动物名称。

例如，点击 `Dolphin`，Sheet 中显示 `Dolphin`。

点击 `Panda`，`Sheet` 中显示 `Panda`。

这样，我们就实现了点击不同动物，弹出不同动物名称的效果。

显示动物名称：

![view](../../../Resource/029_view5.png)

不过，动物详情不应该只显示一个名称，还应该显示名称、分布区域、栖息地和描述。

如果把这些代码都写在 `.sheet` 里面，代码会变得很长，不方便阅读。

所以，接下来我们创建一个新的自定义视图，专门负责显示动物详情。

## 创建动物详情视图

接下来，我们创建一个新的自定义视图 `AnimalDetailView`。

这个视图接收一个 `Animal`，并显示动物详情。

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
                    Text("**Distribution Area** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** ：\(animal.habitat)")

                    Divider()

                    Text("**Animal Description** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

显示效果：

![view](../../../Resource/029_view2.png)

这里的重点是：

```swift
var animal: Animal
```

这表示 `AnimalDetailView` 需要从外部接收一只动物。

接收到动物后，详情视图就可以使用这只动物的各种信息：

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

也就是说，`AnimalDetailView` 只负责显示传进来的动物。

### Markdown 加粗文字

在详情视图中，我们写了这样的代码：

```swift
Text("**Habitat:** \(animal.habitat)")
```

这里有两个知识点。

第一，`**Habitat:**` 使用了 `Markdown` 语法。两个星号包住的文字会加粗显示。

第二，`\()` 是字符串插值，可以把变量的值显示到文字中。

这段代码表示先显示加粗的 `Habitat:`，然后显示这只动物的栖息地。

## 在 Sheet 中显示详情视图

创建好 `AnimalDetailView` 后，我们就可以回到 `ContentView`，把 `Sheet` 中原来的名称视图替换成详情视图。

原来是：

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

现在改成：

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

这里的 `animal:` 是 `AnimalDetailView` 的参数名称。

后面的 `animal` 是 `.sheet(item:)` 传进来的当前动物。

也就是把当前点击的动物，传给 `AnimalDetailView` 显示。

完整结构：

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

当用户点击动物时：

```swift
selectedAnimal = animal
```

`selectedAnimal` 从 `nil` 变成具体动物，`Sheet` 检测到 `selectedAnimal` 有值后弹出视图。

`Sheet` 把 `selectedAnimal` 中的动物，传给 `AnimalDetailView` 视图，`AnimalDetailView` 显示动物详情。

这样，我们就实现了点击动物列表，弹出对应动物详情的功能。

## Sheet 两种写法的区别

现在，我们已经使用 `.sheet(item:)` 完成了动物详情视图的显示。

这里可以简单总结一下 `Sheet` 的两种常见写法。

### 第一种是绑定布尔值

```swift
@State private var showSheet = false

Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

这种写法适合弹出固定内容，例如设置页面、说明页面、提示页面等。

`showSheet` 是一个布尔值，只有 `true` 和 `false` 两种状态。

当 `showSheet` 是 `true` 时，`Sheet` 显示。

当 `showSheet` 是 `false` 时，`Sheet` 不显示。

### 第二种是绑定可选值

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

这种写法适合根据选中的数据弹出不同内容。

在本节课中，我们点击不同动物，需要显示不同动物的详情，所以使用 `.sheet(item:)` 更合适。

## 完整代码

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // 动物名称
    let name: String
    
    // 动物图片
    let imageName: String
    
    // 动物标签符号
    let avatarEmoji: String
    
    // 分布区域
    let distributionArea: String
    
    // 栖息地
    let habitat: String
    
    // 动物描述
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // 海豚
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // 长颈鹿
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // 狮子
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // 熊猫
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // 北极熊
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
                    Text("**Distribution Area** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Animal Description** ：\(animal.animalDescription)")
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

## 总结

这节课完成了一个简单的动物百科页面。

我们先用 `Animal` 结构保存动物信息，再用数组保存五只动物，然后使用 `ForEach` 显示动物列表。

当用户点击某只动物时，我们把这只动物保存到 `selectedAnimal` 中：

```swift
selectedAnimal = animal
```

当 `selectedAnimal` 有值时，`.sheet(item:)` 会弹出详情视图，并把选中的动物传给 `AnimalDetailView`。

这节课最重要的不是界面样式，而是理解这条数据传递路线：

```swift
点击动物 → selectedAnimal 保存动物 → Sheet 弹出 → AnimalDetailView 显示详情
```

理解这条路线后，以后就可以制作更多类似功能，例如商品详情、课程详情、文章详情、联系人详情等。
