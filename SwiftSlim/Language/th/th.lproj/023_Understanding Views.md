# ทำความเข้าใจมุมมอง

ในบทเรียนนี้ เราจะกลับไปดู `ContentView` ตัวแรกอีกครั้ง

```swift
struct ContentView: View {
    var body: some View {
        Text("สวัสดี โลก!")
    }
}
```

เมื่อเราเพิ่งเริ่มรู้จัก SwiftUI ใน `ContentView` มี keywords หลายตัวที่เรายังไม่เข้าใจ

เช่น `struct`, `View`, `var`, `body`, `some View` และ keywords อื่น ๆ

ตอนนั้นเราอาจรู้เพียงว่า: **ถ้าเขียน code ไว้ใน `body` content ก็จะแสดงบนหน้าจอ**

ตอนนี้เราได้เรียนรู้ `struct`, variables, methods และ protocols แล้ว จึงสามารถกลับมาทำความเข้าใจ code นี้อีกครั้ง และใช้มันเพื่อเข้าใจความสัมพันธ์ระหว่าง SwiftUI views

## กลับมาดู ContentView

หลังจากสร้าง SwiftUI project แล้ว Xcode จะ generate ไฟล์ `ContentView` ให้โดย default

ตัวอย่าง code เป็นดังนี้:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemชื่อ: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("สวัสดี โลก!")
        }
        .padding()
    }
}
```

เราสามารถเข้าใจ code นี้ได้โดยแบ่งออกเป็นหลายส่วน

ก่อนอื่น:

```swift
import SwiftUI
```

บรรทัดนี้ import framework SwiftUI

หลังจาก import SwiftUI แล้ว เราจึงใช้ SwiftUI views เช่น `View`, `Text`, `Image`, `VStack` และ `Button` ได้

## Structure ของ ContentView

code บรรทัดนี้สร้าง structure หนึ่งตัว:

```swift
struct ContentView: View
```

ในนั้น:

```swift
struct ContentView
```

หมายความว่า `ContentView` เป็น structure หนึ่งตัว

ในบทเรียนก่อนหน้า เราเรียนรู้เกี่ยวกับ `struct` แล้ว มันสามารถรวม fields ที่เกี่ยวข้องเข้าด้วยกัน และสามารถมี properties กับ methods ได้

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("สวัสดี โลก!")
    }
}
```

ใน example นี้ `ContentView` มีสามอย่างคือ `name`, `printName` และ `body`

กล่าวอีกอย่างคือ `struct` สามารถรวม properties, methods และ view content ที่เกี่ยวข้องเข้าด้วยกันได้

![contentView](../../Resource/023_contentVIew.png)

## View คือ protocol

ลองดู code บรรทัดนี้ต่อ:

```swift
struct ContentView: View 
```

`View` หลัง colon หมายความว่า `ContentView` conform กับ protocol `View`

สามารถเข้าใจได้แบบนี้: ถ้า `ContentView` ต้องการเป็น SwiftUI view ก็ต้องตรงตาม requirements ของ protocol `View`

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
        Text("สวัสดี โลก!")
    }
}
```

You can understand the requirement of the `View` protocol like this: **it accepts the SwiftUI view returned by `body`, and `ContentView` displays SwiftUI views through `body`.**

### ถ้าไม่ conform กับ View จะเกิดอะไรขึ้น?

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
        Text("สวัสดี โลก!")
    }
}
```

At this point, `ContentView` is a real SwiftUI view that can be displayed.

## body คือ entry point สำหรับแสดง view

In SwiftUI, `body` is the entry point for a view's content.

```swift
var body: some View {
    Text("สวัสดี โลก!")
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
    Text("สวัสดี โลก!")
}
```

This represents the displayed view content. In this code, the displayed content is a `Text` view.

In other words, whatever we write inside `body` is what appears on the screen.

ตัวอย่างเช่น:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("ชื่อ:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

This code means: **the screen displays vertically arranged content with two text views inside.**

### ชื่อ body เปลี่ยนตามใจไม่ได้

It is important to note that the name `body` cannot be changed freely.

If we write:

```swift
struct ContentView: View {
    var content: some View {
        Text("สวัสดี โลก!")
    }
}
```

This `content` is also a view property, but it cannot replace `body`.

That is because the name required by the `View` protocol is `body`.

## some View คืออะไร?

In SwiftUI, `some View` means returning a specific view, but without writing out the full type of that view.

```swift
var body: some View
```

In other words, `some View` does not mean there is no type. The real type still exists, and the compiler knows this type, but the type may be complex, so Swift allows us to hide it with `some View`.

### some คืออะไร?

In Swift, `some` is a keyword used to declare an opaque type.

An opaque type means: **the return value has a concrete type, and the compiler knows what that concrete type is, but we do not write the concrete type directly.**

ตัวอย่างเช่น:

```swift
func makeView() -> some View {
    Text("สวัสดี")
}
```

This means `makeView` returns a concrete type that conforms to the `View` protocol.

### ทำไมต้องใช้ some?

When learning variables, we learned that: **values in Swift either need an explicit type annotation, or the compiler must infer their type automatically.**

ตัวอย่างเช่น:

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

**ปัญหา type mismatch**

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

**View types ที่ซับซ้อน**

In real development, an interface usually does not contain only one `Text`.

If we need to display a more complex `VStack`, we would need to manually write a complex return type.

ตัวอย่างเช่น:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemชื่อ: "globe")
        Text("สวัสดี โลก!")
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

**View types ที่ซับซ้อนยิ่งขึ้น**

If we add modifiers to the view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemชื่อ: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("สวัสดี โลก!")
    }
    .padding()
}
```

then the return type of this view becomes very complex and cannot be described in detail here.

The existing return type `VStack<TupleView<(Image,Text)>>` can no longer describe the modifiers, so an error occurs.

**some View ทำให้ return type ง่ายขึ้น**

For this situation, SwiftUI provides a concise solution: use `some View` to simplify the code.

When we change `body` to the type `some View`:

```swift
var body: some View {
    VStack {
        Image(systemชื่อ: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("สวัสดี โลก!")
    }
    .padding()
}
```

we no longer need to write the full return type every time we modify the view code.

This is because `some View` means returning a concrete view that conforms to the `View` protocol.

In other words, SwiftUI views such as `VStack` and `Image` all conform to the `View` protocol. After modifiers are added, the returned view type still conforms to the `View` protocol.

So they can all be returned as `some View`.

### some View return view ใด ๆ ตามใจไม่ได้

Although `some View` can hide complex types, it is not "typeless".

Its core rule is: **the compiler must be able to determine one concrete return type**.

ตัวอย่างเช่น:

```swift
var title: some View {
    Text("สวัสดี")
}
```

This returns a `Text` view.

However, if we try to return two views, an error occurs:

```swift
var title: some View {
    Text("สวัสดี")
    Image(systemชื่อ: "star")
}
```

That is because `some View` ultimately needs to return one view structure, but here we are trying to return two independent views.

### วิธีแก้

There are usually two solutions: a container and `@ViewBuilder`.

**1. ใช้ container ครอบไว้**

```swift
var title: some View {
    VStack {
        Text("สวัสดี")
        Image(systemชื่อ: "star")
    }
}
```

In this code, `title` returns a `VStack`, while `Text` and `Image` are child views inside the `VStack`.

The view structure accepted by `some View` is `VStack<...>`, which satisfies the requirement that `some View` returns one view structure. 

This is also why, from the beginning of learning SwiftUI, we recommend wrapping view code in an outer `VStack` container.

**2. Use @ViewBuilder**

We can also add the `@ViewBuilder` modifier before `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("สวัสดี")
    Image(systemชื่อ: "star")
}
```

`@ViewBuilder` can combine multiple views into one return result.

Its essence is still to merge multiple views into one view, satisfying the requirement that `some View` returns one view structure.

### ทำไม body จึงมีหลาย views ได้โดยตรง?

If we write multiple views inside `var body`, for example:

```swift
var body: some View {
    Image(systemชื่อ: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("สวัสดี โลก!")
}
```

in some cases, this `body` will not report an error.

The reason is that `body` in the `View` protocol supports `@ViewBuilder` by default:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

In the source code of the `View` protocol, we can see that `@ViewBuilder` already modifies the `body` variable.

Therefore, compared with an ordinary `some View`, `body` has an extra layer of special handling, so SwiftUI automatically helps us combine multiple views into one view.

**แนะนำให้ใช้ containers ก่อน**

To make it easier for beginners to understand, it is recommended to first use containers such as `VStack`, `HStack`, `ZStack`, and `Group` to organize multiple views.

ตัวอย่างเช่น:

```swift
var body: some View {
    VStack {
        Text("สวัสดี")
        Image(systemชื่อ: "star")
    }
}
```

This makes the code more intuitive: **the outer layer is a `VStack`, and inside it are two child views.**

## แยก Views ออกเป็นส่วน ๆ

If the interface is simple, we can write all the code inside `body`.

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("ยินดีต้อนรับสู่ Qinote")
                Text("สวัสดีตอนเช้า")
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
            Button("คลิกฉัน") {
                print("คลิกฉัน ")
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

### แยก view ส่วนบน

For example, split out the top area:

```swift
var topหน้าแรก: some View {
    HStack {
        Text("หน้าแรก")
            .font(.largeTitle)
        Spacer()
        Image(systemชื่อ: "bell")
    }
}
```

Here, `topหน้าแรก` is a variable that returns a view.

Because it returns a view, its type can be written as:

```swift
some View
```

This is essentially the same usage as `body`:

```swift
var topหน้าแรก: some View { }
var body: some View { }
```

Both use variables to display views, and both have the return type `some View`.

### แยก views อื่น ๆ

Then continue splitting other parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("ยินดีต้อนรับสู่ Qinote")
        Text("สวัสดีตอนเช้า")
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
    Button("คลิกฉัน") {
        print("คลิกฉัน")
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
            Text("หน้าแรก")
                .font(.largeTitle)
            Spacer()
            Image(systemชื่อ: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("ยินดีต้อนรับสู่ Qinote")
            Text("สวัสดีตอนเช้า")
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
        Button("คลิกฉัน") {
            print("คลิกฉัน")
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

### some View return view เดียว

In this split view, if we try to return multiple views:

```swift
var topBar: some View {
    Text("หน้าแรก")
        .font(.largeTitle)
    Spacer()
    Image(systemชื่อ: "bell")
}
```

an error occurs because `some View` can only return one view structure.

Unlike `body`, ordinary computed properties do not have `@ViewBuilder` by default.

Therefore, if we need to return multiple views, we can use a `VStack`, `HStack`, or `Group` container to combine multiple views into one.

```swift
var topBar: some View {
    VStack {
        Text("หน้าแรก")
            .font(.largeTitle)
        Spacer()
        Image(systemชื่อ: "bell")
    }
}
```

Or add `@ViewBuilder` to combine views:

```swift
@ViewBuilder
var topBar: some View {
    Text("หน้าแรก")
        .font(.largeTitle)
    Spacer()
    Image(systemชื่อ: "bell")
}
```

This lets us return multiple views.

### เมื่อ if return หลาย views

ตัวอย่างเช่น:

```swift
var topหน้าแรก: some View {
    if step == "หน้าแรก" {
        HStack {
            Text("หน้าแรก")
                .font(.largeTitle)
            Spacer()
            Image(systemชื่อ: "bell")
        }
    } else {
        Text("ไม่มี")
    }
}
```

In this code, `topหน้าแรก` returns either `HStack` or `Text` depending on the content of `step`, which are two different view types.

Because `some View` requires one definite concrete return type, the two branches of `if` in an ordinary computed property cannot directly return different view types, so an error occurs.

**The solution is still to wrap them in a container or use `@ViewBuilder`.**

### ทำไม views ที่แยกออกมาจึงไม่ใช้ parentheses

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

**Properties ไม่ต้องใช้ parentheses**

If we write it as a method, we can achieve a similar effect:

```swift
func topBar() -> some View {
    HStack {
        Text("หน้าแรก")
            .font(.largeTitle)
        Spacer()
        Image(systemชื่อ: "bell")
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

## Nested views

Besides splitting code into properties, we can also create new view structures.

ตัวอย่างเช่น:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

This `PinkColorView`, like `ContentView`, is an independent SwiftUI view.

If we need to display it in `ContentView`, we can add `()` after the view name.

ตัวอย่างเช่น:

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

## View property หรือสร้าง view ใหม่?

When the view code is simple, we usually do not need to split it. Only when the code becomes more complex is it recommended to split views.

### เมื่อไหร่ควรใช้ view properties

If it is only a small piece of content in the current view, we can use a view property.

ตัวอย่างเช่น:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

These pieces of content are usually only used in the current view.

### เมื่อไหร่ควรสร้าง view ใหม่

If the content is relatively independent, or may be reused across multiple pages in the future, it is more suitable to create a new view.

ตัวอย่างเช่น:

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

## สรุป

In this lesson, we re-understood the most basic and most important view structure in SwiftUI.

`ContentView` is a structure. It is defined with `struct` and is used to organize page-related code.

`View` is a protocol. If a structure wants to become a SwiftUI view, it needs to conform to the `View` protocol.

`body` is the content that the `View` protocol requires us to provide, and it determines what this view displays.

`some View` means returning a certain concrete view, without needing to write out its complex full type.

When view code becomes long, we can use `var xxx: some View` to split the view code into several small areas.

When a piece of content is relatively independent or needs to be reused, we can create a new view structure and display it in other views with `XxxView()`.

Simply put, SwiftUI interfaces are composed of views combined together. One page can contain multiple small views, and a small view can also contain other views.
