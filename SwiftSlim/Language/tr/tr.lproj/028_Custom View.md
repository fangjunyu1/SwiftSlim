# Özel View

Bu derste, SwiftUI’de çok önemli bir yazım şeklini öğreneceğiz: **özel View**.

Özel View, tekrarlanan bir View kodu bölümünü kapsülleyerek tekrar tekrar kullanılabilen bir View haline getirebilir.

Gerçek App geliştirme sürecinde sık sık şöyle bir durumla karşılaşırız: birçok ekranın yapısı aynıdır, yalnızca gösterilen içerik farklıdır.

Örneğin bir forum sitesindeki gönderi listesinde, her gönderide başlık, resim, beğeni sayısı gibi bilgiler olabilir.

![Reddit](../../../Resource/028_view1.png)

Bir alışveriş sitesindeki ürün listesinde, her ürünün resmi, adı ve fiyatı gibi bilgiler olabilir.

![Amazon](../../../Resource/028_view2.png)

Bu içeriklerin yapısı benzerdir; fark yalnızca gösterilen verilerin farklı olmasıdır.

Her öğe için kodu tek tek elle yazarsak, kod çok uzar ve daha sonra değiştirmek de zorlaşır.

Bu yüzden aynı yapıyı özel bir View olarak kapsülleyebilir, farklı içerikleri ise parametre olarak içeri aktarabiliriz.

Böylece aynı View farklı içerikleri gösterebilir.

## İhtiyaç senaryosu

Örneğin şimdi bir ayarlar listesi yapmak istiyoruz.

Görüntüleme sonucu:

![view](../../../Resource/028_view.png)

Bu ayarlar listesinde üç farklı ayar öğesi vardır: `Ayarlar`, `Klasör`, `Müzik`.

İkonları, renkleri ve başlıkları farklı olsa da genel yapıları aynıdır:

- Sol taraftaki ikon
- İkonun arka plan rengi
- Ortadaki başlık
- Sağ taraftaki ok

Özel View kullanmazsak, muhtemelen şöyle yazardık:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Ayarlar")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Klasör")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Müzik")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Bu kod normal şekilde görüntülenebilir, ancak sorun da oldukça açıktır: üç ayar öğesinin kodu neredeyse tamamen aynıdır.

Farklı olan yerler yalnızca ikon, renk ve başlıktır:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Ayarlar")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Klasör")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Müzik")
```

Yani her ayar öğesinin yapısı sabittir; yalnızca ikon, renk ve başlık farklıdır.

Bu tür bir durum özel View kullanmak için çok uygundur.

### Gölge shadow

Burada yeni bir modifier olan `.shadow(radius:)` kullanıldı:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)`, View’e gölge ekleyebilir.

`radius`, gölgenin bulanıklık yarıçapını ifade eder. Değer büyüdükçe gölgenin yayılma alanı genellikle daha büyük olur ve daha yumuşak görünür.

Burada `1` olarak ayarlanmıştır; bu, yalnızca çok hafif bir gölge efekti eklemek anlamına gelir.

## Ayar öğesi View’ini kapsülleme

Sonra her ayar öğesini yeni bir View olarak kapsüllüyoruz.

Bir `SettingItemView` oluşturabiliriz:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Bu View içinde üç özellik tanımladık:

```swift
let icon: String
let color: Color
let title: String
```

Bunların anlamı:

- `icon`, ikon adını ifade eder
- `color`, ikonun arka plan rengini ifade eder
- `title`, ayar öğesinin başlığını ifade eder

Bu üç içerik farklı ayar öğelerinde farklı olduğu için, onları dışarıdan aktarılabilen parametreler haline getiriyoruz.

## Özel View kullanma

`SettingItemView` oluşturulduktan sonra, artık uzun bir `HStack` kodunu tekrar tekrar yazmamıza gerek yoktur.

Artık şöyle kullanabiliriz:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")
```

Bu kod satırı, bir ayar öğesi View’i oluşturmayı ve üç parametre aktarmayı ifade eder:

```swift
icon: "gear"
color: Color.blue
title: "Ayarlar"
```

Aktarıldıktan sonra, `SettingItemView` içindeki özellikler karşılık gelen değerleri alır:

- `icon` değerinin sonucu `gear`
- `color` değerinin sonucu `Color.blue`
- `title` değerinin sonucu `"Ayarlar"`

Bu nedenle View içindeki `Image(systemName: icon)` dişli ikonunu gösterir, `.background(color)` mavi arka planı kullanır, `Text(title)` ise `Ayarlar` metnini gösterir.

Tam kod:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Klasör")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Müzik")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/028_view.png)

Görüldüğü gibi, kapsülleme sonrasında görüntüleme sonucu öncekiyle aynıdır, ancak kod daha anlaşılır hale gelir.

Önceden her ayar öğesi için bütün bir `HStack` bölümü yazmak gerekirken, şimdi yalnızca tek satır kod yeterlidir:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")
```

Özel View’in işlevi budur: **tekrarlanan View yapısını kapsüllemek ve yalnızca farklı içerikleri parametre olarak aktarmak.**

## Neden parametre aktarılabilir?

Şimdi özel View’in neden parametre aktarabildiğini kısaca anlayalım.

SwiftUI’de View özünde bir struct’tır.

Örneğin:

```swift
struct ContentView: View {
    var body: some View {
        Text("Merhaba, Dünya!")
    }
}
```

Buradaki `ContentView` bir struct’tır.

Şunu yazdığımızda:

```swift
ContentView()
```

aslında bir `ContentView` View’i oluşturuyoruz.

Sondaki `()`, onun initializer metodunu çağırmak anlamına gelir; bunu bu View’i oluşturmak olarak da anlayabiliriz.

Bu `ContentView`, dışarıdan aktarılması gereken bir özelliğe sahip olmadığı için doğrudan şöyle yazabiliriz:

```swift
ContentView()
```

Ancak View içinde değer atanmamış bir özellik varsa, View oluşturulurken karşılık gelen değerin aktarılması gerekir.

Örneğin:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ad: \(name)")
    }
}
```

Buradaki `name` bir özelliktir ve varsayılan değeri yoktur.

Bu yüzden `ContentView` oluşturulurken, `name` için belirli bir değer verilmelidir:

```swift
ContentView(name: "Fang Junyu")
```

Böylece View, bu değeri içeride kullanabilir:

```swift
Text("ad: \(name)")
```

`SettingItemView` oluştururken parametre aktarmamızın nedeni de budur:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")
```

Çünkü `SettingItemView` içinde varsayılan değeri olmayan üç özellik vardır:

```swift
let icon: String
let color: Color
let title: String
```

Bu nedenle bu View oluşturulurken, bu değerlerin içeri aktarılması gerekir. Aktarılan parametreler, Swift tarafından View içindeki özelliklere değer atamak için kullanılır.

## Initializer metodu

Şimdi initializer metodunu biraz daha anlayalım.

### Varsayılan initializer metodu

Sıradan bir View tanımladığımızda:

```swift
struct ContentView: View {
    var body: some View {
        Text("Merhaba, Dünya!")
    }
}
```

Bu kodda initializer metodunu elle yazmadık.

Ancak bu View’i kullanırken şöyle yazabiliriz:

```swift
ContentView()
```

Buradaki `()`, aslında `ContentView` oluşturmak anlamına gelir; bunu onun initializer metodunu çağırmak olarak da anlayabiliriz.

### Initializer metodu yokken neden yine de çağrılabilir?

Çünkü Swift derleyicisi bizim için otomatik olarak bir initializer metodu oluşturur.

Dikkat edilmesi gereken nokta şudur: **bu initializer metodu otomatik olarak oluşturulur ve genellikle onu kodda doğrudan görmeyiz.**

Yani `struct` içinde elle şunu yazmamış olsak da:

```swift
init() {

}
```

Swift derleyicisi arka planda bizim için buna benzer bir initializer metodu oluşturur:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Merhaba, Dünya!")
    }
}
```

Bu yüzden doğrudan şöyle yazabiliriz:

```swift
ContentView()
```

Dolayısıyla gerçek kodda genellikle initializer metodunu elle yazmamıza gerek yoktur.

Yalnızca şu noktayı anlamak yeterlidir: **SwiftUI View oluşturulurken, View’in initializer metodu çağrılır. Initializer metodunu elle yazmasak bile Swift bazen bizim için otomatik olarak oluşturabilir.**

### Parametreli initializer metodu

View içinde varsayılan değeri olmayan bir özellik varsa, örneğin:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ad: \(name)")
    }
}
```

Swift derleyicisi, özelliklere göre otomatik olarak parametreli bir initializer metodu oluşturur.

Bunu basitçe şöyle anlayabiliriz:

```swift
init(name: String) {
    self.name = name
}
```

Buradaki:

```swift
init(name: String)
```

`ContentView` oluşturulurken `String` türünde bir `name` parametresi aktarılması gerektiğini ifade eder.

Şunu yazdığımızda:

```swift
ContentView(name: "Fang Junyu")
```

anlamı şudur: `"Fang Junyu"` değerini initializer metoduna parametre olarak aktarmak.

Sonra initializer metodunun içinde şu işlem yapılır:

```swift
self.name = name
```

Bu kod satırının anlamı şudur: dışarıdan aktarılan `name` değerini, mevcut View’in kendi `name` özelliğine ata.

Basitçe şöyle anlayabiliriz:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ad: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Böylece View içeride aktarılan değeri kullanabilir.

Parametreli View’in initialization süreci budur: **View içindeki özellik varsayılan değere sahip değilse, View oluşturulurken ilgili parametre aktarılmalı ve initializer metodu özellik atamasını tamamlamalıdır.**

## Özelliğin varsayılan değeri olduğu durum

Özelliğin zaten varsayılan değeri varsa, View oluşturulurken parametre aktarılmayabilir.

Örneğin:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ad: \(name)")
    }
}
```

Buradaki `name` zaten bir varsayılan değere sahiptir:

```swift
"Fang Junyu"
```

Bu yüzden `ContentView` oluşturulurken doğrudan şöyle yazılabilir:

```swift
ContentView()
```

Bu durumda `name` varsayılan değeri kullanır ve arayüz şunu gösterir:

```swift
ad: Fang Junyu
```

Elbette View oluşturulurken yeni bir değer de aktarılabilir:

```swift
ContentView(name: "Sam")
```

Bu durumda View, varsayılan değeri değil, dışarıdan aktarılan `"Sam"` değerini kullanır ve arayüz şunu gösterir:

```swift
ad: Sam
```

Anlamayı kolaylaştırmak için, Swift derleyicisinin otomatik oluşturduğu initializer metodunu basitçe şöyle düşünebiliriz:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Buradaki `name: String = "Fang Junyu"` şu anlama gelir: View oluşturulurken `name` aktarılmazsa varsayılan değer olan `"Fang Junyu"` kullanılır; View oluşturulurken yeni bir `name` aktarılırsa aktarılan değer kullanılır.

Yani: **dışarıdan parametre aktarılmazsa özelliğin varsayılan değeri kullanılır; dışarıdan parametre aktarılırsa aktarılan değer kullanılır.**

## SettingItemView’e geri dönelim

Şimdi tekrar SettingItemView’e bakalım:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Bu View’in yapısı sabittir.

Sabit bölümler şunlardır:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Farklı bölümler şunlardır:

```swift
icon
color
title
```

Bu yüzden farklı içerikleri özellik haline getiriyor ve View oluşturulurken parametre olarak aktarıyoruz.

Farklı ayar öğeleri oluşturduğumuzda, yalnızca farklı parametreleri aktarmamız yeterlidir:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")
SettingItemView(icon: "folder", color: Color.brown, title: "Klasör")
SettingItemView(icon: "music.note", color: Color.purple, title: "Müzik")
```

Böylece aynı `SettingItemView`, üç farklı ayar öğesini gösterebilir.

Özel View’in en yaygın kullanım şekli budur.

## Özet

Bu derste özel View’i öğrendik.

Özel View’in temel işlevi şudur: **tekrarlanan View kodunu kapsülleyerek yeniden kullanılabilir hale getirmek.**

Bu örnekte, üç ayar öğesinin yapısı aynıdır; yalnızca ikon, renk ve başlık farklıdır.

Bu yüzden bir `SettingItemView` oluşturduk:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Sonra bu View’i kullanırken farklı parametreler aktarıyoruz:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ayarlar")
```

Buradaki parametreler `SettingItemView` içine girer.

Bu yöntem sayesinde daha az kodla, yapısı aynı ama içeriği farklı View’ler oluşturabiliriz.

Bu da SwiftUI geliştirmede çok yaygın bir yazım şeklidir.
