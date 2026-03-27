# Xcode ਨਾਲ ਜਾਣ-ਪਛਾਣ

## Xcode ਕੀ ਹੈ

Xcode Apple ਵੱਲੋਂ ਦਿੱਤਾ ਗਿਆ ਇੱਕ ਅਧਿਕਾਰਿਕ integrated development environment (IDE, Integrated Development Environment) ਹੈ, ਜਿਸਦਾ ਇਸਤੇਮਾਲ iOS, macOS, watchOS, tvOS ਅਤੇ ਹੋਰ Apple ਪਲੇਟਫਾਰਮ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਲਈ ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

![Swift](../../RESOURCE/001_xcode.png)

ਪੂਰੇ ਸਿੱਖਿਆ ਪ੍ਰਕਿਰਿਆ ਦੌਰਾਨ, ਅਸੀਂ ਕੋਡ ਲਿਖਣ ਅਤੇ ਪ੍ਰੋਗ੍ਰਾਮ ਚਲਾਉਣ ਲਈ Xcode ਦਾ ਹੀ ਇਸਤੇਮਾਲ ਕਰਾਂਗੇ।

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਸਿੱਖਾਂਗੇ ਕਿ Xcode ਕਿਵੇਂ ਡਾਊਨਲੋਡ ਕਰਨਾ ਹੈ, ਪਹਿਲਾ iOS ਐਪ ਕਿਵੇਂ ਬਣਾਉਣਾ ਹੈ, ਅਤੇ Xcode ਦੇ ਇੰਟਰਫੇਸ ਦੇ ਮੁੱਢਲੇ ਢਾਂਚੇ ਨਾਲ ਕਿਵੇਂ ਜਾਣ-ਪਛਾਣ ਕਰਨੀ ਹੈ।

## Xcode ਡਾਊਨਲੋਡ ਕਰਨਾ

ਇਸ ਵੇਲੇ Xcode ਇੰਸਟਾਲ ਕਰਨ ਦੇ ਦੋ ਤਰੀਕੇ ਹਨ：

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) ਰਾਹੀਂ ਡਾਊਨਲੋਡ ਕਰੋ

2、[Apple Developer ਅਧਿਕਾਰਿਕ ਵੈਬਸਾਈਟ](https://developer.apple.com/xcode/) ਰਾਹੀਂ ਡਾਊਨਲੋਡ ਕਰੋ

ਦੋਵੇਂ ਤਰੀਕਿਆਂ ਨਾਲ Xcode ਡਾਊਨਲੋਡ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। ਫਰਕ ਇਹ ਹੈ ਕਿ Apple Developer ਦੀ ਅਧਿਕਾਰਿਕ ਵੈਬਸਾਈਟ ਤੋਂ stable version ਦੇ ਨਾਲ-साथ [Beta](https://developer.apple.com/download/all/?q=Xcode) version ਜਾਂ ਪੁਰਾਣੇ versions ਵੀ ਡਾਊਨਲੋਡ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ।

ਜੇ ਤੁਸੀਂ ਸਿਰਫ਼ development ਸਿੱਖ ਰਹੇ ਹੋ, ਤਾਂ stable version ਵਰਤਣ ਦੀ ਸਲਾਹ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ। Beta version ਮੁੱਖ ਤੌਰ 'ਤੇ ਨਵੇਂ features ਦੀ ਜਾਂਚ ਲਈ ਹੁੰਦਾ ਹੈ, ਅਤੇ ਇਸ ਵਿੱਚ ਅਸਥਿਰਤਾ ਹੋ ਸਕਦੀ ਹੈ।

## ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਬਣਾਉਣਾ

Xcode ਖੋਲ੍ਹਣ ਤੋਂ ਬਾਅਦ, ਤੁਹਾਨੂੰ startup interface ਦਿੱਸੇਗਾ।

![Swift](../../RESOURCE/001_xcode1.png)

ਖੱਬੇ ਪਾਸੇ ਤਿੰਨ ਆਮ ਚੋਣਾਂ ਹੁੰਦੀਆਂ ਹਨ：

- Create New Project —— ਨਵਾਂ ਪ੍ਰੋਜੈਕਟ ਬਣਾਉਣਾ  
- Clone Git Repository —— Git repository clone ਕਰਨਾ  
- Open Existing Project —— ਮੌਜੂਦਾ ਪ੍ਰੋਜੈਕਟ ਖੋਲ੍ਹਣਾ  

ਸੱਜੇ ਪਾਸੇ ਹਾਲ ਹੀ ਵਿੱਚ ਖੋਲ੍ਹੇ ਗਏ Xcode ਪ੍ਰੋਜੈਕਟ ਦਿਖਾਈ ਦਿੰਦੇ ਹਨ।

ਅਸੀਂ "Create New Project" ਚੋਣ ਕਰਦੇ ਹਾਂ।

### ਪ੍ਰੋਜੈਕਟ ਟੈਂਪਲੇਟ ਚੁਣਨਾ

![Swift](../../RESOURCE/001_xcode2.png)

ਹੁਣ ਤੁਸੀਂ project template ਚੋਣ ਸਕ੍ਰੀਨ ਵਿੱਚ ਜਾਓਗੇ, ਜਿੱਥੇ ਕਈ ਪਲੇਟਫਾਰਮ (iOS, macOS ਆਦਿ) ਅਤੇ ਵੱਖ-ਵੱਖ ਕਿਸਮ ਦੇ project templates ਦਿੱਸਦੇ ਹਨ।

ਆਮ templates ਦੀ ਵਿਆਖਿਆ：
- App —— ਸਭ ਤੋਂ ਬੁਨਿਆਦੀ application ਕਿਸਮ (ਸਿਫ਼ਾਰਸ਼ੀ)
- Document App —— ਦਸਤਾਵੇਜ਼-ਆਧਾਰਿਤ application
- Game —— game development ਲਈ
- Framework —— ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ module

ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ, ਅਸੀਂ ਸਿਰਫ਼ "iOS" - "App" template ਚੁਣਦੇ ਹਾਂ, ਕਿਉਂਕਿ ਇਹ interface application ਕਿਸਮ ਹੈ।

ਫਿਰ "Next" 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

### ਪ੍ਰੋਜੈਕਟ ਜਾਣਕਾਰੀ ਭਰਨਾ

ਹੁਣ ਤੁਸੀਂ project information ਭਰਨ ਵਾਲੇ ਸਕ੍ਰੀਨ ਵਿੱਚ ਜਾਵੋਗੇ, ਜਿੱਥੇ ਸਾਨੂੰ ਹਰ field ਦੇ ਅਨੁਸਾਰ ਜਾਣਕਾਰੀ ਭਰਨੀ ਹੋਵੇਗੀ।

![Swift](../../RESOURCE/001_xcode3.png)

ਹਰ field ਦਾ ਅਰਥ：

- Product Name —— ਪ੍ਰੋਜੈਕਟ ਦਾ ਨਾਮ, ਉਦਾਹਰਨ ਵਜੋਂ：SwiftSlimTest
- Team —— developer team, ਜੇ ਤੁਹਾਡੇ ਕੋਲ paid Apple Developer account ਨਹੀਂ ਹੈ, ਤਾਂ ਇਸਨੂੰ ਨਾ ਵੀ ਚੁਣੋ
- Organization Identifier —— ਸੰਸਥਾ ਦਾ identifier, ਆਮ ਤੌਰ 'ਤੇ reverse domain format ਵਿੱਚ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ, ਉਦਾਹਰਨ：
  - com.yourname
  - com.yourcompany
  - ਜੇ ਤੁਹਾਡੇ ਕੋਲ domain ਨਹੀਂ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਆਪਣਾ ਅੰਗਰੇਜ਼ੀ ਨਾਮ identifier ਵਜੋਂ ਵਰਤ ਸਕਦੇ ਹੋ
- Bundle Identifier —— application ਦਾ unique identifier, ਜੋ Organization Identifier ਅਤੇ Product Name ਦੇ ਆਧਾਰ 'ਤੇ ਆਪਣੇ ਆਪ ਬਣ ਜਾਂਦਾ ਹੈ
- Interface —— interface technology, ਇੱਥੇ SwiftUI ਚੁਣੋ
- Language —— development language, ਇੱਥੇ Swift ਚੁਣੋ
- Testing System —— ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ test target (Unit Tests) ਬਣੇਗਾ, ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ ਇਸਨੂੰ ਅਣਡਿੱਠਾ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ
- Storage —— local data persistence framework, ਜੋ SwiftData ਜਾਂ Core Data ਨੂੰ ਆਪਣੇ ਆਪ integrate ਕਰ ਸਕਦਾ ਹੈ; ਸ਼ੁਰੂਆਤੀ ਪੜਾਅ ਵਿੱਚ ਇਸਨੂੰ ਵੀ ਅਣਡਿੱਠਾ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

ਸਾਰੀ ਜਾਣਕਾਰੀ ਭਰਨ ਤੋਂ ਬਾਅਦ, "Next" 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

### ਪ੍ਰੋਜੈਕਟ ਸੰਭਾਲਣਾ

![Swift](../../RESOURCE/001_xcode4.png)

ਸੰਭਾਲਣ ਲਈ ਇੱਕ ਉਚਿਤ folder ਚੁਣੋ।

"Create" ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਤੋਂ ਬਾਅਦ, Xcode ਆਪਣੇ ਆਪ project structure ਤਿਆਰ ਕਰ ਦੇਵੇਗਾ।

## Xcode ਪ੍ਰੋਜੈਕਟ ਦਾ ਢਾਂਚਾ

Xcode project ਸੰਭਾਲਣ ਤੋਂ ਬਾਅਦ, Finder ਵਿੱਚ ਤੁਹਾਨੂੰ ਬਣਿਆ ਹੋਇਆ project folder ਦਿੱਸੇਗਾ।

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— ਤਸਵੀਰਾਂ, App icons ਅਤੇ ਹੋਰ resources ਰੱਖਣ ਲਈ folder

- ContentView.swift —— ਡਿਫ਼ਾਲਟ SwiftUI view file, ਜਿਸ ਵਿੱਚ ਅਸੀਂ ਬਾਅਦ ਵਿੱਚ interface code ਲਿਖਾਂਗੇ।

- SwiftSlimTestApp.swift —— application entry file (App Entry Point), ਜੋ application ਨੂੰ start ਕਰਦੀ ਹੈ; ਇਸ ਵੇਲੇ ਸਾਨੂੰ ਇਸਨੂੰ ਸਮਝਣ ਦੀ ਲੋੜ ਨਹੀਂ।

- SwiftSlimTest.xcodeproj —— Xcode project file, ਜਿਸ 'ਤੇ double-click ਕਰਕੇ project ਖੋਲ੍ਹਿਆ ਜਾ ਸਕਦਾ ਹੈ।

## Xcode ਇੰਟਰਫੇਸ ਨਾਲ ਜਾਣ-ਪਛਾਣ

project ਖੋਲ੍ਹਣ ਲਈ .xcodeproj file 'ਤੇ double-click ਕਰੋ, ਫਿਰ ਖੱਬੇ ਪਾਸੇ Navigator ਖੇਤਰ ਵਿੱਚੋਂ ContentView.swift file ਚੁਣੋ।

Xcode interface ਮੁੱਖ ਤੌਰ 'ਤੇ ਪੰਜ ਖੇਤਰਾਂ ਵਿੱਚ ਵੰਡਿਆ ਹੁੰਦਾ ਹੈ：

- Navigator —— navigation ਖੇਤਰ, file structure ਵੇਖਣ ਅਤੇ search ਲਈ
- Editor —— editing ਖੇਤਰ, ਜਿੱਥੇ Swift ਜਾਂ SwiftUI code ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ
- Canvas —— canvas ਖੇਤਰ, SwiftUI preview ਲਈ
- Inspector —— property inspection ਖੇਤਰ, file ਦੀਆਂ properties ਵੇਖਣ ਅਤੇ ਸੋਧਣ ਲਈ
- Debug Area —— debugging ਖੇਤਰ, log output ਵੇਖਣ ਲਈ

![Swift](../../RESOURCE/001_xcode6.png)

ਧਿਆਨ ਦਿਓ：Canvas ਮੁੱਖ ਤੌਰ 'ਤੇ SwiftUI views ਦੀ preview ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। Xcode ਦੀ ਅਧਿਕਾਰਿਕ architecture ਦੇ ਨਜ਼ਰੀਏ ਤੋਂ, ਇਹ Editor ਦਾ ਇੱਕ ਸਹਾਇਕ preview panel ਹੈ। ਸਿਰਫ਼ SwiftUI view file ਖੁੱਲ੍ਹਣ 'ਤੇ ਹੀ Canvas enable ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ; ਹੋਰ ਕਿਸਮ ਦੀਆਂ files ਵਿੱਚ preview ਨਹੀਂ ਦਿੱਸੇਗੀ।

ਅਗਲੇ ਪਾਠਾਂ ਵਿੱਚ, ਅਸੀਂ ਮੁੱਖ ਤੌਰ 'ਤੇ Editor ਖੇਤਰ ਵਿੱਚ Swift ਅਤੇ SwiftUI code ਲਿਖਾਂਗੇ।

ਜਦੋਂ ਤੁਸੀਂ ਪਹਿਲੀ ਵਾਰ Xcode project ਖੋਲ੍ਹਦੇ ਹੋ, ਤਾਂ Inspector ਅਤੇ Debug Area ਡਿਫ਼ਾਲਟ ਤੌਰ 'ਤੇ ਲੁਕਿਆ ਹੋ ਸਕਦਾ ਹੈ। ਤੁਸੀਂ ਉੱਪਰ ਸੱਜੇ ਅਤੇ ਹੇਠਾਂ ਸੱਜੇ ਕੋਨੇ ਦੇ buttons 'ਤੇ ਕਲਿੱਕ ਕਰਕੇ ਇਹਨਾਂ ਨੂੰ ਦਿਖਾ ਸਕਦੇ ਹੋ।

![Swift](../../RESOURCE/001_xcode7.png)

ਸੁਝਾਅ：Inspector ਖੇਤਰ ਮੁੱਖ ਤੌਰ 'ਤੇ file properties ਵੇਖਣ ਅਤੇ ਸੋਧਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। ਅਸਲ development ਵਿੱਚ, ਵੱਡਾ editing space ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਇਸ ਖੇਤਰ ਨੂੰ ਆਮ ਤੌਰ 'ਤੇ ਲੁਕਾਇਆ ਜਾਂਦਾ ਹੈ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਸਿੱਖਿਆ ਕਿ Xcode ਕਿਵੇਂ ਡਾਊਨਲੋਡ ਕਰਨਾ ਹੈ, ਪਹਿਲਾ Xcode project ਕਿਵੇਂ ਬਣਾਉਣਾ ਹੈ, ਅਤੇ Xcode interface ਦੀ ਬੁਨਿਆਦੀ layout ਕੀ ਹੈ।

ਹੇਠਾਂ ਤੁਹਾਡੇ ਲਈ ਖੁੱਲ੍ਹਾ ਅਭਿਆਸ ਸਮਾਂ ਹੈ：
- ਤੁਸੀਂ Navigator ਖੇਤਰ ਵਿੱਚ files ਬਣਾਉਣ ਜਾਂ ਮਿਟਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਸਕਦੇ ਹੋ।  
- Editor ਖੇਤਰ ਦਾ code ਵੇਖੋ ਅਤੇ ਉਸਦੀ structure ਨੂੰ ਧਿਆਨ ਨਾਲ ਸਮਝੋ।
- Canvas ਖੇਤਰ ਦੇ buttons ਵੇਖੋ ਅਤੇ preview ਨੂੰ zoom in ਅਤੇ zoom out ਕਰਕੇ ਅਜ਼ਮਾਓ।

ਅਗਲੇ ਪਾਠ ਵਿੱਚ, ਅਸੀਂ ਕੁਝ ਸਧਾਰਣ code ਲਿਖਣਾ ਸ਼ੁਰੂ ਕਰਾਂਗੇ, ਅਤੇ ਇਸ ਨਾਲ Xcode ਨੂੰ ਹੋਰ ਵਧੀਆ ਢੰਗ ਨਾਲ ਸਮਝਣ ਵਿੱਚ ਮਦਦ ਮਿਲੇਗੀ।