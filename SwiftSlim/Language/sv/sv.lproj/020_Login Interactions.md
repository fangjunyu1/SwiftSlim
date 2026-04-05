# Inloggningsinteraktioner

I den föregående lektionen skapade vi en inloggningsvy och använde knappar samt villkorslogik för att genomföra enkel validering av det inmatade innehållet.

I den här lektionen fortsätter vi att bygga vidare på koden från den föregående lektionen för att lära oss om lösenordsfältet `SecureField`, varningsrutan `Alert` och hur man styr visningen av olika vyer utifrån variabler.

Genom den här lektionen kan du förstå det grundläggande interaktionsflödet i en inloggningsvy bättre. Det här är också grundläggande logik som ofta används i många appar.

## Lösenordsfält

I den föregående lektionen använde vi `TextField` för att skriva in ett lösenord.

I ett riktigt inloggningsgränssnitt visas lösenordet dock vanligtvis inte direkt. I stället visas det som punkter eller med någon annan dold effekt, vilket hjälper till att skydda användarens integritet.

I SwiftUI är kontrollen som är särskilt avsedd för att skriva in lösenord `SecureField`.

Till exempel:

```swift
SecureField("Password", text: $password)
```

Dess syntax är väldigt lik `TextField`. Den behöver också en platshållartext och en bunden variabel.

Du kan enkelt förstå det så här: `SecureField` är också ett inmatningsfält, men det döljer innehållet som skrivs in.

Vi kan direkt ändra `TextField` som ursprungligen användes för att skriva in lösenordet till `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

När användaren skriver in ett lösenord kommer lösenordets innehåll inte längre att visas direkt i gränssnittet.

Visningseffekt:

![password](../../Resource/020_password.png)

Nu kan vi skriva in användarnamn och lösenord och sedan klicka på knappen för att avgöra om inmatningen är korrekt.

### Visa återkopplingsmeddelanden

Tidigare använde vi hela tiden `print` för att skriva ut resultat.

Innehållet från `print` visas bara i konsolen. Utvecklare kan se det när de kör programmet i Xcode, men vanliga användare på en telefon kan inte se dessa meddelanden.

Det betyder att även om programmet redan har slutfört valideringen vet användaren fortfarande inte om det inmatade innehållet är korrekt.

Vid den här punkten behöver vi ett sätt att visa meddelanden direkt i gränssnittet.

## Varningsruta Alert

I SwiftUI kan vi använda `Alert` för att visa en popup-ruta med ett meddelande.

Grundläggande användning:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Den här koden ser lite mer komplex ut än de tidigare kontrollerna, men vi kan förstå den genom att dela upp den.

`Alert` innehåller huvudsakligen följande delar:

- `"Title"`: varningsrutans titel
- `isPresented`: ett bundet booleskt värde som används för att styra om varningsrutan visas
- `Button(...)`: knappen i varningsrutan
- `message:`: meddelandeinnehållet som visas i varningsrutan

Du kan enkelt förstå det så här: när den bundna variabeln blir `true` visar systemet den här varningsrutan.

Visningseffekt:

![alert](../../Resource/020_alert3.png)

Motsvarande struktur:

![alert](../../Resource/020_alert.png)

### Alert är en modifierare

Precis som många av de modifierare vi lärde oss tidigare läggs `Alert` också till efter en viss vy.

Till exempel kan den fästas efter en knapp:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Den kan också fästas efter den yttre `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

Det betyder att `Alert` inte är en fristående vy som placeras självständigt i gränssnittet. I stället är den en modifierare som är kopplad till en viss vy.

Du kan enkelt förstå det så här: `Alert` skrivs vanligtvis efter en knapp eller efter den yttre layouten för att visa ett meddelande när ett visst villkor uppfylls.

### Visa Alert

Om vi vill visa en `Alert` behöver vi en variabel för att styra den.

Till exempel:

```swift
@State private var showAlert = false
```

Den här variabeln är av typen `Bool`, vilket betyder att den bara har två värden: `true` eller `false`.

Bind sedan den till `isPresented` för `Alert`:

```swift
isPresented: $showAlert
```

När `showAlert` är `false` visas inte varningsrutan. När `showAlert` är `true` visas varningsrutan.

### Visa varningsrutan genom en knapp

Nu ska vi först implementera det enklaste scenariot:

När användaren inte skriver in någonting alls och direkt klickar på knappen `Sign in`, visa en meddelanderuta som berättar att de ännu inte har skrivit in något innehåll.

Skapa först en variabel för att styra den här meddelanderutan:

```swift
@State private var showEmpty = false
```

Lägg sedan till en `Alert` efter `Button`:

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

Därefter utför du kontrollen i koden som körs vid knapptryckning:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Om både `user` och `password` är tomma sätter du `showEmpty` till `true`.

Och eftersom `Alert` är bunden till den här variabeln kommer systemet automatiskt att visa varningsrutan när den blir `true`.

Visningseffekt:

![alert](../../Resource/020_alert1.png)

På så sätt kan användaren se meddelandet direkt efter att ha klickat på knappen, och utvecklaren behöver inte kontrollera `print`-utmatningen i konsolen.

### Förbättra knappen och varningsrutorna

Tidigare hanterade vi bara fallet där ”ingenting fylldes i”.

Vi behöver fortfarande hantera följande situationer:

- användarnamnet saknas
- lösenordet saknas
- både användarnamn och lösenord är ifyllda, men inmatningen är felaktig

Därför behöver vi också förbereda motsvarande meddelanden för dessa fall.

Lägg först till tre nya variabler:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Fortsätt sedan att lägga till motsvarande `Alert` efter knappen:

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

Komplettera sedan beslutslogiken inne i knappen:

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

När knappen avgör att användaren inte har fyllt i någon information, har lämnat en uppgift tom eller har misslyckats med valideringen, ändrar den motsvarande booleska variabeln till `true`, och därefter visas motsvarande `Alert`.

Här rekommenderar jag att du själv testar flera situationer:

- fyll inte i någonting
- fyll bara i användarnamnet
- fyll bara i lösenordet
- fyll i både användarnamn och lösenord, men med fel innehåll
- fyll i både användarnamn och lösenord, och innehållet är korrekt

Detta hjälper till att verifiera om det finns några problem i vår kod. Det är också ett mycket viktigt steg av ”testning” i apputveckling.

Om programmet beter sig felaktigt i ett visst scenario betyder det att det kan finnas ett problem i logiken, och att en `Bug` har uppstått i programmet.

Det som utvecklare ofta kallar en `Bug` syftar på ett fel, en brist eller ett beteende som inte stämmer överens med förväntningarna.

## Slutföra inloggningsvyn

De `Alert`-exempel vi pratade om tidigare handlade alla om hur man ger användaren återkoppling när ”inmatningen är fel”.

När användaren skriver in rätt användarnamn och lösenord visar vi vanligtvis inte en ”varningsruta”. I stället går vi direkt vidare till gränssnittet efter inloggning.

Det här involverar ett mycket viktigt koncept: **att visa olika vyer beroende på värdet på en variabel.**

Till exempel:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Här använder vi typen `Bool` för att hantera vilken vy som visas:

- om `login` är `true` betyder det att inloggningen redan har lyckats och att innehållet efter inloggning visas
- om `login` är `false` betyder det att inloggningen inte har lyckats, och inloggningsgränssnittet fortsätter att visas.

Även om `if`-satsen är en villkorssats i Swift kan den inne i `body` i SwiftUI användas för att styra logiken för visning av vyer.

Det betyder att SwiftUI avgör vilken vy som ska visas just nu baserat på resultatet av villkoret.

Vi kan placera denna visningslogik i den aktuella `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Kod för den ursprungliga inloggningsvyn
		}
	}
}
```

Här lade vi till en ny variabel, `login`, för att ange om användaren redan har loggat in framgångsrikt.

Sedan placerade vi koden för inloggningsvyn som vi redan hade skrivit efter `else`-satsen.

Logik för vyvisning:

- när `login` är `false` betyder det att inloggningen ännu inte har lyckats, så den ursprungliga inloggningsvyn fortsätter att visas.
- när `login` är `true` betyder det att inloggningen har lyckats. Då visas inte längre inloggningsvyn, och `Login successful` visas i stället.

Det betyder att `ContentView` kommer att visa olika vyinnehåll beroende på värdet av `login`.

Låt oss sedan ändra logiken för lyckad inloggning inne i knappen:

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

När användarnamnet och lösenordet som användaren har skrivit in båda är korrekta sätter vi `login` till `true`.

Så snart värdet på `login` ändras ändras också resultatet av `if`-kontrollen i `ContentView`, och gränssnittet växlar från den ursprungliga inloggningsvyn till `Login successful`.

Visningseffekten är följande:

![view](../../Resource/020_view.png)

Nu har vi verkligen tillämpat idén om att ”visa olika vyer beroende på villkor” på den här aktuella inloggningssidan.

I riktiga appar fungerar det vanligtvis också så här: olika vyer visas beroende på ett visst värde.

Till exempel visas inloggningssidan när användaren inte är inloggad. Efter att användaren har loggat in framgångsrikt visas ett annat gränssnitt.

Kärnidén är: **använd förändringar i variabler för att styra vilket innehåll gränssnittet visar.**

## Sammanfattning

I den här lektionen lärde vi oss tre viktiga saker:

1. Att använda `SecureField` för att skriva in lösenord så att lösenordets innehåll inte visas direkt i gränssnittet.
2. Att använda `Alert` för att visa meddelanden för användaren i stället för att bara skriva ut dem i konsolen.
3. Att använda variabler och `if`-villkor för att styra visningen av olika vyer, vilket gör det möjligt att växla mellan gränssnitt före och efter inloggning.

Genom att lära oss dessa kunskaper kan vi nu slutföra en inloggningsvy med grundläggande interaktionseffekter och bättre förstå SwiftUI:s utvecklingsidé: ”när tillståndet ändras uppdateras gränssnittet”.

## Fullständig kod

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

## Utökad kunskap - Alert med flera knappar

I den tidigare delen av den här lektionen använde vi den mest grundläggande `Alert`, som bara har en knapp och främst används för att informera användaren.

Faktum är att `Alert` också kan innehålla flera knappar så att användaren kan göra olika val.

Till exempel:

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

När du klickar på knappen visas en meddelanderuta med tre alternativ: `Ok`, `delete` och `cancel`.

Visningseffekt:

![alert](../../Resource/020_alert2.png)

Om du klickar på olika knappar körs motsvarande kod.

### Egenskapen `role` för Button

Här kommer du att märka att `Button` inuti `Alert` är lite annorlunda än den vanliga knappsynatxen som vi lärde oss tidigare:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Här finns en extra parameter `role`.

I SwiftUI används `role` för att tala om för systemet vilken typ av åtgärd den här knappen representerar.

Några vanliga roller är:

- `.cancel`: en avbryt-åtgärd
- `.destructive`: en farlig åtgärd, till exempel borttagning
- `nil`: en vanlig åtgärd

Olika `role`-värden leder vanligtvis också till olika visuella stilar i gränssnittet.

Till exempel visas farliga åtgärder ofta med en mer iögonfallande stil för att påminna användare om att klicka försiktigt.

Dessutom ger `role` extra semantisk information till knappen, vilket gör det lättare för skärmläsare, som VoiceOver på Apple-enheter, att förklara knappens syfte för användaren.

Därför är det en mycket bra vana att lägga till `role` på en knapp i lämpliga situationer.
