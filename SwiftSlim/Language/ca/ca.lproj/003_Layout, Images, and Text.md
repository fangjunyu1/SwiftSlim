# Disposició, imatges i text

A la lliçó anterior vam aprendre aquest codi de `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

En aquesta lliçó aprendrem el mecanisme de disposició per defecte de SwiftUI, així com la manera d'utilitzar imatges i text. A partir del que vam veure a la lliçó anterior, entendrem millor l'estructura de les vistes i la manera com es mostren. Aquests coneixements ens ajudaran a construir interfícies bàsiques.

## El mecanisme de disposició per defecte de SwiftUI

Quan previsualitzem `ContentView`, veurem que la icona i el text apareixen centrats, en lloc de començar des de la part superior.

![Swift](../../RESOURCE/003_view.png)

Per defecte, l'alineació dels contenidors `Stack` és `.center`, i per això les sub-vistes acostumen a mostrar-se centrades.

### `Alignment`

És evident que l'alineació centrada és només una de les opcions possibles. Si volem alinear a l'esquerra o a la dreta, hem d'utilitzar `alignment` per controlar l'alineació de la vista.

```swift
alignment
```

A SwiftUI, l'alineació acostuma a aparèixer en dos escenaris:

**1. Paràmetre d'alineació del contenidor `Stack`**

Per exemple, si volem que la icona i el text de `ContentView` s'alineïn a l'esquerra:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

En un `VStack`, `alignment` controla l'alineació en l'eix horitzontal.

Opcions d'alineació:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` ordena horitzontalment, de manera que `alignment` controla l'alineació vertical:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` superposa les vistes, i `alignment` pot controlar tant la posició horitzontal com la vertical:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Si no especifiquem `alignment` explícitament, `VStack`, `HStack` i `ZStack` utilitzen `.center` per defecte.

**2. `alignment` dins de `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Quan l'espai proporcionat per `frame` és més gran que la mida pròpia de la vista, `alignment` determina la seva posició dins d'aquest `frame`. Més endavant veurem l'ús de `frame` amb més detall; aquí només en fem una introducció.

### `Spacer` i el mecanisme de distribució de l'espai

`alignment` ens permet ordenar les vistes horitzontalment o verticalment. Però si volem que el text i les imatges es mostrin als dos extrems, una sola alineació no és suficient.

Per exemple, si volem imitar la part superior del lloc web de [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), amb la icona del lloc a l'esquerra i la del menú a la dreta.

![Swift](../../RESOURCE/003_alignment3.png)

Si només utilitzem `alignment`, totes dues icones apareixeran al mateix costat. No es podran distribuir als extrems esquerre i dret, així que necessitem `Spacer` per repartir l'espai sobrant.

`Spacer` és una vista flexible de disposició que omple automàticament l'espai disponible.

Forma d'ús:

```swift
Spacer()
```

Per exemple:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Quan afegim `Spacer` entre `Image` i `Text`, aquest ocupa l'espai sobrant i empeny la imatge i el text cap als dos extrems verticals.

![Swift](../../RESOURCE/003_view1.png)

Si hi ha diversos `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

l'espai restant es distribueix de manera uniforme entre ells.

![Swift](../../RESOURCE/003_spacer.png)

## Mostrar imatges i controlar-ne la mida

La vista `Image` s'utilitza principalment per mostrar imatges. Les icones d'SF Symbols que vam aprendre a la lliçó anterior són només un dels seus usos.

Forma d'ús:

```swift
Image("imageName")
```

Dins de les cometes dobles s'escriu el nom de la imatge, sense necessitat d'afegir l'extensió del fitxer.

### Mostrar una imatge

Primer preparem una imatge.

![Swift](../../RESOURCE/003_img.jpg)

A Xcode, selecciona la carpeta de recursos `Assets` i arrossega-hi la imatge.

![Swift](../../RESOURCE/003_img1.png)

Després, a `ContentView`, fem servir `Image` per mostrar-la:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Nota: `Image` de SwiftUI no suporta reproducció d'animacions GIF; només en pot mostrar un fotograma estàtic.

### Controlar la mida de la imatge

En SwiftUI, `Image` es mostra per defecte amb la mida original de la imatge. Si volem canviar-ne la mida de visualització, primer cal fer-la redimensionable amb `resizable`, i després utilitzar `frame` per indicar la mida de disposició.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modificador `resizable`

El modificador `resizable` permet que la imatge pugui escalar-se dins de la disposició, en lloc de quedar fixada a la seva mida original.

```swift
.resizable()
```

Només després d'afegir `resizable()` el `frame` pot canviar de debò la mida visible de la imatge.

Si ometem `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` només proporcionarà espai de disposició, però la mida real de la imatge no canviarà.

### Modificador `frame`

`frame(width:height:)` s'utilitza per especificar l'amplada i l'alçada d'una vista.

Forma bàsica:

```swift
.frame(width: 10,height: 10)
```

Per exemple, si volem establir una imatge com a rectangle d'amplada `300` i alçada `100`:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

També podem establir només l'amplada o només l'alçada:

```swift
.frame(width: 200)
.frame(height: 100)
```

La combinació `resizable + frame` ens permet controlar de manera flexible la mida de visualització de la imatge mantenint la capacitat d'escalar-se.

### Escalat: `scaledToFit` i `scaledToFill`

Quan la proporció entre amplada i alçada establerta amb `frame` no coincideix amb la proporció original de la imatge, la imatge es pot deformar.

Si volem que la imatge s'adapti a l'espai disponible mantenint la seva proporció original, podem utilitzar `scaledToFit` o `scaledToFill`.

**`scaledToFit`**

`scaledToFit` manté la proporció original de la imatge i la redimensiona perquè s'adapti completament a l'espai disponible, sense retallar-la:

```swift
.scaledToFit()
```

o bé

```swift
.aspectRatio(contentMode: .fit)
```

Aquesta opció és adequada quan volem mostrar la imatge completa sense deformació.

Si totes les imatges tenen la mateixa amplada i alçada, és fàcil que aparegui deformació.

Per exemple:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Si no s'ha establert cap mode d'escalat, la imatge no es podrà mostrar mantenint les seves proporcions originals.

![Swift](../../RESOURCE/003_img4.png)

Si afegim `scaledToFit`, la imatge mantindrà la seva proporció original.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` també manté la proporció de la imatge, però omple tot l'espai disponible; si les proporcions no coincideixen, la part sobrant queda retallada:

```swift
.scaledToFill()
```

o bé

```swift
.aspectRatio(contentMode: .fill)
```

Això és adequat quan volem que la imatge cobreixi tota una àrea, com per exemple un fons o un banner.

**Diferència entre els dos**

![Swift](../../RESOURCE/003_img6.png)

## Text

En SwiftUI, `Text` s'utilitza per mostrar text.

Forma bàsica:

```swift
Text("FangJunyu")
```

A la lliçó anterior ja vam veure `Text`; en aquesta continuarem aprenent com controlar la mida i el gruix del text perquè tingui més expressivitat dins de la vista.

### Mida del text

Podem controlar la mida del text amb el modificador `font`:

```swift
.font(.title)
```

Per exemple:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Mides de lletra habituals (de gran a petit):

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Gruix de la lletra

Si volem fer el text en negreta, podem utilitzar el modificador `fontWeight`:

```swift
.fontWeight(.bold)
```

Per exemple:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Gruixos habituals (de més fi a més gruixut):

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controla la mida de la lletra, i `fontWeight` el seu gruix. Tots dos es poden combinar per enriquir l'expressivitat del text.

## Resum i pràctica

Fins aquest punt hem après els coneixements bàsics sobre la disposició per defecte de SwiftUI, `Spacer`, `Image` i `Text`. Això ja és suficient per començar a crear algunes vistes senzilles.

Per exemple: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

La interfície de Google és molt neta. Inclou imatges i text, així que podem provar d'analitzar-ne l'estructura des del punt de vista de SwiftUI:

1. En conjunt es divideix en tres parts: el logotip de Google, el quadre de cerca i el text de suggeriment. Es pot utilitzar `VStack` per ordenar-les verticalment.
2. El logotip de Google és una imatge, així que es pot mostrar amb `Image`.
3. El quadre de cerca conté un camp d'entrada i una icona; si ignorem temporalment el camp d'entrada, podem utilitzar `Image` per mostrar la icona de cerca.
4. El text de suggeriment es mostra amb `Text`; per ordenar-lo horitzontalment es pot utilitzar `HStack`, i el color del text es pot controlar amb `foregroundStyle`.

A través de la pràctica d'aquests coneixements podem crear algunes vistes senzilles i aprofundir la comprensió i l'ús de `Image`, `Text` i dels seus modificadors.
