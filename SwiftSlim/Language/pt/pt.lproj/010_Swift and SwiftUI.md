# Swift e SwiftUI

Ao aprender desenvolvimento para as plataformas Apple, muitos tutoriais tendem a explicar Swift e SwiftUI separadamente. Isso pode fazer com que iniciantes sintam uma certa fragmentação e pensem, por engano, que se tratam de duas tecnologias totalmente independentes.

Na prática, Swift e SwiftUI formam um conjunto profundamente integrado: Swift é a linguagem de programação, responsável por fornecer lógica e dados; SwiftUI é o framework de interface construído com base em Swift, responsável pela renderização das views e pela interação.

Esta lição vai ajudar você a construir uma estrutura de entendimento clara: o que é Swift, o que é SwiftUI e como os dois colaboram entre si no código.

## O que é Swift?

Swift é uma linguagem de programação moderna lançada pela Apple, usada para desenvolver aplicativos para iOS, macOS, watchOS e tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift é uma linguagem fortemente tipada e estática. Seu design prioriza mais segurança, reduzindo muitos erros comuns de programação (como ponteiros nulos, acesso fora dos limites etc.), e oferece integração sem barreiras com C e Objective-C.

No desenvolvimento real, Swift é mais usado para a parte lógica do aplicativo, como processamento de dados, requisições de rede, operações de armazenamento e assim por diante.

## O que é SwiftUI?

SwiftUI é um novo framework de construção de interface lançado pela Apple em 2019. SwiftUI adota o modelo de programação declarativa, permitindo que desenvolvedores descrevam a estrutura da interface e o comportamento de interação com código mais conciso.

![swiftui](../../RESOURCE/010_swiftui.png)

Programação declarativa significa que o desenvolvedor só precisa dizer ao sistema o que deseja exibir, e o sistema atualizará automaticamente a view conforme os dados mudarem. Não é mais necessário atualizar manualmente o estado da interface, o que simplifica bastante a complexidade do desenvolvimento de UI.

O núcleo do SwiftUI é composto por componentes de view (como `Text`, `Image`, `Button` etc.) e contêineres de layout (como `VStack`, `HStack`, `ZStack`). Esses componentes interagem por meio de binding de dados e gerenciamento de estado, permitindo que a interface responda às mudanças nos dados e seja atualizada automaticamente.

## Como Swift e SwiftUI colaboram?

As responsabilidades de Swift e SwiftUI podem ser resumidas nos seguintes pontos:

**1. Swift: processa lógica e dados**

Swift é usado principalmente para gerenciar dados, armazenar estado e executar lógica. Esses códigos normalmente não afetam diretamente a renderização da interface, mas são responsáveis por tratar dados e comportamentos.

Por exemplo, processando dados em Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Esses códigos envolvem declaração de variáveis, definição de constantes, funções, fluxo de controle etc., e não afetam diretamente a exibição da view.

**2. SwiftUI: declara e renderiza a interface**

SwiftUI, por sua vez, é usado para construir o layout e o conteúdo da interface do usuário, sendo responsável principalmente pela renderização da interface e pela interação com as views.

Por exemplo, usando SwiftUI para criar uma view de texto:

```swift
Text("SwiftSlim")
```

Esses são códigos usados para construir e controlar elementos da interface, interagindo diretamente com a UI.

### Exemplo básico

Abaixo está um exemplo simples de SwiftUI:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Neste exemplo:

**Código SwiftUI**: `VStack`, `Image`, `Text` e `padding` pertencem ao SwiftUI e são responsáveis pela exibição e pelo layout da interface.

**Código Swift**: o comentário `//` no topo do arquivo e `import SwiftUI` fazem parte da estrutura de código Swift; o `#Preview` na parte inferior é um macro usado para pré-visualização no Xcode e não participa da renderização real da interface.

### Exemplo avançado

Em projetos reais, Swift e SwiftUI costumam ser usados em conjunto para desempenhar as tarefas em que cada um é melhor:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Neste exemplo:

**Código SwiftUI**: `@State` é um property wrapper específico do SwiftUI, usado para declarar o estado mutável da view; `Button` e `Text` são componentes de view do SwiftUI, responsáveis pela exibição da interface e pela interação do usuário.

**Código Swift**: `private var name` e `func printName()` são códigos Swift, usados para armazenar dados e executar lógica, sem afetar diretamente a renderização da view.

Quando o usuário toca no botão, o SwiftUI aciona o código de operação dentro do botão:

```swift
Button("Print") {
    printName()
}
```

Nesse trecho, `Button` é um componente do SwiftUI, enquanto a função `printName()` executada é código Swift, responsável pelo processamento lógico específico.

Essa colaboração permite que Swift e SwiftUI se integrem sem fricção: Swift cuida dos dados e da lógica, enquanto SwiftUI cuida da apresentação da interface.

## Onde o código Swift e SwiftUI costuma ser escrito?

No SwiftUI, a interface é construída pela view retornada pela propriedade `body`. Portanto, todo o código usado para descrever a interface normalmente é escrito dentro de `body`.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Nesse exemplo, `Text` é um componente de view do SwiftUI, então ele precisa estar dentro de `body`, porque o SwiftUI lê `body` para gerar a interface.

Já o código não relacionado diretamente à interface, como variáveis, funções ou lógica de processamento de dados, normalmente é escrito fora de `body`. Por exemplo:

```swift
struct ContentView: View {

    // Swift: dados ou lógica
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interface
    var body: some View {
        Text(name)
    }
}
```

Vale notar que, dentro de `body`, ainda podemos usar sintaxe Swift, como `if`, `for` e outros controles de fluxo. Eles apenas servem para controlar a geração das views do SwiftUI:

```
if isLogin {
    Text("Welcome")
}
```

Portanto, no desenvolvimento com SwiftUI, você pode entender de forma simples que: o código de view (`Text`, `Image`, `Button` etc.) normalmente é escrito dentro de `body`; o código de dados e lógica (variáveis, funções etc.) normalmente é escrito fora de `body`.

## Arquivos Swift

À medida que avançarmos nos estudos, também entraremos em contato com a arquitetura MVVM, em que as camadas `ViewModel` e `Model` normalmente são compostas por código Swift puro, completamente separadas da camada de view (SwiftUI).

Por exemplo, uma classe usada para gerenciar o estado do aplicativo:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Ou uma struct que descreve uma estrutura de dados:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

A responsabilidade desse tipo de arquivo é gerenciar e persistir dados, sem exibição direta na interface, portanto ele pertence inteiramente ao Swift.

## Contexto histórico

Para entender a relação entre Swift e SwiftUI, também é necessário conhecer a evolução das tecnologias de desenvolvimento da Apple. Até 2026, essa stack técnica já passou por várias iterações.

### História do Swift

Antes do surgimento do Swift, Objective-C era a principal linguagem de programação das plataformas Apple, com suporte para código misto com a linguagem C. Sua sintaxe era relativamente verbosa, o que elevava a barreira de entrada para iniciantes:

```Obj-c
// Forma de escrever em Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Em 2014, a Apple lançou a linguagem Swift na WWDC. Swift tem uma sintaxe mais moderna e maior segurança de tipos, e foi gradualmente substituindo Objective-C como linguagem principal de desenvolvimento:

```swift
// Forma de escrever em Swift
let name = "Fang"
print("Hello, \(name)")
```

No entanto, Objective-C não desapareceu da história. Ele ainda é amplamente usado em muitos projetos legados e frameworks de baixo nível. Entender sua sintaxe básica ainda tem valor para manter projetos antigos e compreender melhor as camadas internas do sistema.

### História do SwiftUI

Antes do SwiftUI, o iOS usava **UIKit** e o macOS usava **AppKit**. Esses dois frameworks adotavam um estilo de programação “imperativo”. Os desenvolvedores precisavam arrastar controles no Storyboard ou escrever código manualmente para controlar o estado das views. Isso gerava muito código e alto custo de manutenção, especialmente quando a lógica de interface era complexa.

![storyboard](../../RESOURCE/010_xcode.png)

Em 2019, a Apple lançou oficialmente o SwiftUI na WWDC. SwiftUI introduziu o paradigma de programação “declarativa”, simplificando de forma significativa o processo de desenvolvimento de UI.

![storyboard](../../RESOURCE/010_xcode1.png)

É importante notar que SwiftUI não é uma implementação totalmente independente no nível mais baixo. Em cada plataforma, ele funciona essencialmente em cooperação e ponte com UIKit (iOS) ou AppKit (macOS), ainda dependendo desses dois frameworks na base.

### Relação entre Swift e UIKit/AppKit

Embora Swift seja uma linguagem de programação geral que pode rodar em várias plataformas Apple, ela não substitui completamente UIKit ou AppKit. Para algumas necessidades de interface mais complexas, ou para recursos que o SwiftUI ainda não cobre, ainda é necessário recorrer ao UIKit ou AppKit.

Por exemplo, UIKit já é muito maduro no tratamento de gerenciamento complexo de view controllers, efeitos de animação, reconhecimento de gestos e outros aspectos, acumulando ampla validação em produção. Embora o SwiftUI continue evoluindo nessas áreas, ainda existem limitações em alguns cenários de borda.

Por isso, muitos desenvolvedores usam SwiftUI junto com UIKit (ou AppKit) dentro do mesmo projeto, aproveitando plenamente as vantagens de cada um.

Vendo por esse ângulo, é possível entender SwiftUI como um encapsulamento de nível mais alto sobre UIKit / AppKit. Ao estudar SwiftUI, conhecer também os conceitos básicos de UIKit e AppKit ajuda a tomar decisões técnicas mais adequadas ao manter projetos antigos ou implementar funcionalidades complexas.

## Resumo

**Swift**: usado principalmente para escrever lógica, processamento de dados, fluxo de controle etc., sem relação direta com o layout da interface.

**SwiftUI**: usado para construir a interface do usuário de forma declarativa; o código do conteúdo e do layout das views pertence ao SwiftUI.

No desenvolvimento real, Swift e SwiftUI normalmente são usados em conjunto: Swift cuida da lógica, SwiftUI cuida da interface.

De Objective-C e UIKit até Swift e SwiftUI, o ambiente de desenvolvimento da Apple foi evoluindo gradualmente para uma forma mais moderna e concisa de programar, mas UIKit e AppKit continuam relevantes em muitos projetos tradicionais.

Ao entender a relação entre Swift e SwiftUI, podemos desenvolver para iOS/macOS com mais eficiência e também fazer escolhas técnicas mais razoáveis ao manter projetos antigos.
