# Operadors

En aquesta lliçó, aprendrem els operadors (`Operators`) de Swift.

Quan fem càlculs, comparacions o judicis lògics, necessitem utilitzar operadors. Aquestes operacions recorren tots els passos de l'execució del programa i són una de les habilitats més bàsiques de la programació.

```swift
let a = 100 * 8
```

Durant l'aprenentatge de la programació, molta gent descobreix que les persones amb una certa base de pensament matemàtic solen entendre amb més facilitat la lògica dels programes. Això és perquè la programació, en essència, és inseparable del "càlcul" i del "judici de regles", i precisament aquest és el paper central que assumeixen els operadors.

En el desenvolupament real, els operadors no només s'utilitzen per a càlculs numèrics senzills, sinó que també s'apliquen àmpliament en molts escenaris concrets.

Per exemple, en un joc de blocs, quan l'usuari arrossega un bloc fins a una posició determinada, cal calcular:

- La posició de coordenades del bloc
- La posició on el bloc es pot col·locar
- Si la posició de destí és disponible

Aquest procés de "càlcul + judici" depèn essencialment dels operadors.

![Block](../../Resource/013_block.png)

Aprendre operadors no és només aprendre a calcular números, sinó també establir una base per al disseny d'interfícies, el tractament de dades i la lògica d'interacció que veurem més endavant.

## Forma d'executar càlculs a SwiftUI

En SwiftUI, normalment fem servir un `Button` per activar una funció, i després executem la lògica de càlcul dins d'aquesta funció.

Per exemple:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Quan es prem el botó, la consola mostra:

```
c: 20
```

En aquesta lliçó, escriurem tota la lògica de càlcul dins de `func`, l'activarem amb un botó i utilitzarem `print` per mostrar el resultat.

En els exemples posteriors, per simplificar la presentació del codi, indicarem directament els resultats del càlcul dins del mateix codi i no repetirem l'ús de `print`.

## Gestió de la sortida de la consola

Com que cada clic generarà informació de sortida, pots prémer el botó de neteja situat a la part inferior dreta de la zona de Console per esborrar l'historial i veure amb més facilitat el resultat actual.

![Console](../../Resource/013_console.png)

## Una altra manera d'escriure Button

Quan un botó només executa una funció, es pot utilitzar una forma més concisa:

```swift
Button(action: ) {
    // View
}
```

En aquesta sintaxi, `action` especifica la funció que s'ha d'executar en prémer el botó, i les claus `{}` defineixen la vista del botó.

Combinant-ho amb la funció `calculate` anterior, es pot escriure així:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Quan es premi el botó, s'executarà directament la funció `calculate`.

Per tant, quan la lògica del botó és senzilla i només cal cridar una funció, la forma amb `action` és més clara i també s'ajusta millor a les convencions de codi.

## Operadors aritmètics

Els operadors aritmètics (`Arithmetic Operators`) s'utilitzen per fer càlculs numèrics:

- `+` suma
- `-` resta
- `*` multiplicació
- `/` divisió
- `%` residu

Exemple:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Cal tenir en compte que Swift és un llenguatge fortament tipat i no barreja automàticament tipus de dades diferents:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Quan els dos tipus són diferents, cal convertir manualment el tipus abans de fer l'operació.

## Operadors de comparació

Els operadors de comparació (`Comparison Operators`) s'utilitzen per jutjar la relació entre dos valors i el resultat és un `Bool`:

- `==` igual a
- `!=` diferent de
- `>` més gran que
- `<` més petit que
- `>=` més gran o igual que
- `<=` més petit o igual que

Exemple:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Els operadors de comparació s'utilitzen sovint en sentències condicionals. Per exemple, en el "carrusel de cites", necessitem controlar que l'índex no superi el rang de l'array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Si `index` és menor que `sayings.count - 1`, el resultat de la comparació és `true` i s'executarà el codi dins de la sentència `if`; si el resultat és `false`, no s'executarà.

## Operadors lògics

Els operadors lògics (`Logical Operators`) s'utilitzen per combinar múltiples condicions:

- `&&` i (`AND`)
- `||` o (`OR`)
- `!` no (`NOT`)

### && i

Quan diverses condicions s'han de complir alhora, es fa servir `&&`.

Per exemple:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

En aquest fragment hi ha dues condicions: `age >= 18` i `age <= 100`.

Només quan totes dues siguin `true`, `legalAge` també serà `true`; si una sola no es compleix, el resultat serà `false`.

### || o

Quan només cal que es compleixi una de diverses condicions, s'utilitza `||`.

Per exemple:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Això significa que, mentre `money >= 50` o `creditCard >= 50` es compleixi, `payAllowed` serà `true`.

Només quan cap de les dues condicions es compleixi, el resultat serà `false`.

Per exemple, en un escenari de pagament, es pot pagar amb efectiu o amb targeta de crèdit. Si cap de les dues opcions és possible, el pagament falla.

### ! no

`!` és l'operador lògic negació (`NOT`), i serveix per invertir un valor `Bool`.

Es pot entendre com que `!` converteix `true` en `false`, i `false` en `true`.

Per exemple:

```swift
let allowed = true
let result = !allowed   // false
```

Aquí, `!allowed` significa invertir el valor d'`allowed`.

Cal tenir en compte que `!` i `!=` són dos operadors diferents: `!` inverteix un valor `Bool`, mentre que `!=` és un operador de comparació que retorna un `Bool`.

## Operadors d'assignació

Els operadors d'assignació (`Assignment Operators`) s'utilitzen per assignar valors o actualitzar variables:

- `=` assignació

Tant en la declaració de variables com en el procés de càlcul, hi ha operacions d'assignació:

```swift
let a = 5
```

Això significa que assignem el valor `5` a la variable `a`.

### Operadors d'assignació composta

En el desenvolupament real, a més de l'operador bàsic d'assignació, també s'utilitzen sovint els "operadors d'assignació composta", que permeten calcular i actualitzar directament sobre el valor original:

- `+=`
- `-=`
- `*=`
- `/=`

En la lliçó anterior sobre el "comptador", ja havíem vist de manera senzilla aquests operadors.

Per exemple, si volem que una variable augmenti automàticament en prémer un botó:

```swift
var num = 10
num += 5   // num = 15
```

Això significa que `num` es suma amb `5` i el resultat es torna a assignar a `num`.

Per tant, equival a:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operador ternari

L'operador ternari (`Ternary Operator`) en Swift avalua una condició i retorna un dels dos resultats possibles:

```swift
condició ? valor1 : valor2
```

La seva lògica és la següent: si la condició és `true`, retorna `valor1`; si és `false`, retorna `valor2`.

Per exemple:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Aquest codi comprova el valor de `showColor`: si és `true`, retorna `Color.blue` i el fons es mostrarà en blau; si és `false`, retorna `Color.clear` i no es mostrarà color de fons.

Consell: `Color.clear` significa un color transparent, és a dir, que no mostra contingut visible.

### Diferència respecte a if-else

L'operador ternari és lògicament equivalent a una sentència `if-else`.

Per exemple, el codi anterior es pot escriure així:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Les dues formes tenen exactament la mateixa lògica: quan la condició és `true`, s'executa el primer resultat; quan és `false`, s'executa el segon.

En l'ús pràctic, l'operador ternari és més concís i és especialment adequat per expressar una decisió simple de "dos possibles valors", sobretot quan volem retornar directament un valor.

En la construcció de vistes amb SwiftUI, l'operador ternari és molt habitual. Per exemple:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

D'aquesta manera, en una sola línia de codi podem canviar dinàmicament l'efecte de la vista segons la condició.

## Operadors de rang

Els operadors de rang (`Range Operators`) s'utilitzen per representar intervals:

- `...` interval tancat, inclou els dos extrems
- `..<` interval semiobert, no inclou el límit dret

Per exemple:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Es pot entendre que `1...3` significa de l'1 al 3, incloent el 3; i `5..<8` significa del 5 al 8, però sense incloure el 8.

Forma ampliada, només per conèixer-la:

```
5...    // >= 5
...5    // <= 5
```

Aquesta escriptura representa un "rang unilateral" i sol utilitzar-se en judicis condicionals o en pattern matching.

Els operadors de rang s'utilitzaran més endavant quan estudiem els bucles `for`. De moment, n'hi ha prou d'entendre'ls com una seqüència contínua de valors numèrics.

## Practicar amb operadors

A continuació, utilitzarem alguns exemples senzills per practicar el paper dels operadors dins d'una vista.

### 1. Calcular el nombre total de vehicles

Per exemple, si per una cruïlla passen 500 vehicles cada dia, podem calcular quants vehicles hi passen en 30 dies.

Podem utilitzar operadors de càlcul:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

El procés de càlcul és: 500 vehicles al dia multiplicats per 30 dies, de manera que el resultat final és un total de 15000 vehicles.

### 2. Determinar si és membre de compra dins l'app

Podem comprovar si una persona és membre de compra dins l'app. Si té activada la subscripció vitalícia o la subscripció periòdica, la considerarem membre.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

En aquest codi s'utilitza l'operador `||` (`or`): `lifeTime = false` significa que no té membresia vitalícia; `subscription = true` significa que sí que té subscripció.

Com que n'hi ha prou amb complir una de les dues condicions, `isMember` és `true`. Per tant, aquesta persona és membre de compra dins l'app.

## Resum

En Swift, els operadors són la base del càlcul de dades i del judici lògic. De la mateixa manera que `Text` s'utilitza per mostrar contingut, els operadors s'utilitzen per tractar les dades mateixes.

Des dels càlculs numèrics més simples fins als judicis lògics més complexos, passant pel control d'estat i els càlculs de disseny dins d'una vista, tot això depèn dels operadors.

Mitjançant la pràctica en diferents escenaris, podem familiaritzar-nos gradualment amb els diversos tipus d'operadors presentats en aquesta lliçó i dominar-los. Aquesta és una base important per a l'aprenentatge posterior.

### Coneixement ampliat - Operadors a nivell de bits

A més, Swift també proporciona una categoria d'operadors de nivell més baix: els operadors a nivell de bits (`Bitwise Operators`):

- `&` (`AND` bit a bit)
- `|` (`OR` bit a bit)
- `^` (`XOR` bit a bit)
- `~` (negació bit a bit)
- `>>` (desplaçament cap a la dreta)
- `<<` (desplaçament cap a l'esquerra)

Per exemple:

```swift
let a = 6  // binari 110
let b = 3  // binari 011

print(a & b) // 2 (binari 010)
print(a | b) // 7 (binari 111)
print(a ^ b) // 5 (binari 101)
print(~a)    // -7 (inversió)
```

En Swift, els enters es representen en complement a dos en binari, així que en invertir-los s'obté el resultat negatiu corresponent.

Els operadors a nivell de bits actuen directament sobre dades binàries i s'utilitzen normalment en tractament de dades de baix nivell o en escenaris d'optimització de rendiment.

Per als principiants, aquests operadors tenen pocs escenaris d'ús. En el desenvolupament general d'iOS o SwiftUI tampoc no són gaire habituals, així que aquí no els explicarem en profunditat.

Si més endavant entrem en lògica de baix nivell o en optimització de rendiment, ja els podrem estudiar i entendre amb més detall.
