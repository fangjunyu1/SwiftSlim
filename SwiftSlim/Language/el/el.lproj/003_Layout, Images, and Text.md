# Διάταξη, εικόνες και κείμενο

Στο προηγούμενο μάθημα μάθαμε τον κώδικα του `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Σε αυτό το μάθημα θα μάθουμε τον προεπιλεγμένο μηχανισμό διάταξης του SwiftUI, καθώς και πώς χρησιμοποιούνται οι εικόνες και το κείμενο. Με βάση όσα είδαμε προηγουμένως, θα κατανοήσουμε καλύτερα τη δομή και τον τρόπο εμφάνισης των views, κάτι που θα μας βοηθήσει να φτιάχνουμε βασικά layouts διεπαφής.

## Ο προεπιλεγμένος μηχανισμός διάταξης του SwiftUI

Όταν κάνουμε preview το `ContentView`, παρατηρούμε ότι το εικονίδιο και το κείμενο εμφανίζονται στο κέντρο, όχι ξεκινώντας από την κορυφή.

![Swift](../../RESOURCE/003_view.png)

Από προεπιλογή, το alignment ενός Stack container είναι `.center`, γι’ αυτό και οι child views εμφανίζονται συνήθως κεντραρισμένες.

### Alignment

Είναι προφανές ότι το κεντραρισμένο alignment είναι μόνο μία από τις διαθέσιμες επιλογές. Αν θέλουμε αριστερή ή δεξιά στοίχιση, πρέπει να χρησιμοποιήσουμε το `alignment` για να ελέγξουμε πώς θα ευθυγραμμιστεί η view.

```swift
alignment
```

Στο SwiftUI το alignment εμφανίζεται συνήθως σε δύο περιπτώσεις:

**1. Η παράμετρος alignment ενός Stack container**

Για παράδειγμα, αν θέλουμε το εικονίδιο και το κείμενο στο `ContentView` να είναι αριστερά στοιχισμένα:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

Το `alignment` του `VStack` ελέγχει την οριζόντια στοίχιση.

Επιλογές στοίχισης:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

Το `HStack` είναι οριζόντια διάταξη, άρα το `alignment` εκεί ελέγχει την κάθετη στοίχιση:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

Το `ZStack` είναι διάταξη επικάλυψης, και το `alignment` μπορεί να ελέγχει είτε οριζόντια είτε κάθετη στοίχιση:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Αν δεν καθορίσεις ρητά `alignment`, τα `VStack`, `HStack` και `ZStack` χρησιμοποιούν από προεπιλογή το `.center`.

**2. Το alignment μέσα σε frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Όταν το `frame` παρέχει περισσότερο χώρο από όσο χρειάζεται η ίδια η view, το `alignment` καθορίζει σε ποιο σημείο μέσα στο `frame` θα τοποθετηθεί η view. Τη συγκεκριμένη χρήση του `frame` θα τη δούμε πιο αναλυτικά αργότερα· εδώ αρκεί μια πρώτη κατανόηση.

### Spacer και η κατανομή του διαθέσιμου χώρου

Το `alignment` μπορεί να βοηθήσει ώστε οι views να εμφανίζονται με οριζόντια ή κάθετη σειρά. Όμως όταν θέλουμε κείμενο και εικόνα να εμφανίζονται στα δύο άκρα, μια απλή στοίχιση δεν αρκεί.

Για παράδειγμα, αν θέλουμε να φτιάξουμε μια επάνω μπάρα σαν αυτή του [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), με το εικονίδιο του site αριστερά και το εικονίδιο μενού δεξιά:

![Swift](../../RESOURCE/003_alignment3.png)

Αν χρησιμοποιήσουμε μόνο `alignment`, και τα δύο εικονίδια θα εμφανιστούν στην ίδια πλευρά. Δεν μπορούμε να τα μοιράσουμε αριστερά και δεξιά, οπότε χρειαζόμαστε `Spacer` για να κατανεμηθεί ο υπόλοιπος χώρος.

Το `Spacer` είναι μια ευέλικτη view διάταξης που γεμίζει αυτόματα τον διαθέσιμο χώρο που περισσεύει.

Χρήση:

```swift
Spacer()
```

Για παράδειγμα:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Όταν προσθέτουμε ένα `Spacer` ανάμεσα στο `Image` και το `Text`, το `Spacer` γεμίζει τον υπόλοιπο χώρο και σπρώχνει το `Image` προς τα πάνω και το `Text` προς τα κάτω.

![Swift](../../RESOURCE/003_view1.png)

Αν υπάρχουν πολλά `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

τότε ο διαθέσιμος χώρος μοιράζεται ισόποσα μεταξύ τους.

![Swift](../../RESOURCE/003_spacer.png)

## Εμφάνιση εικόνων και έλεγχος μεγέθους

Η `Image` view χρησιμοποιείται κυρίως για να εμφανίζει εικόνες. Τα εικονίδια SF Symbols που μάθαμε στο προηγούμενο μάθημα είναι απλώς μία από τις χρήσεις της `Image`.

Χρήση:

```swift
Image("imageName")
```

Μέσα στα διπλά εισαγωγικά μπαίνει το όνομα της εικόνας, χωρίς να χρειάζεται η κατάληξη αρχείου.

### Εμφάνιση εικόνας

Αρχικά ετοιμάζουμε μία εικόνα.

![Swift](../../RESOURCE/003_img.jpg)

Στο Xcode επιλέγουμε τον φάκελο πόρων `Assets` και σύρουμε την εικόνα μέσα εκεί.

![Swift](../../RESOURCE/003_img1.png)

Στο `ContentView` μπορούμε να εμφανίσουμε την εικόνα με `Image`:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Σημείωση: Η `Image` του SwiftUI δεν υποστηρίζει αναπαραγωγή GIF animation· μπορεί να εμφανίσει μόνο στατικό frame.

### Έλεγχος μεγέθους εικόνας

Στο SwiftUI, η `Image` εμφανίζεται από προεπιλογή στο αρχικό της μέγεθος. Αν θέλουμε να αλλάξουμε το μέγεθος εμφάνισης, πρέπει πρώτα να χρησιμοποιήσουμε `resizable` ώστε το περιεχόμενο να μπορεί να αλλάξει κλίμακα και μετά `frame` για να ορίσουμε το μέγεθος διάταξης.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Ο modifier resizable

Ο modifier `resizable` επιτρέπει στην εικόνα να κλιμακώνεται μέσα στο layout, αντί να παραμένει πάντα στο αρχικό της μέγεθος.

```swift
.resizable()
```

Μόνο αν προσθέσουμε `resizable()`, το `frame` μπορεί να αλλάξει πραγματικά το εμφανιζόμενο μέγεθος της εικόνας.

Αν παραλείψουμε το `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

τότε το `frame` προσφέρει μόνο χώρο διάταξης, αλλά η ίδια η εικόνα δεν αλλάζει μέγεθος.

### Ο modifier frame

Το `frame(width:height:)` χρησιμοποιείται για να ορίσει το πλάτος και το ύψος μιας view.

Βασική χρήση:

```swift
.frame(width: 10, height: 10)
```

Για παράδειγμα, αν θέλουμε να κάνουμε την εικόνα ένα ορθογώνιο με `width` 300 και `height` 100:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Μπορούμε επίσης να ορίσουμε μόνο πλάτος ή μόνο ύψος:

```swift
.frame(width: 200)
.frame(height: 100)
```

Ο συνδυασμός `resizable + frame` μας επιτρέπει να ελέγχουμε ευέλικτα το μέγεθος της εικόνας στην οθόνη, διατηρώντας παράλληλα τη δυνατότητα κλιμάκωσης.

### Αναλογία κλίμακας: scaledToFit και scaledToFill

Όταν ορίζουμε με `frame` αναλογία πλάτους και ύψους που δεν ταιριάζει με την αρχική αναλογία της εικόνας, η εικόνα μπορεί να παραμορφωθεί.

Αν θέλουμε η εικόνα να διατηρεί την αναλογία της και ταυτόχρονα να προσαρμόζεται στον διαθέσιμο χώρο, μπορούμε να χρησιμοποιήσουμε `scaledToFit` ή `scaledToFill`.

**scaledToFit**

Το `scaledToFit` διατηρεί την αρχική αναλογία πλάτους-ύψους της εικόνας και την κλιμακώνει ώστε να χωρά πλήρως στον διαθέσιμο χώρο χωρίς περικοπή:

```swift
.scaledToFit()
```

ή

```swift
.aspectRatio(contentMode: .fit)
```

Αυτός ο τρόπος είναι κατάλληλος όταν θέλουμε να εμφανίζεται ολόκληρη η εικόνα χωρίς παραμόρφωση.

Αν όλες οι εικόνες έχουν το ίδιο πλάτος και ύψος, είναι πολύ πιθανό να εμφανιστεί παραμόρφωση.

Για παράδειγμα:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Χωρίς ρύθμιση κλίμακας, η εικόνα δεν μπορεί να εμφανιστεί με την αρχική της αναλογία.

![Swift](../../RESOURCE/003_img4.png)

Με το `scaledToFit`, η εικόνα διατηρεί την αρχική της αναλογία.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

Το `scaledToFill` επίσης διατηρεί την αναλογία της εικόνας, αλλά γεμίζει ολόκληρο τον διαθέσιμο χώρο. Αν η αναλογία δεν ταιριάζει, το κομμάτι που περισσεύει περικόπτεται:

```swift
.scaledToFill()
```

ή

```swift
.aspectRatio(contentMode: .fill)
```

Αυτός ο τρόπος είναι κατάλληλος όταν θέλουμε η εικόνα να καλύπτει πλήρως μια περιοχή, για παράδειγμα ως background image ή banner.

**Η διαφορά μεταξύ τους**

![Swift](../../RESOURCE/003_img6.png)

## Κείμενο

Στο SwiftUI, το `Text` χρησιμοποιείται για την εμφάνιση κειμένου.

Βασική χρήση:

```swift
Text("FangJunyu")
```

Στο προηγούμενο μάθημα γνωρίσαμε ήδη το `Text`. Σε αυτό το μάθημα θα δούμε πιο αναλυτικά πώς μπορούμε να ελέγξουμε το μέγεθος και το πάχος της γραμματοσειράς, ώστε το κείμενο να γίνεται πιο εκφραστικό μέσα στη view.

### Μέγεθος γραμματοσειράς

Με τον modifier `font` μπορούμε να ελέγξουμε το μέγεθος του κειμένου:

```swift
.font(.title)
```

Για παράδειγμα:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Συχνά χρησιμοποιούμενα μεγέθη γραμματοσειράς, από μεγαλύτερο προς μικρότερο:

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Πάχος γραμματοσειράς

Αν θέλουμε το κείμενο να γίνει έντονο, μπορούμε να χρησιμοποιήσουμε τον modifier `fontWeight`:

```swift
.fontWeight(.bold)
```

Για παράδειγμα:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Συχνά χρησιμοποιούμενα βάρη γραμματοσειράς, από πιο λεπτό σε πιο παχύ:

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

Το `font` ελέγχει το μέγεθος της γραμματοσειράς και το `fontWeight` το πάχος της. Μπορούν να συνδυαστούν για να κάνουν το κείμενο πιο εκφραστικό.

## Σύνοψη και πρακτική

Μέχρι εδώ έχουμε μάθει τον προεπιλεγμένο μηχανισμό layout του SwiftUI, το `Spacer`, το `Image` και το `Text`. Αυτές οι γνώσεις αρκούν ήδη για να φτιάξουμε μερικές απλές views.

Για παράδειγμα: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Η διεπαφή του Google είναι πολύ καθαρή. Περιλαμβάνει εικόνες και κείμενο. Μπορούμε να δοκιμάσουμε να την αναλύσουμε από τη σκοπιά του SwiftUI:

1. Συνολικά χωρίζεται σε τρία μέρη: το λογότυπο Google, το πεδίο αναζήτησης και το κείμενο των οδηγιών. Μπορούμε να χρησιμοποιήσουμε `VStack` για κάθετη διάταξη.
2. Το λογότυπο Google είναι μια εικόνα, άρα μπορεί να εμφανιστεί με `Image`.
3. Το πεδίο αναζήτησης περιέχει ένα input field και ένα εικονίδιο. Αν αγνοήσουμε προσωρινά το input field, μπορούμε να εμφανίσουμε το εικονίδιο αναζήτησης με `Image`.
4. Το ενημερωτικό κείμενο εμφανίζεται με `Text`. Η οριζόντια διάταξη του κειμένου μπορεί να γίνει με `HStack`, και το χρώμα του μπορεί να ελεγχθεί με `foregroundStyle`.

Μέσα από την εξάσκηση αυτών των γνώσεων μπορούμε να δημιουργήσουμε μερικές απλές views και να εμβαθύνουμε στην κατανόηση του `Image`, του `Text` και των modifiers τους.
