# Οργάνωση δεδομένων ζώων

Στο προηγούμενο μάθημα, ολοκληρώσαμε ένα απλό παράδειγμα εγκυκλοπαίδειας ζώων.

![view](../../../Resource/029_view.png)

Όταν ο χρήστης πατά ένα ζώο, η σελίδα εμφανίζει τις λεπτομέρειες του ζώου μέσω ενός `Sheet`.

Ωστόσο, στον κώδικα του προηγούμενου μαθήματος υπάρχει ένα πρόβλημα: τα δεδομένα των ζώων γράφτηκαν απευθείας μέσα στο `ContentView`.

Για παράδειγμα:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Εμφάνιση λίστας ζώων
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Αυτός ο κώδικας μπορεί να λειτουργήσει κανονικά, αλλά όταν τα δεδομένα των ζώων γίνονται όλο και περισσότερα, το `ContentView` θα γίνει πολύ μεγάλο.

Το `ContentView` κανονικά θα έπρεπε να είναι κυρίως υπεύθυνο για την εμφάνιση της διεπαφής, αλλά τώρα αποθηκεύει και πολλά δεδομένα ζώων. Αυτό επηρεάζει την ανάγνωση του κώδικα και δεν είναι βολικό για μελλοντική συντήρηση.

Επομένως, σε αυτό το μάθημα θα κάνουμε ένα πράγμα:

να οργανώσουμε τα δεδομένα των ζώων έξω από το `ContentView`.

## Γιατί να διαχωρίσουμε τα δεδομένα;

Στο SwiftUI, ο κώδικας προβολής είναι συνήθως υπεύθυνος για την εμφάνιση της διεπαφής.

Για παράδειγμα:

```swift
Text("Dolphin")
Image("dolphin")
```

Αυτός ο κώδικας σχετίζεται με την εμφάνιση της διεπαφής.

Όμως τα ίδια τα δεδομένα των ζώων, όπως το όνομα του ζώου, το όνομα της εικόνας, η περιοχή κατανομής, ο βιότοπος και το κείμενο περιγραφής, δεν είναι δομή διεπαφής.

Μοιάζουν περισσότερο με ένα σύνολο σταθερών πληροφοριών:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Αν γράψουμε όλο τον κώδικα της διεπαφής και όλο τον κώδικα των δεδομένων μαζί, ο κώδικας θα γίνεται όλο και πιο ακατάστατος.

Γι’ αυτό, μπορούμε να βάλουμε τα δεδομένα των ζώων στον τύπο `Animal`.

## Χρήση του static για αποθήκευση σταθερών δεδομένων

Ας δούμε πρώτα τη μορφή μετά την οργάνωση:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Εδώ προστέθηκε μία γραμμή κώδικα:

```swift
static let animals: [Animal] = [
    
]
```

Το `static` σημαίνει στατική ιδιότητα.

Μια στατική ιδιότητα ανήκει στον ίδιο τον τύπο και όχι σε κάποιο συγκεκριμένο instance.

Αυτή η πρόταση είναι λίγο αφηρημένη, γι’ αυτό μπορούμε να την κατανοήσουμε με ένα απλό παράδειγμα.

## Κανονικές ιδιότητες και στατικές ιδιότητες

Για παράδειγμα, ορίζουμε έναν `Student`:

```swift
struct Student {
    let name: String
}
```

Εδώ το `name` είναι μια κανονική ιδιότητα. Μια κανονική ιδιότητα ανήκει σε κάποιο συγκεκριμένο instance.

Αν θέλουμε να προσπελάσουμε το `name`, πρέπει πρώτα να δημιουργήσουμε έναν συγκεκριμένο μαθητή:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Εδώ το `student` είναι ένα instance. Μπορείς επίσης προσωρινά να το κατανοήσεις ως ένα συγκεκριμένο σύνολο δεδομένων μαθητή.

Επειδή το όνομα κάθε μαθητή μπορεί να είναι διαφορετικό, το `name` πρέπει να βρίσκεται πάνω στον συγκεκριμένο μαθητή.

Όμως υπάρχουν δεδομένα που δεν ανήκουν σε κάποιο συγκεκριμένο instance.

Για παράδειγμα, θέλουμε να ετοιμάσουμε ένα σύνολο δοκιμαστικών δεδομένων για προεπισκόπηση:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Εδώ, μπροστά από το `previewStudents` υπάρχει το `static`, οπότε είναι στατική ιδιότητα.

Η στατική ιδιότητα δεν ανήκει σε κάποιον συγκεκριμένο μαθητή, αλλά ανήκει στον ίδιο τον τύπο `Student`.

Επομένως, δεν χρειάζεται πρώτα να δημιουργήσουμε κάποιον μαθητή. Μπορούμε να την προσπελάσουμε απευθείας μέσω του ονόματος του τύπου:

```swift
print(Student.previewStudents.count)    // 3
```

Εδώ ο τρόπος πρόσβασης είναι:

```swift
ΌνομαΤύπου.ΌνομαΣτατικήςΙδιότητας
```

Δηλαδή:

```swift
Student.previewStudents
```

Με τον ίδιο τρόπο, στην εγκυκλοπαίδεια ζώων, μπορούμε να προσπελάσουμε τα δεδομένα των ζώων έτσι:

```swift
Animal.animals
```

## Επιστροφή στο ContentView

Τώρα, τα δεδομένα των ζώων έχουν αποθηκευτεί στον τύπο `Animal`.

Άρα μέσα στο `ContentView` δεν χρειάζεται πλέον να γράφουμε έναν πολύ μεγάλο πίνακα ζώων.

Μπορούμε να το αλλάξουμε ως εξής:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Εμφάνιση λίστας ζώων
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Αυτή η γραμμή κώδικα σημαίνει:

```swift
let animals = Animal.animals
```

παίρνουμε από τον τύπο `Animal` αυτό το σύνολο δεδομένων ζώων `animals` και το αποθηκεύουμε στη σταθερά `animals` της τρέχουσας προβολής.

Μετά από αυτή την αλλαγή, το `ContentView` γίνεται πιο καθαρό.

Το `ContentView` είναι υπεύθυνο για την εμφάνιση της διεπαφής, ενώ το `Animal.animals` είναι υπεύθυνο για την παροχή των δεδομένων των ζώων.

## Μεταφορά του Animal σε ξεχωριστό αρχείο

Στο προηγούμενο μάθημα, για να γίνει το παράδειγμα πιο εύκολο στην κατανόηση, γράψαμε το `Animal` και το `ContentView` στο ίδιο αρχείο.

Επειδή τότε ο κώδικας ήταν ακόμη σχετικά λίγος, αυτό δεν ήταν πρόβλημα.

Όμως τώρα τα δεδομένα των ζώων γίνονται όλο και περισσότερα. Αν συνεχίσουμε να γράφουμε όλο τον κώδικα μέσα στο `ContentView.swift`, το αρχείο θα γίνει πολύ μεγάλο και δεν θα είναι βολικό στην ανάγνωση.

Γι’ αυτό, μπορούμε να βάλουμε το `Animal` μόνο του σε ένα νέο Swift αρχείο.

Στο Xcode, μπορούμε να δημιουργήσουμε ένα νέο Swift αρχείο, για παράδειγμα:

```swift
Animal.swift
```

Έπειτα μετακινούμε το struct `Animal` σε αυτό το αρχείο:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Μετά από αυτή την οργάνωση:

Το `ContentView.swift` είναι υπεύθυνο για την εμφάνιση της διεπαφής.

Το `Animal.swift` είναι υπεύθυνο για την περιγραφή της δομής των δεδομένων των ζώων.

Αν και βρίσκονται σε διαφορετικά αρχεία, εφόσον είναι στο ίδιο project, το `ContentView` εξακολουθεί να μπορεί να χρησιμοποιεί απευθείας το `Animal`.

Για παράδειγμα:

```swift
let animals = Animal.animals
```

Εδώ δεν χρειάζεται να εισαγάγουμε επιπλέον το `Animal.swift` μέσα στο `ContentView.swift`.

Η Swift αναγνωρίζει αυτόματα τα Swift αρχεία που βρίσκονται στο ίδιο project.

## Χρήση του extension για περαιτέρω οργάνωση του κώδικα

Τώρα έχουμε ήδη μετακινήσει τα δεδομένα των ζώων από το `ContentView` μέσα στο `Animal`.

Ωστόσο, το struct `Animal` εξακολουθεί να περιέχει δύο είδη κώδικα ταυτόχρονα:

Η πρώτη κατηγορία είναι οι ιδιότητες του ίδιου του μοντέλου ζώου:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Η δεύτερη κατηγορία είναι τα σταθερά δεδομένα ζώων:

```swift
static let animals: [Animal] = [
    // ...
]
```

Για να γίνει η δομή του κώδικα πιο καθαρή, μπορούμε να χρησιμοποιήσουμε το `extension` για να διαχωρίσουμε αυτά τα δύο μέρη.

Το `extension` σημαίνει επέκταση.

Μπορεί να προσθέσει νέο κώδικα πάνω στη βάση ενός υπάρχοντος τύπου.

Για παράδειγμα:

```swift
extension Animal {
    
}
```

Αυτό σημαίνει ότι επεκτείνουμε τον τύπο `Animal`.

## Τοποθέτηση των δεδομένων ζώων μέσα σε extension

Μπορούμε να αλλάξουμε το `Animal` ως εξής:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Μετά από αυτή την οργάνωση, η δομή του κώδικα γίνεται πιο καθαρή.

Το `struct Animal` είναι υπεύθυνο για την περιγραφή των ιδιοτήτων που πρέπει να έχει ένα ζώο.

Το `extension Animal` είναι υπεύθυνο για την αποθήκευση ενός συνόλου σταθερών δεδομένων ζώων.

Πρόσεξε ότι, παρόλο που το `animals` μετακινήθηκε μέσα στο `extension Animal`, ο τρόπος χρήσης δεν αλλάζει.

Μπορούμε ακόμη να το χρησιμοποιούμε έτσι:

```swift
let animals = Animal.animals
```

Αυτό είναι επίσης ένα χαρακτηριστικό του `extension`: απλώς μας βοηθά να οργανώσουμε τον κώδικα και δεν αλλάζει τον τρόπο κλήσης από έξω.

## Όταν τα δεδομένα είναι πολλά, μπορούμε να δημιουργήσουμε επιπλέον ένα αρχείο AnimalData

Τώρα έχουμε ήδη βάλει το `Animal` στο ξεχωριστό αρχείο `Animal.swift`.

Αν τα δεδομένα των ζώων είναι σχετικά λίγα, μπορούμε να γράψουμε απευθείας και το `extension Animal` μέσα στο `Animal.swift`.

Όμως, αν τα δεδομένα των ζώων γίνονται όλο και περισσότερα, μπορούμε επίσης να δημιουργήσουμε ένα νέο αρχείο, για παράδειγμα:

```swift
AnimalData.swift
```

Έπειτα βάζουμε μέσα εκεί τα σταθερά δεδομένα ζώων:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Δεδομένα ζώων
    ]
}
```

Μετά από αυτό, ο καταμερισμός ευθυνών του κώδικα γίνεται πιο καθαρός:

Το `Animal.swift` είναι υπεύθυνο μόνο για τον ορισμό του μοντέλου ζώου.

Το `AnimalData.swift` είναι υπεύθυνο μόνο για την αποθήκευση των δεδομένων ζώων.

Το `ContentView.swift` είναι υπεύθυνο μόνο για την εμφάνιση της διεπαφής.

Οι ευθύνες κάθε αρχείου γίνονται πιο καθαρές.

Πρόσεξε ότι το `AnimalData.swift` είναι απλώς το όνομα του αρχείου, όχι ένας νέος Swift τύπος. Μέσα σε αυτό το αρχείο εξακολουθούμε να χρησιμοποιούμε το `extension Animal` για να προσθέσουμε σταθερά δεδομένα στο `Animal`.

## Πλήρης κώδικας

Παρακάτω είναι ο οργανωμένος κώδικας του `Animal.swift`:

```swift
import Foundation

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

Ο οργανωμένος κώδικας του `AnimalData.swift`:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

Στο `ContentView.swift`, μπορούμε να το χρησιμοποιήσουμε έτσι:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
```

Υπόδειξη: Στα αρχεία `Animal.swift` και `AnimalData.swift`, η πρώτη γραμμή είναι:

```swift
import Foundation
```

Παλαιότερα, όταν γράφαμε διεπαφές SwiftUI, χρησιμοποιούσαμε συχνά:

```swift
import SwiftUI
```

Αυτό συμβαίνει επειδή τα `ContentView`, `Text`, `Button`, `Color` σχετίζονται όλα με τη διεπαφή, οπότε όταν γράφουμε αρχεία διεπαφής συνήθως χρειάζεται να εισαγάγουμε το SwiftUI.

Όμως εδώ τα `Animal.swift` και `AnimalData.swift` δεν είναι αρχεία διεπαφής. Χρησιμοποιούνται κυρίως για τον ορισμό του μοντέλου ζώου και για την αποθήκευση δεδομένων ζώων.

Σε αυτόν τον κώδικα, το `UUID()` χρειάζεται το `Foundation`, άρα αρκεί να εισαγάγουμε το `Foundation`.

## Σύνοψη

Σε αυτό το μάθημα κάναμε κυρίως ένα πράγμα: οργανώσαμε τα δεδομένα των ζώων έξω από το `ContentView`.

Η αρχική γραφή ήταν να βάλουμε τα δεδομένα των ζώων απευθείας μέσα στο `ContentView`. Έτσι ο κώδικας μπορεί να εκτελεστεί, αλλά όταν τα δεδομένα αυξηθούν, το αρχείο της προβολής θα γίνεται όλο και μεγαλύτερο.

Μετά την οργάνωση, το `ContentView` είναι υπεύθυνο μόνο για την εμφάνιση της διεπαφής, ενώ το `Animal.animals` είναι υπεύθυνο για την παροχή των δεδομένων των ζώων.

Σε αυτό το μάθημα μάθαμε επίσης δύο νέα σημεία γνώσης.

Το πρώτο είναι το `static`.

Το `static` σημαίνει στατική ιδιότητα. Μια στατική ιδιότητα ανήκει στον ίδιο τον τύπο και μπορεί να προσπελαστεί απευθείας με τον τρόπο «όνομα τύπου.όνομα ιδιότητας».

Για παράδειγμα:

```swift
Animal.animals
```

Το δεύτερο είναι το `extension`.

Το `extension` σημαίνει επέκταση. Μπορεί να χωρίσει τον κώδικα του ίδιου τύπου σε διαφορετικά μέρη, ώστε η δομή του κώδικα να είναι πιο καθαρή.

Σε αυτό το παράδειγμα, χρησιμοποιήσαμε το `extension Animal` για την αποθήκευση των δεδομένων ζώων, ώστε το ίδιο το struct `Animal` να είναι πιο σύντομο και καθαρό.

Επιπλέον, το `Animal` αποθηκεύει κυρίως το μοντέλο δεδομένων και δεν γράφει απευθείας διεπαφή SwiftUI, γι’ αυτό εδώ χρησιμοποιείται το `import Foundation`.

Το βασικό σημείο αυτού του μαθήματος δεν είναι να κάνουμε τον κώδικα πιο περίπλοκο, αλλά να κάνουμε τον κώδικα πιο εύκολο στην ανάγνωση και τη συντήρηση.
