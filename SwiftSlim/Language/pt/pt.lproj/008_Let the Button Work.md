# Fazer o botão começar a funcionar

Nesta lição, vamos estudar principalmente o botão `Button`, a saída de depuração com `print` e as funções em Swift.

Esses conteúdos são a base da programação interativa com SwiftUI.

## Botão

O botão é um dos controles de UI mais comuns. Quando precisamos baixar, abrir ou sair de algo, normalmente clicamos em um botão.

Por exemplo, na App Store, clicamos no botão “Obter” para baixar um app.

![Button](../../RESOURCE/008_button.png)

No SwiftUI, os botões são representados por `Button`.

Uso básico:

```swift
Button("") {
    
}
```

A estrutura pode ser dividida em duas partes:

```swift
Button("Texto do botão") {
    Código executado ao clicar no botão
}
```

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Ao executar, será exibido um botão `Start`.

![Button](../../RESOURCE/008_button1.png)

Quando o usuário clica no botão, o código dentro de `{}` é executado.

Observe que `Button` é um controle de interface (`View`) do SwiftUI, então ele deve ser escrito dentro de `body`.

### Modificador `buttonStyle`

No SwiftUI, `Button` oferece estilos de botão integrados ao sistema, que podem ser usados por meio do modificador `buttonStyle`.

Por exemplo:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` aplica um estilo de botão fornecido pelo sistema.

As opções mais comuns incluem:

* `.automatic`
* `.plain`
* `.bordered`
* `.borderedProminent`
* `.borderless`

![Button](../../RESOURCE/008_button7.png)

As diferenças entre os estilos aparecem principalmente em aspectos como borda, fundo e nível de destaque visual.

## Saída com `print`

Na programação, muitas vezes precisamos verificar se o programa chegou a determinado trecho de código.

Swift oferece a função `print` para exibir informações de depuração.

Forma básica:

```swift
print("Hello")
```

Essa linha envia o texto para o `Console`.

### Testando se o botão funciona

Podemos colocar `print` dentro do botão para testar se ele foi clicado.

```swift
Button("Start") {
    print("Test 123")
}
```

Quando o botão for clicado, o `Console` exibirá:

```
Test 123
```

Isso mostra que o botão foi acionado com sucesso.

![Button](../../RESOURCE/008_button3.png)

Atenção: `print` é código Swift, não é um controle de interface. Ele não pode ser colocado diretamente dentro de `body`, caso contrário ocorrerá erro.

Por exemplo, o código abaixo está errado:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Erro: body deve retornar uma View
    }
}
```

No SwiftUI, `body` é usado para descrever a estrutura da interface e só pode conter controles visuais (`View`), como `Text`, `Button`, `Image` etc.

Código comum (lógica de cálculo, `print` etc.) deve ser colocado dentro de botões, funções ou outros manipuladores de evento.

### Console

O conteúdo exibido por `print` aparece no `Console` do Xcode.

Se você não estiver vendo o `Console`, pode clicar no botão `Show the Debug Area` no canto inferior direito para abrir a área de depuração e depois clicar em `Show the Console` para exibir o console.

![](../../RESOURCE/008_button4.png)

No canto inferior esquerdo do `Console`, há duas abas: `Executable` e `Previews`.

![](../../RESOURCE/008_button5.png)

Essas duas abas correspondem a ambientes de execução diferentes: quando você estiver usando a visualização `Canvas`, a saída do `print` aparecerá na aba `Previews`; se o app estiver rodando no simulador ou em um dispositivo real, a saída aparecerá na aba `Executable`.

Portanto, se você perceber que `print` não mostrou nada, primeiro confirme se a aba correta está selecionada.

## Exemplo — Arte ASCII

Em alguns projetos de código, é comum encontrar arte ASCII.

Arte ASCII é um desenho formado por caracteres comuns. Por exemplo:

![ASCII](../../RESOURCE/008_ascii.png)

Podemos usar botão + `print` para exibir uma arte ASCII.

Código de exemplo:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Quando o botão for clicado, o `Console` exibirá:

```
 /\_/\
( o.o )
 > ^ <
```

Observe: dentro da string, `\` precisa ser escrito como `\\`, porque a barra invertida é um caractere de escape em strings.

## Funções

Dentro de um botão, podemos escrever código diretamente.

Por exemplo:

```swift
Button("Start") {
    print("Hello")
}
```

Se houver pouco código, isso não é um problema. Mas, no desenvolvimento real, a lógica acionada por um botão pode ser bem maior.

Por exemplo:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Pode haver muito mais código
}
```

Se o código continuar crescendo, escrevê-lo diretamente dentro do botão deixará o código da interface confuso e difícil de ler e manter.

Por isso, normalmente organizamos esse código em uma função e depois chamamos essa função dentro do botão.

### O que é uma função

Uma função é um bloco de código reutilizável.

Quando certo código precisa ser executado, basta chamar essa função para rodar o código dentro dela.

Isso deixa a estrutura do código mais clara e também facilita a reutilização.

### Forma básica

Em Swift, as funções são definidas com a palavra-chave **func**:

```swift
func randomInt() {
    // code
}
```

Esse código define uma função.

`randomInt` é o nome da função, usado para identificar esse bloco de código.

`()` representa o local dos parâmetros, onde podemos receber dados vindos de fora. Se não for necessário receber dados, pode ficar vazio.

Dentro de `{}` fica a área de código da função, onde todo o código a ser executado deve ser escrito.

Por exemplo:

```swift
func getName() {
    print("FangJunyu")
}
```

A função acima serve para exibir um texto.

### Chamando uma função

Definir uma função apenas cria esse bloco de código. Para executá-la, ainda é preciso chamá-la.

A forma de chamar é escrever o nome da função seguido de `()`:

```swift
getName()
```

Quando o programa executar essa linha, o código dentro de `getName` será executado.

Exemplo completo:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Após executar, o `Console` exibirá:

```
FangJunyu
```

### Usando funções no SwiftUI

Em uma `View` do SwiftUI, normalmente as funções são escritas fora de `body`.

Por exemplo:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Quando o botão for clicado, `getName()` será chamado.

Isso ajuda a manter o código da interface limpo, enquanto a lógica específica fica dentro da função.

### Parâmetros de função

Às vezes, uma função precisa executar ações diferentes com base em dados diferentes.

Por exemplo, podemos querer que a função exiba nomes diferentes, em vez de mostrar sempre `"FangJunyu"`.

Nesse caso, usamos parâmetros. Os parâmetros podem ser entendidos como os dados passados no momento em que a função é chamada.

Por exemplo:

```swift
func getName(name: String) {
    print(name)
}
```

Essa função tem um novo parâmetro. `name` é o nome do parâmetro e `String` é o tipo do parâmetro.

Isso significa que a função precisa receber um dado do tipo `String`.

Como a função agora precisa de um dado, ao chamá-la é obrigatório fornecer esse dado.

```swift
getName(name: "Sam")
```

Ao passar `"Sam"` na chamada, a função usará esse valor para exibição.

Resultado da execução:

```
Sam
```

## Exemplo — Usando função para exibir arte ASCII

No exemplo anterior, colocamos `print` diretamente dentro do botão.

Mas, se a arte ASCII ficar mais complexa, o código ficará muito longo. Nesse caso, podemos mover a lógica para uma função, deixando o código da interface mais claro.

Código de exemplo:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Depois de executar, ao clicar no botão, o `Console` exibirá:

```
 /\_/\
( o.o )
 > ^ <
```

Aqui acontecem duas coisas quando o usuário clica no botão:

1. O botão chama a função `printCat()`
2. O código `print` dentro da função é executado

Dessa forma, o código da interface fica responsável apenas por disparar o evento, enquanto a lógica específica é tratada pela função.

No desenvolvimento real, a maior parte das ações de botões é implementada por meio de funções.

## Resumo

Nesta lição, estudamos três pontos importantes:

**1. Botão `Button`**

`Button` é o controle do SwiftUI usado para disparar ações.

```swift
Button("Start") {

}
```

Quando o usuário clica no botão, o código entre chaves é executado.

**2. Saída com `print`**

`print` é usado para enviar informações de depuração ao `Console`.

```swift
print("Hello")
```

O desenvolvedor pode usar o `Console` para verificar o estado de execução do programa.

**3. Funções**

Uma função é um bloco de código reutilizável.

```swift
func sayHello() {
    print("Hello")
}
```

Chamando a função:

```swift
sayHello()
```

Se a função precisar de dados, podemos usar parâmetros:

```swift
func sayHello(name: String) {
    print(name)
}
```

Nas próximas lições, continuaremos estudando mais controles do SwiftUI e como os dados interagem com a interface.

## Exercício

Tente concluir os exercícios abaixo:

1. Crie um botão com o texto `"Hello"`
2. Ao clicar no botão, exiba `Hello Swift` no `Console`
3. Coloque o código de saída em uma função e depois chame essa função dentro do botão
