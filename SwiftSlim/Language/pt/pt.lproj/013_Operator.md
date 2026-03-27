# Operadores

Nesta aula, vamos aprender os operadores do Swift (Operators).

Quando fazemos cálculos, comparações ou julgamentos lógicos, precisamos usar operadores. Essas operações aparecem em todas as etapas da execução do programa e são uma das bases mais importantes da programação.

```swift
let a = 100 * 8
````

Ao aprender programação, muitas pessoas percebem que quem tem certo raciocínio matemático costuma entender melhor a lógica de programação. Isso acontece porque a programação, em essência, depende de “cálculo” e “julgamento por regras”, e são exatamente essas as funções centrais dos operadores.

No desenvolvimento real, os operadores não são usados apenas para cálculos numéricos simples, mas também em muitos cenários concretos.

Por exemplo, em um jogo de blocos, quando o usuário arrasta um bloco até uma posição específica, é necessário calcular:

* a posição de coordenadas do bloco
* as posições que o bloco pode preencher
* se a posição de destino está disponível

Esses processos de “cálculo + julgamento” dependem essencialmente de operadores.

![Block](../../Resource/013_block.png)

Aprender operadores não é apenas aprender a fazer contas, mas também construir a base para layout de interface, processamento de dados e lógica de interação nas próximas etapas.

## Forma de execução de cálculos no SwiftUI

No SwiftUI, normalmente usamos um Button para acionar uma função e, dentro dela, executamos a lógica de cálculo.

Por exemplo:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Ao clicar no botão, o Console exibe:

```
c: 20
```

Nesta aula, vamos padronizar a lógica de operação dentro de `func`, acionando-a por botão e usando `print` para mostrar os resultados.

Nos exemplos seguintes, para simplificar a apresentação do código, indicaremos diretamente o resultado do cálculo no próprio código, sem repetir o uso de `print`.

## Gerenciamento da saída do Console

Como cada clique gera informações de saída, você pode clicar no botão de limpar no canto inferior direito da área do Console para apagar o histórico e facilitar a visualização do resultado atual.

![Console](../../Resource/013_console.png)

## Outra forma de escrever Button

Quando o botão executa apenas uma função, pode-se usar uma forma mais concisa:

```swift
Button(action: ) {
    // View
}
```

Nessa forma, `action` especifica a função que será executada ao clicar no botão (função sem parâmetros), e as chaves `{}` são usadas para definir a view do botão.

Combinando com a função `calculate` mostrada antes, pode-se escrever assim:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Ao clicar no botão, a função `calculate` será executada diretamente.

Portanto, quando a lógica do botão é simples e apenas chama uma função, usar a forma com `action` é mais claro e também mais alinhado com as boas práticas de código.

## Operadores aritméticos

Os operadores aritméticos (Arithmetic Operators) são usados para cálculos numéricos:

* + adição
* - subtração
* * multiplicação
* / divisão
* % módulo (resto)

Exemplo:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

É importante observar que o Swift é uma linguagem fortemente tipada e não mistura automaticamente tipos de dados diferentes:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Quando os dois tipos são diferentes, é necessário converter manualmente o tipo.

## Operadores de comparação

Os operadores de comparação (Comparison Operators) são usados para verificar a relação entre dois valores, e o resultado é um `Bool`:

* == igual a
* != diferente de
* > maior que
* < menor que
* >= maior ou igual a
* <= menor ou igual a

Exemplo:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Os operadores de comparação são frequentemente usados em instruções condicionais. Por exemplo, em “carrossel de frases”, precisamos controlar para que o índice não ultrapasse o limite do array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Se `index` for menor que `sayings.count - 1`, o resultado da comparação será `true`, e o código dentro do `if` será executado; se o resultado for `false`, o código posterior não será executado.

## Operadores lógicos

Os operadores lógicos (Logical Operators) são usados para combinar múltiplas condições:

* && e (AND)
* || ou (OR)
* ! não (NOT)

### && e

Quando várias condições precisam ser satisfeitas ao mesmo tempo, usamos `&&`.

Por exemplo:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Nesse código, existem duas condições: `age >= 18` e `age <= 100`.

Somente quando ambas forem `true`, `legalAge` será `true`; se apenas uma não for satisfeita, o resultado será `false`.

### || ou

Quando basta que uma entre várias condições seja satisfeita, usamos `||`.

Por exemplo:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Esse trecho significa que, desde que `money >= 50` ou `creditCard >= 50` seja verdadeiro, `payAllowed` será `true`.

Somente quando ambas as condições forem falsas, o resultado será `false`.

Por exemplo, em um cenário de pagamento, é possível pagar com dinheiro ou com cartão de crédito. Se nenhum dos dois puder pagar, o pagamento falha.

### ! não

`!` é o operador lógico de negação (NOT), usado para inverter um valor `Bool`.

Pode-se entender assim: `!` transforma `true` em `false`, e `false` em `true`.

Por exemplo:

```swift
let allowed = true
let result = !allowed   // false
```

Aqui, `!allowed` significa inverter o valor de `allowed`.

É importante notar que `!` e `!=` são dois operadores diferentes: `!` inverte um valor `Bool`, enquanto `!=` é um operador de comparação que retorna um `Bool`.

## Operador de atribuição

O operador de atribuição (Assignment Operators) é usado para atribuir ou atualizar valores:

* = atribuição

Tanto na declaração de variáveis quanto durante cálculos, a operação de atribuição aparece com frequência:

```swift
let a = 5
```

Esse código indica que o valor `5` é atribuído à variável `a`.

### Operadores compostos de atribuição

No desenvolvimento real, além do operador básico de atribuição, também usamos com frequência os “operadores compostos de atribuição”, que permitem calcular e atualizar diretamente com base no valor original:

* +=
* -=
* *=
* /=

Na aula anterior sobre “contador”, já vimos de forma simples os operadores compostos de atribuição.

Por exemplo, ao clicar no botão, fazer uma variável aumentar automaticamente:

```swift
var num = 10
num += 5   // num = 15
```

Esse código significa que `num` é somado com `5`, e o resultado é atribuído novamente a `num`.

Portanto, ele equivale a:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operador ternário

No Swift, o operador ternário (Ternary Operator) faz um julgamento com base em uma condição e retorna um entre dois resultados:

```swift
condição ? valor1 : valor2
```

A lógica de execução é: se a condição for `true`, retorna “valor1”; se a condição for `false`, retorna “valor2”.

Por exemplo:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Esse trecho verifica o valor de `showColor`: se for `true`, retorna `Color.blue`, e o fundo será azul; se for `false`, retorna `Color.clear`, e nenhuma cor de fundo será exibida.

Dica: `Color.clear` representa uma cor transparente (não exibe conteúdo).

### Diferença em relação ao if-else

O operador ternário é logicamente equivalente a uma instrução `if-else`.

Por exemplo, o código acima também pode ser escrito assim:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Os dois têm exatamente a mesma lógica de execução: quando a condição é `true`, executa o primeiro resultado; quando a condição é `false`, executa o segundo.

Na prática, o operador ternário é mais conciso e mais adequado para expressar um julgamento simples de “uma entre duas opções”, sendo muito usado para retornar diretamente um valor.

Na construção de Views no SwiftUI, o operador ternário é muito comum. Por exemplo:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Essa forma permite mudar dinamicamente o efeito visual da view em uma única linha, de acordo com a condição.

## Operadores de intervalo

Os operadores de intervalo (Range Operators) são usados para representar intervalos:

* ... intervalo fechado (inclui as duas extremidades)
* ..< intervalo semiaberto (não inclui o lado direito)

Por exemplo:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Podemos entender que `1...3` representa de 1 até 3, incluindo o 3; `5..<8` representa de 5 até 8, mas sem incluir o 8.

Formas estendidas (apenas para conhecer):

```
5...    // >= 5
...5    // <= 5
```

Essa forma representa um “intervalo unilateral”, geralmente usado em julgamentos condicionais ou em pattern matching.

Os operadores de intervalo serão usados mais adiante, ao aprender `for`. Por enquanto, basta entendê-los como uma faixa contínua de valores numéricos.

## Praticando operadores

Agora, vamos usar alguns exemplos simples para praticar o papel dos operadores dentro da view.

### 1. Calcular o número total de veículos

Por exemplo, em um determinado cruzamento passam 500 veículos por dia. Vamos calcular o total de veículos em 30 dias.

Podemos usar operadores de cálculo:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Aqui, o processo de cálculo é: 500 veículos por dia, ao longo de 30 dias, totalizam 500 × 30, resultando em 15000 veículos.

### 2. Verificar membro de compra interna

Podemos verificar se uma pessoa é membro de compra interna. Desde que ela tenha assinatura vitalícia ou assinatura recorrente, será considerada membro.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Nesse trecho usamos o operador `||` (ou): `lifeTime = false` significa que não há assinatura vitalícia; `subscription = true` significa que existe assinatura ativa.

Como basta que uma das condições seja satisfeita, `isMember` será `true`. Portanto, essa pessoa é membro de compra interna.

## Resumo

No Swift, os operadores são a base para cálculos de dados e julgamentos lógicos, assim como `Text` é usado para exibir conteúdo, os operadores são usados para processar os próprios dados.

Desde os cálculos numéricos mais simples até julgamentos lógicos complexos, passando pelo controle de estado da view e cálculos de layout, tudo depende da participação dos operadores.

Com a prática em diferentes cenários, você poderá se familiarizar gradualmente e dominar os vários tipos de operadores apresentados nesta aula, o que é uma base importante para o aprendizado posterior.

### Conhecimento extra - operadores de bits

Além disso, o Swift também oferece uma categoria mais baixa de operadores — os operadores de bits (Bitwise Operators):

* & (E bit a bit)
* | (OU bit a bit)
* ^ (XOR bit a bit)
* ~ (negação bit a bit)
* >> (deslocamento à direita)
* << (deslocamento à esquerda)

Por exemplo:

```swift
let a = 6  // binário 110
let b = 3  // binário 011

print(a & b) // 2 (binário 010)
print(a | b) // 7 (binário 111)
print(a ^ b) // 5 (binário 101)
print(~a)    // -7 (negação)
```

No Swift, os inteiros são representados em complemento de dois no sistema binário, e após a negação obtém-se o resultado negativo correspondente.

Os operadores de bits atuam diretamente sobre os números binários e normalmente são usados em cenários de processamento de dados de baixo nível e otimização de desempenho.

Para iniciantes, os casos de uso desse tipo de operador são relativamente poucos e, no desenvolvimento comum com iOS ou SwiftUI, também não são frequentes, portanto aqui não vamos aprofundar.

Se no futuro houver envolvimento com lógica de baixo nível ou otimização de desempenho, será possível estudá-los e compreendê-los com mais profundidade.
