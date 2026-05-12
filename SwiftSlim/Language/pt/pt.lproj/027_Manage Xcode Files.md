# Gerenciar arquivos do Xcode

Nesta aula, vamos aprender operações comuns com arquivos no Xcode.

Nas aulas anteriores, escrevemos a maior parte do código em `ContentView`. Isso facilita observar o código e o resultado exibido.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Mas, em um App real, normalmente não colocamos todo o código em um único arquivo.

Quando há cada vez mais páginas, componentes e funcionalidades, precisamos separar diferentes views em diferentes arquivos SwiftUI.

Por exemplo:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Isso deixa a estrutura do código mais clara e também facilita a manutenção e as alterações posteriores.

## Por que gerenciar arquivos

No SwiftUI, uma página ou um componente geralmente pode ser escrito como um arquivo de view independente.

Por exemplo:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Aqui, `CardView` é uma view SwiftUI.

Se todas as views forem escritas dentro de `ContentView`, o código ficará cada vez mais longo e cada vez mais difícil de ler.

Por isso, precisamos aprender a criar, renomear e excluir arquivos, além de usar pastas para gerenciar diferentes arquivos de código.

## Criar um arquivo SwiftUI

No Xcode, normalmente há duas formas comuns de criar um arquivo SwiftUI:

Uma é criar um arquivo vazio e depois escrever o código manualmente.

A outra é criar um arquivo de modelo SwiftUI, deixando o Xcode gerar automaticamente o código básico.

Para iniciantes, é mais recomendado usar o arquivo de modelo SwiftUI, porque ele gera automaticamente a estrutura básica.

### Criar um arquivo vazio

Na área Navigator à esquerda do Xcode, clique com o botão direito em uma área vazia ou em uma pasta e escolha `New Empty File`.

A posição da operação é a seguinte:

![xcode](../../../Resource/027_view1.png)

Depois de criar um arquivo vazio, o Xcode geralmente gera um arquivo Swift sem nome, como `Untitled.swift`.

Podemos renomeá-lo para `TestView.swift`.

Em um projeto SwiftUI, se esse arquivo for usado para exibir uma view, normalmente é recomendado adicionar `View` ao final do nome.

Por exemplo:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Isso não é uma regra obrigatória, mas nos permite perceber de imediato que se trata de um arquivo de view.

Depois de criar um arquivo vazio, ele pode conter apenas comentários padrão ou pode estar em branco, dependendo da versão do Xcode e do método de criação.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Neste momento, precisamos escrever manualmente o código SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Assim, um arquivo simples de view SwiftUI foi criado.

### Renomear arquivo

Se, depois de criar o arquivo, você quiser modificar o nome dele, selecione o arquivo na área Navigator à esquerda do Xcode e pressione a tecla Enter `⏎`.

![xcode](../../../Resource/027_view2.png)

Assim, é possível modificar o nome do arquivo.

É importante observar que modificar o nome do arquivo não modifica automaticamente o nome da view no código.

Por exemplo, depois que o nome do arquivo for alterado para `ProfileView.swift`, o código ainda pode estar como `struct TestView: View`.

Embora isso não necessariamente cause erro, pode facilmente gerar confusão.

Por isso, é recomendado manter o nome do arquivo e o nome da view consistentes. Por exemplo, se o nome do arquivo for `ProfileView.swift`, o nome da view também deve usar `ProfileView`.

## Criar um arquivo de modelo SwiftUI

Além de criar um arquivo vazio, também podemos criar diretamente um arquivo de modelo SwiftUI.

Na área Navigator à esquerda do Xcode, clique com o botão direito em uma área vazia ou em uma pasta e escolha `New File from Template...`.

A posição da operação é a seguinte:

![xcode](../../../Resource/027_view3.png)

Na janela exibida, você pode escolher diferentes plataformas na parte superior, como `iOS`, `macOS` etc.

Aqui, basta manter selecionada a plataforma correspondente ao projeto atual. Por exemplo, se estamos criando um App para iOS, escolha `iOS`.

![xcode](../../../Resource/027_view4.png)

Depois, selecione `SwiftUI View` na parte inferior.

![xcode](../../../Resource/027_view12.png)

Em seguida, clique em `Next`, digite o nome do arquivo e salve.

Por exemplo, criamos um arquivo `Test2View.swift`.

O Xcode gerará automaticamente um código parecido com este:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Em comparação com o arquivo vazio, o arquivo de modelo inclui automaticamente `import SwiftUI`, `struct`, `body` e `#Preview`.

Portanto, para iniciantes, usar um arquivo de modelo SwiftUI é mais simples e também torna menos provável esquecer alguma parte do código.

**Dica**: além de criar arquivos com o botão direito, você também pode clicar no botão de adição na parte inferior da área Navigator à esquerda do Xcode para criar arquivos ou pastas.

![xcode](../../../Resource/027_view5.png)

## Criar pasta

Quando há cada vez mais arquivos, podemos usar pastas para organizá-los.

Na área Navigator à esquerda do Xcode, clique com o botão direito em uma área vazia ou em uma pasta e escolha `New Folder`.

Depois de criar a pasta, você pode arrastar os arquivos relacionados para dentro dela.

![xcode](../../../Resource/027_view7.png)

As pastas são usadas principalmente para organizar a estrutura do projeto e não alteram a forma de uso da própria view.

Desde que o nome da view esteja correto, ainda é possível usá-la em outros arquivos com formas como `TestView()` e `Test2View()`.

## Excluir arquivo ou pasta

Se quiser excluir um arquivo ou uma pasta, selecione o item correspondente na área Navigator à esquerda do Xcode, clique com o botão direito e escolha `Delete`.

Você também pode selecionar o arquivo e pressionar a tecla Delete `⌫`.

O Xcode exibirá uma janela de confirmação de exclusão.

![xcode](../../../Resource/027_view10.png)

Escolher `Move to Trash` significa mover o arquivo para a Lixeira.

Se você vir `Remove Reference`, isso significa remover apenas a referência do projeto Xcode, sem excluir o arquivo original no disco.

Para iniciantes, se você estiver apenas excluindo um arquivo comum que acabou de criar, normalmente basta escolher `Move to Trash`.

## Exibir várias views SwiftUI

Depois de aprender a criar arquivos, podemos separar diferentes views em diferentes arquivos.

Por exemplo, criamos dois arquivos SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` é usado para exibir o nome do autor:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` é usado para exibir o fundo do cartão:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Depois, podemos usar essas duas views em `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Após executar, podemos ver `CardView` e `AuthorView` exibidos juntos de forma combinada:

![xcode](../../../Resource/027_view11.png)

Nesse resultado, `CardView` funciona como fundo e `AuthorView` aparece acima, porque ambos foram colocados dentro de `ZStack`.

Em `ContentView`, usamos essas duas views por meio de `CardView()` e `AuthorView()`. Os `()` depois do nome indicam que estamos criando e usando essa view.

Esse é um aninhamento de views comum no SwiftUI: dentro de uma view, podemos continuar usando outras views.

## Arquivo de entrada

Por fim, vamos revisar de onde o App começa a exibir a interface.

Em um projeto SwiftUI, normalmente há um arquivo de entrada:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Aqui, `@main` indica que esta é a posição de entrada do App.

Dentro de `WindowGroup`, vemos:

```swift
ContentView()
```

Isso significa que, depois que o App é iniciado, ele exibe primeiro `ContentView`.

Depois, dentro de `ContentView`, também são exibidos:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Portanto, a hierarquia de views pode ser entendida assim:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Se alterarmos a view exibida no arquivo de entrada para `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Então, depois que o App for iniciado, ele exibirá apenas `CardView`.

Ou seja, o `WindowGroup` no código de entrada decide qual view será exibida primeiro após a inicialização do App.

E, dentro dessa view, ainda é possível continuar exibindo outras views.

## Resumo

Nesta aula, aprendemos operações comuns de gerenciamento de arquivos no Xcode.

Vimos como criar arquivos SwiftUI, como renomear arquivos, como criar pastas e também como excluir arquivos.

Ao mesmo tempo, também aprendemos um conceito importante: as views SwiftUI podem ser separadas em diferentes arquivos e depois usadas em outras views.

Por exemplo:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Aqui, `CardView()` e `AuthorView()` são usos de outras views dentro de `ContentView`.

Por fim, também revisamos a lógica de exibição do arquivo de entrada.

Quando o App é iniciado, ele entra primeiro no código de entrada marcado com `@main` e depois exibe a view dentro de `WindowGroup`.

Isso nos ajuda a entender que diferentes arquivos SwiftUI não são isolados. Eles podem ser combinados entre si e, no fim, formar uma interface completa do App.
