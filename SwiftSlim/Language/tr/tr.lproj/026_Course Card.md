# Kurs Kartı

Bu ders bir aşama tekrar dersidir. Bir “kurs kartı” tamamlayacağız.

Bu alıştırma sayesinde daha önce öğrendiğimiz `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` gibi içerikleri tekrar edebilir ve birden fazla küçük görünümü tam bir görünüm modülü hâline nasıl getireceğimizi öğrenebiliriz.

Kurs kartının görünümü:

![view](../../../Resource/026_view.png)

Bu kurs kartı temel olarak birkaç bölümden oluşur:

- Kurs seviyesi: `Başlangıç`
- Kurs içeriği: `20+ Ders`
- Kurs başlığı: `SwiftUI Başlangıç Eğitimi`
- Kurs açıklaması
- Düğme: `Öğrenmeye Başla`
- Kurs arka planı: Swift simgesi ve indigo arka plan

Bu görünümü `ContentView` içinde tamamlayabiliriz.

## Üst Alan

İlk olarak kurs kartının üst alanını oluşturalım.

![view](../../../Resource/026_view1.png)

Üst alanın sol tarafında kurs seviyesi, sağ tarafında ise kurs içeriği gösterilir.

Bu iki içerik yatay olarak yerleştirildiği için `HStack` kullanabiliriz.

```swift
var topView: some View {
    HStack {
        Text("Başlangıç")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ Ders")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Burada üst alanı bir hesaplanan özellik olarak ayırdık:

```swift
var topView: some View
```

Bunu yapmanın avantajı, `body` bölümünü daha anlaşılır tutmasıdır.

Üst alanda temel olarak şu içerikler kullanılır:

- `HStack`: iki metin görünümünü yatay olarak yerleştirir.
- `Text`: metin içeriğini gösterir.
- `Spacer()`: soldaki metni sola, sağdaki metni sağa iter.
- `.font(.footnote)`: daha küçük bir metin stili ayarlar.
- `.fontWeight(.bold)`: metni kalın yapar.
- `.foregroundStyle(Color.white)`: ön plan rengini beyaz yapar.
- `.padding(.vertical, 10)`: dikey iç boşluğu ayarlar.
- `.padding(.horizontal, 16)`: yatay iç boşluğu ayarlar.
- `.background(Color.white.opacity(0.15))`: yarı saydam beyaz arka plan ayarlar.
- `.cornerRadius(20)`: köşe yarıçapını ayarlar.

Burada `Başlangıç`, iki yönde `.padding()` kullanır:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Böylece metnin hem üst-alt hem de sol-sağ tarafında boşluk oluşur ve görünüm bir etiket gibi görünür.

`Color.white.opacity(0.15)`, `15%` opaklığa sahip beyaz anlamına gelir; yani çok açık bir beyazdır.

### Kart Arka Planını Ekleme

Önce `topView` oluşturduk, ancak bir görünüm oluşturmak onun otomatik olarak ekranda gösterileceği anlamına gelmez.

SwiftUI’da ekranda gerçekten gösterilecek içerik `body` içine yazılmalıdır.

Bu yüzden önce `topView` görünümünü `body` içine yerleştirip gösterebiliriz:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Bu noktada üst alanın görüntülendiğini görürüz:

![view](../../../Resource/026_view2.png)

Ancak `topView` içindeki metin beyaz olduğu ve varsayılan arka plan da açık olduğu için açık modda net görünmeyebilir.

Bu nedenle dış katmana bir `VStack` ekleyip tüm alan için iç boşluk, arka plan rengi ve köşe yarıçapı ayarlayabiliriz:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view3.png)

Buradaki `VStack` şu anda yalnızca bir `topView` içerir, bu yüzden gereksiz gibi görünebilir.

Ancak birazdan kurs başlığı, kurs açıklaması ve düğme alanını eklemeye devam edeceğiz. Bunların hepsi dikey olarak yerleştirilen içerikler olduğu için burada önceden `VStack` kullanmak, sonraki görünüm birleştirmelerini kolaylaştırır.

Burada iki tane `.padding()` değiştiricisi vardır ve görevleri farklıdır.

İlk `.padding(20)`, `.background()` öncesinde yazılır:

```swift
.padding(20)
.background(Color.indigo)
```

Bu, kartın iç boşluğunu kontrol eder; yani içerik ile arka plan kenarı arasındaki mesafeyi belirler.

İkinci `.padding(30)`, `.background()` sonrasında yazılır:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Bu, kartın dış boşluğunu kontrol eder; yani tüm kart ile ekran kenarı arasındaki mesafeyi belirler.

![view](../../../Resource/026_view4.png)

Bu yüzden ikisi de `.padding()` olsa bile, farklı konumlara yazıldıklarında farklı etkiler üretirler.

## İçerik Alanı

Şimdi kurs kartının içerik alanını oluşturalım.

Görüntüleme sonucu:

![view](../../../Resource/026_view5.png)

İçerik alanı kurs başlığı ve kurs açıklamasından oluşur. Bunlar dikey olarak yerleştirildiği için `VStack` kullanırız.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI Başlangıç Eğitimi")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI ile sıfırdan başlayın ve Apple’ın bildirime dayalı arayüz geliştirme yaklaşımını sistemli şekilde öğrenin. Açık anlatımlar ve pratik örnekler sayesinde düzen, etkileşim ve durum yönetimini adım adım kavrayarak güzel ve kullanışlı uygulama arayüzleri oluşturabilirsiniz.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view6.png)

Bu `VStack` içinde iki parametre kullanılır:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading`, `VStack` içindeki görünümlerin baş kenara hizalanacağı anlamına gelir.

`spacing: 10`, `VStack` içindeki görünümler arasında `10 pt` boşluk bırakılacağı anlamına gelir.

Bu nedenle kurs başlığı ve kurs açıklaması sol taraftan başlar ve aralarında belirli bir mesafe korunur.

Kurs açıklaması nispeten uzundur. Tamamı gösterilirse kart çok yüksek olur. Bu yüzden burada gösterilecek satır sayısını sınırlamak için `.lineLimit()` kullanılır:

```swift
.lineLimit(3)
```

Bu, en fazla `3` satır gösterileceği anlamına gelir. İçerik satır sınırını aşarsa fazla kısım atlanır.

### Görünümü Sola Hizalama

Burada dikkat edilmesi gereken bir nokta daha vardır.

`VStack(alignment: .leading)`, yalnızca `VStack` içindeki görünümlerin hizalamasını kontrol eder. `VStack` görünümünün dış kapsayıcı içindeki konumunu doğrudan kontrol etmez.

Örneğin kurs açıklaması nispeten kısa olursa:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI Başlangıç Eğitimi")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Sadece kısa bir içerik.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view7.png)

Görülebileceği gibi kurs başlığı ve kurs açıklaması `VStack` içinde sola hizalanmış olsa da, `VStack` bütün olarak kartın en sol kenarına yaslanmamıştır.

Bunun nedeni, içerik kısa olduğunda `VStack` genişliğinin de nispeten dar olmasıdır. Dış kapsayıcı yerleşim yaparken bu daha dar `VStack` görünümünü ortaya yerleştirebilir.

Bunu şöyle anlayabiliriz: `VStack(alignment: .leading)` iç hizalamadan sorumludur.
Ancak tüm içerik alanını en sola itmekten sorumlu değildir.

Tüm içerik alanının gerçekten sola hizalanmasını istiyorsak, dışına bir `HStack` sarıp `Spacer()` ekleyebiliriz:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI Başlangıç Eğitimi")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Sadece kısa bir içerik.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view8.png)

Buradaki `HStack` yatay bir yerleşimdir.

`Spacer()`, sağ taraftaki kalan alanı kaplar ve böylece soldaki `VStack` görünümünü en sola iter.

Bu nedenle `HStack + Spacer()`, tüm içerik alanının konumunu kontrol etmek için kullanılabilir.

Gerçek kurs kartında kurs açıklaması nispeten uzun olduğu ve genellikle daha fazla genişlik kapladığı için bu sorun belirgin olmayabilir. Ancak bu farkı anlamak önemlidir; çünkü kısa metinli yerleşimler oluştururken benzer durumlarla sık sık karşılaşılır.

### İç Görünümler Arasındaki Mesafeyi Kontrol Etme

Önce `VStack` içinde `spacing: 10` yazdık:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing`, iç görünümler arasındaki mesafeyi kontrol etmek için kullanılır.

`spacing` ayarlanmazsa `VStack` yine varsayılan bir boşluğa sahiptir; ancak varsayılan boşluk istediğimiz etkiye uymayabilir.

Burada kurs başlığı ile kurs açıklaması birbirine çok yakın olursa yerleşim sıkışık görünür. Bu yüzden şunu kullanırız:

```swift
spacing: 10
```

Bu, aralarında biraz boşluk kalmasını sağlar.

Görüntüleme sonucu:

![view](../../../Resource/026_view9.png)

Benzer şekilde üst alan ve içerik alanı da dikey olarak yerleştirilir; bu yüzden aralarındaki mesafeyi kontrol etmek için de `spacing` kullanılabilir.

Şimdi `topView` ve `contentView` görünümlerini `body` içine yerleştirelim:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view10.png)

Burada `VStack(spacing: 20)`, `topView` ile `contentView` arasındaki mesafeyi kontrol eder.

Başka bir deyişle:

```swift
VStack(alignment: .leading, spacing: 10)
```

Kurs başlığı ile kurs açıklaması arasındaki mesafeyi kontrol eder.

```swift
VStack(spacing: 20)
```

Üst alan ile içerik alanı arasındaki mesafeyi kontrol eder.

İkisi de `spacing` kullanır, ancak farklı `VStack` kapsayıcıları üzerinde çalıştıkları için etkiledikleri alan da farklıdır.

Böylece içerik alanı görünümü tamamlanmış olur.

## Düğme Alanı

Şimdi alt düğme alanını oluşturalım.

Görüntüleme sonucu:

![view](../../../Resource/026_view11.png)

Düğme alanı temel olarak bir oynatma simgesi ve bir metinden oluşur.

Oynatma simgesini göstermek için `Image`, düğme metnini göstermek için `Text` kullanabiliriz.

Burada önce düğme görünümünü oluşturalım:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("düğmeye tıklandı")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Öğrenmeye Başla")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view12.png)

Burada iki `HStack` kullanılır:

İçteki `HStack`, simge ile metni yatay olarak yerleştirmek için kullanılır:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Öğrenmeye Başla")
}
```

Dıştaki `HStack`, `Spacer()` ile birlikte düğme görünümünü sola hizalamak için kullanılır:

```swift
HStack {
    ...
    Spacer()
}
```

Düğmeye dokunulduğunda konsola `düğmeye tıklandı` çıktısı yazılır.

## Temel Kart Tamamlandı

Şimdi üst alanı, içerik alanını ve düğme alanını birleştirelim:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Görüntüleme sonucu:

![view](../../../Resource/026_view13.png)

Bu noktada temel bir kurs kartı tamamlanmış olur.

## Swift Simge Arka Planı

Son olarak karta yarı saydam bir Swift simge arka planı ekleyelim.

![view](../../../Resource/026_view.png)

Önce `Color.indigo` değerini arka plan rengi olarak kullanmıştık. Aslında `.background()`, renk eklemenin yanında tam bir görünüm de ekleyebilir.

Bu yüzden önce özel bir arka plan görünümü oluşturabiliriz:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Bu arka plan görünümünde `VStack`, `HStack` ve `Spacer()` kullanarak Swift simgesini sağ alt köşeye iteriz.

Swift simgesi yalnızca dekoratif arka plan olarak kullanıldığı için burada yarı saydam beyaz kullanılır:

```swift
Color.white.opacity(0.15)
```

Böylece simge fazla öne çıkmaz ve öndeki metin içeriğini etkilemez.

Ardından `backgroundView` görünümünü karta ekleyelim:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Son görünüm:

![view](../../../Resource/026_view14.png)

Burada art arda iki `.background()` kullanılır:

```swift
.background(backgroundView)
.background(Color.indigo)
```

İlk `.background()`, Swift simge arka planını eklemek için kullanılır.
İkinci `.background()`, indigo arka planı eklemek için kullanılır.

Böylece Swift simgesi indigo arka planın üzerinde görünür ve kart arka planının bir parçası olarak gösterilir.

Buradan `.background()` ile yalnızca renk değil, özel görünümler de eklenebileceğini görebiliriz. Birden fazla `.background()` birlikte kullanılarak daha zengin arka plan efektleri oluşturulabilir.

Bu noktada eksiksiz bir kurs kartı tamamlanmış olur.

## Özet

Bu derste bir kurs kartı üzerinden SwiftUI’daki yaygın temel yerleşim yöntemlerini tekrar ettik.

Metin göstermek için `Text`, sistem simgesi göstermek için `Image`, görünüm dizilimini kontrol etmek için `VStack`, `HStack` ve `Spacer()` kullandık.

Metnin en fazla kaç satır göstereceğini sınırlayan `.lineLimit()` kullanımını öğrendik. İçerik sınırı aşarsa fazla kısım atlanır.

Aynı zamanda `.padding()`, `.background()`, `.cornerRadius()` ve `.foregroundStyle()` gibi yaygın değiştiricileri de tekrar ettik.

Bu dersi tamamladıktan sonra artık birden fazla küçük görünümü tam bir kart modülü hâline getirebiliriz.

Bu, SwiftUI geliştirmede çok yaygın bir yaklaşımdır: önce görünümü küçük parçalara ayırmak, ardından bunları tam bir arayüz hâline getirmek.

## Tam Kod

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Başlangıç")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ Ders")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI Başlangıç Eğitimi")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI ile sıfırdan başlayın ve Apple’ın bildirime dayalı arayüz geliştirme yaklaşımını sistemli şekilde öğrenin. Açık anlatımlar ve pratik örnekler sayesinde düzen, etkileşim ve durum yönetimini adım adım kavrayarak güzel ve kullanışlı uygulama arayüzleri oluşturabilirsiniz.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("düğmeye tıklandı")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Öğrenmeye Başla")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
