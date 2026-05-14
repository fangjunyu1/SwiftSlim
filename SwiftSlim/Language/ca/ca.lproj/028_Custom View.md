# Vista personalitzada

En aquesta lliçó, aprendrem una escriptura molt important de SwiftUI: **les vistes personalitzades**.

Una vista personalitzada pot encapsular un fragment de codi de vista repetit i convertir-lo en una vista que es pot reutilitzar moltes vegades.

Quan desenvolupem una App real, sovint ens trobem amb aquesta situació: moltes pantalles tenen la mateixa estructura, però mostren continguts diferents.

Per exemple, en una llista de publicacions d'un fòrum, cada publicació pot tenir un títol, una imatge, un nombre de m'agrada i altra informació.

![Reddit](../../../Resource/028_view1.png)

En una llista de productes d'una botiga en línia, cada producte pot tenir una imatge, un nom, un preu i altra informació.

![Amazon](../../../Resource/028_view2.png)

L'estructura d'aquests continguts és semblant; la diferència és que les dades que es mostren són diferents.

Si escrivim manualment el codi de cada element, el codi es farà molt llarg i tampoc serà còmode de modificar més endavant.

Per tant, podem encapsular l'estructura comuna en una vista personalitzada i passar-hi els continguts diferents com a paràmetres.

Així, una mateixa vista pot mostrar continguts diferents.

## Escenari de necessitat

Per exemple, ara volem crear una llista de configuració.

Efecte visual:

![view](../../../Resource/028_view.png)

En aquesta llista de configuració hi ha tres elements de configuració diferents: `Settings`, `Folder` i `Music`.

Tot i que la icona, el color i el títol són diferents, l'estructura general és la mateixa:

- Icona a l'esquerra
- Color de fons de la icona
- Títol al centre
- Fletxa a la dreta

Si no fem servir una vista personalitzada, podríem escriure el codi així:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Settings")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Music")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Aquest codi es pot mostrar correctament, però el problema també és evident: el codi dels tres elements de configuració és gairebé exactament igual.

Les úniques parts diferents són la icona, el color i el títol:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Settings")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Music")
```

És a dir, l'estructura de cada element de configuració és fixa; només canvien la icona, el color i el títol.

Aquesta situació és molt adequada per fer servir una vista personalitzada.

### Ombra shadow

Aquí hem fet servir un modificador nou, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` pot afegir una ombra a una vista.

`radius` representa el radi de difuminat de l'ombra. Com més gran és el valor, normalment més gran és l'abast de l'ombra i més suau es veu.

Aquí el valor és `1`, que indica que només s'afegeix una ombra molt lleugera.

## Encapsular la vista d'element de configuració

A continuació, encapsularem cada element de configuració en una vista nova.

Podem crear una `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

En aquesta vista, definim tres propietats:

```swift
let icon: String
let color: Color
let title: String
```

Entre elles:

- `icon` representa el nom de la icona
- `color` representa el color de fons de la icona
- `title` representa el títol de l'element de configuració

Com que aquests tres continguts són diferents en cada element de configuració, els convertim en paràmetres que es poden passar des de fora.

## Fer servir la vista personalitzada

Un cop tenim `SettingItemView`, ja no cal repetir un gran fragment de codi `HStack`.

Ara la podem fer servir així:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Aquesta línia de codi indica que es crea una vista d'element de configuració i que s'hi passen tres paràmetres:

```swift
icon: "gear"
color: Color.blue
title: "Settings"
```

Després de passar-los, les propietats internes de `SettingItemView` rebran els valors corresponents:

- El valor de `icon` és `gear`
- El valor de `color` és `Color.blue`
- El valor de `title` és `"Settings"`

Per tant, dins de la vista, `Image(systemName: icon)` mostrarà la icona d'engranatge, `.background(color)` farà servir un fons blau i `Text(title)` mostrarà `Settings`.

Codi complet:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Settings")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Efecte visual:

![view](../../../Resource/028_view.png)

Podem veure que, després de l'encapsulació, l'efecte visual és el mateix que abans, però el codi és més clar.

Abans, cada element de configuració necessitava un fragment sencer de `HStack`; ara només cal una línia de codi:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Aquesta és la funció de les vistes personalitzades: **encapsular l'estructura de vista repetida i passar només els continguts diferents com a paràmetres.**

## Per què es poden passar paràmetres

A continuació, entendrem de manera senzilla per què una vista personalitzada pot rebre paràmetres.

En SwiftUI, una vista és essencialment una estructura.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Aquí, `ContentView` és una estructura.

Quan escrivim:

```swift
ContentView()
```

En realitat estem creant una vista `ContentView`.

Els `()` del final indiquen que es crida el seu mètode d'inicialització; també es pot entendre com la creació d'aquesta vista.

Com que aquest `ContentView` no té cap propietat que s'hagi de passar des de fora, podem escriure directament:

```swift
ContentView()
```

Però, si la vista té propietats sense valor assignat, cal passar-hi els valors corresponents quan es crea la vista.

Per exemple:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

Aquí, `name` és una propietat i no té cap valor per defecte.

Per tant, quan es crea `ContentView`, s'ha de donar a `name` un valor concret:

```swift
ContentView(name: "Fang Junyu")
```

Així, la vista interna pot fer servir aquest valor:

```swift
Text("name: \(name)")
```

Aquesta és també la raó per la qual, quan creem `SettingItemView`, hem de passar paràmetres:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Perquè `SettingItemView` té tres propietats sense valor per defecte:

```swift
let icon: String
let color: Color
let title: String
```

Per tant, quan es crea aquesta vista, cal passar-les. Swift farà servir aquests paràmetres per assignar valors a les propietats internes de la vista.

## Mètode d'inicialització

A continuació, entendrem una mica més el mètode d'inicialització.

### Mètode d'inicialització per defecte

Quan definim una vista normal:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

En aquest codi, no hem escrit manualment cap mètode d'inicialització.

Però, quan fem servir aquesta vista, podem escriure així:

```swift
ContentView()
```

Aquí, `()` indica en realitat que s'està creant `ContentView`; també es pot entendre com una crida al seu mètode d'inicialització.

### Per què es pot cridar encara que no hi hagi cap mètode d'inicialització?

Perquè el compilador de Swift genera automàticament un mètode d'inicialització per a nosaltres.

Cal tenir en compte que **aquest mètode d'inicialització es genera automàticament i normalment no el veiem directament al codi**.

És a dir, tot i que no hem escrit manualment això dins de `struct`:

```swift
init() {

}
```

El compilador de Swift ens generarà al darrere un mètode d'inicialització semblant a aquest:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

Aquesta és la raó per la qual podem escriure directament:

```swift
ContentView()
```

Per tant, en el codi real, normalment no cal escriure manualment el mètode d'inicialització.

Només cal entendre una cosa: **quan es crea una vista SwiftUI, es crida el mètode d'inicialització de la vista. Encara que no l'hàgim escrit manualment, Swift pot generar-lo automàticament per a nosaltres.**

### Mètode d'inicialització amb paràmetres

Si una vista té una propietat sense valor per defecte, per exemple:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

El compilador de Swift generarà automàticament un mètode d'inicialització amb paràmetres segons les propietats.

Es pot entendre de manera senzilla així:

```swift
init(name: String) {
    self.name = name
}
```

Aquí:

```swift
init(name: String)
```

vol dir que, quan es crea `ContentView`, cal passar un paràmetre `name` de tipus `String`.

Quan escrivim:

```swift
ContentView(name: "Fang Junyu")
```

vol dir: passar `"Fang Junyu"` com a paràmetre al mètode d'inicialització.

Després, dins del mètode d'inicialització s'executarà:

```swift
self.name = name
```

Aquesta línia de codi vol dir: assignar el `name` que entra des de fora a la propietat `name` de la vista actual.

Es pot entendre de manera senzilla així:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Així, la vista interna ja pot fer servir el valor que s'ha passat.

Aquest és el procés d'inicialització d'una vista amb paràmetres: **quan les propietats de la vista no tenen valor per defecte, cal passar els paràmetres corresponents en crear la vista perquè el mètode d'inicialització completi l'assignació de valors a les propietats.**

## Cas en què la propietat té un valor per defecte

Si una propietat ja té un valor per defecte, es pot crear la vista sense passar aquest paràmetre.

Per exemple:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("name: \(name)")
    }
}
```

Aquí, `name` ja té un valor per defecte:

```swift
"Fang Junyu"
```

Per tant, quan es crea `ContentView`, podem escriure directament:

```swift
ContentView()
```

En aquest cas, `name` farà servir el valor per defecte i la interfície mostrarà:

```swift
name: Fang Junyu
```

Per descomptat, també podem passar un valor nou quan creem la vista:

```swift
ContentView(name: "Sam")
```

En aquest cas, la vista farà servir `"Sam"`, passat des de fora, en lloc del valor per defecte, i la interfície mostrarà:

```swift
name: Sam
```

Per facilitar-ne la comprensió, podem veure el mètode d'inicialització generat automàticament pel compilador de Swift de manera simplificada així:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Aquí, `name: String = "Fang Junyu"` significa: si no es passa `name` quan es crea la vista, es fa servir el valor per defecte `"Fang Junyu"`; si es passa un `name` nou quan es crea la vista, es fa servir el valor passat.

És a dir: **si no es passa cap paràmetre des de fora, es fa servir el valor per defecte de la propietat; si es passa un paràmetre des de fora, es fa servir el valor passat.**

## Tornem a SettingItemView

Ara tornem a mirar `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

L'estructura d'aquesta vista és fixa.

Les parts fixes inclouen:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Les parts diferents inclouen:

```swift
icon
color
title
```

Per això convertim els continguts diferents en propietats i els passem com a paràmetres quan creem la vista.

Quan creem diferents elements de configuració, només cal passar-hi paràmetres diferents:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
```

D'aquesta manera, una mateixa `SettingItemView` pot mostrar tres elements de configuració diferents.

Aquesta és la manera d'ús més habitual de les vistes personalitzades.

## Resum

En aquesta lliçó, hem après les vistes personalitzades.

La funció principal d'una vista personalitzada és: **encapsular el codi de vista repetit perquè es pugui reutilitzar.**

En aquest cas, l'estructura dels tres elements de configuració és la mateixa; només canvien la icona, el color i el títol.

Per tant, hem creat una `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Després, quan fem servir aquesta vista, hi passem paràmetres diferents:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Aquests paràmetres entren dins de `SettingItemView`.

Mitjançant aquesta manera, podem crear vistes amb la mateixa estructura però amb continguts diferents fent servir menys codi.

Aquesta també és una escriptura molt habitual en el desenvolupament amb SwiftUI.
