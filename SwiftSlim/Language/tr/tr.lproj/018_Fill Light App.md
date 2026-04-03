# Fill Light Uygulaması

Bu derste çok ilginç bir fill light uygulaması yapacağız. Gece olduğunda telefon ekranının farklı renkler göstermesini sağlayabilir ve onu basit bir dolgu ışığı olarak kullanabiliriz.

Bu fill light uygulaması, ekrana dokunarak renk değiştirebilir ve bir slider kullanarak parlaklığı ayarlayabilir.

Bu örnekte, bir view'in parlaklığını ayarlamak için `brightness`, bir view'e dokunma gesture'ı eklemek için `onTapGesture` ve `Slider` view control gibi konuları öğreneceğiz.

Sonuç:

![Color](../../Resource/018_color.png)

## Renk Gösterme

Önce view'in bir renk göstermesini sağlayalım.

SwiftUI'de `Color` yalnızca bir rengi temsil etmez, aynı zamanda bir view olarak da gösterilebilir:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Burada `Color.red` kırmızı bir view'i temsil eder. `.ignoresSafeArea()` renk view'inin tüm ekranı kaplamasını sağlar, böylece gerçek bir fill light effect'e daha çok benzer.

Sonuç:

![Color](../../Resource/018_color1.png)

### Renk array'i ve index

Şu anda yalnızca tek bir renk gösteriliyor. Ancak fill light genelde tek bir renkle sınırlı olmaz. Mavi, sarı, mor, beyaz ve başka renkleri de gösterebilir.

Ekrana dokunduğumuzda farklı renkler arasında geçiş yapmak istiyoruz. Bu renkleri bir array içine koyup birlikte yönetebiliriz:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Bir array, “aynı türden bir grup veriyi” saklamak için uygundur. Burada array içindeki her element bir `Color` değeridir.

Belirli bir rengi göstermek istiyorsak index kullanabiliriz:

```swift
colors[0]
```

Bu, array içindeki `0` index'li rengi okumak anlamına gelir; yani ilk renk.

Şimdi code şöyle yazılabilir:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Böylece ekranda array içindeki ilk renk, yani kırmızı gösterilir.

### Rengi index ile kontrol etme

Farklı renkler arasında geçiş yapmak istiyorsak, index'i sabit yazmak yerine onu yönetecek bir variable kullanmamız gerekir.

Index'i saklamak için `@State` ile bir variable tanımlayabiliriz:

```swift
@State private var index = 0
```

Buradaki `index`, mevcut rengin index'ini temsil eder.

`index` değiştiğinde SwiftUI arayüzü yeniden hesaplar ve gösterilen içeriği günceller.

Daha sonra eski `colors[0]` ifadesini şununla değiştiririz:

```swift
colors[index]
```

Böylece view içinde gösterilen renk `index` tarafından belirlenir.

Artık code şöyle olur:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` değiştiğinde `colors[index]` de farklı bir renk gösterir.

Örneğin:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Dikkat edilmesi gereken nokta, `index` değerinin array'in maksimum index'ini aşmaması gerektiğidir; aksi halde index out of range hatası oluşur.

## Dokunma gesture'ı

Artık `index` değerine göre farklı renkler gösterebiliyoruz, ancak henüz dokunarak geçiş yapamıyoruz.

Önceki “Quote Carousel” örneğinde, quote'lar arasında geçiş yapmak için `Button` kullanmıştık.

Bu kez renk değiştirmek için “renk alanının tamamına dokunmak” istiyoruz, bu yüzden `onTapGesture` daha uygundur.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Renk view'ine dokunduğumuzda şu çalışır:

```swift
index += 1
```

Bu, `index` değerinin `1` artması anlamına gelir. Index arttığında `colors[index]` array içindeki bir sonraki rengi gösterir.

### onTapGesture

`onTapGesture`, bir view'e dokunma işlemi ekleyebilen bir gesture modifier'dır.

Temel kullanım:

```swift
.onTapGesture {
    // code
}
```

Örneğin:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Bu kırmızı view'e dokunduğumuzda, süslü parantezler içindeki code çalışır ve console'a şu çıktı verilir:

```swift
Click color
```

`onTapGesture` sayesinde, bir view'e dokunduktan sonra ne olacağını ayarlayabiliriz.

### `Button` ile farkı

Daha önce `Button` view'ini öğrenmiştik. Hem `Button` hem de `onTapGesture` dokunma işlemlerini işleyebilir, ancak kullanım alanları tamamen aynı değildir.

`onTapGesture`, mevcut bir view'e dokunma özelliği eklemek için daha uygundur. Örneğin `Color`, `Image`, `Text` veya diğer sıradan view'ler gibi.

`Button` ise “Onayla”, “Gönder” ya da “Sil” gibi açıkça bir button anlamına gelen durumlar için daha uygundur.

Bu fill light uygulamasında, renk değiştirme işlevinin daha basit olmasını istiyoruz. Renk alanının tamamına dokunarak renk değiştirmek için `onTapGesture` kullanabiliriz.

## Index sorunu

Artık ekrana dokunarak farklı renkler arasında geçiş yapabiliyoruz.

Ama burada önemli bir sorun var: **index, array sınırını aşabilir**.

Örneğin:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Ekrana sürekli dokunursak `index` sonunda `4` olur ve bu da “index out of range” hatasına neden olur.

Bunun nedeni, `colors` array'inde `4` element olmasıdır. Ancak index `0`'dan başladığı için geçerli index aralığı `0 - 3` olur; `4` değil.

`colors[4]` değerine erişirsek “index out of range” oluşur.

Mevcut code'da, ekrana her dokunulduğunda `index` otomatik olarak `1` artıyor. Bunu işlemezsek sonunda mutlaka sınırı aşacaktır.

Bu nedenle ekrana dokunulduğunda index'i kontrol etmemiz gerekir: Eğer son renkteyse ilk renge dönmeli, değilse `1` artırmaya devam etmelidir.

Bunu `if` ifadesiyle yapabiliriz:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Bu code içinde `colors.count`, array içindeki element sayısını ifade eder.

Mevcut array'de `4` renk vardır, yani:

```swift
colors.count // 4
```

Ama maksimum index `4` değil, `3`'tür; çünkü index `0`'dan başlar.

Bu yüzden son index şöyle yazılır:

```swift
colors.count - 1
```

Yani:

```swift
4 - 1 = 3
```

Bu mantık şunu söyler: Eğer mevcut index zaten son rengi gösteriyorsa onu `0` olarak resetle, değilse `1` artır.

Böylece renkler döngüsel olarak değişebilir.

### Index'i sadeleştirme

Code'u daha kısa hale getirmek istiyorsak ternary operator kullanabiliriz:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Bu code şu anlama gelir: Eğer `index == colors.count - 1` doğruysa `0` döndürür. Doğru değilse `index + 1` döndürür.

Son olarak bu sonuç tekrar `index` değerine atanır.

Artık renk değiştirme effect'ini gerçekleştirebiliriz.

Tam code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Artık ekrana dokunup farklı renkler arasında geçiş yapabiliriz ve temel bir fill light uygulaması tamamlanmış olur.

## Renk adını gösterme

Renklerle eşleşen bir grup metin de ekleyebiliriz. Böylece renk değiştiğinde ekranda aynı anda mevcut rengin adı da gösterilir.

Örneğin:

- kırmızı olduğunda `Red`
- mavi olduğunda `Blue`
- sarı olduğunda `Yellow`
- mor olduğunda `Purple`

Burada da renk adlarını saklamak için bir array kullanabiliriz:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Bu array içindeki metinlerin sırası, renk array'inin sırasıyla bire bir eşleşmelidir.

Daha sonra mevcut index'e karşılık gelen renk adını `Text` ile gösterebiliriz:

```swift
Text(colorsName[index])
```

`Text`, `index` değerine göre mevcut renk adını gösterir.

`Text` görünümünü modifier'larla iyileştirebiliriz:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Böylece `Text` beyaz renkte, büyük başlık boyutunda ve kalın font ile gösterilir.

Şimdi elimizde tam ekran bir `Color` view'i var. Eğer `Text`'in `Color` view'inin üstünde görünmesini istiyorsak, `ZStack` layout container'ını kullanmamız gerekir.

```swift
ZStack {
    Color
    Text
}
```

Bunun sonucunda code şöyle değişir:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Böylece arka planda renk view'i olur ve önünde bir metin view'i katmanlı şekilde gösterilir.

Sonuç:

![Color](../../Resource/018_color2.png)

Dikkat edilmesi gereken nokta, `ZStack` içinde daha sonra yazılan view'in genelde önde görünmesidir. Eğer `Text`'i `Color`'dan önce yazarsak, sonra gelen `Color` view'i onu kapatabilir.

## Parlaklığı kontrol etme

Artık farklı renkler arasında geçiş yapabiliyoruz. Ancak fill light'ın bir önemli işlevi daha var: **parlaklığı ayarlamak**.

SwiftUI'de bir view'in parlaklığını ayarlamak için `brightness` modifier'ını kullanabiliriz.

Örneğin:

```swift
.brightness(1)
```

Şöyle yazabiliriz:

```swift
colors[index]
    .brightness(0.5)
```

Böylece mevcut renk daha parlak görünür ve fill light effect'ine daha yakın olur.

`brightness` aralığı `0 - 1`'dir. `0`, orijinal rengin korunması anlamına gelir. `1`'e yaklaştıkça renk daha parlak olur ve `1` maksimum beyaz parlaklığı ifade eder.

Code içinde `brightness` değerini kontrol edebilsek de, kullanıcı bunu henüz kendi başına ayarlayamaz.

Bunun için sürüklenebilen bir control eklememiz gerekir: `Slider`.

## Slider view'i

SwiftUI'de `Slider`, belirli bir aralık içinden değer seçmek için kullanılan kaydırmalı bir control'dür. Apple dokümantasyonu bunu “a control for selecting a value from a bounded linear range” olarak açıklar.

Temel kullanım:

```swift
Slider(value: $value, in: 0...1)
```

Parameter açıklamaları:

1. `value: $value`: `Slider` bir variable'a bind edilmelidir.

    Slider sürüklendiğinde variable'ın değeri de aynı anda değişir. Tersine, variable değişirse slider da güncellenir.

    Bu, daha önce öğrendiğimiz `TextField`'e çok benzer; ikisinde de “control ile variable'ı bind etmek” vardır.
    
    Bind edilen variable'ın önüne binding'i göstermek için `$` sembolü eklenmelidir.

2. `in: 0...1`: Bu parameter slider'ın değer aralığını gösterir.

    Burada `0...1`, minimum değerin `0`, maksimum değerin ise `1` olduğunu ifade eder.

    Slider en sola çekildiğinde bind edilen variable `0`'a yaklaşır; en sağa çekildiğinde `1`'e yaklaşır.

Örneğin:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider`, `value` variable'ına bind edilmiştir. Bu yüzden slider sürüklendiğinde `value` da aynı anda değişir.

Görünüm:

![Slider](../../Resource/018_slider.png)

`Slider` en soldayken bind edilen `value` `0` olur; en sağdayken `1` olur.

### Değer aralığı

`Slider` için değer aralığı sabit değildir. Şöyle de yazılabilir:

```swift
0...100
```

ya da başka bir aralık kullanılabilir.

Ama bu fill light uygulamasında parlaklığı kontrol etmemiz gerektiği için `0...1` en uygun seçimdir.

## Slider ile brightness kontrol etme

Şimdi `Slider` ile `brightness`'ı birbirine bağlayacağız.

Önce parlaklık değerini saklamak için bir variable oluşturalım:

```swift
@State private var slider = 0.0
```

Buradaki `0.0`, `Double` türünde bir değerdir.

`Slider` genelde sayısal bir türe bind edilir. Burada değerin sürekli değişmesini istediğimiz için `Double` kullanmak daha uygundur. Ayrıca `brightness` da yalnızca `Double` türünde değer kabul eder.

Daha sonra bu değeri `brightness`'a aktarabiliriz:

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` olduğunda renk varsayılan durumunda kalır; `slider` değeri `1`'e yaklaştıkça renk daha parlak görünür.

### Slider control'ünü ekleme

Sonraki adımda, bu variable'ı değiştirmek için bir `Slider` control'ü ekleyelim:

```swift
Slider(value: $slider, in: 0...1)
```

Slider değiştiğinde `slider` değeri de değişir; aynı anda `brightness(slider)` da parlaklığı günceller.

Bu, SwiftUI'de çok tipik bir “variable drives the view” örneğidir.

### Slider görünümünü ayarlama

Varsayılan olarak `Slider`, genişliğini mevcut alana göre ayarlar.

Ona sabit bir genişlik verebiliriz:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Ardından daha belirgin görünmesi için birkaç modifier ekleyelim:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Böylece slider beyaz bir arka plana ve yuvarlatılmış köşelere sahip olur; bu da `Color` view'i üzerinde daha belirgin görünmesini sağlar.

Son olarak onu ekranın alt kısmına yerleştirelim.

Zaten `ZStack` kullandığımız için içine bir `VStack` daha ekleyebilir ve `Spacer()` ile `Slider`'ı en alta itebiliriz.

## Tam code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Sonuç:

![Color](../../Resource/018_color.png)

## Özet

Daha önce öğrendiğimiz bilgileri, renkler ve array'ler gibi temel konularla birleştirerek çok ilginç bir fill light uygulaması yaptık.

Bu fill light uygulaması sayesinde, `brightness` ile parlaklık ayarlamayı, `onTapGesture` ile bir view'e dokunma işlemi eklemeyi ve `Slider` view control'ünü kullanmayı öğrendik.

`Color` view'ine `onTapGesture` ekleyerek renk değiştirme işlevini gerçekleştirdik. `Slider` control'ü üzerinden bir variable'ı kontrol ederek `brightness`'ı yönettik ve böylece rengin parlaklığını ayarladık. Bu da “variable drives the view” düşüncesinin bir örneğidir.

Ternary operator'ü tekrar gözden geçirdik, view'leri üst üste yerleştirmek için `ZStack` kullandık ve aynı türden veri grubunu yönetmek için array kullandık. Bu sayede array ve index anlayışımız derinleşti; ayrıca pratikte index out of range sorununu da dikkate aldık.

Bu örnek karmaşık değildir. Ama daha önce öğrendiğimiz pek çok temel bilgiyi bir araya getirir. Onları küçük ama gerçek bir project içinde kullandığımızda, her bir kavramın ne işe yaradığını daha kolay anlarız.

### Gerçek kullanım senaryosu

Masanın üzerine eski bir iPhone koyduğunuzu ve kendi geliştirdiğiniz fill light uygulamasıyla ışığın rengini kontrol ettiğinizi düşünün. Bu çok iyi bir deneyim olurdu.

App Store'da pek çok “fill light” uygulaması görebiliriz; onlar da çok karmaşık görünmüyor.

![AppStore](../../Resource/018_appStore.PNG)

Basit uygulamalar geliştirerek başlayabilir ve App Store'a yüklemeyi deneyebiliriz. Bu yalnızca geliştirmeye olan ilgimizi artırmaz, aynı zamanda gelişim yolculuğumuzu da kaydeder.

### Ders sonrası alıştırma

Bu fill light uygulamasını nasıl daha da geliştirebileceğinizi düşünmeye devam edebilirsiniz. Örneğin:

- daha fazla renk ekleyin
- mevcut brightness değerini gösterin
- alttaki slider alanının tasarımını güzelleştirin

Bu temel bilgileri gerçekten kullanmaya başladığınızda, öğrendiğimiz her şeyin aslında uygulama geliştirmek için bir araç olduğunu fark edeceksiniz.
