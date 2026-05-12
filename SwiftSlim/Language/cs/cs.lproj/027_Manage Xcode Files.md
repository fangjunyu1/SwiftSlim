# Správa souborů v Xcode

V této lekci se naučíme běžné operace se soubory v Xcode.

V předchozích lekcích jsme většinu kódu psali do `ContentView`. Díky tomu lze snadno sledovat kód a výsledné zobrazení.

Například:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Ve skutečné aplikaci ale obvykle nedáváme všechen kód do jednoho souboru.

Když přibývá stránek, komponent a funkcí, potřebujeme rozdělit různé views do různých souborů SwiftUI.

Například:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Díky tomu je struktura kódu přehlednější a pozdější údržba i úpravy jsou jednodušší.

## Proč spravovat soubory

Ve SwiftUI lze stránku nebo komponentu obvykle napsat jako samostatný soubor view.

Například:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Zde je `CardView` view ve SwiftUI.

Pokud jsou všechna views napsaná v `ContentView`, kód bude stále delší a bude se stále hůře číst.

Proto se musíme naučit vytvářet, přejmenovávat a mazat soubory a také používat složky ke správě různých souborů s kódem.

## Vytvoření souboru SwiftUI

V Xcode existují obvykle dva běžné způsoby, jak vytvořit soubor SwiftUI:

Jedním způsobem je vytvořit prázdný soubor a potom si kód napsat sami.

Druhým způsobem je vytvořit soubor ze šablony SwiftUI, ve kterém Xcode automaticky vygeneruje základní kód.

Pro začátečníky je vhodnější používat šablonu SwiftUI, protože automaticky vygeneruje základní strukturu.

### Vytvoření prázdného souboru

V levé části Xcode, v oblasti Navigator, klikněte pravým tlačítkem na prázdné místo nebo složku a vyberte `New Empty File`.

Místo operace je následující:

![xcode](../../../Resource/027_view1.png)

Po vytvoření prázdného souboru Xcode obvykle vygeneruje nepojmenovaný soubor Swift, například `Untitled.swift`.

Můžeme ho přejmenovat na `TestView.swift`.

V projektu SwiftUI se obvykle doporučuje přidat na konec názvu `View`, pokud tento soubor slouží k zobrazení view.

Například:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Není to povinné pravidlo, ale na první pohled nám to pomůže poznat, že jde o soubor view.

Po vytvoření prázdného souboru může soubor obsahovat jen výchozí komentáře, nebo může být prázdný. Záleží na verzi Xcode a způsobu vytvoření.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

V této chvíli musíme ručně napsat kód SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Tím je jednoduchý soubor view SwiftUI vytvořen.

### Přejmenování souboru

Pokud chcete po vytvoření souboru změnit jeho název, můžete v levé oblasti Navigator v Xcode vybrat soubor a potom stisknout klávesu Enter `⏎`.

![xcode](../../../Resource/027_view2.png)

Tím lze název souboru upravit.

Je třeba si uvědomit, že změna názvu souboru automaticky nezmění název view v kódu.

Například po změně názvu souboru na `ProfileView.swift` může v kódu stále zůstat `struct TestView: View`.

Nemusí to nutně způsobit chybu, ale snadno to vyvolá zmatek.

Proto se doporučuje udržovat název souboru a název view konzistentní. Pokud je například název souboru `ProfileView.swift`, měl by se jako název view používat také `ProfileView`.

## Vytvoření souboru ze šablony SwiftUI

Kromě vytvoření prázdného souboru můžeme přímo vytvořit také soubor ze šablony SwiftUI.

V levé oblasti Navigator v Xcode klikněte pravým tlačítkem na prázdné místo nebo složku a vyberte `New File from Template...`.

Místo operace je následující:

![xcode](../../../Resource/027_view3.png)

V zobrazeném okně lze nahoře vybrat různé platformy, například `iOS`, `macOS` a další.

Zde stačí ponechat platformu odpovídající aktuálnímu projektu. Pokud například vytváříme iOS App, vybereme `iOS`.

![xcode](../../../Resource/027_view4.png)

Potom dole vyberte `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Potom klikněte na `Next`, zadejte název souboru a uložte ho.

Například vytvoříme soubor `Test2View.swift`.

Xcode automaticky vygeneruje kód podobný následujícímu:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Ve srovnání s prázdným souborem bude soubor ze šablony automaticky obsahovat `import SwiftUI`, `struct`, `body` a `#Preview`.

Pro začátečníky je proto použití šablony SwiftUI jednodušší a také se tím snižuje pravděpodobnost, že zapomenou dopsat potřebný kód.

**Tip**: Kromě vytvoření souboru kliknutím pravým tlačítkem lze také kliknout na tlačítko plus ve spodní části levého Navigatoru v Xcode a vytvořit soubor nebo složku.

![xcode](../../../Resource/027_view5.png)

## Vytvoření složky

Když souborů přibývá, můžeme je spravovat pomocí složek.

V levé oblasti Navigator v Xcode klikněte pravým tlačítkem na prázdné místo nebo složku a vyberte `New Folder`.

Po vytvoření složky do ní můžete přetáhnout související soubory.

![xcode](../../../Resource/027_view7.png)

Složky slouží hlavně k uspořádání struktury projektu a nemění způsob použití samotného view.

Pokud je název view správný, lze ho v jiných souborech stále používat například pomocí `TestView()` nebo `Test2View()`.

## Odstranění souboru nebo složky

Pokud chcete odstranit soubor nebo složku, můžete v levé oblasti Navigator v Xcode vybrat odpovídající soubor, potom kliknout pravým tlačítkem a vybrat `Delete`.

Můžete také vybrat soubor a stisknout klávesu Delete `⌫`.

Xcode zobrazí potvrzovací okno pro odstranění.

![xcode](../../../Resource/027_view10.png)

Volba `Move to Trash` znamená přesunout soubor do Koše.

Pokud vidíte `Remove Reference`, znamená to pouze odstranění odkazu z projektu Xcode, ale původní soubor na disku se nesmaže.

Pro začátečníky obvykle stačí zvolit `Move to Trash`, pokud mažete jen běžný soubor, který jste právě vytvořili.

## Zobrazení více views SwiftUI

Jakmile se naučíme vytvářet soubory, můžeme rozdělit různá views do různých souborů.

Například vytvoříme dva soubory SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` slouží k zobrazení jména autora:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` slouží k zobrazení pozadí karty:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Potom můžeme tato dvě views použít v `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Po spuštění uvidíme, že `CardView` a `AuthorView` jsou zobrazeny společně:

![xcode](../../../Resource/027_view11.png)

V tomto výsledku slouží `CardView` jako pozadí a `AuthorView` se zobrazuje nahoře, protože jsou vloženy do `ZStack`.

V `ContentView` používáme tato dvě views pomocí `CardView()` a `AuthorView()`. Závorky `()` za názvem znamenají vytvoření a použití tohoto view.

To je běžné vnořování views ve SwiftUI: v jednom view lze dál používat jiná views.

## Vstupní soubor

Nakonec si připomeňme, odkud aplikace začíná zobrazovat rozhraní.

V projektu SwiftUI se obvykle nachází vstupní soubor:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

`@main` zde znamená, že toto je vstupní místo aplikace.

V `WindowGroup` vidíme:

```swift
ContentView()
```

To znamená, že po spuštění aplikace se nejprve zobrazí `ContentView`.

Potom se uvnitř `ContentView` dále zobrazí:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Hierarchii views tedy můžeme chápat takto:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Pokud ve vstupním souboru změníme zobrazené view na `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Potom se po spuštění aplikace zobrazí pouze `CardView`.

Jinými slovy, `WindowGroup` ve vstupním kódu určuje, které view se po spuštění aplikace zobrazí jako první.

A uvnitř tohoto view lze dále zobrazovat další views.

## Shrnutí

V této lekci jsme se naučili běžné operace správy souborů v Xcode.

Zjistili jsme, jak vytvářet soubory SwiftUI, jak je přejmenovávat, jak vytvářet složky a jak mazat soubory.

Zároveň jsme se naučili důležitý koncept: SwiftUI views lze rozdělit do různých souborů a potom je používat v jiných views.

Například:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Zde jsou `CardView()` a `AuthorView()` použitím jiných views uvnitř `ContentView`.

Nakonec jsme si také připomněli logiku zobrazení vstupního souboru.

Při spuštění aplikace se nejprve vstoupí do vstupního kódu označeného `@main` a potom se zobrazí view uvnitř `WindowGroup`.

To nám pomáhá pochopit, že různé soubory SwiftUI nejsou izolované. Mohou se navzájem kombinovat a nakonec vytvořit kompletní rozhraní aplikace.
