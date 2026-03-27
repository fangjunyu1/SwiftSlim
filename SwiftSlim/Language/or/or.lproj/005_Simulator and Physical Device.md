# ସିମ୍ୟୁଲେଟର ଏବଂ ଭୌତିକ ଡିଭାଇସ୍

ଏପର୍ଯ୍ୟନ୍ତ, ଆମେ ମୌଳିକ view ତିଆରି କରିସାରିଛୁ। ଏହି ପାଠର ମୁଖ୍ୟ ବିଷୟ ହେଉଛି କିପରି simulator ଏବଂ physical device ଉପରେ App ଚଳାଇବାକୁ ଶିଖିବା।

ମୁଁ ଆଜିବି ମନେ ପକାଇପାରି ଯେ, ପ୍ରଥମ ଥର iPhone ଉପରେ App install କରିଥିଲି, ସେତେବେଳେ ମୁଁ ବହୁତ ଖୁସି ହୋଇଥିଲି, କାରଣ ମୁଁ ନିଜର development ଫଳାଫଳକୁ ଆଉ ଅଧିକ ସିଧାସଳଖ ଭାବରେ ଦେଖିପାରୁଥିଲି। ଏହା ଗୋଟିଏ positive feedback ଥିଲା। ଯେତେବେଳେ ଆମେ ନିଜେ ତିଆରି କରା App କୁ ବ୍ୟବହାର କରିପାରୁ, ସେତେବେଳେ ଆଗ୍ରହ ଆମକୁ ସ୍ୱୟଂପ୍ରେରିତ ଭାବରେ ଆଉ ଅଧିକ ଜ୍ଞାନ ଶିଖିବାକୁ ଆଗୁଆ କରେ।

ଏବେ, ଦୟାକରି ପୂର୍ବ ପାଠରେ ସମାପ୍ତ କରାଯାଇଥିବା ବ୍ୟକ୍ତିଗତ ରେଜ୍ୟୁମେ project ଖୋଲନ୍ତୁ, ଏବଂ simulator ଏବଂ physical device ଚଳାଇବା ପାଇଁ ପ୍ରସ୍ତୁତ ହେଉନ୍ତୁ।

## ସିମ୍ୟୁଲେଟର

Xcode ଭିତରେ ଅନେକ built-in simulator ରହିଛି, ଯେଉଁଥିରେ ବିଭିନ୍ନ model ର iPhone、iPad ଏବଂ Apple Watch ଅନ୍ତର୍ଭୁକ୍ତ ଅଛି। Simulator ଦ୍ୱାରା App ର interface layout ଭିନ୍ନ model କିମ୍ବା version ରେ କେମିତି ଦେଖାଯାଉଛି ତାହା ଯାଞ୍ଚ କରାଯାଇପାରେ।

### simulator ବାଛିବା

Xcode ର ଉପର toolbar ର device list ମଧ୍ୟରୁ ଗୋଟିଏ simulator ବାଛନ୍ତୁ（ଉଦାହରଣ ସ୍ୱରୂପ iPhone 16）。

![Swift](../../RESOURCE/005_xcode.png)

### simulator ଚଳାଇବା

ତାପରେ ଉପର ବାମପଟିର Run button କୁ କ୍ଲିକ୍ କରନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode ସ୍ୱୟଂଚାଳିତ ଭାବେ project କୁ build କରି simulator କୁ launch କରିଦେବ।

![Swift](../../RESOURCE/005_xcode2.png)

### simulator ବନ୍ଦ କରିବା

ଯଦି simulator ବନ୍ଦ କରିବା ଦରକାର ହୁଏ, Xcode toolbar ର Stop button କୁ କ୍ଲିକ୍ କରନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode3.png)

ଆପଣ simulator କୁ ସିଧାସଳଖ ବନ୍ଦ ମଧ୍ୟ କରିପାରିବେ:

![Swift](../../RESOURCE/005_xcode17.png)

ଯଦି simulator କୁ ସିଧାସଳଖ ବନ୍ଦ କରାଯାଏ, Xcode ଏହିପରି prompt ଦେଇପାରେ:

``` id="y511fw"
Thread 1: signal SIGTERM
````

ଏହା ସାଧାରଣତଃ program logic error ନୁହେଁ, ବରଂ debug process କୁ ବାହ୍ୟଭାବେ terminate କରାଯାଇଥିବାରୁ ଏହା ଘଟେ। ସାଧାରଣତଃ ଏହାକୁ ignore କରାଯାଇପାରେ, ଏହା App logic ର ଭୁଲ୍ ନୁହେଁ।

Xcode preview ସହିତ ତୁଳନା କଲେ, simulator ବାସ୍ତବ runtime environment ସହ ଅଧିକ ନିକଟ। କିନ୍ତୁ ଏହା ଆଜିବି ପୂରା ଡିଭାଇସ୍ ପରିବେଶ ନୁହେଁ। ଏହା layout verification ଏବଂ multi-device adaptation testing ପାଇଁ ଉପଯୋଗୀ।

## test environment ର priority ବିଷୟରେ

ବାସ୍ତବ development workflow ରେ, ନିମ୍ନଲିଖିତ test order ଅନୁସରଣ କରିବା ଉଚିତ:

physical device > simulator > Xcode preview

Preview ଶୀଘ୍ର UI adjustment ପାଇଁ ଉପଯୋଗୀ; simulator structure testing ପାଇଁ ଉପଯୋଗୀ; କିନ୍ତୁ final verification ନିଶ୍ଚୟ ଭାବରେ physical device ଉପରେ କରିବା ଉଚିତ, ବିଶେଷତଃ iCloud ସମ୍ପର୍କିତ କାର୍ଯ୍ୟଗୁଡିକ ପାଇଁ।

## ଭୌତିକ ଡିଭାଇସ୍

Xcode preview ଏବଂ simulator ଦୁହିଁରେ display ଅନିଶ୍ଚିତତା ଥାଇପାରେ, ସେହିପାଇଁ physical device ର ଯାଞ୍ଚ ନିର୍ଣ୍ଣାୟକ ଗୁରୁତ୍ୱର। ସିଷ୍ଟମ୍ permissions、performance、notification mechanism ଭଳି ବ୍ୟବହାରଗୁଡିକ କେବଳ physical device ରେ ପୂର୍ଣ୍ଣ ଭାବରେ verify କରାଯାଇପାରେ।

### Developer Mode ଚାଲୁ କରିବା

iPhone ଭିତରେ:

Settings → Privacy & Security → Developer Mode → Enable

![Swift](../../RESOURCE/005_xcode4.png)

System ଡିଭାଇସ୍ କୁ force restart କରିଦେବ। Developer Mode ଚାଲୁ ନଥାଇଲେ debug run କରିହେବ ନାହିଁ।

### developer team configure କରିବା

Xcode ରେ developer team configure ହେଇଥିବା ଆବଶ୍ୟକ, ନହେଲେ App କୁ sign କରି install କରିହେବ ନାହିଁ।

Configuration ପ୍ରକ୍ରିୟା:

Project Name → TARGETS → Signing & Capabilities → Team

ଯଦି "Add Account..." ଦେଖାଯାଏ, ତେବେ ଏଯାବତ୍ କୌଣସି Apple account add କରାଯାଇନାହିଁ ବୋଲି ଅର୍ଥ।

![Swift](../../RESOURCE/005_xcode5.png)

Add button କୁ କ୍ଲିକ୍ କରି Apple ID ରେ login କରନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID ରେ login କରିସାରିବା ପରେ, ସମ୍ବନ୍ଧିତ account ବାଛି developer team configuration ସମାପ୍ତ କରନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode7.png)

### ଡିଭାଇସ୍ ସଂଯୋଗ କରିବା

ଡାଟା କେବଲ୍ ବ୍ୟବହାର କରି iPhone ଏବଂ Mac କୁ ସଂଯୋଗ କରନ୍ତୁ।

ପ୍ରଥମଥର ସଂଯୋଗ ସମୟରେ:

* Mac ପଚାରିବ iPhone କୁ ଏହି Mac ସହିତ connect କରିବାକୁ ଚାହୁଁଛନ୍ତି କି
* iPhone ପଚାରିବ ଯେ ଏହି computer କୁ trust କରିବେ କି ନାହିଁ।

ନିଶ୍ଚୟ ଭାବେ iPhone ରେ “Trust” କୁ କ୍ଲିକ୍ କରନ୍ତୁ ଏବଂ lock screen password ପ୍ରବେଶ କରନ୍ତୁ। ତାପରେ, Xcode ର device list ରେ ଆପଣଙ୍କ iPhone ବାଛନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode9.png)

ତାପରେ ଉପର ବାମପଟିର Run button କୁ କ୍ଲିକ୍ କରନ୍ତୁ।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project କୁ build କରି App କୁ iPhone ଉପରେ install କରିଦେବ।

![Swift](../../RESOURCE/005_view.png)

**wireless debugging**

iOS 11 ଏବଂ ପରବର୍ତ୍ତୀ version ରୁ, Xcode wireless debugging କୁ support କରେ।

![Swift](../../RESOURCE/005_xcode18.png)

ପୂର୍ବଶର୍ତ୍ତ:

1. iPhone ଏବଂ Mac ପ୍ରଥମଥର pairing ନିଶ୍ଚୟ ଭାବେ data cable ଦ୍ୱାରା କରିବାକୁ ପଡିବ
2. iPhone ଏବଂ Mac ଏକେ Wi-Fi network ରେ ଥିବା ଉଚିତ
3. ଦୁଇଟି ଡିଭାଇସ୍ unlock ଅବସ୍ଥାରେ ରହିବା ଦରକାର

ପ୍ରଥମଥର cable ଦ୍ୱାରା pairing ସମାପ୍ତ ହେବା ପରେ, ପରବର୍ତ୍ତୀ ସମୟରେ cable ଖୋଲିଦିଆଯାଇଥିଲେ ମଧ୍ୟ, ଯଦି ସେମାନେ ଏକେ network ରେ ରହନ୍ତି, ସିଧାସଳଖ run କରିହେବ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ:

* ଯଦି device list ରେ ଡିଭାଇସ୍ ଦେଖାଯାଉନାହିଁ, ପୁଣିଥରେ cable plug in କରି connect କରନ୍ତୁ
* Wi-Fi debugging କେବେ କେବେ ଅସ୍ଥିର ହୋଇପାରେ; connection problem ହେଲେ ପୁଣିଥରେ cable ଲଗାଇଦିଲେ ହେବ
* company network କିମ୍ବା isolated network environment ରେ ଏହା ସୀମିତ ହୋଇପାରେ

## ସାଧାରଣ error ଏବଂ ସମାଧାନ

Xcode ଦ୍ୱାରା iPhone କୁ connect କରି debug କରୁଥିବାବେଳେ, ବିଭିନ୍ନ ପ୍ରକାର error message ଦେଖାଯାଇପାରେ। ନିମ୍ନରେ କିଛି ସାଧାରଣ ସମସ୍ୟା ଏବଂ ସମ୍ବନ୍ଧିତ ସମାଧାନ ଦିଆଯାଇଛି, ଯାହା ଦ୍ୱାରା connection issue କୁ ଦ୍ରୁତ ଭାବରେ locate କରି ଠିକ୍ କରାଯାଇପାରିବ।

**1. pairing ସମ୍ପୂର୍ଣ୍ଣ ହୋଇନାହିଁ**

```id="iu4pvb"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

ଏହାର ଅର୍ଥ ହେଉଛି Xcode ଏବଂ iPhone ମଧ୍ୟରେ debug pairing ଏଯାବତ୍ ସମାପ୍ତ ହୋଇନାହିଁ।

ସମାଧାନ: ନିଶ୍ଚିତ କରନ୍ତୁ iPhone ରେ “Trust” କୁ କ୍ଲିକ୍ କରାଯାଇଛି। ଯଦି ତଥାପି error ଆସୁଛି, Xcode restart କରି ପୁଣିଥରେ connect କରନ୍ତୁ।

**2. developer team configure ହୋଇନାହିଁ**

```id="oo45q0"
Signing for "SwiftSlimTest" requires a development team.
```

ଏହାର କାରଣ developer team configure ହୋଇନଥାଇପାରେ।

ସମାଧାନ: Signing & Capabilities ରେ login କରାଯାଇଥିବା account ବାଛନ୍ତୁ।

**3. Developer Disk Image mount ହୋଇପାରୁନାହିଁ**

```id="tdcxws"
Previous preparation error: The developer disk image could not be mounted on this device.
```

ଏହା ସାଧାରଣତଃ install ପ୍ରକ୍ରିୟା ମଧ୍ୟରେ ବିଚ୍ଛିନ୍ନ ହେଲେ（ଉଦାହରଣ ସ୍ୱରୂପ cable ଖୋଲିଯିବା କିମ୍ବା force stop）ଘଟେ, ଯାହାର ଫଳରେ ପୁଣିଥରେ install କରିବା ବେଳେ restriction ହୋଇ error ଆସେ।

ସମାଧାନ: iPhone କୁ restart କରନ୍ତୁ, ଏବଂ ପୁଣିଥରେ cable ଲଗାଇ connect କରନ୍ତୁ।

**4. debug tunnel connection fail**

```id="pd3vog"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

ଏହି error ସାଧାରଣତଃ VPN କିମ୍ବା network proxy ର ବାଧାରୁ ଘଟେ।

ସମାଧାନ: VPN କିମ୍ବା network proxy ବନ୍ଦ କରି ପୁଣିଥରେ ଚେଷ୍ଟା କରନ୍ତୁ।

**5. ଡିଭାଇସ୍ unlock ହୋଇନାହିଁ**

```id="6dxncz"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

ଡିଭାଇସ୍ lock screen ଅବସ୍ଥାରେ ଅଛି। iPhone unlock କରିଦେଲେ ହେବ।

**6. ଡିଭାଇସ୍ register ହୋଇନାହିଁ**

```id="5h4a7o"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

ଏହାର ଅର୍ଥ ହେଉଛି ଏହି ଡିଭାଇସ୍ developer account ର device list ଭିତରେ ଯୋଡାଯାଇନାହିଁ, ସେହିପାଇଁ Xcode ଏହା ପାଇଁ ଗୋଟିଏ ବୈଧ provisioning profile generate କରି App କୁ sign ଏବଂ install କରିପାରୁନାହିଁ।

ସମାଧାନ: "Register Device" କୁ କ୍ଲିକ୍ କରି ସ୍ୱୟଂଚାଳିତ ଭାବେ register କରନ୍ତୁ।

**7. deployment version match କରୁନାହିଁ**

```id="l1314l"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

ଏହାର ଅର୍ଥ ହେଉଛି ଡିଭାଇସ୍ ର system version, project ର minimum deployment version ଠାରୁ କମ୍।

ପରିବର୍ତ୍ତନ ପଥ:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

version କୁ ଡିଭାଇସ୍ ର system version ଠାରୁ ଅଧିକ ନୁହେଁ ଭାବରେ ସମଯୋଜନ କରନ୍ତୁ।

ପରିବର୍ତ୍ତନ ପରେ, build folder କୁ clean କରନ୍ତୁ:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

clean ସମାପ୍ତ ହେଲାପରେ ପୁଣିଥରେ run କରନ୍ତୁ।
