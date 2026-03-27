# Cores vibrantes

Nesta aula, vamos aprender alguns modificadores visuais comuns do SwiftUI, incluindo:

* Cor
* Cor de primeiro plano
* Cor de fundo
* Deslocamento
* Transparência
* Desfoque

Também aprenderemos sobre Safe Area (área segura).

Esses modificadores são usados para controlar a aparência visual das views, tornando a interface mais clara e com mais camadas.

## Cor

No SwiftUI, é possível definir a cor do texto.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` representa a cor azul. Na prática, é uma forma simplificada de `Color.blue` por inferência de tipo.

As cores comuns incluem:

```swift
.black
.green
.yellow
.pink
.gray
...
```

Todas essas são propriedades estáticas de `Color`.

![Color](../../RESOURCE/006_color.png)

Você pode entender `Color` como um tipo de cor, e `.blue`, `.red` e outras como cores concretas desse tipo.

### View Color

No SwiftUI, `Color` também pode ser exibido como uma view.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Esse trecho de código gera um quadrado vermelho de 100 × 100.

Também é possível fazer com que toda a interface exiba uma determinada cor:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Depois de executar, você verá que o vermelho não cobre toda a tela. A parte superior e inferior do iPhone continuam brancas. Isso envolve a existência da Safe Area (área segura).

## Safe Area (área segura)

A Safe Area é a área reservada pelo sistema para evitar que o conteúdo fique encoberto, incluindo:

1. A barra de status na parte superior (hora, bateria)

2. A barra indicadora Home na parte inferior

3. A região do entalhe (notch) ou da Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Por padrão, o SwiftUI limita o conteúdo à área segura, por isso a view não se estende até as bordas da tela.

### Ignorar a Safe Area (área segura)

Se você quiser que a cor cubra toda a tela, pode usar `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Ou usar `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Assim, a view se estenderá por toda a tela.

É importante observar que `edgesIgnoringSafeArea` é uma forma mais antiga. A partir do iOS 14, recomenda-se usar `ignoresSafeArea`.

## Cor de primeiro plano

### Modificador foregroundStyle

Nas aulas anteriores, já aprendemos a usar `foregroundStyle` para definir cor.

Por exemplo:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` faz parte do novo sistema de estilos e oferece suporte a cor, gradiente, material e outros estilos.

![Color](../../RESOURCE/006_color2.png)

### Modificador foregroundColor

`foregroundColor` também pode ser usado para definir cor:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Seu uso é igual ao de `foregroundStyle`.

Nas versões mais recentes do Xcode, o próprio Xcode indica que `foregroundColor` pode ser descontinuado em futuras versões do iOS, portanto é recomendável priorizar `foregroundStyle`.

## Fundo

Se você quiser adicionar uma cor de fundo a uma view, pode usar `background`:

```swift
background(.red)
```

Por exemplo, adicionar uma cor de fundo ao texto:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Em aplicativos como Word e Chrome, ao selecionar um texto, podemos ver um efeito de fundo semelhante.

![Color](../../RESOURCE/006_color16.png)

Se você quiser ampliar o fundo, precisa combiná-lo com `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Aqui é importante observar uma regra:

Os modificadores no SwiftUI constroem a view de cima para baixo. Um modificador escrito depois atua sobre o resultado produzido pelos modificadores anteriores.

Portanto:

```swift
.padding()
.background()
```

Isso significa que o fundo envolverá a view já depois de receber o espaçamento interno.

Se a ordem for invertida:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

O fundo não será ampliado, porque ele não envolveu o `padding` escrito depois.

## Exemplo - porca quadrada de quatro cantos

Agora vamos criar uma view simples de uma porca quadrada de quatro cantos.

![Color](../../RESOURCE/006_color8.png)

Primeiro, criamos um quadrado branco de 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Se quisermos transformá-lo em um círculo, podemos usar `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Quando o raio do canto é igual à metade da largura e da altura, ele se transforma em um círculo.

Agora adicionamos um fundo azul:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

O `padding` recém-adicionado amplia a área externa, e `background` desenha o azul nessa área externa.

Agora já temos o efeito de uma porca quadrada de quatro cantos.

### Outra forma de pensar

Além de usar cor de fundo para criar a porca quadrada, também é possível usar `ZStack`.

Já vimos antes que `ZStack` pode criar uma organização sobreposta. A porca quadrada também pode ser entendida como a sobreposição de um círculo e um retângulo.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` sobrepõe as views em ordem, e a view adicionada depois aparece por cima.

## Exemplo - dois círculos sobrepostos

Muitos ícones são formados pela sobreposição de formas simples, por exemplo, dois círculos sobrepostos.

![Color](../../RESOURCE/006_color14.png)

Primeiro, criamos dois círculos:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Como precisamos que os dois círculos sejam exibidos sobrepostos, usamos o layout `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Nesse momento, os dois círculos de mesmo tamanho ficam completamente sobrepostos.

Precisamos que os dois círculos fiquem parcialmente sobrepostos, e não totalmente cobertos. Para isso, podemos usar `offset` para criar um efeito de deslocamento.

## Deslocamento

`offset` altera apenas a posição de desenho da view, sem afetar o cálculo de layout da view pai.

Modo de uso:

```swift
.offset(x:y:)
```

`x` é o valor de deslocamento horizontal, e `y` é o valor de deslocamento vertical.

Valores positivos indicam deslocamento para a direita / para baixo. Valores negativos indicam deslocamento para a esquerda / para cima.

Use `offset` para fazer os dois círculos ficarem parcialmente sobrepostos:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

A posição do círculo vermelho dentro do layout não mudou, mas sua posição de desenho se moveu 25 pontos para a esquerda. Por isso, os dois círculos passam a ter um efeito visual de sobreposição parcial.

## Transparência

No SwiftUI, `opacity` é usado para definir a transparência da view.

Uso básico:

```swift
.opacity(0.5)
```

O parâmetro de `opacity` varia de 0.0 a 1.0, sendo que:

* 0 significa totalmente transparente
* 1 significa opaco

Podemos usar `opacity` para definir a transparência do círculo laranja:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Depois de definir `opacity` do círculo laranja como 0.8, sua opacidade será de 80%. Quando os dois círculos se sobrepõem, a área sobreposta produzirá um efeito de mistura de cores.

## Desfoque

No SwiftUI, é possível usar `blur` para definir um efeito de desfoque:

```swift
.blur(radius:10)
```

`radius` define o raio do desfoque. Quanto maior o valor, mais evidente será o efeito.

Podemos adicionar desfoque aos dois círculos:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

No final, podemos ver dois círculos bastante desfocados.

## Resumo

Nesta aula, estudamos modificadores visuais comuns no SwiftUI e aprendemos como controlar cor, posição e efeitos visuais das views por meio de modificadores.

Por meio de exemplos concretos, foi possível ver o papel prático de diferentes modificadores visuais na interface e também entender o conceito de área segura.

Todos esses são modificadores bastante básicos. Vale a pena praticá-los e usá-los com frequência, pois isso ajuda a controlar de forma mais clara o efeito da interface no desenvolvimento real.

### Exercícios após a aula

* Adicionar efeitos de transparência e desfoque a uma imagem
* Definir três círculos sobrepostos com diferentes níveis de transparência
* Criar uma imagem de fundo que cubra toda a tela, ignorando a área segura
* Usar `offset` para ajustar a posição de várias views

O objetivo da prática não é memorizar APIs, mas observar a relação entre mudanças visuais e comportamento de layout.
