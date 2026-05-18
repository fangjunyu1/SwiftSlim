# Εγκυκλοπαίδεια ζώων

Σε αυτό το μάθημα θα συνεχίσουμε την εξάσκηση στις προσαρμοσμένες προβολές και στη μεταφορά δεδομένων.

Θα δημιουργήσουμε μια απλή προβολή εγκυκλοπαίδειας ζώων. Η σελίδα θα εμφανίζει πέντε ζώα. Όταν πατάμε ένα ζώο, θα εμφανίζεται μια προβολή λεπτομερειών, η οποία θα δείχνει την εικόνα, την περιοχή εξάπλωσης, τον βιότοπο και την περιγραφή του ζώου.

Τελικό αποτέλεσμα:

![view](../../../Resource/029_view.png)

Μέσα από αυτό το παράδειγμα, μπορούμε να εξασκηθούμε στη συνεργασία ανάμεσα στη δομή δεδομένων, την εμφάνιση λίστας, την αλληλεπίδραση πατήματος και την αναδυόμενη προβολή Sheet.

## Προετοιμασία εικόνων

Πρώτα, πρέπει να ετοιμάσουμε πέντε εικόνες ζώων:

- Δελφίνι: `dolphin.jpg`
- Καμηλοπάρδαλη: `giraffe.jpg`
- Λιοντάρι: `lion.jpg`
- Πάντα: `panda.jpg`
- Πολική αρκούδα: `polarBear.jpg`

Μπορούμε να χρησιμοποιήσουμε τα παρακάτω αρχεία εικόνων:

[Δελφίνι](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Καμηλοπάρδαλη](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Λιοντάρι](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Πάντα](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Πολική αρκούδα](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Αφού κατεβάσουμε τις εικόνες, τις σύρουμε στον φάκελο πόρων `Assets` του έργου Xcode.

![assets](../../../Resource/029_assets.png)

Πρέπει να σημειώσουμε ότι, όταν χρησιμοποιούμε εικόνες στον κώδικα, συνήθως δεν χρειάζεται να γράψουμε την κατάληξη `.jpg`.

Για παράδειγμα, αν το όνομα του πόρου εικόνας είναι `dolphin`, στον κώδικα γράφουμε:

```swift
Image("dolphin")
```

Αν γράψουμε λάθος το όνομα της εικόνας, η εικόνα δεν θα εμφανιστεί σωστά.

Σημείωση: Τα παραπάνω αρχεία εικόνων προέρχονται από έργα του Wikimedia. Κατά τη χρήση τους, συνιστάται να διατηρούμε τους αρχικούς συνδέσμους και τις πληροφορίες πηγής.

## Δημιουργία της δομής Animal

Σε αυτή τη σελίδα, κάθε ζώο έχει αρκετές πληροφορίες:

- Όνομα ζώου
- Εικόνα ζώου
- Emoji ζώου
- Περιοχή εξάπλωσης
- Βιότοπος
- Περιγραφή ζώου

Αν διασκορπίσουμε αυτές τις πληροφορίες σε πολλές μεταβλητές, ο κώδικας θα γίνει αρκετά ακατάστατος. Επομένως, μπορούμε να δημιουργήσουμε μια δομή `Animal` και να βάλουμε μαζί τις πληροφορίες ενός ζώου.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Σε αυτόν τον κώδικα:

- `id`: το μοναδικό αναγνωριστικό του ζώου.
- `name`: το όνομα του ζώου.
- `imageName`: το όνομα της εικόνας του ζώου.
- `avatarEmoji`: το emoji του ζώου.
- `distributionArea`: η περιοχή εξάπλωσης.
- `habitat`: ο βιότοπος.
- `animalDescription`: η περιγραφή του ζώου.

Ανάμεσά τους:

```swift
let id = UUID()
```

Το `id` χρησιμοποιείται για να αναγνωρίζει κάθε ζώο. Επειδή αργότερα θα χρησιμοποιήσουμε `ForEach` για να εμφανίσουμε τη λίστα ζώων και θα χρησιμοποιήσουμε επίσης `.sheet(item:)` για να εμφανίσουμε τις λεπτομέρειες με βάση το επιλεγμένο ζώο, πρέπει το `Animal` να ακολουθεί το πρωτόκολλο `Identifiable`.

Ο ρόλος του `Identifiable` είναι να λέει στο SwiftUI: κάθε ζώο έχει ένα `id` που μπορεί να διακρίνει την ταυτότητά του.

## Δημιουργία δεδομένων ζώων

Στη συνέχεια, δημιουργούμε έναν πίνακα ζώων μέσα στο `ContentView`.

Ο πίνακας αποθηκεύει πέντε `Animal`, και κάθε `Animal` αντιπροσωπεύει ένα ζώο.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Δελφίνι
        Animal(
            name: "Δελφίνι",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Θερμοί και εύκρατοι ωκεανοί σε όλο τον κόσμο.",
            habitat: "Ωκεανοί, παράκτια νερά και ορισμένα μεγάλα ποτάμια.",
            animalDescription: "Τα δελφίνια είναι έξυπνα θαλάσσια θηλαστικά. Ζουν σε ομάδες, επικοινωνούν με ήχους και είναι γνωστά για την παιχνιδιάρικη συμπεριφορά τους."
        ),
        // Καμηλοπάρδαλη
        Animal(
            name: "Καμηλοπάρδαλη",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Σαβάνες και ανοιχτά δάση στην Αφρική.",
            habitat: "Λιβάδια, σαβάνες και ανοιχτά δάση.",
            animalDescription: "Οι καμηλοπαρδάλεις είναι τα ψηλότερα χερσαία ζώα. Έχουν μακρύ λαιμό, μακριά πόδια και συνήθως τρέφονται με φύλλα από ψηλά δέντρα."
        ),
        // Λιοντάρι
        Animal(
            name: "Λιοντάρι",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Βρίσκεται κυρίως στην υποσαχάρια Αφρική, με έναν μικρό πληθυσμό στη δυτική Ινδία.",
            habitat: "Λιβάδια, σαβάνες και ανοιχτά δάση.",
            animalDescription: "Τα λιοντάρια είναι δυνατές μεγάλες γάτες. Συνήθως ζουν σε ομάδες που ονομάζονται αγέλες και συχνά είναι γνωστά ως βασιλιάδες του ζωικού κόσμου."
        ),
        // Πάντα
        Animal(
            name: "Πάντα",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Ορεινά δάση στην κεντρική Κίνα.",
            habitat: "Δάση μπαμπού σε δροσερές και υγρές ορεινές περιοχές.",
            animalDescription: "Τα πάντα είναι αρκούδες γνωστές για το ασπρόμαυρο τρίχωμά τους. Τρέφονται κυρίως με μπαμπού και είναι από τα πιο αναγνωρίσιμα ζώα στον κόσμο."
        ),
        // Πολική αρκούδα
        Animal(
            name: "Πολική αρκούδα",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Αρκτικές περιοχές γύρω από τον Βόρειο Πόλο.",
            habitat: "Θαλάσσιος πάγος, παράκτιες περιοχές και ψυχρά αρκτικά περιβάλλοντα.",
            animalDescription: "Οι πολικές αρκούδες είναι μεγάλες αρκούδες προσαρμοσμένες σε ψυχρά περιβάλλοντα. Είναι δυνατοί κολυμβητές και βασίζονται κυρίως στον θαλάσσιο πάγο για να κυνηγούν φώκιες."
        )
    ]

    var body: some View {
        Text("Εγκυκλοπαίδεια ζώων")
    }
}
```

Εδώ, το `animals` είναι ένας πίνακας:

```swift
let animals: [Animal]
```

Το `[Animal]` σημαίνει ότι σε αυτόν τον πίνακα αποθηκεύονται πολλά `Animal`.

Με άλλα λόγια, το `animals` δεν είναι ένα ζώο, αλλά μια ομάδα ζώων.

## Εμφάνιση λίστας ζώων

Τώρα μπορούμε να χρησιμοποιήσουμε `ForEach` για να εμφανίσουμε τη λίστα ζώων.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Εμφάνιση αποτελέσματος:

![view](../../../Resource/029_view1.png)

Σε αυτόν τον κώδικα:

```swift
ForEach(animals) { animal in
    ...
}
```

σημαίνει ότι διατρέχουμε τον πίνακα `animals`.

Σε κάθε επανάληψη, το `animal` αντιπροσωπεύει το ζώο που εμφανίζεται εκείνη τη στιγμή.

Για παράδειγμα, στην πρώτη επανάληψη το `animal` είναι το δελφίνι· στη δεύτερη επανάληψη το `animal` είναι η καμηλοπάρδαλη.

Επομένως, μπορούμε να εμφανίσουμε τις πληροφορίες του τρέχοντος ζώου με τον παρακάτω τρόπο:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Έτσι μπορούμε να εμφανίσουμε τα πέντε ζώα.

## Να γίνει η λίστα ζώων πατήσιμη

Τώρα η λίστα έχει εμφανιστεί, αλλά δεν μπορεί ακόμη να πατηθεί.

Αν θέλουμε να εμφανίζεται μια προβολή λεπτομερειών μετά το πάτημα ενός ζώου, πρέπει πρώτα να καταγράψουμε το «τρέχον επιλεγμένο ζώο».

Επομένως, προσθέτουμε μια μεταβλητή κατάστασης στο `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Εδώ, το `selectedAnimal` είναι ένας προαιρετικός τύπος τιμής `Animal?`.

Σημαίνει ότι μπορεί να υπάρχει ένα ζώο ή μπορεί να μην υπάρχει κανένα ζώο.

Η προεπιλεγμένη τιμή είναι `nil`, που σημαίνει ότι στην αρχή δεν έχει επιλεγεί κανένα ζώο.

Στη συνέχεια, αλλάζουμε κάθε γραμμή ζώου σε `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Το βασικό σημείο είναι αυτή η γραμμή κώδικα:

```swift
selectedAnimal = animal
```

Όταν ο χρήστης πατά ένα ζώο, αποθηκεύουμε αυτό το ζώο στο `selectedAnimal`.

Για παράδειγμα, αν ο χρήστης πατήσει το δελφίνι, το `selectedAnimal` αποθηκεύει το δελφίνι.

Αν ο χρήστης πατήσει το πάντα, το `selectedAnimal` αποθηκεύει το πάντα.

Με άλλα λόγια, το `selectedAnimal` χρησιμοποιείται για να καταγράφει ποιο ζώο πάτησε τώρα ο χρήστης.

## Αναδυόμενη προβολή Sheet

Τώρα μπορούμε ήδη να καταγράψουμε με το κουμπί «το ζώο που πατήθηκε τώρα».

Στη συνέχεια, πρέπει να υλοποιήσουμε μια αναδυόμενη προβολή για να εμφανίσουμε τις λεπτομέρειες του ζώου.

![view](../../../Resource/029_view2.png)

Στο SwiftUI, μπορούμε να χρησιμοποιήσουμε `Sheet` για να υλοποιήσουμε αυτό το αναδυόμενο αποτέλεσμα.

Το `Sheet` μπορεί να θεωρηθεί ως μια προσωρινά αναδυόμενη σελίδα. Θα εμφανιστεί πάνω από την τρέχουσα σελίδα και, αφού ο χρήστης δει το περιεχόμενο, μπορεί να το κλείσει σύροντας προς τα κάτω.

## Παράδειγμα Sheet

Πριν εμφανίσουμε πραγματικά τις λεπτομέρειες του ζώου, ας χρησιμοποιήσουμε πρώτα ένα απλό παράδειγμα για να κατανοήσουμε πώς εμφανίζεται το `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Εμφάνιση Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Προβολή Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Εμφάνιση αποτελέσματος:

![view](../../../Resource/029_view3.png)

Σε αυτόν τον κώδικα, δημιουργούμε μια τιμή Boolean:

```swift
@State private var showSheet = false
```

Το `showSheet` είναι προεπιλεγμένα `false`, που σημαίνει ότι στην αρχή δεν εμφανίζεται το `Sheet`.

Όταν πατάμε το κουμπί:

```swift
showSheet.toggle()
```

Το `toggle()` σημαίνει εναλλαγή της τιμής Boolean.

Αν αρχικά είναι `false`, μετά την κλήση του `toggle()` θα γίνει `true`.

Αν αρχικά είναι `true`, μετά την κλήση του `toggle()` θα γίνει `false`.

Επομένως, αφού πατήσουμε το κουμπί, το `showSheet` θα αλλάξει από `false` σε `true`.

Όταν το `showSheet` γίνει `true`, ο παρακάτω κώδικας θα εμφανίσει το `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Προβολή Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Αυτός ο κώδικας σημαίνει: όταν το `showSheet` είναι `true`, εμφανίζεται ένα `Sheet` και μέσα στο `Sheet` εμφανίζεται το `Text("Προβολή Sheet")`.

Εμφάνιση αποτελέσματος:

![view](../../../Resource/029_view4.png)

Αυτός ο τρόπος γραφής είναι κατάλληλος για την εμφάνιση σταθερού περιεχομένου.

Για παράδειγμα, μετά το πάτημα ενός κουμπιού εμφανίζεται μια σελίδα ρυθμίσεων, μια σελίδα οδηγιών, μια σελίδα υπενθύμισης κ.λπ.

### Θέση εμφάνισης του Sheet

Παρόλο που το `Sheet` είναι μια αναδυόμενη προβολή, στο SwiftUI δεν γράφεται απευθείας ως ανεξάρτητη προβολή όπως το `Text()` ή το `Image()`, αλλά χρησιμοποιείται ως τροποποιητής προβολής.

Με άλλα λόγια, το `.sheet(...)` είναι παρόμοιο με τροποποιητές όπως `.font()`, `.padding()` και `.shadow()`· πρέπει να προστεθεί πίσω από κάποια προβολή.

Για παράδειγμα:

```swift
Button("Εμφάνιση Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Προβολή Sheet")
}
```

Σε αυτό το παράδειγμα, το `.sheet` προστίθεται πίσω από το `Button`.

Όταν το `showSheet` γίνει `true`, το SwiftUI θα εμφανίσει το `Sheet` και θα δείξει το περιεχόμενο μέσα στα άγκιστρα:

```swift
Text("Προβολή Sheet")
```

Ωστόσο, στην πραγματική ανάπτυξη, αν μια σελίδα έχει πολλά κουμπιά, συνήθως δεν προσθέτουμε ένα `.sheet` σε κάθε κουμπί.

Η πιο συνηθισμένη πρακτική είναι να προσθέτουμε το `.sheet` πίσω από την εξωτερική προβολή.

Για παράδειγμα:

```swift
VStack {
    Button("Εμφάνιση Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Προβολή Sheet")
}
```

Το κουμπί είναι υπεύθυνο για την αλλαγή του `showSheet`, ενώ η εξωτερική προβολή είναι υπεύθυνη να εμφανίσει το `Sheet` ανάλογα με το αν το `showSheet` είναι `true`.

## Sheet δεσμευμένο με προαιρετική τιμή

Ο τρόπος γραφής που μάθαμε προηγουμένως είναι:

```swift
.sheet(isPresented: $showSheet) {
    Text("Προβολή Sheet")
}
```

Αυτός ο τρόπος γραφής είναι κατάλληλος για τον έλεγχο εμφάνισης και απόκρυψης μιας σταθερής σελίδας.

Όμως στο παράδειγμα της εγκυκλοπαίδειας ζώων, δεν θέλουμε μόνο να ξέρουμε «αν πρέπει να εμφανιστεί το `Sheet`», αλλά και «ποιο ζώο πατήθηκε».

Για παράδειγμα:

Αν ο χρήστης πατήσει το δελφίνι, το `Sheet` πρέπει να εμφανίσει τις λεπτομέρειες του δελφινιού.

Αν ο χρήστης πατήσει το πάντα, το `Sheet` πρέπει να εμφανίσει τις λεπτομέρειες του πάντα.

Επομένως, εδώ είναι πιο κατάλληλη μια άλλη μορφή γραφής του Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Το περιεχόμενο που εμφανίζεται μέσα στο Sheet
}
```

Σε αυτόν τον κώδικα, το `Sheet` δεσμεύεται με μια προαιρετική τιμή `selectedAnimal`.

Εδώ πρέπει να προσέξουμε ότι μετά το `item:` γράφουμε `$selectedAnimal`, όχι `selectedAnimal`.

Επειδή το `Sheet` δεν διαβάζει μόνο την τιμή του `selectedAnimal`, αλλά χρειάζεται επίσης να αποφασίζει αν θα εμφανιστεί με βάση τις αλλαγές της.

Αυτόν τον κώδικα μπορούμε να τον κατανοήσουμε ως εξής:

- Όταν το `selectedAnimal` είναι `nil`, δεν εμφανίζεται το `Sheet`.
- Όταν το `selectedAnimal` έχει τιμή, εμφανίζεται το `Sheet`.
- Όταν το `Sheet` κλείσει, το SwiftUI θα αλλάξει ξανά το `selectedAnimal` σε `nil`.

Το SwiftUI θα περάσει το ζώο που είναι αποθηκευμένο στο `selectedAnimal` στο `animal` μέσα στα άγκιστρα.

Με άλλα λόγια, το `.sheet(item:)` δεν ελέγχει μόνο την εμφάνιση, αλλά περνά και τα επιλεγμένα δεδομένα μέσα στο `Sheet`.

## Χρήση Sheet για εμφάνιση του ονόματος ζώου

Τώρα ας μη βιαστούμε να δημιουργήσουμε μια σύνθετη προβολή λεπτομερειών.

Για να γίνει ο κώδικας πιο εύκολα κατανοητός, πρώτα θα εμφανίσουμε μέσα στο `Sheet` το όνομα του τρέχοντος ζώου.

Προσθέτουμε `.sheet(item:)` έξω από το `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Το πιο σημαντικό σημείο εδώ είναι αυτός ο κώδικας:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Όταν το `selectedAnimal` έχει τιμή, το `Sheet` θα εμφανιστεί.

Το `animal` μέσα στα άγκιστρα είναι το τρέχον επιλεγμένο ζώο.

Επομένως:

```swift
Text(animal.name)
```

θα εμφανίσει το όνομα του ζώου που πατήθηκε.

Για παράδειγμα, αν πατήσουμε `Δελφίνι`, το Sheet εμφανίζει `Δελφίνι`.

Αν πατήσουμε `Πάντα`, το `Sheet` εμφανίζει `Πάντα`.

Έτσι υλοποιήσαμε το αποτέλεσμα όπου το πάτημα διαφορετικού ζώου εμφανίζει διαφορετικό όνομα ζώου.

Εμφάνιση ονόματος ζώου:

![view](../../../Resource/029_view5.png)

Ωστόσο, οι λεπτομέρειες ζώου δεν πρέπει να εμφανίζουν μόνο ένα όνομα. Πρέπει επίσης να εμφανίζουν όνομα, περιοχή εξάπλωσης, βιότοπο και περιγραφή.

Αν γράψουμε όλον αυτόν τον κώδικα μέσα στο `.sheet`, ο κώδικας θα γίνει πολύ μεγάλος και δεν θα διαβάζεται εύκολα.

Επομένως, στη συνέχεια θα δημιουργήσουμε μια νέα προσαρμοσμένη προβολή, ειδικά υπεύθυνη για την εμφάνιση των λεπτομερειών ζώου.

## Δημιουργία προβολής λεπτομερειών ζώου

Στη συνέχεια, δημιουργούμε μια νέα προσαρμοσμένη προβολή `AnimalDetailView`.

Αυτή η προβολή λαμβάνει ένα `Animal` και εμφανίζει τις λεπτομέρειες του ζώου.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Περιοχή εξάπλωσης** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Βιότοπος** ：\(animal.habitat)")

                    Divider()

                    Text("**Περιγραφή ζώου** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Εμφάνιση αποτελέσματος:

![view](../../../Resource/029_view2.png)

Το βασικό σημείο εδώ είναι:

```swift
var animal: Animal
```

Αυτό σημαίνει ότι το `AnimalDetailView` χρειάζεται να λάβει ένα ζώο από έξω.

Αφού λάβει το ζώο, η προβολή λεπτομερειών μπορεί να χρησιμοποιήσει τις διάφορες πληροφορίες αυτού του ζώου:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Με άλλα λόγια, το `AnimalDetailView` είναι υπεύθυνο μόνο για την εμφάνιση του ζώου που περνιέται σε αυτό.

### Έντονο κείμενο με Markdown

Στην προβολή λεπτομερειών γράψαμε έναν τέτοιο κώδικα:

```swift
Text("**Βιότοπος:** \(animal.habitat)")
```

Εδώ υπάρχουν δύο σημεία γνώσης.

Πρώτον, το `**Βιότοπος:**` χρησιμοποιεί σύνταξη `Markdown`. Το κείμενο που περικλείεται από δύο αστερίσκους θα εμφανιστεί με έντονη γραφή.

Δεύτερον, το `\()` είναι παρεμβολή συμβολοσειράς, η οποία μπορεί να εμφανίσει την τιμή μιας μεταβλητής μέσα στο κείμενο.

Αυτός ο κώδικας σημαίνει ότι πρώτα εμφανίζει το έντονο `Βιότοπος:` και στη συνέχεια εμφανίζει τον βιότοπο αυτού του ζώου.

## Εμφάνιση προβολής λεπτομερειών μέσα στο Sheet

Αφού δημιουργήσουμε το `AnimalDetailView`, μπορούμε να επιστρέψουμε στο `ContentView` και να αντικαταστήσουμε την αρχική προβολή ονόματος μέσα στο `Sheet` με την προβολή λεπτομερειών.

Αρχικά ήταν:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Τώρα το αλλάζουμε σε:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Εδώ, το `animal:` είναι το όνομα παραμέτρου του `AnimalDetailView`.

Το `animal` από πίσω είναι το τρέχον ζώο που περνάει το `.sheet(item:)`.

Δηλαδή, περνάμε το ζώο που πατήθηκε τώρα στο `AnimalDetailView` για εμφάνιση.

Πλήρης δομή:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Όταν ο χρήστης πατά ένα ζώο:

```swift
selectedAnimal = animal
```

Το `selectedAnimal` αλλάζει από `nil` σε ένα συγκεκριμένο ζώο, και το `Sheet` εντοπίζει ότι το `selectedAnimal` έχει τιμή, οπότε εμφανίζει την προβολή.

Το `Sheet` περνά το ζώο μέσα στο `selectedAnimal` στην προβολή `AnimalDetailView`, και το `AnimalDetailView` εμφανίζει τις λεπτομέρειες του ζώου.

Έτσι, υλοποιήσαμε τη λειτουργία όπου το πάτημα στη λίστα ζώων εμφανίζει τις αντίστοιχες λεπτομέρειες ζώου.

## Διαφορά ανάμεσα στους δύο τρόπους γραφής του Sheet

Τώρα έχουμε ήδη χρησιμοποιήσει το `.sheet(item:)` για να ολοκληρώσουμε την εμφάνιση της προβολής λεπτομερειών ζώου.

Εδώ μπορούμε να συνοψίσουμε απλά τους δύο συνηθισμένους τρόπους γραφής του `Sheet`.

### Ο πρώτος τρόπος είναι η δέσμευση Boolean τιμής

```swift
@State private var showSheet = false

Button("Εμφάνιση Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Προβολή Sheet")
}
```

Αυτός ο τρόπος γραφής είναι κατάλληλος για την εμφάνιση σταθερού περιεχομένου, όπως σελίδα ρυθμίσεων, σελίδα οδηγιών, σελίδα υπενθύμισης κ.λπ.

Το `showSheet` είναι μια τιμή Boolean και έχει μόνο δύο καταστάσεις: `true` και `false`.

Όταν το `showSheet` είναι `true`, το `Sheet` εμφανίζεται.

Όταν το `showSheet` είναι `false`, το `Sheet` δεν εμφανίζεται.

### Ο δεύτερος τρόπος είναι η δέσμευση προαιρετικής τιμής

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Αυτός ο τρόπος γραφής είναι κατάλληλος για την εμφάνιση διαφορετικού περιεχομένου με βάση τα επιλεγμένα δεδομένα.

Σε αυτό το μάθημα, πατάμε διαφορετικά ζώα και χρειάζεται να εμφανίσουμε διαφορετικές λεπτομέρειες ζώου, επομένως είναι πιο κατάλληλο να χρησιμοποιήσουμε `.sheet(item:)`.

## Πλήρης κώδικας

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Όνομα ζώου
    let name: String
    
    // Εικόνα ζώου
    let imageName: String
    
    // Σύμβολο ετικέτας ζώου
    let avatarEmoji: String
    
    // Περιοχή εξάπλωσης
    let distributionArea: String
    
    // Βιότοπος
    let habitat: String
    
    // Περιγραφή ζώου
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Δελφίνι
        Animal(
            name: "Δελφίνι",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Θερμοί και εύκρατοι ωκεανοί σε όλο τον κόσμο.",
            habitat: "Ωκεανοί, παράκτια νερά και ορισμένα μεγάλα ποτάμια.",
            animalDescription: "Τα δελφίνια είναι έξυπνα θαλάσσια θηλαστικά. Ζουν σε ομάδες, επικοινωνούν με ήχους και είναι γνωστά για την παιχνιδιάρικη συμπεριφορά τους."
        ),
        // Καμηλοπάρδαλη
        Animal(
            name: "Καμηλοπάρδαλη",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Σαβάνες και ανοιχτά δάση στην Αφρική.",
            habitat: "Λιβάδια, σαβάνες και ανοιχτά δάση.",
            animalDescription: "Οι καμηλοπαρδάλεις είναι τα ψηλότερα χερσαία ζώα. Έχουν μακρύ λαιμό, μακριά πόδια και συνήθως τρέφονται με φύλλα από ψηλά δέντρα."
        ),
        // Λιοντάρι
        Animal(
            name: "Λιοντάρι",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Βρίσκεται κυρίως στην υποσαχάρια Αφρική, με έναν μικρό πληθυσμό στη δυτική Ινδία.",
            habitat: "Λιβάδια, σαβάνες και ανοιχτά δάση.",
            animalDescription: "Τα λιοντάρια είναι δυνατές μεγάλες γάτες. Συνήθως ζουν σε ομάδες που ονομάζονται αγέλες και συχνά είναι γνωστά ως βασιλιάδες του ζωικού κόσμου."
        ),
        // Πάντα
        Animal(
            name: "Πάντα",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Ορεινά δάση στην κεντρική Κίνα.",
            habitat: "Δάση μπαμπού σε δροσερές και υγρές ορεινές περιοχές.",
            animalDescription: "Τα πάντα είναι αρκούδες γνωστές για το ασπρόμαυρο τρίχωμά τους. Τρέφονται κυρίως με μπαμπού και είναι από τα πιο αναγνωρίσιμα ζώα στον κόσμο."
        ),
        // Πολική αρκούδα
        Animal(
            name: "Πολική αρκούδα",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Αρκτικές περιοχές γύρω από τον Βόρειο Πόλο.",
            habitat: "Θαλάσσιος πάγος, παράκτιες περιοχές και ψυχρά αρκτικά περιβάλλοντα.",
            animalDescription: "Οι πολικές αρκούδες είναι μεγάλες αρκούδες προσαρμοσμένες σε ψυχρά περιβάλλοντα. Είναι δυνατοί κολυμβητές και βασίζονται κυρίως στον θαλάσσιο πάγο για να κυνηγούν φώκιες."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Περιοχή εξάπλωσης** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Βιότοπος** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Περιγραφή ζώου** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Σύνοψη

Σε αυτό το μάθημα ολοκληρώσαμε μια απλή σελίδα εγκυκλοπαίδειας ζώων.

Πρώτα χρησιμοποιήσαμε τη δομή `Animal` για να αποθηκεύσουμε πληροφορίες ζώων, στη συνέχεια χρησιμοποιήσαμε έναν πίνακα για να αποθηκεύσουμε πέντε ζώα, και έπειτα χρησιμοποιήσαμε `ForEach` για να εμφανίσουμε τη λίστα ζώων.

Όταν ο χρήστης πατά ένα ζώο, αποθηκεύουμε αυτό το ζώο στο `selectedAnimal`:

```swift
selectedAnimal = animal
```

Όταν το `selectedAnimal` έχει τιμή, το `.sheet(item:)` θα εμφανίσει την προβολή λεπτομερειών και θα περάσει το επιλεγμένο ζώο στο `AnimalDetailView`.

Το πιο σημαντικό σε αυτό το μάθημα δεν είναι το στυλ της διεπαφής, αλλά η κατανόηση αυτής της διαδρομής μεταφοράς δεδομένων:

```swift
Πάτημα ζώου → το selectedAnimal αποθηκεύει το ζώο → εμφανίζεται το Sheet → το AnimalDetailView εμφανίζει τις λεπτομέρειες
```

Αφού κατανοήσουμε αυτή τη διαδρομή, στο μέλλον μπορούμε να δημιουργήσουμε περισσότερες παρόμοιες λειτουργίες, όπως λεπτομέρειες προϊόντος, λεπτομέρειες μαθήματος, λεπτομέρειες άρθρου, λεπτομέρειες επαφής κ.λπ.
