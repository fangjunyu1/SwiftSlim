# Fotoğraf Duvarı

Bu derste bir fotoğraf duvarı sayfası yapacağız.

![view](../../../Resource/032_view13.png)

Bu örnekte `extension`, `self` ve örnek kavramlarını tekrar edecek, ayrıca SwiftUI'de sık kullanılan `Shape` şekillerini öğreneceğiz.

Bu bilgilerle sıradan görselleri daire, yuvarlatılmış dikdörtgen, kapsül ve elips gibi farklı stillerde kırpabilir, fotoğraflara kenarlık efekti ekleyebiliriz.

Bu derste birkaç yeni bilgi noktası kullanılacak: `Shape`, `clipShape`, `strokeBorder` ve `overlay`.

Bunların içinde `clipShape` görünümün şeklini kırpmak için, `strokeBorder` şekil kenarlığı çizmek için, `overlay` ise geçerli görünümün üstüne yeni bir görünüm bindirmek için kullanılır.

## Görsel Kaynakları

Başlamadan önce birkaç görsel hazırlamamız gerekir.

Kendi fotoğraflarını kullanabilir veya bu derste verilen örnek görselleri kullanabilirsin.

Bu dersteki fotoğraf örnekleri [Pixabay](https://pixabay.com/) sitesinden alınmıştır:

[Manzara](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Tilki](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Yapı](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Çiçek](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Kuğu](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Görselleri indirdikten sonra bunları `Assets` kaynak klasörüne ekleyin ve sırasıyla `1`, `2`, `3`, `4`, `5` olarak adlandırın.

![assets](../../../Resource/032_view17.png)

Böylece SwiftUI içinde görselleri `Image("1")`, `Image("2")` gibi yöntemlerle gösterebiliriz.

## Fotoğrafları Gösterme

Öncelikle `ContentView` içinde 5 fotoğraf gösteriyoruz:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Gösterim sonucu:

![view](../../../Resource/032_view.png)

Bu kodda fotoğraf listesinin kaydırılarak gösterilmesi için `ScrollView`, birden fazla görselin yukarıdan aşağıya dizilmesi için de `VStack` kullanıyoruz.

Her görsel `.resizable()`, `.scaledToFit()` ve `.frame(width: 300)` ile görüntüleme etkisini ayarlar. Böylece görsel ölçeklenebilir, oranı korunarak tam gösterilebilir ve genişliği sınırlandırılır.

`VStack` üzerindeki `.padding(.vertical, 100)` üst ve alt boşluğu artırmak için kullanılır. Böylece ilk ve son fotoğrafın ekran kenarlarına fazla yaklaşması önlenir.

Sondaki `.ignoresSafeArea()`, kaydırma görünümünün güvenli alanı yok sayması anlamına gelir. Bu sayede fotoğraflar kaydırılırken ekranın üstüne ve altına kadar uzanabilir ve sayfa daha bütünlüklü görünür.

Ancak şu anda 5 görselin tamamı aynı düzenleyicileri kullanıyor:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Tekrarlanan kod gördüğümüzde, bunu düzenlemek için `extension` kullanmayı düşünebiliriz.

## Görsel Stilini extension ile Düzenleme

`Image` için fotoğraf duvarına özel bir yöntem genişletebiliriz:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Burada `Image` tipine `photoGalleryStyle` adlı bir yöntem ekledik.

Bu yöntemin içinde daha önce tekrar tekrar kullandığımız `.resizable()`, `.scaledToFit()` ve `.frame(width: 300)` yer alır. Başka bir ifadeyle, görsel ölçekleme, oranlı gösterim ve genişlik ayarı kodlarını bir araya toplar.

Bu genişletmeyi kullandıktan sonra, orijinal görsel kodu:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

şu şekilde sadeleştirilebilir:

```swift
Image("1")
    .photoGalleryStyle()
```

Böylece her görselin aynı fotoğraf duvarı stilini uygulamak için yalnızca `.photoGalleryStyle()` çağırması yeterlidir. Kod daha sade olur ve daha sonra topluca değiştirmek de kolaylaşır.

## self'i Anlama

Genişletme yönteminde `self` yazdık:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Buradaki `self`, bu yöntemi çağıran geçerli görsel örneğini ifade eder.

Örneğin:

```swift
Image("1")
    .photoGalleryStyle()
```

Bu kodda `photoGalleryStyle()` yöntemi `Image("1")` tarafından çağrılır. Bu yüzden yöntemin içindeki `self`, bu `Image("1")` görselini temsil eder.

Basitçe şöyle anlayabilirsin: Bu yöntemi kim çağırıyorsa, `self` onu ifade eder.

Dikkat edilmesi gereken nokta şudur: SwiftUI düzenleyicileri sürekli olarak yeni görünüm sonuçları döndürür. Bu nedenle `photoGalleryStyle()`, yalnızca orijinal `Image` nesnesini döndürmek yerine düzenlenmiş bir görünüm döndürür.

## Fotoğraf Şekilleri

Artık fotoğraflar normal şekilde gösterilebiliyor. Ancak bu fotoğraflar varsayılan olarak dikdörtgendir ve biraz sıradan görünür.

Fotoğraflara yalnızca yuvarlatılmış köşeler vermek istiyorsan doğrudan `.cornerRadius()` kullanabilirsin:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Gösterim sonucu:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)`, görsele `20 pt` köşe yuvarlama değeri eklemek anlamına gelir. Sıradan yuvarlatılmış köşeli görseller için bu yazım zaten yeterlidir.

Ancak `.cornerRadius()` yalnızca yuvarlatılmış köşe etkisini işleyebilir ve sıradan yuvarlatılmış köşeli görseller yapmak için uygundur. Fotoğrafları daha fazla farklı şekle dönüştürmek istiyorsak, yalnızca bu düzenleyici yeterli olmaz.

Bu noktada SwiftUI içindeki `Shape` kullanılmalıdır. `Shape` farklı şekilleri temsil edebilir; `clipShape` ile birlikte kullanıldığında görseli ilgili şekle göre kırpabilir.

## Shape'i Tanıma

SwiftUI'de `Shape` bir şekli temsil eder. `View` gibi, SwiftUI içinde çok sık kullanılan bir tiptir.

Yaygın `Shape` türleri arasında daire, dikdörtgen, yuvarlatılmış dikdörtgen, kapsül ve elips bulunur. Farklı şekillerin görünümünü daha sezgisel gözlemlemek için aşağıdaki örneklerde her şekle farklı renk ve boyut verilir.

Bu örneklerde `.fill()` şekli renkle doldurmak için, `.frame()` ise şeklin görüntüleme boyutunu ayarlamak için kullanılır. Renkler yalnızca farklı şekilleri ayırt etmek içindir; şekillerin kendi sabit renkleri değildir.

### Circle Daire

`Circle` daireyi temsil eder. Genellikle avatar, dairesel düğme, dairesel görsel gibi arayüz etkilerinde kullanılır.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle Dikdörtgen

`Rectangle` dikdörtgeni temsil eder. En temel şekillerden biridir; arka plan, bölünmüş alan veya sıradan kenarlık oluşturmak için de kullanılabilir.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle Yuvarlatılmış Dikdörtgen

`RoundedRectangle` yuvarlatılmış dikdörtgeni temsil eder. `cornerRadius` köşe yuvarlama boyutunu ayarlamak için kullanılır.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule Kapsül Şekli

`Capsule` kapsül şeklini temsil eder. İki ucu yay biçimindedir; genellikle kapsül düğmeler, etiket arka planları gibi arayüz etkilerinde kullanılır.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse Elips

`Ellipse` elipsi temsil eder. `Circle` ile benzerdir; ancak genişlik ve yükseklik farklı olduğunda elips olarak görünür.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Bu örnekler sayesinde `Shape` öğesinin doğrudan şekil olarak gösterilebildiğini görebiliriz. Sonraki adımda bu `Shape` türlerini `clipShape` ile birlikte kullanarak fotoğrafları farklı şekillerde göstereceğiz.

## clipShape ile Fotoğrafları Kırpma

Şimdi `clipShape` kullanarak fotoğrafları farklı şekillere kırpabiliriz.

Örneğin, ilk fotoğrafı daire şeklinde kırpalım:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Bu kod şu anlama gelir: Önce bir görsel gösterilir, sonra `Circle()` kullanılarak daire şeklinde kırpılır.

![view](../../../Resource/032_view2.png)

`clipShape` için temel yazım şöyledir:

```swift
.clipShape(şekil)
```

Görünümün arkasına `.clipShape(...)` eklenir ve parantezin içine kırpmak istediğin şekil yazılır.

Örneğin:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Şimdi 5 fotoğrafı ayrı ayrı farklı şekillerde kırpıyoruz:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Gösterim sonucu:

![view](../../../Resource/032_view8.png)

Bunların içinde `Rectangle()` ile kırpılan sonuç sıradan dikdörtgen fotoğrafa yakındır. Bu yüzden görsel değişiklik belirgin değildir ve esas olarak diğer şekillerle karşılaştırma yapmak için kullanılır.

Artık fotoğraflar yalnızca sıradan dikdörtgenler değildir; farklı şekillere sahiptir.

## Fotoğraf Kenarlığı Ekleme

Dairesel bir fotoğrafa kenarlık eklemek istersek, `border` kullanmayı düşünebiliriz:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Ancak bu şekilde genellikle dairesel bir kenarlık değil, dikdörtgen bir kenarlık elde edilir.

![view](../../../Resource/032_view9.png)

Bunun nedeni `border` düzenleyicisinin kenarlığı `clipShape` ile kırpılmış şekle göre değil, görünümün dikdörtgen alanına göre eklemesidir.

Bu yüzden dairesel kenarlık istiyorsak `border` doğrudan kullanılamaz.

## strokeBorder ile Şekil Kenarlığı Çizme

SwiftUI'de `strokeBorder`, bu yaygın `Shape` türleri için iç kenarlık çizebilir.

Örneğin, dairesel bir kenarlık çizelim:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Bu kod şu anlama gelir: `Circle` için kahverengi bir kenarlık çizilir ve kenarlık genişliği `10 pt` olur.

![view](../../../Resource/032_view12.png)

Burada dikkat edilmesi gereken nokta, `strokeBorder` öğesinin fotoğrafa doğrudan kenarlık eklememesidir. Bunun yerine `Circle()` şekli için kenarlık çizer.

Başka bir deyişle, bu kod yalnızca bağımsız bir dairesel kenarlık oluşturur; henüz fotoğrafla ilişkili değildir.

Bu dairesel kenarlığın fotoğrafın üzerinde görünmesini istiyorsak, kenarlığı fotoğrafın üstüne bindirmek için `overlay` kullanmaya devam etmemiz gerekir.

## overlay ile Kenarlık Bindirme

`overlay`, geçerli görünümün üstüne yeni bir görünüm bindirebilen bir görünüm düzenleyicisidir.

Temel yapısı şöyle anlaşılabilir:

```swift
Geçerli görünüm
    .overlay {
        Üste bindirilen görünüm
    }
```

Bu örnekte geçerli görünüm, daha önce daire şeklinde kırpılmış fotoğraftır:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Üste bindirmek istediğimiz yeni görünüm ise dairesel bir kenarlıktır:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Bu yüzden fotoğraf ve kenarlığı şu şekilde birleştirebiliriz:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Buradaki `overlay`, geçerli görünümün üstüne yeni bir görünüm bindirmek anlamına gelir.

`overlay` içinde kenarlık, geçerli fotoğrafın görüntüleme alanını takip ederek bindirilir. Bu yüzden ayrıca `frame` ayarlamaya gerek yoktur. Kenarlık şekli kırpma şekliyle aynı olduğu sürece, kenarlık fotoğrafa tam oturabilir.

![view](../../../Resource/032_view10.png)

Nihai etki, dairesel fotoğrafın üstüne dairesel bir kenarlık yerleştirilmiş olmasıdır.

`ZStack` ile karşılaştırıldığında `overlay`, “geçerli görünüme dekorasyon ekleme” türündeki senaryolar için daha uygundur. Fotoğraf ana öğedir, kenarlık ise yalnızca ek bir etkidir; bu nedenle `overlay` kullanmak daha nettir.

## Fotoğraf Duvarını Tamamlama

Şimdi her fotoğrafa karşılık gelen şekli ve kenarlığı ekliyoruz:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Gösterim sonucu:

![view](../../../Resource/032_view13.png)

Böylece temel bir fotoğraf duvarı sayfası tamamlanmış olur.

Bu sayfada kaydırılabilir gösterim için `ScrollView`, fotoğrafları göstermek için `Image`, fotoğraf şekillerini kırpmak için `clipShape`, kenarlık eklemek için ise `overlay` ve `strokeBorder` kullandık.

## Tam Kod

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Özet

Bu derste bir fotoğraf duvarı sayfası tamamladık.

![view](../../../Resource/032_view13.png)

Bu örnekte önce fotoğrafları göstermek için `Image` kullandık. Ardından tekrarlanan görsel stili kodlarını düzenlemek için `extension` aracılığıyla `Image` tipine `photoGalleryStyle` yöntemi ekledik.

Sonrasında SwiftUI'de sık kullanılan `Shape` türlerini öğrendik. Örneğin `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ve `Ellipse`. Bu şekiller yalnızca doğrudan gösterilmekle kalmaz; `clipShape` ile birlikte görünüm kırpmak için de kullanılabilir.

Örneğin:

```swift
.clipShape(Circle())
```

bu, görünümü daire şeklinde kırpmak anlamına gelir.

Son olarak fotoğraflara karşılık gelen şekil kenarlıklarını eklemek için `overlay` ve `strokeBorder` kullandık. Dikkat edilmesi gereken nokta şudur: `border` genellikle görünümün dikdörtgen alanına göre kenarlık çizer. Kenarlığın daire, kapsül veya elipsi takip etmesini istiyorsan, aynı `Shape` öğesini üstüne bindirmek daha uygundur.

Bu ders sayesinde yalnızca fotoğraf duvarı etkisini tamamlamadık, aynı zamanda arayüzlerde `Shape`, `clipShape`, `strokeBorder` ve `overlay` öğelerinin yaygın kombinasyon kullanımını da anladık.

## Ders Sonrası Alıştırmalar

### 1. Fotoğraf Duvarı Arka Planı Ekleme

Fotoğraf duvarı sayfasına tam ekran bir arka plan görseli ekleyin.

Gereksinim: Arka plan görseli tüm ekranı kaplamalı ve güvenli alanı yok saymalıdır.

### 2. Gradyan Kenarlık

Mevcut tek renkli kenarlıkları doğrusal gradyan kenarlıklara dönüştürün.

Daha zengin kenarlık efektleri oluşturmak için `LinearGradient` kullanmayı deneyebilirsin.

### 3. Gerçekçi Fotoğraf Çerçevesi

İnternette bazı gerçek fotoğraf çerçevesi stilleri arayın ve fotoğrafların gerçek çerçevelere daha yakın görünmesi için `overlay` ile görsel çerçeveleri üstüne bindirmeyi deneyin.

Alıştırma gösterim sonucu:

![button](../../../Resource/032_view15.jpeg)

### 4. Yuvarlatılmış Düğme Kenarlığı Uygulama

Gerçek geliştirmede düğmeler genellikle yuvarlatılmış dikdörtgen kenarlıklar kullanır.

Yuvarlatılmış bir düğme yapmayı deneyin ve düğmeye yuvarlatılmış kenarlık eklemek için `RoundedRectangle` ile `strokeBorder` kullanın.

Alıştırma gösterim sonucu:

![button](../../../Resource/032_view14.png)

### Düşünme Sorusu

Tek renkli kenarlık veya gradyan kenarlık kullanmak istemiyor, bunun yerine kenarlığın belirli bir desen etkisi göstermesini istiyorsan bunu nasıl gerçekleştirmelisin?

`overlay`, `mask` veya `ImagePaint` gibi ilgili kullanımları öğrenmek için kaynak aramayı deneyebilirsin.

Alıştırma gösterim sonucu:

![button](../../../Resource/032_view16.png)
