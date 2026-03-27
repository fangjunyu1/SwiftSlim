# Simulator અને Physical Device

હમણાં સુધી આપણે મૂળભૂત views ની રચના પૂર્ણ કરી છે. આ પાઠનો મુખ્ય વિષય એ છે કે App ને simulator અને physical device પર કેવી રીતે ચલાવવી.

મને હજી પણ યાદ છે કે પહેલી વખત જ્યારે મેં App ને iPhone પર install કરી હતી ત્યારે હું બહુ ખુશ થયો હતો, કારણ કે હું મારા વિકાસનું પરિણામ વધુ સીધું જોઈ શકતો હતો. આ એક સકારાત્મક feedback છે. જ્યારે આપણે પોતાની બનાવેલી App નો ઉપયોગ કરી શકીએ, ત્યારે રસ આપણને વધુ જ્ઞાન શીખવા માટે પ્રેરિત કરે છે.

હવે કૃપા કરીને પહેલા પાઠમાં બનાવેલું વ્યક્તિગત રિઝ્યૂમે પ્રોજેક્ટ ખોલો અને simulator તથા physical device પર ચલાવવા માટે તૈયાર થાઓ.

## Simulator

Xcode માં અનેક પ્રકારના simulators સામેલ છે, જેમાં અલગ અલગ iPhone, iPad અને Apple Watch મોડલ્સ આવરે છે. Simulator દ્વારા App ના layout માં મોડલ અથવા version મુજબના ફેરફારો ચકાસી શકાય છે.

### Simulator પસંદ કરવો

Xcode ની ઉપરની toolbar માં આવેલા device list માંથી એક simulator પસંદ કરો, જેમ કે `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Simulator ચલાવવો

પછી ઉપર ડાબી બાજુના Run બટન પર ક્લિક કરો.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode આપમેળે પ્રોજેક્ટ build કરશે અને simulator શરૂ કરશે.

![Swift](../../RESOURCE/005_xcode2.png)

### Simulator બંધ કરવો

જો simulator બંધ કરવો હોય, તો Xcode toolbar માંના Stop બટન પર ક્લિક કરો.

![Swift](../../RESOURCE/005_xcode3.png)

તમે સીધું simulator પણ બંધ કરી શકો છો:

![Swift](../../RESOURCE/005_xcode17.png)

જો simulator સીધું બંધ કરો, તો Xcode કદાચ આ રીતે સૂચના બતાવે:

```
Thread 1: signal SIGTERM
```

આ સામાન્ય રીતે program logic error નથી, પરંતુ debug process બહારથી બંધ થતાં આવતી સૂચના છે. સામાન્ય રીતે તેને અવગણી શકાય છે.

Xcode preview ની સરખામણીએ simulator વધુ વાસ્તવિક runtime environment જેવો છે. છતાં પણ તે સંપૂર્ણ physical device environment નથી. તે layout validation અને multiple device adaptation testing માટે યોગ્ય છે.

## Testing environment ની priority

વાસ્તવિક development workflow માં સામાન્ય રીતે આ ક્રમ અનુસરવો જોઈએ:

physical device > simulator > Xcode preview

Preview ઝડપી UI adjustment માટે યોગ્ય છે; simulator structural testing માટે યોગ્ય છે; અંતિમ validation હંમેશા physical device પર જ કરવી જોઈએ, ખાસ કરીને iCloud સંબંધિત કાર્યો માટે.

## Physical device

Xcode preview અને simulator બન્નેમાં display અસચોટ હોઈ શકે છે, તેથી physical device નિર્ણાયક મહત્વ ધરાવે છે. System permissions, performance, notifications જેવી બાબતો ફક્ત physical device પર સંપૂર્ણ રીતે validate કરી શકાય છે.

### Developer Mode ચાલુ કરવો

iPhone માં:

Settings → Privacy & Security → Developer Mode → Enable

![Swift](../../RESOURCE/005_xcode4.png)

System ઉપકરણને force restart કરશે. Developer Mode ચાલુ ન હોય તો debugging ચલાવી શકાશે નહીં.

### Developer Team configure કરવી

Xcode માં developer team configure કરવી ફરજિયાત છે, નહિતર app ને sign કરીને install કરી શકાશે નહીં.

Configuration path:

Project Name → TARGETS → Signing & Capabilities → Team

જો `"Add Account..."` દેખાય, તો તેનો અર્થ છે કે હજી Apple account ઉમેરાયેલો નથી.

![Swift](../../RESOURCE/005_xcode5.png)

Add બટન પર ક્લિક કરીને Apple ID થી login કરો.

![Swift](../../RESOURCE/005_xcode6.png)

Login થયા પછી સંબંધિત account પસંદ કરીને developer team configuration પૂર્ણ કરો.

![Swift](../../RESOURCE/005_xcode7.png)

### Device જોડવું

કેબલ વડે iPhone ને Mac સાથે જોડો.

પહેલી વખત જોડાણ સમયે:

- Mac પૂછશે કે iPhone ને આ Mac સાથે જોડવું છે કે નહીં
- iPhone પૂછશે કે આ computer પર trust કરવું છે કે નહીં

iPhone પર “Trust” પસંદ કરો અને lock-screen password દાખલ કરો. ત્યારબાદ Xcode device list માંથી તમારું iPhone પસંદ કરો.

![Swift](../../RESOURCE/005_xcode9.png)

પછી ઉપર ડાબી બાજુના Run બટન પર ક્લિક કરો.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode App build કરીને iPhone પર install કરશે.

![Swift](../../RESOURCE/005_view.png)

**Wireless debugging**

iOS 11 અને ત્યાર પછીની આવૃત્તિઓમાં Xcode wireless debugging ને support કરે છે.

![Swift](../../RESOURCE/005_xcode18.png)

પૂર્વશરતો:

1. iPhone અને Mac ને પહેલીવાર data cable વડે pair કરવું જ પડશે
2. iPhone અને Mac એ જ Wi-Fi network માં હોવા જોઈએ
3. બન્ને devices unlocked હોવા જોઈએ

એકવાર પહેલી pairing cable વડે થઈ જાય, પછી cable કાઢી નાખ્યા પછી પણ, જો એ જ network માં હોવ, તો સીધી App ચલાવી શકાય છે.

નોંધ:

- જો device list માં device ન દેખાય, તો ફરી cable જોડો
- Wi-Fi debugging ક્યારેક અસ્થિર હોઈ શકે છે; connection સમસ્યા થાય તો ફરી cable જોડો
- corporate network અથવા isolated network પર આ સુવિધા મર્યાદિત હોઈ શકે છે

## સામાન્ય ભૂલો અને ઉકેલ

જ્યારે Xcode મારફતે iPhone સાથે debugging થાય છે, ત્યારે વિવિધ પ્રકારની error messages મળી શકે છે. નીચે કેટલીક સામાન્ય સમસ્યાઓ અને તેમના ઉકેલો આપેલા છે, જે connection સમસ્યા ઝડપથી ઓળખવામાં મદદ કરે છે.

**1. Pairing પૂર્ણ નથી થયું**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

આનો અર્થ છે કે Xcode અને iPhone વચ્ચેનું debug pairing હજી પૂર્ણ નથી થયું.

ઉકેલ: ખાતરી કરો કે iPhone પર “Trust” દબાવવામાં આવ્યું છે. જો error ચાલુ રહે, તો Xcode restart કરીને ફરી જોડાવો.

**2. Developer team configure નથી થઈ**

```
Signing for "SwiftSlimTest" requires a development team.
```

કદાચ developer team configure કરેલી નથી.

ઉકેલ: `Signing & Capabilities` માં login કરેલો account પસંદ કરો.

**3. Developer Disk Image mount ન થઈ શક્યો**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

આ સામાન્ય રીતે installation દરમિયાન interruption (જેમ કે cable કાઢી દેવી અથવા force stop કરવું) ના કારણે થાય છે.

ઉકેલ: iPhone restart કરો અને ફરી cable જોડો.

**4. Debug tunnel connection નિષ્ફળ**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

આ error ઘણીવાર VPN અથવા network proxy ના વિઘ્નને કારણે આવે છે.

ઉકેલ: VPN અથવા proxy બંધ કરીને ફરી પ્રયાસ કરો.

**5. Device unlock નથી**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Device lock સ્થિતિમાં છે; iPhone unlock કરો.

**6. Device register નથી**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

તેનો અર્થ છે કે device developer account ની device list માં ઉમેરાયેલો નથી, તેથી Xcode તેના માટે યોગ્ય provisioning profile બનાવી શકતું નથી અને app sign/install કરી શકતું નથી.

ઉકેલ: `"Register Device"` પર ક્લિક કરો; device આપમેળે register થઈ જશે.

**7. Deployment version mismatch**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

આનો અર્થ છે કે device નો system version પ્રોજેક્ટના minimum deployment version કરતાં નીચો છે.

બદલવાનો માર્ગ:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Version ને device ના system version કરતાં વધુ ન રહે તે રીતે બદલો.

બદલ્યા પછી build folder clean કરો:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Clean થયા પછી App ફરી ચલાવો.
