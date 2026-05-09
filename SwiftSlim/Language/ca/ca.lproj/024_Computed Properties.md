# Propietats calculades

En aquesta lliçó aprendrem principalment les propietats calculades.

Les propietats calculades s'utilitzen per calcular un resultat nou a partir de dades existents. Poden calcular valors numèrics i també contingut que s'ha de mostrar en vistes de SwiftUI.

Per exemple:

```swift
let a = 10
let b = 20
let c = a + b
```

Aquí `c` representa el resultat de sumar `a` i `b`.

En codi normal, aquesta manera d'escriure és molt habitual.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Consell: dins de l'esdeveniment de toc d'un `Button` es pot executar codi Swift normal.

Però si escrivim codi semblant directament dins de les propietats d'una vista SwiftUI, trobarem un problema.

Per exemple:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Aquest codi donarà un error.

Sembla que `a` i `b` ja estan escrits abans de `c`, com si es pogués calcular el valor de `c`.

Però dins de la declaració de propietats d'una estructura, aquesta escriptura no es pot utilitzar directament.

## Per què c no pot calcular directament a + b

Perquè `a`, `b` i `c` no són constants temporals dins de l'esdeveniment de toc d'un botó, sinó propietats de la vista `ContentView`.

Dins de l'esdeveniment de toc del botó, aquest codi es pot executar normalment:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Perquè després de tocar el botó, el codi s'executa en ordre. Primer es crea `a`, després es crea `b` i finalment es calcula `c` amb `a + b`.

Però quan declarem propietats dins d'una vista, la situació és diferent:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Aquí `a`, `b` i `c` són totes propietats de la vista `ContentView`.

Quan es crea la vista `ContentView`, Swift primer ha de preparar aquestes propietats. Per garantir que el procés de creació sigui segur, Swift no permet que el valor per defecte d'una propietat emmagatzemada d'una instància llegeixi directament altres propietats de la mateixa instància.

Per això aquesta línia donarà un error:

```swift
let c = a + b
```

Ho podem entendre de manera senzilla així: **quan declarem propietats dins d'una vista, no podem utilitzar directament una propietat normal per calcular una altra propietat normal.**

Una propietat que desa directament un valor s'anomena "propietat emmagatzemada". Per facilitar la comprensió, també la podem entendre temporalment com una propietat normal.

Per exemple:

```swift
let a = 10
```

`a` desa `10`.

```swift
let b = 20
```

`b` desa `20`.

Però:

```swift
let c = a + b
```

Aquí `c` no és un valor escrit directament, sinó que volem calcular-lo amb `a + b`.

Per a aquest tipus de situació, "obtenir un resultat a partir de dades existents", és més adequat utilitzar una propietat calculada.

Es pot modificar així:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Aquí `c` és una propietat calculada.

```swift
var c: Int {
    return a + b
}
```

Vol dir: **quan calgui utilitzar `c`, llegeix `a` i `b` en aquell moment i retorna el resultat de `a + b`.**

Per exemple:

```swift
Text("c: \(c)")
```

Quan `Text` mostra `c`, és llavors quan s'activa el càlcul de `c`.

## Què és una propietat calculada?

Una propietat calculada sembla una variable, però ella mateixa no emmagatzema dades.

Per exemple:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Aquí `c` és una propietat calculada.

No desa un valor fix com una propietat normal, sinó que cada vegada que es llegeix `c`, torna a executar el codi dins de `{}` i retorna el resultat del càlcul.

Ho podem entendre així:

```swift
var c: Int {
    return a + b
}
```

Quan cal utilitzar `c`, es calcula `a + b`.

Per tant, una propietat calculada és adequada per a aquesta situació: **un resultat no necessita desar-se per separat, sinó que es pot calcular a partir de dades existents.**

## Escriptura bàsica

Una propietat calculada normalment conté tres parts:

```swift
var c: Int {
    return a + b
}
```

### 1. Declarar amb `var`

```swift
var c
```

Una propietat calculada s'ha de declarar amb `var`; no es pot utilitzar `let`.

Perquè una propietat calculada no és un valor fix emmagatzemat, sinó un resultat que es calcula dinàmicament cada vegada que es llegeix.

### 2. Indicar el tipus retornat

```swift
var c: Int
```

Una propietat calculada ha d'indicar el tipus que retorna.

Aquí `c` finalment retornarà un enter, així que el tipus és `Int`.

### 3. Utilitzar {} per escriure la lògica de càlcul

```swift
{
    return a + b
}
```

Dins de `{}` s'escriu la lògica de càlcul; aquí es retorna `a + b`.

## La paraula clau return

Una propietat calculada ha de retornar un resultat.

Per exemple:

```swift
var c: Int {
    return a + b
}
```

Aquí `return` vol dir: retorna cap a fora el resultat del càlcul `a + b`.

Si la propietat calculada només conté una expressió que produeix directament el resultat, es pot ometre `return`:

```swift
var c: Int {
    a + b
}
```

Però si la propietat calculada conté diverses línies de codi, cal utilitzar `return` per indicar clarament quin resultat es retorna.

Per exemple:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Aquí el procés de càlcul es divideix en dos passos.

Primer pas, calculem primer el preu total:

```swift
let total = count * price
```

Segon pas, unim el preu total en un text i el retornem:

```swift
return "Total: \(total) $"
```

Si traiem `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total: \(total) $"
}
```

Aquest codi donarà un error.

La raó és: **aquesta propietat calculada ja conté diverses línies de codi, i Swift ja no pot determinar automàticament quina línia és el resultat final que s'ha de retornar.**

Per tant, quan una propietat calculada només té una línia de resultat, es pot ometre `return`.

```swift
var c: Int {
    a + b
}
```

Quan una propietat calculada té diverses línies de codi, es recomana escriure clarament `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

## Diferència entre propietats calculades i propietats normals

Una propietat normal emmagatzema dades.

```swift
var c = 30
```

Aquí `c` desa un valor concret: `30`.

Una propietat calculada no emmagatzema dades.

```swift
var c: Int {
    a + b
}
```

Aquí `c` no desa `30`. Només proporciona una manera de calcular.

Quan es llegeix `c`, Swift executa:

```swift
a + b
```

i després retorna el resultat del càlcul.

Per tant, les propietats calculades són adequades per a situacions en què el resultat es calcula a partir d'altres dades.

## body també és una propietat calculada

Després d'aprendre les propietats calculades, podem tornar a entendre un dels fragments més habituals de SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Aquí `body` també és una propietat calculada.

Es declara amb `var`:

```swift
var body
```

Té un tipus retornat:

```swift
some View
```

Dins de `{}` retorna contingut d'una vista SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Per tant, `body` es pot entendre així: quan SwiftUI necessita mostrar aquesta vista, llegeix `body` i genera la interfície segons el contingut que `body` retorna.

Si escrivim `return`, ho podem entendre així:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Però a SwiftUI normalment ometem `return` i escrivim directament:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Quan les dades `@State` canvien, SwiftUI tornarà a llegir `body` i actualitzarà la interfície segons les dades noves.

Per exemple:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("comptador: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Després de tocar el botó, `count` canviarà.

```swift
count += 1
```

Quan `count` canvia, SwiftUI torna a calcular `body`, així que el text de la interfície també s'actualitza.

```swift
Text("comptador: \(count)")
```

Aquesta és també la raó per la qual, a SwiftUI, la interfície es pot actualitzar automàticament després que canviïn les dades.

### No es recomana escriure càlculs complexos dins de body

Com que `body` és una propietat calculada, pot ser llegida i recalculada moltes vegades.

Per exemple:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("número: \(num)")
            Text("nom: \(name)")
        }
    }
}
```

Quan `name` canvia, SwiftUI tornarà a calcular `body`.

En aquest moment, el codi dins de `body` també es tornarà a executar, i `num` també es tornarà a crear.

```swift
let num = 10
```

El `num` d'aquest exemple és molt simple, així que l'impacte no és gran.

Però si dins de `body` s'executen càlculs complexos, com filtrar o ordenar una gran quantitat de dades, processar imatges, etc., això pot afectar la fluïdesa de la interfície.

Per tant, a SwiftUI, `body` hauria de ser responsable principalment de descriure l'estructura de la interfície.

Les dades temporals simples es poden escriure dins de `body`.

Els càlculs complexos es poden posar en propietats calculades fora de `body`, en mètodes o en un procés separat de tractament de dades.

## Cas: quantitat i preu total

A continuació, entendrem les propietats calculades amb un exemple senzill.

Suposem que el preu unitari d'una pastanaga és 2 $, l'usuari pot tocar botons per canviar la quantitat comprada i la interfície ha de mostrar el preu total.

La manera de calcular el preu total és:

```
quantitat * preu unitari
```

Si utilitzem una variable normal per desar el preu total, serà una mica molest.

Perquè cada vegada que canviï la quantitat, haurem d'actualitzar manualment el preu total.

Una manera millor és utilitzar una propietat calculada:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("preu: \(price) $")
                Text("quantitat: \(count)")
                Text("preu total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Efecte visual:

![view](../../Resource/024_view.png)

En aquest exemple:

```swift
@State private var count = 1
```

`count` representa la quantitat de pastanagues. Quan es toca el botó, `count` canvia.

```swift
private let price = 2
```

`price` representa el preu unitari de la pastanaga. Aquí és un valor fix, així que utilitzem `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` representa el preu total.

No cal desar-lo per separat, perquè el preu total sempre es pot calcular amb `count * price`.

Quan `count` és `1`:

```swift
totalPrice = 1 * 2
```

El resultat mostrat és:

```swift
preu total: 2 $
```

Després de tocar el botó `+`, `count` passa a ser `2`.

En aquest moment, quan es torna a llegir `totalPrice`, es recalcula:

```swift
totalPrice = 2 * 2
```

El resultat mostrat és:

```swift
preu total: 4 $
```

Aquesta és la funció de les propietats calculades: calcular dinàmicament un resultat nou a partir de dades existents.

## Les propietats calculades es poden utilitzar per fer comprovacions

Les propietats calculades no només poden calcular valors numèrics, sinó que també poden retornar resultats de comprovacions.

Per exemple, quan volem que la quantitat mínima sigui 1.

Quan la quantitat ja és 1, el botó `-` no hauria de continuar disminuint.

Podem afegir una propietat calculada:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Codi complet:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("preu: \(price) $")
                Text("quantitat: \(count)")
                Text("preu total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Efecte visual:

![view](../../Resource/024_view1.png)

Aquí:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Aquest codi indica si actualment es pot continuar disminuint.

Quan `count` és més gran que `1`:

```swift
canDecrease == true
```

vol dir que es pot disminuir.

Quan `count` és igual a `1`:

```swift
canDecrease == false
```

vol dir que no es pot continuar disminuint.

### Comprovació condicional dins del botó

El botó utilitza:

```swift
if canDecrease {
    count -= 1
}
```

Només quan `canDecrease` s'avalua com a `true`, es pot disminuir `count`.

### Controlar el color de primer pla de la vista

També podem utilitzar `canDecrease` per controlar el color de primer pla del botó:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aquí s'utilitza l'operador ternari:

```swift
canDecrease ? Color.primary : Color.gray
```

El significat d'aquest codi és: si `canDecrease` és `true`, el color de primer pla utilitza `Color.primary`; si `canDecrease` és `false`, el color de primer pla utilitza `Color.gray`.

`Color.primary` és un color semàntic del sistema proporcionat per SwiftUI, que representa el color principal del text a la interfície actual.

En mode clar, `Color.primary` normalment s'apropa al negre; en mode fosc, `Color.primary` normalment s'apropa al blanc.

Per tant, l'avantatge d'utilitzar `Color.primary` és que s'adapta automàticament al mode clar i al mode fosc.

### Controlar l'estat desactivat de la vista

`disabled` s'utilitza per controlar si una vista està en estat desactivat:

```swift
.disabled(!canDecrease)
```

Quan `disabled` és `false`, la vista es pot tocar.

Quan `disabled` és `true`, la vista està desactivada i no es pot tocar.

Aquí utilitzar `canDecrease` com a condició fa que el codi sigui més fàcil d'entendre.

Quan veiem `canDecrease`, sabem que representa "si actualment es pot continuar disminuint".

### Nota addicional: per què hi ha dues comprovacions?

Dins del botó `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aquí s'utilitza tant `.disabled(!canDecrease)` com `if canDecrease` dins del botó.

`.disabled(!canDecrease)` s'encarrega de desactivar el botó des de la interfície, perquè l'usuari no el pugui tocar.

`if canDecrease` s'encarrega de comprovar-ho una altra vegada abans d'executar el codi, i només executa `count -= 1` quan es pot disminuir.

Això és una doble protecció. En desenvolupament real, si el botó ja està desactivat, la comprovació interna es pot ometre; però en un exemple didàctic la mantenim perquè el paper de `canDecrease` sigui més clar.

## Resum

En aquesta lliçó hem après principalment les propietats calculades.

Una propietat calculada no desa directament un valor, sinó que, quan es llegeix, calcula un resultat a partir de dades existents.

Per exemple:

```swift
var c: Int {
    a + b
}
```

Aquí `c` no cal desar-la per separat, perquè es pot calcular amb `a + b`.

Una propietat calculada s'ha de declarar amb `var` i ha d'indicar el tipus retornat.

```swift
var canDecrease: Bool {
    count > 1
}
```

Les propietats calculades no només poden retornar valors numèrics, sinó també resultats de comprovacions, contingut de text i fins i tot contingut de vistes SwiftUI.

En aquesta lliçó també hem après `return`.

`return` significa retornar un resultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Si una propietat calculada només conté una expressió que produeix directament el resultat, es pot ometre `return`.

```swift
var totalPrice: Int {
    count * price
}
```

A més, també hem conegut `Color.primary` i `disabled`.

`Color.primary` és un color semàntic del sistema de SwiftUI i ajusta automàticament l'efecte visual segons el mode clar i el mode fosc.

```swift
.foregroundStyle(Color.primary)
```

`disabled` s'utilitza per controlar si una vista està desactivada.

```swift
.disabled(true)
```

Vol dir desactivada, no es pot tocar.

```swift
.disabled(false)
```

Vol dir disponible, es pot tocar.

Per això les propietats calculades són molt habituals a SwiftUI. Ens poden ajudar a organitzar més clarament els resultats de càlcul, les condicions de comprovació i el contingut que es mostra.
