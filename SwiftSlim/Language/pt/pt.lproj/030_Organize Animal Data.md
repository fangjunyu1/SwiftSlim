# Organizando dados de animais

Na aula anterior, concluímos um exemplo simples de enciclopédia de animais.

![view](../../../Resource/029_view.png)

Quando o usuário clica em um animal, a página exibe os detalhes do animal por meio de um `Sheet`.

No entanto, havia um problema no código da aula anterior: os dados dos animais estavam escritos diretamente dentro de `ContentView`.

Por exemplo:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Exibe a lista de animais
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Esse código pode ser executado normalmente, mas quando há cada vez mais dados de animais, `ContentView` fica muito longo.

`ContentView` originalmente deveria ser responsável principalmente por exibir a interface, mas agora também armazena muitos dados de animais. Isso afeta a leitura do código e também dificulta a manutenção posterior.

Portanto, nesta aula, faremos uma coisa:

organizar os dados dos animais para fora de `ContentView`.

## Por que separar os dados?

No SwiftUI, o código da visualização geralmente é responsável por exibir a interface.

Por exemplo:

```swift
Text("Golfinho")
Image("dolphin")
```

Esses códigos estão todos relacionados à exibição da interface.

Já os dados dos animais em si, como nome do animal, nome da imagem, área de distribuição, habitat e texto de descrição, não fazem parte da estrutura da interface.

Eles se parecem mais com um conjunto de informações fixas:

```swift
Animal(
    name: "Golfinho",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
    habitat: "Oceanos, águas costeiras e alguns grandes rios.",
    animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
),
// ...
```

Se escrevermos o código da interface e o código dos dados todos juntos, o código ficará cada vez mais confuso.

Por isso, podemos colocar os dados dos animais no tipo `Animal`.

## Usando static para salvar dados fixos

Primeiro, vamos ver a forma organizada:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // ...
    ]
}
```

Aqui foi adicionada uma linha de código:

```swift
static let animals: [Animal] = [
    
]
```

`static` indica uma propriedade estática.

Uma propriedade estática pertence ao próprio tipo, não a uma instância concreta específica.

Essa frase é um pouco abstrata, então podemos entendê-la com um exemplo simples.

## Propriedades comuns e propriedades estáticas

Por exemplo, definimos um `Student`:

```swift
struct Student {
    let name: String
}
```

Aqui, `name` é uma propriedade comum, e uma propriedade comum pertence a uma instância concreta específica.

Se quisermos acessar `name`, precisamos primeiro criar um estudante concreto:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Aqui, `student` é uma instância. Também podemos entendê-lo inicialmente como um conjunto concreto de dados de estudante.

Como o nome de cada estudante pode ser diferente, `name` precisa estar em um estudante concreto.

No entanto, alguns dados não pertencem a uma instância concreta específica.

Por exemplo, queremos preparar um conjunto de dados de exemplo para pré-visualização:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Aqui, `previewStudents` tem `static` antes dele, portanto é uma propriedade estática.

Uma propriedade estática não pertence a um estudante, mas ao próprio tipo `Student`.

Portanto, não precisamos criar primeiro um estudante específico; podemos acessá-la diretamente pelo nome do tipo:

```swift
print(Student.previewStudents.count)    // 3
```

O modo de acesso aqui é:

```swift
NomeDoTipo.nomeDaPropriedadeEstatica
```

ou seja:

```swift
Student.previewStudents
```

Da mesma forma, na enciclopédia de animais, podemos acessar os dados dos animais assim:

```swift
Animal.animals
```

## Voltando a ContentView

Agora, os dados dos animais já foram salvos no tipo `Animal`.

Portanto, não precisamos mais escrever um array de animais muito longo dentro de `ContentView`.

Podemos alterar para:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Exibe a lista de animais
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Esta linha de código significa:

```swift
let animals = Animal.animals
```

retirar do tipo `Animal` este conjunto de dados de animais chamado `animals` e depois salvá-lo na constante `animals` da visualização atual.

Depois de escrever dessa forma, `ContentView` ficará mais simples.

`ContentView` é responsável por exibir a interface, e `Animal.animals` é responsável por fornecer os dados dos animais.

## Separando Animal em um arquivo independente

Na aula anterior, para tornar o exemplo mais fácil de entender, escrevemos `Animal` e `ContentView` no mesmo arquivo.

Como naquela época o código ainda era pequeno, não havia problema em escrever assim.

Mas agora há cada vez mais dados de animais. Se continuarmos escrevendo todo o código dentro de `ContentView.swift`, o arquivo ficará muito longo e também será menos conveniente de ler.

Por isso, podemos colocar `Animal` sozinho em um novo arquivo Swift.

No Xcode, podemos criar um novo arquivo Swift, por exemplo:

```swift
Animal.swift
```

Depois, movemos a estrutura `Animal` para esse arquivo:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // ...
    ]
}
```

Depois dessa organização:

`ContentView.swift` é responsável por exibir a interface.

`Animal.swift` é responsável por descrever a estrutura dos dados dos animais.

Embora eles estejam em arquivos diferentes, desde que todos estejam no mesmo projeto, `ContentView` ainda pode usar `Animal` diretamente.

Por exemplo:

```swift
let animals = Animal.animals
```

Aqui, não é necessário importar `Animal.swift` adicionalmente em `ContentView.swift`.

O Swift reconhece automaticamente os arquivos Swift dentro do mesmo projeto.

## Usando extension para continuar organizando o código

Agora, já movemos os dados dos animais de `ContentView` para dentro de `Animal`.

No entanto, a estrutura `Animal` ainda contém dois tipos de código ao mesmo tempo:

O primeiro tipo são as propriedades do próprio modelo de animal:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

O segundo tipo são os dados fixos dos animais:

```swift
static let animals: [Animal] = [
    // ...
]
```

Para deixar a estrutura do código mais clara, podemos usar `extension` para separar essas duas partes.

`extension` significa extensão.

Ela pode adicionar novo código com base em um tipo existente.

Por exemplo:

```swift
extension Animal {
    
}
```

Isso indica que estamos estendendo o tipo `Animal`.

## Colocando os dados dos animais em extension

Podemos alterar `Animal` para ficar assim:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // ...
    ]
}
```

Depois dessa organização, a estrutura do código fica mais clara.

`struct Animal` é responsável por descrever quais propriedades um animal deve ter.

`extension Animal` é responsável por salvar um conjunto de dados fixos de animais.

Observe que, embora `animals` tenha sido movido para `extension Animal`, o modo de uso não muda.

Ainda podemos usá-lo assim:

```swift
let animals = Animal.animals
```

Essa também é uma característica de `extension`: ela apenas nos ajuda a organizar o código, sem alterar o modo de chamada externo.

## Quando houver muitos dados, também é possível criar outro arquivo AnimalData

Agora, já colocamos `Animal` em um arquivo independente `Animal.swift`.

Se houver poucos dados de animais, podemos escrever `extension Animal` diretamente em `Animal.swift`.

Mas, se houver cada vez mais dados de animais, também podemos criar outro arquivo, por exemplo:

```swift
AnimalData.swift
```

Depois, colocamos os dados fixos dos animais nele:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dados dos animais
    ]
}
```

Depois de fazer isso, a divisão de responsabilidades do código fica mais clara:

`Animal.swift` é responsável apenas por definir o modelo de animal.

`AnimalData.swift` é responsável apenas por salvar os dados dos animais.

`ContentView.swift` é responsável apenas por exibir a interface.

As responsabilidades de cada arquivo ficam mais claras.

Observe que `AnimalData.swift` é apenas o nome do arquivo, não um novo tipo Swift. Dentro desse arquivo, ainda estamos adicionando dados fixos a `Animal` por meio de `extension Animal`.

## Código completo

Abaixo está o código organizado de `Animal.swift`:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Código organizado de `AnimalData.swift`:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Os golfinhos são mamíferos marinhos inteligentes. Eles vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        Animal(
            name: "Girafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanas e bosques abertos na África.",
            habitat: "Campos, savanas e florestas abertas.",
            animalDescription: "As girafas são os animais terrestres mais altos. Elas têm pescoços longos, pernas longas e geralmente se alimentam de folhas de árvores altas."
        ),
        Animal(
            name: "Leão",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Encontrado principalmente na África subsaariana, com uma pequena população no oeste da Índia.",
            habitat: "Campos, savanas e bosques abertos.",
            animalDescription: "Os leões são grandes felinos poderosos. Eles geralmente vivem em grupos chamados alcateias e são frequentemente conhecidos como os reis do mundo animal."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Florestas montanhosas no centro da China.",
            habitat: "Florestas de bambu em áreas montanhosas frias e úmidas.",
            animalDescription: "Os pandas são ursos conhecidos por sua pelagem preta e branca. Eles se alimentam principalmente de bambu e são um dos animais mais reconhecíveis do mundo."
        ),
        Animal(
            name: "Urso Polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiões árticas ao redor do Polo Norte.",
            habitat: "Gelo marinho, áreas costeiras e ambientes árticos frios.",
            animalDescription: "Os ursos polares são grandes ursos adaptados a ambientes frios. Eles são nadadores fortes e dependem principalmente do gelo marinho para caçar focas."
        )
    ]
}
```

Em `ContentView.swift`, podemos usar assim:

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
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

Dica: em `Animal.swift` e `AnimalData.swift`, a primeira linha é:

```swift
import Foundation
```

Antes, quando escrevíamos interfaces SwiftUI, usávamos com frequência:

```swift
import SwiftUI
```

Isso ocorre porque `ContentView`, `Text`, `Button` e `Color` estão todos relacionados à interface; por isso, ao escrever arquivos de interface, normalmente precisamos importar SwiftUI.

Mas aqui, `Animal.swift` e `AnimalData.swift` não são arquivos de interface. Eles são usados principalmente para definir o modelo de animal e salvar os dados dos animais.

Neste trecho de código, `UUID()` precisa usar `Foundation`, portanto basta importar `Foundation`.

## Resumo

Nesta aula, fizemos principalmente uma coisa: organizamos os dados dos animais para fora de `ContentView`.

Na forma original, os dados dos animais eram escritos diretamente em `ContentView`. Esse código pode ser executado, mas quando os dados aumentam, o arquivo da visualização fica cada vez mais longo.

Depois da organização, `ContentView` é responsável apenas por exibir a interface, e `Animal.animals` é responsável por fornecer os dados dos animais.

Nesta aula, também aprendemos dois novos conhecimentos.

O primeiro é `static`.

`static` indica uma propriedade estática. Uma propriedade estática pertence ao próprio tipo e pode ser acessada diretamente usando “nome do tipo.nome da propriedade”.

Por exemplo:

```swift
Animal.animals
```

O segundo é `extension`.

`extension` significa extensão. Ela permite separar o código do mesmo tipo em partes diferentes, deixando a estrutura do código mais clara.

Neste exemplo, usamos `extension Animal` para salvar os dados dos animais, deixando a própria estrutura `Animal` mais simples.

Além disso, `Animal` salva principalmente o modelo de dados e não escreve diretamente uma interface SwiftUI; por isso, aqui usamos `import Foundation`.

O foco desta aula não é tornar o código mais complexo, mas torná-lo mais fácil de ler e manter.
