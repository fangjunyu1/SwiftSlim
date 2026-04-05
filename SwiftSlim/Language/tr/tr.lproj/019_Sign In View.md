# Oturum Açma Görünümü

Bu derste çok pratik bir senaryoyu öğreneceğiz: oturum açma görünümü.

İster bir web sitesi ister bir uygulama olsun, kullanım sırasında birçok durumda kullanıcıların hesapları ve parolalarıyla oturum açmaları gerekir.

Örneğin, GitHub giriş sayfası:

![WordPress](../../Resource/019_github.png)

Bu derste, kullanıcının hesabını ve parolasını elle girip girilen içerikte bir sorun olup olmadığını kontrol edebileceği benzer bir oturum açma görünümü oluşturacağız.

## Üst düzen

Oturum açma görünümünün kodunu `ContentView` dosyasında yazacağız.

Öncelikle, oturum açma görünümünün üst kısmındaki kimlik alanını hazırlayalım. Önce uygun bir simge resmi hazırlayıp bunu `Assets` klasörüne koyabilirsiniz.

![icon](../../Resource/019_icon1.png)

Ardından, resmi göstermek için `Image` ve değiştiricileri kullanın:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Buradaki birkaç değiştiricinin anlamı şudur:

- `resizable()`: resmin boyutunun değiştirilebilmesini sağlar.
- `scaledToFit()`: resmi orijinal oranını koruyarak ölçeklendirir.
- `frame(width: 100)`: resmin görüntülenen genişliğini `100` olarak ayarlar.

Sonra, oturum açma başlığını göstermek için `Text` ve değiştiricileri kullanın:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Ardından, resmi ve metni dikey olarak sıralamak için `VStack` kullanın:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Ortaya çıkan görünüm:

![view](../../Resource/019_view.png)

Buraya kadar oturum açma görünümünün üst başlık alanını tamamlamış olduk.

### Düzeni iyileştirme

Şu anda resim ve başlık varsayılan olarak tüm düzenin orta bölümünde yer alıyor.

Eğer bunların daha çok “sayfanın üst kısmındaki bir oturum açma işareti” gibi görünmesini istiyorsak, kalan alanı doldurmak için `Spacer()` kullanabilir ve içeriğin üste daha yakın görünmesini sağlayabiliriz.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Ortaya çıkan görünüm:

![view](../../Resource/019_view1.png)

Ancak şimdi `Image` ve `Text` ekranın üst kısmına fazla yakın ve biraz sıkışık görünüyor.

Bu durumda, tüm `VStack` için üst boşluk eklemek amacıyla `padding` kullanabiliriz.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Ortaya çıkan görünüm:

![view](../../Resource/019_view2.png)

Böylece, sayfanın üst kısmındaki başlık alanı daha uygun görünür.

## Kullanıcı adı ve parola

Oturum açma sayfası genellikle kullanıcının kullanıcı adı ve parola girmesini gerektirir.

SwiftUI içinde, kullanıcının girdiği içeriği almak için `TextField` kullanabiliriz.

Ancak dikkat edilmesi gereken bir nokta var: `TextField` kendi başına girilen veriyi uzun süre saklamaz, sadece bir giriş denetimidir. Bu verileri gerçekten saklayan şey, ona bağladığımız değişkenlerdir.

Bu yüzden önce kullanıcı adı ve parolayı saklamak için iki `@State` değişkeni oluşturmamız gerekir:

```swift
@State private var user = ""
@State private var password = ""
```

Bir `@State` değişkeninin değeri değiştiğinde, SwiftUI ilgili görünümü otomatik olarak yeniler.

Ardından, bu iki değişkeni bağlamak için `TextField` kullanın:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Buradaki `$user` ve `$password` “bağlama” anlamına gelir.

Yani kullanıcı giriş kutusuna yazı yazdığında değişken de aynı anda değişir; değişken değiştiğinde ise kutuda gösterilen içerik de aynı anda değişir.

“Görünüm ve verinin birbirine senkronize olması” şeklindeki bu ilişkiye bağlama denir.

Burada `$` içeren yazımın kullanılması gerektiğine dikkat edin:

```swift
$user
```

Çünkü `TextField` sıradan bir dize değil, “veriyi iki yönlü değiştirebilen” bir bağlama değeri ister.

### Giriş kutularını gösterme

Bunları `ContentView` içine yerleştirelim:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Görüntüleme etkisi:

![view](../../Resource/019_view3.png)

Çünkü şu anda `user` ve `password` varsayılan olarak boş dizelerdir:

```swift
""
```

Bu nedenle giriş kutusu önce bir yer tutucu metin gösterecektir, örneğin:

```swift
input user
```

Bu metin yalnızca kullanıcıya “buraya ne girilmesi gerektiğini” hatırlatır; gerçek giriş içeriği değildir.

### Giriş kutularını iyileştirme

Şimdi giriş kutuları kullanılabilir durumda, ancak varsayılan stil oldukça basittir.

Arayüzü daha anlaşılır hale getirmek için giriş kutusunun önüne bir başlık ekleyebilir ve kutunun kendisine küçük bir stil iyileştirmesi uygulayabiliriz.

Örneğin, önce bir başlık ekleyelim:

```swift
Text("Username")
    .fontWeight(.bold)
```

Sonra, başlığı ve giriş kutusunu aynı satıra yerleştirmek için `HStack` kullanın:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Burada `HStack` kullanılmasının nedeni, “solda başlık, sağda giriş kutusu” göstermek istememizdir.

Dikkat edilmesi gereken nokta, `TextField` öğesinin varsayılan olarak kalan kullanılabilir alanı kaplamasıdır.

![color](../../Resource/019_view6.png)

İki giriş kutusunun boyutlarını daha tutarlı hale getirmek için `frame(width:)` kullanarak bunlara bir genişlik verebiliriz; böylece daha düzenli görünürler.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Ardından, giriş kutusunu daha belirgin hale getirmek için bir kenarlık ekleyin:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Şimdi hem kullanıcı adını hem de parolayı `ContentView` görünümüne ekleyelim:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Görüntüleme etkisi:

![view](../../Resource/019_view4.png)

Bu noktaya geldiğimizde, kullanıcı artık kullanıcı adı ve parola girebilir.

## Oturum açma düğmesi

Şimdi giriş kutularının altına bir oturum açma düğmesi ekleyelim.

```swift
Button("Sign in") {

}
```

Ardından, düğmeye daha belirgin bir sistem stili vermek için `buttonStyle` kullanın:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Görüntüleme etkisi:

![view](../../Resource/019_view5.png)

Düğmenin gerçekten tıklamaya yanıt verdiğini doğrulamak için önce düğmenin içine test amaçlı bir `print` yazabiliriz:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Düğmeye tıklandığında konsol şu çıktıyı verir:

```swift
click Sign in
```

Bu da düğmenin tıklamaya başarıyla yanıt verdiğini gösterir.

## Oturum açma mantığı

Şimdi oturum açma düğmesine en temel doğrulama mantığını ekleyelim: **kullanıcının kullanıcı adı ve parola girip girmediğini kontrol etmek**.

Aşağıdaki durumları gerçekleştirmek istiyoruz:

- Kullanıcı hiçbir şey girmediyse `Empty` çıktısı verilsin
- Kullanıcı yalnızca ikisinden birini girdiyse hangisinin eksik olduğu söylensin
- Hem kullanıcı adı hem parola girildiyse `Success` çıktısı verilsin

### Hiçbir bilgi girilmemiş

Çünkü `user` ve `password` varsayılan olarak boş dizelerdir:

```swift
@State private var user = ""
@State private var password = ""
```

Bu yüzden kullanıcı hiçbir şey girmediğinde de bunlar boş kalır.

Swift içinde `String` gibi türler, içeriğin boş olup olmadığını kontrol etmek için `isEmpty` kullanabilir.

### isEmpty özelliği

`isEmpty`, dizelerin, dizilerin ve diğer içeriklerin boş olup olmadığını kontrol etmek için sıkça kullanılır.

Örneğin:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

İçerik boşsa `isEmpty` `true` döndürür; içerik boş değilse `false` döndürür.

Bu nedenle bunu, kullanıcı adı ve parolanın girilip girilmediğini anlamak için kullanabiliriz.

### Değişkenleri kontrol etmek için isEmpty kullanma

Kullanıcı hiçbir bilgi girmediyse, o zaman:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Bu durumda koşulu şöyle yazabiliriz:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Bu kod şu anlama gelir: `user` boşsa ve `password` de boşsa şu çıktıyı ver:

```swift
Empty
```

Buradaki `&&`, “ve” anlamına gelen mantıksal bir işleçtir.

Yani soldaki koşul doğru olduğunda ve sağdaki koşul da doğru olduğunda, tüm koşul doğru olur.

Bu nedenle bu kod yalnızca kullanıcı adı ve parola ikisi de boş olduğunda çalışır.

## Kullanıcı yalnızca bir kısmını doldurdu

Şimdi başka bir durumu ele alalım: kullanıcı yalnızca kullanıcı adını ya da yalnızca parolayı doldurdu.

Örneğin:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Bu durumda kullanıcı adı boş değildir, ancak parola boştur.

Bunu kontrol etmek için `isEmpty` kullanmaya devam edebiliriz:

### Kullanıcının hesap ya da parola girdiği durum

Kullanıcı yalnızca kullanıcı adını veya parolayı girdiyse, eksik olana göre uygun bir uyarı vermemiz gerekir.

Örneğin, kullanıcı yalnızca kullanıcı adını girdiyse:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Bu kodun mantığı şudur: kullanıcı adı boşsa kullanıcı adını girmesini iste. Aksi halde parolanın boş olup olmadığını kontrol et; parola boşsa parolayı girmesini iste.

### Kullanıcı tüm bilgileri doldurdu

Hem kullanıcı adı hem de parola girildiyse, bunların `isEmpty` değeri `false` döndürür.

Bu durumda şöyle yazabiliriz:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Burada `!` “değil” anlamına gelir.

Örneğin:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Yani `user.isEmpty`, “kullanıcı adı boş mu” sorusunu kontrol etmek için kullanılırken, `!user.isEmpty` ise “kullanıcı adı boş değil mi” sorusunu kontrol etmek için kullanılır.

Parola için de aynı mantık geçerlidir.

Dolayısıyla bu kodun anlamı şudur: kullanıcı adı boş değildir ve parola da boş değildir.

Bu iki koşul sağlandığında şu çıktı verilir:

```swift
Success
```

## Tam doğrulama mantığı

Şimdi bu üç durumu birleştirip `Button` içine yazalım:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Bu kodun çalıştırılma sırası şöyle anlaşılabilir:

İlk adım olarak önce şunu kontrol ederiz:

```swift
if user.isEmpty && password.isEmpty
```

Eğer hem kullanıcı adı hem de parola boşsa doğrudan `Empty` çıktısı verilir.

İkisi birden boş değilse program şu satırı kontrol etmeye devam eder:

```swift
else if user.isEmpty || password.isEmpty
```

Buradaki `||` “veya” anlamına gelir.

Yani koşullardan biri sağlandığı sürece tüm ifade sağlanmış olur.

Bu nedenle kullanıcı adı boşsa ya da parola boşsa `else if` kod bloğu çalıştırılır.

Kod bloğuna girdikten sonra hangi giriş kutusunun doldurulmadığını ayrıca kontrol ederiz:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Önceki iki koşul sağlanmıyorsa bu, kullanıcı adının boş olmadığı ve parolanın da boş olmadığı anlamına gelir.

Bu durumda program son `else` bölümüne girer:

```swift
print("Success")
```

Böylece oturum açma girişinin en temel doğrulama mantığını tamamlamış oluruz.

## Kullanıcı adı ve parola doğrulaması

Yukarıdaki mantık yalnızca “bir şey girilip girilmediğini” kontrol eder.

Ancak gerçek bir uygulamada yalnızca içerik girmek yeterli değildir. Genellikle kullanıcı adı ve parolanın doğrulanması için sunucuya gönderilmesi de gerekir.

Sunucu, kullanıcı adının var olduğunu ve parolanın doğru olduğunu onaylarsa oturum açmaya izin verilir; aksi halde oturum açma başarısızlığı bildirilir.

Bu süreci pratik etmek için önce kod içinde geçici bir hesap ve parola ayarlayarak “doğru oturum açma bilgilerini” simüle edebiliriz:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Kullanıcı adı ve parola ikisi de boş olmadığında, bunların doğru olup olmadığını karşılaştırabiliriz:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Buradaki `==`, “eşit mi” anlamına gelir.

Örneğin:

```swift
user == userID
```

Yani kullanıcının girdiği kullanıcı adının, bizim belirlediğimiz doğru kullanıcı adıyla tamamen aynı olup olmadığını ifade eder; parola için de aynı mantık geçerlidir.

Bu nedenle, girilen kullanıcı adı ve parola belirlenen değerlerle eşitse `Success` çıktısı verilir; bunlardan biri bile eşit değilse `Input error` çıktısı verilir.

Böylece basit bir “simüle edilmiş oturum açma doğrulaması” tamamlanmış olur.

Bu henüz sunucuya bağlı gerçek bir oturum açma işlevi olmasa da şu şeyi anlamamıza yetecek kadar faydalıdır: **düğmeye tıklandıktan sonra, farklı koşullara göre farklı kodlar çalıştırılabilir**.

## Özet

Bu derste temel bir oturum açma görünümünü tamamladık ve özellikle “koşullara göre giriş içeriğini değerlendirme mantığını” öğrendik.

Bu dersin temel içeriği, bir dizenin boş olup olmadığını kontrol etmek için `isEmpty` kullanmak ve farklı durumları işlemek için `if` ifadelerini mantıksal işleçlerle birlikte kullanmaktır.

Bunların içinde çok önemli iki mantıksal işleç şunlardır:

- `&&`: “ve” anlamına gelir, iki koşul da sağlanmalıdır
- `||`: “veya” anlamına gelir, koşullardan birinin sağlanması yeterlidir

Bu koşullar sonunda `true` ya da `false` olduğunda, `if` ifadesi sonuca göre farklı kodlar çalıştırır.

Bu oturum açma görünümü sayesinde “arayüz + veri + mantıksal değerlendirme” birleşiminden oluşan geliştirme yaklaşımını tanımaya başlamış olduk.

## Tam kod

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
