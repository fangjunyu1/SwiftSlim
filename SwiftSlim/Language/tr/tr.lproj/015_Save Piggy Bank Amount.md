# Kumbara Tutarını Kaydetme

Bir önceki derste basit bir “kumbara” uygulaması oluşturmuştuk. Bu derste, “kumbara”daki tutarın kalıcı olarak nasıl saklanacağını öğreneceğiz.

Bu derste temel olarak UserDefaults ve @AppStorage özellik sarmalayıcısını ele alacağız; ayrıca onAppear’in işlevini ve optional türün (nil) kullanımını da genişletilmiş olarak açıklayacağız.

Dikkat edilmesi gereken nokta şudur: Bu derste, bir önceki derste geliştirdiğimiz “kumbara” kodu temel alınacaktır.

## Kalıcı Saklama Sorunu

Şu anda “kumbara”nın arayüzü oldukça sade ve kullanımı da pratiktir.

![Piggy Bank](../../Resource/014_view.png)

Ancak belirgin bir sorun vardır: Görünüm her yenilendiğinde veya uygulama kapatılıp yeniden açıldığında, “kumbara”nın toplam tutarı tekrar 0 olur ve daha önce birikmiş olan tutar tamamen kaybolur.

Bu, verinin gerçekte saklanmadığı anlamına gelir. Başka bir deyişle, mevcut “kumbara” yalnızca geçici veri tutabilmektedir.

### Neden Kalıcı Olarak Kaydedilemiyor?

Bunun nedeni, kullandığımız değişkenin @State ile tanımlanmış olmasıdır:

```swift id="e6vyl1"
@State private var amount = 0
```

@State ile tanımlanan değişkenlerin yaşam döngüsü tamamen görünüme bağlıdır.

Görünüm oluşturulduğunda amount 0 olarak başlatılır; görünüm yok edildiğinde ise amount da yok edilir.

Buradaki amount verisi yalnızca bellekte bulunur, cihaza kaydedilmez.

Biz amount değerinin görünümün yaşam döngüsüne bağlı olmasını istemiyoruz; bunun yerine verinin kalıcı biçimde saklanmasını, yani cihaz üzerinde tutulmasını istiyoruz.

### “Veri Kalıcılığı” Nedir?

Veri kalıcılığı, veriyi “geçici bellekten” “cihaz depolamasına” kaydetmek olarak düşünülebilir.

Böylece görünüm kapansa da ya da uygulama kapatılsa da veri kaybolmaz.

Swift geliştirmede, basit veri kalıcılığı için UserDefaults kullanılabilir; daha karmaşık verilerde ise SwiftData veya CoreData tercih edilir.

Bu derste önce en basit çözüm olan UserDefaults’u öğreneceğiz.

## UserDefaults

UserDefaults, hafif anahtar-değer (key-value) verilerini saklamak için kullanılır ve genellikle String, Int, Double, Bool gibi temel türleri kaydetmekte tercih edilir.

### Veriyi Kaydetme

UserDefaults veriyi set yöntemiyle kaydeder:

```swift id="el5j2a"
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults’un ilk parametresi kaydedilecek veriyi ifade eder; burada String, Int gibi türler verilmiştir.

İkinci parametre olan forKey ise değişken adı gibi düşünülebilir ve saklanan veriyi tanımlamak için kullanılır.

### Veriyi Okuma

UserDefaults veriyi ilgili tür yöntemleriyle okur:

```swift id="2lw8wi"
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Veri okunurken doğru türde yöntem kullanılmalıdır; aksi halde hata oluşabilir ya da veri yanlış okunabilir.

### UserDefaults Kullanırken Dikkat Edilmesi Gerekenler

#### 1. Optional Tür Döndürmesi

UserDefaults ile veri okurken, bazı yöntemler optional tür döndürür.

Örneğin:

```swift id="xumeeo"
let name = UserDefaults.standard.string(forKey: "name")
```

Buradan dönen name değişkeninin türü şudur:

```id="d0qj8u"
String?
```

Bu, değerin var da olabileceği, hiç olmayabileceği anlamına gelir.

**Neden optional tür döner?**

Çünkü UserDefaults içindeki bir Key için her zaman kayıtlı veri bulunmak zorunda değildir.

Örneğin:

```swift id="c27xsl"
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Eğer daha önce `"City"` anahtarı hiç kaydedilmemişse, okuma sonucu şöyle olur:

```id="jteaz3"
nil
```

Burada özellikle vurgulanması gereken nokta, nil değerinin “veri yok” anlamına gelmesidir; boş string anlamına gelmez.

“Tür sistemi” dersinde benzer bir durumla karşılaşmıştık: Tür dönüşümü başarısız olduğunda da optional tür döner.

Bu durumda, `??` ile varsayılan değer vererek açmamız gerekir:

```swift id="3m6k2p"
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Eğer UserDefaults içinden veri okunabiliyorsa o değer kullanılır; veri yoksa (nil), varsayılan değer kullanılır.

#### 2. Optional Olmayan Tür Döndürmesi

UserDefaults, Int, Double ve Bool türlerini okurken optional olmayan türler döndürür.

Örneğin:

```swift id="i4txr3"
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Bu anahtarlar için daha önce hiç veri kaydedilmemiş olsa bile, dönüş değeri nil olmaz.

Bunun yerine varsayılan değer döner:

```id="iyesn2"
Int → 0
Double → 0.0
Bool → false
```

#### 3. Veri Miktarı Sınırlaması

UserDefaults yalnızca az miktarda veri saklamak için uygundur; örneğin uygulama ayarları, basit durum bilgileri gibi.

Gerçek projelerde büyük veri miktarları ya da sık sık okunup yazılması gereken veriler için uygun değildir.

## “Kumbara” Tutarını Kaydetme

Artık UserDefaults kullanarak “kumbara”nın toplam tutarını kaydetme mantığını yazabiliriz.

Kullanıcı butona bastığında, girilen tutar toplam tutara eklenir ve ardından toplam tutar UserDefaults’a kaydedilir.

```swift id="aehg9v"
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Böylece veri yazma mantığını tamamlamış olduk.

## Veri Kalıcılığı Mantığının Açıklaması

Her ne kadar veri kalıcılığı için yazma mantığını tamamlamış olsak da, uygulamayı gerçekten çalıştırdığımızda şunu fark ederiz: Görünüm her yenilendiğinde veya uygulama yeniden açıldığında, amount değişkeni yine 0 olur.

Bunun nedeni şudur:

```swift id="7ca8mp"
@State private var amount = 0
```

SwiftUI içinde @State değişkenleri, görünüm oluşturulurken yeniden başlatılır.

Her ne kadar UserDefaults içinde amount değeri kayıtlı olsa da, görünüm yeniden yüklendiğinde amount yine 0 olarak başlatılır.

Bu da şunu gösterir: Şu an yalnızca veri UserDefaults’a yazılıyor, fakat görünüm içine geri yüklenmiyor.

Bu yüzden, görünüm yüklenirken UserDefaults içindeki veriyi elle okuyup yeniden amount değişkenine atamamız gerekir. Ancak bu şekilde veri kalıcılığının tüm mantığı tamamlanmış olur.

### Mantıksal Benzetme

Bu süreci “sınıftaki kara tahta” olarak düşünebiliriz:

Ders sırasında öğretmen bilgileri tahtaya yazar; bu bilgiler, mevcut görünümün durumu olan @State gibidir.

Ders bittiğinde tahta silinir ve bir sonraki ders için temizlenir. Bu da görünümün yok edilmesine ve @State içindeki verinin silinmesine benzer.

Bilginin kaybolmaması için öğretmen önceden o bilgiyi ders notlarına kaydeder. Bu notlar, UserDefaults içinde kaydedilmiş veri gibidir.

Bir sonraki derste tahta başlangıçta boştur (@State yeniden başlatılır), öğretmen de notlara bakarak önceki bilgileri yeniden tahtaya yazar (UserDefaults’tan veri okur).

Burada anlaşılması gereken nokta şudur: Tahta kendiliğinden eski haline dönmez; mutlaka “notlardan okuma” yani UserDefaults’tan veri alma işlemi gerekir.

## onAppear ile Veriyi Okuma

Görünüm ekranda belirdiğinde, UserDefaults içindeki değeri elle okuyup @State ile tanımlanmış amount değişkenine atamak gerekir. Böylece gerçek veri kalıcılığı sağlanmış olur.

SwiftUI içinde, görünüm ekranda belirdiğinde başlangıç mantığını çalıştırmak için onAppear kullanılabilir:

```swift id="fqv1zj"
.onAppear {}
```

UserDefaults’tan veri okuma kodunu onAppear içine koyabiliriz:

```swift id="c4o46h"
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Görünüm oluşturulduğunda amount önce 0 olarak başlatılır; ardından görünüm ekrana geldiğinde onAppear tetiklenir ve UserDefaults’tan veri okunarak amount değişkenine atanır. Böylece görünüm en son kaydedilmiş toplam tutarı gösterebilir.

Artık “kumbara”nın tüm veri kalıcılığı mantığı tamamlanmış olur.

## Tam Kod

```swift id="g9m5ee"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage Özellik Sarmalayıcısı

SwiftUI, UserDefaults saklama mantığını sadeleştirmek için @AppStorage adlı özellik sarmalayıcısını sunar.

```swift id="49xi2a"
@AppStorage("amount") private var amount = 0
```

@AppStorage, UserDefaults’un SwiftUI için paketlenmiş bir biçimidir ve `"amount"` burada UserDefaults içindeki anahtarı temsil eder.

Görünüm oluşturulduğunda UserDefaults’tan veriyi okur; değişkenin değeri değiştiğinde ise bunu otomatik olarak UserDefaults’a yazar.

Ayrıca SwiftUI’nin durum güncelleme mekanizmasıyla da uyumludur; @State gibi, değer değiştiğinde SwiftUI görünümü yenilenir.

Yani @AppStorage, veriyi hem okuma hem kaydetme işini otomatik yapar; artık UserDefaults’u elle çağırmaya ya da onAppear içinde veri okumaya gerek kalmaz.

Bu yüzden, kod içindeki UserDefaults mantığını @AppStorage ile değiştirebiliriz:

```swift id="qppnm0"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Özet

Bu derste temel olarak şu noktaları öğrendik:

Öncelikle, UserDefaults hafif verileri saklamak için kullanılır. Biz de toplam tutarı cihaza kaydetmek için UserDefaults kullandık. UserDefaults veri okuma ve yazma yöntemleri sunar ve bazı durumlarda optional türlerle de uğraşmak gerekir.

İkinci olarak, @State yalnızca görünüm içindeki geçici durumu yönetmek içindir ve yaşam döngüsü görünümle aynıdır. Görünüm yeniden oluşturulduğunda @State da yeniden başlatılır.

UserDefaults içindeki veriyi geri yüklemek için, görünüm ekrana geldiğinde veriyi okumak amacıyla onAppear kullandık.

Son olarak, UserDefaults yerine @AppStorage kullanarak görünüm yüklenirken verinin otomatik okunmasını ve veri değiştiğinde otomatik yazılmasını sağladık; böylece UserDefaults ve onAppear’i elle kullanma ihtiyacı ortadan kalktı.

Bu bilgiler sayesinde, uygulama içinde temel düzeyde kalıcı veri saklama işlevi gerçekleştirebiliriz.

## Ders Sonrası Alıştırma

Artık “kumbara” tutarı saklayabiliyor, ancak işlev hâlâ tam değil.

1. Kullanıcının para çekmesi gerekiyorsa, buna uygun bir para çekme mantığı tasarlanmalıdır。
2. Kullanıcı tutarı tamamen sıfırlamak isterse, buna uygun bir sıfırlama mantığı da eklenmelidir。
3. Eğer kumbaraya bir isim vermek istenirse, bunun için String türünde veri kaydetme de eklenmelidir。

Bu özellikleri mevcut temel üzerine ekleyerek “kumbara” uygulamasını daha tamamlanmış hale getirebilirsiniz.

## Ek Bilgi - Giriş Kutusunun Varsayılan Değeri Sorunu

Şimdi giriş kutusunun etkileşimini daha da iyileştirebilir ve veri girişini daha rahat hale getirebiliriz.

![textfield](../../Resource/015_view.png)

Şu anki uygulamada, giriş kutusunun varsayılan değeri 0’dır. Kullanıcı her para gireceğinde önce bu 0’ı silmek, sonra yeni değeri yazmak zorunda kalır. Bu kullanıcı deneyimi açısından uygun değildir.

Bizim hedefimiz, giriş kutusunun başlangıçta 0 değil, boş görünmesidir.

Bunun nedeni, TextField ile number değişkeninin çift yönlü bağlı olmasıdır:

```swift id="jlwmii"
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

number başlangıçta 0 olduğu için, giriş kutusu da 0 gösterir.

Bu yüzden number değerini boş yapmamız gerekir, yani nil olarak ayarlamalıyız.

```swift id="61c62y"
@State private var number = nil
```

Bu durumda şu hata oluşur:

```id="n959e7"
Generic parameter 'Value' could not be inferred
```

Bu, “tür sistemi” dersinde anlattığımız durumun aynısıdır: Eğer bir değişkenin türü otomatik olarak çıkarılamıyorsa, türü açıkça belirtmek gerekir.

Çünkü number değerini nil yaptığımızda, nil’in kendi başına herhangi bir tür bilgisi yoktur. Derleyici bunun String mi, Int mi yoksa başka bir tür mü olduğunu anlayamaz; bu yüzden hata verir.

Dolayısıyla number için açık tür bildirimi yapmamız gerekir:

```swift id="knrwq5"
@State private var number:Int? = nil
```

Buradaki `Int?`, optional tür anlamına gelir; yani number ya bir Int olabilir ya da nil olabilir.

Böylece başlangıçta onu nil yaptığımızda, giriş kutusu 0 yerine boş görünür.

### Optional Türü Açma

number değişkenini optional tür yaptıktan sonra, önceki hesaplama kodu hata vermeye başlar:

```swift id="rajy5e"
amount += number
```

Hata mesajı:

```id="ds9xj0"
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Bunun nedeni, number değerinin artık nil de olabilmesidir. Eğer doğrudan hesaplamaya katılırsa, şu anlama gelir:

```swift id="sfcxmf"
amount += nil
```

Açıkça görüldüğü gibi, nil ile amount toplanamaz; bu geçerli bir işlem değildir.

Bu nedenle, optional türleri hesaba katmadan önce açmamız gerekir.

Burada `??` ile varsayılan değer verebiliriz:

```swift id="rtshv0"
amount += number ?? 0
```

number nil ise varsayılan olarak 0 kullanılır; eğer number’ın bir değeri varsa, kullanıcının girdiği gerçek değer kullanılır.

Böylece hem hesaplama güvenli biçimde yapılır, hem de giriş kutusunun varsayılan olarak boş görünmesi sağlanır; kullanıcı artık her seferinde giriş kutusundaki 0’ı silmek zorunda kalmaz.

## Genişletilmiş Kod

```swift id="tpaa8w"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
