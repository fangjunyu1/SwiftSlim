# ਬਟਨ ਨੂੰ ਕੰਮ ਕਰਾਉਣਾ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਮੁੱਖ ਤੌਰ 'ਤੇ SwiftUI ਦੇ Button ਬਟਨ, `print` ਰਾਹੀਂ debugging ਜਾਣਕਾਰੀ output ਕਰਨਾ, ਅਤੇ Swift functions ਸਿੱਖਾਂਗੇ।

ਇਹ ਸਮੱਗਰੀ SwiftUI ਵਿੱਚ interaction programming ਦੀ ਬੁਨਿਆਦ ਹੈ।

## ਬਟਨ

ਬਟਨ ਸਭ ਤੋਂ ਆਮ UI controls ਵਿੱਚੋਂ ਇੱਕ ਹਨ। ਜਦੋਂ ਸਾਨੂੰ download, open ਜਾਂ exit ਵਰਗੀਆਂ ਕਾਰਵਾਈਆਂ ਕਰਨੀ ਹੁੰਦੀਆਂ ਹਨ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ ਬਟਨ 'ਤੇ click ਕਰਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ, App Store ਵਿੱਚ “获取” ਬਟਨ 'ਤੇ click ਕਰਕੇ App download ਕੀਤਾ ਜਾਂਦਾ ਹੈ।

![Button](../../RESOURCE/008_button.png)

SwiftUI ਵਿੱਚ, ਬਟਨ ਨੂੰ `Button` ਨਾਲ ਦਰਸਾਇਆ ਜਾਂਦਾ ਹੈ।

ਮੂਲ ਵਰਤੋਂ:

```swift
Button("") {
    
}
````

ਇਸ ਦੀ ਬਣਤਰ ਨੂੰ ਦੋ ਹਿੱਸਿਆਂ ਵਿੱਚ ਵੰਡਿਆ ਜਾ ਸਕਦਾ ਹੈ:

```swift
Button("ਬਟਨ ਟੈਕਸਟ") {
    ਬਟਨ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਸਮੇਂ ਚੱਲਣ ਵਾਲਾ ਕੋਡ
}
```

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

ਚਲਾਉਣ ਤੋਂ ਬਾਅਦ ਇੱਕ `Start` ਬਟਨ ਦਿਖਾਈ ਦੇਵੇਗਾ।

![Button](../../RESOURCE/008_button1.png)

ਜਦੋਂ ਯੂਜ਼ਰ ਬਟਨ 'ਤੇ click ਕਰਦਾ ਹੈ, ਤਾਂ `{}` ਦੇ ਅੰਦਰ ਵਾਲਾ ਕੋਡ ਚੱਲਦਾ ਹੈ।

ਧਿਆਨ ਦਿਓ: `Button` SwiftUI ਦਾ ਇੱਕ interface control (`View`) ਹੈ, ਇਸ ਲਈ ਇਹ `body` ਦੇ ਅੰਦਰ ਹੀ ਲਿਖਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ।

### `buttonStyle` ਮੋਡੀਫਾਇਰ

SwiftUI ਵਿੱਚ, `Button` ਲਈ system-built-in button styles ਉਪਲਬਧ ਹਨ, ਜਿਨ੍ਹਾਂ ਨੂੰ `buttonStyle` modifier ਨਾਲ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` system ਵੱਲੋਂ ਦਿੱਤਾ ਗਿਆ ਬਟਨ style ਲਾਗੂ ਕਰੇਗਾ।

ਆਮ options ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

* `.automatic`
* `.plain`
* `.bordered`
* `.borderedProminent`
* `.borderless`

![Button](../../RESOURCE/008_button7.png)

ਵੱਖ-ਵੱਖ styles ਦਾ ਫਰਕ ਮੁੱਖ ਤੌਰ 'ਤੇ ਇਸ ਗੱਲ ਵਿੱਚ ਹੁੰਦਾ ਹੈ ਕਿ ਬਟਨ ਵਿੱਚ border ਹੈ ਜਾਂ ਨਹੀਂ, background ਹੈ ਜਾਂ ਨਹੀਂ, ਅਤੇ visual emphasis ਕਿੰਨੀ ਹੈ।

## `print` output

Programming ਵਿੱਚ ਅਕਸਰ ਇਹ ਵੇਖਣ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ ਕਿ ਪ੍ਰੋਗਰਾਮ ਕਿਸੇ ਖਾਸ ਕੋਡ ਹਿੱਸੇ ਤੱਕ ਪਹੁੰਚਿਆ ਹੈ ਜਾਂ ਨਹੀਂ।

Swift `print` function ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ, ਜੋ debugging ਜਾਣਕਾਰੀ output ਕਰਨ ਲਈ ਵਰਤੀ ਜਾਂਦੀ ਹੈ।

ਮੂਲ ਲਿਖਤ:

```swift
print("Hello")
```

ਇਹ ਲਾਈਨ ਲਿਖਤ ਨੂੰ Console ਵਿੱਚ output ਕਰੇਗੀ।

### ਬਟਨ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ

ਅਸੀਂ `print` ਨੂੰ ਬਟਨ ਦੇ ਅੰਦਰ ਲਿਖ ਸਕਦੇ ਹਾਂ, ਤਾਂ ਜੋ ਜਾਂਚ ਸਕੀਏ ਕਿ ਬਟਨ click ਹੋਇਆ ਹੈ ਜਾਂ ਨਹੀਂ।

```swift
Button("Start") {
    print("Test 123")
}
```

ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਵੇਗਾ, ਤਾਂ Console ਵਿੱਚ ਇਹ output ਆਵੇਗਾ:

```text
Test 123
```

ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਬਟਨ ਸਫਲਤਾਪੂਰਵਕ trigger ਹੋ ਗਿਆ ਹੈ।

![Button](../../RESOURCE/008_button3.png)

ਧਿਆਨ ਦਿਓ: `print` ਇੱਕ Swift ਕੋਡ ਹੈ, interface control ਨਹੀਂ। ਇਸਨੂੰ ਸਿੱਧਾ `body` ਵਿੱਚ ਨਹੀਂ ਰੱਖਿਆ ਜਾ ਸਕਦਾ, ਨਹੀਂ ਤਾਂ error ਆਵੇਗੀ।

ਉਦਾਹਰਨ ਲਈ, ਇਹ ਲਿਖਤ ਗਲਤ ਹੈ:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // ਗਲਤੀ: body ਨੂੰ ਇੱਕ View ਵਾਪਸ ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੈ
    }
}
```

SwiftUI ਵਿੱਚ, `body` interface structure ਦਾ ਵੇਰਵਾ ਦਿੰਦਾ ਹੈ, ਇਸ ਲਈ ਇਸ ਦੇ ਅੰਦਰ ਸਿਰਫ਼ interface controls (`View`) ਹੀ ਹੋ ਸਕਦੇ ਹਨ, ਜਿਵੇਂ `Text`, `Button`, `Image` ਆਦਿ।

ਸਧਾਰਣ ਕੋਡ (calculation logic, `print` ਆਦਿ) ਬਟਨ, function ਜਾਂ ਹੋਰ event handlers ਦੇ ਅੰਦਰ ਲਿਖਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ।

### Console ਕੰਟਰੋਲ ਪੈਨਲ

`print` ਦਾ output Xcode ਦੀ Console ਵਿੱਚ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।

ਜੇ Console ਨਹੀਂ ਦਿਖ ਰਿਹਾ, ਤਾਂ ਹੇਠਲੇ ਸੱਜੇ ਕੋਨੇ ਵਿੱਚ ਮੌਜੂਦ `Show the Debug Area` ਬਟਨ 'ਤੇ click ਕਰਕੇ debug area ਖੋਲ੍ਹੋ, ਫਿਰ `Show the Console` ਬਟਨ 'ਤੇ click ਕਰਕੇ Console ਦਿਖਾਓ।

![](../../RESOURCE/008_button4.png)

Console ਦੇ ਹੇਠਲੇ ਖੱਬੇ ਕੋਨੇ ਵਿੱਚ ਦੋ tabs ਹੁੰਦੇ ਹਨ: `Executable` ਅਤੇ `Previews`।

![](../../RESOURCE/008_button5.png)

ਇਹ ਦੋ tabs ਵੱਖ-ਵੱਖ running environments ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ: ਜਦੋਂ Canvas preview ਵਿੱਚ ਚਲਾ ਰਹੇ ਹੁੰਦੇ ਹੋ, `print` ਦਾ output `Previews` tab ਵਿੱਚ ਦਿਖਦਾ ਹੈ; ਜੇ simulator ਜਾਂ real device 'ਤੇ App ਚੱਲ ਰਹੀ ਹੋਵੇ, ਤਾਂ output `Executable` tab ਵਿੱਚ ਦਿਖੇਗਾ।

ਇਸ ਲਈ, ਜਦੋਂ ਤੁਹਾਨੂੰ ਲੱਗੇ ਕਿ `print` output ਨਹੀਂ ਆ ਰਿਹਾ, ਪਹਿਲਾਂ ਇਹ ਯਕੀਨੀ ਕਰੋ ਕਿ ਤੁਸੀਂ ਸਹੀ tab ਚੁਣਿਆ ਹੋਇਆ ਹੈ।

## ਕੇਸ - ASCII character art

ਕੁਝ code projects ਵਿੱਚ ਅਸੀਂ ਅਕਸਰ ASCII character art ਦੇਖਦੇ ਹਾਂ।

Character art ਉਹ pattern ਹੁੰਦਾ ਹੈ ਜੋ ਆਮ characters ਨਾਲ ਬਣਾਇਆ ਜਾਂਦਾ ਹੈ, ਉਦਾਹਰਨ ਲਈ:

![ASCII](../../RESOURCE/008_ascii.png)

ਅਸੀਂ ਬਟਨ + `print` ਨਾਲ ਇੱਕ ASCII character art output ਕਰ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਕੋਡ:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਵੇਗਾ, Console ਵਿੱਚ ਇਹ output ਆਵੇਗਾ:

```text
 /\_/\
( o.o )
 > ^ <
```

ਧਿਆਨ ਦਿਓ: string ਦੇ ਅੰਦਰ `\` ਨੂੰ `\\` ਵਜੋਂ ਲਿਖਣਾ ਪੈਂਦਾ ਹੈ, ਕਿਉਂਕਿ backslash string ਵਿੱਚ escape character ਹੁੰਦਾ ਹੈ।

## ਫੰਕਸ਼ਨ

ਬਟਨ ਦੇ ਅੰਦਰ ਅਸੀਂ ਸਿੱਧਾ ਕੋਡ ਲਿਖ ਸਕਦੇ ਹਾਂ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Button("Start") {
    print("Hello")
}
```

ਜੇ ਕੋਡ ਘੱਟ ਹੋਵੇ, ਤਾਂ ਇਸ ਤਰ੍ਹਾਂ ਲਿਖਣਾ ਠੀਕ ਹੈ। ਪਰ ਅਸਲ development ਵਿੱਚ, ਇੱਕ ਬਟਨ ਨਾਲ ਚੱਲਣ ਵਾਲੀ logic ਕਾਫ਼ੀ ਵੱਧ ਹੋ ਸਕਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // ਇੱਥੇ ਹੋਰ ਵੀ ਕਾਫ਼ੀ ਕੋਡ ਹੋ ਸਕਦਾ ਹੈ
}
```

ਜੇ ਕੋਡ ਵਧਦਾ ਜਾਵੇ, ਤਾਂ ਇਸਨੂੰ ਸਿੱਧਾ ਬਟਨ ਦੇ ਅੰਦਰ ਲਿਖਣਾ interface code ਨੂੰ ਗੁੰਝਲਦਾਰ ਬਣਾ ਦੇਵੇਗਾ, ਅਤੇ ਇਸਨੂੰ ਪੜ੍ਹਨਾ ਅਤੇ maintain ਕਰਨਾ ਔਖਾ ਹੋ ਜਾਵੇਗਾ।

ਇਸ ਲਈ, ਅਸੀਂ ਆਮ ਤੌਰ 'ਤੇ ਇਸ ਕੋਡ ਨੂੰ ਇੱਕ function ਵਿੱਚ ਰੱਖਦੇ ਹਾਂ, ਅਤੇ ਫਿਰ ਬਟਨ ਦੇ ਅੰਦਰ ਉਸ function ਨੂੰ call ਕਰਦੇ ਹਾਂ।

### ਫੰਕਸ਼ਨ ਕੀ ਹੈ

Function ਉਹ ਕੋਡ ਦਾ ਹਿੱਸਾ ਹੈ ਜਿਸਨੂੰ ਮੁੜ-ਮੁੜ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

ਜਦੋਂ ਵੀ ਕੋਈ ਖਾਸ ਕੋਡ ਚਲਾਉਣਾ ਹੋਵੇ, ਸਾਨੂੰ ਸਿਰਫ਼ ਉਹ function call ਕਰਨਾ ਹੁੰਦਾ ਹੈ, ਅਤੇ function ਦੇ ਅੰਦਰਲਾ ਕੋਡ ਚੱਲ ਜਾਂਦਾ ਹੈ।

ਇਸ ਤਰੀਕੇ ਨਾਲ ਕੋਡ ਦੀ ਬਣਤਰ ਹੋਰ ਸਾਫ਼ ਹੋ ਜਾਂਦੀ ਹੈ ਅਤੇ ਕੋਡ ਨੂੰ ਦੁਬਾਰਾ ਵਰਤਣਾ ਵੀ ਆਸਾਨ ਹੁੰਦਾ ਹੈ।

### ਮੂਲ ਲਿਖਤ

Swift ਵਿੱਚ, function ਨੂੰ **`func`** keyword ਨਾਲ define ਕੀਤਾ ਜਾਂਦਾ ਹੈ:

```swift
func randomInt() {
    // code
}
```

ਇਹ ਕੋਡ ਇੱਕ function define ਕਰਦਾ ਹੈ।

`randomInt` function ਦਾ ਨਾਮ ਹੈ, ਜੋ ਇਸ ਕੋਡ ਹਿੱਸੇ ਦੀ ਪਛਾਣ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

`()` parameter ਦੀ ਜਗ੍ਹਾ ਹੈ, ਜਿੱਥੇ ਬਾਹਰੋਂ ਆਉਣ ਵਾਲਾ ਡਾਟਾ ਲਿਆ ਜਾ ਸਕਦਾ ਹੈ। ਜੇ ਕਿਸੇ ਡਾਟਾ ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ, ਤਾਂ ਇਹ ਖਾਲੀ ਰਹਿ ਸਕਦਾ ਹੈ।

`{}` ਦੇ ਅੰਦਰ function ਦਾ ਕੋਡ ਇਲਾਕਾ ਹੁੰਦਾ ਹੈ। ਜਿਹੜਾ ਵੀ ਕੋਡ ਚਲਾਉਣਾ ਹੋਵੇ, ਉਹ ਸਾਰਾ ਇੱਥੇ ਲਿਖਿਆ ਜਾਂਦਾ ਹੈ।

ਉਦਾਹਰਨ ਲਈ:

```swift
func getName() {
    print("FangJunyu")
}
```

ਇਸ function ਦਾ ਕੰਮ ਇੱਕ ਲਿਖਤ output ਕਰਨਾ ਹੈ।

### ਫੰਕਸ਼ਨ ਨੂੰ ਕਾਲ ਕਰਨਾ

Function define ਕਰਨਾ ਸਿਰਫ਼ ਕੋਡ ਤਿਆਰ ਕਰਨਾ ਹੈ। ਜੇ ਇਸਨੂੰ ਚਲਾਉਣਾ ਹੋਵੇ, ਤਾਂ function ਨੂੰ call ਕਰਨਾ ਪੈਂਦਾ ਹੈ।

ਕਾਲ ਕਰਨ ਦਾ ਤਰੀਕਾ ਹੈ function ਦੇ ਨਾਮ ਦੇ ਬਾਅਦ `()` ਲਗਾਉਣਾ:

```swift
getName()
```

ਜਦੋਂ ਪ੍ਰੋਗਰਾਮ ਇਸ ਲਾਈਨ ਤੱਕ ਪਹੁੰਚਦਾ ਹੈ, ਤਾਂ `getName` function ਦੇ ਅੰਦਰਲਾ ਕੋਡ ਚੱਲਦਾ ਹੈ।

ਪੂਰਾ ਉਦਾਹਰਨ:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

ਚਲਾਉਣ ਤੋਂ ਬਾਅਦ, Console ਵਿੱਚ ਇਹ output ਆਵੇਗਾ:

```text
FangJunyu
```

### SwiftUI ਵਿੱਚ function ਦੀ ਵਰਤੋਂ

SwiftUI view ਵਿੱਚ, functions ਆਮ ਤੌਰ 'ਤੇ `body` ਦੇ ਬਾਹਰ ਲਿਖੇ ਜਾਂਦੇ ਹਨ।

ਉਦਾਹਰਨ ਲਈ:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

ਜਦੋਂ ਬਟਨ 'ਤੇ click ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ `getName()` function ਕਾਲ ਹੁੰਦਾ ਹੈ।

ਇਸ ਤਰ੍ਹਾਂ interface code ਸਾਫ਼ ਰਹਿੰਦਾ ਹੈ, ਅਤੇ ਖਾਸ logic function ਵਿੱਚ ਸੰਭਾਲੀ ਜਾਂਦੀ ਹੈ।

### ਫੰਕਸ਼ਨ ਦੇ ਪੈਰਾਮੀਟਰ

ਕਈ ਵਾਰ ਇੱਕ function ਨੂੰ ਵੱਖ-ਵੱਖ ਡਾਟਾ ਦੇ ਆਧਾਰ 'ਤੇ ਵੱਖਰੀ ਕਾਰਵਾਈ ਕਰਨੀ ਪੈਂਦੀ ਹੈ।

ਉਦਾਹਰਨ ਲਈ, ਅਸੀਂ ਚਾਹੁੰਦੇ ਹਾਂ ਕਿ function ਵੱਖ-ਵੱਖ ਨਾਮ output ਕਰ ਸਕੇ, ਨਾ ਕਿ ਸਿਰਫ਼ `"FangJunyu"` ਹੀ।

ਇਸ ਵੇਲੇ ਅਸੀਂ parameters ਵਰਤ ਸਕਦੇ ਹਾਂ। Parameters ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਸਮਝੋ: function ਕਾਲ ਕਰਦੇ ਸਮੇਂ ਦਿੱਤਾ ਗਿਆ ਡਾਟਾ।

ਉਦਾਹਰਨ ਲਈ:

```swift
func getName(name: String) {
    print(name)
}
```

ਇਸ function ਵਿੱਚ ਇੱਕ ਨਵਾਂ parameter ਜੋੜਿਆ ਗਿਆ ਹੈ। `name` parameter ਦਾ ਨਾਮ ਹੈ, ਅਤੇ `String` ਉਸਦੀ type ਹੈ。

ਇਸ ਦਾ ਮਤਲਬ ਹੈ ਕਿ function ਨੂੰ ਇੱਕ `String` type ਦਾ ਡਾਟਾ ਲੈਣਾ ਲਾਜ਼ਮੀ ਹੈ।

ਕਿਉਂਕਿ ਹੁਣ function ਨੂੰ ਡਾਟਾ ਚਾਹੀਦਾ ਹੈ, ਇਸ ਲਈ call ਕਰਦੇ ਸਮੇਂ ਇਹ ਡਾਟਾ ਦੇਣਾ ਹੀ ਪਵੇਗਾ।

```swift
getName(name: "Sam")
```

ਜਦੋਂ `"Sam"` pass ਕੀਤਾ ਜਾਂਦਾ ਹੈ, ਤਾਂ function ਦੇ ਅੰਦਰ ਇਹੀ value output ਕੀਤੀ ਜਾਂਦੀ ਹੈ।

ਚਲਾਉਣ ਦਾ ਨਤੀਜਾ:

```text
Sam
```

## ਕੇਸ - function ਨਾਲ ASCII character art output ਕਰਨਾ

ਪਿਛਲੇ ਉਦਾਹਰਨ ਵਿੱਚ ਅਸੀਂ `print` ਸਿੱਧਾ ਬਟਨ ਦੇ ਅੰਦਰ ਲਿਖਿਆ ਸੀ।

ਪਰ ਜੇ character art ਹੋਰ ਜਟਿਲ ਹੋਵੇ, ਤਾਂ ਕੋਡ ਕਾਫ਼ੀ ਲੰਬਾ ਹੋ ਜਾਵੇਗਾ। ਇਸ ਵੇਲੇ logic ਨੂੰ function ਵਿੱਚ ਰੱਖਿਆ ਜਾ ਸਕਦਾ ਹੈ, ਤਾਂ ਜੋ interface code ਹੋਰ ਸਾਫ਼ ਲੱਗੇ।

ਉਦਾਹਰਨ ਕੋਡ:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ਚਲਾਉਣ ਤੋਂ ਬਾਅਦ ਬਟਨ 'ਤੇ click ਕਰਨ 'ਤੇ, Console ਵਿੱਚ ਇਹ output ਆਵੇਗਾ:

```text
 /\_/\
( o.o )
 > ^ <
```

ਇੱਥੇ ਦੋ ਗੱਲਾਂ ਹੁੰਦੀਆਂ ਹਨ। ਜਦੋਂ ਯੂਜ਼ਰ ਬਟਨ 'ਤੇ click ਕਰਦਾ ਹੈ:

1. ਬਟਨ `printCat()` function ਨੂੰ call ਕਰਦਾ ਹੈ
2. function ਦੇ ਅੰਦਰਲਾ `print` ਕੋਡ ਚੱਲਦਾ ਹੈ

ਇਸ ਤਰ੍ਹਾਂ interface code ਸਿਰਫ਼ event trigger ਕਰਨ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਲੈਂਦਾ ਹੈ, ਅਤੇ ਖਾਸ logic function ਵਿੱਚ ਸੰਭਾਲੀ ਜਾਂਦੀ ਹੈ।

ਅਸਲ development ਵਿੱਚ, ਜ਼ਿਆਦਾਤਰ ਬਟਨਾਂ ਦੀਆਂ ਕਾਰਵਾਈਆਂ functions ਰਾਹੀਂ ਹੀ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।

## ਸਾਰ

ਇਸ ਪਾਠ ਵਿੱਚ ਅਸੀਂ ਤਿੰਨ ਮਹੱਤਵਪੂਰਨ ਚੀਜ਼ਾਂ ਸਿੱਖੀਆਂ:

**1. Button ਬਟਨ**

`Button` SwiftUI ਵਿੱਚ ਉਹ control ਹੈ ਜੋ ਕਿਸੇ action ਨੂੰ trigger ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
Button("Start") {

}
```

ਜਦੋਂ ਯੂਜ਼ਰ ਬਟਨ 'ਤੇ click ਕਰਦਾ ਹੈ, ਤਾਂ curly braces ਦੇ ਅੰਦਰ ਵਾਲਾ ਕੋਡ ਚੱਲਦਾ ਹੈ।

**2. `print` output**

`print` Console ਵਿੱਚ debugging ਜਾਣਕਾਰੀ output ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

```swift
print("Hello")
```

Developer Console ਰਾਹੀਂ ਪ੍ਰੋਗਰਾਮ ਦੀ running state ਵੇਖ ਸਕਦਾ ਹੈ।

**3. Function**

Function ਉਹ ਕੋਡ ਹੁੰਦਾ ਹੈ ਜਿਸਨੂੰ ਮੁੜ-ਮੁੜ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।

```swift
func sayHello() {
    print("Hello")
}
```

Function ਨੂੰ call ਕਰਨਾ:

```swift
sayHello()
```

ਜੇ function ਨੂੰ ਡਾਟਾ ਚਾਹੀਦਾ ਹੋਵੇ, ਤਾਂ parameters ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ:

```swift
func sayHello(name: String) {
    print(name)
}
```

ਅੱਗੇ ਦੇ ਪਾਠਾਂ ਵਿੱਚ, ਅਸੀਂ ਹੋਰ SwiftUI controls ਅਤੇ ਇਹ ਵੀ ਸਿੱਖਾਂਗੇ ਕਿ ਡਾਟਾ interface ਨਾਲ ਕਿਵੇਂ interact ਕਰਦਾ ਹੈ।

## ਅਭਿਆਸ

ਹੇਠਾਂ ਦਿੱਤੇ ਅਭਿਆਸ ਪੂਰੇ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ:

1. ਇੱਕ ਬਟਨ ਬਣਾਓ, ਜਿਸ ਦਾ ਟੈਕਸਟ `"Hello"` ਹੋਵੇ
2. ਬਟਨ 'ਤੇ click ਕਰਨ 'ਤੇ, Console ਵਿੱਚ `Hello Swift` output ਕਰੋ
3. output ਵਾਲਾ ਕੋਡ ਇੱਕ function ਵਿੱਚ ਲਿਖੋ, ਫਿਰ ਬਟਨ ਵਿੱਚ ਉਸ function ਨੂੰ call ਕਰੋ
