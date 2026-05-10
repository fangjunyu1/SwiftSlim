# Adaptació de l’aparença

En aquesta lliçó aprendrem l’adaptació de l’aparença per al mode clar i el mode fosc.

A l’iPhone, l’iPad i el Mac, els usuaris poden triar el mode clar o el mode fosc.

Quan el sistema canvia al mode fosc, el color del fons, del text i de les icones de moltes apps també canvia.

Per exemple, durant el dia la interfície pot tenir un fons clar, i de nit pot convertir-se en un fons fosc.

![view](../../../Resource/025_view9.png)

Aquesta capacitat d’ajustar automàticament la visualització de la interfície segons l’aparença del sistema s’anomena adaptació de l’aparença.

## Previsualitzar l’adaptació de l’aparença a Xcode

Abans d’aprendre l’adaptació de l’aparença, vegem primer com previsualitzar el mode clar i el mode fosc a Xcode.

A la part inferior de l’àrea `Canvas`, fes clic al botó `Device Settings` per obrir la finestra emergent `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

A la finestra emergent es pot veure l’opció `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

En concret:

- `Light Appearance` indica el mode clar.
- `Dark Appearance` indica el mode fosc.

Podem canviar aquí l’aparença de la previsualització i veure com es mostra la interfície actual en mode clar i en mode fosc.

## Mostrar dues aparences en paral·lel

Si vols veure el mode clar i el mode fosc al mateix temps, pots utilitzar la funció `Variants`.

A la part inferior de l’àrea `Canvas`, fes clic al botó `Variants` i selecciona `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Després de seleccionar-ho, `Canvas` mostrarà al mateix temps la previsualització del mode clar i del mode fosc.

![canvas3](../../../Resource/025_view3.png)

Això permet comparar més fàcilment les diferències de la interfície en les dues aparences.

Dit de manera senzilla:

Si només vols canviar temporalment entre mode clar i mode fosc, pots utilitzar `Canvas Device Settings`.

Si vols veure les dues aparences alhora, pots utilitzar `Color Scheme Variants`.

## Les vistes s’adapten a l’aparença per defecte

A SwiftUI, moltes vistes del sistema s’adapten automàticament per defecte al mode clar i al mode fosc.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Clar")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("text text text")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultat visual:

![canvas](../../../Resource/025_view4.png)

Es pot veure que, en mode clar, la icona i el títol normalment es mostren amb un color fosc.

En mode fosc, la icona i el títol passen automàticament a un color clar.

Això passa perquè les vistes de SwiftUI com `Text` i `Image` ajusten el color per defecte segons l’aparença del sistema.

És a dir, si no especifiquem manualment un color fix, SwiftUI ens ajuda a gestionar una part de l’adaptació de l’aparença.

## Els colors fixos no s’intercanvien automàticament

Cal tenir en compte que, si especifiquem manualment un color fix, aquest color no s’intercanviarà automàticament segons el mode clar o fosc.

Per exemple:

```swift
Text("text text text")
	.foregroundStyle(Color.gray)
```

Aquí el text s’ha especificat com a `Color.gray`, per tant sempre es mostrarà en gris.

Un altre exemple:

```swift
Text("Títol")
    .foregroundStyle(Color.white)
```

Aquest codi mostrarà text blanc tant en mode clar com en mode fosc.

Si el fons també és clar, el text blanc pot ser difícil de llegir.

Per això, quan fem adaptació de l’aparença, hem d’evitar escriure a l’atzar colors fixos com `Color.white` o `Color.black`.

En molts casos, podem prioritzar l’ús d’estils semàntics del sistema, per exemple:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

En concret:

- `.primary` s’utilitza normalment per al contingut principal.
- `.secondary` s’utilitza normalment per al contingut secundari.

Aquests estils ajusten automàticament el resultat visual segons el mode clar o fosc.

## Mostrar contingut diferent segons l’aparença

De vegades, no només volem que canviï el color, sinó que també volem mostrar contingut diferent segons l’aparença.

Per exemple:

- En mode clar es mostra una icona de bombeta normal.
- En mode fosc es mostra una icona de bombeta il·luminada.
- En mode clar el títol mostra `Clar`.
- En mode fosc el títol mostra `Fosc`.

En aquest cas, cal determinar si el sistema actual està en mode clar o en mode fosc.

A SwiftUI, podem obtenir l’aparença actual mitjançant el valor d’entorn `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Codi complet:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Clar" : "Fosc"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("text text text")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultat visual:

![view](../../../Resource/025_view5.png)

A partir de la previsualització es pot veure que una mateixa vista no mostra exactament el mateix contingut en aparences diferents.

En mode clar, `Image` mostra una icona de bombeta normal, i el títol mostra `Clar`.

En mode fosc, `Image` mostra una icona de bombeta il·luminada, i el títol mostra `Fosc`.

És a dir, el canvi aquí no només afecta el color; també canvien el nom de la icona i el text del títol.

Això passa perquè no hem escrit directament la icona i el títol dins de `body`, sinó que hem calculat contingut diferent segons `colorScheme`.

En aquest codi hem utilitzat dues propietats calculades:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Clar" : "Fosc"
}
```

Quan `colorScheme` és `.light`, vol dir que l’aparença actual és el mode clar.

Quan `colorScheme` és `.dark`, vol dir que l’aparença actual és el mode fosc.

Per tant, podem retornar diferents noms d’icona i textos de títol segons l’aparença.

Aquest també és un ús habitual de les propietats calculades: calcular el contingut que la vista ha de mostrar segons l’estat actual.

## Entendre @Environment

Aquesta és la primera vegada que entrem en contacte amb `@Environment`.

`@Environment` es pot entendre així: llegir un valor de l’entorn de SwiftUI.

Quan l’App s’executa, el sistema proporciona molta informació d’entorn, per exemple:

- L’idioma actual
- L’aparença actual
- La direcció actual del disseny
- La configuració actual de la mida de la lletra

Quan necessitem obtenir l’aparença actual, podem llegir `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

On

```swift
\.colorScheme
```

indica que es llegeix el valor `colorScheme` de l’entorn.

```swift
private var colorScheme
```

indica que el valor llegit es desa en aquesta variable anomenada `colorScheme`.

El nom de la variable el pots decidir tu mateix. Per exemple, també es podria escriure així:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Sempre que el `\.colorScheme` del davant no canviï, vol dir que s’està llegint l’aparença actual.

## Dos valors habituals de colorScheme

`colorScheme` té dos valors habituals:

```swift
.light
.dark
```

Representen:

- `.light`: mode clar
- `.dark`: mode fosc

Per exemple:

```swift
private var titleName: String {
    colorScheme == .light ? "Clar" : "Fosc"
}
```

El significat d’aquest codi és:

Si actualment és el mode clar, `colorScheme == .light` és cert i es retorna `"Clar"`.

En cas contrari, es retorna `"Fosc"`.

Per tant, en mode clar:

```swift
Text(titleName)
```

es mostra:

```swift
Clar
```

En mode fosc, es mostra:

```swift
Fosc
```

D’aquesta manera, podem mostrar contingut diferent segons l’aparença.

## Exemple d’adaptació de colors

A més del text i les icones, de vegades també hem de gestionar nosaltres mateixos l’adaptació dels colors.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Resultat visual:

![view](../../../Resource/025_view6.png)

En aquest codi, el text és blanc i el fons és negre.

En mode clar, el fons negre és força evident.

Però en mode fosc, si el fons de tota la interfície també és negre, aquest fons negre es fusionarà amb el fons del sistema i no es veurà prou clar.

En aquest moment, podem canviar el color del text i el color del fons segons l’aparença:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Resultat visual:

![view](../../../Resource/025_view7.png)

Ara, en mode clar hi ha un fons negre i text blanc.

En mode fosc hi ha un fons blanc i text negre.

Així, sigui quina sigui l’aparença, el text i el fons tenen un contrast clar i l’usuari pot veure el contingut amb claredat.

## Utilitzar Assets per adaptar colors

A més d’utilitzar `colorScheme` per fer comprovacions manuals, també podem utilitzar colors de recurs d’`Assets` per adaptar el mode clar i el mode fosc.

Aquest mètode és més adequat per gestionar colors comuns dins d’una App.

Al projecte de Xcode, busca la carpeta de recursos `Assets`.

![assets](../../../Resource/025_color.png)

Obre la carpeta `Assets`, fes clic dret en una zona buida i selecciona `New Color Set` per crear un nou recurs de color.

![assets](../../../Resource/025_color1.png)

Aquí creem un color i l’anomenem `redText`.

![assets](../../../Resource/025_color2.png)

El recurs de color pot definir colors diferents per al mode clar i per al mode fosc.

![assets](../../../Resource/025_color3.png)

Després de seleccionar la zona de color corresponent, pots modificar el color a l’inspector de propietats de la dreta.

Fes clic al botó `Hide or show the Inspectors` de la cantonada superior dreta per obrir l’àrea d’inspectors.

Després selecciona `Show the Attributes inspector` i, a la part inferior, busca `Show Color Panel` per obrir el panell de colors.

![assets](../../../Resource/025_color4.png)

Quan fas clic en un color del panell de colors, la zona de color corresponent a `redText` canvia al mateix temps.

Aquí configurem `redText` així:

- En mode clar es mostra vermell
- En mode fosc es mostra verd

![assets](../../../Resource/025_color5.png)

Tornant al codi SwiftUI, podem utilitzar aquest color així:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

On:

```swift
Color("redText")
```

indica que es llegeix d’`Assets` el recurs de color anomenat `redText`.

Resultat visual:

![assets](../../../Resource/025_view8.png)

Es pot veure que el mateix `Color("redText")` mostra colors diferents en mode clar i en mode fosc.

Això indica que els colors d’`Assets` també admeten adaptació de l’aparença.

## Diferència entre colorScheme i Assets

Tant `colorScheme` com `Assets` poden implementar l’adaptació de l’aparença, però són adequats per a escenaris diferents.

Si només vols canviar el contingut del text, el nom de la imatge o el nom d’un `SF Symbols` segons el mode clar o fosc, pots utilitzar `colorScheme`.

Per exemple:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Si es tracta d’un color utilitzat sovint dins de l’App, per exemple el color del tema, el color de fons de les targetes o el color del text, és més recomanable utilitzar colors d’`Assets`.

Perquè els colors d’`Assets` es poden reutilitzar en diverses vistes i també són més fàcils de modificar més endavant.

Per exemple:

```swift
Color("redText")
```

Així només cal modificar el color a `Assets`, i tots els llocs que utilitzen aquest color canviaran alhora.

## Resum

En aquesta lliçó hem après l’adaptació de l’aparença per al mode clar i el mode fosc.

Primer, hem après com previsualitzar diferents aparences al `Canvas` de Xcode, i també com utilitzar `Color Scheme Variants` per veure al mateix temps el mode clar i el mode fosc.

Després, hem vist que vistes de SwiftUI com `Text` i `Image` s’adapten automàticament al color segons l’aparença del sistema.

Però, si especifiquem manualment un color fix, com ara `Color.white` o `Color.black`, aquests colors no s’intercanvien automàticament.

A continuació, hem après `@Environment` i `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Mitjançant `colorScheme`, podem determinar si actualment és el mode clar o el mode fosc, i mostrar diferents icones, textos o colors segons l’aparença.

Finalment, hem après els colors d’`Assets`.

Els colors d’`Assets` poden definir colors separats per al mode clar i per al mode fosc, i són adequats per gestionar recursos de color comuns dins d’una App.

L’adaptació de l’aparença pot fer que l’App tingui un millor resultat visual tant de dia com de nit, i també pot evitar problemes com text difícil de llegir o fons poc evident.

En el desenvolupament real, es recomana prioritzar la capacitat d’adaptació per defecte de SwiftUI i els colors d’`Assets`.

Quan calgui canviar text, icones, imatges o gestionar alguns efectes visuals especials en aparences diferents, aleshores utilitza `colorScheme` per fer la comprovació.

## Coneixement ampliat: especificar la mida de la lletra

Quan abans vam aprendre `font`, vam utilitzar alguns estils de lletra del sistema:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

A més d’utilitzar estils del sistema com `.largeTitle` i `.callout`, també es pot especificar manualment la mida de la lletra.

Per exemple:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Aquí:

```swift
.font(.system(size: 100))
```

significa establir la mida de la lletra en `100 pt`.

Per a les icones de `SF Symbols`, `font` també afecta la mida de la icona.

Per tant, si vols que una icona es mostri més gran, pots especificar la mida mitjançant `.font(.system(size:))`.

Per exemple:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Cal tenir en compte que, tot i que especificar manualment la mida de la lletra és més flexible, no es recomana utilitzar moltes mides fixes per al text normal.

Per al text normal, és millor prioritzar estils del sistema com `.title`, `.headline`, `.body` i `.caption`.

Això permet adaptar-se millor a diferents dispositius i a la configuració de mida de lletra de l’usuari.
