# ਸਿਮੂਲੇਟਰ ਅਤੇ ਅਸਲੀ ਡਿਵਾਈਸ

ਹੁਣ ਤੱਕ, ਅਸੀਂ ਬੁਨਿਆਦੀ view ਬਣਾਉਣ ਦਾ ਕੰਮ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ। ਇਸ ਪਾਠ ਦਾ ਮੁੱਖ ਵਿਸ਼ਾ ਇਹ ਹੈ ਕਿ App ਨੂੰ simulator ਅਤੇ ਅਸਲੀ ਡਿਵਾਈਸ (Physical Device) 'ਤੇ ਕਿਵੇਂ ਚਲਾਇਆ ਜਾਵੇ।

ਮੈਨੂੰ ਅਜੇ ਵੀ ਯਾਦ ਹੈ ਜਦੋਂ ਮੈਂ ਪਹਿਲੀ ਵਾਰ ਇੱਕ App ਨੂੰ iPhone 'ਤੇ install ਕੀਤਾ ਸੀ, ਮੈਂ ਬਹੁਤ ਖੁਸ਼ ਹੋਇਆ ਸੀ, ਕਿਉਂਕਿ ਮੈਂ ਆਪਣੇ development ਦੇ ਨਤੀਜੇ ਨੂੰ ਹੋਰ ਸਿੱਧੇ ਤਰੀਕੇ ਨਾਲ ਦੇਖ ਸਕਦਾ ਸੀ। ਇਹ ਇੱਕ positive feedback ਸੀ। ਜਦੋਂ ਅਸੀਂ ਆਪਣੀ ਬਣਾਈ ਹੋਈ App ਨੂੰ ਖੁਦ ਵਰਤ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਦਿਲਚਸਪੀ ਸਾਨੂੰ ਆਪਣੇ ਆਪ ਹੋਰ ਗਿਆਨ ਸਿੱਖਣ ਵੱਲ ਧੱਕਦੀ ਹੈ।

ਹੁਣ, ਕਿਰਪਾ ਕਰਕੇ ਪਿਛਲੇ ਪਾਠ ਵਿੱਚ ਪੂਰਾ ਕੀਤਾ ਗਿਆ personal resume project ਖੋਲ੍ਹੋ, ਅਤੇ simulator ਅਤੇ ਅਸਲੀ ਡਿਵਾਈਸ 'ਤੇ ਚਲਾਉਣ ਲਈ ਤਿਆਰ ਹੋ ਜਾਓ।

## ਸਿਮੂਲੇਟਰ

Xcode ਵਿੱਚ ਕਈ ਕਿਸਮਾਂ ਦੇ built-in simulators ਹੁੰਦੇ ਹਨ, ਜਿਨ੍ਹਾਂ ਵਿੱਚ ਵੱਖ-ਵੱਖ ਮਾਡਲਾਂ ਦੇ iPhone, iPad ਅਤੇ Apple Watch ਸ਼ਾਮਲ ਹਨ। Simulator ਦੀ ਮਦਦ ਨਾਲ ਵੱਖ-ਵੱਖ ਮਾਡਲਾਂ ਜਾਂ ਵਰਜਨਾਂ 'ਤੇ App ਦੇ interface layout ਦੇ ਫ਼ਰਕ ਦੀ ਜਾਂਚ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ।

### ਸਿਮੂਲੇਟਰ ਚੁਣਨਾ

Xcode ਦੇ ਉੱਪਰਲੇ toolbar ਵਿੱਚ device list ਵਿੱਚੋਂ ਇੱਕ simulator ਚੁਣੋ (ਉਦਾਹਰਨ ਲਈ iPhone 16)।

![Swift](../../RESOURCE/005_xcode.png)

### ਸਿਮੂਲੇਟਰ ਚਲਾਉਣਾ

ਫਿਰ ਖੱਬੇ ਉੱਪਰਲੇ ਕੋਨੇ ਵਿੱਚ run button 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode ਆਪਣੇ ਆਪ project ਨੂੰ build ਕਰੇਗਾ ਅਤੇ simulator ਨੂੰ launch ਕਰੇਗਾ।

![Swift](../../RESOURCE/005_xcode2.png)

### ਸਿਮੂਲੇਟਰ ਬੰਦ ਕਰਨਾ

ਜੇ simulator ਬੰਦ ਕਰਨਾ ਹੋਵੇ, ਤਾਂ Xcode toolbar ਵਿੱਚ stop button 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

![Swift](../../RESOURCE/005_xcode3.png)

ਤੁਸੀਂ simulator ਨੂੰ ਸਿੱਧਾ ਬੰਦ ਵੀ ਕਰ ਸਕਦੇ ਹੋ：

![Swift](../../RESOURCE/005_xcode17.png)

ਜੇ ਤੁਸੀਂ simulator ਨੂੰ ਸਿੱਧਾ ਬੰਦ ਕਰਦੇ ਹੋ, ਤਾਂ Xcode ਇਹ ਸੁਨੇਹਾ ਦਿਖਾ ਸਕਦਾ ਹੈ：

``` id="3iv58m"
Thread 1: signal SIGTERM
````

ਇਹ ਆਮ ਤੌਰ 'ਤੇ program logic ਦੀ ਗਲਤੀ ਨਹੀਂ ਹੁੰਦੀ, ਸਗੋਂ ਇਸ ਲਈ ਹੁੰਦੀ ਹੈ ਕਿ debug process ਨੂੰ ਬਾਹਰੋਂ terminate ਕੀਤਾ ਗਿਆ ਹੈ। ਆਮ ਤੌਰ 'ਤੇ ਇਸਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ; ਇਹ App logic error ਨਹੀਂ ਹੁੰਦੀ।

Xcode preview ਨਾਲੋਂ simulator ਅਸਲੀ runtime environment ਦੇ ਹੋਰ ਨੇੜੇ ਹੁੰਦਾ ਹੈ। ਪਰ ਇਹ ਫਿਰ ਵੀ ਪੂਰਾ real-device environment ਨਹੀਂ ਹੁੰਦਾ। ਇਹ layout verification ਅਤੇ multiple-device adaptation testing ਲਈ ਉਚਿਤ ਹੈ।

## ਟੈਸਟਿੰਗ environment ਦੀ priority ਬਾਰੇ

ਅਸਲ development workflow ਵਿੱਚ, ਹੇਠਾਂ ਦਿੱਤਾ testing order ਅਪਣਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ：

ਅਸਲੀ ਡਿਵਾਈਸ > Simulator > Xcode Preview

Preview ਤੇਜ਼ੀ ਨਾਲ UI adjust ਕਰਨ ਲਈ ਢੁੱਕਵੀਂ ਹੈ; simulator structure-level testing ਲਈ ਢੁੱਕਵਾਂ ਹੈ; ਅਤੇ final verification ਲਾਜ਼ਮੀ ਤੌਰ 'ਤੇ ਅਸਲੀ ਡਿਵਾਈਸ 'ਤੇ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ, ਖਾਸ ਕਰਕੇ iCloud-ਸੰਬੰਧਤ operations ਲਈ।

## ਅਸਲੀ ਡਿਵਾਈਸ

Xcode preview ਅਤੇ simulator ਦੋਵੇਂ ਵਿੱਚ display inaccuracies ਹੋ ਸਕਦੀਆਂ ਹਨ, ਇਸ ਲਈ ਅਸਲੀ ਡਿਵਾਈਸ ਦੀ ਮਹੱਤਤਾ ਨਿਰਣਾਇਕ ਹੁੰਦੀ ਹੈ। System permissions, performance, notification mechanism ਅਤੇ ਹੋਰ ਵਰਤਾਰਿਆਂ ਦੀ ਪੂਰੀ ਜਾਂਚ ਸਿਰਫ਼ ਅਸਲੀ ਡਿਵਾਈਸ 'ਤੇ ਹੀ ਹੋ ਸਕਦੀ ਹੈ।

### Developer Mode ਚਾਲੂ ਕਰਨਾ

iPhone ਵਿੱਚ：

`Settings` → `Privacy & Security` → `Developer Mode` → `On`

![Swift](../../RESOURCE/005_xcode4.png)

System ਜ਼ਬਰਦਸਤੀ device ਨੂੰ restart ਕਰੇਗਾ। ਜੇ Developer Mode ਚਾਲੂ ਨਾ ਹੋਵੇ, ਤਾਂ debugging run ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕੇਗਾ।

### Developer Team configure ਕਰਨਾ

Xcode ਵਿੱਚ developer team configure ਹੋਣੀ ਲਾਜ਼ਮੀ ਹੈ, ਨਹੀਂ ਤਾਂ app ਨੂੰ sign ਕਰਕੇ install ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕੇਗਾ।

Configuration ਦਾ ਰਸਤਾ：

Project Name → TARGETS → Signing & Capabilities → Team

ਜੇ "Add Account..." ਦਿਖਾਈ ਦੇਵੇ, ਤਾਂ ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ Apple account ਹਾਲੇ ਜੋੜਿਆ ਨਹੀਂ ਗਿਆ।

![Swift](../../RESOURCE/005_xcode5.png)

Add button 'ਤੇ ਕਲਿੱਕ ਕਰੋ, ਅਤੇ Apple ID ਨਾਲ sign in ਕਰੋ।

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID ਨਾਲ login ਕਰਨ ਤੋਂ ਬਾਅਦ, ਸੰਬੰਧਿਤ account ਚੁਣੋ ਅਤੇ developer team configuration ਪੂਰੀ ਕਰੋ।

![Swift](../../RESOURCE/005_xcode7.png)

### ਡਿਵਾਈਸ ਜੋੜਨਾ

Data cable ਦੀ ਮਦਦ ਨਾਲ iPhone ਅਤੇ Mac ਨੂੰ connect ਕਰੋ।

ਪਹਿਲੀ ਵਾਰ connect ਕਰਨ ਵੇਲੇ：

* Mac ਪੁੱਛੇਗਾ ਕਿ ਕੀ iPhone ਨੂੰ ਇਸ Mac ਨਾਲ ਜੋੜਨਾ ਹੈ
* iPhone ਪੁੱਛੇਗਾ ਕਿ ਕੀ ਇਸ computer 'ਤੇ trust ਕਰਨਾ ਹੈ।

ਤੁਹਾਨੂੰ iPhone 'ਤੇ “Trust” 'ਤੇ ਕਲਿੱਕ ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੈ ਅਤੇ screen lock password ਦਰਜ ਕਰਨਾ ਪਵੇਗਾ। ਇਸ ਤੋਂ ਬਾਅਦ, Xcode ਦੀ device list ਵਿੱਚ ਆਪਣਾ iPhone ਚੁਣੋ।

![Swift](../../RESOURCE/005_xcode9.png)

ਖੱਬੇ ਉੱਪਰਲੇ ਕੋਨੇ ਵਿੱਚ run button 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project ਨੂੰ build ਕਰੇਗਾ ਅਤੇ App ਨੂੰ iPhone 'ਤੇ install ਕਰੇਗਾ।

![Swift](../../RESOURCE/005_view.png)

**Wireless Debugging**

iOS 11 ਅਤੇ ਇਸ ਤੋਂ ਬਾਅਦ ਦੇ ਵਰਜਨਾਂ ਵਿੱਚ, Xcode wireless debugging ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ।

![Swift](../../RESOURCE/005_xcode18.png)

ਪਹਿਲਾਂ ਤੋਂ ਲੋੜੀਂਦੀਆਂ ਸ਼ਰਤਾਂ：

1. iPhone ਅਤੇ Mac ਦੀ ਪਹਿਲੀ pairing data cable ਨਾਲ ਹੀ ਪੂਰੀ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ
2. iPhone ਅਤੇ Mac ਇੱਕੋ Wi-Fi network 'ਤੇ ਹੋਣ
3. ਦੋਵੇਂ devices unlocked ਹੋਣ

ਜਦੋਂ ਪਹਿਲੀ pairing cable ਨਾਲ ਪੂਰੀ ਹੋ ਜਾਵੇ, ਤਾਂ ਬਾਅਦ ਵਿੱਚ cable ਹਟਾਉਣ ਤੋਂ ਬਾਅਦ ਵੀ, ਜੇ ਦੋਵੇਂ ਇੱਕੋ network environment ਵਿੱਚ ਹਨ, ਤਾਂ direct run ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

ਧਿਆਨ ਵਾਲੀਆਂ ਗੱਲਾਂ：

* ਜੇ device device list ਵਿੱਚ ਨਾ ਦਿਖੇ, ਤਾਂ cable ਦੁਬਾਰਾ ਜੋੜ ਕੇ connect ਕਰੋ
* Wi-Fi debugging ਕਦੇ-ਕਦੇ unstable ਹੁੰਦੀ ਹੈ; ਜੇ connection error ਆਏ, ਤਾਂ cable ਮੁੜ ਜੋੜੋ
* Company network ਜਾਂ isolated network environment ਵਿੱਚ ਇਸਨੂੰ ਸੀਮਿਤ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

## ਆਮ errors ਅਤੇ ਹੱਲ

ਜਦੋਂ Xcode ਨਾਲ iPhone ਨੂੰ debugging ਲਈ connect ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਵੱਖ-ਵੱਖ ਤਰ੍ਹਾਂ ਦੇ error messages ਆ ਸਕਦੇ ਹਨ। ਹੇਠਾਂ ਕੁਝ ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ ਦਿੱਤੇ ਗਏ ਹਨ, ਜੋ connection issue ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ locate ਅਤੇ solve ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਨਗੇ।

**1. Pairing ਪੂਰੀ ਨਹੀਂ ਹੋਈ**

```id="7ooxvq"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ Xcode ਅਤੇ iPhone ਵਿੱਚ debugging pairing ਹਾਲੇ ਪੂਰੀ ਨਹੀਂ ਹੋਈ।

ਹੱਲ：ਯਕੀਨੀ ਬਣਾਓ ਕਿ iPhone 'ਤੇ “Trust” ਦਬਾਇਆ ਗਿਆ ਹੈ। ਜੇ ਫਿਰ ਵੀ error ਆਉਂਦੀ ਹੈ, ਤਾਂ Xcode restart ਕਰਕੇ ਮੁੜ connect ਕਰੋ।

**2. Developer Team configure ਨਹੀਂ ਕੀਤੀ ਗਈ**

```id="lb7cgr"
Signing for "SwiftSlimTest" requires a development team.
```

ਇਹ ਸੰਭਵ ਹੈ ਕਿ developer team configure ਨਹੀਂ ਕੀਤੀ ਗਈ।

ਹੱਲ：Signing & Capabilities ਵਿੱਚ logged-in account ਚੁਣੋ।

**3. Developer Disk Image mount ਨਹੀਂ ਹੋ ਰਹੀ**

```id="dqqkhm"
Previous preparation error: The developer disk image could not be mounted on this device.
```

ਇਹ ਆਮ ਤੌਰ 'ਤੇ install process ਦੇ ਵਿਚਕਾਰ ਰੁਕਣ ਕਰਕੇ ਆਉਂਦੀ ਹੈ (ਜਿਵੇਂ cable ਕੱਢ ਦੇਣਾ ਜਾਂ force stop ਕਰ ਦੇਣਾ), ਜਿਸ ਨਾਲ ਦੁਬਾਰਾ install ਕਰਦੇ ਸਮੇਂ restriction ਆ ਜਾਂਦੀ ਹੈ ਅਤੇ error ਆਉਂਦੀ ਹੈ।

ਹੱਲ：iPhone restart ਕਰੋ ਅਤੇ cable ਮੁੜ ਜੋੜ ਕੇ connect ਕਰੋ।

**4. Debug tunnel connection ਫੇਲ ਹੋ ਗਿਆ**

```id="3cosnp"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

ਇਹ error ਆਮ ਤੌਰ 'ਤੇ VPN ਜਾਂ network proxy ਦੀ ਰੁਕਾਵਟ ਕਰਕੇ ਹੁੰਦੀ ਹੈ।

ਹੱਲ：VPN ਜਾਂ network proxy ਬੰਦ ਕਰਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।

**5. ਡਿਵਾਈਸ unlocked ਨਹੀਂ ਹੈ**

```id="8q2otp"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Device lock screen 'ਤੇ ਹੈ; iPhone unlock ਕਰਨਾ ਕਾਫ਼ੀ ਹੈ।

**6. ਡਿਵਾਈਸ register ਨਹੀਂ ਹੈ**

```id="tjwdj2"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਇਹ device developer account ਦੀ device list ਵਿੱਚ ਸ਼ਾਮਲ ਨਹੀਂ ਹੈ, ਇਸ ਲਈ Xcode ਇਸ ਲਈ ਇੱਕ valid provisioning profile generate ਨਹੀਂ ਕਰ ਸਕਦਾ, ਨਾ ਹੀ app ਨੂੰ sign ਅਤੇ install ਕਰ ਸਕਦਾ ਹੈ।

ਹੱਲ："Register Device" 'ਤੇ ਕਲਿੱਕ ਕਰੋ ਤਾਂ ਜੋ ਇਹ ਆਪਣੇ ਆਪ register ਹੋ ਜਾਵੇ।

**7. Deployment version match ਨਹੀਂ ਕਰਦੀ**

```id="67e0vf"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

ਇਸਦਾ ਅਰਥ ਹੈ ਕਿ device ਦਾ system version project ਦੇ minimum deployment version ਨਾਲੋਂ ਘੱਟ ਹੈ।

ਬਦਲਣ ਦਾ ਰਸਤਾ：

`TARGETS` → `General` → `Deployment Info` → `Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Version ਨੂੰ device ਦੇ system version ਤੋਂ ਵੱਧ ਨਾ ਰੱਖੋ।

ਬਦਲਣ ਤੋਂ ਬਾਅਦ, build folder ਨੂੰ clean ਕਰੋ：

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Clean ਹੋਣ ਤੋਂ ਬਾਅਦ ਦੁਬਾਰਾ run ਕਰੋ।
