# Canlı Renkler

Bu derste SwiftUI’de sık kullanılan görsel modifier’ları öğreneceğiz. Bunlar şunlardır:

- Renk
- Ön plan rengi
- Arka plan rengi
- Ofset
- Saydamlık
- Bulanıklık

Ayrıca Safe Area’yı da öğreneceğiz.

Bu modifier’lar, view’ların görsel görünümünü kontrol etmek için kullanılır ve arayüzü daha net, daha katmanlı hâle getirir.

## Renk

SwiftUI’de metnin rengini ayarlayabiliriz.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` mavi rengi ifade eder. Aslında bu, `Color.blue` yazımının kısaltılmış hâlidir. Bunun nedeni type inference’dır.

Yaygın renkler şunlardır:

```id="z76fvy"
.black
.green
.yellow
.pink
.gray
...
```

Bunların hepsi `Color` türünün statik özellikleridir.

![Color](../../RESOURCE/006_color.png)

`Color`’ı bir renk türü olarak düşünebilirsiniz; `.blue`, `.red` gibi ifadeler ise onun somut renkleridir.

### Color view’u

SwiftUI’de `Color`, doğrudan bir view olarak da gösterilebilir.

```swift id="w56djm"
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Bu kod, 100 × 100 boyutunda kırmızı bir kare oluşturur.

Tüm arayüzü de tek bir renkte gösterebiliriz:

```swift id="fgy0nr"
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Çalıştırdıktan sonra kırmızının tüm ekranı kaplamadığını görürüz; iPhone’un üst ve alt kısmı hâlâ beyaz kalır. Burada Safe Area’nın varlığı devreye girer.

## Safe Area

Safe Area, içeriğin örtülmesini önlemek için sistemin ayırdığı alandır. Buna şunlar dahildir:

1. Üstteki durum çubuğu, yani saat ve pil alanı

2. Alttaki Home gösterge çubuğu

3. Çentik (notch) veya Dynamic Island alanı

![Color](../../RESOURCE/006_color3.png)

SwiftUI varsayılan olarak içeriği güvenli alan içinde sınırlar. Bu nedenle view ekranın en kenarına kadar uzanmaz.

### Safe Area’yı yok sayma

Eğer rengin tüm ekranı kaplamasını istiyorsak, `ignoresSafeArea` kullanabiliriz:

```swift id="c0y9gc"
Color.red
    .ignoresSafeArea()
```

Ya da `edgesIgnoringSafeArea` kullanabiliriz:

```swift id="d4g8x4"
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Bu şekilde view tüm ekran alanına yayılır.

Dikkat edilmesi gereken nokta şudur: `edgesIgnoringSafeArea` daha eski bir yazımdır. iOS 14’ten itibaren `ignoresSafeArea` kullanılması önerilir.

## Ön plan rengi

### foregroundStyle modifier’ı

Önceki derslerde renk ayarlamak için `foregroundStyle` kullandık.

Örneğin:

```swift id="rqsxmq"
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle`, yeni stil sistemidir ve renk, gradyan, materyal gibi yapıları destekler.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifier’ı

`foregroundColor` ile de renk ayarlanabilir:

```swift id="jy8xwm"
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Kullanımı `foregroundStyle` ile aynıdır.

Xcode’un yeni sürümlerinde, `foregroundColor` için bunun gelecekteki iOS sürümlerinde kullanımdan kaldırılabileceğine dair uyarı görülebilir. Bu yüzden öncelikli olarak `foregroundStyle` kullanılması önerilir.

## Arka plan

Eğer bir view’a arka plan rengi eklemek istiyorsak, `background` kullanabiliriz:

```swift id="zoqv45"
background(.red)
```

Örneğin metne arka plan rengi ekleyelim:

```swift id="d6786l"
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome ve benzeri uygulamalarda metin seçtiğimizde buna benzer arka plan etkileri görebiliriz.

![Color](../../RESOURCE/006_color16.png)

Eğer arka planı büyütmek istiyorsak, bunu `padding` ile birlikte kullanmalıyız:

```swift id="0kzma8"
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Burada önemli bir kurala dikkat etmek gerekir:

SwiftUI modifier’ları, view’u yukarıdan aşağıya doğru oluşturur. Daha sonra yazılan modifier, önceki sonucun üzerine uygulanır.

Dolayısıyla:

```swift id="p0eqq2"
.padding()
.background()
```

Bu, arka planın padding eklenmiş view’u saracağı anlamına gelir.

Eğer sıra ters yazılırsa:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Arka plan genişlemez. Çünkü arka plan, sonradan eklenen padding’i sarmamıştır.

## Örnek - Dört köşeli somun

Şimdi basit bir dört köşeli somun görünümü yapalım.

![Color](../../RESOURCE/006_color8.png)

Önce 50 × 50 boyutunda beyaz bir kare oluşturalım:

```swift id="lr8i2f"
Color.white
    .frame(width: 50, height: 50)
```

Bunu daire yapmak istiyorsak `cornerRadius` kullanabiliriz:

```swift id="fxdfdu"
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Köşe yarıçapı, genişlik ve yüksekliğin yarısına eşit olduğunda şekil daire olur.

Şimdi mavi bir arka plan ekleyelim:

```swift id="rj3nd4"
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Yeni eklenen `padding`, dış alanı büyütür; `background` ise bu dış alan üzerine maviyi çizer.

Böylece dört köşeli somun görünümü tamamlanmış olur.

### Başka bir yaklaşım

Dört köşeli somun görünümünü yalnızca arka plan rengiyle değil, ZStack kullanarak da yapabiliriz.

Daha önce ZStack’in üst üste sıralama sağladığını öğrenmiştik. Dört köşeli somun da bir daire ile bir dikdörtgenin üst üste gösterilmesi olarak düşünülebilir.

```swift id="myce1i"
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack, view’ları sırayla üst üste koyar. Daha sonra eklenen view, üst katmanda görünür.

## Örnek - Üst üste gelen iki daire

Birçok simge, basit şekillerin üst üste gelmesiyle oluşur. Örneğin kısmen çakışan iki daire.

![Color](../../RESOURCE/006_color14.png)

Önce iki daire oluşturalım:

```swift id="7h1m2q"
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

İki dairenin üst üste görünmesi gerektiği için ZStack düzenini kullanıyoruz:

```swift id="0uyy2h"
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

Bu durumda aynı boyuttaki iki daire tamamen üst üste biner.

Biz ise iki dairenin tamamen örtüşmesini değil, kısmen üst üste gelmesini istiyoruz. Bunun için `offset` kullanarak kaydırma etkisi oluşturabiliriz.

## Ofset

`offset`, yalnızca view’un çizim konumunu değiştirir; üst kapsayıcının düzen hesaplamasını etkilemez.

Kullanımı:

```swift id="0y39jd"
.offset(x:y:)
```

`x`, yatay yöndeki; `y` ise dikey yöndeki kayma miktarıdır.

Pozitif değer sağa ve aşağıya, negatif değer sola ve yukarıya kaydırır.

İki dairenin kısmen üst üste gelmesini `offset` ile ayarlayalım:

```swift id="dbeg7o"
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

Kırmızı dairenin düzende hesaplanan konumu değişmez; fakat çizim konumu sola doğru 25 puan kayar. Böylece iki daire arasında kısmi örtüşme etkisi oluşur.

## Saydamlık

SwiftUI’de `opacity`, view’un saydamlığını ayarlamak için kullanılır.

Temel kullanım:

```swift id="5gkigq"
.opacity(0.5)
```

`opacity` parametresi 0.0 ile 1.0 arasındadır. Buna göre:

* 0 tamamen saydamdır
* 1 ise opak, yani saydam olmayan durumdur

Turuncu dairenin saydamlığını `opacity` ile ayarlayabiliriz:

```swift id="0p02ec"
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

Turuncu dairenin `opacity` değeri 0.8 yapıldığında opaklığı yüzde 80 olur. İki daire üst üste geldiğinde, örtüşen bölgede renk karışımı etkisi oluşur.

## Bulanıklık

SwiftUI’de bulanıklık efekti vermek için `blur` kullanılabilir:

```swift id="w4r7u8"
.blur(radius:10)
```

`radius`, bulanıklığın yarıçapını tanımlar. Değer büyüdükçe bulanıklık etkisi daha belirgin olur.

İki daireye bulanıklık ekleyebiliriz:

```swift id="n44m7j"
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

Sonuç olarak iki adet oldukça bulanık daire görebiliriz.

## Özet

Bu derste SwiftUI’de sık kullanılan görsel modifier’ları ele aldık ve modifier’lar üzerinden view’un rengini, konumunu ve görsel etkilerini nasıl kontrol edeceğimizi öğrendik.

Somut örnekler sayesinde, farklı görsel modifier’ların arayüz içindeki gerçek etkisini görebildik ve ayrıca Safe Area bilgisini öğrendik.

Bunların hepsi oldukça temel modifier’lardır. Bunları sık sık alıştırma yaparak kullanmak, gerçek geliştirme sürecinde arayüz etkilerini daha net kontrol etmenize yardımcı olur.

### Ders sonrası alıştırmalar

* Bir görsele saydamlık ve bulanıklık efekti ekleyin
* Farklı saydamlıklara sahip üç daireyi üst üste yerleştirin
* Ekranı tamamen kaplayan bir arka plan görseli oluşturun ve Safe Area’yı yok sayın
* Birden fazla view’un konumunu `offset` ile ayarlayın

Bu alıştırmaların amacı API’leri ezberlemek değil, görsel değişikliklerle düzen davranışı arasındaki ilişkiyi gözlemlemektir.
