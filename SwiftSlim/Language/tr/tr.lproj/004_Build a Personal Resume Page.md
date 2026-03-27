# Kişisel Özgeçmiş Sayfası Oluşturma

Bu derste basit bir kişisel özgeçmiş görünümü oluşturacağız ve şu bilgileri öğreneceğiz:

- cornerRadius
- spacing
- ScrollView

Oluşturma sürecinde düzen, Text ve Image gibi bilgileri tekrar edeceğiz; ayrıca boşluk kontrolü ve içeriği kaydırma etkisini gerçekleştireceğiz.

## Kişisel özgeçmiş

Hedef görünüm:

![Swift](../../RESOURCE/004_img.png)

**Lütfen önce kendi başınıza tamamlamayı deneyin, ardından aşağıdaki anlatımı okumaya devam edin.**

### Proje oluşturma

Yeni bir iOS projesi oluşturun ya da önceki projeyi kullanmaya devam edin.

Varsayılan ContentView kodu:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
````

Şimdi kodu temizleyin ve kendi içeriğimizi yazmaya başlayın:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Genel yapı

Gerçek geliştirme sürecinde genellikle önce genel yapıyı tasarlarız.

Sayfamız şu bölümlerden oluşuyor:

1. Başlık
2. Kişisel bilgiler
3. Kişisel tanıtım

En dış katmana bir VStack ekliyoruz:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack, view’ların dikey olarak sıralanmasını sağlar ve aynı zamanda view’ların düzenini ve aralarındaki boşluğu kontrol edebilir.

### Başlık

Önce başlığı göstermek için bir Text oluşturalım.

Burada başlığı kendi İngilizce adım olarak gösteriyorum:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Başlık genellikle daha büyük ve kalın olur. Burada `font` ve `fontWeight` modifier’larını kullanıyoruz:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Yerleşim

SwiftUI’nin varsayılan hizalaması `center` olduğu için, başlık şu anda ContentView’un ortasında görünür.

![Swift](../../RESOURCE/004_img3.png)

Başlığı view’un üst kısmında göstermek istiyoruz. Bunun için düzeni `Spacer` ile ayarlayabiliriz:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer kalan alanı kaplar ve Text’i kapsayıcının üst tarafına iter.

![Swift](../../RESOURCE/004_img4.png)

### Boşluk bırakma

Eğer metnin üst kenara fazla yakın olduğunu düşünüyorsanız, `padding` veya `Spacer` kullanabilirsiniz.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Bu, VStack için üst tarafta 20 birimlik padding ayarlar.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer kullanıp ona bir `frame` yüksekliği vererek belirli bir yükseklikte boşluk da elde edebilirsiniz.

Elde edilen görünüm:

![Swift](../../RESOURCE/004_img5.png)

### Görsel

Kendi vesikalık fotoğrafımızı hazırlayıp Assets kaynak klasörüne koyuyoruz.

![Swift](../../RESOURCE/004_img6.png)

Ardından ContentView içinde Image kullanarak fotoğrafı gösteriyoruz:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Görselin orijinal boyutu büyük olduğu için, gösterim boyutunu `frame` ile kontrol etmemiz gerekir.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Bu noktada bir sorun fark ederiz:

Eğer `frame` genişlik-yükseklik oranı, görselin orijinal oranıyla uyuşmuyorsa, görsel bozulur.

Örneğin:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Görselin bozulmasını önlemek için `scaledToFit` kullanmamız gerekir:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` şunu sağlar:

Verilen `frame` alanı içinde, görseli orijinal oranını koruyarak ölçekler ve içeriği tam olarak gösterir.

Görseli tüm `frame` alanını doldurması için zorla germek yerine, genişlik-yükseklik oranını korur ve orantılı biçimde ölçekler; ta ki bir kenar sınırla tam olarak hizalanana kadar.

Bu şu anlama gelir:

* Eğer `frame` genişliği daha küçükse, görsel genişliğe göre ölçeklenir.
* Eğer `frame` yüksekliği daha küçükse, görsel yüksekliğe göre ölçeklenir.
* Görsel her zaman orijinal oranını korur ve bozulmaz.

Genellikle yalnızca tek yönün boyutunu vermek yeterlidir. Örneğin:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Bu durumda sistem, genişlik 140’a göre uygun yüksekliği otomatik hesaplar ve görsel oranını korur.

Eğer görsel oranını sabit tutmak ya da karmaşık düzenlerde sıkışmayı önlemek istiyorsanız, genişlik ve yüksekliği birlikte de sınırlandırabilirsiniz.

### Yuvarlatılmış köşe

Eğer görseli yuvarlatılmış köşelerle göstermek istiyorsanız, `cornerRadius` modifier’ını kullanabilirsiniz:

```swift
.cornerRadius(10)
```

Örneğin:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Image’ın modifier’larının sonuna `cornerRadius(20)` ekliyoruz.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)`, view sınırının kesilip 20 yarıçaplı yuvarlatılmış köşe uygulanması anlamına gelir.

Yuvarlatılmış köşe eklendikten sonra görselin dört köşesi kavisli hâle gelir. Bu da görünümü daha yumuşak ve daha modern yapar.

Bu tasarım stili güncel arayüz tasarımlarında çok yaygındır. Örneğin iOS uygulama simgeleri de yuvarlatılmış dikdörtgen biçimi kullanır. Ancak sistem simgeleri basit yuvarlatılmış köşe yerine sürekli eğriliğe sahip süperelips biçimi kullanır.

### Kişisel bilgiler

Şimdi görselin sol tarafındaki kişisel bilgi alanını oluşturalım. Arayüz yapısından kişisel bilgilerin ve görselin yatay olarak sıralandığı görülebilir; bunun için HStack kullanmamız gerekir.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Kişisel bilgi içeriği ise dikey olarak sıralanır.

![Swift](../../RESOURCE/004_img11.png)

Bu nedenle dış katmanda HStack, kişisel bilgiler için VStack ve metin içeriği için Text kullanırız.

Temel yapı:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Alan başlıklarını kalınlaştırma**

Alan adı ile alan değerini ayırt etmek için alan adlarında `fontWeight` kullanabiliriz:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Metni sola hizalama**

VStack varsayılan olarak ortalı hizalanır. Eğer tüm metinleri sola hizalamak istiyorsanız, hizalamayı ayarlamanız gerekir:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading`, soldan sağa yazı yönü olan dillerde sola hizalama anlamına gelir.

![Swift](../../RESOURCE/004_img14.png)

### Boşluk

Eğer kişisel bilgiler ile görsel arasında sabit bir boşluk bırakmak istiyorsanız, daha önce `Spacer` kullanarak boşluk vermeyi öğrenmiştik:

```swift
Spacer()
    .frame(width: 10)
```

Bunun yerine HStack’in `spacing` parametresi de kullanılabilir:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30`, iki alt view arasındaki boşluğun 30 pt olduğu anlamına gelir.

![Swift](../../RESOURCE/004_img15.png)

**spacing nedir?**

VStack, HStack ve ZStack içinde `spacing`, alt view’lar arasındaki mesafeyi kontrol eder.

Örneğin:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Bu durumda VStack içindeki alt view’lar arasındaki boşluk 10 pt olur.

![Swift](../../RESOURCE/004_img16.png)

Dikkat edilmesi gereken nokta şudur: `spacing` yalnızca “doğrudan alt view”lar üzerinde etkili olur; iç içe geçmiş kapsayıcıların kendi iç düzenini etkilemez.

**Liste içindeki boşluğu kontrol etme**

Eğer alanlar arasına boşluk eklemek istiyorsanız, en doğrudan yöntem ilgili VStack’e `spacing` vermektir:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Bu durumda tüm alt view’lar arasındaki boşluk 10 pt olur.

Ancak arayüze baktığımızda bir sorun görürüz:

Alan grupları arasında boşluk vardır, fakat alan adı ile alan değeri arasında da aynı boşluk oluşmuştur.

Bunun nedeni, `spacing`’in mevcut kapsayıcının tüm doğrudan alt view’larına uygulanmasıdır.

Bu yapıda her Text, dıştaki VStack’in doğrudan alt view’udur; bu yüzden aralıklar eşittir.

Eğer alan grupları arasında boşluk olsun, ama alan adı ile alan değeri arasındaki mesafe varsayılan sıkı düzende kalsın istiyorsanız, “alan adı + alan değeri”ni bir mantıksal bütün olarak düşünüp dışarıdan bir VStack ile sarmalayabilirsiniz:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Bu durumda yapı şu hâle gelir: dıştaki VStack’ler arasında boşluk vardır, içteki VStack’lerde ise varsayılan sıkı boşluk korunur. Böylece alan adı ile alan değeri arasında fazladan boşluk oluşmaz.

![Swift](../../RESOURCE/004_img18.png)

### Kişisel tanıtım

Şimdi kişisel tanıtım alanını oluşturalım.

Arayüz yapısına bakıldığında tanıtım içeriğinin birden fazla metin satırından oluştuğu ve bu metinlerin dikey olarak sıralandığı görülür.

![Swift](../../RESOURCE/004_img19.png)

Bu nedenle VStack ve Text birlikte kullanılabilir:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Boşluğu artırma**

Şu anda kişisel bilgi ve kişisel tanıtım bölümleri birbirine oldukça yakındır; görünüm çok estetik değildir.

![Swift](../../RESOURCE/004_img20.png)

Çünkü bunların hepsi aynı dış kapsayıcının içindedir. Bu yüzden genel boşluğu dış kapsayıcı üzerinde kontrol edebiliriz:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Elde edilen görünüm:

![Swift](../../RESOURCE/004_img21.png)

**Liste boşluğu**

Kişisel tanıtım metinleri arasındaki boşluğu ayarlamak için `spacing` kullanabiliriz:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Kişisel özgeçmişi tamamlama

Artık kişisel özgeçmişimizin temel iskeleti tamamlandı.

![Swift](../../RESOURCE/004_img.png)

### Kaydırılabilir görünüm

Şu anda sayfa yapısında VStack kullanıyoruz. Tanıtım metni az olduğunda bu sorun çıkarmaz. Fakat içerik 20, 30 ya da daha fazla satıra çıkarsa, toplam yükseklik ekranı aşar.

Örneğin:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Bu durumda iki durum ortaya çıkar:

* Alttaki içerik kesilir
* Sayfa kaydırılamaz

Bu, VStack’in sorunu değildir. VStack yalnızca bir düzen kapsayıcısıdır; otomatik olarak kaydırma yeteneği sağlamaz.

**ScrollView nedir**

ScrollView, kaydırılabilir bir kapsayıcıdır. Ekran boyutunu aşan çok miktarda içerik için uygundur. Örneğin dikey veya yatay listelerde kullanılır.

Temel yapı:

```swift
ScrollView {
    ...
}
```

Kaydırma etkisini elde etmek istiyorsak, tüm sayfa içeriğini ScrollView içine sarmalamamız gerekir:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Bu şekilde sayfanın tamamı kaydırılabilir bir alan hâline gelir. İçerik ekran yüksekliğini aştığında doğal biçimde kaydırılabilir.

ScrollView varsayılan olarak bir kaydırma çubuğu göstergesi gösterir. Eğer bu göstergenin gizlenmesini istiyorsanız, şunu kullanabilirsiniz:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Tam kod

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
