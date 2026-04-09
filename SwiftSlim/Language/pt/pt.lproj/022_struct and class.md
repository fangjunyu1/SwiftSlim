# struct e class

Na aula anterior, tínhamos acabado de começar a entrar em contato com `struct`, definimos uma estrutura e também ampliamos o aprendizado para tópicos como protocolos, `UUID` e outros pontos de conhecimento.

Agora, já temos uma compreensão inicial da palavra-chave `struct`, mas ainda não podemos dizer que a entendemos de verdade.

Nesta aula, continuaremos usando `struct` como conteúdo principal e, ao mesmo tempo, conheceremos também `class`. Por meio desta aula, você vai entender com mais clareza: o que é uma instância, o que é um construtor e por que podemos usar `struct` e `class` para organizar dados.

## Sistema de gerenciamento de estudantes

Por exemplo, agora queremos desenvolver um sistema de gerenciamento de estudantes. Cada estudante tem informações como nome, sexo, telefone, idade, endereço residencial e assim por diante.

Neste momento, podemos juntar essas informações e defini-las como uma estrutura `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Aqui usamos `struct` para definir um tipo de estudante.

Esta estrutura `Student` contém várias propriedades:

- `id`: o identificador único do estudante
- `name`: o nome do estudante
- `sex`: o sexo do estudante
- `phone`: o telefone do estudante
- `age`: a idade do estudante
- `address`: o endereço residencial

Dessa forma, vários dados que originalmente estavam dispersos passam a formar um "estudante" completo.

Aqui, `Student` também segue o protocolo `Identifiable` e define um campo `id`, facilitando depois a exibição de dados junto com o loop `ForEach`.

Depois, podemos criar uma instância de estudante:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Esse código significa que, com base na estrutura `Student`, podemos criar um dado concreto de estudante.

Aqui, `Student` é o tipo, e `Student(...)` representa uma instância criada.

No SwiftUI, podemos atribuir essa instância a uma variável e depois exibi-la.

Por exemplo:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Assim, podemos ver na visualização o nome desse estudante: `Fang Junyu`.

Aqui, primeiro criamos uma instância de `Student`, depois a atribuímos à variável `student` e, por fim, lemos sua propriedade por meio de `student.name`.

## O que é uma instância

Quando começamos a aprender `struct`, a palavra "instância" pode parecer muito estranha.

Mas, na verdade, usamos instâncias desde o começo, só que antes não prestávamos atenção especial nisso.

Por exemplo:

```swift
let name = "Fang Junyu"
```

Aqui, `"Fang Junyu"` é um valor do tipo string e, em essência, é uma instância do tipo `String`.

Também podemos escrever assim:

```swift
let name = String("Fang Junyu")
```

Essas duas formas de escrever expressam a mesma coisa: criar uma instância do tipo `String` e atribuí-la à variável `name`.

Da mesma forma, o mesmo vale para `Int`:

```swift
let num = 3
```

Aqui, `3` é essencialmente um valor do tipo `Int`, e também pode ser entendido como uma instância de `Int`.

Portanto, instância não é um conceito especial que aparece apenas em `struct`.

Seja `String`, `Int`, `Double`, `Bool` ou o `Student` personalizado, todos eles podem criar instâncias.

Por isso, quando escrevemos:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

isso é, em essência, o mesmo que criar uma instância de `String` ou `Int`, com a diferença de que `Student` é um tipo definido por nós mesmos.

## Construtor

Quando criamos uma instância:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

na verdade estamos chamando o método de inicialização de `Student`, ou seja, `init`.

Você pode entender o construtor assim: **é a entrada responsável por atribuir valores às propriedades quando uma instância é criada.**

Ou seja, antes que uma instância seja realmente concluída, ela normalmente precisa passar primeiro por `init`.

Por exemplo, quando antes aprendemos o ciclo de vida das views no SwiftUI, escrevemos um código como este:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Aqui, `init()` é executado quando a instância `ContentView` é criada, enquanto `onAppear` só é executado quando a view realmente aparece na tela. Isso significa que a criação da view e sua exibição não acontecem no mesmo momento.

Da mesma forma, quando criamos `Student(...)`, também estamos chamando o construtor de `Student`.

### Construtor gerado automaticamente pelo sistema

Quando definimos `Student`, não escrevemos `init` manualmente:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Mesmo assim, ainda podemos criar uma instância diretamente:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Por que é possível criar uma instância sem escrever um construtor?

Porque, no caso de `struct`, se não escrevermos um construtor manualmente, o sistema normalmente gera automaticamente um construtor adequado para nós.

Na fase inicial de aprendizado, você pode entender isso de forma simples assim: o Swift completa automaticamente o código de inicialização para nós.

De forma aproximada, podemos entender isso como se o sistema completasse o seguinte código para nós:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Aqui é preciso prestar atenção em um detalhe:

```swift
let id = UUID()
```

`id` já tem um valor padrão, então, ao criar a instância, não precisamos passar `id` manualmente de novo.

Isso significa que propriedades sem valor padrão normalmente precisam ser passadas no construtor; propriedades que já têm valor padrão normalmente podem usar diretamente esse valor original.

Portanto, ao criar uma instância de `Student`, só precisamos passar `name`, `sex`, `phone`, `age` e `address`.

### Dicas do compilador

Além disso, quando digitamos `Student(...)` no Xcode, também podemos ver as dicas de parâmetros fornecidas pelo sistema.

![student](../../Resource/022_student.png)

Isso também mostra que o tipo atual realmente possui um construtor gerado automaticamente pelo sistema.

### Escrevendo o construtor por conta própria

Embora o sistema possa gerar o construtor automaticamente, às vezes essa forma padrão de inicialização não atende completamente às nossas necessidades.

Por exemplo, temos uma estrutura `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

De acordo com o construtor gerado automaticamente pelo sistema, ao criar uma instância precisamos passar esses três parâmetros ao mesmo tempo:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Mas se agora quisermos cadastrar um grupo de filmes antigos e soubermos apenas o nome do filme, sem saber o diretor e a nota, isso se torna um pouco inconveniente.

Porque então só podemos escrever assim:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Embora isso funcione, repetir `--` toda vez não é prático.

Nesse momento, podemos escrever um construtor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Dessa forma, ao criar filmes antigos, só precisamos passar `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Esse é um dos significados de escrever o construtor por conta própria: **fazer com que a forma de criar instâncias corresponda melhor às necessidades reais.**

### Analisando um construtor personalizado

Vamos olhar para este construtor escrito à mão agora há pouco:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

O significado desse código é que, ao criar uma instância de `Movie`, só precisamos passar um único parâmetro, `name`.

Depois, dentro do construtor, o `name` passado será atribuído ao `name` da própria instância, e `director` e `rating` receberão o valor padrão `--`.

Aqui, `self` significa "esta própria instância atual".

Por exemplo:

```swift
self.name = name
```

O `self.name` do lado esquerdo representa a propriedade da instância; o `name` do lado direito representa o parâmetro que passamos.

Isso pode ser entendido de forma simples como salvar, na propriedade da própria instância, o valor passado de fora.

Quando todas as propriedades recebem valores, a criação dessa instância está concluída.

### Mecanismo do construtor

Quando declaramos explicitamente um construtor, acontece também outra mudança:

o construtor que o sistema gerava automaticamente antes normalmente já não pode mais ser usado diretamente.

Por exemplo:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Agora, se escrevermos novamente assim:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

o compilador mostrará um erro:

```swift
Extra arguments at positions #2, #3 in call
```

Isso significa: você passou parâmetros extras.

Por que esse erro aparece?

Porque, na estrutura `Movie` atual, existe apenas esse único construtor que você declarou manualmente:

```swift
init(name: String)
```

Ele aceita apenas um parâmetro, `name`, e não aceita `director` nem `rating`.

Ou seja, depois que você adiciona o seu próprio construtor manualmente, a forma de inicialização que antes era gerada automaticamente já não pode mais ser usada diretamente.

Se quisermos suportar tanto "passar apenas o nome" quanto "passar as informações completas", então precisamos adicionar nós mesmos mais um construtor completo:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Dessa forma, passamos a ter dois construtores diferentes.

Ao criar um filme antigo, podemos escrever assim:

```swift
Movie(name: "The Night of the Hunter")
```

Ao criar um filme novo com informações completas, podemos escrever assim:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Essa forma de escrever também mostra que o mesmo tipo pode ter vários construtores, desde que a forma dos seus parâmetros seja diferente.

## O que é overload

Aqui vamos acrescentar mais um ponto de conhecimento necessário.

Agora há pouco escrevemos dois `init` para `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Essa forma de escrever, "o mesmo nome de função, mas parâmetros diferentes", é chamada de "overload".

Aqui, as duas funções se chamam `init`, mas como recebem parâmetros diferentes, o Swift consegue distinguir qual função você está chamando.

Por exemplo:

```swift
Movie(name: "Days of Heaven")
```

vai chamar:

```swift
init(name: String)
```

Enquanto:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

vai chamar a outra versão completa do método de inicialização.

Portanto, o papel do overload é: permitir que o mesmo tipo ofereça diferentes formas de criação de acordo com diferentes situações.

## Conhecendo class

Em seguida, vamos conhecer brevemente também `class`.

Além do comum `struct` em Swift, muitas linguagens de programação usam `class` para criar instâncias, como Java, C#, Kotlin e outras.

Em Swift, a forma de escrever `class` é muito próxima da de `struct`.

Por exemplo:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Você vai notar que, exceto pela mudança da palavra-chave de `struct` para `class`, as outras partes parecem quase iguais.

A forma de criar uma instância também é muito semelhante:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Portanto, no nível da sintaxe, `struct` e `class` realmente são muito parecidos.

### Diferença entre Struct e Class

Embora `struct` e `class` pareçam muito semelhantes, eles não são exatamente a mesma coisa.

**1. O modo de inicialização é diferente**

Para `struct`, se não escrevermos um construtor manualmente, o sistema normalmente gera automaticamente um método de inicialização adequado.

Mas para `class`, se houver propriedades que ainda não têm valor padrão, normalmente precisamos escrever `init` manualmente; caso contrário, ocorrerá um erro.

Por exemplo:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Essa `class` causará um erro porque não tem construtor, então suas propriedades não são inicializadas.

O compilador mostrará algo como:

```swift
Class 'Movie' has no initializers
```

Por isso, neste exemplo, `class` precisa obrigatoriamente de um construtor escrito manualmente.

**2. `struct` é um value type, `class` é um reference type**

`struct` é um value type, e `class` é um reference type.

Na fase inicial do aprendizado, não é necessário dominar completamente esses dois conceitos; basta ter uma compreensão simples deles.

Por exemplo, `struct` é mais parecido com "copiar um novo valor".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Aqui, depois de atribuir `user1` a `user2`, é como se uma nova cópia dos dados fosse criada, então modificar `user2` não afeta `user1`.

Por outro lado, `class` é mais parecido com "apontar juntos para a mesma instância".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Aqui, `user1` e `user2` apontam para a mesma instância.

Neste momento, ainda não precisamos entender completamente o mecanismo interno de value type e reference type; basta saber que `struct` é mais adequado para guardar dados independentes, enquanto `class` é mais adequado quando vários lugares precisam compartilhar a mesma instância.

## Como escolher na fase inicial

No estágio atual, para modelos de dados comuns, vale a pena considerar primeiro `struct`; quando forem necessários dados compartilhados e mudanças sincronizadas, então vale a pena considerar `class`.

Isso não é uma regra absoluta, mas para iniciantes é uma forma de julgamento suficientemente prática.

Especialmente em SwiftUI, muitas vezes você vai perceber que `struct` já consegue realizar a maior parte do trabalho.

Além disso, em muitos materiais de programação, o que é criado por `class` também é chamado de "objeto". Na fase inicial, você pode simplesmente entender isso como uma instância, sem necessidade de fazer uma distinção deliberada.

## Resumo

Nesta aula, estudamos `struct` com mais profundidade e, ao mesmo tempo, também conhecemos `class`; ambos podem ser usados para definir tipos.

Tipos podem criar instâncias. Quando uma instância é criada, o construtor, isto é, `init`, é chamado.

Para `struct`, se não escrevermos um construtor manualmente, o sistema normalmente gera automaticamente um construtor adequado. Se o construtor padrão não atender às necessidades, também podemos escrever um construtor por conta própria.

Além disso, também tivemos uma compreensão inicial da diferença entre `struct` e `class`: `struct` é um value type, enquanto `class` é um reference type. Em SwiftUI, na fase inicial, normalmente o que se encontra com mais frequência é `struct`.

Mais tarde, quando estudarmos a passagem de valores entre views, modelos de dados e gerenciamento de estado, todo esse conteúdo continuará sendo usado.
