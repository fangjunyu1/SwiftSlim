# Tür Sistemi

Önceki derslerde değişkenleri öğrendik ve değişkenlerin farklı türlerde veriler saklayabildiğini gördük.

Örneğin:

```swift
var hello = "Hello, World"
```

Buradaki hello bir metin parçası saklar, bu yüzden onun türü String'dir.

Sıradaki bölümde, tür (Type) kavramını, açık tür bildirimi ve tür çıkarımı ile birlikte sistemli şekilde öğreneceğiz; böylece değişkenlerin özünü daha derinlemesine anlayacağız.

## Tür Nedir

Swift'te her değerin açık bir türü vardır. Tür, bu değerin ne olduğunu ve neler yapabileceğini belirler.

Örneğin:

* 42 bir Int'tir (tam sayı)
* "Hello" bir String'dir (metin)
* true bir Bool'dur (mantıksal değer)

Bunlar farklı türlere aittir ve kullanım amaçları da farklıdır.

## Swift'te Yaygın Temel Türler

Başlangıç aşamasında en sık karşılaşılan türler şunlardır:

* String: metin
* Int: tam sayı
* Double: ondalıklı sayı (daha yüksek hassasiyet)
* Bool: mantıksal değer (true/false)

Bunların dışında Float (ondalıklı sayı) da vardır, ancak hassasiyeti Double'dan düşüktür ve genelde daha az kullanılır; Character ise tek karakteri temsil eder, örneğin "A", "!" gibi.

### Tür Bildirimi (Açık Tür)

Swift'te değişken tanımlanırken tür elle belirtilebilir:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Değişken adından sonra `: Tür` yazarak değişkenin türü belirtilir.

Dizilerin tür yazımı ise `: [Tür]` şeklindedir:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Bu kodda, scores dizisi yalnızca Int türündeki elemanları, tags ise yalnızca String türündeki elemanları saklayabilir.

Türü açıkça belirtmek, kodun amacını daha net hale getirir ve bazı durumlarda tür çıkarımından doğabilecek hataları önler.

## Tür Çıkarımı

Birçok durumda türü açıkça yazmak gerekmez:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"     // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

Bunun nedeni, Swift derleyicisinin "başlangıç değerine" bakarak türü otomatik olarak çıkarmasıdır.

## Açık Tür ve Tür Çıkarımı

Önceki derslerde açık tür bildirimini doğrudan kullanmadık. Örneğin:

```swift
var age: Int = 18
```

yerine daha çok tür çıkarımını kullandık:

```swift
var age = 18
```

Bu örnekte, iki yazım da eşdeğerdir; age her iki durumda da Int türü olur. Buna karşılık, tür çıkarımı daha kısa ve sade bir yazımdır.

İlk aşamada açık tür bildirimini özellikle vurgulamamamızın nedeni, tür çıkarımının kod içindeki ek bilgileri azaltarak başlangıç düzeyinde öğrenme yükünü düşürmesidir.

## Tür Neden Gerekli

Swift, güçlü tür denetimine sahip bir dildir (Strongly Typed Language).

Bu şu anlama gelir: Bir değişkenin türü belirlendikten sonra, o tür keyfi olarak değiştirilemez.

Örneğin:

```swift
var age: Int = 18

age = 20       // Success
age = "20"     // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

İlk 20, Int türündedir ve age değişkenine atanabilir; ikinci `"20"` ise String türündedir. Int ile aynı tür olmadığı için hata verir.

nums dizisi `[Int]` türündedir, yani yalnızca tam sayılar saklayabilir; içine string eklenemez.

Tür sistemi, verinin nasıl kullanılacağını sınırlar ve tür uyuşmazlığı sorunlarını derleme aşamasında yakalayarak tür karmaşasından kaynaklanan hataları azaltır; böylece kodun kararlılığı ve bakımı iyileşir.

## Türü Ne Zaman Açıkça Belirtmek Zorunludur

Swift çoğu zaman türü otomatik çıkarabilir, ancak bazı durumlarda derleyici türü çıkaramaz ya da yanlış çıkarabilir. Bu gibi durumlarda türü elle belirtmek gerekir.

**1. Boş dizi**

Boş bir dizi oluştururken tür mutlaka açıkça belirtilmelidir:

```swift
var nums: [Int] = []
```

Tür yazılmazsa:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

Derleyici, boş diziden eleman türünü çıkaramaz; bu yüzden derleme hatası oluşur.

**2. Yanlış çıkarımı önlemek**

```swift
var value = 10   // Int
```

Bu örnekte 10 sayısı ondalıklı sayı (Double) olarak da düşünülebilir, ancak içinde nokta olmadığı için derleyici bunu varsayılan olarak Int kabul eder.

Eğer value değişkeninin ondalıklı sayı olmasını istiyorsak, türü açıkça belirtmeliyiz:

```swift
var value: Double = 10   // Double
```

Tür çıkarımı beklediğimiz sonucu vermediğinde, açık tür bildirimi ya da literal biçimini değiştirme yoluyla doğru türü netleştirmeliyiz.

**3. Özel türler**

Daha ileride özel türleri de öğreneceğiz. Özel türler kullanılırken de çoğu zaman açık tür bildirimi gerekir:

```swift
var info: GameInfo
var users: [User] = []
```

Buradaki neden de boş dizi örneğiyle aynıdır: Derleyici boş değerden otomatik tür çıkaramaz.

## Tür Dönüştürme

Swift'te farklı türler arasında otomatik dönüşüm yapılmaz; dönüşüm elle yapılmalıdır.

Örneğin, iki farklı türdeki sayıyı toplamak istersek:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b   // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Bu kodda a, Int türündedir; b ise Double türündedir. Türler farklı olduğu için doğrudan işlem yapılamaz.

İşlemden önce, değerlerden birini diğerine uygun türe dönüştürmek gerekir:

```swift
var result = Double(a) + b
```

Bu ifade, Int türündeki a değerini Double türüne dönüştürür ve sonra b ile toplar. Sonuç da result değişkenine atanır.

Burada dikkat edilmesi gereken nokta, tür dönüşümünün orijinal değişkenin türünü değiştirmemesidir. Örneğin `Double(a)`, a'nın Int türünü değiştirmez; yalnızca işlem için yeni bir Double değer üretir.

Diğer türler de benzer biçimde dönüştürülebilir. Yani hedef tür + `()` biçiminde yazılır ve dönüştürülecek değer içine verilir. Örneğin:

```
Int()、Double()、String()
```

Örnek:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int, 9
```

Dikkat edilmesi gereken bir diğer nokta da, her dönüşümün tam karşılıkla gerçekleşmemesidir. Örneğin `Double → Int` dönüşümünde ondalık kısım doğrudan atılır; yuvarlama yapılmaz.

## Tür Takma Adı

Swift'te mevcut bir türe başka bir isim de verilebilir; bu, kodun anlamını daha açık hale getirebilir:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Buradaki UserID aslında hâlâ Int'tir; tür değişmemiştir, yalnızca daha anlamlı bir ad verilmiştir.

Kod miktarının büyük ve türlerin karmaşık olduğu projelerde, tür takma adları kodun okunabilirliğini artırabilir.

## Tür Örneği

Şimdi, türlerin gerçek geliştirmede nasıl çalıştığını basit bir örnekle görelim.

### Değişken oluşturma

Önce bir age değişkeni oluşturuyoruz:

```swift
var age = 20
```

Bu değişkeni SwiftUI içinde göstermek ve değiştirmek istediğimiz için, onu @State ile tanımlamamız gerekir:

```swift
@State private var age = 20
```

private anahtar sözcüğünden daha önce bahsetmiştik; bu, değişkenin yalnızca mevcut görünüm içinde kullanılabildiği anlamına gelir. İleride bunu daha ayrıntılı ele alacağız.

### SwiftUI içinde veriyi gösterme

SwiftUI içinde age değişkenini göstermek:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Artık görünümde şunu görürüz:

```swift
age: 20
```

### Veriyi değiştirme

Şimdi age değerini değiştirmek için iki buton ekleyelim:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Çalıştırma sonucu

changeAge1 butonuna bastığımızda, age değerine 18 atanır:

```swift
age = 18
```

18 bir Int türü olduğu ve age ile aynı türe sahip olduğu için atama başarılı olur.

changeAge2 ise hata verir:

```swift
age = "18"
```

Hata mesajı:

```
Cannot assign value of type 'String' to type 'Int'
```

Bunun nedeni, `"18"` değerinin String türünde olmasıdır (string değerler `""` ile yazılır), oysa age bir Int'tir. Türler aynı olmadığı için atama yapılamaz.

### Neden hata veriyor

Temel neden şu satırdır:

```swift
@State private var age = 20   // Int
```

Burada tür açıkça yazılmamış olsa bile, başlangıç değeri 20 bir Int olduğu için derleyici age değişkeninin türünü otomatik olarak Int olarak belirler.

Tür belirlendikten sonra, bu değişkene artık başka bir türde değer atanamaz.

Üstelik changeAge2 butonundaki hata "çalışma zamanında" değil, doğrudan derleme aşamasında oluşur; yani kod derlenemez.

Bu da Swift'in güçlü tür sisteminin avantajlarından biridir: Türle ilgili hatalar, kod yazılırken daha erken aşamada bulunabilir.

### Doğru yazım

Hatalı kodu kaldırdıktan sonra:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

changeAge1 butonuna basıldığında, görünüm şu şekilde güncellenir:

```swift
age: 18
```

### Açık tür bildirimi (isteğe bağlı)

İstenirse türü tanımlarken açıkça da belirtebiliriz:

```swift
@State private var age: Int = 20
```

Bu yazım, türü daha net gösterir; ancak basit durumlarda zorunlu değildir.

## Özet

Bu ders, Swift'in tür sistemini ve bunun gerçek geliştirmedeki rolünü anlattı.

Swift'te her değerin açık bir türü vardır. Tür, verinin anlamını ve hangi işlemlere katılabileceğini belirler.

Swift güçlü tür denetimine sahip olduğu için, bir değişkenin türü belirlendikten sonra ona başka türden değer atanamaz. Bu kısıtlama, hataların derleme aşamasında fark edilmesini sağlar; böylece çalışma zamanındaki sorunlar azalır ve kod daha güvenli hale gelir.

Değişkenin türü başlangıç değerinden otomatik olarak çıkarılabilir ya da açıkça belirtilebilir. Bazı durumlarda (örneğin boş dizi, yanlış tür çıkarımı, özel türler) derleyici doğru türü çıkaramaz; bu nedenle türün açıkça yazılması gerekir.

Farklı türler arasında otomatik dönüşüm yapılmaz; `Int()`、`Double()`、`String()` gibi yapılarla açık dönüşüm yapılmalıdır.

Türler için takma ad da tanımlanabilir. Özellikle karmaşık projelerde bu, okunabilirliği artırır.

Tür, yalnızca veriye konulan bir etiket değildir; aynı zamanda verinin güvenli, açık ve kontrollü biçimde kullanılmasını sağlayan bir kısıtlama mekanizmasıdır.

## Ek Bilgi - Optional Tür

Tür dönüşümü yapılırken, bazı işlemler başarısız olabilir.

Örneğin, String'i Double'a dönüştürmek:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Buradaki `Double(input)` ifadesi Double değil, şu türü döndürür:

```
Double?
```

İşte buna optional tür (Optional) denir.

### Neden optional döner

Çünkü string içeriği her zaman kesin değildir. `"3.14"` bir Double'a dönüştürülebilir, ama `"Hello"` dönüştürülemez.

Yani bu işlem başarılı da olabilir, başarısız da olabilir.

Bu belirsizliği ifade etmek için Swift optional türü kullanır.

### Optional tür nedir

Optional tür, bir değerin var olabileceğini de, hiç olmayabileceğini de ifade eder.

Örneğin:

```
Double?
```

Bu tür, eğer değer varsa yazdırılırken `Optional(...)` biçiminde görüneceğini, eğer değer yoksa `nil` döneceğini gösterir.

Burada dikkat edilmesi gereken nokta, `nil` değerinin "değer yok" anlamına gelmesidir; 0 ya da boş string anlamına gelmez.

### Örnek

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Çıktı:

```
pi:Optional(3.14)
```

Bu, string'in başarıyla Double'a dönüştürüldüğünü ve 3.14 elde edildiğini gösterir; ancak tür `Double?` olduğu için sonuç Optional içinde sarılmış görünür.

Dönüşüm başarısız olursa:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Çıktı:

```
pi: nil
```

Çünkü `"Hello"` değeri Double türüne dönüştürülemez; bu yüzden dönüşüm başarısız olur ve `nil` döner.

### Optional(...) nedir

Bir optional değeri doğrudan yazdırdığımızda:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift onun "debug description" değerini gösterir:

```
Optional(3.14)
```

Bu, gerçek verinin bir parçası değildir; yalnızca mevcut değerin bir "optional tür" olduğunu ve içinde bir değer taşıdığını gösterir.

### Optional değeri açma

Gerçek geliştirmede, optional türün içindeki gerçek değeri çıkarmamız gerekir. Bu işleme unwrapping denir.

Yaygın yöntemlerden biri, `??` kullanarak varsayılan bir değer sağlamaktır:

```
??
```

Bunun adı: Nil-Coalescing Operator'dür.

Örneğin:

```swift
name ?? "FangJunyu"
```

Bu kod şu anlama gelir: Eğer name'in bir değeri varsa onu döndür; eğer `nil` ise varsayılan olarak `"FangJunyu"` kullan.

Burada dikkat edilmesi gereken nokta, varsayılan değerin türünün optional tür ile uyumlu olması gerektiğidir.

### ?? ile varsayılan değer verme

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")   // 30
```

Çıktı:

```
pi: 30
```

input, Double türüne dönüştürülürken dönüşüm başarılı olur ve değer yazdırılır. Eğer dönüşüm başarısız olsaydı, `??` ile verilen varsayılan değer kullanılırdı.

Dönüşüm başarısız olursa:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Çıktı:

```
pi: 10
```

Burada input değeri Double'a dönüştürülürken işlem başarısız olur ve `nil` döner; `??` operatörü de `nil` için varsayılan değer sağlar.

Optional tür, "bir değer olabilir de olmayabilir de" durumunu ifade etmek için kullanılır.

Tür dönüşümü gibi başarısız olma ihtimali bulunan işlemlerde Swift optional tür döndürerek güvenliği korur.

Bu tür bir değeri gerçekten kullanmamız gerektiğinde, `??` ile varsayılan değer vererek `nil` durumunda da makul bir sonuç elde edebiliriz.
