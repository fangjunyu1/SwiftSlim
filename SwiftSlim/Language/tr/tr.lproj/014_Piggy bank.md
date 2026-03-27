# Kumbara

Bu derste, basit bir “kumbara” projesi geliştireceğiz. İşlevi basittir, ancak tam bir etkileşim mantığı içerir; bu yüzden başlangıç seviyesindeki kullanıcılar için oldukça uygundur.

Bu proje aracılığıyla TextField (giriş kutusu) ve border kenarlığını öğrenecek, aynı zamanda veri bağlamayı ($) anlayacağız.

Nihai hedefimiz, miktar girilebilen, butona basıldığında kaydedilen ve toplam tutarı biriktiren bir “kumbara” projesi oluşturmaktır.

Gerçekleştirilecek görünüm:

![Piggy Bank](../../RESOURCE/014_view.png)

## Toplam Tutarı Gösterme

Öncelikle, görünüm içinde “kumbara”nın toplam tutarını göstermemiz gerekir.

ContentView içinde, “kumbara”nın toplam tutarını saklayacak bir değişken tanımlayalım.

```swift
@State private var amount = 0
```

Ardından, bu tutarı göstermek için Text kullanalım:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Burada .font ve .fontWeight, yazı boyutunu ve kalınlığını ayarlamak için kullanılır.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

amount değiştiğinde, Text içinde gösterilen toplam tutar da otomatik olarak güncellenir.

## Tutar Girişi

“Kumbara” yalnızca toplam tutarı göstermekle kalmamalı, aynı zamanda kullanıcının yatıracağı miktarı “girebilmesini” de sağlamalıdır. Bunun için SwiftUI’nin TextField görünüm bileşenini kullanmamız gerekir.

### TextField

TextField, SwiftUI içinde içerik girmek için kullanılan bir görünüm bileşenidir ve genellikle tek satırlı girişlerde kullanılır.

TextField temel olarak iki farklı bağlama biçimi sunar:

**1. String türüne bağlama**

```swift
TextField("Placeholder", text: $text)
```

Bu kullanım, isim, başlık gibi metin girişleri için uygundur.

**2. Sayısal türe bağlama (Int/Double)**

```swift
TextField("Amount", value: $number, format: .number)
```

Bu kullanım, yaş, maaş, tutar gibi sayısal girişler için uygundur.

`format: .number`, bu giriş alanının “sayı biçimi” ile çözümleneceğini ve gösterileceğini ifade eder.

#### Yer Tutucu Metin

TextField’ın ilk parametresi yer tutucudur (Placeholder) ve kullanıcıya ne girmesi gerektiğini hatırlatmak için kullanılır:

```swift
TextField("input your name", text: $text)
```

Giriş alanı boş olduğunda, gri renkte bir ipucu metni gösterilir.

![textfield](../../RESOURCE/014_textfield.png)

#### Veri Bağlama

TextField, girilen içeriği kalıcı olarak saklamaz; veriyi yönetmek için bağlı bir değişkene ihtiyaç duyar.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Kullanıcının girdiği içerik doğrudan text değişkenine kaydedilir; TextField ise yalnızca giriş arayüzünü sağlar.

$ işareti, bağlama (Binding) anlamına gelir:

```swift
$text
```

Bu sıradan bir değişken değildir; bu bir Binding türüdür.

Görevi, görünüm ile veri arasında bağlantı kurmaktır:

Kullanıcı TextField içinde yazı yazdığında, text otomatik olarak güncellenir; text değiştiğinde, TextField da eşzamanlı olarak güncellenir.

Örneğin:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

TextField içine içerik yazıldığında, üstteki Text bunu anlık olarak senkronize şekilde gösterir.

![textField](../../RESOURCE/014_textfield1.png)

### Sayısal Türü Bağlama

Sayı girişi gerektiğinde, buna uygun türde bir değişken bağlanmalıdır:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Kullanıcı bir miktar girdiğinde, TextField bu girdiyi sayıya dönüştürür ve number değerini otomatik olarak günceller.

## Giriş Kutusunu Ekleme

TextField’ın temel kullanımını gördükten sonra, şimdi bunu “kumbara” projesine uygulayalım.

“Kumbara” için bir “tutar” girişi gerekir. Bu yüzden “sayısal tür bağlama (Int/Double)” yöntemini kullanacağız ve kullanıcının girdiği miktarı saklamak için number adında yeni bir değişken ekleyeceğiz:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Artık TextField varsayılan olarak number değerini gösterir (başlangıç değeri 0’dır).

Giriş içeriği temizlendiğinde, yer tutucu olarak “Amount” görünür.

Bu da bir kez daha şunu gösterir: TextField kendi başına içerik saklamaz; gösterdiği şey bağlı değişkenin değeridir.

### Giriş Kutusunun Boyut Sorunu

Mevcut görünümde, TextField’ın bir kenarlığı olmadığını, yalnızca bir 0 gösterdiğini ve içeriğin sola hizalanmış gibi durduğunu fark ederiz.

Görünüm şu şekildedir:

![textfield](../../RESOURCE/014_textfield2.png)

Bunun nedeni, TextField’ın varsayılan olarak ebeveyn görünümün tüm genişliğini kaplamasıdır.

Bunu doğrulamak için bir arka plan rengi ekleyebiliriz:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Etkisi şu şekildedir:

![textfield](../../RESOURCE/014_textfield3.png)

Buradan TextField’ın aslında tüm satır genişliğini doldurduğu görülebilir.

### Sabit Genişlik Ayarlama

Eğer giriş kutusunun daha kompakt görünmesini istiyorsak, frame ile genişliğini sınırlayabiliriz:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Etkisi şu şekildedir:

![textfield](../../RESOURCE/014_textfield4.png)

### Kenarlık ve İç Boşluk Ekleme

TextField varsayılan olarak kenarlıksız geldiği için, görünümü elle biçimlendirebiliriz:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Artık bu giriş kutusu daha çok “standart bir giriş alanı” gibi görünür.

![textfield](../../RESOURCE/014_textfield5.png)

## Kenarlık

SwiftUI içinde border, bir görünüme kenarlık eklemek için kullanılır.

Temel kullanım:

```swift
border(Color.black, width: 1)
```

Burada Color.black, kenarlığın rengini; width ise kalınlığını ifade eder.

TextField içinde şu şekilde kullandık:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Bu, giriş kutusuna siyah renkte ve 1 pt kalınlığında bir kenarlık eklemek anlamına gelir.

İsterseniz Color.blue, Color.green gibi farklı renkler ya da width: 2 gibi daha kalın kenarlıklar da deneyebilirsiniz.

## Para Biriktirme Butonu

Artık elimizde toplam tutarı gösteren amount değişkeni, kullanıcı girişini alan bir TextField ve giriş alanına bağlı olan number değişkeni var.

Şu anki kod şu şekildedir:

```swift
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
		}
    }
}
```

### Buton Ekleme

Şimdi para biriktirme işlemini tetikleyecek bir buton eklememiz gerekiyor.

```swift
Button("Save") {
    
}
```

### Para Biriktirme Mantığını Yazma

Amacımız şu: Kullanıcı bir miktar girsin, butona bassın ve bu miktar toplam tutara eklensin.

```swift
Button("Save") {
    amount += number
}
```

Burada “bileşik atama operatörü” kullanılıyor. Kullanıcının girdiği number değeri, amount toplam tutarına ekleniyor.

### Girilen Tutarı Sıfırlama

Şimdi bir sorun ortaya çıkıyor: Butona bastıktan sonra giriş alanındaki miktar temizlenmiyor.

Kullanıcı 10 girip kaydettiğinde, giriş kutusunda hâlâ 10 görünür. Bu da bir sonraki para ekleme işleminde sorun yaratır.

Bunun nedeni, TextField’ın number değişkenine bağlı olmasıdır. Biz butona bastığımızda yalnızca amount değerini değiştiriyoruz; number değişmediği için giriş kutusu eski değeri göstermeye devam ediyor.

Bu yüzden bir temizleme mantığı eklemeliyiz. Yani butona basıldığında önce miktar toplam tutara eklenecek, ardından giriş miktarı sıfırlanacak:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Artık kullanıcı miktarı girip butona bastığında, girilen tutar toplam tutara eklenir. number ise 0’a sıfırlanır, böylece kullanıcı bir sonraki girişe hazır olur.

Böylece “kumbara”nın tüm para kaydetme mantığını tamamlamış oluyoruz.

## Görünümü İyileştirme

İşlev tamamlandıktan sonra, arayüzü basitçe iyileştirebilir; bir arka plan görseli ve buton stili ekleyebiliriz.

Buton stili ekleme:

```swift
.buttonStyle(.borderedProminent)
```

Arka plan görseli ekleme:

```swift
.background {
    Image("1")
}
```

Artık “kumbara” uygulamasının tüm geliştirme sürecini tamamlamış olduk.

## Tam Kod

```swift
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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Gerçekleştirilen görünüm:

![Piggy Bank](../../RESOURCE/014_view.png)

Artık 100 veya daha fazla para eklemeyi deneyerek “kumbara” mantığında bir sorun olup olmadığını kontrol edebiliriz.

Ya da “kumbara”yı simülatörde veya gerçek cihazda çalıştırarak, geliştirdiğimiz uygulamayı doğrudan deneyimleyebiliriz.

### Hata Ayıklama Çıktısı

Mantığın doğru çalıştığını doğrulamak için, butonun içine hata ayıklama amaçlı çıktı da ekleyebiliriz:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Her para ekleme işleminden sonra bu çıktıları görerek, kod mantığında bir sorun olup olmadığını kontrol edebiliriz.

```
---Saving---
amount:11
number:0
```
