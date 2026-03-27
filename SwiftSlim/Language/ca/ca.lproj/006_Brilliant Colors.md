# Colors brillants

En aquesta lliçó aprendrem alguns dels modificadors visuals més habituals de SwiftUI, incloent:

- color
- color de primer pla
- color de fons
- desplaçament
- opacitat
- desenfocament

També aprendrem sobre la `Safe Area` (zona segura).

Aquests modificadors s'utilitzen per controlar l'aparença visual d'una vista, fent que la interfície sigui més clara i amb més profunditat.

## Color

A SwiftUI podem establir el color del text.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` significa blau, i en realitat és una forma abreujada de `Color.blue` (gràcies a la inferència de tipus).

Alguns colors habituals són:

```text
.black
.green
.yellow
.pink
.gray
...
```

Tots ells són propietats estàtiques de `Color`.

![Color](../../RESOURCE/006_color.png)

Podem entendre `Color` com un tipus de color, i `.blue`, `.red`, etc. com els seus valors concrets.

### Vista `Color`

A SwiftUI, `Color` també es pot mostrar com una vista per si mateix.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Aquest codi genera un quadrat vermell de `100 × 100`.

També podem fer que tota la interfície es mostri d'un color determinat:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Després d'executar-ho, veurem que el vermell no omple tota la pantalla; la part superior i inferior de l'iPhone segueixen sent blanques, i això té a veure amb l'existència de la `Safe Area`.

## `Safe Area`

La `Safe Area` és la zona que el sistema reserva per evitar que el contingut quedi tapat, i inclou:

1. la barra d'estat superior (hora, bateria)

2. la barra indicadora `Home` inferior

3. la zona del notch o de la `Dynamic Island`

![Color](../../RESOURCE/006_color3.png)

Per defecte, SwiftUI limita el contingut dins de la zona segura, de manera que la vista no s'estén fins als extrems de la pantalla.

### Ignorar la `Safe Area`

Si volem que el color ompli tota la pantalla, podem utilitzar `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

o bé `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

D'aquesta manera, la vista s'estendrà per tota la pantalla.

Cal tenir en compte que `edgesIgnoringSafeArea` és una sintaxi més antiga. Des d'iOS 14, la recomanació és utilitzar `ignoresSafeArea`.

## Color de primer pla

### Modificador `foregroundStyle`

En lliçons anteriors ja vam aprendre a establir colors amb `foregroundStyle`.

Per exemple:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` forma part del sistema d'estils nou i suporta colors, gradients, materials, etc.

![Color](../../RESOURCE/006_color2.png)

### Modificador `foregroundColor`

`foregroundColor` també es pot utilitzar per establir colors:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

La manera d'utilitzar-lo és similar a `foregroundStyle`.

En les versions més recents d'Xcode, Xcode avisa que `foregroundColor` podria quedar obsolet en futures versions d'iOS, de manera que es recomana prioritzar l'ús de `foregroundStyle`.

## Fons

Si volem afegir un color de fons a una vista, podem utilitzar `background`:

```swift
background(.red)
```

Per exemple, afegir un fons al text:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Quan seleccionem text en apps com Word o Chrome, podem veure efectes de color de fons similars.

![Color](../../RESOURCE/006_color16.png)

Si volem ampliar l'àrea del fons, cal combinar-ho amb `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Aquí cal tenir en compte una regla important:

Els modificadors de SwiftUI construeixen la vista de dalt a baix. El modificador escrit més avall actua sobre el resultat dels anteriors.

Per tant:

```swift
.padding()
.background()
```

això significa que el fons embolcalla la vista després d'afegir-hi el marge intern.

Si invertim l'ordre:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

el fons no s'ampliarà, perquè no està embolcallant el `padding` posterior.

## Exemple - una femella de quatre cantonades

Ara farem una vista senzilla que sembli una femella de quatre cantonades.

![Color](../../RESOURCE/006_color8.png)

Primer creem un quadrat blanc de `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Si volem convertir-lo en un cercle, podem utilitzar `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Quan el radi de la cantonada és igual a la meitat de l'amplada i l'alçada, es converteix en un cercle.

Ara afegim un fons blau:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

El `padding` afegit amplia l'àrea exterior, i `background` pinta en blau aquesta àrea exterior.

Així ja hem aconseguit un efecte de femella de quatre cantonades.

### Una altra manera de pensar-ho

A més d'utilitzar un color de fons per crear aquest efecte, també podem fer-ho amb `ZStack`.

Abans vam aprendre que `ZStack` permet la superposició. Aquesta femella també es pot entendre com un cercle i un rectangle superposats.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` superposa les vistes segons l'ordre, i la vista afegida més tard apareix a la capa superior.

## Exemple - dos cercles superposats

Moltes icones estan formades per superposició de formes simples, com per exemple dos cercles superposats.

![Color](../../RESOURCE/006_color14.png)

Primer, creem dos cercles:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Com que volem que els dos cercles se superposin, utilitzem una disposició `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

En aquest moment, els dos cercles de la mateixa mida queden totalment superposats.

Però volem que només se superposin parcialment, no que es cobreixin del tot, així que podem utilitzar `offset` per generar un desplaçament.

## Desplaçament

`offset` només canvia la posició de dibuix de la vista, i no afecta el càlcul de la disposició del contenidor pare.

Forma d'ús:

```swift
.offset(x:y:)
```

`x` és el desplaçament horitzontal i `y` el desplaçament vertical.

Els valors positius desplacen cap a la dreta / avall, i els negatius cap a l'esquerra / amunt.

Fem servir `offset` perquè els dos cercles se superposin només en part:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

La posició del cercle vermell dins de la disposició no canvia, però la seva posició de dibuix es mou 25 punts cap a l'esquerra. Així els dos cercles generen un efecte visual de superposició parcial.

## Opacitat

A SwiftUI, `opacity` s'utilitza per establir la transparència d'una vista.

Forma bàsica:

```swift
.opacity(0.5)
```

El paràmetre d'`opacity` va de `0.0` a `1.0`, on:

- `0` significa completament transparent
- `1` significa opac

Podem utilitzar `opacity` per establir la transparència del cercle taronja:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Quan establim l'`opacity` del cercle taronja a `0.8`, la seva opacitat passa a ser del 80%, i quan els dos cercles se superposen, la zona de solapament genera un efecte de barreja de colors.

## Desenfocament

A SwiftUI, podem utilitzar `blur` per establir un efecte de desenfocament:

```swift
.blur(radius:10)
```

`radius` defineix el radi del desenfocament: com més gran és el valor, més visible és l'efecte.

Podem afegir un efecte de desenfocament als dos cercles:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Al final veurem dos cercles molt desenfocats.

## Resum

En aquesta lliçó ens hem centrat en els modificadors visuals habituals de SwiftUI i hem après com controlar el color, la posició i els efectes visuals de les vistes mitjançant modificadors.

Mitjançant exemples concrets, hem pogut veure el paper real dels diferents modificadors visuals a la interfície i també hem entès la idea de la zona segura.

Aquests són modificadors molt bàsics, així que val la pena practicar-los i utilitzar-los més. Això ens ajudarà a controlar amb més claredat l'efecte visual de la interfície en el desenvolupament real.

### Exercicis

- afegeix transparència i desenfocament a una imatge
- crea tres cercles superposats amb opacitats diferents
- crea una imatge de fons que ompli tota la pantalla i ignori la zona segura
- utilitza `offset` per ajustar la posició de diverses vistes

L'objectiu d'aquests exercicis no és memoritzar API, sinó observar la relació entre els canvis visuals i el comportament de la disposició.
