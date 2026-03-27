# Culori spectaculoase

În această lecție vom învăța câțiva modificatori vizuali comuni din SwiftUI, inclusiv:

- culoarea
- culoarea de prim-plan
- culoarea de fundal
- deplasarea
- transparența
- blur-ul

Vom învăța și despre Safe Area (zona de siguranță).

Acești modificatori sunt folosiți pentru a controla aspectul vizual al view-urilor, făcând interfața mai clară și mai bine structurată.

## Culoarea

În SwiftUI, putem seta culoarea textului.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
````

`.blue` înseamnă albastru și este, de fapt, forma prescurtată a lui `Color.blue` (prin inferență de tip).

Culori comune includ:

```id="md8nv0"
.black
.green
.yellow
.pink
.gray
...
```

Toate acestea sunt proprietăți statice ale lui `Color`.

![Color](../../RESOURCE/006_color.png)

Poți înțelege `Color` ca pe un tip de culoare, iar `.blue`, `.red` și altele sunt culorile sale concrete.

### View-ul Color

În SwiftUI, `Color` poate fi afișat și ca view.

```swift id="qjh4ya"
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Acest cod va genera un pătrat roșu de 100 × 100.

De asemenea, putem face ca întreaga interfață să afișeze o anumită culoare:

```swift id="06jihn"
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

După rulare, putem observa că roșul nu umple întregul ecran; partea de sus și partea de jos a iPhone-ului rămân albe. Aici intervine existența Safe Area (zona de siguranță).

## Safe Area (zona de siguranță)

Safe Area este zona rezervată de sistem pentru a evita ca elementele de conținut să fie acoperite, incluzând:

1. bara de stare din partea de sus (ora, bateria)

2. bara indicatoare Home din partea de jos

3. zona notch-ului sau Dynamic Island

![Color](../../RESOURCE/006_color3.png)

În mod implicit, SwiftUI limitează conținutul în interiorul zonei de siguranță, astfel încât view-urile să nu se extindă până la marginile ecranului.

### Ignorarea Safe Area

Dacă vrei ca o culoare să umple întregul ecran, poți folosi `ignoresSafeArea`:

```swift id="e97g4i"
Color.red
    .ignoresSafeArea()
```

sau poți folosi `edgesIgnoringSafeArea`:

```swift id="zu8hkc"
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Astfel, view-ul se va extinde pe întreaga suprafață a ecranului.

Trebuie remarcat că `edgesIgnoringSafeArea` este o sintaxă mai veche, iar începând cu iOS 14 este recomandat să folosim `ignoresSafeArea`.

## Culoarea de prim-plan

### Modificatorul foregroundStyle

În lecțiile anterioare, am învățat să folosim `foregroundStyle` pentru a seta culoarea.

De exemplu:

```swift id="218eku"
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` face parte din noul sistem de stiluri și suportă culori, gradienți, materiale și altele.

![Color](../../RESOURCE/006_color2.png)

### Modificatorul foregroundColor

`foregroundColor` poate fi folosit și el pentru a seta culoarea:

```swift id="v50x4b"
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Modul de utilizare este același ca la `foregroundStyle`.

În cele mai noi versiuni de Xcode, Xcode avertizează că `foregroundColor` poate fi depreciat în versiunile viitoare de iOS, așa că este recomandat să folosim cu prioritate `foregroundStyle`.

## Fundalul

Dacă vrem să adăugăm o culoare de fundal unui view, putem folosi `background`:

```swift id="hjlwm3"
background(.red)
```

De exemplu, pentru a adăuga o culoare de fundal unui text:

```swift id="lxstpd"
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

În aplicații precum Word sau Chrome, atunci când selectăm text, putem vedea un efect de culoare de fundal asemănător.

![Color](../../RESOURCE/006_color16.png)

Dacă vrem să extindem fundalul, trebuie să combinăm cu `padding`:

```swift id="a0dljm"
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Aici trebuie observată o regulă importantă:

În SwiftUI, modificatorii construiesc view-ul de sus în jos. Modificatorii scriși mai jos acționează asupra rezultatului celor scriși mai sus.

Așadar:

```swift id="pknx7y"
.padding()
.background()
```

Aceasta înseamnă că fundalul va învălui view-ul după ce i-a fost adăugat padding-ul intern.

Dacă inversăm ordinea:

```swift id="aa4roz"
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

fundalul nu se va extinde, deoarece nu învăluie padding-ul adăugat ulterior.

## Exemplu - piuliță pătrată cu centru rotund

Acum vom realiza un view simplu care seamănă cu o piuliță pătrată cu centru rotund.

![Color](../../RESOURCE/006_color8.png)

Mai întâi creăm un pătrat alb de 50 × 50:

```swift id="d2m34b"
Color.white
    .frame(width: 50, height: 50)
```

Dacă vrem să-l transformăm într-un cerc, putem folosi `cornerRadius`:

```swift id="j452uj"
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Când raza colțurilor este egală cu jumătate din lățime și înălțime, forma devine un cerc.

Acum adăugăm un fundal albastru:

```swift id="98m2ef"
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

`padding`-ul nou adăugat extinde zona exterioară, iar `background` desenează albastrul pe acea zonă exterioară.

Astfel am obținut efectul unei piulițe pătrate cu centru rotund.

### O altă abordare

Pe lângă utilizarea culorii de fundal pentru a crea piulița pătrată, putem folosi și `ZStack`.

Am învățat anterior că `ZStack` permite aranjarea prin suprapunere, iar această formă poate fi înțeleasă și ca suprapunerea unui cerc peste un dreptunghi.

```swift id="5v8lcm"
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` suprapune view-urile în ordine, iar view-urile adăugate mai târziu apar deasupra.

## Exemplu - două cercuri suprapuse

Multe pictograme sunt compuse din suprapunerea unor forme simple, de exemplu două cercuri suprapuse.

![Color](../../RESOURCE/006_color14.png)

Mai întâi, creăm două cercuri:

```swift id="zwz4us"
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Deoarece vrem ca cele două cercuri să fie afișate suprapus, folosim layout-ul `ZStack`:

```swift id="11prcv"
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

În acest moment, cele două cercuri cu aceeași dimensiune se suprapun complet.

Noi vrem ca cele două cercuri să se suprapună doar parțial, nu să se acopere complet. Pentru asta putem folosi `offset` pentru a crea un efect de deplasare.

## Deplasarea

`offset` schimbă doar poziția de desenare a view-ului, fără a afecta calculul de layout al view-ului părinte.

Mod de utilizare:

```swift id="w9q71d"
.offset(x:y:)
```

`x` reprezintă deplasarea pe direcția orizontală, iar `y` reprezintă deplasarea pe direcția verticală.

Valorile pozitive înseamnă deplasare spre dreapta / în jos, iar valorile negative înseamnă deplasare spre stânga / în sus.

Folosim `offset` pentru a face ca cele două cercuri să se suprapună parțial:

```swift id="m9j8u5"
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

Poziția cercului roșu în layout nu s-a schimbat, dar poziția sa de desenare s-a mutat cu 25 de puncte spre stânga. Astfel, cele două cercuri creează un efect vizual de suprapunere parțială.

## Transparența

În SwiftUI, `opacity` este folosit pentru a seta transparența unui view.

Utilizare de bază:

```swift id="t80jwp"
.opacity(0.5)
```

Valoarea parametrului pentru `opacity` este între 0.0 și 1.0, unde:

* 0 înseamnă complet transparent
* 1 înseamnă complet opac

Putem folosi `opacity` pentru a seta transparența cercului portocaliu:

```swift id="wvjbo4"
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

După ce setăm `opacity` al cercului portocaliu la 0.8, opacitatea acestuia devine 80%, iar atunci când cele două cercuri se suprapun, zona suprapusă produce un efect de amestec de culori.

## Blur

În SwiftUI, putem folosi `blur` pentru a aplica un efect de blur:

```swift id="z5zjlwm"
.blur(radius:10)
```

`radius` definește raza blur-ului. Cu cât valoarea este mai mare, cu atât efectul de blur este mai evident.

Putem adăuga efect de blur celor două cercuri:

```swift id="1to6by"
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

În final, putem vedea două cercuri foarte estompate.

## Rezumat

Această lecție s-a concentrat pe modificatorii vizuali comuni din SwiftUI și pe modul în care putem controla culoarea, poziția și efectele vizuale ale view-urilor prin intermediul modificatorilor.

Prin exemple concrete, putem vedea rolul practic al diferiților modificatori vizuali în interfață și am înțeles, de asemenea, conceptul de zonă de siguranță.

Toți aceștia sunt modificatori foarte de bază. Cu cât îi exersăm și îi folosim mai mult, cu atât vom putea controla mai clar efectele interfeței în dezvoltarea reală.

### Exerciții după lecție

* adaugă unei imagini efecte de transparență și blur
* setează trei cercuri suprapuse cu niveluri diferite de transparență
* creează o imagine de fundal care umple întregul ecran și ignoră zona de siguranță
* folosește `offset` pentru a ajusta poziția mai multor view-uri

Scopul exercițiilor nu este să memorezi API-uri, ci să observi relația dintre schimbările vizuale și comportamentul layout-ului.
