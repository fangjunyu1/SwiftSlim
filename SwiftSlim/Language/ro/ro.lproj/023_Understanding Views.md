# Înțelegerea view-urilor

În această lecție, revenim la `ContentView` de la început.

```swift
struct ContentView: View {
    var body: some View {
        Text("Salut, lume!")
    }
}
```

Când am întâlnit prima dată SwiftUI, în `ContentView` erau multe cuvinte-cheie pe care nu le înțelegeam.

De exemplu, `struct`, `View`, `var`, `body`, `some View` și alte cuvinte-cheie.

Pe atunci, poate știam doar atât: **dacă scriem cod în interiorul lui `body`, conținutul apare pe ecran.**

Acum că am învățat `struct`, variabile, metode și protocoale, putem înțelege din nou acest cod și îl putem folosi pentru a înțelege relația dintre view-urile SwiftUI.

## Revenim la ContentView

După crearea unui proiect SwiftUI, Xcode generează implicit un fișier `ContentView`.

Codul de exemplu este următorul:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemNume: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Salut, lume!")
        }
        .padding()
    }
}
```

Acest cod poate fi înțeles împărțindu-l în mai multe părți.

Mai întâi:

```swift
import SwiftUI
```

Această linie importă framework-ul SwiftUI.

După ce importăm SwiftUI, putem folosi view-uri SwiftUI precum `View`, `Text`, `Image`, `VStack` și `Button`.

## Structura ContentView

Această linie de cod creează o structură:

```swift
struct ContentView: View
```

În aceasta:

```swift
struct ContentView
```

înseamnă că `ContentView` este o structură.

În lecția anterioară, am învățat despre `struct`. Poate grupa câmpuri înrudite și poate conține proprietăți și metode.

De exemplu:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Salut, lume!")
    }
}
```

În acest exemplu, `ContentView` conține trei lucruri: `name`, `printName` și `body`.

Cu alte cuvinte, `struct` poate grupa proprietăți, metode și conținut de view care sunt înrudite.

![contentView](../../Resource/023_contentVIew.png)

## View este un protocol

Continuăm să privim această linie de cod:

```swift
struct ContentView: View 
```

`View` de după două puncte înseamnă că `ContentView` respectă protocolul `View`.

Poți înțelege așa: dacă `ContentView` vrea să devină un SwiftUI view, trebuie să îndeplinească cerințele protocolului `View`.

### Protocolul Identifiable

Când am învățat mai devreme lista de filme, am întâlnit protocolul `Identifiable`.

At that time, we needed to loop through a `Movie` array in `ForEach`, but the `Movie` structure did not have a unique identifier, so it could not be used directly with `ForEach`.

Then we needed to make the `Movie` structure conform to the `Identifiable` protocol, so that it met `ForEach`'s requirement for a unique identifier.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protocolul `Identifiable` cere: **acest tip trebuie să aibă un câmp `id` care îl identifică.**

After `Movie` provides an `id` field, it can satisfy the requirements of `Identifiable`.

Then when we use it in `ForEach`, SwiftUI can recognize each piece of data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protocolul View

Protocolul `View` funcționează la fel.

Dacă un tip vrea să devină un SwiftUI view, trebuie să respecte protocolul `View`.

Cea mai importantă cerință a protocolului `View` este să ofere un `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Salut, lume!")
    }
}
```

You can understand the requirement of the `View` protocol like this: **it accepts the SwiftUI view returned by `body`, and `ContentView` displays SwiftUI views through `body`.**

### Ce se întâmplă dacă nu respectăm View?

Dacă scriem așa:

```swift
struct ContentView {
}
```

Aceasta este doar o structură obișnuită, nu un SwiftUI view.

Nu va raporta direct o eroare, deoarece o structură obișnuită este cod Swift valid.

However, if we put it in a preview:

```swift
#Preview {
    ContentView()
}
```

va apărea o eroare.

Motivul este: **un preview trebuie să afișeze un SwiftUI view, dar acest `ContentView` nu respectă protocolul `View`.**

Therefore, if we want `ContentView` to be displayed on screen, we need to make it conform to the `View` protocol:

```swift
struct ContentView: View {
}
```

At the same time, we must provide `body` as required by the `View` protocol. If there is no `body`, the compiler will still report an error.

Modul corect:

```swift
struct ContentView: View {
    var body: some View {
        Text("Salut, lume!")
    }
}
```

At this point, `ContentView` is a real SwiftUI view that can be displayed.

## body este punctul de intrare pentru afișarea unui view

În SwiftUI, `body` este punctul de intrare pentru conținutul unui view.

```swift
var body: some View {
    Text("Salut, lume!")
}
```

Aceasta poate fi împărțită în trei părți:

**1. var body**

```swift
var body
```

Aceasta definește o variabilă numită `body`.

**2. some View**

```swift
: some View
```

This means that this `body` returns a view.

**3. { ... }**

```swift
{
    Text("Salut, lume!")
}
```

This represents the displayed view content. In this code, the displayed content is a `Text` view.

In other words, whatever we write inside `body` is what appears on the screen.

De exemplu:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nume:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

This code means: **the screen displays vertically arranged content with two text views inside.**

### Numele body nu poate fi schimbat liber

It is important to note that the name `body` cannot be changed freely.

If we write:

```swift
struct ContentView: View {
    var content: some View {
        Text("Salut, lume!")
    }
}
```

This `content` is also a view property, but it cannot replace `body`.

That is because the name required by the `View` protocol is `body`.

## Ce este some View?

In SwiftUI, `some View` means returning a specific view, but without writing out the full type of that view.

```swift
var body: some View
```

In other words, `some View` does not mean there is no type. The real type still exists, and the compiler knows this type, but the type may be complex, so Swift allows us to hide it with `some View`.

### Ce este some?

In Swift, `some` is a keyword used to declare an opaque type.

An opaque type means: **the return value has a concrete type, and the compiler knows what that concrete type is, but we do not write the concrete type directly.**

De exemplu:

```swift
func makeView() -> some View {
    Text("Salut")
}
```

This means `makeView` returns a concrete type that conforms to the `View` protocol.

### De ce avem nevoie de some?

When learning variables, we learned that: **values in Swift either need an explicit type annotation, or the compiler must infer their type automatically.**

De exemplu:

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

**Problemă de nepotrivire a tipurilor**

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

**Tipuri de view complexe**

In real development, an interface usually does not contain only one `Text`.

If we need to display a more complex `VStack`, we would need to manually write a complex return type.

De exemplu:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemNume: "globe")
        Text("Salut, lume!")
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

**Tipuri de view și mai complexe**

If we add modifiers to the view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemNume: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Salut, lume!")
    }
    .padding()
}
```

then the return type of this view becomes very complex and cannot be described in detail here.

The existing return type `VStack<TupleView<(Image,Text)>>` can no longer describe the modifiers, so an error occurs.

**some View simplifică tipul returnat**

For this situation, SwiftUI provides a concise solution: use `some View` to simplify the code.

When we change `body` to the type `some View`:

```swift
var body: some View {
    VStack {
        Image(systemNume: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Salut, lume!")
    }
    .padding()
}
```

we no longer need to write the full return type every time we modify the view code.

This is because `some View` means returning a concrete view that conforms to the `View` protocol.

In other words, SwiftUI views such as `VStack` and `Image` all conform to the `View` protocol. After modifiers are added, the returned view type still conforms to the `View` protocol.

So they can all be returned as `some View`.

### some View nu poate returna orice view în mod liber

Although `some View` can hide complex types, it is not "typeless".

Its core rule is: **the compiler must be able to determine one concrete return type**.

De exemplu:

```swift
var title: some View {
    Text("Salut")
}
```

This returns a `Text` view.

However, if we try to return two views, an error occurs:

```swift
var title: some View {
    Text("Salut")
    Image(systemNume: "star")
}
```

That is because `some View` ultimately needs to return one view structure, but here we are trying to return two independent views.

### Soluție

There are usually two solutions: a container and `@ViewBuilder`.

**1. Înfășoară într-un container**

```swift
var title: some View {
    VStack {
        Text("Salut")
        Image(systemNume: "star")
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
    Text("Salut")
    Image(systemNume: "star")
}
```

`@ViewBuilder` can combine multiple views into one return result.

Its essence is still to merge multiple views into one view, satisfying the requirement that `some View` returns one view structure.

### De ce body poate conține direct mai multe view-uri?

If we write multiple views inside `var body`, for example:

```swift
var body: some View {
    Image(systemNume: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Salut, lume!")
}
```

in some cases, this `body` will not report an error.

The reason is that `body` in the `View` protocol supports `@ViewBuilder` by default:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

In the source code of the `View` protocol, we can see that `@ViewBuilder` already modifies the `body` variable.

Therefore, compared with an ordinary `some View`, `body` has an extra layer of special handling, so SwiftUI automatically helps us combine multiple views into one view.

**Folosește mai întâi containere**

To make it easier for beginners to understand, it is recommended to first use containers such as `VStack`, `HStack`, `ZStack`, and `Group` to organize multiple views.

De exemplu:

```swift
var body: some View {
    VStack {
        Text("Salut")
        Image(systemNume: "star")
    }
}
```

This makes the code more intuitive: **the outer layer is a `VStack`, and inside it are two child views.**

## Împărțirea view-urilor

If the interface is simple, we can write all the code inside `body`.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Bine ai venit la Qinote")
                Text("Bună dimineața")
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
            Button("Clic pe mine") {
                print("Clic pe mine ")
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

### Împarte view-ul de sus

For example, split out the top area:

```swift
var topAcasă: some View {
    HStack {
        Text("Acasă")
            .font(.largeTitle)
        Spacer()
        Image(systemNume: "bell")
    }
}
```

Here, `topAcasă` is a variable that returns a view.

Because it returns a view, its type can be written as:

```swift
some View
```

This is essentially the same usage as `body`:

```swift
var topAcasă: some View { }
var body: some View { }
```

Both use variables to display views, and both have the return type `some View`.

### Împarte celelalte view-uri

Then continue splitting other parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Bine ai venit la Qinote")
        Text("Bună dimineața")
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
    Button("Clic pe mine") {
        print("Clic pe mine")
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
            Text("Acasă")
                .font(.largeTitle)
            Spacer()
            Image(systemNume: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Bine ai venit la Qinote")
            Text("Bună dimineața")
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
        Button("Clic pe mine") {
            print("Clic pe mine")
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

### some View returnează un singur view

In this split view, if we try to return multiple views:

```swift
var topBar: some View {
    Text("Acasă")
        .font(.largeTitle)
    Spacer()
    Image(systemNume: "bell")
}
```

an error occurs because `some View` can only return one view structure.

Unlike `body`, ordinary computed properties do not have `@ViewBuilder` by default.

Therefore, if we need to return multiple views, we can use a `VStack`, `HStack`, or `Group` container to combine multiple views into one.

```swift
var topBar: some View {
    VStack {
        Text("Acasă")
            .font(.largeTitle)
        Spacer()
        Image(systemNume: "bell")
    }
}
```

Or add `@ViewBuilder` to combine views:

```swift
@ViewBuilder
var topBar: some View {
    Text("Acasă")
        .font(.largeTitle)
    Spacer()
    Image(systemNume: "bell")
}
```

This lets us return multiple views.

### if care returnează mai multe view-uri

De exemplu:

```swift
var topAcasă: some View {
    if step == "Acasă" {
        HStack {
            Text("Acasă")
                .font(.largeTitle)
            Spacer()
            Image(systemNume: "bell")
        }
    } else {
        Text("Nimic")
    }
}
```

In this code, `topAcasă` returns either `HStack` or `Text` depending on the content of `step`, which are two different view types.

Because `some View` requires one definite concrete return type, the two branches of `if` in an ordinary computed property cannot directly return different view types, so an error occurs.

**The solution is still to wrap them in a container or use `@ViewBuilder`.**

### De ce view-urile împărțite nu folosesc paranteze

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

**Proprietățile nu au nevoie de paranteze.**

If we write it as a method, we can achieve a similar effect:

```swift
func topBar() -> some View {
    HStack {
        Text("Acasă")
            .font(.largeTitle)
        Spacer()
        Image(systemNume: "bell")
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

## View-uri imbricate

Besides splitting code into properties, we can also create new view structures.

De exemplu:

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

De exemplu:

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

## Proprietate de view sau view nou?

When the view code is simple, we usually do not need to split it. Only when the code becomes more complex is it recommended to split views.

### Când folosim proprietăți de view

If it is only a small piece of content in the current view, we can use a view property.

De exemplu:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

These pieces of content are usually only used in the current view.

### Când creăm un view nou

If the content is relatively independent, or may be reused across multiple pages in the future, it is more suitable to create a new view.

De exemplu:

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

## Rezumat

In this lesson, we re-understood the most basic and most important view structure in SwiftUI.

`ContentView` is a structure. It is defined with `struct` and is used to organize page-related code.

`View` is a protocol. If a structure wants to become a SwiftUI view, it needs to conform to the `View` protocol.

`body` is the content that the `View` protocol requires us to provide, and it determines what this view displays.

`some View` means returning a certain concrete view, without needing to write out its complex full type.

When view code becomes long, we can use `var xxx: some View` to split the view code into several small areas.

When a piece of content is relatively independent or needs to be reused, we can create a new view structure and display it in other views with `XxxView()`.

Simply put, SwiftUI interfaces are composed of views combined together. One page can contain multiple small views, and a small view can also contain other views.
