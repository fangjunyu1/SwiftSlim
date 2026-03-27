# Simulatorയും Physical Deviceഉം

ഇതുവരെ നാം അടിസ്ഥാന views നിർമ്മിച്ചു കഴിഞ്ഞു. ഈ പാഠത്തിന്റെ പ്രധാന ഉള്ളടക്കം, App-നെ simulator-ലും യഥാർത്ഥ ഉപകരണത്തിലും (`Physical Device`) എങ്ങനെ run ചെയ്യാമെന്നതാണ്.

ആദ്യമായി iPhone-ലേക്ക് App install ചെയ്തപ്പോൾ എനിക്ക് വളരെ സന്തോഷം തോന്നിയിരുന്നു, കാരണം എന്റെ development ഫലം കൂടുതൽ നേരിട്ട് കാണാൻ കഴിഞ്ഞു. ഇത് ഒരു positive feedback ആണ്. നാം സ്വന്തമായി വികസിപ്പിച്ച App ഉപയോഗിക്കാൻ കഴിയുമ്പോൾ, അതിനുള്ള താൽപര്യം നമ്മെ കൂടുതൽ അറിവുകൾ സ്വയം പഠിക്കാൻ പ്രേരിപ്പിക്കും.

ഇപ്പോൾ മുൻ പാഠത്തിൽ പൂർത്തിയാക്കിയ personal resume project തുറന്ന് simulator, physical device എന്നിവയിൽ run ചെയ്യാൻ തയ്യാറാകൂ.

## Simulator

Xcode-ൽ വിവിധ models-ഉം versions-ഉം ഉൾക്കൊള്ളുന്ന നിരവധി simulators built-in ആയി ലഭ്യമാണ്. iPhone, iPad, Apple Watch തുടങ്ങിയ ഉപകരണങ്ങളെ simulator വഴി പരീക്ഷിക്കാം. വിവിധ model-ുകളിലും version-ുകളിലും App-ന്റെ layout എങ്ങനെ വ്യത്യസ്തമാകുന്നു എന്ന് പരിശോധിക്കാൻ simulator സഹായിക്കും.

### Simulator തിരഞ്ഞെടുക്കുക

Xcode മുകളിലെ toolbar-ൽ device list-യിൽ നിന്ന് ഒരു simulator തിരഞ്ഞെടുക്കുക (ഉദാഹരണത്തിന് `iPhone 16`).

![Swift](../../RESOURCE/005_xcode.png)

### Simulator run ചെയ്യുക

ശേഷം മുകളിലെ ഇടത് വശത്തിലെ run button അമർത്തുക.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project build ചെയ്ത് simulator സ്വയം launch ചെയ്യും.

![Swift](../../RESOURCE/005_xcode2.png)

### Simulator അടയ്ക്കുക

Simulator അടയ്ക്കേണ്ടതുണ്ടെങ്കിൽ Xcode toolbar-ലുള്ള stop button അമർത്തുക.

![Swift](../../RESOURCE/005_xcode3.png)

അല്ലെങ്കിൽ simulator നേരിട്ട് close ചെയ്യാം:

![Swift](../../RESOURCE/005_xcode17.png)

Simulator നേരിട്ട് close ചെയ്താൽ Xcode ചിലപ്പോൾ ഇങ്ങനെ prompt കാണിക്കും:

```
Thread 1: signal SIGTERM
```

ഇത് സാധാരണയായി program logic error അല്ല; debugging process പുറത്തുനിന്ന് terminate ചെയ്തതിനാലാണ്. പൊതുവെ ഇത് അവഗണിക്കാം; ഇത് App logic-ന്റെ പ്രശ്നമല്ല.

Xcode preview-നെ അപേക്ഷിച്ച് simulator കൂടുതൽ real execution environment-നോട് അടുത്തതാണ്. എങ്കിലും അത് ഇപ്പോഴും ഒരു പൂർണ്ണ device environment അല്ല. Layout verification, multi-device adaptation test എന്നിവയ്ക്കാണ് ഇത് അനുയോജ്യം.

## Test environment-ുകളുടെ priority

യഥാർത്ഥ development process-ൽ താഴെ പറയുന്ന test order പാലിക്കണം:

Physical Device > Simulator > Xcode Preview

Preview UI വേഗത്തിൽ adjust ചെയ്യാൻ അനുയോജ്യം; simulator structural tests-ന് അനുയോജ്യം; അന്തിമ പരിശോധന physical device-ലായിരിക്കണം, പ്രത്യേകിച്ച് iCloud പോലുള്ള features-ക്കായി.

## Physical Device

Xcode previewയും simulatorഉം ചിലപ്പോൾ കൃത്യമായ display നൽകാതിരിക്കാം; അതിനാൽ physical device-ന് നിർണായകമായ പ്രാധാന്യമുണ്ട്. System permissions, performance, notification mechanisms പോലുള്ള പെരുമാറ്റങ്ങൾ പൂർണ്ണമായി പരിശോധിക്കാൻ physical device ആവശ്യമാണ്.

### Developer Mode തുറക്കുക

iPhone-ൽ:

Settings → Privacy & Security → Developer Mode → Turn On

![Swift](../../RESOURCE/005_xcode4.png)

System device force restart ചെയ്യും. Developer Mode enable ചെയ്തിട്ടില്ലെങ്കിൽ debug run ചെയ്യാൻ കഴിയില്ല.

### Developer Team configure ചെയ്യുക

Xcode-ൽ developer team configure ചെയ്തിരിക്കണം; അല്ലെങ്കിൽ app sign ചെയ്ത് install ചെയ്യാൻ കഴിയില്ല.

Configuration വഴി:

Project Name → TARGETS → Signing & Capabilities → Team

`"Add Account..."` എന്ന് കാണുന്നുവെങ്കിൽ Apple account ഇതുവരെ ചേർത്തിട്ടില്ല എന്നർത്ഥം.

![Swift](../../RESOURCE/005_xcode5.png)

Add button click ചെയ്ത് Apple ID ഉപയോഗിച്ച് login ചെയ്യുക.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID login ചെയ്ത ശേഷം അനുയോജ്യമായ account തിരഞ്ഞെടുക്കി developer team configuration പൂർത്തിയാക്കുക.

![Swift](../../RESOURCE/005_xcode7.png)

### Device connect ചെയ്യുക

ഒരു cable ഉപയോഗിച്ച് iPhone-നെയും Mac-നെയും connect ചെയ്യുക.

ആദ്യമായുള്ള connection-ൽ:

- Mac നിങ്ങളോട് ഈ iPhone-നെ ഈ Mac-ലേക്ക് connect ചെയ്യണോ എന്ന് ചോദിക്കും
- iPhone ഈ computer-നെ trust ചെയ്യണോ എന്ന് ചോദിക്കും

iPhone-ൽ നിർബന്ധമായും “Trust” അമർത്തി lock screen password നൽകണം. തുടർന്ന് Xcode device list-ൽ നിങ്ങളുടെ iPhone തിരഞ്ഞെടുക്കുക.

![Swift](../../RESOURCE/005_xcode9.png)

മുകളിലെ ഇടത് വശത്തെ run button click ചെയ്യുക.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode App build ചെയ്ത് iPhone-ലേക്ക് install ചെയ്യും.

![Swift](../../RESOURCE/005_view.png)

**Wireless debugging**

iOS 11നും അതിനു ശേഷമുള്ള versions-നും Xcode wireless debugging പിന്തുണയ്ക്കുന്നു.

![Swift](../../RESOURCE/005_xcode18.png)

ആവശ്യമായ വ്യവസ്ഥകൾ:

1. iPhone ഉം Mac ഉം ആദ്യ pairing data cable ഉപയോഗിച്ച് തന്നെ പൂർത്തിയാക്കണം
2. iPhone ഉം Mac ഉം ഒരേ Wi‑Fi network-ലായിരിക്കണം
3. രണ്ട് devices-ും unlocked ആയിരിക്കണം

ആദ്യ pairing cable വഴി പൂർത്തിയായ ശേഷം, പിന്നീട് cable എടുത്തുകളഞ്ഞാലും ഒരേ network-ൽ ഇരുന്നാൽ നേരിട്ട് run ചെയ്യാം.

ശ്രദ്ധിക്കേണ്ട കാര്യങ്ങൾ:

- Device list-ൽ device കാണുന്നില്ലെങ്കിൽ cable വീണ്ടും connect ചെയ്യുക
- Wi‑Fi debugging ചിലപ്പോൾ സ്ഥിരതയില്ലാതെ പോകാം; connection error വന്നാൽ വീണ്ടും cable plug ചെയ്യാം
- Company network അല്ലെങ്കിൽ isolated network സാഹചര്യങ്ങളിൽ ഇത് നിയന്ത്രിക്കപ്പെട്ടിരിക്കാം

## പൊതുവായ errorsഉം പരിഹാരങ്ങളും

Xcode വഴി iPhone connect ചെയ്ത് debug ചെയ്യുമ്പോൾ പലതരം errors ഉണ്ടാകാം. താഴെ ചില സാധാരണ പ്രശ്നങ്ങളും അവയ്ക്കുള്ള പരിഹാരങ്ങളും കൊടുക്കുന്നു; connection പ്രശ്നങ്ങൾ വേഗത്തിൽ കണ്ടെത്താൻ ഇത് സഹായിക്കും.

**1. Pairing പൂർത്തിയായിട്ടില്ല**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

ഇതിന്റെ അർത്ഥം Xcode-നും iPhone-നും ഇടയിലെ debug pairing ഇനിയും പൂർത്തിയായിട്ടില്ല.

പരിഹാരം: iPhone-ൽ `"Trust"` click ചെയ്തിട്ടുണ്ടെന്ന് ഉറപ്പാക്കുക. ഇനിയും error ഉണ്ടെങ്കിൽ Xcode restart ചെയ്ത് വീണ്ടും connect ചെയ്യുക.

**2. Developer team configure ചെയ്തിട്ടില്ല**

```
Signing for "SwiftSlimTest" requires a development team.
```

Developer team configure ചെയ്തിട്ടില്ലായിരിക്കാം.

പരിഹാരം: `Signing & Capabilities`-ൽ login ചെയ്ത account തിരഞ്ഞെടുക്കുക.

**3. Developer Disk Image mount ചെയ്യാനായില്ല**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

ഇത് സാധാരണയായി installation process ഇടയിൽ തന്നെ interrupt ചെയ്തപ്പോൾ (ഉദാ: cable നീക്കം ചെയ്യുക, force stop ചെയ്യുക) വീണ്ടും install ചെയ്യുമ്പോൾ സംഭവിക്കുന്ന error ആണ്.

പരിഹാരം: iPhone restart ചെയ്ത് cable വീണ്ടും connect ചെയ്യുക.

**4. Debug tunnel connection പരാജയം**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

VPN അല്ലെങ്കിൽ network proxy ഇടപെടുമ്പോൾ ഈ error സാധാരണമാണ്.

പരിഹാരം: VPN അല്ലെങ്കിൽ network proxy disable ചെയ്ത് വീണ്ടും ശ്രമിക്കുക.

**5. Device unlock ചെയ്തിട്ടില്ല**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Device lock screen നിലയിലാണ്; iPhone unlock ചെയ്താൽ മതി.

**6. Device register ചെയ്തിട്ടില്ല**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

ഇത് device developer account-ന്റെ device list-ലില്ലെന്നതാണ് സൂചിപ്പിക്കുന്നത്. അതിനാൽ Xcode-ന് അതിന് വേണ്ടി നിയമാനുസൃത provisioning profile സൃഷ്ടിച്ച് app sign ചെയ്ത് install ചെയ്യാൻ കഴിയില്ല.

പരിഹാരം: `"Register Device"` click ചെയ്ത് automatic registration പൂർത്തിയാക്കുക.

**7. Deployment version mismatch**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

ഇത് device system version project-ന്റെ minimum deployment target-നെക്കാൾ താഴെയാണെന്ന് സൂചിപ്പിക്കുന്നു.

മാറ്റേണ്ട വഴി:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Version device system version-നെക്കാൾ കൂടുതലാകാത്ത വിധം കുറയ്ക്കുക.

മാറ്റത്തിന് ശേഷം build folder clean ചെയ്യുക:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Clean ചെയ്ത ശേഷം വീണ്ടും run ചെയ്യുക.
