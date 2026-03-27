# Carrossel de citações

Nesta lição, vamos implementar uma funcionalidade de “carrossel de citações” e estudar com mais profundidade conhecimentos básicos de Swift, como arrays (`Array`) e instruções condicionais (`if-else`).

Vamos mostrar como armazenar várias citações e implementar a rotação cíclica delas por meio da interação com botões.

![alt text](../../RESOURCE/011_word.png)

## Exibindo uma citação

Primeiro, precisamos exibir uma citação no SwiftUI.

A forma mais simples é usar a view `Text`:

```swift
Text("Slow progress is still progress.")
```

Esse código só consegue exibir uma citação fixa. Se quisermos mostrar várias citações e alternar entre elas, precisamos armazená-las.

No entanto, uma variável de string comum só pode armazenar uma única citação:

```swift
let sayings = "Slow progress is still progress."
```

Se precisarmos armazenar várias citações, teremos que declarar uma variável para cada uma:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Mas, no desenvolvimento real, essa forma não só é trabalhosa, como também não permite uma alternância flexível no carrossel, já que cada variável é independente.

Para gerenciar várias citações com mais facilidade, precisamos usar uma estrutura de dados para armazená-las juntas: o array (`Array`).

Depois de usar um array, o código acima pode ser armazenado assim:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Dica: nas convenções de programação, nomes de variáveis de array que armazenam vários elementos normalmente usam a forma plural, como `sayings`, para refletir a característica de coleção.**

## Array

Em Swift, um array é uma coleção ordenada de elementos, representada com colchetes `[]`.

```swift
[]
```

Dentro do array, podem existir vários elementos do mesmo tipo, separados por vírgulas `,`.

Por exemplo:

```swift
[101, 102, 103, 104, 105]
```

Você pode entender um array de forma simples como uma fileira de vagões de trem:

![Array](../../RESOURCE/011_array1.png)

O trem inteiro representa esse objeto array, e cada vagão está organizado em sequência.

### Índice e acesso aos elementos

Como o array é ordenado, o sistema consegue localizar elementos específicos com base na sua posição. Esse mecanismo de localização é chamado de índice (`Index`).

Em Swift (e na maioria das linguagens de programação), os índices do array começam em `0`, e não em `1`. Isso significa que o primeiro elemento do array corresponde ao índice `0`, o segundo ao índice `1`, e assim por diante.

![Array](../../RESOURCE/011_array2.png)

Se quiser acessar um elemento específico do array, basta colocar colchetes após o nome do array e preencher com o índice desejado.

Por exemplo:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Se você tentar acessar um índice fora do intervalo válido do array, ocorrerá um problema de “índice fora do intervalo” (`Index Out of Range`). Portanto, ao acessar arrays, é preciso ter cuidado para garantir que o índice esteja dentro da faixa válida.

**Índice fora do intervalo**

Por exemplo, quando um array possui apenas 5 elementos, o intervalo válido de índices vai de `0` a `4`. Se tentarmos acessar `sayings[5]`, o programa não conseguirá encontrar o “vagão” correspondente, causando o erro de “índice fora do intervalo” e levando o aplicativo a travar.

![Array](../../RESOURCE/011_array3.png)

### Operações com array

Arrays não servem apenas para definição estática. Eles também permitem adicionar, remover e modificar elementos, além de obter o seu tamanho.

Dica: se você precisar modificar um array, deve declará-lo com `var`, e não com a constante `let`.

**1. Adicionar elemento**

Você pode usar o método `append` para adicionar um elemento ao final do array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Remover elemento**

Com o método `remove(at:)`, você pode remover um elemento específico do array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modificar elemento**

Você pode modificar diretamente um elemento do array usando o índice:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Contar o tamanho do array**

Use a propriedade `count` para obter a quantidade de elementos do array:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Usando array para exibir citações

Para exibir várias citações, podemos armazená-las em um array e depois acessá-las e mostrá-las por índice.

Primeiro, criamos um array `sayings` em `ContentView` para armazenar as citações e depois usamos o índice na view `Text` para ler e exibir a citação correspondente:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Aqui, `sayings[0]` representa a primeira citação do array.

Se quiser mostrar outra citação, basta alterar o valor do índice dentro dos colchetes:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definindo o índice da citação

Para implementar a troca dinâmica de citações, não podemos “fixar” o índice diretamente na view `Text`.

Precisamos criar uma variável separada para armazenar o índice exibido no momento.

No SwiftUI, podemos usar `@State` para declarar um índice mutável:

```swift
@State private var index = 0
```

O SwiftUI observará a variável encapsulada por `@State`. Quando `index` mudar, o SwiftUI renderizará a view novamente e exibirá a citação correspondente.

Em seguida, usamos `sayings[index]` para obter dinamicamente a citação do array:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Quando o valor de `index` mudar, `Text` exibirá uma citação diferente.

### Usando botão para controlar o índice

Para controlar a troca das citações, podemos usar `Button` para modificar o valor de `index`. A cada clique, `index` aumenta em 1:

```swift
Button("Next") {
    index += 1
}
```

Quando clicamos no botão, o valor de `index` muda de `0` para `1`, disparando a atualização da view, e `Text(sayings[index])` passa a ler a próxima citação.

No entanto, há um problema potencial aqui: se clicarmos continuamente no botão, `index` crescerá até um valor fora do intervalo do array, causando erro de índice fora do intervalo. Por exemplo, quando `index` chegar a `5` (enquanto o intervalo válido vai de `0` a `4`), o programa irá travar.

Para evitar esse erro, precisamos introduzir um controle condicional que garanta que `index` não ultrapasse o intervalo válido do array. Podemos usar a instrução `if-else` para verificar se `index` é menor que o tamanho do array.

## Controle condicional: instrução `if-else`

A instrução `if-else` é uma das estruturas condicionais mais usadas em Swift. Ela serve para verificar se uma condição é verdadeira e, com base nisso, executar blocos de código diferentes.

Estrutura básica:

```swift
if condition {
    // Código executado quando condition for true
} else {
    // Código executado quando condition for false
}
```

Na instrução `if`, a condição `condition` é um valor booleano (`Bool`), podendo ser `true` ou `false`. Quando a condição for `true`, o código do bloco `if` será executado; caso contrário, será executado o bloco `else`.

Por exemplo:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Nesse exemplo, o valor de `age` é `25`, então a instrução `if` verifica se `age > 18` é verdadeiro. Como a condição é satisfeita, será exibido `"Big Boy"`.

Se você não precisar do bloco `else`, ele pode ser omitido:

```swift
if condition {
    // Código executado quando condition for true
}
```

### Usando condição para controlar o intervalo do índice

Para evitar que o índice do array saia do intervalo válido, podemos usar `if` para garantir que `index` não ultrapasse os limites:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Análise da lógica: o valor de `sayings.count` é `5` (há 5 citações), então `sayings.count - 1` resulta em `4`, que também é o último índice válido do array.

Quando `index` for menor que `4`, clicar no botão para somar `1` é seguro; quando `index` chegar a `4`, a condição deixará de ser satisfeita e o botão não terá mais efeito.

Agora, o código já implementa a troca de citações:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Citações em ciclo

Se quisermos que, ao chegar à última citação, o próximo clique volte a exibir a primeira, criando um ciclo contínuo, podemos fazer isso usando a parte `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Quando o botão for clicado, se `index` estiver no último elemento do array, ele será redefinido para `0` e as citações voltarão ao início do ciclo.

## Otimizando a view de citações

Agora, a lógica do carrossel de citações já está pronta, mas ainda podemos melhorar a interface para deixá-la mais bonita.

Código completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Nesse exemplo, a view `Text` recebeu um fundo branco semitransparente e cantos arredondados; o botão `Button` usa o estilo `.borderedProminent`; e `VStack` recebeu uma imagem de fundo.

Complemento de conhecimento: ao usar o modificador `background()` para tratar imagem de fundo, o comportamento padrão é preencher o máximo possível da área de layout da view atual. Em muitos casos, ele consegue naturalmente se estender e cobrir a área segura (`Safe Area`).

Agora já implementamos a view do carrossel de citações.

![SwiftUI View](../../RESOURCE/011_word.png)

## Resumo

Nesta lição, aprendemos como usar arrays para armazenar várias citações e como usar instruções `if` e `if-else` para implementar o carrossel de citações.

Também entendemos operações básicas com arrays, como adicionar, remover e modificar elementos, além de aprender como evitar erros de índice fora do intervalo.

Esta lição não apenas explicou como implementar o carrossel de citações, mas também combinou o uso básico de arrays e instruções condicionais, ajudando a desenvolver a capacidade de tratar dados e controlar o fluxo do programa.

## Conhecimento extra — múltiplas condições: instrução `if-else if-else`

No desenvolvimento real, muitas vezes precisamos lidar com várias condições. Por exemplo, em um jogo, quando a pontuação é igual a `1`, é disparado o evento A; quando é igual a `2`, o evento B; quando é igual a `3`, o evento C; e assim por diante.

Quando há mais de dois ramos condicionais, precisamos usar a instrução `if-else if-else` para realizar múltiplas verificações.

Sintaxe básica:

```swift
if conditionA {
    // Código executado quando conditionA for true
} else if conditionB {
    // Código executado quando conditionB for true
} else if conditionC {
    // Código executado quando conditionC for true
} else {
    // Código executado quando nenhuma condição for satisfeita
}
```

Nesse caso, o programa verificará as condições em ordem e executará o primeiro bloco cuja condição for satisfeita. Se nenhuma condição for atendida, o código após `else` será executado.

No carrossel de citações, também poderíamos usar `if-else if-else` para fazer verificações múltiplas:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Quando `index` for `0`, `1`, `2` ou `3`, cada clique executará `index += 1`; quando `index` for `4` (o último elemento), `index` será redefinido para `0`, implementando o ciclo.

O ramo `else` serve como proteção final, evitando valores inválidos (por exemplo, se `index` for alterado incorretamente).

É importante notar que `==` usado aqui significa verificar “se é igual”. Se a instrução `if` verificar que `index` é igual a determinado número, ela retornará `true` e executará o bloco de código correspondente. Se não for igual, continuará verificando o próximo `if`.

Esse tipo de verificação múltipla é útil para executar códigos diferentes em cenários condicionais diferentes.
