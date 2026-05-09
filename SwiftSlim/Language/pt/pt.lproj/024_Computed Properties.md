# Propriedade Computada

Nesta lição, vamos aprender principalmente sobre propriedades computadas.

Uma propriedade computada é usada para calcular um novo resultado com base em dados já existentes. Ela pode calcular valores numéricos e também o conteúdo que precisa ser exibido em uma view SwiftUI.

Por exemplo:

```swift
let a = 10
let b = 20
let c = a + b
```

Aqui, `c` representa o resultado da soma de `a` e `b`.

Em código comum, esse tipo de escrita é muito frequente.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Dica: dentro do evento de clique de um `Button`, é possível executar código Swift comum.

Mas, se escrevermos um código parecido diretamente nas propriedades de uma view SwiftUI, encontraremos um problema.

Por exemplo:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Esse código gerará um erro.

À primeira vista, `a` e `b` já foram escritos antes de `c`, então parece que o valor de `c` poderia ser calculado.

Mas, ao declarar propriedades em uma estrutura, esse modo de escrita não pode ser usado diretamente.

## Por que c não pode ser calculado diretamente como a + b?

Porque `a`, `b` e `c` não são constantes temporárias dentro do evento de clique de um botão. Elas são propriedades da view `ContentView`.

Dentro do evento de clique de um botão, este código funciona normalmente:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Isso acontece porque, depois que o botão é clicado, o código é executado em ordem. Primeiro `a` é criado, depois `b` é criado e, por fim, `c` é calculado usando `a + b`.

Mas, ao declarar propriedades dentro de uma view, a situação é diferente:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Aqui, `a`, `b` e `c` são todas propriedades da view `ContentView`.

Quando a view `ContentView` é criada, o Swift precisa primeiro preparar essas propriedades. Para garantir que o processo de criação seja seguro, o Swift não permite que o valor padrão de uma propriedade armazenada de instância leia diretamente outras propriedades de instância da mesma instância.

Por isso, esta linha gerará um erro:

```swift
let c = a + b
```

De forma simples, podemos entender assim: **ao declarar propriedades dentro de uma view, não é possível usar diretamente uma propriedade comum para calcular outra propriedade comum.**

Esse tipo de propriedade, que armazena um valor diretamente, é chamado de “propriedade armazenada”. Para facilitar o entendimento, podemos tratá-la temporariamente como uma propriedade comum.

Por exemplo:

```swift
let a = 10
```

`a` armazena `10`.

```swift
let b = 20
```

`b` armazena `20`.

Mas:

```swift
let c = a + b
```

Aqui, `c` não é um valor fixo escrito diretamente. Espera-se que ele seja calculado por meio de `a + b`.

Em situações como essa, em que “um resultado é obtido com base em dados já existentes”, uma propriedade computada é mais adequada.

Podemos modificar o código assim:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Aqui, `c` é uma propriedade computada.

```swift
var c: Int {
    return a + b
}
```

O significado é: **quando for necessário usar `c`, `a` e `b` serão lidos, e o resultado de `a + b` será retornado.**

Por exemplo:

```swift
Text("c: \(c)")
```

Quando `Text` exibe `c`, o cálculo de `c` é executado.

## O que é uma propriedade computada?

Uma propriedade computada parece uma variável, mas ela própria não armazena dados.

Por exemplo:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Aqui, `c` é uma propriedade computada.

Ela não armazena um valor fixo como uma propriedade comum. Toda vez que `c` é lido, o código dentro de `{}` é executado novamente, e o resultado calculado é retornado.

Podemos entender assim:

```swift
var c: Int {
    return a + b
}
```

Quando `c` é necessário, `a + b` é calculado.

Portanto, uma propriedade computada é adequada para esta situação: **um resultado não precisa ser armazenado separadamente, porque ele pode ser calculado com base nos dados já existentes.**

## Sintaxe básica

Uma propriedade computada geralmente contém três partes:

```swift
var c: Int {
    return a + b
}
```

### 1. Declarar usando `var`

```swift
var c
```

Uma propriedade computada deve ser declarada usando `var`; não é possível usar `let`.

Isso acontece porque uma propriedade computada não é um valor fixo armazenado, mas um resultado calculado dinamicamente toda vez que é lido.

### 2. Indicar o tipo de retorno

```swift
var c: Int
```

Uma propriedade computada precisa indicar o tipo de retorno.

Aqui, `c` retornará um número inteiro, então o tipo é `Int`.

### 3. Escrever a lógica de cálculo dentro de {}

```swift
{
    return a + b
}
```

Dentro de `{}` escrevemos a lógica de cálculo. Aqui, o resultado retornado é `a + b`.

## A palavra-chave return

Uma propriedade computada precisa retornar um resultado.

Por exemplo:

```swift
var c: Int {
    return a + b
}
```

Aqui, `return` significa: retornar o resultado do cálculo de `a + b`.

Se a propriedade computada tiver apenas uma expressão que produz diretamente o resultado, `return` pode ser omitido:

```swift
var c: Int {
    a + b
}
```

Mas, se a propriedade computada tiver várias linhas de código, é necessário usar `return` para indicar claramente o resultado retornado.

Por exemplo:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Aqui, o processo de cálculo é dividido em duas etapas.

Primeiro, calculamos o preço total:

```swift
let total = count * price
```

Depois, juntamos o preço total em um texto e o retornamos:

```swift
return "Total：\(total) $"
```

Se removermos `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Esse código gerará um erro.

O motivo é: **essa propriedade computada já contém várias linhas de código, então o Swift não consegue determinar automaticamente qual linha é o resultado final a ser retornado.**

Portanto, quando uma propriedade computada tem apenas uma expressão que gera diretamente o resultado, `return` pode ser omitido.

```swift
var c: Int {
    a + b
}
```

Quando uma propriedade computada tem várias linhas de código, é recomendável escrever `return` explicitamente.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Diferença entre propriedade computada e propriedade comum

Uma propriedade comum armazena dados.

```swift
var c = 30
```

Aqui, `c` armazena um valor específico: `30`.

Uma propriedade computada não armazena dados.

```swift
var c: Int {
    a + b
}
```

Aqui, `c` não armazena `30`. Ela apenas fornece uma forma de cálculo.

Quando `c` é lido, o Swift executa:

```swift
a + b
```

Depois, retorna o resultado calculado.

Portanto, uma propriedade computada é adequada para situações em que o resultado precisa ser calculado com base em outros dados.

## body também é uma propriedade computada

Depois de aprender propriedades computadas, podemos entender novamente este trecho de código muito comum em SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Aqui, `body` também é uma propriedade computada.

Ela é declarada usando `var`:

```swift
var body
```

Ela tem um tipo de retorno:

```swift
some View
```

O conteúdo retornado dentro de `{}` é o conteúdo da view SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Portanto, podemos entender `body` assim: quando o SwiftUI precisa exibir essa view, ele lê `body` e cria a interface com base no conteúdo retornado por `body`.

Se escrevermos `return`, podemos entender assim:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Mas, em SwiftUI, geralmente omitimos `return` e escrevemos diretamente:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Quando os dados de `@State` mudam, o SwiftUI lê `body` novamente e atualiza a interface com base nos novos dados.

Por exemplo:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Depois que o botão é clicado, `count` muda.

```swift
count += 1
```

Depois que `count` muda, o SwiftUI recalcula `body`, então o texto na interface também é atualizado.

```swift
Text("count: \(count)")
```

Essa também é a razão pela qual, em SwiftUI, a interface pode ser atualizada automaticamente quando os dados mudam.

### Não é recomendado escrever cálculos complexos em body

Como `body` é uma propriedade computada, ele pode ser lido e recalculado várias vezes.

Por exemplo:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Quando `name` muda, o SwiftUI recalcula `body`.

Nesse momento, o código dentro de `body` também é executado novamente, e `num` também é criado novamente.

```swift
let num = 10
```

Neste exemplo, `num` é muito simples, então o impacto não é grande.

Mas, se cálculos complexos forem executados dentro de `body`, como filtrar muitos dados, ordenar dados, processar imagens e assim por diante, isso pode afetar a fluidez da interface.

Portanto, em SwiftUI, `body` deve ser responsável principalmente por descrever a estrutura da interface.

Dados temporários simples podem ser escritos dentro de `body`.

Cálculos complexos podem ser colocados fora de `body`, em uma propriedade computada, em um método ou em uma parte separada de processamento de dados.

## Exemplo: quantidade e preço total

Agora, vamos usar um exemplo simples para entender propriedades computadas.

Suponha que o preço de uma cenoura seja 2 $. O usuário pode clicar em botões para alterar a quantidade comprada, e a interface precisa exibir o preço total.

A forma de calcular o preço total é:

```text
Quantidade * Preço unitário
```

Se usarmos uma variável comum para armazenar o preço total, isso será um pouco inconveniente.

Porque, toda vez que a quantidade mudar, será necessário atualizar manualmente o preço total.

Uma forma melhor é usar uma propriedade computada:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Resultado exibido:

![view](../../Resource/024_view.png)

Neste exemplo:

```swift
@State private var count = 1
```

`count` representa a quantidade de cenouras. Quando o botão é clicado, `count` muda.

```swift
private let price = 2
```

`price` representa o preço unitário da cenoura. Aqui é um valor fixo, então usamos `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` representa o preço total.

Ele não precisa ser armazenado separadamente, porque o preço total sempre pode ser calculado por `count * price`.

Quando `count` é `1`:

```swift
totalPrice = 1 * 2
```

O resultado exibido é:

```swift
totalPrice: 2 $
```

Depois que o botão `+` é clicado, `count` se torna `2`.

Nesse momento, quando `totalPrice` é lido novamente, ele é recalculado:

```swift
totalPrice = 2 * 2
```

O resultado exibido é:

```swift
totalPrice: 4 $
```

Esse é o papel de uma propriedade computada: calcular dinamicamente um novo resultado com base nos dados já existentes.

## Propriedades computadas também podem ser usadas para julgamento

Uma propriedade computada não serve apenas para calcular números; ela também pode retornar um resultado lógico.

Por exemplo, quando queremos que a quantidade mínima seja 1.

Quando a quantidade já é 1, o botão `-` não deve continuar diminuindo.

Podemos adicionar uma propriedade computada:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Código completo:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Resultado exibido:

![view](../../Resource/024_view1.png)

Aqui:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Esse código indica se ainda é possível diminuir a quantidade atual.

Quando `count` é maior que `1`:

```swift
canDecrease == true
```

significa que é possível diminuir.

Quando `count` é igual a `1`:

```swift
canDecrease == false
```

significa que não é mais possível diminuir.

### Verificação de condição no botão

No botão, usamos:

```swift
if canDecrease {
    count -= 1
}
```

Somente quando `canDecrease` é `true`, `count` pode ser diminuído.

### Controlar a cor de primeiro plano da view

Também podemos usar `canDecrease` para controlar a cor de primeiro plano do botão:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aqui usamos o operador ternário:

```swift
canDecrease ? Color.primary : Color.gray
```

O significado desse código é: se `canDecrease` for `true`, a cor de primeiro plano usa `Color.primary`; se `canDecrease` for `false`, a cor de primeiro plano usa `Color.gray`.

`Color.primary` é uma cor semântica do sistema fornecida pelo SwiftUI. Ela representa a cor principal do texto na interface atual.

No modo claro, `Color.primary` geralmente fica próxima do preto; no modo escuro, geralmente fica próxima do branco.

Portanto, a vantagem de usar `Color.primary` é que ela se adapta automaticamente ao modo claro e ao modo escuro.

### Controlar o estado desativado da view

`disabled` é usado para controlar se uma view está desativada:

```swift
.disabled(!canDecrease)
```

Quando `disabled` é `false`, a view pode ser clicada.

Quando `disabled` é `true`, a view fica desativada e não pode ser clicada.

Aqui, usar `canDecrease` como condição torna o código mais fácil de entender.

Ao ver `canDecrease`, podemos entender que ele significa “se ainda é possível diminuir no momento”.

### Explicação adicional: por que há duas verificações?

No botão `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aqui usamos tanto `.disabled(!canDecrease)` quanto `if canDecrease` dentro do botão.

`.disabled(!canDecrease)` é responsável por desativar o botão na interface, impedindo que o usuário clique nele.

`if canDecrease` faz uma nova verificação antes da execução do código. Somente quando é possível diminuir, `count -= 1` é executado.

Isso é uma proteção dupla. No desenvolvimento real, se o botão já estiver desativado, a verificação interna pode ser omitida. Mas, em um exemplo de ensino, mantê-la pode mostrar com mais clareza o papel de `canDecrease`.

## Resumo

Nesta lição, aprendemos principalmente sobre propriedades computadas.

Uma propriedade computada não armazena diretamente um valor. Quando é lida, ela calcula um resultado com base em dados já existentes.

Por exemplo:

```swift
var c: Int {
    a + b
}
```

Aqui, `c` não precisa ser armazenado separadamente, porque ele pode ser calculado por `a + b`.

Uma propriedade computada deve ser declarada usando `var`, e o tipo de retorno precisa ser indicado.

```swift
var canDecrease: Bool {
    count > 1
}
```

Uma propriedade computada pode retornar não apenas valores numéricos, mas também resultados lógicos, conteúdo de texto e até conteúdo de uma view SwiftUI.

Nesta lição, também aprendemos `return`.

`return` significa retornar um resultado:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Se houver apenas uma expressão que produz diretamente o resultado em uma propriedade computada, `return` pode ser omitido.

```swift
var totalPrice: Int {
    count * price
}
```

Além disso, também conhecemos `Color.primary` e `disabled`.

`Color.primary` é uma cor semântica do sistema SwiftUI. Ela ajusta automaticamente o efeito de exibição de acordo com o modo claro e o modo escuro.

```swift
.foregroundStyle(Color.primary)
```

`disabled` é usado para controlar se uma view está desativada.

```swift
.disabled(true)
```

Significa desativada, não pode ser clicada.

```swift
.disabled(false)
```

Significa disponível, pode ser clicada.

Portanto, propriedades computadas são muito comuns em SwiftUI. Elas ajudam a organizar resultados de cálculo, condições e conteúdo exibido de forma mais clara.
