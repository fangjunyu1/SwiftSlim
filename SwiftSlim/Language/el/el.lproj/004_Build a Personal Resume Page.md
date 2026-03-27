# Δημιουργία μιας προσωπικής σελίδας βιογραφικού

Σε αυτό το μάθημα θα φτιάξουμε μια απλή προσωπική view βιογραφικού και θα μάθουμε τα εξής:

- `cornerRadius`
- `spacing`
- `ScrollView`

Κατά τη διαδικασία θα επαναλάβουμε επίσης γνώσεις για layout, `Text` και `Image` και θα υλοποιήσουμε έλεγχο αποστάσεων και κύλιση περιεχομένου.

## Προσωπικό βιογραφικό

Στόχος:

![Swift](../../RESOURCE/004_img.png)

**Δοκίμασε πρώτα να το ολοκληρώσεις μόνος σου και μετά συνέχισε στην παρακάτω ανάλυση.**

### Δημιουργία project

Δημιούργησε ένα νέο iOS project ή συνέχισε με το προηγούμενο project σου.

Ο προεπιλεγμένος κώδικας του `ContentView` είναι:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Τώρα καθάρισε τον κώδικα και ξεκίνα να γράφεις το δικό σου περιεχόμενο:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Συνολική δομή

Στην πραγματική ανάπτυξη συνήθως σχεδιάζουμε πρώτα τη συνολική δομή.

Η σελίδα μας περιλαμβάνει:

1. Τίτλο
2. Προσωπικές πληροφορίες
3. Προσωπική εισαγωγή

Προσθέτουμε εξωτερικά ένα `VStack`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

Το `VStack` εξασφαλίζει κάθετη διάταξη των views και μας επιτρέπει να ελέγχουμε τη σειρά και τα κενά ανάμεσά τους.

### Τίτλος

Πρώτα δημιουργούμε ένα `Text` για να εμφανίσουμε τον τίτλο.

Εδώ εγώ χρησιμοποιώ ως τίτλο το αγγλικό μου όνομα:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Συνήθως ο τίτλος εμφανίζεται μεγαλύτερος και bold, οπότε χρησιμοποιούμε τους modifiers `font` και `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Διάταξη

Από προεπιλογή το SwiftUI χρησιμοποιεί alignment `center`, οπότε ο τίτλος εμφανίζεται στο κέντρο του `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Εμείς θέλουμε να εμφανίζεται στην κορυφή της view, και μπορούμε να το πετύχουμε με `Spacer`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Το `Spacer` καταλαμβάνει τον διαθέσιμο χώρο που περισσεύει και σπρώχνει το `Text` προς τα επάνω.

![Swift](../../RESOURCE/004_img4.png)

### Κενός χώρος

Αν θεωρείς ότι το κείμενο βρίσκεται πολύ κοντά στην κορυφή, μπορείς να χρησιμοποιήσεις `padding` ή `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Αυτό ορίζει πάνω padding 20 στο `VStack`.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Μπορείς επίσης να χρησιμοποιήσεις `Spacer` με `frame` για να δημιουργήσεις κενό συγκεκριμένου ύψους.

Αποτέλεσμα:

![Swift](../../RESOURCE/004_img5.png)

### Εικόνα

Ετοιμάζουμε μια δική μας φωτογραφία προφίλ και την βάζουμε στον φάκελο πόρων `Assets`.

![Swift](../../RESOURCE/004_img6.png)

Στο `ContentView` χρησιμοποιούμε `Image` για να εμφανίσουμε τη φωτογραφία:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Επειδή η αρχική εικόνα είναι αρκετά μεγάλη, χρειάζεται να χρησιμοποιήσουμε `frame` για να ελέγξουμε το μέγεθος εμφάνισης.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Σε αυτό το σημείο θα παρατηρήσουμε ένα πρόβλημα:

Αν η αναλογία πλάτους-ύψους του `frame` δεν ταιριάζει με την αρχική αναλογία της εικόνας, η εικόνα θα παραμορφωθεί.

Για παράδειγμα:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Για να αποφύγουμε την παραμόρφωση, χρειάζεται να χρησιμοποιήσουμε `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Η λειτουργία του `scaledToFit` είναι η εξής:

Μέσα στο δοσμένο `frame`, κλιμακώνει την εικόνα σύμφωνα με την αρχική της αναλογία και εμφανίζει ολόκληρο το περιεχόμενο.

Δεν τεντώνει την εικόνα για να γεμίσει όλο το `frame`, αλλά διατηρεί την αναλογία πλάτους-ύψους και την κλιμακώνει αναλογικά μέχρι μία πλευρά να φτάσει στο όριο.

Αυτό σημαίνει:

- Αν το πλάτος του `frame` είναι πιο περιορισμένο, η κλίμακα θα βασιστεί στο πλάτος
- Αν το ύψος του `frame` είναι πιο περιορισμένο, η κλίμακα θα βασιστεί στο ύψος
- Η εικόνα διατηρεί πάντα την αρχική της αναλογία και δεν παραμορφώνεται

Συνήθως αρκεί να ορίσουμε μόνο μία διάσταση. Για παράδειγμα:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Έτσι το σύστημα υπολογίζει αυτόματα το κατάλληλο ύψος με βάση το πλάτος 140, διατηρώντας την αναλογία της εικόνας.

Αν όμως χρειάζεσαι σταθερή οπτική αναλογία ή θέλεις να αποφύγεις συμπίεση σε πιο σύνθετα layouts, μπορείς να περιορίσεις και πλάτος και ύψος μαζί.

### Στρογγυλεμένες γωνίες

Αν θέλεις η εικόνα να εμφανίζεται με στρογγυλεμένες γωνίες, μπορείς να χρησιμοποιήσεις τον modifier `cornerRadius`:

```swift
.cornerRadius(10)
```

Για παράδειγμα:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Δηλαδή προσθέτουμε `cornerRadius(20)` μετά τους modifiers της `Image`.

![Swift](../../RESOURCE/004_img9.png)

Το `cornerRadius(20)` σημαίνει ότι τα όρια της view κόβονται με ακτίνα 20.

Αφού προστεθούν στρογγυλεμένες γωνίες, οι τέσσερις γωνίες της εικόνας γίνονται πιο μαλακές και πιο σύγχρονες οπτικά.

Αυτό το στυλ είναι πολύ συνηθισμένο στο σημερινό UI design. Για παράδειγμα, και τα εικονίδια εφαρμογών στο iOS έχουν στρογγυλεμένο ορθογώνιο σχήμα, αν και τα system icons χρησιμοποιούν πιο σύνθετη καμπυλότητα και όχι απλά γωνίες radius.

### Προσωπικές πληροφορίες

Τώρα ας υλοποιήσουμε την περιοχή προσωπικών πληροφοριών στα αριστερά της εικόνας. Από τη δομή της διεπαφής φαίνεται ότι οι προσωπικές πληροφορίες και η εικόνα είναι τοποθετημένες οριζόντια, οπότε χρειαζόμαστε `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Το περιεχόμενο των προσωπικών πληροφοριών είναι κάθετα διατεταγμένο.

![Swift](../../RESOURCE/004_img11.png)

Άρα εξωτερικά χρησιμοποιούμε `HStack`, για τις προσωπικές πληροφορίες `VStack`, και για κάθε στοιχείο `Text`.

Βασική δομή:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Bold για τις επικεφαλίδες των πεδίων**

Για να ξεχωρίζουν τα ονόματα των πεδίων από τις τιμές τους, μπορούμε να χρησιμοποιήσουμε `fontWeight`:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Αριστερή στοίχιση κειμένου**

Το `VStack` είναι από προεπιλογή κεντραρισμένο. Αν θέλουμε όλο το κείμενο αριστερά, πρέπει να ορίσουμε alignment:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

Το `.leading` σημαίνει αριστερή στοίχιση σε περιβάλλον γλώσσας από αριστερά προς τα δεξιά.

![Swift](../../RESOURCE/004_img14.png)

### Απόσταση

Αν θέλουμε να υπάρχει σταθερή απόσταση ανάμεσα στις προσωπικές πληροφορίες και την εικόνα, έχουμε ήδη μάθει να χρησιμοποιούμε `Spacer` για κενό:

```swift
Spacer()
    .frame(width: 10)
```

Μπορούμε όμως να χρησιμοποιήσουμε και την παράμετρο `spacing` του `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Το `spacing: 30` σημαίνει ότι η απόσταση ανάμεσα στις δύο child views είναι 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Τι είναι το spacing;**

Στα `VStack`, `HStack` και `ZStack`, το `spacing` ελέγχει την απόσταση ανάμεσα στις child views.

Για παράδειγμα:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Οι αποστάσεις ανάμεσα στις child views του `VStack` θα γίνουν 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Πρέπει να προσέξουμε ότι το `spacing` επηρεάζει μόνο τις άμεσες child views και όχι το layout μέσα σε nested containers.

**Έλεγχος απόστασης μέσα στη λίστα**

Αν θέλουμε μεγαλύτερη απόσταση ανάμεσα στα πεδία, ο πιο άμεσος τρόπος είναι να ορίσουμε `spacing` στο `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Έτσι όλες οι child views θα έχουν μεταξύ τους απόσταση 10 pt.

Αν όμως παρατηρήσουμε τη διεπαφή, θα δούμε ένα πρόβλημα:

Υπάρχει απόσταση ανάμεσα στις ομάδες πεδίων, αλλά ταυτόχρονα εμφανίζεται η ίδια απόσταση και ανάμεσα στο όνομα του πεδίου και την τιμή του.

Αυτό συμβαίνει επειδή το `spacing` εφαρμόζεται σε όλες τις άμεσες child views του container.

Σε αυτή τη δομή, κάθε `Text` είναι άμεση child view του εξωτερικού `VStack`, οπότε η απόσταση είναι ενιαία.

Αν θέλουμε οι ομάδες πεδίων να έχουν απόσταση μεταξύ τους, αλλά το όνομα πεδίου και η τιμή να παραμένουν κοντά, μπορούμε να θεωρήσουμε κάθε ζευγάρι "όνομα πεδίου + τιμή" ως μία λογική ενότητα και να το τυλίξουμε σε ξεχωριστό `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Τώρα η δομή γίνεται τέτοια ώστε τα εξωτερικά `VStack` να έχουν απόσταση μεταξύ τους, ενώ τα εσωτερικά `VStack` να διατηρούν την compact προεπιλεγμένη απόσταση. Έτσι δεν εμφανίζεται επιπλέον κενό ανάμεσα σε όνομα πεδίου και τιμή.

![Swift](../../RESOURCE/004_img18.png)

### Προσωπική εισαγωγή

Στη συνέχεια υλοποιούμε την περιοχή της προσωπικής εισαγωγής.

Από τη δομή της διεπαφής φαίνεται ότι η εισαγωγή αποτελείται από πολλές γραμμές κειμένου, τοποθετημένες κάθετα.

![Swift](../../RESOURCE/004_img19.png)

Άρα μπορούμε να χρησιμοποιήσουμε `VStack` μαζί με `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Προσθήκη αποστάσεων**

Αυτή τη στιγμή οι προσωπικές πληροφορίες και η προσωπική εισαγωγή είναι πολύ κοντά, και το αποτέλεσμα δεν είναι ιδιαίτερα όμορφο.

![Swift](../../RESOURCE/004_img20.png)

Επειδή και τα δύο μέρη βρίσκονται μέσα στο ίδιο εξωτερικό container, μπορούμε να ελέγξουμε τη συνολική απόσταση από εκεί:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Αποτέλεσμα:

![Swift](../../RESOURCE/004_img21.png)

**Απόσταση στη λίστα**

Χρησιμοποιούμε `spacing` για να ορίσουμε την απόσταση ανάμεσα στις γραμμές του κειμένου της εισαγωγής:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Ολοκλήρωση του προσωπικού βιογραφικού

Τώρα έχει ολοκληρωθεί το βασικό πλαίσιο του προσωπικού μας βιογραφικού.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

Αυτή τη στιγμή η δομή της σελίδας χρησιμοποιεί `VStack`. Όσο το κείμενο της εισαγωγής είναι λίγο, αυτό δεν δημιουργεί πρόβλημα. Αν όμως το αυξήσουμε σε 20, 30 ή και περισσότερες γραμμές, το ύψος του περιεχομένου θα ξεπεράσει την οθόνη.

Για παράδειγμα:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Τότε θα παρατηρήσουμε δύο φαινόμενα:

- Το κάτω μέρος του περιεχομένου κόβεται
- Η σελίδα δεν μπορεί να κάνει scroll

Αυτό δεν είναι πρόβλημα του `VStack`. Το `VStack` είναι απλώς layout container και δεν προσφέρει από μόνο του δυνατότητα κύλισης.

**Τι είναι το ScrollView**

Το `ScrollView` είναι ένα scrollable container, κατάλληλο για μεγάλες ποσότητες περιεχομένου που ξεπερνούν το μέγεθος της οθόνης, όπως κάθετες ή οριζόντιες λίστες.

Βασική δομή:

```swift
ScrollView {
    ...
}
```

Αν θέλουμε αποτέλεσμα κύλισης, πρέπει να τυλίξουμε όλο το περιεχόμενο της σελίδας μέσα σε `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Έτσι, ολόκληρη η σελίδα γίνεται μια scrollable περιοχή. Όταν το περιεχόμενο ξεπερνά το ύψος της οθόνης, μπορεί να γίνει κύλιση φυσικά.

Από προεπιλογή το `ScrollView` εμφανίζει δείκτη κύλισης. Αν θέλεις να τον κρύψεις, μπορείς να ορίσεις:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Πλήρης κώδικας

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
