# SwiftUI Görünüm Yaşam Döngüsü

Bir önceki derste, @State değişkenlerinin görünümün yaşam döngüsünü takip ettiğini öğrenmiştik; ayrıca onAppear’in temel kullanımını da görmüştük.

Bu derste, SwiftUI görünüm yaşam döngüsünü daha derinlemesine anlayacağız; görünümün nasıl oluşturulduğunu ve ekranda gösterildiğini, görünüm içindeki değişkenlerin nasıl oluşturulup yeniden oluşturulduğunu inceleyeceğiz. Ayrıca onAppear, onDisappear ve init kurucu fonksiyonunu da öğreneceğiz.

Bu bilgiler üzerinden, SwiftUI görünümünün tüm oluşturulma sürecine dair bütünsel bir anlayış kuracağız.

## Uygulamanın Başlatılma Sırası

Bir iOS projesi oluşturduğunuzda, Xcode varsayılan olarak iki dosya üretir:

```id="r0yx3q"
ContentView.swift
ProjeAdı + App.swift
```

Bunlardan `"ProjeAdı + App".swift`, tüm uygulamanın giriş dosyasıdır.

Örneğin:

```swift id="w1igb9"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Kodun Çalışma Akışı

Uygulamayı çalıştırdığımızda (simülatörde veya gerçek cihazda), sistem önce @main anahtar sözcüğünü arar:

```swift id="ztq4i6"
@main
struct SwiftSlimTestApp: App {...}
```

Giriş dosyası belirlendikten sonra, kod yürütülmeye başlanır.

Önce App yapısına girilir, body içindeki kod çalıştırılır, ardından WindowGroup oluşturulur ve onun içindeki ContentView yüklenir.

### WindowGroup’un Görevi

WindowGroup, pencere yönetimi için kullanılır:

```swift id="387m4t"
WindowGroup {
    ContentView()
}
```

iPad ve macOS sistemlerinde çoklu pencere desteği vardır; iPhone’da ise genellikle yalnızca tek pencere bulunur.

Bu yüzden WindowGroup, iPhone üzerinde esas olarak gösterilen ilk ekranı yönetir.

### Görünümün Yüklenme Süreci

Sistem ContentView’i bulduktan sonra:

```swift id="0za5sj"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI, body içindeki kodu çalıştırır; ardından dönen görünüm yapısına göre (örneğin VStack, Text vb.) arayüzü oluşturur ve ekranda gösterir.

Bu adımlar tamamlandıktan sonra, ekranda ContentView’i görebiliriz.

![ContentView](../../Resource/016_view1.png)

Burada dikkat edilmesi gereken nokta şudur: body’nin görevi görünümü saklamak değil, görünümü üretmektir.

Bu şu anlama gelir: Her görünüm yenilendiğinde, SwiftUI body’yi yeniden hesaplar ve yeni bir görünüm yapısı oluşturur.

### Önizleme Görünümünün Mantığı

Xcode önizlemesi (Canvas) ile gerçek çalıştırma birbirinden farklı iki mekanizmadır.

Örneğin, giriş dosyasına bir hata ayıklama çıktısı ekleyelim:

```swift id="ify2mn"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode içinde ContentView önizlemesini açtığınızda, uygulama @main girişinden başlamaz; bu yüzden giriş dosyasındaki onAppear tetiklenmez.

Ancak uygulamayı simülatörde ya da gerçek cihazda çalıştırırsanız, sistem @main’den başlayarak tüm uygulamayı tam akışla çalıştırır; bu durumda girişteki onAppear tetiklenir ve hata ayıklama çıktısı görülür.

Buradaki temel fark şudur: Xcode önizlemesi yalnızca “yerel bir render” yapar ve sadece mevcut görünümü göstermek için kullanılır; simülatör ve gerçek cihaz ise “tam çalışma ortamı” sağlar ve tüm uygulamayı çalıştırır.

Bu yüzden uygulama işlevlerini test ederken asıl ölçüt simülatör veya gerçek cihaz olmalıdır; Xcode önizlemesi tam bir çalışma ortamı sunmaz.

## Görünümün Yaşam Döngüsü

Şu anki aşamada tüm kodumuz ContentView içinde bulunuyor. Ancak gerçek uygulamalarda, bir App genellikle birden fazla görünüm içerir ve bunlar farklı senaryolarda birbirleri arasında geçiş yapar.

Örneğin “kumbara” uygulamasında:

![PiggyBank](../../Resource/016_view.png)

“Para Kaydet”e tıklandığında SaveView görünümü gösterilebilir; para ekleme işlemi bittiğinde veya görünüm kapatıldığında ise SaveView kaldırılır.

İşte bu süreç, bir görünümün yaşam döngüsüdür: görünüm oluşturulur, gösterilir ve sonunda kaldırılır.

### Uygulamayı Kapatma

Uygulama kapatıldığında, tüm görünümler kaldırılır ve ilgili durumlar da yok olur.

Bu nedenle, ContentView ve diğer tüm görünümler bellekten silinir; uygulamanın tüm çalışma durumu da temizlenmiş olur.

## Görünüm İçindeki Değişkenlerin Yaşam Döngüsü

SwiftUI içinde değişkenlerin yaşam döngüsü çoğu zaman görünümle bağlantılıdır.

Örneğin:

```swift id="8hlj9p"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State Değişkeni

@State ile tanımlanan değişkenler, görünümün yaşam döngüsüne bağlıdır.

```swift id="z5zhde"
@State private var name = "FangJunyu"
```

Görünüm oluşturulduğunda name de oluşturulur; görünüm kaldırıldığında name de yok edilir.

Bu nedenle veri kalıcılığı gerektiğinde UserDefaults gibi çözümler kullanmamız gerekir.

### body İçindeki Değişkenler

body içinde tanımlanan değişkenler:

```swift id="1biv85"
var num = 10
```

Bunların yaşam döngüsü, body’nin yürütülme sürecine bağlıdır.

SwiftUI’nin durumu değiştiğinde, örneğin:

```swift id="ysv8zu"
@State private var name = "FangJunyu"
name = "Hu"
```

name değiştiğinde, @State bu değişimi algılar ve SwiftUI’ye görünümü yeniden hesaplamasını bildirir; ardından body yeniden hesaplanır.

body yeniden hesaplandığında, body içindeki tüm kod tekrar çalıştırılır ve body içindeki değişkenler de (örneğin num) yeniden oluşturulur.

Bu yüzden, body içinde karmaşık değişkenler tanımlamak tavsiye edilmez.

Çünkü görünüm her yenilendiğinde body içindeki değişkenler yeniden oluşturulur; bu da hesaplama maliyetini artırabilir ve performansı olumsuz etkileyebilir.

SwiftUI içinde farklı türde veriler farklı yöntemlerle yönetilmelidir: görünümün yaşam döngüsünü takip etmesi gereken veriler @State ile tutulabilir; geçici hesaplama verileri ise body içinde yer alabilir.

## onAppear ve onDisappear

Bir önceki derste onAppear’i öğrenmiştik; görünüm ekranda belirdiğinde onAppear çağrılır.

```swift id="x0cswp"
.onAppear {}
```

Örneğin:

```swift id="u23f0d"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode önizlemesinde ya da uygulamayı çalıştırdığınızda, onAppear içindeki hata ayıklama çıktısını görebilirsiniz.

### onDisappear

onAppear’in karşılığı onDisappear’dir:

```swift id="9w9eh9"
.onDisappear {}
```

Görünüm kapatıldığında onDisappear çağrılır.

Örneğin:

```swift id="c0pqdb"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Görünüm kaldırıldığında, onDisappear içindeki kod çalışır.

İpucu: Bu aşamada kullanılan ContentView, uygulamanın kök görünümüdür; doğrudan kapatılamaz veya kaldırılamaz. Bu nedenle, şu aşamada onDisappear’in etkisini doğrudan gözlemlemek zordur.

Daha sonraki derslerde sayfa geçişi veya yeni görünüm açma konularını öğrendiğimizde, onDisappear’in gerçekten çağrıldığını görebileceğiz.

## Oluşturma ve Gösterme Mantığı

Burada dikkat edilmesi gereken önemli nokta şudur: Görünümün oluşturulması ile görünümün ekranda gösterilmesi aynı şey değildir.

Bir görünüm oluşturulduğunda, struct’ın kurucu fonksiyonu çağrılır:

```swift id="sfjlwm"
init() {}
```

Çünkü SwiftUI görünümü bir struct yapısıdır:

```swift id="k9vtpn"
struct ContentView: View { ... }
```

Bu yüzden görünüm örneği oluşturulduğunda init çalışır. Görünüm ekranda gösterildiğinde ise onAppear çağrılır.

Örneğin:

```swift id="ypz2dl"
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode önizlemesinde hata ayıklama çıktısı şu şekilde görülebilir:

```swift id="l6v7r9"
Create ContentView
Show ContentView
```

Bu da şunu gösterir: Önce init çalışarak görünüm oluşturulur, ardından body içindeki kod hesaplanır, sonra görünüm ekranda gösterilir ve onAppear çalışır.

Yani görünümün oluşturulması ile görünümün gösterilmesi birbirinden ayrı aşamalardır.

### init Kurucu Fonksiyonu

init, Swift’in temel söz dizimlerinden biridir. Hem struct hem de class içinde tanımlanabilir ve nesneyi başlatmak için kullanılır.

```swift id="pnj3gx"
init() {}
```

SwiftUI içinde, görünüm oluşturulduğunda sistem görünümün init metodunu çağırır. Bu metot, parametre almak veya başlangıç verilerini hazırlamak için kullanılabilir.

Eğer init elle yazılmazsa, Swift struct için otomatik olarak varsayılan bir kurucu oluşturur.

ContentView gibi SwiftUI görünümlerinde, görünüm oluşturulurken init çalışır; görünüm ekranda gösterildiğinde ise onAppear çalışır.

Bu nedenle init, görünüm oluşturulurken çalışan kurucu metottur; ileride parametre aktarma veya veri başlatma gibi konularda kullanılacaktır.

## Özet

Bu derste, uygulamanın başlatılma sırasını; giriş dosyasından ContentView dosyasına kadar olan çalışma akışını öğrendik.

SwiftUI görünüm yaşam döngüsünü inceledik: görünüm oluşturulurken init çalışır, ekranda göründüğünde onAppear çalışır, kaldırıldığında veya kapatıldığında ise onDisappear çalışır.

Ayrıca görünüm güncelleme mekanizmasını da öğrendik: SwiftUI görünümü durum tarafından yönlendirilir. @State gibi durum verileri değiştiğinde, SwiftUI görünümü yeniler, body’yi yeniden hesaplar ve body içindeki değişkenler de yeniden oluşturulur.

Değişkenlerin yaşam döngüsü görünümün yaşam döngüsüyle bağlantılıdır; body içindeki geçici değişkenler ise her yenilemede yeniden oluşturulur.

Bu yaşam döngüsünü ve değişken davranışlarını anlamak, kodu daha iyi düzenlemeye ve uygulama mantığını daha açık hale getirmeye yardımcı olur.
