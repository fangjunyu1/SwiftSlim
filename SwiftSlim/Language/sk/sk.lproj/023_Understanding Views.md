# Pochopenie views

V tejto lekcii sa vraciame k pôvodnému `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

Keď sme sa prvýkrát stretli so SwiftUI, v `ContentView` bolo veľa kľúčových slov, ktorým sme nerozumeli.

Napríklad `struct`, `View`, `var`, `body`, `some View` a ďalšie kľúčové slová.

Vtedy sme možno vedeli iba toto: **ak napíšeme kód do `body`, obsah sa zobrazí na obrazovke.**

Teraz, keď sme sa naučili `struct`, premenné, metódy a protokoly, môžeme tento kód pochopiť znova a použiť ho na pochopenie vzťahu medzi SwiftUI views.

## Znovu sa pozrime na ContentView

Po vytvorení SwiftUI projektu Xcode predvolene vygeneruje súbor `ContentView`.

Ukážkový kód je nasledovný:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemMeno: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Ahoj, svet!")
        }
        .padding()
    }
}
```

Tento kód môžeme pochopiť tak, že ho rozdelíme na niekoľko častí.

Najprv:

```swift
import SwiftUI
```

Tento riadok importuje framework SwiftUI.

Po importe SwiftUI môžeme používať SwiftUI views ako `View`, `Text`, `Image`, `VStack` a `Button`.

## Štruktúra ContentView

Tento riadok kódu vytvára štruktúru:

```swift
struct ContentView: View
```

V nej:

```swift
struct ContentView
```

znamená, že `ContentView` je štruktúra.

V predchádzajúcej lekcii sme sa učili o `struct`. Vie zoskupiť súvisiace polia a môže obsahovať vlastnosti a metódy.

Napríklad:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

V tomto príklade `ContentView` obsahuje tri veci: `name`, `printName` a `body`.

Inými slovami, `struct` môže zoskupiť súvisiace vlastnosti, metódy a obsah view.

![contentView](../../Resource/023_contentVIew.png)

## View je protokol

Pokračujme pohľadom na tento riadok kódu:

```swift
struct ContentView: View 
```

`View` za dvojbodkou znamená, že `ContentView` dodržiava protokol `View`.

Môžeš to chápať takto: ak sa `ContentView` chce stať SwiftUI view, musí splniť požiadavky protokolu `View`.

### Protokol Identifiable

Keď sme sa predtým učili zoznam filmov, stretli sme sa s protokolom `Identifiable`.

At that time, we needed to loop through a `Movie` array in `ForEach`, but the `Movie` structure did not have a unique identifier, so it could not be used directly with `ForEach`.

Then we needed to make the `Movie` structure conform to the `Identifiable` protocol, so that it met `ForEach`'s requirement for a unique identifier.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protokol `Identifiable` vyžaduje: **tento typ musí mať pole `id`, ktoré ho identifikuje.**

After `Movie` provides an `id` field, it can satisfy the requirements of `Identifiable`.

Then when we use it in `ForEach`, SwiftUI can recognize each piece of data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protokol View

Protokol `View` funguje rovnako.

Ak sa typ chce stať SwiftUI view, musí dodržiavať protokol `View`.

Najdôležitejšou požiadavkou protokolu `View` je poskytnúť `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

You can understand the requirement of the `View` protocol like this: **it accepts the SwiftUI view returned by `body`, and `ContentView` displays SwiftUI views through `body`.**

### Čo sa stane, ak nedodržíme View?

Ak napíšeme toto:

```swift
struct ContentView {
}
```

Toto je len obyčajná štruktúra, nie SwiftUI view.

Priamo neohlási chybu, pretože obyčajná štruktúra je platný Swift kód.

However, if we put it in a preview:

```swift
#Preview {
    ContentView()
}
```

nastane chyba.

Dôvod je: **preview potrebuje zobraziť SwiftUI view, ale tento `ContentView` nedodržiava protokol `View`.**

Therefore, if we want `ContentView` to be displayed on screen, we need to make it conform to the `View` protocol:

```swift
struct ContentView: View {
}
```

At the same time, we must provide `body` as required by the `View` protocol. If there is no `body`, the compiler will still report an error.

Správny spôsob:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

At this point, `ContentView` is a real SwiftUI view that can be displayed.

## body je vstupný bod na zobrazenie view

V SwiftUI je `body` vstupným bodom obsahu view.

```swift
var body: some View {
    Text("Ahoj, svet!")
}
```

Toto možno rozdeliť na tri časti:

**1. var body**

```swift
var body
```

Toto definuje premennú s názvom `body`.

**2. some View**

```swift
: some View
```

This means that this `body` returns a view.

**3. { ... }**

```swift
{
    Text("Ahoj, svet!")
}
```

This represents the displayed view content. In this code, the displayed content is a `Text` view.

In other words, whatever we write inside `body` is what appears on the screen.

Napríklad:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Meno:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

This code means: **the screen displays vertically arranged content with two text views inside.**

### Názov body nemožno ľubovoľne meniť

It is important to note that the name `body` cannot be changed freely.

If we write:

```swift
struct ContentView: View {
    var content: some View {
        Text("Ahoj, svet!")
    }
}
```

This `content` is also a view property, but it cannot replace `body`.

That is because the name required by the `View` protocol is `body`.

## Čo je some View?

In SwiftUI, `some View` means returning a specific view, but without writing out the full type of that view.

```swift
var body: some View
```

In other words, `some View` does not mean there is no type. The real type still exists, and the compiler knows this type, but the type may be complex, so Swift allows us to hide it with `some View`.

### Čo je some?

In Swift, `some` is a keyword used to declare an opaque type.

An opaque type means: **the return value has a concrete type, and the compiler knows what that concrete type is, but we do not write the concrete type directly.**

Napríklad:

```swift
func makeView() -> some View {
    Text("Ahoj")
}
```

This means `makeView` returns a concrete type that conforms to the `View` protocol.

### Prečo potrebujeme some?

When learning variables, we learned that: **values in Swift either need an explicit type annotation, or the compiler must infer their type automatically.**

Napríklad:

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

**Problém nesúladu typov**

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

**Zložité typy view**

In real development, an interface usually does not contain only one `Text`.

If we need to display a more complex `VStack`, we would need to manually write a complex return type.

Napríklad:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemMeno: "globe")
        Text("Ahoj, svet!")
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

**Ešte zložitejšie typy view**

If we add modifiers to the view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemMeno: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Ahoj, svet!")
    }
    .padding()
}
```

then the return type of this view becomes very complex and cannot be described in detail here.

The existing return type `VStack<TupleView<(Image,Text)>>` can no longer describe the modifiers, so an error occurs.

**some View zjednodušuje návratový typ**

For this situation, SwiftUI provides a concise solution: use `some View` to simplify the code.

When we change `body` to the type `some View`:

```swift
var body: some View {
    VStack {
        Image(systemMeno: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Ahoj, svet!")
    }
    .padding()
}
```

we no longer need to write the full return type every time we modify the view code.

This is because `some View` means returning a concrete view that conforms to the `View` protocol.

In other words, SwiftUI views such as `VStack` and `Image` all conform to the `View` protocol. After modifiers are added, the returned view type still conforms to the `View` protocol.

So they can all be returned as `some View`.

### some View nemôže ľubovoľne vrátiť akékoľvek view

Although `some View` can hide complex types, it is not "typeless".

Its core rule is: **the compiler must be able to determine one concrete return type**.

Napríklad:

```swift
var title: some View {
    Text("Ahoj")
}
```

This returns a `Text` view.

However, if we try to return two views, an error occurs:

```swift
var title: some View {
    Text("Ahoj")
    Image(systemMeno: "star")
}
```

That is because `some View` ultimately needs to return one view structure, but here we are trying to return two independent views.

### Riešenie

There are usually two solutions: a container and `@ViewBuilder`.

**1. Zabaliť do kontajnera**

```swift
var title: some View {
    VStack {
        Text("Ahoj")
        Image(systemMeno: "star")
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
    Text("Ahoj")
    Image(systemMeno: "star")
}
```

`@ViewBuilder` can combine multiple views into one return result.

Its essence is still to merge multiple views into one view, satisfying the requirement that `some View` returns one view structure.

### Prečo môže body priamo obsahovať viacero views?

If we write multiple views inside `var body`, for example:

```swift
var body: some View {
    Image(systemMeno: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Ahoj, svet!")
}
```

in some cases, this `body` will not report an error.

The reason is that `body` in the `View` protocol supports `@ViewBuilder` by default:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

In the source code of the `View` protocol, we can see that `@ViewBuilder` already modifies the `body` variable.

Therefore, compared with an ordinary `some View`, `body` has an extra layer of special handling, so SwiftUI automatically helps us combine multiple views into one view.

**Najprv používaj kontajnery**

To make it easier for beginners to understand, it is recommended to first use containers such as `VStack`, `HStack`, `ZStack`, and `Group` to organize multiple views.

Napríklad:

```swift
var body: some View {
    VStack {
        Text("Ahoj")
        Image(systemMeno: "star")
    }
}
```

This makes the code more intuitive: **the outer layer is a `VStack`, and inside it are two child views.**

## Rozdeľovanie views

If the interface is simple, we can write all the code inside `body`.

Napríklad:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Vitaj v Qinote")
                Text("Dobré ráno")
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
            Button("Klikni na mňa") {
                print("Klikni na mňa ")
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

### Rozdelenie horného view

For example, split out the top area:

```swift
var topDomov: some View {
    HStack {
        Text("Domov")
            .font(.largeTitle)
        Spacer()
        Image(systemMeno: "bell")
    }
}
```

Here, `topDomov` is a variable that returns a view.

Because it returns a view, its type can be written as:

```swift
some View
```

This is essentially the same usage as `body`:

```swift
var topDomov: some View { }
var body: some View { }
```

Both use variables to display views, and both have the return type `some View`.

### Rozdelenie ďalších views

Then continue splitting other parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Vitaj v Qinote")
        Text("Dobré ráno")
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
    Button("Klikni na mňa") {
        print("Klikni na mňa")
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
            Text("Domov")
                .font(.largeTitle)
            Spacer()
            Image(systemMeno: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Vitaj v Qinote")
            Text("Dobré ráno")
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
        Button("Klikni na mňa") {
            print("Klikni na mňa")
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

### some View vracia jedno view

In this split view, if we try to return multiple views:

```swift
var topBar: some View {
    Text("Domov")
        .font(.largeTitle)
    Spacer()
    Image(systemMeno: "bell")
}
```

an error occurs because `some View` can only return one view structure.

Unlike `body`, ordinary computed properties do not have `@ViewBuilder` by default.

Therefore, if we need to return multiple views, we can use a `VStack`, `HStack`, or `Group` container to combine multiple views into one.

```swift
var topBar: some View {
    VStack {
        Text("Domov")
            .font(.largeTitle)
        Spacer()
        Image(systemMeno: "bell")
    }
}
```

Or add `@ViewBuilder` to combine views:

```swift
@ViewBuilder
var topBar: some View {
    Text("Domov")
        .font(.largeTitle)
    Spacer()
    Image(systemMeno: "bell")
}
```

This lets us return multiple views.

### if vracajúci viacero views

Napríklad:

```swift
var topDomov: some View {
    if step == "Domov" {
        HStack {
            Text("Domov")
                .font(.largeTitle)
            Spacer()
            Image(systemMeno: "bell")
        }
    } else {
        Text("Nič")
    }
}
```

In this code, `topDomov` returns either `HStack` or `Text` depending on the content of `step`, which are two different view types.

Because `some View` requires one definite concrete return type, the two branches of `if` in an ordinary computed property cannot directly return different view types, so an error occurs.

**The solution is still to wrap them in a container or use `@ViewBuilder`.**

### Prečo rozdelené views nepoužívajú zátvorky

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

**Vlastnosti nepotrebujú zátvorky.**

If we write it as a method, we can achieve a similar effect:

```swift
func topBar() -> some View {
    HStack {
        Text("Domov")
            .font(.largeTitle)
        Spacer()
        Image(systemMeno: "bell")
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

## Vnorené views

Besides splitting code into properties, we can also create new view structures.

Napríklad:

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

Napríklad:

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

## View property alebo nové view?

When the view code is simple, we usually do not need to split it. Only when the code becomes more complex is it recommended to split views.

### Kedy používať view properties

If it is only a small piece of content in the current view, we can use a view property.

Napríklad:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

These pieces of content are usually only used in the current view.

### Kedy vytvoriť nové view

If the content is relatively independent, or may be reused across multiple pages in the future, it is more suitable to create a new view.

Napríklad:

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

## Zhrnutie

In this lesson, we re-understood the most basic and most important view structure in SwiftUI.

`ContentView` is a structure. It is defined with `struct` and is used to organize page-related code.

`View` is a protocol. If a structure wants to become a SwiftUI view, it needs to conform to the `View` protocol.

`body` is the content that the `View` protocol requires us to provide, and it determines what this view displays.

`some View` means returning a certain concrete view, without needing to write out its complex full type.

When view code becomes long, we can use `var xxx: some View` to split the view code into several small areas.

When a piece of content is relatively independent or needs to be reused, we can create a new view structure and display it in other views with `XxxView()`.

Simply put, SwiftUI interfaces are composed of views combined together. One page can contain multiple small views, and a small view can also contain other views.
