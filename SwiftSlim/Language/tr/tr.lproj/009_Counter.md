# Sayaç

Önceki iki derste değişkenleri, sabitleri, düğmeleri ve fonksiyonları öğrendik.

Bu derste bu bilgileri birleştirerek basit bir sayaç uygulaması yapacağız.

Bu örnekte, bir değişkenin nasıl saklanacağını ve değiştirileceğini, ayrıca değişkeni yönetmek için `@State` kullanımını öğreneceğiz.

## Sayacı gerçekleştirme

Sayaçlar genellikle sürekli artan miktarları kaydetmek için kullanılır. Örneğin ip atlama sayısı, koşu turu sayısı gibi durumlar buna girer.

Şimdi basit bir sayaç yapalım: ekranda bir sayı ve bir düğme olsun; düğmeye tıklanınca sayı artsın.

![Num](../../RESOURCE/009_num.png)

### Sayıyı gösterme

Önce sayıyı göstermek için Text kullanalım.

```swift
Text("0")
````

Ama sayı değişecekse, `"0"` değerini sabit yazamayız; bunun yerine sayıyı bir değişkende saklamalıyız.

```swift
var num = 0
```

Ardından bu değişkeni Text içinde gösterelim:

```swift
Text("\(num)")
```

Burada sayı, string interpolation yani `\()` kullanılarak string’e dönüştürülüp gösterilir.

### Düğmeyle sayıyı artırma

Şimdi bir düğme ekleyelim.

```swift id="2h95er"
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Düğmeye basıldığında sayının artmasını istiyoruz.

Bu yüzden düğme içinde değişkeni değiştirebiliriz:

```swift id="a8aig8"
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Bu kodun anlamı şudur: düğmeye tıklandığında `num + 1` hesaplanır ve sonuç tekrar `num` değişkenine atanır.

### Daha kısa yazım

Swift, bunun için daha kısa bir yazım sunar:

```swift id="qn3z5x"
num += 1
```

Bu yazım şuna eşdeğerdir:

```swift id="pwq58c"
num = num + 1
```

Bu yazıma “bileşik atama operatörü” denir.

Swift içinde yaygın bileşik atama operatörleri şunlardır:

```id="0ybkam"
+=   toplama ataması
-=   çıkarma ataması
*=   çarpma ataması
/=   bölme ataması
%=   kalan ataması
```

Örneğin:

```swift id="di31dc"
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Tam kod

Artık basit bir sayaç yazabiliriz:

```swift id="17g74o"
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Ancak bu kod şu anda düzgün çalışmaz.

### Ortaya çıkan hata

Xcode şu hatayı verir:

```id="3vjkyz"
Cannot assign to property: 'self' is immutable
```

Bu, görünümün değiştirilemez olduğu için özelliğin değiştirilemediği anlamına gelir.

Peki neden böyle olur?

## SwiftUI’nin çalışma mantığı

SwiftUI’de **arayüz, veri tarafından sürülür**. Bu da şu anlama gelir: veri değiştiğinde arayüz otomatik olarak yenilenir.

Ama dikkat edilmesi gereken önemli nokta şudur: SwiftUI yalnızca durum yani state değiştiğinde değişimi izler ve görünümü yeniler. Örneğin `@State` veya `@Binding` değiştiğinde bunu yapar.

Eğer normal bir değişken kullanılırsa, SwiftUI bu değeri yalnızca view oluşturulurken bir kez okur. Sonrasında değişken değişse bile arayüz güncellenmez.

Örneğin:

```swift id="fuit0m"
var num = 0   // 0
num = 1   // 0
```

Yukarıdaki örnekte `num` sıradan bir değişkendir. Değeri değişmiş olsa bile SwiftUI view’u güncellemez; ekranda yine başlangıçtaki `0` görünür.

![Num](../../RESOURCE/009_state.png)

Bu nedenle veri yalnızca durum olarak işaretlendiğinde, örneğin `@State`, `@Binding` gibi property wrapper’lar kullanıldığında, SwiftUI onun değişimini otomatik olarak izler ve view’u günceller.

## @State property wrapper’ı

SwiftUI’de eğer bir değişkeni değiştirmek ve aynı zamanda görünümü güncellemek istiyorsak, `@State` kullanmak zorundayız.

```swift id="3kkh7k"
@State var num = 0
```

`@State`, SwiftUI’nin bu değişkeni izlemesini sağlar.

Değişken değiştiğinde, SwiftUI view’u yeniden hesaplar ve görünümü günceller.

Tam kod:

```swift id="11zscl"
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Artık düğmeye basıldığında:

```swift id="6n7h5j"
num += 1
```

SwiftUI, `num` değişkeninin değiştiğini algılar ve görünümü otomatik olarak günceller.

![Num](../../RESOURCE/009_state1.png)

## @State kullanım kuralları

Gerçek geliştirme sürecinde `@State` genellikle iki kurala göre kullanılır.

### 1. @State genellikle private ile birlikte kullanılır

`@State` değişkenleri genellikle yalnızca mevcut tür içinde, yani mevcut View yapısı içinde kullanılır. Bu yüzden çoğu zaman şöyle yazılır:

```swift id="3scspu"
@State private var num = 0
```

Bu, başka view’ların bu değişkene doğrudan erişmesini veya onu değiştirmesini önler.

Henüz `private` öğrenmedik. Şimdilik bunu şöyle anlayabilirsiniz:

**`private` ile işaretlenen içerik yalnızca mevcut view içinde kullanılabilir; dışarıdaki view’lar buna erişemez.**

### 2. @State yalnızca mevcut view’un kendi durumu içindir

`@State`, mevcut View tarafından yönetilen veriler için uygundur.

Örneğin bir giriş alanının içeriği ya da bir switch’in açık-kapalı durumu buna örnektir.

```swift id="0cnxfz"
@State private var isOn = false
@State private var text = ""
```

Eğer veri birden fazla view arasında paylaşılacaksa, `@Binding` veya `@Observable` gibi başka durum türleri gerekir.

Bu konular ileriki derslerde ele alınacaktır.

### Azaltma düğmesi

Sayaç yalnızca artırmakla kalmaz, azaltabilir de.

Bunun için bir `-` düğmesi ekleyebiliriz.

```swift id="c0edua"
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Ardından düğmeleri yatay yerleştirmek için HStack kullanalım:

```swift id="wkqmzj"
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Elde edilen görünüm:

![Num](../../RESOURCE/009_num1.png)

`+` düğmesine basıldığında sayı 1 artar; `-` düğmesine basıldığında ise 1 azalır.

### Sıfırlama düğmesi

Bir sıfırlama düğmesi de ekleyebiliriz. Bu düğme sayıyı 0 yapar.

```swift id="59ye95"
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Sıfırlama düğmesine basıldığında `num` değişkenine 0 atanır.

Görünüm:

![Num](../../RESOURCE/009_num2.png)

`0` düğmesine basıldığında sayı 0 olur.

### Özel düğme

Şu anda düğmelerimiz yalnızca metin gösterebiliyor:

```swift id="ic4n2o"
Button("+") {

}
```

Bu tür yazımda düğme yalnızca `+` veya `-` gibi metin içerikleri gösterebilir.

Gerçek geliştirmede ise düğmenin görünümünün daha zengin olmasını isteriz; örneğin simge veya başka bir view kullanmak isteyebiliriz.

SwiftUI, düğmenin görünen içeriğini özelleştirmeye izin verir. Bunun için Button’ın başka bir yazımı kullanılır:

```swift id="ut5qga"
Button(action: {

}, label: {

})
```

Bu yazımda `action`, düğmeye basıldığında çalışacak kodu; `label` ise düğmede gösterilecek view’u ifade eder.

Örneğin düğmenin bir SF Symbols simgesi göstermesini sağlayabiliriz:

```swift id="rj8vit"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Bu durumda düğme artık metin değil, bir simge gösterir.

### Sayaç arayüzünü iyileştirme

Sayaç arayüzünü daha net yapmak için, sayının gösterim stilini de ayarlayabiliriz. Örneğin sayıyı büyütelim:

```swift id="jp3jlwm"
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Şimdi düğmelerin görünen içeriğini de simgeye çevirelim ve simgeleri biraz büyütelim:

```swift id="j7y2rt"
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Aynı şekilde azaltma ve sıfırlama düğmelerini de simge biçimine çevirebiliriz:

```swift id="jgwyqu"
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Artık düğmeler SF Symbols simgeleriyle gösterilir ve arayüz daha sezgisel olur.

![Num](../../RESOURCE/009_num3.png)

## Özet

Bu derste basit bir sayaç gerçekleştirerek değişken, Text ve Button kullanımını birlikte alıştırma yaptık. Sayıyı saklamak için bir değişken kullandık; düğmeler aracılığıyla sayıyı artırıp azalttık; ayrıca `num += 1` ve `num -= 1` gibi bileşik atama operatörlerini öğrendik.

Bu uygulama sırasında SwiftUI’nin nasıl çalıştığını da gördük: arayüz veri tarafından sürülür. Veri değiştiğinde arayüz de yenilenir. Bu yüzden değişebilen durumu saklamak için `@State` kullanmak gerekir. `@State` değişkeni değiştiğinde SwiftUI görünümü otomatik olarak günceller.

Son olarak arayüzü basit şekilde iyileştirdik; Text’in yazı stilini düzenledik ve `Button(action:label:)` kullanarak düğme içeriğini özelleştirdik. Böylece düğmeler simge gösterebildi ve sayaç arayüzü daha net, daha estetik bir hâle geldi.

Artık SwiftUI view’larının temel kullanım biçimine temas etmiş olduk. SwiftUI’de arayüzlerin büyük kısmı değişkenler tarafından sürülür. Değişken değiştiğinde SwiftUI view’u otomatik olarak günceller. Bu nedenle SwiftUI uygulamaları geliştirirken, önce hangi verilerin saklanması gerektiğini tasarlamak ve ardından bu veriler üzerinden arayüzü ve etkileşim mantığını kurmak gerekir.

## Tam kod

```swift id="zw0gf5"
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```