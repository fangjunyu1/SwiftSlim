# ContentView’den Başlamak

## Ders öncesi hazırlık

Bu derste ContentView.swift dosyasından başlayarak SwiftUI’nin temel yapısını sistemli biçimde tanıyacağız. Buna şunlar dahildir:

- Yorumlar
- View yapısı
- VStack / HStack / ZStack düzenleri
- SF Symbols simgeleri
- View modifier’ları
- Önizleme kodu #Preview

Öncelikle daha önce oluşturduğunuz Xcode projesini bulun ve .xcodeproj dosyasına çift tıklayın.

Sol taraftaki Navigator gezinme alanında ContentView.swift dosyasını seçin.

Not: Projeyi her açtığınızda Canvas üzerinde "Preview paused" görünebilir. Yenile düğmesine tıklayarak önizlemeyi geri getirebilirsiniz.

![Swift](../../RESOURCE/002_view7.png)

## ContentView’i tanıma

ContentView kodu:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
````

Kod az görünse de SwiftUI’nin çekirdek yapısını içerir.

### 1. Yorumlar

Dosyanın üst kısmı:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Bu, dosya bilgilerini kaydetmek için kullanılan dosya yorumudur. İçinde dosya adı, proje adı, oluşturan kişi ve oluşturulma zamanı yer alır.

Swift’te tek satırlı yorum için `//` kullanılır:

```swift
// Bu bir yorumdur
```

Yorumlar kodun okunabilirliğini artırır ve geliştiricinin kod mantığını anlamasına yardımcı olur.

Gerçek geliştirme sürecinde kod bazen anlaşılması zor olabilir. Yorum yazılmazsa, üç gün sonra kendi kodunu bile anlayamama durumu yaşanabilir.

Bu nedenle, kod yazarken aktif biçimde yorum eklemek iyi bir geliştirme alışkanlığıdır. Kod mantığını yorumlarla kaydetmek, daha sonraki bakım işlemlerini kolaylaştırır.

**Kodu geçici olarak devre dışı bırakma**

Yorumlar, sorunları ayıklamak için kodu geçici olarak devre dışı bırakmak amacıyla da kullanılabilir.

Örneğin:

```
A
B
C
```

A, B ve C üç farklı kod parçasıdır ve bunlardan biri hata veriyordur. Bu durumda sorunu bulmak için kodu geçici olarak yorum satırına alabiliriz.

Önce A’yı yorumlayalım:

```
// A
B
C
```

A’yı yorumladıktan sonra kod normale dönüyorsa, sorun A kodundadır.

Eğer A’yı yorumladıktan sonra sorun devam ediyorsa, bu kez B’yi yorumlarız. Bu şekilde devam ederek hatalı kodu bulabiliriz.

Geliştirme sürecinde birçok sorunla karşılaşılır. Çoğu durumda yorum satırlarını kullanarak sorunun nedenini araştırırız. Bu yöntem, sorunlu kodu ve BUG’ı bulmamıza yardımcı olur.

Xcode’da şu klavye kısayolu kullanılabilir:

```
Command ⌘ + /
```

Bu kısayolla yorum satırı hızlıca eklenebilir veya kaldırılabilir.

### 2. SwiftUI framework’ünü içe aktarma

```swift
import SwiftUI
```

Bu kod SwiftUI framework’ünün içe aktarıldığını gösterir.

SwiftUI içindeki View, Text, Image, VStack gibi türlerin hepsi bu framework’ten gelir.

SwiftUI framework’ü içe aktarılmazsa Xcode şu hatayı verir:

```
Cannot find type 'View' in scope
```

Bu da derleyicinin View türünü tanıyamadığı anlamına gelir.

### 3. View yapısı

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Bu View yapısını ilk kez gördüğünüzde yabancı gelebilir, çünkü içinde `struct`, `View`, `var`, `body`, `some` gibi anahtar kelimeler vardır.

Bu aşamada bu anahtar kelimeleri henüz öğrenmedik. Şimdilik bu kodun anlamının, ContentView adında bir View oluşturmak olduğunu bilmeniz yeterlidir.

View’ü bir tuval gibi düşünebilirsiniz; üzerine çizim yaparız ve bu çizim aracı SwiftUI’dir.

Örneğin:

![Swift](../../RESOURCE/002_view.png)

Yukarıdaki görselde üç sayfa gösteriliyor; aslında bunların her biri bir View’dür.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

SwiftUI ile bir uygulama geliştirdiğimizde, her sayfa bir View’dür.

### 4. SwiftUI kodu

View içinde gösterilen SwiftUI kodu:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Bu SwiftUI kodu, bunun dikey bir düzen olduğunu ve içinde bir simge ile bir metin gösterildiğini ifade eder.

![Swift](../../RESOURCE/002_view1.png)

#### VStack düzeni

```swift
VStack { }  // Dikey düzen
```

VStack, dikey düzen kapsayıcısını ifade eder. İçindeki görünümler yukarıdan aşağıya sıralanır.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI’de yaygın üç düzen türü vardır:

* VStack —— Dikey sıralama
* HStack —— Yatay sıralama
* ZStack —— Üst üste sıralama (Z ekseni)

```swift
HStack { }  // Yatay sıralama
ZStack { }  // Üst üste sıralama
```

Düzenlerin sıralama şeması:

![Swift](../../RESOURCE/002_view2.png)

Örneğin, yatay sıralama için HStack kullanalım:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Bu durumda dünya simgesi ile metnin yatay olarak gösterildiğini görebiliriz.

![Swift](../../RESOURCE/002_view3.png)

Yatay sıralama istediğimizde HStack kullanırız. Üst üste bindirme gerektiğinde ise ZStack kullanırız.

#### Image ve SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Bu kod bir dünya simgesi gösterir. Bu simge, Apple’ın SF Symbols simge sisteminden gelir.

![Swift](../../RESOURCE/002_view9.png)

Kodun anlamı şudur: büyük boyutta bir dünya simgesi göster ve rengini vurgu rengi olarak ayarla.

Sadece dünya simgesi değil, başka simgeler de gösterebiliriz.

Örneğin bir sırt çantası göstermek için:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Başka simgeler nasıl gösterilir?**

Bunun için Apple’ın sunduğu resmî sistem simge kütüphanesi olan SF Symbols’ü kullanmamız gerekir.

Apple Developer resmî sitesini açın ve [SF Symbols](https://developer.apple.com/sf-symbols/) uygulamasını indirin.

![Swift](../../RESOURCE/002_sf.png)

Ardından SF Symbols uygulamasını açın.

![Swift](../../RESOURCE/002_sf1.png)

Sol tarafta simge kategorileri, sağ tarafta ise karşılık gelen simgeler yer alır.

Bir simgeye sağ tıklayıp "Copy 1 Name" seçeneğini seçin; bu ad ilgili string içeriğidir.

Örneğin:

```
"globe"
"backpack"
"heart"
```

Kopyalanan simge adını `Image(systemName:)` içine koyarsanız farklı simgeler gösterebilirsiniz.

Not: Her SF Symbols simgesinin desteklediği en düşük sistem sürümü vardır. Sistem sürümü çok düşükse simge görüntülenmeyebilir. Uyumluluk bilgisi SF Symbols uygulamasında görülebilir.

#### Modifier’lar

SwiftUI’de modifier, bir view’un görünümünü veya davranışını değiştirmek için kullanılan yöntemdir.

Modifier’ları kıyafet gibi düşünebilirsiniz; farklı kıyafetler giyildiğinde görünüm de farklı olur.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Buradaki `imageScale` ve `foregroundStyle`, Image view’unun modifier’larıdır. Image içeriğini değiştirmeden view’un görünümünü düzenlerler.

**1. imageScale**

```swift
.imageScale(.large)
```

Bu modifier, SF Symbols simgesinin boyutunu kontrol eder:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Farklı seçenekleri deneyerek SF Symbols simgesinin farklı boyutlarda gösterilmesini sağlayabilirsiniz.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle`, ön plan rengini kontrol eder.

`.tint`, mevcut ortamın vurgu rengini ifade eder; varsayılan olarak iOS’ta mavidir.

Eğer ön plan rengini kırmızı yapmak istersek:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view’u

Text, metin göstermek için kullanılan bir view’dur.

```swift
Text("Hello, world!")
```

Örneğin adımı göstermek için:

```swift
Text("FangJunyu")
```

Not: String ifadeleri mutlaka çift tırnak `""` içine yazılmalıdır.

Kendi adınızı, telefon numaranızı veya başka içerikleri göstermeyi deneyebilirsiniz.

#### padding kenar boşluğu

SwiftUI’de `padding`, view içeriği ile sınırları arasına boşluk eklemek için kullanılır. Bu, “iç boşluk (padding / content inset)” olarak kabul edilir.

```swift
HStack {
    ...
}
.padding()
```

Yukarıdaki kod, HStack view’una sistemin varsayılan iç boşluğunu ekler.

**padding nedir?**

`padding`, “view içeriği ile kendi sınırları arasındaki boş alan” anlamına gelir.

Aşağıdaki görselde mavi HStack’e padding eklendiğinde mavi alan içe doğru daralır ve sanki “bir halka kadar küçülmüş” gibi görünür.

![Swift](../../RESOURCE/002_view6.png)

**Varsayılan kenar boşluğu**

`padding()` modifier’ı varsayılan olarak sistemin önerdiği standart aralığı kullanır.

```swift
.padding()
```

Bu değer platforma ve bağlama göre değişebilir. Örneğin:

* iOS’ta genellikle yaklaşık 16 pt olur.
* macOS veya watchOS’ta sistemin standart aralığı farklı olabilir; bu, ilgili platformun tasarım kurallarına bağlıdır.

**Özel kenar boşluğu**

Bir view için ayrı yönlerde özel kenar boşluğu da ayarlanabilir.

1. Tek bir yön ayarlama

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Yön açıklamaları:

* .top: üst boşluk
* .bottom: alt boşluk
* .leading: ön taraf boşluğu
* .trailing: arka taraf boşluğu

![Swift](../../RESOURCE/002_view12.png)

Not: `leading` ve `trailing`, dil yönüne göre otomatik uyarlanır. Örneğin Arapça gibi RTL ortamlarında otomatik olarak tersine döner.

2. Birden fazla yön ayarlama

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Bir dizi kullanarak aynı anda birden fazla yön belirtilebilir. Dizilerin ayrıntılı kullanımı ileride daha ayrıntılı anlatılacaktır; burada sadece bu yazım biçimini tanımanız yeterlidir.

3. Yatay veya dikey yön ayarlama

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Bu kullanım şu kodlarla eşdeğerdir:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Kenar boşluğunu kaldırma**

Hiç boşluk istemiyorsanız `.padding(0)` kullanabilirsiniz:

```swift
.padding(0)
```

Ya da doğrudan `padding` modifier’ını silebilirsiniz:

```swift
// .padding()
```

### 6. Preview önizleme kodu

```swift
#Preview {
    ContentView()
}
```

Bu kod, Canvas içinde ContentView önizlemesini oluşturur.

Not: `#Preview`, Swift 5.9 / Xcode 15 ile gelen yeni sözdizimidir. Bundan önce `PreviewProvider` yapısı kullanılıyordu.

**Preview yorum satırına alınırsa ne olur?**

Eğer Preview yorum satırına alınırsa:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas artık render edilebilir bir içerik göstermez.

![Swift](../../RESOURCE/002_xcode.png)

Yani Canvas’ta önizleme görünümünün gösterilmesini `#Preview` kontrol eder.

Xcode içinde SwiftUI view’unu önizlemek istediğimizde `#Preview` kodu ekleriz. Önizlemeye ihtiyaç yoksa `#Preview` kodunu yorum satırına alabilir veya silebiliriz.

## Özet

Her ne kadar ContentView.swift dosyasındaki kod fazla görünmese de, aslında SwiftUI’nin birçok temel kavramını kapsar. Yeni başlayanlar için bu kod yabancı gelebilir; ancak yapıyı parçalara ayırarak SwiftUI hakkında ilk anlayış geliştirilebilir.

Bu derste önce `//` yorumlarını öğrendik; yorumlar kod mantığını açıklamak veya kodu geçici olarak devre dışı bırakmak için kullanılabilir.

Ardından SwiftUI dosyalarının mutlaka SwiftUI framework’ünü içe aktarması gerektiğini gördük:

```swift
import SwiftUI
```

Framework içe aktarılmazsa derleyici View gibi türleri tanıyamaz.

Sonra SwiftUI view’unun temel yapısını tanıdık:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Burada ContentView, view’un adıdır.

Ayrıca üç yaygın düzen kapsayıcısını da öğrendik: VStack (dikey sıralama), HStack (yatay sıralama) ve ZStack (üst üste sıralama).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Bu kod, dikey bir düzen kapsayıcısı gösterildiğini ve bunun içinde bir simge ile bir metin bulunduğunu ifade eder.

Image, SF Symbols simgelerini gösterebilir ve modifier’lar ile boyut ve renk kontrol edilebilir.

Text view’u metin gösterebilir.

`padding`, bir view’un çevresine saydam bir boş alan ekleyen kenar boşluğudur.

Son olarak `#Preview`, Canvas içinde önizleme görünümünü göstermek için kullanılır.

### Ders sonrası alıştırmalar

Yeni başlayanlar için bu dersteki içerik biraz karmaşık gelebilir. Aşağıdaki alıştırmalarla konuyu daha iyi pekiştirebiliriz:

* SF Symbols simge adını değiştirin
* Simgenin ön plan rengini siyah yapın
* VStack’i HStack ile değiştirin
* Image veya Text’i yorum satırına alıp önizlemedeki değişimi gözlemleyin

### Bonus: kod tamamlama (Code Completion)

Kod yazarken dikkat ettiyseniz, Xcode kullanılabilir seçeneklerin bir listesini otomatik olarak gösterir.

Örneğin `imageScale` modifier’ını değiştirirken:

```swift
.imageScale(.)
```

Xcode kullanılabilir seçenekleri gösterir:

![Swift](../../RESOURCE/002_view10.png)

Bu, kod tamamlama mekanizmasına (Code Completion) aittir. Tür çıkarımı ve enum üye önerileri temelinde çalışır; yazma verimini artırır ve hataları azaltır.

İlerleyen derslerde enum’u resmî olarak anlatacağız. Şimdilik bunu sadece kısa bir ön bilgi olarak bilmeniz yeterlidir.