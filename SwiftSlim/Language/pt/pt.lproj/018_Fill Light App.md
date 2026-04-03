# Aplicativo Fill Light

Nesta lição, vamos criar um aplicativo de fill light muito interessante. Quando a noite chega, podemos fazer a tela do celular mostrar diferentes cores e usá-la como uma luz de preenchimento simples.

Este aplicativo de fill light pode trocar de cor ao tocar na tela, e também pode ajustar o brilho com um controle deslizante.

Neste exemplo, vamos aprender a usar `brightness` para ajustar o brilho de uma view, `onTapGesture` para adicionar um gesto de toque a uma view, e o controle `Slider`.

Resultado:

![Color](../../Resource/018_color.png)

## Exibindo uma Cor

Primeiro, vamos fazer a view exibir uma cor.

No SwiftUI, `Color` não representa apenas uma cor, mas também pode ser exibido como uma view:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Aqui, `Color.red` representa uma view vermelha. `.ignoresSafeArea()` faz a view de cor preencher toda a tela, então ela se parece mais com um verdadeiro efeito de fill light.

Resultado:

![Color](../../Resource/018_color1.png)

### Array de Cores e Índice

Agora só uma cor está sendo exibida. Mas uma fill light normalmente não tem apenas uma cor. Ela também pode mostrar azul, amarelo, roxo, branco e outras cores.

Queremos alternar entre diferentes cores quando a tela for tocada. Podemos colocar essas cores em um array para gerenciá-las de forma unificada:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Um array é adequado para armazenar "um grupo de dados do mesmo tipo". Aqui, cada elemento do array é um `Color`.

Se quisermos exibir uma cor específica, podemos usar um índice:

```swift
colors[0]
```

Isso significa ler a cor no índice `0` do array, ou seja, a primeira cor.

Agora o código pode ser escrito assim:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Dessa forma, a tela mostra a primeira cor do array, que é o vermelho.

### Usando o Índice para Controlar a Cor

Se precisarmos alternar entre diferentes cores, precisaremos de uma variável para gerenciar o índice em vez de deixar o índice fixo no código.

Podemos usar `@State` para declarar uma variável que armazena o índice:

```swift
@State private var index = 0
```

Aqui, `index` representa o índice da cor atual.

Quando `index` muda, o SwiftUI recalcula a interface e atualiza o conteúdo exibido.

Depois, mudamos o `colors[0]` original para:

```swift
colors[index]
```

Dessa forma, a cor exibida na view será determinada por `index`.

Agora o código fica assim:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Quando `index` mudar, `colors[index]` também exibirá uma cor diferente.

Por exemplo:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

É importante notar que `index` não pode ultrapassar o maior índice do array, ou ocorrerá um erro de índice fora do intervalo.

## Gesto de Toque

Agora podemos exibir cores diferentes com base em `index`, mas ainda não podemos tocar para alterná-las.

Na lição anterior de “Carrossel de Frases”, usamos `Button` para controlar a troca das frases.

Mas desta vez, queremos “tocar em toda a área colorida” para trocar a cor, então `onTapGesture` é mais adequado.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Quando tocamos na view de cor, este código é executado:

```swift
index += 1
```

Isso significa aumentar `index` em `1`. Depois que o índice aumenta, `colors[index]` exibirá a próxima cor do array.

### `onTapGesture`

`onTapGesture` é um modificador de gesto que adiciona uma ação de toque a uma view.

Uso básico:

```swift
.onTapGesture {
    // code
}
```

Por exemplo:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Quando essa view vermelha é tocada, o código dentro das chaves é executado e isto aparece no console:

```swift
Click color
```

Por meio do `onTapGesture`, podemos definir o que acontece depois que uma view é tocada.

### Diferença em relação ao `Button`

Antes, aprendemos sobre a view `Button`. Tanto `Button` quanto `onTapGesture` podem lidar com ações de toque, mas seus cenários de uso não são exatamente os mesmos.

`onTapGesture` é mais adequado para “adicionar função de toque a uma view já existente”, como `Color`, `Image`, `Text` ou outra view comum.

`Button` é mais adequado quando queremos representar um botão claro, como “Confirmar”, “Enviar” ou “Excluir”.

Neste aplicativo de fill light, queremos que a função de troca de cor seja mais simples. Tocar em toda a área colorida para mudar a cor faz de `onTapGesture` uma boa escolha aqui.

## O Problema do Índice

Agora podemos tocar na tela para alternar entre diferentes cores.

Mas há um problema importante aqui: **o índice pode sair do intervalo do array**.

Por exemplo:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Se continuarmos tocando a tela, `index` acabará se tornando `4`, e então ocorrerá o erro “index out of range”.

Isso acontece porque o array `colors` tem `4` elementos, mas a indexação começa em `0`, então o intervalo válido de índices é `0 - 3`, e não `4`.

Se acessarmos `colors[4]`, ocorrerá o erro “index out of range”.

No código atual, cada toque aumenta automaticamente `index` em `1`. Se não tratarmos isso, eventualmente ele certamente ultrapassará o intervalo válido.

Por isso, precisamos verificar o índice quando a tela for tocada: se ele já estiver na última cor, voltamos para a primeira; caso contrário, continuamos somando `1`.

Podemos fazer isso com uma instrução `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Neste código, `colors.count` significa o número de elementos no array.

No array atual há 4 cores, então:

```swift
colors.count // 4
```

Mas o maior índice não é `4`, e sim `3`, porque a indexação começa em `0`.

Portanto, o último índice deve ser escrito assim:

```swift
colors.count - 1
```

Isto é:

```swift
4 - 1 = 3
```

Essa lógica significa: se o índice atual já corresponder à última cor, redefina o índice para `0`; caso contrário, aumente-o em `1`.

Dessa forma, as cores podem alternar em ciclo.

### Otimizando a Lógica do Índice

Se quisermos deixar o código mais conciso, também podemos usar o operador ternário:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Esse código significa: se `index == colors.count - 1` for verdadeiro, retorne `0`. Caso contrário, retorne `index + 1`.

Por fim, atribuímos o resultado de volta a `index`.

Agora podemos alcançar o efeito de troca de cores.

Código completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Agora podemos tocar na tela e alternar entre diferentes cores. Um aplicativo fill light básico está pronto.

## Exibindo o Nome da Cor

Podemos adicionar mais um grupo de textos correspondente às cores, para que quando a cor mudar, o nome da cor atual também seja mostrado na tela.

Por exemplo:

- Vermelho mostra `Red`
- Azul mostra `Blue`
- Amarelo mostra `Yellow`
- Roxo mostra `Purple`

Aqui também podemos usar um array para armazenar os nomes das cores:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

A ordem dos textos nesse array deve corresponder exatamente à ordem das cores no array de cores.

Depois podemos usar `Text` para mostrar o nome da cor correspondente ao índice atual:

```swift
Text(colorsName[index])
```

`Text` exibe o nome da cor atual de acordo com `index`.

Use modificadores para melhorar a aparência de `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Isso faz com que `Text` apareça em branco, com tamanho de título e em negrito.

Agora temos uma view `Color` em tela cheia. Se quisermos que `Text` apareça sobre a view `Color`, precisamos usar o contêiner de layout `ZStack` para sobrepor os dois.

```swift
ZStack {
    Color
    Text
}
```

Então o código fica assim:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Dessa forma, o fundo é a view de cor, e sobre ela é sobreposta uma view de texto.

Resultado:

![Color](../../Resource/018_color2.png)

É importante notar que, em um `ZStack`, as views escritas depois normalmente aparecem na frente. Se `Text` for escrito antes de `Color`, a view `Color` escrita depois pode cobrir o `Text`.

## Controlando o Brilho

Agora podemos mudar entre diferentes cores, mas uma fill light tem outra função importante: **ajustar o brilho**.

No SwiftUI, podemos usar o modificador `brightness` para ajustar o brilho de uma view.

Por exemplo:

```swift
.brightness(1)
```

Podemos escrever:

```swift
colors[index]
    .brightness(0.5)
```

Isso deixa a cor atual mais brilhante e mais próxima do efeito de uma fill light.

O intervalo de brilho é `0 - 1`. `0` significa manter a cor original, e quanto mais perto o valor estiver de `1`, mais brilhante a cor se torna. `1` significa o resultado branco mais brilhante.

Embora possamos controlar `brightness` no código, o usuário ainda não pode ajustá-lo diretamente por conta própria.

Por isso, precisamos adicionar um controle que possa ser arrastado: `Slider`.

## View `Slider`

No SwiftUI, `Slider` é um controle usado para selecionar um valor dentro de um intervalo. A Apple o descreve como “um controle para selecionar um valor de um intervalo linear limitado”.

Uso básico:

```swift
Slider(value: $value, in: 0...1)
```

Explicação dos parâmetros:

1. `value: $value`: `Slider` precisa estar ligado a uma variável.

    Quando o controle deslizante é arrastado, o valor da variável também muda ao mesmo tempo. E, ao contrário, se a variável mudar, o controle deslizante também será atualizado.

    Isso é muito semelhante ao `TextField`, que aprendemos antes. Ambos “ligam um controle a uma variável”.

    Uma variável ligada precisa ter o símbolo `$` antes dela para representar o binding.

2. `in: 0...1`: esse parâmetro representa o intervalo de valores do controle deslizante.

    Aqui, `0...1` significa que o valor mínimo é `0` e o valor máximo é `1`.

    Quando o controle deslizante é movido totalmente para a esquerda, a variável ligada fica próxima de `0`; quando é movido totalmente para a direita, ela fica próxima de `1`.

Por exemplo:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` está ligado à variável `value`. Quando o controle deslizante é arrastado, o valor de `value` também muda ao mesmo tempo.

Aparência:

![Slider](../../Resource/018_slider.png)

Quando o `Slider` é movido para a esquerda, o valor ligado `value` se torna `0`. Quando é movido para a direita, torna-se `1`.

### Intervalo de Valores

O intervalo de valores de `Slider` não é fixo. Ele também pode ser escrito assim:

```swift
0...100
```

ou como outro intervalo.

Mas neste aplicativo fill light precisamos controlar o brilho, então `0...1` é a escolha mais adequada.

## Usando `Slider` para Controlar o Brilho

Agora precisamos conectar `Slider` com `brightness`.

Primeiro, crie uma variável para armazenar o valor do brilho:

```swift
@State private var slider = 0.0
```

Aqui, `0.0` é um valor do tipo `Double`.

Como `Slider` normalmente é ligado a um tipo numérico, e aqui queremos que ele mude continuamente, `Double` é mais adequado. Além disso, `brightness` só pode aceitar um valor do tipo `Double`.

Depois passe esse valor para `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Quando `slider == 0`, a cor permanece em seu estado padrão. Quanto mais perto `slider` estiver de `1`, mais brilhante a cor parecerá.

### Adicionando o Controle `Slider`

Em seguida, adicione um controle `Slider` para modificar essa variável:

```swift
Slider(value: $slider, in: 0...1)
```

Quando o slider muda, o valor de `slider` também muda, e `brightness(slider)` atualiza o brilho ao mesmo tempo.

Esse é um exemplo muito típico de como “variáveis dirigem a view” no SwiftUI.

### Ajustando a Aparência de `Slider`

Por padrão, `Slider` usa a largura disponível.

Podemos dar a ele uma largura fixa:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Depois adicionamos mais alguns modificadores para torná-lo mais visível:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Isso dá ao controle deslizante um fundo branco e cantos arredondados, fazendo com que ele se destaque mais sobre a view `Color`.

Por fim, coloque-o na parte inferior da tela.

Como já estamos usando `ZStack`, podemos colocar um `VStack` dentro dele e usar `Spacer()` para empurrar o `Slider` para baixo.

## Código Completo

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Resultado:

![Color](../../Resource/018_color.png)

## Resumo

Usando o conhecimento que aprendemos antes, junto com conceitos básicos como cores e arrays, construímos um aplicativo fill light muito interessante.

Por meio deste aplicativo fill light, aprendemos a usar `brightness` para ajustar o brilho, `onTapGesture` para adicionar ações de toque às views e o controle `Slider`.

Adicionamos `onTapGesture` à view `Color` para trocar as cores. Também usamos o controle `Slider` para mudar uma variável que gerencia `brightness`, o que é outro exemplo de como “as variáveis dirigem a view”.

Também revisamos o operador ternário, usamos `ZStack` para sobrepor views e usamos arrays para gerenciar um grupo de dados do mesmo tipo. Isso ajuda a aprofundar nossa compreensão sobre arrays e índices, incluindo o problema prático de evitar erros de índice fora do intervalo.

Embora este exemplo não seja complicado, ele conecta muitas das ideias básicas que aprendemos antes. Quando elas são combinadas em um pequeno projeto real, fica mais fácil entender para que serve cada conceito.

### Cenário de Uso Real

Imagine colocar um iPhone antigo sobre a mesa e usar o aplicativo fill light que você mesmo desenvolveu para controlar a cor da luz. Seria uma experiência muito boa.

Existem muitos aplicativos de “fill light” na App Store, e eles também não parecem muito complicados.

![AppStore](../../Resource/018_appStore.PNG)

Podemos começar desenvolvendo aplicativos simples e tentar publicá-los na App Store. Isso não apenas aumenta nosso interesse pelo desenvolvimento, mas também registra nosso crescimento.

### Exercício Após a Aula

Você pode continuar pensando em maneiras de expandir este aplicativo fill light, por exemplo:

- Adicionar mais cores
- Mostrar o valor atual do brilho
- Melhorar o design da área inferior do slider

Quando você realmente começar a usar esse conhecimento, vai perceber que cada conceito que aprendemos é, na verdade, uma ferramenta para construir aplicativos.

Quanto mais ferramentas dominarmos, mais recursos poderemos criar.
