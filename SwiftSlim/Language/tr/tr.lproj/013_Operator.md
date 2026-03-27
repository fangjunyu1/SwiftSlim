# Operatörler

Bu derste, Swift operatörlerini (Operators) öğreneceğiz.

Hesaplama yaptığımızda, karşılaştırma kurduğumuzda veya mantıksal yargılarda bulunduğumuzda operatörleri kullanırız. Bu işlemler, programın çalışmasının her aşamasına yayılır ve programlamanın en temel becerilerinden biridir.

```swift
let a = 100 * 8
```

Programlama öğrenme sürecinde birçok kişi şunu fark eder: Belirli ölçüde matematiksel düşünceye sahip olanlar, program mantığını çoğu zaman daha kolay kavrar. Bunun nedeni, programlamanın özünde “hesaplama” ve “kural denetimi” bulunmasıdır; operatörler de tam olarak bu çekirdek rolü üstlenir.

Gerçek geliştirme sürecinde operatörler yalnızca basit sayısal işlemler için kullanılmaz; aynı zamanda birçok somut senaryoda da yaygın şekilde kullanılır.

Örneğin, bir blok oyununda kullanıcı bir bloğu belirli bir konuma sürüklediğinde şu hesaplamalar gerekir:

* Bloğun koordinat konumu
* Bloğun doldurabileceği konumlar
* Hedef konumun kullanılabilir olup olmadığının kontrolü

Bu “hesaplama + karar verme” süreci özünde operatörlere dayanır.

![Block](../../Resource/013_block.png)

Operatörleri öğrenmek yalnızca sayı hesabı öğrenmek değildir; aynı zamanda sonraki aşamalardaki arayüz yerleşimi, veri işleme ve etkileşim mantığı için temel oluşturmaktır.

## SwiftUI İçinde Hesaplamanın Çalıştırılma Şekli

SwiftUI içinde genellikle bir Button ile bir fonksiyon tetiklenir, ardından hesaplama mantığı o fonksiyon içinde yürütülür.

Örneğin:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Butona tıklandığında, Console çıktısı şöyledir:

```
c: 20
```

Bu derste, hesaplama mantığını tutarlı biçimde func içine yazacağız, butonla çalıştıracağız ve sonucu print ile göstereceğiz.

Sonraki örneklerde, kodu daha sade göstermek için artık her seferinde print kullanmak yerine, hesaplama sonucunu doğrudan kod satırında not edeceğiz.

## Console Çıktısını Yönetme

Her tıklamada yeni çıktı oluşacağı için, mevcut sonucu daha rahat görmek amacıyla Console alanının sağ alt köşesindeki temizleme düğmesine tıklayarak geçmiş günlükleri silebilirsiniz.

![Console](../../Resource/013_console.png)

## Button'ın Başka Bir Yazım Şekli

Eğer buton yalnızca tek bir fonksiyon çalıştırıyorsa, daha sade bir yazım kullanılabilir:

```swift
Button(action: ) {
    // View
}
```

Bu yazımda action, butona tıklandığında çalıştırılacak fonksiyonu (parametresiz fonksiyon) belirtir; süslü parantezler {} ise butonun görünümünü tanımlar.

Az önceki calculate fonksiyonu ile birlikte şu şekilde yazılabilir:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Butona tıklandığında, calculate fonksiyonu doğrudan çalıştırılır.

Bu nedenle, buton mantığı basitse ve yalnızca tek bir fonksiyon çağrılıyorsa, action yazımı daha açık olur ve kod düzeni açısından da daha uygundur.

## Aritmetik Operatörler

Aritmetik operatörler (Arithmetic Operators), sayısal hesaplamalarda kullanılır:

* + toplama
* - çıkarma
* * çarpma
* / bölme
* % kalan alma (mod)

Örnek:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Burada dikkat edilmesi gereken nokta, Swift'in güçlü tür denetimine sahip bir dil olmasıdır; farklı veri türlerini otomatik olarak karıştırmaz:

```swift
let a = 10   // Int
let b = 5.0  // Double

let c = a + b          // Error
let d = Double(a) + b  // 15.0
```

İki değer farklı türdeyse, tür dönüşümü elle yapılmalıdır.

## Karşılaştırma Operatörleri

Karşılaştırma operatörleri (Comparison Operators), iki değer arasındaki ilişkiyi kontrol etmek için kullanılır ve sonuç Bool olur:

* == eşittir
* != eşit değildir
* > büyüktür
* < küçüktür
* >= büyük eşittir
* <= küçük eşittir

Örnek:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Karşılaştırma operatörleri çok sık olarak koşul ifadelerinde kullanılır. Örneğin “alıntı döngüsü” örneğinde, indeksin dizi sınırını aşmamasını kontrol etmemiz gerekir:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Eğer index, sayings.count - 1 değerinden küçükse, karşılaştırma sonucu true olur ve if içindeki kod çalışır; sonuç false ise sonraki kod çalışmaz.

## Mantıksal Operatörler

Mantıksal operatörler (Logical Operators), birden fazla koşulu birleştirmek için kullanılır:

* && ve (AND)
* || veya (OR)
* ! değil (NOT)

### && ve

Birden fazla koşulun aynı anda sağlanması gerekiyorsa && kullanılır.

Örneğin:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Bu kodda iki ayrı koşul vardır: age >= 18 ve age <= 100.

Yalnızca bu iki koşul da true olduğunda legalAge true olur; koşullardan biri bile sağlanmazsa sonuç false olur.

### || veya

Birden fazla koşuldan yalnızca birinin sağlanması yeterliyse || kullanılır.

Örneğin:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Bu kod şu anlama gelir: money >= 50 veya creditCard >= 50 koşullarından en az biri doğruysa, payAllowed true olur.

Yalnızca iki koşul da sağlanmadığında sonuç false olur.

Örneğin ödeme senaryosunda, kullanıcı nakitle veya kredi kartıyla ödeme yapabilir. Her ikisi de kullanılamıyorsa, ödeme başarısız olur.

### ! değil

! işareti mantıksal değil operatörüdür (NOT) ve Bool değeri tersine çevirmek için kullanılır.

Basitçe, ! operatörü true'yu false yapar, false'u true yapar.

Örneğin:

```swift
let allowed = true
let result = !allowed   // false
```

Burada !allowed ifadesi, allowed değerini tersine çevirir.

Dikkat edilmesi gereken nokta, ! ile != operatörlerinin farklı olmasıdır. ! bir Bool değeri tersine çevirir; != ise bir karşılaştırma operatörüdür ve Bool sonuç üretir.

## Atama Operatörü

Atama operatörü (Assignment Operator), bir değeri atamak veya bir değişkeni güncellemek için kullanılır:

* = atama

Değişken tanımlarken veya hesaplama sonucunu kaydederken atama işlemi kullanılır:

```swift
let a = 5
```

Bu kod, 5 değerinin a değişkenine atanması anlamına gelir.

### Bileşik Atama Operatörleri

Gerçek geliştirme sürecinde, temel atama operatörünün dışında “bileşik atama operatörleri” de sık kullanılır. Bunlar, mevcut değer üzerinde işlem yapıp sonucu doğrudan yine aynı değişkene yazar:

* +=
* -=
* *=
* /=

Önceki “sayaç” dersinde bileşik atama operatörlerine kısaca değinmiştik.

Örneğin, bir butona tıklandığında değişkenin artmasını istiyorsak:

```swift
var num = 10
num += 5   // num = 15
```

Bu kod, num ile 5'i toplar ve sonucu yeniden num değişkenine atar.

Bu yüzden şu yazımla eşdeğerdir:

```swift
var num = 10
num = num + 5   // num = 15
```

## Üçlü Operatör

Swift'teki üçlü operatör (Ternary Operator), bir koşulu değerlendirir ve iki sonuçtan birini döndürür:

```swift
koşul ? değer1 : değer2
```

Çalışma mantığı şöyledir: koşul true ise “değer1”, false ise “değer2” döndürülür.

Örneğin:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Bu kod, showColor değerini kontrol eder: true ise Color.blue döner ve arka plan mavi olur; false ise Color.clear döner ve arka plan rengi görünmez.

İpucu: Color.clear şeffaf rengi temsil eder (görünmez).

### if-else ile farkı

Üçlü operatör mantıksal olarak if-else ifadesiyle eşdeğerdir.

Örneğin, az önceki kod şu şekilde de yazılabilir:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

İki yazımın çalışma mantığı aynıdır: koşul true ise birinci sonuç, false ise ikinci sonuç uygulanır.

Pratik kullanımda üçlü operatör daha kısa bir yazım sunar ve özellikle “iki seçenekten biri” şeklindeki basit koşulları ifade etmek için daha uygundur. Genellikle doğrudan bir değer döndürmek amacıyla kullanılır.

SwiftUI içinde View oluştururken üçlü operatör çok yaygındır. Örneğin:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Bu yazım, tek satır içinde koşula göre görünüm etkisini dinamik olarak değiştirmeyi sağlar.

## Aralık Operatörleri

Aralık operatörleri (Range Operators), bir sayı aralığını ifade etmek için kullanılır:

* ... kapalı aralık (iki ucu da dahil)
* ..< yarı açık aralık (sağ uç hariç)

Örneğin:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Bunu şöyle anlayabilirsiniz: 1...3, 1'den 3'e kadar ve 3 dahil; 5..<8 ise 5'ten 8'e kadar ama 8 hariç demektir.

Genişletilmiş biçimler (yalnızca bilgi amaçlı):

```
5...    // >= 5
...5    // <= 5
```

Bu yazım “tek taraflı aralık” anlamına gelir ve daha çok koşul denetiminde veya desen eşleştirmede kullanılır.

Aralık operatörleri ileride for döngüsünü öğrenirken kullanılacak. Şimdilik bunu, ardışık sayılardan oluşan bir aralık olarak anlamanız yeterlidir.

## Operatör Alıştırmaları

Şimdi birkaç basit örnek üzerinden, operatörlerin görünüm içinde nasıl kullanıldığını çalışalım.

### 1. Toplam araç sayısını hesaplama

Örneğin, bir kavşaktan her gün 500 araç geçiyorsa, 30 günde geçen toplam araç sayısını hesaplayabiliriz.

Bunun için aritmetik operatör kullanabiliriz:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Buradaki hesaplama şudur: Günde 500 araç geçiyor, 30 günlük toplam ise 500 × 30 olur ve sonuçta 15000 araç elde edilir.

### 2. Uygulama içi satın alma üyeliğini kontrol etme

Bir kişinin uygulama içi satın alma üyesi olup olmadığını da kontrol edebiliriz. Kalıcı üyelik veya abonelik üyeliğinden herhangi biri varsa, onu üye kabul ederiz.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Bu örnekte || (veya) operatörü kullanılmıştır: lifeTime = false, yani kalıcı üyelik yok; subscription = true, yani abonelik var.

Koşullardan yalnızca birinin sağlanması yeterli olduğu için isMember true olur. Yani bu kişi üyedir.

## Özet

Swift'te operatörler, veri hesaplama ve mantıksal karar verme işlemlerinin temelidir. Tıpkı Text'in içerik göstermesi gibi, operatörler de verinin kendisini işlemek için kullanılır.

En basit sayısal işlemlerden karmaşık mantıksal denetimlere, görünüm içindeki durum kontrolünden yerleşim hesaplarına kadar birçok şey operatörlere dayanır.

Farklı senaryolar üzerinde alıştırma yaparak, bu derste tanıtılan operatör türlerini adım adım tanıyıp ustalaşabilirsiniz. Bu, sonraki öğrenme aşamaları için önemli bir temeldir.

### Ek Bilgi - Bit Düzeyinde Operatörler

Bunun dışında, Swift daha düşük seviyede çalışan başka bir operatör grubu daha sunar: bit düzeyinde operatörler (Bitwise Operators):

* &（bit düzeyinde ve）
* |（bit düzeyinde veya）
* ^（bit düzeyinde özel veya）
* ~（bit düzeyinde değil）
* \>>（sağa kaydırma）
* <<（sola kaydırma）

Örneğin:

```swift
let a = 6  // ikilik: 110
let b = 3  // ikilik: 011

print(a & b) // 2 (ikilik: 010)
print(a | b) // 7 (ikilik: 111)
print(a ^ b) // 5 (ikilik: 101)
print(~a)    // -7 (tersini alma)
```

Swift'te tamsayılar ikinin tümleyeni (two's complement) biçiminde tutulur; bu yüzden bit tersleme işleminden sonra karşılık gelen negatif sonuç elde edilir.

Bit düzeyinde operatörler doğrudan ikilik veri üzerinde işlem yapar ve genellikle düşük seviye veri işleme ya da performans optimizasyonu senaryolarında kullanılır.

Başlangıç seviyesindeki kullanıcılar için bu tür operatörlerin kullanım alanı azdır; genel iOS veya SwiftUI geliştirmede de çok sık görülmezler. Bu nedenle burada ayrıntılı açıklamaya girmiyoruz.

İleride düşük seviye mantık veya performans optimizasyonu konularına girildiğinde, bu operatörleri daha derinlemesine öğrenebilir ve anlayabilirsiniz.
