# Xcode କୁ ଚିହ୍ନିବା

## Xcode କ’ଣ

Xcode ହେଉଛି Apple ର ଆଧିକାରିକ Integrated Development Environment（IDE），ଯାହା iOS、macOS、watchOS、tvOS ପରି Apple ପ୍ଲାଟଫର୍ମରେ ଆପ୍ ଡିଭେଲପ କରିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

![Swift](../../RESOURCE/001_xcode.png)

ସମଗ୍ର ଶିକ୍ଷା ପ୍ରକ୍ରିୟାରେ, ଆମେ Xcode ବ୍ୟବହାର କରି କୋଡ୍ ଲେଖିବୁ ଏବଂ ପ୍ରୋଗ୍ରାମ୍ ଚଳାଇବୁ।

ଏହି ପାଠରେ, ଆମେ Xcode କିପରି ଡାଉନଲୋଡ୍ କରିବା, ପ୍ରଥମ iOS ଆପ୍ କିପରି ସୃଷ୍ଟି କରିବା, ଏବଂ Xcode ର interface ଗଠନକୁ ପ୍ରାରମ୍ଭିକ ଭାବରେ କିପରି ବୁଝିବା — ସେସବୁ ଶିଖିବୁ।

## Xcode ଡାଉନଲୋଡ୍ କରିବା

ବର୍ତ୍ତମାନ Xcode ର ଦୁଇ ପ୍ରକାର installation ପଦ୍ଧତି ଅଛି:

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) ଦ୍ୱାରା ଡାଉନଲୋଡ୍ କରିବା

2、[Apple Developer ଆଧିକାରିକ ୱେବସାଇଟ୍](https://developer.apple.com/xcode/) ଦ୍ୱାରା ଡାଉନଲୋଡ୍ କରିବା

ଏହି ଦୁଇଟି ପଦ୍ଧତିରେ ମଧ୍ୟ Xcode ଡାଉନଲୋଡ୍ କରିହେବ। ପାର୍ଥକ୍ୟ ହେଉଛି, Apple Developer ର ଆଧିକାରିକ ୱେବସାଇଟ୍ ରେ stable version ସହିତ [Beta](https://developer.apple.com/download/all/?q=Xcode) version ଏବଂ ପୁରୁଣା version ମଧ୍ୟ ମିଳେ।

ଯଦି ଆପଣ କେବଳ development ଶିଖୁଛନ୍ତି, ତେବେ stable version ବ୍ୟବହାର କରିବାକୁ ପରାମର୍ଶ ଦିଆଯାଏ। Beta version ମୁଖ୍ୟତଃ ନୂଆ feature ପରୀକ୍ଷା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ, ତେଣୁ ଏଥିରେ ଅସ୍ଥିରତା ଥାଇପାରେ।

## ପ୍ରଥମ project ସୃଷ୍ଟି କରିବା

Xcode ଖୋଲିବା ପରେ, ଆପଣ startup screen ଦେଖିବେ।

![Swift](../../RESOURCE/001_xcode1.png)

ବାମପଟେ ତିନୋଟି ସାଧାରଣ option ରହିଥାଏ:

- Create New Project —— ନୂଆ project ସୃଷ୍ଟି କରିବା  
- Clone Git Repository —— Git repository clone କରିବା  
- Open Existing Project —— ଥିବା project ଖୋଲିବା

ଡାହାଣପଟେ ସମ୍ପ୍ରତି ଖୋଲାଯାଇଥିବା Xcode project ଗୁଡ଼ିକ ଦେଖାଯାଏ।

ଆମେ "Create New Project" option ବାଛିବୁ।

### Project template ବାଛିବା

![Swift](../../RESOURCE/001_xcode2.png)

Project template ବାଛିବା interface ରେ ପ୍ରବେଶ କରିଲେ, ଏଠାରେ ଅନେକ platform（iOS、macOS ଇତ୍ୟାଦି）ଏବଂ ଭିନ୍ନ ପ୍ରକାରର project template ଦେଖାଯିବ।

ସାଧାରଣ template ବିବରଣୀ:
- App —— ସବୁଠାରୁ ମୌଳିକ app ପ୍ରକାର（ପରାମର୍ଶ ଦିଆଯାଏ）
- Document App —— document mode ଉପରେ ଆଧାରିତ app
- Game —— game development ପାଇଁ
- Framework —— ପୁନଃବ୍ୟବହାରଯୋଗ୍ୟ module

ଆରମ୍ଭିକ ଅବସ୍ଥାରେ, ଆମେ କେବଳ "iOS" - "App" template ବାଛିବୁ, କାରଣ ଏହା interface app ପ୍ରକାର।

"Next" ଉପରେ କ୍ଲିକ୍ କରନ୍ତୁ।

### Project ସୂଚନା ପୂରଣ କରିବା

ତାପରେ project ସୂଚନା ପୂରଣ କରିବା interface କୁ ପ୍ରବେଶ କରିବୁ, ଯେଉଁଠାରେ field ର ପ୍ରକାର ଅନୁସାରେ ତଥ୍ୟ ପୂରଣ କରିବା ଦରକାର।

![Swift](../../RESOURCE/001_xcode3.png)

ପ୍ରତ୍ୟେକ field ର ଅର୍ଥ:

- Product Name —— project ର ନାମ, ଯଥା: SwiftSlimTest
- Team —— developer team; ଯଦି ଆପଣଙ୍କ ପାଖରେ paid Apple Developer account ନଥାଏ, ଏହାକୁ ଖାଲି ରଖିପାରିବେ
- Organization Identifier —— ସଂଗଠନ ପରିଚୟଚିହ୍ନ, ସାଧାରଣତଃ reverse domain format ବ୍ୟବହାର କରାଯାଏ, ଯଥା:
  - com.yourname
  - com.yourcompany
  - ଯଦି ଆପଣଙ୍କର domain ନଥାଏ, ନିଜ ଇଂରାଜୀ ନାମକୁ identifier ଭାବେ ବ୍ୟବହାର କରିପାରିବେ
- Bundle Identifier —— app ର ଏକମାତ୍ର ପରିଚୟଚିହ୍ନ; ଏହା Organization Identifier ଏବଂ Product Name ଅନୁସାରେ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ତିଆରି ହୋଇଯାଏ
- Interface —— interface technology, SwiftUI ବାଛନ୍ତୁ
- Language —— development language, Swift ବାଛନ୍ତୁ
- Testing System —— default ଭାବେ test target（Unit Tests）ସୃଷ୍ଟି ହୁଏ; ଆରମ୍ଭିକ ଅବସ୍ଥାରେ ଏହାକୁ ଅଣଦେଖା କରନ୍ତୁ
- Storage —— local data persistence framework; SwiftData କିମ୍ବା Core Data କୁ ସ୍ୱୟଂଚାଳିତ ଭାବେ integrate କରିପାରେ; ଆରମ୍ଭିକ ଅବସ୍ଥାରେ ଏହାକୁ ଅଣଦେଖା କରନ୍ତୁ

ସମସ୍ତ ତଥ୍ୟ ପୂରଣ କରିସାରିଲେ, "Next" ଉପରେ କ୍ଲିକ୍ କରନ୍ତୁ।

### Project ସେଭ୍ କରିବା

![Swift](../../RESOURCE/001_xcode4.png)

ସେଭ୍ କରିବା ପାଇଁ ଏକ ଉପଯୁକ୍ତ folder ବାଛନ୍ତୁ।

"Create" button ଉପରେ କ୍ଲିକ୍ କରିଲେ, Xcode ସ୍ୱୟଂଚାଳିତ ଭାବେ project structure ତିଆରି କରିଦେବ।

## Xcode project structure

Xcode project ସେଭ୍ କରିବା ପରେ, Finder ରେ ଆପଣ ସୃଷ୍ଟି ହୋଇଥିବା project folder କୁ ଦେଖିପାରିବେ।

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— ଛବି, App icon ଓ ଅନ୍ୟାନ୍ୟ resource ରଖିବା ପାଇଁ folder

- ContentView.swift —— default ଭାବେ ସୃଷ୍ଟି ହେଉଥିବା SwiftUI view file, ପରବର୍ତ୍ତୀରେ ଆମେ ଏଠାରେ interface code ଲେଖିବୁ।

- SwiftSlimTestApp.swift —— app entry file（App Entry Point），ଯାହା app କୁ launch କରିବା ପାଇଁ ଦାୟୀ; ଏହାକୁ ଏବେ ଗଭୀରରେ ବୁଝିବା ଆବଶ୍ୟକ ନାହିଁ।

- SwiftSlimTest.xcodeproj —— Xcode project file; ଏହାକୁ double-click କରିଲେ ପ୍ରକଳ୍ପ ଖୋଲିଯିବ।

## Xcode interface କୁ ଚିହ୍ନିବା

Project ଖୋଲିବା ପାଇଁ .xcodeproj file ଉପରେ double-click କରନ୍ତୁ, ତାପରେ ବାମ Navigator ଅଞ୍ଚଳରେ ContentView.swift file ବାଛନ୍ତୁ।

Xcode ର interface ପ୍ରଧାନତଃ ପାଞ୍ଚଟି ଅଞ୍ଚଳରୁ ଗଠିତ:

- Navigator —— navigation area, file structure ଦେଖିବା ଓ search ପାଇଁ
- Editor —— editing area, Swift କିମ୍ବା SwiftUI code ଲେଖିବା ପାଇଁ
- Canvas —— canvas area, SwiftUI preview ପାଇଁ
- Inspector —— property inspection area, file ର ଗୁଣଧର୍ମ ଦେଖିବା ଓ ବଦଳାଇବା ପାଇଁ
- Debug Area —— debug area, log output ଦେଖିବା ପାଇଁ

![Swift](../../RESOURCE/001_xcode6.png)

ଧ୍ୟାନ ଦିଅନ୍ତୁ: Canvas ମୁଖ୍ୟତଃ SwiftUI view preview ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। Xcode ର ଆଧିକାରିକ architecture ଅନୁସାରେ, ଏହା Editor ର ଏକ ସହାୟକ preview panel（Preview Pane）ଅଟେ। କେବଳ SwiftUI view file ଖୋଲା ଥିବାବେଳେ Canvas କୁ enable କରିହେବ; ଅନ୍ୟ ପ୍ରକାର file ରେ preview function ଦେଖାଯିବ ନାହିଁ।

ପରବର୍ତ୍ତୀ ପାଠଗୁଡ଼ିକରେ, ଆମେ ମୁଖ୍ୟତଃ Editor ଅଞ୍ଚଳରେ Swift ଓ SwiftUI code ଲେଖିବୁ।

ପ୍ରଥମଥର Xcode project ଖୋଲିବା ସମୟରେ, Inspector ଏବଂ Debug Area default ଭାବେ ଲୁଚାଇଥାଇପାରେ। ଉପର ଡାହାଣକୋଣା ଓ ତଳ ଡାହାଣକୋଣାର button ଉପରେ କ୍ଲିକ୍ କରି ସେଗୁଡ଼ିକୁ ଦେଖାଇପାରିବେ।

![Swift](../../RESOURCE/001_xcode7.png)

ଟିପ୍ପଣୀ: Inspector ଅଞ୍ଚଳ ମୁଖ୍ୟତଃ file property ଦେଖିବା ଓ ବଦଳାଇବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ବାସ୍ତବ development ସମୟରେ, ବଡ଼ editing space ପାଇଁ ଏହାକୁ ସାଧାରଣତଃ hide କରାଯାଏ।

## ସାରାଂଶ

ଏହି ପାଠରେ, ଆମେ Xcode କିପରି ଡାଉନଲୋଡ୍ କରିବା, ପ୍ରଥମ Xcode project କିପରି ସୃଷ୍ଟି କରିବା, ଏବଂ Xcode ର ମୌଳିକ interface layout ବିଷୟରେ ଜାଣିଲୁ।

ଏବେ ଆପଣଙ୍କ ପାଇଁ ସ୍ୱାଧୀନ ଅଭ୍ୟାସ ସମୟ:
- Navigator ଅଞ୍ଚଳରେ file create ଏବଂ delete କରିଦେଖନ୍ତୁ।  
- Editor ଅଞ୍ଚଳର code ଦେଖନ୍ତୁ ଏବଂ code structure ଅବଲୋକନ କରନ୍ତୁ।
- Canvas ଅଞ୍ଚଳର button ଗୁଡ଼ିକୁ ଦେଖନ୍ତୁ, preview view କୁ zoom in ଏବଂ zoom out କରିଦେଖନ୍ତୁ।

ପରବର୍ତ୍ତୀ ପାଠରେ, ଆମେ କିଛି ସରଳ code ଲେଖିବା ଆରମ୍ଭ କରିବୁ, ଏବଂ ଏହା ଆମକୁ Xcode ବିଷୟରେ ଆଉ ଭଲ ଭାବରେ ବୁଝିବାରେ ସାହାଯ୍ୟ କରିବ।