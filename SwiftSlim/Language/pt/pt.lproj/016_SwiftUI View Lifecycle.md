# Ciclo de vida da View no SwiftUI

Na aula anterior, entendemos que variáveis `@State` acompanham o ciclo de vida da view, e também aprendemos o uso básico de `onAppear`.

Nesta aula, vamos aprofundar a compreensão do ciclo de vida das views no SwiftUI, entender como uma view é criada e exibida, como as variáveis da view são criadas e recriadas, e também aprender `onAppear`, `onDisappear` e o construtor `init`.

Com esse conhecimento, construiremos uma visão geral de todo o processo de construção de views no SwiftUI.

## Ordem de inicialização do app

Ao criar um projeto iOS, o Xcode gera por padrão dois arquivos:

```

ContentView.swift
ProjectName + App.swift

````

Entre eles, `"ProjectName + App".swift` é o arquivo de entrada de todo o aplicativo.

Por exemplo:

```swift id="rjuvkq"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
````

### Fluxo de execução do código

Quando executamos o app (no simulador ou em um dispositivo real), o sistema procura a palavra-chave `@main`:

```swift id="siw7m0"
@main
struct SwiftSlimTestApp: App {...}
```

Depois de confirmar o arquivo de entrada, o sistema começa a executar o código.

Primeiro ele entra na struct `App`, executa o código dentro de `body`, depois cria o `WindowGroup` e carrega o `ContentView` contido nele.

### Função do WindowGroup

`WindowGroup` é usado para gerenciar janelas:

```swift id="zs02z4"
WindowGroup {
    ContentView()
}
```

No iPad e no macOS, o sistema suporta múltiplas janelas; no iPhone, normalmente existe apenas uma janela.

Por isso, no iPhone, `WindowGroup` é usado principalmente para gerenciar a primeira interface exibida.

### Processo de carregamento da view

Depois que o sistema encontra `ContentView`:

```swift id="qgwl4h"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

O SwiftUI executa o código em `body`, depois constrói a interface com base na estrutura de views retornada (como `VStack`, `Text` etc.) e a exibe na tela.

Depois que essas etapas terminam, conseguimos ver o `ContentView` na interface.

![ContentView](../../Resource/016_view1.png)

É importante notar que a função de `body` é gerar a view, e não armazená-la.

Isso significa que, sempre que a view for atualizada, o SwiftUI recalculará `body` e gerará uma nova estrutura de view.

### Lógica da pré-visualização da view

A pré-visualização do Xcode (Canvas) e a execução real são dois mecanismos diferentes.

Por exemplo, podemos adicionar uma saída de depuração no arquivo de entrada:

```swift id="sf0vh0"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Ao visualizar a view `ContentView` no preview do Xcode, a execução não começa a partir da entrada `@main`, então o `onAppear` no arquivo de entrada não será acionado.

No entanto, se o app for executado no simulador ou em um dispositivo real, o sistema iniciará a execução a partir de `@main`, seguirá o fluxo completo do app, acionará o `onAppear` na entrada e exibirá a informação de depuração.

A questão central é que a pré-visualização do Xcode faz apenas uma “renderização local”, usada somente para mostrar a view atual; já o simulador e os dispositivos reais fornecem um “ambiente de execução completo”, executando todo o app.

Portanto, ao testar funcionalidades do app, deve-se usar como referência o simulador ou o dispositivo real, já que a pré-visualização do Xcode não oferece um ambiente de execução completo.

## Ciclo de vida da view

Nesta fase, todo o nosso código está concentrado em `ContentView`. Porém, em um aplicativo real, um app normalmente contém várias views, que são trocadas em diferentes cenários.

Por exemplo, no “cofrinho”:

![PiggyBank](../../Resource/016_view.png)

Quando clicamos em “Guardar dinheiro”, a view `SaveView` é exibida; quando a ação termina ou a tela é fechada, `SaveView` é removida.

Esse processo corresponde ao ciclo de vida de uma view: criar a view, exibi-la e, por fim, removê-la.

### Fechar o app

Quando o app é fechado, todas as views são removidas, e os estados relacionados também desaparecem.

Por isso, `ContentView` e as demais views serão removidas da memória, e todo o estado de execução do app será apagado.

## Ciclo de vida das variáveis na view

No SwiftUI, o ciclo de vida das variáveis normalmente está vinculado ao ciclo de vida da view.

Por exemplo:

```swift id="r7m1s5"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variável @State

Uma variável declarada com `@State` está ligada ao ciclo de vida da view.

```swift id="6f1j9f"
@State private var name = "FangJunyu"
```

Quando a view é criada, `name` também é criado; quando a view é removida, `name` também é destruído.

É justamente por isso que precisamos usar formas como `UserDefaults` para persistência de dados.

### Variáveis dentro de body

Variáveis definidas dentro de `body`:

```swift id="ev4642"
var num = 10
```

Seu ciclo de vida está vinculado ao processo de execução de `body`.

Quando o estado do SwiftUI muda, por exemplo:

```swift id="oc0f98"
@State private var name = "FangJunyu"
name = "Hu"
```

Quando `name` muda, `@State` detecta a alteração e notifica o SwiftUI para recalcular a view, então `body` é recalculado.

Quando `body` é recalculado, todo o código dentro dele é executado novamente, e as variáveis internas de `body` (como `num`) também são recriadas.

Essa também é a razão pela qual não é recomendado definir variáveis complexas dentro de `body`.

Porque, toda vez que a view for atualizada, as variáveis em `body` serão recriadas, o que aumenta o custo computacional e pode afetar o desempenho.

No SwiftUI, diferentes tipos de dados devem ser gerenciados de formas diferentes: dados que precisam acompanhar o ciclo de vida da view podem ser armazenados com `@State`; dados temporários de cálculo podem ser colocados dentro de `body`.

## onAppear e onDisappear

Na aula anterior, já aprendemos `onAppear`: quando a view é exibida, `onAppear` é chamado.

```swift id="u6f0hu"
.onAppear {}
```

Por exemplo:

```swift id="stxgct"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

No preview do Xcode ou durante a execução, podemos ver a saída de depuração gerada dentro de `onAppear`.

### onDisappear

O correspondente de `onAppear` é `onDisappear`:

```swift id="w9c2wl"
.onDisappear {}
```

Quando a view é fechada, `onDisappear` é chamado.

Por exemplo:

```swift id="lu5ffc"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quando a view for removida, o código dentro de `onDisappear` será executado.

Observação: nesta fase, o `ContentView` usado é a view raiz do app, então ele não pode ser fechado nem removido diretamente. Portanto, neste momento não é possível observar claramente o efeito de execução de `onDisappear`.

Só mais adiante, ao estudar navegação entre páginas e abertura de novas views, será possível ver `onDisappear` sendo chamado.

## Lógica de criação e exibição

É importante notar que a criação da view e sua exibição são duas etapas diferentes.

Quando a view é criada, o método construtor da struct é chamado:

```swift id="jvqjg7"
init() {}
```

Como as views do SwiftUI são structs:

```swift id="zbv996"
struct ContentView: View { ... }
```

Assim, quando a instância da view é criada, o construtor `init` é executado. Somente quando a view é exibida é que `onAppear` será chamado.

Por exemplo:

```swift id="3riep7"
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
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Ao visualizar a view no Xcode, podemos ver a saída de depuração:

```swift id="8vzq4s"
Create ContentView
Show ContentView
```

Isso mostra que primeiro `init` é executado para criar a view, depois o código de `body` é calculado, e por fim a view é exibida e `onAppear` é executado.

Portanto, é necessário entender que a fase de criação da view e a fase de exibição da view são separadas.

### Construtor init

`init` é uma sintaxe básica do Swift. Tanto `struct` quanto `class` podem defini-lo, e ele é usado para inicializar objetos.

```swift id="cw5x2p"
init() {}
```

No SwiftUI, quando a view é criada, o sistema chama o método `init` da view, que pode ser usado para receber parâmetros e inicializar dados.

Se você não escrever manualmente um `init`, o Swift gera automaticamente um construtor padrão para a `struct`.

Para views do SwiftUI como `ContentView`, quando a view é criada, `init` é executado; quando a view é exibida, `onAppear` é executado.

Portanto, `init` é o construtor executado no momento da criação da view, e será útil mais adiante ao passar parâmetros ou inicializar dados.

## Resumo

Nesta aula, estudamos a ordem de inicialização do aplicativo, desde o arquivo de entrada até o fluxo de execução do arquivo `ContentView`.

Também entendemos o ciclo de vida das views no SwiftUI: quando a view é criada, `init` é executado; quando ela aparece na tela, `onAppear` é executado; quando ela é removida ou fechada, `onDisappear` é executado.

Aprendemos também o mecanismo de atualização das views: views são dirigidas por estado. Quando estados como `@State` mudam, o SwiftUI atualiza a view, recalcula `body`, e as variáveis dentro de `body` também são recriadas.

O ciclo de vida das variáveis pode estar vinculado ao ciclo de vida da view, enquanto variáveis temporárias dentro de `body` são recriadas a cada atualização.

Compreender esses ciclos de vida e o comportamento das variáveis ajuda a organizar melhor o código e tornar a lógica do app mais clara.
