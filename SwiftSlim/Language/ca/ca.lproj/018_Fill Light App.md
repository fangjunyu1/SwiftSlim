# Aplicació de llum de farciment

En aquesta lliçó, construirem una aplicació de llum de farciment molt divertida. Quan arribi la nit, podem fer que la pantalla del telèfon mostri diferents colors i utilitzar-la com una llum de farciment senzilla.

Aquesta aplicació pot canviar els colors tocant la pantalla, i també pot ajustar la brillantor amb un control lliscant.

En aquest exemple, aprendrem a utilitzar `brightness` per ajustar la brillantor de la vista, `onTapGesture` per afegir un gest de toc a una vista i el control `Slider`.

Resultat:

![Color](../../Resource/018_color.png)

## Mostrar un color

Primer, fem que la vista mostri un color.

A SwiftUI, `Color` no només representa un color, sinó que també es pot mostrar com una vista:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Aquí, `Color.red` representa una vista vermella. `.ignoresSafeArea()` fa que la vista de color ompli tota la pantalla, així que sembla més l'efecte real d'una llum de farciment.

Resultat:

![Color](../../Resource/018_color1.png)

### Matriu de colors i índex

Ara mateix només es mostra un color. Però una llum de farciment normalment no té només un color. També pot mostrar blau, groc, porpra, blanc i altres colors.

Volem canviar entre diferents colors quan es toqui la pantalla. Podem posar aquests colors dins d'una matriu per gestionar-los de manera unificada:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Una matriu és adequada per emmagatzemar "un grup de dades del mateix tipus". Aquí, cada element de la matriu és un `Color`.

Si volem mostrar un color concret, podem utilitzar un índex:

```swift
colors[0]
```

Això vol dir llegir el color de l'índex `0` de la matriu, és a dir, el primer color.

Ara el codi es pot escriure així:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

D'aquesta manera, la pantalla mostra el primer color de la matriu, que és el vermell.

### Utilitzar l'índex per controlar el color

Si necessitem canviar entre diferents colors, ens cal una variable per gestionar l'índex en lloc de deixar-lo fix.

Podem utilitzar `@State` per declarar una variable que guardi l'índex:

```swift
@State private var index = 0
```

Aquí, `index` representa l'índex del color actual.

Quan `index` canvia, SwiftUI torna a calcular la interfície i actualitza el contingut mostrat.

Després canviem l'antic `colors[0]` per:

```swift
colors[index]
```

D'aquesta manera, el color que mostra la vista queda determinat per `index`.

Ara el codi es converteix en:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Quan `index` canvia, `colors[index]` també mostrarà un color diferent.

Per exemple:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Cal tenir en compte que `index` no pot superar l'índex màxim de la matriu; si ho fa, es produirà un error d'índex fora de rang.

## Gest de toc

Ara podem mostrar diferents colors segons `index`, però encara no podem tocar per canviar-los.

A la lliçó anterior de "Carrusel de cites", vam utilitzar `Button` per controlar el canvi de cites.

Però aquesta vegada volem "tocar tota l'àrea de color" per canviar de color, així que `onTapGesture` és més adequat.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Quan toquem la vista de color, s'executa aquest codi:

```swift
index += 1
```

Això vol dir augmentar `index` en `1`. Després d'augmentar l'índex, `colors[index]` mostrarà el següent color de la matriu.

### `onTapGesture`

`onTapGesture` és un modificador de gest que afegeix una acció de toc a una vista.

Ús bàsic:

```swift
.onTapGesture {
    // code
}
```

Per exemple:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Quan es toca aquesta vista vermella, s'executa el codi dins de les claus i a la consola apareix:

```swift
Click color
```

Amb `onTapGesture`, podem definir què passa després de tocar una vista.

### Diferència amb `Button`

Abans vam aprendre la vista `Button`. Tant `Button` com `onTapGesture` poden gestionar accions de toc, però els seus escenaris d'ús no són exactament iguals.

`onTapGesture` és més adequat per "afegir funcionalitat de toc a una vista existent", com ara `Color`, `Image`, `Text` o una altra vista normal.

`Button` és més adequat quan volem representar un botó clar, com ara "Confirmar", "Enviar" o "Eliminar".

En aquesta aplicació de llum de farciment, volem que el canvi de color sigui més simple. Tocar tota l'àrea de color canvia el color, així que `onTapGesture` és una bona opció aquí.

## El problema de l'índex

Ara podem tocar la pantalla per canviar entre diferents colors.

Però aquí hi ha un problema important: **l'índex pot sortir del rang de la matriu**.

Per exemple:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Si continuem tocant la pantalla, `index` acabarà sent `4`, i aleshores es produirà un error de "index out of range".

Això passa perquè la matriu `colors` té `4` elements, però els índexs comencen a `0`, així que el rang vàlid és `0 - 3`, no pas `4`.

Si accedim a `colors[4]`, es produirà un error de "index out of range".

En el codi actual, cada toc augmenta `index` en `1`. Si no ho controlem, tard o d'hora sortirà del rang vàlid.

Per tant, hem de comprovar l'índex quan es toqui la pantalla: si ja és l'últim color, tornem al primer; en cas contrari, continuem sumant `1`.

Ho podem fer amb una instrucció `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

En aquest codi, `colors.count` significa el nombre d'elements de la matriu.

A la matriu actual hi ha 4 colors, així que:

```swift
colors.count // 4
```

Però l'índex màxim no és `4`, sinó `3`, perquè la indexació comença a `0`.

Per tant, l'últim índex s'ha d'escriure així:

```swift
colors.count - 1
```

És a dir:

```swift
4 - 1 = 3
```

Aquesta lògica vol dir: si l'índex actual ja correspon a l'últim color, reinicia'l a `0`; en cas contrari, augmenta'l en `1`.

D'aquesta manera, els colors poden anar canviant en bucle.

### Optimitzar la lògica de l'índex

Si volem que el codi sigui més concís, també podem utilitzar l'operador ternari:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Aquest codi vol dir: si `index == colors.count - 1` és cert, retorna `0`. En cas contrari, retorna `index + 1`.

Finalment, assignem el resultat de nou a `index`.

Ara ja podem aconseguir l'efecte de canvi de colors.

Codi complet:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Ara podem tocar la pantalla i canviar entre diferents colors. Ja tenim una aplicació bàsica de llum de farciment.

## Mostrar el nom del color

Podem afegir un altre grup de textos corresponents als colors, de manera que quan el color canviï, també es mostri a la pantalla el nom del color actual.

Per exemple:

- El vermell mostra `Red`
- El blau mostra `Blue`
- El groc mostra `Yellow`
- El porpra mostra `Purple`

Aquí també podem utilitzar una matriu per desar els noms dels colors:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

L'ordre dels textos d'aquesta matriu ha de correspondre exactament a l'ordre dels colors de la matriu de colors.

Després podem utilitzar `Text` per mostrar el nom del color corresponent a l'índex actual:

```swift
Text(colorsName[index])
```

`Text` mostra el nom del color actual segons `index`.

Utilitza modificadors per millorar l'aparença de `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Això fa que `Text` aparegui en blanc, amb mida de títol i amb el pes de lletra en negreta.

Ara tenim una vista `Color` a pantalla completa. Si volem que `Text` aparegui sobre la vista `Color`, hem d'utilitzar el contenidor de disposició `ZStack` per superposar-los.

```swift
ZStack {
    Color
    Text
}
```

Per tant, el codi queda així:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

D'aquesta manera, el fons és la vista de color, i a sobre hi ha una vista de text superposada.

Resultat:

![Color](../../Resource/018_color2.png)

Una cosa important a tenir en compte és que, dins d'un `ZStack`, les vistes escrites més tard acostumen a aparèixer al davant. Si `Text` s'escriu abans que `Color`, la vista `Color` posterior pot cobrir `Text`.

## Controlar la brillantor

Ara podem canviar entre diferents colors, però una llum de farciment té una altra funció important: **ajustar la brillantor**.

A SwiftUI, podem utilitzar el modificador `brightness` per ajustar la brillantor d'una vista.

Per exemple:

```swift
.brightness(1)
```

Podem escriure:

```swift
colors[index]
    .brightness(0.5)
```

Això fa que el color actual sigui més brillant i més proper a l'efecte d'una llum de farciment.

El rang de brillantor és `0 - 1`. `0` significa mantenir el color original, i com més a prop sigui el valor de `1`, més brillant es torna el color. `1` representa el resultat blanc més brillant.

Encara que podem controlar `brightness` al codi, l'usuari encara no el pot ajustar directament.

Per això hem d'afegir un control que es pugui arrossegar: `Slider`.

## Vista `Slider`

A SwiftUI, `Slider` és un control utilitzat per seleccionar un valor dins d'un rang. Apple el descriu com "un control per seleccionar un valor d'un rang lineal acotat".

Ús bàsic:

```swift
Slider(value: $value, in: 0...1)
```

Explicació dels paràmetres:

1. `value: $value`: `Slider` s'ha de vincular a una variable.

    Quan s'arrossega el control lliscant, el valor de la variable canvia al mateix temps. A l'inrevés, si la variable canvia, el control lliscant també s'actualitza.

    Això és molt semblant al `TextField` que vam aprendre abans. Tots dos "vinculen un control amb una variable".

    La variable vinculada necessita el símbol `$` al davant per representar l'enllaç.

2. `in: 0...1`: Aquest paràmetre representa el rang de valors del control lliscant.

    Aquí, `0...1` significa que el valor mínim és `0` i el valor màxim és `1`.

    Quan el control lliscant es porta completament cap a l'esquerra, la variable vinculada és propera a `0`; quan es porta completament cap a la dreta, és propera a `1`.

Per exemple:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` està vinculat a la variable `value`. Quan es mou el control lliscant, el valor de `value` també canvia al mateix temps.

Aparença:

![Slider](../../Resource/018_slider.png)

Quan el `Slider` es mou cap a l'esquerra, el valor vinculat `value` es converteix en `0`. Quan es mou cap a la dreta, es converteix en `1`.

### Rang de valors

El rang de valors de `Slider` no és fix. També es pot escriure així:

```swift
0...100
```

o com qualsevol altre rang.

Però en aquesta aplicació de llum de farciment, hem de controlar la brillantor, així que `0...1` és l'opció més adequada.

## Utilitzar `Slider` per controlar la brillantor

Ara hem de connectar `Slider` amb `brightness`.

Primer, crea una variable per emmagatzemar el valor de la brillantor:

```swift
@State private var slider = 0.0
```

Aquí, `0.0` és un valor de tipus `Double`.

Com que `Slider` normalment està vinculat a un tipus numèric, i aquí volem que canviï de manera contínua, `Double` és més adequat. A més, `brightness` només pot acceptar un valor de tipus `Double`.

Després passa aquest valor a `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Quan `slider == 0`, el color es manté en el seu estat predeterminat. Com més a prop estigui `slider` de `1`, més brillant es veu el color.

### Afegir el control `Slider`

Tot seguit, afegeix un control `Slider` per modificar aquesta variable:

```swift
Slider(value: $slider, in: 0...1)
```

Quan el control lliscant canvia, el valor de `slider` també canvia, i `brightness(slider)` actualitza la brillantor al mateix temps.

Això és un exemple molt típic de "les variables impulsen la vista" a SwiftUI.

### Ajustar l'aparença de `Slider`

Per defecte, `Slider` utilitza l'amplada disponible.

Podem donar-li una amplada fixa:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Després hi afegim alguns modificadors més perquè sigui més fàcil de veure:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Això dona al control lliscant un fons blanc i cantonades arrodonides, fent que destaqui més clarament sobre la vista `Color`.

Finalment, col·loca'l a la part inferior de la pantalla.

Com que ja hem utilitzat `ZStack`, podem posar un `VStack` a dins i fer servir `Spacer()` per empènyer el `Slider` cap avall.

## Codi complet

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Resultat:

![Color](../../Resource/018_color.png)

## Resum

Utilitzant els coneixements que hem après abans juntament amb conceptes bàsics com els colors i les matrius, hem construït una aplicació de llum de farciment molt interessant.

Amb aquesta aplicació, hem après a utilitzar `brightness` per ajustar la brillantor, `onTapGesture` per afegir accions de toc a les vistes i el control `Slider`.

Hem afegit `onTapGesture` a la vista `Color` per canviar els colors. També hem utilitzat el control `Slider` per canviar una variable que gestiona `brightness`, que és un altre exemple de "variables que impulsen la vista".

També hem repassat l'operador ternari, hem utilitzat `ZStack` per superposar vistes i hem utilitzat matrius per gestionar un grup de dades del mateix tipus. Això ajuda a aprofundir la nostra comprensió de les matrius i els índexs, incloent-hi el problema pràctic d'evitar errors d'índex fora de rang.

Tot i que aquest exemple no és complicat, connecta moltes de les idees bàsiques que hem après abans. Quan es combinen en un petit projecte real, es fa més fàcil entendre per a què serveix cada concepte.

### Escenari d'ús real

Imagina posar un iPhone antic sobre la taula i utilitzar l'aplicació de llum de farciment que has desenvolupat tu mateix per controlar el color de la llum. Seria una experiència molt agradable.

A l'App Store hi ha moltes aplicacions de "llum de farciment", i tampoc semblen gaire complicades.

![AppStore](../../Resource/018_appStore.PNG)

Podem començar desenvolupant aplicacions senzilles i provar de publicar-les a l'App Store. Això no només augmenta el nostre interès pel desenvolupament, sinó que també registra el nostre creixement.

### Pràctica després de la lliçó

Pots continuar pensant en maneres d'ampliar aquesta aplicació de llum de farciment, com ara:

- Afegir més colors
- Mostrar el valor actual de la brillantor
- Millorar el disseny de la zona inferior del control lliscant

Quan facis servir realment aquests coneixements, descobriràs que cada concepte que aprenem és en realitat una eina per crear aplicacions.

Com més eines dominem, més funcions podrem crear.
