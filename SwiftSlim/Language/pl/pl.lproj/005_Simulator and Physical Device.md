# Symulator i fizyczne urządzenie

Do tej pory ukończyliśmy budowanie podstawowych widoków. Głównym tematem tej lekcji jest nauka uruchamiania aplikacji w symulatorze i na fizycznym urządzeniu (Physical Device).

Pamiętam, że kiedy po raz pierwszy zainstalowałem aplikację na iPhonie, byłem bardzo szczęśliwy, ponieważ mogłem w bardziej bezpośredni sposób zobaczyć efekt swojej pracy. To jest rodzaj pozytywnego sprzężenia zwrotnego — kiedy możemy używać własnoręcznie stworzonej aplikacji, zainteresowanie samo popycha nas do dalszej nauki.

Teraz otwórz projekt osobistego CV ukończony w poprzedniej lekcji i przygotuj się do uruchomienia go w symulatorze oraz na fizycznym urządzeniu.

## Symulator

Xcode ma wbudowane różne symulatory obejmujące wiele modeli iPhone’a, iPada oraz Apple Watch. Symulator pozwala sprawdzać różnice w układzie interfejsu aplikacji na różnych modelach lub wersjach systemu.

### Wybór symulatora

Na górnym pasku narzędzi Xcode, na liście urządzeń, wybierz symulator, na przykład iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Uruchomienie symulatora

Następnie kliknij przycisk uruchamiania w lewym górnym rogu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode automatycznie zbuduje projekt i uruchomi symulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Zamknięcie symulatora

Jeśli chcesz zamknąć symulator, kliknij przycisk zatrzymania na pasku narzędzi Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Możesz też po prostu zamknąć sam symulator:

![Swift](../../RESOURCE/005_xcode17.png)

Jeśli zamkniesz symulator bezpośrednio, Xcode może wyświetlić komunikat:

```id="a56t3k"
Thread 1: signal SIGTERM
```

Zwykle nie jest to błąd logiki programu, lecz efekt zewnętrznego zakończenia procesu debugowania. Na ogół można to zignorować — nie jest to błąd logiki aplikacji.

W porównaniu z podglądem w Xcode symulator jest bliższy rzeczywistemu środowisku uruchomieniowemu, ale nadal nie jest pełnym środowiskiem urządzenia. Nadaje się do sprawdzania układu i testów dopasowania do różnych modeli urządzeń.

## Priorytet środowisk testowych

W rzeczywistym procesie developmentu należy trzymać się następującej kolejności testowania:

fizyczne urządzenie > symulator > podgląd Xcode

Podgląd nadaje się do szybkiego dostrajania UI, symulator do testów strukturalnych, a ostateczna weryfikacja musi zostać wykonana na fizycznym urządzeniu, szczególnie w przypadku operacji związanych z iCloud.

## Fizyczne urządzenie

Zarówno podgląd Xcode, jak i symulator mogą czasem wyświetlać nieprecyzyjne wyniki, dlatego fizyczne urządzenie ma kluczowe znaczenie. Zachowania związane z uprawnieniami systemowymi, wydajnością czy mechanizmem powiadomień można w pełni zweryfikować tylko na fizycznym urządzeniu.

### Włączenie trybu deweloperskiego

Na iPhonie:

Ustawienia → Prywatność i bezpieczeństwo → Tryb deweloperski → Włącz

![Swift](../../RESOURCE/005_xcode4.png)

System wymusi restart urządzenia. Bez włączenia trybu deweloperskiego nie będzie można uruchamiać debugowania.

### Konfiguracja zespołu deweloperskiego

Xcode musi mieć skonfigurowany zespół deweloperski, w przeciwnym razie nie będzie mógł podpisać aplikacji i zainstalować jej na urządzeniu.

Ścieżka konfiguracji:

nazwa projektu → TARGETS → Signing & Capabilities → Team

Jeśli widzisz „Add Account...”, oznacza to, że konto Apple nie zostało jeszcze dodane.

![Swift](../../RESOURCE/005_xcode5.png)

Kliknij przycisk dodawania i zaloguj się do Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Po zalogowaniu do Apple ID wybierz odpowiednie konto, aby zakończyć konfigurację zespołu deweloperskiego.

![Swift](../../RESOURCE/005_xcode7.png)

### Podłączenie urządzenia

Podłącz iPhone’a do Maca za pomocą kabla.

Przy pierwszym połączeniu:

* Mac wyświetli pytanie, czy połączyć iPhone’a z tym Makiem
* iPhone wyświetli pytanie, czy ufać temu komputerowi

Musisz kliknąć „Zaufaj” na iPhonie i wpisać kod blokady ekranu. Następnie wybierz swojego iPhone’a z listy urządzeń w Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Kliknij przycisk uruchamiania w lewym górnym rogu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode zbuduje projekt i zainstaluje aplikację na iPhonie.

![Swift](../../RESOURCE/005_view.png)

**Debugowanie bezprzewodowe**

Od iOS 11 Xcode obsługuje debugowanie bezprzewodowe.

![Swift](../../RESOURCE/005_xcode18.png)

Warunki wstępne:

1. Pierwsze sparowanie iPhone’a z Makiem musi zostać wykonane przy użyciu kabla
2. iPhone i Mac muszą znajdować się w tej samej sieci Wi-Fi
3. oba urządzenia muszą pozostawać odblokowane

Po pierwszym sparowaniu przy użyciu kabla, później nawet po odłączeniu kabla można uruchamiać aplikację bezpośrednio, o ile urządzenia znajdują się w tej samej sieci.

Uwagi:

* jeśli urządzenie nie pojawia się na liście urządzeń, można ponownie podłączyć kabel
* debugowanie przez Wi-Fi bywa czasem niestabilne; jeśli wystąpi problem z połączeniem, wystarczy znowu podłączyć kabel
* w sieciach firmowych albo odizolowanych może to być ograniczone

## Typowe błędy i rozwiązania

Podczas łączenia iPhone’a z Xcode do debugowania można napotkać różne typy komunikatów o błędach. Poniżej wymieniono kilka typowych problemów wraz z odpowiednimi sposobami rozwiązania, aby pomóc szybko zlokalizować i usunąć problem z połączeniem.

**1. Parowanie nie zostało ukończone**

```id="1c4tpk"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Oznacza to, że parowanie do debugowania między Xcode a iPhonem nie zostało jeszcze ukończone.

Rozwiązanie: upewnij się, że na iPhonie kliknięto „Zaufaj”. Jeśli błąd nadal występuje, uruchom ponownie Xcode i połącz urządzenie jeszcze raz.

**2. Brak skonfigurowanego zespołu deweloperskiego**

```id="ifjwbn"
Signing for "SwiftSlimTest" requires a development team.
```

Możliwe, że zespół deweloperski nie został skonfigurowany.

Rozwiązanie: w Signing & Capabilities wybierz zalogowane konto.

**3. Nie można zamontować Developer Disk Image**

```id="2jmt3j"
Previous preparation error: The developer disk image could not be mounted on this device.
```

Zwykle pojawia się to, gdy proces instalacji został przerwany, na przykład przez odłączenie kabla albo wymuszone zatrzymanie, co powoduje ograniczenie przy ponownej instalacji i wywołuje błąd.

Rozwiązanie: uruchom ponownie iPhone’a i ponownie podłącz kabel.

**4. Nieudane połączenie tunelu debugowania**

```id="qqr867"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ten błąd często występuje z powodu działania VPN albo proxy sieciowego.

Rozwiązanie: wyłącz VPN albo proxy sieciowe i spróbuj ponownie.

**5. Urządzenie jest zablokowane**

```id="2ohnm5"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Urządzenie jest zablokowane. Wystarczy odblokować iPhone’a.

**6. Urządzenie nie jest zarejestrowane**

```id="qayfzh"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Oznacza to, że urządzenie nie zostało dodane do listy urządzeń na koncie deweloperskim, więc Xcode nie może wygenerować dla niego poprawnego profilu provisioningowego do podpisania i instalacji aplikacji.

Rozwiązanie: kliknij „Register Device”, aby zarejestrować urządzenie automatycznie.

**7. Niezgodność wersji deployment target**

```id="yzdpxt"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Oznacza to, że wersja systemu na urządzeniu jest niższa niż minimalna wersja wdrożenia ustawiona w projekcie.

Ścieżka zmiany:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Ustaw wersję nie wyższą niż wersja systemu urządzenia.

Po zmianie wyczyść folder budowania:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Po zakończeniu czyszczenia uruchom projekt ponownie.
