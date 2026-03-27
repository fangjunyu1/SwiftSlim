# Sistema de tipos

Nas aulas anteriores, já aprendemos sobre variáveis e vimos que elas podem armazenar dados de tipos diferentes.

Por exemplo:

```swift
var hello = "Hello, World"
```

Aqui, `hello` armazena um texto, portanto seu tipo é `String`.

A seguir, vamos estudar de forma sistemática o conceito de tipo (`Type`), além de declaração explícita de tipo e inferência de tipo, para compreender com mais profundidade a natureza das variáveis.

## O que é um tipo

Em Swift, cada valor possui um tipo bem definido. O tipo determina o que esse valor é e o que ele pode fazer.

Por exemplo:

* `42` é um `Int` (inteiro)
* `"Hello"` é uma `String` (texto)
* `true` é um `Bool` (booleano)

Eles pertencem a tipos diferentes e também têm usos diferentes.

## Tipos básicos comuns em Swift

Na fase inicial do aprendizado, os tipos mais comuns são:

* `String`: texto
* `Int`: número inteiro
* `Double`: número de ponto flutuante (com casas decimais, maior precisão)
* `Bool`: valor booleano (`true`/`false`)

Além disso, também existem `Float` (número de ponto flutuante, mas com precisão menor que `Double`, por isso é menos usado em geral) e `Character` (um único caractere), por exemplo `"A"`, `"!"` e outros caracteres únicos.

### Declaração de tipo (tipo explícito)

Em Swift, é possível especificar manualmente o tipo ao declarar uma variável:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Adicionamos `: Tipo` após o nome da variável para declarar seu tipo.

A forma de escrever o tipo de um array é `: [Tipo]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Nesse trecho, o array `scores` só pode armazenar elementos do tipo `Int`, e `tags` só pode armazenar elementos do tipo `String`.

Declarar o tipo explicitamente pode deixar a intenção do código mais clara e, em alguns casos, evitar erros de inferência.

## Inferência de tipo

Em muitos casos, não é necessário declarar o tipo explicitamente:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Isso acontece porque o compilador Swift consegue inferir automaticamente o tipo com base no “valor inicial”.

## Declaração explícita e inferência de tipo

Nas aulas anteriores, não introduzimos a declaração explícita, por exemplo:

```swift
var age: Int = 18
```

Em vez disso, usamos primeiro a inferência de tipo:

```swift
var age = 18
```

Nesse exemplo, as duas formas são equivalentes: em ambos os casos, `age` será determinado como do tipo `Int`. Comparada à declaração explícita, a inferência de tipo é mais concisa.

A razão de não enfatizar a declaração explícita no começo é que a inferência reduz informações extras no código, diminuindo o custo de compreensão na fase inicial do aprendizado.

## Por que precisamos de tipos

Swift é uma linguagem fortemente tipada (`Strongly Typed Language`).

Isso significa que, uma vez determinado o tipo de uma variável, ele não pode ser alterado livremente.

Por exemplo:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

O primeiro `20` é do tipo `Int`, então pode ser atribuído a `age`; o segundo `"20"` é do tipo `String`, não corresponde ao tipo `Int`, por isso ocorre erro.

`nums` é um array do tipo `[Int]`, então só pode armazenar números inteiros, sem misturar strings.

Os tipos restringem o uso dos dados e permitem encontrar problemas de incompatibilidade ainda na fase de compilação, reduzindo bugs causados por confusão de tipos e melhorando a estabilidade e a manutenibilidade do código.

## Quando é obrigatório declarar o tipo explicitamente

Embora Swift consiga inferir tipos automaticamente, em alguns casos o compilador não consegue inferir, ou pode inferir incorretamente. Nessas situações, é necessário declarar manualmente.

**1. Array vazio**

Ao criar um array vazio, é obrigatório declarar o tipo explicitamente:

```swift
var nums: [Int] = []
```

Se você não escrever o tipo:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

o compilador não consegue inferir o tipo dos elementos a partir de um array vazio, então gera erro de compilação.

**2. Evitar inferência incorreta**

```swift
var value = 10   // Int
```

Nesse exemplo, embora `10` também possa representar um número de ponto flutuante (`Double`), como ele não possui ponto decimal, o compilador o inferirá como `Int` por padrão.

Se você quiser que `value` represente um `Double`, então precisa declarar o tipo explicitamente:

```swift
var value: Double = 10   // Double
```

Quando o resultado da inferência não corresponde ao esperado, você deve usar declaração explícita ou ajustar a forma do literal para garantir o tipo correto.

**3. Tipos personalizados**

Mais adiante também vamos aprender tipos personalizados. Ao usar tipos personalizados, geralmente também é necessário declarar explicitamente:

```swift
var info: GameInfo
var users: [User] = []
```

A razão é a mesma do array vazio: o compilador não consegue inferir automaticamente o tipo a partir de um valor vazio.

## Conversão de tipos

Em Swift, tipos diferentes não são convertidos automaticamente; a conversão precisa ser feita manualmente.

Por exemplo, somando dois números de tipos diferentes:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Nesse trecho, `a` é do tipo `Int` e `b` é do tipo `Double`. Como são tipos diferentes, não podem participar diretamente da mesma operação.

Antes de calcular, precisamos converter um dos valores para o mesmo tipo:

```swift
var result = Double(a) + b
```

Esse código significa converter `a`, que é `Int`, para `Double`, e depois somá-lo a `b`, atribuindo o resultado a `result`.

É importante notar que a conversão não altera o tipo da variável original. Por exemplo, `Double(a)` não muda `a` para `Double`; ele apenas cria um novo valor do tipo `Double` para participar da operação.

Outros tipos também podem ser convertidos de forma semelhante, usando a forma `TipoDeDestino()`, passando dentro o valor que será convertido. Por exemplo:

```
Int()、Double()、String()
```

Exemplo:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

É importante notar que nem toda conversão preserva exatamente o valor. Por exemplo, em `Double → Int`, a parte decimal é truncada diretamente, sem arredondamento.

## Apelido de tipo

Em Swift, também podemos dar um apelido a um tipo existente, deixando a semântica do código mais clara:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Aqui, `UserID` continua sendo `Int` na essência. O tipo não mudou, apenas ganhou um nome mais significativo.

Em projetos grandes, com tipos mais complexos, apelidos de tipo podem tornar o código mais legível.

## Exemplo de tipos

A seguir, vamos usar um exemplo simples para mostrar o papel dos tipos no desenvolvimento real.

### Criando uma variável

Primeiro, criamos uma variável `age`:

```swift
var age = 20
```

Como precisamos exibir e modificar essa variável no SwiftUI, devemos declará-la com `@State`:

```swift
@State private var age = 20
```

`private` já foi mencionado antes: significa que essa variável só pode ser usada dentro da view atual. Mais adiante estudaremos isso com mais profundidade.

### Exibindo dados no SwiftUI

Exibindo a variável `age` no SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Agora a view mostrará:

```swift
age: 20
```

### Modificando dados

Em seguida, adicionamos dois botões para modificar `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Resultado da execução

Ao clicar em `changeAge1`, `age` receberá `18`:

```swift
age = 18
```

Como `18` é do tipo `Int` e corresponde ao tipo de `age`, a atribuição é válida.

Já `changeAge2` causará erro:

```swift
age = "18"
```

Mensagem de erro:

```
Cannot assign value of type 'String' to type 'Int'
```

Isso acontece porque `"18"` é do tipo `String` (strings precisam estar entre `""`), enquanto `age` é do tipo `Int`. Como os tipos não coincidem, a atribuição não é permitida.

### Por que ocorre erro?

O ponto-chave está nesta linha:

```swift
@State private var age = 20   // Int
```

Mesmo sem declarar o tipo explicitamente, como o valor inicial `20` é do tipo `Int`, o compilador inferirá automaticamente que `age` é `Int`.

Uma vez que o tipo foi determinado, não é mais possível atribuir um valor de outro tipo.

Além disso, o botão `changeAge2` não falha “em tempo de execução”; ele já causa erro na fase de compilação. O código nem consegue compilar.

Essa também é uma das vantagens de Swift ser fortemente tipada: problemas de tipo podem ser descobertos enquanto o código está sendo escrito.

### Forma correta

Depois de remover o código incorreto:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Ao clicar no botão `changeAge1`, a view será atualizada para:

```
age: 18
```

### Declaração explícita de tipo (opcional)

Também podemos especificar o tipo claramente no momento da definição:

```swift
@State private var age: Int = 20
```

Essa forma deixa o tipo mais evidente, mas em cenários simples ela não é obrigatória.

## Resumo

Esta aula explicou principalmente o sistema de tipos de Swift e o papel dele no desenvolvimento real.

Em Swift, cada valor possui um tipo claro, e o tipo determina o significado dos dados e também as operações das quais eles podem participar.

Swift é fortemente tipada. Uma vez determinado o tipo de uma variável, não é mais possível atribuir a ela um valor de outro tipo. Essa restrição permite detectar erros ainda na compilação, reduzindo problemas em tempo de execução e aumentando a segurança do código.

O tipo de uma variável pode ser inferido automaticamente a partir do valor inicial, ou declarado explicitamente. Em alguns casos (como arrays vazios, erro de inferência ou tipos personalizados), o compilador não consegue inferir corretamente, e então a declaração explícita passa a ser obrigatória.

Tipos diferentes não são convertidos automaticamente; é necessário usar conversões explícitas como `Int()`, `Double()` e `String()`.

Os tipos também suportam apelidos. Em projetos mais complexos, eles ajudam a melhorar a legibilidade.

Tipo não é apenas uma marcação de dados, mas também um mecanismo de restrição que garante que o uso dos dados seja seguro, claro e controlável.

## Conhecimento extra — tipo opcional

Ao fazer conversão de tipos, algumas operações podem falhar.

Por exemplo, converter `String` para `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Aqui, `Double(input)` não retorna `Double`, e sim:

```
Double?
```

Isso é um tipo opcional (`Optional`).

### Por que retorna um tipo opcional?

Porque o conteúdo da string é incerto. `"3.14"` pode ser convertido para `Double`, mas `"Hello"` não pode.

Ou seja, essa operação pode dar certo ou pode falhar.

Por isso, Swift usa tipos opcionais para representar essa incerteza.

### O que é um tipo opcional?

Um tipo opcional representa: um valor pode existir, ou pode não existir.

Por exemplo:

```
Double?
```

Esse tipo significa que, se houver valor, ao imprimir ele aparecerá como `Optional(...)`; se não houver valor, o retorno será `nil`.

É importante notar que `nil` significa “sem valor”, e não `0` ou string vazia.

### Exemplo

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Saída:

```
pi:Optional(3.14)
```

Isso significa que a string foi convertida com sucesso para `Double`, resultando em `3.14`, mas como o tipo é `Double?`, ele aparece embrulhado em `Optional`.

Se a conversão falhar:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Saída:

```
pi: nil
```

Como `"Hello"` não pode ser convertido para `Double`, a conversão falha e retorna `nil`.

### O que é `Optional(...)`?

Quando imprimimos diretamente um tipo opcional:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift exibirá sua “descrição de depuração”:

```
Optional(3.14)
```

Isso não faz parte dos dados reais. É apenas um aviso de que o valor atual é de um “tipo opcional” e contém um valor dentro dele.

### Desembrulhando um tipo opcional

No desenvolvimento real, normalmente precisamos extrair o valor real de dentro de um tipo opcional. Esse processo se chama desembrulhar (`Unwrapping`).

Uma forma comum é usar `??` para fornecer um valor padrão:

```
??
```

Isso se chama: operador de coalescência nula (`Nil-Coalescing Operator`).

Por exemplo:

```swift
name ?? "FangJunyu"
```

Esse código significa: se `name` tiver valor, retorna esse valor; se for `nil`, usa o valor padrão `"FangJunyu"`.

É importante notar que o tipo do valor padrão precisa ser compatível com o tipo opcional.

### Usando `??` para fornecer valor padrão

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Saída:

```
pi: 30
```

`input` foi convertido para `Double` com sucesso, então o valor convertido é exibido. Se a conversão falhasse, seria exibido o valor padrão fornecido por `??`.

Se a conversão falhar:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Saída:

```
pi: 10
```

Aqui, ao converter `input` para `Double`, a conversão falha e retorna `nil`, então `??` fornece um valor padrão para esse caso.

O tipo opcional é usado para representar situações em que “pode haver valor, ou pode não haver”.

Em operações que podem falhar, como conversão de tipos, Swift retorna um tipo opcional para garantir a segurança do programa.

Quando precisamos usar o valor contido nele, podemos fornecer um valor padrão com `??`, de modo que, mesmo quando aparecer `nil`, ainda possamos obter um resultado razoável.
