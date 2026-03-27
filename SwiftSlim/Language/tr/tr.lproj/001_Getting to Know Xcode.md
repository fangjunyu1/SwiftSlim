# Xcode ile Tanışma

## Xcode nedir?

Xcode, Apple tarafından resmî olarak sunulan entegre geliştirme ortamıdır (IDE, Integrated Development Environment) ve iOS, macOS, watchOS, tvOS gibi Apple platformları için uygulama geliştirmede kullanılır.

![Swift](../../RESOURCE/001_xcode.png)

Tüm eğitim süreci boyunca kod yazmak ve programları çalıştırmak için Xcode kullanacağız.

Bu derste, Xcode’un nasıl indirileceğini, ilk iOS uygulamasının nasıl oluşturulacağını ve Xcode arayüz yapısının ilk kez nasıl tanınacağını öğreneceğiz.

## Xcode’u indirme

Xcode şu anda iki şekilde kurulabilir:

1. [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) üzerinden indirme

2. [Apple Developer resmî web sitesi](https://developer.apple.com/xcode/) üzerinden indirme

Her iki yöntemle de Xcode indirilebilir. Aradaki fark şudur: Apple Developer resmî sitesinde resmî sürümün yanı sıra [Beta](https://developer.apple.com/download/all/?q=Xcode) sürümü veya eski sürümler de indirilebilir.

Sadece öğrenme amaçlı geliştirme yapıyorsanız, resmî sürümün kullanılması önerilir. Beta sürümleri daha çok yeni özellikleri test etmek için kullanılır ve kararsızlık içerebilir.

## İlk projeyi oluşturma

Xcode’u açtıktan sonra başlangıç ekranı görünür.

![Swift](../../RESOURCE/001_xcode1.png)

Sol tarafta üç yaygın seçenek bulunur:

- Create New Project —— Yeni proje oluştur  
- Clone Git Repository —— Git deposunu klonla  
- Open Existing Project —— Mevcut projeyi aç

Sağ tarafta ise son açılan Xcode projeleri gösterilir.

Biz "Create New Project" seçeneğini seçiyoruz.

### Proje şablonunu seçme

![Swift](../../RESOURCE/001_xcode2.png)

Proje şablonu seçim ekranına girildiğinde burada birden fazla platform (iOS, macOS vb.) ve farklı türlerde proje şablonları gösterilir.

Yaygın şablon açıklamaları:
- App —— En temel uygulama türü (önerilir)
- Document App —— Belge tabanlı uygulama
- Game —— Oyun geliştirme için
- Framework —— Yeniden kullanılabilir modül

Başlangıç aşamasında yalnızca "iOS" - "App" şablonunu seçiyoruz, çünkü bu arayüz tabanlı uygulama türüdür.

Ardından "Next" düğmesine tıklayın.

### Proje bilgilerini doldurma

Proje bilgilerini doldurma ekranına girildiğinde alan türlerine göre bilgi girmemiz gerekir.

![Swift](../../RESOURCE/001_xcode3.png)

Alanların anlamı:

- Product Name —— Proje adı, örneğin: SwiftSlimTest
- Team —— Geliştirici ekibi; ücretli Apple Developer hesabınız yoksa seçmeyebilirsiniz
- Organization Identifier —— Kurum tanımlayıcısı; genellikle ters alan adı biçimi kullanılır, örneğin:
  - com.yourname
  - com.yourcompany
  - Alan adınız yoksa kendi İngilizce adınızı tanımlayıcı olarak kullanabilirsiniz
- Bundle Identifier —— Uygulamanın benzersiz kimliği; Organization Identifier ve Product Name temel alınarak otomatik oluşturulur
- Interface —— Arayüz teknolojisi; SwiftUI seçin
- Language —— Geliştirme dili; Swift seçin
- Testing System —— Varsayılan olarak test hedefi (Unit Tests) oluşturur; başlangıç aşamasında göz ardı edilebilir
- Storage —— Yerel veri kalıcılığı çerçevesi; SwiftData veya Core Data’yı otomatik entegre edebilir, başlangıç aşamasında göz ardı edilebilir

Doldurma işlemi tamamlandıktan sonra "Next" düğmesine tıklayın.

### Projeyi kaydetme

![Swift](../../RESOURCE/001_xcode4.png)

Kaydetmek için uygun bir klasör seçin.

"Create" düğmesine tıkladığınızda Xcode proje yapısını otomatik olarak oluşturur.

## Xcode proje yapısı

Xcode projesi kaydedildikten sonra Finder içinde oluşturulan proje klasörü görülebilir.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— Resimler, App simgeleri ve diğer kaynakları saklamak için kullanılan klasör

- ContentView.swift —— Varsayılan olarak oluşturulan SwiftUI görünüm dosyasıdır; sonraki aşamalarda arayüz kodlarını burada yazacağız.

- SwiftSlimTestApp.swift —— Uygulamanın giriş dosyasıdır (App Entry Point), uygulamanın başlatılmasından sorumludur; şimdilik bunu anlamamız gerekmiyor.

- SwiftSlimTest.xcodeproj —— Xcode proje dosyasıdır; bu dosyaya çift tıklayarak proje açılabilir.

## Xcode arayüzünü tanıma

Projeyi açmak için .xcodeproj dosyasına çift tıklayın, ardından sol taraftaki Navigator alanında ContentView.swift dosyasını seçin.

Xcode arayüzü temel olarak beş bölümden oluşur:

- Navigator —— Dosya yapısını görüntülemek ve arama yapmak için kullanılan gezinme alanı
- Editor —— Swift veya SwiftUI kodu yazmak için kullanılan düzenleme alanı
- Canvas —— SwiftUI önizlemesi için kullanılan tuval alanı
- Inspector —— Dosya özelliklerini görüntülemek ve değiştirmek için kullanılan özellik inceleme alanı
- Debug Area —— Günlük çıktısını görmek için kullanılan hata ayıklama alanı

![Swift](../../RESOURCE/001_xcode6.png)

Not: Canvas esas olarak SwiftUI görünüm önizlemesi için kullanılır. Xcode’un resmî mimarisi açısından bakıldığında bu bölüm, Editor alanının yardımcı önizleme panelidir (Preview Pane). Yalnızca SwiftUI görünüm dosyası açıldığında Canvas etkinleştirilebilir; diğer dosya türlerinde önizleme özelliği görünmez.

Sonraki derslerde ağırlıklı olarak Editor alanında Swift ve SwiftUI kodları yazacağız.

Bir Xcode projesi ilk kez açıldığında, Inspector ve Debug Area varsayılan olarak gizli olabilir; bunları sağ üst ve sağ alt köşedeki düğmelerle gösterebilirsiniz.

![Swift](../../RESOURCE/001_xcode7.png)

İpucu: Inspector alanı esas olarak dosya özelliklerini görüntülemek ve değiştirmek için kullanılır. Gerçek geliştirme sürecinde, daha geniş bir düzenleme alanı elde etmek için bu bölüm genellikle gizlenir.

## Özet

Bu derste, Xcode’un nasıl indirileceğini, ilk Xcode projesinin nasıl oluşturulacağını ve Xcode arayüzünün temel düzenini öğrendik.

Aşağıdaki kısım serbest deneme zamanıdır:
- Navigator alanında dosya oluşturmayı ve silmeyi deneyebilirsiniz.  
- Editor alanındaki kodu inceleyip kod yapısını gözlemleyebilirsiniz.
- Canvas alanındaki düğmelere bakıp önizleme görünümünü büyütmeyi ve küçültmeyi deneyebilirsiniz.

Bir sonraki derste bazı basit kodlar yazmaya başlayacağız ve bu da Xcode’u daha iyi tanımamıza yardımcı olacak.