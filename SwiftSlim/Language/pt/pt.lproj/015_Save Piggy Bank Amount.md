# Salvar o valor do cofrinho

Na aula anterior, implementamos um “cofrinho” simples. Nesta aula, vamos aprender como persistir o valor do “cofrinho”.

Esta aula aborda principalmente `UserDefaults` e o property wrapper `@AppStorage`, além de estender a explicação sobre a função de `onAppear` e a forma de usar tipos opcionais (`nil`).

É importante observar que esta aula precisa continuar usando o código do “cofrinho” desenvolvido na aula anterior.

## Problema de persistência de dados

Agora, a interface do “cofrinho” está muito simples e também muito prática de usar.

![Piggy Bank](../../Resource/014_view.png)

No entanto, existe um problema evidente: sempre que a view é recarregada ou o app é fechado, o valor total do “cofrinho” volta para `0`, e todo o valor acumulado anteriormente é perdido.

Isso significa que os dados não estão realmente salvos. Em outras palavras, o “cofrinho” atual só consegue guardar dados temporários.

### Por que não é possível persistir os dados?

Isso acontece porque usamos uma variável declarada com `@State`:

```swift
@State private var amount = 0
````

A vida útil de uma variável declarada com `@State` depende completamente da view.

Quando a view é criada, `amount` é inicializado com `0`; quando a view é destruída, `amount` também é destruído.

Os dados armazenados em `amount` existem apenas na memória e não são salvos no dispositivo.

Se não queremos que `amount` fique vinculado ao ciclo de vida da view, precisamos implementar persistência de dados. Ou seja, salvar esses dados no dispositivo.

### O que é “persistência de dados”

Persistência de dados pode ser entendida como salvar dados da “memória temporária” para o “armazenamento do dispositivo”.

Assim, quando a view for fechada ou o app for encerrado, os dados não serão perdidos.

No desenvolvimento com Swift, uma persistência simples pode ser feita com `UserDefaults`; para dados mais complexos, normalmente usamos `SwiftData` ou `CoreData`.

Nesta aula, primeiro vamos aprender o `UserDefaults`, que é a forma mais simples.

## UserDefaults

`UserDefaults` é usado para salvar dados leves em formato de pares chave-valor, sendo comum para armazenar tipos básicos como `String`, `Int`, `Double` e `Bool`.

### Salvar dados

`UserDefaults` usa o método `set` para salvar dados:

```swift id="t63m71"
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

O primeiro parâmetro de `UserDefaults` representa o dado a ser salvo. Aqui, passamos valores de tipos como `String` e `Int`.

O segundo parâmetro, `forKey`, funciona como o nome da variável, sendo usado para identificar os dados salvos no `UserDefaults`.

### Ler dados

`UserDefaults` usa métodos correspondentes para leitura:

```swift id="hn18m4"
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Ao ler, é necessário usar o método correspondente ao tipo correto. Caso contrário, podem ocorrer erros ou dados incorretos.

### Observações sobre UserDefaults

#### 1. Retorno de tipo opcional

Ao ler dados com `UserDefaults`, alguns métodos retornam tipos opcionais (`Optional`).

Por exemplo:

```swift id="e1x8ky"
let name = UserDefaults.standard.string(forKey: "name")
```

O tipo retornado por `name` é:

```swift id="49o7k3"
String?
```

Isso significa que pode haver um valor, ou pode não haver valor.

**Por que retorna um tipo opcional?**

Isso acontece porque uma determinada `Key` no `UserDefaults` pode não ter dados correspondentes.

Por exemplo:

```swift id="q8nbu0"
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Se a `Key` `"City"` nunca tiver sido salva antes, o resultado da leitura será:

```swift id="hywqki"
nil
```

É importante destacar que `nil` significa ausência de dados, e não uma string vazia.

Na aula sobre “sistema de tipos”, encontramos uma situação parecida: quando a conversão de tipo falha, um tipo opcional é retornado.

Nesse momento, precisamos usar `??` para fornecer um valor padrão e fazer o desembrulhamento:

```swift id="n0waf5"
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Se o `UserDefaults` conseguir ler os dados, ele usará o valor lido; se não conseguir ler (`nil`), usará o valor padrão.

#### 2. Retorno de tipo não opcional

Quando `UserDefaults` lê tipos `Int`, `Double` e `Bool`, ele retorna tipos não opcionais.

Por exemplo:

```swift id="vsro0e"
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Mesmo que essas `Key` nunca tenham sido salvas antes, o valor retornado não será `nil`.

Em vez disso, será retornado um valor padrão:

```swift id="apj42q"
Int → 0
Double → 0.0
Bool → false
```

#### 3. Limite de volume de dados

`UserDefaults` só é adequado para salvar uma pequena quantidade de dados, como configurações do app e estados simples.

Na prática, não é adequado para salvar grandes volumes de dados ou dados que exigem leitura e escrita frequentes.

## Salvar o valor do “cofrinho”

Agora, podemos usar `UserDefaults` para implementar a lógica de salvar o valor total do “cofrinho”.

Quando o usuário toca no botão, o valor digitado é somado ao total, e então o valor total é salvo no `UserDefaults`.

```swift id="j6pgc9"
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Agora, implementamos a lógica de escrita dos dados.

## Explicação da lógica de persistência

Embora já tenhamos concluído a lógica de gravação da persistência, na execução real você perceberá que sempre que a view é recarregada ou o app é reaberto, a variável `amount` continua sendo `0`.

Isso acontece porque:

```swift id="i83f83"
@State private var amount = 0
```

No SwiftUI, uma variável `@State` é reinicializada quando a view é criada novamente.

Embora o valor de `amount` tenha sido salvo no `UserDefaults`, quando a view é recarregada `amount` ainda será redefinido como `0`.

Isso mostra que, no momento, apenas salvamos os dados no `UserDefaults`, mas não restauramos esses dados na view.

Por isso, quando a view é carregada, ainda precisamos ler manualmente os dados do `UserDefaults` e reatribuir o valor a `amount`, para completar toda a lógica de persistência.

### Analogia lógica

Podemos entender esse processo como um “quadro negro em uma sala de aula”:

Durante a aula, o professor escreve conteúdo no quadro. Esse conteúdo se parece com o estado atual da view (`@State`).

Quando a aula termina, o quadro é apagado para preparar a próxima aula. Isso equivale à destruição da view, quando os dados em `@State` também são limpos.

Para evitar perder o conteúdo ensinado, o professor salva antecipadamente o conteúdo em um material didático. Esse material corresponde aos dados salvos no `UserDefaults`.

Quando a próxima aula começa, o quadro está vazio no início (`@State` inicializado), então o professor precisa reescrever no quadro o conteúdo anterior com base no material didático (ler o `UserDefaults`).

É importante entender que o quadro não restaura sozinho o conteúdo anterior. É necessário “ler o material didático” (ler o `UserDefaults`) para reescrevê-lo.

## Usar onAppear para ler os dados

Quando a view é exibida, precisamos ler manualmente o valor salvo no `UserDefaults` e atribuí-lo à variável `amount` declarada com `@State`, para então realizar a persistência completa dos dados.

No SwiftUI, podemos usar `onAppear` para executar lógica de inicialização quando a view aparece:

```swift id="mxly07"
.onAppear {}
```

Colocando a leitura do `UserDefaults` dentro de `onAppear`:

```swift id="3cdyi9"
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Quando a view é criada, `amount` é inicializado como `0`; quando a view aparece, `onAppear` é acionado, lê o valor salvo no `UserDefaults` e o atribui a `amount`. Assim, a view pode exibir o valor total salvo anteriormente.

Agora, toda a lógica de persistência do “cofrinho” está concluída.

## Código completo

```swift id="wzmbu7"
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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Property wrapper @AppStorage

O SwiftUI oferece o property wrapper `@AppStorage`, que pode simplificar a lógica de salvamento com `UserDefaults`.

```swift id="2yrf5j"
@AppStorage("amount") private var amount = 0
```

`@AppStorage` é um encapsulamento de `UserDefaults`, e `"amount"` corresponde à `Key` do `UserDefaults`.

Quando a view é criada, ele lê os dados do `UserDefaults`; quando a variável muda, ele grava automaticamente no `UserDefaults`.

Ele também oferece suporte ao mecanismo de atualização de estado do SwiftUI e, assim como `@State`, ao ser alterado irá atualizar a view do SwiftUI.

Ou seja, `@AppStorage` pode implementar tanto a leitura quanto a gravação dos dados, sem que seja necessário chamar manualmente `UserDefaults` nem usar `onAppear` para ler os dados.

Portanto, podemos usar `@AppStorage` para substituir o `UserDefaults` no código:

```swift id="zp7irf"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Resumo

Nesta aula, aprendemos principalmente os seguintes pontos:

Primeiro, `UserDefaults` é usado para salvar dados leves. Nós o utilizamos para salvar o valor total no dispositivo. `UserDefaults` oferece métodos de leitura e escrita, e também exige atenção ao lidar com tipos opcionais.

Em seguida, `@State` é usado apenas para gerenciar estados temporários da view, e seu ciclo de vida é o mesmo da view. Quando a view é recriada, `@State` também é reinicializado.

Ao restaurar dados do `UserDefaults`, aprendemos a usar `onAppear` para ler os dados quando a view é exibida, concluindo assim a restauração dos dados.

Por fim, usamos `@AppStorage` para substituir `UserDefaults`, permitindo ler automaticamente os dados quando a view é carregada e gravá-los automaticamente quando os dados mudam, substituindo a lógica manual com `UserDefaults` e `onAppear`.

Com esse conhecimento, já podemos implementar uma funcionalidade básica de armazenamento de dados em um app, permitindo que os dados sejam persistidos.

## Exercício após a aula

Agora, o “cofrinho” já suporta salvar o valor, mas a funcionalidade ainda não está completa.

1. Quando o usuário precisar retirar um valor, será necessário projetar a lógica correspondente de retirada.
2. Quando o usuário quiser limpar o valor acumulado, também será necessário implementar uma lógica de redefinição.
3. Se quisermos adicionar um nome ao cofrinho, também será necessário introduzir o salvamento de dados do tipo `String`.

Você pode continuar melhorando essas funções com base no código atual, deixando o “cofrinho” mais completo.

## Conhecimento extra - problema do valor padrão do campo de entrada

Agora, também podemos otimizar ainda mais a interação do campo de entrada, tornando a digitação mais conveniente.

![textfield](../../Resource/015_view.png)

Na implementação atual, o valor padrão do campo é `0`. Sempre que o usuário quiser inserir um valor, primeiro precisa apagar o `0` e depois digitar o novo número, e essa experiência de uso não é ideal.

O correto é fazer com que o valor inicial do campo fique vazio, em vez de `0`.

Isso acontece porque `TextField` e `number` estão ligados bidirecionalmente:

```swift id="qv0hm5"
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Quando `number` é inicializado como `0`, o campo de entrada também mostra `0`.

Por isso, precisamos mudar `number` para um valor vazio, ou seja, `nil`.

```swift id="t3xt3q"
@State private var number = nil
```

Nesse momento, aparecerá um erro:

```id="04kq7w"
Generic parameter 'Value' could not be inferred
```

Esse é exatamente o caso explicado na aula sobre “sistema de tipos”: quando a variável não pode ter seu tipo inferido automaticamente, precisamos declarar o tipo explicitamente.

Como definimos `number` como `nil`, e `nil` por si só não contém nenhuma informação de tipo, o compilador não consegue determinar se essa variável é `String`, `Int` ou outro tipo, então ocorre erro.

Por isso, precisamos declarar explicitamente o tipo de `number`:

```swift id="vdvifh"
@State private var number:Int? = nil
```

Aqui, `Int?` significa tipo opcional (`Optional`), indicando que o valor de `number` pode ser um `Int` ou `nil`.

Assim, ao inicializá-lo como `nil`, o campo de entrada ficará vazio, em vez de mostrar `0`.

### Desembrulhar tipo opcional

Quando alteramos `number` para um tipo opcional, o código de cálculo original passa a gerar erro:

```swift id="mjlwmr"
amount += number
```

A mensagem exibida é:

```id="gn2ygc"
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Isso acontece porque `number` agora pode ser `nil`. Se ele participar diretamente do cálculo, a situação se torna:

```swift id="37d308"
amount += nil
```

Obviamente, `nil` não pode ser somado com `amount`, então essa operação não é válida.

Por isso, ao usar um tipo opcional em um cálculo, primeiro é preciso fazer o desembrulhamento.

Aqui, podemos usar `??` para fornecer um valor padrão:

```swift id="mkx6np"
amount += number ?? 0
```

Quando `number` for `nil`, usamos o valor padrão `0`; quando `number` tiver valor, usamos o valor real digitado.

Assim, garantimos a correção do cálculo e ao mesmo tempo conseguimos o efeito de deixar o campo de entrada vazio por padrão, sem que o usuário precise apagar manualmente o `0`.

## Código expandido

```swift id="5dvl3e"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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