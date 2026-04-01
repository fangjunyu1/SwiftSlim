# Loops e listas

Nesta lição, vamos aprender o loop `for` no Swift e o `ForEach` no SwiftUI.

Ambos podem nos ajudar a ler os elementos de um array em ordem. No desenvolvimento real, muitas vezes precisamos pegar um grupo de dados um por um, e depois processá-los ou exibi-los. O loop é justamente uma ferramenta importante para concluir esse trabalho.

Quando navegamos em páginas da web ou usamos um app, frequentemente vemos muitas listas ou itens. Esse tipo de conteúdo normalmente é armazenado primeiro em um `array`, depois é lido um por um por meio de um `loop`, e por fim é exibido na interface.

Por exemplo, a lista de resultados de busca do Google:

![Google](../../Resource/017_google.png)

Cada item da lista de resultados de busca normalmente corresponde a um dado, e é exibido um por um por meio de um loop.

Por isso, `array` e `loop` costumam aparecer juntos. O `array` é responsável por armazenar um grupo de dados, e o `loop` é responsável por pegar esses dados em ordem e executar a mesma operação.

A seguir, vamos começar pelo loop `for` mais básico.

## Contagem regressiva

Suponha que queremos simular uma função de contagem regressiva, exibindo em sequência `“5、4、3、2、1”`.

A forma mais direta de escrever isso é:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Embora essa forma possa simular a contagem regressiva, se houver muito conteúdo ela ficará bastante repetitiva, e depois também não será prática para modificar.

Nesse momento, podemos primeiro colocar os dados em um array e depois usar um loop `for` para exibi-los em sequência:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Essa forma de escrever é mais concisa e também mais fácil de expandir. Mesmo que haja muitos números na contagem regressiva, não precisamos repetir `print` linha por linha. Basta deixar o loop processar automaticamente cada elemento do array.

Podemos colocar esse trecho de código dentro de um botão para testar:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Quando clicamos no botão, o loop `for` pega cada inteiro dentro de `countDown` de acordo com a ordem do array e os imprime no console.

Em seguida, vamos ver como o loop `for` funciona.

## Loop for

O loop `for` é usado para processar um conjunto de dados em ordem. Os casos mais comuns são arrays e intervalos.

Forma básica:

```swift
for elemento in array ou intervalo {
    código a executar
}
```

Por exemplo, o código da contagem regressiva de agora há pouco:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Aqui, `i` representa o elemento atual que foi retirado, e depois de `in` vem o dado que será percorrido, ou seja, o array `countDown`.

O significado desse código é: o programa vai pegar cada elemento do array `countDown` em ordem. Cada vez que pegar um elemento, vai usar temporariamente `i` para representá-lo, e então executará o código dentro das chaves.

O processo de execução pode ser entendido assim:

* Na primeira vez, o valor retirado é `5`, então nesse momento o valor de `i` é `5`
* Executa `print(i)` e exibe `5`
* Depois continua e pega o próximo elemento `4`
* Executa novamente `print(i)` e exibe `4`

Os valores `3`、`2`、`1` seguintes também serão executados da mesma forma, um após o outro.

![for](../../Resource/017_for.png)

Quando todos os elementos do array tiverem sido processados, o loop `for` terminará automaticamente.

Podemos usar o loop `for` para obter cada elemento de um array e concluir funções como a contagem regressiva.

**Dica**: `i` é uma forma de nomeação muito comum em loops for, usada para representar o elemento atual retirado, mas não é fixa. Também podemos usar outros nomes em inglês.

Por exemplo, usar `num` para representar cada elemento retirado:

```swift
for num in countDown {
    print(num)
}
```

Dentro das chaves, também precisamos usar `num` para representar o elemento atual retirado.

### Intervalo do loop

O loop `for` não serve apenas para percorrer arrays, ele também pode percorrer intervalos.

Por exemplo, quando precisamos calcular a soma dos inteiros positivos até `50`, precisamos somar um por um todos os inteiros entre `1` e `50`.

A forma mais direta talvez fosse:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

O problema dessa forma é que precisamos escrever cada número manualmente, o que é trabalhoso e inadequado para cenários reais de desenvolvimento.

Nesse momento, podemos usar o operador de intervalo junto com o loop `for`.

No capítulo anterior sobre “operadores”, já aprendemos o operador de intervalo:

```swift
1...3   // 1, 2, 3
```

Aqui, `...` representa um intervalo fechado, ou seja, inclui o ponto inicial e o final.

Por isso, aqui podemos usar um loop `for` para o intervalo de inteiros de `1` até `50`:

```swift
for i in 1...50 {
    
}
```

Precisamos somar esses inteiros, então também precisamos de uma variável para armazenar o total:

```swift
var count = 0
```

Depois, em cada repetição do loop, somamos o número atual retirado a `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Esse código significa:

* `count` é usado para armazenar a soma atual
* O loop `for` vai pegar os inteiros de `1` até `50` um por um
* Cada vez que pegar um inteiro, executará `count += i`
* Quando o loop terminar, `count` armazenará a soma final

Assim, conseguimos obter a soma de todos os inteiros positivos até `50`.

Da mesma forma, se quisermos calcular a soma dos inteiros de `1` até `100`, basta alterar o intervalo:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

O loop `for` não serve apenas para percorrer arrays, ele também pode percorrer um intervalo. Essa capacidade de processar dados repetidamente em ordem é muito comum no desenvolvimento.

Ela pode nos ajudar a lidar automaticamente com muito trabalho repetitivo, sem que precisemos escrever manualmente cada número do cálculo da soma, ou outras operações repetidas semelhantes.

## Loops no SwiftUI

O loop `for` anterior pertence à própria linguagem Swift.

Mas no SwiftUI, não podemos usar diretamente `for` dentro da estrutura de visualização para gerar views:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Isso acontece porque dentro de `VStack` o que precisamos são views do SwiftUI, e um loop `for` comum não é, por si só, uma view.

Se quisermos gerar a interface repetidamente no SwiftUI com base no conteúdo de um array, precisamos usar `ForEach`.

Por exemplo, se quisermos exibir os nomes de todos os membros de um grupo, podemos escrever assim:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Efeito exibido:

![for1](../../Resource/017_for1.png)

Depois, adicionamos os mesmos modificadores a cada `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Agora, cada `Text` é exibido com uma fonte menor e mais grossa.

Efeito exibido:

![](../../Resource/017_for2.png)

Embora os modificadores deixem a interface mais bonita, eles também tornam o código mais longo e repetitivo.

Se continuarmos acrescentando nomes, ou se mais tarde quisermos modificar de forma unificada a fonte, a cor e outros estilos, teremos que escrever e alterar muito código igual repetidas vezes. Isso é trabalhoso e não é conveniente para manutenção.

Nesse momento, podemos primeiro colocar esses nomes em um array e depois usar `ForEach` no SwiftUI para gerar views repetidamente de acordo com os dados do array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Esse conjunto de código é mais conciso. `ForEach` vai ler cada elemento do array em ordem e exibir o conteúdo correspondente na interface.

Quando adicionarmos novos nomes depois, só precisamos modificar os nomes dentro do array `names`, sem precisar adicionar sempre novos `Text` e modificadores complexos repetidamente.

## ForEach

`ForEach` é uma estrutura do SwiftUI usada para gerar views repetidamente. Você pode entendê-la como uma estrutura do SwiftUI parecida com um loop `for`.

Uso básico:

```swift
ForEach(array, id: \.self) { elemento in
    código SwiftUI
}
```

Por exemplo, os nomes do grupo de agora há pouco:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Esse código significa:

`names` é o array que será percorrido, ou seja, os dados que serão exibidos.

`id:\.self` significa usar o próprio elemento do array para distinguir cada item.

No exemplo atual, o array armazena strings:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Por isso, o SwiftUI vai usar diretamente as próprias strings "Sam"、"John"、"Wathon"、"Bob" para distinguir conteúdos diferentes.

Para arrays simples comuns na fase inicial, como `String` e `Int`, normalmente podemos escrever primeiro assim:

```swift
id: \.self
```

Agora, basta lembrar desse único formato. Não é necessário entender em profundidade mais regras sobre id neste momento.

Em `item in`, `item` representa o elemento atual retirado.

Por exemplo, na primeira repetição, `item` é `"Sam"`; na segunda repetição, `item` é `"John"`.

Portanto:

```swift
Text(item)
```

vai se transformar em sequência em:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Assim, o papel desse código é: retirar um por um cada nome do array `names` e gerar uma view `Text` para cada nome.

### Processo de execução

O processo de execução pode ser entendido assim:

* `ForEach` lê primeiro o primeiro elemento `"Sam"` do array `names`
* `item` representa temporariamente `"Sam"`
* `Text(item)` exibe `"Sam"`
* Depois continua e lê o próximo elemento `"John"`
* Em seguida repete a execução do mesmo código de view

No final, todos os nomes do array serão exibidos.

A vantagem de escrever assim é que, quando a quantidade de nomes aumenta, não precisamos repetir muitos `Text`; basta alterar o conteúdo do array.

### Repetindo fotos

`ForEach` não serve apenas para exibir texto, mas também imagens, cores ou outras views do SwiftUI.

Por exemplo, preparamos 4 imagens:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Arraste essas quatro imagens para a pasta Assets no Xcode.

![image](../../Resource/017_for3.png)

Se não usarmos `ForEach`, precisaremos escrever cada imagem manualmente:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Efeito exibido:

![image](../../Resource/017_for4.png)

Essa forma consegue realizar a função, mas o código fica mais longo.

Se o número de imagens aumentar, teremos que repetir cada vez mais código de `Image`.

Se depois quisermos modificar de forma unificada o tamanho das imagens, também teremos que alterá-las uma por uma.

Nesse momento, podemos colocar os nomes das imagens em um array e depois usar `ForEach` para gerar repetidamente as views de imagem:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Aqui, `images` é um array de strings, e cada elemento do array é o nome de uma imagem.

`ForEach(images, id: \.self)` significa ler em sequência cada elemento do array `images`, usar o próprio elemento para distinguir cada item e então gerar a view correspondente com base no elemento atual.

Por exemplo, se o primeiro elemento lido for `"430F9BEF"`, então:

```swift
Image(item)
```

equivale a:

```swift
Image("430F9BEF")
```

As imagens seguintes também serão exibidas uma por uma da mesma maneira.

![image](../../Resource/017_for4.png)

Aqui ainda usamos:

```swift
id: \.self
```

O motivo é o mesmo de antes: como os elementos do array `images` também são strings simples, na fase inicial podemos usar diretamente o próprio elemento como forma de distinção.

Você pode entender isso como uma fórmula fixa:

**Quando `ForEach` percorre arrays simples como `String` ou `Int`, normalmente escrevemos `id: \.self`.**

### Adicionar novas imagens

Se mais tarde precisarmos adicionar novas imagens, basta modificar o conteúdo do array:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Não precisamos escrever novamente novo código `Image`.

Se houver muitas imagens, podemos usar isso junto com `ScrollView`; caso contrário, quando o conteúdo ultrapassar a tela, não será possível visualizar tudo por completo.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modificar imagens

Quando quisermos alterar o estilo das imagens de forma unificada, basta modificar o código dentro de `ForEach`.

Por exemplo, alterar a largura para `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Assim, todas as imagens serão alteradas juntas, sem necessidade de modificá-las uma por uma.

Essa é uma das funções importantes de `ForEach`:

**Quando várias views têm a mesma estrutura e apenas o conteúdo é diferente, podemos escrever apenas um único trecho de código de view e deixar que os dados do array determinem o que será exibido.**

## Resumo

Nesta lição, aprendemos o loop `for` e o `ForEach`.

O loop `for` é usado para processar em ordem os elementos de arrays ou intervalos, sendo mais voltado ao processamento de dados.

`ForEach` é usado no SwiftUI para gerar views repetidamente com base no conteúdo de arrays, sendo mais voltado à exibição de views.

Na fase atual de aprendizado, a forma mais comum de `ForEach` é:

```swift
ForEach(array, id: \.self) { elemento in
    código SwiftUI
}
```

Nela, `id: \.self` significa usar o próprio elemento para distinguir cada item.

Quando o conteúdo do array é composto por tipos simples como `String` e `Int`, normalmente podemos começar usando essa única forma.

No futuro, ao navegar em páginas da web ou apps, se você vir um grupo de textos repetidos, imagens ou outros conteúdos de lista, pode lembrar que no SwiftUI esse tipo de conteúdo normalmente é primeiro colocado em um array e depois exibido um por um por meio de `ForEach`.
