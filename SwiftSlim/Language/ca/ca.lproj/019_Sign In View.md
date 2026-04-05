# Vista d'inici de sessió

En aquesta lliçó, aprendrem un escenari molt pràctic: la vista d'inici de sessió.

Tant si és un lloc web com una aplicació, durant l'ús moltes vegades cal que l'usuari iniciï sessió al seu compte i introdueixi una contrasenya.

Per exemple, la pàgina d'inici de sessió de GitHub:

![WordPress](../../Resource/019_github.png)

En aquesta lliçó, crearem una vista d'inici de sessió similar perquè l'usuari introdueixi manualment el compte i la contrasenya, i comprovarem si hi ha cap problema amb el contingut introduït.

## Disposició superior

Escriurem el codi de la vista d'inici de sessió al fitxer `ContentView`.

Primer, escrivim la zona d'identificació de la part superior de la vista d'inici de sessió. Pots preparar abans una imatge d'icona adequada i posar-la a la carpeta `Assets`.

![icon](../../Resource/019_icon1.png)

Després, utilitza `Image` i modificadors per mostrar la imatge:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Aquests modificadors signifiquen:

- `resizable()`: permet canviar la mida de la imatge.
- `scaledToFit()`: escala la imatge mantenint la seva proporció original.
- `frame(width: 100)`: estableix l'amplada de visualització de la imatge a `100`.

A continuació, utilitza `Text` i modificadors per mostrar el títol d'inici de sessió:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Després, utilitza `VStack` per ordenar la imatge i el text verticalment:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Resultat:

![view](../../Resource/019_view.png)

Amb això, ja hem completat la zona del títol superior de la vista d'inici de sessió.

### Optimitzar la disposició

Ara mateix, la imatge i el títol es troben per defecte a la zona central de la disposició general.

Si volem que semblin més aviat una "identificació d'inici de sessió a la part superior de la pàgina", podem utilitzar `Spacer()` per expandir l'espai restant i fer que el contingut aparegui més a prop de la part superior.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Resultat:

![view](../../Resource/019_view1.png)

Però ara `Image` i `Text` han quedat massa a prop de la part superior de la pantalla, i es veu una mica atapeït.

En aquest moment, podem utilitzar `padding` per afegir un espai superior a tot el `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Resultat:

![view](../../Resource/019_view2.png)

Així, la zona del títol superior de la pàgina sembla una mica més adequada.

## Nom d'usuari i contrasenya

Una pàgina d'inici de sessió normalment necessita que l'usuari introdueixi un nom d'usuari i una contrasenya.

A SwiftUI, podem utilitzar `TextField` per rebre el contingut introduït per l'usuari.

Però cal tenir en compte que `TextField` no desa per si mateix les dades introduïdes a llarg termini; només és un control d'entrada. Qui desa realment aquest contingut introduït són les variables que hi vinculem.

Per tant, primer hem de crear dues variables `@State` per desar el nom d'usuari i la contrasenya:

```swift
@State private var user = ""
@State private var password = ""
```

Quan el valor d'una variable `@State` canvia, SwiftUI actualitza automàticament les vistes relacionades.

A continuació, utilitza `TextField` per vincular aquestes dues variables:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Aquí, `$user` i `$password` representen un "binding".

És a dir, quan l'usuari escriu text al camp d'entrada, la variable canvia al mateix temps; i quan la variable canvia, el contingut mostrat al camp d'entrada també canvia de manera sincronitzada.

Aquesta relació en què "la vista i les dades se sincronitzen mútuament" és precisament el binding.

Fixa't que aquí s'ha d'utilitzar la forma amb `$`:

```swift
$user
```

Perquè `TextField` no necessita una cadena normal, sinó un valor de binding que "pot modificar les dades en dues direccions".

### Mostrar els camps d'entrada

Posem-los dins de `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efecte de visualització:

![view](../../Resource/019_view3.png)

Com que ara `user` i `password` són cadenes buides per defecte:

```swift
""
```

per això al camp d'entrada es mostrarà primer un text de marcador de posició, per exemple:

```swift
input user
```

Aquest text només indica a l'usuari "què s'hauria d'introduir aquí", i no és el contingut real introduït.

### Optimitzar els camps d'entrada

Ara els camps d'entrada ja es poden utilitzar, però l'estil predeterminat és bastant simple.

Per tal que la interfície sigui més clara, podem afegir un títol davant del camp d'entrada i fer una petita optimització d'estil del mateix camp.

Per exemple, primer afegeix un títol:

```swift
Text("Username")
    .fontWeight(.bold)
```

Després, utilitza `HStack` per posar el títol i el camp d'entrada a la mateixa línia:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Aquí utilitzem `HStack` perquè volem "mostrar el títol a l'esquerra i el camp d'entrada a la dreta".

Cal tenir en compte que `TextField` ocuparà per defecte l'espai disponible restant.

![color](../../Resource/019_view6.png)

Per fer que la mida dels dos camps d'entrada sigui més uniforme, podem utilitzar `frame(width:)` per establir-ne una amplada, de manera que els camps d'entrada es vegin més ordenats.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Després, afegeix també una vora perquè el camp d'entrada es vegi una mica més clar:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ara, afegim tant el nom d'usuari com la contrasenya a la vista `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efecte de visualització:

![view](../../Resource/019_view4.png)

Fins aquí, l'usuari ja pot introduir el nom d'usuari i la contrasenya.

## Botó d'inici de sessió

A continuació, afegirem un botó d'inici de sessió sota els camps d'entrada.

```swift
Button("Sign in") {

}
```

Després, utilitza `buttonStyle` per afegir al botó un estil del sistema més visible:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Efecte de visualització:

![view](../../Resource/019_view5.png)

Per confirmar que el botó realment respon al toc, primer podem escriure un `print` dins del botó per provar-ho:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Quan es toqui el botó, la consola mostrarà:

```swift
click Sign in
```

Això indica que el botó ja ha respost correctament al toc.

## Lògica d'inici de sessió

Ara afegirem al botó d'inici de sessió la lògica de validació més bàsica: **comprovar si l'usuari ha introduït el nom d'usuari i la contrasenya**.

Volem aconseguir les situacions següents:

- Si l'usuari no introdueix res, mostra `Empty`
- Si l'usuari només introdueix un dels dos camps, indica quin falta
- Si tant el nom d'usuari com la contrasenya s'han introduït, mostra `Success`

### No s'ha introduït cap informació

Com que `user` i `password` són cadenes buides per defecte:

```swift
@State private var user = ""
@State private var password = ""
```

si l'usuari no introdueix res, continuaran estant buides.

A Swift, tipus com `String` poden utilitzar `isEmpty` per determinar si el contingut és buit.

### Propietat isEmpty

`isEmpty` s'utilitza sovint per comprovar si cadenes, matrius i altres continguts estan buits.

Per exemple:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Si el contingut és buit, `isEmpty` retorna `true`; si el contingut no és buit, retorna `false`.

Per tant, podem utilitzar-lo per determinar si el nom d'usuari i la contrasenya tenen contingut introduït.

### Utilitzar isEmpty per detectar variables

Si l'usuari no introdueix cap informació, aleshores:

```swift
user.isEmpty // true
password.isEmpty    // true
```

En aquest moment, podem escriure la comprovació així:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Aquest codi vol dir: si `user` és buit i `password` també és buit, mostra:

```swift
Empty
```

Aquí `&&` és un operador lògic i significa "i".

És a dir, tota la condició només serà certa quan la condició de l'esquerra sigui certa i la de la dreta també ho sigui.

Per tant, aquest codi només s'executarà quan tant el nom d'usuari com la contrasenya estiguin buits.

## L'usuari només ha omplert una part

A continuació, considerem una altra situació: l'usuari només ha omplert el nom d'usuari, o només ha omplert la contrasenya.

Per exemple:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

En aquest moment, el nom d'usuari no és buit, però la contrasenya sí que és buida.

Podem continuar utilitzant `isEmpty` per comprovar-ho:

### Cas en què l'usuari ha omplert el compte o la contrasenya

Si l'usuari només ha omplert el nom d'usuari o la contrasenya, hem de donar el missatge corresponent sobre què falta.

Per exemple, si l'usuari només ha omplert el nom d'usuari:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

La lògica d'aquest codi és: si el nom d'usuari és buit, demana que s'introdueixi el nom d'usuari. En cas contrari, comprova si la contrasenya és buida i, si ho és, demana que s'introdueixi la contrasenya.

### L'usuari ha omplert tota la informació

Si tant el nom d'usuari com la contrasenya ja s'han introduït, `isEmpty` retornarà `false` en tots dos casos.

En aquest moment, podem escriure-ho així:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Aquí `!` significa "negació".

Per exemple:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

És a dir, `user.isEmpty` s'utilitza per determinar "si el nom d'usuari és buit", i `!user.isEmpty` s'utilitza per determinar "si el nom d'usuari no és buit".

La contrasenya segueix exactament la mateixa lògica.

Per tant, el significat d'aquest codi és: el nom d'usuari no és buit i la contrasenya tampoc no és buida.

Quan es compleixen totes dues condicions, la sortida és:

```swift
Success
```

## Lògica de validació completa

Ara combinarem aquestes tres situacions i les escriurem dins de `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

L'ordre d'execució d'aquest codi es pot entendre així:

Primer pas, primer comprovem:

```swift
if user.isEmpty && password.isEmpty
```

Si tant el nom d'usuari com la contrasenya són buits, es mostrarà directament `Empty`.

Si no són tots dos buits, continuarem comprovant aquesta línia:

```swift
else if user.isEmpty || password.isEmpty
```

Aquí `||` significa "o".

És a dir, mentre una de les condicions sigui certa, la condició global serà certa.

Per tant, sempre que el nom d'usuari sigui buit o la contrasenya sigui buida, s'executarà el bloc de codi de `else if`.

Després d'entrar al bloc, comprovem encara més quin dels camps d'entrada no s'ha omplert:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Si les dues condicions anteriors no es compleixen, això vol dir que el nom d'usuari no és buit i la contrasenya tampoc no és buida.

Aleshores el programa entrarà a l'últim `else`:

```swift
print("Success")
```

D'aquesta manera, ja hem completat la lògica més bàsica de validació de l'entrada d'inici de sessió.

## Validació del nom d'usuari i la contrasenya

La lògica anterior només comprova "si s'ha introduït contingut o no".

Però en una aplicació real, no n'hi ha prou només amb introduir contingut. Normalment també cal enviar el nom d'usuari i la contrasenya al servidor per validar-los.

Si el servidor confirma que el nom d'usuari existeix i que la contrasenya és correcta, permetrà iniciar la sessió; en cas contrari, indicarà que l'inici de sessió ha fallat.

Per practicar aquest procés, primer podem establir al codi un compte temporal i una contrasenya per simular "la informació correcta d'inici de sessió":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Quan tant el nom d'usuari com la contrasenya no siguin buits, comparem després si són correctes:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Aquí `==` significa "si és igual".

Per exemple:

```swift
user == userID
```

Això vol dir si el nom d'usuari introduït per l'usuari coincideix exactament amb el nom d'usuari correcte que hem establert; la comprovació de la contrasenya segueix la mateixa lògica.

Per tant, quan el nom d'usuari i la contrasenya introduïts siguin iguals als valors establerts, la sortida serà `Success`; mentre que si qualsevol dels dos no és igual, la sortida serà `Input error`.

D'aquesta manera, hem completat una simple "simulació de validació d'inici de sessió".

Encara que encara no és una funció d'inici de sessió real connectada a un servidor, ja és suficient per ajudar-nos a entendre: **després de prémer el botó, es poden executar codis diferents segons condicions diferents**.

## Resum

En aquesta lliçó, hem completat una vista bàsica d'inici de sessió i ens hem centrat a aprendre la "lògica de jutjar el contingut introduït segons les condicions".

El contingut principal d'aquesta lliçó és: utilitzar `isEmpty` per determinar si una cadena és buida i utilitzar la sentència `if` juntament amb operadors lògics per gestionar situacions diferents.

Entre aquests, hi ha dos operadors lògics molt importants:

- `&&`: significa "i", s'han de complir totes dues condicions
- `||`: significa "o", n'hi ha prou que se'n compleixi una

Quan aquestes condicions finalment donen `true` o `false`, la sentència `if` executarà un codi diferent segons el resultat.

Amb aquesta vista d'inici de sessió, ja hem començat a entrar en contacte amb la manera de desenvolupament que combina "interfície + dades + judici lògic".

## Codi complet

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
