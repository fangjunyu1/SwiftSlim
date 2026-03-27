# Wprowadzenie

## Czym jest Swift?

Zanim zaczniemy naukę Swift, najpierw krótko poznajmy język programowania Swift. Swift to nowoczesny język programowania stworzony przez Apple, używany głównie do budowania aplikacji na platformy Apple, takie jak iOS, macOS, iPadOS i watchOS.

![Swift](../../RESOURCE/000_swift.png)

W porównaniu z innymi językami programowania Swift ma prostszą składnię i kładzie większy nacisk na bezpieczeństwo oraz czytelność. W połączeniu ze SwiftUI jest też łatwiejszy do nauki i zrozumienia. Oczywiście wcześniej nie uczyłem się innych języków programowania, więc może być on trochę trudniejszy niż HTML.

Swift nie służy wyłącznie do tworzenia aplikacji na platformy Apple. Społeczność Swift intensywnie pracuje nad przeniesieniem Swift także na platformę [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), a nawet nad uruchamianiem go na [serwerach](https://github.com/awslabs/swift-aws-lambda-runtime) i w innych środowiskach. Z perspektywy długoterminowego rozwoju Swift ma większy potencjał i w przyszłości może stać się językiem wieloplatformowym podobnym do Fluttera czy React Native.

## Zakres nauki

Ten kurs koncentruje się głównie na podstawach Swift i SwiftUI.

Zaczniemy od prostych zmiennych i typów danych, następnie będziemy budować interfejsy za pomocą SwiftUI, zrozumiemy sposoby zapisywania i odczytywania danych, a na końcu możliwe, że przejdziemy także do bardziej zaawansowanych tematów, takich jak SwiftData czy synchronizacja z iCloud.

Każdy rozdział będzie oparty na konkretnym przykładzie, dzięki czemu wiedzy o Swift będziemy uczyć się w praktycznych zastosowaniach.

Niektóre kursy najpierw szczegółowo omawiają dużą liczbę elementów składni i API, a dopiero potem przechodzą do praktycznych projektów. Dla początkujących jest to trochę jak nauka znaków ze słownika przez małe dziecko — zapamiętywanie dużej ilości treści bez kontekstu zastosowania ostatecznie tylko zniechęca do dalszej nauki.

W tym kursie wiedza będzie wprowadzana w rzeczywistych scenariuszach tworzenia aplikacji, a konkretne potrzeby będą prowadziły do odpowiednich zagadnień.

Po ukończeniu tego kursu będziesz w stanie samodzielnie stworzyć i uruchomić prostą aplikację, zainstalować ją na własnym urządzeniu z iOS lub macOS, a także opublikować ją w App Store.

## Jak uczyć się od zera?

Ja sam również zaczynałem od zera. Na początku obejrzałem kilka odcinków [filmów instruktażowych o Swift na YouTube](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) i odkryłem, że tworzenie aplikacji na iOS wcale nie jest tak skomplikowane, co wzbudziło moje zainteresowanie. Później zacząłem próbować uczyć się więcej o Swift — na przykład korzystając z gier programistycznych w [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), czytając [oficjalny podręcznik Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) oraz ucząc się z [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Z dzisiejszej perspektywy to właśnie [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) dało mi pewien szkielet nauki, dzięki któremu mogłem systematycznie poznawać SwiftUI. Ponieważ jednak kurs był po angielsku, a ja nie miałem podstaw programowania, podczas nauki napotykałem bardzo wiele trudności ze zrozumieniem. W takich momentach korzystałem z AI, takich jak [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com), aby lepiej zrozumieć poszczególne zagadnienia.

W trakcie nauki nieuniknione są tematy, które trudno zrozumieć. Pamiętam, że gdy uczyłem się UserDefaults, wiedziałem jedynie, jak zapisać dane, ale nie rozumiałem, że trzeba je jeszcze ręcznie odczytać, przez co zacząłem podejrzewać, że w moim kodzie jest błąd. Nawet tak proste zagadnienie kosztowało mnie kilka dni straconego czasu.

Podobnie było z takimi tematami jak closures, główny wątek czy generyki. We wczesnym etapie nauki nie potrafiłem ich dobrze zrozumieć, więc gdy ponownie pojawiały się w prawdziwych projektach, musiałem poświęcać dodatkowy czas na naukę od początku.

Dlatego moja rada jest następująca:

**1. Uzupełniaj podstawową wiedzę**

W Chinach mówi się: „Najtrudniejszy jest początek”. Dla osób zaczynających naukę Swift od zera to normalne, że w trakcie nauki trafiają na trudne do zrozumienia zagadnienia — i często nie dlatego, że same w sobie są aż tak skomplikowane, lecz dlatego, że u podstaw tej piramidy wiedzy istnieją jeszcze bardziej podstawowe pojęcia, z którymi początkujący nie mieli wcześniej kontaktu.

W takiej sytuacji warto rozważyć skorzystanie z narzędzi AI, takich jak [ChatGPT](https://chatgpt.com/) czy [Claude](https://claude.ai/?redirect=claude.com), aby na bieżąco uzupełniać brakującą wiedzę podstawową.

**2. Staraj się zrozumieć każde zagadnienie**

W procesie nauki najważniejsze jest możliwie dokładne zrozumienie każdego zagadnienia, nawet jeśli miałoby to zająć kilka dni.

Jeśli zdecydujesz się pominąć coś, czego nie rozumiesz, to z dużym prawdopodobieństwem znów natkniesz się na to podczas późniejszego tworzenia aplikacji, co spowolni pracę, a wtedy i tak będziesz musiał poświęcić czas, by się tego nauczyć. Zamiast naprawiać problem później, lepiej zrozumieć dane zagadnienie już na etapie nauki.

Każde zagadnienie jest w istocie narzędziem — im więcej narzędzi opanujesz, tym większa będzie twoja zdolność do rozwiązywania problemów.

To trochę jak budowanie domu. Jeśli masz do dyspozycji tylko jedno narzędzie, być może z trudem wykonasz większość prac, ale gdy pojawią się wyższe wymagania jakościowe, szybko okaże się ono niewystarczające. Im więcej narzędzi opanujesz, tym solidniejszy dom będziesz w stanie zbudować.

**3. Utrzymuj ciągłość nauki**

Nauka wymaga długofalowej konsekwencji. Niewiele osób naprawdę chce poświęcić kilka miesięcy na rzetelne przerobienie całego kursu. Ważniejsze od krótkiego, bardzo intensywnego wysiłku jest regularne poświęcanie czasu na naukę.

Nawet jeśli każdego dnia wykonasz tylko jeden procent planu, po stu dniach osiągniesz cały cel nauki.

## Wizja edukacyjna

Ten kurs nie ma na celu nauczyć bardzo dużej ilości wiedzy o Swift i SwiftUI, lecz raczej wprowadzić początkujących na drogę programowania w Swift. To trochę jak z klockami — kurs pokazuje, jak je łączyć, a reszta czasu należy już do ciebie, byś samodzielnie budował własne konstrukcje.

Projekt został udostępniony jako open source na [GitHub](https://github.com/fangjunyu1/SwiftSlim) i można go bezpłatnie pobrać oraz używać. Dostępna jest także wersja w App Store do wypróbowania.

Mamy nadzieję pomóc większej liczbie osób bez technicznego wykształcenia, ale z silnym pragnieniem zmiany swojej ścieżki zawodowej, aby dzięki nauce programowania i tworzeniu aplikacji zyskały nowe możliwości.

## Aktualizacje treści

Ten kurs został napisany na podstawie aktualnej wersji Swift i SwiftUI.

Wraz z aktualizacjami platform Apple i narzędzi część API może się zmieniać. Jeśli zauważysz problem albo treść będzie wymagała aktualizacji, warto odwołać się do oficjalnej dokumentacji lub najnowszej wersji repozytorium open source.

---
Fang Junyu

2026-02-14
