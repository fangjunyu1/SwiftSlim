# Variáveis e constantes

Nesta aula, vamos estudar principalmente variáveis e constantes em Swift, além de conhecer alguns tipos de dados comuns e operadores básicos.

Esses conteúdos são os conhecimentos mais fundamentais da programação e também uma base importante para o aprendizado posterior de SwiftUI.

## Variáveis e constantes na vida cotidiana

Podemos entender variáveis e constantes por meio de coisas do dia a dia.

Variáveis na vida cotidiana:

* O conteúdo exibido em cada programa da televisão é diferente
* O clima de cada dia não é igual
* O relógio muda a cada segundo

A característica em comum dessas coisas é: elas mudam.

Se a televisão tivesse sempre uma única imagem, o clima fosse sempre ensolarado e os ponteiros do relógio nunca se movessem, então essas coisas seriam constantes.

Uma pode mudar, a outra não pode mudar.

## Entendendo variáveis e constantes

No desenvolvimento de apps, normalmente é preciso que o usuário preencha ou salve algumas informações.

Por exemplo:

* Nome da conta
* Data de nascimento
* Informações de contato
* Endereço

Essas informações serão salvas e exibidas.

Por exemplo, o usuário insere um nome no app:

```id="tz8a4o"
FangJunyu
```

Precisamos salvar esse nome para que ele possa ser exibido no app.

Podemos entender o processo de salvar de forma simples assim: guardar algo dentro de uma gaveta.

Quando salvamos um nome, é como se estivéssemos colocando esse nome dentro de uma gaveta.

Pode haver muitas coisas para salvar, e também haverá muitas gavetas. Para saber o que há em cada gaveta, precisamos dar um nome a ela.

Por exemplo:

```id="55hvoq"
name
```

Nesse exemplo, `name` é o nome, e `FangJunyu` é a informação salva.

![Var](../../RESOURCE/007_var.png)

**Em Swift, se você precisar salvar dados, obrigatoriamente deve declará-los usando uma variável (`var`) ou uma constante (`let`).**

Como um nome normalmente pode ser alterado, devemos usar uma variável.

```swift id="2h9z0z"
var name = "FangJunyu"
```

Aqui foi declarada uma variável chamada `name`, com tipo `String`, e valor `"FangJunyu"`.

### Diferença entre variável e constante

Variáveis são declaradas com `var`:

```swift id="4031pr"
var
```

Constantes são declaradas com `let`:

```swift id="v30m0x"
let
```

Por exemplo:

```swift id="tpc4m4"
var name = "FangJunyu"
let id = 123456
```

Se for declarada como variável, significa que esse valor pode ser modificado; se for declarada como constante, ele não poderá mais ser modificado.

Portanto, a principal diferença entre variáveis e constantes é: se o valor pode ou não ser alterado.

### Modificar uma constante

Se o código tentar modificar o valor de uma constante:

```swift id="ch9quf"
let name = "Sam"
name = "Bob"
```

O Swift indicará que não é possível concluir a atribuição, porque isso é uma constante.

```id="hgyc1l"
Cannot assign to property: 'name' is a 'let' constant
```

Esse mecanismo pode ajudar o desenvolvedor a evitar que alguns dados importantes sejam modificados acidentalmente.

### Exibir no SwiftUI

Abra o arquivo ContentView.swift e declare uma variável dentro da View:

```swift id="yw6clo"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Aqui foi declarada uma variável chamada `name`, e ela é exibida na interface por meio de `Text`.

Se modificarmos o conteúdo da variável:

```swift id="63fowz"
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

O texto exibido por `Text` também mudará.

Dessa forma, podemos usar variáveis para controlar o conteúdo exibido na interface, sem precisar alterar diretamente o texto dentro de `Text` toda vez.

Se outro lugar precisar obter essa informação, também podemos passar a variável adiante, o que equivale a entregar para outro lugar o conteúdo guardado dentro da “gaveta”.

### Posição de variáveis e constantes no SwiftUI

No SwiftUI, variáveis e constantes geralmente são escritas fora de `body`:

```swift id="7gk8ir"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Claro que também é possível escrever variáveis e constantes dentro de `body`:

```swift id="wvj0t1"
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Mas existe uma diferença importante entre os dois casos:

* Se variáveis e constantes forem escritas dentro de `body`, elas serão recriadas toda vez que a view for recalculada.
* Se forem escritas fora de `body`, elas existirão como propriedades da estrutura da view, deixando a estrutura do código mais clara.

Por isso, no desenvolvimento real, variáveis e constantes normalmente são escritas fora de `body`.

## Tipos de dados

Variáveis podem guardar muitos tipos diferentes de dados, e esses tipos são chamados de tipos de dados.

Por exemplo, anteriormente usamos `Text` para exibir texto:

```swift id="5w0j3i"
Text("Hello, World")
```

Aqui, `"Hello, World"` pertence ao tipo string (`String`).

String é usada para representar conteúdo textual. Em Swift, ela precisa ser envolvida por aspas duplas `""`.

Por exemplo:

```swift id="bgc87f"
var hello = "Hello, World"
```

Além de strings, Swift também possui muitos outros tipos de dados.

Na fase inicial de aprendizagem, os quatro tipos mais comuns são:

* String
* Int
* Double
* Bool

Esses quatro tipos conseguem cobrir a maior parte do processamento básico de dados.

**String**

`String` representa conteúdo textual. Por exemplo:

```swift id="j1beyu"
var name = "FangJunyu"
var city = "Rizhao"
```

Strings normalmente são usadas para representar: nome de usuário, título e conteúdo textual.

**Int**

`Int` representa números inteiros, ou seja, inteiros sem casas decimais.

Por exemplo:

```swift id="32xmf8"
var age = 26
var count = 100
```

Números inteiros normalmente são usados para representar: idade, quantidade e contagem.

**Double**

`Double` representa números com casas decimais.

Por exemplo:

```swift id="jlwmcr"
var weight = 74.5
var height = 185.0
```

Em Swift, números decimais normalmente usam `Double` por padrão.

Existe outro tipo parecido chamado `Float`, mas ele pode representar uma faixa menor de valores. Por isso, no desenvolvimento real, `Double` é mais comum.

**Bool**

O tipo `Bool` é usado para representar dois estados: `true` e `false`.

Por exemplo:

```swift id="bqej2o"
var isShowAlert = true
var isLogin = false
```

O tipo `Bool` é frequentemente usado em julgamentos condicionais. Por exemplo, se deve ou não mostrar uma caixa de aviso.

Quando há apenas dois resultados possíveis, é muito adequado usar o tipo `Bool`.

### Exibir no SwiftUI

Quando exibimos um valor do tipo `String`, podemos usar `Text` diretamente:

```swift id="2en0po"
Text(name)
```

Mas tipos como `Int` e `Double` não são strings, então eles não podem ser usados diretamente como parte de um conteúdo textual.

Se quisermos exibir esses dados em `Text`, podemos usar interpolação de string (`String Interpolation`):

```swift id="4l1i4l"
\()
```

A interpolação de string precisa ser escrita dentro do conteúdo da string e envolver a variável ou constante com `\()`.

Por exemplo:

```swift id="7r2c1c"
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

No código acima, `""` representa uma string, e `\()` é usado para inserir variáveis ou constantes dentro da string.

Por exemplo:

```swift id="a0qtnl"
"DoubleNum: \(num * 2)"
```

O conteúdo exibido será:

```id="wi4pgj"
DoubleNum: 2
```

Dessa forma, podemos inserir variáveis ou constantes em strings e depois exibi-las na interface usando `Text`.

Dica: `\()` só pode ser usado dentro de uma string `""`.

## Operadores

Ao declarar uma variável ou constante, podemos ver a seguinte escrita:

```swift id="vkr73l"
var num = 1
```

Aqui, `=` é chamado de operador de atribuição.

Sua função é: atribuir o valor da direita à variável da esquerda.

Nesse exemplo, `1` é atribuído à variável `num`.

Além do operador de atribuição, também existem alguns operadores numéricos comuns:

* `+`
* `-`
* `*`
* `/`

Quando fazemos cálculos com números, por exemplo valores do tipo `Int` ou `Double`, usamos esses operadores.

Por exemplo:

```swift id="v5lskl"
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Depois de concluído o cálculo, o resultado será salvo na variável.

## Resumo

Variáveis, constantes e operadores são os conceitos mais básicos da programação.

Por meio de variáveis e constantes, podemos armazenar vários tipos de dados no programa; por meio dos tipos de dados, podemos definir com clareza a natureza desses dados; por meio dos operadores, podemos calcular e processar dados.

Esses conhecimentos são como ferramentas básicas do mundo da programação. Dominar esses conteúdos pode estabelecer uma base sólida para o aprendizado posterior de Swift e SwiftUI.
