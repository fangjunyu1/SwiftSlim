# Coneixent Xcode

## Què és Xcode

Xcode és l'entorn de desenvolupament integrat oficial d'Apple (IDE, Integrated Development Environment), utilitzat per desenvolupar aplicacions per a plataformes d'Apple com iOS, macOS, watchOS i tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Durant tot aquest curs utilitzarem Xcode per escriure codi i executar programes.

En aquesta lliçó aprendrem com descarregar Xcode, crear la nostra primera aplicació iOS i fer una primera presa de contacte amb l'estructura de la interfície d'Xcode.

## Descarregar Xcode

Actualment hi ha dues maneres d'instal·lar Xcode:

1. Descarregar-lo des de la [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Descarregar-lo des del [lloc web oficial d'Apple Developer](https://developer.apple.com/xcode/)

Ambdues opcions serveixen per descarregar Xcode. La diferència és que al lloc web d'Apple Developer, a més de la versió estable, també es poden descarregar versions [Beta](https://developer.apple.com/download/all/?q=Xcode) o versions antigues.

Si només estàs aprenent a desenvolupar, es recomana fer servir la versió estable. Les versions Beta s'utilitzen principalment per provar funcions noves i poden ser inestables.

## Crear el primer projecte

Quan obris Xcode, veuràs la pantalla d'inici.

![Swift](../../RESOURCE/001_xcode1.png)

A l'esquerra hi ha tres opcions habituals:

- `Create New Project` —— crear un projecte nou  
- `Clone Git Repository` —— clonar un repositori Git  
- `Open Existing Project` —— obrir un projecte existent

A la dreta es mostren els projectes d'Xcode oberts recentment.

Triem l'opció `"Create New Project"`.

### Escollir una plantilla de projecte

![Swift](../../RESOURCE/001_xcode2.png)

Entrarem a la pantalla de selecció de plantilles de projecte, on es mostren diverses plataformes (iOS, macOS, etc.) i diferents tipus de plantilles.

Explicació de les plantilles més habituals:

- `App` —— el tipus d'aplicació més bàsic (recomanat)
- `Document App` —— aplicació basada en documents
- `Game` —— per al desenvolupament de jocs
- `Framework` —— mòdul reutilitzable

En la fase inicial, només escollirem la plantilla `"iOS" - "App"`, perquè és la plantilla per a aplicacions amb interfície.

Fes clic a `"Next"`.

### Omplir la informació del projecte

Entrarem a la pantalla on s'omplen les dades del projecte, i haurem d'omplir els camps segons el seu significat.

![Swift](../../RESOURCE/001_xcode3.png)

Significat dels camps:

- `Product Name` —— nom del projecte, per exemple: `SwiftSlimTest`
- `Team` —— equip de desenvolupament; si no tens un compte d'Apple Developer de pagament, el pots deixar sense seleccionar
- `Organization Identifier` —— identificador de l'organització, habitualment en format de domini invertit, per exemple:
  - `com.yourname`
  - `com.yourcompany`
  - Si no tens domini, pots utilitzar el teu nom en anglès com a identificador
- `Bundle Identifier` —— identificador únic de l'aplicació; es genera automàticament a partir de `Organization Identifier` i `Product Name`
- `Interface` —— tecnologia d'interfície; tria `SwiftUI`
- `Language` —— llenguatge de desenvolupament; tria `Swift`
- `Testing System` —— per defecte es crearà un objectiu de proves (`Unit Tests`); en aquesta fase inicial el podem ignorar
- `Storage` —— marc de persistència local; pot integrar automàticament `SwiftData` o `Core Data`, però al començament també ho podem ignorar

Quan hagis acabat d'omplir-ho, fes clic a `"Next"`.

### Desar el projecte

![Swift](../../RESOURCE/001_xcode4.png)

Escull una carpeta adequada per desar el projecte.

Fes clic al botó `"Create"` i Xcode generarà automàticament l'estructura del projecte.

## Estructura del projecte Xcode

Després de desar el projecte, podràs veure la carpeta generada al Finder.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` —— carpeta per desar imatges, icones de l'app i altres recursos

- `ContentView.swift` —— fitxer SwiftUI generat per defecte, on més endavant escriurem el codi de la interfície

- `SwiftSlimTestApp.swift` —— fitxer d'entrada de l'aplicació (`App Entry Point`), responsable d'iniciar l'aplicació; de moment no cal entendre'l

- `SwiftSlimTest.xcodeproj` —— fitxer del projecte Xcode; fent doble clic en aquest fitxer s'obre el projecte

## Coneixent la interfície d'Xcode

Fes doble clic al fitxer `.xcodeproj` per obrir el projecte i, a la zona `Navigator` de l'esquerra, selecciona el fitxer `ContentView.swift`.

La interfície d'Xcode es compon principalment de cinc àrees:

- `Navigator` —— àrea de navegació, per veure l'estructura de fitxers i fer cerques
- `Editor` —— àrea d'edició, per escriure codi Swift o SwiftUI
- `Canvas` —— àrea de llenç, per al preview de SwiftUI
- `Inspector` —— àrea d'inspecció de propietats, per veure i modificar propietats del fitxer
- `Debug Area` —— àrea de depuració, per veure sortida de logs

![Swift](../../RESOURCE/001_xcode6.png)

Nota: `Canvas` s'utilitza principalment per fer preview d'un `View` de SwiftUI. Des del punt de vista de l'arquitectura oficial d'Xcode, és un panell auxiliar de preview de l'`Editor` (`Preview Pane`). Només es pot activar quan tenim obert un fitxer de vista SwiftUI; en altres tipus de fitxer no apareixerà la funció de preview.

En les lliçons següents, escriurem principalment codi Swift i SwiftUI a l'àrea `Editor`.

Quan obres un projecte Xcode per primera vegada, `Inspector` i `Debug Area` poden estar amagats per defecte. Pots mostrar-los fent clic als botons de la part superior dreta i inferior dreta.

![Swift](../../RESOURCE/001_xcode7.png)

Consell: l'àrea `Inspector` s'utilitza principalment per veure i modificar propietats dels fitxers. En el desenvolupament real, sovint es manté amagada per obtenir més espai per editar.

## Resum

En aquesta lliçó hem après com descarregar Xcode, com crear el nostre primer projecte Xcode i la disposició bàsica de la interfície d'Xcode.

Ara toca una estona d'exploració lliure:
- Pots provar de crear i eliminar fitxers a l'àrea `Navigator`.  
- Revisa el codi de l'àrea `Editor` i observa la seva estructura.
- Mira els botons de l'àrea `Canvas` i prova d'ampliar i reduir la vista prèvia.

A la pròxima lliçó començarem a escriure codi senzill, i això ens ajudarà a conèixer encara millor Xcode.
