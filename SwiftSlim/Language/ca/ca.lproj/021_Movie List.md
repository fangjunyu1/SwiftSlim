# Llista de pel·lícules

En aquesta lliçó, crearem una llista de pel·lícules.

![movie](../../Resource/021_movie.png)

A la llista es mostraran el pòster, el nom, el director i la puntuació de cada pel·lícula.

En aquest exemple, aprendrem un punt molt important: l'estructura `struct`. Ens pot ajudar a combinar diverses informacions d'una pel·lícula en un sol conjunt. A més d'això, també veurem `UUID()`, `ForEach`, la línia divisòria `Divider`, i com utilitzar objectes personalitzats per gestionar les dades.

Aquests coneixements són molt habituals en el desenvolupament posterior amb SwiftUI. Després d'aquesta lliçó, no només podràs fer una llista de pel·lícules, sinó que també començaràs a entendre "com convertir un conjunt de dades en una interfície".

## Una sola pel·lícula

Podem començar primer per la interfície d'una sola pel·lícula.

![movie](../../Resource/021_movie1.png)

La disposició d'aquesta interfície es compon principalment de dues parts: a l'esquerra hi ha el pòster de la pel·lícula, i a la dreta hi ha la presentació de la pel·lícula.

### Pòster de la pel·lícula

A l'esquerra es mostra el pòster de la pel·lícula, i podem utilitzar `Image` per mostrar la imatge.

Per exemple:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Aquest codi indica que es mostri una imatge amb el nom `"The Shawshank Redemption"`.

Aquí cal tenir en compte que el nom de la imatge ha d'existir realment a la carpeta de recursos `Assets`; en cas contrari, la interfície no podrà mostrar correctament aquesta imatge.

![movie](../../Resource/021_movie2.png)

Les funcions d'aquests modificadors són les següents:

- `resizable()` indica que la mida de la imatge es pot ajustar.
- `scaledToFit()` indica que es manté la proporció original en escalar, per evitar que la imatge s'estiri i es deformi.
- `frame(height: 180)` indica que l'alçada de la imatge es fixa a 180.
- `cornerRadius(10)` indica que s'aplica un radi de cantonada de 10 a la imatge.

D'aquesta manera, podem obtenir una imatge del pòster de la pel·lícula amb una mida adequada i cantonades arrodonides.

![movie](../../Resource/021_movie3.png)

### Presentació de la pel·lícula

A la dreta es mostra la presentació de la pel·lícula, incloent-hi el nom de la pel·lícula, el director i la puntuació.

![movie](../../Resource/021_movie4.png)

Podem utilitzar `Text` per mostrar aquesta part:

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

En aquest codi, `.font` indica la mida del tipus de lletra, i `.fontWeight` indica el gruix del tipus de lletra.

Per tal que hi hagi una separació més clara entre "el nom de la pel·lícula", "la informació del director" i "la informació de la puntuació", aquí s'utilitza `VStack` a la capa més exterior i s'estableix:

```swift
spacing: 10
```

Això significa que la separació entre cada grup de contingut dins d'aquest `VStack` és de 10.

La raó per la qual el director i la puntuació estan cadascun embolicats de nou en un `VStack` és que tots dos pertanyen a una estructura de "títol + contingut". Per això, la jerarquia de la interfície serà més clara, i també ens serà més fàcil continuar ajustant l'estil més endavant.

A més, `VStack` està alineat al centre per defecte. Perquè tot el text s'alineï a l'esquerra, establim:

```swift
alignment: .leading
```

Així la part de presentació de la pel·lícula es veu més ordenada.

### Línia divisòria

Ara, tot i que el contingut de la presentació de la pel·lícula s'ha separat gràcies a `spacing`, la separació entre els diferents continguts encara no és prou evident.

En aquest moment, podem afegir una línia divisòria:

```swift
Divider()
```

Per exemple:

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

D'aquesta manera, la part de presentació de la pel·lícula tindrà un efecte de separació més evident.

![movie](../../Resource/021_movie4.png)

`Divider` és una vista molt senzilla però molt habitual, la funció de la qual és separar diferents continguts.

A `VStack`, `Divider()` es mostra com una línia horitzontal.

A `HStack`, `Divider()` es mostra com una línia vertical.

A més, també es pot modificar l'estil de `Divider` a través de `.frame`, `.background`, `.padding` i altres formes.

Per exemple:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Això generarà una línia divisòria blava, amb un gruix de 2 i amb espai interior als costats esquerre i dret.

![divider](../../Resource/021_divider.png)

### Interfície completa

Finalment, podem utilitzar `HStack` per disposar el pòster de la pel·lícula i la presentació de la pel·lícula un al costat de l'altre.

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

Aquí, `HStack(spacing: 20)` indica que es deixi un espai de 20 entre les dues parts, esquerra i dreta.

Cal tenir en compte que `Divider()`, igual que `TextField` i `Slider` que hem vist abans, per defecte intenta ocupar tant espai disponible com sigui possible.

Per tant, establim una amplada fixa per al `VStack` exterior de la part descriptiva de la dreta:

```swift
.frame(width: 200)
```

Així podem fer que l'amplada de la línia divisòria i de la zona de text es mantingui igual, i el conjunt es veurà més ordenat.

Arribats aquí, ja hem completat la interfície de visualització d'"una sola pel·lícula".

![movie](../../Resource/021_movie1.png)

## Desar pel·lícules en un array

Si volem mostrar diverses pel·lícules una darrere l'altra amb el mateix estil, això significa que caldrà escriure un tros de codi semblant per a cada pel·lícula.

Per exemple:

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

Encara que aquest codi pot aconseguir l'efecte desitjat, el codi cada vegada serà més llarg, i mantenir-lo serà molt molest.

Per exemple, si cal canviar l'espai de totes les pel·lícules de `20` a `15`, o canviar l'amplada de la part dreta de `200` a
`220`, caldrà modificar manualment cada tros de codi repetit.

Evidentment, aquest no és un mètode eficient.

Abans ja hem après els arrays, i també hem après a utilitzar `ForEach` per mostrar repetidament vistes segons un array.

Per exemple:

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

Aquesta manera és molt adequada per tractar casos de "només una dada", com ara un conjunt de noms d'imatges.

Però una pel·lícula no té només un valor. Com a mínim inclou:

1. el pòster de la pel·lícula
2. el nom de la pel·lícula
3. el director
4. la puntuació

És a dir, una pel·lícula és en realitat un conjunt de dades relacionades, no pas una sola cadena.

Si només fem servir arrays, només podrem desar aquesta informació per separat:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

En mostrar-les, haurem de dependre del mateix índex perquè corresponguin una per una:

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

El problema d'aquesta manera d'escriure és que el cost de manteniment és molt alt.

Com que les dades d'una pel·lícula queden repartides en diversos arrays, només cal que un array tingui un element de més, un de menys o un ordre diferent perquè el resultat de la visualització sigui incorrecte.

Especialment quan afegeixes o elimines una pel·lícula, has de modificar diversos arrays alhora, i és molt fàcil oblidar-se d'alguna cosa.

Aleshores, com podem combinar informació com "el nom de la pel·lícula, el director i la puntuació" en un sol conjunt?

Per a això cal utilitzar `struct`.

## Definir una estructura struct

A Swift, `struct` és una "estructura".

La pots entendre com un "tipus de dades personalitzat" que pot combinar diversos camps relacionats en un sol conjunt.

Ús bàsic:

```swift
struct StructName {
	let name: String
}
```

En aquest codi, `struct` és la paraula clau que indica que estem definint una estructura. `StructName` és el nom de l'estructura.

El contingut dins de les claus són els camps que conté aquesta estructura, i cada camp ha d'indicar clarament el nom i el tipus.

Normalment, el nom d'una `struct` comença amb majúscula, com ara `Movie`, `Student` o `UserInfo`. Aquest és un hàbit de nomenclatura habitual a Swift.

Pots entendre `struct` de manera senzilla com una capsa buida, on cada camp és com una posició buida reservada dins de la capsa.

Quan aquestes posicions encara no s'han omplert, només és una capsa buida. Només quan tots els camps s'omplen amb valors adequats es converteix en una capsa de regal completa.

### Instància de struct

Abans només hem definit l'estructura mateixa, cosa que equival a preparar la forma d'una capsa.

Encara hem d'omplir-hi el contingut concret per obtenir una "instància" real que es pugui utilitzar.

Quan es crea una instància, normalment s'afegeix `()` darrere del nom de l'estructura:

```swift
StructName(...)
```

El que s'omple dins dels parèntesis és el contingut dels camps que necessita aquesta estructura.

Per exemple:

```swift
StructName(name: "Fang Junyu")
```

Aquest codi indica que es crea una nova instància segons el format de l'estructura `StructName`, i s'assigna el valor `"Fang Junyu"` al camp `name`.

Quan omplim tots els camps necessaris, és com si omplíssim completament aquesta capsa.

En aquest moment, obtenim una instància completa de l'estructura.

### Accedir a les propietats de struct

Quan ja hem creat una instància, podem utilitzar la "sintaxi del punt" per accedir a les seves propietats internes.

Escriptura bàsica:

```swift
instància.nomDeLaPropietat
```

Per exemple:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Aquí `st` és una instància d'una estructura, i `st.name` indica que es llegeix el valor `name` d'aquesta instància.

Pots entendre aquesta manera de llegir així: quan escrivim `st.name`, és com si llegíssim el contingut desat en una determinada posició d'aquesta capsa.

Aquesta manera d'escriure serà molt habitual en les interfícies de SwiftUI més endavant.

Per exemple, si tenim una estructura d'estudiant que conté el nom, l'edat i la classe, a l'hora de mostrar-ho a la interfície podem llegir per separat:

```swift
student.name
student.age
student.className
```

L'avantatge d'això és que les dades són més clares i més fàcils de gestionar.

### Posició de struct

Per a persones que comencen, normalment es pot escriure l'estructura fora de `ContentView`.

Per exemple:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

D'aquesta manera, l'estructura queda més clara i també és més fàcil de llegir.

T'adonaràs que `ContentView` mateix també és en realitat una `struct`.

### Estructura Movie

Amb la base anterior, ja podem definir una estructura de pel·lícula:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Aquesta és una estructura anomenada `Movie`, formada pels tres camps `name`, `director` i `rating`, que representen respectivament el nom de la pel·lícula, el director i la puntuació.

D'aquesta manera, la informació relacionada amb una pel·lícula ja no cal desar-la separada en diversos arrays, sinó que es pot combinar directament en un sol conjunt.

Per exemple, podem crear una instància de pel·lícula així:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Aquesta instància representa "les dades completes d'una pel·lícula".

### Desar estructures en un array

Abans hem dit que un array només pot desar un sol tipus.

Ara ja tenim l'estructura `Movie`, així que un array pot desar diversos `Movie`.

```swift
let lists: [Movie] = []
```

Per exemple:

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

En aquest array `lists`, el que es desa no són cadenes, sinó diverses instàncies de `Movie`.

És a dir, cada element de l'array és una pel·lícula completa.

D'aquesta manera, quan necessitem mostrar la llista de pel·lícules, podem llegir-les una per una amb `ForEach`.

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

Aquí `movie in` indica que, a cada iteració, s'agafarà una pel·lícula de l'array i se li posarà temporalment el nom `movie`.

Després, podem utilitzar:

```swift
movie.name
movie.director
movie.rating
```

per llegir respectivament el nom, el director i la puntuació d'aquesta pel·lícula, i mostrar-los a la interfície.

## Error de ForEach

Fins aquí, ja hem completat la manera bàsica d'escriure l'array de pel·lícules i `ForEach`.

Tanmateix, si executes directament aquest codi:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

es mostrarà un error:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

El significat d'aquest error és que, quan escrius `id: \.self`, SwiftUI necessita prendre cada element de l'array mateix com a "identificador únic" per poder-los distingir.

Aquesta manera és adequada per a tipus simples com `String` i `Int`, perquè en si mateixos són més fàcils de distingir.

Però `Movie` és una estructura personalitzada definida per nosaltres, i `ForEach` no sap com prendre-la a ella mateixa com a identificador únic, i per això dona error.

La manera més habitual de resoldre aquest problema és fer que `Movie` compleixi el protocol `Identifiable`.

## Protocol

A Swift, un protocol es pot entendre com una mena de "regla" o "requisit".

Ho pots entendre com els acords d'una organització internacional: si un país vol unir-se a una determinada organització internacional, normalment primer ha de complir algunes regles plantejades per aquesta organització, fer públiques algunes dades i respectar unes regles comunes. Només després de complir aquestes condicions pot unir-s'hi o participar en alguns assumptes.

Els protocols funcionen d'una manera semblant.

Quan un tipus vol complir un protocol, ha de satisfer el contingut que aquest protocol requereix. Només després de complir aquests requisits, aquest tipus pot utilitzar la funcionalitat corresponent.

Escriptura bàsica:

```swift
struct Movie: Identifiable {
    // ...
}
```

Aquí, `: Identifiable` indica que `Movie` compleix el protocol `Identifiable`.

Si un tipus compleix diversos protocols, es poden separar amb comes:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Pel que fa a `Identifiable`, el seu requisit més important és que el tipus ha de tenir un `id` que el pugui identificar.

Per exemple:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Aquí, `id` és com el número d'identitat, i serveix per distingir cada pel·lícula.

Mentre l'`id` de cada pel·lícula sigui diferent, SwiftUI podrà distingir correctament cada element de l'array.

Per exemple:

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

Després, a `ForEach` s'utilitza:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Així ja no hi haurà error.

Com que `Movie` ja compleix `Identifiable`, una manera més habitual és ometre directament `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Perquè SwiftUI ja sap que ha d'utilitzar `movie.id` per distingir cada element.

## Identificador de diferenciació de ForEach

A continuació, entendrem més a fons el paper de `id` dins de `ForEach`.

Per exemple:

```swift
ForEach(lists, id: \.self)
```

Això significa: utilitzar l'element mateix com a identificador de diferenciació.

I:

```swift
ForEach(lists, id: \.id)
```

significa: utilitzar el camp `id` de l'element com a identificador de diferenciació.

Si un determinat camp pot garantir per si mateix la unicitat, també es pot utilitzar temporalment.

Per exemple, si el nom de cada pel·lícula és diferent, aquesta escriptura també podria funcionar correctament amb les dades actuals:

```swift
ForEach(lists, id: \.name)
```

Però aquí hi ha un problema ocult: `name` no és necessàriament únic per sempre.

Suposa que més endavant afegeixes una altra pel·lícula amb el mateix nom; aleshores `name` ja no podrà distingir correctament cada element.

En aquest moment, tot i que el codi encara es pot compilar, durant el refresc de la vista, les actualitzacions, les insercions o les eliminacions, SwiftUI pot identificar els elements de manera incorrecta, i això pot provocar anomalies de visualització.

Per això, quan necessitem distingir dades de manera estable, el millor és utilitzar un camp realment únic, és a dir, `id`.

## UUID

Tot i que escriure manualment `id: 1`, `id: 2` pot resoldre el problema, encara hi ha un risc: pots escriure accidentalment un `id` repetit, i l'identificador únic deixarà de ser vàlid.

Per exemple:

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

D'aquesta manera apareixeran dos `id` iguals, i l'identificador únic quedarà invalidat.

Per evitar errors manuals, normalment utilitzem `UUID()`.

A Swift, `UUID()` genera aleatòriament un identificador de 128 bits. Normalment es mostra com una llarga cadena formada per lletres i números.

Per exemple:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Aquí, `UUID()` en realitat crea una instància del tipus `UUID`; ho pots entendre com un "número únic" generat automàticament.

Per tant, els valors creats cada vegada gairebé mai no es repeteixen, de manera que són molt adequats per utilitzar-los com a `id`.

Podem modificar `Movie` així:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Aquest codi indica que el camp `id` de l'estructura `Movie` rebrà per defecte una nova instància de `UUID`.

És a dir, cada vegada que creem una nova `Movie`, el sistema ens generarà automàticament primer un `id` únic.

Com que `id` ja té un valor per defecte, després ja no caldrà omplir manualment `id` quan es creïn instàncies de `Movie`.

Per exemple:

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

Encara que aquí no s'ha escrit `id`, en realitat aquesta instància de pel·lícula continua tenint el seu propi `id`; simplement aquest valor ja ha estat generat automàticament per `UUID()`.

Després d'utilitzar aquesta manera, ja no caldrà escriure manualment un `id` per a cada pel·lícula, cosa que no només redueix la quantitat de codi, sinó que també evita errors causats per repetir id.

Finalment, només ens cal afegir una imatge `Banner` a la part superior i utilitzar `ScrollView` perquè el contingut es pugui desplaçar, i així completarem tota la vista de la llista de pel·lícules.

## Resum

En aquesta lliçó, hem après un punt molt important: `struct`.

Mitjançant `struct`, podem combinar diversos camps relacionats d'una pel·lícula en un sol conjunt, en lloc de descompondre el nom, el director i la puntuació en diversos arrays separats.

Quan les dades ja estan combinades, podem utilitzar `ForEach` per mostrar una a una cada pel·lícula de l'array a la vista.

Alhora, també hem entès el paper de l'"identificador de diferenciació" dins de `ForEach`: SwiftUI ha de saber com distingir cada element de l'array per poder mostrar i actualitzar la vista correctament.

Per això, hem fet que `Movie` compleixi el protocol `Identifiable` i li hem proporcionat un `id` únic.

Per evitar errors en omplir manualment `id`, també hem après `UUID()`, perquè el sistema generi automàticament l'identificador únic.

Després d'acabar aquesta lliçó, no només hauràs completat la llista de pel·lícules, sinó que també hauràs començat a entrar en contacte amb una idea important de SwiftUI: **primer organitza les dades, i després genera la vista segons les dades.**

## Codi complet

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
