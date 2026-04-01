# Bucles i llistes

En aquesta lliçó, aprendrem el bucle `for` de Swift i `ForEach` de SwiftUI.

Tots dos ens poden ajudar a llegir els elements d’un array en ordre. En el desenvolupament real, sovint necessitem extreure un conjunt de dades una a una, i després processar-les o mostrar-les. I els bucles són precisament una eina important per fer això.

Quan naveguem per la web o fem servir una app, sovint veiem moltes llistes o elements. Aquest tipus de contingut normalment es desa primer en un `array`, després es llegeix un per un mitjançant un `bucle`, i finalment es mostra a la interfície.

Per exemple, la llista de resultats de cerca de Google:

![Google](../../Resource/017_google.png)

Cada element de la llista de resultats de cerca sol correspondre a una dada, i es mostra un per un mitjançant un bucle.

Per tant, els `arrays` i els `bucles` sovint apareixen junts. L’`array` s’encarrega de desar un conjunt de dades, i el `bucle` s’encarrega d’extreure aquestes dades en ordre i executar la mateixa operació.

A continuació, comencem pel `for` més bàsic.

## Compte enrere

Suposem que volem simular una funció de compte enrere i imprimir `“5, 4, 3, 2, 1”` en ordre.

La manera més directa d’escriure-ho és:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Aquesta manera pot simular un compte enrere, però si hi ha molt contingut, es torna molt repetitiva, i després tampoc és gaire còmode de modificar.

En aquest cas, primer podem posar les dades dins d’un array i després fer servir un bucle `for` per imprimir-les una a una:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Aquesta manera és més concisa i també més fàcil d’ampliar. Encara que hi hagi molts números en el compte enrere, no cal escriure `print` línia per línia; només cal deixar que el bucle processi automàticament cada element de l’array.

Podem posar aquest codi dins d’un botó per provar-lo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Quan premem el botó, el bucle `for` anirà traient cada enter de `countDown` en ordre i l’imprimirà a la consola.

A continuació, veiem com funciona el bucle `for`.

## Bucle for

El bucle `for` s’utilitza per processar un conjunt de dades en ordre. Els casos més habituals són els arrays i els rangs.

Sintaxi bàsica:

```swift
for element in array_o_rang {
    codi_a_executar
}
```

Per exemple, el codi del compte enrere d’abans:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Aquí, `i` representa l’element actual extret, i darrere de `in` hi ha les dades que es recorren, és a dir, l’array `countDown`.

Aquest codi significa que el programa anirà traient cada element de l’array `countDown` en ordre. Cada vegada que extreu un element, el representa temporalment amb `i`, i després executa el codi que hi ha dins de les claus.

El procés d’execució es pot entendre així:

* El primer element que s’extreu és `5`, per tant en aquest moment el valor de `i` és `5`
* S’executa `print(i)` i s’imprimeix `5`
* Després continua i extreu l’element següent `4`
* Torna a executar `print(i)` i imprimeix `4`

Els elements següents `3`, `2` i `1` també s’executaran de la mateixa manera, un darrere l’altre.

![for](../../Resource/017_for.png)

Quan tots els elements de l’array s’han processat, el bucle `for` acaba automàticament.

Podem fer servir el bucle `for` per obtenir cada element de l’array i completar funcions com aquest compte enrere.

**Consell**: `i` és una manera molt habitual d’anomenar la variable en un bucle `for`, i s’utilitza per representar l’element actual extret, però no és una forma fixa. També pots fer servir altres noms en anglès.

Per exemple, podem fer servir `num` per representar cada element extret:

```swift
for num in countDown {
    print(num)
}
```

Dins de les claus, també cal fer servir `num` per representar l’element actual.

### Recórrer un rang

El bucle `for` no només pot recórrer arrays, sinó també rangs.

Per exemple, quan necessitem calcular la suma dels enters positius fins a `50`, cal sumar tots els enters entre `1` i `50`, un darrere l’altre.

La manera més directa potser seria:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

El problema d’aquesta manera és que hem d’escriure cada número manualment. És feixuc i no és adequat per a escenaris reals de desenvolupament.

En aquest cas, podem fer servir l’operador de rang juntament amb el bucle `for`.

A la lliçó anterior sobre “operadors”, ja hem après l’operador de rang:

```swift
1...3   // 1, 2, 3
```

Aquí, `...` indica un rang tancat, és a dir, que inclou tant el valor inicial com el final.

Per tant, aquí podem fer servir un bucle `for` sobre el rang d’enters de `1` a `50`:

```swift
for i in 1...50 {
    
}
```

Necessitem sumar aquests enters, així que també ens cal una variable per desar el total:

```swift
var count = 0
```

Després, a cada iteració del bucle, afegim el número actual extret a `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Aquest codi significa:

* `count` s’utilitza per desar la suma actual
* El bucle `for` anirà traient els enters de `1` a `50` un per un
* Cada vegada que s’extreu un enter, s’executa `count += i`
* Quan el bucle acaba, `count` conté la suma final

Així, podem obtenir la suma de tots els enters positius fins a `50`.

De la mateixa manera, si volem calcular la suma dels enters de `1` a `100`, només cal canviar el rang:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

El bucle `for` no només pot recórrer arrays, sinó també un rang.

Aquesta capacitat de processar dades repetitives en ordre és molt habitual en el desenvolupament.

Ens pot ajudar a gestionar automàticament molta feina repetitiva, sense haver d’escriure manualment la suma de cada número ni altres operacions repetitives semblants.

## Bucles a SwiftUI

El `for` anterior pertany al llenguatge Swift.

Però a SwiftUI, no podem fer servir directament `for` dins de l’estructura de la vista per generar vistes:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Això és perquè dins de `VStack` el que cal són vistes de SwiftUI, i un bucle `for` normal no és una vista per si mateix.

Si a SwiftUI volem generar interfície repetidament segons el contingut d’un array, cal fer servir `ForEach`.

Per exemple, si volem mostrar els noms de tots els membres d’un grup, podem escriure-ho així:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Resultat visual:

![for1](../../Resource/017_for1.png)

Després, afegim els mateixos modificadors a cada `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ara, cada `Text` es mostrarà amb una lletra més petita i més gruixuda.

Resultat visual:

![](../../Resource/017_for2.png)

Encara que els modificadors fan que la interfície sigui més bonica, també fan que el codi sigui més llarg i més repetitiu.

Si el nombre de noms continua augmentant, o més endavant volem modificar de manera uniforme el tipus de lletra, el color o altres estils, haurem d’escriure i modificar molt codi semblant repetidament, cosa que resulta feixuga i poc còmoda de mantenir.

En aquest cas, podem posar primer aquests noms dins d’un array i després fer servir `ForEach` de SwiftUI per generar les vistes repetidament segons les dades de l’array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Aquest conjunt de codi és més concís. `ForEach` llegirà cada element de l’array en ordre i mostrarà el contingut corresponent a la interfície.

Quan després afegim noms nous, només caldrà modificar els noms dins de l’array `names`, i no caldrà afegir cada vegada més `Text` ni tots els modificadors repetits.

## ForEach

`ForEach` és una estructura de SwiftUI que s’utilitza per generar vistes repetidament. Pots entendre-la com una estructura de SwiftUI semblant a un bucle `for`.

Ús bàsic:

```swift
ForEach(array, id: \.self) { element in
    codi de SwiftUI
}
```

Per exemple, els noms del grup d’abans:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Aquest codi significa:

`names` és l’array que es recorre, és a dir, les dades que es volen mostrar.

`id:\.self` significa que es farà servir el mateix element de l’array per distingir cada element.

En aquest exemple, l’array conté cadenes de text:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Per tant, SwiftUI farà servir directament les mateixes cadenes `"Sam"`, `"John"`, `"Wathon"` i `"Bob"` per distingir els diferents continguts.

Per als arrays simples habituals en l’etapa inicial, com ara `String` i `Int`, normalment podem escriure directament:

```swift
id: \.self
```

Ara mateix, només cal que recordis aquesta manera d’escriure-ho. No cal aprofundir de moment en més regles sobre `id`.

A `item in`, `item` representa l’element actual extret.

Per exemple, en la primera iteració `item` és `"Sam"`, i en la segona és `"John"`.

Per tant:

```swift
Text(item)
```

es convertirà successivament en:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Així doncs, la funció d’aquest codi és extreure cada nom de l’array `names` un per un, i generar una vista `Text` per a cada nom.

### Procés d’execució

El procés d’execució es pot entendre així:

* `ForEach` llegeix primer el primer element `"Sam"` de l’array `names`
* `item` representa temporalment `"Sam"`
* `Text(item)` mostra `"Sam"`
* Després continua llegint l’element següent `"John"`
* I torna a executar el mateix codi de la vista

Finalment, tots els noms de l’array es mostraran.

L’avantatge d’aquesta manera d’escriure-ho és que, quan hi ha més noms, no cal escriure molts `Text` repetidament; només cal modificar el contingut de l’array.

### Recórrer fotos

`ForEach` no només pot mostrar text, sinó també imatges, colors o altres vistes de SwiftUI.

Per exemple, preparem 4 imatges:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Arrossega aquestes quatre imatges a la carpeta Assets d’Xcode.

![image](../../Resource/017_for3.png)

Si no fem servir `ForEach`, haurem d’escriure cada imatge manualment:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Resultat visual:

![image](../../Resource/017_for4.png)

Aquesta manera pot aconseguir la funció, però el codi serà relativament llarg.

Si hi ha cada vegada més imatges, caldrà escriure cada vegada més codi `Image` repetit.

Més endavant, si volem modificar de manera uniforme la mida de les imatges, també caldrà canviar-les una per una.

En aquest cas, podem posar els noms de les imatges dins d’un array i després fer servir `ForEach` per generar repetidament les vistes d’imatge:

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

Aquí, `images` és un array de cadenes de text, i cada element és el nom d’una imatge.

`ForEach(images, id: \.self)` significa que es llegirà cada element de l’array `images` en ordre, s’utilitzarà el mateix element per distingir cada element, i després es generarà la vista corresponent segons l’element actual.

Per exemple, si el primer element llegit és `"430F9BEF"`, llavors:

```swift
Image(item)
```

equival a:

```swift
Image("430F9BEF")
```

Les imatges següents també es mostraran de la mateixa manera, una darrere l’altra.

![image](../../Resource/017_for4.png)

Aquí continuem fent servir:

```swift
id: \.self
```

La raó és la mateixa que abans, perquè els elements de l’array `images` també són cadenes de text simples, així que en la fase inicial podem utilitzar directament el mateix element com a forma de distingir-los.

Ho pots entendre de manera simple com una fórmula fixa:

**Quan `ForEach` recorre un array simple de tipus `String` o `Int`, normalment escrivim `id: \.self`.**

### Afegir imatges

Si més endavant necessitem afegir imatges noves, només caldrà modificar el contingut de l’array:

```swift
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

No caldrà tornar a escriure més codi `Image`.

Si hi ha moltes imatges, ho podem combinar amb `ScrollView`; si no, quan el contingut surti fora de la pantalla, no es podrà previsualitzar completament.

```swift
ScrollView {
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

### Modificar imatges

Quan necessitem modificar l’estil de les imatges de manera uniforme, només cal modificar el codi que hi ha dins de `ForEach`.

Per exemple, canviar l’amplada a `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Així, totes les imatges es modificaran alhora, i no caldrà canviar-les una per una.

Aquesta és una funció important de `ForEach`:

**Quan diverses vistes tenen la mateixa estructura i només canvia el contingut, podem escriure el codi de la vista una sola vegada, i deixar que les dades de l’array decideixin què es mostra.**

## Resum

En aquesta lliçó, hem après el bucle `for` i `ForEach`.

El bucle `for` s’utilitza per processar en ordre els elements d’un array o d’un rang, i està més orientat al tractament de dades.

`ForEach` s’utilitza a SwiftUI per generar vistes repetidament segons el contingut d’un array, i està més orientat a la visualització de la interfície.

En l’etapa inicial actual, la manera més habitual d’escriure `ForEach` és:

```swift
ForEach(array, id: \.self) { element in
    codi de SwiftUI
}
```

Aquí, `id: \.self` significa que s’utilitza el mateix element per distingir cada element.

Quan el contingut de l’array és d’un tipus simple com `String` o `Int`, normalment al principi podem fer servir aquesta única manera d’escriure-ho.

Més endavant, quan navegis per la web o facis servir apps i vegis un conjunt de textos repetits, imatges o altres continguts de llista, pots recordar que a SwiftUI aquest contingut normalment primer es col·loca dins d’un array i després es mostra un per un amb `ForEach`.
