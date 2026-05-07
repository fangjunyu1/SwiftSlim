# Entendendo Views

Nesta aula, voltamos ao `ContentView` original.

```swift
struct ContentView: View {
    var body: some View {
        Text("Olá, mundo!")
    }
}
```

Quando tivemos o primeiro contato com SwiftUI, havia muitas palavras-chave em `ContentView` que ainda não entendíamos.

Por exemplo, `struct`, `View`, `var`, `body`, `some View` e outras palavras-chave.

Naquele momento, talvez soubéssemos apenas isto: **se escrevermos código dentro de `body`, o conteúdo aparece na tela.**

Agora que já aprendemos `struct`, variáveis, métodos e protocolos, podemos entender esse código novamente e usá-lo para compreender a relação entre as views do SwiftUI.

## Revisitando ContentView

Depois de criar um projeto SwiftUI, o Xcode gera por padrão um arquivo `ContentView`.

O código de exemplo é o seguinte:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemNome: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Olá, mundo!")
        }
        .padding()
    }
}
```

Esse código pode ser entendido ao dividi-lo em várias partes.

Primeiro:

```swift
import SwiftUI
```

Esta linha importa o framework SwiftUI.

Depois de importar SwiftUI, podemos usar views do SwiftUI como `View`, `Text`, `Image`, `VStack` e `Button`.

## A estrutura ContentView

Esta linha de código cria uma estrutura:

```swift
struct ContentView: View
```

Nela:

```swift
struct ContentView
```

significa que `ContentView` é uma estrutura.

Na aula anterior, aprendemos sobre `struct`. Ele pode agrupar campos relacionados e pode conter propriedades e métodos.

Por exemplo:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Olá, mundo!")
    }
}
```

Neste exemplo, `ContentView` contém três coisas: `name`, `printName` e `body`.

Em outras palavras, `struct` pode agrupar propriedades, métodos e conteúdo de view relacionados.

![contentView](../../Resource/023_contentVIew.png)

## View é um protocolo

Continue olhando para esta linha de código:

```swift
struct ContentView: View 
```

O `View` depois dos dois-pontos significa que `ContentView` está em conformidade com o protocolo `View`.

Você pode entender assim: se `ContentView` quiser se tornar uma view SwiftUI, ele precisa satisfazer os requisitos do protocolo `View`.

### O protocolo Identifiable

Quando aprendemos a lista de filmes antes, encontramos o protocolo `Identifiable`.

At that time, we needed to loop through a `Movie` array in `ForEach`, but the `Movie` structure did not have a unique identifier, so it could not be used directly with `ForEach`.

Then we needed to make the `Movie` structure conform to the `Identifiable` protocol, so that it met `ForEach`'s requirement for a unique identifier.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

O protocolo `Identifiable` exige: **este tipo deve ter um campo `id` que o identifique.**

After `Movie` provides an `id` field, it can satisfy the requirements of `Identifiable`.

Then when we use it in `ForEach`, SwiftUI can recognize each piece of data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### O protocolo View

O protocolo `View` funciona da mesma forma.

Se um tipo quiser se tornar uma view SwiftUI, ele precisa estar em conformidade com o protocolo `View`.

O requisito mais importante do protocolo `View` é fornecer um `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Olá, mundo!")
    }
}
```

You can understand the requirement of the `View` protocol like this: **it accepts the SwiftUI view returned by `body`, and `ContentView` displays SwiftUI views through `body`.**

### O que acontece se não seguirmos View?

Se escrevermos isto:

```swift
struct ContentView {
}
```

Isto é apenas uma estrutura comum, não uma view SwiftUI.

Isso não gera um erro diretamente, porque uma estrutura comum é código Swift válido.

However, if we put it in a preview:

```swift
#Preview {
    ContentView()
}
```

um erro ocorrerá.

O motivo é: **uma preview precisa exibir uma view SwiftUI, mas este `ContentView` não está em conformidade com o protocolo `View`.**

Therefore, if we want `ContentView` to be displayed on screen, we need to make it conform to the `View` protocol:

```swift
struct ContentView: View {
}
```

At the same time, we must provide `body` as required by the `View` protocol. If there is no `body`, the compiler will still report an error.

A forma correta:

```swift
struct ContentView: View {
    var body: some View {
        Text("Olá, mundo!")
    }
}
```

At this point, `ContentView` is a real SwiftUI view that can be displayed.

## body é o ponto de entrada para exibir uma view

No SwiftUI, `body` é o ponto de entrada do conteúdo de uma view.

```swift
var body: some View {
    Text("Olá, mundo!")
}
```

Isso pode ser dividido em três partes:

**1. var body**

```swift
var body
```

Isso define uma variável chamada `body`.

**2. some View**

```swift
: some View
```

This means that this `body` returns a view.

**3. { ... }**

```swift
{
    Text("Olá, mundo!")
}
```

This represents the displayed view content. In this code, the displayed content is a `Text` view.

In other words, whatever we write inside `body` is what appears on the screen.

Por exemplo:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nome:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

This code means: **the screen displays vertically arranged content with two text views inside.**

### O nome body não pode ser alterado livremente

It is important to note that the name `body` cannot be changed freely.

If we write:

```swift
struct ContentView: View {
    var content: some View {
        Text("Olá, mundo!")
    }
}
```

This `content` is also a view property, but it cannot replace `body`.

That is because the name required by the `View` protocol is `body`.

## O que é some View?

In SwiftUI, `some View` means returning a specific view, but without writing out the full type of that view.

```swift
var body: some View
```

In other words, `some View` does not mean there is no type. The real type still exists, and the compiler knows this type, but the type may be complex, so Swift allows us to hide it with `some View`.

### O que é some?

In Swift, `some` is a keyword used to declare an opaque type.

An opaque type means: **the return value has a concrete type, and the compiler knows what that concrete type is, but we do not write the concrete type directly.**

Por exemplo:

```swift
func makeView() -> some View {
    Text("Olá")
}
```

This means `makeView` returns a concrete type that conforms to the `View` protocol.

### Por que precisamos de some?

When learning variables, we learned that: **values in Swift either need an explicit type annotation, or the compiler must infer their type automatically.**

Por exemplo:

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

**Problema de incompatibilidade de tipos**

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

**Tipos de view complexos**

In real development, an interface usually does not contain only one `Text`.

If we need to display a more complex `VStack`, we would need to manually write a complex return type.

Por exemplo:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemNome: "globe")
        Text("Olá, mundo!")
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

**Tipos de view ainda mais complexos**

If we add modifiers to the view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemNome: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Olá, mundo!")
    }
    .padding()
}
```

then the return type of this view becomes very complex and cannot be described in detail here.

The existing return type `VStack<TupleView<(Image,Text)>>` can no longer describe the modifiers, so an error occurs.

**some View simplifica o tipo de retorno**

For this situation, SwiftUI provides a concise solution: use `some View` to simplify the code.

When we change `body` to the type `some View`:

```swift
var body: some View {
    VStack {
        Image(systemNome: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Olá, mundo!")
    }
    .padding()
}
```

we no longer need to write the full return type every time we modify the view code.

This is because `some View` means returning a concrete view that conforms to the `View` protocol.

In other words, SwiftUI views such as `VStack` and `Image` all conform to the `View` protocol. After modifiers are added, the returned view type still conforms to the `View` protocol.

So they can all be returned as `some View`.

### some View não pode retornar qualquer view livremente

Although `some View` can hide complex types, it is not "typeless".

Its core rule is: **the compiler must be able to determine one concrete return type**.

Por exemplo:

```swift
var title: some View {
    Text("Olá")
}
```

This returns a `Text` view.

However, if we try to return two views, an error occurs:

```swift
var title: some View {
    Text("Olá")
    Image(systemNome: "star")
}
```

That is because `some View` ultimately needs to return one view structure, but here we are trying to return two independent views.

### Solução

There are usually two solutions: a container and `@ViewBuilder`.

**1. Envolver com um container**

```swift
var title: some View {
    VStack {
        Text("Olá")
        Image(systemNome: "star")
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
    Text("Olá")
    Image(systemNome: "star")
}
```

`@ViewBuilder` can combine multiple views into one return result.

Its essence is still to merge multiple views into one view, satisfying the requirement that `some View` returns one view structure.

### Por que body pode conter várias views diretamente?

If we write multiple views inside `var body`, for example:

```swift
var body: some View {
    Image(systemNome: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Olá, mundo!")
}
```

in some cases, this `body` will not report an error.

The reason is that `body` in the `View` protocol supports `@ViewBuilder` by default:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

In the source code of the `View` protocol, we can see that `@ViewBuilder` already modifies the `body` variable.

Therefore, compared with an ordinary `some View`, `body` has an extra layer of special handling, so SwiftUI automatically helps us combine multiple views into one view.

**Use containers primeiro**

To make it easier for beginners to understand, it is recommended to first use containers such as `VStack`, `HStack`, `ZStack`, and `Group` to organize multiple views.

Por exemplo:

```swift
var body: some View {
    VStack {
        Text("Olá")
        Image(systemNome: "star")
    }
}
```

This makes the code more intuitive: **the outer layer is a `VStack`, and inside it are two child views.**

## Dividindo views

If the interface is simple, we can write all the code inside `body`.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Bem-vindo ao Qinote")
                Text("Bom dia")
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
            Button("Clique em mim") {
                print("Clique em mim ")
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

### Dividir a view superior

For example, split out the top area:

```swift
var topInício: some View {
    HStack {
        Text("Início")
            .font(.largeTitle)
        Spacer()
        Image(systemNome: "bell")
    }
}
```

Here, `topInício` is a variable that returns a view.

Because it returns a view, its type can be written as:

```swift
some View
```

This is essentially the same usage as `body`:

```swift
var topInício: some View { }
var body: some View { }
```

Both use variables to display views, and both have the return type `some View`.

### Dividir outras views

Then continue splitting other parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Bem-vindo ao Qinote")
        Text("Bom dia")
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
    Button("Clique em mim") {
        print("Clique em mim")
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
            Text("Início")
                .font(.largeTitle)
            Spacer()
            Image(systemNome: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Bem-vindo ao Qinote")
            Text("Bom dia")
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
        Button("Clique em mim") {
            print("Clique em mim")
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

### some View retorna uma única view

In this split view, if we try to return multiple views:

```swift
var topBar: some View {
    Text("Início")
        .font(.largeTitle)
    Spacer()
    Image(systemNome: "bell")
}
```

an error occurs because `some View` can only return one view structure.

Unlike `body`, ordinary computed properties do not have `@ViewBuilder` by default.

Therefore, if we need to return multiple views, we can use a `VStack`, `HStack`, or `Group` container to combine multiple views into one.

```swift
var topBar: some View {
    VStack {
        Text("Início")
            .font(.largeTitle)
        Spacer()
        Image(systemNome: "bell")
    }
}
```

Or add `@ViewBuilder` to combine views:

```swift
@ViewBuilder
var topBar: some View {
    Text("Início")
        .font(.largeTitle)
    Spacer()
    Image(systemNome: "bell")
}
```

This lets us return multiple views.

### if retornando várias views

Por exemplo:

```swift
var topInício: some View {
    if step == "Início" {
        HStack {
            Text("Início")
                .font(.largeTitle)
            Spacer()
            Image(systemNome: "bell")
        }
    } else {
        Text("Nada")
    }
}
```

In this code, `topInício` returns either `HStack` or `Text` depending on the content of `step`, which are two different view types.

Because `some View` requires one definite concrete return type, the two branches of `if` in an ordinary computed property cannot directly return different view types, so an error occurs.

**The solution is still to wrap them in a container or use `@ViewBuilder`.**

### Por que views divididas não usam parênteses

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

**Propriedades não precisam de parênteses.**

If we write it as a method, we can achieve a similar effect:

```swift
func topBar() -> some View {
    HStack {
        Text("Início")
            .font(.largeTitle)
        Spacer()
        Image(systemNome: "bell")
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

## Views aninhadas

Besides splitting code into properties, we can also create new view structures.

Por exemplo:

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

Por exemplo:

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

## Propriedade de view ou nova view?

When the view code is simple, we usually do not need to split it. Only when the code becomes more complex is it recommended to split views.

### Quando usar propriedades de view

If it is only a small piece of content in the current view, we can use a view property.

Por exemplo:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

These pieces of content are usually only used in the current view.

### Quando criar uma nova view

If the content is relatively independent, or may be reused across multiple pages in the future, it is more suitable to create a new view.

Por exemplo:

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

## Resumo

In this lesson, we re-understood the most basic and most important view structure in SwiftUI.

`ContentView` is a structure. It is defined with `struct` and is used to organize page-related code.

`View` is a protocol. If a structure wants to become a SwiftUI view, it needs to conform to the `View` protocol.

`body` is the content that the `View` protocol requires us to provide, and it determines what this view displays.

`some View` means returning a certain concrete view, without needing to write out its complex full type.

When view code becomes long, we can use `var xxx: some View` to split the view code into several small areas.

When a piece of content is relatively independent or needs to be reused, we can create a new view structure and display it in other views with `XxxView()`.

Simply put, SwiftUI interfaces are composed of views combined together. One page can contain multiple small views, and a small view can also contain other views.
