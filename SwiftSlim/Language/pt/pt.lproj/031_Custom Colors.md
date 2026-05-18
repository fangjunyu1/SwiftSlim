# Cores personalizadas

Nesta aula, vamos aprender como personalizar cores no SwiftUI.

Nas aulas anteriores, já usamos as cores padrão fornecidas pelo SwiftUI, por exemplo:

```swift
Color.blue
Color.red
Color.green
```

Essas cores são muito fáceis de usar, mas no desenvolvimento real de Apps, as cores padrão geralmente não são precisas o suficiente.

Por exemplo, um design pode usar cores como estas:

```text
#2c54c2
#4875ed
#213e8d
```

Esse tipo de cor é chamado de cor Hex.

Nesta aula, primeiro faremos o SwiftUI oferecer suporte a cores Hex e depois usaremos `static` para organizar as cores usadas com frequência.

Por fim, aplicaremos as cores personalizadas à visualização da enciclopédia de animais e usaremos ainda um fundo em gradiente, para que o botão pareça ter mais profundidade.

## Por que precisamos de cores personalizadas?

No SwiftUI, podemos usar diretamente as cores do sistema.

Por exemplo:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Aqui, `.blue` representa azul. Na verdade, é uma forma abreviada de escrever `Color.blue`.

A vantagem das cores padrão é que elas são simples e convenientes, mas a seleção de cores é relativamente limitada.

Por exemplo:

```swift
Color.blue
```

Só pode representar o azul padrão fornecido pelo SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Mas, no desenvolvimento real, muitas vezes precisamos de cores mais específicas.

Por exemplo, mesmo sendo azul, ele pode ter diferentes efeitos, como azul claro, azul escuro, azul acinzentado ou azul vivo.

![More Blue](../../../Resource/031_color5.png)

Nesse momento, se usarmos apenas `Color.blue`, será difícil reproduzir o efeito do design.

Por isso, precisamos fazer o SwiftUI oferecer suporte a cores personalizadas.

## O que é uma cor Hex?

As cores na tela geralmente são formadas por três canais: vermelho, verde e azul, ou seja, RGB.

RGB significa respectivamente:

```text
Red     // Vermelho
Green   // Verde
Blue    // Azul
```

A cor Hex é uma forma de representar cores RGB.

Por exemplo:

```swift
#5479FF
```

Esse valor de cor pode ser entendido de forma simples como três partes:

```text
54  // Representa o canal vermelho
79  // Representa o canal verde
FF  // Representa o canal azul
```

Nesta aula, não precisamos calcular esses valores nem entender profundamente as regras do sistema hexadecimal.

Por enquanto, só precisamos saber: `#5479FF` representa uma cor específica.

No futuro, quando virmos escritas como `#2c54c2` ou `#4875ed`, poderemos primeiro entendê-las como valores de cor.

Em ferramentas de design como Sketch, Figma e Photoshop, também é comum ver valores de cor parecidos.

![color](../../../Resource/031_color.png)

No entanto, por padrão, o SwiftUI não permite escrever diretamente assim:

```swift
Color(hex: "#5479FF")
```

Por isso, precisamos estender o tipo `Color` por conta própria, para que ele suporte a criação de cores por meio de strings Hex.

## Criando o arquivo Color+Hex.swift

Primeiro, criamos um novo arquivo Swift.

O nome do arquivo pode ser:

```text
Color.swift
```

Também pode ser um nome mais claro:

```text
Color+Hex.swift
```

Aqui, é mais recomendado usar:

```text
Color+Hex.swift
```

Em projetos Swift, nomes de arquivo como `Color+Hex.swift` são muito comuns.

Ele indica que esse arquivo é um arquivo de extensão que adiciona a capacidade Hex ao `Color`.

O nome do arquivo não afeta diretamente a execução do código; ele serve apenas para facilitar a compreensão da finalidade desse arquivo.

## Adicionando o código Color(hex:)

No arquivo `Color+Hex.swift`, escreva o código abaixo:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Esse código usa `extension` para estender o tipo `Color` e adiciona a `Color` um novo método inicializador:

```swift
init(hex: String)
```

Depois de ter esse método inicializador, podemos passar uma string Hex para `Color` e, assim, criar uma cor personalizada:

```swift
Color(hex: "#5479FF")
```

Internamente, esse código de extensão converte a string Hex em uma cor RGB que o SwiftUI consegue reconhecer.

Nesta etapa, não é necessário entender profundamente a lógica de conversão de cada linha. Basta saber que o método `Color(hex:)` adicionado permite criar cores personalizadas por meio de valores de cor Hex.

## Usando cores personalizadas

Agora, podemos testar cores personalizadas em `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Efeito exibido:

![color](../../../Resource/031_color1.png)

Neste exemplo, a primeira linha usa a cor do sistema:

```swift
.foregroundStyle(Color.blue)
```

As três linhas seguintes usam cores Hex personalizadas:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Ao comparar, podemos perceber que o azul do sistema tem apenas um efeito padrão.

Já as cores Hex conseguem representar variações de azul mais detalhadas.

Esse é o valor das cores personalizadas: elas permitem que as cores da interface fiquem mais próximas do design real e também facilitam o controle do estilo visual do App.

## Usando static para organizar cores

Agora, já podemos criar cores por meio de strings Hex:

```swift
Color(hex: "#2c54c2")
```

Essa escrita funciona normalmente, mas se a mesma cor aparecer repetidamente em vários lugares, a manutenção futura não será tão conveniente.

Se esse valor de cor for escrito em 10 lugares, quando quisermos alterar esse azul no futuro, precisaremos modificar um por um.

Nesse momento, podemos usar `static` para organizar de forma unificada as cores usadas com frequência.

No final do arquivo `Color+Hex.swift`, continue adicionando o código abaixo:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aqui, adicionamos três propriedades estáticas a `Color`: `animalBlue`, `animalLightBlue` e `animalDarkBlue`. Elas representam tons diferentes de azul.

Como essas propriedades usam `static`, elas pertencem ao próprio tipo `Color`.

Ao usar, podemos acessá-las diretamente por meio de `Color.`:

```swift
Color.animalBlue
```

Essa forma de escrita é mais clara do que escrever diretamente a string Hex.

Quando vemos `Color.animalBlue`, sabemos que ela representa o azul usado na enciclopédia de animais.

Mas, quando vemos `Color(hex: "#2c54c2")`, só sabemos que é um valor de cor, e não é fácil perceber seu uso específico.

Gerenciar as cores de forma unificada também tem outra vantagem: facilita modificações futuras.

Se quisermos ajustar a cor principal da enciclopédia de animais, só precisamos modificar o local da definição:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Todos os lugares que usam essa cor serão atualizados juntos.

Esse é o significado de usar `static` para organizar cores: tornar os nomes das cores mais claros e facilitar a manutenção posterior.

## Aplicando à enciclopédia de animais

Agora, podemos aplicar as cores personalizadas à visualização anterior da enciclopédia de animais.

Antes, o fundo do botão do animal era branco:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Agora, podemos alterá-lo para uma cor personalizada:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Aqui, `Color.animalBlue` é justamente a cor estática que acabamos de definir em `Color+Hex.swift`.

O texto do botão usa branco:

```swift
.foregroundStyle(Color.white)
```

O fundo do emoji do animal usa branco semitransparente:

```swift
.background(Color.white.opacity(0.15))
```

Assim, o botão forma um estilo visual azul unificado.

O ponto principal desta etapa não é aumentar a complexidade do código, mas aplicar de verdade à interface as cores personalizadas aprendidas antes.

## Usando fundo em gradiente

Além de usar uma única cor, também podemos combinar várias cores para criar um efeito de gradiente.

Por exemplo, antes definimos estas cores:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Essas cores não só podem ser usadas separadamente, como também podem ser combinadas em um fundo em gradiente.

No SwiftUI, podemos usar `LinearGradient` para criar um gradiente linear.

Por exemplo:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Esse código cria um fundo em gradiente da esquerda para a direita, no qual a cor passa gradualmente de `Color.animalBlue` para `Color.animalLightBlue`.

Entre eles, `colors` é usado para definir as cores que participam do gradiente, enquanto `startPoint` e `endPoint` são usados para controlar a direção do gradiente.

### Testando o efeito de gradiente

Podemos usar um `Text` simples para testar o fundo em gradiente.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Efeito exibido:

![color](../../../Resource/031_color3.png)

Neste exemplo, o fundo de `Text` já não é uma cor única, mas uma cor em gradiente que muda gradualmente da esquerda para a direita.

Em comparação com um fundo comum, um fundo em gradiente tem mais profundidade e também facilita a criação de um ponto de destaque visual na interface.

## Usando fundo em gradiente na enciclopédia de animais

Agora, podemos alterar a cor de fundo do botão do animal:

```swift
.background(Color.animalBlue)
```

Para um fundo em gradiente:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

O código completo é o seguinte:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Efeito exibido:

![color](../../../Resource/031_color4.png)

Agora, o botão do animal já não possui apenas uma cor de fundo única, mas tem um efeito de gradiente da esquerda para a direita.

Em comparação com um fundo de cor única, o fundo em gradiente pode fazer a interface parecer ter mais profundidade e também ficar mais próxima do design visual de um App real.

## Diferença entre fundo de cor única e fundo em gradiente

Um fundo de cor única usa apenas uma cor.

Por exemplo:

```swift
.background(Color.animalBlue)
```

Essa forma de escrita é simples e clara, sendo adequada para a maioria das interfaces básicas.

Um fundo em gradiente usa várias cores.

Por exemplo:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Essa forma de escrita pode dar mais profundidade à interface, mas também aumenta mais facilmente a complexidade visual.

Por isso, no desenvolvimento real, podemos entender assim:

Fundos de cor única são adequados para textos comuns, botões comuns, cartões comuns e fundos de páginas comuns.

Fundos em gradiente são adequados para botões importantes, áreas superiores, cartões de capa, entradas de função e outros locais que precisam de destaque.

## Resumo

Nesta aula, aprendemos como usar cores personalizadas no SwiftUI.

Primeiro, entendemos as cores Hex.

Por exemplo:

```text
#2c54c2
```

Ele representa uma cor específica.

Depois, usamos `extension Color` para estender o tipo `Color`.

Isso permite que o SwiftUI crie cores da seguinte forma:

```swift
Color(hex: "#2c54c2")
```

Em seguida, usamos `static` para organizar as cores usadas com frequência:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Assim, em outras visualizações, podemos usar diretamente:

```swift
Color.animalBlue
```

Em comparação com escrever a string Hex todas as vezes, essa forma é mais clara e também facilita a modificação unificada das cores no futuro.

Por fim, aprendemos `LinearGradient` e combinamos cores personalizadas para criar um fundo em gradiente:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Com esta aula, concluímos o processo que vai de “criar cores personalizadas” até “usar cores em uma interface real”.

No futuro, quando uma cor precisar ser usada repetidamente em vários lugares, podemos considerar primeiro organizá-la em uma extensão de `Color`.

Assim, o código ficará mais claro e o estilo da interface também será mais fácil de manter unificado.
