# Görünüm Uyarlaması

Bu derste, açık mod ve koyu mod için arayüz görünüm uyarlamasını öğreneceğiz.

iPhone, iPad ve Mac üzerinde kullanıcılar açık modu ya da koyu modu seçebilir.

Sistem koyu moda geçtiğinde, birçok uygulamanın arka planı, metni ve simge renkleri de buna göre değişir.

Örneğin, gündüz arayüzü açık renkli bir arka plan kullanabilir; gece ise koyu renkli bir arka plana dönüşebilir.

![view](../../../Resource/025_view9.png)

Arayüz görüntüsünü sistem görünümüne göre otomatik olarak ayarlama becerisine görünüm uyarlaması denir.

## Xcode’da Görünüm Uyarlamasını Önizleme

Görünüm uyarlamasını öğrenmeden önce, Xcode’da açık modu ve koyu modu nasıl önizleyebileceğimizi görelim.

`Canvas` alanının alt kısmında, `Device Settings` düğmesine tıklayarak `Canvas Device Settings` açılır penceresini açabilirsiniz.

![canvas](../../../Resource/025_view.png)

Açılır pencerede `Color Scheme` ayarını görebilirsiniz.

![canvas1](../../../Resource/025_view1.png)

Burada:

- `Light Appearance` açık modu ifade eder.
- `Dark Appearance` koyu modu ifade eder.

Buradan önizleme görünümünü değiştirerek mevcut arayüzün açık modda ve koyu modda nasıl göründüğünü kontrol edebiliriz.

## İki Görünümü Yan Yana Gösterme

Açık modu ve koyu modu aynı anda görmek isterseniz, `Variants` özelliğini kullanabilirsiniz.

`Canvas` alanının alt kısmında `Variants` düğmesine tıklayın ve `Color Scheme Variants` seçeneğini seçin.

![canvas2](../../../Resource/025_view2.png)

Seçtikten sonra `Canvas`, açık mod ve koyu mod önizlemelerini aynı anda gösterir.

![canvas3](../../../Resource/025_view3.png)

Bu, iki görünüm arasındaki arayüz farklarını karşılaştırmayı daha kolay hale getirir.

Basitçe söylemek gerekirse:

Yalnızca açık/koyu mod arasında geçici olarak geçiş yapmak istiyorsanız, `Canvas Device Settings` kullanabilirsiniz.

İki görünümü aynı anda görmek istiyorsanız, `Color Scheme Variants` kullanabilirsiniz.

## Görünümler Varsayılan Olarak Görünüme Uyar

SwiftUI’da birçok sistem görünümü varsayılan olarak açık moda ve koyu moda otomatik uyum sağlar.

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Açık")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("örnek örnek örnek")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Gösterim sonucu:

![canvas](../../../Resource/025_view4.png)

Görülebileceği gibi, açık modda simgeler ve başlıklar genellikle koyu renkte görünür.

Koyu modda ise simgeler ve başlıklar otomatik olarak açık renge dönüşür.

Bunun nedeni, `Text`, `Image` gibi SwiftUI görünümlerinin varsayılan olarak renklerini sistem görünümüne göre ayarlamasıdır.

Başka bir deyişle, sabit bir rengi elle belirtmezsek SwiftUI görünüm uyarlamasının bir kısmını bizim için işler.

## Sabit Renkler Otomatik Olarak Değişmez

Dikkat edilmesi gereken nokta şudur: sabit bir rengi elle belirtirsek, bu renk açık/koyu moda göre otomatik olarak değişmez.

Örneğin:

```swift
Text("örnek örnek örnek")
	.foregroundStyle(Color.gray)
```

Buradaki metin `Color.gray` olarak ayarlandığı için her zaman gri renkte görüntülenir.

Başka bir örnek:

```swift
Text("Başlık")
    .foregroundStyle(Color.white)
```

Bu kod, açık modda da koyu modda da beyaz metin gösterir.

Arka plan da açık renkliyse, beyaz metni görmek zorlaşabilir.

Bu yüzden görünüm uyarlaması yaparken `Color.white` ve `Color.black` gibi sabit renkleri gelişigüzel yazmaktan mümkün olduğunca kaçınmak gerekir.

Birçok durumda sistemin anlamsal stillerini öncelemek daha uygundur. Örneğin:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Burada:

- `.primary` genellikle birincil içerik için kullanılır.
- `.secondary` genellikle ikincil içerik için kullanılır.

Bunlar açık/koyu moda göre görüntü etkisini otomatik olarak ayarlar.

## Görünüme Göre Farklı İçerik Gösterme

Bazen yalnızca renklerin değişmesini değil, farklı görünümlerde farklı içeriklerin gösterilmesini de isteriz.

Örneğin:

- Açık modda normal ampul simgesi gösterilsin.
- Koyu modda parlayan ampul simgesi gösterilsin.
- Açık modda başlık `Açık` olarak gösterilsin.
- Koyu modda başlık `Koyu` olarak gösterilsin.

Bu durumda, mevcut sistemin açık modda mı yoksa koyu modda mı olduğunu belirlememiz gerekir.

SwiftUI’da mevcut görünüm modunu `colorScheme` ortam değeri üzerinden alabiliriz:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Tam kod:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Açık" : "Koyu"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("örnek örnek örnek")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Gösterim sonucu:

![view](../../../Resource/025_view5.png)

Önizleme sonucundan, aynı görünümün farklı görünüm modlarında tamamen aynı içeriği göstermediğini görebilirsiniz.

Açık modda `Image` normal ampul simgesini gösterir, başlık ise `Açık` olarak görünür.

Koyu modda `Image` parlayan ampul simgesini gösterir, başlık ise `Koyu` olarak görünür.

Yani buradaki değişiklik yalnızca renk değişikliği değildir; simge adı ve başlık metninin kendisi de değişmiştir.

Bunun nedeni, simgeyi ve başlığı doğrudan `body` içinde sabit olarak yazmamamızdır. Bunun yerine `colorScheme` değerine göre farklı içerikler hesaplarız.

Bu kodda iki hesaplanan özellik kullanıyoruz:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Açık" : "Koyu"
}
```

`colorScheme` değeri `.light` olduğunda, mevcut modun açık mod olduğunu gösterir.

`colorScheme` değeri `.dark` olduğunda, mevcut modun koyu mod olduğunu gösterir.

Bu yüzden farklı görünüm modlarına göre farklı simge adları ve başlık metinleri döndürebiliriz.

Bu da hesaplanan özelliklerin yaygın kullanım alanlarından biridir: mevcut duruma göre görünümün göstermesi gereken içeriği hesaplamak.

## @Environment’ı Anlama

`@Environment` ile ilk kez burada karşılaşıyoruz.

`@Environment`, SwiftUI ortamından bir değer okumak olarak anlaşılabilir.

Bir App çalışırken sistem birçok ortam bilgisi sağlar. Örneğin:

- Geçerli dil
- Geçerli görünüm modu
- Geçerli yerleşim yönü
- Geçerli yazı tipi boyutu ayarı

Mevcut görünüm modunu almamız gerektiğinde `colorScheme` değerini okuyabiliriz:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Burada:

```swift
\.colorScheme
```

ortamdan `colorScheme` değerini okumak anlamına gelir.

```swift
private var colorScheme
```

okunan değeri `colorScheme` değişkenine kaydetmek anlamına gelir.

Değişken adını kendiniz belirleyebilirsiniz. Örneğin şöyle de yazabilirsiniz:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Öndeki `\.colorScheme` değişmediği sürece, okunan değer mevcut görünüm modudur.

## colorScheme’in İki Yaygın Değeri

`colorScheme` genellikle iki değere sahiptir:

```swift
.light
.dark
```

Bunlar şunu ifade eder:

- `.light`: açık mod
- `.dark`: koyu mod

Örneğin:

```swift
private var titleName: String {
    colorScheme == .light ? "Açık" : "Koyu"
}
```

Bu kodun anlamı şudur:

Geçerli mod açık modsa, `colorScheme == .light` doğru olur ve `"Açık"` değerini döndürür.

Aksi takdirde `"Koyu"` değerini döndürür.

Bu yüzden açık modda:

```swift
Text(titleName)
```

Görüntülenen metin şudur:

```swift
Açık
```

Koyu modda ise görüntülenen metin şudur:

```swift
Koyu
```

Bu yöntemle farklı görünümlere göre farklı içerikler gösterebiliriz.

## Renk Uyarlama Örneği

Metin ve simgelerin yanında, bazen renk uyarlamasını kendimizin işlemesi de gerekir.

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Metin")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Gösterim sonucu:

![view](../../../Resource/025_view6.png)

Bu kodda metin beyaz, arka plan ise siyahtır.

Açık modda siyah arka plan oldukça belirgindir.

Ancak koyu modda, tüm arayüzün arka planı da siyahsa, bu siyah arka plan sistem arka planına karışır ve yeterince net görünmeyebilir.

Bu durumda görünüm moduna göre metin rengini ve arka plan rengini değiştirebiliriz:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Metin")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Gösterim sonucu:

![view](../../../Resource/025_view7.png)

Şimdi açık modda siyah arka plan ve beyaz metin kullanılır.

Koyu modda ise beyaz arka plan ve siyah metin kullanılır.

Böylece hangi görünüm kullanılırsa kullanılsın, metin ve arka plan arasında belirgin bir kontrast olur ve kullanıcı içeriği net şekilde görebilir.

## Renkleri Uyarlamak İçin Assets Kullanma

`colorScheme` ile elle kontrol etmenin yanında, açık/koyu mod uyarlaması için `Assets` kaynak renklerini de kullanabiliriz.

Bu yöntem, App içinde ortak kullanılan renkleri yönetmek için daha uygundur.

Xcode projesinde `Assets` kaynak klasörünü bulun.

![assets](../../../Resource/025_color.png)

`Assets` klasörünü açın, boş bir alana sağ tıklayın ve yeni bir renk kaynağı oluşturmak için `New Color Set` seçeneğini seçin.

![assets](../../../Resource/025_color1.png)

Burada bir renk oluşturup adını `redText` olarak belirliyoruz.

![assets](../../../Resource/025_color2.png)

Renk kaynağı, açık mod ve koyu mod için renkleri ayrı ayrı ayarlayabilir.

![assets](../../../Resource/025_color3.png)

İlgili renk alanını seçtikten sonra, sağ taraftaki özellik denetçisinden rengi değiştirebilirsiniz.

Denetçi alanını açmak için sağ üst köşedeki `Hide or show the Inspectors` düğmesine tıklayın.

Ardından `Show the Attributes inspector` seçeneğini seçin, alt kısımda `Show Color Panel` öğesini bulun ve renk panelini açın.

![assets](../../../Resource/025_color4.png)

Renk panelindeki bir renge tıkladığınızda, `redText` için karşılık gelen renk alanı da eş zamanlı olarak değişir.

Burada `redText` değerini şöyle ayarlıyoruz:

- Açık modda kırmızı göster
- Koyu modda yeşil göster

![assets](../../../Resource/025_color5.png)

SwiftUI koduna döndüğümüzde bu rengi şöyle kullanabiliriz:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Burada:

```swift
Color("redText")
```

`Assets` içinden `redText` adlı renk kaynağını okumak anlamına gelir.

Gösterim sonucu:

![assets](../../../Resource/025_view8.png)

Aynı `Color("redText")` değerinin açık modda ve koyu modda farklı renkler gösterdiğini görebilirsiniz.

Bu, `Assets` renklerinin kendilerinin de görünüm uyarlamasını desteklediğini gösterir.

## colorScheme ve Assets Arasındaki Fark

`colorScheme` ve `Assets` ikisi de görünüm uyarlaması yapabilir, ancak uygun oldukları senaryolar farklıdır.

Yalnızca açık/koyu moda göre metin içeriğini, resim adını veya `SF Symbols` adını değiştirmek istiyorsanız `colorScheme` kullanabilirsiniz.

Örneğin:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Eğer renk App içinde sık kullanılan bir renkse, örneğin tema rengi, kart arka plan rengi veya metin rengi gibi, `Assets` renklerini kullanmak daha çok önerilir.

Çünkü `Assets` renkleri birden fazla görünümde yeniden kullanılabilir ve daha sonra değiştirmek daha kolaydır.

Örneğin:

```swift
Color("redText")
```

Bu şekilde yalnızca `Assets` içindeki rengi değiştirmeniz yeterlidir; bu rengi kullanan tüm yerler birlikte değişir.

## Özet

Bu derste açık mod ve koyu mod için görünüm uyarlamasını öğrendik.

İlk olarak Xcode’daki `Canvas` içinde farklı görünümleri nasıl önizleyeceğimizi ve `Color Scheme Variants` kullanarak açık mod ile koyu modu aynı anda nasıl göreceğimizi öğrendik.

Ardından SwiftUI’daki `Text`, `Image` gibi görünümlerin varsayılan olarak renklerini sistem görünümüne göre otomatik uyarladığını öğrendik.

Ancak `Color.white` veya `Color.black` gibi sabit renkleri elle belirtirsek, bu renkler otomatik olarak değişmez.

Sonra `@Environment` ve `colorScheme` konularını öğrendik:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme` aracılığıyla mevcut modun açık mod mu yoksa koyu mod mu olduğunu belirleyebilir ve farklı görünümlere göre farklı simgeler, metinler veya renkler gösterebiliriz.

Son olarak `Assets` renklerini öğrendik.

`Assets` renkleri açık mod ve koyu mod için renkleri ayrı ayrı ayarlayabilir; bu yüzden App içinde ortak kullanılan renk kaynaklarını yönetmek için uygundur.

Görünüm uyarlaması, App’in hem gündüz hem de gece daha iyi görünmesini sağlar; metnin okunamaması veya arka planın belirgin olmaması gibi sorunları da önleyebilir.

Gerçek geliştirmede, önce SwiftUI’ın varsayılan uyarlama becerisini ve `Assets` renklerini kullanmanız önerilir.

Farklı görünümlerde metin, simge, resim değiştirmek veya az sayıda özel görüntüleme etkisini işlemek gerektiğinde `colorScheme` ile kontrol yapabilirsiniz.

## Ek Bilgi: Yazı Tipi Boyutunu Belirtme

Daha önce `font` öğrenirken bazı sistem yazı tipi stillerini kullanmıştık:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle`, `.callout` gibi sistem yazı tipi stillerini kullanmanın yanında, yazı tipi boyutunu elle de belirtebilirsiniz.

Örneğin:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Buradaki:

```swift
.font(.system(size: 100))
```

font boyutunu `100 pt` olarak ayarlamak anlamına gelir.

`SF Symbols` simgelerinde `font`, simge boyutunu da etkiler.

Bu yüzden bir simgenin daha büyük görünmesini istiyorsanız `.font(.system(size:))` ile boyut belirtebilirsiniz.

Örneğin:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Dikkat edilmesi gereken nokta şudur: yazı tipi boyutunu elle belirlemek daha esnek olsa da, normal metinlerde sabit yazı boyutlarını çok fazla kullanmak önerilmez.

Normal metinlerde `.title`, `.headline`, `.body`, `.caption` gibi sistem yazı tipi stillerini önceleyin.

Bu, farklı cihazlara ve kullanıcının yazı tipi ayarlarına daha iyi uyum sağlamayı kolaylaştırır.
