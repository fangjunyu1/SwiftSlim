# Visualização personalizada

Nesta aula, vamos aprender uma forma muito importante de escrever SwiftUI: **View personalizada**.

Uma View personalizada pode encapsular um trecho repetido de código de interface e transformá-lo em uma View que pode ser reutilizada várias vezes.

No desenvolvimento real de uma App, frequentemente encontramos esta situação: a estrutura de muitas telas é a mesma, mas o conteúdo exibido é diferente.

Por exemplo, em uma lista de publicações de um site de fórum, cada publicação pode ter informações como título, imagem e número de curtidas.

![Reddit](../../../Resource/028_view1.png)

Em uma lista de produtos de um site de compras, cada produto pode ter informações como imagem, nome e preço.

![Amazon](../../../Resource/028_view2.png)

A estrutura desses conteúdos é parecida; a diferença está apenas nos dados exibidos.

Se escrevermos manualmente o código de cada item, o código ficará muito longo e também não será conveniente para alterações futuras.

Por isso, podemos encapsular a estrutura comum em uma View personalizada e passar o conteúdo diferente como parâmetros.

Assim, a mesma View pode exibir conteúdos diferentes.

## Cenário da necessidade

Por exemplo, agora queremos criar uma lista de definições.

Resultado exibido:

![view](../../../Resource/028_view.png)

Nesta lista de definições, há três itens diferentes: `Definições`, `Pasta` e `Música`.

Embora seus ícones, cores e títulos sejam diferentes, a estrutura geral é a mesma:

- Ícone à esquerda
- Cor de fundo do ícone
- Título no meio
- Seta à direita

Se não usarmos uma View personalizada, poderíamos escrever assim:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Definições")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Pasta")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Música")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Este código pode ser exibido normalmente, mas o problema também é muito claro: o código dos três itens de definições é quase exatamente igual.

As únicas diferenças são o ícone, a cor e o título:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Definições")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Pasta")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Música")
```

Ou seja, a estrutura de cada item de definições é fixa, e apenas o ícone, a cor e o título mudam.

Essa situação é muito adequada para usar uma View personalizada.

### Sombra shadow

Aqui usamos um novo modificador, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` pode adicionar uma sombra à View.

`radius` indica o raio de desfoque da sombra. Quanto maior o valor, geralmente maior é a área de difusão da sombra, e mais suave ela parece.

Aqui ele foi definido como `1`, o que significa adicionar apenas um efeito de sombra muito leve.

## Encapsular a View do item de definições

Em seguida, encapsulamos cada item de definições em uma nova View.

Podemos criar uma `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Nesta View, definimos três propriedades:

```swift
let icon: String
let color: Color
let title: String
```

Entre elas:

- `icon` indica o nome do ícone
- `color` indica a cor de fundo do ícone
- `title` indica o título do item de definições

Como esses três conteúdos são diferentes em diferentes itens de definições, nós os transformamos em parâmetros que podem ser passados de fora.

## Usar a View personalizada

Depois de termos `SettingItemView`, não precisamos mais escrever repetidamente um grande trecho de código `HStack`.

Agora podemos usá-la assim:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Definições")
```

Esta linha de código significa criar uma View de item de definições e passar três parâmetros:

```swift
icon: "gear"
color: Color.blue
title: "Definições"
```

Depois de passados, as propriedades dentro de `SettingItemView` receberão os valores correspondentes:

- o valor de `icon` é `gear`
- o valor de `color` é `Color.blue`
- o valor de `title` é `"Definições"`

Portanto, dentro da View, `Image(systemName: icon)` exibirá o ícone de engrenagem, `.background(color)` usará um fundo azul, e `Text(title)` exibirá `Definições`.

Código completo:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Definições")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Pasta")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Música")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/028_view.png)

Podemos ver que, depois do encapsulamento, o resultado exibido é o mesmo de antes, mas o código ficou mais claro.

Antes, cada item de definições precisava escrever um bloco inteiro de `HStack`; agora basta uma única linha de código:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Definições")
```

Esse é o papel de uma View personalizada: **encapsular uma estrutura de View repetida e passar apenas o conteúdo diferente como parâmetros.**

## Por que é possível passar parâmetros

A seguir, vamos entender de forma simples por que uma View personalizada pode receber parâmetros.

Em SwiftUI, uma View é essencialmente uma estrutura.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("Olá, mundo!")
    }
}
```

Aqui, `ContentView` é uma estrutura.

Quando escrevemos:

```swift
ContentView()
```

na verdade estamos criando uma View `ContentView`.

Os `()` ao final indicam a chamada do seu método de inicialização; também podemos entender isso como a criação dessa View.

Como esse `ContentView` não tem propriedades que precisem ser passadas de fora, podemos escrever diretamente:

```swift
ContentView()
```

Mas, se houver uma propriedade sem valor dentro da View, será necessário passar o valor correspondente ao criar a View.

Por exemplo:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nome: \(name)")
    }
}
```

Aqui, `name` é uma propriedade e não tem valor padrão.

Por isso, ao criar `ContentView`, é obrigatório fornecer um valor concreto para `name`:

```swift
ContentView(name: "Fang Junyu")
```

Assim, a View poderá usar esse valor internamente:

```swift
Text("nome: \(name)")
```

Esse também é o motivo pelo qual precisamos passar parâmetros ao criar `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Definições")
```

Porque `SettingItemView` possui três propriedades sem valores padrão:

```swift
let icon: String
let color: Color
let title: String
```

Portanto, ao criar essa View, precisamos passá-las para dentro. Os parâmetros passados serão usados pelo Swift para atribuir valores às propriedades internas da View.

## Método de inicialização

A seguir, vamos entender um pouco mais o método de inicialização.

### Método de inicialização padrão

Quando definimos uma View comum:

```swift
struct ContentView: View {
    var body: some View {
        Text("Olá, mundo!")
    }
}
```

Neste código, não escrevemos manualmente um método de inicialização.

Mas, quando usamos essa View, podemos escrever assim:

```swift
ContentView()
```

Aqui, `()` na verdade significa criar `ContentView`; também pode ser entendido como chamar seu método de inicialização.

### Por que ainda podemos chamá-lo se não há método de inicialização visível?

Porque o compilador Swift cria automaticamente um método de inicialização para nós.

É importante observar: **esse método de inicialização é gerado automaticamente, e normalmente não o vemos diretamente no código.**

Ou seja, embora não tenhamos escrito manualmente dentro de `struct`:

```swift
init() {

}
```

o compilador Swift irá gerar nos bastidores um método de inicialização semelhante a este:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Olá, mundo!")
    }
}
```

É por isso que podemos escrever diretamente:

```swift
ContentView()
```

Portanto, no código real, normalmente não precisamos escrever manualmente o método de inicialização.

Só precisamos entender um ponto: **ao criar uma SwiftUI View, o método de inicialização dessa View será chamado. Mesmo que não escrevamos manualmente o método de inicialização, o Swift pode gerá-lo automaticamente para nós.**

### Método de inicialização com parâmetros

Se houver em uma View uma propriedade sem valor padrão, por exemplo:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nome: \(name)")
    }
}
```

o compilador Swift irá gerar automaticamente, com base na propriedade, um método de inicialização com parâmetro.

Podemos entendê-lo de forma simples assim:

```swift
init(name: String) {
    self.name = name
}
```

Aqui:

```swift
init(name: String)
```

significa que, ao criar `ContentView`, é necessário passar um parâmetro `name` do tipo `String`.

Quando escrevemos:

```swift
ContentView(name: "Fang Junyu")
```

o significado é: passar `"Fang Junyu"` como parâmetro para o método de inicialização.

Depois, dentro do método de inicialização, será executado:

```swift
self.name = name
```

Esta linha de código significa: atribuir o `name` passado de fora à propriedade `name` da própria View atual.

Podemos entender de forma simples assim:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nome: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Assim, a View pode usar internamente o valor passado.

Esse é o fluxo de inicialização de uma View com parâmetros: **quando uma propriedade dentro da View não tem valor padrão, ao criar a View é necessário passar o parâmetro correspondente para que o método de inicialização complete a atribuição da propriedade.**

## Caso em que a propriedade tem valor padrão

Se a propriedade já tiver um valor padrão, podemos criar a View sem passar esse parâmetro.

Por exemplo:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nome: \(name)")
    }
}
```

Aqui, `name` já tem um valor padrão:

```swift
"Fang Junyu"
```

Portanto, ao criar `ContentView`, podemos escrever diretamente:

```swift
ContentView()
```

Nesse momento, `name` usará o valor padrão, e a interface exibirá:

```swift
nome: Fang Junyu
```

Naturalmente, também podemos passar um novo valor ao criar a View:

```swift
ContentView(name: "Sam")
```

Nesse momento, a View usará `"Sam"` passado de fora, em vez do valor padrão, e a interface exibirá:

```swift
nome: Sam
```

Para facilitar a compreensão, podemos imaginar de forma simples que o método de inicialização gerado automaticamente pelo compilador Swift seja assim:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Aqui, `name: String = "Fang Junyu"` significa: se nenhum `name` for passado ao criar a View, usar o valor padrão `"Fang Junyu"`; se um novo `name` for passado ao criar a View, usar o valor passado.

Ou seja: **se nenhum parâmetro for passado de fora, usa-se o valor padrão da propriedade; se um parâmetro for passado de fora, usa-se o valor passado.**

## Voltar ao SettingItemView

Agora vamos voltar ao SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

A estrutura desta View é fixa.

As partes fixas incluem:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

As partes diferentes incluem:

```swift
icon
color
title
```

Por isso, transformamos o conteúdo diferente em propriedades e o passamos como parâmetros ao criar a View.

Quando criamos diferentes itens de definições, basta passar parâmetros diferentes:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Definições")
SettingItemView(icon: "folder", color: Color.brown, title: "Pasta")
SettingItemView(icon: "music.note", color: Color.purple, title: "Música")
```

Assim, a mesma `SettingItemView` pode exibir três itens de definições diferentes.

Essa é a forma mais comum de usar uma View personalizada.

## Resumo

Nesta aula, aprendemos sobre View personalizada.

A função principal da View personalizada é: **encapsular código de interface repetido para que ele possa ser reutilizado.**

Neste exemplo, a estrutura dos três itens de definições é a mesma; apenas o ícone, a cor e o título são diferentes.

Por isso, criamos uma `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Depois, ao usar essa View, passamos diferentes parâmetros:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Definições")
```

Os parâmetros aqui entram em `SettingItemView`.

Dessa forma, podemos usar menos código para criar Views com a mesma estrutura, mas com conteúdos diferentes.

Essa também é uma forma de escrita muito comum no desenvolvimento SwiftUI.
