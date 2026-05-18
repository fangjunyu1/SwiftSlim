# สีที่กำหนดเอง

ในบทเรียนนี้ เราจะเรียนรู้วิธีกำหนดสีเองใน SwiftUI

ในบทเรียนก่อนหน้า เราเคยใช้สีเริ่มต้นที่ SwiftUI มีให้แล้ว เช่น:

```swift
Color.blue
Color.red
Color.green
```

สีเหล่านี้ใช้งานได้สะดวกมาก แต่ในการพัฒนา App จริง สีเริ่มต้นมักไม่แม่นยำพอ

ตัวอย่างเช่น ในแบบออกแบบอาจใช้สีลักษณะนี้:

```text
#2c54c2
#4875ed
#213e8d
```

สีแบบนี้เรียกว่า สี Hex

ในบทเรียนนี้ เราจะเริ่มจากการทำให้ SwiftUI รองรับสี Hex จากนั้นใช้ `static` เพื่อจัดระเบียบสีที่ใช้บ่อย

สุดท้าย เราจะนำสีที่กำหนดเองไปใช้กับมุมมองสารานุกรมสัตว์ และใช้พื้นหลังแบบไล่ระดับเพิ่มเติม เพื่อให้ปุ่มดูมีมิติมากขึ้น

## ทำไมต้องใช้สีที่กำหนดเอง?

ใน SwiftUI เราสามารถใช้สีของระบบได้โดยตรง

ตัวอย่างเช่น:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ในที่นี้ `.blue` หมายถึงสีน้ำเงิน ซึ่งจริง ๆ แล้วเป็นรูปแบบย่อของ `Color.blue`

ข้อดีของสีเริ่มต้นคือเรียบง่ายและสะดวก แต่ตัวเลือกของสีค่อนข้างจำกัด

ตัวอย่างเช่น:

```swift
Color.blue
```

สามารถแทนได้เฉพาะสีน้ำเงินเริ่มต้นที่ SwiftUI มีให้เท่านั้น

![Color.blue](../../../Resource/031_color6.png)

แต่ในการพัฒนาจริง เรามักต้องการสีที่เฉพาะเจาะจงมากกว่า

ตัวอย่างเช่น แม้จะเป็นสีน้ำเงินเหมือนกัน ก็อาจมีเอฟเฟกต์ต่างกัน เช่น น้ำเงินอ่อน น้ำเงินเข้ม น้ำเงินเทา หรือน้ำเงินสว่าง

![More Blue](../../../Resource/031_color5.png)

ในกรณีนี้ หากใช้เพียง `Color.blue` ก็จะยากต่อการคืนค่าเอฟเฟกต์ตามแบบออกแบบ

ดังนั้น เราจึงต้องทำให้ SwiftUI รองรับสีที่กำหนดเอง

## สี Hex คืออะไร?

สีบนหน้าจอมักประกอบด้วยช่องสีสามช่อง ได้แก่ แดง เขียว และน้ำเงิน หรือ RGB

RGB หมายถึง:

```text
Red     // สีแดง
Green   // สีเขียว
Blue    // สีน้ำเงิน
```

สี Hex เป็นวิธีหนึ่งในการแสดงสี RGB

ตัวอย่างเช่น:

```swift
#5479FF
```

ค่าสีนี้สามารถเข้าใจอย่างง่ายว่าแบ่งเป็นสามส่วน:

```text
54  // แทนช่องสีแดง
79  // แทนช่องสีเขียว
FF  // แทนช่องสีน้ำเงิน
```

ในบทเรียนนี้ เราไม่จำเป็นต้องคำนวณค่าเหล่านี้ และไม่จำเป็นต้องเข้าใจกฎเลขฐานสิบหกอย่างลึกซึ้ง

ตอนนี้เพียงต้องรู้ว่า `#5479FF` แทนสีเฉพาะสีหนึ่ง

ต่อไปเมื่อเราเห็นรูปแบบอย่าง `#2c54c2` หรือ `#4875ed` ก็สามารถเข้าใจเบื้องต้นได้ว่าเป็นค่าสีแบบหนึ่ง

ในเครื่องมือออกแบบอย่าง Sketch, Figma และ Photoshop ก็มักพบค่าสีลักษณะนี้เช่นกัน

![color](../../../Resource/031_color.png)

แต่โดยค่าเริ่มต้น SwiftUI ไม่สามารถเขียนแบบนี้ได้โดยตรง:

```swift
Color(hex: "#5479FF")
```

ดังนั้น เราจึงต้องขยายชนิด `Color` เอง เพื่อให้รองรับการสร้างสีจากสตริง Hex

## สร้างไฟล์ Color+Hex.swift

ก่อนอื่น เราสร้างไฟล์ Swift ใหม่หนึ่งไฟล์

ชื่อไฟล์สามารถเขียนเป็น:

```text
Color.swift
```

หรือเขียนให้ชัดเจนกว่าเป็น:

```text
Color+Hex.swift
```

ในที่นี้แนะนำให้ใช้:

```text
Color+Hex.swift
```

ในโปรเจกต์ Swift ชื่อไฟล์ลักษณะ `Color+Hex.swift` พบได้บ่อย

มันหมายความว่าไฟล์นี้เป็นไฟล์ extension ที่เพิ่มความสามารถ Hex ให้กับ `Color`

ชื่อไฟล์จะไม่ส่งผลต่อการทำงานของโค้ดโดยตรง แต่ช่วยให้เราเข้าใจจุดประสงค์ของไฟล์นี้ได้ง่ายขึ้น

## เพิ่มโค้ด Color(hex:)

ในไฟล์ `Color+Hex.swift` ให้เขียนโค้ดต่อไปนี้:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

โค้ดส่วนนี้ใช้ `extension` เพื่อขยายชนิด `Color` และเพิ่ม initializer ใหม่ให้กับ `Color`:

```swift
init(hex: String)
```

หลังจากมี initializer นี้แล้ว เราก็สามารถส่งสตริง Hex ให้กับ `Color` เพื่อสร้างสีที่กำหนดเองได้:

```swift
Color(hex: "#5479FF")
```

ภายในโค้ด extension นี้จะแปลงสตริง Hex ให้เป็นสี RGB ที่ SwiftUI รู้จัก

ในขั้นนี้ไม่จำเป็นต้องเข้าใจตรรกะการแปลงทุกบรรทัดอย่างลึกซึ้ง เพียงต้องรู้ว่าเมธอด `Color(hex:)` ที่เพิ่มเข้ามา ช่วยให้เราสร้างสีที่กำหนดเองจากค่าสี Hex ได้

## ใช้สีที่กำหนดเอง

ตอนนี้ เราสามารถทดสอบสีที่กำหนดเองใน `ContentView` ได้

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

ผลลัพธ์ที่แสดง:

![color](../../../Resource/031_color1.png)

ในตัวอย่างนี้ บรรทัดแรกใช้สีของระบบ:

```swift
.foregroundStyle(Color.blue)
```

สามบรรทัดถัดมาใช้สี Hex ที่กำหนดเอง:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

จากการเปรียบเทียบจะเห็นได้ว่า สีน้ำเงินของระบบมีเอฟเฟกต์เริ่มต้นเพียงแบบเดียว

แต่สี Hex สามารถแสดงการเปลี่ยนแปลงของสีน้ำเงินที่ละเอียดกว่าได้

นี่คือคุณค่าของสีที่กำหนดเอง: มันช่วยให้สีของอินเทอร์เฟซใกล้เคียงกับแบบออกแบบจริงมากขึ้น และยังช่วยให้เราควบคุมสไตล์ภาพของ App ได้สะดวกขึ้น

## ใช้ static เพื่อจัดระเบียบสี

ตอนนี้ เราสามารถสร้างสีผ่านสตริง Hex ได้แล้ว:

```swift
Color(hex: "#2c54c2")
```

รูปแบบการเขียนนี้ใช้งานได้ปกติ แต่ถ้าสีเดียวกันปรากฏซ้ำในหลายตำแหน่ง การดูแลรักษาภายหลังก็จะไม่สะดวกนัก

หากเขียนค่าสีนี้ไว้ใน 10 ตำแหน่ง แล้วภายหลังต้องการปรับสีน้ำเงินนี้ ก็ต้องแก้ทีละตำแหน่ง

ในกรณีนี้ เราสามารถใช้ `static` เพื่อจัดระเบียบสีที่ใช้บ่อยไว้รวมกัน

ที่ด้านล่างของไฟล์ `Color+Hex.swift` ให้เพิ่มโค้ดต่อไปนี้ต่อท้าย:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ในที่นี้ เราเพิ่ม static property สามตัวให้กับ `Color`: `animalBlue`, `animalLightBlue` และ `animalDarkBlue` ซึ่งแต่ละตัวแทนสีน้ำเงินที่มีความเข้มอ่อนต่างกัน

เพราะ property เหล่านี้ใช้ `static` ดังนั้นพวกมันจึงเป็นของชนิด `Color` เอง

เวลใช้งาน สามารถเข้าถึงได้โดยตรงผ่าน `Color.`:

```swift
Color.animalBlue
```

รูปแบบนี้ชัดเจนกว่าการเขียนสตริง Hex โดยตรง

เมื่อเราเห็น `Color.animalBlue` เราจะรู้ได้ว่ามันหมายถึงสีน้ำเงินที่ใช้ในสารานุกรมสัตว์

แต่เมื่อเห็น `Color(hex: "#2c54c2")` เรารู้เพียงว่ามันเป็นค่าสีหนึ่ง แต่ไม่ง่ายที่จะเห็นว่ามันใช้ทำอะไรโดยเฉพาะ

การจัดการสีแบบรวมศูนย์ยังมีข้อดีอีกอย่าง: การแก้ไขภายหลังสะดวกกว่า

หากต้องการปรับสีหลักของสารานุกรมสัตว์ เพียงแก้ในตำแหน่งที่นิยามไว้:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

ทุกตำแหน่งที่ใช้สีนี้จะอัปเดตไปพร้อมกัน

นี่คือความหมายของการใช้ `static` เพื่อจัดระเบียบสี: ทำให้ชื่อสีชัดเจนขึ้น และทำให้การดูแลรักษาภายหลังสะดวกขึ้น

## นำไปใช้กับสารานุกรมสัตว์

ตอนนี้ เราสามารถนำสีที่กำหนดเองไปใช้กับมุมมองสารานุกรมสัตว์ก่อนหน้าได้

ก่อนหน้านี้ พื้นหลังของปุ่มสัตว์เป็นสีขาว:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

ตอนนี้ เราสามารถเปลี่ยนเป็นสีที่กำหนดเอง:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

`Color.animalBlue` ในที่นี้ก็คือสีแบบ static ที่เราเพิ่งนิยามไว้ใน `Color+Hex.swift`

ข้อความบนปุ่มใช้สีขาว:

```swift
.foregroundStyle(Color.white)
```

พื้นหลังของ emoji สัตว์ใช้สีขาวแบบโปร่งแสงครึ่งหนึ่ง:

```swift
.background(Color.white.opacity(0.15))
```

แบบนี้ปุ่มจะเกิดสไตล์ภาพสีน้ำเงินที่เป็นหนึ่งเดียวกัน

จุดสำคัญของขั้นตอนนี้ไม่ใช่การเพิ่มโค้ดที่ซับซ้อน แต่คือการนำสีที่กำหนดเองซึ่งเรียนมาก่อนหน้าไปใช้กับอินเทอร์เฟซจริง

## ใช้พื้นหลังแบบไล่ระดับ

นอกจากการใช้สีเดียวแล้ว เรายังสามารถนำหลายสีมารวมกันเป็นเอฟเฟกต์ไล่ระดับได้

ตัวอย่างเช่น เราเคยนิยามสีเหล่านี้ไว้ก่อนหน้า:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

สีเหล่านี้ไม่เพียงใช้แยกกันได้ แต่ยังสามารถนำมารวมกันเป็นพื้นหลังแบบไล่ระดับได้ด้วย

ใน SwiftUI สามารถใช้ `LinearGradient` เพื่อสร้างการไล่ระดับแบบเส้นตรง

ตัวอย่างเช่น:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

โค้ดส่วนนี้จะสร้างพื้นหลังไล่ระดับจากซ้ายไปขวา โดยสีค่อย ๆ เปลี่ยนจาก `Color.animalBlue` ไปเป็น `Color.animalLightBlue`

ในนั้น `colors` ใช้กำหนดสีที่เข้าร่วมการไล่ระดับ ส่วน `startPoint` และ `endPoint` ใช้ควบคุมทิศทางของการไล่ระดับ

### ทดสอบเอฟเฟกต์ไล่ระดับ

เราสามารถใช้ Text แบบง่ายเพื่อทดสอบพื้นหลังไล่ระดับได้

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

ผลลัพธ์ที่แสดง:

![color](../../../Resource/031_color3.png)

ในตัวอย่างนี้ พื้นหลังของ `Text` ไม่ใช่สีเดียวอีกต่อไป แต่เป็นสีไล่ระดับที่ค่อย ๆ เปลี่ยนจากซ้ายไปขวา

เมื่อเทียบกับพื้นหลังสีธรรมดา พื้นหลังแบบไล่ระดับจะมีมิติมากกว่า และช่วยให้อินเทอร์เฟซเกิดจุดเน้นทางสายตาได้ง่ายขึ้น

## ใช้พื้นหลังไล่ระดับในสารานุกรมสัตว์

ตอนนี้ เราสามารถนำสีพื้นหลังของปุ่มสัตว์:

```swift
.background(Color.animalBlue)
```

เปลี่ยนเป็นพื้นหลังแบบไล่ระดับ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

โค้ดเต็มมีดังนี้:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

ผลลัพธ์ที่แสดง:

![color](../../../Resource/031_color4.png)

ตอนนี้ ปุ่มสัตว์ไม่ใช่เพียงพื้นหลังสีเดียวอีกต่อไป แต่มีเอฟเฟกต์ไล่ระดับจากซ้ายไปขวา

เมื่อเทียบกับพื้นหลังสีเดียว พื้นหลังแบบไล่ระดับช่วยให้อินเทอร์เฟซดูมีมิติมากขึ้น และใกล้เคียงกับงานออกแบบภาพใน App จริงมากขึ้น

## ความแตกต่างระหว่างพื้นหลังสีเดียวกับพื้นหลังไล่ระดับ

พื้นหลังสีเดียวใช้เพียงสีเดียว

ตัวอย่างเช่น:

```swift
.background(Color.animalBlue)
```

รูปแบบการเขียนนี้เรียบง่ายและชัดเจน เหมาะกับอินเทอร์เฟซพื้นฐานส่วนใหญ่

พื้นหลังไล่ระดับจะใช้หลายสี

ตัวอย่างเช่น:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

รูปแบบนี้ทำให้อินเทอร์เฟซมีมิติมากขึ้น แต่ก็เพิ่มความซับซ้อนทางสายตาได้ง่ายกว่าเช่นกัน

ดังนั้น ในการพัฒนาจริง สามารถเข้าใจได้แบบนี้:

พื้นหลังสีเดียวเหมาะกับข้อความทั่วไป ปุ่มทั่วไป การ์ดทั่วไป และพื้นหลังหน้าทั่วไป

พื้นหลังไล่ระดับเหมาะกับปุ่มสำคัญ พื้นที่ด้านบน การ์ดหน้าปก และทางเข้าฟังก์ชันที่ต้องการเน้น

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้วิธีใช้สีที่กำหนดเองใน SwiftUI

ก่อนอื่น เราเข้าใจสี Hex

ตัวอย่างเช่น:

```text
#2c54c2
```

มันแทนสีเฉพาะสีหนึ่ง

จากนั้น เราใช้ `extension Color` เพื่อขยายชนิด `Color`

ทำให้ SwiftUI สามารถสร้างสีด้วยวิธีต่อไปนี้:

```swift
Color(hex: "#2c54c2")
```

ต่อมา เราใช้ `static` เพื่อจัดระเบียบสีที่ใช้บ่อย:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

แบบนี้ ในมุมมองอื่นก็สามารถใช้งานได้โดยตรง:

```swift
Color.animalBlue
```

เมื่อเทียบกับการเขียนสตริง Hex ทุกครั้ง วิธีนี้ชัดเจนกว่า และสะดวกต่อการแก้ไขสีแบบรวมศูนย์ในภายหลัง

สุดท้าย เราได้เรียนรู้ `LinearGradient` และนำสีที่กำหนดเองมารวมกันเป็นพื้นหลังไล่ระดับ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

ผ่านบทเรียนนี้ เราได้ทำกระบวนการตั้งแต่ “สร้างสีที่กำหนดเอง” ไปจนถึง “ใช้สีในอินเทอร์เฟซจริง”

ต่อไป เมื่อมีสีที่ต้องใช้ซ้ำในหลายตำแหน่ง ควรพิจารณาจัดระเบียบไว้ใน extension ของ `Color` ก่อน

แบบนี้โค้ดจะชัดเจนขึ้น และสไตล์ของอินเทอร์เฟซก็จะเป็นหนึ่งเดียวกันได้ง่ายขึ้น
