# Simulatorul și dispozitivul fizic

Până în acest moment, am finalizat construirea view-urilor de bază. Conținutul principal al acestei lecții este să învățăm cum să rulăm aplicația atât pe simulator, cât și pe un dispozitiv fizic (Physical Device).

Îmi amintesc și acum cât de fericit am fost prima dată când am instalat o aplicație pe iPhone, pentru că am putut vedea mult mai direct rezultatul muncii mele de dezvoltare. Acesta este un tip de feedback pozitiv: atunci când putem folosi aplicația dezvoltată de noi înșine, interesul ne împinge să învățăm în mod natural și mai multe lucruri.

Acum, te rog să deschizi proiectul de CV personal finalizat în lecția anterioară și să te pregătești pentru rularea pe simulator și pe dispozitiv fizic.

## Simulatorul

Xcode include mai multe simulatoare, care acoperă diferite modele de iPhone, iPad și Apple Watch. Simulatorul poate verifica diferențele de layout ale aplicației pe modele sau versiuni diferite.

### Alegerea simulatorului

În lista de dispozitive din bara de instrumente de sus a Xcode, selectează un simulator (de exemplu iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### Rularea în simulator

Apoi apasă pe butonul Run din colțul stânga sus.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode va construi automat proiectul și va porni simulatorul.

![Swift](../../RESOURCE/005_xcode2.png)

### Închiderea simulatorului

Dacă trebuie să închizi simulatorul, apasă pe butonul Stop din bara de instrumente a Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Poți de asemenea să închizi direct simulatorul:

![Swift](../../RESOURCE/005_xcode17.png)

Dacă închizi direct simulatorul, Xcode poate afișa mesajul:

``` id="r4x29v"
Thread 1: signal SIGTERM
````

De obicei, aceasta nu este o eroare de logică a programului, ci apare deoarece procesul de depanare a fost terminat extern. În general, poate fi ignorată și nu aparține erorilor de logică ale aplicației.

În comparație cu previzualizarea din Xcode, simulatorul este mai apropiat de mediul real de execuție. Totuși, el nu este încă un mediu complet de dispozitiv real. Este potrivit pentru verificarea layout-ului și testele de adaptare la mai multe modele.

## Despre prioritatea mediilor de testare

În fluxul real de dezvoltare, ar trebui urmată următoarea ordine de testare:

dispozitiv fizic > simulator > previzualizare Xcode

Previzualizarea este potrivită pentru ajustarea rapidă a UI-ului; simulatorul este potrivit pentru testarea structurală; validarea finală trebuie făcută pe dispozitiv fizic, mai ales pentru operațiuni legate de iCloud.

## Dispozitivul fizic

Atât previzualizarea din Xcode, cât și simulatorul pot avea situații în care afișarea nu este complet exactă, de aceea dispozitivul fizic are o importanță decisivă. Comportamente precum permisiunile de sistem, performanța și mecanismele de notificare pot fi verificate complet doar pe dispozitivul fizic.

### Activarea Developer Mode

Pe iPhone:

Settings → Privacy & Security → Developer Mode → On

![Swift](../../RESOURCE/005_xcode4.png)

Sistemul va forța repornirea dispozitivului. Dacă Developer Mode nu este activat, depanarea și rularea nu vor fi posibile.

### Configurarea echipei de dezvoltare

Xcode trebuie să aibă configurată o echipă de dezvoltare, altfel aplicația nu poate fi semnată și instalată.

Pașii de configurare:

numele proiectului → TARGETS → Signing & Capabilities → Team

Dacă este afișat „Add Account...”, înseamnă că încă nu a fost adăugat un cont Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Apasă pe butonul de adăugare și autentifică-te cu Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

După autentificarea cu Apple ID, selectează contul corespunzător pentru a finaliza configurarea echipei de dezvoltare.

![Swift](../../RESOURCE/005_xcode7.png)

### Conectarea dispozitivului

Conectează iPhone-ul la Mac folosind un cablu.

La prima conectare:

* Mac-ul va întreba dacă dorești să conectezi iPhone-ul la acest Mac
* iPhone-ul va întreba dacă ai încredere în acest computer.

Trebuie să apeși „Trust” pe iPhone și să introduci codul de deblocare. Apoi, selectează iPhone-ul tău din lista de dispozitive din Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Apasă pe butonul Run din colțul stânga sus.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode va construi proiectul și va instala aplicația pe iPhone.

![Swift](../../RESOURCE/005_view.png)

**Depanare wireless**

În iOS 11 și versiunile ulterioare, Xcode suportă depanarea wireless.

![Swift](../../RESOURCE/005_xcode18.png)

Condițiile necesare:

1. iPhone-ul și Mac-ul trebuie împerecheate prima dată folosind un cablu de date
2. iPhone-ul și Mac-ul trebuie să fie în aceeași rețea Wi-Fi
3. ambele dispozitive trebuie să rămână deblocate

După ce prima împerechere este realizată prin cablu, ulterior, chiar dacă scoți cablul, atâta timp cât sunt în aceeași rețea, aplicația poate fi rulată direct.

Atenție:

* dacă dispozitivul nu apare în lista de dispozitive, poți reconecta cablul
* depanarea prin Wi-Fi este uneori instabilă; dacă apar probleme de conexiune, reconectează prin cablu
* în rețele de companie sau rețele izolate, această funcție poate fi restricționată

## Erori frecvente și soluții

Atunci când Xcode se conectează la iPhone pentru depanare, pot apărea diferite tipuri de erori. Mai jos sunt enumerate câteva probleme frecvente și soluțiile corespunzătoare, care te pot ajuta să localizezi și să rezolvi rapid problemele de conexiune.

**1. Împerecherea nu este finalizată**

```id="ssdrtl"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Aceasta înseamnă că procesul de împerechere pentru depanare dintre Xcode și iPhone nu este încă finalizat.

Soluție: confirmă că ai apăsat „Trust” pe iPhone. Dacă eroarea persistă, repornește Xcode și reconectează dispozitivul.

**2. Echipa de dezvoltare nu este configurată**

```id="1i74te"
Signing for "SwiftSlimTest" requires a development team.
```

Este posibil să nu fie configurată o echipă de dezvoltare.

Soluție: în `Signing & Capabilities`, selectează contul autentificat.

**3. Developer Disk Image nu poate fi montată**

```id="l49ryh"
Previous preparation error: The developer disk image could not be mounted on this device.
```

Aceasta apare de obicei atunci când procesul de instalare a fost întrerupt (de exemplu, scoaterea cablului sau oprirea forțată), ceea ce provoacă restricții și erori la reinstalare.

Soluție: repornește iPhone-ul și reconectează-l prin cablu.

**4. Conexiunea tunelului de depanare a eșuat**

```id="emk77z"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Această eroare este frecvent cauzată de interferența VPN-ului sau a unui proxy de rețea.

Soluție: dezactivează VPN-ul sau proxy-ul de rețea și încearcă din nou.

**5. Dispozitivul nu este deblocat**

```id="f3sljm"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Dispozitivul este în stare de blocare a ecranului. Este suficient să deblochezi iPhone-ul.

**6. Dispozitivul nu este înregistrat**

```id="po4925"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Aceasta înseamnă că dispozitivul nu a fost adăugat în lista de dispozitive a contului de dezvoltator, iar Xcode nu poate genera un provisioning profile valid pentru a semna și instala aplicația.

Soluție: apasă pe „Register Device” pentru a-l înregistra automat.

**7. Nepotrivire între versiunile de deployment**

```id="2n6ihm"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Acest mesaj arată că versiunea de sistem a dispozitivului este mai mică decât versiunea minimă de deployment a proiectului.

Calea de modificare:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Ajustează versiunea astfel încât să nu fie mai mare decât versiunea de sistem a dispozitivului.

După modificare, curăță folderul de build:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

După finalizarea curățării, rulează din nou aplicația.
