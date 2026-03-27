# Κουμπαράς

Σε αυτό το μάθημα θα αναπτύξουμε ένα απλό project «κουμπαρά». Η λειτουργία του είναι απλή, αλλά περιλαμβάνει πλήρη λογική αλληλεπίδρασης, γι’ αυτό και είναι πολύ κατάλληλο για αρχάριους.

Μέσα από αυτό το project θα μάθουμε το `TextField` (πεδίο εισαγωγής), το `border` και θα κατανοήσουμε καλύτερα το data binding (`$`).

Ο τελικός στόχος είναι να υλοποιήσουμε έναν «κουμπαρά» όπου ο χρήστης θα μπορεί να εισάγει ένα ποσό, να πατά ένα button για αποθήκευση και να αυξάνει το συνολικό ποσό.

Τελικό αποτέλεσμα:

![Piggy Bank](../../RESOURCE/014_view.png)

## Εμφάνιση του συνολικού ποσού

Αρχικά, πρέπει να εμφανίσουμε στη view το συνολικό ποσό του κουμπαρά.

Μέσα στο `ContentView`, δηλώνουμε μια μεταβλητή για να αποθηκεύει το συνολικό ποσό:

```swift
@State private var amount = 0
```

Στη συνέχεια, χρησιμοποιούμε `Text` για να εμφανίσουμε αυτό το ποσό:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Εδώ χρησιμοποιούμε τα `.font` και `.fontWeight` για να ρυθμίσουμε το μέγεθος και το πάχος της γραμματοσειράς.

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

Όταν αλλάζει το `amount`, αλλάζει αυτόματα και το συνολικό ποσό που εμφανίζει το `Text`.

## Εισαγωγή ποσού

Ο «κουμπαράς», εκτός από το να εμφανίζει το συνολικό ποσό, χρειάζεται επίσης να επιτρέπει στον χρήστη να εισάγει το ποσό που θέλει να προσθέσει ή να αφαιρέσει. Για αυτό χρειάζεται το view control `TextField` του SwiftUI.

### TextField

Το `TextField` είναι ένα SwiftUI view control για εισαγωγή περιεχομένου και χρησιμοποιείται συνήθως για μονογραμμική εισαγωγή.

Το `TextField` προσφέρει κυρίως δύο μορφές binding:

**1. Binding σε string (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Αυτό είναι κατάλληλο για ονόματα, τίτλους και γενικά εισαγωγή κειμένου.

**2. Binding σε αριθμητικό τύπο (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Αυτό είναι κατάλληλο για ηλικία, μισθό, ποσά κτλ.

Το `format: .number` σημαίνει ότι το πεδίο εισαγωγής θα αναλύει και θα εμφανίζει το περιεχόμενο με αριθμητική μορφή.

#### Placeholder κειμένου

Η πρώτη παράμετρος του `TextField` είναι το placeholder, το οποίο λειτουργεί ως οδηγία προς τον χρήστη:

```swift
TextField("input your name", text: $text)
```

Όταν το πεδίο είναι κενό, θα εμφανίζεται ένα γκρι βοηθητικό κείμενο.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

Το `TextField` δεν είναι υπεύθυνο για τη μόνιμη αποθήκευση του περιεχομένου. Χρειάζεται μια bound μεταβλητή για να διαχειρίζεται τα δεδομένα.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Το περιεχόμενο που εισάγει ο χρήστης αποθηκεύεται απευθείας στη μεταβλητή `text`, ενώ το `TextField` είναι υπεύθυνο μόνο για τη διεπαφή εισαγωγής.

Το `$` σημαίνει binding:

```swift
$text
```

Αυτό δεν είναι μια συνηθισμένη μεταβλητή, αλλά τιμή τύπου `Binding`.

Ο ρόλος της είναι να δημιουργεί σύνδεση ανάμεσα στη view και στα δεδομένα:

Όταν ο χρήστης πληκτρολογεί μέσα στο `TextField`, το `text` ενημερώνεται αυτόματα· και όταν αλλάζει το `text`, το `TextField` ενημερώνεται επίσης αυτόματα.

Για παράδειγμα:

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

Όταν πληκτρολογούμε μέσα στο `TextField`, το `Text` πιο πάνω εμφανίζει σε πραγματικό χρόνο το ίδιο περιεχόμενο.

![textField](../../RESOURCE/014_textfield1.png)

### Binding αριθμητικού τύπου

Όταν θέλουμε να εισάγουμε αριθμούς, χρειάζεται να κάνουμε binding με μεταβλητή του αντίστοιχου τύπου:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Όταν ο χρήστης εισάγει ποσό, το `TextField` αναλύει την εισαγωγή ως αριθμό και ενημερώνει αυτόματα την τιμή της `number`.

## Προσθήκη του input field

Αφού μάθαμε τη βασική χρήση του `TextField`, ας το εφαρμόσουμε τώρα στο project του κουμπαρά.

Ο «κουμπαράς» χρειάζεται εισαγωγή «ποσού», οπότε θα χρησιμοποιήσουμε binding σε αριθμητικό τύπο και θα προσθέσουμε μια μεταβλητή `number` για να αποθηκεύεται το ποσό που εισάγει ο χρήστης:

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

Τώρα το `TextField` εμφανίζει από προεπιλογή την τιμή της `number` (η οποία αρχικά είναι `0`).

Όταν καθαρίσουμε το πεδίο, θα εμφανιστεί το placeholder `"Amount"`.

Αυτό δείχνει ξανά ότι το `TextField` εμφανίζει την τιμή της bound μεταβλητής και όχι ότι αποθηκεύει μόνο του το περιεχόμενο.

### Ζήτημα μεγέθους του input field

Στη σημερινή μορφή της view, θα παρατηρήσουμε ότι το `TextField` δεν έχει περίγραμμα και εμφανίζει μόνο ένα `0`, ενώ το περιεχόμενο φαίνεται αριστερά στοιχισμένο.

Το αποτέλεσμα είναι το εξής:

![textfield](../../RESOURCE/014_textfield2.png)

Αυτό συμβαίνει επειδή το `TextField` από προεπιλογή καταλαμβάνει όλο το πλάτος της parent view.

Μπορούμε να το επιβεβαιώσουμε προσθέτοντας background color:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Το αποτέλεσμα:

![textfield](../../RESOURCE/014_textfield3.png)

Βλέπουμε έτσι ότι το `TextField` πραγματικά γεμίζει όλο το διαθέσιμο πλάτος της γραμμής.

### Ορισμός σταθερού πλάτους

Αν θέλουμε το πεδίο εισαγωγής να είναι πιο compact, μπορούμε να χρησιμοποιήσουμε `frame` για να περιορίσουμε το πλάτος του:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Το αποτέλεσμα:

![textfield](../../RESOURCE/014_textfield4.png)

### Προσθήκη περιγράμματος και εσωτερικού padding

Επειδή το `TextField` δεν έχει από προεπιλογή border, μπορούμε να του προσθέσουμε μόνοι μας styling:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Τώρα αυτό το input field μοιάζει περισσότερο με ένα «τυπικό» πεδίο εισαγωγής.

![textfield](../../RESOURCE/014_textfield5.png)

## Περίγραμμα

Στο SwiftUI, το `border` χρησιμοποιείται για να προσθέτουμε περίγραμμα σε ένα view.

Βασική χρήση:

```swift
border(Color.black, width: 1)
```

Εδώ το `Color.black` είναι το χρώμα του περιγράμματος, ενώ το `width` είναι το πάχος του.

Στο `TextField`, χρησιμοποιούμε:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Αυτό σημαίνει ότι προσθέτουμε στο input field ένα μαύρο περίγραμμα πάχους 1 pt.

Μπορείς επίσης να δοκιμάσεις άλλα χρώματα όπως `Color.blue`, `Color.green`, ή και πιο παχύ περίγραμμα, π.χ. `width: 2`.

## Κουμπί αποθήκευσης χρημάτων

Τώρα έχουμε μια μεταβλητή `amount` για την εμφάνιση του συνολικού ποσού, ένα `TextField` για την εισαγωγή ποσού και τη bound μεταβλητή `number` του input field.

Ο τρέχων κώδικας είναι ο εξής:

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

### Προσθήκη button

Τώρα χρειάζεται να προσθέσουμε ένα button που θα ενεργοποιεί την αποθήκευση του ποσού.

```swift
Button("Save") {
    
}
```

### Υλοποίηση της λογικής αποταμίευσης

Θέλουμε όταν ο χρήστης εισάγει ένα ποσό και πατάει το button, το ποσό να προστίθεται αυτόματα στο συνολικό ποσό.

```swift
Button("Save") {
    amount += number
}
```

Εδώ χρησιμοποιούμε έναν σύνθετο τελεστή ανάθεσης για να προσθέσουμε το ποσό εισαγωγής `number` στο συνολικό ποσό `amount`.

### Επαναφορά του ποσού εισαγωγής

Τώρα υπάρχει ένα πρόβλημα: κάθε φορά που πατιέται το button, το ποσό μέσα στο input field δεν καθαρίζεται.

Αν ο χρήστης εισάγει `10` και πατήσει αποθήκευση, το input field συνεχίζει να εμφανίζει το `10`, κάτι που επηρεάζει την επόμενη εισαγωγή.

Αυτό συμβαίνει επειδή το `TextField` είναι bound στο `number`, και όταν πατάμε το button τροποποιούμε μόνο το `amount`, όχι το `number`. Άρα το παλιό ποσό παραμένει ορατό.

Χρειάζεται λοιπόν να προσθέσουμε λογική καθαρισμού: αφού προστεθεί το ποσό στο συνολικό, να επαναφέρουμε το ποσό εισαγωγής:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Τώρα, όταν ο χρήστης εισάγει ποσό και πατάει το button, το ποσό προστίθεται στο συνολικό ποσό. Το `number` επανέρχεται στο `0`, ώστε η επόμενη εισαγωγή να ξεκινά καθαρά.

Με αυτόν τον τρόπο ολοκληρώνουμε όλη τη βασική λογική του «κουμπαρά».

## Βελτίωση της view

Αφού ολοκληρωθεί η λειτουργικότητα, μπορούμε να βελτιώσουμε λίγο τη διεπαφή, προσθέτοντας background image και button style.

Προσθήκη button style:

```swift
.buttonStyle(.borderedProminent)
```

Προσθήκη background image:

```swift
.background {
    Image("1")
}
```

Τώρα έχουμε ολοκληρώσει ολόκληρη την ανάπτυξη του «κουμπαρά».

## Πλήρης κώδικας

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

Τελικό αποτέλεσμα:

![Piggy Bank](../../RESOURCE/014_view.png)

Τώρα μπορούμε να δοκιμάσουμε να βάλουμε `100` ή και περισσότερο ποσό, ώστε να ελέγξουμε αν η λογική του «κουμπαρά» λειτουργεί σωστά.

Μπορούμε επίσης να τρέξουμε τον «κουμπαρά» σε προσομοιωτή ή σε πραγματική συσκευή, για να δοκιμάσουμε στην πράξη την εφαρμογή που φτιάξαμε.

### Debug output

Για να επαληθεύσουμε ότι η λογική είναι σωστή, μπορούμε επίσης να προσθέσουμε debugging logic μέσα στο button, ώστε να βλέπουμε αν το ποσό εισαγωγής είναι σωστό:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Κάθε φορά που πατάμε αποθήκευση, μπορούμε να βλέπουμε την αντίστοιχη έξοδο και έτσι να ελέγχουμε αν υπάρχει κάποιο πρόβλημα στη λογική.

```text
---Saving---
amount:11
number:0
```
