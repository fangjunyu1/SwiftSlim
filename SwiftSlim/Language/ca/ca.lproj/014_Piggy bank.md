# Guardiola

En aquesta lliçó, desenvoluparem un projecte senzill de "guardiola". La seva funcionalitat és simple, però inclou una lògica d'interacció completa, de manera que és molt adequat perquè els principiants comencin.

Mitjançant aquest projecte, aprendrem `TextField` (camp d'entrada), `border` i també entendrem l'enllaç de dades (`$`).

L'objectiu final és implementar un projecte de "guardiola" en què es pugui introduir una quantitat, prémer un botó per desar-la i anar acumulant l'import total.

Resultat final:

![Piggy Bank](../../RESOURCE/014_view.png)

## Mostrar l'import total

Primer, hem de mostrar a la vista l'import total de la "guardiola".

A `ContentView`, declarem una variable per desar l'import total de la guardiola.

```swift
@State private var amount = 0
```

Després, utilitzem `Text` per mostrar aquest import:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Aquí utilitzem `.font` i `.fontWeight` per configurar la mida i el gruix de la lletra.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Quan `amount` canviï, el total que mostra `Text` també s'actualitzarà automàticament.

## Introduir un import

A més de mostrar l'import total, la "guardiola" també ha de permetre a l'usuari "introduir" una quantitat d'ingrés o retirada. Per fer-ho, necessitem el control de SwiftUI `TextField`.

### TextField

`TextField` és un control de SwiftUI per introduir contingut, normalment utilitzat per a entrades d'una sola línia.

`TextField` ofereix principalment dos formats d'enllaç:

**1. Enllaçar amb un tipus cadena (`String`)**

```swift
TextField("Placeholder", text: $text)
```

És adequat per a contingut de text com noms o títols.

**2. Enllaçar amb un tipus numèric (`Int`/`Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

És adequat per a edat, sou, imports i altres dades numèriques.

`format: .number` significa que aquest camp analitzarà i mostrarà el contingut en format numèric.

#### Text de marcador

El primer paràmetre de `TextField` és el marcador (`Placeholder`), que serveix per indicar a l'usuari què ha d'introduir:

```swift
TextField("input your name", text: $text)
```

Quan el camp està buit, es mostrarà un text de guia en gris.

![textfield](../../RESOURCE/014_textfield.png)

#### Enllaç de dades

`TextField` no s'encarrega de desar permanentment el contingut introduït. Cal gestionar les dades mitjançant una variable vinculada.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

El contingut que introdueix l'usuari es desa directament a la variable `text`, i `TextField` només s'encarrega de la interfície d'entrada.

`$` representa un enllaç (`Binding`):

```swift
$text
```

Això no és una variable ordinària, sinó un tipus `Binding`.

La seva funció és establir una connexió entre la vista i les dades:

Quan l'usuari introdueix contingut a `TextField`, `text` s'actualitza automàticament; i quan `text` canvia, `TextField` també es sincronitza automàticament.

Per exemple:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Quan introdueixes contingut al `TextField`, el `Text` de sobre es mostrarà sincronitzat en temps real.

![textField](../../RESOURCE/014_textfield1.png)

### Enllaçar un tipus numèric

Quan cal introduir números, hem d'enllaçar una variable del tipus corresponent:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Quan l'usuari introdueix un import, `TextField` analitzarà el contingut i actualitzarà automàticament el valor de `number`.

## Afegir el camp d'entrada

Després d'entendre l'ús bàsic de `TextField`, l'apliquem al projecte de la "guardiola".

La guardiola necessita introduir un "import", així que utilitzem la manera d'"enllaçar amb un tipus numèric (`Int`/`Double`)" i afegim una nova variable `number` per desar l'import introduït per l'usuari:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Ara, `TextField` mostra per defecte el valor de `number` que està enllaçat, i com que el valor inicial és `0`, mostrarà `0`.

Quan s'esborra el contingut del camp, es mostrarà el marcador `"Amount"`.

Això també confirma una altra vegada que el que mostra `TextField` és el valor de la variable vinculada, no un contingut que el camp desi per si mateix.

### Problema de mida del camp

En la vista actual, veurem que `TextField` no té cap vora, només mostra un `0`, i el contingut sembla alineat a l'esquerra.

L'efecte és així:

![textfield](../../RESOURCE/014_textfield2.png)

Això és perquè, per defecte, `TextField` ocupa tota l'amplada de la vista pare.

Podem verificar-ho afegint un color de fons:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

L'efecte és així:

![textfield](../../RESOURCE/014_textfield3.png)

Podem veure que `TextField` realment omple tota l'amplada de la línia.

### Establir una amplada fixa

Si volem que el camp sigui més compacte, podem utilitzar `frame` per limitar-ne l'amplada:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

L'efecte és així:

![textfield](../../RESOURCE/014_textfield4.png)

### Afegir una vora i padding intern

Com que `TextField` no té cap vora per defecte, podem afegir-li estil manualment:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Ara, aquest camp d'entrada ja s'assembla més a un "camp estàndard".

![textfield](../../RESOURCE/014_textfield5.png)

## Vora

En SwiftUI, `border` s'utilitza per afegir una vora a una vista.

Ús bàsic:

```swift
border(Color.black, width: 1)
```

Aquí, `Color.black` indica el color de la vora, i `width` indica el gruix.

En el cas de `TextField`, utilitzem:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Això vol dir que afegim al camp d'entrada una vora negra d'1 pt de gruix.

També pots provar altres colors, com `Color.blue`, `Color.green`, o fer la vora més gruixuda amb `width: 2`.

## Botó per guardar diners

Ara tenim una variable `amount` per mostrar l'import total, un `TextField` per introduir imports, i una variable `number` vinculada a aquest camp.

El codi actual és el següent:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Afegir un botó

A continuació, hem d'afegir un botó per activar l'acció de guardar diners.

```swift
Button("Save") {
    
}
```

### Implementar la lògica de guardar diners

Volem que, quan l'usuari introdueixi un import i premi el botó, aquest import s'acumuli automàticament a l'import total.


```swift
Button("Save") {
    amount += number
}
```

Aquí utilitzem un "operador d'assignació composta" per sumar l'import introduït per l'usuari (`number`) a l'import total (`amount`).

### Reinicialitzar l'import introduït

Ara hi ha un problema: cada vegada que es prem el botó, l'import del camp d'entrada no s'esborra.

Si l'usuari introdueix `10` i prem desar, el camp encara mostrarà `10`, i això afectarà el següent ingrés.

Això passa perquè `TextField` està vinculat a `number`. Quan premem el botó, només canviem `amount`, però `number` no canvia, així que el camp continua mostrant l'antic valor.

Hem d'afegir una lògica de neteja. Quan es premi el botó, primer s'acumularà l'import i després es reinicialitzarà el valor introduït:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Ara, quan l'usuari introdueixi un import i premi el botó, aquest import s'afegirà al total. Després, `number` es reinicialitzarà a `0` per facilitar la següent entrada.

D'aquesta manera, ja hem implementat tota la lògica bàsica de la "guardiola".

## Optimitzar la vista

Un cop la funcionalitat està acabada, podem fer una petita millora visual afegint una imatge de fons i un estil al botó.

Afegir estil al botó:

```swift
.buttonStyle(.borderedProminent)
```

Afegir una imatge de fons:

```swift
.background {
    Image("1")
}
```

Ara ja hem completat tot el desenvolupament de la "guardiola".

## Codi complet

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Resultat final:

![Piggy Bank](../../RESOURCE/014_view.png)

Ara podem provar d'ingressar `100` o més diners per comprovar si la lògica de la "guardiola" té cap problema.

També podem executar la "guardiola" al simulador o en un dispositiu físic per experimentar aquesta aplicació que hem desenvolupat.

### Sortida de depuració

Per verificar que la lògica és correcta, també podem afegir una lògica de depuració dins del botó per comprovar si l'import introduït és correcte:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Cada vegada que es guardin diners i es premi el botó, podrem veure la sortida de depuració corresponent i comprovar si la lògica del codi és correcta.

```
---Saving---
amount:11
number:0
```
