# Simülatör ve Fiziksel Cihaz

Şu ana kadar temel view yapısını tamamladık. Bu dersin ana konusu, uygulamanın simülatörde ve fiziksel cihazda (Physical Device) nasıl çalıştırılacağını öğrenmektir.

Uygulamayı ilk kez iPhone’a kurduğum zamanı hâlâ hatırlıyorum; çok mutlu olmuştum, çünkü geliştirdiğim sonucu daha doğrudan görebiliyordum. Bu tür bir olumlu geri bildirim çok değerlidir. Kendi yaptığımız uygulamayı gerçekten kullanabildiğimizde, ilgi bizi doğal olarak daha fazla bilgi öğrenmeye iter.

Şimdi, lütfen bir önceki derste tamamladığınız kişisel özgeçmiş projesini açın ve simülatör ile fiziksel cihazda çalıştırmaya hazırlanın.

## Simülatör

Xcode, farklı iPhone, iPad ve Apple Watch modellerini kapsayan birçok yerleşik simülatör içerir. Simülatör, uygulamanın farklı cihaz modelleri veya sürümlerindeki arayüz düzeni farklarını doğrulamak için kullanılabilir.

### Simülatör seçme

Xcode’un üst araç çubuğundaki cihaz listesinden bir simülatör seçin. Örneğin iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Simülatörü çalıştırma

Ardından sol üst köşedeki çalıştır düğmesine tıklayın.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode projeyi otomatik olarak derler ve simülatörü başlatır.

![Swift](../../RESOURCE/005_xcode2.png)

### Simülatörü kapatma

Simülatörü kapatmanız gerekirse, Xcode araç çubuğundaki durdur düğmesine tıklayın.

![Swift](../../RESOURCE/005_xcode3.png)

Simülatörü doğrudan da kapatabilirsiniz:

![Swift](../../RESOURCE/005_xcode17.png)

Eğer simülatörü doğrudan kapatırsanız, Xcode şu uyarıyı verebilir:

``` id="87aohh"
Thread 1: signal SIGTERM
````

Bu genellikle uygulama mantığındaki bir hata değildir; hata ayıklama sürecinin dışarıdan sonlandırılması nedeniyle oluşur. Genelde yok sayılabilir ve uygulama mantığına ait bir hata sayılmaz.

Xcode önizlemesine kıyasla simülatör, gerçek çalışma ortamına daha yakındır. Ancak yine de tam anlamıyla gerçek cihaz ortamı değildir. Düzen doğrulaması ve farklı cihazlara uyum testi için uygundur.

## Test ortamlarının önceliği hakkında

Gerçek geliştirme sürecinde test sırası şu şekilde olmalıdır:

Fiziksel cihaz > Simülatör > Xcode önizleme

Önizleme, arayüzü hızlıca ayarlamak için uygundur; simülatör, yapısal testler için uygundur; nihai doğrulama ise mutlaka fiziksel cihazda yapılmalıdır. Özellikle iCloud ile ilgili işlemlerde bu zorunludur.

## Fiziksel cihaz

Xcode önizlemesi ve simülatör, zaman zaman hatalı veya eksik gösterim verebilir. Bu nedenle fiziksel cihaz belirleyici öneme sahiptir. Sistem izinleri, performans, bildirim mekanizması gibi davranışlar yalnızca fiziksel cihazda tam olarak doğrulanabilir.

### Geliştirici modunu açma

iPhone üzerinde şu yolu izleyin:

Ayarlar → Gizlilik ve Güvenlik → Geliştirici Modu → Aç

![Swift](../../RESOURCE/005_xcode4.png)

Sistem cihazı zorunlu olarak yeniden başlatır. Geliştirici modu açılmamışsa hata ayıklama çalıştırması yapılamaz.

### Geliştirici takımını yapılandırma

Xcode’da geliştirici takımı yapılandırılmış olmalıdır; aksi takdirde uygulama imzalanamaz ve cihaza kurulamaz.

Yapılandırma yolu:

Proje adı → TARGETS → Signing & Capabilities → Team

Eğer "Add Account..." görünüyorsa, henüz bir Apple hesabı eklenmemiş demektir.

![Swift](../../RESOURCE/005_xcode5.png)

Ekle düğmesine tıklayın ve Apple ID ile giriş yapın.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID ile giriş yaptıktan sonra, ilgili hesabı seçerek geliştirici takımı yapılandırmasını tamamlayın.

![Swift](../../RESOURCE/005_xcode7.png)

### Cihazı bağlama

Bir kablo kullanarak iPhone ile Mac’i bağlayın.

İlk bağlantıda şunlar görünür:

* Mac, iPhone’un bu Mac’e bağlanmasına izin verilip verilmeyeceğini sorar
* iPhone, bu bilgisayara güvenilip güvenilmeyeceğini sorar

iPhone üzerinde mutlaka “Güven” seçeneğine dokunmalı ve ekran kilidi parolasını girmelisiniz. Ardından Xcode cihaz listesinden iPhone’unuzu seçin.

![Swift](../../RESOURCE/005_xcode9.png)

Sol üstteki çalıştır düğmesine tıklayın.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode uygulamayı derler ve iPhone’a kurar.

![Swift](../../RESOURCE/005_view.png)

**Kablosuz hata ayıklama**

iOS 11 ve sonrası sürümlerde Xcode, kablosuz hata ayıklamayı destekler.

![Swift](../../RESOURCE/005_xcode18.png)

Ön koşullar:

1. iPhone ile Mac ilk eşleştirmeyi mutlaka veri kablosu üzerinden tamamlamış olmalıdır
2. iPhone ile Mac aynı Wi-Fi ağı üzerinde olmalıdır
3. Her iki cihaz da kilitli olmamalıdır

İlk eşleştirme bir kez kabloyla tamamlandıktan sonra, daha sonra kablo çıkarılsa bile aynı ağ içindeyse doğrudan çalıştırma yapılabilir.

Dikkat edilmesi gerekenler:

* Cihaz listede görünmüyorsa kabloyu yeniden takarak tekrar bağlayabilirsiniz
* Wi-Fi üzerinden hata ayıklama bazen kararsız olabilir; bağlantı sorunu yaşanırsa kabloyu yeniden takmak yeterlidir
* Şirket ağı veya izole ağ ortamlarında bu özellik kısıtlanmış olabilir

## Yaygın hatalar ve çözüm yolları

Xcode ile iPhone’a bağlanıp hata ayıklama yaparken farklı türlerde hata mesajları görülebilir. Aşağıda birkaç yaygın sorun ve bunlara karşılık gelen çözüm yolu verilmiştir. Bunlar, bağlantı sorunlarını daha hızlı tespit edip çözmeye yardımcı olabilir.

**1. Eşleştirme tamamlanmadı**

```id="56sl0d"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Bu, Xcode ile iPhone arasındaki hata ayıklama eşleştirmesinin henüz tamamlanmadığını gösterir.

Çözüm: iPhone’da “Güven” seçeneğine dokunulduğunu doğrulayın. Hâlâ hata veriyorsa Xcode’u yeniden başlatıp tekrar bağlayın.

**2. Geliştirici takımı yapılandırılmamış**

```id="givlg1"
Signing for "SwiftSlimTest" requires a development team.
```

Bu, geliştirici takımının yapılandırılmamış olabileceğini gösterir.

Çözüm: Signing & Capabilities bölümünde giriş yapılmış hesabı seçin.

**3. Developer Disk Image bağlanamıyor**

```id="dg7ys0"
Previous preparation error: The developer disk image could not be mounted on this device.
```

Bu hata genellikle kurulum sırasında işlem yarıda kesildiğinde ortaya çıkar. Örneğin kablonun çekilmesi veya işlemin zorla durdurulması gibi durumlarda, yeniden yükleme sırasında kısıtlama oluşabilir ve bu hata görülür.

Çözüm: iPhone’u yeniden başlatın ve kabloyu tekrar takarak yeniden bağlayın.

**4. Hata ayıklama tüneli bağlantısı başarısız**

```id="7wyntj"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Bu hata genellikle VPN veya ağ proxy’si nedeniyle oluşur.

Çözüm: VPN’i veya ağ proxy’sini kapatıp tekrar deneyin.

**5. Cihaz kilitli**

```id="z3sl5c"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Cihaz kilit ekranında demektir. iPhone’un kilidini açmanız yeterlidir.

**6. Cihaz kayıtlı değil**

```id="nizs0t"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Bu, cihazın geliştirici hesabındaki cihaz listesine eklenmediğini gösterir. Xcode bu cihaz için geçerli bir provisioning profile oluşturamaz, dolayısıyla uygulamayı imzalayıp kuramaz.

Çözüm: "Register Device" seçeneğine tıklayarak cihazı otomatik kaydedin.

**7. Deployment sürümü uyuşmuyor**

```id="qyq0vv"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Bu, cihaz sistem sürümünün projenin minimum deployment sürümünden daha düşük olduğunu gösterir.

Değiştirme yolu:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Sürümü, cihazın sistem sürümünden yüksek olmayacak şekilde ayarlayın.

Ardından build klasörünü temizleyin:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Temizleme tamamlandıktan sonra tekrar çalıştırın.
