# SwiftUI view lifecycle

മുൻ പാഠത്തിൽ `@State` variables view lifecycle-നോടൊപ്പം നീങ്ങുന്നതാണെന്ന് നാം പഠിച്ചു. കൂടാതെ `onAppear`-ന്റെ അടിസ്ഥാന ഉപയോഗവും മനസ്സിലാക്കി.

ഈ പാഠത്തിൽ SwiftUI view lifecycle-നെ കൂടുതൽ ആഴത്തിൽ മനസ്സിലാക്കാം: view എങ്ങനെ create ചെയ്യപ്പെടുന്നു, display ചെയ്യപ്പെടുന്നു, view-ലെ variables എങ്ങനെ create ചെയ്യപ്പെടുകയും വീണ്ടും rebuild ചെയ്യപ്പെടുകയും ചെയ്യുന്നു, കൂടാതെ `onAppear`, `onDisappear`, `init` constructor എന്നിവയും പഠിക്കും.

ഈ അറിവുകളുടെ അടിസ്ഥാനത്തിൽ SwiftUI view മുഴുവനായുള്ള construction process-നെ കുറിച്ചൊരു overall understanding ഉണ്ടാക്കാം.

## App launch sequence

iOS project സൃഷ്ടിക്കുമ്പോൾ Xcode default ആയി രണ്ട് files ഉണ്ടാക്കും:

```
ContentView.swift
ProjectName + App.swift
```

ഇവയിൽ “ProjectName + `App`.swift” file ആണ് മുഴുവൻ application-ന്റെ entry point file.

ഉദാഹരണത്തിന്:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Code execution flow

App run ചെയ്യുമ്പോൾ (simulator അല്ലെങ്കിൽ physical device), system ആദ്യം `@main` keyword തിരയും:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Entry file ഉറപ്പാക്കിയ ശേഷം code execute ചെയ്യൽ തുടങ്ങും.

ആദ്യം `App` struct-ലേക്ക് കടന്ന് `body`-യിലെ code execute ചെയ്യും. പിന്നെ `WindowGroup` create ചെയ്ത് അതിനുള്ളിലുള്ള `ContentView` load ചെയ്യും.

### `WindowGroup`-ന്റെ പങ്ക്

`WindowGroup` windows manage ചെയ്യാൻ ഉപയോഗിക്കുന്നു:

```swift
WindowGroup {
    ContentView()
}
```

`iPad` / `macOS` systems multiple windows പിന്തുണയ്ക്കുന്നു; `iPhone`-ൽ സാധാരണയായി ഒരു window മാത്രമേ ഉണ്ടാകൂ.

അതുകൊണ്ട് `WindowGroup` `iPhone`-ൽ പ്രധാനമായും ആദ്യം കാണിക്കപ്പെടുന്ന screen manage ചെയ്യുന്നു.

### View loading process

System `ContentView` കണ്ടെത്തിയ ശേഷം:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI `body`-യിലെ code execute ചെയ്യും. തുടർന്ന് return ചെയ്ത view structure (`VStack`, `Text` തുടങ്ങിയവ) അടിസ്ഥാനമാക്കി UI build ചെയ്ത് screen-ൽ കാണിക്കും.

ഈ ഘട്ടങ്ങൾ പൂർത്തിയായ ശേഷം നമുക്ക് `ContentView` view കാണാൻ കഴിയും.

![ContentView](../../Resource/016_view1.png)

ശ്രദ്ധിക്കുക: `body`-യുടെ ജോലി view generate ചെയ്യുന്നതാണ്, view store ചെയ്യുന്നതല്ല.

അതായത് view refresh ചെയ്യുന്ന ഓരോ തവണയും SwiftUI വീണ്ടും `body` calculate ചെയ്ത് പുതിയ view structure സൃഷ്ടിക്കും.

### Preview logic

Xcode preview (`Canvas`) ഉം actual run ഉം രണ്ട് വ്യത്യസ്ത mechanisms ആണ്.

ഉദാഹരണത്തിന്, entry file-ൽ debug output ചേർക്കാം:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode-ൽ `ContentView` preview ചെയ്യുമ്പോൾ execution `@main` entry-യിൽ നിന്ന് തുടങ്ങുന്നില്ല; അതിനാൽ entry file-ലുള്ള `onAppear` trigger ആവില്ല.

പക്ഷേ simulator അല്ലെങ്കിൽ physical device-ൽ run ചെയ്താൽ system `@main`-ൽ നിന്നാണ് തുടങ്ങുന്നത്. മുഴുവൻ app full flow അനുസരിച്ച് run ചെയ്യും; അതിനാൽ entry-യിലെ `onAppear` trigger ചെയ്ത് debug info output ചെയ്യും.

ഇതിലെ പ്രധാന കാര്യം: Xcode preview ഒരു “partial rendering” മാത്രമാണ്; അത് നിലവിലെ view മാത്രം കാണിക്കുന്നു. Simulator, physical device എന്നിവ “complete running environment” നൽകുന്നു; അവ മുഴുവൻ app execute ചെയ്യും.

അതുകൊണ്ട് app functionality test ചെയ്യുമ്പോൾ simulator അല്ലെങ്കിൽ physical device-നെ അടിസ്ഥാനമാക്കണം. Xcode preview പൂർണ്ണ execution environment നൽകുന്നില്ല.

## View lifecycle

ഇപ്പോഴത്തെ ഘട്ടത്തിൽ നമ്മുടെ code എല്ലാം `ContentView`-ലാണ് കേന്ദ്രീകരിച്ചിരിക്കുന്നത്. പക്ഷേ യഥാർത്ഥ app-ൽ സാധാരണയായി നിരവധി views ഉണ്ടാകും, കൂടാതെ അവ വിവിധ സാഹചര്യങ്ങളിൽ തമ്മിൽ മാറുകയും ചെയ്യും.

ഉദാഹരണത്തിന് “piggy bank” project-ൽ:

![PiggyBank](../../Resource/016_view.png)

“Save” click ചെയ്താൽ `SaveView` കാണിക്കും; save പൂർത്തിയായാൽ അല്ലെങ്കിൽ close ചെയ്താൽ `SaveView` remove ചെയ്യും.

ഇതാണ് ഒരു view-ന്റെ lifecycle: view create ചെയ്യൽ, view display ചെയ്യൽ, അവസാനമായി view remove ചെയ്യൽ.

### App close ചെയ്യുക

App close ചെയ്താൽ എല്ലാ views-ഉം remove ചെയ്യും; ബന്ധപ്പെട്ട state-ഉം മായും.

അതായത് `ContentView` ഉൾപ്പെടെ എല്ലാ views-ും memory-യിൽ നിന്ന് remove ചെയ്യും; മുഴുവൻ app run state clear ചെയ്യും.

## View-യിലെ variables-ന്റെ lifecycle

SwiftUI-ൽ variables-ന്റെ lifecycle സാധാരണയായി view-നോട് ബന്ധിപ്പിച്ചിരിക്കും.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` variable

`@State` ഉപയോഗിച്ച് declare ചെയ്യുന്ന variable view lifecycle-നോട് bind ചെയ്യപ്പെട്ടിരിക്കും.

```swift
@State private var name = "FangJunyu"
```

View create ചെയ്യുമ്പോൾ `name`-വും create ചെയ്യും; view remove ചെയ്യുമ്പോൾ `name`-വും destroy ചെയ്യും.

അതുകൊണ്ടാണ് data persistence ആവശ്യമായപ്പോൾ `UserDefaults` പോലുള്ള മാർഗങ്ങൾ ഉപയോഗിക്കേണ്ടത്.

### `body`-ക്കുള്ളിലെ variable

`body`-ക്കുള്ളിൽ define ചെയ്യുന്ന variable:

```swift
var num = 10
```

ഇതിന്റെ lifecycle `body` execution process-നോട് bind ചെയ്തിരിക്കുന്നു.

SwiftUI-യുടെ state മാറുമ്പോൾ, ഉദാഹരണത്തിന്:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` മാറിയാൽ `@State` data change detect ചെയ്യും; തുടർന്ന് SwiftUI-നെ view വീണ്ടും calculate ചെയ്യാൻ അറിയിക്കും. അപ്പോൾ `body` വീണ്ടും calculate ചെയ്യും.

`body` വീണ്ടും calculate ചെയ്യുമ്പോൾ, `body`-യിലെ code എല്ലാം വീണ്ടും execute ചെയ്യും; `body`-ക്കുള്ളിലെ variables (`num` പോലുള്ള) എല്ലാം വീണ്ടും create ചെയ്യും.

ഇതിനാലാണ് `body`-ക്കുള്ളിൽ complex variables define ചെയ്യാൻ ശുപാർശ ചെയ്യാത്തത്.

View refresh ചെയ്യുന്ന ഓരോ തവണയും `body`-യിലെ variables വീണ്ടും create ചെയ്യുന്നതുകൊണ്ട് calculation cost കൂടുകയും performance-നെ ബാധിക്കുകയും ചെയ്യും.

SwiftUI-ൽ വ്യത്യസ്ത തരത്തിലുള്ള data വ്യത്യസ്തമായ രീതിയിൽ manage ചെയ്യണം: view lifecycle-നൊപ്പം പോകേണ്ട data `@State` ഉപയോഗിച്ച് save ചെയ്യാം; temporary calculation data `body`-ക്കുള്ളിൽ ഇടാം.

## `onAppear` ഉം `onDisappear` ഉം

മുൻ പാഠത്തിൽ `onAppear` പഠിച്ചു കഴിഞ്ഞു: view display ചെയ്യുമ്പോൾ `onAppear` call ചെയ്യും.

```swift
.onAppear {}
```

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode preview-ലോ run സമയത്തോ `onAppear`-ലെ debug output കാണാം.

### `onDisappear`

`onAppear`-നോടു തുല്യമായി `onDisappear` ഉണ്ട്:

```swift
.onDisappear {}
```

View close ചെയ്യുമ്പോൾ `onDisappear` call ചെയ്യും.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

View remove ചെയ്യുമ്പോൾ `onDisappear`-യിലെ code execute ചെയ്യും.

സൂചന: ഇപ്പോഴത്തെ ഘട്ടത്തിൽ ഉപയോഗിക്കുന്ന `ContentView` app-ന്റെ root view ആണ്; അത് നേരിട്ട് close ചെയ്യാനോ remove ചെയ്യാനോ സാധ്യമല്ല. അതിനാൽ ഇപ്പോൾ `onDisappear` effect നേരിട്ട് കാണാനാവില്ല.

പിന്നീട് page navigation, പുതിയ views തുറക്കൽ എന്നിവ പഠിക്കുമ്പോഴാണ് `onDisappear` call ചെയ്യുന്നത് കാണാൻ കഴിയുക.

## Creation, display logic

View create ചെയ്യുന്നതും display ചെയ്യുന്നതും രണ്ട് വേർതിരിച്ച ഘട്ടങ്ങളാണ് എന്ന് ശ്രദ്ധിക്കണം.

View create ചെയ്യുമ്പോൾ struct-ന്റെ constructor method call ചെയ്യും:

```swift
init() {}
```

SwiftUI views `struct` structure ആണെന്നതിനാൽ:

```swift
struct ContentView: View { ... }
```

View instance create ചെയ്താൽ `init` constructor execute ചെയ്യും. View display ചെയ്യുമ്പോൾ മാത്രമാണ് `onAppear` method call ചെയ്യുക.

ഉദാഹരണത്തിന്:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode preview ചെയ്യുമ്പോൾ debug output ഇങ്ങനെ കാണാം:

```swift
Create ContentView
Show ContentView
```

അതായത് ആദ്യം `init` execute ചെയ്ത് view create ചെയ്യുന്നു; പിന്നെ `body`-യിലെ code calculate ചെയ്യും; അവസാനം view display ചെയ്ത് `onAppear` execute ചെയ്യും.

അതുകൊണ്ട് view creation phase ഉം display phase ഉം വേർതിരിച്ചാണെന്നു മനസ്സിലാക്കണം.

### `init` constructor

`init` Swift-ന്റെ അടിസ്ഥാന syntax ആണ്. `struct`-ലും `class`-ലും ഇത് define ചെയ്യാം; object initialize ചെയ്യാനാണ് ഇത് ഉപയോഗിക്കുന്നത്.

```swift
init() {}
```

SwiftUI-ൽ view create ചെയ്യുമ്പോൾ system ആ view-ന്റെ `init` method call ചെയ്യും; ഇത് parameters സ്വീകരിക്കാനും data initialize ചെയ്യാനുമുപയോഗിക്കാം.

`init` manually എഴുതുന്നില്ലെങ്കിൽ Swift `struct`-ക്കായി default constructor സ്വയം generate ചെയ്യും.

`ContentView` പോലുള്ള SwiftUI views-ൽ, view create ചെയ്യുന്ന സമയത്ത് `init` execute ചെയ്യും; view display ചെയ്യുന്ന സമയത്ത് `onAppear` execute ചെയ്യും.

അതുകൊണ്ട് `init` view create ചെയ്യുമ്പോൾ execute ചെയ്യുന്ന constructor method ആണ്; പിന്നീട് parameters pass ചെയ്യുന്നതിലും data initialize ചെയ്യുന്നതിലും ഇത് ഉപയോഗപ്രദമാകും.

## സംഗ്രഹം

ഈ പാഠത്തിൽ app launch sequence പഠിച്ചു — entry file-ൽ നിന്ന് `ContentView` file വരെ code എങ്ങനെ flow ചെയ്യുന്നു എന്ന് മനസ്സിലാക്കി.

SwiftUI view lifecycle-നെക്കുറിച്ചും പഠിച്ചു: view create ചെയ്യുമ്പോൾ `init` execute ചെയ്യും; screen-ൽ display ചെയ്യുമ്പോൾ `onAppear` execute ചെയ്യും; view remove ചെയ്യുകയോ close ചെയ്യുകയോ ചെയ്താൽ `onDisappear` execute ചെയ്യും.

View update mechanism-വും മനസ്സിലാക്കി: view state-driven ആണ്. `@State` പോലുള്ള state മാറുമ്പോൾ SwiftUI view refresh ചെയ്യും, `body` വീണ്ടും calculate ചെയ്യും, `body`-ക്കുള്ളിലെ variables-ും വീണ്ടും create ചെയ്യും.

Variables-ന്റെ lifecycle view lifecycle-നോട് bind ചെയ്തിരിക്കും; `body`-ക്കുള്ളിലെ temporary values ഓരോ refresh-ലും വീണ്ടും create ചെയ്യും.

ഈ lifecycle-ുകളും variable behavior-വും മനസ്സിലാക്കുന്നത് code കൂടുതൽ നന്നായി ക്രമീകരിക്കാനും app logic കൂടുതൽ വ്യക്തമാക്കാനും സഹായിക്കും.
