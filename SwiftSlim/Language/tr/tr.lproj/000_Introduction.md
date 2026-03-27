# Giriş

## Swift nedir?

Swift öğrenmeye başlamadan önce, önce Swift programlama dilini kısaca tanıyalım. Swift, Apple tarafından geliştirilen modern bir programlama dilidir ve başlıca iOS, macOS, iPadOS ve watchOS gibi Apple platformları için uygulama geliştirmede kullanılır.

![Swift](../../RESOURCE/000_swift.png)

Diğer programlama dilleriyle karşılaştırıldığında Swift’in söz dizimi daha sadedir ve güvenlik ile okunabilirliğe daha fazla önem verir. SwiftUI ile birlikte kullanıldığında öğrenmesi ve anlaması daha kolaydır. Elbette ben daha önce başka programlama dilleri öğrenmemiştim; bu yüzden bana göre HTML’den biraz daha zor olabilir.

Swift yalnızca Apple platformları için uygulama geliştirmekle sınırlı değildir; Swift topluluğu Swift’i [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) platformuna taşımak ve hatta [sunucu](https://github.com/awslabs/swift-aws-lambda-runtime) gibi başka ortamlarda da çalıştırmak için çaba göstermektedir. Uzun vadeli gelişim açısından bakıldığında Swift’in büyüme alanı daha geniştir ve gelecekte Flutter, React Native gibi çapraz platform programlama dillerine benzer bir konuma ulaşma potansiyeline sahiptir.

## Öğrenme içeriği

Bu eğitim ağırlıklı olarak Swift ve SwiftUI’nin temel bilgilerine odaklanmaktadır.

Basit değişkenler ve veri türleriyle başlayacağız, SwiftUI kullanarak arayüzler oluşturacağız, verinin nasıl saklandığını ve okunduğunu anlayacağız; daha sonra ise muhtemelen SwiftData, iCloud senkronizasyonu gibi ileri seviye konulara da gireceğiz.

Her bölüm, gerçek bir örnek etrafında şekillenecek ve Swift bilgisini gerçek uygulama senaryoları içinde öğreneceğiz.

Bazı eğitimler önce çok sayıda söz dizimi kuralını ve API’yi topluca anlatır, ardından proje pratiğine geçer. Yeni başlayanlar için bu, bir çocuğun sözlükten karakter ezberlemesine benzer; kullanım senaryosu olmadan çok fazla içeriği ezberlemek, sonunda yalnızca heves kaybına yol açar.

Bu eğitimde bilgileri gerçek geliştirme senaryoları içinde öğrenecek, ihtiyaçlardan yola çıkarak ilgili bilgi noktalarını ele alacağız.

Bu eğitimi tamamladıktan sonra temel düzeyde bir uygulamayı bağımsız olarak geliştirip çalıştırabilecek, onu kendi iOS / macOS cihazlarınıza kurabilecek ve ayrıca App Store’da yayımlayabileceksiniz.

## Sıfırdan nasıl öğrenilir?

Ben de başlangıçta tamamen sıfırdan biriydim. İlk başta yalnızca Youtube’daki birkaç [Swift eğitim videosuna](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) göz attım ve iOS uygulaması geliştirmenin o kadar da karmaşık olmadığını fark ettim; bu da bende belirli bir ilgi uyandırdı. Daha sonra daha fazla Swift bilgisi öğrenmeye çalıştım. Örneğin [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12) içindeki programlama oyunlarını deneyimledim, [Swift resmî öğretici belgelerini](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) okudum ve [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) içeriğini çalıştım.

Şimdi geriye dönüp baktığımda, esas olarak [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) bana sistemli şekilde SwiftUI öğrenebilmem için bir öğrenme çerçevesi sundu. Ancak eğitim İngilizce olduğu ve benim de programlama temelim olmadığı için, anlama sürecinde çok fazla zorluk yaşadım. Bu nedenle [ChatGPT](https://chatgpt.com/) ve [Claude](https://claude.ai/?redirect=claude.com) gibi yapay zekâ araçlarını kullanarak bilgi noktalarını anlamaya çalıştım.

Öğrenme sürecinde, anlaşılması zor bazı konularla karşılaşmak kaçınılmazdır. UserDefaults’u öğrenirken, veriyi nasıl kaydedeceğimi biliyor ama verinin elle okunması gerektiğini bilmiyordum; bu yüzden kodumda bir sorun olduğunu düşünmüştüm. Böyle basit bir bilgi noktası bile birkaç günümü boşa harcamama neden oldu.

Benzer şekilde closure, ana iş parçacığı ve generics gibi konular da vardı. Öğrenmenin erken döneminde bunları derinlemesine anlayamadığım için, gerçek geliştirme sırasında bu kavramlarla tekrar karşılaştığımda yeniden zaman ayırıp tekrar öğrenmem gerekti.

Bu nedenle benim önerilerim şunlardır:

**1. Temel bilgileri tamamlayın**

Çin’de “Her şeyin başlangıcı zordur” diye bir söz vardır. Swift’i sıfırdan öğrenen biri için, öğrenme sürecinde anlaşılması zor bazı konularla karşılaşmak kaçınılmazdır — çoğu zaman bunun sebebi konunun kendisinin çok karmaşık olması değil, bilgi piramidinin tabanında yer alan daha temel bazı kavramlarla henüz karşılaşılmamış olmasıdır.

Böyle durumlarda [ChatGPT](https://chatgpt.com/) ve [Claude](https://claude.ai/?redirect=claude.com) gibi yapay zekâ araçlarından yararlanarak eksik temel bilgileri zamanında tamamlamayı düşünebilirsiniz.

**2. Her bilgi noktasını anlamaya çalışın**

Öğrenme sürecinde en önemli şey, gerekirse birkaç gün ayırmak pahasına da olsa her bilgi noktasını olabildiğince anlamaya çalışmaktır.

Anlamadığınız içerikleri atlamayı seçerseniz, büyük olasılıkla daha sonraki geliştirme sürecinde onlarla tekrar karşılaşır ve geliştirme ilerleyişinizin önünde bir engel olarak bulursunuz; sonunda yine zaman ayırıp yeniden öğrenmeniz gerekir. Sonradan telafi etmeye çalışmak yerine, öğrenme aşamasında bilgiyi gerçekten kavramak daha iyidir.

Her bilgi noktası özünde bir araçtır — elinizde ne kadar çok araç varsa, sorun çözme beceriniz de o kadar güçlü olur.

Bu, ev inşa etmeye benzer. Elinizde yalnızca tek bir araç varsa, işlerin büyük kısmını zar zor tamamlayabilirsiniz; ancak daha yüksek kalite gereksinimleriyle karşılaştığınızda yetersiz kalırsınız. Daha sağlam bir ev inşa edebilmek için daha fazla araca sahip olmak gerekir.

**3. Sürekli öğrenmeyi sürdürün**

Öğrenme, uzun vadeli bir kararlılık gerektirir. Çok az insan birkaç ayını gerçekten ciddi şekilde bir eğitimi öğrenmeye ayırmaya gönüllüdür. Kısa süreli yüksek yoğunluktan ziyade, sürekli olarak zaman ayırmak daha önemlidir.

Her gün yalnızca yüzde bir ilerleseniz bile, yüz günün sonunda tüm öğrenme hedefine ulaşabilirsiniz.

## Eğitim vizyonu

Bu kurs çok fazla Swift ve SwiftUI bilgisi öğretmeyi amaçlamaz; daha çok yeni başlayanları Swift adlı programlama yoluna yönlendirmeyi hedefler. Bu, lego parçalarını birleştirmeye benzer — eğitim size nasıl birleştirileceğini açıklar, geri kalan zaman ise kendi yapınızı kendiniz kurmanıza kalır.

Proje [GitHub](https://github.com/fangjunyu1/SwiftSlim) üzerinde açık kaynak olarak yayımlanmıştır ve ücretsiz olarak indirilebilir, kullanılabilir. Aynı zamanda deneyimlemek isteyenler için App Store sürümü de sunulmaktadır.

Teknik geçmişi olmayan ancak kariyer yolunu değiştirmeyi arzulayan daha fazla insana yardımcı olmayı; programlamayı ve uygulama geliştirmeyi öğrenerek yeni olasılıklar elde etmelerini sağlamayı umuyoruz.

## İçerik güncellemeleri

Bu eğitim, mevcut Swift ve SwiftUI sürümlerine dayanarak hazırlanmıştır.

Apple platformları ve araçları güncellendikçe bazı API’lerde değişiklikler olabilir. Bir sorun fark ederseniz veya içeriğin güncellenmesi gerekiyorsa, resmî belgeleri ya da açık kaynak deposunun en güncel sürümünü inceleyebilirsiniz.

---
方君宇

2026-02-14