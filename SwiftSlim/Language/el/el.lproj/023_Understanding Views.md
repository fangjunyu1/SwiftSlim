# Κατανόηση των Views

Σε αυτό το μάθημα επιστρέφουμε ξανά στο αρχικό `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Όταν γνωρίσαμε για πρώτη φορά το SwiftUI, μέσα στο `ContentView` υπήρχαν πολλές λέξεις-κλειδιά που δεν καταλαβαίναμε.

Για παράδειγμα `struct`, `View`, `var`, `body`, `some View` και άλλες λέξεις-κλειδιά.

Τότε ίσως ξέραμε μόνο ότι: **αν γράψουμε κώδικα μέσα στο `body`, το περιεχόμενο θα εμφανιστεί στη διεπαφή.**

Τώρα έχουμε μάθει το `struct`, τις μεταβλητές, τις μεθόδους και τα πρωτόκολλα, οπότε μπορούμε να κατανοήσουμε ξανά αυτόν τον κώδικα και να καταλάβουμε καλύτερα τη σχέση ανάμεσα στα SwiftUI views.

## Επανεξέταση του ContentView

Μετά τη δημιουργία ενός SwiftUI project, το Xcode δημιουργεί από προεπιλογή ένα αρχείο `ContentView`.

Ο ενδεικτικός κώδικας είναι:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Γεια σου, κόσμε!")
        }
        .padding()
    }
}
```

Αυτός ο κώδικας μπορεί να κατανοηθεί αν τον χωρίσουμε σε μερικά μέρη.

Πρώτα:

```swift
import SwiftUI
```

Αυτή η γραμμή σημαίνει ότι εισάγουμε το framework SwiftUI.

Μετά την εισαγωγή του SwiftUI, μπορούμε να χρησιμοποιούμε SwiftUI views όπως `View`, `Text`, `Image`, `VStack`, `Button` και άλλα.

## Η δομή ContentView

Αυτή η γραμμή κώδικα σημαίνει ότι δημιουργούμε μία δομή:

```swift
struct ContentView: View
```

Μέσα σε αυτήν:

```swift
struct ContentView
```

σημαίνει ότι το `ContentView` είναι μία δομή.

Στο προηγούμενο μάθημα γνωρίσαμε τη δομή `struct`. Μπορεί να συνδυάζει διαφορετικά σχετικά πεδία και μπορεί να περιέχει ιδιότητες και μεθόδους.

Για παράδειγμα:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Σε αυτό το παράδειγμα, το `ContentView` περιέχει τρία πράγματα: `name`, `printName` και `body`.

Δηλαδή, το `struct` μπορεί να συνδυάσει σχετικές ιδιότητες, μεθόδους και περιεχόμενο view.

![contentView](../../Resource/023_contentVIew.png)

## Το View είναι πρωτόκολλο

Συνεχίζουμε να κοιτάζουμε αυτή τη γραμμή κώδικα:

```swift
struct ContentView: View 
```

Το `View` μετά την άνω και κάτω τελεία σημαίνει ότι το `ContentView` συμμορφώνεται με το πρωτόκολλο `View`.

Μπορούμε να το καταλάβουμε έτσι: αν το `ContentView` θέλει να γίνει SwiftUI view, πρέπει να ικανοποιεί τις απαιτήσεις του πρωτοκόλλου `View`.

### Το πρωτόκολλο Identifiable

Όταν μάθαμε προηγουμένως τη λίστα ταινιών, ήρθαμε σε επαφή με το πρωτόκολλο `Identifiable`.

Τότε χρειαζόταν να διατρέξουμε ένα array `Movie` μέσα σε `ForEach`, αλλά η δομή `Movie` δεν είχε μοναδικό αναγνωριστικό, οπότε δεν υποστήριζε τη διάσχιση με `ForEach`.

Τότε έπρεπε να κάνουμε τη δομή `Movie` να συμμορφώνεται με το πρωτόκολλο `Identifiable`, ώστε να ικανοποιεί την απαίτηση του `ForEach` για μοναδικό αναγνωριστικό.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Το πρωτόκολλο `Identifiable` απαιτεί: **αυτός ο τύπος να έχει ένα πεδίο `id` που τον αναγνωρίζει.**

Αφού το `Movie` παρέχει ένα πεδίο `id`, μπορεί να ικανοποιήσει την απαίτηση του `Identifiable`.

Έτσι, όταν το χρησιμοποιούμε σε `ForEach`, το SwiftUI μπορεί να αναγνωρίζει κάθε στοιχείο δεδομένων.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Το πρωτόκολλο View

Το ίδιο ισχύει και για το πρωτόκολλο `View`.

Αν ένας τύπος θέλει να γίνει SwiftUI view, πρέπει να συμμορφώνεται με το πρωτόκολλο `View`.

Και η πιο σημαντική απαίτηση του πρωτοκόλλου `View` είναι να παρέχει ένα `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Μπορούμε να καταλάβουμε την απαίτηση του πρωτοκόλλου `View` έτσι: **δέχεται μόνο το SwiftUI view που επιστρέφει το `body`, ενώ το `ContentView` εμφανίζει SwiftUI view μέσω του `body`.**

### Τι γίνεται αν δεν ακολουθήσουμε το View;

Αν γράψουμε έτσι:

```swift
struct ContentView {
}
```

αυτό είναι απλώς μία συνηθισμένη δομή, όχι SwiftUI view.

Δεν θα εμφανίσει άμεσα σφάλμα, επειδή μία συνηθισμένη δομή είναι από μόνη της έγκυρος Swift κώδικας.

Αλλά αν τη βάλουμε στην προεπισκόπηση:

```swift
#Preview {
    ContentView()
}
```

τότε θα εμφανιστεί σφάλμα.

Ο λόγος είναι: **η προεπισκόπηση χρειάζεται να εμφανίσει ένα SwiftUI view, ενώ αυτό το `ContentView` δεν συμμορφώνεται με το πρωτόκολλο `View`.**

Επομένως, αν θέλουμε το `ContentView` να μπορεί να εμφανιστεί στη διεπαφή, πρέπει να το κάνουμε να συμμορφώνεται με το πρωτόκολλο `View`:

```swift
struct ContentView: View {
}
```

Ταυτόχρονα, πρέπει να παρέχουμε `body` σύμφωνα με την απαίτηση του πρωτοκόλλου `View`. Αν δεν υπάρχει `body`, ο compiler θα εμφανίσει πάλι σφάλμα.

Σωστή γραφή:

```swift
struct ContentView: View {
    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Τότε το `ContentView` είναι ένα πραγματικό SwiftUI view που μπορεί να εμφανιστεί.

## Το body είναι η είσοδος εμφάνισης του view

Στο SwiftUI, το `body` είναι η είσοδος για το περιεχόμενο του view.

```swift
var body: some View {
    Text("Γεια σου, κόσμε!")
}
```

Εδώ μπορούμε να το χωρίσουμε σε τρία μέρη:

**1. var body**

```swift
var body
```

Σημαίνει ότι ορίζουμε μία μεταβλητή με όνομα `body`.

**2. some View**

```swift
: some View
```

Σημαίνει ότι αυτό το `body` θα επιστρέψει ένα view.

**3. { ... }**

```swift
{
    Text("Γεια σου, κόσμε!")
}
```

Αντιπροσωπεύει το περιεχόμενο view που εμφανίζεται. Σε αυτόν τον κώδικα εμφανίζεται ένα `Text` view.

Με άλλα λόγια, ό,τι γράφουμε μέσα στο `body`, αυτό εμφανίζεται στη διεπαφή.

Για παράδειγμα:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Όνομα:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Αυτός ο κώδικας σημαίνει: **στη διεπαφή εμφανίζεται περιεχόμενο σε κάθετη διάταξη, με δύο κείμενα μέσα.**

### Το όνομα body δεν μπορεί να αλλάξει αυθαίρετα

Πρέπει να προσέξουμε ότι το όνομα `body` δεν μπορεί να αλλάξει αυθαίρετα.

Αν το γράψουμε έτσι:

```swift
struct ContentView: View {
    var content: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Αυτό το `content`, αν και είναι επίσης ιδιότητα view, δεν μπορεί να αντικαταστήσει το `body`.

Επειδή το όνομα που απαιτεί το πρωτόκολλο `View` είναι το `body`.

## Τι είναι το some View;

Στο SwiftUI, το `some View` σημαίνει ότι επιστρέφεται ένα συγκεκριμένο view, απλώς δεν χρειάζεται να γράψουμε τον πλήρη τύπο αυτού του view.

```swift
var body: some View
```

Δηλαδή, το `some View` δεν σημαίνει ότι δεν υπάρχει τύπος. Ο πραγματικός τύπος εξακολουθεί να υπάρχει και ο compiler τον γνωρίζει, αλλά μπορεί να είναι πολύ σύνθετος, οπότε η Swift μας επιτρέπει να τον κρύβουμε με `some View`.

### Τι είναι το some;

Στη Swift, το `some` είναι λέξη-κλειδί για δήλωση αδιαφανούς τύπου (opaque type).

Αδιαφανής τύπος σημαίνει: **η επιστρεφόμενη τιμή έχει έναν συγκεκριμένο τύπο, ο compiler γνωρίζει ποιος είναι αυτός ο συγκεκριμένος τύπος, αλλά εμείς δεν τον γράφουμε απευθείας.**

Για παράδειγμα:

```swift
func makeView() -> some View {
    Text("Γεια")
}
```

Αυτό σημαίνει ότι το `makeView` θα επιστρέψει έναν συγκεκριμένο τύπο που συμμορφώνεται με το πρωτόκολλο `View`.

### Γιατί χρειαζόμαστε το some;

Όταν μάθαμε τις μεταβλητές, καταλάβαμε ότι: **οι τιμές στη Swift χρειάζονται είτε ρητή επισήμανση τύπου είτε αυτόματη εξαγωγή τύπου από τον compiler.**

Για παράδειγμα:

```swift
let a: Int = 10
```

Η σταθερά `a` εδώ είναι τύπου `Int`.

Τα SwiftUI views δεν αποτελούν εξαίρεση. Όταν χρησιμοποιούμε το `body` για να εμφανίσουμε SwiftUI view, πρέπει το `body` να επιστρέφει τον αντίστοιχο SwiftUI τύπο.

Για παράδειγμα, αν χρησιμοποιούμε το `body` για να εμφανίσουμε ένα text view `Text`, πρέπει το `body` να επιστρέφει τον αντίστοιχο τύπο `Text`.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Σε αυτό το παράδειγμα, μέσα στο `body` εμφανίζεται ένα `Text` view, και ο επιστρεφόμενος τύπος είναι επίσης `Text`.

Μόνο όταν ο εσωτερικός τύπος και ο δηλωμένος τύπος συμφωνούν, ικανοποιείται η απαίτηση του compiler για συνέπεια τύπων.

**Πρόβλημα ασυμφωνίας τύπων**

Αν ορίσουμε τον τύπο του `body` ως `Color`, αλλά εμφανίζουμε `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

ο τύπος του `body` και ο τύπος του εσωτερικού κώδικα δεν συμφωνούν, οπότε θα προκληθεί σφάλμα ασυμφωνίας τύπων.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Τότε πρέπει να τροποποιήσουμε χειροκίνητα τον επιστρεφόμενο τύπο του `body`.

**Σύνθετοι τύποι views**

Στην πραγματική ανάπτυξη, η διεπαφή συνήθως δεν έχει μόνο ένα `Text`.

Αν χρειάζεται να εμφανίσουμε ένα πιο σύνθετο `VStack`, πρέπει να επισημάνουμε χειροκίνητα έναν σύνθετο επιστρεφόμενο τύπο.

Για παράδειγμα:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Γεια σου, κόσμε!")
    }
}
```

Αυτός ο κώδικας σημαίνει ότι επιστρέφεται ένα `VStack`, και μέσα στο `VStack` υπάρχουν views τύπου `Image` και `Text`.

Ο επιστρεφόμενος τύπος του `body` είναι:

```swift
VStack<TupleView<(Image,Text)>>
```

Μπορούμε να δούμε ότι αυτός ο επιστρεφόμενος τύπος είναι πολύ σύνθετος, και εμφανίζεται επίσης ένα `TupleView` που δεν είχαμε δει πριν.

Το `TupleView` εδώ μπορεί να κατανοηθεί ως: **αναπαράσταση πολλών child views τυλιγμένων σε ένα view.**

**Ακόμη πιο σύνθετοι τύποι views**

Αν προσθέσουμε modifiers στο view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Γεια σου, κόσμε!")
    }
    .padding()
}
```

τότε ο επιστρεφόμενος τύπος αυτού του view γίνεται πολύ σύνθετος και δεν μπορεί να περιγραφεί συγκεκριμένα εδώ.

Ο υπάρχων επιστρεφόμενος τύπος `VStack<TupleView<(Image,Text)>>` δεν μπορεί πλέον να περιγράψει τους modifiers, οπότε θα προκύψει σφάλμα.

**Το some View απλοποιεί τον επιστρεφόμενο τύπο**

Για αυτήν την περίπτωση, το SwiftUI προσφέρει μία απλή λύση: τη χρήση του `some View` για απλούστερη γραφή.

Όταν αλλάζουμε το `body` στον τύπο `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Γεια σου, κόσμε!")
    }
    .padding()
}
```

δεν χρειάζεται κάθε φορά που αλλάζουμε τον κώδικα του view να γράφουμε ξανά τον πλήρη επιστρεφόμενο τύπο.

Αυτό συμβαίνει επειδή το `some View` σημαίνει επιστροφή ενός συγκεκριμένου view που συμμορφώνεται με το πρωτόκολλο `View`.

Με άλλα λόγια, SwiftUI views όπως `VStack`, `Image` και άλλα είναι όλα views που συμμορφώνονται με το πρωτόκολλο `View`. Μετά την προσθήκη modifiers, ο επιστρεφόμενος τύπος view εξακολουθεί να συμμορφώνεται με το πρωτόκολλο `View`.

Γι' αυτό όλα μπορούν να επιστραφούν ως `some View`.

### Το some View δεν μπορεί να επιστρέφει οποιοδήποτε view αυθαίρετα

Το `some View`, αν και μπορεί να κρύβει σύνθετους τύπους, δεν είναι «χωρίς τύπο».

Ο βασικός του κανόνας είναι: **ο compiler πρέπει να μπορεί να καθορίσει έναν συγκεκριμένο επιστρεφόμενο τύπο**.

Για παράδειγμα:

```swift
var title: some View {
    Text("Γεια")
}
```

Εδώ επιστρέφεται ένα `Text` view.

Αλλά αν προσπαθήσουμε να επιστρέψουμε δύο views, θα προκύψει σφάλμα:

```swift
var title: some View {
    Text("Γεια")
    Image(systemName: "star")
}
```

Επειδή το `some View` τελικά χρειάζεται να επιστρέψει μία δομή view, ενώ εδώ προσπαθούμε να επιστρέψουμε δύο ανεξάρτητα views.

### Λύση

Συνήθως υπάρχουν δύο λύσεις: container και `@ViewBuilder`.

**1. Τύλιγμα με container**

```swift
var title: some View {
    VStack {
        Text("Γεια")
        Image(systemName: "star")
    }
}
```

Σε αυτόν τον κώδικα, το `title` επιστρέφει ένα `VStack`, ενώ τα `Text` και `Image` είναι child views μέσα στο `VStack`.

Η δομή view που δέχεται το `some View` είναι ένα `VStack<...>`, οπότε ικανοποιεί την απαίτηση του `some View` για επιστροφή μίας δομής view. 

Αυτός είναι και ο λόγος που από την αρχή της εκμάθησης SwiftUI προτείνουμε να χρησιμοποιείται ένα `VStack` container στο εξωτερικό επίπεδο για να τυλίγει τον κώδικα view.

**2. Χρήση @ViewBuilder**

Μπορούμε επίσης να προσθέσουμε τον modifier `@ViewBuilder` πριν από το `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Γεια")
    Image(systemName: "star")
}
```

Το `@ViewBuilder` μπορεί να συνδυάσει πολλά views σε ένα αποτέλεσμα επιστροφής.

Στην ουσία του, εξακολουθεί να συγχωνεύει πολλά views σε ένα view, ώστε να ικανοποιηθεί η απαίτηση του `some View` για επιστροφή μίας δομής view.

### Γιατί το body μπορεί να γράφει απευθείας πολλά views;

Αν γράψουμε πολλά views μέσα στο `var body`, για παράδειγμα:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Γεια σου, κόσμε!")
}
```

σε ορισμένες περιπτώσεις, αυτό το `body` δεν θα εμφανίσει σφάλμα.

Ο λόγος είναι ότι το `body` στο πρωτόκολλο `View` υποστηρίζει από προεπιλογή το `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Στον πηγαίο κώδικα του πρωτοκόλλου `View`, μπορούμε να δούμε ότι η μεταβλητή `body` έχει ήδη διακοσμηθεί με `@ViewBuilder`.

Επομένως, το `body` έχει ένα επιπλέον ειδικό επίπεδο επεξεργασίας σε σχέση με ένα συνηθισμένο `some View`, και έτσι το SwiftUI μας βοηθά αυτόματα να συνδυάζουμε πολλά views σε ένα view.

**Προτείνεται η χρήση containers**

Για να είναι πιο εύκολο να το κατανοήσουν οι αρχάριοι, προτείνεται πρώτα η χρήση containers όπως `VStack`, `HStack`, `ZStack`, `Group` για την οργάνωση πολλών views.

Για παράδειγμα:

```swift
var body: some View {
    VStack {
        Text("Γεια")
        Image(systemName: "star")
    }
}
```

Έτσι ο κώδικας είναι πιο κατανοητός: **το εξωτερικό επίπεδο είναι ένα `VStack`, και μέσα του υπάρχουν δύο child views.**

## Διαχωρισμός views

Αν η διεπαφή είναι σχετικά απλή, μπορούμε να γράψουμε όλο τον κώδικα μέσα στο `body`.

Για παράδειγμα:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Καλώς ήρθες στο Qinote")
                Text("Καλημέρα")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Πάτησέ με") {
                print("Πάτησέ με ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Το στυλ εμφάνισης αυτού του view:

![view](../../Resource/023_view1.png)

Αυτός ο κώδικας μπορεί να λειτουργήσει κανονικά, αλλά αν ο κώδικας του view γίνει πολύ σύνθετος, ο κώδικας μέσα στο `body` θα μεγαλώνει συνεχώς, και η ανάγνωση και η τροποποίησή του θα γίνονται όλο και πιο δύσκολες.

Τότε μπορούμε να διαχωρίσουμε διαφορετικές περιοχές σε ανεξάρτητες ιδιότητες view.

### Διαχωρισμός του επάνω view

Για παράδειγμα, διαχωρίζουμε την επάνω περιοχή:

```swift
var topHome: some View {
    HStack {
        Text("Αρχική")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Εδώ το `topHome` είναι μία μεταβλητή που επιστρέφει ένα view.

Επειδή επιστρέφει view, ο τύπος μπορεί να γραφτεί ως:

```swift
some View
```

Αυτό στην πραγματικότητα είναι ίδια χρήση με το `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Και τα δύο χρησιμοποιούν μεταβλητές για να εμφανίζουν views, με επιστρεφόμενο τύπο `some View`.

### Διαχωρισμός άλλων views

Στη συνέχεια, διαχωρίζουμε και άλλα μέρη:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Καλώς ήρθες στο Qinote")
        Text("Καλημέρα")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Πάτησέ με") {
        print("Πάτησέ με")
    }
    .buttonStyle(.borderedProminent)
}
```

Μετά τον διαχωρισμό, μπορούμε να βάλουμε τις μεταβλητές view μέσα στο `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Αρχική")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Καλώς ήρθες στο Qinote")
            Text("Καλημέρα")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Πάτησέ με") {
            print("Πάτησέ με")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Τώρα το `body` είναι υπεύθυνο μόνο για την περιγραφή της δομής της σελίδας:

```swift
topBar
welcomeText
colorList
clickButton
```

Η συγκεκριμένη υλοποίηση κάθε μέρους τοποθετείται στις αντίστοιχες ιδιότητες από κάτω.

Αυτός ο τρόπος διαχωρισμού views κάνει τη δομή της σελίδας πιο καθαρή. Κάθε περιοχή view έχει το δικό της όνομα και η ανάγνωση γίνεται πιο άμεση.

Όταν τροποποιούμε ένα συγκεκριμένο μέρος του κώδικα, μπορούμε να βρούμε απευθείας την αντίστοιχη περιοχή view, αντί να ψάχνουμε μέσα σε πολύ σύνθετο κώδικα.

### Το some View επιστρέφει ένα μόνο view

Σε αυτόν τον διαχωρισμό view, αν προσπαθήσουμε να επιστρέψουμε πολλά views:

```swift
var topBar: some View {
    Text("Αρχική")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

θα προκύψει σφάλμα, επειδή το `some View` μπορεί να επιστρέψει μόνο μία δομή view.

Σε αντίθεση με το `body`, οι συνηθισμένες computed properties δεν έχουν από προεπιλογή `@ViewBuilder`.

Επομένως, αν χρειάζεται να επιστρέψουμε πολλά views, μπορούμε να χρησιμοποιήσουμε ένα container όπως `VStack`, `HStack` ή `Group` για να συνδυάσουμε πολλά views σε ένα.

```swift
var topBar: some View {
    VStack {
        Text("Αρχική")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ή να προσθέσουμε `@ViewBuilder` για να συνδυάσουμε views:

```swift
@ViewBuilder
var topBar: some View {
    Text("Αρχική")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Έτσι μπορούμε να επιστρέψουμε πολλά views.

### Το if επιστρέφει πολλά views

Για παράδειγμα:

```swift
var topHome: some View {
    if step == "Αρχική" {
        HStack {
            Text("Αρχική")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Κενό")
    }
}
```

Σε αυτόν τον κώδικα, το `topHome` επιστρέφει, ανάλογα με το περιεχόμενο του `step`, δύο διαφορετικούς τύπους views: `HStack` ή `Text`.

Επειδή το `some View` χρειάζεται έναν συγκεκριμένο επιστρεφόμενο τύπο, οι δύο κλάδοι του `if` σε μία συνηθισμένη computed property δεν μπορούν να επιστρέφουν απευθείας διαφορετικούς τύπους views, οπότε προκύπτει σφάλμα.

**Η λύση παραμένει η χρήση container για τύλιγμα ή η χρήση του `@ViewBuilder`.**

### Γιατί τα διαχωρισμένα views δεν χρησιμοποιούν παρενθέσεις

Όταν χρησιμοποιούμε μέσα στο `body` τις ιδιότητες view που διαχωρίσαμε, γράφουμε απευθείας:

```swift
topBar
welcomeText
colorList
clickButton
```

και όχι:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Ο λόγος είναι ότι τα `topBar`, `welcomeText`, `colorList` και `clickButton` είναι μεταβλητές. Αυτές οι μεταβλητές είναι στην πραγματικότητα computed properties, όχι μέθοδοι.

**Οι ιδιότητες δεν χρειάζονται παρενθέσεις.**

Αν το γράψουμε ως μέθοδο, μπορούμε επίσης να πετύχουμε παρόμοιο αποτέλεσμα:

```swift
func topBar() -> some View {
    HStack {
        Text("Αρχική")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Αυτός ο κώδικας μπορεί επίσης να πετύχει παρόμοιο αποτέλεσμα. Η κλήση αυτής της μεθόδου επιστρέφει ένα view.

Κατά τη χρήση πρέπει να γράφεται ως:

```swift
topBar()
```

Στο SwiftUI, αν απλώς διαχωρίζουμε ένα view που δεν χρειάζεται παραμέτρους, είναι πιο συνηθισμένο να χρησιμοποιούμε computed property.

```swift
var topBar: some View { ... }
```

## Ενσωματωμένα views

Εκτός από το να χωρίζουμε τον κώδικα σε ιδιότητες, μπορούμε επίσης να δημιουργούμε νέες δομές view.

Για παράδειγμα:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Αυτό το `PinkColorView`, όπως και το `ContentView`, είναι ένα ανεξάρτητο SwiftUI view.

Αν χρειάζεται να το εμφανίσουμε μέσα στο `ContentView`, μπορούμε να προσθέσουμε `()` μετά το όνομα του view.

Για παράδειγμα:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Εδώ:

```swift
PinkColorView()
```

σημαίνει ότι δημιουργούμε ένα instance του `PinkColorView`.

Επειδή το `PinkColorView` συμμορφώνεται με το πρωτόκολλο `View`, μπορεί να τοποθετηθεί και να εμφανιστεί μέσα σε άλλα views, όπως τα `Text`, `Image` και `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Αυτό είναι το nesting των views: ένα view μπορεί να εμφανίζεται μέσα σε ένα άλλο view.

## Ιδιότητα view ή δημιουργία νέου view;

Όταν ο κώδικας του view είναι σχετικά απλός, συνήθως δεν χρειάζεται να τον διαχωρίσουμε. Μόνο όταν ο κώδικας γίνει πιο σύνθετος προτείνεται ο διαχωρισμός views.

### Περιπτώσεις χρήσης ιδιοτήτων view

Αν πρόκειται μόνο για ένα μικρό κομμάτι περιεχομένου μέσα στο τρέχον view, μπορούμε να χρησιμοποιήσουμε ιδιότητα view.

Για παράδειγμα:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Αυτά τα περιεχόμενα συνήθως χρησιμοποιούνται μόνο μέσα στο τρέχον view.

### Περιπτώσεις δημιουργίας νέου view

Αν αυτά τα περιεχόμενα είναι σχετικά ανεξάρτητα ή μπορεί να επαναχρησιμοποιηθούν σε πολλές σελίδες στο μέλλον, είναι πιο κατάλληλο να δημιουργηθεί ένα νέο view.

Για παράδειγμα:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Αυτό είναι ένα title view. Αν θέλουμε να χρησιμοποιήσουμε αυτό το view ως γενικό component και να το επαναχρησιμοποιήσουμε σε άλλα views.

Μπορούμε να δημιουργήσουμε ένα νέο view:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Στη συνέχεια, το χρησιμοποιούμε σε άλλα σημεία:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Τότε αυτό το view είναι ένα ανεξάρτητο επαναχρησιμοποιήσιμο component.

Μπορεί να συνοψιστεί απλά ως εξής:

- Περιοχή περιεχομένου του τρέχοντος view: μπορεί να χρησιμοποιηθεί `var xxx: some View`
- Ανεξάρτητο επαναχρησιμοποιήσιμο component: μπορεί να δημιουργηθεί νέο `struct XxxView: View`
- Component που χρειάζεται να δέχεται δεδομένα: συνήθως είναι πιο κατάλληλο να δημιουργηθεί νέο view.

## Σύνοψη

Σε αυτό το μάθημα κατανοήσαμε ξανά την πιο βασική αλλά και πιο σημαντική δομή view στο SwiftUI.

Το `ContentView` είναι μία δομή, ορίζεται με `struct` και χρησιμοποιείται για την οργάνωση του κώδικα που σχετίζεται με τη σελίδα.

Το `View` είναι ένα πρωτόκολλο. Αν μία δομή θέλει να γίνει SwiftUI view, πρέπει να συμμορφώνεται με το πρωτόκολλο `View`.

Το `body` είναι το περιεχόμενο που το πρωτόκολλο `View` απαιτεί να παρέχουμε, και καθορίζει τι εμφανίζει αυτό το view.

Το `some View` σημαίνει ότι επιστρέφεται κάποιος συγκεκριμένος τύπος view, χωρίς να χρειάζεται να γράψουμε τον σύνθετο πλήρη τύπο του.

Όταν ο κώδικας view μεγαλώνει, μπορούμε να χρησιμοποιήσουμε `var xxx: some View` για να χωρίσουμε τον κώδικα view σε πολλές μικρές περιοχές.

Όταν κάποιο κομμάτι περιεχομένου είναι σχετικά ανεξάρτητο ή χρειάζεται επαναχρησιμοποίηση, μπορούμε να δημιουργήσουμε νέα δομή view και να την εμφανίσουμε σε άλλα views μέσω `XxxView()`.

Με απλά λόγια, η διεπαφή του SwiftUI αποτελείται από views που συνδυάζονται μεταξύ τους. Μία σελίδα μπορεί να περιέχει πολλά μικρά views, και ένα μικρό view μπορεί επίσης να περιέχει άλλα views.
