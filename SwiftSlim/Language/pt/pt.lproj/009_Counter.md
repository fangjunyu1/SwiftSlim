# Contador

Nas duas lições anteriores, aprendemos variáveis, constantes, botões e funções.

Nesta lição, vamos combinar esses conhecimentos para criar um aplicativo simples de contador.

Neste exemplo, vamos aprender como armazenar e alterar variáveis, além de usar `@State` para gerenciar valores.

## Implementando o contador

O contador é normalmente usado para registrar quantidades que precisam ser acumuladas continuamente. Por exemplo, número de pulos de corda, voltas de corrida e outros cenários de contagem.

Agora vamos criar um contador simples: exibir um número e um botão, e ao clicar no botão fazer esse número aumentar.

![Num](../../RESOURCE/009_num.png)

### Exibindo o número

Primeiro, usamos `Text` para mostrar um número.

```swift
Text("0")
```

Mas, se o número precisa mudar, não podemos deixar `"0"` fixo; devemos usar uma variável para armazená-lo.

```swift
var num = 0
```

Depois, exibimos a variável no `Text`:

```swift
Text("\(num)")
```

Aqui usamos interpolação de string `\()` para converter o número em texto e exibi-lo.

### Botão para aumentar o número

Em seguida, adicionamos um botão.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Quando o botão for clicado, queremos que o número aumente.

Por isso, podemos modificar a variável dentro do botão:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Esse código significa: ao clicar no botão, será calculado `num + 1` e o resultado será atribuído a `num`.

### Forma mais concisa

Swift oferece uma forma mais curta de escrever isso:

```swift
num += 1
```

Isso é equivalente a:

```swift
num = num + 1
```

Essa forma é chamada de “operador de atribuição composta”.

Os operadores de atribuição composta mais comuns em Swift são:

```
+=   atribuição por adição
-=   atribuição por subtração
*=   atribuição por multiplicação
/=   atribuição por divisão
%=   atribuição por resto
```

Por exemplo:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Código completo

Agora já podemos escrever um contador simples:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Mas, nesse momento, o código ainda não funciona corretamente.

### Aparece um erro

O Xcode exibirá:

```
Cannot assign to property: 'self' is immutable
```

Isso significa que não é possível modificar a propriedade, porque a view é imutável.

Por que isso acontece?

## Como o SwiftUI funciona

No SwiftUI: **a interface é dirigida por dados**, o que significa que, quando os dados mudam, a interface é atualizada automaticamente.

Mas há um ponto importante: somente quando um estado (como `@State` e `@Binding`) muda, o SwiftUI monitora essa alteração e atualiza a view.

Se você usar uma variável comum, o SwiftUI só lê seu valor uma vez, quando a view é criada. Depois disso, mesmo que a variável mude, a interface não será atualizada.

Por exemplo:

```swift
var num = 0   // 0
num = 1   // 0
```

No exemplo acima, `num` é uma variável comum. Embora seu valor tenha mudado, o SwiftUI não atualizará a view, e a interface continuará mostrando o valor inicial `0`.

![Num](../../RESOURCE/009_state.png)

Portanto, somente quando os dados são marcados como estado (por exemplo, usando `@State`, `@Binding` e outros property wrappers), o SwiftUI monitora automaticamente as mudanças e atualiza a view.

## Property wrapper `@State`

No SwiftUI, se você precisa modificar uma variável e atualizar a view, deve usar `@State`.

```swift
@State var num = 0
```

`@State` faz com que o SwiftUI observe essa variável.

Quando a variável muda, o SwiftUI recalcula a view e a atualiza.

Código completo:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Agora, quando o botão for clicado:

```swift
num += 1
```

o SwiftUI detectará que `num` mudou e atualizará automaticamente a view.

![Num](../../RESOURCE/009_state1.png)

## Regras de uso do `@State`

No desenvolvimento real, `@State` geralmente segue duas regras.

### 1. `@State` normalmente usa `private`

As variáveis `@State` normalmente são usadas apenas dentro do tipo atual (por exemplo, a `struct` da `View` atual), então em geral são escritas assim:

```swift
@State private var num = 0
```

Isso evita que outras views acessem ou modifiquem essa variável diretamente.

Ainda não estudamos `private`, então você pode entender assim, de forma simples:

**O conteúdo modificado com `private` só pode ser usado na view atual; views externas não podem usá-lo.**

### 2. `@State` é usado apenas para o estado da view atual

`@State` é adequado para dados gerenciados pela própria `View` atual.

Por exemplo, o conteúdo de um campo de texto ou o estado de um interruptor.

```swift
@State private var isOn = false
@State private var text = ""
```

Se os dados precisarem ser compartilhados entre várias views, será necessário usar outros tipos de estado, como `@Binding` ou `@Observable`.

Esses conteúdos serão estudados em lições futuras.

### Botão de diminuir

Além de aumentar, o contador também pode diminuir.

Podemos adicionar um botão `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Depois, usamos `HStack` para organizar os botões horizontalmente:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Efeito:

![Num](../../RESOURCE/009_num1.png)

Ao clicar no botão `+`, o número aumenta em 1; ao clicar no botão `-`, o número diminui em 1.

### Botão de redefinir

Também podemos adicionar um botão de redefinição para voltar o número para `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Quando o botão de redefinir for clicado, `num` receberá o valor `0`.

Efeito:

![Num](../../RESOURCE/009_num2.png)

Ao clicar no botão `0`, o número volta para `0`.

### Botões personalizados

No momento, nossos botões ainda só conseguem mostrar texto:

```swift
Button("+") {

}
```

Nessa forma, o botão só pode exibir conteúdo textual, como `+` ou `-`.

No desenvolvimento real, geralmente queremos uma aparência mais rica para os botões, por exemplo usando ícones ou outras views.

O SwiftUI permite personalizar o conteúdo exibido pelo botão. Nesse caso, podemos usar outra forma de escrever `Button`:

```swift
Button(action: {

}, label: {

})
```

Nessa forma, `action` representa o código executado ao clicar no botão, e `label` representa a view exibida pelo botão.

Por exemplo, podemos fazer o botão mostrar um ícone do SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Assim, o botão deixa de mostrar texto e passa a mostrar um ícone.

### Otimizando a interface do contador

Para deixar a interface do contador mais clara, também podemos ajustar o estilo de exibição do número. Por exemplo, aumentar seu tamanho:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Em seguida, podemos trocar o conteúdo dos botões por ícones e aumentar um pouco o tamanho visual deles:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Da mesma forma, também podemos transformar o botão de diminuir e o botão de redefinir em ícones:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Agora os botões exibem ícones do SF Symbols, e a interface fica mais intuitiva.

![Num](../../RESOURCE/009_num3.png)

## Resumo

Nesta lição, ao implementar um contador simples, praticamos de forma integrada o uso de variáveis, `Text` e `Button`. Usamos uma variável para armazenar o número e controlamos o aumento e a diminuição desse valor por meio de botões, além de aprender operadores de atribuição composta, como `num += 1` e `num -= 1`.

Durante a implementação, entendemos como o SwiftUI funciona: a interface é guiada por dados. Quando os dados mudam, a interface é atualizada. Por isso, precisamos usar `@State` para armazenar estados mutáveis. Quando uma variável marcada com `@State` muda, o SwiftUI atualiza automaticamente a view.

Por fim, fizemos uma pequena otimização na interface, ajustando o estilo tipográfico do `Text` e usando `Button(action:label:)` para personalizar o conteúdo dos botões, permitindo exibir ícones e deixando o contador mais claro e visualmente melhor.

Agora já tivemos contato com a forma básica de uso das views no SwiftUI. Em SwiftUI, a maior parte da interface é construída com base em variáveis. Quando essas variáveis mudam, o SwiftUI atualiza automaticamente a view. Portanto, ao desenvolver apps com SwiftUI, normalmente precisamos primeiro planejar quais dados devem ser armazenados e depois usar esses dados para construir a interface e a lógica de interação.

## Código completo

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
