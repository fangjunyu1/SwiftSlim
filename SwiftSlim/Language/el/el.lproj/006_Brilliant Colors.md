# Ζωντανά χρώματα

Σε αυτό το μάθημα θα μάθουμε συνηθισμένους οπτικούς modifiers στο SwiftUI, όπως:

- Χρώμα
- Foreground color
- Background color
- Offset
- Διαφάνεια
- Blur

Θα μάθουμε επίσης το Safe Area.

Αυτοί οι modifiers χρησιμοποιούνται για να ελέγχουν την εμφάνιση μιας view, ώστε η διεπαφή να γίνεται πιο καθαρή και πιο οργανωμένη οπτικά.

## Χρώμα

Στο SwiftUI μπορούμε να ορίσουμε το χρώμα του κειμένου.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Το `.blue` σημαίνει μπλε και στην πραγματικότητα είναι συντομευμένη μορφή του `Color.blue` μέσω type inference.

Συνηθισμένα χρώματα περιλαμβάνουν:

```text
.black
.green
.yellow
.pink
.gray
...
```

Όλα αυτά είναι static properties του `Color`.

![Color](../../RESOURCE/006_color.png)

Μπορούμε να θεωρήσουμε το `Color` ως τον τύπο του χρώματος, ενώ τα `.blue`, `.red` κτλ. είναι συγκεκριμένες τιμές αυτού του τύπου.

### Η Color view

Στο SwiftUI το `Color` μπορεί επίσης να εμφανιστεί και ως view.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Αυτός ο κώδικας δημιουργεί ένα κόκκινο τετράγωνο 100×100.

Μπορούμε ακόμη και να εμφανίσουμε ολόκληρη την οθόνη σε ένα συγκεκριμένο χρώμα:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Όταν το τρέξουμε, θα δούμε ότι το κόκκινο δεν καλύπτει όλη την οθόνη. Στο πάνω και κάτω μέρος του iPhone παραμένουν λευκές περιοχές, κάτι που σχετίζεται με το Safe Area.

## Safe Area

Το Safe Area είναι η περιοχή που κρατά το σύστημα ελεύθερη ώστε το περιεχόμενο να μην καλύπτεται, και περιλαμβάνει:

1. Τη γραμμή κατάστασης στο πάνω μέρος, όπως ώρα και μπαταρία
2. Τη γραμμή Home στο κάτω μέρος
3. Την περιοχή notch ή Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Από προεπιλογή, το SwiftUI περιορίζει το περιεχόμενο μέσα στο Safe Area, οπότε τα views δεν επεκτείνονται μέχρι τα άκρα της οθόνης.

### Αγνόηση του Safe Area

Αν θέλουμε ένα χρώμα να καλύπτει ολόκληρη την οθόνη, μπορούμε να χρησιμοποιήσουμε `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

ή `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Έτσι το view θα εκτείνεται σε όλη την οθόνη.

Αξίζει να προσέξουμε ότι το `edgesIgnoringSafeArea` είναι η παλαιότερη σύνταξη. Από το iOS 14 και μετά, συνιστάται η χρήση του `ignoresSafeArea`.

## Foreground color

### Ο modifier foregroundStyle

Σε προηγούμενα μαθήματα έχουμε ήδη μάθει ότι το `foregroundStyle` μπορεί να χρησιμοποιηθεί για ρύθμιση χρώματος.

Για παράδειγμα:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Το `foregroundStyle` είναι το πιο σύγχρονο σύστημα styling και υποστηρίζει όχι μόνο χρώματα, αλλά και gradients, materials κτλ.

![Color](../../RESOURCE/006_color2.png)

### Ο modifier foregroundColor

Το `foregroundColor` μπορεί επίσης να χρησιμοποιηθεί για να ορίσει χρώμα:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Η χρήση του είναι παρόμοια με το `foregroundStyle`.

Στις νεότερες εκδόσεις του Xcode, το ίδιο το Xcode προειδοποιεί ότι το `foregroundColor` ενδέχεται να καταργηθεί σε μελλοντικές εκδόσεις του iOS, γι’ αυτό συνιστάται να προτιμούμε το `foregroundStyle`.

## Background

Αν θέλουμε να προσθέσουμε χρώμα φόντου σε ένα view, μπορούμε να χρησιμοποιήσουμε `background`:

```swift
background(.red)
```

Για παράδειγμα, για να προσθέσουμε background color σε ένα κείμενο:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Όταν επιλέγουμε κείμενο σε εφαρμογές όπως Word ή Chrome, βλέπουμε παρόμοιο εφέ background color.

![Color](../../RESOURCE/006_color16.png)

Αν θέλουμε το background να μεγαλώσει, χρειάζεται να το συνδυάσουμε με `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Εδώ υπάρχει ένας πολύ σημαντικός κανόνας:

Στο SwiftUI οι modifiers χτίζουν τη view από πάνω προς τα κάτω. Ο modifier που γράφεται αργότερα εφαρμόζεται στο αποτέλεσμα των προηγούμενων modifiers.

Άρα:

```swift
.padding()
.background()
```

σημαίνει ότι το background αγκαλιάζει το view αφού πρώτα έχει προστεθεί το εσωτερικό περιθώριο.

Αν αντιστρέψουμε τη σειρά:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

τότε το background δεν μεγαλώνει, επειδή δεν περιλαμβάνει το μεταγενέστερο `padding`.

## Παράδειγμα - τετράγωνο παξιμάδι

Τώρα θα φτιάξουμε ένα απλό view που μοιάζει με τετράγωνο παξιμάδι.

![Color](../../RESOURCE/006_color8.png)

Αρχικά δημιουργούμε ένα λευκό τετράγωνο 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Αν θέλουμε να το κάνουμε κυκλικό, μπορούμε να χρησιμοποιήσουμε `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Όταν η ακτίνα της γωνίας ισούται με το μισό του πλάτους και του ύψους, το αποτέλεσμα γίνεται κύκλος.

Τώρα προσθέτουμε ένα μπλε background:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Το επιπλέον `padding` μεγαλώνει την εξωτερική περιοχή, και το `background` σχεδιάζει το μπλε χρώμα σε αυτή την εξωτερική περιοχή.

Έτσι έχουμε ολοκληρώσει το εφέ ενός τετράγωνου παξιμαδιού.

### Μια άλλη προσέγγιση

Εκτός από το background color, μπορούμε επίσης να υλοποιήσουμε το τετράγωνο παξιμάδι με `ZStack`.

Προηγουμένως είδαμε ότι το `ZStack` επιτρέπει επικάλυψη. Το τετράγωνο παξιμάδι μπορεί να θεωρηθεί και ως συνδυασμός ενός κύκλου και ενός ορθογωνίου που εμφανίζονται το ένα πάνω στο άλλο.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

Το `ZStack` τοποθετεί τα views διαδοχικά το ένα πάνω στο άλλο, και τα views που προστίθενται αργότερα εμφανίζονται στο επάνω επίπεδο.

## Παράδειγμα - δύο επικαλυπτόμενοι κύκλοι

Πολλά εικονίδια αποτελούνται από επικάλυψη απλών σχημάτων, όπως δύο επικαλυπτόμενοι κύκλοι.

![Color](../../RESOURCE/006_color14.png)

Αρχικά, δημιουργούμε δύο κύκλους:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Επειδή θέλουμε να εμφανίζονται ο ένας πάνω στον άλλο, χρησιμοποιούμε `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Σε αυτό το σημείο, οι δύο κύκλοι με ίδιο μέγεθος επικαλύπτονται πλήρως.

Εμείς όμως θέλουμε να επικαλύπτονται μερικώς, όχι να καλύπτει ο ένας πλήρως τον άλλον. Για αυτό μπορούμε να χρησιμοποιήσουμε `offset`.

## Offset

Το `offset` αλλάζει μόνο τη θέση σχεδίασης της view και δεν επηρεάζει τον υπολογισμό layout του parent view.

Χρήση:

```swift
.offset(x:y:)
```

Το `x` είναι η οριζόντια μετατόπιση και το `y` η κάθετη μετατόπιση.

Θετικές τιμές σημαίνουν μετατόπιση δεξιά / κάτω, ενώ αρνητικές σημαίνουν αριστερά / πάνω.

Χρησιμοποιώντας `offset`, μπορούμε να κάνουμε τους δύο κύκλους να επικαλύπτονται μερικώς:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Η θέση του κόκκινου κύκλου στο layout δεν αλλάζει, αλλά η θέση σχεδίασής του μετακινείται 25 points προς τα αριστερά. Έτσι προκύπτει οπτικά μια μερική επικάλυψη.

## Διαφάνεια

Στο SwiftUI, το `opacity` χρησιμοποιείται για να ορίσει τη διαφάνεια μιας view.

Βασική χρήση:

```swift
.opacity(0.5)
```

Η τιμή του `opacity` κυμαίνεται από 0.0 έως 1.0:

- `0` σημαίνει πλήρως διαφανές
- `1` σημαίνει πλήρως αδιαφανές

Μπορούμε να χρησιμοποιήσουμε `opacity` για να ρυθμίσουμε τη διαφάνεια του πορτοκαλί κύκλου:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Όταν το `opacity` του πορτοκαλί κύκλου ορίζεται στο 0.8, η αδιαφάνειά του είναι 80%. Όταν οι δύο κύκλοι επικαλύπτονται, στην περιοχή επικάλυψης εμφανίζεται ένα εφέ ανάμειξης χρωμάτων.

## Blur

Στο SwiftUI μπορούμε να χρησιμοποιήσουμε `blur` για εφέ θολώματος:

```swift
.blur(radius:10)
```

Το `radius` ορίζει την ακτίνα του blur. Όσο μεγαλύτερη είναι η τιμή, τόσο πιο έντονο είναι το θόλωμα.

Μπορούμε να προσθέσουμε blur στους δύο κύκλους:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Στο τέλος βλέπουμε δύο πολύ θολούς κύκλους.

## Σύνοψη

Σε αυτό το μάθημα επικεντρωθήκαμε στους συνηθισμένους οπτικούς modifiers του SwiftUI και μάθαμε πώς μπορούμε μέσω modifiers να ελέγχουμε το χρώμα, τη θέση και τα οπτικά εφέ μιας view.

Μέσα από συγκεκριμένα παραδείγματα είδαμε πώς επηρεάζουν τη διεπαφή διαφορετικοί visual modifiers και γνωρίσαμε επίσης την έννοια του Safe Area.

Όλα αυτά είναι πολύ βασικοί modifiers. Αν εξασκούμαστε συχνά μαζί τους και τους χρησιμοποιούμε περισσότερο, θα μας βοηθήσουν να ελέγχουμε πολύ πιο καθαρά το αποτέλεσμα της διεπαφής στην πραγματική ανάπτυξη.

### Ασκήσεις μετά το μάθημα

- Πρόσθεσε διαφάνεια και blur σε μια εικόνα
- Ρύθμισε τρεις επικαλυπτόμενους κύκλους με διαφορετικό opacity
- Δημιούργησε μια εικόνα φόντου που να καλύπτει όλη την οθόνη και να αγνοεί το Safe Area
- Χρησιμοποίησε `offset` για να αλλάξεις τη θέση πολλών views

Ο στόχος αυτών των ασκήσεων δεν είναι να απομνημονεύσεις API, αλλά να παρατηρήσεις τη σχέση ανάμεσα στις οπτικές αλλαγές και στη συμπεριφορά του layout.
