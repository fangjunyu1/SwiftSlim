# 电影清单

这节课，我们将制作一个电影清单。

![movie](../../Resource/021_movie.png)

清单中会显示每一部电影的海报、名称、导演和评分。

在这个案例中，我们会学习一个非常重要的知识点：`struct` 结构体。它可以帮助我们把一部电影的多个信息组合成一个整体。除此之外，我们还会接触 `UUID()`、`ForEach`、`Divider` 分隔线，以及如何使用自定义对象来管理数据。

这些知识在后面的 SwiftUI 开发中非常常见。学完这节课后，你不仅可以做出一个电影清单，还能开始理解“如何把一组数据显示成界面”。

## 单部电影

我们可以先从单个电影的界面开始制作。

![movie](../../Resource/021_movie1.png)

这个界面的布局主要由两部分组成：左侧是电影海报，右侧是电影介绍。

### 电影海报

左侧显示的是电影海报，我们可以使用 `Image` 来显示图片。

例如：

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

这段代码表示，显示一张名称为 `"The Shawshank Redemption"` 的图片。

这里需要注意，图片名称必须真实存在于 `Assets` 资源文件夹中，否则界面无法正确显示这张图片。

![movie](../../Resource/021_movie2.png)

这几个修饰符的作用分别是：

- `resizable()` 表示图片可以调整大小。
- `scaledToFit()` 表示在缩放时保持原始比例，避免图片被拉伸变形。
- `frame(height: 180)` 表示把图片的高度设置为 180。
- `cornerRadius(10)`，表示给图片设置 10 的圆角。

这样，我们就能得到一张大小合适、带圆角的电影海报图片。

![movie](../../Resource/021_movie3.png)

### 电影介绍

右侧显示的是电影介绍，包括电影名称、导演和评分。

![movie](../../Resource/021_movie4.png)

我们可以使用 `Text` 显示这部分内容：

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

这段代码中，`.font` 表示字体的大小，`.fontWeight` 表示字体的粗细。

为了让“电影名称”、“导演信息”和“评分信息”之间有更清晰的间距，这里在最外层使用了 `VStack`，并设置了：

```swift
spacing: 10
```

这表示这个 `VStack` 内部的每一组内容之间，间距都是 10。

导演和评分之所以各自再使用一个 `VStack` 包裹，是因为它们都属于“标题 + 内容”这样的结构。因此，界面层次会更清楚，也更方便我们后续继续调整样式。

另外，`VStack` 默认是居中对齐。为了让文字整体向左对齐，我们设置：

```swift
alignment: .leading
```

这样电影介绍部分看起来更整齐。

### 分隔线

现在，电影介绍中的内容虽然通过 `spacing` 拉开了距离，但不同内容之间的分界仍然不够明显。

这时，我们可以加入分隔线：

```swift
Divider()
```

例如：

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

这样，电影介绍部分就会多出明显的分隔效果。

![movie](../../Resource/021_movie4.png)

`Divider` 是一个非常简单但很常用的视图，它的作用是把不同内容分隔开。

在 `VStack` 中，`Divider()` 显示为一条横线。

在 `HStack` 中，`Divider()` 显示为一条竖线。

此外，还可以通过 `.frame`、`.background`、`.padding` 等方式，修改 `Divider` 的样式。

例如：

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

这会生成一条蓝色、厚度为 2、左右带有内边距的分隔线。

![divider](../../Resource/021_divider.png)

### 完整界面

最后，我们可以使用 `HStack`，把电影海报和电影介绍左右排列起来。

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

这里的 `HStack(spacing: 20)` 表示左右两个部分之间保留 20 的间距。

需要注意的是，`Divider()` 和前面讲过的 `TextField`、`Slider` 一样，默认会尽量占用可用空间。

因此，我们给右侧介绍部分的外层 `VStack` 设置一个固定宽度：

```swift
.frame(width: 200)
```

这样可以让分隔线和文字区域的宽度保持一致，整体看起来会更整齐。

到这里，我们就完成了“单部电影”的显示界面。

![movie](../../Resource/021_movie1.png)

## 数组保存电影

如果我们要把多部电影按照同样的样式依次显示出来，就意味着每一部电影都要写一遍类似的代码。

例如：

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

这样写的代码虽然可以实现效果，但代码会越来越多，而且维护起来很麻烦。

比如，需要修改所有电影的间距从 `20` 改成 `15`，或者把右侧宽度从 `200` 改成
`220`，就需要手动修改每一段重复的代码。

这显然不是一个高效的方法。

我们前面学过数组，也学过用 `ForEach` 根据数组来重复显示视图。

例如：

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

这种方式很适合处理“只有一个数据”的情况，比如一组图片名称。

但是，一部电影并不只有一个值。它至少包含：

1. 电影海报
2. 电影名称
3. 导演
4. 评分

也就是说，一部电影其实是一组相关的数据，而不是单独的一个字符串。

如果我们只用数组，就只能把这些信息拆开保存：

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

显示时，就要依靠相同的索引来一一对应：

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

这种写法的问题在于，维护成本很高。

因为一部电影的数据被拆散到了多个数组里，只要有一个数组多写了一项、少写了一项，或者顺序不一致，显示结果就会出错。

尤其是在新增或删除电影时，你必须同时修改多个数组，非常容易遗漏。

那么，怎样才能把“电影名称、导演、评分”这些信息组合成一个整体呢？

这就需要使用 `struct`。

## 定义 struct 结构体

在 Swift 中，`struct` 是“结构体”。

你可以把它理解为一种“自定义的数据类型”，它可以把多个相关的字段组合到一起，变成一个整体。

基本用法：

```swift
struct StructName {
	let name: String
}
```

在这个代码中，`struct` 是关键字，用来表示我们正在定义一个结构体。`StructName` 是结构体的名称。

花括号中的内容，是这个结构体包含的字段，每个字段都必须写清楚名称和类型。

通常情况下，`struct` 的名称会使用大写开头的写法，例如 `Movie`、`Student`、`UserInfo`。这是 Swift 中常见的命名习惯。

你可以把 `struct` 简单理解为一个空的包装盒，其中每一个字段，就像包装盒中预留的一个空位置。

当这些位置还没有填写内容时，它只是一个空盒子。只有这些字段都填上合适的值后，它才会变成一个完整的礼盒。

### struct 实例

前面只是定义了结构体本身，相当于准备好了一个包装盒的样式。

我们还需要把具体的内容填进去，才会得到一个真正可以使用的“实例”。

创建实例时，通常会在结构体名称后面加上 `()`：

```swift
StructName(...)
```

小括号中填写的，就是这个结构体需要的字段内容。

例如：

```swift
StructName(name: "Fang Junyu")
```

这段代码表示：按照 `StructName` 这个结构体的格式，创建一个新的实例，并给 `name` 字段赋值 `"Fang Junyu"`。

当我们把需要的字段内容都填写进去后，就相当于把这个包装盒填满。

这时，我们就得到了一个完整的结构体实例。

### 访问 struct 属性

当我们创建好一个实例后，就可以使用“点语法”去访问它内部的属性。

基本写法：

```swift
实例.属性名
```

例如：

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

这里的 `st` 就是一个结构体实例，`st.name` 表示读取这个实例中的 `name` 值。

你可以把这种读取方式理解为：当我们写 `st.name` 时，就像是在读取这个包装盒中某一个位置存放的内容。

这种写法在后面的 SwiftUI 界面中会非常常见。

比如我们有一个学生结构体，里面包含姓名、年龄、班级，那么在界面上显示时，就可以分别读取：

```swift
student.name
student.age
student.className
```

这样做的好处是，数据会更清晰，也更方便管理。

### struct 位置

对于初学者来讲，通常可以把结构体写在 `ContentView` 外面。

例如：

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

这样结构会更清楚，也会更容易阅读。

你会发现，`ContentView` 本身其实也是一个 `struct`。

### Movie 结构体

有了前面的基础，我们就可以定义一个电影结构体：

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

这是一个名称为 `Movie` 的结构体，它由 `name`、`director` 和 `rating` 三个字段组成，分别表示电影名称、导演和评分。

这样一来，一部电影相关的信息，就不再需要拆成多个数组保存，而是可以直接组合成一个整体。

例如，我们可以创建这样一个电影实例：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

这个实例就代表“一部完整的电影数据”。

### 数组保存结构体

前面我们说过，数组只能保存同一种类型。

现在，我们已经有了 `Movie` 这个结构体，那么数组就可以保存多个 `Movie`。

```swift
let lists: [Movie] = []
```

例如：

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

这个 `lists` 数组中，保存的不是字符串，而是多个 `Movie` 实例。

也就是说，数组中的每一个元素，都是一部完整的电影。

这样，当我们需要显示电影清单时，就可以通过 `ForEach` 依次读取每一部电影。

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

这里的 `movie in` 表示，每次循环时，都会从数组中取出一部电影，并把它临时命名为 `movie`。

然后，我们就可以使用：

```swift
movie.name
movie.director
movie.rating
```

分别读取这一部电影的名称、导演和评分，并显示在界面中。

## ForEach 报错

到这里，我们已经完成了电影数组和 ForEach 的基本写法。

不过，直接运行下面这段代码:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

会提示报错：

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

这个报错的意思是，当你写 `id: \.self` 时，SwiftUI 需要把数组中的每个元素本身，当成“唯一标识”来区分。

这种写法适合 `String`、`Int` 这种简单类型，因为它们本身就比较容易区分。

但是 `Movie` 是我们自定义的结构体，`ForEach` 不知道该如何把它本身当成唯一标识，所以就报错了。

要解决这个问题，最常见的方法就是：让 `Movie` 遵循 `Identifiable` 协议。

## 协议

在 Swift 中，协议可以理解为一种“规则”或“要求”。

可以把它理解为国际组织中的协议：如果一个国家想加入某个国际组织，通常需要先满足这个组织提出的一些规则，公开一些数据，并遵守一些共同的规则。只有符合这些条件后，才能加入其中，或者参与某些事务。

协议也是类似的道理。

当一个类型想要遵循某个协议时，就需要满足这个协议规定的内容。只有满足这些要求后，这个类型才能使用对应的功能。

基本写法：

```swift
struct Movie: Identifiable {
    // ...
}
```

这里的 `: Identifiable` 表示：`Movie` 遵循了 `Identifiable` 协议。

如果一个类型遵循多个协议，可以使用逗号隔开：

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

对于 `Identifiable` 来说，它最重要的要求就是：类型中需要有一个可以标识自己的 `id`。

例如：

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

这里的 `id` 就像身份证号一样，用来区分每一部电影。

只要每一部电影的 `id` 都不同，SwiftUI 就可以正确区分数组中的每个元素。

例如：

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

然后在 `ForEach` 中使用：

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

这样就不会报错了。

因为 `Movie` 已经遵循了 `Identifiable`，更常见的写法是直接省略 `id:`：

```swift
ForEach(lists) { movie in
    // ...
}
```

因为 SwiftUI 已经知道要使用 `movie.id` 来区分每一项。

## ForEach 的区分标识

下面，我们将深入理解 `ForEach` 中 `id` 的作用。

例如：

```swift
ForEach(lists, id: \.self)
```

这里表示：使用元素本身作为区分标识。

而：

```swift
ForEach(lists, id: \.id)
```

表示：使用元素的 `id` 字段作为区分标识。

如果某个字段本身可以保证唯一，也可以暂时拿来用。

比如每部电影的名称都不同，那么下面这个写法在当前数据下，也可能正常工作：

```swift
ForEach(lists, id: \.name)
```

但这里有一个隐藏问题：`name` 不一定永远唯一。

假设以后你又添加了一部同名电影，那么 `name` 就不能再准确区分每一个元素了。

这时，虽然代码还能编译，但在视图刷新、更新、插入、删除时，SwiftUI 可能会出现识别错误，导致显示异常。

所以，在需要稳定区分数据的时候，最好还是使用真正唯一的字段，也就是 `id`。

## UUID

虽然手动写 `id: 1`、`id: 2` 这种方式可以解决问题，但仍然有一个风险：可能不小心写出重复的 `id`，唯一标识就会失效。

例如：

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

这样就会出现两个相同的 `id`，唯一标识就失效了。

为了避免手动出错，我们通常会使用 `UUID()`。

在 Swift 中，`UUID()` 会随机生成一个 128 位的标识符。它通常会显示为一长串由字母和数字组成的内容。

例如：

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

这里的 `UUID()`，其实就是创建了一个 `UUID` 类型的实例，你可以把它理解为一个自动生成的“唯一编号”。

因此，每次创建出来的值几乎都不会重复，所以很适合拿来作为 `id` 使用。

我们可以把 `Movie` 修改为：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

这段代码表示，`Movie` 结构体中的 `id` 字段，默认会被赋值为一个新的 `UUID` 实例。

也就是说，每当我们创建一个新的 `Movie` 时，系统都会先自动帮我们生成一个唯一的 `id`。

`id` 已经有了默认值，所以后面再创建 `Movie` 实例时，就不需要再手动填写 `id` 了。

例如：

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

虽然这里没有写 `id`，但实际上这个电影实例仍然拥有自己的 `id`，只是这个值已经由 `UUID()` 自动生成了。

使用这种方式后，我们就不需要再手动为每一个电影填写 `id`，既减少了代码量，也能避免因为重复填写 id 而产生错误。

最后，我们只需要在顶部加上一张 `Banner` 图片，并使用 `ScrollView` 让内容可以滚动显示，就能完成整个电影清单视图。

## 总结

这节课，我们学习了一个非常重要的知识点：`struct`。

通过 `struct`，我们可以把一部电影的多个相关字段组合成一个整体，而不是把名称、导演、评分分别拆到多个数组中保存。

当数据组合完成后，我们就可以使用 `ForEach`，把数组中的每一个电影依次显示到视图中。

同时，我们还理解了 `ForEach` 中“区分标识”的作用，SwiftUI 必须知道如何区分数组中的每一个元素，才能正确显示和更新视图。

因此，我们让 `Movie` 遵循 `Identifiable` 协议，并为它提供一个唯一的 `id`。

为了避免手动填写 `id` 时出错，我们又进一步学习了 `UUID()`，让系统自动生成唯一标识。

学完这节课后，你不仅完成了电影清单，还开始接触 SwiftUI 中的一条重要思路：**先整理数据，再根据数据生成视图。**

## 完整代码

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