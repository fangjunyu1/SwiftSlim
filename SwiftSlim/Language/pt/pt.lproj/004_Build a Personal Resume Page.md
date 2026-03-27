# Construindo uma página de currículo pessoal

Nesta aula, vamos criar uma view simples de currículo pessoal e aprender os seguintes conteúdos:

* cornerRadius
* spacing
* ScrollView

Durante a construção, revisaremos layout, Text e Image, e implementaremos controle de espaçamento e efeito de rolagem do conteúdo.

## Currículo pessoal

Efeito esperado:

![Swift](../../RESOURCE/004_img.png)

**Tente primeiro concluir sozinho antes de continuar lendo a explicação abaixo.**

### Criar o projeto

Crie um novo projeto iOS ou continue usando o projeto anterior.

Código padrão do ContentView:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Agora limpe o código e comece a escrever o seu próprio conteúdo:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Estrutura geral

No desenvolvimento real, normalmente começamos desenhando a estrutura geral.

Nossa página contém:

1. Título
2. Informações pessoais
3. Apresentação pessoal

Adicionamos um `VStack` na camada mais externa:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` garante que as views sejam organizadas verticalmente e também permite controlar a ordem e o espaçamento entre elas.

### Título

Primeiro, criamos um `Text` para mostrar o título.

Aqui, vou exibir o título como o meu nome em inglês:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

O título normalmente fica maior e em negrito. Aqui usamos os modificadores `font` e `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Diagramação

O alinhamento padrão do SwiftUI é `center`, então agora o título aparece no meio do ContentView.

![Swift](../../RESOURCE/004_img3.png)

Precisamos exibir o título na parte superior da view. Podemos usar `Spacer` para ajustar o layout:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` ocupa o espaço restante e empurra o `Text` para a parte superior do contêiner.

![Swift](../../RESOURCE/004_img4.png)

### Espaço em branco

Se você achar que o texto está muito próximo da parte superior, pode usar `padding` ou `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Define a margem superior do `VStack` como 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Também é possível usar `Spacer` e definir a altura com `frame`, obtendo um espaço em branco com altura fixa.

Efeito obtido:

![Swift](../../RESOURCE/004_img5.png)

### Imagem

Preparamos uma foto de perfil e a colocamos na pasta de recursos Assets.

![Swift](../../RESOURCE/004_img6.png)

No ContentView, usamos `Image` para exibir a imagem:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Como o tamanho original da imagem é relativamente grande, precisamos usar `frame` para controlar o tamanho exibido.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Neste momento, encontramos um problema:

Se a proporção entre largura e altura do `frame` for diferente da proporção original da imagem, a imagem ficará deformada.

Por exemplo:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Para evitar essa deformação, precisamos usar `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

A função de `scaledToFit` é:

Dentro dos limites do `frame` fornecido, redimensionar a imagem de acordo com sua proporção original e exibir o conteúdo completo.

Ele não força a imagem a preencher todo o `frame`, mas mantém a proporção largura-altura e a escala proporcionalmente até que um dos lados encoste exatamente no limite.

Isso significa:

* Se a largura do `frame` for menor, a imagem será escalada com base na largura.
* Se a altura do `frame` for menor, a imagem será escalada com base na altura.
* A imagem sempre mantém sua proporção original e não se deforma.

Normalmente, é suficiente definir a dimensão em uma direção. Por exemplo:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Assim, o sistema calculará automaticamente a altura adequada com base na largura 140, mantendo a proporção da imagem.

Se for necessário fixar a proporção visual ou evitar compressão em layouts mais complexos, você também pode limitar largura e altura ao mesmo tempo.

### Cantos arredondados

Se quiser exibir a imagem com cantos arredondados, pode usar o modificador `cornerRadius`:

```swift
.cornerRadius(10)
```

Por exemplo:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Adicione `cornerRadius(20)` depois dos modificadores de `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` significa recortar a borda da view e aplicar um raio de canto de 20.

Depois de adicionar os cantos arredondados, os quatro cantos da imagem passam a ter forma curva, deixando o efeito visual mais suave e moderno.

Esse estilo de design é muito comum nas interfaces atuais. Por exemplo, os ícones de aplicativos no iOS usam a forma de retângulo com cantos arredondados, embora os ícones do sistema usem uma superelipse com curvatura contínua, e não cantos arredondados simples.

### Informações pessoais

Agora vamos implementar a área de informações pessoais à esquerda da imagem. Pela estrutura da interface, as informações pessoais e a imagem estão organizadas horizontalmente, então precisamos usar `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

O conteúdo das informações pessoais é organizado verticalmente.

![Swift](../../RESOURCE/004_img11.png)

Portanto, usamos `HStack` na camada externa, `VStack` para as informações pessoais e `Text` para o conteúdo textual.

Estrutura básica:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Deixar os títulos dos campos em negrito**

Para diferenciar o nome do campo e o valor do campo, podemos usar `fontWeight` no nome do campo:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Alinhamento do texto à esquerda**

O `VStack` usa alinhamento centralizado por padrão. Se quisermos que todos os textos fiquem alinhados à esquerda, precisamos definir o alinhamento:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` significa alinhamento pela esquerda em ambientes de idioma da esquerda para a direita.

![Swift](../../RESOURCE/004_img14.png)

### Espaçamento

Se quisermos manter um espaçamento fixo entre as informações pessoais e a imagem, anteriormente aprendemos a usar `Spacer` para criar espaço em branco:

```swift
Spacer()
    .frame(width: 10)
```

Também podemos usar o parâmetro `spacing` do `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` significa que a distância entre as duas subviews é de 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**O que é spacing?**

Em `VStack`, `HStack` e `ZStack`, `spacing` pode controlar a distância entre subviews.

Por exemplo:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

O espaçamento entre as subviews dentro do `VStack` será definido como 10 pt.

![Swift](../../RESOURCE/004_img16.png)

É importante observar que `spacing` atua apenas sobre as “subviews diretas” e não afeta o layout dentro de contêineres aninhados.

**Controlar o espaçamento interno da lista**

Se quisermos aumentar o espaçamento entre os campos, a forma mais direta é definir `spacing` no `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Assim, o espaçamento entre todas as subviews passa a ser de 10 pt.

Mas, ao observar a interface, notamos um problema:

Existe espaçamento entre os grupos de campos, mas também aparece o mesmo espaçamento entre o nome do campo e o valor do campo.

Isso acontece porque `spacing` atua sobre todas as subviews diretas do contêiner atual.

Nessa estrutura, cada `Text` é uma subview direta do `VStack` externo, portanto o espaçamento é uniforme.

Se quisermos espaçamento entre os grupos de campos, mas manter o nome do campo e o valor do campo com a proximidade padrão, podemos tratar “nome do campo + valor do campo” como um bloco lógico e envolvê-lo com outro `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Nesse momento, a estrutura passa a ter espaçamento entre os `VStack` externos, enquanto os `VStack` internos mantêm o espaçamento compacto padrão. Por isso, não aparece espaço extra entre o nome do campo e o valor do campo.

![Swift](../../RESOURCE/004_img18.png)

### Apresentação pessoal

Em seguida, implementamos a área de apresentação pessoal.

Pela estrutura da interface, o conteúdo da apresentação é composto por várias linhas de texto, organizadas verticalmente.

![Swift](../../RESOURCE/004_img19.png)

Portanto, podemos usar `VStack` junto com `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Adicionar espaçamento**

Agora a parte de informações pessoais e a parte de apresentação pessoal estão muito compactas, e o visual não está bonito.

![Swift](../../RESOURCE/004_img20.png)

Como ambas estão dentro do mesmo contêiner externo, podemos controlar o espaçamento geral diretamente no contêiner externo:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Efeito obtido:

![Swift](../../RESOURCE/004_img21.png)

**Espaçamento da lista**

Use `spacing` para definir o espaçamento entre os textos da apresentação pessoal:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Finalizar o currículo pessoal

Agora, a estrutura básica do nosso currículo pessoal já está concluída.

![Swift](../../RESOURCE/004_img.png)

### View de rolagem

Atualmente, a estrutura da página usa `VStack`. Isso funciona bem quando há poucas linhas de apresentação, mas, se aumentarmos para 20, 30 ou ainda mais linhas, a altura do conteúdo ultrapassará a tela.

Por exemplo:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Nesse momento aparecem dois fenômenos:

* O conteúdo inferior é cortado
* A página não pode ser rolada

Isso não é um problema do `VStack`. `VStack` é apenas um contêiner de layout e não fornece capacidade de rolagem automaticamente.

**O que é ScrollView**

`ScrollView` é um contêiner rolável, adequado para grandes quantidades de conteúdo que ultrapassam o tamanho da tela, por exemplo listas verticais ou horizontais.

Estrutura básica:

```swift
ScrollView {
    ...
}
```

Se quisermos implementar o efeito de rolagem, precisamos envolver o conteúdo inteiro da página dentro de `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Assim, a página inteira se torna uma área rolável. Quando o conteúdo ultrapassa a altura da tela, é possível rolar naturalmente.

`ScrollView` exibe o indicador de rolagem por padrão. Se quisermos escondê-lo, podemos configurar:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Código completo

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
