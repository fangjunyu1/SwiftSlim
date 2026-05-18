# Özel Renkler

Bu derste, SwiftUI içinde renkleri nasıl özelleştireceğimizi öğreneceğiz.

Önceki derslerde SwiftUI tarafından sağlanan varsayılan renkleri zaten kullanmıştık. Örneğin:

```swift
Color.blue
Color.red
Color.green
```

Bu renkleri kullanmak oldukça kolaydır, ancak gerçek App geliştirme sürecinde varsayılan renkler çoğu zaman yeterince hassas değildir.

Örneğin, bir tasarım dosyasında şu renkler kullanılabilir:

```text
#2c54c2
#4875ed
#213e8d
```

Bu tür renklere Hex renk denir.

Bu derste önce SwiftUI'nin Hex renkleri desteklemesini sağlayacağız, ardından sık kullanılan renkleri `static` ile düzenleyeceğiz.

Son olarak, özel renkleri hayvan ansiklopedisi görünümüne uygulayacağız ve düğmelerin daha katmanlı görünmesi için gradyan arka plan kullanacağız.

## Neden özel renklere ihtiyaç duyarız?

SwiftUI içinde sistem renklerini doğrudan kullanabiliriz.

Örneğin:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Buradaki `.blue` mavi rengi temsil eder. Aslında bu, `Color.blue` yazımının kısaltılmış hâlidir.

Varsayılan renklerin avantajı basit ve kullanışlı olmalarıdır, ancak renk seçenekleri sınırlıdır.

Örneğin:

```swift
Color.blue
```

yalnızca SwiftUI'nin sunduğu varsayılan maviyi temsil edebilir.

![Color.blue](../../../Resource/031_color6.png)

Ancak gerçek geliştirme sürecinde çoğu zaman daha belirli renklere ihtiyaç duyarız.

Örneğin, hepsi mavi olsa bile açık mavi, koyu mavi, gri mavi ve parlak mavi gibi farklı etkiler olabilir.

![More Blue](../../../Resource/031_color5.png)

Bu durumda yalnızca `Color.blue` kullanırsak, tasarım etkisini yeniden üretmek zorlaşır.

Bu nedenle SwiftUI'nin özel renkleri desteklemesini sağlamamız gerekir.

## Hex renk nedir?

Ekrandaki renkler genellikle kırmızı, yeşil ve mavi olmak üzere üç kanaldan oluşur. Buna RGB denir.

RGB sırasıyla şunları ifade eder:

```text
Red     // Kırmızı
Green   // Yeşil
Blue    // Mavi
```

Hex renk, RGB renklerini ifade etmenin bir yoludur.

Örneğin:

```swift
#5479FF
```

Bu renk değeri basitçe üç parçadan oluşuyor gibi anlaşılabilir:

```text
54  // Kırmızı kanalını ifade eder
79  // Yeşil kanalını ifade eder
FF  // Mavi kanalını ifade eder
```

Bu derste bu değerleri hesaplamamız veya onaltılık kuralları derinlemesine anlamamız gerekmez.

Şimdilik yalnızca şunu bilmemiz yeterlidir: `#5479FF` belirli bir rengi temsil eder.

İleride `#2c54c2`, `#4875ed` gibi yazımları gördüğümüzde, bunları önce bir renk değeri olarak anlayabiliriz.

Sketch, Figma, Photoshop gibi tasarım araçlarında da benzer renk değerleri sıkça görülür.

![color](../../../Resource/031_color.png)

Ancak SwiftUI varsayılan olarak doğrudan şu şekilde yazmamıza izin vermez:

```swift
Color(hex: "#5479FF")
```

Bu nedenle `Color` türünü kendimiz genişletmemiz ve Hex dizesiyle renk oluşturmayı desteklemesini sağlamamız gerekir.

## Color+Hex.swift dosyasını oluşturma

Öncelikle yeni bir Swift dosyası oluşturuyoruz.

Dosya adını şöyle yazabiliriz:

```text
Color.swift
```

Daha açık bir şekilde şöyle de yazabiliriz:

```text
Color+Hex.swift
```

Burada daha çok şu ad önerilir:

```text
Color+Hex.swift
```

Swift projelerinde `Color+Hex.swift` gibi dosya adları oldukça yaygındır.

Bu ad, dosyanın `Color` türüne Hex yeteneği ekleyen bir genişletme dosyası olduğunu gösterir.

Dosya adı kodun çalışmasını doğrudan etkilemez; yalnızca dosyanın amacını daha kolay anlamamızı sağlar.

## Color(hex:) kodunu ekleme

`Color+Hex.swift` dosyasına aşağıdaki kodu yazın:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Bu kod parçası `extension` kullanarak `Color` türünü genişletir ve `Color` için yeni bir başlatma yöntemi ekler:

```swift
init(hex: String)
```

Bu başlatma yöntemine sahip olduktan sonra, Hex dizesini `Color` içine aktarabilir ve böylece özel bir renk oluşturabiliriz:

```swift
Color(hex: "#5479FF")
```

Bu genişletme kodu, kendi içinde Hex dizesini SwiftUI'nin tanıyabileceği RGB renge dönüştürür.

Şu aşamada her bir dönüştürme satırını derinlemesine anlamamız gerekmez. Yalnızca eklenen `Color(hex:)` yönteminin, Hex renk değeriyle özel renk oluşturmamızı sağladığını bilmemiz yeterlidir.

## Özel renkleri kullanma

Şimdi `ContentView` içinde özel renkleri test edebiliriz.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Görüntüleme sonucu:

![color](../../../Resource/031_color1.png)

Bu örnekte ilk satır sistem rengini kullanır:

```swift
.foregroundStyle(Color.blue)
```

Sonraki üç satır özel Hex renkleri kullanır:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Karşılaştırma yaparak sistem mavisinin yalnızca tek bir varsayılan etkiye sahip olduğunu görebiliriz.

Hex renkler ise daha ince mavi ton değişimlerini ifade edebilir.

Özel renklerin değeri buradadır: arayüz renklerini gerçek tasarıma daha yakın hâle getirir ve App'in görsel stilini daha kolay kontrol etmemizi sağlar.

## Renkleri static ile düzenleme

Artık Hex dizesiyle renk oluşturabiliyoruz:

```swift
Color(hex: "#2c54c2")
```

Bu yazım normal şekilde kullanılabilir, ancak aynı renk birden fazla yerde tekrar ederse sonraki bakım daha zor olur.

Bu renk değeri 10 farklı yerde yazıldıysa, ileride bu maviyi değiştirmek istediğimizde her yeri tek tek değiştirmemiz gerekir.

Bu durumda sık kullanılan renkleri `static` ile merkezi olarak düzenleyebiliriz.

`Color+Hex.swift` dosyasının alt kısmına aşağıdaki kodu eklemeye devam edin:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Burada `Color` için üç statik özellik ekledik: `animalBlue`, `animalLightBlue` ve `animalDarkBlue`. Bunlar farklı açıklık ve koyuluktaki mavi tonlarını temsil eder.

Bu özellikler `static` kullandığı için `Color` türünün kendisine aittir.

Kullanırken doğrudan `Color.` üzerinden erişebiliriz:

```swift
Color.animalBlue
```

Bu yazım, Hex dizesini doğrudan yazmaktan daha açıktır.

`Color.animalBlue` gördüğümüzde, bunun hayvan ansiklopedisinde kullanılan mavi renk olduğunu anlayabiliriz.

Ama `Color(hex: "#2c54c2")` gördüğümüzde yalnızca bunun bir renk değeri olduğunu biliriz; özel kullanımını görmek kolay değildir.

Renkleri merkezi olarak yönetmenin başka bir avantajı da sonraki değişikliklerin daha kolay olmasıdır.

Hayvan ansiklopedisinin ana rengini ayarlamak istersek yalnızca tanımlandığı yeri değiştirmemiz yeterlidir:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Bu rengi kullanan tüm yerler birlikte güncellenir.

`static` ile renkleri düzenlemenin anlamı budur: renk adlarını daha anlaşılır hâle getirir ve sonraki bakımı kolaylaştırır.

## Hayvan ansiklopedisine uygulama

Şimdi özel renkleri önceki hayvan ansiklopedisi görünümüne uygulayabiliriz.

Önceden hayvan düğmesinin arka planı beyazdı:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Şimdi bunu özel renge değiştirebiliriz:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Buradaki `Color.animalBlue`, az önce `Color+Hex.swift` içinde tanımladığımız statik renktir.

Düğme metni beyaz kullanır:

```swift
.foregroundStyle(Color.white)
```

Hayvan emoji'sinin arka planı yarı saydam beyaz kullanır:

```swift
.background(Color.white.opacity(0.15))
```

Böylece düğme birleşik bir mavi görsel stile sahip olur.

Bu adımın odağı karmaşık kod eklemek değil, daha önce öğrendiğimiz özel renkleri gerçekten arayüze uygulamaktır.

## Gradyan arka plan kullanma

Tek bir renk kullanmanın yanında, birden fazla rengi birleştirerek gradyan etkisi de oluşturabiliriz.

Örneğin, daha önce şu renkleri tanımladık:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Bu renkler yalnızca tek başına kullanılmakla kalmaz, gradyan arka plan olarak da birleştirilebilir.

SwiftUI içinde doğrusal gradyan oluşturmak için `LinearGradient` kullanılabilir.

Örneğin:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Bu kod, soldan sağa doğru bir gradyan arka plan oluşturur. Renk `Color.animalBlue` değerinden kademeli olarak `Color.animalLightBlue` değerine geçer.

Burada `colors` gradyana katılan renkleri ayarlamak için, `startPoint` ve `endPoint` ise gradyan yönünü kontrol etmek için kullanılır.

### Gradyan etkisini test etme

Basit bir Text ile gradyan arka planı test edebiliriz.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Görüntüleme sonucu:

![color](../../../Resource/031_color3.png)

Bu örnekte `Text` arka planı artık tek bir renk değildir; soldan sağa doğru yavaşça değişen bir gradyan renktir.

Normal arka plan rengine kıyasla gradyan arka plan daha katmanlı görünür ve arayüzde görsel vurgu oluşturmayı kolaylaştırır.

## Hayvan ansiklopedisinde gradyan arka plan kullanma

Şimdi hayvan düğmesinin arka plan rengini:

```swift
.background(Color.animalBlue)
```

şu gradyan arka plana dönüştürebiliriz:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Tam kod aşağıdaki gibidir:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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
```

Görüntüleme sonucu:

![color](../../../Resource/031_color4.png)

Artık hayvan düğmesi yalnızca tek renkli bir arka plana sahip değildir; soldan sağa doğru ilerleyen bir gradyan etkisine sahiptir.

Tek renkli arka plana kıyasla gradyan arka plan, arayüzü daha katmanlı gösterir ve gerçek App'lerdeki görsel tasarıma daha yakın bir etki sağlar.

## Tek renkli arka plan ve gradyan arka plan arasındaki fark

Tek renkli arka plan yalnızca bir renk kullanır.

Örneğin:

```swift
.background(Color.animalBlue)
```

Bu yazım basit ve açıktır; temel arayüzlerin çoğu için uygundur.

Gradyan arka plan birden fazla renk kullanır.

Örneğin:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Bu yazım arayüzü daha katmanlı gösterebilir, ancak görsel karmaşıklığı da daha kolay artırır.

Bu nedenle gerçek geliştirme sürecinde şöyle anlayabiliriz:

Tek renkli arka plan; normal metinler, normal düğmeler, normal kartlar ve normal sayfa arka planları için uygundur.

Gradyan arka plan; önemli düğmeler, üst bölgeler, kapak kartları, işlev girişleri gibi vurgulanması gereken konumlar için uygundur.

## Özet

Bu derste SwiftUI içinde özel renklerin nasıl kullanılacağını öğrendik.

İlk olarak Hex renkleri anladık.

Örneğin:

```text
#2c54c2
```

Bu, belirli bir rengi temsil eder.

Sonra `extension Color` kullanarak `Color` türünü genişlettik.

Böylece SwiftUI'nin şu şekilde renk oluşturabilmesini sağladık:

```swift
Color(hex: "#2c54c2")
```

Ardından sık kullanılan renkleri `static` ile düzenledik:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Bu sayede diğer görünümlerde doğrudan şunu kullanabiliriz:

```swift
Color.animalBlue
```

Her seferinde Hex dizesi yazmaya kıyasla bu yöntem daha açıktır ve sonraki aşamada renkleri merkezi olarak değiştirmeyi kolaylaştırır.

Son olarak `LinearGradient` öğrendik ve özel renkleri gradyan arka plan olarak birleştirdik:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Bu ders aracılığıyla “özel renk oluşturma” sürecinden “gerçek arayüzde renk kullanma” sürecine kadar tamamladık.

İleride bir rengin birden fazla yerde tekrar kullanılması gerektiğinde, onu öncelikle `Color` genişletmesine düzenlemeyi düşünebiliriz.

Böylece kod daha anlaşılır olur ve arayüz stili daha kolay tutarlı hâle gelir.
