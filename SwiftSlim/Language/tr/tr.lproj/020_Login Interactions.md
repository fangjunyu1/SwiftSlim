# Giriş Etkileşimleri

Önceki derste bir giriş görünümü oluşturduk ve düğmeler ile koşullu mantığı kullanarak girilen içeriğin basit doğrulamasını gerçekleştirdik.

Bu derste, önceki dersteki kodu temel alarak `SecureField` parola giriş alanını, `Alert` uyarı kutusunu ve değişkenlere göre farklı görünümlerin nasıl kontrol edileceğini öğrenmeye devam edeceğiz.

Bu ders sayesinde bir giriş görünümünün temel etkileşim akışını daha iyi anlayabilirsiniz. Bu, aynı zamanda birçok uygulamada sıkça kullanılan temel mantıktır.

## Parola Giriş Alanı

Önceki derste parola girmek için `TextField` kullandık.

Ancak gerçek bir giriş arayüzünde parola genellikle doğrudan gösterilmez. Bunun yerine noktalar veya başka bir gizleme efektiyle gösterilir; bu da kullanıcının gizliliğini korumaya yardımcı olur.

SwiftUI'de parola girmek için özel olarak kullanılan denetim `SecureField`'dır.

Örneğin:

```swift
SecureField("Password", text: $password)
```

Yazımı `TextField`'a çok benzer. O da bir yer tutucu metne ve bağlı bir değişkene ihtiyaç duyar.

Bunu basitçe şöyle anlayabilirsiniz: `SecureField` de bir giriş alanıdır, sadece girilen içeriği gizler.

Parola girmek için daha önce kullanılan `TextField`'ı doğrudan `SecureField` ile değiştirebiliriz:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Kullanıcı parola girdiğinde, parola içeriği artık arayüzde doğrudan gösterilmeyecektir.

Görüntüleme efekti:

![password](../../Resource/020_password.png)

Artık kullanıcı adını ve parolayı girebilir, ardından girişin doğru olup olmadığını belirlemek için düğmeye tıklayabiliriz.

### Geri Bildirim Mesajlarını Gösterme

Daha önce sonuçları çıktılamak için sürekli `print` kullanıyorduk.

`print` içeriği yalnızca konsolda görünür. Geliştiriciler programı Xcode'da çalıştırırken bunu görebilir, ancak telefondaki sıradan kullanıcılar bu mesajları göremez.

Bu da, program doğrulamayı zaten tamamlamış olsa bile kullanıcının girilen içeriğin doğru olup olmadığını hâlâ bilmediği anlamına gelir.

Bu noktada, mesajları doğrudan arayüzde göstermenin bir yoluna ihtiyacımız var.

## Alert Uyarı Kutusu

SwiftUI'de bir mesaj kutusu açmak için `Alert` kullanabiliriz.

Temel kullanım:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Bu kod önceki denetimlere göre biraz daha karmaşık görünüyor, ancak parçalara ayırarak anlayabiliriz.

`Alert` temel olarak şu bölümleri içerir:

- `"Title"`: uyarı kutusunun başlığı
- `isPresented`: uyarı kutusunun gösterilip gösterilmeyeceğini kontrol etmek için kullanılan bağlı bir Boolean değeri
- `Button(...)`: uyarı kutusundaki düğme
- `message:`: uyarı kutusunda gösterilen mesaj içeriği

Bunu basitçe şöyle anlayabilirsiniz: bağlı değişken `true` olduğunda sistem bu uyarı kutusunu açar.

Görüntüleme efekti:

![alert](../../Resource/020_alert3.png)

İlgili yapı:

![alert](../../Resource/020_alert.png)

### Alert Bir Değiştiricidir

Daha önce öğrendiğimiz birçok değiştirici gibi `Alert` de belirli bir görünümün arkasına eklenir.

Örneğin, bir düğmeden sonra eklenebilir:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Dıştaki `VStack`'ten sonra da eklenebilir:

```swift
VStack {
    // ...
}
.alert() {...}
```

Bu, `Alert`'ün arayüzde bağımsız şekilde yerleştirilen tek başına bir görünüm olmadığı anlamına gelir. Bunun yerine, belirli bir görünüme eklenen bir değiştiricidir.

Bunu basitçe şöyle anlayabilirsiniz: `Alert` genellikle bir koşul sağlandığında mesaj göstermek için düğmenin veya dış düzenin arkasına yazılır.

### Alert Gösterme

Bir `Alert` göstermek istiyorsak, onu kontrol edecek bir değişkene ihtiyacımız vardır.

Örneğin:

```swift
@State private var showAlert = false
```

Bu değişken `Bool` türündedir; yani yalnızca iki değeri vardır: `true` veya `false`.

Sonra bunu `Alert`'ün `isPresented` özelliğine bağlayın:

```swift
isPresented: $showAlert
```

`showAlert` `false` olduğunda uyarı kutusu gösterilmez; `showAlert` `true` olduğunda uyarı kutusu açılır.

### Düğme ile Uyarı Kutusunu Gösterme

Şimdi önce en basit senaryoyu uygulayalım:

Kullanıcı hiçbir şey girmeden doğrudan `Sign in` düğmesine tıkladığında, ona henüz hiçbir içerik girmediğini söyleyen bir mesaj kutusu gösterelim.

Önce, bu mesaj kutusunu kontrol edecek bir değişken oluşturun:

```swift
@State private var showEmpty = false
```

Sonra, `Button`'dan sonra bir `Alert` ekleyin:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Ardından, düğmeye tıklama kodunda kontrolü gerçekleştirin:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Eğer hem `user` hem de `password` boşsa, `showEmpty` değerini `true` olarak ayarlayın.

Ve `Alert` bu değişkene bağlı olduğu için, değişken `true` olduğunda sistem otomatik olarak uyarı kutusunu açacaktır.

Görüntüleme efekti:

![alert](../../Resource/020_alert1.png)

Böylece kullanıcı düğmeye tıkladıktan hemen sonra mesajı görebilir ve geliştiricinin konsoldaki `print` çıktısını kontrol etmesine gerek kalmaz.

### Düğmeyi ve Uyarı Kutularını Geliştirme

Daha önce yalnızca “hiçbir şey doldurulmadı” durumunu ele aldık.

Hâlâ şu durumları da ele almamız gerekiyor:

- kullanıcı adı eksik
- parola eksik
- hem kullanıcı adı hem parola girilmiş, ancak giriş yanlış

Bu yüzden bu durumlar için karşılık gelen mesajları da hazırlamamız gerekiyor.

Önce üç yeni değişken ekleyin:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Sonra düğmenin arkasına karşılık gelen `Alert`'leri eklemeye devam edin:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Ardından, düğmenin içindeki karar mantığını tamamlayın:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Düğme, kullanıcının hiçbir bilgi girmediğini, bir bilgiyi boş bıraktığını veya giriş doğrulamasında başarısız olduğunu belirlediğinde, ilgili Boolean değişkenini `true` yapar ve ardından ilgili `Alert` açılır.

Burada size birkaç durumu kendiniz test etmenizi öneririm:

- hiçbir şey doldurmayın
- yalnızca kullanıcı adını doldurun
- yalnızca parolayı doldurun
- hem kullanıcı adını hem parolayı doldurun, ancak içerik yanlış olsun
- hem kullanıcı adını hem parolayı doldurun ve içerik doğru olsun

Bu, kodumuzda herhangi bir sorun olup olmadığını doğrulamaya yardımcı olur. Bu aynı zamanda uygulama geliştirmede çok önemli bir “test” adımıdır.

Program belirli bir senaryoda yanlış davranıyorsa, bu mantıkta bir sorun olabileceği ve programda bir `Bug` ortaya çıktığı anlamına gelir.

Geliştirmede sıkça söylenen `Bug`, bir hata, kusur veya beklentilere uymayan davranış anlamına gelir.

## Giriş Görünümünü Tamamlama

Daha önce bahsettiğimiz `Alert` örneklerinin tamamı, “giriş yanlış olduğunda” kullanıcıya nasıl geri bildirim verileceğiyle ilgiliydi.

Kullanıcı doğru kullanıcı adı ve parolayı girdiğinde genellikle bir “uyarı kutusu” göstermeyiz. Bunun yerine doğrudan giriş sonrası arayüze geçeriz.

Bu, çok önemli bir kavramı içerir: **bir değişkenin değerine göre farklı görünümler göstermek.**

Örneğin:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Burada hangi görünümün gösterileceğini yönetmek için `Bool` türünü kullanıyoruz:

- eğer `login` `true` ise, girişin zaten başarılı olduğu ve giriş sonrası içeriğin gösterildiği anlamına gelir
- eğer `login` `false` ise, girişin başarılı olmadığı ve giriş arayüzünün gösterilmeye devam edeceği anlamına gelir.

`if` ifadesi Swift'te koşullu bir ifade olsa da, SwiftUI'nin `body` kısmında görünümlerin gösterim mantığını kontrol etmek için kullanılabilir.

Bu, SwiftUI'nin koşulun sonucuna göre şu anda hangi görünümün gösterilmesi gerektiğini belirlediği anlamına gelir.

Bu gösterim mantığını mevcut `ContentView` içine yerleştirebiliriz:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Orijinal giriş görünümünün kodu
		}
	}
}
```

Burada kullanıcının başarıyla giriş yapıp yapmadığını belirtmek için `login` adında yeni bir değişken ekledik.

Ardından daha önce yazdığımız giriş görünümü kodunu `else` ifadesinin arkasına yerleştirdik.

Görünüm gösterim mantığı:

- `login` `false` olduğunda, bu henüz girişin başarılı olmadığı anlamına gelir; dolayısıyla orijinal giriş görünümü gösterilmeye devam eder.
- `login` `true` olduğunda, bu girişin başarılı olduğu anlamına gelir. Bu noktada giriş görünümü artık gösterilmez ve onun yerine `Login successful` gösterilir.

Bu, `ContentView`'ün `login` değerine bağlı olarak farklı görünüm içerikleri göstereceği anlamına gelir.

Şimdi düğmenin içindeki başarılı giriş mantığını değiştirelim:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Kullanıcının girdiği kullanıcı adı ve parola her ikisi de doğru olduğunda, `login` değerini `true` yaparız.

`login` değerinin değişmesiyle birlikte `ContentView` içindeki `if` kontrolünün sonucu da değişir ve arayüz orijinal giriş görünümünden `Login successful` görünümüne geçer.

Görüntüleme efekti şöyledir:

![view](../../Resource/020_view.png)

Artık “koşullara göre farklı görünümler gösterme” fikrini bu mevcut giriş sayfasında gerçekten kullanmış olduk.

Gerçek uygulamalarda da genellikle bu şekilde çalışır: belirli bir değere göre farklı görünümler gösterilir.

Örneğin, kullanıcı giriş yapmamışsa giriş sayfası gösterilir; kullanıcı başarılı şekilde giriş yaptıktan sonra başka bir arayüz gösterilir.

Temel fikir şudur: **arayüzün hangi içeriği göstereceğini, değişkenlerdeki değişikliklerle kontrol etmek.**

## Özet

Bu derste üç önemli şey öğrendik:

1. Parola içeriğinin arayüzde doğrudan görünmemesi için parolaları girmek üzere `SecureField` kullanmak.
2. Mesajları yalnızca konsola yazdırmak yerine kullanıcıya göstermek için `Alert` kullanmak.
3. Giriş öncesi ve giriş sonrası arayüzler arasında geçiş yapmayı mümkün kılmak için farklı görünümlerin gösterimini kontrol etmekte değişkenleri ve `if` koşullarını kullanmak.

Bu bilgiler sayesinde artık temel etkileşim efektlerine sahip bir giriş görünümünü tamamlayabilir ve SwiftUI'deki “durum değiştiğinde arayüz güncellenir” geliştirme fikrini daha iyi anlayabiliriz.

## Tam Kod

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Ek Bilgi - Birden Fazla Düğmeli Alert

Bu dersin önceki bölümünde yalnızca bir düğmesi olan ve esas olarak kullanıcıyı bilgilendirmek için kullanılan en temel `Alert` yapısını kullandık.

Aslında `Alert`, kullanıcının farklı seçimler yapabilmesi için birden fazla düğme de içerebilir.

Örneğin:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Düğmeye tıklandıktan sonra `Ok`, `delete` ve `cancel` olmak üzere üç seçeneğe sahip bir mesaj kutusu açılır.

Görüntüleme efekti:

![alert](../../Resource/020_alert2.png)

Farklı düğmelere tıklandığında karşılık gelen kod çalıştırılır.

### Button'ın `role` Özelliği

Burada `Alert` içindeki `Button`'ın, daha önce öğrendiğimiz normal düğme yazımından biraz farklı olduğunu fark edeceksiniz:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Burada ek olarak bir `role` parametresi vardır.

SwiftUI'de `role`, sistemin bu düğmenin ne tür bir işlemi temsil ettiğini anlamasını sağlamak için kullanılır.

Yaygın bazı roller şunlardır:

- `.cancel`: iptal işlemi
- `.destructive`: silme gibi tehlikeli işlem
- `nil`: normal işlem

Farklı `role` değerleri genellikle arayüzde farklı görsel stillere de yol açar.

Örneğin, tehlikeli işlemler kullanıcıya dikkatli tıklaması gerektiğini hatırlatmak için genellikle daha dikkat çekici bir stille gösterilir.

Ayrıca `role`, düğme için ek anlamsal bilgi de sağlar; bu sayede VoiceOver gibi ekran okuyucular, düğmenin amacını kullanıcıya daha kolay açıklayabilir.

Bu nedenle, uygun durumlarda bir düğmeye `role` eklemek çok iyi bir alışkanlıktır.
