# Düzen, Görsel ve Metin

Bir önceki derste ContentView kodunu öğrenmiştik:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Bu derste SwiftUI’nin varsayılan düzen mekanizmasını, ayrıca görsel ve metin kullanma yöntemlerini öğreneceğiz. Önceki dersin temelinde, view yapısını ve görüntülenme biçimini daha ileri düzeyde anlayacağız. Bu bilgiler, temel arayüz düzenleri kurmamızı destekleyecektir.

## SwiftUI’nin varsayılan düzen mekanizması

ContentView önizlemesini açtığımızda, simge ve metnin üstten başlamadığını, ortada gösterildiğini fark ederiz.

![Swift](../../RESOURCE/003_view.png)

Varsayılan durumda Stack kapsayıcısının hizalaması `.center` olur. Bu nedenle alt view’lar çoğunlukla ortalanmış görünür.

### Alignment hizalama biçimi

Ortaya hizalama açıkça hizalama türlerinden yalnızca biridir. Eğer sola ya da sağa hizalamak istiyorsak, view’un hizalanmasını kontrol etmek için `alignment` kullanmamız gerekir.

```swift
alignment
```

SwiftUI’de hizalama genellikle iki durumda karşımıza çıkar:

**1. Stack kapsayıcısının hizalama parametresi**

Örneğin ContentView içindeki simge ve metni sola hizalayalım:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack içindeki `alignment`, yatay yöndeki hizalamayı kontrol eder.

Hizalama seçenekleri:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack yatay sıralama yapar, bu nedenle `alignment` dikey yöndeki hizalamayı kontrol eder:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack üst üste sıralama yapar. `alignment`, hem yatay hem de dikey yöndeki hizalamayı kontrol edebilir:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Eğer `alignment` açıkça belirtilmezse, VStack, HStack ve ZStack varsayılan olarak `.center` kullanır.

**2. frame içindeki alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame` tarafından sağlanan boyut, view’un kendi boyutundan büyük olduğunda, `alignment` view’un frame içindeki konumunu belirler. `frame` kullanımını ileride daha ayrıntılı öğreneceğiz; burada şimdilik sadece temel bir fikir edinmek yeterlidir.

### Spacer ve alan dağıtım mekanizması

`alignment`, view’ların yatay veya dikey yönde sıralanmasını sağlayabilir. Ancak metin ve görseli iki uca yerleştirmek istediğimizde, tek başına hizalama yeterli olmaz.

Örneğin [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) sitesinin üst bölümüne benzer bir görünüm yapmak istediğimizi düşünelim: solda NHK simgesi, sağda menü simgesi olsun.

![Swift](../../RESOURCE/003_alignment3.png)

Eğer yalnızca `alignment` kullanırsak, hem NHK simgesi hem de menü simgesi sadece aynı tarafa yerleşir. İki simgeyi sağa ve sola dağıtamayız. Bu nedenle kalan alanı dağıtmak için `Spacer` gerekir.

`Spacer`, düzen için kullanılan esnek bir view’dur ve kalan alanı otomatik olarak doldurur.

Kullanımı:

```swift
Spacer()
```

Örneğin:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Image ile Text arasına `Spacer` eklediğimizde, kalan alan `Spacer` tarafından doldurulur ve Image ile Text sırasıyla üst ve alt uca itilir.

![Swift](../../RESOURCE/003_view1.png)

Birden fazla Spacer varsa:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Kalan alan Spacer’lar arasında eşit olarak dağıtılır.

![Swift](../../RESOURCE/003_spacer.png)

## Image’ın gösterimi ve boyut kontrolü

Image view’u esas olarak görsel göstermek için kullanılır. Önceki derste öğrendiğimiz SF Symbols simgeleri, Image’ın yalnızca bir kullanım biçimiydi.

Kullanım şekli:

```swift
Image("imageName")
```

Image içindeki çift tırnakta görselin adı yazılır; dosya uzantısı eklenmez.

### Görsel gösterme

Önce bir görsel hazırlayalım.

![Swift](../../RESOURCE/003_img.jpg)

Xcode’da Assets kaynak klasörünü seçin ve görseli Assets içine sürükleyin.

![Swift](../../RESOURCE/003_img1.png)

Ardından ContentView içinde Image kullanarak görseli gösterin:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Not: SwiftUI’deki Image, GIF animasyonunu oynatamaz; yalnızca sabit bir kare gösterebilir.

### Görsel boyutunu kontrol etme

SwiftUI’de Image varsayılan olarak görselin orijinal boyutunda gösterilir. Eğer gösterim boyutunu değiştirmek istiyorsak, önce görseli ölçeklenebilir hâle getirmek için `resizable` kullanmalı, ardından düzen boyutunu belirtmek için `frame` kullanmalıyız.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifier’ı

`resizable`, görselin düzende ölçeklenebilmesini sağlar; yani her zaman orijinal boyutunu kullanmak zorunda kalmaz.

```swift
.resizable()
```

Yalnızca `resizable()` eklendiğinde `frame`, görselin gösterim boyutunu gerçekten değiştirebilir.

Eğer `resizable` eklenmezse:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

Bu durumda `frame` sadece görsel için bir düzen alanı sağlar, fakat görselin kendi boyutu değişmez.

### frame modifier’ı

`frame(width:height:)`, bir view’un genişliğini ve yüksekliğini belirtmek için kullanılır.

Temel kullanım:

```swift
.frame(width: 10,height: 10)
```

Örneğin bir görseli genişliği 300, yüksekliği 100 olan bir dikdörtgene dönüştürelim:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Genişlik veya yükseklik ayrı ayrı da ayarlanabilir:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` kombinasyonu, görselin arayüz içindeki boyutunu esnek biçimde kontrol etmeyi sağlar ve ölçeklenebilir olma özelliğini korur.

### Ölçek oranı: scaledToFit ve scaledToFill

`frame` ile verilen genişlik ve yükseklik oranı görselin kendi oranıyla uyuşmuyorsa, görsel gerilip bozulabilir.

Eğer görsel oranını koruyarak kullanılabilir düzen alanına uyum sağlamasını istiyorsak, `scaledToFit` veya `scaledToFill` kullanabiliriz.

**scaledToFit**

`scaledToFit`, görselin orijinal en-boy oranını korur ve görseli kullanılabilir alana tamamen sığacak şekilde ölçekler. Görsel kırpılmaz:

```swift
.scaledToFit()
```

veya

```swift
.aspectRatio(contentMode: .fit)
```

Bu yöntem, görselin tamamının görünmesi gerektiği ve bozulmasının istenmediği durumlar için uygundur.

Her görsele aynı genişlik ve yükseklik verilirse, görselin gerilmesi kaçınılmaz olabilir.

Örneğin:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Ölçek oranı ayarlanmadığında, görsel orijinal oranında gösterilemez.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` eklendiğinde görsel orijinal oranını korur:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` de görselin oranını korur; ancak kullanılabilir alanın tamamını doldurur. Oranlar uyuşmazsa taşan kısım kırpılır:

```swift
.scaledToFill()
```

veya

```swift
.aspectRatio(contentMode: .fill)
```

Bu yöntem, görselin tüm alanı kaplamasının istendiği durumlar için uygundur; örneğin arka plan görselleri veya banner alanları gibi. Özellikle görselin arka plan olarak kullanıldığı senaryolarda işe yarar.

**İkisi arasındaki fark**

![Swift](../../RESOURCE/003_img6.png)

## Metin

SwiftUI’de `Text`, yazı göstermek için kullanılır.

Temel kullanım:

```swift
Text("FangJunyu")
```

Önceki derste Text’i öğrenmiştik. Bu derste ise yazının daha etkili görünmesi için yazı boyutunu ve kalınlığını nasıl kontrol edeceğimizi öğreneceğiz.

### Yazı boyutu

`font` modifier’ı kullanılarak yazı boyutu kontrol edilebilir:

```swift
.font(.title)
```

Örneğin:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Yaygın yazı boyutları, büyükten küçüğe şu şekildedir:

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Yazı kalınlığı

Yazıyı kalın yapmak istiyorsak `fontWeight` modifier’ını kullanabiliriz:

```swift
.fontWeight(.bold)
```

Örneğin:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Yaygın yazı kalınlıkları, inceden kalına doğru şöyledir:

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font`, yazı boyutunu; `fontWeight` ise yazı kalınlığını kontrol eder. İkisi birlikte kullanılabilir ve metnin görsel ifadesi daha zengin hâle getirilebilir.

## Özet ve uygulama

Buraya kadar SwiftUI’nin varsayılan düzenini, Spacer’ı, Image’ı ve Text’i öğrendik. Bu bilgiler artık bazı basit view’lar geliştirmek için yeterlidir.

Örneğin: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google arayüzü oldukça temizdir; içinde görseller ve metinler bulunur. SwiftUI açısından Google’ın arayüz yapısını analiz etmeyi deneyebiliriz:

1. Genel yapı üç bölümden oluşur: Google logosu, arama kutusu ve bilgilendirici metin. Bunun için VStack ile dikey sıralama kullanılabilir.
2. Google logosu bir görseldir; Image ile gösterilebilir.
3. Arama kutusu bir giriş alanı ve simge içerir. Giriş alanını şimdilik yok sayarsak, arama simgesi Image ile gösterilebilir.
4. Bilgilendirme metni Text ile gösterilir. Metinlerin yatay sıralanması için HStack kullanılabilir; yazı rengi ise `foregroundStyle` ile kontrol edilebilir.

Bu bilgileri uygulayarak bazı basit view’lar yapabilir, Image ve Text view’larını ve bunların modifier’larını daha iyi anlayıp kullanabilirsiniz.
