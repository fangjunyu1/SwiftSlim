# struct i class

A la lliçó anterior, tot just vam començar a entrar en contacte amb `struct`, vam definir una estructura i també vam ampliar coneixements sobre protocols, `UUID` i altres punts importants.

Ara ja tenim una comprensió inicial de la paraula clau `struct`, però encara no es pot considerar que l'entenguem realment.

En aquesta lliçó continuarem tenint `struct` com a contingut central i, de passada, també coneixerem `class`. A través d'aquesta lliçó, tindràs més clar: què és una instància, què és un constructor i per què podem utilitzar `struct` i `class` per organitzar dades.

## Sistema de gestió d'estudiants

Per exemple, ara volem desenvolupar un sistema de gestió d'estudiants. Cada estudiant té informació com ara nom, sexe, telèfon, edat, adreça de casa, etc.

En aquest moment, podem agrupar tota aquesta informació i definir-la com una estructura `Student`:

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

Aquí fem servir `struct` per definir un tipus d'estudiant.

Aquesta estructura `Student` conté diverses propietats:

- `id`: l'identificador únic de l'estudiant
- `name`: el nom de l'estudiant
- `sex`: el sexe de l'estudiant
- `phone`: el telèfon de l'estudiant
- `age`: l'edat de l'estudiant
- `address`: l'adreça de casa

D'aquesta manera, diverses dades que originalment estaven disperses queden combinades en un "estudiant" complet.

Aquí `Student` també segueix el protocol `Identifiable` i defineix un camp `id`, per facilitar més endavant la visualització de dades amb el bucle `ForEach`.

Després, podem crear una instància d'estudiant:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Aquest codi indica que, seguint aquesta estructura `Student`, es poden crear dades concretes d'un estudiant.

Entre aquests elements, `Student` és el tipus, i `Student(...)` representa una instància creada.

A SwiftUI, podem assignar aquesta instància a una variable i després mostrar-la.

Per exemple:

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

Així, podem veure a la vista el nom d'aquest estudiant: `Fang Junyu`.

Aquí, primer hem creat una instància de `Student`, després l'hem assignada a la variable `student` i finalment n'hem llegit la propietat a través de `student.name`.

## Què és una instància

Quan comencem a aprendre `struct`, pot ser que la paraula "instància" ens soni molt estranya.

Però, en realitat, estem fent servir instàncies des del principi; simplement abans no hi havíem parat una atenció especial.

Per exemple:

```swift
let name = "Fang Junyu"
```

Aquí `"Fang Junyu"` és un valor de cadena, i en essència és una instància del tipus `String`.

També ho podem escriure així:

```swift
let name = String("Fang Junyu")
```

Aquestes dues maneres d'escriure-ho expressen el mateix: crear una instància del tipus `String` i assignar-la a la variable `name`.

De la mateixa manera, amb `Int` passa igual:

```swift
let num = 3
```

Aquí `3`, en essència, és un valor del tipus `Int`, i també es pot entendre com una instància d'`Int`.

Per tant, una instància no és un concepte especial que només aparegui dins de `struct`.

Tant si és `String`, `Int`, `Double`, `Bool` o el `Student` personalitzat, tots ells poden crear instàncies.

Per això, quan escrivim:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

En essència és igual que crear una instància de `String` o d'`Int`; l'única diferència és que `Student` és un tipus definit per nosaltres mateixos.

## Constructor

Quan creem una instància:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

En realitat, el que fem és cridar el mètode d'inicialització de `Student`, és a dir, `init`.

Pots entendre el constructor com: **el punt d'entrada responsable d'assignar valors a les propietats quan es crea una instància.**

És a dir, abans que una instància es creï completament, normalment primer ha de passar per `init`.

Per exemple, quan abans vam aprendre sobre el cicle de vida de les vistes de SwiftUI, vam escriure un codi com aquest:

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

Aquí `init()` s'executa quan es crea la instància `ContentView`, mentre que `onAppear` només s'executa quan la vista es mostra realment a la interfície. És a dir, la creació i la visualització de la vista no passen en el mateix moment.

De la mateixa manera, quan creem `Student(...)`, també estem cridant el constructor de `Student`.

### Constructor generat automàticament pel sistema

Quan vam definir `Student`, no vam escriure manualment `init`:

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

Però, tot i així, encara podem crear una instància directament:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Per què es pot crear una instància sense haver escrit un constructor?

Perquè per a `struct`, si no escrivim manualment un constructor, normalment el sistema ens en genera automàticament un d'adequat.

En la fase inicial d'aprenentatge, ho pots entendre de manera senzilla així: Swift ens completa automàticament el codi d'inicialització.

Es pot entendre aproximadament que el sistema ens completa el codi següent:

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

Aquí cal fixar-se en un petit detall:

```swift
let id = UUID()
```

`id` ja té un valor per defecte, així que en crear la instància no cal que li passem manualment `id`.

És a dir, les propietats que no tenen valor per defecte normalment s'han de passar al constructor; les propietats que ja tenen un valor per defecte normalment poden utilitzar directament aquest valor original.

Per tant, quan creem una instància de `Student`, només cal passar `name`, `sex`, `phone`, `age` i `address`.

### Suggeriments del compilador

A més, quan escrivim `Student(...)` a Xcode, també podem veure els suggeriments de paràmetres que ofereix el sistema.

![student](../../Resource/022_student.png)

Això també demostra, de fet, que aquest tipus actual realment té un constructor generat automàticament pel sistema.

### Escriure el constructor nosaltres mateixos

Encara que el sistema pugui generar automàticament el constructor, de vegades aquesta forma d'inicialització per defecte no s'ajusta del tot a les nostres necessitats.

Per exemple, tenim una estructura `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Segons el constructor generat automàticament pel sistema, quan creem una instància hem de passar alhora aquests tres paràmetres:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Però si ara volem registrar un grup de pel·lícules antigues i només en sabem el nom, però no en sabem el director ni la puntuació, això serà bastant incòmode.

Perquè només ho podem escriure així:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Tot i que funciona, no és gaire pràctic haver d'escriure `--` cada vegada.

En aquest moment, podem escriure un constructor:

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

D'aquesta manera, quan creem pel·lícules antigues, només cal passar `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Aquesta és una de les utilitats d'escriure nosaltres mateixos el constructor: **fer que la manera de crear instàncies s'ajusti millor a les necessitats reals.**

### Analitzar un constructor personalitzat

Vegem aquest constructor escrit manualment fa un moment:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Aquest codi significa que, en crear una instància de `Movie`, només es demana passar un paràmetre `name`.

Després, dins del constructor, el `name` passat s'assignarà al `name` de la pròpia instància, i a `director` i `rating` se'ls donarà un valor per defecte de `--`.

Aquí `self` representa "aquesta instància actual mateixa".

Per exemple:

```swift
self.name = name
```

El `self.name` de l'esquerra indica la propietat dins de la instància; el `name` de la dreta indica el paràmetre que hem passat.

Es pot entendre de manera senzilla com que el valor que ve de fora es desa dins de la propietat de la pròpia instància.

Quan totes les propietats ja han rebut un valor, la creació de la instància queda completada.

### Mecanisme del constructor

Quan declarem explícitament un constructor, també es produeix un altre canvi:

el constructor que originalment generava automàticament el sistema normalment ja no es pot utilitzar directament.

Per exemple:

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

Ara, si tornem a escriure això:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

El compilador donarà un error:

```swift
Extra arguments at positions #2, #3 in call
```

Això vol dir: has passat paràmetres de més.

Per què apareix aquest error?

Perquè dins d'aquesta estructura `Movie` actual només hi ha aquest tipus de constructor que has declarat manualment:

```swift
init(name: String)
```

Només accepta un paràmetre `name` i no accepta `director` ni `rating`.

És a dir, quan afegeixes manualment el teu propi constructor, la manera d'inicialitzar que abans generava automàticament el sistema ja no es pot utilitzar directament.

Si volem suportar tant "passar només el nom" com "passar la informació completa", hem d'afegir nosaltres mateixos un constructor complet:

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

Així, ja tenim dos constructors diferents.

Quan creem una pel·lícula antiga, podem escriure així:

```swift
Movie(name: "The Night of the Hunter")
```

Quan creem una pel·lícula nova amb informació completa, podem escriure així:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Aquesta manera d'escriure també mostra que un mateix tipus pot tenir diversos constructors, sempre que la forma dels seus paràmetres sigui diferent.

## Què és la sobrecàrrega

Aquí afegirem encara un punt de coneixement necessari.

Fa un moment vam escriure dos `init` per a `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Aquesta manera d'escriure, "mateix nom de funció però paràmetres diferents", s'anomena "sobrecàrrega".

Aquí, les dues funcions es diuen `init`, però com que reben paràmetres diferents, Swift pot distingir quina funció estàs cridant.

Per exemple:

```swift
Movie(name: "Days of Heaven")
```

Cridarà:

```swift
init(name: String)
```

I, en canvi:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Cridarà l'altra versió completa del mètode d'inicialització.

Per tant, la funció de la sobrecàrrega és: permetre que un mateix tipus ofereixi diferents maneres de crear-se segons diferents situacions.

## Conèixer class

A continuació, coneixerem breument `class`.

A més del `struct` habitual a Swift, molts llenguatges de programació utilitzen `class` per crear instàncies, com ara Java, C#, Kotlin, etc.

A Swift, l'escriptura de `class` és molt semblant a la de `struct`.

Per exemple:

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

Veuràs que, excepte que la paraula clau canvia de `struct` a `class`, la resta sembla gairebé igual.

La manera de crear instàncies també és molt semblant:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Per tant, a nivell de sintaxi, `struct` i `class` realment s'assemblen molt.

### Diferència entre Struct i Class

Encara que `struct` i `class` semblin molt semblants, no són completament iguals.

**1. La manera d'inicialitzar és diferent**

Per a `struct`, si no escrivim manualment un constructor, normalment el sistema genera automàticament un mètode d'inicialització adequat.

Però per a `class`, si hi ha propietats que encara no tenen valor per defecte, normalment cal escriure `init` manualment; altrament, es produirà un error.

Per exemple:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Aquesta `class`, com que no té constructor, donarà error perquè les propietats no han estat inicialitzades.

El compilador mostrarà un missatge semblant a:

```swift
Class 'Movie' has no initializers
```

Per tant, en aquest exemple, `class` necessita obligatòriament un constructor escrit manualment.

**2. `struct` és un tipus de valor, `class` és un tipus de referència**

`struct` és un tipus de valor, i `class` és un tipus de referència.

En la fase inicial d'aprenentatge, no cal dominar completament aquests dos conceptes; n'hi ha prou amb tenir-ne una comprensió simple.

Per exemple, `struct` s'assembla més a "copiar un nou valor".

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

Aquí, després d'assignar `user1` a `user2`, és com si s'hagués copiat un nou conjunt de dades, de manera que modificar `user2` no afecta `user1`.

En canvi, `class` s'assembla més a "apuntar conjuntament a la mateixa instància".

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

Aquí `user1` i `user2` apunten a la mateixa instància.

Ara no ens cal entendre completament el mecanisme intern dels tipus de valor i de referència; només cal saber que `struct` és més adequat per desar dades independents, mentre que `class` és més adequat quan diversos llocs han de compartir una mateixa instància.

## Com triar en la fase inicial

En l'etapa actual, per als models de dades normals, convé pensar primer en `struct`; quan cal compartir dades i modificar-les de manera sincronitzada, aleshores convé considerar `class`.

Això no és una regla absoluta, però per a principiants és una manera de jutjar prou pràctica.

Especialment a SwiftUI, moltes vegades descobriràs que `struct` ja pot fer la major part de la feina.

A més, en molts materials de programació, allò que es crea amb `class` també s'anomena "objecte". A la fase inicial, pots entendre-ho simplement com una instància, sense necessitat de distingir-ho deliberadament.

## Resum

En aquesta lliçó, hem aprofundit en `struct` i, de passada, també hem conegut `class`; tots dos es poden fer servir per definir tipus.

Els tipus poden crear instàncies. Quan es crea una instància, es crida el constructor, és a dir, `init`.

Per a `struct`, si no s'escriu manualment un constructor, normalment el sistema en genera automàticament un d'adequat. Si el constructor per defecte no satisfà les necessitats, també podem escriure manualment un constructor.

A més, també hem tingut una primera aproximació a la diferència entre `struct` i `class`: `struct` és un tipus de valor i `class` és un tipus de referència. A SwiftUI, en la fase inicial, allò amb què solem entrar més en contacte és `struct`.

Més endavant, quan aprenguem a passar valors entre vistes, models de dades i gestió d'estat, tots aquests continguts continuaran apareixent.
