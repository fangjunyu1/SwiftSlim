# Galeria de fotos

En aquesta lliçó, crearem una pàgina de galeria de fotos.

![view](../../../Resource/032_view13.png)

En aquest cas, repassarem els coneixements sobre `extension`, `self` i les instàncies, i aprendrem les figures `Shape` que s'utilitzen sovint a SwiftUI.

Amb aquests coneixements, podem retallar imatges normals en diferents estils, com ara cercles, rectangles arrodonits, formes de càpsula i el·lipses, i afegir efectes de vora a les fotos.

En aquesta lliçó farem servir alguns conceptes nous: `Shape`, `clipShape`, `strokeBorder` i `overlay`.

Entre ells, `clipShape` s'utilitza per retallar la forma d'una vista, `strokeBorder` s'utilitza per dibuixar la vora d'una figura, i `overlay` s'utilitza per superposar una vista nova sobre una vista.

## Recursos d'imatge

Abans de començar, hem de preparar diverses imatges.

Pots fer servir les teves pròpies fotos, o també pots utilitzar les imatges d'exemple proporcionades en aquesta lliçó.

Les fotos d'exemple d'aquesta lliçó provenen del lloc web [Pixabay](https://pixabay.com/):

[Paisatge](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Guineu](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Edifici](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Flor](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Cigne](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Després de descarregar les imatges, afegeix-les a la carpeta de recursos `Assets` i posa'ls, per ordre, els noms `1`, `2`, `3`, `4` i `5`.

![assets](../../../Resource/032_view17.png)

D'aquesta manera, a SwiftUI podrem mostrar les imatges amb `Image("1")`, `Image("2")` i altres formes semblants.

## Mostrar fotos

Primer, mostrem 5 fotos a `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecte mostrat:

![view](../../../Resource/032_view.png)

En aquest fragment de codi, fem servir `ScrollView` per implementar el desplaçament de la llista de fotos, i fem servir `VStack` perquè diverses imatges s'organitzin de dalt a baix.

Cada imatge configura l'efecte de visualització amb `.resizable()`, `.scaledToFit()` i `.frame(width: 300)`, de manera que la imatge es pugui escalar, es mostri completa mantenint la proporció i tingui una amplada limitada.

`.padding(.vertical, 100)` sobre `VStack` s'utilitza per augmentar l'espai superior i inferior, i evitar que la primera i l'última foto quedin massa enganxades a les vores de la pantalla.

L'últim `.ignoresSafeArea()` indica que la vista de desplaçament ignora l'àrea segura, de manera que les fotos poden estendre's fins a la part superior i inferior de la pantalla quan es desplacen, i la pàgina es mostra de manera més completa.

Tanmateix, ara les 5 imatges fan servir els mateixos modificadors:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Quan veiem codi repetit, podem considerar ordenar-lo amb `extension`.

## Utilitzar extension per ordenar l'estil de les imatges

Podem ampliar `Image` amb un mètode específic per a la galeria de fotos:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aquí, hem ampliat el tipus `Image` amb un mètode `photoGalleryStyle`.

Aquest mètode conté internament `.resizable()`, `.scaledToFit()` i `.frame(width: 300)`, que abans fèiem servir repetidament. És a dir, agrupa el codi d'escalat de la imatge, visualització proporcional i configuració de l'amplada.

Després d'utilitzar aquesta extensió, el codi original de la imatge:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

es pot simplificar així:

```swift
Image("1")
    .photoGalleryStyle()
```

D'aquesta manera, cada imatge només ha de cridar `.photoGalleryStyle()` per aplicar el mateix estil de galeria de fotos. El codi serà més concís i també serà més fàcil modificar-lo de manera unificada més endavant.

## Entendre self

En el mètode d'extensió, hem escrit `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aquí, `self` representa la instància d'imatge actual que crida aquest mètode.

Per exemple:

```swift
Image("1")
    .photoGalleryStyle()
```

En aquest codi, `photoGalleryStyle()` és cridat per `Image("1")`, de manera que el `self` dins del mètode representa aquesta imatge `Image("1")`.

Ho podem entendre de manera senzilla així: qui crida aquest mètode, això és el que representa `self`.

Cal tenir en compte que els modificadors de SwiftUI retornen contínuament resultats de vista nous. Per tant, `photoGalleryStyle()` retorna una vista ja modificada, no simplement la `Image` original mateixa.

## Formes de les fotos

Ara, les fotos ja es poden mostrar correctament. Tot i això, aquestes fotos són rectangles per defecte i tenen un aspecte bastant normal.

Si només volem que una foto tingui cantonades arrodonides, podem utilitzar directament `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Efecte mostrat:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` indica que s'afegeix a la imatge un radi de cantonada de `20 pt`. Per a una imatge arrodonida normal, aquesta forma d'escriure-ho ja és suficient.

Tanmateix, `.cornerRadius()` només pot gestionar l'efecte de cantonades arrodonides, i és adequat per crear imatges normals amb cantonades arrodonides. Si volem convertir la foto en més formes diferents, aquest modificador per si sol no és suficient.

En aquest moment, cal utilitzar `Shape` a SwiftUI. `Shape` pot representar diferents figures i, combinat amb `clipShape`, pot retallar una imatge amb la forma corresponent.

## Conèixer Shape

A SwiftUI, `Shape` representa una figura. Igual que `View`, és un tipus molt utilitzat a SwiftUI.

Els `Shape` més comuns inclouen el cercle, el rectangle, el rectangle arrodonit, la forma de càpsula i l'el·lipse. Per observar de manera més intuïtiva l'aspecte de diferents figures, els exemples següents configuren colors i mides diferents per a cada figura.

En aquests exemples, `.fill()` s'utilitza per omplir la figura amb color, i `.frame()` s'utilitza per configurar-ne la mida de visualització. Els colors només serveixen per distingir les figures, i no són el color fix de la figura en si.

### Circle cercle

`Circle` representa un cercle. Sovint s'utilitza en avatars, botons circulars, imatges circulars i altres efectes d'interfície.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rectangle

`Rectangle` representa un rectangle. És una de les figures més bàsiques, i també es pot utilitzar per crear fons, dividir àrees o fer vores normals.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle rectangle arrodonit

`RoundedRectangle` representa un rectangle arrodonit. `cornerRadius` s'utilitza per configurar la mida de les cantonades arrodonides.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule forma de càpsula

`Capsule` representa una forma de càpsula. Els seus dos extrems són arcs circulars, i sovint s'utilitza en botons de tipus càpsula, fons d'etiquetes i altres efectes d'interfície.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse el·lipse

`Ellipse` representa una el·lipse. S'assembla a `Circle`, però quan l'amplada i l'alçada no són iguals, es mostra com una el·lipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

A través d'aquests exemples podem veure que `Shape` es pot mostrar directament com una figura. A continuació, utilitzarem aquests `Shape` amb `clipShape` per retallar les fotos i fer que es mostrin amb diferents formes.

## Utilitzar clipShape per retallar fotos

Ara podem utilitzar `clipShape` per retallar les fotos en diferents formes.

Per exemple, retallem la primera foto com un cercle:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Aquest codi indica: primer mostra una imatge, i després utilitza `Circle()` per retallar-la en forma de cercle.

![view](../../../Resource/032_view2.png)

L'escriptura bàsica de `clipShape` és:

```swift
.clipShape(forma)
```

Afegim `.clipShape(...)` darrere de la vista, i dins dels parèntesis escrivim la figura amb què volem retallar-la.

Per exemple:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Ara retallem les 5 fotos amb formes diferents:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecte mostrat:

![view](../../../Resource/032_view8.png)

Entre elles, l'efecte després de retallar amb `Rectangle()` és similar al d'una foto rectangular normal, així que el canvi visual no és evident; s'utilitza principalment per comparar-lo amb les altres formes.

Ara, les fotos ja no són només rectangles normals, sinó que tenen formes diferents.

## Afegir una vora a les fotos

Si volem afegir una vora a una foto circular, potser pensarem a utilitzar `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Però normalment el resultat no és una vora circular, sinó una vora rectangular.

![view](../../../Resource/032_view9.png)

Això passa perquè `border` afegeix la vora segons l'àrea rectangular de la vista, no segons la forma després del retall amb `clipShape`.

Per tant, si volem una vora circular, no podem utilitzar directament `border`.

## Utilitzar strokeBorder per dibuixar vores de figures

A SwiftUI, `strokeBorder` pot dibuixar una vora interna per a aquests `Shape` habituals.

Per exemple, dibuixem una vora circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Aquest codi indica: dibuixa una vora marró per a `Circle`, amb una amplada de vora de `10 pt`.

![view](../../../Resource/032_view12.png)

Aquí cal tenir en compte que `strokeBorder` no afegeix directament una vora a la foto, sinó que dibuixa una vora per a la figura `Circle()`.

És a dir, aquest codi només obté una vora circular independent, i encara no té relació amb la foto.

Si volem que aquesta vora circular es mostri damunt de la foto, hem de continuar utilitzant `overlay` per superposar la vora sobre la foto.

## Utilitzar overlay per superposar la vora

`overlay` és un modificador de vista que pot superposar una vista nova sobre la vista actual.

La seva estructura bàsica es pot entendre així:

```swift
vista actual
    .overlay {
        vista superposada
    }
```

En aquest cas, la vista actual és la foto que ja s'ha retallat com un cercle:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

La nova vista que volem superposar és una vora circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Per tant, podem combinar la foto i la vora així:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Aquí, `overlay` indica que se superposa una vista nova sobre la vista actual.

Dins d'`overlay`, la vora se superposa seguint l'àrea de visualització de la foto actual, de manera que no cal configurar un `frame` addicional. Mentre la forma de la vora i la forma de retall siguin iguals, la vora podrà encaixar amb la foto.

![view](../../../Resource/032_view10.png)

L'efecte final és que una vora circular queda coberta sobre la foto circular.

En comparació amb `ZStack`, `overlay` és més adequat per a aquest tipus d'escenari de “afegir decoració a la vista actual”. La foto és el subjecte principal, i la vora només és un efecte afegit; per això, utilitzar `overlay` resulta més clar.

## Completar la galeria de fotos

Ara afegim a cada foto la forma i la vora corresponents:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecte mostrat:

![view](../../../Resource/032_view13.png)

Així, queda completada una pàgina bàsica de galeria de fotos.

En aquesta pàgina, fem servir `ScrollView` per implementar la visualització amb desplaçament, `Image` per mostrar les fotos, `clipShape` per retallar la forma de les fotos, i `overlay` amb `strokeBorder` per afegir les vores.

## Codi complet

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Resum

En aquesta lliçó, hem completat una pàgina de galeria de fotos.

![view](../../../Resource/032_view13.png)

En aquest cas, primer hem utilitzat `Image` per mostrar les fotos, i després hem ampliat `Image` amb un mètode `photoGalleryStyle` mitjançant `extension`, per ordenar el codi repetit de l'estil de les imatges.

Després, hem après alguns `Shape` habituals de SwiftUI, com ara `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` i `Ellipse`. Aquestes figures no només es poden mostrar directament, sinó que també es poden combinar amb `clipShape` per retallar vistes.

Per exemple:

```swift
.clipShape(Circle())
```

indica que la vista es retalla com un cercle.

Finalment, hem utilitzat `overlay` i `strokeBorder` per afegir a les fotos una vora amb la forma corresponent. Cal tenir en compte que `border` normalment dibuixa la vora segons l'àrea rectangular de la vista; si volem que la vora segueixi un cercle, una càpsula o una el·lipse, és més adequat superposar el mateix `Shape`.

A través d'aquesta lliçó, no només hem completat l'efecte de galeria de fotos, sinó que també hem entès la combinació habitual de `Shape`, `clipShape`, `strokeBorder` i `overlay` en una interfície.

## Exercicis després de classe

### 1、Afegir un fons a la galeria de fotos

Afegeix una imatge de fons de pantalla completa a la pàgina de la galeria de fotos.

Requisit: la imatge de fons pot omplir tota la pantalla i ignorar l'àrea segura.

### 2、Vora amb degradat

Modifica les vores de color únic existents perquè siguin vores amb degradat lineal.

Pots provar d'utilitzar `LinearGradient` per crear un efecte de vora més ric.

### 3、Imitar una vora de foto real

Busca a Internet alguns estils de vores de fotos reals, i prova d'utilitzar `overlay` per superposar una imatge de vora, de manera que la foto s'assembli més a un marc real.

Efecte mostrat de l'exercici:

![button](../../../Resource/032_view15.jpeg)

### 4、Implementar una vora per a un botó amb cantonades arrodonides

En el desenvolupament real, els botons sovint utilitzen vores de rectangle arrodonit.

Prova de crear un botó amb cantonades arrodonides i utilitza `RoundedRectangle` amb `strokeBorder` per afegir-li una vora arrodonida.

Efecte mostrat de l'exercici:

![button](../../../Resource/032_view14.png)

### Pregunta de reflexió

Si no volem utilitzar una vora de color únic ni una vora amb degradat, sinó que volem que la vora presenti algun tipus de patró, com ho hauríem d'implementar?

Pots provar de buscar informació i conèixer usos relacionats amb `overlay`, `mask` o `ImagePaint`.

Efecte mostrat de l'exercici:

![button](../../../Resource/032_view16.png)
