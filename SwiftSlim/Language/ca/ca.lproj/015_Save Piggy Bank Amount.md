# Desar l'import de la guardiola

En la lliçó anterior, vam crear una "guardiola" senzilla. En aquesta lliçó, aprendrem a fer que l'import de la guardiola es desi de manera persistent.

Els punts principals d'aquesta lliçó són `UserDefaults` i el property wrapper `@AppStorage`. A més, també ampliarem l'explicació del paper d'`onAppear` i de l'ús del tipus opcional (`nil`).

Cal tenir en compte que aquesta lliçó continua a partir del codi de la "guardiola" desenvolupat a la lliçó anterior.

## El problema del desat persistent

Ara, la interfície de la "guardiola" és molt simple i també és molt còmoda d'utilitzar.

![Piggy Bank](../../Resource/014_view.png)

Però hi ha un problema evident: cada vegada que refresquem la vista o tanquem l'aplicació, l'import total de la guardiola torna a `0`, i es perd completament el valor que havíem acumulat abans.

Això significa que les dades no s'han desat realment. Dit d'una altra manera, la guardiola actual només pot conservar dades temporals.

### Per què no es pot desar de manera persistent?

Això és perquè hem utilitzat una variable declarada amb `@State`:

```swift
@State private var amount = 0
```

Les variables declarades amb `@State` tenen un cicle de vida completament lligat a la vista.

Quan la vista es crea, `amount` s'inicialitza a `0`; quan la vista es destrueix, `amount` també es destrueix.

Les dades desades dins d'`amount` només existeixen a la memòria i no s'han escrit al dispositiu.

Si no volem que `amount` estigui lligat al cicle de vida de la vista, hem d'implementar l'emmagatzematge persistent. Dit d'una altra manera, hem de desar les dades al dispositiu.

### Què és la "persistència de dades"

La persistència de dades es pot entendre com desar dades des de la "memòria temporal" fins a l'"emmagatzematge del dispositiu".

Quan es tanqui la vista o l'aplicació, les dades no es perdran.

En el desenvolupament amb Swift, per a una persistència senzilla es pot utilitzar `UserDefaults`. Per a dades més complexes, caldrà utilitzar `SwiftData` o `CoreData`.

En aquesta lliçó, primer aprendrem la forma més senzilla: `UserDefaults`.

## UserDefaults

`UserDefaults` s'utilitza per desar dades lleugeres en format clau-valor, i és habitual per emmagatzemar tipus bàsics com `String`, `Int`, `Double` i `Bool`.

### Desar dades

`UserDefaults` utilitza el mètode `set` per desar dades:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

El primer paràmetre de `UserDefaults` representa les dades que volem desar; aquí hi passem dades de tipus `String`, `Int`, etc.

El segon paràmetre `forKey` és semblant al nom d'una variable i s'utilitza per identificar les dades desades a `UserDefaults`.

### Llegir dades

`UserDefaults` llegeix les dades utilitzant el mètode corresponent:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Quan llegim dades, hem d'utilitzar el mètode corresponent al tipus, si no, es poden produir errors o valors incorrectes.

### Aspectes a tenir en compte sobre UserDefaults

#### 1. Retorna tipus opcionals

Quan utilitzem `UserDefaults` per llegir certes dades, alguns mètodes retornen tipus opcionals (`Optional`).

Per exemple:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

El tipus que retorna `name` és:

```swift
String?
```

Això significa que pot tenir un valor o pot no tenir-ne.

**Per què retorna un tipus opcional?**

Això és perquè una clau dins de `UserDefaults` no necessàriament té dades associades.

Per exemple:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Si abans no s'ha desat mai res amb la clau `"City"`, el resultat de la lectura serà:

```swift
nil
```

Cal remarcar que `nil` vol dir que no hi ha dades, no pas una cadena buida.

A la lliçó sobre el "sistema de tipus", ja vam trobar un problema semblant: quan una conversió de tipus falla, es retorna un tipus opcional.

En aquest cas, hem d'utilitzar `??` per proporcionar un valor per defecte i desempaquetar:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Si `UserDefaults` llegeix una dada existent, s'utilitzarà aquest valor; si no troba res (`nil`), s'utilitzarà el valor per defecte.

#### 2. Retorna tipus no opcionals

Quan `UserDefaults` llegeix valors de tipus `Int`, `Double` i `Bool`, retorna tipus no opcionals.

Per exemple:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Encara que aquestes claus no s'hagin desat mai abans, el valor retornat no serà `nil`.

En lloc d'això, retornarà un valor per defecte:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Límit de volum de dades

`UserDefaults` només és adequat per desar una petita quantitat de dades, com ara configuracions de l'aplicació o estats senzills.

En la pràctica, no és adequat per desar grans quantitats de dades ni dades que es llegeixen i s'escriuen molt sovint.

## Desar l'import de la "guardiola"

Ara podem utilitzar `UserDefaults` per implementar la lògica que desa l'import total de la guardiola.

Quan l'usuari prem el botó, l'import introduït s'afegeix al total, i aquest total es desa a `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Ara ja hem implementat la lògica d'escriptura de dades.

## Explicació de la lògica de persistència

Tot i que ja hem completat la lògica d'escriptura persistent, en executar l'aplicació veurem que cada vegada que es refresca la vista o es torna a obrir l'app, la variable `amount` continua essent `0`.

Això és perquè:

```swift
@State private var amount = 0
```

En SwiftUI, les variables `@State` es tornen a inicialitzar quan la vista es crea de nou.

Encara que `UserDefaults` hagi desat el valor d'`amount`, quan la vista es carrega una altra vegada, `amount` es torna a inicialitzar a `0`.

Això vol dir que, de moment, només hem desat les dades a `UserDefaults`, però no les hem restaurat dins de la vista.

Per tant, quan la vista es carregui, també hem de llegir manualment el valor des de `UserDefaults` i tornar-lo a assignar a `amount`. Només així podrem completar tota la lògica de persistència.

### Comparació lògica

Podem entendre aquest procés com si fos "la pissarra d'una aula":

Durant la classe, el professor escriu contingut a la pissarra, i aquest contingut és com l'estat actual de la vista (`@State`).

Quan la classe acaba, la pissarra s'esborra per preparar la següent classe. Això equival al fet que la vista es destrueixi i les dades dins d'`@State` desapareguin.

Per evitar perdre el contingut docent, el professor el desa abans en els apunts o diapositives. Aquest material equival a les dades desades a `UserDefaults`.

Quan comença una nova classe, la pissarra torna a estar buida (`@State` es reinicialitza), i el professor ha de tornar a copiar-hi el contingut des dels apunts, és a dir, llegir les dades de `UserDefaults`.

Cal entendre que la pissarra no recupera automàticament el contingut anterior: s'ha de tornar a escriure mitjançant la "lectura dels apunts", és a dir, llegint `UserDefaults`.

## Llegir dades amb onAppear

Quan la vista es mostra, hem de llegir manualment el valor de `UserDefaults` i assignar-lo a la variable `amount` d'`@State`. Només així es pot aconseguir una persistència real de les dades.

En SwiftUI, podem utilitzar `onAppear` per executar lògica d'inicialització quan la vista apareix:

```swift
.onAppear {}
```

Posem el codi de lectura de `UserDefaults` dins d'`onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Quan la vista es crea, `amount` s'inicialitza a `0`; quan la vista es mostra, s'executa `onAppear`, es llegeix el valor des de `UserDefaults` i s'assigna a `amount`. D'aquesta manera, la vista podrà mostrar l'import total desat l'última vegada.

Ara ja hem completat tota la lògica de persistència de la "guardiola".

## Codi complet

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

SwiftUI proporciona el property wrapper `@AppStorage`, que pot simplificar la lògica de desat amb `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` és un encapsulament de `UserDefaults`, i `"amount"` correspon a la clau desada a `UserDefaults`.

Quan la vista es crea, llegirà les dades des de `UserDefaults`; i quan la variable canviï, les escriurà automàticament a `UserDefaults`.

També és compatible amb el mecanisme d'actualització d'estat de SwiftUI. Igual que `@State`, quan canvia, refrescarà la vista de SwiftUI.

Això vol dir que `@AppStorage` pot implementar tant la lectura com el desat de dades, i ja no caldrà cridar manualment `UserDefaults` ni utilitzar `onAppear` per llegir-les.

Per tant, podem substituir la lògica anterior de `UserDefaults` per `@AppStorage`:

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

## Resum

En aquesta lliçó hem après principalment els punts següents:

En primer lloc, `UserDefaults` serveix per desar dades lleugeres, i nosaltres l'hem utilitzat per desar l'import total al dispositiu. `UserDefaults` proporciona mètodes de lectura i escriptura, i també hem vist que cal gestionar casos com els tipus opcionals.

En segon lloc, les variables `@State` només serveixen per gestionar l'estat temporal dins de la vista, i el seu cicle de vida és el mateix que el de la vista. Quan la vista es crea de nou, `@State` també es reinicialitza.

En restaurar dades des de `UserDefaults`, hem après a utilitzar `onAppear` per llegir dades quan la vista es mostra i completar així la restauració.

Finalment, hem utilitzat `@AppStorage` per substituir `UserDefaults`, de manera que la vista pugui llegir automàticament les dades en carregar-se i escriure-les automàticament quan canviïn, substituint la lògica manual basada en `UserDefaults` i `onAppear`.

Amb aquests coneixements, ja podem implementar una funció bàsica d'emmagatzematge de dades en una app perquè les dades es conservin de manera persistent.

## Exercici després de classe

Ara la "guardiola" ja admet desar l'import, però la seva funcionalitat encara no està completa.

1. Si l'usuari vol retirar diners, cal dissenyar la lògica corresponent.
2. Si l'usuari vol esborrar completament l'import, també cal implementar una lògica de reinicialització.
3. Si volem afegir un nom a la guardiola, també caldrà introduir dades de tipus `String` per desar-lo.

Pots continuar ampliant aquestes funcions sobre la base actual per fer que la guardiola sigui més completa.

## Coneixement ampliat - El problema del valor per defecte al camp d'entrada

Ara encara podem millorar més la interacció del camp d'entrada perquè el procés d'escriptura sigui més còmode.

![textfield](../../Resource/015_view.png)

En la implementació actual, el valor inicial del camp és `0`. Això obliga l'usuari a esborrar primer el `0` cada vegada abans d'introduir una nova quantitat, i aquesta experiència d'ús no és gaire raonable.

Hauríem de fer que el valor inicial del camp estigui buit, no pas a `0`.

Això és perquè `TextField` i `number` estan vinculats bidireccionalment:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Quan `number` s'inicialitza a `0`, el camp també mostrarà `0`.

Per tant, hem de canviar `number` a un valor buit, és a dir, `nil`.

```swift
@State private var number = nil
```

En aquest moment apareixerà l'error:

```
Generic parameter 'Value' could not be inferred
```

Aquesta és justament la situació que vam comentar a la lliçó del "sistema de tipus": quan una variable no es pot inferir automàticament, cal declarar-ne explícitament el tipus.

Com que hem assignat `nil` a `number`, i `nil` per si mateix no conté informació de tipus, el compilador no pot saber si aquesta variable és `String`, `Int` o qualsevol altre tipus, i per això es produeix l'error.

Per tant, hem de declarar explícitament el tipus de `number`:

```swift
@State private var number:Int? = nil
```

Aquí `Int?` representa un tipus opcional (`Optional`) i significa que `number` pot ser un `Int` o bé `nil`.

D'aquesta manera, si l'inicialitzem com a `nil`, el camp d'entrada es mostrarà buit en lloc de mostrar `0`.

### Desempaquetar un tipus opcional

Quan canviem `number` a un tipus opcional, el codi de càlcul original produirà un error:

```swift
amount += number
```

Missatge:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Això és perquè `number` ara pot ser `nil`. Si el fem servir directament en un càlcul, es convertiria en:

```swift
amount += nil
```

És evident que `nil` no es pot sumar amb `amount`, així que aquesta operació no és vàlida.

Per tant, quan fem càlculs amb tipus opcionals, primer els hem de desempaquetar.

Aquí podem utilitzar `??` per proporcionar un valor per defecte:

```swift
amount += number ?? 0
```

Quan `number` és `nil`, s'utilitza el valor per defecte `0`; quan `number` té valor, s'utilitza la dada real introduïda.

D'aquesta manera, no només garantim que el càlcul sigui correcte, sinó que també aconseguim que el camp d'entrada estigui buit per defecte i l'usuari ja no hagi d'esborrar manualment el `0`.

## Codi ampliat

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
