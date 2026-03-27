# Layout, imagens e texto

Na aula anterior, estudamos o código do ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Nesta aula, vamos aprender o mecanismo de layout padrão do SwiftUI, bem como o uso de imagens e textos. Com base no conteúdo da aula anterior, entenderemos melhor a estrutura e a forma de exibição das views. Esses conhecimentos já permitem construir layouts básicos de interface.

## Mecanismo de layout padrão do SwiftUI

Ao visualizar a prévia da view ContentView, percebemos que o ícone e o texto aparecem centralizados, em vez de começarem a partir do topo.

![Swift](../../RESOURCE/003_view.png)

Por padrão, o alinhamento do contêiner Stack é `.center`, por isso as subviews normalmente aparecem centralizadas.

### Alignment alinhamento

É evidente que o alinhamento centralizado é apenas um dos tipos de alinhamento. Se quisermos alinhar à esquerda ou à direita, precisamos usar `alignment` para controlar a forma como a view é alinhada.

```swift
alignment
```

No SwiftUI, o alinhamento costuma aparecer em dois cenários:

**1. Parâmetro de alinhamento do contêiner Stack**

Por exemplo, para alinhar à esquerda o ícone e o texto no ContentView:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

O `alignment` do `VStack` controla o alinhamento na direção horizontal.

Formas de alinhamento:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

Como o `HStack` organiza horizontalmente, o `alignment` controla o alinhamento na direção vertical:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

O `ZStack` organiza em sobreposição, e o `alignment` pode controlar o alinhamento horizontal ou vertical:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Se o `alignment` não for especificado explicitamente, `VStack`, `HStack` e `ZStack` usam `.center` por padrão.

**2. alignment dentro de frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Quando o tamanho fornecido por `frame` é maior que o tamanho da própria view, `alignment` determina a posição da view dentro do `frame`. O uso específico de `frame` será explicado mais adiante; aqui basta ter uma noção inicial.

### Spacer e o mecanismo de distribuição de espaço

`alignment` pode fazer com que as views sejam organizadas horizontal ou verticalmente. No entanto, quando queremos que texto e imagem apareçam em extremidades opostas, um único alinhamento não é suficiente.

Por exemplo, quando queremos implementar a parte superior do site da [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), com o ícone do site NHK à esquerda e o ícone do menu à direita.

![Swift](../../RESOURCE/003_alignment3.png)

Se usarmos apenas `alignment`, tanto o ícone do site NHK quanto o ícone do menu aparecerão no mesmo lado. Não é possível distribuir os dois ícones entre a esquerda e a direita. Por isso, precisamos usar `Spacer` para distribuir o espaço restante.

`Spacer` é uma view flexível usada para layout, que pode preencher automaticamente o espaço restante.

Modo de uso:

```swift
Spacer()
```

Por exemplo:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Quando adicionamos `Spacer` entre `Image` e `Text`, o `Spacer` preenche o espaço restante, empurrando `Image` e `Text` para as extremidades superior e inferior.

![Swift](../../RESOURCE/003_view1.png)

Se existirem vários `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

o espaço restante será dividido igualmente entre os `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Exibição e controle de tamanho de Image

A view `Image` é usada principalmente para exibir imagens. Os ícones do SF Symbols estudados na aula anterior são apenas um dos usos de `Image`.

Modo de uso:

```swift
Image("imageName")
```

O conteúdo entre aspas de `Image` é o nome da imagem. Não é necessário escrever a extensão.

### Exibir imagem

Primeiro, preparamos uma imagem.

![Swift](../../RESOURCE/003_img.jpg)

No Xcode, selecione a pasta de recursos Assets e arraste a imagem para dentro de Assets.

![Swift](../../RESOURCE/003_img1.png)

No ContentView, use `Image` para exibir a imagem:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Observação: `Image` no SwiftUI não suporta reprodução de animações GIF; ele só pode exibir um quadro estático.

### Controlar o tamanho da imagem

No SwiftUI, `Image` é exibida por padrão no tamanho original da imagem. Se quisermos ajustar o tamanho exibido, primeiro precisamos usar `resizable` para tornar o conteúdo escalável e, em seguida, usar `frame` para especificar o tamanho do layout.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modificador resizable

O modificador `resizable` permite que a imagem participe do redimensionamento no layout, em vez de permanecer fixada no tamanho original.

```swift
.resizable()
```

Somente após adicionar `resizable()`, o `frame` poderá realmente alterar o tamanho exibido da imagem.

Se `resizable` for omitido:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

o `frame` apenas fornecerá espaço de layout para a imagem, mas o tamanho da própria imagem não mudará.

### Modificador frame

`frame(width:height)` é usado para especificar a largura e a altura da view.

Uso básico:

```swift
.frame(width: 10,height: 10)
```

Por exemplo, definir a imagem como um retângulo com `width` igual a 300 e `height` igual a 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Também é possível definir apenas a largura ou apenas a altura:

```swift
.frame(width: 200)
.frame(height: 100)
```

A combinação `resizable + frame` permite controlar com flexibilidade o tamanho de exibição da imagem na interface, mantendo ao mesmo tempo sua capacidade de redimensionamento.

### Proporção de escala: scaledToFit e scaledToFill

Quando usamos `frame` com largura e altura em proporções diferentes, a imagem pode ser esticada e deformada.

Se quisermos manter a proporção original da imagem e ao mesmo tempo fazê-la se adaptar ao espaço disponível do layout, podemos usar `scaledToFit` ou `scaledToFill`.

**scaledToFit**

`scaledToFit` mantém a proporção original da imagem e a redimensiona para caber completamente no espaço disponível, sem recortar a imagem:

```swift
.scaledToFit()
```

ou

```swift
.aspectRatio(contentMode: .fit)
```

Essa forma é adequada para cenários em que precisamos mostrar a imagem completa sem deformá-la.

Se todas as imagens forem definidas com a mesma largura e altura, inevitavelmente algumas serão esticadas.

Por exemplo:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Sem definir a proporção de escala, a imagem não pode ser exibida em sua proporção original.

![Swift](../../RESOURCE/003_img4.png)

Definir `scaledToFit` permite que a imagem mantenha sua proporção original.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` também mantém a proporção da imagem, mas preenche completamente o espaço disponível. Se a proporção for diferente, a parte excedente será recortada:

```swift
.scaledToFill()
```

ou

```swift
.aspectRatio(contentMode: .fill)
```

Essa forma é adequada para cenários em que a imagem precisa cobrir toda a área, por exemplo, como imagem de fundo ou banner. É especialmente apropriada quando a imagem é usada como plano de fundo.

**Diferença entre os dois**

![Swift](../../RESOURCE/003_img6.png)

## Texto

No SwiftUI, `Text` é usado para exibir texto.

Uso básico:

```swift
Text("FangJunyu")
```

Na aula anterior, já estudamos `Text`. Nesta aula, aprenderemos mais detalhadamente como controlar o tamanho e o peso da fonte, tornando o texto mais expressivo dentro da view.

### Tamanho da fonte

Usamos o modificador `font` para controlar o tamanho do texto:

```swift
.font(.title)
```

Por exemplo:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Tamanhos de fonte mais comuns, do maior para o menor:

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Peso da fonte

Se quisermos deixar o texto em negrito, podemos usar o modificador `fontWeight`:

```swift
.fontWeight(.bold)
```

Por exemplo:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Pesos de fonte mais comuns, do mais fino para o mais espesso:

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controla o tamanho da fonte, enquanto `fontWeight` controla sua espessura. Os dois podem ser usados em conjunto para enriquecer a expressão do texto.

## Resumo e prática

Até aqui, já estudamos o layout padrão do SwiftUI, `Spacer`, `Image` e `Text`. Esses conteúdos já são suficientes para desenvolver algumas views simples.

Por exemplo: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

A interface do Google é muito limpa. Ela contém imagens e texto. Podemos tentar analisar sua estrutura de interface a partir da perspectiva do SwiftUI:

1. O conjunto pode ser dividido em três partes: logotipo do Google, campo de busca e texto de dica. Podemos usar `VStack` para organizá-los verticalmente.
2. O logotipo do Google é uma imagem, então podemos usar `Image` para exibi-lo.
3. O campo de busca contém um campo de entrada e um ícone. Se ignorarmos temporariamente o campo de entrada, podemos usar `Image` para exibir o ícone de busca.
4. O texto de dica pode ser exibido com `Text`. A organização horizontal do texto pode ser feita com `HStack`, e a cor da fonte pode ser controlada com `foregroundStyle`.

Ao praticar esses conhecimentos, podemos criar algumas views simples e aprofundar a compreensão e o uso de `Image`, `Text` e seus modificadores.
