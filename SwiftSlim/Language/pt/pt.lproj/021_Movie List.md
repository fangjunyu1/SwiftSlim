# Lista de Filmes

Nesta aula, vamos criar uma lista de filmes.

![movie](../../Resource/021_movie.png)

A lista exibirá o pôster, o nome, o diretor e a classificação de cada filme.

Neste exemplo, vamos aprender um conceito muito importante: a estrutura `struct`. Ela pode nos ajudar a combinar várias informações de um filme em um único conjunto. Além disso, também vamos trabalhar com `UUID()`, `ForEach`, o separador `Divider` e como usar objetos personalizados para gerenciar dados.

Essas ideias são muito comuns no desenvolvimento com SwiftUI mais adiante. Depois de concluir esta aula, você não só conseguirá criar uma lista de filmes, como também começará a entender "como exibir um conjunto de dados como uma interface".

## Filme Individual

Podemos começar criando a interface de um único filme.

![movie](../../Resource/021_movie1.png)

O layout dessa interface é composto principalmente por duas partes: o pôster do filme à esquerda e a introdução do filme à direita.

### Pôster do Filme

O lado esquerdo mostra o pôster do filme, e podemos usar `Image` para exibir a imagem.

Por exemplo:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Esse código significa que uma imagem chamada `"The Shawshank Redemption"` será exibida.

Um ponto importante aqui é que o nome da imagem precisa realmente existir na pasta de recursos `Assets`. Caso contrário, a interface não conseguirá exibir essa imagem corretamente.

![movie](../../Resource/021_movie2.png)

As funções desses modificadores são:

- `resizable()` significa que a imagem pode ter seu tamanho ajustado.
- `scaledToFit()` significa que a proporção original é mantida durante o redimensionamento para evitar que a imagem seja esticada ou deformada.
- `frame(height: 180)` significa que a altura da imagem é definida como 180.
- `cornerRadius(10)` significa que a imagem recebe cantos arredondados com raio de 10.

Dessa forma, podemos obter um pôster de filme com tamanho adequado e cantos arredondados.

![movie](../../Resource/021_movie3.png)

### Introdução do Filme

O lado direito mostra a introdução do filme, incluindo o nome do filme, o diretor e a classificação.

![movie](../../Resource/021_movie4.png)

Podemos usar `Text` para exibir essa parte:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Nesse código, `.font` representa o tamanho da fonte e `.fontWeight` representa o peso da fonte.

Para deixar mais claro o espaçamento entre "nome do filme", "informações do diretor" e "informações da classificação", usamos `VStack` no nível mais externo e definimos:

```swift
spacing: 10
```

Isso significa que o espaço entre cada grupo de conteúdo dentro desse `VStack` é 10.

O motivo de o diretor e a classificação usarem cada um mais um `VStack` é que ambos pertencem a uma estrutura do tipo "título + conteúdo". Por causa disso, a hierarquia da interface fica mais clara e também é mais conveniente continuar ajustando o estilo depois.

Além disso, `VStack` é centralizado por padrão. Para alinhar todo o texto à esquerda, definimos:

```swift
alignment: .leading
```

Isso faz com que a seção de introdução do filme pareça mais organizada.

### Divisor

Agora, embora o conteúdo da introdução do filme já tenha sido separado usando `spacing`, os limites entre as diferentes partes do conteúdo ainda não estão claros o suficiente.

Nesse momento, podemos adicionar um divisor:

```swift
Divider()
```

Por exemplo:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Isso dá à seção de introdução do filme um efeito de separação mais evidente.

![movie](../../Resource/021_movie4.png)

`Divider` é uma view muito simples, mas bastante usada, cuja função é separar conteúdos diferentes.

Em `VStack`, `Divider()` é exibido como uma linha horizontal.

Em `HStack`, `Divider()` é exibido como uma linha vertical.

Além disso, também podemos modificar o estilo de `Divider` por meio de métodos como `.frame`, `.background` e `.padding`.

Por exemplo:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Isso cria uma linha divisória azul com espessura 2 e preenchimento horizontal dos dois lados.

![divider](../../Resource/021_divider.png)

### Interface Completa

Por fim, podemos usar `HStack` para organizar o pôster do filme e a introdução do filme lado a lado.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Aqui, `HStack(spacing: 20)` significa que há um espaçamento de 20 entre as seções esquerda e direita.

É importante observar que `Divider()`, assim como `TextField` e `Slider` que discutimos anteriormente, tenta ocupar o máximo possível do espaço disponível por padrão.

Portanto, definimos uma largura fixa para o `VStack` externo da seção de introdução à direita:

```swift
.frame(width: 200)
```

Isso mantém a largura da linha divisória e da área de texto consistente, fazendo com que o layout geral pareça mais limpo.

Neste ponto, concluímos a interface de exibição de um "filme individual".

![movie](../../Resource/021_movie1.png)

## Armazenar Filmes em um Array

Se quisermos exibir vários filmes um após o outro no mesmo estilo, isso significa que precisaríamos escrever código semelhante para cada filme.

Por exemplo:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Embora um código escrito dessa forma possa alcançar o resultado, ele ficará cada vez maior e será muito trabalhoso de manter.

Por exemplo, se precisarmos alterar o espaçamento de todos os filmes de `20` para `15`, ou alterar a largura do lado direito de `200` para
`220`, precisaríamos editar manualmente cada bloco repetido de código.

Obviamente, esse não é um método eficiente.

Já aprendemos sobre arrays, e também aprendemos a usar `ForEach` para exibir views repetidamente com base em um array.

Por exemplo:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Essa abordagem é muito adequada para lidar com casos em que há "apenas um tipo de dado", como um grupo de nomes de imagens.

No entanto, um filme não tem apenas um valor. Ele contém pelo menos:

1. o pôster do filme
2. o nome do filme
3. o diretor
4. a classificação

Em outras palavras, um filme é, na verdade, um conjunto de dados relacionados, e não apenas uma única string.

Se usarmos apenas arrays, só poderemos armazenar essas informações separadamente:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Ao exibi-las, precisamos depender do mesmo índice para associá-las uma a uma:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

O problema dessa abordagem é que o custo de manutenção é muito alto.

Como os dados de um filme ficam divididos em vários arrays, basta que um array tenha um item a mais, um item a menos ou uma ordem diferente para que o resultado exibido fique errado.

Especialmente ao adicionar ou remover filmes, você precisa atualizar vários arrays ao mesmo tempo, e é muito fácil esquecer algo.

Então, como podemos combinar informações como "nome do filme, diretor e classificação" em um único conjunto?

Isso exige o uso de `struct`.

## Definir uma Estrutura struct

Em Swift, `struct` significa "estrutura".

Você pode pensar nela como um "tipo de dado personalizado" que pode combinar vários campos relacionados em um único conjunto.

Uso básico:

```swift
struct StructName {
	let name: String
}
```

Nesse código, `struct` é a palavra-chave que indica que estamos definindo uma estrutura. `StructName` é o nome da estrutura.

O conteúdo dentro das chaves é o conjunto de campos contidos nessa estrutura, e cada campo precisa incluir claramente um nome e um tipo.

Normalmente, o nome de uma `struct` começa com letra maiúscula, como `Movie`, `Student` ou `UserInfo`. Essa é uma convenção de nomenclatura comum em Swift.

Você pode simplesmente pensar em `struct` como uma caixa vazia, em que cada campo é como uma posição reservada dentro da caixa.

Quando essas posições ainda não foram preenchidas, ela é apenas uma caixa vazia. Só depois que todos os campos forem preenchidos com valores adequados é que ela se torna uma caixa de presente completa.

### Instância de struct

Antes, definimos apenas a própria estrutura, o que equivale a preparar o formato da caixa.

Ainda precisamos preencher o conteúdo real para obter uma "instância" verdadeira que possa ser usada.

Ao criar uma instância, normalmente adicionamos `()` após o nome da estrutura:

```swift
StructName(...)
```

O que é preenchido entre parênteses é o conteúdo dos campos exigidos por essa estrutura.

Por exemplo:

```swift
StructName(name: "Fang Junyu")
```

Esse código significa: criar uma nova instância de acordo com o formato da estrutura `StructName` e atribuir o valor `"Fang Junyu"` ao campo `name`.

Quando preenchemos todos os valores de campo necessários, é como encher a caixa.

Nesse momento, obtemos uma instância completa da estrutura.

### Acessar Propriedades de struct

Depois de criar uma instância, podemos usar a sintaxe com ponto para acessar as propriedades dentro dela.

Sintaxe básica:

```swift
instance.propertyName
```

Por exemplo:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Aqui, `st` é uma instância da estrutura, e `st.name` significa ler o valor de `name` dessa instância.

Você pode entender esse método de leitura assim: quando escrevemos `st.name`, é como ler o conteúdo armazenado em uma determinada posição dentro daquela caixa.

Esse estilo de escrita será muito comum nas interfaces SwiftUI posteriores.

Por exemplo, se tivermos uma estrutura de estudante que inclui nome, idade e turma, ao exibi-la na interface podemos ler:

```swift
student.name
student.age
student.className
```

A vantagem de fazer isso é que os dados ficam mais claros e mais fáceis de gerenciar.

### Posição de struct

Para iniciantes, a estrutura geralmente pode ser escrita fora de `ContentView`.

Por exemplo:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Isso torna a estrutura mais clara e mais fácil de ler.

Você perceberá que o próprio `ContentView` também é, na verdade, uma `struct`.

### Estrutura Movie

Com a base acima, podemos definir uma estrutura de filme:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Essa é uma estrutura chamada `Movie`, composta pelos três campos `name`, `director` e `rating`, que representam o nome do filme, o diretor e a classificação.

Dessa forma, as informações relacionadas a um filme não precisam mais ser divididas em vários arrays, mas podem ser combinadas diretamente em um único conjunto.

Por exemplo, podemos criar uma instância de filme assim:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Essa instância representa "um conjunto completo de dados de filme".

### Armazenar Estruturas em um Array

Antes, dissemos que um array pode armazenar apenas um tipo.

Agora que já temos a estrutura `Movie`, o array pode armazenar vários valores `Movie`.

```swift
let lists: [Movie] = []
```

Por exemplo:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Nesse array `lists`, o que é armazenado não são strings, mas várias instâncias de `Movie`.

Ou seja, cada elemento do array é um filme completo.

Dessa forma, quando precisarmos exibir a lista de filmes, podemos usar `ForEach` para ler cada filme um por um.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Aqui, `movie in` significa que, em cada loop, um filme é retirado do array e temporariamente chamado de `movie`.

Então, podemos usar:

```swift
movie.name
movie.director
movie.rating
```

para ler respectivamente o nome, o diretor e a classificação desse filme, e exibi-los na interface.

## Erro de ForEach

Neste ponto, já concluímos o estilo básico de escrita do array de filmes e de `ForEach`.

No entanto, se você executar diretamente o código a seguir:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

você receberá um erro:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

O significado desse erro é que, quando você escreve `id: \.self`, o SwiftUI precisa tratar cada elemento do array como um "identificador único" para poder distingui-los.

Esse estilo de escrita é adequado para tipos simples como `String` e `Int`, porque eles são mais fáceis de distinguir por si mesmos.

Mas `Movie` é uma estrutura personalizada definida por nós, e `ForEach` não sabe como tratar a própria estrutura como um identificador único, então ele relata um erro.

A forma mais comum de resolver esse problema é fazer `Movie` conformar ao protocolo `Identifiable`.

## Protocolo

Em Swift, um protocolo pode ser entendido como um tipo de "regra" ou "requisito".

Você pode pensar nele como um acordo em uma organização internacional: se um país quiser entrar em determinada organização internacional, normalmente ele precisa primeiro satisfazer algumas regras propostas por essa organização, divulgar alguns dados e seguir algumas regras comuns. Só depois de cumprir essas condições ele pode entrar ou participar de certos assuntos.

Os protocolos funcionam de maneira parecida.

Quando um tipo quer conformar a determinado protocolo, ele precisa satisfazer o conteúdo exigido por esse protocolo. Só depois de cumprir esses requisitos esse tipo pode usar a funcionalidade correspondente.

Sintaxe básica:

```swift
struct Movie: Identifiable {
    // ...
}
```

Aqui, `: Identifiable` significa que `Movie` conforma ao protocolo `Identifiable`.

Se um tipo conforma a vários protocolos, eles podem ser separados por vírgulas:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Para `Identifiable`, o requisito mais importante é que o tipo precise de um `id` que possa identificá-lo.

Por exemplo:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Aqui, `id` é como um número de identificação e é usado para distinguir cada filme.

Desde que o `id` de cada filme seja diferente, o SwiftUI pode distinguir corretamente cada elemento do array.

Por exemplo:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Depois use o seguinte em `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Dessa forma, não haverá erro.

Como `Movie` já conforma a `Identifiable`, uma forma mais comum de escrever é omitir diretamente `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Porque o SwiftUI já sabe usar `movie.id` para distinguir cada item.

## O Identificador Distintivo em ForEach

A seguir, vamos entender mais profundamente o papel de `id` em `ForEach`.

Por exemplo:

```swift
ForEach(lists, id: \.self)
```

Isso significa: usar o próprio elemento como identificador distintivo.

E:

```swift
ForEach(lists, id: \.id)
```

significa: usar o campo `id` do elemento como identificador distintivo.

Se determinado campo puder garantir unicidade por si só, ele também pode ser usado temporariamente.

Por exemplo, se cada filme tiver um nome diferente, então o código a seguir também pode funcionar corretamente com os dados atuais:

```swift
ForEach(lists, id: \.name)
```

Mas existe um problema oculto aqui: `name` não é garantidamente único para sempre.

Suponha que, mais tarde, você adicione outro filme com o mesmo nome. Então `name` não conseguirá mais distinguir com precisão cada elemento.

Nesse momento, embora o código ainda possa compilar, o SwiftUI poderá reconhecer os elementos incorretamente durante atualizações da view, inserções, exclusões ou modificações, causando problemas de exibição.

Portanto, quando precisamos de uma distinção estável dos dados, ainda é melhor usar o campo realmente único, que é `id`.

## UUID

Embora escrever manualmente `id: 1`, `id: 2` possa resolver o problema, ainda existe um risco: você pode escrever acidentalmente valores de `id` duplicados, e então o identificador único se torna inválido.

Por exemplo:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Isso resulta em dois valores de `id` idênticos, e o identificador único perde seu efeito.

Para evitar erros manuais, normalmente usamos `UUID()`.

Em Swift, `UUID()` gera aleatoriamente um identificador de 128 bits. Ele normalmente é exibido como uma longa string formada por letras e números.

Por exemplo:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Aqui, `UUID()` na verdade cria uma instância do tipo `UUID`. Você pode pensar nele como um "número único" gerado automaticamente.

Por causa disso, os valores criados a cada vez quase nunca se repetem, então eles são muito adequados para uso como `id`.

Podemos modificar `Movie` assim:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Esse código significa que o campo `id` da estrutura `Movie` receberá por padrão uma nova instância de `UUID`.

Em outras palavras, toda vez que criarmos um novo `Movie`, o sistema gerará automaticamente primeiro um `id` único.

Como `id` já tem um valor padrão, não precisamos mais preencher manualmente `id` ao criar instâncias de `Movie` mais tarde.

Por exemplo:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Embora `id` não esteja escrito aqui, a instância do filme ainda possui seu próprio `id`; apenas acontece que esse valor já foi gerado automaticamente por `UUID()`.

Depois de usar esse método, não precisamos mais preencher manualmente `id` para cada filme, o que não só reduz a quantidade de código, mas também evita erros causados por ids duplicados.

Por fim, só precisamos adicionar uma imagem `Banner` no topo e usar `ScrollView` para que o conteúdo possa rolar, e então toda a tela da lista de filmes estará completa.

## Resumo

Nesta aula, aprendemos um conceito muito importante: `struct`.

Por meio de `struct`, podemos combinar vários campos relacionados de um filme em um único conjunto, em vez de dividir nome, diretor e classificação em vários arrays.

Depois que os dados são combinados, podemos usar `ForEach` para exibir cada filme do array um por um na view.

Ao mesmo tempo, também entendemos o papel do "identificador distintivo" em `ForEach`: o SwiftUI precisa saber como distinguir cada elemento do array para poder exibir e atualizar a view corretamente.

Portanto, fizemos `Movie` conformar ao protocolo `Identifiable` e fornecemos a ele um `id` único.

Para evitar erros ao preencher `id` manualmente, aprendemos ainda `UUID()` para que o sistema possa gerar automaticamente o identificador único.

Depois de concluir esta aula, você não só completará a lista de filmes, como também começará a entrar em contato com uma ideia importante do SwiftUI: **organizar os dados primeiro e depois gerar a view com base nesses dados.**

## Código Completo

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
