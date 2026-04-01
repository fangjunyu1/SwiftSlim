# Düğmenin Çalışmasını Sağlamak

Bu derste temel olarak SwiftUI’de Button, `print` ile hata ayıklama çıktısı ve Swift fonksiyonlarını öğreneceğiz.

Bu içerikler, SwiftUI’de etkileşimli programlamanın temelidir.

## Düğme

Düğme, en sık kullanılan UI bileşenlerinden biridir. İndirme, açma ya da çıkış gibi işlemler gerektiğinde genellikle düğmeye tıklarız.

Örneğin App Store’da bir uygulamayı indirmek için “Al” düğmesine tıklanır.

![Button](../../RESOURCE/008_button.png)

SwiftUI’de düğme `Button` ile ifade edilir.

Temel kullanım:

```swift
Button("") {
    
}
```

Yapı iki parçaya ayrılabilir:

```swift
Button("Düğme yazısı") {
    Düğmeye tıklandığında çalışacak kod
}
```

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Çalıştırdıktan sonra bir Start düğmesi görünür.

![Button](../../RESOURCE/008_button1.png)

Kullanıcı düğmeye tıkladığında, `{}` içindeki kod çalışır.

Dikkat edilmesi gereken nokta şudur: Button, SwiftUI’nin bir arayüz bileşenidir yani bir View’dür. Bu nedenle mutlaka `body` içinde yazılmalıdır.

### buttonStyle modifier’ı

SwiftUI’de Button, sistemin yerleşik düğme stillerini sunar. Bunlar `buttonStyle` modifier’ı ile kullanılabilir.

Örneğin:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle`, sistem tarafından sağlanan düğme stilini uygular.

Yaygın seçenekler şunlardır:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

Farklı stiller arasındaki temel farklar; düğmenin kenarlığı olup olmaması, arka planı ve görsel vurgu düzeyidir.

## print çıktısı

Programlamada, programın belirli bir kod parçasına ulaşıp ulaşmadığını görmek sık sık gerekir.

Swift, hata ayıklama bilgisi yazdırmak için `print` fonksiyonunu sunar.

Temel yazım:

```swift
print("Hello")
```

Bu satır metni Console’a yazar.

### Düğmenin çalıştığını test etme

Düğmenin tıklanıp tıklanmadığını test etmek için `print` ifadesini düğmenin içine yazabiliriz.

```swift
Button("Start") {
    print("Test 123")
}
```

Düğmeye tıklandığında Console’da şu çıktı görünür:

```id="95hsk5"
Test 123
```

Bu, düğmenin başarıyla tetiklendiğini gösterir.

![Button](../../RESOURCE/008_button3.png)

Dikkat: `print`, Swift kodudur; bir arayüz bileşeni değildir. Bu yüzden doğrudan `body` içine konulamaz, aksi takdirde hata verir.

Örneğin aşağıdaki yazım yanlıştır:

```swift id="9m0sar"
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Hata: body bir View döndürmelidir
    }
}
```

SwiftUI’de `body`, arayüz yapısını tanımlamak için kullanılır. İçinde yalnızca Text, Button, Image gibi arayüz bileşenleri yani View’ler bulunabilir.

Normal Swift kodları; örneğin hesaplama mantığı, `print` gibi yapılar ise düğme, fonksiyon ya da başka olay işleyicileri içinde yer almalıdır.

### Console

`print` çıktısı Xcode içindeki Console’da görünür.

Eğer Console görünmüyorsa, sağ alttaki Show the Debug Area düğmesine tıklayarak hata ayıklama alanını açın, ardından Show the Console düğmesine tıklayarak Console’u gösterin.

![](../../RESOURCE/008_button4.png)

Console’un sol alt köşesinde iki sekme vardır: Executable ve Previews.

![](../../RESOURCE/008_button5.png)

Bu iki sekme farklı çalışma ortamlarını temsil eder. Canvas önizlemesinde çalışıyorsanız, `print` çıktısı Previews sekmesinde görünür. Uygulamayı simülatörde ya da gerçek cihazda çalıştırıyorsanız, çıktı Executable sekmesinde görünür.

Bu nedenle `print` çıktısını göremediğinizde önce doğru sekmeyi seçtiğinizden emin olun.

## Örnek - ASCII karakter sanatı

Bazı kod projelerinde sık sık ASCII karakter sanatı görülür.

Karakter sanatı, normal karakterlerle oluşturulan bir şekildir. Örneğin:

![ASCII](../../RESOURCE/008_ascii.png)

Bir düğme ve `print` kullanarak ASCII karakter sanatı yazdırabiliriz.

Örnek kod:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Düğmeye tıklandığında Console şu çıktıyı verir:

```id="8wsncm"
 /\_/\
( o.o )
 > ^ <
```

Dikkat: String içindeki `\` karakteri `\\` şeklinde yazılmalıdır; çünkü ters eğik çizgi string içinde kaçış karakteridir.

## Fonksiyon

Düğmenin içinde doğrudan kod yazabiliriz.

Örneğin:

```swift id="qzrvr0"
Button("Start") {
    print("Hello")
}
```

Eğer kod azsa bu yazımda sorun yoktur. Ancak gerçek geliştirme sürecinde bir düğmenin tetiklediği mantık çok daha fazla olabilir.

Örneğin:

```swift id="3q2j23"
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Daha fazla kod da olabilir
}
```

Kod arttıkça, her şeyi doğrudan düğmenin içine yazmak arayüz kodunu dağınık hâle getirir ve okumayı, bakım yapmayı zorlaştırır.

Bu nedenle genellikle bu kodları bir fonksiyon içine toplarız ve ardından düğme içinde bu fonksiyonu çağırırız.

### Fonksiyon nedir

Fonksiyon, tekrar kullanılabilen bir kod parçasıdır.

Belirli kodların çalıştırılması gerektiğinde, yalnızca o fonksiyonu çağırmamız yeterlidir; böylece fonksiyonun içindeki kod çalışır.

Bu yaklaşım kod yapısını daha net yapar ve tekrar kullanımı kolaylaştırır.

### Temel yazım

Swift içinde fonksiyonlar `func` anahtar kelimesiyle tanımlanır:

```swift id="9dwb7a"
func randomInt() {
    // code
}
```

Bu kod bir fonksiyon tanımlar.

`randomInt`, fonksiyonun adıdır ve bu kod parçasını tanımlamak için kullanılır.

`()` parametre alanını ifade eder. Burada dışarıdan veri alınabilir. Eğer veriye ihtiyaç yoksa boş bırakılabilir.

`{}` içi ise fonksiyonun kod alanıdır. Çalıştırılacak tüm kod buraya yazılır.

Örneğin:

```swift id="ykhwl4"
func getName() {
    print("FangJunyu")
}
```

Bu fonksiyonun görevi bir metin yazdırmaktır.

### Fonksiyonu çağırma

Bir fonksiyonu tanımlamak yalnızca o kodu oluşturur. Onu çalıştırmak istiyorsak ayrıca çağırmamız gerekir.

Çağırma şekli, fonksiyon adının sonuna `()` eklemektir:

```swift id="j9n44v"
getName()
```

Program bu satıra geldiğinde, `getName` fonksiyonunun içindeki kod çalışır.

Tam örnek:

```swift id="oc4g5t"
func getName() {
    print("FangJunyu")
}

getName()
```

Çalıştırıldıktan sonra Console şu çıktıyı verir:

```id="o6a99f"
FangJunyu
```

### SwiftUI içinde fonksiyon kullanma

SwiftUI view’larında fonksiyonlar genellikle `body` dışında yazılır.

Örneğin:

```swift id="wl10eg"
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Düğmeye tıklandığında `getName()` fonksiyonu çağrılır.

Bu yöntem arayüz kodunun sade kalmasını sağlar; asıl mantık ise fonksiyon içinde işlenir.

### Fonksiyon parametreleri

Bazen bir fonksiyonun, verilen farklı verilere göre farklı işlemler yapması gerekir.

Örneğin fonksiyonun yalnızca sabit `"FangJunyu"` yazdırmasını değil, farklı isimler yazdırmasını isteyebiliriz.

Bu durumda parametre kullanırız. Parametre, fonksiyon çağrılırken içeri verilen veri olarak düşünülebilir.

Örneğin:

```swift id="cx5yrb"
func getName(name: String) {
    print(name)
}
```

Bu fonksiyona yeni bir parametre eklenmiştir. `name` parametre adıdır, `String` ise parametrenin türüdür.

Bu, fonksiyonun bir `String` türü veri alması gerektiği anlamına gelir.

Fonksiyon artık veriye ihtiyaç duyduğu için, çağırırken bu veriyi vermek zorundayız.

```swift id="8f5jhr"
getName(name: "Sam")
```

Çağırma sırasında `"Sam"` verilirse, fonksiyon içeride bu değeri kullanarak çıktı verir.

Çalışma sonucu:

```id="0dzjlwm"
Sam
```

## Örnek - Fonksiyon kullanarak ASCII karakter sanatı yazdırma

Önceki örnekte `print` ifadelerini doğrudan düğmenin içine yazmıştık.

Ancak karakter sanatı daha karmaşık olduğunda kod çok uzar. Bu durumda mantığı fonksiyon içine taşıyarak arayüz kodunu daha temiz hâle getirebiliriz.

Örnek kod:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Çalıştırdıktan sonra düğmeye tıklanırsa Console şu çıktıyı verir:

```id="vnjg0j"
 /\_/\
( o.o )
 > ^ <
```

Burada kullanıcı düğmeye tıkladığında iki şey olur:

1. Düğme `printCat()` fonksiyonunu çağırır
2. Fonksiyonun içindeki `print` kodları çalışır

Bu yöntem, arayüz kodunun yalnızca olayı tetiklemesini sağlar; asıl mantık ise fonksiyon içinde bulunur.

Gerçek geliştirme sürecinde, çoğu düğme işlemi fonksiyonlar aracılığıyla yapılır.

## Özet

Bu derste üç önemli içerik öğrendik:

**1. Button**

Button, SwiftUI’de bir işlemi tetiklemek için kullanılan bileşendir.

```swift id="n7uk69"
Button("Start") {

}
```

Kullanıcı düğmeye tıkladığında, süslü parantez içindeki kod çalışır.

**2. print çıktısı**

`print`, hata ayıklama bilgilerini Console’a yazdırmak için kullanılır.

```swift id="4r3vkn"
print("Hello")
```

Geliştirici, programın çalışma durumunu Console üzerinden görebilir.

**3. Fonksiyon**

Fonksiyon, tekrar kullanılabilen bir kod parçasıdır.

```swift id="wq76w1"
func sayHello() {
    print("Hello")
}
```

Fonksiyonu çağırma:

```swift id="yk7c7l"
sayHello()
```

Eğer fonksiyon veri almak zorundaysa, parametre kullanabiliriz:

```swift id="1g2pem"
func sayHello(name: String) {
    print(name)
}
```

Sonraki derslerde daha fazla SwiftUI bileşeni ve verinin arayüzle nasıl etkileşime girdiğini öğrenmeye devam edeceğiz.

## Alıştırma

Aşağıdaki alıştırmaları yapmayı deneyin:

1. Yazısı "Hello" olan bir düğme oluşturun
2. Düğmeye tıklandığında Console’da `Hello Swift` yazdırın
3. Çıktı kodunu bir fonksiyon içine yazın, ardından düğmeden bu fonksiyonu çağırın
