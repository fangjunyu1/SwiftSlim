# Inloggningsvy

I den här lektionen ska vi lära oss ett mycket praktiskt scenario, nämligen en inloggningsvy.

Oavsett om det är en webbplats eller en app behöver användaren i många fall logga in med konto och lösenord under användningen.

Till exempel GitHubs inloggningssida:

![WordPress](../../Resource/019_github.png)

I den här lektionen ska vi skapa en liknande inloggningsvy, så att användaren manuellt kan ange konto och lösenord och kontrollera om det finns problem med det inmatade innehållet.

## Övre layout

Vi kommer att skriva koden för inloggningsvyn i filen `ContentView`.

Först ska vi skapa identifikationsområdet högst upp i inloggningsvyn. Du kan först förbereda en lämplig ikonbild och lägga den i mappen `Assets`.

![icon](../../Resource/019_icon1.png)

Därefter använder vi `Image` och modifierare för att visa bilden:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Dessa modifierare betyder:

- `resizable()`: gör att bilden kan ändra storlek.
- `scaledToFit()`: skalar bilden med bibehållen ursprunglig proportion.
- `frame(width: 100)`: ställer in den visade bildbredden till `100`.

Därefter använder vi `Text` och modifierare för att visa inloggningsrubriken:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Sedan använder vi `VStack` för att placera bilden och texten vertikalt:

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

Härmed har vi slutfört rubrikområdet högst upp i inloggningsvyn.

### Optimera layouten

Nu ligger bilden och rubriken som standard i mitten av den övergripande layouten.

Om vi vill att de ska likna ett ”inloggningsmärke högst upp på sidan” mer, kan vi använda `Spacer()` för att fylla ut det återstående utrymmet så att innehållet visas närmare toppen.

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

Men nu ligger `Image` och `Text` för nära skärmens överkant och ser lite trångt ut.

Vid det här läget kan vi använda `padding` för att lägga till ett övre avstånd för hela `VStack`.

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

På så sätt ser rubrikområdet högst upp på sidan mer passande ut.

## Användarnamn och lösenord

En inloggningssida kräver vanligtvis att användaren anger användarnamn och lösenord.

I SwiftUI kan vi använda `TextField` för att ta emot det innehåll som användaren matar in.

Men observera: `TextField` lagrar inte själv inmatade data under lång tid, det är bara en inmatningskontroll. Det som faktiskt lagrar innehållet är de variabler som vi binder till det.

Därför behöver vi först skapa två `@State`-variabler för att lagra användarnamn och lösenord:

```swift
@State private var user = ""
@State private var password = ""
```

När värdet på en `@State`-variabel ändras uppdaterar SwiftUI automatiskt den relaterade vyn.

Därefter använder vi `TextField` för att binda dessa två variabler:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Här betyder `$user` och `$password` ”bindning”.

Det vill säga: när användaren skriver i inmatningsfältet ändras variabeln samtidigt; och när variabeln ändras, ändras också innehållet som visas i fältet samtidigt.

Den här relationen där ”vyn och data synkroniseras med varandra” är just bindning.

Observera att vi här måste använda skrivsättet med `$`:

```swift
$user
```

Eftersom `TextField` inte behöver en vanlig sträng utan ett bindningsvärde som ”kan ändra data i båda riktningar”.

### Visa inmatningsfält

Låt oss placera dem i `ContentView`:

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

Visningseffekt:

![view](../../Resource/019_view3.png)

Eftersom `user` och `password` nu som standard båda är tomma strängar:

```swift
""
```

Kommer inmatningsfältet först att visa en platshållartext, till exempel:

```swift
input user
```

Den här texten är bara en hint till användaren om ”vad som ska anges här” och är inte det verkliga inmatade innehållet.

### Optimera inmatningsfälten

Nu går det redan att använda inmatningsfälten, men standardstilen är ganska enkel.

För att göra gränssnittet tydligare kan vi lägga till en rubrik framför inmatningsfältet och ge själva fältet en enkel stilförbättring.

Till exempel kan vi först lägga till en rubrik:

```swift
Text("Username")
    .fontWeight(.bold)
```

Därefter använder vi `HStack` för att placera rubriken och inmatningsfältet på samma rad:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Här använder vi `HStack` eftersom vi vill ”visa rubriken till vänster och inmatningsfältet till höger”.

Det är viktigt att notera att `TextField` som standard kommer att ta upp det återstående tillgängliga utrymmet.

![color](../../Resource/019_view6.png)

För att göra storleken på de två inmatningsfälten mer enhetlig kan vi använda `frame(width:)` för att ge dem en bredd, så att de ser mer prydliga ut.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Lägg sedan till en kantlinje för att göra inmatningsfältet tydligare:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Nu lägger vi till både användarnamn och lösenord i vyn `ContentView`:

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

Visningseffekt:

![view](../../Resource/019_view4.png)

Här kan användaren nu ange användarnamn och lösenord.

## Inloggningsknapp

Nedan lägger vi till en inloggningsknapp under inmatningsfälten.

```swift
Button("Sign in") {

}
```

Därefter använder vi `buttonStyle` för att ge knappen en tydligare systemstil:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Visningseffekt:

![view](../../Resource/019_view5.png)

För att bekräfta att knappen verkligen kan reagera på klick kan vi först skriva en `print` i knappen för att testa:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

När du klickar på knappen kommer konsolen att skriva ut:

```swift
click Sign in
```

Det visar att knappen redan reagerar korrekt på klick.

## Inloggningslogik

Nu lägger vi till den mest grundläggande valideringslogiken i inloggningsknappen: **att kontrollera om användaren har matat in användarnamn och lösenord**.

Vi vill uppnå följande situationer:

- Om användaren inte har matat in något, skriv ut `Empty`
- Om användaren bara har matat in en av dem, visa vilken som saknas
- Om både användarnamn och lösenord har matats in, skriv ut `Success`

### Ingen information inmatad

Eftersom `user` och `password` som standard båda är tomma strängar:

```swift
@State private var user = ""
@State private var password = ""
```

Så förblir de tomma när användaren inte matar in något.

I Swift kan typer som `String` använda `isEmpty` för att avgöra om innehållet är tomt.

### Egenskapen isEmpty

`isEmpty` används ofta för att kontrollera om strängar, arrayer och annat innehåll är tomma.

Till exempel:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Om innehållet är tomt returnerar `isEmpty` `true`; om innehållet inte är tomt returnerar `isEmpty` `false`.

Därför kan vi använda det för att avgöra om användarnamn och lösenord har något innehåll.

### Använda isEmpty för att kontrollera variabler

Om användaren inte har matat in någon information, då:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Då kan vi skriva villkoret så här:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Den här koden betyder: om `user` är tom och `password` också är tom, skriv ut:

```swift
Empty
```

Här är `&&` en logisk operator som betyder ”och”.

Det vill säga att hela villkoret bara är sant när villkoret till vänster är sant och villkoret till höger också är sant.

Därför kommer den här koden bara att köras när både användarnamn och lösenord är tomma.

## Användaren fyllde bara i en del

Därefter tittar vi på en annan situation: användaren fyllde bara i användarnamnet eller bara lösenordet.

Till exempel:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

I det här fallet är användarnamnet inte tomt, men lösenordet är tomt.

Vi kan fortsätta att använda `isEmpty` för att kontrollera detta:

### Situationen där användaren fyllde i konto eller lösenord

Om användaren bara fyllde i användarnamnet eller lösenordet måste vi ge ett motsvarande meddelande om vad som saknas.

Till exempel om användaren bara fyllde i användarnamnet:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logiken i den här koden är: om användarnamnet är tomt, be om att fylla i användarnamnet. Annars kontrolleras om lösenordet är tomt; om det är tomt, be om att fylla i lösenordet.

### Användaren fyllde i all information

Om både användarnamn och lösenord redan har matats in kommer `isEmpty` för båda att returnera `false`.

Då kan vi skriva det så här:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Här betyder `!` ”negation”.

Till exempel:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Det vill säga att `user.isEmpty` används för att avgöra ”om användarnamnet är tomt”, medan `!user.isEmpty` används för att avgöra ”om användarnamnet inte är tomt”.

För lösenordet gäller samma logik.

Så betydelsen av den här koden är: användarnamnet är inte tomt, och lösenordet är inte heller tomt.

När dessa två villkor är uppfyllda skrivs följande ut:

```swift
Success
```

## Fullständig valideringslogik

Nu kombinerar vi dessa tre situationer och skriver in dem i `Button`:

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

Körordningen för den här koden kan förstås så här:

Första steget är att först kontrollera:

```swift
if user.isEmpty && password.isEmpty
```

Om både användarnamn och lösenord är tomma skrivs `Empty` ut direkt.

Om båda inte är tomma fortsätter programmet med att kontrollera följande rad:

```swift
else if user.isEmpty || password.isEmpty
```

Här betyder `||` ”eller”.

Det vill säga att så länge ett av villkoren är uppfyllt är hela uttrycket uppfyllt.

Därför kommer kodblocket i `else if` att köras så länge användarnamnet är tomt eller lösenordet är tomt.

Efter att vi gått in i kodblocket kontrollerar vi vidare vilket inmatningsfält som faktiskt inte har fyllts i:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Om de två första villkoren inte är uppfyllda betyder det att användarnamnet inte är tomt och att lösenordet inte heller är tomt.

Då går programmet in i den sista `else`:

```swift
print("Success")
```

På så sätt har vi slutfört den mest grundläggande valideringslogiken för inloggningsinmatning.

## Kontroll av användarnamn och lösenord

Logiken ovan kontrollerar bara ”om något innehåll har matats in”.

Men i en riktig app räcker det inte att bara mata in innehåll. Vanligtvis behöver användarnamnet och lösenordet också skickas till servern för verifiering.

Om servern bekräftar att användarnamnet finns och att lösenordet är korrekt tillåts inloggning; annars visas ett inloggningsfel.

För att öva på den här processen kan vi först ange ett tillfälligt konto och lösenord i koden och på så sätt simulera ”korrekt inloggningsinformation”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

När både användarnamn och lösenord inte är tomma jämför vi dem sedan för att se om de är korrekta:

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

Här betyder `==` ”om de är lika”.

Till exempel:

```swift
user == userID
```

Det betyder om användarnamnet som användaren matat in exakt matchar det korrekta användarnamn som vi har ställt in; för lösenordet gäller samma logik.

Därför skrivs `Success` ut när det inmatade användarnamnet och lösenordet är lika med de angivna värdena; om någon av dem inte är lika skrivs `Input error` ut.

På så sätt har vi slutfört en enkel ”simulerad inloggningsverifiering”.

Även om detta ännu inte är en riktig inloggningsfunktion som är kopplad till en server, räcker det redan för att hjälpa oss att förstå: **efter att knappen har klickats kan olika kod köras beroende på olika villkor**.

## Sammanfattning

I den här lektionen slutförde vi en grundläggande inloggningsvy och fokuserade särskilt på att lära oss ”logiken att bedöma det inmatade innehållet utifrån villkor”.

Kärninnehållet i den här lektionen är att använda `isEmpty` för att avgöra om en sträng är tom, samt att använda `if`-satser tillsammans med logiska operatorer för att hantera olika situationer.

Två mycket viktiga logiska operatorer är:

- `&&`: betyder ”och”, båda villkoren måste vara uppfyllda
- `||`: betyder ”eller”, det räcker att ett villkor är uppfyllt

När dessa villkor till slut ger `true` eller `false` kommer `if`-satsen att köra olika kod beroende på resultatet.

Genom den här inloggningsvyn har vi redan börjat komma i kontakt med ett utvecklingssätt som kombinerar ”gränssnitt + data + logisk bedömning”.

## Fullständig kod

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
