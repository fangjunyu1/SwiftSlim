# Adaptação à aparência

Nesta lição, vamos aprender a adaptar a interface ao modo claro e ao modo escuro.

No iPhone, iPad e Mac, os usuários podem escolher o modo claro ou o modo escuro.

Quando o sistema muda para o modo escuro, as cores de fundo, texto e ícones de muitos apps também mudam junto.

Por exemplo, durante o dia a interface pode usar um fundo claro, e à noite pode mudar para um fundo escuro.

![view](../../../Resource/025_view9.png)

Essa capacidade de ajustar automaticamente a exibição da interface de acordo com a aparência do sistema é chamada de adaptação à aparência.

## Pré-visualizar a adaptação à aparência no Xcode

Antes de aprender a adaptação à aparência, vamos primeiro ver como pré-visualizar o modo claro e o modo escuro no Xcode.

Na parte inferior da área `Canvas`, clique no botão `Device Settings` para abrir a janela pop-up `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Na janela pop-up, você pode ver a configuração `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Entre elas:

- `Light Appearance` significa modo claro.
- `Dark Appearance` significa modo escuro.

Podemos alternar a aparência da pré-visualização aqui e verificar o efeito de exibição da interface atual no modo claro e no modo escuro.

## Exibir duas aparências lado a lado

Se quiser ver o modo claro e o modo escuro ao mesmo tempo, você pode usar o recurso `Variants`.

Na parte inferior da área `Canvas`, clique no botão `Variants` e escolha `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Depois de selecionar, o `Canvas` mostrará ao mesmo tempo as pré-visualizações do modo claro e do modo escuro.

![canvas3](../../../Resource/025_view3.png)

Isso torna mais fácil comparar as diferenças da interface entre as duas aparências.

Em termos simples:

Se você quiser apenas alternar temporariamente entre o modo claro e o modo escuro, pode usar `Canvas Device Settings`.

Se quiser ver as duas aparências ao mesmo tempo, pode usar `Color Scheme Variants`.

## As views se adaptam à aparência por padrão

No SwiftUI, muitas views do sistema se adaptam automaticamente ao modo claro e ao modo escuro por padrão.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Claro")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("algum algum algum")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultado exibido:

![canvas](../../../Resource/025_view4.png)

Como é possível ver, no modo claro, ícones e títulos geralmente aparecem em cores escuras.

No modo escuro, ícones e títulos se tornam automaticamente claros.

Isso acontece porque views do SwiftUI como `Text` e `Image` ajustam suas cores de acordo com a aparência do sistema por padrão.

Ou seja, se não especificarmos manualmente uma cor fixa, o SwiftUI nos ajudará a lidar com parte da adaptação à aparência.

## Cores fixas não alternam automaticamente

É importante observar que, se especificarmos manualmente uma cor fixa, ela não alternará automaticamente entre o modo claro e o modo escuro.

Por exemplo:

```swift
Text("algum algum algum")
	.foregroundStyle(Color.gray)
```

Aqui, o texto foi definido como `Color.gray`, por isso ele sempre será exibido em cinza.

Outro exemplo:

```swift
Text("Título")
    .foregroundStyle(Color.white)
```

Este código exibirá texto branco tanto no modo claro quanto no modo escuro.

Se o fundo também for claro, o texto branco pode ficar difícil de enxergar.

Por isso, ao fazer adaptação à aparência, tente evitar escrever de forma fixa cores como `Color.white` e `Color.black` sem necessidade.

Em muitos casos, você pode dar preferência aos estilos semânticos do sistema, como:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Entre eles:

- `.primary` geralmente é usado para conteúdo principal.
- `.secondary` geralmente é usado para conteúdo secundário.

Eles ajustam automaticamente o efeito de exibição de acordo com o modo claro e o modo escuro.

## Exibir conteúdos diferentes conforme a aparência

Às vezes, não queremos apenas que as cores mudem, mas também que conteúdos diferentes sejam exibidos em aparências diferentes.

Por exemplo:

- No modo claro, exibir um ícone de lâmpada comum.
- No modo escuro, exibir um ícone de lâmpada brilhante.
- No modo claro, o título mostra `Claro`.
- No modo escuro, o título mostra `Escuro`.

Nesse caso, precisamos determinar se o sistema atual está no modo claro ou no modo escuro.

No SwiftUI, podemos obter o modo de aparência atual por meio do valor de ambiente `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Código completo:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Claro" : "Escuro"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("algum algum algum")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/025_view5.png)

Pelo resultado da pré-visualização, é possível ver que a mesma view não exibe exatamente o mesmo conteúdo em diferentes modos de aparência.

No modo claro, `Image` exibe o ícone de lâmpada comum, e o título mostra `Claro`.

No modo escuro, `Image` exibe o ícone de lâmpada brilhante, e o título mostra `Escuro`.

Ou seja, a mudança aqui não é apenas uma mudança de cor; o nome do ícone e o próprio texto do título também mudaram.

Isso acontece porque não escrevemos diretamente o ícone e o título de forma fixa dentro de `body`; em vez disso, calculamos conteúdos diferentes com base em `colorScheme`.

Neste código, usamos duas propriedades computadas:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Claro" : "Escuro"
}
```

Quando `colorScheme` é `.light`, isso significa que o modo atual é o modo claro.

Quando `colorScheme` é `.dark`, isso significa que o modo atual é o modo escuro.

Portanto, podemos retornar nomes de ícones e textos de título diferentes de acordo com diferentes modos de aparência.

Este também é um uso comum de propriedades computadas: calcular o conteúdo que a view precisa exibir com base no estado atual.

## Entendendo @Environment

Esta é a primeira vez que entramos em contato com `@Environment`.

`@Environment` pode ser entendido como: ler um valor do ambiente do SwiftUI.

Quando um app está em execução, o sistema fornece muitas informações de ambiente, como:

- Idioma atual
- Modo de aparência atual
- Direção de layout atual
- Configuração atual de tamanho da fonte

Quando precisamos obter o modo de aparência atual, podemos ler `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Aqui:

```swift
\.colorScheme
```

significa ler o valor `colorScheme` do ambiente.

```swift
private var colorScheme
```

significa salvar o valor lido na variável `colorScheme`.

O nome da variável pode ser decidido por você. Por exemplo, também é possível escrever:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Desde que o `\.colorScheme` anterior não mude, isso significa que você está lendo o modo de aparência atual.

## Dois valores comuns de colorScheme

`colorScheme` geralmente tem dois valores:

```swift
.light
.dark
```

Eles significam:

- `.light`: modo claro
- `.dark`: modo escuro

Por exemplo:

```swift
private var titleName: String {
    colorScheme == .light ? "Claro" : "Escuro"
}
```

Este código significa:

Se o modo atual for o modo claro, `colorScheme == .light` será verdadeiro, então ele retornará `"Claro"`.

Caso contrário, ele retornará `"Escuro"`.

Então, no modo claro:

```swift
Text(titleName)
```

O texto exibido é:

```swift
Claro
```

No modo escuro, o texto exibido é:

```swift
Escuro
```

Dessa forma, podemos exibir conteúdos diferentes com base em aparências diferentes.

## Exemplo de adaptação de cores

Além de textos e ícones, às vezes também precisamos lidar manualmente com a adaptação de cores.

Por exemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Texto")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/025_view6.png)

Neste código, o texto é branco e o fundo é preto.

No modo claro, o fundo preto é bastante evidente.

Mas, no modo escuro, se o fundo de toda a interface também for preto, esse fundo preto se misturará ao fundo do sistema e parecerá menos claro.

Nesse momento, podemos alternar a cor do texto e a cor de fundo de acordo com o modo de aparência:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Texto")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Resultado exibido:

![view](../../../Resource/025_view7.png)

Agora, no modo claro, temos fundo preto e texto branco.

No modo escuro, temos fundo branco e texto preto.

Assim, independentemente da aparência usada, o texto e o fundo têm contraste claro, e o usuário consegue ver o conteúdo com nitidez.

## Usar Assets para adaptar cores

Além de usar `colorScheme` para fazer a verificação manual, também podemos usar cores de recursos em `Assets` para adaptar ao modo claro e ao modo escuro.

Essa abordagem é mais adequada para gerenciar cores comuns em um app.

No projeto do Xcode, encontre a pasta de recursos `Assets`.

![assets](../../../Resource/025_color.png)

Abra a pasta `Assets`, clique com o botão direito em uma área vazia e escolha `New Color Set` para criar um novo recurso de cor.

![assets](../../../Resource/025_color1.png)

Aqui, criamos uma cor e damos a ela o nome `redText`.

![assets](../../../Resource/025_color2.png)

Um recurso de cor pode definir separadamente as cores para o modo claro e o modo escuro.

![assets](../../../Resource/025_color3.png)

Depois de selecionar a área de cor correspondente, você pode modificar a cor no inspetor à direita.

Clique no botão `Hide or show the Inspectors` no canto superior direito para abrir a área dos inspetores.

Depois escolha `Show the Attributes inspector`, encontre `Show Color Panel` na parte inferior e abra o painel de cores.

![assets](../../../Resource/025_color4.png)

Clique em uma cor no painel de cores, e a área de cor correspondente de `redText` mudará ao mesmo tempo.

Aqui, definimos `redText` como:

- Exibir vermelho no modo claro
- Exibir verde no modo escuro

![assets](../../../Resource/025_color5.png)

De volta ao código SwiftUI, você pode usar essa cor assim:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Aqui:

```swift
Color("redText")
```

significa ler de `Assets` o recurso de cor chamado `redText`.

Resultado exibido:

![assets](../../../Resource/025_view8.png)

É possível ver que o mesmo `Color("redText")` exibe cores diferentes no modo claro e no modo escuro.

Isso mostra que as próprias cores de `Assets` também oferecem suporte à adaptação à aparência.

## Diferença entre colorScheme e Assets

Tanto `colorScheme` quanto `Assets` podem implementar a adaptação à aparência, mas eles são adequados para cenários diferentes.

Se você só precisa alternar conteúdo de texto, nomes de imagens ou nomes de `SF Symbols` de acordo com o modo claro e o modo escuro, pode usar `colorScheme`.

Por exemplo:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Se for uma cor usada com frequência no app, como cor de tema, cor de fundo de cartão ou cor de texto, é mais recomendado usar cores de `Assets`.

Isso ocorre porque as cores de `Assets` podem ser reutilizadas em várias views e são mais fáceis de modificar posteriormente.

Por exemplo:

```swift
Color("redText")
```

Dessa forma, você só precisa modificar a cor em `Assets`, e todos os locais que usam essa cor mudarão juntos.

## Resumo

Nesta lição, aprendemos a adaptação à aparência para o modo claro e o modo escuro.

Primeiro, aprendemos como pré-visualizar diferentes aparências no `Canvas` do Xcode e também como usar `Color Scheme Variants` para ver o modo claro e o modo escuro ao mesmo tempo.

Depois, entendemos que views do SwiftUI como `Text` e `Image` se adaptam automaticamente às cores de acordo com a aparência do sistema por padrão.

No entanto, se especificarmos manualmente cores fixas como `Color.white` ou `Color.black`, essas cores não alternarão automaticamente.

Em seguida, aprendemos sobre `@Environment` e `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Por meio de `colorScheme`, podemos determinar se o modo atual é claro ou escuro e exibir ícones, textos ou cores diferentes de acordo com diferentes aparências.

Por fim, aprendemos sobre as cores de `Assets`.

As cores de `Assets` podem definir separadamente cores para o modo claro e o modo escuro, sendo adequadas para gerenciar recursos de cores comuns em um app.

A adaptação à aparência permite que um app tenha uma exibição melhor durante o dia e à noite, além de evitar problemas como texto difícil de ler ou fundo pouco evidente.

No desenvolvimento real, recomenda-se dar prioridade à capacidade de adaptação padrão do SwiftUI e às cores de `Assets`.

Quando for necessário alternar texto, ícones, imagens ou lidar com uma pequena quantidade de efeitos de exibição especiais em aparências diferentes, use `colorScheme` para fazer a verificação.

## Conhecimento extra: especificar o tamanho da fonte

Quando aprendemos `font` anteriormente, usamos alguns estilos de fonte do sistema:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Além de usar estilos de fonte do sistema como `.largeTitle` e `.callout`, também é possível especificar manualmente o tamanho da fonte.

Por exemplo:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Aqui:

```swift
.font(.system(size: 100))
```

significa definir o tamanho da fonte como `100 pt`.

Para ícones de `SF Symbols`, `font` também afeta o tamanho do ícone.

Portanto, se quiser que o ícone seja exibido maior, você pode especificar o tamanho usando `.font(.system(size:))`.

Por exemplo:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

É importante observar que, embora especificar manualmente o tamanho da fonte seja mais flexível, não é recomendado usar muitos tamanhos fixos em textos comuns.

Para textos comuns, dê preferência aos estilos de fonte do sistema, como `.title`, `.headline`, `.body` e `.caption`.

Assim, fica mais fácil se adaptar a diferentes dispositivos e às configurações de fonte do usuário.
