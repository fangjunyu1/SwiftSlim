# Visão de login

Nesta aula, vamos aprender um cenário muito prático: a visão de login.

Seja em um site ou em um App, durante o uso muitas vezes o usuário precisa fazer login com sua conta e senha.

Por exemplo, a página de login do GitHub:

![WordPress](../../Resource/019_github.png)

Nesta aula, vamos criar uma visão de login semelhante, permitindo que o usuário insira manualmente a conta e a senha e verifique se há algum problema no conteúdo inserido.

## Layout superior

Vamos escrever o código da visão de login no arquivo `ContentView`.

Primeiro, vamos criar a área de identificação no topo da visão de login. Você pode preparar antes uma imagem de ícone adequada e colocá-la na pasta `Assets`.

![icon](../../Resource/019_icon1.png)

Em seguida, use `Image` e modificadores para exibir a imagem:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Esses modificadores significam:

- `resizable()`: permite ajustar o tamanho da imagem.
- `scaledToFit()`: mantém a proporção original da imagem ao escalá-la.
- `frame(width: 100)`: define a largura exibida da imagem como `100`.

Depois, use `Text` e modificadores para mostrar o título de login:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Em seguida, use `VStack` para organizar a imagem e o texto verticalmente:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Resultado:

![view](../../Resource/019_view.png)

Até aqui, concluímos a área de título no topo da visão de login.

### Otimizar o layout

Agora, a imagem e o título ficam por padrão na área central do layout geral.

Se quisermos que eles pareçam mais como uma “identificação de login no topo da página”, podemos usar `Spacer()` para ocupar o espaço restante, fazendo o conteúdo aparecer mais próximo do topo.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Resultado:

![view](../../Resource/019_view1.png)

No entanto, agora `Image` e `Text` ficaram muito próximos do topo da tela e parecem um pouco apertados.

Nesse momento, podemos usar `padding` para adicionar um espaçamento superior a todo o `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Resultado:

![view](../../Resource/019_view2.png)

Assim, a área de título no topo da página fica mais adequada.

## Nome de usuário e senha

A página de login normalmente exige que o usuário insira um nome de usuário e uma senha.

No SwiftUI, podemos usar `TextField` para receber o conteúdo digitado pelo usuário.

Mas atenção: o `TextField` não armazena sozinho os dados inseridos por muito tempo, ele é apenas um controle de entrada. Quem realmente armazena esse conteúdo são as variáveis que vinculamos a ele.

Por isso, primeiro precisamos criar duas variáveis `@State` para armazenar o nome de usuário e a senha:

```swift
@State private var user = ""
@State private var password = ""
```

Quando o valor de uma variável `@State` muda, o SwiftUI atualiza automaticamente a visualização relacionada.

Em seguida, use `TextField` para vincular essas duas variáveis:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Aqui, `$user` e `$password` significam “binding”.

Ou seja, quando o usuário digita no campo, a variável muda ao mesmo tempo; e quando a variável muda, o conteúdo mostrado no campo também muda ao mesmo tempo.

Essa relação em que “visualização e dados se sincronizam mutuamente” é justamente o binding.

Observe que aqui precisamos usar a escrita com `$`:

```swift
$user
```

Porque o `TextField` não precisa de uma string comum, mas sim de um valor de binding que “possa modificar os dados em duas direções”.

### Exibir os campos de entrada

Vamos colocá-los no `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efeito exibido:

![view](../../Resource/019_view3.png)

Como agora `user` e `password` são, por padrão, strings vazias:

```swift
""
```

O campo de entrada mostrará primeiro um texto de placeholder, por exemplo:

```swift
input user
```

Esse texto serve apenas para indicar ao usuário “o que deve ser inserido aqui”, não é o conteúdo realmente inserido.

### Otimizar os campos de entrada

Agora os campos de entrada já podem ser usados, mas o estilo padrão é relativamente simples.

Para deixar a interface mais clara, podemos adicionar um título antes do campo e fazer uma pequena otimização de estilo no próprio campo.

Por exemplo, primeiro adicione um título:

```swift
Text("Username")
    .fontWeight(.bold)
```

Depois, use `HStack` para colocar o título e o campo de entrada na mesma linha:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Usamos `HStack` aqui porque queremos “mostrar o título à esquerda e o campo de entrada à direita”.

É importante notar que o `TextField`, por padrão, ocupa o espaço disponível restante.

![color](../../Resource/019_view6.png)

Para deixar o tamanho dos dois campos de entrada mais uniforme, podemos usar `frame(width:)` para definir uma largura, fazendo com que os campos pareçam mais organizados.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Depois, adicione uma borda para destacar mais o campo de entrada:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Agora, vamos adicionar tanto o nome de usuário quanto a senha à visualização `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efeito exibido:

![view](../../Resource/019_view4.png)

Até aqui, o usuário já pode inserir nome de usuário e senha.

## Botão de login

Agora, vamos adicionar um botão de login na parte inferior dos campos de entrada.

```swift
Button("Sign in") {

}
```

Depois, use `buttonStyle` para dar ao botão um estilo de sistema mais evidente:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Efeito exibido:

![view](../../Resource/019_view5.png)

Para confirmar que o botão realmente responde ao clique, podemos primeiro escrever um `print` dentro do botão para testar:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Quando clicar no botão, o console exibirá:

```swift
click Sign in
```

Isso mostra que o botão já respondeu com sucesso ao clique.

## Lógica de login

Agora, vamos adicionar ao botão de login a lógica de validação mais básica: **detectar se o usuário inseriu nome de usuário e senha**.

Queremos implementar as seguintes situações:

- Se o usuário não inseriu nada, exibir `Empty`
- Se o usuário inseriu apenas um dos dois, avisar qual deles está faltando
- Se tanto o nome de usuário quanto a senha foram inseridos, exibir `Success`

### Nenhuma informação inserida

Como `user` e `password` são, por padrão, strings vazias:

```swift
@State private var user = ""
@State private var password = ""
```

Quando o usuário não insere nada, eles continuam vazios.

No Swift, tipos como `String` podem usar `isEmpty` para verificar se o conteúdo está vazio.

### Propriedade isEmpty

`isEmpty` é frequentemente usada para verificar se strings, arrays e outros conteúdos estão vazios.

Por exemplo:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Se o conteúdo estiver vazio, `isEmpty` retorna `true`; se o conteúdo não estiver vazio, `isEmpty` retorna `false`.

Portanto, podemos usá-la para verificar se o nome de usuário e a senha têm algum conteúdo inserido.

### Usar isEmpty para verificar variáveis

Se o usuário não inseriu nenhuma informação, então:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Nesse momento, podemos escrever a condição assim:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Esse código significa: se `user` está vazio e `password` também está vazio, então exiba:

```swift
Empty
```

Aqui, `&&` é um operador lógico que significa “e”.

Ou seja, quando a condição da esquerda é verdadeira e a condição da direita também é verdadeira, toda a condição é verdadeira.

Portanto, esse código só será executado quando tanto o nome de usuário quanto a senha estiverem vazios.

## O usuário preencheu apenas uma parte

Em seguida, vamos considerar outra situação: o usuário preencheu apenas o nome de usuário ou apenas a senha.

Por exemplo:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Nesse momento, o nome de usuário não está vazio, mas a senha está vazia.

Podemos continuar usando `isEmpty` para verificar isso:

### Situação em que o usuário preenche conta ou senha

Se o usuário preencheu apenas o nome de usuário ou a senha, precisamos dar um aviso correspondente sobre o que está faltando.

Por exemplo, se o usuário preencheu apenas o nome de usuário:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

A lógica desse código é: se o nome de usuário estiver vazio, pedir para preencher o nome de usuário. Caso contrário, verificar se a senha está vazia; se estiver vazia, pedir para preencher a senha.

### O usuário preencheu todas as informações

Se tanto o nome de usuário quanto a senha já foram inseridos, então `isEmpty` de ambos retornará `false`.

Nesse caso, podemos escrever assim:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Aqui, `!` significa “negação”.

Por exemplo:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Ou seja, `user.isEmpty` serve para verificar “se o nome de usuário está vazio”, enquanto `!user.isEmpty` serve para verificar “se o nome de usuário não está vazio”.

Para a senha, a lógica é a mesma.

Portanto, o significado desse código é: o nome de usuário não está vazio e a senha também não está vazia.

Quando essas duas condições são atendidas, o seguinte é exibido:

```swift
Success
```

## Lógica completa de validação

Agora, vamos combinar essas três situações e escrevê-las dentro de `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

A ordem de execução desse código pode ser entendida assim:

Primeiro, verificamos:

```swift
if user.isEmpty && password.isEmpty
```

Se tanto o nome de usuário quanto a senha estiverem vazios, `Empty` será exibido diretamente.

Se ambos não estiverem vazios, o programa continuará verificando a linha abaixo:

```swift
else if user.isEmpty || password.isEmpty
```

Aqui, `||` significa “ou”.

Ou seja, basta que uma das condições seja verdadeira para que a condição completa seja verdadeira.

Portanto, sempre que o nome de usuário estiver vazio ou a senha estiver vazia, o bloco de código do `else if` será executado.

Depois de entrar nesse bloco, verificamos ainda mais qual campo de entrada realmente não foi preenchido:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Se as duas condições anteriores não forem atendidas, isso significa que o nome de usuário não está vazio e a senha também não está vazia.

Então o programa entrará no último `else`:

```swift
print("Success")
```

Assim, concluímos a lógica mais básica de validação da entrada de login.

## Verificação de nome de usuário e senha

A lógica acima apenas verifica “se há conteúdo inserido”.

Mas, em um App real, apenas inserir conteúdo não é suficiente. Normalmente também é necessário enviar o nome de usuário e a senha para o servidor para validação.

Se o servidor confirmar que o nome de usuário existe e que a senha está correta, o login será permitido; caso contrário, será exibida uma mensagem de falha no login.

Para praticar esse processo, podemos primeiro definir no código uma conta e uma senha temporárias, simulando “informações corretas de login”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Quando tanto o nome de usuário quanto a senha não estiverem vazios, vamos compará-los para verificar se estão corretos:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Aqui, `==` significa “se são iguais”.

Por exemplo:

```swift
user == userID
```

Isso significa verificar se o nome de usuário inserido pelo usuário é exatamente igual ao nome de usuário correto que definimos. Para a senha, a lógica é a mesma.

Portanto, quando o nome de usuário e a senha inseridos forem iguais aos valores definidos, será exibido `Success`; se qualquer um deles for diferente, será exibido `Input error`.

Assim, concluímos uma simples “verificação simulada de login”.

Embora isso ainda não seja uma função de login real conectada a um servidor, já é suficiente para nos ajudar a entender: **depois que o botão é clicado, diferentes códigos podem ser executados de acordo com diferentes condições**.

## Resumo

Nesta aula, concluímos uma visão de login básica e focamos principalmente na aprendizagem da “lógica de julgar o conteúdo de entrada com base em condições”.

O conteúdo central desta aula é: usar `isEmpty` para verificar se uma string está vazia e usar instruções `if` com operadores lógicos para lidar com diferentes situações.

Dois operadores lógicos muito importantes são:

- `&&`: significa “e”, ambas as condições precisam ser satisfeitas
- `||`: significa “ou”, basta que uma condição seja satisfeita

Quando essas condições finalmente resultam em `true` ou `false`, a instrução `if` executa códigos diferentes de acordo com o resultado.

Por meio desta visão de login, já começamos a entrar em contato com uma forma de desenvolvimento que combina “interface + dados + julgamento lógico”.

## Código completo

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
