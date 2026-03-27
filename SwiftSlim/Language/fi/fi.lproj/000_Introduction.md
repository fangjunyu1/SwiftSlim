# Johdanto

## Mitä Swift on?

Ennen kuin alamme opetella Swiftiä, tutustutaan ensin lyhyesti Swift-ohjelmointikieleen. Swift on Applen kehittämä moderni ohjelmointikieli, jota käytetään pääasiassa sovellusten rakentamiseen Apple-alustoille, kuten iOS:lle, macOS:lle, iPadOS:lle ja watchOS:lle.

![Swift](../../RESOURCE/000_swift.png)

Moneen muuhun ohjelmointikieleen verrattuna Swiftin syntaksi on selkeämpi ja se painottaa enemmän turvallisuutta ja luettavuutta. Yhdessä SwiftUI:n kanssa sitä on myös helpompi oppia ja ymmärtää. Toki en itse ollut aiemmin opiskellut muita ohjelmointikieliä, joten se voi tuntua hieman HTML:ää vaikeammalta.

Swiftillä ei voi kehittää vain Apple-alustojen sovelluksia. Swift-yhteisö tekee töitä sen eteen, että Swift saadaan siirrettyä myös [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) -alustalle, ja sitä voidaan ajaa jopa [palvelimilla](https://github.com/awslabs/swift-aws-lambda-runtime) ja muissa ympäristöissä. Pitkällä aikavälillä Swiftillä on laajempi kehityspotentiaali, ja tulevaisuudessa sillä voi olla mahdollisuus kasvaa Flutterin tai React Nativen kaltaiseksi monialustaiseksi ohjelmointikieleksi.

## Mitä opimme

Tämä opas keskittyy Swiftin ja SwiftUI:n perusasioihin.

Aloitamme yksinkertaisista muuttujista ja tietotyypeistä, käytämme SwiftUI:ta käyttöliittymien rakentamiseen, ymmärrämme miten dataa tallennetaan ja luetaan, ja lopuksi saatamme syventyä myös edistyneempiin aiheisiin, kuten SwiftDataan ja iCloud-synkronointiin.

Jokainen luku rakentuu käytännön esimerkin ympärille, jotta Swiftin oppiminen tapahtuisi todellisissa sovellustilanteissa.

Jotkin oppaat esittelevät ensin suuren määrän syntaksia ja API-rajapintoja ja siirtyvät vasta sen jälkeen projekteihin. Aloittelijalle tämä on kuin lapsi yrittäisi opetella sanoja sanakirjasta: jos paljon asioita täytyy muistaa ilman käyttötilannetta, into oppimiseen katoaa helposti.

Tässä oppaassa opimme asioita todellisten kehitystilanteiden kautta, niin että tarpeet johdattavat meidät oikeiden tietokohtien äärelle.

Kun olet suorittanut tämän oppaan, pystyt kehittämään ja ajamaan itsenäisesti perussovelluksen, asentamaan sen omille iOS- tai macOS-laitteillesi ja julkaisemaan sen halutessasi myös App Storessa.

## Miten oppia täysin alusta?

Minäkin aloitin täysin nollasta. Aluksi selasin vain muutamia [Swift-opetusvideoita YouTubessa](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) ja huomasin, ettei iOS-sovellusten kehittäminen ollutkaan kovin monimutkaista. Se herätti kiinnostukseni. Sen jälkeen aloin opetella lisää Swiftistä, esimerkiksi kokeilemalla [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12) -sovelluksen ohjelmointipelejä, lukemalla [Swiftin virallista dokumentaatiota](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) ja opiskelemalla [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) -kurssia.

Nyt jälkikäteen ajatellen juuri [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) antoi minulle oppimisen rungon, jonka avulla pystyin opiskelemaan SwiftUI:ta järjestelmällisesti. Koska opas oli kuitenkin englanniksi ja minulta puuttui ohjelmointitausta, ymmärtämisessä oli paljon vaikeuksia. Siihen sain apua käyttämällä tekoälytyökaluja, kuten [ChatGPT](https://chatgpt.com/) ja [Claude](https://claude.ai/?redirect=claude.com), tukena eri käsitteiden ymmärtämisessä.

Oppimisen aikana tulee väistämättä vastaan asioita, joita on vaikea ymmärtää. Muistan esimerkiksi, että opetellessani UserDefaultsia tiesin vain, miten data tallennetaan, mutta en sitä, että data täytyy lukea myös käsin takaisin. Siksi epäilin pitkään, että koodissani oli jotain vialla. Näinkin yksinkertainen asia vei minulta useita päiviä.

Sama tapahtui myös esimerkiksi closurejen, pääsäikeen ja genericsien kanssa. Koska en aluksi ymmärtänyt niitä syvällisesti, jouduin palaamaan niihin uudelleen aina, kun ne tulivat vastaan oikeassa kehitystyössä.

Siksi neuvoni ovat seuraavat:

**1. Täydennä perustietoja**

Kiinassa sanotaan, että “kaikki alku on vaikeaa”. Swiftiä täysin alusta opetteleville on tavallista, että opiskelun aikana tulee vastaan vaikeasti ymmärrettäviä asioita. Usein kyse ei ole siitä, että itse aihe olisi erityisen monimutkainen, vaan siitä, että tiedon pyramidin pohjalta puuttuu vielä vielä perustavampia käsitteitä, joita aloittelija ei ole ehtinyt kohdata.

Tällaisissa tilanteissa voi olla hyödyllistä käyttää tekoälytyökaluja, kuten [ChatGPT](https://chatgpt.com/) ja [Claude](https://claude.ai/?redirect=claude.com), täydentämään puuttuvia perustietoja ajoissa.

**2. Pyri ymmärtämään jokainen tietokohta**

Oppimisprosessissa tärkeintä on yrittää ymmärtää jokainen asia, vaikka siihen menisi useita päiviä.

Jos päättää ohittaa kohdat, joita ei ymmärrä, ne tulevat todennäköisesti vastaan uudelleen myöhemmässä kehitystyössä ja hidastavat etenemistä. Lopulta niihin täytyy käyttää aikaa joka tapauksessa. On parempi ymmärtää asiat jo oppimisvaiheessa kuin paikata puutteita myöhemmin.

Jokainen tietokohta on pohjimmiltaan työkalu. Mitä enemmän työkaluja hallitset, sitä paremmin pystyt ratkaisemaan ongelmia.

Se on vähän kuin talon rakentaminen. Jos sinulla on vain yksi työkalu, saatat juuri ja juuri saada suurimman osan työstä tehtyä, mutta kun vaatimukset kasvavat, työ muuttuu vaikeaksi. Mitä enemmän työkaluja hallitset, sitä vakaamman talon pystyt rakentamaan.

**3. Jatkuva oppiminen**

Oppiminen vaatii pitkäjänteisyyttä. Harva on todella valmis käyttämään useita kuukausia yhden oppaan huolelliseen opiskeluun. Jatkuva ajankäyttö on tärkeämpää kuin lyhyen ajan korkea intensiteetti.

Vaikka etenisit vain yhden prosentin päivässä, sadassa päivässä koko tavoite voi silti valmistua.

## Koulutuksellinen visio

Tämä kurssi ei opeta valtavaa määrää Swift- ja SwiftUI-tietoa, vaan johdattaa aloittelijan Swift-ohjelmoinnin polulle. Se on vähän kuin palikkaleikki: opas näyttää, miten palikat liitetään yhteen, ja loppu on sinun omaa rakenteluasi.

Projekti on avoimen lähdekoodin projektina [GitHubissa](https://github.com/fangjunyu1/SwiftSlim), ja sen voi ladata ja ottaa käyttöön ilmaiseksi. Lisäksi tarjolla on myös App Store -versio kokeiltavaksi.

Toivomme voivamme auttaa useampia ihmisiä, joilla ei ole teknistä taustaa mutta jotka haluavat muuttaa urapolkuaan. Ohjelmoinnin ja sovelluskehityksen kautta voi avautua uusia mahdollisuuksia.

## Sisällön päivitykset

Tämä opas on kirjoitettu nykyisen Swift- ja SwiftUI-version pohjalta.

Apple-alustojen ja työkalujen päivittyessä osa API-rajapinnoista voi muuttua. Jos huomaat ongelmia tai sisällön päivitystarpeita, voit tarkistaa uusimman tilanteen virallisesta dokumentaatiosta tai avoimen lähdekoodin varastosta.

---
Fang Junyu

2026-02-14
