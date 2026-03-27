# Construir una pàgina de currículum personal

En aquesta lliçó crearem una vista senzilla de currículum personal i aprendrem els conceptes següents:

- `cornerRadius`
- `spacing`
- `ScrollView`

Durant el procés revisarem conceptes com la disposició, `Text` i `Image`, i implementarem control d'espais i efecte de desplaçament del contingut.

## Currículum personal

Resultat objectiu:

![Swift](../../RESOURCE/004_img.png)

**Primer intenta completar-lo pel teu compte i després continua llegint l'explicació.**

### Crear el projecte

Crea un nou projecte iOS o continua utilitzant el que ja havies creat abans.

El codi per defecte de `ContentView` és:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Ara esborrem el codi i comencem a escriure el nostre propi contingut:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Estructura general

En el desenvolupament real, normalment primer dissenyem l'estructura general.

La nostra pàgina conté:

1. títol
2. informació personal
3. presentació personal

Afegim un `VStack` a la capa més externa:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` garanteix l'ordre vertical de les vistes i també permet controlar-ne la disposició i l'espaiat.

### Títol

Primer, creem un `Text` per mostrar el títol.

Aquí faré servir el meu nom en anglès com a títol:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Els títols normalment són més grans i en negreta, així que fem servir els modificadors `font` i `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Maquetació

L'alineació per defecte a SwiftUI és `center`, de manera que ara el títol es mostra al mig de `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Nosaltres volem mostrar el títol a la part superior de la vista, així que podem utilitzar `Spacer` per ajustar la disposició:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` ocuparà l'espai restant i empenyerà el `Text` cap a la part superior del contenidor.

![Swift](../../RESOURCE/004_img4.png)

### Espai en blanc

Si creiem que el text és massa a prop de la part superior, podem utilitzar `padding` o `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Això estableix un marge superior de `20` per al `VStack`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

També podem utilitzar `Spacer` i establir una alçada amb `frame` per aconseguir un espai en blanc d'una mida concreta.

Efecte obtingut:

![Swift](../../RESOURCE/004_img5.png)

### Imatge

Preparem una fotografia de perfil i la posem dins de la carpeta de recursos `Assets`.

![Swift](../../RESOURCE/004_img6.png)

A `ContentView`, fem servir `Image` per mostrar la imatge:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Com que la mida original de la imatge és bastant gran, hem d'utilitzar `frame` per controlar-ne la mida de visualització.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

En aquest moment ens adonarem d'un problema:

si la proporció entre amplada i alçada del `frame` no coincideix amb la proporció original de la imatge, la imatge es deformarà.

Per exemple:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Per evitar aquesta deformació, hem d'utilitzar `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

La funció de `scaledToFit` és:

dins del `frame` donat, escalar la imatge segons la seva proporció original i mostrar-ne completament el contingut.

No estira la imatge a la força per omplir tot el `frame`, sinó que manté la proporció entre amplada i alçada i l'escala proporcionalment fins que un dels costats s'ajusta just al límit.

Això significa:

- si l'amplada del `frame` és menor, la imatge s'escalarà prenent l'amplada com a referència
- si l'alçada del `frame` és menor, la imatge s'escalarà prenent l'alçada com a referència
- la imatge sempre manté la seva proporció original i no es deforma

Habitualment n'hi ha prou amb fixar una sola direcció. Per exemple:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

D'aquesta manera, el sistema calcularà automàticament una alçada adequada a partir de l'amplada `140`, mantenint la proporció de la imatge.

Si necessitem una proporció visual fixa o evitar compressió en disposicions més complexes, podem limitar amplada i alçada alhora.

### Cantonades arrodonides

Si volem que la imatge es mostri amb cantonades arrodonides, podem utilitzar el modificador `cornerRadius`:

```swift
.cornerRadius(10)
```

Per exemple:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Afegim `cornerRadius(20)` després dels modificadors de `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` significa retallar el límit de la vista i aplicar-hi un radi d'arrodoniment de `20`.

Després d'afegir cantonades arrodonides, els quatre cantons de la imatge passen a ser corbats, cosa que dóna un efecte visual més suau i modern.

Aquest estil de disseny és molt habitual en les interfícies actuals. Per exemple, les icones d'app d'iOS també tenen forma de rectangle arrodonit, tot i que les icones del sistema utilitzen una superel·lipse de curvatura contínua i no una simple cantonada arrodonida.

### Informació personal

Ara comencem a construir la zona d'informació personal situada a l'esquerra de la imatge. Mirant l'estructura de la interfície, es veu que la informació personal i la imatge s'ordenen horitzontalment, de manera que necessitem `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

El contingut de la informació personal, però, està ordenat verticalment.

![Swift](../../RESOURCE/004_img11.png)

Per tant, utilitzem `HStack` a l'exterior, `VStack` per a la informació personal i `Text` per al contingut.

Estructura bàsica:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Posar en negreta el nom dels camps**

Per distingir el nom del camp del valor del camp, podem aplicar `fontWeight` als noms:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Alinear el text a l'esquerra**

`VStack` està centrat per defecte. Si volem alinear tot el text a l'esquerra, hem d'establir explícitament l'alineació:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` significa alineació cap al costat esquerre en un entorn d'idioma d'esquerra a dreta.

![Swift](../../RESOURCE/004_img14.png)

### Espaiat

Si volem mantenir una distància fixa entre la informació personal i la imatge, abans vam aprendre a fer servir `Spacer` per crear espai en blanc:

```swift
Spacer()
    .frame(width: 10)
```

També podem utilitzar el paràmetre `spacing` de `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` significa que la distància entre les dues sub-vistes serà de `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Què és `spacing`?**

A `VStack`, `HStack` i `ZStack`, `spacing` controla la distància entre sub-vistes.

Per exemple:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

La distància entre les sub-vistes de `VStack` serà de `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Cal tenir en compte que `spacing` només afecta les «sub-vistes directes» i no modifica la disposició dins dels contenidors imbricats.

**Controlar l'espaiat intern d'una llista**

Si volem augmentar la distància entre camps, la manera més directa és establir `spacing` al `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

D'aquesta manera, la distància entre totes les sub-vistes passarà a ser de `10 pt`.

Però si observem la interfície, apareix un problema:

hi ha espai entre grups de camps, però també apareix el mateix espai entre el nom del camp i el seu valor.

Això és perquè `spacing` s'aplica a totes les sub-vistes directes del contenidor actual.

En aquesta estructura, cada `Text` és una sub-vista directa del `VStack` exterior, de manera que l'espaiat és uniforme.

Si volem que hi hagi espai entre grups de camps però que el nom i el valor d'un mateix camp mantinguin l'espai compacte per defecte, podem tractar «nom del camp + valor del camp» com una sola unitat lògica i embolicar-la amb un altre `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Amb aquesta estructura, hi haurà espai entre els `VStack` exteriors, mentre que dins dels `VStack` interns es mantindrà l'espai compacte per defecte. Així, entre el nom i el valor del camp no apareixerà un buit extra.

![Swift](../../RESOURCE/004_img18.png)

### Presentació personal

A continuació implementem la zona de presentació personal.

Mirant l'estructura de la interfície, el contingut de la presentació està format per diverses línies de text ordenades verticalment.

![Swift](../../RESOURCE/004_img19.png)

Per tant, podem utilitzar `VStack` juntament amb `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Afegir espaiat**

Ara la informació personal i la presentació personal queden massa juntes i l'estil no és gaire agradable.

![Swift](../../RESOURCE/004_img20.png)

Com que totes dues estan dins del mateix contenidor exterior, podem controlar l'espaiat general en aquest contenidor:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Resultat:

![Swift](../../RESOURCE/004_img21.png)

**Espaiat de la llista**

Utilitzem `spacing` per establir la distància entre els textos de la presentació:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Acabar el currículum personal

Ara l'estructura bàsica del nostre currículum personal ja està acabada.

![Swift](../../RESOURCE/004_img.png)

### Vista desplaçable

Ara mateix l'estructura de la pàgina utilitza `VStack`, i no hi ha cap problema quan hi ha pocs textos de presentació. Però si augmentem el contingut a 20 línies, 30 línies o més, l'alçada del contingut superarà la pantalla.

Per exemple:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

En aquest moment apareixeran dos fenòmens:

- el contingut inferior quedarà tallat
- la pàgina no es podrà desplaçar

Això no és un problema de `VStack`; `VStack` és només un contenidor de disposició i no proporciona capacitat de desplaçament automàticament.

**Què és `ScrollView`**

`ScrollView` és un contenidor desplaçable, adequat per a contingut abundant que supera la mida de la pantalla, com llistes verticals o horitzontals.

Estructura bàsica:

```swift
ScrollView {
    ...
}
```

Si volem aconseguir l'efecte de desplaçament, hem d'embolcallar tot el contingut de la pàgina dins de `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

D'aquesta manera, tota la pàgina es converteix en una àrea desplaçable, i quan el contingut supera l'alçada de la pantalla, es podrà desplaçar de manera natural.

`ScrollView` mostra per defecte l'indicador de desplaçament. Si volem amagar-lo, podem configurar:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Codi complet

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
