# Hesaplanan Özellik

Bu derste temel olarak hesaplanan özellikleri öğreneceğiz.

Hesaplanan özellik, mevcut verilere göre yeni bir sonuç hesaplamak için kullanılır. Sayısal değerleri hesaplayabilir, ayrıca SwiftUI view içinde gösterilmesi gereken içeriği de hesaplayabilir.

Örneğin:

```swift
let a = 10
let b = 20
let c = a + b
```

Burada `c`, `a` ve `b` toplandıktan sonra elde edilen sonucu ifade eder.

Normal kodda bu tür bir yazım çok yaygındır.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

İpucu: `Button` tıklama olayının içinde normal Swift kodu çalıştırılabilir.

Ancak benzer kodu doğrudan bir SwiftUI view özelliğinin içine yazarsak bir sorunla karşılaşırız.

Örneğin:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Bu kod hata verir.

İlk bakışta `a` ve `b`, `c` değerinden önce yazılmış gibi görünür. Bu yüzden `c` değerinin hesaplanabileceği düşünülebilir.

Ancak bir struct içinde özellik bildirirken bu yazım biçimi doğrudan kullanılamaz.

## c neden doğrudan a + b olarak hesaplanamaz?

Çünkü `a`, `b` ve `c`, bir buton tıklama olayındaki geçici sabitler değildir. Bunlar `ContentView` adlı view içindeki özelliklerdir.

Buton tıklama olayında bu kod normal şekilde çalışabilir:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Çünkü butona tıklandıktan sonra kod sırayla çalışır. Önce `a` oluşturulur, sonra `b` oluşturulur, en sonunda `a + b` kullanılarak `c` hesaplanır.

Ancak view içinde özellik bildirirken durum farklıdır:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Buradaki `a`, `b` ve `c` değerlerinin tamamı `ContentView` view içindeki özelliklerdir.

`ContentView` view oluşturulurken Swift önce bu özellikleri hazırlamak zorundadır. Oluşturma sürecinin güvenli olması için Swift, bir instance stored property varsayılan değerinin aynı instance içindeki diğer instance property değerlerini doğrudan okumasına izin vermez.

Bu yüzden şu satır hata verir:

```swift
let c = a + b
```

Basitçe şöyle anlayabiliriz: **view içinde özellik bildirirken, bir normal özelliği kullanarak başka bir normal özelliği doğrudan hesaplayamayız.**

Değeri doğrudan saklayan bu tür özelliklere “stored property” denir. Anlamayı kolaylaştırmak için bunu geçici olarak normal özellik olarak düşünebiliriz.

Örneğin:

```swift
let a = 10
```

`a`, `10` değerini saklar.

```swift
let b = 20
```

`b`, `20` değerini saklar.

Ancak:

```swift
let c = a + b
```

Burada `c`, doğrudan yazılmış sabit bir değer değildir. `a + b` ile hesaplanması beklenen bir değerdir.

Bu tür “mevcut verilerden sonuç elde etme” durumlarında hesaplanan özellik kullanmak daha uygundur.

Kod şu şekilde değiştirilebilir:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Buradaki `c`, hesaplanan özelliktir.

```swift
var c: Int {
    return a + b
}
```

Bunun anlamı şudur: **`c` kullanılmak istendiğinde `a` ve `b` okunur, ardından `a + b` sonucu döndürülür.**

Örneğin:

```swift
Text("c: \(c)")
```

`Text`, `c` değerini gösterdiğinde `c` hesaplaması çalışır.

## Hesaplanan özellik nedir?

Hesaplanan özellik bir değişken gibi görünür, ancak kendisi veri saklamaz.

Örneğin:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Buradaki `c`, hesaplanan özelliktir.

Normal bir özellik gibi sabit bir değer saklamaz. `c` her okunduğunda `{}` içindeki kod yeniden çalışır ve hesaplanan sonuç döndürülür.

Bunu şöyle anlayabiliriz:

```swift
var c: Int {
    return a + b
}
```

`c` gerektiğinde `a + b` hesaplanır.

Bu yüzden hesaplanan özellik şu duruma uygundur: **bir sonucu ayrıca saklamaya gerek yoksa ve bu sonuç mevcut verilerden hesaplanabiliyorsa.**

## Temel yazım biçimi

Hesaplanan özellik genellikle üç bölümden oluşur:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` ile bildirilir

```swift
var c
```

Hesaplanan özellik mutlaka `var` ile bildirilmelidir; `let` kullanılamaz.

Çünkü hesaplanan özellik sabit olarak saklanan bir değer değildir. Her okunduğunda dinamik olarak hesaplanan bir sonuçtur.

### 2. Return type belirtilir

```swift
var c: Int
```

Hesaplanan özellik return type belirtmelidir.

Burada `c` sonuç olarak bir tam sayı döndürür, bu yüzden type `Int` olur.

### 3. {} içinde hesaplama logic yazılır

```swift
{
    return a + b
}
```

`{}` içinde hesaplama logic yazılır. Burada döndürülen sonuç `a + b` olur.

## return anahtar kelimesi

Hesaplanan özellik bir sonuç döndürmelidir.

Örneğin:

```swift
var c: Int {
    return a + b
}
```

Buradaki `return`, `a + b` hesaplama sonucunu dışarı döndürmek anlamına gelir.

Hesaplanan özellik içinde doğrudan sonuç üreten tek bir expression varsa `return` yazılmayabilir:

```swift
var c: Int {
    a + b
}
```

Ancak hesaplanan özellik içinde birden fazla satır kod varsa, sonucu açıkça döndürmek için `return` kullanılmalıdır.

Örneğin:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Burada hesaplama süreci iki adıma ayrılmıştır.

İlk adım, toplam fiyatı hesaplamaktır:

```swift
let total = count * price
```

İkinci adım, toplam fiyatı metne dönüştürüp döndürmektir:

```swift
return "Total：\(total) $"
```

Eğer `return` kaldırılırsa:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Bu kod hata verir.

Nedeni şudur: **bu hesaplanan özellik içinde zaten birden fazla satır kod vardır. Swift, hangi satırın son döndürülecek sonuç olduğunu otomatik olarak belirleyemez.**

Bu yüzden, hesaplanan özellik içinde sonucu üreten tek bir expression varsa `return` yazılmayabilir.

```swift
var c: Int {
    a + b
}
```

Hesaplanan özellik içinde birden fazla satır kod varsa, `return` açıkça yazılması önerilir.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Hesaplanan özellik ile normal özellik arasındaki fark

Normal özellik veri saklar.

```swift
var c = 30
```

Burada `c` belirli bir değeri saklar: `30`.

Hesaplanan özellik veri saklamaz.

```swift
var c: Int {
    a + b
}
```

Burada `c`, `30` değerini saklamaz. Sadece bir hesaplama yöntemi sağlar.

`c` okunduğunda Swift şunu çalıştırır:

```swift
a + b
```

Sonra hesaplanan sonucu döndürür.

Bu yüzden hesaplanan özellik, bir sonucun başka verilere göre hesaplanması gereken durumlar için uygundur.

## body de hesaplanan özelliktir

Hesaplanan özelliği öğrendikten sonra SwiftUI içinde en sık gördüğümüz şu kodu yeniden anlayabiliriz:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Buradaki `body` de hesaplanan özelliktir.

`var` ile bildirilmiştir:

```swift
var body
```

Bir return type değerine sahiptir:

```swift
some View
```

`{}` içinde döndürülen şey SwiftUI view içeriğidir:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Bu yüzden `body` şöyle anlaşılabilir: SwiftUI bu view’i göstermesi gerektiğinde `body` değerini okur ve `body` tarafından döndürülen içeriğe göre interface oluşturur.

Eğer `return` yazarsak şöyle düşünebiliriz:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ancak SwiftUI içinde genellikle `return` yazmayız ve doğrudan şöyle yazarız:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` verisi değiştiğinde SwiftUI `body` değerini yeniden okur ve yeni verilere göre interface’i günceller.

Örneğin:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Butona tıklandıktan sonra `count` değişir.

```swift
count += 1
```

`count` değiştikten sonra SwiftUI `body` değerini yeniden hesaplar. Bu yüzden interface içindeki metin de güncellenir.

```swift
Text("count: \(count)")
```

SwiftUI içinde veri değiştiğinde interface’in otomatik olarak yenilenebilmesinin nedeni de budur.

### body içinde karmaşık hesaplamalar yazmak önerilmez

`body` hesaplanan özellik olduğu için birçok kez okunabilir ve yeniden hesaplanabilir.

Örneğin:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

`name` değiştiğinde SwiftUI `body` değerini yeniden hesaplar.

Bu sırada `body` içindeki kod da yeniden çalışır ve `num` da yeniden oluşturulur.

```swift
let num = 10
```

Bu örnekteki `num` çok basittir, bu yüzden etkisi büyük değildir.

Ancak `body` içinde büyük miktarda data filtering, sorting, image processing gibi karmaşık hesaplamalar yapılırsa interface akıcılığı etkilenebilir.

Bu yüzden SwiftUI içinde `body` esas olarak interface yapısını tanımlamaktan sorumlu olmalıdır.

Basit geçici veriler `body` içinde yazılabilir.

Karmaşık hesaplamalar `body` dışındaki hesaplanan özelliklere, method’lara veya ayrı data processing bölümlerine taşınabilir.

## Örnek: adet ve toplam fiyat

Şimdi basit bir örnekle hesaplanan özelliği anlayalım.

Bir havucun fiyatının 2 $ olduğunu varsayalım. Kullanıcı butona tıklayarak satın alma adedini değiştirebilir ve interface içinde toplam fiyat gösterilmelidir.

Toplam fiyatın hesaplama yöntemi:

```text
Adet * Birim fiyat
```

Toplam fiyatı normal bir variable içinde saklarsak bu biraz zahmetli olur.

Çünkü adet her değiştiğinde toplam fiyatı elle güncellemek gerekir.

Daha iyi yöntem, hesaplanan özellik kullanmaktır:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Gösterilen sonuç:

![view](../../Resource/024_view.png)

Bu örnekte:

```swift
@State private var count = 1
```

`count`, havuç adedini ifade eder. Butona tıklandığında `count` değişir.

```swift
private let price = 2
```

`price`, havucun birim fiyatını ifade eder. Burada sabit bir değerdir, bu yüzden `let` kullanılır.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice`, toplam fiyatı ifade eder.

Bunu ayrıca saklamaya gerek yoktur, çünkü toplam fiyat her zaman `count * price` ile hesaplanabilir.

`count` `1` olduğunda:

```swift
totalPrice = 1 * 2
```

Gösterilen sonuç:

```swift
totalPrice: 2 $
```

`+` butonuna tıkladıktan sonra `count` `2` olur.

Bu sırada `totalPrice` yeniden okunduğunda tekrar hesaplanır:

```swift
totalPrice = 2 * 2
```

Gösterilen sonuç:

```swift
totalPrice: 4 $
```

Hesaplanan özelliğin görevi budur: mevcut verilere göre yeni sonucu dinamik olarak hesaplamak.

## Hesaplanan özellik koşul kontrolü için de kullanılabilir

Hesaplanan özellik yalnızca sayıları hesaplamaz, koşul sonucunu da döndürebilir.

Örneğin adedin en düşük değerinin 1 olmasını istediğimizi düşünelim.

Adet zaten 1 olduğunda `-` butonu daha fazla azaltmamalıdır.

Bunun için bir hesaplanan özellik ekleyebiliriz:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Tam kod:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Gösterilen sonuç:

![view](../../Resource/024_view1.png)

Burada:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Bu kod, şu anda daha fazla azaltılıp azaltılamayacağını ifade eder.

`count` `1` değerinden büyük olduğunda:

```swift
canDecrease == true
```

Bu, azaltılabilir anlamına gelir.

`count` `1` değerine eşit olduğunda:

```swift
canDecrease == false
```

Bu, artık azaltılamaz anlamına gelir.

### Buton içindeki koşul kontrolü

Buton içinde şu kod kullanılır:

```swift
if canDecrease {
    count -= 1
}
```

Yalnızca `canDecrease` `true` olduğunda `count` azaltılır.

### View’in foreground color değerini kontrol etmek

`canDecrease` kullanarak butonun foreground color değerini de kontrol edebiliriz:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Burada ternary operator kullanılmıştır:

```swift
canDecrease ? Color.primary : Color.gray
```

Bu kodun anlamı şudur: `canDecrease` `true` ise foreground color `Color.primary` kullanılır; `canDecrease` `false` ise foreground color `Color.gray` kullanılır.

`Color.primary`, SwiftUI tarafından sağlanan system semantic color değeridir. Mevcut interface içindeki ana metin rengini temsil eder.

Light Mode’da `Color.primary` genellikle siyaha yakındır; Dark Mode’da genellikle beyaza yakındır.

Bu yüzden `Color.primary` kullanmanın avantajı şudur: Light Mode ve Dark Mode’a otomatik olarak uyum sağlar.

### View’in disabled durumunu kontrol etmek

`disabled`, view’in disabled durumda olup olmadığını kontrol etmek için kullanılır:

```swift
.disabled(!canDecrease)
```

`disabled` `false` olduğunda view tıklanabilir.

`disabled` `true` olduğunda view disabled durumdadır ve tıklanamaz.

Burada `canDecrease` koşul olarak kullanıldığı için kodu anlamak daha kolay olur.

`canDecrease` görüldüğünde bunun “şu anda daha fazla azaltılabilir mi” anlamına geldiği anlaşılır.

### Ek açıklama: neden iki kez kontrol ediliyor?

`-` butonunda:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Burada hem `.disabled(!canDecrease)` hem de buton içinde `if canDecrease` kullanılmıştır.

`.disabled(!canDecrease)`, interface seviyesinde butonu devre dışı bırakır ve kullanıcının tıklamasını engeller.

`if canDecrease`, kod çalışmadan önce bir kez daha kontrol yapar. Yalnızca azaltılabiliyorsa `count -= 1` çalışır.

Bu çift korumadır. Gerçek geliştirmede, buton zaten disabled ise içteki kontrol atlanabilir. Ancak öğretici örnekte bunu bırakmak `canDecrease` rolünü daha açık gösterir.

## Özet

Bu derste temel olarak hesaplanan özellikleri öğrendik.

Hesaplanan özellik değeri doğrudan saklamaz. Okunduğunda mevcut verilere göre bir sonuç hesaplar.

Örneğin:

```swift
var c: Int {
    a + b
}
```

Burada `c` ayrıca saklanmak zorunda değildir, çünkü `a + b` ile hesaplanabilir.

Hesaplanan özellik mutlaka `var` ile bildirilmelidir ve return type belirtilmelidir.

```swift
var canDecrease: Bool {
    count > 1
}
```

Hesaplanan özellik yalnızca sayısal değer değil, koşul sonucu, metin içeriği ve hatta SwiftUI view içeriği de döndürebilir.

Bu derste `return` de öğrendik.

`return`, bir sonucu döndürmek anlamına gelir:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Hesaplanan özellik içinde doğrudan sonucu üreten tek bir expression varsa `return` yazılmayabilir.

```swift
var totalPrice: Int {
    count * price
}
```

Ayrıca `Color.primary` ve `disabled` hakkında da bilgi edindik.

`Color.primary`, SwiftUI’nin system semantic color değeridir. Light Mode ve Dark Mode’a göre görünümü otomatik olarak ayarlar.

```swift
.foregroundStyle(Color.primary)
```

`disabled`, view’in disabled olup olmadığını kontrol etmek için kullanılır.

```swift
.disabled(true)
```

Bu, disabled olduğu ve tıklanamayacağı anlamına gelir.

```swift
.disabled(false)
```

Bu, kullanılabilir olduğu ve tıklanabileceği anlamına gelir.

Bu yüzden hesaplanan özellikler SwiftUI içinde çok yaygındır. Hesaplama sonuçlarını, koşulları ve gösterilecek içeriği daha net düzenlemeye yardımcı olur.
