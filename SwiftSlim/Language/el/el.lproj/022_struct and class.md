# struct και class

Στο προηγούμενο μάθημα, μόλις αρχίσαμε να ερχόμαστε σε επαφή με το `struct`, ορίσαμε μία δομή και επεκτείναμε επίσης τις γνώσεις μας σε θέματα όπως τα πρωτόκολλα, το `UUID` και άλλα σημεία γνώσης.

Τώρα έχουμε ήδη μια αρχική κατανόηση της λέξης-κλειδί `struct`, αλλά ακόμη δεν μπορούμε να πούμε ότι την κατανοούμε πραγματικά.

Σε αυτό το μάθημα, θα συνεχίσουμε με το `struct` ως βασικό περιεχόμενο και παράλληλα θα γνωρίσουμε και το `class`. Μέσα από αυτό το μάθημα, θα ξέρεις πιο ξεκάθαρα: τι είναι ένα instance, τι είναι ένας constructor και γιατί μπορούμε να χρησιμοποιούμε το `struct` και το `class` για να οργανώνουμε δεδομένα.

## Σύστημα διαχείρισης μαθητών

Για παράδειγμα, τώρα θέλουμε να αναπτύξουμε ένα σύστημα διαχείρισης μαθητών. Κάθε μαθητής έχει πληροφορίες όπως όνομα, φύλο, τηλέφωνο, ηλικία, διεύθυνση κατοικίας και άλλα.

Σε αυτό το σημείο, μπορούμε να συνδυάσουμε αυτές τις πληροφορίες και να τις ορίσουμε ως μία δομή `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Εδώ χρησιμοποιούμε το `struct` για να ορίσουμε έναν τύπο μαθητή.

Αυτή η δομή `Student` περιλαμβάνει πολλές ιδιότητες:

- `id`: το μοναδικό αναγνωριστικό του μαθητή
- `name`: το όνομα του μαθητή
- `sex`: το φύλο του μαθητή
- `phone`: το τηλέφωνο του μαθητή
- `age`: η ηλικία του μαθητή
- `address`: η διεύθυνση κατοικίας

Με αυτόν τον τρόπο, πολλά δεδομένα που ήταν αρχικά διάσπαρτα συνδυάζονται σε έναν ολοκληρωμένο «μαθητή».

Εδώ το `Student` συμμορφώνεται επίσης με το πρωτόκολλο `Identifiable` και ορίζει ένα πεδίο `id`, ώστε αργότερα να είναι εύκολο να εμφανιστούν δεδομένα σε συνδυασμό με τη βρόχο `ForEach`.

Έπειτα, μπορούμε να δημιουργήσουμε ένα instance μαθητή:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Αυτό το κομμάτι κώδικα σημαίνει ότι, σύμφωνα με αυτή τη δομή `Student`, μπορούμε να δημιουργήσουμε συγκεκριμένα δεδομένα μαθητή.

Εδώ, το `Student` είναι ο τύπος, ενώ το `Student(...)` αντιπροσωπεύει ένα δημιουργημένο instance.

Στο SwiftUI, μπορούμε να αναθέσουμε αυτό το instance σε μία μεταβλητή και στη συνέχεια να το εμφανίσουμε.

Για παράδειγμα:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Έτσι, μπορούμε να δούμε μέσα στο view το όνομα αυτού του μαθητή: `Fang Junyu`.

Εδώ, πρώτα δημιουργήσαμε ένα `Student` instance, μετά το αναθέσαμε στη μεταβλητή `student`, και τέλος διαβάσαμε την ιδιότητά του μέσω του `student.name`.

## Τι είναι ένα instance

Όταν μόλις αρχίζουμε να μαθαίνουμε `struct`, μπορεί η λέξη «instance» να μας φαίνεται πολύ άγνωστη.

Αλλά στην πραγματικότητα, χρησιμοποιούμε instances από την αρχή, απλώς πριν δεν το προσέχαμε ιδιαίτερα.

Για παράδειγμα:

```swift
let name = "Fang Junyu"
```

Εδώ, το `"Fang Junyu"` είναι μία τιμή συμβολοσειράς, και στην ουσία είναι ένα instance του τύπου `String`.

Μπορούμε επίσης να το γράψουμε ως εξής:

```swift
let name = String("Fang Junyu")
```

Αυτοί οι δύο τρόποι γραφής εκφράζουν το ίδιο πράγμα: τη δημιουργία ενός instance του τύπου `String` και την ανάθεσή του στη μεταβλητή `name`.

Το ίδιο ισχύει και για το `Int`:

```swift
let num = 3
```

Εδώ, το `3` είναι στην ουσία μία τιμή του τύπου `Int`, και μπορεί επίσης να θεωρηθεί ως ένα `Int` instance.

Άρα, το instance δεν είναι μια ειδική έννοια που εμφανίζεται μόνο μέσα στο `struct`.

Είτε πρόκειται για `String`, `Int`, `Double`, `Bool`, είτε για το προσαρμοσμένο `Student`, όλα μπορούν να δημιουργούν instances.

Επομένως, όταν γράφουμε:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

στην ουσία είναι το ίδιο με τη δημιουργία ενός `String` ή `Int` instance, απλώς το `Student` είναι ένας τύπος που έχουμε ορίσει εμείς.

## Constructor

Όταν δημιουργούμε ένα instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

στην πραγματικότητα, καλούμε τη μέθοδο αρχικοποίησης του `Student`, δηλαδή το `init`.

Μπορείς να καταλάβεις τον constructor ως: **το σημείο εισόδου που, όταν δημιουργείται ένα instance, είναι υπεύθυνο για την ανάθεση τιμών στις ιδιότητες.**

Δηλαδή, πριν ένα instance ολοκληρωθεί πραγματικά, συνήθως πρέπει πρώτα να περάσει από το `init`.

Για παράδειγμα, όταν πριν μαθαίναμε τον κύκλο ζωής των SwiftUI views, είχαμε γράψει κώδικα σαν αυτόν:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Εδώ, το `init()` εκτελείται όταν δημιουργείται το `ContentView` instance, ενώ το `onAppear` εκτελείται μόνο όταν το view εμφανιστεί πραγματικά στην οθόνη. Δηλαδή, η δημιουργία και η εμφάνιση ενός view δεν συμβαίνουν την ίδια χρονική στιγμή.

Με τον ίδιο τρόπο, όταν δημιουργούμε `Student(...)`, καλούμε και τον constructor του `Student`.

### Constructor που δημιουργείται αυτόματα από το σύστημα

Όταν ορίσαμε το `Student`, δεν γράψαμε χειροκίνητα το `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Αλλά παρ' όλα αυτά, μπορούμε ακόμα να δημιουργήσουμε απευθείας ένα instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Γιατί μπορούμε να δημιουργήσουμε ένα instance χωρίς να υπάρχει constructor;

Επειδή για το `struct`, αν δεν γράψουμε χειροκίνητα constructor, το σύστημα συνήθως δημιουργεί αυτόματα έναν κατάλληλο constructor για εμάς.

Στο αρχικό στάδιο εκμάθησης, μπορείς απλά να το καταλάβεις έτσι: η Swift συμπληρώνει αυτόματα τον κώδικα αρχικοποίησης για εμάς.

Περίπου μπορούμε να το καταλάβουμε ότι το σύστημα συμπληρώνει για εμάς τον παρακάτω κώδικα:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Εδώ χρειάζεται να προσέξουμε μία λεπτομέρεια:

```swift
let id = UUID()
```

Το `id` έχει ήδη προεπιλεγμένη τιμή, οπότε όταν δημιουργούμε ένα instance δεν χρειάζεται να περάσουμε ξανά χειροκίνητα το `id`.

Δηλαδή, οι ιδιότητες που δεν έχουν προεπιλεγμένη τιμή συνήθως χρειάζεται να περαστούν μέσα στον constructor· οι ιδιότητες που έχουν ήδη προεπιλεγμένη τιμή συνήθως μπορούν να χρησιμοποιήσουν απευθείας αυτήν την αρχική τιμή.

Επομένως, όταν δημιουργούμε ένα `Student` instance, χρειάζεται να περάσουμε μόνο τα `name`, `sex`, `phone`, `age` και `address`.

### Υποδείξεις του compiler

Επιπλέον, όταν πληκτρολογούμε `Student(...)` στο Xcode, μπορούμε επίσης να δούμε τις υποδείξεις παραμέτρων που δίνει το σύστημα.

![student](../../Resource/022_student.png)

Αυτό στην πραγματικότητα δείχνει επίσης ότι ο τρέχων τύπος όντως διαθέτει έναν constructor που δημιουργήθηκε αυτόματα από το σύστημα.

### Να γράψουμε μόνοι μας constructor

Αν και το σύστημα μπορεί να δημιουργεί αυτόματα constructor, μερικές φορές αυτός ο προεπιλεγμένος τρόπος αρχικοποίησης δεν ταιριάζει πλήρως στις ανάγκες μας.

Για παράδειγμα, έχουμε μία δομή `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Σύμφωνα με τον automatically generated constructor του συστήματος, όταν δημιουργούμε ένα instance, πρέπει να περάσουμε ταυτόχρονα και τις τρεις αυτές παραμέτρους:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Αλλά αν τώρα θέλουμε να καταχωρίσουμε μία παρτίδα παλιών ταινιών και γνωρίζουμε μόνο το όνομα της ταινίας, αλλά όχι τον σκηνοθέτη και τη βαθμολογία, αυτό θα είναι κάπως άβολο.

Γιατί τότε μπορούμε να γράψουμε μόνο έτσι:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Αν και αυτό λειτουργεί, δεν είναι βολικό να γράφουμε κάθε φορά το `--`.

Τότε μπορούμε να γράψουμε έναν constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Έτσι, όταν δημιουργούμε παλιές ταινίες, χρειάζεται να περάσουμε μόνο το `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Αυτό είναι ένα από τα νοήματα του να γράφουμε μόνοι μας constructor: **να κάνουμε τον τρόπο δημιουργίας των instances πιο ταιριαστό με τις πραγματικές ανάγκες.**

### Ανάλυση προσαρμοσμένου constructor

Ας δούμε αυτόν τον χειροκίνητα γραμμένο constructor που είδαμε πριν λίγο:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Αυτός ο κώδικας σημαίνει ότι, όταν δημιουργούμε ένα `Movie` instance, απαιτείται να περάσουμε μόνο μία παράμετρο `name`.

Έπειτα, μέσα στον constructor, το `name` που περάστηκε θα ανατεθεί στο `name` του ίδιου του instance, και τα `director` και `rating` θα πάρουν ως προεπιλεγμένη τιμή το `--`.

Εδώ το `self` σημαίνει «το τρέχον αυτό instance».

Για παράδειγμα:

```swift
self.name = name
```

Το `self.name` στα αριστερά δηλώνει την ιδιότητα μέσα στο instance· το `name` στα δεξιά δηλώνει την παράμετρο που περάσαμε.

Μπορούμε να το καταλάβουμε απλά ως αποθήκευση της τιμής που έρχεται απ' έξω στην ιδιότητα του ίδιου του instance.

Όταν ολοκληρωθεί η ανάθεση τιμών σε όλες τις ιδιότητες, τότε ολοκληρώνεται και η δημιουργία αυτού του instance.

### Μηχανισμός constructor

Όταν δηλώνουμε ρητά έναν constructor, προκύπτει και μία ακόμη αλλαγή:

ο constructor που αρχικά δημιουργούσε αυτόματα το σύστημα συνήθως δεν μπορεί πλέον να χρησιμοποιηθεί απευθείας.

Για παράδειγμα:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Αν τώρα ξαναγράψουμε έτσι:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ο compiler θα δώσει σφάλμα:

```swift
Extra arguments at positions #2, #3 in call
```

Αυτό σημαίνει: πέρασες περιττές παραμέτρους.

Γιατί εμφανίζεται αυτό το σφάλμα;

Επειδή στην τρέχουσα δομή `Movie` υπάρχει μόνο αυτός ο ένας constructor που δήλωσες χειροκίνητα:

```swift
init(name: String)
```

Αυτός δέχεται μόνο μία παράμετρο `name`, και δεν δέχεται τα `director` και `rating`.

Δηλαδή, όταν προσθέτεις χειροκίνητα τον δικό σου constructor, ο αρχικός automatically generated τρόπος αρχικοποίησης δεν μπορεί πια να χρησιμοποιηθεί απευθείας.

Αν θέλουμε να υποστηρίζουμε και το «να περνάμε μόνο το όνομα» και το «να περνάμε πλήρεις πληροφορίες», τότε χρειάζεται να συμπληρώσουμε μόνοι μας έναν ακόμη πλήρη constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Έτσι, έχουμε πλέον δύο διαφορετικούς constructors.

Όταν δημιουργούμε μία παλιά ταινία, μπορούμε να γράψουμε έτσι:

```swift
Movie(name: "The Night of the Hunter")
```

Όταν δημιουργούμε μία νέα ταινία με πλήρεις πληροφορίες, μπορούμε να γράψουμε έτσι:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Αυτός ο τρόπος γραφής δείχνει επίσης ότι ο ίδιος τύπος μπορεί να έχει πολλούς constructors, αρκεί οι μορφές των παραμέτρων τους να είναι διαφορετικές.

## Τι είναι το overload

Εδώ ας συμπληρώσουμε ακόμη ένα απαραίτητο σημείο γνώσης.

Μόλις τώρα γράψαμε δύο `init` για το `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Αυτός ο τρόπος γραφής, «ίδιο όνομα συνάρτησης αλλά διαφορετικές παράμετροι», ονομάζεται «overload».

Εδώ, και οι δύο συναρτήσεις λέγονται `init`, αλλά επειδή δέχονται διαφορετικές παραμέτρους, η Swift μπορεί να ξεχωρίσει ποια συνάρτηση καλείς.

Για παράδειγμα:

```swift
Movie(name: "Days of Heaven")
```

θα καλέσει:

```swift
init(name: String)
```

Ενώ:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

θα καλέσει την άλλη πλήρη έκδοση της μεθόδου αρχικοποίησης.

Άρα, ο ρόλος του overload είναι: να επιτρέπει στον ίδιο τύπο να παρέχει διαφορετικούς τρόπους δημιουργίας ανάλογα με διαφορετικά σενάρια.

## Γνωριμία με το class

Στη συνέχεια, ας γνωρίσουμε σύντομα και το `class`.

Εκτός από το συνηθισμένο `struct` στη Swift, πολλές γλώσσες προγραμματισμού χρησιμοποιούν το `class` για τη δημιουργία instances, όπως η Java, η C#, η Kotlin και άλλες.

Στη Swift, ο τρόπος γραφής του `class` είναι πολύ κοντά σε αυτόν του `struct`.

Για παράδειγμα:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Θα παρατηρήσεις ότι, εκτός από το ότι η λέξη-κλειδί αλλάζει από `struct` σε `class`, τα υπόλοιπα μέρη φαίνονται σχεδόν ίδια.

Παρόμοιος είναι και ο τρόπος δημιουργίας ενός instance:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Άρα, σε επίπεδο σύνταξης, το `struct` και το `class` πράγματι μοιάζουν πολύ.

### Η διαφορά ανάμεσα σε Struct και Class

Παρόλο που το `struct` και το `class` μοιάζουν πολύ, δεν είναι εντελώς ίδια.

**1. Ο τρόπος αρχικοποίησης είναι διαφορετικός**

Για το `struct`, αν δεν γράψουμε χειροκίνητα constructor, το σύστημα συνήθως δημιουργεί αυτόματα μία κατάλληλη μέθοδο αρχικοποίησης.

Αλλά για το `class`, αν υπάρχουν ιδιότητες που δεν έχουν προεπιλεγμένη τιμή, τότε συνήθως πρέπει να γραφτεί χειροκίνητα το `init`, αλλιώς θα εμφανιστεί σφάλμα.

Για παράδειγμα:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Αυτό το `class` θα εμφανίσει σφάλμα, επειδή δεν έχει constructor και έτσι οι ιδιότητες δεν έχουν αρχικοποιηθεί.

Ο compiler θα δώσει ένα μήνυμα παρόμοιο με:

```swift
Class 'Movie' has no initializers
```

Άρα, σε αυτό το παράδειγμα, το `class` πρέπει υποχρεωτικά να έχει χειροκίνητα γραμμένο constructor.

**2. Το `struct` είναι value type, το `class` είναι reference type**

Το `struct` είναι value type, ενώ το `class` είναι reference type.

Στο αρχικό στάδιο εκμάθησης, δεν χρειάζεται να κατακτήσεις πλήρως αυτές τις δύο έννοιες· αρκεί να έχεις μια απλή πρώτη εικόνα.

Για παράδειγμα, το `struct` μοιάζει περισσότερο με το «να αντιγράφεις μία νέα τιμή».

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Εδώ, όταν αναθέτουμε το `user1` στο `user2`, είναι σαν να αντιγράφεται ένα νέο σύνολο δεδομένων, οπότε η αλλαγή του `user2` δεν επηρεάζει το `user1`.

Αντίθετα, το `class` μοιάζει περισσότερο με το «να δείχνουν πολλά ονόματα στο ίδιο instance».

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Εδώ, το `user1` και το `user2` δείχνουν στο ίδιο instance.

Τώρα δεν χρειάζεται να καταλάβουμε πλήρως τον εσωτερικό μηχανισμό των value type και reference type· αρκεί να ξέρουμε ότι το `struct` είναι πιο κατάλληλο για την αποθήκευση ανεξάρτητων δεδομένων, ενώ το `class` είναι πιο κατάλληλο όταν πολλά σημεία πρέπει να μοιράζονται το ίδιο instance.

## Πώς να επιλέγεις στο αρχικό στάδιο

Στο τρέχον στάδιο, για τα συνηθισμένα data models προτίμησε πρώτα το `struct`, και όταν χρειάζονται κοινόχρηστα δεδομένα και συγχρονισμένες αλλαγές, τότε σκέψου το `class`.

Αυτό δεν είναι απόλυτος κανόνας, αλλά για αρχάριους είναι ένας αρκετά πρακτικός τρόπος αξιολόγησης.

Ειδικά στο SwiftUI, πολλές φορές θα διαπιστώσεις ότι το `struct` μπορεί ήδη να καλύψει το μεγαλύτερο μέρος της δουλειάς.

Επιπλέον, σε πολλά προγραμματιστικά υλικά, αυτό που δημιουργείται από το `class` αποκαλείται και «object». Στο αρχικό στάδιο, μπορείς απλώς να το καταλαβαίνεις ως instance, χωρίς να χρειάζεται να τα διαχωρίζεις επίτηδες.

## Σύνοψη

Σε αυτό το μάθημα, μελετήσαμε πιο βαθιά το `struct` και παράλληλα γνωρίσαμε και το `class`, και τα δύο μπορούν να χρησιμοποιηθούν για τον ορισμό τύπων.

Οι τύποι μπορούν να δημιουργούν instances. Όταν δημιουργείται ένα instance, καλείται ο constructor, δηλαδή το `init`.

Για το `struct`, αν δεν γράψουμε χειροκίνητα constructor, το σύστημα συνήθως δημιουργεί αυτόματα έναν κατάλληλο constructor. Αν ο default constructor δεν καλύπτει τις ανάγκες, μπορούμε επίσης να γράψουμε και μόνοι μας constructor.

Επιπλέον, αποκτήσαμε και μία πρώτη κατανόηση της διαφοράς ανάμεσα στο `struct` και το `class`: το `struct` είναι value type, ενώ το `class` είναι reference type. Στο SwiftUI, στο αρχικό στάδιο, συνήθως συναντάμε πιο συχνά το `struct`.

Αργότερα, όταν μάθουμε για passing values between views, data models και state management, όλο αυτό το περιεχόμενο θα συνεχίσει να χρησιμοποιείται.
