# Enciclopédia Animal 

Nesta aula, continuaremos praticando views personalizadas e passagem de dados.

Vamos criar uma visualização simples de enciclopédia animal. A página exibirá cinco animais; ao tocar em um animal, uma visualização de detalhes será apresentada, mostrando a imagem, a área de distribuição, o habitat e a descrição desse animal.

Resultado final:

![view](../../../Resource/029_view.png)

Com este exemplo, podemos praticar a combinação entre estrutura de dados, exibição em lista, interação por toque e apresentação de Sheet.

## Preparar os recursos de imagem

Primeiro, precisamos preparar cinco imagens de animais:

- Golfinho: `dolphin.jpg`
- Girafa: `giraffe.jpg`
- Leão: `lion.jpg`
- Panda: `panda.jpg`
- Urso polar: `polarBear.jpg`

Você pode usar os seguintes recursos de imagem:

[Golfinho](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Girafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Leão](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Urso polar](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Depois de baixar as imagens, arraste-as para a pasta de recursos `Assets` do projeto Xcode.

![assets](../../../Resource/029_assets.png)

Observe que, ao usar imagens no código, normalmente não é necessário escrever a extensão `.jpg`.

Por exemplo, se o nome do recurso de imagem for `dolphin`, escreva no código:

```swift
Image("dolphin")
```

Se o nome da imagem estiver incorreto, a imagem não será exibida corretamente.

Observação: os recursos de imagem acima vêm de projetos da Wikimedia. Ao usá-los, recomenda-se manter os links originais e as informações de origem.

## Criar a estrutura Animal

Nesta página, cada animal possui várias informações:

- Nome do animal
- Imagem do animal
- Emoji do animal
- Área de distribuição
- Habitat
- Descrição do animal

Se espalharmos essas informações em muitas variáveis, o código ficará confuso. Por isso, podemos criar uma estrutura `Animal` para reunir as informações de um animal.

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
```

Neste trecho de código:

- `id`: identificador único do animal.
- `name`: nome do animal.
- `imageName`: nome da imagem do animal.
- `avatarEmoji`: emoji do animal.
- `distributionArea`: área de distribuição.
- `habitat`: habitat.
- `animalDescription`: descrição do animal.

Entre eles:

```swift
let id = UUID()
```

O `id` é usado para identificar cada animal. Mais adiante, usaremos `ForEach` para exibir a lista de animais e também usaremos `.sheet(item:)` para apresentar detalhes com base no animal selecionado. Por isso, `Animal` precisa estar em conformidade com o protocolo `Identifiable`.

A função de `Identifiable` é informar ao SwiftUI que cada animal possui um `id` capaz de distinguir sua identidade.

## Criar os dados dos animais

Em seguida, criamos um array de animais em `ContentView`.

O array armazena cinco valores `Animal`, e cada `Animal` representa um animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Golfinho
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Golfinhos são mamíferos marinhos inteligentes. Vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // Girafa
        Animal(
            name: "Girafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanas e bosques abertos na África.",
            habitat: "Campos, savanas e florestas abertas.",
            animalDescription: "Girafas são os animais terrestres mais altos. Elas têm pescoços longos, pernas longas e geralmente se alimentam de folhas de árvores altas."
        ),
        // Leão
        Animal(
            name: "Leão",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Encontrados principalmente na África subsaariana, com uma pequena população no oeste da Índia.",
            habitat: "Campos, savanas e bosques abertos.",
            animalDescription: "Leões são grandes felinos poderosos. Eles geralmente vivem em grupos chamados bandos e são frequentemente conhecidos como os reis do mundo animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Florestas montanhosas no centro da China.",
            habitat: "Florestas de bambu em áreas montanhosas frias e úmidas.",
            animalDescription: "Pandas são ursos conhecidos por sua pelagem preta e branca. Eles comem principalmente bambu e estão entre os animais mais reconhecíveis do mundo."
        ),
        // Urso polar
        Animal(
            name: "Urso polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiões árticas ao redor do Polo Norte.",
            habitat: "Gelo marinho, áreas costeiras e ambientes árticos frios.",
            animalDescription: "Ursos polares são grandes ursos adaptados a ambientes frios. São bons nadadores e dependem principalmente do gelo marinho para caçar focas."
        )
    ]

    var body: some View {
        Text("Enciclopédia Animal")
    }
}
```

Aqui, `animals` é um array:

```swift
let animals: [Animal]
```

`[Animal]` significa que este array armazena vários valores `Animal`.

Ou seja, `animals` não é um único animal, mas um grupo de animais.

## Exibir a lista de animais

Agora podemos usar `ForEach` para exibir a lista de animais.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/029_view1.png)

Neste trecho de código:

```swift
ForEach(animals) { animal in
    ...
}
```

Isso significa percorrer o array `animals`.

Em cada iteração, `animal` representa o animal que está sendo exibido no momento.

Por exemplo, na primeira iteração, `animal` é o golfinho; na segunda iteração, `animal` é a girafa.

Portanto, podemos exibir as informações do animal atual da seguinte forma:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Assim, conseguimos exibir os cinco animais.

## Tornar a lista de animais clicável

Agora a lista já foi exibida, mas ainda não pode ser tocada.

Se quisermos apresentar os detalhes depois que o usuário tocar em um animal, primeiro precisamos registrar o “animal selecionado no momento”.

Portanto, adicione uma variável de estado em `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Aqui, `selectedAnimal` é um valor opcional do tipo `Animal?`.

Isso significa que ele pode conter um animal ou não conter nenhum animal.

O valor padrão é `nil`, indicando que nenhum animal foi selecionado no início.

Depois, transformamos cada linha de animal em um `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

O ponto principal é esta linha de código:

```swift
selectedAnimal = animal
```

Quando o usuário toca em um animal, salvamos esse animal em `selectedAnimal`.

Por exemplo, se o usuário tocar no golfinho, `selectedAnimal` armazenará o golfinho.

Se o usuário tocar no panda, `selectedAnimal` armazenará o panda.

Ou seja, `selectedAnimal` é usado para registrar em qual animal o usuário tocou no momento.

## Visualização apresentada com Sheet

Agora já podemos registrar o “animal tocado no momento” por meio do botão.

Em seguida, precisamos implementar uma visualização apresentada para mostrar os detalhes do animal.

![view](../../../Resource/029_view2.png)

Em SwiftUI, podemos usar `Sheet` para implementar esse efeito de apresentação.

O `Sheet` pode ser entendido como uma página temporariamente apresentada. Ele aparece sobre a página atual e, depois que o usuário terminar de ver o conteúdo, pode deslizar para baixo para fechá-lo.

## Exemplo de Sheet

Antes de exibir os detalhes do animal de fato, vamos usar um exemplo simples para entender como o `Sheet` é apresentado.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Mostrar Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Visualização do Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/029_view3.png)

Neste trecho de código, criamos um valor booleano:

```swift
@State private var showSheet = false
```

Por padrão, `showSheet` é `false`, indicando que o `Sheet` não é exibido no início.

Quando o botão é tocado:

```swift
showSheet.toggle()
```

`toggle()` significa alternar o valor booleano.

Se antes era `false`, depois de chamar `toggle()` ele se torna `true`.

Se antes era `true`, depois de chamar `toggle()` ele se torna `false`.

Portanto, após tocar no botão, `showSheet` muda de `false` para `true`.

Quando `showSheet` se torna `true`, o trecho de código abaixo apresenta o `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Visualização do Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Este trecho significa: quando `showSheet` for `true`, apresentar um `Sheet` e exibir `Text("Visualização do Sheet")` dentro dele.

Resultado exibido:

![view](../../../Resource/029_view4.png)

Essa forma de escrita é adequada para apresentar conteúdo fixo.

Por exemplo, apresentar uma página de ajustes, uma página de instruções ou uma página de aviso após tocar no botão.

### Onde colocar o Sheet

Embora `Sheet` seja uma visualização apresentada, em SwiftUI ele não é escrito diretamente como uma view independente, como `Text()` ou `Image()`. Em vez disso, ele é usado como um modificador de view.

Ou seja, `.sheet(...)` é semelhante a modificadores como `.font()`, `.padding()` e `.shadow()`: todos precisam ser adicionados após alguma view.

Por exemplo:

```swift
Button("Mostrar Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Visualização do Sheet")
}
```

Neste exemplo, `.sheet` foi adicionado depois de `Button`.

Quando `showSheet` se torna `true`, o SwiftUI apresenta o `Sheet` e exibe o conteúdo dentro das chaves:

```swift
Text("Visualização do Sheet")
```

No entanto, no desenvolvimento real, se uma página tiver vários botões, normalmente não adicionamos um `.sheet` a cada botão.

A prática mais comum é adicionar `.sheet` à view externa.

Por exemplo:

```swift
VStack {
    Button("Mostrar Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Visualização do Sheet")
}
```

O botão é responsável por modificar `showSheet`, e a view externa é responsável por apresentar o `Sheet` de acordo com o fato de `showSheet` ser `true` ou não.

## Vincular um valor opcional ao Sheet

A forma que aprendemos anteriormente foi:

```swift
.sheet(isPresented: $showSheet) {
    Text("Visualização do Sheet")
}
```

Essa forma é adequada para controlar a exibição e ocultação de uma página fixa.

Mas, no exemplo da enciclopédia animal, não precisamos apenas saber “se o `Sheet` deve ser apresentado”; também precisamos saber “qual animal foi tocado”.

Por exemplo:

Se o usuário tocar no golfinho, o `Sheet` deve mostrar os detalhes do golfinho.

Se o usuário tocar no panda, o `Sheet` deve mostrar os detalhes do panda.

Portanto, aqui é mais adequado usar outra forma de escrever o Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Conteúdo exibido no Sheet
}
```

Neste trecho de código, o `Sheet` está vinculado a um valor opcional `selectedAnimal`.

Observe que depois de `item:` escrevemos `$selectedAnimal`, não `selectedAnimal`.

Isso acontece porque o `Sheet` não apenas lê o valor de `selectedAnimal`; ele também precisa decidir se deve ser apresentado de acordo com as mudanças desse valor.

Podemos entender esse trecho assim:

- Quando `selectedAnimal` é `nil`, o `Sheet` não é exibido.
- Quando `selectedAnimal` possui um valor, o `Sheet` é exibido.
- Quando o `Sheet` é fechado, o SwiftUI altera `selectedAnimal` de volta para `nil`.

O SwiftUI passa o animal armazenado em `selectedAnimal` para o `animal` dentro das chaves.

Ou seja, `.sheet(item:)` não apenas controla a apresentação; ele também passa os dados selecionados para dentro do `Sheet`.

## Usar o Sheet para exibir o nome do animal

Agora, não precisamos criar imediatamente uma visualização de detalhes complexa.

Para tornar o código mais fácil de entender, primeiro exibiremos no `Sheet` o nome do animal atual.

Adicione `.sheet(item:)` fora do `VStack`:

```swift
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
                        .cornerRadius(20)
                    
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
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

O mais importante aqui é este trecho de código:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Quando `selectedAnimal` possui um valor, o `Sheet` é apresentado.

O `animal` dentro das chaves é o animal atualmente selecionado.

Portanto:

```swift
Text(animal.name)
```

Ele exibirá o nome do animal tocado no momento.

Por exemplo, ao tocar em `Golfinho`, o Sheet exibirá `Golfinho`.

Ao tocar em `Panda`, o `Sheet` exibirá `Panda`.

Assim, implementamos o efeito de tocar em animais diferentes e apresentar nomes de animais diferentes.

Exibindo o nome do animal:

![view](../../../Resource/029_view5.png)

No entanto, os detalhes do animal não devem exibir apenas um nome; também devem exibir o nome, a área de distribuição, o habitat e a descrição.

Se escrevermos todo esse código dentro de `.sheet`, o código ficará longo e difícil de ler.

Por isso, em seguida criaremos uma nova view personalizada dedicada a exibir os detalhes do animal.

## Criar a view de detalhes do animal

Em seguida, criamos uma nova view personalizada chamada `AnimalDetailView`.

Essa view recebe um `Animal` e exibe os detalhes do animal.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Área de distribuição** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** ：\(animal.habitat)")

                    Divider()

                    Text("**Descrição do animal** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/029_view2.png)

O ponto principal aqui é:

```swift
var animal: Animal
```

Isso significa que `AnimalDetailView` precisa receber um animal de fora.

Depois de receber o animal, a view de detalhes pode usar as diversas informações desse animal:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Ou seja, `AnimalDetailView` é responsável apenas por exibir o animal recebido.

### Texto em negrito com Markdown

Na view de detalhes, escrevemos o seguinte código:

```swift
Text("**Habitat:** \(animal.habitat)")
```

Há dois pontos importantes aqui.

Primeiro, `**Habitat:**` usa a sintaxe de `Markdown`. O texto envolvido por dois asteriscos é exibido em negrito.

Segundo, `\()` é interpolação de string, que permite exibir o valor de uma variável dentro do texto.

Este trecho de código significa exibir primeiro `Habitat:` em negrito e depois exibir o habitat desse animal.

## Exibir a view de detalhes no Sheet

Depois de criar `AnimalDetailView`, podemos voltar para `ContentView` e substituir a view de nome original dentro do `Sheet` pela view de detalhes.

Antes era:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Agora alteramos para:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Aqui, `animal:` é o nome do parâmetro de `AnimalDetailView`.

O `animal` depois dele é o animal atual passado por `.sheet(item:)`.

Ou seja, passamos o animal tocado no momento para `AnimalDetailView` exibir.

Estrutura completa:

```swift
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
                        .cornerRadius(20)
                    
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
```

Quando o usuário toca em um animal:

```swift
selectedAnimal = animal
```

`selectedAnimal` muda de `nil` para um animal específico. Depois que o `Sheet` detecta que `selectedAnimal` possui um valor, ele apresenta a view.

O `Sheet` passa o animal em `selectedAnimal` para a view `AnimalDetailView`, e `AnimalDetailView` exibe os detalhes do animal.

Assim, implementamos a função de tocar na lista de animais e apresentar os detalhes do animal correspondente.

## Diferença entre as duas formas de usar Sheet

Agora já usamos `.sheet(item:)` para concluir a exibição da view de detalhes do animal.

Aqui podemos resumir brevemente duas formas comuns de escrever `Sheet`.

### A primeira é vincular um valor booleano

```swift
@State private var showSheet = false

Button("Mostrar Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Visualização do Sheet")
}
```

Essa forma é adequada para apresentar conteúdo fixo, como página de ajustes, página de instruções ou página de aviso.

`showSheet` é um valor booleano, com apenas dois estados: `true` e `false`.

Quando `showSheet` é `true`, o `Sheet` é exibido.

Quando `showSheet` é `false`, o `Sheet` não é exibido.

### A segunda é vincular um valor opcional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Essa forma é adequada para apresentar conteúdos diferentes de acordo com os dados selecionados.

Nesta aula, tocamos em animais diferentes e precisamos exibir detalhes diferentes. Por isso, usar `.sheet(item:)` é mais adequado.

## Código completo

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nome do animal
    let name: String
    
    // Imagem do animal
    let imageName: String
    
    // Emoji do animal
    let avatarEmoji: String
    
    // Área de distribuição
    let distributionArea: String
    
    // Habitat
    let habitat: String
    
    // Descrição do animal
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Golfinho
        Animal(
            name: "Golfinho",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceanos quentes e temperados ao redor do mundo.",
            habitat: "Oceanos, águas costeiras e alguns grandes rios.",
            animalDescription: "Golfinhos são mamíferos marinhos inteligentes. Vivem em grupos, comunicam-se por sons e são conhecidos por seu comportamento brincalhão."
        ),
        // Girafa
        Animal(
            name: "Girafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanas e bosques abertos na África.",
            habitat: "Campos, savanas e florestas abertas.",
            animalDescription: "Girafas são os animais terrestres mais altos. Elas têm pescoços longos, pernas longas e geralmente se alimentam de folhas de árvores altas."
        ),
        // Leão
        Animal(
            name: "Leão",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Encontrados principalmente na África subsaariana, com uma pequena população no oeste da Índia.",
            habitat: "Campos, savanas e bosques abertos.",
            animalDescription: "Leões são grandes felinos poderosos. Eles geralmente vivem em grupos chamados bandos e são frequentemente conhecidos como os reis do mundo animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Florestas montanhosas no centro da China.",
            habitat: "Florestas de bambu em áreas montanhosas frias e úmidas.",
            animalDescription: "Pandas são ursos conhecidos por sua pelagem preta e branca. Eles comem principalmente bambu e estão entre os animais mais reconhecíveis do mundo."
        ),
        // Urso polar
        Animal(
            name: "Urso polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiões árticas ao redor do Polo Norte.",
            habitat: "Gelo marinho, áreas costeiras e ambientes árticos frios.",
            animalDescription: "Ursos polares são grandes ursos adaptados a ambientes frios. São bons nadadores e dependem principalmente do gelo marinho para caçar focas."
        )
    ]
    
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
                            .cornerRadius(20)

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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Área de distribuição** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Descrição do animal** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Resumo

Nesta aula, concluímos uma página simples de enciclopédia animal.

Primeiro usamos a estrutura `Animal` para armazenar informações dos animais, depois usamos um array para armazenar cinco animais e, por fim, usamos `ForEach` para exibir a lista de animais.

Quando o usuário toca em um animal, salvamos esse animal em `selectedAnimal`:

```swift
selectedAnimal = animal
```

Quando `selectedAnimal` possui um valor, `.sheet(item:)` apresenta a view de detalhes e passa o animal selecionado para `AnimalDetailView`.

O ponto mais importante desta aula não é o estilo da interface, mas entender este caminho de passagem de dados:

```swift
Tocar no animal → selectedAnimal salva o animal → Sheet é apresentado → AnimalDetailView exibe os detalhes
```

Depois de entender esse caminho, você poderá criar mais funções semelhantes no futuro, como detalhes de produto, detalhes de curso, detalhes de artigo, detalhes de contato e assim por diante.
