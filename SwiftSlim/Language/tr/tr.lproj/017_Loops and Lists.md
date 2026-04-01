# Donguler ve Listeler

Bu derste Swift'teki `for` dongusunu ve SwiftUI'deki `ForEach` yapisini ogrenecegiz.

Bunlarin ikisi de dizideki elemanlari sirayla okumamiza yardim eder. Gercek gelistirme surecinde bir veri grubunu tek tek alip islemek ya da gostermek zorunda kaliriz ve donguler tam olarak bunu yapmak icin onemli bir arac olur.

Web'de gezinirken ya da bir App kullanirken sik sik bircok liste ve oge goruruz. Bu tur icerikler genellikle once `dizi` icinde saklanir, sonra `dongu` ile tek tek okunur ve en sonunda arayuzde gosterilir.

Ornegin, Google'in arama sonucu listesi:

![Google](../../Resource/017_google.png)

Arama sonucundaki her bir oge genellikle bir veri kaydina karsilik gelir ve dongu yardimiyla tek tek gosterilir.

Bu nedenle `dizi` ve `dongu` cok sik birlikte gorulur. `Dizi` bir veri grubunu saklar, `dongu` ise bu verileri sirayla cikarir ve ayni islemi uygular.

Simdi once en temel `for` dongusunden baslayalim.

## Geri sayim

Diyelim ki bir geri sayim ozelligini taklit etmek istiyoruz ve sirasiyla `“5, 4, 3, 2, 1”` yazdiracagiz.

En dogrudan yazim su sekildedir:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Bu yontem geri sayimi taklit edebilir, ancak icerik fazla oldugunda cok tekrarli gorunur ve daha sonra degistirmesi de zor olur.

Bu durumda once veriyi bir diziye koyup sonra `for` dongusuyle tek tek yazdirabiliriz:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Bu yazim daha kisa ve daha kolay genisletilebilir. Geri sayimdaki rakamlar cok fazla olsa bile `print` satirlarini tek tek tekrar tekrar yazmamiz gerekmez; dongunun dizideki her elemani otomatik olarak islemesi yeterlidir.

Bu kodu test etmek icin bir dugmenin icine koyabiliriz:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Dugmeye tiklandiginda `for` dongusu dizideki siraya gore `countDown` icindeki her tam sayiyi tek tek alir ve konsola yazdirir.

Simdi `for` dongusunun nasil calistigina bakalim.

## for dongusu

`for` dongusu bir veri grubunu sira ile islemek icin kullanilir. En yaygin kullanim alanlari diziler ve araliklardir.

Temel yazim:

```swift
for eleman in diziVeyaAralik {
    calisacakKod
}
```

Ornegin, az onceki geri sayim kodu:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Buradaki `i` o anda alinmis olan elemani temsil eder. `in` sonrasinda ise uzerinde donulecek veri, yani `countDown` dizisi bulunur.

Bu kodun anlami sunudur: Program `countDown` dizisinden her elemani sirayla alir. Her eleman alindiginda onu gecici olarak `i` ile temsil eder ve sonra suslu parantezlerin icindeki kodu calistirir.

Calisma surecini soyle dusunebiliriz:

- Ilk alinan eleman `5` olur, bu yuzden o anda `i` degeri `5`'tir
- `print(i)` calisir ve `5` yazdirilir
- Sonra siradaki eleman olan `4` alinir
- `print(i)` bir kez daha calisir ve `4` yazdirilir

Ardindan `3`, `2` ve `1` de ayni sekilde sirasiyla islenir.

![for](../../Resource/017_for.png)

Dizideki tum elemanlar islendikten sonra `for` dongusu otomatik olarak biter.

`for` dongusunu kullanarak dizideki her elemani alabilir ve geri sayim gibi islemleri tamamlayabiliriz.

**Ipucu**: `i`, for dongulerinde o anda alinan elemani gostermek icin cok yaygin bir isimdir, ancak zorunlu degildir; baska Ingilizce adlar da kullanabilirsiniz.

Ornegin, her alinan elemani gostermek icin `num` kullanabiliriz:

```swift
for num in countDown {
    print(num)
}
```

Suslu parantezlerin icinde de o anda alinan elemani gostermek icin `num` kullanilir.

### Aralik uzerinde dongu

`for` dongusu sadece dizilerde degil, araliklarda da kullanilabilir.

Ornegin `50`'ye kadar olan pozitif tam sayilarin toplamini hesaplamak istedigimizde `1` ile `50` arasindaki tum tam sayilari tek tek toplamak gerekir.

En dogrudan yazim su olabilir:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Bu yazimin sorunu her sayiyi tek tek elimizle yazmak zorunda olmamizdir. Bu hem zahmetlidir hem de gercek gelistirme senaryolari icin uygun degildir.

Bu durumda aralik operatoru ile `for` dongusunu birlikte kullanabiliriz.

Onceki “Operatorler” bolumunde aralik operatorunu zaten gormustuk:

```swift
1...3   // 1, 2, 3
```

Burada `...` kapali araligi ifade eder; yani hem baslangic hem de bitis dahil edilir.

Bu nedenle burada `1` ile `50` arasindaki tam sayilar icin `for` dongusu kullanabiliriz:

```swift
for i in 1...50 {
    
}
```

Bu sayilari toplamak istedigimiz icin toplami saklayacak bir degiskene daha ihtiyacimiz vardir:

```swift
var count = 0
```

Sonra her dongu turunda o an alinan sayiyi `count`'a ekleriz:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Bu kod sunu ifade eder:

- `count` o anki toplami saklar
- `for` dongusu `1`'den `50`'ye kadar tam sayilari sirasiyla alir
- Her seferinde bir tam sayi alindiginda `count += i` calisir
- Dongu bittiginde `count` icinde son toplam saklanir.

Boylece `50`'ye kadar olan tum pozitif tam sayilarin toplamini elde edebiliriz.

Ayni sekilde `1`'den `100`'e kadar olan tam sayilarin toplamini hesaplamak istersek sadece araligi degistirmemiz yeterlidir:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` dongusu sadece dizilerde degil, bir aralik uzerinde de calisabilir. Veriyi sirasiyla tekrarli bicimde isleme yetenegi gelistirme surecinde cok yaygindir.

Bu sayede her sayinin toplama islemini veya benzer tekrarli islemleri tek tek yazmadan pek cok isi otomatik hale getirebiliriz.

## SwiftUI'de dongu

Az onceki `for` dongusu Swift diline aittir.

Ancak SwiftUI icinde gorunumu olustururken `for` dongusunu dogrudan kullanamayiz:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Cunku `VStack` icinde SwiftUI gorunumleri gerekir, normal `for` dongusu ise kendi basina bir gorunum degildir.

SwiftUI'de bir dizinin icerigine gore arayuzu tekrarli sekilde olusturmak istiyorsak `ForEach` kullanmamiz gerekir.

Ornegin, bir gruptaki tum uyelerin adlarini gostermek istersek soyle yazabiliriz:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Gorunumu:

![for1](../../Resource/017_for1.png)

Daha sonra her `Text` icin ayni modifier'lari ekleyelim:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Artik her `Text` daha kucuk ve daha kalin bir yazi tipiyle gorunur.

Gorunumu:

![](../../Resource/017_for2.png)

Modifier'lar arayuzu daha guzel gosterse de kodu daha uzun ve daha tekrarli hale getirir.

Isimler artmaya devam ederse ya da daha sonra yazi tipi, renk gibi stilleri topluca degistirmek istersek ayni kodu tekrar tekrar yazmamiz ve degistirmemiz gerekir. Bu da hem zahmetli olur hem de bakimi zorlastirir.

Bu noktada isimleri once diziye koyup sonra SwiftUI'deki `ForEach` ile dizideki veriye gore gorunumleri tekrarli sekilde olusturabiliriz:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Bu kod daha kisadir. `ForEach` dizideki her elemani tek tek okur ve ilgili icerigi arayuzde gosterir.

Daha sonra yeni isimler eklemek istedigimizde sadece `names` dizisini degistirmemiz yeterlidir; her seferinde yeniden `Text` ve karmaasik modifier'lar eklememiz gerekmez.

## ForEach

`ForEach`, SwiftUI'de gorunumleri tekrarli bicimde olusturmak icin kullanilan bir yapidir. Bunu SwiftUI icindeki `for` dongusune benzeyen bir yapi gibi dusunebilirsiniz.

Temel kullanim:

```swift
ForEach(dizi, id: \.self) { eleman in
    SwiftUIKodu
}
```

Ornegin, az onceki grup isimleri:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Bu kod sunu anlatir:

`names`, uzerinde donulen dizidir; yani gosterilecek veridir.

`id:\.self`, her elemani ayirt etmek icin dizideki elemanin kendisinin kullanildigi anlamina gelir.

Bu ornekte dizi string degerleri tutar:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Bu nedenle SwiftUI, farkli icerikleri ayirt etmek icin dogrudan "Sam", "John", "Wathon", "Bob" stringlerinin kendisini kullanir.

Baslangic seviyesinde sik gorulen String ve Int gibi basit diziler icin genellikle sunu yazmamiz yeterlidir:

```swift
id: \.self
```

Simdilik sadece bu yazimi hatirlamaniz yeterlidir; id ile ilgili daha fazla kurali derinlemesine bilmeniz gerekmez.

`item in` icindeki `item`, o anda alinan elemani temsil eder.

Ornegin, ilk dongude `item` `"Sam"` olur, ikinci dongude ise `item` `"John"` olur.

Bu nedenle:

```swift
Text(item)
```

Sirayla su hale gelir:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Yani bu kodun gorevi `names` dizisindeki her ismi sirayla alip her biri icin bir `Text` gorunumu olusturmaktir.

### Calisma sureci

Calisma surecini soyle dusunebiliriz:

- `ForEach` once `names` dizisindeki ilk eleman olan `"Sam"` degerini okur
- `item`, gecici olarak `"Sam"` degerini temsil eder
- `Text(item)` `"Sam"` yazar
- Sonra siradaki `"John"` elemanini okumaya devam eder
- Ve ayni gorunum kodunu tekrar calistirir

Sonunda dizideki tum isimler gosterilmis olur.

Bu yazimin avantaji sudur: isimler arttiginda cok sayida `Text` satirini tekrar tekrar yazmamiz gerekmez, sadece dizinin icerigini degistirmemiz yeterlidir.

### Fotograflari donguyle gostermek

`ForEach` sadece metin gostermek icin degil, resim, renk veya baska SwiftUI gorunumlerini gostermek icin de kullanilabilir.

Ornegin, 4 resim hazirlayalim:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Bu dort resmi Xcode'daki Assets klasorune surukleyin.

![image](../../Resource/017_for3.png)

`ForEach` kullanmazsak her resmi elle tek tek yazmamiz gerekir:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Gorunumu:

![image](../../Resource/017_for4.png)

Bu yazim islevi yerine getirebilir ama kod oldukca uzun olur.

Resim sayisi arttikca daha fazla `Image` kodu yazmamiz gerekir.

Daha sonra resim boyutunu topluca degistirmek istersek yine hepsini tek tek duzenlememiz gerekir.

Bu durumda resim adlarini bir diziye koyup `ForEach` ile resim gorunumlerini tekrarli bicimde olusturabiliriz:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Buradaki `images` bir string dizisidir ve dizideki her eleman bir resim adidir.

`ForEach(images, id: \.self)` ifadesi `images` dizisindeki her elemani sirayla okudugu, her ogeyi kendi degeriyle ayirdigi ve o anki elemana gore ilgili gorunumu olusturdugu anlamina gelir.

Ornegin, ilk okunan deger `"430F9BEF"` olursa:

```swift
Image(item)
```

Su kodla ayni anlama gelir:

```swift
Image("430F9BEF")
```

Sonraki resimler de ayni bicimde sirasiyla gosterilir.

![image](../../Resource/017_for4.png)

Burada yine su yazimi kullaniyoruz:

```swift
id: \.self
```

Sebep oncekiyle aynidir. `images` dizisindeki elemanlar da basit string turunde oldugu icin baslangic asamasinda elemanin kendisini ayirt etmek icin kullanmak yeterlidir.

Bunu sabit bir formul gibi dusunebilirsiniz:

**`ForEach`, `String` veya `Int` gibi basit bir dizi uzerinde calisiyorsa genellikle `id: \.self` yazilir.**

### Yeni resim ekleme

Daha sonra yeni resimler eklemek gerekirse sadece dizinin icerigini degistirmeniz yeterlidir:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Yeni `Image` kodlarini tekrar tekrar yazmaniz gerekmez.

Resim sayisi fazla ise `ScrollView` ile birlikte kullanabilirsiniz; aksi halde icerik ekrani astiginda tam olarak gorulemez.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Resimleri duzenleme

Resimlerin stilini topluca degistirmek istedigimizde sadece `ForEach` icindeki kodu degistirmemiz yeterlidir.

Ornegin genisligi `80` yapalim:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Boylece tum resimler birlikte degisir; hepsini tek tek guncellemek gerekmez.

Bu, `ForEach`'in onemli rollerinden biridir:

**Birden fazla gorunumun yapisi ayni, sadece icerigi farkliysa gorunum kodunu tek bir kez yazar, neyin gosterilecegine ise dizideki verinin karar vermesini saglariz.**

## Ozet

Bu derste `for` dongusunu ve `ForEach`'i ogrendik.

`for` dongusu dizilerde veya araliklarda bulunan elemanlari sira ile islemek icin kullanilir ve daha cok veri islemeden yanadir.

`ForEach`, SwiftUI'de dizi icerigine gore gorunumleri tekrarli bicimde olusturmak icin kullanilir ve daha cok gorunum gosterimine yoneliktir.

Su anki baslangic asamasinda `ForEach` icin en yaygin yazim sunudur:

```swift
ForEach(dizi, id: \.self) { eleman in
    SwiftUIKodu
}
```

Burada `id: \.self`, her elemani ayirt etmek icin elemanin kendisini kullandigimiz anlamina gelir.

Dizideki icerik `String`, `Int` gibi basit turler oldugunda genellikle once bu yazimi kullanabiliriz.

Ileride web'e goz atarken ya da bir App kullanirken tekrar eden bir metin grubu, resimler veya baska liste icerikleri gordugunuzde bunlarin SwiftUI'de genellikle once bir diziye konup sonra `ForEach` ile tek tek gosterildigini dusunebilirsiniz.
