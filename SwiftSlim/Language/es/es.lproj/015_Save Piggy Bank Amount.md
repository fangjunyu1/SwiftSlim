# Guardar la cantidad de la hucha

En la lección anterior implementamos una “hucha” sencilla. En esta lección aprenderemos cómo hacer que la cantidad de la “hucha” se guarde de forma persistente.

En esta lección estudiaremos principalmente `UserDefaults` y el property wrapper `@AppStorage`, y además ampliaremos el tema explicando el uso de `onAppear` y de los tipos opcionales (`nil`).

Hay que tener en cuenta que esta lección continúa sobre el código de la “hucha” desarrollado en la lección anterior.

## Problema del guardado persistente

Ahora, la interfaz de la “hucha” es muy simple y también muy cómoda de usar.

![Piggy Bank](../../Resource/014_view.png)

Pero hay un problema evidente: cada vez que la vista se refresca o se cierra la app, la cantidad total de la “hucha” vuelve a `0`, y el importe anterior se pierde por completo.

Esto significa que los datos no se han guardado realmente. Dicho de otra manera, la “hucha” actual solo puede guardar datos temporales.

### ¿Por qué no se guarda de forma persistente?

Esto se debe a que usamos una variable declarada con `@State`:

```swift
@State private var amount = 0
```

La vida de una variable declarada con `@State` depende completamente de la vista.

Cuando la vista se crea, `amount` se inicializa en `0`; cuando la vista se destruye, `amount` también desaparece.

Los datos guardados en `amount` existen solo en memoria, y no se almacenan en el dispositivo.

Como no queremos que `amount` esté ligado al ciclo de vida de la vista, necesitamos implementar almacenamiento persistente de datos. Es decir, guardar los datos en el dispositivo.

### Qué es la “persistencia de datos”

Podemos entender la persistencia de datos como guardar la información desde la “memoria temporal” al “almacenamiento del dispositivo”.

De ese modo, cuando se cierra la vista o la aplicación, los datos no se pierden.

En el desarrollo con Swift, una persistencia sencilla puede lograrse con `UserDefaults`; para datos más complejos, normalmente se usan `SwiftData` o `CoreData`.

En esta lección empezaremos con lo más simple: `UserDefaults`.

## UserDefaults

`UserDefaults` se usa para guardar datos ligeros en forma de clave-valor, como `String`, `Int`, `Double`, `Bool` y otros tipos básicos.

### Guardar datos

`UserDefaults` usa el método `set` para guardar datos:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

El primer parámetro representa el dato que queremos guardar, como un `String` o un `Int`.

El segundo parámetro, `forKey`, funciona de forma parecida al nombre de una variable y sirve para identificar el dato guardado en `UserDefaults`.

### Leer datos

`UserDefaults` usa métodos distintos según el tipo para leer los datos:

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")     // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")    // true
```

Al leerlos, debes usar el método que corresponde al tipo. Si no lo haces, pueden aparecer errores o el resultado puede ser incorrecto.

### Puntos importantes sobre UserDefaults

#### 1. Devolver un tipo opcional

Al leer datos con `UserDefaults`, algunos métodos devuelven un tipo opcional (`Optional`).

Por ejemplo:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

El tipo que devuelve `name` es:

```swift
String?
```

Esto significa que puede tener un valor, o puede no tenerlo.

**¿Por qué devuelve un tipo opcional?**

Porque no siempre existe un dato guardado para una determinada `Key` dentro de `UserDefaults`.

Por ejemplo:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Si nunca se guardó antes una `Key` llamada `"City"`, el resultado será:

```swift
nil
```

Hay que remarcar que `nil` significa “no hay datos”, y no “cadena vacía”.

En la lección sobre “sistema de tipos” ya vimos un caso parecido: cuando una conversión de tipo falla, se obtiene un tipo opcional.

En esta situación, podemos usar `??` para proporcionar un valor por defecto y desempaquetar:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

Si `UserDefaults` encuentra un valor, se usa ese valor; si no encuentra nada (`nil`), se usa el valor por defecto.

#### 2. Devolver un tipo no opcional

Al leer tipos `Int`, `Double` o `Bool`, `UserDefaults` devuelve tipos no opcionales.

Por ejemplo:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")   // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar") // false
```

Incluso si nunca se guardó nada bajo esas `Key`, el valor devuelto no será `nil`.

En su lugar, se devolverán estos valores por defecto:

```text
Int → 0
Double → 0.0
Bool → false
```

#### 3. Límite de cantidad de datos

`UserDefaults` solo es adecuado para guardar pequeñas cantidades de datos, como configuraciones de la aplicación o estados simples.

En la práctica no es apropiado para guardar grandes volúmenes de información ni para datos que se leen y escriben con mucha frecuencia.

## Guardar la cantidad de la “hucha”

Ahora ya podemos usar `UserDefaults` para implementar la lógica de guardado de la cantidad total de la “hucha”.

Cuando el usuario pulsa el botón, la cantidad introducida se suma al total, y después el total se guarda en `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

Con esto ya hemos implementado la lógica de escritura de datos.

## Explicación de la lógica de persistencia

Aunque ya hemos terminado la parte de guardado persistente, al ejecutar la app veremos que cada vez que la vista se refresca o se vuelve a abrir la aplicación, la variable `amount` sigue siendo `0`.

Esto se debe a que:

```swift
@State private var amount = 0
```

En SwiftUI, una variable `@State` se vuelve a inicializar cuando la vista se crea de nuevo.

Aunque el valor de `amount` sí se haya guardado dentro de `UserDefaults`, cuando la vista vuelve a cargarse `amount` se reinicia a `0`.

Eso significa que, por ahora, solo hemos guardado los datos en `UserDefaults`, pero no los hemos restaurado dentro de la vista.

Por eso, cuando la vista se carga, todavía necesitamos leer manualmente el valor guardado en `UserDefaults` y volver a asignarlo a `amount`. Solo así la lógica completa de persistencia quedará terminada.

### Una analogía lógica

Podemos entender este proceso como una “pizarra en el aula”:

Durante la clase, el profesor escribe contenido en la pizarra. Ese contenido es como el estado actual dentro de la vista (`@State`).

Cuando termina la clase, la pizarra se borra para preparar la siguiente. Eso equivale a que la vista se destruya y los datos de `@State` desaparezcan.

Para evitar perder el contenido de la clase, el profesor lo guarda antes en unos apuntes. Esos apuntes equivalen a los datos guardados en `UserDefaults`.

Cuando empieza la siguiente clase, la pizarra vuelve a estar vacía (`@State` se inicializa otra vez), así que el profesor necesita volver a escribir en la pizarra a partir de esos apuntes (leer `UserDefaults`).

Lo importante es entender que la pizarra no recupera automáticamente el contenido anterior. Hay que volver a escribirlo leyendo esos apuntes.

## Leer datos con onAppear

Cuando la vista se muestra, necesitamos leer manualmente el valor guardado en `UserDefaults` y asignarlo a la variable `amount` declarada con `@State`, para que la persistencia sea real.

En SwiftUI podemos usar `onAppear` para ejecutar lógica de inicialización cuando la vista aparece:

```swift
.onAppear {}
```

Ponemos dentro de `onAppear` el código que lee `UserDefaults`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Cuando la vista se crea, `amount` se inicializa en `0`; cuando la vista aparece, se dispara `onAppear`, lee `UserDefaults` y asigna ese valor a `amount`. Así, la vista ya puede mostrar la última cantidad guardada.

Ahora la lógica completa de persistencia de la “hucha” está terminada.

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

SwiftUI proporciona el property wrapper `@AppStorage`, que puede simplificar la lógica de guardado con `UserDefaults`.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` es un encapsulado de `UserDefaults`, y `"amount"` es la `Key` correspondiente en `UserDefaults`.

Cuando la vista se crea, leerá automáticamente el valor desde `UserDefaults`; y cuando la variable cambie, también lo escribirá automáticamente.

Además, admite el mecanismo de actualización de estado de SwiftUI y, al igual que `@State`, hace que la vista se refresque cuando cambian los datos.

Es decir, `@AppStorage` puede encargarse tanto de leer como de guardar, sin necesidad de llamar manualmente a `UserDefaults` ni de usar `onAppear` para leer el valor.

Por eso, podemos sustituir la lógica anterior por `@AppStorage`:

```swift
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

## Resumen

En esta lección aprendimos principalmente los siguientes puntos:

Primero, que `UserDefaults` sirve para guardar datos ligeros. Lo utilizamos para almacenar la cantidad total en el dispositivo. `UserDefaults` ofrece métodos de lectura y escritura, y además requiere manejar correctamente los tipos opcionales en algunos casos.

Segundo, que las variables `@State` solo sirven para gestionar estados temporales dentro de la vista, y su ciclo de vida está ligado al de la propia vista. Cuando la vista se vuelve a crear, `@State` también se reinicializa.

Después, al restaurar datos desde `UserDefaults`, aprendimos a usar `onAppear` para leer esos datos cuando la vista aparece.

Por último, usamos `@AppStorage` para sustituir a `UserDefaults`, permitiendo que la vista lea automáticamente al cargarse y escriba automáticamente cuando los datos cambian, reemplazando así la lógica manual de `UserDefaults + onAppear`.

Gracias a estos conocimientos, ya podemos implementar una forma básica de almacenamiento persistente en una app, haciendo que los datos se conserven.

## Ejercicios después de clase

Ahora la “hucha” ya admite guardar cantidades, pero su funcionalidad aún no está completa.

1. Si el usuario quiere sacar dinero, hace falta diseñar la lógica correspondiente.
2. Si el usuario quiere vaciar la cantidad por completo, también se necesita una lógica de reinicio.
3. Si queremos añadir un nombre a la hucha, también habrá que introducir almacenamiento para datos de tipo `String`.

Puedes seguir mejorando estas funciones a partir de la base actual para hacer la “hucha” más completa.

## Conocimiento ampliado - el problema del valor por defecto en el campo de entrada

Ahora todavía podemos mejorar un poco más la interacción del campo de entrada para que introducir datos sea más cómodo.

![textfield](../../Resource/015_view.png)

En la implementación actual, el valor por defecto del campo es `0`. Eso significa que, cada vez que el usuario quiere introducir una cantidad, primero tiene que borrar el `0` y después escribir el nuevo número. Esa experiencia no es muy cómoda.

Sería mejor que el campo apareciera vacío al principio, en vez de mostrar `0`.

Esto sucede porque `TextField` y `number` tienen un binding bidireccional:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Cuando `number` se inicializa con `0`, el campo de entrada también muestra `0`.

Por eso, necesitamos cambiar `number` a un valor vacío, es decir, `nil`.

```swift
@State private var number = nil
```

En este punto aparecerá un error:

```text
Generic parameter 'Value' could not be inferred
```

Este es justo el caso que vimos en la lección sobre el “sistema de tipos”: cuando una variable no puede deducirse automáticamente, necesitamos declarar explícitamente su tipo.

Como hemos puesto `number = nil`, y `nil` por sí mismo no contiene información de tipo, el compilador no puede saber si esa variable debe ser `String`, `Int` o cualquier otro tipo.

Por eso necesitamos declarar el tipo de `number` de forma explícita:

```swift
@State private var number:Int? = nil
```

Aquí `Int?` significa un tipo opcional (`Optional`), es decir, que `number` puede ser un `Int`, pero también puede ser `nil`.

De esta manera, si lo inicializamos con `nil`, el campo de entrada aparecerá vacío y no mostrará `0`.

### Desempaquetar un tipo opcional

Cuando convertimos `number` en un tipo opcional, el código de cálculo anterior dará error:

```swift
amount += number
```

El mensaje será:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Esto se debe a que ahora `number` puede ser `nil`. Si lo usamos directamente en un cálculo, sería como hacer:

```swift
amount += nil
```

Obviamente, `nil` no puede sumarse a `amount`, por lo que esa operación no es válida.

Por eso, antes de usar un tipo opcional en un cálculo, tenemos que desempaquetarlo.

Aquí podemos usar `??` para dar un valor por defecto:

```swift
amount += number ?? 0
```

Cuando `number` sea `nil`, se usará el valor por defecto `0`; cuando tenga un valor, se usará el número real introducido.

Así no solo garantizamos que el cálculo sea correcto, sino que además conseguimos que el campo de entrada esté vacío por defecto, sin que el usuario tenga que borrar manualmente el `0`.

## Código ampliado

```swift
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
