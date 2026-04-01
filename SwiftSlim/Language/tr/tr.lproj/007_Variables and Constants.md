# Değişkenler ve Sabitler

Bu derste temel olarak Swift içindeki değişkenleri ve sabitleri öğreneceğiz; ayrıca bazı yaygın veri türlerini ve temel operatörleri tanıyacağız.

Bu içerikler programlamadaki en temel bilgilerdir ve SwiftUI öğreniminin devamı için de önemli bir temeldir.

## Günlük hayattaki değişkenler ve sabitler

Değişkenleri ve sabitleri günlük hayattaki şeyler üzerinden anlayabiliriz.

Günlük hayattaki değişkenlere örnekler:

- Televizyonda her programın içeriği farklıdır
- Hava her gün aynı değildir
- Saat her saniye değişir

Bu şeylerin ortak özelliği şudur: değişirler.

Eğer televizyonda hep tek bir görüntü olsaydı, hava hep güneşli olsaydı ve saatin ibresi hiç hareket etmeseydi, bu şeyler sabit olurdu.

Biri değişebilir, diğeri ise değişmez.

## Değişkenleri ve sabitleri anlama

Uygulama geliştirmede genellikle kullanıcının bazı bilgileri girmesi veya kaydetmesi gerekir.

Örneğin:

- Hesap adı
- Doğum günü
- İletişim bilgisi
- Adres

Bu bilgiler kaydedilir ve daha sonra gösterilir.

Örneğin kullanıcı uygulama içinde bir ad girsin:

``` id="vtm1s6"
FangJunyu
```

Bu adı kaydetmemiz gerekir; böylece uygulama içinde gösterebiliriz.

Bu kaydetme süreci basitçe bir çekmeceye bir şey koymak gibi düşünülebilir.

Bir adı kaydettiğimizde, sanki bu adı bir çekmecenin içine koymuş oluruz.

Kaydedilecek şey çok olabilir; dolayısıyla çekmece de çok olabilir. Hangi çekmecede ne olduğunu bilmek için çekmecelere isim vermemiz gerekir.

Örneğin:

```id="g8g93n"
name
```

Bu örnekte `name` çekmecenin adı, `FangJunyu` ise içine koyulan bilgidir.

![Var](../../RESOURCE/007_var.png)

**Swift içinde veri saklamak istiyorsak, mutlaka `var` ya da `let` ile bildirim yapmamız gerekir.**

Ad genellikle değiştirilebilir bir bilgi olduğu için burada değişken kullanmalıyız.

```swift id="ci6b9g"
var name = "FangJunyu"
```

Burada `name` adında bir değişken tanımlanmıştır. Türü `String`, değeri ise `"FangJunyu"`’dur.

### Değişken ve sabit arasındaki fark

Değişken `var` ile tanımlanır:

```swift id="x9h3b8"
var
```

Sabit ise `let` ile tanımlanır:

```swift id="4l0m3k"
let
```

Örneğin:

```swift id="wgahp6"
var name = "FangJunyu"
let id = 123456
```

Bir değer değiştirilebiliyorsa değişken, değiştirilemiyorsa sabit olarak tanımlanır.

Bu nedenle değişken ile sabit arasındaki temel fark şudur: değerin değişmesine izin verilip verilmemesi.

### Sabiti değiştirme

Eğer kod bir sabitin değerini değiştirmeye çalışırsa:

```swift id="z0o8i0"
let name = "Sam"
name = "Bob"
```

Swift, bunun yapılamayacağını söyler; çünkü bu bir sabittir.

```id="zlx8rj"
Cannot assign to property: 'name' is a 'let' constant
```

Bu mekanizma, bazı önemli verilerin yanlışlıkla değiştirilmesini önlemeye yardımcı olur.

### SwiftUI içinde gösterme

ContentView.swift dosyasını açın ve View içinde bir değişken tanımlayın:

```swift id="cd7hrg"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Burada `name` adında bir değişken tanımlanmıştır ve bu değer Text ile arayüzde gösterilir.

Eğer değişkenin içeriğini değiştirirsek:

```swift id="sq1kiz"
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Text içinde görünen içerik de değişir.

Bu şekilde, arayüzde gösterilen içeriği her seferinde doğrudan Text içindeki yazıyı değiştirerek değil, değişken üzerinden kontrol edebiliriz.

Eğer bu bilgiye başka bir yerde de ihtiyaç varsa, değişkeni oraya aktarabiliriz. Bu da çekmecedeki içeriği başka bir yere vermek gibidir.

### SwiftUI içinde değişken ve sabitin yeri

SwiftUI’de değişkenler ve sabitler genellikle `body`’nin dışında yazılır:

```swift id="n5l9a9"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Elbette değişken ve sabitler `body` içinde de yazılabilir:

```swift id="v0ax4b"
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Ancak ikisi arasında önemli bir fark vardır:

* Eğer değişken ya da sabit `body` içinde yazılırsa, view her yeniden hesaplandığında bu değişken yeniden oluşturulur
* Eğer `body` dışında yazılırsa, bu değişken view yapısının bir özelliği olarak var olur ve kod yapısı daha net olur

Bu nedenle gerçek geliştirmede, değişken ve sabitler genellikle `body` dışında yazılır.

## Veri türleri

Değişkenler birçok farklı türde veri saklayabilir. Bu türlere veri türü denir.

Örneğin daha önce Text ile metin gösterdik:

```swift id="g5wqi0"
Text("Hello, World")
```

Buradaki `"Hello, World"` bir string, yani `String` türündedir.

String, metin içeriğini ifade eder ve Swift içinde çift tırnak `""` ile yazılır.

Örneğin:

```swift id="lu83p8"
var hello = "Hello, World"
```

String dışında Swift içinde başka birçok veri türü de vardır.

Başlangıç aşamasında en yaygın dört tür şunlardır:

* String
* Int
* Double
* Bool

Bu dört tür, temel veri işlemlerinin büyük kısmını karşılar.

**String**

String, metin içeriğini ifade eder. Örneğin:

```swift id="88vo9u"
var name = "FangJunyu"
var city = "Rizhao"
```

String genellikle şu tür bilgiler için kullanılır: kullanıcı adı, başlık, metin içeriği.

**Int**

Int, tam sayıyı ifade eder. Yani ondalık içermeyen sayılar için kullanılır.

Örneğin:

```swift id="jsm9w8"
var age = 26
var count = 100
```

Tam sayılar genellikle şu şeyleri göstermek için kullanılır: yaş, adet, sayaç.

**Double**

Double, ondalıklı sayıları ifade eder.

Örneğin:

```swift id="spikj8"
var weight = 74.5
var height = 185.0
```

Swift içinde ondalıklı sayılar varsayılan olarak genellikle `Double` kabul edilir.

Buna benzeyen bir başka tür daha vardır: `Float`. Ancak onun ifade edebildiği sayı aralığı daha küçüktür. Bu yüzden gerçek geliştirmede `Double` daha sık kullanılır.

**Bool**

Bool türü iki durumu ifade etmek için kullanılır: `true` ve `false`.

Örneğin:

```swift id="3bhb4g"
var isShowAlert = true
var isLogin = false
```

Bool türü genellikle koşul kontrolünde kullanılır. Örneğin bir uyarı kutusunun gösterilip gösterilmeyeceğini belirtmek için.

Yalnızca iki sonucun olduğu durumlarda, Bool kullanmak çok uygundur.

### SwiftUI içinde gösterme

String türünü gösterirken doğrudan Text kullanılabilir:

```swift id="htrj7t"
Text(name)
```

Ancak Int ve Double gibi türler string değildir. Bu nedenle doğrudan metnin parçası olarak kullanılamazlar.

Eğer bu verileri Text içinde göstermek istiyorsak, string interpolation kullanmamız gerekir:

```swift id="c7jh4d"
\()
```

String interpolation, string içeriği içinde yazılır ve değişken ya da sabit `\()` ile sarılır.

Örneğin:

```swift id="kl5pcw"
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Yukarıdaki kodda `""` string’i ifade eder; `\()` ise değişken ya da sabiti string içine yerleştirmek için kullanılır.

Örneğin:

```swift id="m7wdgo"
"DoubleNum: \(num * 2)"
```

Gösterilen içerik şu olur:

```id="axv7fg"
DoubleNum: 2
```

Bu şekilde string içine değişken veya sabit yerleştirip, ardından Text ile arayüzde gösterebiliriz.

Not: `\()` yalnızca string olan `""` içinde kullanılabilir.

## Operatörler

Değişken ya da sabit tanımlarken şu yazımı görebiliriz:

```swift id="q48e6g"
var num = 1
```

Buradaki `=` işaretine atama operatörü denir.

Görevi şudur: sağ taraftaki değeri soldaki değişkene atamak.

Bu örnekte `1`, `num` değişkenine atanır.

Atama operatörü dışında, bazı yaygın sayısal operatörler de vardır:

* `+`
* `-`
* `*`
* `/`

Sayılarla işlem yaptığımızda, örneğin Int veya Double verileriyle, bu operatörleri kullanırız.

Örneğin:

```swift id="s9qjlwm"
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

İşlem tamamlandıktan sonra sonuç değişken içinde saklanır.

## Özet

Değişkenler, sabitler ve operatörler programlamadaki en temel kavramlardır.

Değişkenler ve sabitler sayesinde program içinde çeşitli verileri saklayabiliriz; veri türleri sayesinde bu verilerin ne tür olduğunu açıkça belirtebiliriz; operatörler sayesinde de veriler üzerinde hesaplama ve işlem yapabiliriz.

Bu bilgiler, programlama dünyasının temel araçları gibidir. Bunları iyi kavramak, Swift ve SwiftUI’yi sonraki aşamalarda öğrenmek için sağlam bir temel oluşturur.
