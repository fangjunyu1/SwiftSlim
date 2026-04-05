# Interações de login

Na aula anterior, criamos uma visualização de login e usamos botões junto com lógica condicional para implementar uma validação simples do conteúdo inserido.

Nesta aula, vamos continuar com o código da aula anterior para aprender sobre o campo de senha `SecureField`, a caixa de alerta `Alert` e como controlar a exibição de diferentes visualizações com base em variáveis.

Com esta aula, você poderá entender melhor o fluxo básico de interação de uma visualização de login. Essa também é uma lógica básica muito usada em muitos apps.

## Campo de entrada de senha

Na aula anterior, usamos `TextField` para inserir a senha.

No entanto, em uma interface de login real, a senha normalmente não é mostrada diretamente. Em vez disso, ela aparece como pontos ou com outro efeito oculto, o que ajuda a proteger a privacidade do usuário.

No SwiftUI, o controle usado especificamente para inserir senhas é o `SecureField`.

Por exemplo:

```swift
SecureField("Password", text: $password)
```

A sintaxe dele é muito parecida com a de `TextField`. Ele também precisa de um texto de dica e de uma variável vinculada.

Você pode entendê-lo de forma simples assim: `SecureField` também é um campo de entrada, só que oculta o conteúdo digitado.

Podemos trocar diretamente o `TextField` que antes era usado para inserir a senha por `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Quando o usuário digitar a senha, o conteúdo dela não será mais exibido diretamente na interface.

Efeito de exibição:

![password](../../Resource/020_password.png)

Agora podemos inserir o nome de usuário e a senha e, em seguida, clicar no botão para verificar se a entrada está correta.

### Exibir mensagens de retorno

Antes, estávamos usando `print` o tempo todo para exibir resultados.

O conteúdo de `print` só aparece no console. O desenvolvedor consegue vê-lo ao executar o programa no Xcode, mas usuários comuns no celular não conseguem ver essas mensagens.

Isso significa que, mesmo que o programa já tenha concluído a validação, o usuário ainda não sabe se o conteúdo inserido está correto.

Nesse momento, precisamos de uma forma de mostrar mensagens diretamente na interface.

## Caixa de alerta Alert

No SwiftUI, podemos usar `Alert` para exibir uma caixa de mensagem.

Uso básico:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Esse código parece um pouco mais complexo do que os controles anteriores, mas podemos entendê-lo dividindo-o em partes.

`Alert` contém principalmente as seguintes partes:

- `"Title"`: o título da caixa de alerta
- `isPresented`: um valor booleano vinculado usado para controlar se a caixa de alerta será exibida
- `Button(...)`: o botão na caixa de alerta
- `message:`: o conteúdo da mensagem exibido na caixa de alerta

Você pode entender de forma simples assim: quando a variável vinculada se torna `true`, o sistema exibe essa caixa de alerta.

Efeito de exibição:

![alert](../../Resource/020_alert3.png)

Estrutura correspondente:

![alert](../../Resource/020_alert.png)

### Alert é um modificador

Assim como muitos dos modificadores que aprendemos antes, `Alert` também é adicionado depois de uma determinada visualização.

Por exemplo, ele pode ser anexado depois de um botão:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Ele também pode ser anexado depois do `VStack` externo:

```swift
VStack {
    // ...
}
.alert() {...}
```

Isso significa que `Alert` não é uma visualização independente colocada sozinha na interface. Em vez disso, é um modificador anexado a uma determinada visualização.

Você pode entendê-lo de forma simples assim: `Alert` geralmente é escrito depois de um botão ou do layout externo para exibir uma mensagem quando certa condição é atendida.

### Exibir Alert

Se quisermos exibir um `Alert`, precisamos de uma variável para controlá-lo.

Por exemplo:

```swift
@State private var showAlert = false
```

Essa variável é do tipo `Bool`, ou seja, possui apenas dois valores: `true` ou `false`.

Depois, vincule-a ao `isPresented` do `Alert`:

```swift
isPresented: $showAlert
```

Quando `showAlert` for `false`, a caixa de alerta não será exibida. Quando `showAlert` for `true`, a caixa de alerta será mostrada.

### Exibir a caixa de alerta por meio de um botão

Agora, vamos primeiro implementar o cenário mais simples:

Quando o usuário não digitar nada e clicar diretamente no botão `Sign in`, exiba uma caixa de mensagem dizendo a ele que ainda não inseriu nenhum conteúdo.

Primeiro, crie uma variável para controlar essa caixa de mensagem:

```swift
@State private var showEmpty = false
```

Depois, adicione um `Alert` depois de `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Em seguida, faça a verificação no código do clique do botão:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Se `user` e `password` estiverem ambos vazios, defina `showEmpty` como `true`.

E como `Alert` está vinculado a essa variável, quando ela se tornar `true`, o sistema exibirá automaticamente a caixa de alerta.

Efeito de exibição:

![alert](../../Resource/020_alert1.png)

Dessa forma, depois que o usuário clicar no botão, ele poderá ver imediatamente a mensagem, e o desenvolvedor não precisará verificar a saída de `print` no console.

### Melhorando o botão e as caixas de alerta

Antes, tratamos apenas o caso em que “nada foi preenchido”.

Ainda precisamos tratar as seguintes situações:

- o nome de usuário está faltando
- a senha está faltando
- o nome de usuário e a senha foram preenchidos, mas a entrada está incorreta

Por isso, também precisamos preparar mensagens correspondentes para esses casos.

Primeiro, adicione três novas variáveis:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Depois, continue adicionando os `Alert` correspondentes depois do botão:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Em seguida, complete a lógica de decisão dentro do botão:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Quando o botão determinar que o usuário não preencheu nenhuma informação, deixou uma das informações em branco ou falhou na validação, a variável booleana correspondente será alterada para `true`, e então o `Alert` correspondente será exibido.

Aqui, recomendo que você teste várias situações por conta própria:

- não preencher nada
- preencher apenas o nome de usuário
- preencher apenas a senha
- preencher o nome de usuário e a senha, mas com conteúdo incorreto
- preencher o nome de usuário e a senha, com conteúdo correto

Isso ajuda a verificar se há algum problema em nosso código. Também é uma etapa de “teste” muito importante no desenvolvimento de apps.

Se o programa se comportar de forma incorreta em determinado cenário, isso significa que pode haver um problema na lógica e que surgiu um `Bug` no programa.

O que normalmente chamamos de `Bug` no desenvolvimento se refere a um erro, falha ou comportamento que não corresponde ao esperado.

## Concluindo a visualização de login

Os exemplos de `Alert` de que falamos antes tratavam de como dar feedback ao usuário quando “a entrada está errada”.

Quando o usuário insere o nome de usuário e a senha corretos, normalmente não exibimos uma “caixa de alerta”. Em vez disso, entramos diretamente na interface após o login.

Isso envolve um conceito muito importante: **exibir visualizações diferentes com base no valor de uma variável.**

Por exemplo:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Aqui, usamos o tipo `Bool` para gerenciar qual visualização será mostrada:

- se `login` for `true`, isso significa que o login já foi bem-sucedido e o conteúdo após o login será exibido
- se `login` for `false`, isso significa que o login não foi bem-sucedido e a interface de login continuará sendo exibida.

Embora a instrução `if` seja uma instrução condicional no Swift, dentro de `body` no SwiftUI ela pode ser usada para controlar a lógica de exibição das visualizações.

Isso significa que o SwiftUI determina qual visualização deve ser mostrada no momento com base no resultado da condição.

Podemos colocar essa lógica de exibição dentro do `ContentView` atual:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Código original da visualização de login
		}
	}
}
```

Aqui, adicionamos uma nova variável, `login`, para indicar se o usuário já fez login com sucesso.

Depois, colocamos o código da visualização de login que já havíamos escrito após a instrução `else`.

Lógica de exibição da visualização:

- quando `login` for `false`, isso significa que o login ainda não foi concluído com sucesso, então a visualização de login original continuará sendo exibida.
- quando `login` for `true`, isso significa que o login foi bem-sucedido. Nesse momento, a visualização de login deixa de ser mostrada e `Login successful` passa a ser exibido.

Isso significa que `ContentView` mostrará conteúdos diferentes de visualização dependendo do valor de `login`.

A seguir, vamos modificar a lógica de sucesso do login dentro do botão:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Quando o nome de usuário e a senha inseridos pelo usuário estiverem ambos corretos, definimos `login` como `true`.

Assim que o valor de `login` mudar, o resultado da verificação `if` em `ContentView` também mudará, e a interface mudará da visualização de login original para `Login successful`.

O efeito exibido é o seguinte:

![view](../../Resource/020_view.png)

Agora, realmente aplicamos a ideia de “exibir visualizações diferentes de acordo com as condições” a esta página de login atual.

Em apps reais, normalmente também funciona assim: visualizações diferentes são exibidas com base em um determinado valor.

Por exemplo, quando o usuário não está logado, a página de login é exibida. Depois que o usuário faz login com sucesso, outra interface é exibida.

A ideia central é: **usar mudanças nas variáveis para controlar qual conteúdo a interface exibe.**

## Resumo

Nesta aula, aprendemos três coisas importantes:

1. Usar `SecureField` para inserir senhas, para que o conteúdo da senha não seja mostrado diretamente na interface.
2. Usar `Alert` para mostrar mensagens ao usuário em vez de apenas exibi-las no console.
3. Usar variáveis e condições `if` para controlar a exibição de diferentes visualizações, tornando possível alternar entre as interfaces antes e depois do login.

Ao aprender esses conceitos, agora já conseguimos concluir uma visualização de login com efeitos básicos de interação e entender melhor a ideia de desenvolvimento no SwiftUI de que “quando o estado muda, a interface é atualizada”.

## Código completo

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Conhecimento extra - Alert com vários botões

Na parte anterior desta aula, usamos o `Alert` mais básico, que tem apenas um botão e é usado principalmente para avisar o usuário.

Na verdade, `Alert` também pode conter vários botões para que o usuário faça escolhas diferentes.

Por exemplo:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Depois de clicar no botão, será exibida uma caixa de mensagem com três opções: `Ok`, `delete` e `cancel`.

Efeito de exibição:

![alert](../../Resource/020_alert2.png)

Ao clicar em botões diferentes, o código correspondente será executado.

### A propriedade `role` de Button

Aqui você perceberá que o `Button` dentro de `Alert` é um pouco diferente da sintaxe normal de botão que aprendemos antes:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Aqui existe um parâmetro extra chamado `role`.

No SwiftUI, `role` é usado para dizer ao sistema que tipo de ação esse botão representa.

Alguns papéis comuns são:

- `.cancel`: ação de cancelar
- `.destructive`: ação perigosa, como excluir
- `nil`: ação normal

Valores diferentes de `role` normalmente também levam a estilos visuais diferentes na interface.

Por exemplo, ações perigosas costumam ser exibidas com um estilo mais chamativo para lembrar os usuários de clicar com cuidado.

Além disso, `role` também fornece informações semânticas extras para o botão, facilitando para leitores de tela, como o VoiceOver em dispositivos Apple, explicarem ao usuário a finalidade do botão.

Por isso, em situações apropriadas, adicionar `role` a um botão é um ótimo hábito.
