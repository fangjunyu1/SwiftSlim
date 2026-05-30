# Προσαρμοσμένη προβολή

Σε αυτό το μάθημα, θα μάθουμε έναν πολύ σημαντικό τρόπο γραφής στο SwiftUI: **προσαρμοσμένο View**.

Ένα προσαρμοσμένο View μπορεί να ενθυλακώσει ένα επαναλαμβανόμενο τμήμα κώδικα View και να το μετατρέψει σε ένα View που μπορεί να επαναχρησιμοποιείται ξανά και ξανά.

Στην πραγματική ανάπτυξη App, συναντάμε συχνά αυτή την κατάσταση: η δομή πολλών διεπαφών είναι ίδια, αλλά το περιεχόμενο που εμφανίζεται είναι διαφορετικό.

Για παράδειγμα, στη λίστα αναρτήσεων ενός ιστότοπου φόρουμ, κάθε ανάρτηση μπορεί να έχει πληροφορίες όπως τίτλο, εικόνα και αριθμό likes.

![Reddit](../../../Resource/028_view1.png)

Στη λίστα προϊόντων ενός ιστότοπου αγορών, κάθε προϊόν μπορεί να έχει πληροφορίες όπως εικόνα, όνομα και τιμή.

![Amazon](../../../Resource/028_view2.png)

Η δομή αυτών των περιεχομένων είναι παρόμοια· η διαφορά βρίσκεται μόνο στα δεδομένα που εμφανίζονται.

Αν γράψουμε χειροκίνητα τον κώδικα για κάθε στοιχείο, ο κώδικας θα γίνει πολύ μεγάλος και δεν θα είναι βολικός για μελλοντικές αλλαγές.

Επομένως, μπορούμε να ενθυλακώσουμε την κοινή δομή σε ένα προσαρμοσμένο View και να περάσουμε το διαφορετικό περιεχόμενο ως παραμέτρους.

Με αυτόν τον τρόπο, το ίδιο View μπορεί να εμφανίζει διαφορετικό περιεχόμενο.

## Σενάριο απαίτησης

Για παράδειγμα, τώρα θέλουμε να δημιουργήσουμε μια λίστα ρυθμίσεων.

Αποτέλεσμα εμφάνισης:

![view](../../../Resource/028_view.png)

Σε αυτή τη λίστα ρυθμίσεων υπάρχουν τρία διαφορετικά στοιχεία ρυθμίσεων: `Ρυθμίσεις`, `Φάκελος`, `Μουσική`.

Παρόλο που τα εικονίδια, τα χρώματα και οι τίτλοι τους είναι διαφορετικά, η συνολική δομή είναι ίδια:

- Εικονίδιο στα αριστερά
- Χρώμα φόντου του εικονιδίου
- Τίτλος στο κέντρο
- Βέλος στα δεξιά

Αν δεν χρησιμοποιήσουμε προσαρμοσμένο View, θα μπορούσαμε να γράψουμε ως εξής:

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

                Text("Ρυθμίσεις")
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

                Text("Φάκελος")
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

                Text("Μουσική")
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

Αυτός ο κώδικας μπορεί να εμφανιστεί κανονικά, αλλά το πρόβλημα είναι επίσης πολύ προφανές: ο κώδικας των τριών στοιχείων ρυθμίσεων είναι σχεδόν εντελώς ίδιος.

Διαφέρουν μόνο το εικονίδιο, το χρώμα και ο τίτλος:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Ρυθμίσεις")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Φάκελος")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Μουσική")
```

Δηλαδή, η δομή κάθε στοιχείου ρυθμίσεων είναι σταθερή, και διαφέρουν μόνο το εικονίδιο, το χρώμα και ο τίτλος.

Αυτή η κατάσταση είναι πολύ κατάλληλη για χρήση προσαρμοσμένου View.

### Σκιά shadow

Εδώ χρησιμοποιείται ένας νέος modifier, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

Το `.shadow(radius:)` μπορεί να προσθέσει σκιά σε ένα View.

Το `radius` δηλώνει την ακτίνα θόλωσης της σκιάς. Όσο μεγαλύτερη είναι η τιμή, τόσο μεγαλύτερη συνήθως είναι η περιοχή εξάπλωσης της σκιάς και τόσο πιο απαλή φαίνεται.

Εδώ έχει οριστεί σε `1`, που σημαίνει ότι προστίθεται μόνο ένα πολύ ελαφρύ εφέ σκιάς.

## Ενθυλάκωση του View στοιχείου ρυθμίσεων

Στη συνέχεια, ενθυλακώνουμε κάθε στοιχείο ρυθμίσεων σε ένα νέο View.

Μπορούμε να δημιουργήσουμε ένα `SettingItemView`:

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

Σε αυτό το View, ορίζουμε τρεις properties:

```swift
let icon: String
let color: Color
let title: String
```

Ανάμεσά τους:

- Το `icon` δηλώνει το όνομα του εικονιδίου
- Το `color` δηλώνει το χρώμα φόντου του εικονιδίου
- Το `title` δηλώνει τον τίτλο του στοιχείου ρυθμίσεων

Επειδή αυτά τα τρία περιεχόμενα είναι διαφορετικά σε διαφορετικά στοιχεία ρυθμίσεων, τα κάνουμε παραμέτρους που μπορούν να περαστούν από έξω.

## Χρήση προσαρμοσμένου View

Αφού έχουμε το `SettingItemView`, δεν χρειάζεται πλέον να γράφουμε επανειλημμένα ένα μεγάλο τμήμα κώδικα `HStack`.

Τώρα μπορούμε να το χρησιμοποιήσουμε έτσι:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")
```

Αυτή η γραμμή κώδικα σημαίνει ότι δημιουργούμε ένα View στοιχείου ρυθμίσεων και περνάμε τρεις παραμέτρους:

```swift
icon: "gear"
color: Color.blue
title: "Ρυθμίσεις"
```

Μετά τη μεταβίβαση, οι properties μέσα στο `SettingItemView` θα λάβουν τις αντίστοιχες τιμές:

- η τιμή του `icon` είναι `gear`
- η τιμή του `color` είναι `Color.blue`
- η τιμή του `title` είναι `"Ρυθμίσεις"`

Επομένως, μέσα στο View, το `Image(systemName: icon)` θα εμφανίσει το εικονίδιο γραναζιού, το `.background(color)` θα χρησιμοποιήσει μπλε φόντο και το `Text(title)` θα εμφανίσει `Ρυθμίσεις`.

Πλήρης κώδικας:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Φάκελος")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Μουσική")
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

Αποτέλεσμα εμφάνισης:

![view](../../../Resource/028_view.png)

Μπορούμε να δούμε ότι μετά την ενθυλάκωση, το αποτέλεσμα εμφάνισης είναι ίδιο με πριν, αλλά ο κώδικας έγινε πιο καθαρός.

Παλαιότερα, για κάθε στοιχείο ρυθμίσεων έπρεπε να γράφεται ολόκληρο τμήμα `HStack`, ενώ τώρα αρκεί μία μόνο γραμμή κώδικα:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")
```

Αυτός είναι ο ρόλος ενός προσαρμοσμένου View: **ενθυλακώνει μια επαναλαμβανόμενη δομή View και περνά μόνο το διαφορετικό περιεχόμενο ως παραμέτρους.**

## Γιατί μπορούν να περαστούν παράμετροι

Στη συνέχεια, ας κατανοήσουμε απλά γιατί ένα προσαρμοσμένο View μπορεί να δέχεται παραμέτρους.

Στο SwiftUI, ένα View είναι ουσιαστικά μια δομή.

Για παράδειγμα:

```swift
struct ContentView: View {
    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Εδώ, το `ContentView` είναι μια δομή.

Όταν γράφουμε:

```swift
ContentView()
```

στην πραγματικότητα δημιουργούμε ένα View `ContentView`.

Τα τελικά `()` σημαίνουν κλήση της μεθόδου αρχικοποίησής του· μπορεί επίσης να γίνει αντιληπτό ως δημιουργία αυτού του View.

Επειδή αυτό το `ContentView` δεν έχει properties που πρέπει να περαστούν από έξω, μπορούμε να γράψουμε απευθείας:

```swift
ContentView()
```

Αν όμως υπάρχει property μέσα στο View που δεν έχει τιμή, πρέπει να περάσουμε την αντίστοιχη τιμή κατά τη δημιουργία του View.

Για παράδειγμα:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("όνομα: \(name)")
    }
}
```

Εδώ, το `name` είναι property και δεν έχει προεπιλεγμένη τιμή.

Επομένως, κατά τη δημιουργία του `ContentView`, πρέπει να δώσουμε στο `name` μια συγκεκριμένη τιμή:

```swift
ContentView(name: "Fang Junyu")
```

Έτσι, το View μπορεί να χρησιμοποιήσει αυτή την τιμή εσωτερικά:

```swift
Text("όνομα: \(name)")
```

Αυτός είναι επίσης ο λόγος που πρέπει να περνάμε παραμέτρους όταν δημιουργούμε το `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")
```

Επειδή το `SettingItemView` έχει τρεις properties χωρίς προεπιλεγμένες τιμές:

```swift
let icon: String
let color: Color
let title: String
```

Επομένως, κατά τη δημιουργία αυτού του View, πρέπει να τις περάσουμε μέσα. Οι παράμετροι που περνιούνται θα χρησιμοποιηθούν από το Swift για να δοθούν τιμές στις properties μέσα στο View.

## Μέθοδος αρχικοποίησης

Στη συνέχεια, ας κατανοήσουμε λίγο βαθύτερα τη μέθοδο αρχικοποίησης.

### Προεπιλεγμένη μέθοδος αρχικοποίησης

Όταν ορίζουμε ένα συνηθισμένο View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Σε αυτόν τον κώδικα, δεν γράψαμε χειροκίνητα μέθοδο αρχικοποίησης.

Αλλά όταν χρησιμοποιούμε αυτό το View, μπορούμε να γράψουμε:

```swift
ContentView()
```

Εδώ, το `()` στην πραγματικότητα σημαίνει δημιουργία του `ContentView`· μπορεί επίσης να γίνει αντιληπτό ως κλήση της μεθόδου αρχικοποίησής του.

### Γιατί μπορεί να κληθεί παρόλο που δεν φαίνεται μέθοδος αρχικοποίησης;

Επειδή ο Swift compiler δημιουργεί αυτόματα μια μέθοδο αρχικοποίησης για εμάς.

Είναι σημαντικό να προσέξουμε ότι: **αυτή η μέθοδος αρχικοποίησης δημιουργείται αυτόματα και συνήθως δεν τη βλέπουμε άμεσα στον κώδικα.**

Δηλαδή, παρόλο που δεν γράψαμε χειροκίνητα μέσα στο `struct` το εξής:

```swift
init() {

}
```

ο Swift compiler θα δημιουργήσει στο παρασκήνιο μια μέθοδο αρχικοποίησης περίπου σαν αυτή:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Γεια σου, κόσμε!")
    }
}
```

Γι’ αυτό μπορούμε να γράψουμε απευθείας:

```swift
ContentView()
```

Επομένως, στον πραγματικό κώδικα, συνήθως δεν χρειάζεται να γράφουμε χειροκίνητα τη μέθοδο αρχικοποίησης.

Αρκεί να κατανοήσουμε ένα σημείο: **όταν δημιουργείται ένα SwiftUI View, καλείται η μέθοδος αρχικοποίησης αυτού του View. Ακόμη κι αν δεν γράψουμε χειροκίνητα τη μέθοδο αρχικοποίησης, το Swift μπορεί να τη δημιουργήσει αυτόματα.**

### Μέθοδος αρχικοποίησης με παραμέτρους

Αν ένα View έχει property χωρίς προεπιλεγμένη τιμή, για παράδειγμα:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("όνομα: \(name)")
    }
}
```

ο Swift compiler θα δημιουργήσει αυτόματα μια μέθοδο αρχικοποίησης με παράμετρο με βάση την property.

Μπορούμε να την κατανοήσουμε απλά έτσι:

```swift
init(name: String) {
    self.name = name
}
```

Εδώ:

```swift
init(name: String)
```

σημαίνει ότι κατά τη δημιουργία του `ContentView`, πρέπει να περάσουμε μια παράμετρο `name` τύπου `String`.

Όταν γράφουμε:

```swift
ContentView(name: "Fang Junyu")
```

αυτό σημαίνει: περνάμε το `"Fang Junyu"` ως παράμετρο στη μέθοδο αρχικοποίησης.

Στη συνέχεια, μέσα στη μέθοδο αρχικοποίησης θα εκτελεστεί:

```swift
self.name = name
```

Αυτή η γραμμή κώδικα σημαίνει: αντιστοιχίζουμε το `name` που πέρασε από έξω στην ίδια property `name` του τρέχοντος View.

Μπορούμε να το κατανοήσουμε απλά έτσι:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("όνομα: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Έτσι, το View μπορεί να χρησιμοποιήσει εσωτερικά την τιμή που περάστηκε.

Αυτή είναι η ροή αρχικοποίησης ενός View με παραμέτρους: **όταν μια property μέσα στο View δεν έχει προεπιλεγμένη τιμή, πρέπει να περαστεί η αντίστοιχη παράμετρος κατά τη δημιουργία του View, ώστε η μέθοδος αρχικοποίησης να ολοκληρώσει την ανάθεση της τιμής στην property.**

## Περίπτωση όπου μια property έχει προεπιλεγμένη τιμή

Αν μια property έχει ήδη προεπιλεγμένη τιμή, τότε κατά τη δημιουργία του View μπορούμε να μην περάσουμε την παράμετρο.

Για παράδειγμα:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("όνομα: \(name)")
    }
}
```

Εδώ, το `name` έχει ήδη μια προεπιλεγμένη τιμή:

```swift
"Fang Junyu"
```

Επομένως, κατά τη δημιουργία του `ContentView`, μπορούμε να γράψουμε απευθείας:

```swift
ContentView()
```

Σε αυτή την περίπτωση, το `name` θα χρησιμοποιήσει την προεπιλεγμένη τιμή και η διεπαφή θα εμφανίσει:

```swift
όνομα: Fang Junyu
```

Φυσικά, κατά τη δημιουργία του View μπορούμε επίσης να περάσουμε μια νέα τιμή:

```swift
ContentView(name: "Sam")
```

Σε αυτή την περίπτωση, το View θα χρησιμοποιήσει το `"Sam"` που πέρασε από έξω, αντί για την προεπιλεγμένη τιμή, και η διεπαφή θα εμφανίσει:

```swift
όνομα: Sam
```

Για να είναι πιο εύκολη η κατανόηση, μπορούμε να θεωρήσουμε τη μέθοδο αρχικοποίησης που δημιουργείται αυτόματα από τον Swift compiler περίπου έτσι:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Εδώ, το `name: String = "Fang Junyu"` σημαίνει: αν δεν περαστεί `name` κατά τη δημιουργία του View, χρησιμοποιείται η προεπιλεγμένη τιμή `"Fang Junyu"`· αν περαστεί νέο `name` κατά τη δημιουργία του View, χρησιμοποιείται η τιμή που περάστηκε.

Δηλαδή: **αν δεν περαστεί παράμετρος από έξω, χρησιμοποιείται η προεπιλεγμένη τιμή της property· αν περαστεί παράμετρος από έξω, χρησιμοποιείται η τιμή που περάστηκε.**

## Επιστροφή στο SettingItemView

Τώρα ας δούμε ξανά το SettingItemView:

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

Η δομή αυτού του View είναι σταθερή.

Τα σταθερά μέρη περιλαμβάνουν:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Τα διαφορετικά μέρη περιλαμβάνουν:

```swift
icon
color
title
```

Επομένως, κάνουμε το διαφορετικό περιεχόμενο properties και το περνάμε ως παραμέτρους κατά τη δημιουργία του View.

Όταν δημιουργούμε διαφορετικά στοιχεία ρυθμίσεων, αρκεί να περάσουμε διαφορετικές παραμέτρους:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")
SettingItemView(icon: "folder", color: Color.brown, title: "Φάκελος")
SettingItemView(icon: "music.note", color: Color.purple, title: "Μουσική")
```

Έτσι, το ίδιο `SettingItemView` μπορεί να εμφανίσει τρία διαφορετικά στοιχεία ρυθμίσεων.

Αυτός είναι ο πιο συνηθισμένος τρόπος χρήσης ενός προσαρμοσμένου View.

## Σύνοψη

Σε αυτό το μάθημα, μάθαμε το προσαρμοσμένο View.

Ο βασικός ρόλος ενός προσαρμοσμένου View είναι: **να ενθυλακώνει επαναλαμβανόμενο κώδικα View, ώστε να μπορεί να επαναχρησιμοποιείται.**

Σε αυτό το παράδειγμα, η δομή των τριών στοιχείων ρυθμίσεων είναι ίδια, και μόνο το εικονίδιο, το χρώμα και ο τίτλος είναι διαφορετικά.

Γι’ αυτό δημιουργήσαμε το `SettingItemView`:

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

Στη συνέχεια, όταν χρησιμοποιούμε αυτό το View, περνάμε διαφορετικές παραμέτρους:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ρυθμίσεις")
```

Αυτές οι παράμετροι μπαίνουν μέσα στο `SettingItemView`.

Με αυτή τη μέθοδο, μπορούμε να χρησιμοποιήσουμε λιγότερο κώδικα για να δημιουργήσουμε Views με ίδια δομή αλλά διαφορετικό περιεχόμενο.

Αυτός είναι επίσης ένας πολύ συνηθισμένος τρόπος γραφής στην ανάπτυξη SwiftUI.
