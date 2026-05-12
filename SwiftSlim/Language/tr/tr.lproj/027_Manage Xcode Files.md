# Xcode Dosyalarını Yönetme

Bu derste, Xcode içinde sık kullanılan dosya işlemlerini öğreneceğiz.

Önceki derslerde, kodların büyük kısmını `ContentView` içinde yazdık. Bu, kodu ve görüntüleme sonucunu gözlemlemeyi kolaylaştırır.

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Ancak gerçek bir App içinde, genellikle tüm kodları tek bir dosyaya yazmayız.

Sayfalar, bileşenler ve işlevler arttıkça, farklı görünümleri farklı SwiftUI dosyalarına ayırmamız gerekir.

Örneğin:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Bu, kod yapısını daha anlaşılır hâle getirir ve sonraki bakım ile düzenlemeleri kolaylaştırır.

## Dosyaları neden yönetmeliyiz

SwiftUI içinde, bir sayfa veya bir bileşen genellikle ayrı bir görünüm dosyası olarak yazılabilir.

Örneğin:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Buradaki `CardView`, bir SwiftUI görünümüdür.

Tüm görünümler `ContentView` içinde yazılırsa, kod giderek uzar ve okunması da giderek zorlaşır.

Bu yüzden dosya oluşturmayı, dosya adını değiştirmeyi, dosya silmeyi ve farklı kod dosyalarını klasörlerle yönetmeyi öğrenmemiz gerekir.

## SwiftUI dosyası oluşturma

Xcode içinde SwiftUI dosyası oluşturmanın yaygın olarak iki yolu vardır:

Birincisi boş bir dosya oluşturup kodu kendimiz yazmaktır.

Diğeri ise SwiftUI şablon dosyası oluşturmaktır; bu durumda Xcode temel kodu otomatik olarak oluşturur.

Yeni başlayanlar için SwiftUI şablon dosyasını kullanmak daha çok önerilir, çünkü temel yapıyı otomatik olarak oluşturur.

### Boş dosya oluşturma

Xcode’un sol tarafındaki Navigator alanında boş bir alana veya klasöre sağ tıklayın ve `New Empty File` seçeneğini seçin.

İşlem konumu aşağıdaki gibidir:

![xcode](../../../Resource/027_view1.png)

Boş dosya oluşturulduktan sonra, Xcode genellikle `Untitled.swift` gibi adsız bir Swift dosyası oluşturur.

Bunu `TestView.swift` olarak yeniden adlandırabiliriz.

SwiftUI projesinde, bu dosya bir görünüm göstermek için kullanılıyorsa, adın sonuna genellikle `View` eklenmesi önerilir.

Örneğin:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Bu zorunlu bir kural değildir, ancak bunun bir görünüm dosyası olduğunu ilk bakışta anlamamızı sağlar.

Boş dosya oluşturulduktan sonra, dosyada yalnızca varsayılan yorumlar bulunabilir veya dosya tamamen boş olabilir. Bu, Xcode sürümüne ve oluşturma yöntemine bağlıdır.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Bu aşamada SwiftUI kodunu elle yazmamız gerekir:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Böylece basit bir SwiftUI görünüm dosyası oluşturulmuş olur.

### Dosyayı yeniden adlandırma

Dosya oluşturulduktan sonra dosya adını değiştirmek istiyorsanız, Xcode’un sol tarafındaki Navigator alanında dosyayı seçip Return tuşuna `⏎` basabilirsiniz.

![xcode](../../../Resource/027_view2.png)

Böylece dosya adını değiştirebilirsiniz.

Dikkat edilmesi gereken nokta şudur: dosya adını değiştirmek, koddaki görünüm adını otomatik olarak değiştirmez.

Örneğin dosya adı `ProfileView.swift` olarak değiştirildikten sonra, kod içinde hâlâ `struct TestView: View` bulunabilir.

Bu mutlaka hata oluşturmaz, ancak kolayca karışıklığa neden olabilir.

Bu nedenle dosya adı ile görünüm adının tutarlı tutulması önerilir. Örneğin dosya adı `ProfileView.swift` ise, görünüm adı da `ProfileView` olmalıdır.

## SwiftUI şablon dosyası oluşturma

Boş dosya oluşturmanın yanı sıra, doğrudan SwiftUI şablon dosyası da oluşturabiliriz.

Xcode’un sol tarafındaki Navigator alanında boş bir alana veya klasöre sağ tıklayın ve `New File from Template...` seçeneğini seçin.

İşlem konumu aşağıdaki gibidir:

![xcode](../../../Resource/027_view3.png)

Açılan pencerede üst kısımdan `iOS`, `macOS` gibi farklı platformlar seçilebilir.

Burada mevcut projeye karşılık gelen platform seçili kalmalıdır. Örneğin bir iOS App oluşturuyorsak, `iOS` seçilir.

![xcode](../../../Resource/027_view4.png)

Ardından alt kısımdan `SwiftUI View` seçilir.

![xcode](../../../Resource/027_view12.png)

Sonra `Next` düğmesine tıklayın, dosya adını girin ve kaydedin.

Örneğin `Test2View.swift` adlı bir dosya oluşturalım.

Xcode aşağıdakine benzer kodu otomatik olarak oluşturur:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Boş dosyayla karşılaştırıldığında, şablon dosyası otomatik olarak `import SwiftUI`, `struct`, `body` ve `#Preview` içerir.

Bu yüzden yeni başlayanlar için SwiftUI şablon dosyası kullanmak daha basittir ve kod yazmayı unutma olasılığını da azaltır.

**İpucu**: Dosya oluşturmak için sağ tıklamanın yanı sıra, Xcode’un sol tarafındaki Navigator alanının altındaki artı düğmesine tıklayarak da dosya veya klasör oluşturabilirsiniz.

![xcode](../../../Resource/027_view5.png)

## Klasör oluşturma

Dosyalar çoğaldığında, onları yönetmek için klasörleri kullanabiliriz.

Xcode’un sol tarafındaki Navigator alanında boş bir alana veya klasöre sağ tıklayın ve `New Folder` seçeneğini seçin.

Klasör oluşturulduktan sonra, ilgili dosyaları bu klasöre sürükleyebilirsiniz.

![xcode](../../../Resource/027_view7.png)

Klasörler esas olarak proje yapısını düzenlemek için kullanılır; görünümün kendi kullanım şeklini değiştirmez.

Görünüm adı doğru olduğu sürece, diğer dosyalarda yine `TestView()`、`Test2View()` gibi yöntemlerle kullanılabilir.

## Dosya veya klasör silme

Bir dosyayı veya klasörü silmek istiyorsanız, Xcode’un sol tarafındaki Navigator alanında ilgili dosyayı seçip sağ tıklayın ve `Delete` seçeneğini seçin.

Dosyayı seçtikten sonra silme tuşuna `⌫` basarak da silebilirsiniz.

Xcode bir silme onay penceresi gösterir.

![xcode](../../../Resource/027_view10.png)

`Move to Trash` seçeneği, dosyayı Çöp Sepeti’ne taşımak anlamına gelir.

`Remove Reference` görürseniz, bu yalnızca referansın Xcode projesinden kaldırılacağı, diskteki özgün dosyanın silinmeyeceği anlamına gelir.

Yeni başlayanlar için, yalnızca yeni oluşturduğunuz sıradan bir dosyayı siliyorsanız, genellikle `Move to Trash` seçmek yeterlidir.

## Birden fazla SwiftUI görünümü gösterme

Dosya oluşturmayı öğrendikten sonra, farklı görünümleri farklı dosyalara ayırabiliriz.

Örneğin iki SwiftUI dosyası oluşturalım:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView`, yazar adını göstermek için kullanılır:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView`, kart arka planını göstermek için kullanılır:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Ardından bu iki görünümü `ContentView` içinde kullanabiliriz:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Çalıştırdıktan sonra, `CardView` ve `AuthorView` birlikte gösterilmiş şekilde görülebilir:

![xcode](../../../Resource/027_view11.png)

Bu sonuçta `CardView` arka plan olarak kullanılır, `AuthorView` ise üstte gösterilir. Bunun nedeni ikisinin `ZStack` içine yerleştirilmiş olmasıdır.

`ContentView` içinde bu iki görünümü `CardView()` ve `AuthorView()` ile kullanırız. Adın sonundaki `()`, bu görünümü oluşturup kullandığımızı ifade eder.

Bu, SwiftUI içinde yaygın olan görünüm iç içe kullanımıdır: bir görünüm içinde başka görünümler kullanılabilir.

## Giriş dosyası

Son olarak, App arayüzünün nereden başlayarak gösterildiğini tekrar gözden geçirelim.

Bir SwiftUI projesinde genellikle bir giriş dosyası bulunur:

```swift
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

Buradaki `@main`, bunun App’in giriş noktası olduğunu belirtir.

`WindowGroup` içinde şunu görürüz:

```swift
ContentView()
```

Bu, App başlatıldıktan sonra ilk olarak `ContentView` gösterileceği anlamına gelir.

Sonra `ContentView` içinde yine şu gösterilir:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Bu yüzden görünüm hiyerarşisi şöyle anlaşılabilir:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Giriş dosyasında gösterilen görünümü `CardView` olarak değiştirirsek:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

O zaman App başlatıldıktan sonra yalnızca `CardView` gösterilir.

Yani giriş kodundaki `WindowGroup`, App başlatıldıktan sonra ilk olarak hangi görünümün gösterileceğini belirler.

Bu görünümün içinde ise başka görünümler gösterilmeye devam edilebilir.

## Özet

Bu derste, Xcode içinde sık kullanılan dosya yönetimi işlemlerini öğrendik.

SwiftUI dosyası oluşturmayı, dosya adını değiştirmeyi, klasör oluşturmayı ve dosya silmeyi öğrendik.

Aynı zamanda önemli bir kavramı da öğrendik: SwiftUI görünümleri farklı dosyalara ayrılabilir ve ardından başka görünümler içinde kullanılabilir.

Örneğin:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Buradaki `CardView()` ve `AuthorView()`, `ContentView` içinde başka görünümlerin kullanılmasıdır.

Son olarak giriş dosyasının görüntüleme mantığını da tekrar gözden geçirdik.

App başlatıldığında, önce `@main` ile işaretlenen giriş koduna girer, ardından `WindowGroup` içindeki görünümü gösterir.

Bu, farklı SwiftUI dosyalarının birbirinden kopuk olmadığını anlamamıza yardımcı olur. Bu dosyalar birbirleriyle birleştirilebilir ve sonunda eksiksiz bir App arayüzü oluşturabilir.
