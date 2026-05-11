# Cartão do curso

Esta aula é uma revisão de etapa. Vamos concluir um “cartão do curso”.

Com este exercício, podemos revisar `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` e outros conteúdos aprendidos antes, além de aprender como combinar várias pequenas views em um módulo de view completo.

Efeito do cartão do curso:

![view](../../../Resource/026_view.png)

Este cartão do curso contém principalmente algumas partes:

- Nível do curso: `Beginner`
- Conteúdo do curso: `20+ Lessons`
- Título do curso: `SwiftUI Beginner Tutorial`
- Descrição do curso
- Botão: `Start Learning`
- Fundo do curso: ícone do Swift e fundo índigo

Podemos concluir esta view em `ContentView`.

## Área superior

Primeiro, crie a área superior do cartão do curso.

![view](../../../Resource/026_view1.png)

O lado esquerdo da área superior mostra o nível do curso, e o lado direito mostra o conteúdo do curso.

Como esses dois conteúdos são organizados horizontalmente, podemos usar `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Iniciante")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ aulas")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Aqui, separamos a área superior em uma propriedade computada:

```swift
var topView: some View
```

A vantagem de fazer isso é deixar o `body` mais claro.

A área superior usa principalmente estes conteúdos:

- `HStack`: organiza dois textos horizontalmente.
- `Text`: exibe conteúdo de texto.
- `Spacer()`: empurra o texto da esquerda para a esquerda e o texto da direita para a direita.
- `.font(.footnote)`: define um estilo de texto menor.
- `.fontWeight(.bold)`: deixa o texto em negrito.
- `.foregroundStyle(Color.white)`: define a cor de primeiro plano como branca.
- `.padding(.vertical, 10)`: define o espaçamento interno vertical.
- `.padding(.horizontal, 16)`: define o espaçamento interno horizontal.
- `.background(Color.white.opacity(0.15))`: define um fundo branco semitransparente.
- `.cornerRadius(20)`: define o raio dos cantos.

Aqui, `Beginner` usa `.padding()` em duas direções:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Isso dá espaço ao texto na vertical e na horizontal, fazendo com que ele pareça mais uma etiqueta.

`Color.white.opacity(0.15)` representa branco com opacidade de `15%`, ou seja, um branco muito suave.

### Adicionar o fundo do cartão

Antes, criamos `topView`, mas apenas criar uma view não faz com que ela seja exibida automaticamente.

No SwiftUI, o conteúdo realmente exibido na tela precisa ser escrito em `body`.

Portanto, podemos primeiro colocar `topView` dentro de `body` para exibi-la:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Neste momento, você verá que a área superior já foi exibida:

![view](../../../Resource/026_view2.png)

No entanto, como o texto em `topView` é branco e o fundo padrão também é claro, talvez ele não seja muito fácil de ver no modo claro.

Por isso, podemos adicionar um `VStack` por fora e definir espaçamento interno, cor de fundo e raio dos cantos para toda a área:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Efeito exibido:

![view](../../../Resource/026_view3.png)

O `VStack` aqui contém atualmente apenas um `topView`, então pode parecer desnecessário.

Mas depois continuaremos adicionando o título do curso, a descrição do curso e a área do botão. Todos eles são conteúdos organizados verticalmente, então usar `VStack` aqui antecipadamente facilita continuar combinando views depois.

Há dois modificadores `.padding()` aqui, e eles têm funções diferentes.

O primeiro `.padding(20)` é escrito antes de `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Ele controla o espaçamento interno do cartão, ou seja, a distância entre o conteúdo e a borda do fundo.

O segundo `.padding(30)` é escrito depois de `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ele controla o espaçamento externo do cartão, ou seja, a distância entre o cartão inteiro e a borda da tela.

![view](../../../Resource/026_view4.png)

Portanto, mesmo sendo `.padding()`, escrevê-lo em posições diferentes produz efeitos diferentes.

## Área de conteúdo

Em seguida, crie a área de conteúdo do cartão do curso.

Efeito exibido:

![view](../../../Resource/026_view5.png)

A área de conteúdo contém o título e a descrição do curso. Eles são organizados verticalmente, então usamos `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial de SwiftUI para iniciantes")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Comece do zero com SwiftUI e aprenda sistematicamente o desenvolvimento declarativo de interfaces da Apple. Com explicações claras e exemplos práticos, você dominará gradualmente layout, interação e gerenciamento de estado para criar interfaces de app bonitas e úteis.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efeito exibido:

![view](../../../Resource/026_view6.png)

Neste `VStack`, usamos dois parâmetros:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` significa alinhar as views internas do `VStack` à borda inicial.

`spacing: 10` significa manter um intervalo de `10 pt` entre as views internas do `VStack`.

Assim, o título e a descrição do curso começam pelo lado esquerdo e mantêm uma certa distância entre si.

A descrição do curso é relativamente longa. Se tudo fosse exibido, o cartão ficaria muito alto, então aqui usamos `.lineLimit()` para limitar o número de linhas exibidas:

```swift
.lineLimit(3)
```

Isso significa exibir no máximo `3` linhas. Quando o conteúdo ultrapassa o limite de linhas, a parte excedente é omitida.

### Alinhar a view à esquerda

Aqui ainda há um ponto que precisa ser observado.

`VStack(alignment: .leading)` só consegue controlar o alinhamento das views internas do `VStack`. Ele não controla diretamente a posição do próprio `VStack` dentro do contêiner externo.

Por exemplo, se a descrição do curso for relativamente curta:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial de SwiftUI para iniciantes")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Apenas algum conteúdo.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efeito exibido:

![view](../../../Resource/026_view7.png)

Podemos ver que, embora o título e a descrição do curso estejam alinhados à esquerda dentro do `VStack`, o `VStack` inteiro não está encostado à borda esquerda do cartão.

Isso acontece porque, quando o conteúdo é curto, a largura do `VStack` também fica relativamente estreita. Ao fazer o layout, o contêiner externo pode colocar esse `VStack` mais estreito no centro.

Podemos entender assim: `VStack(alignment: .leading)` é responsável pelo alinhamento interno à esquerda.
Mas ele não é responsável por empurrar toda a área de conteúdo para a extrema esquerda.

Se quisermos que toda a área de conteúdo fique realmente alinhada à esquerda, podemos envolvê-la em outro `HStack` e adicionar `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial de SwiftUI para iniciantes")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Apenas algum conteúdo.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efeito exibido:

![view](../../../Resource/026_view8.png)

O `HStack` aqui é um layout horizontal.

`Spacer()` ocupa o espaço restante à direita, empurrando o `VStack` da esquerda para a extrema esquerda.

Portanto, `HStack + Spacer()` pode ser usado para controlar a posição de toda a área de conteúdo.

No cartão de curso real, a descrição do curso é relativamente longa e geralmente ocupa mais largura, então esse problema pode não ser evidente. Mas entender essa diferença é importante, porque situações semelhantes aparecem com frequência ao criar layouts com textos curtos.

### Controlar a distância entre as views internas

Antes, escrevemos `spacing: 10` em `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` é usado para controlar a distância entre as views internas.

Se `spacing` não for definido, `VStack` também terá um espaçamento padrão, mas esse espaçamento padrão pode não corresponder ao efeito que queremos.

Aqui, se o título e a descrição do curso ficarem próximos demais, o layout parecerá apertado, então usamos:

```swift
spacing: 10
```

Isso mantém um pouco de espaço entre eles.

Efeito exibido:

![view](../../../Resource/026_view9.png)

Da mesma forma, a área superior e a área de conteúdo também são organizadas verticalmente, então também podemos usar `spacing` para controlar a distância entre elas.

Agora, coloque `topView` e `contentView` dentro de `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efeito exibido:

![view](../../../Resource/026_view10.png)

Aqui, `VStack(spacing: 20)` controla a distância entre `topView` e `contentView`.

Ou seja:

```swift
VStack(alignment: .leading, spacing: 10)
```

Controla a distância entre o título e a descrição do curso.

```swift
VStack(spacing: 20)
```

Controla a distância entre a área superior e a área de conteúdo.

Ambos são `spacing`, mas atuam em contêineres `VStack` diferentes, então o alcance afetado também é diferente.

Assim, a view da área de conteúdo está concluída.

## Área do botão

Em seguida, crie a área do botão inferior.

Efeito exibido:

![view](../../../Resource/026_view11.png)

A área do botão é composta principalmente por um ícone de reprodução e um trecho de texto.

Podemos usar `Image` para exibir o ícone de reprodução e `Text` para exibir o texto do botão.

Aqui, primeiro criamos a aparência de um botão:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("botão clicado")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Começar a aprender")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Efeito exibido:

![view](../../../Resource/026_view12.png)

Aqui usamos dois `HStack`:

O `HStack` interno é usado para organizar horizontalmente o ícone e o texto:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Começar a aprender")
}
```

O `HStack` externo, junto com `Spacer()`, é usado para alinhar a aparência do botão à esquerda:

```swift
HStack {
    ...
    Spacer()
}
```

Quando o botão for tocado, o console exibirá `botão clicado`.

## Cartão básico concluído

Agora, combine a área superior, a área de conteúdo e a área do botão:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efeito exibido:

![view](../../../Resource/026_view13.png)

Até aqui, um cartão de curso básico já está concluído.

## Fundo com ícone do Swift

Por fim, adicionamos ao cartão um fundo semitransparente com o ícone do Swift.

![view](../../../Resource/026_view.png)

Antes, usamos `Color.indigo` como cor de fundo. Na verdade, além de adicionar uma cor, `.background()` também pode adicionar uma view completa.

Portanto, podemos primeiro criar uma view de fundo dedicada:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Nesta view de fundo, usamos `VStack`, `HStack` e `Spacer()` para empurrar o ícone do Swift para o canto inferior direito.

Como o ícone do Swift é usado apenas como fundo decorativo, aqui usamos branco semitransparente:

```swift
Color.white.opacity(0.15)
```

Assim, o ícone não ficará chamativo demais nem afetará o conteúdo de texto à frente.

Em seguida, adicione `backgroundView` ao cartão:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efeito final:

![view](../../../Resource/026_view14.png)

Aqui usamos dois `.background()` consecutivos:

```swift
.background(backgroundView)
.background(Color.indigo)
```

O primeiro `.background()` é usado para adicionar o fundo com o ícone do Swift.
O segundo `.background()` é usado para adicionar o fundo índigo.

Assim, o ícone do Swift será exibido acima do fundo índigo e aparecerá como parte do fundo do cartão.

A partir daqui, podemos ver que `.background()` não só pode adicionar cores, mas também views personalizadas. Vários `.background()` também podem ser combinados para criar efeitos de fundo mais ricos.

Até aqui, um cartão de curso completo está concluído.

## Resumo

Nesta aula, revisamos métodos básicos comuns de layout no SwiftUI por meio de um cartão de curso.

Usamos `Text` para exibir texto, `Image` para exibir um ícone do sistema, e `VStack`, `HStack` e `Spacer()` para controlar a organização das views.

Aprendemos `.lineLimit()`, que pode limitar o número máximo de linhas exibidas por um texto. Quando o conteúdo ultrapassa o limite, a parte excedente é omitida.

Ao mesmo tempo, também revisamos modificadores comuns como `.padding()`, `.background()`, `.cornerRadius()` e `.foregroundStyle()`.

Depois de concluir esta aula, já podemos combinar várias pequenas views em um módulo de cartão completo.

Essa também é uma ideia muito comum no desenvolvimento com SwiftUI: primeiro dividir as views em partes pequenas e depois combiná-las em uma interface completa.

## Código completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Iniciante")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ aulas")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial de SwiftUI para iniciantes")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Comece do zero com SwiftUI e aprenda sistematicamente o desenvolvimento declarativo de interfaces da Apple. Com explicações claras e exemplos práticos, você dominará gradualmente layout, interação e gerenciamento de estado para criar interfaces de app bonitas e úteis.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("botão clicado")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Começar a aprender")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
