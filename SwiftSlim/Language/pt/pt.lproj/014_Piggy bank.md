# Cofrinho

Nesta aula, vamos desenvolver um projeto simples de “cofrinho”. A funcionalidade é simples, mas inclui uma lógica de interação completa, sendo muito adequada para iniciantes.

Por meio deste projeto, vamos aprender `TextField` (campo de entrada) e `border` (borda), além de entender o vínculo de dados (`$`).

O objetivo final é implementar um “cofrinho” no qual seja possível inserir um valor, tocar em um botão para salvar e acumular o valor total.

Resultado final:

![Piggy Bank](../../RESOURCE/014_view.png)

## Exibir o valor total

Primeiro, precisamos exibir o valor total do “cofrinho” na view.

No `ContentView`, declaramos uma variável para guardar o valor total do “cofrinho”.

```swift
@State private var amount = 0
```

Em seguida, usamos `Text` para exibir esse valor:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Aqui, usamos `.font` e `.fontWeight` para definir o tamanho e o peso da fonte.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Quando `amount` mudar, o valor total exibido em `Text` também será atualizado automaticamente.

## Inserir valor

Além de exibir o valor total, o “cofrinho” também precisa permitir que o usuário “insira” o valor a ser guardado. Para isso, precisamos usar o controle de view `TextField` do SwiftUI.

### TextField

`TextField` é um controle de view do SwiftUI usado para inserir conteúdo, normalmente em uma única linha.

O `TextField` oferece principalmente dois formatos de vínculo:

**1. Vincular ao tipo string (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Adequado para entradas de texto como nomes, títulos etc.

**2. Vincular ao tipo numérico (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Adequado para entradas numéricas como idade, salário, valor etc.

`format: .number` indica que esse campo de entrada será analisado e exibido no formato de número.

#### Texto de placeholder

O primeiro parâmetro de `TextField` é o placeholder, usado para sugerir ao usuário o que deve ser digitado:

```swift
TextField("input your name", text: $text)
```

Quando o campo está vazio, será exibido um texto cinza de dica.

![textfield](../../RESOURCE/014_textfield.png)

#### Vínculo de dados

O `TextField` não é responsável por persistir o conteúdo digitado. É necessário gerenciar os dados por meio de uma variável vinculada.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

O conteúdo digitado pelo usuário será salvo diretamente na variável `text`, enquanto o `TextField` cuida apenas da interface de entrada.

`$` indica vínculo (`Binding`):

```swift
$text
```

Isso não é uma variável comum, mas sim um tipo `Binding`.

Sua função é estabelecer uma conexão entre a view e os dados:

quando o usuário digita no `TextField`, `text` é atualizado automaticamente; quando `text` muda, o `TextField` também é atualizado de forma sincronizada.

Por exemplo:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Ao digitar no `TextField`, o `Text` acima será atualizado em tempo real.

![textField](../../RESOURCE/014_textfield1.png)

### Vincular tipo numérico

Quando precisamos inserir números, devemos vincular uma variável do tipo correspondente:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Quando o usuário digitar um valor, o `TextField` analisará esse conteúdo e atualizará automaticamente o valor de `number`.

## Adicionar o campo de entrada

Depois de entender o uso básico de `TextField`, vamos aplicá-lo ao projeto do “cofrinho”.

Como o “cofrinho” precisa receber um “valor”, usaremos a forma de “vincular tipo numérico (`Int/Double`)” e adicionaremos uma nova variável `number` para guardar o valor digitado pelo usuário:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Agora, o `TextField` exibe por padrão o valor de `number` (que inicialmente é `0`).

Quando o conteúdo é apagado, o placeholder “Amount” será exibido.

Isso mostra novamente que o `TextField` exibe o valor da variável vinculada, e não que ele armazena o conteúdo por conta própria.

### Problema de tamanho do campo de entrada

Na view atual, veremos que o `TextField` não tem borda, mostra apenas um `0`, e o conteúdo parece alinhado à esquerda.

O efeito é o seguinte:

![textfield](../../RESOURCE/014_textfield2.png)

Isso acontece porque, por padrão, o `TextField` ocupa toda a largura da view pai.

Podemos verificar isso adicionando uma cor de fundo:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

O efeito será:

![textfield](../../RESOURCE/014_textfield3.png)

Dá para ver que o `TextField` na verdade preenche toda a largura da linha.

### Definir largura fixa

Se quisermos que o campo fique mais compacto, podemos usar `frame` para limitar sua largura:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

O efeito será:

![textfield](../../RESOURCE/014_textfield4.png)

### Adicionar borda e padding interno

Como o `TextField` não tem borda por padrão, podemos adicionar um estilo manualmente:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Agora, o campo de entrada parece mais com um “campo padrão”.

![textfield](../../RESOURCE/014_textfield5.png)

## Borda

No SwiftUI, `border` é usado para adicionar bordas a uma view.

Uso básico:

```swift
border(Color.black, width: 1)
```

Aqui, `Color.black` representa a cor da borda, e `width` representa a espessura.

No `TextField`, usamos:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Isso significa adicionar ao campo de entrada uma borda preta com espessura de `1 pt`.

Você também pode testar outras cores, como `Color.blue`, `Color.green`, ou aumentar a espessura para `width: 2`.

## Botão de guardar dinheiro

Agora temos uma variável `amount` para exibir o valor total, um `TextField` para inserir o valor, e uma variável `number` vinculada ao campo.

O código atual é o seguinte:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Adicionar botão

Em seguida, precisamos adicionar um botão para acionar a operação de guardar dinheiro.

```swift
Button("Save") {
    
}
```

### Implementar a lógica de guardar

Queremos que, quando o usuário digitar um valor e tocar no botão, esse valor seja acumulado automaticamente no total.

```swift
Button("Save") {
    amount += number
}
```

Aqui usamos o “operador composto de atribuição” para somar o valor digitado pelo usuário (`number`) ao valor total (`amount`).

### Redefinir o valor digitado

Agora existe um problema: cada vez que tocamos no botão, o valor do campo de entrada não é limpo.

Se o usuário digitar `10` e tocar em salvar, o campo ainda continuará mostrando `10`, o que atrapalha a próxima entrada.

Isso acontece porque o `TextField` está vinculado a `number`. Ao tocar no botão, modificamos apenas `amount`; `number` não muda, então o campo continua mostrando o valor antigo.

Precisamos adicionar uma lógica de limpeza: depois de acumular o valor no total, redefinimos o valor digitado:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Agora, quando o usuário digita um valor e toca no botão, o valor é somado ao total. Em seguida, `number` é redefinido para `0`, preparando a próxima entrada.

Assim, concluímos toda a lógica de guardar dinheiro do “cofrinho”.

## Otimizar a view

Depois de concluir a funcionalidade, podemos fazer uma otimização visual simples, adicionando uma imagem de fundo e um estilo ao botão.

Adicionar estilo ao botão:

```swift
.buttonStyle(.borderedProminent)
```

Adicionar imagem de fundo:

```swift
.background {
    Image("1")
}
```

Agora, concluímos todo o desenvolvimento do “cofrinho”.

## Código completo

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Resultado final:

![Piggy Bank](../../RESOURCE/014_view.png)

Agora, podemos tentar guardar `100` ou até mais dinheiro para verificar se a lógica do “cofrinho” tem algum problema.

Também podemos executar o “cofrinho” no simulador ou em um dispositivo real para experimentar o aplicativo que desenvolvemos.

### Saída de depuração

Para verificar se a lógica está correta, também podemos adicionar lógica de depuração dentro do botão, para confirmar se o valor digitado está sendo tratado corretamente:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Cada vez que guardamos dinheiro e tocamos no botão, veremos a saída de depuração correspondente para verificar se existe algum problema na lógica do código.

```id="d31l7a"
---Saving---
amount:11
number:0
```
