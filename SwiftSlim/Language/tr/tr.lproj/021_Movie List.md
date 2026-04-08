# Film Listesi

Bu derste bir film listesi oluşturacağız.

![movie](../../Resource/021_movie.png)

Listede her filmin posteri, adı, yönetmeni ve puanı gösterilecektir.

Bu örnekte çok önemli bir kavram öğreneceğiz: `struct` yapısı. Bu yapı, bir film hakkındaki birden fazla bilgiyi tek bir bütün hâlinde birleştirmemize yardımcı olabilir. Buna ek olarak `UUID()`, `ForEach`, `Divider` ayırıcı ve verileri yönetmek için özel nesnelerin nasıl kullanılacağıyla da çalışacağız.

Bu fikirler daha sonraki SwiftUI geliştirmelerinde çok yaygındır. Bu dersi tamamladıktan sonra yalnızca bir film listesi oluşturmakla kalmayacak, aynı zamanda "bir veri kümesinin arayüz olarak nasıl gösterileceğini" de anlamaya başlayacaksınız.

## Tek Film

Tek bir film için arayüz oluşturarak başlayabiliriz.

![movie](../../Resource/021_movie1.png)

Bu arayüzün düzeni temel olarak iki bölümden oluşur: solda film posteri, sağda ise film tanıtımı yer alır.

### Film Posteri

Sol tarafta film posteri gösterilir ve resmi göstermek için `Image` kullanabiliriz.

Örneğin:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Bu kod, `"The Shawshank Redemption"` adlı bir görselin gösterildiği anlamına gelir.

Burada dikkat edilmesi gereken bir nokta, görsel adının gerçekten `Assets` kaynak klasöründe bulunması gerektiğidir. Aksi takdirde arayüz bu görseli doğru şekilde gösteremez.

![movie](../../Resource/021_movie2.png)

Bu değiştiricilerin işlevleri şunlardır:

- `resizable()` görselin yeniden boyutlandırılabileceği anlamına gelir.
- `scaledToFit()` ölçekleme sırasında orijinal en-boy oranının korunduğu, böylece görselin gerilmediği veya bozulmadığı anlamına gelir.
- `frame(height: 180)` görsel yüksekliğinin 180 olarak ayarlandığı anlamına gelir.
- `cornerRadius(10)` görsele 10 yarıçaplı yuvarlatılmış köşeler verildiği anlamına gelir.

Böylece uygun boyuta ve yuvarlatılmış köşelere sahip bir film posteri elde edebiliriz.

![movie](../../Resource/021_movie3.png)

### Film Tanıtımı

Sağ tarafta film tanıtımı gösterilir; buna film adı, yönetmen ve puan dahildir.

![movie](../../Resource/021_movie4.png)

Bu bölümü göstermek için `Text` kullanabiliriz:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Bu kodda `.font` yazı tipi boyutunu, `.fontWeight` ise yazı tipi kalınlığını temsil eder.

"Film adı", "yönetmen bilgisi" ve "puan bilgisi" arasındaki boşluğu daha belirgin hâle getirmek için burada en dış seviyede `VStack` kullanıyor ve şunu ayarlıyoruz:

```swift
spacing: 10
```

Bu, bu `VStack` içindeki her içerik grubu arasındaki boşluğun 10 olduğu anlamına gelir.

Yönetmen ve puanın ayrı ayrı birer `VStack` daha kullanmasının nedeni, her ikisinin de "başlık + içerik" yapısına ait olmasıdır. Bu sayede arayüz hiyerarşisi daha net olur ve daha sonra stili ayarlamaya devam etmek de daha kolay hâle gelir.

Buna ek olarak `VStack` varsayılan olarak ortalanır. Tüm metni sola hizalamak için şunu ayarlarız:

```swift
alignment: .leading
```

Bu da film tanıtımı bölümünün daha düzenli görünmesini sağlar.

### Divider

Şimdi, film tanıtımı içindeki içerik `spacing` kullanılarak birbirinden ayrılmış olsa da, farklı içerik parçaları arasındaki sınırlar hâlâ yeterince belirgin değildir.

Bu noktada bir ayırıcı ekleyebiliriz:

```swift
Divider()
```

Örneğin:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Bu, film tanıtımı bölümüne daha belirgin bir ayırma etkisi kazandırır.

![movie](../../Resource/021_movie4.png)

`Divider`, farklı içerikleri ayırma görevi olan, çok basit ama sık kullanılan bir view'dur.

`VStack` içinde `Divider()` yatay bir çizgi olarak gösterilir.

`HStack` içinde `Divider()` dikey bir çizgi olarak gösterilir.

Buna ek olarak `.frame`, `.background` ve `.padding` gibi yöntemlerle `Divider` stilini de değiştirebiliriz.

Örneğin:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Bu, kalınlığı 2 olan ve her iki yanında yatay padding bulunan mavi bir ayırıcı çizgi oluşturur.

![divider](../../Resource/021_divider.png)

### Tam Arayüz

Son olarak, film posterini ve film tanıtımını yan yana düzenlemek için `HStack` kullanabiliriz.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Burada `HStack(spacing: 20)`, sol ve sağ bölümler arasında 20 birim boşluk olduğu anlamına gelir.

Önemli bir nokta, `Divider()` öğesinin, daha önce bahsettiğimiz `TextField` ve `Slider` gibi, varsayılan olarak mümkün olduğunca fazla kullanılabilir alanı kaplamaya çalışmasıdır.

Bu nedenle sağdaki tanıtım bölümünün dış `VStack`'i için sabit bir genişlik ayarlıyoruz:

```swift
.frame(width: 200)
```

Bu, ayırıcı çizginin ve metin alanının genişliğini tutarlı tutar ve genel düzenin daha temiz görünmesini sağlar.

Bu noktada "tek film" için görüntüleme arayüzünü tamamlamış olduk.

![movie](../../Resource/021_movie1.png)

## Filmleri Bir Dizi İçinde Saklamak

Aynı stilde birden fazla filmi art arda göstermek istiyorsak, bu her film için benzer kod yazmamız gerektiği anlamına gelir.

Örneğin:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Bu şekilde yazılmış kod sonucu verebilir, ancak kod gittikçe uzar ve bakımı çok zahmetli olur.

Örneğin, tüm filmler için boşluğu `20`'den `15`'e değiştirmemiz ya da sağ taraftaki genişliği `200`'den
`220`'ye değiştirmemiz gerekirse, tekrar eden her kod bloğunu manuel olarak düzenlememiz gerekir.

Bu açıkça verimli bir yöntem değildir.

Daha önce dizileri öğrendik ve ayrıca bir diziye dayalı olarak view'ları tekrar tekrar göstermek için `ForEach` kullanmayı da öğrendik.

Örneğin:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Bu yaklaşım, bir grup görsel adı gibi "yalnızca tek bir veri parçası" bulunan durumlar için çok uygundur.

Ancak bir film yalnızca tek bir değerden oluşmaz. En azından şunları içerir:

1. film posteri
2. film adı
3. yönetmen
4. puan

Başka bir deyişle, bir film aslında yalnızca tek bir string değil, ilişkili verilerden oluşan bir kümedir.

Yalnızca dizileri kullanırsak, bu bilgileri ancak ayrı ayrı saklayabiliriz:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Bunları gösterirken, bunları tek tek eşleştirmek için aynı indekse güvenmemiz gerekir:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Bu yaklaşımın sorunu, bakım maliyetinin çok yüksek olmasıdır.

Çünkü bir filme ait veriler birden fazla diziye bölünmüştür; dizilerden biri fazladan bir öğe, eksik bir öğe ya da farklı bir sıra içerdiği anda görüntüleme sonucu yanlış olur.

Özellikle film eklerken veya kaldırırken aynı anda birden fazla diziyi güncellemeniz gerekir ve bir şeyi kaçırmak çok kolaydır.

Peki "film adı, yönetmen ve puan" gibi bilgileri tek bir bütün içinde nasıl birleştirebiliriz?

Bunun için `struct` kullanmak gerekir.

## struct Yapısını Tanımlama

Swift'te `struct`, "yapı" anlamına gelir.

Bunu, ilişkili birden fazla alanı tek bir bütün hâlinde birleştirebilen "özel veri türü" olarak düşünebilirsiniz.

Temel kullanım:

```swift
struct StructName {
	let name: String
}
```

Bu kodda `struct`, bir yapı tanımladığımızı belirten anahtar kelimedir. `StructName` ise yapının adıdır.

Süslü parantezlerin içindeki içerik, bu yapının içerdiği alanlar kümesidir ve her alanın hem adı hem de türü açıkça belirtilmelidir.

Normalde bir `struct` adının ilk harfi büyük olur; örneğin `Movie`, `Student` veya `UserInfo`. Bu, Swift'te yaygın bir adlandırma kuralıdır.

`struct`'ı, her alanın kutunun içinde ayrılmış boş bir konum gibi olduğu boş bir kutu olarak düşünebilirsiniz.

Bu konumlar henüz doldurulmadığında bu yalnızca boş bir kutudur. Ancak tüm alanlar uygun değerlerle doldurulduktan sonra tam bir hediye kutusuna dönüşür.

### struct Örneği

Daha önce yalnızca yapının kendisini tanımladık; bu da kutunun şeklini hazırlamaya eşdeğerdir.

Kullanılabilecek gerçek bir "örnek" elde etmek için hâlâ gerçek içeriği doldurmamız gerekir.

Bir örnek oluştururken genellikle yapı adından sonra `()` ekleriz:

```swift
StructName(...)
```

Parantez içine yazılan şey, bu yapının gerektirdiği alan içeriğidir.

Örneğin:

```swift
StructName(name: "Fang Junyu")
```

Bu kod şu anlama gelir: `StructName` yapısının biçimine göre yeni bir örnek oluştur ve `name` alanına `"Fang Junyu"` değerini ata.

Gerekli tüm alan değerlerini doldurduğumuzda, bu kutuyu doldurmak gibidir.

O noktada tam bir yapı örneği elde ederiz.

### struct Özelliklerine Erişme

Bir örnek oluşturduktan sonra, içindeki özelliklere erişmek için nokta sözdizimini kullanabiliriz.

Temel sözdizim:

```swift
instance.propertyName
```

Örneğin:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Burada `st` bir yapı örneğidir ve `st.name`, bu örnekteki `name` değerinin okunması anlamına gelir.

Bu okuma yöntemini şöyle anlayabilirsiniz: `st.name` yazdığımızda, bu sanki kutunun içindeki belirli bir konumda saklanan içeriği okumak gibidir.

Bu yazım tarzı daha sonraki SwiftUI arayüzlerinde çok yaygın olacaktır.

Örneğin, adı, yaşı ve sınıfı içeren bir öğrenci yapımız varsa, bunu arayüzde gösterirken şunları okuyabiliriz:

```swift
student.name
student.age
student.className
```

Bunu yapmanın avantajı, verilerin daha net ve yönetiminin daha kolay hâle gelmesidir.

### struct Konumu

Yeni başlayanlar için yapı genellikle `ContentView` dışına yazılabilir.

Örneğin:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Bu, yapıyı daha açık ve okumayı daha kolay hâle getirir.

`ContentView`'in kendisinin de aslında bir `struct` olduğunu fark edeceksiniz.

### Movie Yapısı

Yukarıdaki temel ile bir film yapısı tanımlayabiliriz:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Bu, film adı, yönetmen ve puanı temsil eden `name`, `director` ve `rating` adlı üç alandan oluşan `Movie` isimli bir yapıdır.

Böylece bir filmle ilgili bilgiler artık birden fazla diziye bölünmek zorunda kalmaz, bunun yerine doğrudan tek bir bütün içinde birleştirilebilir.

Örneğin, şöyle bir film örneği oluşturabiliriz:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Bu örnek, "tek bir eksiksiz film veri kümesini" temsil eder.

### Yapıları Bir Dizide Saklamak

Daha önce bir dizinin yalnızca tek bir tür saklayabildiğini söylemiştik.

Artık `Movie` yapısına sahip olduğumuza göre, dizi birden fazla `Movie` değeri saklayabilir.

```swift
let lists: [Movie] = []
```

Örneğin:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Bu `lists` dizisinde saklanan şey string'ler değil, birden fazla `Movie` örneğidir.

Yani dizideki her eleman tam bir filmdir.

Böylece film listesini göstermemiz gerektiğinde, her filmi tek tek okumak için `ForEach` kullanabiliriz.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Burada `movie in`, her döngüde diziden bir filmin alınıp geçici olarak `movie` olarak adlandırıldığı anlamına gelir.

Ardından şunları kullanabiliriz:

```swift
movie.name
movie.director
movie.rating
```

Bunlarla o filmin adını, yönetmenini ve puanını sırasıyla okuyup arayüzde gösterebiliriz.

## ForEach Hatası

Bu noktada film dizisi ve `ForEach` için temel yazım biçimini tamamlamış durumdayız.

Ancak aşağıdaki kodu doğrudan çalıştırırsanız:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

şöyle bir hata alırsınız:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Bu hatanın anlamı şudur: `id: \.self` yazdığınızda SwiftUI, onları ayırt edebilmek için dizideki her elemanı bir "benzersiz tanımlayıcı" olarak ele almak zorundadır.

Bu yazım tarzı `String` ve `Int` gibi basit türler için uygundur, çünkü bunlar kendi başlarına daha kolay ayırt edilirler.

Ancak `Movie`, bizim tanımladığımız özel bir yapıdır ve `ForEach`, yapının kendisini benzersiz tanımlayıcı olarak nasıl ele alacağını bilmez; bu yüzden hata verir.

Bu sorunu çözmenin en yaygın yolu, `Movie` öğesinin `Identifiable` protokolüne uymasını sağlamaktır.

## Protokol

Swift'te bir protokol, bir tür "kural" veya "gereksinim" olarak anlaşılabilir.

Bunu, uluslararası bir kuruluştaki anlaşma gibi düşünebilirsiniz: bir ülke belirli bir uluslararası kuruluşa katılmak isterse, genellikle önce o kuruluşun öne sürdüğü bazı kuralları karşılaması, bazı verileri açıklaması ve bazı ortak kurallara uyması gerekir. Ancak bu koşulları sağladıktan sonra katılabilir veya belirli işlere dahil olabilir.

Protokoller de benzer şekilde çalışır.

Bir tür belirli bir protokole uymak istediğinde, o protokolün gerektirdiği içeriği karşılaması gerekir. Yalnızca bu gereksinimler karşılandıktan sonra o tür ilgili işlevselliği kullanabilir.

Temel sözdizim:

```swift
struct Movie: Identifiable {
    // ...
}
```

Burada `: Identifiable`, `Movie` öğesinin `Identifiable` protokolüne uyduğu anlamına gelir.

Bir tür birden fazla protokole uyuyorsa, bunlar virgülle ayrılabilir:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` için en önemli gereksinim, türün kendisini tanımlayabilecek bir `id`'ye sahip olmasıdır.

Örneğin:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Burada `id`, bir kimlik numarası gibidir ve her filmi ayırt etmek için kullanılır.

Her filmin `id` değeri farklı olduğu sürece SwiftUI dizideki her elemanı doğru şekilde ayırt edebilir.

Örneğin:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ardından `ForEach` içinde şunu kullanın:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Böylece hata ortadan kalkar.

Çünkü `Movie` zaten `Identifiable` protokolüne uymaktadır; daha yaygın bir yazım biçimi `id:` ifadesini doğrudan atlamaktır:

```swift
ForEach(lists) { movie in
    // ...
}
```

Çünkü SwiftUI her öğeyi ayırt etmek için `movie.id` kullanması gerektiğini zaten bilir.

## ForEach İçindeki Ayırt Edici Tanımlayıcı

Şimdi `ForEach` içindeki `id` rolünü daha derinlemesine anlayacağız.

Örneğin:

```swift
ForEach(lists, id: \.self)
```

Bu şu anlama gelir: elemanın kendisini ayırt edici tanımlayıcı olarak kullan.

Ve:

```swift
ForEach(lists, id: \.id)
```

şu anlama gelir: elemanın `id` alanını ayırt edici tanımlayıcı olarak kullan.

Belirli bir alan tek başına benzersizliği garanti edebiliyorsa, geçici olarak o da kullanılabilir.

Örneğin, her filmin adı farklıysa aşağıdaki kod da mevcut verilerle doğru çalışabilir:

```swift
ForEach(lists, id: \.name)
```

Ancak burada gizli bir sorun vardır: `name` değerinin her zaman benzersiz olacağı garanti değildir.

Daha sonra aynı ada sahip başka bir film eklediğinizi varsayın. O zaman `name`, artık her elemanı doğru şekilde ayırt edemez.

Bu noktada kod hâlâ derlenebilse bile SwiftUI, view yenilemeleri, güncellemeler, eklemeler veya silmeler sırasında elemanları yanlış tanıyabilir ve görüntüleme sorunlarına neden olabilir.

Bu nedenle, verilerde kararlı bir ayrım gerektiğinde, gerçekten benzersiz alan olan `id`'yi kullanmak hâlâ en iyi seçenektir.

## UUID

`id: 1`, `id: 2` değerlerini manuel olarak yazmak sorunu çözebilse de hâlâ bir risk vardır: yanlışlıkla yinelenen `id` değerleri yazabilirsiniz ve o zaman benzersiz tanımlayıcı geçersiz hâle gelir.

Örneğin:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Bu, iki aynı `id` değeriyle sonuçlanır ve benzersiz tanımlayıcının etkisi kaybolur.

Manuel hatalardan kaçınmak için genellikle `UUID()` kullanırız.

Swift'te `UUID()`, rastgele bir 128 bit tanımlayıcı üretir. Bu genellikle harflerden ve rakamlardan oluşan uzun bir string olarak gösterilir.

Örneğin:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Burada `UUID()` aslında `UUID` türünün bir örneğini oluşturur. Bunu otomatik olarak üretilen bir "benzersiz numara" gibi düşünebilirsiniz.

Bu nedenle, her seferinde oluşturulan değerler neredeyse hiç tekrar etmez; dolayısıyla `id` olarak kullanmak için çok uygundurlar.

`Movie` yapısını şöyle değiştirebiliriz:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Bu kod, `Movie` yapısındaki `id` alanına varsayılan olarak yeni bir `UUID` örneği atanacağı anlamına gelir.

Başka bir deyişle, her yeni `Movie` oluşturduğumuzda sistem önce otomatik olarak benzersiz bir `id` üretir.

`id` zaten varsayılan bir değere sahip olduğundan, daha sonra `Movie` örnekleri oluştururken `id`'yi manuel olarak doldurmamız artık gerekmez.

Örneğin:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Burada `id` yazılmamış olsa da film örneğinin yine de kendi `id` değeri vardır; sadece bu değer zaten `UUID()` tarafından otomatik olarak oluşturulmuştur.

Bu yöntemi kullandıktan sonra artık her film için manuel olarak `id` doldurmamız gerekmez; bu yalnızca kod miktarını azaltmakla kalmaz, aynı zamanda yinelenen id değerlerinden kaynaklanan hataları da önler.

Son olarak, yalnızca üst kısma bir `Banner` görseli eklememiz ve içeriğin kaydırılabilmesi için `ScrollView` kullanmamız gerekir; ardından tüm film listesi görünümü tamamlanmış olur.

## Özet

Bu derste çok önemli bir kavram öğrendik: `struct`.

`struct` sayesinde bir filme ait birden fazla ilişkili alanı, ad, yönetmen ve puanı birden fazla diziye bölmek yerine tek bir bütün içinde birleştirebiliriz.

Veriler birleştirildikten sonra, dizideki her filmi view içinde tek tek göstermek için `ForEach` kullanabiliriz.

Aynı zamanda `ForEach` içindeki "ayırt edici tanımlayıcı"nın rolünü de anladık: SwiftUI, view'u doğru şekilde göstermek ve güncellemek için dizideki her elemanı nasıl ayırt edeceğini bilmek zorundadır.

Bu nedenle `Movie` yapısının `Identifiable` protokolüne uymasını sağladık ve ona benzersiz bir `id` verdik.

`id`'yi manuel olarak doldururken hata yapmamak için, sistemin benzersiz tanımlayıcıyı otomatik olarak oluşturabilmesi amacıyla `UUID()` öğesini de öğrendik.

Bu dersi tamamladıktan sonra yalnızca film listesini bitirmekle kalmayacak, aynı zamanda SwiftUI içindeki önemli bir fikre de dokunmaya başlayacaksınız: **önce veriyi düzenle, ardından o veriye göre view oluştur.**

## Tam Kod

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
