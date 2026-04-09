# struct ve class

Önceki derste `struct` ile yeni yeni tanışmaya başlamıştık, bir yapı tanımlamıştık ve ayrıca protocol, `UUID` gibi bilgi noktalarını da genişletmiştik.

Şimdi `struct` anahtar sözcüğü hakkında artık başlangıç düzeyinde bir anlayışımız var, ancak onu gerçekten anladığımızı henüz söyleyemeyiz.

Bu derste `struct`u ana içerik olarak ele almaya devam edeceğiz ve bu arada `class`ı da tanıyacağız. Bu ders sayesinde şunları daha net anlayacaksın: instance nedir, constructor nedir ve neden verileri düzenlemek için `struct` ve `class` kullanabiliyoruz.

## Ogrenci yonetim sistemi

Örneğin, şimdi bir öğrenci yönetim sistemi geliştirmek istiyoruz. Her öğrencinin ad, cinsiyet, telefon, yaş, ev adresi gibi bilgileri vardır.

Bu noktada bu bilgileri bir araya getirip bir `Student` yapısı olarak tanımlayabiliriz:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Burada `struct` kullanarak bir öğrenci türü tanımlıyoruz.

Bu `Student` yapısı birden fazla property içerir:

- `id`: öğrencinin benzersiz kimliği
- `name`: öğrencinin adı
- `sex`: öğrencinin cinsiyeti
- `phone`: öğrencinin telefonu
- `age`: öğrencinin yaşı
- `address`: ev adresi

Böylece, başlangıçta dağınık olan birden fazla veri bir araya getirilerek eksiksiz bir “öğrenci” haline gelir.

Buradaki `Student`, `Identifiable` protocolüne de uyar ve daha sonra verileri `ForEach` döngüsüyle göstermeyi kolaylaştırmak için bir `id` alanı tanımlar.

Sonra bir öğrenci instance'ı oluşturabiliriz:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Bu kod, `Student` adlı bu yapı üzerinden somut bir öğrenci verisi oluşturulabileceğini ifade eder.

Burada `Student` türdür, `Student(...)` ise oluşturulan bir instance'ı ifade eder.

SwiftUI içinde bu instance'ı bir değişkene atayabilir ve sonra ekranda gösterebiliriz.

Örneğin:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Böylece görünümde bu öğrencinin adını görebiliriz: `Fang Junyu`.

Burada önce bir `Student` instance'ı oluşturduk, sonra onu `student` değişkenine atadık ve en sonunda `student.name` ile içindeki property'yi okuduk.

## instance nedir

`struct` öğrenmeye yeni başladığımızda “instance” kelimesi bize çok yabancı gelebilir.

Ama aslında en başından beri instance kullanıyoruz, sadece daha önce buna özellikle dikkat etmemiştik.

Örneğin:

```swift
let name = "Fang Junyu"
```

Buradaki `"Fang Junyu"` bir string değerdir ve özünde `String` türünün bir instance'ıdır.

Bunu şöyle de yazabiliriz:

```swift
let name = String("Fang Junyu")
```

Bu iki yazım aynı şeyi ifade eder: `String` türünde bir instance oluşturmak ve onu `name` değişkenine atamak.

Aynı durum `Int` için de geçerlidir:

```swift
let num = 3
```

Buradaki `3`, özünde `Int` türünde bir değerdir ve bir `Int` instance'ı olarak da anlaşılabilir.

Dolayısıyla instance, yalnızca `struct` içinde ortaya çıkan özel bir kavram değildir.

İster `String`, ister `Int`, `Double`, `Bool` ya da bizim tanımladığımız `Student` olsun, hepsi instance oluşturabilir.

Bu yüzden, şunu yazdığımızda:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Özünde bu, `String` ya da `Int` instance'ı oluşturmaktan farksızdır; sadece `Student` bizim tanımladığımız bir türdür.

## constructor

Bir instance oluşturduğumuzda:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Aslında `Student`in başlatma yöntemi olan `init`i çağırmış oluruz.

constructor'ı şöyle anlayabilirsin: **instance oluşturulurken property'lere değer atamaktan sorumlu giriş noktasıdır.**

Yani bir instance gerçekten oluşturulmadan önce, genellikle önce `init`ten geçer.

Örneğin, daha önce SwiftUI view lifecycle öğrenirken şöyle bir kod yazmıştık:

```swift
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
    }
}
```

Burada `init()`, `ContentView` instance'ı oluşturulduğunda çalışır; `onAppear` ise view gerçekten ekranda gösterildiğinde çalışır. Yani view'in oluşturulması ile gösterilmesi aynı an değildir.

Aynı şekilde, `Student(...)` oluşturduğumuzda da `Student` constructor'ını çağırmış oluruz.

### Sistem tarafindan otomatik olusturulan constructor

`Student`i tanımlarken `init`i elle yazmamıştık:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Ama yine de doğrudan bir instance oluşturabiliyoruz:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

constructor yokken neden instance oluşturabiliyoruz?

Çünkü `struct` için, constructor'ı elle yazmazsak sistem genellikle bizim için uygun bir constructor'ı otomatik olarak oluşturur.

Başlangıç aşamasında bunu basitçe şöyle anlayabilirsin: Swift başlatma kodunu bizim yerimize otomatik olarak tamamlar.

Kabaca, sistemin bizim için şu kodu tamamladığını düşünebilirsin:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Burada dikkat edilmesi gereken küçük bir ayrıntı var:

```swift
let id = UUID()
```

`id` zaten varsayılan bir değere sahip olduğu için instance oluştururken `id`yi ayrıca elle geçmemize gerek yoktur.

Yani varsayılan değeri olmayan property'ler genellikle constructor içinde geçirilmelidir; zaten varsayılan değeri olan property'ler ise doğrudan o varsayılan değeri kullanabilir.

Bu nedenle `Student` instance'ı oluştururken sadece `name`, `sex`, `phone`, `age` ve `address` geçmemiz yeterlidir.

### compiler ipuclari

Ayrıca, Xcode içinde `Student(...)` yazdığımızda sistemin verdiği parametre ipuçlarını da görebiliriz.

![student](../../Resource/022_student.png)

Bu da aslında mevcut türün gerçekten sistem tarafından otomatik oluşturulmuş bir constructor'a sahip olduğunu gösterir.

### constructor'ı kendimiz yazmak

Sistem constructor'ı otomatik oluşturabilse de, bazen bu varsayılan başlatma yöntemi ihtiyaçlarımızı tam olarak karşılamaz.

Örneğin elimizde şöyle bir `Movie` yapısı var:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Sistemin otomatik oluşturduğu constructor'a göre, bir instance oluştururken bu üç parametreyi de aynı anda vermek zorundayız:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ama şimdi bir grup eski filmi kaydetmek istiyorsak ve sadece filmin adını biliyorsak, yönetmeni ve puanı bilmiyorsak bu biraz zahmetli olur.

Çünkü ancak şöyle yazabiliriz:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Çalışsa da, her seferinde tekrar tekrar `--` yazmak pratik değildir.

Bu durumda bir constructor yazabiliriz:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Böylece eski filmleri oluştururken sadece `name` geçmemiz yeterli olur:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

İşte constructor'ı kendimiz yazmanın anlamlarından biri budur: **instance oluşturma biçimini gerçek ihtiyaçlara daha uygun hale getirmek.**

### Ozellestirilmis constructor'i incelemek

Az önce elle yazdığımız constructor'a bakalım:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Bu kodun anlamı, `Movie` instance'ı oluştururken sadece bir `name` parametresi verilmesinin yeterli olmasıdır.

Daha sonra constructor'ın içinde verilen `name`, instance'ın kendi `name`ine atanır; `director` ve `rating` için ise varsayılan `--` değeri verilir.

Buradaki `self`, “şu anki instance'ın kendisi” anlamına gelir.

Örneğin:

```swift
self.name = name
```

Soldaki `self.name`, instance içindeki property'yi; sağdaki `name` ise bizim verdiğimiz parametreyi ifade eder.

Bunu basitçe, dışarıdan verilen değerin instance'ın kendi property'sine kaydedilmesi olarak anlayabilirsin.

Tüm property'lere değer atandıktan sonra bu instance oluşturulmuş olur.

### constructor mekanizmasi

Bir constructor'ı açıkça tanımladığımızda başka bir değişiklik daha olur:

Sistemin başlangıçta otomatik oluşturduğu constructor artık genellikle doğrudan kullanılamaz.

Örneğin:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Şimdi tekrar şöyle yazarsak:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler hata verir:

```swift
Extra arguments at positions #2, #3 in call
```

Bunun anlamı şudur: fazladan argümanlar geçtin.

Bu hata neden ortaya çıkar?

Çünkü mevcut `Movie` yapısında yalnızca senin elle tanımladığın şu constructor vardır:

```swift
init(name: String)
```

Bu yalnızca bir `name` parametresi kabul eder; `director` ve `rating` kabul etmez.

Yani kendi constructor'ını elle eklediğinde, sistemin önceden otomatik oluşturduğu başlatma yöntemi artık doğrudan kullanılamaz.

Eğer hem “yalnızca adı geçirmek” hem de “tam bilgileri geçirmek” istiyorsak, bir de tam constructor'ı kendimiz eklememiz gerekir:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Böylece iki farklı constructor'ımız olur.

Eski filmleri oluştururken şöyle yazabiliriz:

```swift
Movie(name: "The Night of the Hunter")
```

Bilgileri tam olan yeni filmleri oluştururken ise şöyle yazabiliriz:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Bu yazım ayrıca şunu da gösterir: aynı tür, parametre biçimleri farklı olduğu sürece birden fazla constructor'a sahip olabilir.

## overloading nedir

Burada gerekli bir bilgi noktasını daha ekleyelim.

Az önce `Movie` için iki tane `init` yazdık:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

“Aynı function adı, ama farklı parametreler” şeklindeki bu yazım tarzına “overloading” denir.

Burada iki function'ın adı da `init`tir, ama aldıkları parametreler farklıdır; bu yüzden Swift hangi function'ı çağırdığını ayırt edebilir.

Örneğin:

```swift
Movie(name: "Days of Heaven")
```

Şunu çağırır:

```swift
init(name: String)
```

Ama:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Diğer tam başlatma yöntemini çağırır.

Dolayısıyla overloading'in işlevi şudur: aynı türün, farklı senaryolara göre farklı oluşturma yöntemleri sunmasını sağlamak.

## class'i tanimak

Şimdi de kısaca `class`ı tanıyalım.

Swift'te yaygın olarak görülen `struct` dışında, birçok programlama dili de instance oluşturmak için `class` kullanır; örneğin Java, C#, Kotlin vb.

Swift'te `class` yazımı `struct`e oldukça yakındır.

Örneğin:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Göreceksin ki, anahtar sözcüğün `struct`ten `class`a dönüşmesi dışında diğer kısımlar neredeyse tamamen aynıdır.

instance oluşturma biçimi de çok benzerdir:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Bu yüzden sözdizimi düzeyinde `struct` ve `class` gerçekten çok benzer görünür.

### Struct ve Class arasindaki fark

`struct` ve `class` çok benzer görünse de tamamen aynı değillerdir.

**1. Başlatma biçimleri farklıdır**

`struct` için, constructor'ı elle yazmazsak sistem genellikle uygun bir başlatma yöntemi otomatik olarak oluşturur.

Ama `class` için, eğer bazı property'lerin henüz varsayılan değeri yoksa genellikle `init`i elle yazmak gerekir; aksi halde hata oluşur.

Örneğin:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Bu `class`, constructor'ı olmadığı için property'ler başlatılamaz ve hata verir.

compiler şuna benzer bir uyarı gösterir:

```swift
Class 'Movie' has no initializers
```

Dolayısıyla bu örnekte `class` için constructor'ı elle yazmak gerekir.

**2. `struct` bir value type, `class` ise bir reference type'tir**

`struct` bir value type'tır, `class` ise bir reference type'tır.

Başlangıç aşamasında bu iki kavramı tamamen öğrenmek gerekmez; sadece basit bir fikir edinmek yeterlidir.

Örneğin `struct`, “yeni bir değer kopyası oluşturmak” gibidir.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Burada `user1`, `user2`ye atandıktan sonra sanki yeni bir veri kopyası oluşturulmuş olur; bu yüzden `user2`de yapılan değişiklik `user1`i etkilemez.

Öte yandan `class`, “aynı instance'ı birlikte işaret etmek” gibidir.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Burada `user1` ve `user2` aynı instance'ı işaret eder.

Şu anda value type ve reference type'ın altta yatan mekanizmasını tamamen anlamamız gerekmiyor; sadece `struct`ün bağımsız verileri saklamak için daha uygun olduğunu, `class`ın ise birden çok yerde aynı instance'ın paylaşılması gereken durumlar için daha uygun olduğunu bilmek yeterlidir.

## Baslangic asamasinda nasil secmeli

Mevcut aşamada, sıradan veri modelleri için öncelikle `struct` düşünülmeli; paylaşılması ve eşzamanlı değiştirilmesi gereken veriler için ise `class` düşünülmelidir.

Bu mutlak bir kural değildir, ancak yeni başlayanlar için yeterince pratik bir karar verme yöntemidir.

Özellikle SwiftUI içinde çoğu zaman `struct`ün işin büyük bölümünü zaten halledebildiğini fark edersin.

Ayrıca birçok programlama kaynağında `class` ile oluşturulan şeylere “obje” de denir. Başlangıç aşamasında bunu instance olarak anlayabilirsin; özellikle ayırmaya gerek yoktur.

## Ozet

Bu derste `struct`ü daha derinlemesine öğrendik ve ayrıca `class`ı da tanıdık; her ikisi de type tanımlamak için kullanılabilir.

Type'lar instance oluşturabilir. Bir instance oluşturulurken constructor, yani `init`, çağrılır.

`struct` için, constructor'ı elle yazmazsak sistem genellikle uygun bir constructor'ı otomatik olarak oluşturur. Eğer varsayılan constructor ihtiyaçları karşılamıyorsa, constructor'ı elle de yazabiliriz.

Ayrıca `struct` ve `class` arasındaki farkı da başlangıç düzeyinde öğrendik: `struct` bir value type, `class` ise bir reference type'tır. SwiftUI içinde başlangıç aşamasında daha sık karşılaşılan genellikle `struct` olur.

Daha sonra view'ler arasında değer aktarma, veri modelleri ve state management öğrenirken bu içerikler kullanılmaya devam edecektir.
