# Mural de fotos

Nesta aula, vamos criar uma página de mural de fotos.

![view](../../../Resource/032_view13.png)

Neste exemplo, vamos revisar os conhecimentos sobre `extension`, `self` e instâncias, além de aprender as formas `Shape` usadas com frequência no SwiftUI.

Com esses conhecimentos, podemos recortar imagens comuns em diferentes estilos, como círculo, retângulo arredondado, cápsula e elipse, além de adicionar efeitos de borda às fotos.

Nesta aula, usaremos alguns novos pontos de conhecimento: `Shape`, `clipShape`, `strokeBorder` e `overlay`.

Entre eles, `clipShape` é usado para recortar a forma de uma view, `strokeBorder` é usado para desenhar a borda de uma forma, e `overlay` é usado para sobrepor uma nova view acima da view atual.

## Recursos de imagem

Antes de começar, precisamos preparar algumas imagens.

Você pode usar suas próprias fotos ou usar as imagens de exemplo fornecidas nesta aula.

As fotos de exemplo desta aula vêm do site [Pixabay](https://pixabay.com/):

[Paisagem](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Raposa](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Arquitetura](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Flores](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Cisne](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Depois de baixar as imagens, adicione-as à pasta de recursos `Assets` e nomeie-as, em ordem, como `1`, `2`, `3`, `4` e `5`.

![assets](../../../Resource/032_view17.png)

Assim, poderemos exibir as imagens no SwiftUI usando `Image("1")`, `Image("2")` e assim por diante.

## Exibir fotos

Primeiro, exibimos 5 fotos em `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efeito exibido:

![view](../../../Resource/032_view.png)

Neste trecho de código, usamos `ScrollView` para implementar a rolagem da lista de fotos e usamos `VStack` para organizar várias imagens de cima para baixo.

Cada imagem usa `.resizable()`, `.scaledToFit()` e `.frame(width: 300)` para definir seu efeito de exibição, permitindo que a imagem seja redimensionada, mantenha sua proporção completa e tenha a largura limitada.

O `.padding(.vertical, 100)` aplicado ao `VStack` é usado para aumentar o espaçamento superior e inferior, evitando que a primeira e a última foto fiquem muito próximas das bordas da tela.

Por fim, `.ignoresSafeArea()` indica que a view rolável deve ignorar a área segura, permitindo que as fotos se estendam até o topo e a parte inferior da tela durante a rolagem, deixando a página mais completa.

No entanto, agora as 5 imagens usam os mesmos modificadores:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Quando vemos código repetido, podemos considerar usar `extension` para organizá-lo.

## Usar extension para organizar o estilo das imagens

Podemos estender `Image` com um método específico para o mural de fotos:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aqui, estendemos o tipo `Image` com um método chamado `photoGalleryStyle`.

Dentro desse método estão os modificadores usados repetidamente antes: `.resizable()`, `.scaledToFit()` e `.frame(width: 300)`. Em outras palavras, ele reúne em um só lugar o redimensionamento da imagem, a exibição proporcional e a definição de largura.

Depois de usar essa extensão, o código original da imagem:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

pode ser simplificado para:

```swift
Image("1")
    .photoGalleryStyle()
```

Assim, cada imagem só precisa chamar `.photoGalleryStyle()` para aplicar o mesmo estilo do mural de fotos. O código fica mais simples e também mais fácil de modificar de forma unificada depois.

## Entender self

No método da extensão, escrevemos `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aqui, `self` representa a instância de imagem atual que chamou este método.

Por exemplo:

```swift
Image("1")
    .photoGalleryStyle()
```

Neste trecho de código, `photoGalleryStyle()` é chamado por `Image("1")`, portanto o `self` dentro do método representa esta imagem `Image("1")`.

Podemos entender de forma simples: quem chama esse método, `self` representa esse objeto.

É importante observar que os modificadores do SwiftUI retornam continuamente novos resultados de view. Portanto, `photoGalleryStyle()` retorna uma view já modificada, e não simplesmente a `Image` original em si.

## Formas das fotos

Agora, as fotos já podem ser exibidas normalmente. No entanto, por padrão, todas elas são retângulos, o que parece relativamente comum.

Se quisermos apenas dar cantos arredondados à foto, podemos usar diretamente `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Efeito exibido:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` significa adicionar cantos arredondados de `20 pt` à imagem. Para uma imagem comum com cantos arredondados, essa escrita já é suficiente.

No entanto, `.cornerRadius()` só consegue lidar com o efeito de cantos arredondados, sendo adequado para criar imagens comuns com cantos arredondados. Se quisermos transformar a foto em mais formas diferentes, esse modificador sozinho não será suficiente.

Nesse caso, precisamos usar `Shape` no SwiftUI. `Shape` pode representar diferentes formas e, em conjunto com `clipShape`, permite recortar a imagem para a forma correspondente.

## Conhecer Shape

No SwiftUI, `Shape` representa uma forma. Assim como `View`, ele é um tipo usado com muita frequência no SwiftUI.

Os `Shape` comuns incluem círculo, retângulo, retângulo arredondado, cápsula e elipse. Para observar com mais clareza a aparência de diferentes formas, os exemplos abaixo definem cores e tamanhos diferentes para cada forma.

Nesses exemplos, `.fill()` é usado para preencher a forma com uma cor, e `.frame()` é usado para definir o tamanho de exibição da forma. A cor serve apenas para distinguir formas diferentes, não sendo uma cor fixa da própria forma.

### Circle círculo

`Circle` representa um círculo. Ele é usado com frequência em efeitos de interface como avatares, botões circulares e imagens circulares.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle retângulo

`Rectangle` representa um retângulo. Ele é uma das formas mais básicas e também pode ser usado para criar fundos, dividir áreas ou fazer bordas comuns.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle retângulo arredondado

`RoundedRectangle` representa um retângulo arredondado. `cornerRadius` é usado para definir o tamanho dos cantos arredondados.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule forma de cápsula

`Capsule` representa uma forma de cápsula. Suas duas extremidades são arcos arredondados, sendo usada com frequência em botões em formato de cápsula, fundos de etiquetas e outros efeitos de interface.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipse

`Ellipse` representa uma elipse. Ela é semelhante a `Circle`, mas quando a largura e a altura são diferentes, ela é exibida como uma elipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Por meio desses exemplos, podemos ver que `Shape` em si pode ser exibido diretamente como uma forma. Em seguida, usaremos essas `Shape` junto com `clipShape` para recortar fotos e fazer com que elas apareçam em diferentes formas.

## Usar clipShape para recortar fotos

Agora, podemos usar `clipShape` para recortar fotos em diferentes formas.

Por exemplo, recortar a primeira foto em um círculo:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Este trecho de código significa: primeiro exibir uma imagem e depois usar `Circle()` para recortá-la em um círculo.

![view](../../../Resource/032_view2.png)

A escrita básica de `clipShape` é:

```swift
.clipShape(forma)
```

Adicione `.clipShape(...)` após a view e escreva, dentro dos parênteses, a forma na qual deseja recortar.

Por exemplo:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Agora, vamos recortar as 5 fotos em formas diferentes:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efeito exibido:

![view](../../../Resource/032_view8.png)

Entre elas, o efeito após o recorte com `Rectangle()` é parecido com o de uma foto retangular comum, portanto a mudança visual não é evidente e serve principalmente para comparação com outras formas.

Agora, as fotos já não são apenas retângulos comuns; elas têm formas diferentes.

## Adicionar bordas às fotos

Se quisermos adicionar uma borda a uma foto circular, talvez pensemos em usar `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Mas o resultado normalmente não será uma borda circular, e sim uma borda retangular.

![view](../../../Resource/032_view9.png)

Isso acontece porque `border` adiciona a borda de acordo com a área retangular da view, e não de acordo com a forma recortada por `clipShape`.

Portanto, se quisermos uma borda circular, não podemos usar `border` diretamente.

## Usar strokeBorder para desenhar bordas de formas

No SwiftUI, `strokeBorder` pode desenhar uma borda interna para essas `Shape` comuns.

Por exemplo, desenhar uma borda circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Este trecho de código significa: desenhar uma borda marrom para `Circle`, com largura de `10 pt`.

![view](../../../Resource/032_view12.png)

Aqui é preciso observar que `strokeBorder` não adiciona diretamente uma borda à foto; ele desenha uma borda para a forma `Circle()`.

Ou seja, o resultado desse trecho de código é apenas uma borda circular independente, que ainda não tem relação com a foto.

Se quisermos que essa borda circular apareça acima da foto, precisamos continuar usando `overlay` para sobrepor a borda à foto.

## Usar overlay para sobrepor bordas

`overlay` é um modificador de view que pode sobrepor uma nova view acima da view atual.

Sua estrutura básica pode ser entendida como:

```swift
View atual
    .overlay {
        View sobreposta
    }
```

Neste exemplo, a view atual é a foto que já foi recortada em círculo:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

A nova view que queremos sobrepor é uma borda circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Portanto, podemos combinar a foto e a borda:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Aqui, `overlay` significa sobrepor uma nova view acima da view atual.

Dentro de `overlay`, a borda acompanha a área de exibição atual da foto, portanto não é necessário definir outro `frame` separadamente. Desde que a forma da borda e a forma do recorte sejam iguais, a borda poderá se ajustar à foto.

![view](../../../Resource/032_view10.png)

O efeito final é que uma borda circular cobre a parte superior da foto circular.

Em comparação com `ZStack`, `overlay` é mais adequado para esse tipo de cenário de “adicionar uma decoração à view atual”. A foto é o elemento principal, e a borda é apenas um efeito adicional; por isso, usar `overlay` deixa a lógica mais clara.

## Concluir o mural de fotos

Agora, adicionamos a forma e a borda correspondentes a cada foto:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efeito exibido:

![view](../../../Resource/032_view13.png)

Assim, uma página básica de mural de fotos está concluída.

Nesta página, usamos `ScrollView` para implementar a rolagem, usamos `Image` para exibir fotos, usamos `clipShape` para recortar a forma das fotos e adicionamos bordas por meio de `overlay` e `strokeBorder`.

## Código completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Resumo

Nesta aula, concluímos uma página de mural de fotos.

![view](../../../Resource/032_view13.png)

Neste exemplo, primeiro usamos `Image` para exibir fotos e depois usamos `extension` para estender `Image` com um método `photoGalleryStyle`, usado para organizar o código repetido de estilo das imagens.

Em seguida, aprendemos as `Shape` comuns no SwiftUI, como `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` e `Ellipse`. Essas formas não apenas podem ser exibidas diretamente, como também podem ser usadas com `clipShape` para recortar views.

Por exemplo:

```swift
.clipShape(Circle())
```

significa recortar a view em um círculo.

Por fim, usamos `overlay` e `strokeBorder` para adicionar às fotos bordas com as formas correspondentes. É importante observar que `border` normalmente desenha a borda de acordo com a área retangular da view. Se quisermos que a borda acompanhe um círculo, uma cápsula ou uma elipse, é mais adequado usar a mesma `Shape` para fazer a sobreposição.

Com esta aula, não apenas concluímos o efeito de mural de fotos, mas também entendemos a forma comum de combinar `Shape`, `clipShape`, `strokeBorder` e `overlay` na interface.

## Exercícios após a aula

### 1、Adicionar um fundo ao mural de fotos

Adicione uma imagem de fundo em tela cheia à página do mural de fotos.

Requisito: a imagem de fundo deve preencher toda a tela e ignorar a área segura.

### 2、Borda em gradiente

Modifique a borda atual de cor única para uma borda com gradiente linear.

Você pode tentar usar `LinearGradient` para obter um efeito de borda mais rico.

### 3、Borda de foto simulada

Pesquise na internet alguns estilos reais de moldura de foto e tente usar `overlay` para sobrepor uma borda de imagem, fazendo com que a foto pareça mais próxima de uma moldura real.

Efeito exibido no exercício:

![button](../../../Resource/032_view15.jpeg)

### 4、Implementar uma borda de botão arredondado

No desenvolvimento real, botões costumam usar bordas de retângulo arredondado.

Tente criar um botão arredondado e use `RoundedRectangle` e `strokeBorder` para adicionar uma borda com cantos arredondados ao botão.

Efeito exibido no exercício:

![button](../../../Resource/032_view14.png)

### Questão para reflexão

Se você não quiser usar uma borda de cor única nem uma borda em gradiente, mas quiser que a borda apresente algum tipo de padrão, como isso poderia ser implementado?

Você pode tentar pesquisar materiais e conhecer usos relacionados a `overlay`, `mask` ou `ImagePaint`.

Efeito exibido no exercício:

![button](../../../Resource/032_view16.png)
