# Começando pelo ContentView

## Preparação antes da aula

Nesta aula, começaremos pelo arquivo ContentView.swift para conhecer de forma sistemática a estrutura básica do SwiftUI, incluindo:

* Comentários
* Estrutura de View
* Layouts VStack / HStack / ZStack
* Ícones do SF Symbols
* Modificadores de view (modifier)
* Código de pré-visualização #Preview

Primeiro, localize o projeto Xcode criado anteriormente e clique duas vezes no arquivo .xcodeproj.

Na área de navegação Navigator à esquerda, selecione o arquivo ContentView.swift.

Observação: toda vez que você abrir o projeto, o Canvas pode mostrar "Preview paused". Basta clicar no botão de atualizar para restaurar a pré-visualização.

![Swift](../../RESOURCE/002_view7.png)

## Conhecendo o ContentView

Código do ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

Embora o código seja pequeno, ele já contém a estrutura central do SwiftUI.

### 1. Comentários

No topo do arquivo:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Isso é um comentário de arquivo, usado para registrar informações do arquivo, incluindo nome do arquivo, nome do projeto, autor e data de criação.

Em Swift, usa-se `//` para comentários de uma linha:

```swift
// Isto é um comentário
```

Os comentários podem melhorar a legibilidade do código e ajudar o desenvolvedor a entender a lógica.

No desenvolvimento real, o código pode ficar obscuro e difícil de entender. Se você não escrever comentários, pode acabar, três dias depois, sem entender o próprio código.

Por isso, adicionar comentários de forma ativa durante a escrita do código é um bom hábito de desenvolvimento. Usar comentários para registrar a lógica facilita a manutenção posterior.

**Desativar temporariamente um trecho de código**

Os comentários também podem ser usados para desativar temporariamente trechos de código e ajudar na investigação de problemas.

Por exemplo:

```
A
B
C
```

A, B e C são três trechos de código, e um deles contém erro. Podemos comentar temporariamente os trechos para investigar.

Primeiro, adicionamos comentário em A:

```
// A
B
C
```

Se, após comentar A, o código voltar ao normal, isso significa que o problema está no código A.

Se o problema continuar mesmo com A comentado, podemos comentar B em seguida, e assim por diante, até encontrar o trecho com problema.

Durante o desenvolvimento, surgem muitos problemas. Na maior parte do tempo, precisamos comentar partes do código para investigar a causa, o que ajuda a localizar o trecho problemático e encontrar o BUG.

No Xcode, você pode usar o atalho:

```
Command ⌘ + /
```

para adicionar ou remover comentários rapidamente.

### 2. Importar o framework SwiftUI

```swift
import SwiftUI
```

Este código indica a importação do framework SwiftUI.

Os tipos `View`, `Text`, `Image`, `VStack` e outros do SwiftUI vêm desse framework.

Se o framework SwiftUI não for importado, o Xcode mostrará o erro:

```
Cannot find type 'View' in scope
```

Isso significa que o compilador não consegue reconhecer o tipo `View`.

### 3. Estrutura de View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Ao ver essa estrutura `View` pela primeira vez, você pode achá-la estranha, porque ela contém palavras-chave como `struct`, `View`, `var`, `body` e `some`.

Ainda não estudamos essas palavras-chave. Por enquanto, basta saber que esse trecho cria uma view chamada `ContentView`.

Você pode entender `View` como uma tela ou quadro de desenho sobre o qual podemos desenhar, e a ferramenta de desenho é o SwiftUI.

Por exemplo:

![Swift](../../RESOURCE/002_view.png)

A imagem acima mostra três páginas, que na prática são três Views.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Quando desenvolvemos um app com SwiftUI, cada página é uma View.

### 4. Código SwiftUI

Dentro da View, temos o seguinte código SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Esse código SwiftUI representa um layout vertical que exibe um ícone e um texto.

![Swift](../../RESOURCE/002_view1.png)

#### Layout VStack

```swift
VStack { }  // Layout vertical
```

`VStack` representa um contêiner de layout vertical. As views internas são organizadas de cima para baixo.

![Swift](../../RESOURCE/002_view8.png)

Os três layouts mais comuns no SwiftUI são:

* VStack —— organização vertical
* HStack —— organização horizontal
* ZStack —— organização sobreposta (eixo Z)

```swift
HStack { }  // Organização horizontal
ZStack { }  // Organização sobreposta
```

Diagrama de organização de cada layout:

![Swift](../../RESOURCE/002_view2.png)

Por exemplo, usando `HStack` para organização horizontal:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Você pode ver que o ícone do globo e o texto são exibidos lado a lado.

![Swift](../../RESOURCE/002_view3.png)

Quando queremos organizar horizontalmente, usamos `HStack`. Quando precisamos sobrepor elementos, usamos `ZStack`.

#### Image e SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Esse trecho exibe um ícone de globo, vindo do sistema de ícones SF Symbols da Apple.

![Swift](../../RESOURCE/002_view9.png)

O significado do código é exibir um ícone de globo, em tamanho grande, com cor de destaque.

Além do globo, também podemos exibir outros ícones.

Por exemplo, exibir uma mochila:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Como exibir outros ícones?**

Precisamos usar a biblioteca oficial de ícones do sistema da Apple, o SF Symbols.

Abra o site oficial do Apple Developer e baixe o [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Abra o aplicativo SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

No lado esquerdo ficam as categorias de símbolos, e no lado direito, os ícones correspondentes.

Clique com o botão direito em um ícone e escolha "Copiar 1 nome"; esse nome corresponde ao conteúdo da string.

Por exemplo:

```
"globe"
"backpack"
"heart"
```

Coloque o nome copiado do ícone dentro de `Image(systemName:)`, e assim será possível exibir diferentes ícones.

Observação: cada ícone do SF Symbols tem uma versão mínima de sistema suportada. Se a versão do sistema for muito antiga, o ícone pode não aparecer. É necessário verificar as informações de compatibilidade no app SF Symbols.

#### Modificadores

No SwiftUI, modificadores (`modifier`) são métodos usados para alterar a aparência ou o comportamento de uma view.

Você pode entender os modificadores como roupas: vestindo roupas diferentes, a aparência exibida também será diferente.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` e `foregroundStyle` são modificadores da view `Image`, que alteram a aparência da `Image` sem mudar o seu conteúdo.

**1. imageScale**

```swift
.imageScale(.large)
```

Ele pode controlar o tamanho dos ícones SF Symbols:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Podemos alterar essas opções para fazer o símbolo SF Symbols aparecer em tamanhos diferentes.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` pode controlar a cor de primeiro plano.

`.tint` representa a cor de destaque do ambiente atual (`accent color`), que por padrão no iOS é azul.

Se quisermos mudar a cor de primeiro plano para vermelho:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### View Text

`Text` é uma view de texto, usada para exibir strings.

```swift
Text("Hello, world!")
```

Por exemplo, exibir meu nome:

```swift
Text("FangJunyu")
```

Observação: a string deve estar obrigatoriamente entre aspas duplas `""`.

Você pode tentar exibir seu nome, número de telefone e outros conteúdos.

#### padding

No SwiftUI, `padding` é usado para adicionar espaço em branco entre o conteúdo da view e sua borda. Ele pertence ao conceito de “espaçamento interno” (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

O código acima indica que a view `HStack` recebe o espaçamento padrão do sistema.

**O que é padding?**

`padding` representa a “área em branco entre o conteúdo da view e sua borda”.

Na imagem abaixo, após aplicar `padding` ao `HStack` azul, a área azul recua para dentro, parecendo “encolher um pouco”.

![Swift](../../RESOURCE/002_view6.png)

**Espaçamento padrão**

O modificador `padding()` usa por padrão o espaçamento recomendado pelo sistema.

```swift
.padding()
```

Esse valor pode variar conforme a plataforma e o contexto. Por exemplo:

* No iOS, normalmente é cerca de 16 pt.
* No macOS ou watchOS, o espaçamento padrão do sistema pode ser diferente, geralmente maior ou menor, dependendo das diretrizes de design de cada plataforma.

**Espaçamento personalizado**

Também é possível definir espaçamento específico para a view.

1. Definir uma única direção

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Explicação das direções:

* .top: margem superior
* .bottom: margem inferior
* .leading: margem frontal
* .trailing: margem traseira

![Swift](../../RESOURCE/002_view12.png)

Observação: `leading` e `trailing` se adaptam automaticamente à direção do idioma. Por exemplo, em ambientes em árabe (RTL), eles se invertem automaticamente.

2. Definir múltiplas direções

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Você pode usar um array para especificar várias direções ao mesmo tempo. O uso detalhado de arrays será explicado em aulas futuras; aqui, basta conhecer essa forma de escrita.

3. Definir direção horizontal ou vertical

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Equivale a:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Remover o espaçamento**

Se você não quiser nenhum espaçamento, pode usar `.padding(0)` para removê-lo:

```swift
.padding(0)
```

Ou simplesmente remover o modificador `padding`:

```swift
// .padding()
```

### 6. Código de pré-visualização Preview

```swift
#Preview {
    ContentView()
}
```

Esse trecho indica que uma pré-visualização da view `ContentView` será gerada no Canvas.

Observação: `#Preview` é uma nova sintaxe introduzida no Swift 5.9 / Xcode 15. Antes disso, usava-se a estrutura `PreviewProvider`.

**O que acontece se comentarmos o Preview?**

Se comentarmos o `Preview`:

```swift
// #Preview {
//    ContentView()
// }
```

O Canvas deixará de exibir conteúdo renderizável.

![Swift](../../RESOURCE/002_xcode.png)

É o `#Preview` que controla a exibição da pré-visualização no Canvas.

Quando precisamos visualizar uma view SwiftUI no Xcode, adicionamos o código de pré-visualização `#Preview`. Se não precisarmos de visualização, podemos comentar ou remover esse código.

## Resumo

Embora o arquivo ContentView.swift tenha pouco código, ele cobre vários conceitos centrais do SwiftUI. Para iniciantes, esse código pode parecer estranho, mas, ao desmontar sua estrutura, é possível construir um entendimento inicial do SwiftUI.

Relembrando o conteúdo desta aula, primeiro estudamos os comentários `//`, que podem ser usados para explicar a lógica do código ou desativar temporariamente um trecho.

Em seguida, vimos que arquivos SwiftUI precisam importar o framework SwiftUI:

```swift
import SwiftUI
```

Sem importar o framework, o compilador não conseguirá reconhecer tipos como `View`.

Depois, conhecemos a estrutura básica de uma view SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Nela, `ContentView` é o nome da view.

Também estudamos três contêineres de layout comuns: `VStack` (organização vertical), `HStack` (organização horizontal) e `ZStack` (organização sobreposta).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Nesse trecho de código, o significado é exibir um contêiner com organização vertical, contendo um ícone e um texto.

`Image` pode exibir ícones do SF Symbols, e os modificadores podem controlar o tamanho e a cor do ícone.

A view `Text` pode exibir conteúdo textual.

`padding` é o espaçamento, que adiciona um espaço transparente ao redor da view.

Por fim, temos a view de pré-visualização `#Preview`, que permite exibir a view no Canvas.

### Exercícios após a aula

Para iniciantes, o conteúdo desta aula pode parecer relativamente complexo. Podemos reforçar a compreensão com alguns exercícios adicionais:

* Alterar o nome do ícone SF Symbols
* Alterar a cor de primeiro plano do ícone para preto
* Trocar `VStack` por `HStack`
* Comentar `Image` ou `Text` e observar as mudanças na pré-visualização

### Bônus: preenchimento automático de código (Code Completion)

Ao digitar código, você talvez já tenha percebido que o Xcode exibe automaticamente uma lista de opções disponíveis.

Por exemplo, ao modificar o modificador `imageScale`:

```swift
.imageScale(.)
```

O Xcode exibirá as opções disponíveis:

![Swift](../../RESOURCE/002_view10.png)

Isso faz parte do mecanismo de preenchimento automático de código (`Code Completion`). Ele se baseia em inferência de tipo e sugestões de membros de enumeração, podendo aumentar a eficiência da digitação e reduzir erros.

Nas aulas futuras, apresentaremos formalmente as enumerações (`enum`). Por enquanto, basta ter uma noção inicial desse conceito.
