# Alıntı Döngüsü

Bu derste, bir "alıntı döngüsü" işlevini gerçekleştireceğiz ve dizi (Array) ile koşul denetimi ifadeleri (if-else) gibi Swift temel bilgilerini daha derinlemesine öğreneceğiz.

Birden fazla alıntının nasıl saklanacağını ve buton etkileşimiyle alıntıların nasıl döngüsel olarak gösterileceğini ele alacağız.

![alt text](../../RESOURCE/011_word.png)

## Alıntıyı Gösterme

Öncelikle, SwiftUI içinde bir alıntıyı göstermemiz gerekir.

En basit yöntem Text görünümünü kullanmaktır:

```swift
Text("Slow progress is still progress.")
```

Bu kod yalnızca sabit bir alıntıyı gösterebilir. Birden fazla alıntıyı göstermek ve geçiş işlevi oluşturmak istiyorsak, önce bu alıntıları saklamamız gerekir.

Ancak normal bir string değişken yalnızca tek bir alıntıyı saklayabilir:

```swift
let sayings = "Slow progress is still progress."
```

Birden fazla alıntı saklamak istersek, her alıntı için ayrı bir değişken tanımlamamız gerekir:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Fakat gerçek geliştirme sürecinde bu yöntem hem zahmetlidir hem de her değişken birbirinden bağımsız olduğu için esnek bir döngüsel geçiş yapamayız.

Birden fazla alıntıyı daha kolay yönetmek için, onları tek bir veri yapısı içinde toplamalıyız. İşte bu yapı dizi (Array) olarak adlandırılır.

Dizi kullandıktan sonra, yukarıdaki kod şu şekilde saklanabilir:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**İpucu: Programlama kurallarında, birden fazla öğe içeren dizi değişken adları genellikle sayings gibi çoğul biçimde yazılır; bu, onun bir koleksiyon olduğunu daha iyi yansıtır.**

## Dizi

Swift'te dizi, sıralı öğelerin koleksiyonudur ve köşeli parantez [] ile gösterilir.

```swift
[]
```

Dizinin içinde aynı türden birden fazla öğe bulunabilir ve öğeler İngilizce virgül , ile ayrılır.

Örneğin:

```swift
[101, 102, 103, 104, 105]
```

Bir diziyi basitçe bir tren dizisi gibi düşünebiliriz:

![Array](../../RESOURCE/011_array1.png)

Tüm tren bu dizi nesnesini temsil eder ve her vagon sırayla dizilir.

### İndeks ve Öğeye Erişim

Diziler sıralı olduğu için, sistem sıraya göre belirli bir öğeyi konumlandırabilir. Bu konumlandırma mekanizmasına indeks (Index) denir.

Swift'te (ve çoğu programlama dilinde) dizi indeksleri 1'den değil, 0'dan başlar. Bu, dizideki ilk öğenin indeksinin 0, ikinci öğenin 1 olduğu anlamına gelir.

![Array](../../RESOURCE/011_array2.png)

Dizideki belirli bir öğeye erişmek için, dizi adının ardından köşeli parantez ekleyip içine hedef öğenin indeks değerini yazmak yeterlidir.

Örneğin:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Geçerli aralığın dışında bir indekse erişmeye çalışırsak, “index out of range” hatası oluşur. Bu nedenle diziye erişirken indeksin geçerli aralıkta olduğundan emin olmak gerekir.

**İndeks taşması**

Örneğin, dizide yalnızca 5 öğe varsa, geçerli indeks aralığı 0 ile 4 arasındadır. Eğer sayings[5] değerine erişmeye çalışırsak, program karşılık gelen “vagonu” bulamaz ve “index out of range” hatası vererek uygulamanın çökmesine neden olur.

![Array](../../RESOURCE/011_array3.png)

### Dizi İşlemleri

Diziler yalnızca sabit tanımlama için değil, öğe ekleme, silme, değiştirme ve uzunluk alma gibi işlemler için de kullanılabilir.

İpucu: Bir diziyi değiştirmek istiyorsanız, let sabiti yerine var ile tanımlamanız gerekir.

**1. Öğe ekleme**

append yöntemi ile dizinin sonuna yeni bir öğe eklenebilir:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Öğe silme**

remove(at:) yöntemi ile dizideki belirli bir öğe silinebilir:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Öğe değiştirme**

Doğrudan indeks kullanarak dizi öğesi değiştirilebilir:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Dizi uzunluğunu alma**

count özelliği ile dizideki öğe sayısı alınabilir:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Diziyi Kullanarak Alıntıyı Gösterme

Birden fazla alıntıyı göstermek için, alıntıları bir dizi içinde saklayabilir ve ardından indeks aracılığıyla ilgili alıntıyı okuyup gösterebiliriz.

Önce ContentView içinde alıntıları saklamak için sayings adlı bir dizi oluştururuz, sonra da Text görünümünde indeksle ilgili alıntıyı okuyup gösteririz:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Burada sayings[0], dizideki ilk alıntıyı ifade eder.

Farklı bir alıntı göstermek isterseniz, yalnızca köşeli parantez içindeki indeks değerini değiştirmeniz yeterlidir:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Alıntının İndeksini Tanımlama

Alıntıların dinamik olarak değişmesini sağlamak için, Text görünümünde indeksi sabit olarak yazamayız.

Bunun yerine, şu anda gösterilen indeks değerini saklayan ayrı bir değişken oluşturmamız gerekir.

SwiftUI içinde, değiştirilebilir bir indeks tanımlamak için @State kullanabiliriz:

```swift
@State private var index = 0
```

SwiftUI, @State ile sarmalanmış değişkenleri izler. index değeri değiştiğinde, SwiftUI görünümü yeniden işler ve ilgili alıntıyı gösterir.

Ardından sayings[index] kullanarak dizideki alıntıyı dinamik şekilde alırız:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

index değeri değiştiğinde, Text farklı bir alıntı gösterecektir.

### Butonla İndeksi Kontrol Etme

Alıntılar arasındaki geçişi kontrol etmek için, index değerini değiştiren bir Button kullanabiliriz. Butona her basıldığında, index değeri otomatik olarak 1 artar:

```swift
Button("Next") {
    index += 1
}
```

Butona tıkladığımızda, index değeri 0'dan 1'e çıkar, görünüm yenilenir ve Text(sayings[index]) bir sonraki alıntıyı okur.

Ancak burada potansiyel bir sorun vardır: Butona art arda basılırsa, index dizinin sınırlarını aşacak kadar büyüyebilir. Bu da dizi indeks taşması hatasına yol açar. Örneğin index değeri 5 olduğunda (oysa dizinin geçerli indeks aralığı 0 ile 4 arasındadır), program çöker.

Dizi indeks taşmasını önlemek için, index değerinin dizi sınırlarını aşmamasını sağlayacak koşul denetimine ihtiyaç duyarız. Bunun için if-else ifadesiyle index değerinin dizinin uzunluğundan küçük olup olmadığını kontrol edebiliriz.

## Koşul Denetimi: if-else İfadesi

if-else ifadesi, Swift'te en yaygın kullanılan koşullu dallanma yapılarından biridir. Bir koşulun doğru olup olmadığını kontrol etmek ve sonuca göre farklı kod blokları çalıştırmak için kullanılır.

Temel yapı:

```swift
if condition {
    // condition true ise çalışacak kod
} else {
    // condition false ise çalışacak kod
}
```

if ifadesindeki condition, Bool türünde bir değerdir; yani true veya false olabilir. Koşul true ise if bloğu, aksi halde else bloğu çalışır.

Örneğin:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Bu örnekte age değeri 25'tir. if ifadesi age > 18 koşulunun doğru olup olmadığını kontrol eder. Koşul doğru olduğu için "Big Boy" yazdırılır.

Eğer else kısmına ihtiyaç yoksa, bu bölüm yazılmayabilir:

```swift
if condition {
    // condition true ise çalışacak kod
}
```

### Koşul Kullanarak İndeks Aralığını Kontrol Etme

İndeks taşmasını önlemek için, if ifadesi kullanılarak index değerinin dizi sınırlarını aşmaması sağlanabilir:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Mantık analizi: sayings.count değeri 5'tir (toplam 5 alıntı vardır), dolayısıyla sayings.count - 1 değeri 4 olur. Bu da dizideki son geçerli indekstir.

index değeri 4'ten küçükken, butona basıldığında index += 1 işlemi güvenlidir; index 4 olduğunda ise koşul artık sağlanmaz ve butona basmak hiçbir etki oluşturmaz.

Şu anda kod, alıntılar arasında geçiş yapma işlevini gerçekleştirmiş durumdadır:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Alıntıları Döngüye Alma

Eğer son alıntı gösterildikten sonra butona basıldığında yeniden ilk alıntının görünmesini ve böylece döngüsel bir alıntı akışı oluşmasını istiyorsak, bunu else kısmı ile yapabiliriz:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Butona tıklandığında, eğer index dizideki son öğeye ulaşmışsa, index tekrar 0 yapılır ve alıntılar baştan döngüsel şekilde gösterilmeye devam eder.

## Alıntı Görünümünü İyileştirme

Şimdi alıntı döngüsü mantığını tamamladık, fakat arayüzü daha estetik hale getirmek için görünümü biraz daha iyileştirebiliriz.

Tam kod:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Bu örnekte, Text görünümüne beyaz yarı saydam arka plan ve köşe yuvarlama eklenmiştir. Button ise .borderedProminent stiliyle gösterilir ve VStack için arka plan resmi ayarlanmıştır.

Ek bilgi: background() değiştiricisi ile görsel arka plan kullanıldığında, varsayılan davranış mevcut görünümün yer aldığı düzen alanını mümkün olduğunca doldurmaktır. Birçok durumda güvenli alanı (Safe Area) da doğal biçimde kapsayabilir.

Artık alıntı döngüsü görünümünü tamamlamış olduk.

![SwiftUI View](../../RESOURCE/011_word.png)

## Özet

Bu derste, birden fazla alıntıyı saklamak için dizilerin nasıl kullanılacağını ve if ile if-else ifadeleriyle alıntı döngüsünün nasıl gerçekleştirileceğini öğrendik.

Ayrıca dizilerin temel işlemlerini; öğe ekleme, silme, değiştirme ve indeks taşmasını önleme gibi konuları da ele aldık.

Bu ders yalnızca alıntı döngüsünün nasıl yapıldığını anlatmakla kalmadı, aynı zamanda diziler ve koşul ifadelerinin temel kullanımını birleştirerek veri yönetimi ve program akışını kontrol etme becerimizi geliştirdi.

## Ek Bilgi - Çoklu Koşul Denetimi: if-else if-else İfadesi

Gerçek geliştirme sürecinde, çoğu zaman birden fazla koşulu ele almamız gerekir. Örneğin bir oyunda puan 1 olduğunda olay A, 2 olduğunda olay B, 3 olduğunda olay C tetiklenebilir.

İkiden fazla koşul dalı içeren bu tür durumlarda, if-else if-else ifadesi kullanılır.

Temel sözdizimi:

```swift
if conditionA {
    // conditionA true ise çalışacak kod
} else if conditionB {
    // conditionB true ise çalışacak kod
} else if conditionC {
    // conditionC true ise çalışacak kod
} else {
    // Hiçbir koşul sağlanmazsa çalışacak kod
}
```

Bu yapıda program koşulları sırayla kontrol eder ve ilk sağlanan koşulun kod bloğunu çalıştırır. Hiçbiri sağlanmazsa else bloğu çalışır.

Alıntı döngüsü örneğinde de if-else if-else ifadesini kullanabiliriz:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Burada index değeri 0, 1, 2 veya 3 olduğunda, her tıklamada index += 1 çalışır; index 4 olduğunda ise index tekrar 0 yapılır ve döngü yeniden başlar.

else bölümü, örneğin index yanlışlıkla geçersiz bir değere değiştirilmişse, güvenlik amacıyla son kontrol katmanı olarak kullanılır.

Burada kullanılan == operatörünün “eşit olup olmadığını” kontrol ettiğine dikkat etmek gerekir. if ifadesi, index değerinin belirli bir sayıya eşit olup olmadığını denetler; eşitse true döner ve ilgili kod bloğu çalışır, eşit değilse bir sonraki koşul kontrol edilir.

Bu tür çoklu koşul yapıları, farklı senaryolarda farklı kodların çalıştırılması açısından faydalıdır.
