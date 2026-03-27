# Swift ve SwiftUI

Apple platformları için geliştirme öğrenirken, birçok eğitim Swift ile SwiftUI’yi ayrı ayrı anlatma eğilimindedir. Bu durum, yeni başlayanlarda bir kopukluk hissi oluşturabilir ve bunların tamamen bağımsız iki teknoloji olduğu yanılgısına yol açabilir.

Oysa gerçekte Swift ve SwiftUI, derin biçimde bütünleşmiş bir yapıdır: Swift programlama dilidir; mantığı ve veriyi sağlar. SwiftUI ise Swift üzerine inşa edilmiş bir kullanıcı arayüzü framework’üdür; view’ların çizilmesinden ve etkileşimden sorumludur.

Bu ders, zihninizde net bir çerçeve kurmanıza yardımcı olacaktır: Swift nedir, SwiftUI nedir ve bunlar kod içinde nasıl birlikte çalışır?

## Swift nedir?

Swift, Apple tarafından sunulan modern bir programlama dilidir. iOS, macOS, watchOS ve tvOS gibi platformlarda uygulama geliştirmek için kullanılır.

![swift](../../RESOURCE/010_swift.png)

Swift, güçlü tipli ve statik bir dildir. Tasarım açısından güvenliğe daha fazla önem verir; böylece boş işaretçi, sınır aşımı gibi birçok yaygın programlama hatasını azaltır. Ayrıca C ve Objective-C ile sorunsuz biçimde bütünleşebilir.

Gerçek geliştirme sürecinde Swift, daha çok uygulamanın mantık kısmından sorumludur. Örneğin veri işleme, ağ istekleri ve veri saklama işlemleri gibi işler buna girer.

## SwiftUI nedir?

SwiftUI, Apple’ın 2019 yılında sunduğu yeni bir arayüz oluşturma framework’üdür. SwiftUI, deklaratif programlama modelini benimser ve geliştiricilerin daha sade kodlarla arayüz yapısını ve etkileşim davranışlarını tanımlamasına olanak tanır.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklaratif programlama şu anlama gelir: geliştirici yalnızca neyin gösterilmesini istediğini söyler; sistem ise veri değişimine göre view’u otomatik olarak yeniler. Böylece arayüz durumunu elle güncellemek gerekmez ve UI geliştirme karmaşıklığı büyük ölçüde azalır.

SwiftUI’nin çekirdeğini view bileşenleri, örneğin Text, Image, Button ve düzen kapsayıcıları, örneğin VStack, HStack, ZStack oluşturur. Bu bileşenler, veri bağlama ve durum yönetimi yoluyla etkileşime girer; böylece arayüz veri değişimlerine yanıt verir ve otomatik olarak yenilenir.

## Swift ve SwiftUI nasıl birlikte çalışır?

Swift ve SwiftUI’nin görevlerini şu şekilde özetleyebiliriz:

**1. Swift: mantığı ve veriyi işler**

Swift esas olarak veriyi yönetmek, durumu saklamak ve mantığı çalıştırmak için kullanılır. Bu kodlar genellikle arayüzün çizimini doğrudan etkilemez; daha çok veri ve davranışın işlenmesinden sorumludur.

Örneğin, Swift içinde veri işlemek:

```swift
let markdown = try? String(contentsOf: url)
````

Bu tür kodlar; değişken tanımlama, sabit tanımlama, fonksiyonlar, kontrol akışı gibi yapıları içerir ve doğrudan view’un görüntülenmesini etkilemez.

**2. SwiftUI: arayüzü tanımlar ve çizer**

SwiftUI ise kullanıcı arayüzünün düzenini ve içeriğini oluşturmak için kullanılır; temel olarak arayüzü çizmekten ve view etkileşiminden sorumludur.

Örneğin, SwiftUI ile bir metin view’u oluşturmak:

```swift
Text("SwiftSlim")
```

Bunların hepsi, arayüz öğelerini oluşturmak ve kontrol etmek için kullanılan kodlardır; doğrudan kullanıcı arayüzüyle ilgilidir.

### Temel örnek

Aşağıda basit bir SwiftUI örneği yer alıyor:

```swift
// ContentView.swift

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
```

Bu örnekte:

**SwiftUI kodu**: VStack, Image, Text ve padding SwiftUI’ye aittir; arayüzün gösterimi ve düzeninden sorumludur.

**Swift kodu**: Dosyanın üst kısmındaki `//` yorumları ve `import SwiftUI` Swift’in kod yapısına aittir; alttaki `#Preview` ise Xcode önizlemesi için kullanılan bir macro’dur ve gerçek arayüz çizimine katılmaz.

### İleri seviye örnek

Gerçek projelerde Swift ve SwiftUI, kendi güçlü oldukları işleri yapmak için sık sık birlikte kullanılır:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Bu örnekte:

**SwiftUI kodu**: `@State`, SwiftUI’ye özgü bir property wrapper’dır ve view’un değişebilir durumunu tanımlamak için kullanılır; Button ve Text ise arayüzü göstermek ve kullanıcı etkileşimini sağlamak için kullanılan SwiftUI view bileşenleridir.

**Swift kodu**: `private var name` ve `func printName()` Swift kodudur; veri saklamak ve mantığı yürütmek için kullanılır, view’un çizimini doğrudan belirlemez.

Kullanıcı düğmeye tıkladığında, SwiftUI düğme içindeki işlem kodunu tetikler:

```swift
Button("Print") {
    printName()
}
```

Burada Button, SwiftUI bileşenidir; çağrılan `printName()` fonksiyonu ise Swift kodudur ve somut mantık işlemini üstlenir.

Bu iş birliği sayesinde Swift ile SwiftUI kusursuz biçimde birleşebilir; Swift veri ve mantığı yönetir, SwiftUI ise kullanıcı arayüzünü gösterir.

## Swift ve SwiftUI kodu genellikle nerede yazılır?

SwiftUI’de arayüz, `body` özelliğinin döndürdüğü view üzerinden kurulur. Bu nedenle arayüzü tanımlayan tüm kodlar genellikle `body` içinde yazılır.

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Bu örnekte Text, bir SwiftUI view bileşenidir. Bu nedenle `body` içinde yazılmalıdır; çünkü SwiftUI arayüzü `body` üzerinden okuyup oluşturur.

Arayüzle doğrudan ilgili olmayan kodlar, örneğin değişkenler, fonksiyonlar veya veri işleme mantığı ise genellikle `body` dışında yazılır. Örneğin:

```swift
struct ContentView: View {

    // Swift: veri veya mantık
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: arayüz
    var body: some View {
        Text(name)
    }
}
```

Dikkat edilmesi gereken nokta şudur: `body` içinde yine de Swift sözdizimi kullanılabilir; örneğin `if`, `for` gibi kontrol akışı yapıları. Ancak bunlar yalnızca SwiftUI view’larının üretilmesini kontrol etmek için kullanılır:

```swift
if isLogin {
    Text("Welcome")
}
```

Bu nedenle SwiftUI geliştirmede basitçe şöyle düşünebiliriz: view kodları, örneğin Text, Image, Button genellikle `body` içinde yazılır; veri ve mantık kodları, örneğin değişkenler ve fonksiyonlar ise genellikle `body` dışında yazılır.

## Swift dosyaları

Öğrenme ilerledikçe MVVM mimarisiyle de karşılaşacağız. Bu yapıda ViewModel ve Model katmanları genellikle saf Swift kodundan oluşur ve view katmanından, yani SwiftUI’den tamamen ayrıdır.

Örneğin, uygulama durumunu yöneten bir sınıf:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Ya da veri yapısını tanımlayan bir struct:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Bu tür dosyaların görevi veriyi yönetmek ve kalıcı hâle getirmektir. Doğrudan view üzerinde gösterilmezler; bu nedenle tamamen Swift’e aittirler.

## Tarihsel arka plan

Swift ile SwiftUI arasındaki ilişkiyi anlamak için, Apple geliştirme teknolojilerinin nasıl evrildiğini de bilmek gerekir. 2026 itibarıyla bu teknoloji yığını birçok kez yinelemeden geçmiştir.

### Swift’in tarihi

Swift ortaya çıkmadan önce, Apple platformlarının ana programlama dili Objective-C idi ve C diliyle birlikte kullanılabiliyordu. Sözdizimi görece daha uzundu ve yeni başlayanlar için giriş eşiği daha yüksekti:

```Obj-c
// Objective-C yazımı
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 yılında Apple, WWDC’de Swift dilini tanıttı. Swift daha modern sözdizimine ve daha yüksek tip güvenliğine sahiptir ve zamanla Objective-C’nin yerini alarak ana geliştirme dili hâline gelmiştir:

```swift
// Swift yazımı
let name = "Fang"
print("Hello, \(name)")
```

Ancak Objective-C tamamen tarih sahnesinden çekilmedi. Hâlâ birçok mevcut projede ve alt seviye framework içinde yaygın biçimde kullanılmaktadır. Temel sözdizimini bilmek, eski projeleri bakımını yapmak ve sistemin alt katmanını anlamak açısından hâlâ değerlidir.

### SwiftUI’nin tarihi

SwiftUI ortaya çıkmadan önce, iOS tarafında **UIKit**, macOS tarafında ise **AppKit** kullanılıyordu. Bu iki framework “emirsel” programlama yaklaşımını benimser. Geliştiricinin Storyboard üzerinden bileşenleri sürükleyip bırakması veya view durumunu elle yönetmek için doğrudan kod yazması gerekir. Kod miktarı fazladır, bakım maliyeti yüksektir ve arayüz mantığı karmaşık olduğunda bu durum daha belirgin olur.

![storyboard](../../RESOURCE/010_xcode.png)

2019 yılında Apple, WWDC’de SwiftUI’yi resmen tanıttı. SwiftUI, deklaratif programlama yaklaşımını getirerek UI geliştirme sürecini büyük ölçüde sadeleştirdi.

![storyboard](../../RESOURCE/010_xcode1.png)

Dikkat edilmesi gereken önemli bir nokta vardır: SwiftUI tamamen bağımsız bir alt seviye gerçekleştirim değildir. Her platformda özünde UIKit ile, yani iOS tarafında UIKit, macOS tarafında ise AppKit ile köprü kurar ve onlarla birlikte çalışır. Alt katmanda hâlâ bu iki framework’e dayanır.

### Swift ile UIKit/AppKit arasındaki ilişki

Swift genel amaçlı bir programlama dili olsa ve Apple’ın farklı platformlarında çalışabilse de, UIKit veya AppKit’in yerini bütünüyle alamaz. Bazı karmaşık arayüz ihtiyaçlarında veya SwiftUI’nin henüz kapsamadığı işlevlerde, hâlâ UIKit ya da AppKit desteğine ihtiyaç duyulur.

Örneğin UIKit; karmaşık view controller yönetimi, animasyon efektleri, gesture tanıma gibi konularda oldukça olgunlaşmıştır ve büyük miktarda gerçek üretim pratiğiyle doğrulanmıştır. SwiftUI’nin bu alanlardaki yetenekleri sürekli artıyor olsa da, bazı uç senaryolarda hâlâ sınırlamalar bulunmaktadır.

Bu nedenle birçok geliştirici projelerinde SwiftUI ile UIKit’i ya da AppKit’i birlikte kullanır ve her iki tarafın güçlü yönlerinden yararlanır.

Bu açıdan bakıldığında SwiftUI, UIKit / AppKit için daha üst düzey bir soyutlama olarak düşünülebilir. SwiftUI öğrenirken UIKit ve AppKit’in temel kavramlarını da uygun ölçüde bilmek, eski projeleri bakımını yaparken veya daha karmaşık özellikleri gerçekleştirirken daha sağlıklı teknik kararlar vermeye yardımcı olur.

## Özet

**Swift**: Esas olarak mantık, veri işleme, kontrol akışı gibi view düzeniyle doğrudan ilgili olmayan kodları yazmak için kullanılır.

**SwiftUI**: Kullanıcı arayüzünü deklaratif biçimde kurmak için kullanılır; view içeriği ve düzenine ait kodlar SwiftUI kapsamındadır.

Gerçek geliştirmede Swift ve SwiftUI genellikle birlikte kullanılır; Swift mantığı işler, SwiftUI ise arayüzü işler.

Objective-C ve UIKit’ten Swift ve SwiftUI’ye geçişle birlikte Apple’ın geliştirme ortamı giderek daha modern ve daha sade bir programlama yönüne kaymıştır. Ancak UIKit ve AppKit, birçok geleneksel projede hâlâ göz ardı edilemez.

Swift ile SwiftUI arasındaki ilişkiyi anlayarak, iOS/macOS geliştirmesini daha verimli yapabilir ve eski projelerin bakımında daha doğru teknik seçimler yapabiliriz.
