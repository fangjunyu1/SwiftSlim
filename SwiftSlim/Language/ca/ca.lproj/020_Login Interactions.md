# Interaccions d'inici de sessió

A la lliçó anterior, vam crear una vista d'inici de sessió i, mitjançant botons i lògica de comprovació, vam implementar una validació senzilla del contingut introduït.

En aquesta lliçó, continuarem prenent com a base el codi de la lliçó anterior per aprendre el camp d'entrada de contrasenya `SecureField`, el quadre d'avís `Alert`, i també com controlar la visualització de diferents vistes segons les variables.

Amb aquesta lliçó, podràs entendre millor el flux bàsic d'interacció d'una vista d'inici de sessió, que també és una lògica bàsica molt utilitzada en moltes aplicacions.

## Camp d'entrada de contrasenya

A la lliçó passada, vam utilitzar `TextField` per introduir la contrasenya.

Però en una interfície d'inici de sessió real, la contrasenya normalment no es mostra directament, sinó que es representa com a punts o altres efectes d'ocultació, per tal de protegir la privadesa de l'usuari.

A SwiftUI, el control especialment pensat per introduir contrasenyes és `SecureField`.

Per exemple:

```swift
SecureField("Password", text: $password)
```

La seva manera d'escriure's és molt semblant a `TextField`: igualment necessita un text de suggeriment i una variable enllaçada.

Es pot entendre de manera senzilla així: `SecureField` també és un camp d'entrada, però amaga el contingut que s'hi introdueix.

Podem substituir directament el `TextField` que abans fèiem servir per introduir la contrasenya per `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Quan l'usuari introdueixi la contrasenya, el contingut no es mostrarà directament a la interfície.

Efecte de visualització:

![password](../../Resource/020_password.png)

Ara ja podem introduir el nom d'usuari i la contrasenya, i després de prémer el botó comprovar si l'entrada és correcta.

### Mostrar missatges de retorn

Abans hem estat utilitzant `print` per mostrar resultats.

El contingut de `print` només es mostra a la consola: el desenvolupador el pot veure quan executa el programa a Xcode, però els usuaris normals al telèfon no poden veure aquests missatges.

És a dir, encara que el programa ja hagi completat la comprovació, l'usuari no sap si el contingut introduït és correcte o no.

En aquest moment, ens cal una manera de mostrar avisos directament a la interfície.

## Quadre d'avís Alert

A SwiftUI, podem utilitzar `Alert` per fer aparèixer un quadre de missatge emergent.

Ús bàsic:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Aquest fragment de codi sembla una mica més complex que els controls anteriors, però el podem entendre si el desglossem.

`Alert` conté principalment les parts següents:

- `"Title"`: el títol del quadre d'avís
- `isPresented`: un valor booleà enllaçat que s'utilitza per controlar si el quadre d'avís es mostra o no
- `Button(...)`: el botó del quadre d'avís
- `message:`: el contingut del missatge que es mostra dins del quadre d'avís

Es pot entendre de manera senzilla així: quan la variable enllaçada passa a ser `true`, el sistema mostrarà aquest quadre de missatge.

Efecte de visualització:

![alert](../../Resource/020_alert3.png)

Estructura corresponent:

![alert](../../Resource/020_alert.png)

### Alert és un modificador

Igual que molts dels modificadors que hem après abans, `Alert` també s'afegeix darrere d'una vista determinada.

Per exemple, es pot aplicar darrere del botó:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

També es pot aplicar darrere del `VStack` exterior:

```swift
VStack {
    // ...
}
.alert() {...}
```

És a dir, `Alert` no és una vista independent col·locada sola a la interfície, sinó un modificador que depèn d'una determinada vista.

Es pot entendre de manera senzilla que `Alert` s'escriu generalment darrere del botó o del disseny exterior, per fer aparèixer un avís quan es compleix una determinada condició.

### Mostrar Alert

Si volem mostrar un `Alert`, necessitem una variable que el controli.

Per exemple:

```swift
@State private var showAlert = false
```

Aquesta variable és de tipus `Bool`, és a dir, només té dos valors: `true` o `false`.

Després la vinculem a `isPresented` de `Alert`:

```swift
isPresented: $showAlert
```

Quan `showAlert` és `false`, el quadre d'avís no es mostrarà; quan `showAlert` és `true`, apareixerà.

### Mostrar el quadre d'avís a través del botó

Ara, implementem primer l'escenari més senzill:

Quan l'usuari no ha introduït res i prem directament el botó `Sign in`, apareix un quadre d'avís per dir-li: "Encara no has introduït cap contingut".

Primer, crea una variable per controlar aquest quadre d'avís:

```swift
@State private var showEmpty = false
```

Després, afegeix un `Alert` darrere de `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

A continuació, fes la comprovació dins del codi del clic del botó:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Si tant `user` com `password` estan buits, canviarem `showEmpty` a `true`.

I com que `Alert` està vinculat a aquesta variable, quan passi a `true`, el sistema mostrarà automàticament el quadre d'avís.

Efecte de visualització:

![alert](../../Resource/020_alert1.png)

D'aquesta manera, després de prémer el botó, l'usuari podrà veure l'avís immediatament, i el desenvolupador no haurà d'anar a la consola per comprovar la sortida de `print`.

### Millorar el botó i el quadre d'avís

Abans només vam tractar el cas de "no s'ha omplert res".

Encara hem de tractar les situacions següents:

- no s'ha omplert el nom d'usuari
- no s'ha omplert la contrasenya
- s'han omplert el nom d'usuari i la contrasenya, però l'entrada és incorrecta

Per tant, també hem de preparar els avisos corresponents per a aquests casos.

Primer, afegeix tres variables noves:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Després continua afegint els `Alert` corresponents darrere del botó:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

A continuació, completa la lògica de comprovació dins del botó:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Quan el botó detecta que l'usuari no ha omplert cap informació, n'ha deixat una de buida o la validació de l'entrada ha fallat, la variable booleana corresponent es canviarà a `true` i després apareixerà l'`Alert` corresponent.

Aquí et recomano que provis tu mateix algunes situacions:

- no omplir res
- omplir només el nom d'usuari
- omplir només la contrasenya
- omplir tant el nom d'usuari com la contrasenya, però amb contingut incorrecte
- omplir tant el nom d'usuari com la contrasenya, i que el contingut sigui correcte

Així podrem verificar si hi ha algun problema al nostre codi; aquest també és un pas de "proves" molt important en el desenvolupament d'aplicacions.

Si en algun escenari el comportament del programa no és correcte, això indica que pot haver-hi algun problema a la lògica i que ha aparegut un `Bug` al programa.

En desenvolupament, el que sovint anomenem `Bug` fa referència a errors, defectes o comportaments que no s'ajusten a l'esperat.

## Completar la vista d'inici de sessió

Els `Alert` explicats abans tractaven tots sobre com donar avisos a l'usuari quan "la introducció és incorrecta".

Quan l'usuari introdueix correctament el nom d'usuari i la contrasenya, normalment no fem aparèixer un "quadre d'avís", sinó que entrem directament a la interfície posterior a l'inici de sessió.

Aquí hi ha un punt de coneixement molt important: **mostrar diferents vistes segons el valor de la variable.**

Per exemple:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Aquí fem servir el tipus `Bool` per gestionar la visualització de la vista:

- si `login` és `true`, vol dir que l'inici de sessió ja ha tingut èxit i es mostra el contingut posterior a l'inici de sessió
- si `login` és `false`, vol dir que l'inici de sessió no ha tingut èxit i es continua mostrant la interfície d'inici de sessió.

Tot i que la sentència `if` és una sentència condicional de Swift, dins del `body` de SwiftUI es pot utilitzar per controlar la lògica de visualització de la vista.

És a dir, SwiftUI decidirà quina vista s'ha de mostrar actualment segons el resultat de la condició.

Podem posar aquesta lògica de visualització dins del `ContentView` actual:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Aquí hem afegit una variable nova, `login`, per indicar si l'usuari ja ha iniciat sessió correctament.

Després, hem posat el codi de la vista d'inici de sessió que ja havíem escrit darrere de la sentència `else`.

Lògica de visualització:

- quan `login` és `false`, vol dir que encara no s'ha iniciat sessió correctament, i es continua mostrant la vista original d'inici de sessió.
- quan `login` és `true`, vol dir que l'inici de sessió ha tingut èxit; en aquest moment ja no es mostra la vista d'inici de sessió, sinó `Login successful`.

És a dir, `ContentView` mostrarà contingut de vista diferent segons el valor de `login`.

A continuació, modifiquem la lògica d'èxit d'inici de sessió dins del botó:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Quan el nom d'usuari i la contrasenya introduïts per l'usuari siguin correctes, canviarem `login` a `true`.

Tan bon punt el valor de `login` canviï, el resultat de la comprovació `if` dins de `ContentView` també canviarà, i la interfície passarà de la vista d'inici de sessió original a `Login successful`.

L'efecte de visualització és el següent:

![view](../../Resource/020_view.png)

Ara ja hem aplicat realment al nostre pàgina actual d'inici de sessió el coneixement de "mostrar diferents vistes segons la condició".

En una aplicació real, també se sol utilitzar aquesta manera de jutjar: mostrar diferents vistes segons un determinat valor.

Per exemple, quan l'usuari no ha iniciat sessió, es mostra la pàgina d'inici de sessió; després d'iniciar sessió correctament, es mostra una altra interfície.

La idea clau és: **controlar quin contingut es mostra a la interfície mitjançant els canvis de les variables.**

## Resum

En aquesta lliçó, hem après tres punts importants:

1. Utilitzar `SecureField` per introduir contrasenyes, de manera que el contingut de la contrasenya no es mostri directament a la interfície.
2. Utilitzar `Alert` per mostrar missatges a l'usuari, en lloc de limitar-se a imprimir-los a la consola.
3. Utilitzar variables i comprovacions `if` per controlar la visualització de diferents vistes i implementar el canvi entre la interfície abans i després de l'inici de sessió.

Mitjançant l'aprenentatge d'aquests coneixements, ja podem completar una vista d'inici de sessió amb interaccions bàsiques i entendre encara millor la idea de desenvolupament de SwiftUI: "quan l'estat canvia, la interfície s'actualitza".

## Codi complet

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
            VStack {
                Image("019_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Sign in to App")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Username")
                        .fontWeight(.bold)
                    TextField("input user", text: $user)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                HStack {
                    Text("Password")
                        .fontWeight(.bold)
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Coneixements ampliats - Alert amb diversos botons

En aquesta part anterior de la lliçó, vam utilitzar l'`Alert` més bàsic, que només té un botó i serveix principalment per avisar l'usuari.

De fet, `Alert` també pot contenir diversos botons perquè l'usuari pugui prendre diferents decisions.

Per exemple:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Quan es prem el botó, apareixerà un quadre de missatge amb tres opcions: `Ok`, `delete` i `cancel`.

Efecte de visualització:

![alert](../../Resource/020_alert2.png)

Quan es prem un botó diferent, s'executa el codi corresponent.

### La propietat role de Button

Aquí podràs veure que el `Button` dins de `Alert` és una mica diferent del botó normal que vam aprendre abans:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Aquí hi ha un paràmetre addicional, `role`.

A SwiftUI, `role` s'utilitza per indicar al sistema quin tipus d'acció representa aquest botó.

Alguns rols habituals són:

- `.cancel`: acció de cancel·lació
- `.destructive`: acció perillosa, com ara eliminar
- `nil`: acció normal

Els diferents `role` solen tenir també diferències d'estil a la interfície.

Per exemple, les accions perilloses sovint es mostren amb un estil més destacat per recordar a l'usuari que faci clic amb precaució.

A més, `role` també proporciona informació semàntica addicional al botó, fet que facilita que els lectors de pantalla (com ara VoiceOver als dispositius Apple) expliquin la funció del botó a l'usuari.

Per tant, en l'escenari adequat, afegir `role` a un botó és un molt bon hàbit.
