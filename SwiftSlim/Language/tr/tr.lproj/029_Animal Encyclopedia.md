# Hayvan Ansiklopedisi 

Bu derste, özel görünümler ve veri aktarımı üzerinde çalışmaya devam edeceğiz.

Basit bir hayvan ansiklopedisi görünümü oluşturacağız. Sayfada beş hayvan gösterilecek. Bir hayvana tıklandığında, o hayvanın görselini, dağılım alanını, yaşam alanını ve açıklamasını gösteren bir ayrıntı görünümü açılacak.

Uygulama sonucu:

![view](../../../Resource/029_view.png)

Bu örnek üzerinden veri yapısı, liste gösterimi, tıklama etkileşimi ve Sheet açılır görünümü arasındaki iş birliğinipratik yapabiliriz.

## Görsel kaynakları hazırlama

Önce beş hayvan görseli hazırlamamız gerekiyor:

- Yunus: `dolphin.jpg`
- Zürafa: `giraffe.jpg`
- Aslan: `lion.jpg`
- Panda: `panda.jpg`
- Kutup ayısı: `polarBear.jpg`

Aşağıdaki görsel kaynakları kullanabilirsiniz:

[Yunus](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Zürafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Aslan](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Kutup ayısı](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Görselleri indirdikten sonra, onları Xcode projesindeki `Assets` kaynak klasörüne sürükleyin.

![assets](../../../Resource/029_assets.png)

Dikkat edilmesi gereken nokta şudur: kod içinde görsel kullanırken genellikle `.jpg` uzantısını yazmanız gerekmez.

Örneğin, görsel kaynağının adı `dolphin` ise kodda şöyle yazılır:

```swift
Image("dolphin")
```

Görsel adı yanlış yazılırsa görsel düzgün görüntülenemez.

Not: Yukarıdaki görseller Wikimedia projesinden alınmıştır. Kullanırken özgün görsel bağlantısını ve kaynak bilgisini korumanız önerilir.

## Hayvan yapısını oluşturma

Bu sayfada her hayvanın birden fazla bilgisi vardır:

- Hayvan adı
- Hayvan görseli
- Hayvan emojisi
- Dağılım alanı
- Yaşam alanı
- Hayvan açıklaması

Bu bilgileri birçok değişkene dağıtırsak kod karışık hâle gelir. Bu yüzden bir `Animal` yapısı oluşturup bir hayvana ait bilgileri bir arada tutabiliriz.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Bu kodda:

- `id`: hayvanın benzersiz kimliği.
- `name`: hayvan adı.
- `imageName`: hayvan görselinin adı.
- `avatarEmoji`: hayvan emojisi.
- `distributionArea`: dağılım alanı.
- `habitat`: yaşam alanı.
- `animalDescription`: hayvan açıklaması.

Bunlardan:

```swift
let id = UUID()
```

`id`, her hayvanı tanımlamak için kullanılır. Daha sonra hayvan listesini göstermek için `ForEach` kullanacağız ve seçilen hayvana göre ayrıntı açmak için `.sheet(item:)` kullanacağız. Bu nedenle `Animal` yapısının `Identifiable` protokolüne uyması gerekir.

`Identifiable` protokolünün görevi SwiftUI’a şunu söylemektir: her hayvanın kimliğini ayırt edebilecek bir `id` değeri vardır.

## Hayvan verilerini oluşturma

Ardından `ContentView` içinde bir hayvan dizisi oluşturuyoruz.

Dizide beş `Animal` saklanır ve her `Animal` bir hayvanı temsil eder.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Yunus
        Animal(
            name: "Yunus",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Dünya genelindeki sıcak ve ılıman okyanuslar.",
            habitat: "Okyanuslar, kıyı suları ve bazı büyük nehirler.",
            animalDescription: "Yunuslar zeki deniz memelileridir. Gruplar hâlinde yaşar, seslerle iletişim kurar ve oyuncu davranışlarıyla tanınırlar."
        ),
        // Zürafa
        Animal(
            name: "Zürafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Afrika’daki savanlar ve açık ormanlık alanlar.",
            habitat: "Çayırlar, savanlar ve açık ormanlar.",
            animalDescription: "Zürafalar karadaki en uzun hayvanlardır. Uzun boyunları ve uzun bacakları vardır; genellikle yüksek ağaçlardaki yapraklarla beslenirler."
        ),
        // Aslan
        Animal(
            name: "Aslan",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Başlıca Sahra Altı Afrika’da bulunur; Batı Hindistan’da küçük bir popülasyonu vardır.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Aslanlar güçlü büyük kedilerdir. Genellikle sürü adı verilen gruplar hâlinde yaşarlar ve çoğu zaman hayvanlar dünyasının kralı olarak bilinirler."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Çin’in orta kesimlerindeki dağ ormanları.",
            habitat: "Serin ve nemli dağlık bölgelerdeki bambu ormanları.",
            animalDescription: "Pandalar siyah-beyaz kürkleriyle bilinen ayılardır. Çoğunlukla bambu yerler ve dünyadaki en kolay tanınan hayvanlardan biridir."
        ),
        // Kutup ayısı
        Animal(
            name: "Kutup Ayısı",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Kuzey Kutbu çevresindeki Arktik bölgeler.",
            habitat: "Deniz buzu, kıyı bölgeleri ve soğuk Arktik ortamlar.",
            animalDescription: "Kutup ayıları soğuk ortamlara uyum sağlamış büyük ayılardır. Güçlü yüzücülerdir ve fok avlamak için çoğunlukla deniz buzuna bağımlıdırlar."
        )
    ]

    var body: some View {
        Text("Hayvan Ansiklopedisi")
    }
}
```

Buradaki `animals` bir dizidir:

```swift
let animals: [Animal]
```

`[Animal]`, bu dizide birden fazla `Animal` saklandığını gösterir.

Başka bir deyişle, `animals` tek bir hayvan değil, bir hayvan grubudur.

## Hayvan listesini gösterme

Şimdi hayvan listesini göstermek için `ForEach` kullanabiliriz.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Görüntü sonucu:

![view](../../../Resource/029_view1.png)

Bu kodda:

```swift
ForEach(animals) { animal in
    ...
}
```

`animals` dizisinin dolaşıldığını ifade eder.

Her döngüde `animal`, o anda gösterilen hayvanı temsil eder.

Örneğin, ilk döngüde `animal` yunustur; ikinci döngüde `animal` zürafadır.

Bu yüzden mevcut hayvanın bilgilerini aşağıdaki şekilde gösterebiliriz:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Böylece beş hayvanı gösterebiliriz.

## Hayvan listesini tıklanabilir hâle getirme

Liste artık görüntülendi, ancak henüz tıklanabilir değil.

Bir hayvana tıklandıktan sonra ayrıntıların açılmasını istiyorsak önce “şu anda seçili hayvanı” kaydetmemiz gerekir.

Bu nedenle `ContentView` içine bir durum değişkeni ekliyoruz:

```swift
@State private var selectedAnimal: Animal? = nil
```

Buradaki `selectedAnimal`, `Animal?` türünde bir optional değerdir.

Bu, içinde bir hayvan olabileceği gibi hiç hayvan olmayabileceği anlamına gelir.

Varsayılan değer `nil`dir; bu da başlangıçta hiçbir hayvanın seçilmediği anlamına gelir.

Sonra her hayvan satırını `Button` hâline getiriyoruz:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Önemli olan şu kod satırıdır:

```swift
selectedAnimal = animal
```

Kullanıcı bir hayvana tıkladığında, bu hayvanı `selectedAnimal` içine kaydederiz.

Örneğin kullanıcı yunusa tıklarsa, `selectedAnimal` içinde yunus saklanır.

Kullanıcı pandaya tıklarsa, `selectedAnimal` içinde panda saklanır.

Yani `selectedAnimal`, kullanıcının şu anda hangi hayvana tıkladığını kaydetmek için kullanılır.

## Sheet açılır görünümü

Artık buton aracılığıyla “şu anda tıklanan hayvanı” kaydedebiliyoruz.

Sırada, hayvan ayrıntılarını göstermek için bir açılır görünüm oluşturmamız gerekiyor.

![view](../../../Resource/029_view2.png)

SwiftUI’da bu açılma etkisini oluşturmak için `Sheet` kullanılabilir.

`Sheet`, geçici olarak açılan bir sayfa gibi düşünülebilir. Geçerli sayfanın üzerinde gösterilir; kullanıcı içeriği inceledikten sonra aşağı kaydırarak kapatabilir.

## Sheet örneği

Hayvan ayrıntılarını gerçekten göstermeden önce, basit bir örnekle `Sheet`in nasıl açıldığını anlayalım.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet Göster")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet Görünümü")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Görüntü sonucu:

![view](../../../Resource/029_view3.png)

Bu kodda bir Boolean değer oluşturduk:

```swift
@State private var showSheet = false
```

`showSheet` varsayılan olarak `false` değerindedir; bu, başlangıçta `Sheet`in gösterilmediği anlamına gelir.

Butona tıklandığında:

```swift
showSheet.toggle()
```

`toggle()`, Boolean değeri tersine çevirmek anlamına gelir.

Başlangıçta `false` ise `toggle()` çağrıldıktan sonra `true` olur.

Başlangıçta `true` ise `toggle()` çağrıldıktan sonra `false` olur.

Bu yüzden butona tıklandıktan sonra `showSheet`, `false` değerinden `true` değerine geçer.

`showSheet` `true` olduğunda aşağıdaki kod `Sheet`i açar:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet Görünümü")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Bu kod şunu ifade eder: `showSheet` `true` olduğunda bir `Sheet` açılır ve `Sheet` içinde `Text("Sheet Görünümü")` gösterilir.

Görüntü sonucu:

![view](../../../Resource/029_view4.png)

Bu yazım biçimi sabit içerik açmak için uygundur.

Örneğin, butona tıklandıktan sonra ayarlar sayfası, açıklama sayfası veya uyarı sayfası açılabilir.

### Sheet’in gösterileceği konum

`Sheet` bir açılır görünüm olsa da SwiftUI’da `Text()` veya `Image()` gibi doğrudan bağımsız bir görünüm olarak yazılmaz; bir görünüm değiştiricisi olarak kullanılır.

Yani `.sheet(...)`, `.font()`, `.padding()` ve `.shadow()` gibi değiştiricilere benzer; hepsinin bir görünümün arkasına eklenmesi gerekir.

Örneğin:

```swift
Button("Sheet Göster") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet Görünümü")
}
```

Bu örnekte `.sheet`, `Button` arkasına eklenmiştir.

`showSheet` `true` olduğunda SwiftUI `Sheet`i açar ve süslü parantezler içindeki içeriği gösterir:

```swift
Text("Sheet Görünümü")
```

Ancak gerçek geliştirmede, bir sayfada birden fazla buton varsa genellikle her butona ayrı bir `.sheet` eklenmez.

Daha yaygın yöntem, `.sheet`i dıştaki görünümün arkasına eklemektir.

Örneğin:

```swift
VStack {
    Button("Sheet Göster") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet Görünümü")
}
```

Buton `showSheet` değerini değiştirmekten sorumludur; dıştaki görünüm ise `showSheet` değerinin `true` olup olmamasına göre `Sheet`i açar.

## Optional değerle Sheet bağlama

Daha önce öğrendiğimiz yazım biçimi şuydu:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet Görünümü")
}
```

Bu yazım biçimi, sabit bir sayfanın gösterilip gizlenmesini kontrol etmek için uygundur.

Ancak hayvan ansiklopedisi örneğinde yalnızca “`Sheet` açılacak mı?” sorusunu değil, “hangi hayvana tıklandı?” sorusunu da bilmemiz gerekir.

Örneğin:

Kullanıcı yunusa tıkladığında `Sheet` içinde yunus ayrıntıları gösterilmelidir.

Kullanıcı pandaya tıkladığında `Sheet` içinde panda ayrıntıları gösterilmelidir.

Bu nedenle burada başka bir Sheet yazım biçimi daha uygundur:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet içinde görüntülenecek içerik
}
```

Bu kodda `Sheet`, `selectedAnimal` adlı bir optional değere bağlanır.

Burada dikkat edilmesi gereken nokta şudur: `item:` sonrasına `selectedAnimal` değil, `$selectedAnimal` yazılır.

Çünkü `Sheet` yalnızca `selectedAnimal` değerini okumaz; onun değişimine göre açılıp açılmayacağına da karar verir.

Bu kod şu şekilde anlaşılabilir:

- `selectedAnimal` `nil` olduğunda `Sheet` gösterilmez.
- `selectedAnimal` bir değere sahip olduğunda `Sheet` gösterilir.
- `Sheet` kapatıldığında SwiftUI `selectedAnimal` değerini yeniden `nil` yapar.

SwiftUI, `selectedAnimal` içinde saklanan hayvanı süslü parantezlerdeki `animal` parametresine aktarır.

Yani `.sheet(item:)` yalnızca açılmayı kontrol etmez; seçilen veriyi `Sheet` içine de aktarır.

## Sheet ile hayvan adını gösterme

Şimdilik karmaşık bir ayrıntı görünümü oluşturmaya acele etmeyelim.

Kodu daha kolayanlamak için önce `Sheet` içinde mevcut hayvanın adını gösterelim.

`VStack` dışına `.sheet(item:)` ekleyin:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Buradaki en önemli bölüm şu koddur:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal` bir değere sahip olduğunda `Sheet` açılır.

Süslü parantezlerdeki `animal`, şu anda seçilen hayvandır.

Bu yüzden:

```swift
Text(animal.name)
```

geçerli olarak tıklanan hayvanın adını gösterir.

Örneğin `Yunus`a tıklarsanız Sheet içinde `Yunus` gösterilir.

`Panda`ya tıklarsanız `Sheet` içinde `Panda` gösterilir.

Böylece farklı hayvanlara tıklayınca farklı hayvan adlarının açılmasını sağlamış oluruz.

Hayvan adını gösterme:

![view](../../../Resource/029_view5.png)

Ancak hayvan ayrıntıları yalnızca bir ad göstermemeli; ad, dağılım alanı, yaşam alanı ve açıklama da gösterilmelidir.

Bu kodların tamamını `.sheet` içine yazarsak kod çok uzar ve okunması zorlaşır.

Bu yüzden sırada, özellikle hayvan ayrıntılarını göstermekten sorumlu yeni bir özel görünüm oluşturacağız.

## Hayvan ayrıntı görünümünü oluşturma

Şimdi `AnimalDetailView` adlı yeni bir özel görünüm oluşturuyoruz.

Bu görünüm bir `Animal` alır ve hayvan ayrıntılarını gösterir.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Dağılım Alanı** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Yaşam Alanı** ：\(animal.habitat)")

                    Divider()

                    Text("**Hayvan Açıklaması** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Görüntü sonucu:

![view](../../../Resource/029_view2.png)

Buradaki önemli nokta şudur:

```swift
var animal: Animal
```

Bu, `AnimalDetailView` görünümünün dışarıdan bir hayvan alması gerektiğini gösterir.

Hayvanı aldıktan sonra ayrıntı görünümü bu hayvana ait çeşitli bilgileri kullanabilir:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Yani `AnimalDetailView` yalnızca kendisine aktarılan hayvanı göstermekten sorumludur.

### Markdown ile kalın metin

Ayrıntı görünümünde şöyle bir kod yazdık:

```swift
Text("**Yaşam Alanı:** \(animal.habitat)")
```

Burada iki bilgi noktası var.

Birincisi, `**Yaşam Alanı:**` `Markdown` söz dizimini kullanır. İki yıldız arasına alınan metin kalın gösterilir.

İkincisi, `\()` string interpolation’dır; değişken değerini metin içinde gösterebilir.

Bu kod önce kalın `Yaşam Alanı:` metnini, ardından bu hayvanın yaşam alanını gösterir.

## Sheet içinde ayrıntı görünümünü gösterme

`AnimalDetailView` oluşturulduktan sonra `ContentView`e geri dönüp `Sheet` içindeki eski ad görünümünü ayrıntı görünümüyle değiştirebiliriz.

Önceden şöyleydi:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Şimdi şöyle değiştiriyoruz:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Buradaki `animal:`, `AnimalDetailView` görünümünün parametre adıdır.

Sonraki `animal`, `.sheet(item:)` tarafından aktarılan mevcut hayvandır.

Yani şu anda tıklanan hayvan, gösterilmesi için `AnimalDetailView`e aktarılır.

Tam yapı:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Kullanıcı bir hayvana tıkladığında:

```swift
selectedAnimal = animal
```

`selectedAnimal`, `nil` değerinden belirli bir hayvana dönüşür. `Sheet`, `selectedAnimal` değerinin olduğunu algıladıktan sonra görünümü açar.

`Sheet`, `selectedAnimal` içindeki hayvanı `AnimalDetailView` görünümüne aktarır; `AnimalDetailView` de hayvan ayrıntılarını gösterir.

Böylece hayvan listesine tıklayınca ilgili hayvan ayrıntılarının açılması işlevini gerçekleştirmiş oluruz.

## Sheet’in iki yazım biçimi arasındaki fark

Artık hayvan ayrıntı görünümünü göstermek için `.sheet(item:)` kullandık.

Burada `Sheet`in iki yaygın yazım biçimini kısaca özetleyebiliriz.

### Birinci yöntem: Boolean değere bağlama

```swift
@State private var showSheet = false

Button("Sheet Göster") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet Görünümü")
}
```

Bu yazım biçimi, ayarlar sayfası, açıklama sayfası veya uyarı sayfası gibi sabit içerikleri açmak için uygundur.

`showSheet` bir Boolean değerdir ve yalnızca `true` ile `false` olmak üzere iki durumu vardır.

`showSheet` `true` olduğunda `Sheet` gösterilir.

`showSheet` `false` olduğunda `Sheet` gösterilmez.

### İkinci yöntem: Optional değere bağlama

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Bu yazım biçimi, seçilen veriye göre farklı içerik açmak için uygundur.

Bu derste farklı hayvanlara tıklayıp farklı hayvan ayrıntılarını göstermemiz gerekiyor; bu nedenle `.sheet(item:)` kullanmak daha uygundur.

## Tam kod

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Hayvan adı
    let name: String
    
    // Hayvan görseli
    let imageName: String
    
    // Hayvan etiketi sembolü
    let avatarEmoji: String
    
    // Dağılım alanı
    let distributionArea: String
    
    // Yaşam alanı
    let habitat: String
    
    // Hayvan açıklaması
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Yunus
        Animal(
            name: "Yunus",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Dünya genelindeki sıcak ve ılıman okyanuslar.",
            habitat: "Okyanuslar, kıyı suları ve bazı büyük nehirler.",
            animalDescription: "Yunuslar zeki deniz memelileridir. Gruplar hâlinde yaşar, seslerle iletişim kurar ve oyuncu davranışlarıyla tanınırlar."
        ),
        // Zürafa
        Animal(
            name: "Zürafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Afrika’daki savanlar ve açık ormanlık alanlar.",
            habitat: "Çayırlar, savanlar ve açık ormanlar.",
            animalDescription: "Zürafalar karadaki en uzun hayvanlardır. Uzun boyunları ve uzun bacakları vardır; genellikle yüksek ağaçlardaki yapraklarla beslenirler."
        ),
        // Aslan
        Animal(
            name: "Aslan",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Başlıca Sahra Altı Afrika’da bulunur; Batı Hindistan’da küçük bir popülasyonu vardır.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Aslanlar güçlü büyük kedilerdir. Genellikle sürü adı verilen gruplar hâlinde yaşarlar ve çoğu zaman hayvanlar dünyasının kralı olarak bilinirler."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Çin’in orta kesimlerindeki dağ ormanları.",
            habitat: "Serin ve nemli dağlık bölgelerdeki bambu ormanları.",
            animalDescription: "Pandalar siyah-beyaz kürkleriyle bilinen ayılardır. Çoğunlukla bambu yerler ve dünyadaki en kolay tanınan hayvanlardan biridir."
        ),
        // Kutup ayısı
        Animal(
            name: "Kutup Ayısı",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Kuzey Kutbu çevresindeki Arktik bölgeler.",
            habitat: "Deniz buzu, kıyı bölgeleri ve soğuk Arktik ortamlar.",
            animalDescription: "Kutup ayıları soğuk ortamlara uyum sağlamış büyük ayılardır. Güçlü yüzücülerdir ve fok avlamak için çoğunlukla deniz buzuna bağımlıdırlar."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Dağılım Alanı** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Yaşam Alanı** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Hayvan Açıklaması** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Özet

Bu derste basit bir hayvan ansiklopedisi sayfası tamamladık.

Önce hayvan bilgilerini saklamak için `Animal` yapısını kullandık, ardından beş hayvanı bir dizide sakladık ve sonra hayvan listesini göstermek için `ForEach` kullandık.

Kullanıcı bir hayvana tıkladığında, bu hayvanı `selectedAnimal` içine kaydederiz:

```swift
selectedAnimal = animal
```

`selectedAnimal` bir değere sahip olduğunda `.sheet(item:)` ayrıntı görünümünü açar ve seçilen hayvanı `AnimalDetailView`e aktarır.

Bu dersteki en önemli şey arayüz stili değil, şu veri aktarım yolunu anlamaktır:

```swift
Hayvana tıkla → selectedAnimal hayvanı saklar → Sheet açılır → AnimalDetailView ayrıntıları gösterir
```

Bu yolu anladıktan sonra ürün ayrıntıları, kurs ayrıntıları, makale ayrıntıları, kişi ayrıntıları gibi daha fazla benzer işlev oluşturabilirsiniz.
