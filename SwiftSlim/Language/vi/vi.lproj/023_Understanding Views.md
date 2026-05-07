# Hiểu về Views

Trong bài học này, chúng ta quay lại `ContentView` ban đầu.

```swift
struct ContentView: View {
    var body: some View {
        Text("Xin chào, thế giới!")
    }
}
```

Khi lần đầu tiếp xúc với SwiftUI, trong `ContentView` có rất nhiều keywords mà chúng ta chưa hiểu.

Ví dụ như `struct`, `View`, `var`, `body`, `some View` và các keywords khác.

Khi đó, có lẽ chúng ta chỉ biết điều này: **nếu viết code bên trong `body`, content sẽ xuất hiện trên màn hình.**

Bây giờ chúng ta đã học `struct`, variables, methods và protocols, nên có thể hiểu lại đoạn code này và dùng nó để hiểu mối quan hệ giữa các SwiftUI views.

## Xem lại ContentView

Sau khi tạo SwiftUI project, Xcode mặc định sẽ generate một file `ContentView`.

Code ví dụ như sau:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemTên: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Xin chào, thế giới!")
        }
        .padding()
    }
}
```

Có thể hiểu đoạn code này bằng cách chia nó thành nhiều phần.

Trước tiên:

```swift
import SwiftUI
```

Dòng này import framework SwiftUI.

Sau khi import SwiftUI, chúng ta có thể dùng các SwiftUI views như `View`, `Text`, `Image`, `VStack` và `Button`.

## Cấu trúc ContentView

Dòng code này tạo ra một structure:

```swift
struct ContentView: View
```

Trong đó:

```swift
struct ContentView
```

có nghĩa là `ContentView` là một structure.

Ở bài học trước, chúng ta đã học về `struct`. Nó có thể nhóm các fields liên quan lại với nhau, đồng thời có thể chứa properties và methods.

Ví dụ:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Xin chào, thế giới!")
    }
}
```

Trong ví dụ này, `ContentView` chứa ba thứ: `name`, `printName` và `body`.

Nói cách khác, `struct` có thể nhóm các properties, methods và view content liên quan lại với nhau.

![contentView](../../Resource/023_contentVIew.png)

## View là một protocol

Tiếp tục nhìn vào dòng code này:

```swift
struct ContentView: View 
```

`View` sau dấu hai chấm có nghĩa là `ContentView` tuân theo protocol `View`.

Có thể hiểu như sau: nếu `ContentView` muốn trở thành SwiftUI view, nó phải đáp ứng requirements của protocol `View`.

### Protocol Identifiable

When we learned the movie list earlier, we encountered the `Identifiable` protocol.

At that time, we needed to loop through a `Movie` array in `ForEach`, but the `Movie` structure did not have a unique identifier, so it could not be used directly with `ForEach`.

Then we needed to make the `Movie` structure conform to the `Identifiable` protocol, so that it met `ForEach`'s requirement for a unique identifier.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

The `Identifiable` protocol requires: **this type must have an `id` field that identifies itself.**

After `Movie` provides an `id` field, it can satisfy the requirements of `Identifiable`.

Then when we use it in `ForEach`, SwiftUI can recognize each piece of data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protocol View

The `View` protocol works in the same way.

If a type wants to become a SwiftUI view, it needs to conform to the `View` protocol.

The most important requirement of the `View` protocol is to provide a `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Xin chào, thế giới!")
    }
}
```

You can understand the requirement of the `View` protocol like this: **it accepts the SwiftUI view returned by `body`, and `ContentView` displays SwiftUI views through `body`.**

### Điều gì xảy ra nếu không tuân theo View?

If we write this:

```swift
struct ContentView {
}
```

This is just an ordinary structure, not a SwiftUI view.

It will not report an error directly, because an ordinary structure is valid Swift code.

However, if we put it in a preview:

```swift
#Preview {
    ContentView()
}
```

an error will occur.

The reason is: **a preview needs to display a SwiftUI view, but this `ContentView` does not conform to the `View` protocol.**

Therefore, if we want `ContentView` to be displayed on screen, we need to make it conform to the `View` protocol:

```swift
struct ContentView: View {
}
```

At the same time, we must provide `body` as required by the `View` protocol. If there is no `body`, the compiler will still report an error.

The correct way:

```swift
struct ContentView: View {
    var body: some View {
        Text("Xin chào, thế giới!")
    }
}
```

At this point, `ContentView` is a real SwiftUI view that can be displayed.

## body là entry point để hiển thị view

In SwiftUI, `body` is the entry point for a view's content.

```swift
var body: some View {
    Text("Xin chào, thế giới!")
}
```

This can be broken into three parts:

**1. var body**

```swift
var body
```

This defines a variable named `body`.

**2. some View**

```swift
: some View
```

This means that this `body` returns a view.

**3. { ... }**

```swift
{
    Text("Xin chào, thế giới!")
}
```

This represents the displayed view content. In this code, the displayed content is a `Text` view.

In other words, whatever we write inside `body` is what appears on the screen.

Ví dụ:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Tên:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

This code means: **the screen displays vertically arranged content with two text views inside.**

### Không thể tùy ý đổi tên body

It is important to note that the name `body` cannot be changed freely.

If we write:

```swift
struct ContentView: View {
    var content: some View {
        Text("Xin chào, thế giới!")
    }
}
```

This `content` is also a view property, but it cannot replace `body`.

That is because the name required by the `View` protocol is `body`.

## some View là gì?

In SwiftUI, `some View` means returning a specific view, but without writing out the full type of that view.

```swift
var body: some View
```

In other words, `some View` does not mean there is no type. The real type still exists, and the compiler knows this type, but the type may be complex, so Swift allows us to hide it with `some View`.

### some là gì?

In Swift, `some` is a keyword used to declare an opaque type.

An opaque type means: **the return value has a concrete type, and the compiler knows what that concrete type is, but we do not write the concrete type directly.**

Ví dụ:

```swift
func makeView() -> some View {
    Text("Xin chào")
}
```

This means `makeView` returns a concrete type that conforms to the `View` protocol.

### Vì sao cần some?

When learning variables, we learned that: **values in Swift either need an explicit type annotation, or the compiler must infer their type automatically.**

Ví dụ:

```swift
let a: Int = 10
```

Here, the constant `a` is of type `Int`.

SwiftUI views are no exception. When we use `body` to display a SwiftUI view, `body` needs to return the corresponding SwiftUI type.

For example, if we use `body` to display a `Text` view, we need `body` to return the corresponding `Text` type.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

In this example, the view displayed inside `body` is a `Text` view, and the return type is also `Text`.

Only when the internal type matches the declared type does it satisfy the compiler's type consistency requirement.

**Vấn đề type mismatch**

If we set the type of `body` to `Color`, but display `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

the type of `body` and the type of the internal code do not match, so a type mismatch error occurs.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

At this point, we need to manually change the return type of `body`.

**Các view type phức tạp**

In real development, an interface usually does not contain only one `Text`.

If we need to display a more complex `VStack`, we would need to manually write a complex return type.

Ví dụ:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemTên: "globe")
        Text("Xin chào, thế giới!")
    }
}
```

This code returns a `VStack`, and inside the `VStack` are views of type `Image` and `Text`.

The return type of `body` is:

```swift
VStack<TupleView<(Image,Text)>>
```

As you can see, this return type is very complex, and it also introduces `TupleView`, which we have not seen before.

Here, `TupleView` can be understood as: **wrapping multiple child views into one view.**

**Các view type còn phức tạp hơn**

If we add modifiers to the view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemTên: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Xin chào, thế giới!")
    }
    .padding()
}
```

then the return type of this view becomes very complex and cannot be described in detail here.

The existing return type `VStack<TupleView<(Image,Text)>>` can no longer describe the modifiers, so an error occurs.

**some View đơn giản hóa return type**

For this situation, SwiftUI provides a concise solution: use `some View` to simplify the code.

When we change `body` to the type `some View`:

```swift
var body: some View {
    VStack {
        Image(systemTên: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Xin chào, thế giới!")
    }
    .padding()
}
```

we no longer need to write the full return type every time we modify the view code.

This is because `some View` means returning a concrete view that conforms to the `View` protocol.

In other words, SwiftUI views such as `VStack` and `Image` all conform to the `View` protocol. After modifiers are added, the returned view type still conforms to the `View` protocol.

So they can all be returned as `some View`.

### some View không thể tùy ý return bất kỳ view nào

Although `some View` can hide complex types, it is not "typeless".

Its core rule is: **the compiler must be able to determine one concrete return type**.

Ví dụ:

```swift
var title: some View {
    Text("Xin chào")
}
```

This returns a `Text` view.

However, if we try to return two views, an error occurs:

```swift
var title: some View {
    Text("Xin chào")
    Image(systemTên: "star")
}
```

That is because `some View` ultimately needs to return one view structure, but here we are trying to return two independent views.

### Giải pháp

There are usually two solutions: a container and `@ViewBuilder`.

**1. Bọc bằng container**

```swift
var title: some View {
    VStack {
        Text("Xin chào")
        Image(systemTên: "star")
    }
}
```

In this code, `title` returns a `VStack`, while `Text` and `Image` are child views inside the `VStack`.

The view structure accepted by `some View` is `VStack<...>`, which satisfies the requirement that `some View` returns one view structure. 

This is also why, from the beginning of learning SwiftUI, we recommend wrapping view code in an outer `VStack` container.

**2. Dùng @ViewBuilder**

We can also add the `@ViewBuilder` modifier before `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Xin chào")
    Image(systemTên: "star")
}
```

`@ViewBuilder` can combine multiple views into one return result.

Its essence is still to merge multiple views into one view, satisfying the requirement that `some View` returns one view structure.

### Vì sao body có thể trực tiếp chứa nhiều views?

If we write multiple views inside `var body`, for example:

```swift
var body: some View {
    Image(systemTên: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Xin chào, thế giới!")
}
```

in some cases, this `body` will not report an error.

The reason is that `body` in the `View` protocol supports `@ViewBuilder` by default:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

In the source code of the `View` protocol, we can see that `@ViewBuilder` already modifies the `body` variable.

Therefore, compared with an ordinary `some View`, `body` has an extra layer of special handling, so SwiftUI automatically helps us combine multiple views into one view.

**Ưu tiên dùng containers**

To make it easier for beginners to understand, it is recommended to first use containers such as `VStack`, `HStack`, `ZStack`, and `Group` to organize multiple views.

Ví dụ:

```swift
var body: some View {
    VStack {
        Text("Xin chào")
        Image(systemTên: "star")
    }
}
```

This makes the code more intuitive: **the outer layer is a `VStack`, and inside it are two child views.**

## Tách views

If the interface is simple, we can write all the code inside `body`.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Chào mừng đến với Qinote")
                Text("Chào buổi sáng")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Bấm vào tôi") {
                print("Bấm vào tôi ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

The display style of this view:

![view](../../Resource/023_view1.png)

This code can run normally, but if the view code becomes very complex, the code inside `body` becomes longer and longer, making it increasingly difficult to read and modify.

At this point, we can split different areas into independent view properties.

### Tách view phía trên

For example, split out the top area:

```swift
var topTrang chủ: some View {
    HStack {
        Text("Trang chủ")
            .font(.largeTitle)
        Spacer()
        Image(systemTên: "bell")
    }
}
```

Here, `topTrang chủ` is a variable that returns a view.

Because it returns a view, its type can be written as:

```swift
some View
```

This is essentially the same usage as `body`:

```swift
var topTrang chủ: some View { }
var body: some View { }
```

Both use variables to display views, and both have the return type `some View`.

### Tách các views khác

Then continue splitting other parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Chào mừng đến với Qinote")
        Text("Chào buổi sáng")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Bấm vào tôi") {
        print("Bấm vào tôi")
    }
    .buttonStyle(.borderedProminent)
}
```

After splitting, we can put the view variables into `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Trang chủ")
                .font(.largeTitle)
            Spacer()
            Image(systemTên: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Chào mừng đến với Qinote")
            Text("Chào buổi sáng")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Bấm vào tôi") {
            print("Bấm vào tôi")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Now `body` is only responsible for describing the page structure:

```swift
topBar
welcomeText
colorList
clickButton
```

The specific implementation of each part is placed in the corresponding property below.

This way of splitting views can make the page structure clearer. Each view area has its own name, making the code easier to read.

When modifying a certain part of the code, we can directly find the corresponding view area instead of searching through a pile of complex code.

### some View return một view duy nhất

In this split view, if we try to return multiple views:

```swift
var topBar: some View {
    Text("Trang chủ")
        .font(.largeTitle)
    Spacer()
    Image(systemTên: "bell")
}
```

an error occurs because `some View` can only return one view structure.

Unlike `body`, ordinary computed properties do not have `@ViewBuilder` by default.

Therefore, if we need to return multiple views, we can use a `VStack`, `HStack`, or `Group` container to combine multiple views into one.

```swift
var topBar: some View {
    VStack {
        Text("Trang chủ")
            .font(.largeTitle)
        Spacer()
        Image(systemTên: "bell")
    }
}
```

Or add `@ViewBuilder` to combine views:

```swift
@ViewBuilder
var topBar: some View {
    Text("Trang chủ")
        .font(.largeTitle)
    Spacer()
    Image(systemTên: "bell")
}
```

This lets us return multiple views.

### if return nhiều views

Ví dụ:

```swift
var topTrang chủ: some View {
    if step == "Trang chủ" {
        HStack {
            Text("Trang chủ")
                .font(.largeTitle)
            Spacer()
            Image(systemTên: "bell")
        }
    } else {
        Text("Không có")
    }
}
```

In this code, `topTrang chủ` returns either `HStack` or `Text` depending on the content of `step`, which are two different view types.

Because `some View` requires one definite concrete return type, the two branches of `if` in an ordinary computed property cannot directly return different view types, so an error occurs.

**Giải pháp vẫn là bọc chúng bằng container hoặc dùng `@ViewBuilder`.**

### Vì sao views được tách không dùng dấu ngoặc

When using split-out view properties inside `body`, we write them directly:

```swift
topBar
welcomeText
colorList
clickButton
```

instead of:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

This is because `topBar`, `welcomeText`, `colorList`, and `clickButton` are variables. More precisely, they are computed properties, not methods.

**Thuộc tính không cần dấu ngoặc.**

If we write it as a method, we can achieve a similar effect:

```swift
func topBar() -> some View {
    HStack {
        Text("Trang chủ")
            .font(.largeTitle)
        Spacer()
        Image(systemTên: "bell")
    }
}
```

This code can also achieve a similar effect. Calling this method returns a view.

When using it, we need to write:

```swift
topBar()
```

In SwiftUI, if we are only splitting out a view that does not need parameters, using a computed property is more common.

```swift
var topBar: some View { ... }
```

## Views lồng nhau

Besides splitting code into properties, we can also create new view structures.

Ví dụ:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

This `PinkColorView`, like `ContentView`, is an independent SwiftUI view.

If we need to display it in `ContentView`, we can add `()` after the view name.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Here:

```swift
PinkColorView()
```

means creating a `PinkColorView` instance.

Because `PinkColorView` conforms to the `View` protocol, it can be placed in other views and displayed just like `Text`, `Image`, and `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

This is view nesting: one view can be displayed inside another view.

## View property hay view mới?

When the view code is simple, we usually do not need to split it. Only when the code becomes more complex is it recommended to split views.

### Khi nào dùng view properties

If it is only a small piece of content in the current view, we can use a view property.

Ví dụ:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

These pieces of content are usually only used in the current view.

### Khi nào tạo view mới

If the content is relatively independent, or may be reused across multiple pages in the future, it is more suitable to create a new view.

Ví dụ:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

This is a title view. If we want to use this view as a reusable component in other views.

We can create a new view:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Then use it elsewhere:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

At this point, this view is a reusable independent component.

We can summarize it simply:

- Content areas of the current view can use `var xxx: some View`
- Reusable independent components can be created as a new `struct XxxView: View`
- Components that need data passed in are usually more suitable as new views.

## Tổng kết

In this lesson, we re-understood the most basic and most important view structure in SwiftUI.

`ContentView` is a structure. It is defined with `struct` and is used to organize page-related code.

`View` is a protocol. If a structure wants to become a SwiftUI view, it needs to conform to the `View` protocol.

`body` is the content that the `View` protocol requires us to provide, and it determines what this view displays.

`some View` means returning a certain concrete view, without needing to write out its complex full type.

When view code becomes long, we can use `var xxx: some View` to split the view code into several small areas.

When a piece of content is relatively independent or needs to be reused, we can create a new view structure and display it in other views with `XxxView()`.

Simply put, SwiftUI interfaces are composed of views combined together. One page can contain multiple small views, and a small view can also contain other views.
