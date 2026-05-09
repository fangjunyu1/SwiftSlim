# คุณสมบัติแบบคำนวณ

ในบทเรียนนี้ เราจะเรียนรู้เรื่อง property แบบคำนวณเป็นหลัก

Property แบบคำนวณใช้สำหรับคำนวณผลลัพธ์ใหม่จากข้อมูลที่มีอยู่แล้ว มันสามารถคำนวณค่าตัวเลขได้ และยังสามารถคำนวณเนื้อหาที่ต้องแสดงใน SwiftUI view ได้ด้วย

ตัวอย่างเช่น:

```swift
let a = 10
let b = 20
let c = a + b
```

ในที่นี้ `c` หมายถึงผลลัพธ์หลังจากนำ `a` และ `b` มาบวกกัน

ในโค้ดทั่วไป การเขียนแบบนี้พบได้บ่อยมาก

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

คำแนะนำ: ใน click event ของ `Button` สามารถเขียนและรันโค้ด Swift ปกติได้

แต่ถ้านำโค้ดลักษณะเดียวกันไปเขียนโดยตรงใน property ของ SwiftUI view จะเกิดปัญหา

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

โค้ดนี้จะเกิด error

เมื่อดูเผิน ๆ เหมือนว่า `a` และ `b` ถูกเขียนไว้ก่อน `c` แล้ว ดังนั้นดูเหมือนว่าน่าจะคำนวณค่า `c` ได้

แต่เมื่อประกาศ property ภายใน struct จะไม่สามารถใช้วิธีเขียนแบบนี้โดยตรงได้

## ทำไม c จึงไม่สามารถคำนวณเป็น a + b ได้โดยตรง

เพราะ `a`, `b`, `c` ไม่ใช่ constant ชั่วคราวที่อยู่ใน click event ของปุ่ม แต่เป็น property ของ view `ContentView`

ใน click event ของปุ่ม โค้ดนี้สามารถทำงานได้ตามปกติ:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

เพราะหลังจากกดปุ่มแล้ว โค้ดจะทำงานตามลำดับ ขั้นแรกสร้าง `a` จากนั้นสร้าง `b` และสุดท้ายใช้ `a + b` เพื่อคำนวณ `c`

แต่เมื่อประกาศ property ภายใน view สถานการณ์จะแตกต่างกัน:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ในที่นี้ `a`, `b`, `c` ทั้งหมดเป็น property ของ view `ContentView`

เมื่อสร้าง view `ContentView` Swift ต้องเตรียม property เหล่านี้ก่อน เพื่อให้กระบวนการสร้างปลอดภัย Swift จึงไม่อนุญาตให้ค่าเริ่มต้นของ instance stored property หนึ่งอ่าน instance property อื่นภายใน instance เดียวกันโดยตรง

ดังนั้นบรรทัดนี้จะเกิด error:

```swift
let c = a + b
```

สามารถเข้าใจง่าย ๆ ได้ว่า: **เมื่อประกาศ property ภายใน view ไม่สามารถใช้ property ปกติหนึ่งตัวเพื่อคำนวณ property ปกติอีกตัวโดยตรงได้**

property ที่เก็บค่าไว้โดยตรงแบบนี้เรียกว่า “stored property” เพื่อให้เข้าใจง่าย ในตอนนี้อาจมองว่าเป็น property ปกติก่อนได้

ตัวอย่างเช่น:

```swift
let a = 10
```

`a` เก็บค่า `10`

```swift
let b = 20
```

`b` เก็บค่า `20`

แต่:

```swift
let c = a + b
```

ในที่นี้ `c` ไม่ใช่ค่าคงที่ที่เขียนไว้โดยตรง แต่ต้องการให้คำนวณจาก `a + b`

สถานการณ์แบบ “ได้ผลลัพธ์จากข้อมูลที่มีอยู่แล้ว” เหมาะกับการใช้ property แบบคำนวณมากกว่า

สามารถแก้เป็นแบบนี้:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

ในที่นี้ `c` คือ property แบบคำนวณ

```swift
var c: Int {
    return a + b
}
```

ความหมายคือ: **เมื่อจำเป็นต้องใช้ `c` จึงค่อยอ่าน `a` และ `b` แล้ว return ผลลัพธ์ของ `a + b` ออกไป**

ตัวอย่างเช่น:

```swift
Text("c: \(c)")
```

เมื่อ `Text` แสดง `c` จึงจะเริ่มคำนวณ `c`

## Property แบบคำนวณคืออะไร?

Property แบบคำนวณดูเหมือน variable แต่ตัวมันเองไม่ได้เก็บข้อมูล

ตัวอย่างเช่น:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ในที่นี้ `c` คือ property แบบคำนวณ

มันจะไม่เก็บค่าคงที่เหมือน property ปกติ แต่ทุกครั้งที่อ่าน `c` โค้ดภายใน `{}` จะถูกเรียกใช้อีกครั้ง แล้ว return ผลลัพธ์ที่คำนวณได้

สามารถเข้าใจแบบนี้:

```swift
var c: Int {
    return a + b
}
```

เมื่อจำเป็นต้องใช้ `c` ก็จะคำนวณ `a + b`

ดังนั้น property แบบคำนวณจึงเหมาะกับสถานการณ์นี้: **ผลลัพธ์หนึ่งไม่จำเป็นต้องเก็บแยกไว้ เพราะสามารถคำนวณจากข้อมูลที่มีอยู่แล้วได้**

## รูปแบบการเขียนพื้นฐาน

Property แบบคำนวณมักประกอบด้วยสามส่วน:

```swift
var c: Int {
    return a + b
}
```

### 1. ประกาศด้วย `var`

```swift
var c
```

Property แบบคำนวณต้องประกาศด้วย `var` ไม่สามารถใช้ `let` ได้

เพราะ property แบบคำนวณไม่ใช่ค่าคงที่ที่ถูกเก็บไว้ แต่เป็นผลลัพธ์ที่ถูกคำนวณแบบ dynamic ทุกครั้งที่ถูกอ่าน

### 2. ระบุ return type

```swift
var c: Int
```

Property แบบคำนวณต้องระบุ return type

ในที่นี้ `c` จะ return จำนวนเต็ม ดังนั้น type คือ `Int`

### 3. เขียน logic การคำนวณใน {}

```swift
{
    return a + b
}
```

ภายใน `{}` เขียน logic การคำนวณ ในที่นี้ return ผลลัพธ์คือ `a + b`

## คีย์เวิร์ด return

Property แบบคำนวณต้อง return ผลลัพธ์หนึ่งค่า

ตัวอย่างเช่น:

```swift
var c: Int {
    return a + b
}
```

ในที่นี้ `return` หมายถึง: ส่งผลลัพธ์จากการคำนวณ `a + b` ออกไป

ถ้าใน property แบบคำนวณมี expression เพียงหนึ่งบรรทัดที่ให้ผลลัพธ์โดยตรง สามารถละ `return` ได้:

```swift
var c: Int {
    a + b
}
```

แต่ถ้า property แบบคำนวณมีโค้ดหลายบรรทัด ต้องใช้ `return` เพื่อระบุผลลัพธ์ที่จะส่งกลับอย่างชัดเจน

ตัวอย่างเช่น:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ในที่นี้กระบวนการคำนวณแบ่งเป็นสองขั้นตอน

ขั้นตอนแรก คำนวณราคารวม:

```swift
let total = count * price
```

ขั้นตอนที่สอง นำราคารวมมาต่อเป็นข้อความ แล้ว return ออกไป:

```swift
return "Total：\(total) $"
```

ถ้าลบ `return` ออก:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

โค้ดนี้จะเกิด error

เหตุผลคือ: **property แบบคำนวณนี้มีโค้ดหลายบรรทัดแล้ว Swift ไม่สามารถตัดสินใจเองได้ว่าบรรทัดใดคือผลลัพธ์สุดท้ายที่ต้อง return**

ดังนั้น ถ้า property แบบคำนวณมี expression เพียงบรรทัดเดียวที่ให้ผลลัพธ์ สามารถละ `return` ได้

```swift
var c: Int {
    a + b
}
```

ถ้า property แบบคำนวณมีโค้ดหลายบรรทัด แนะนำให้เขียน `return` ให้ชัดเจน

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## ความแตกต่างระหว่าง property แบบคำนวณกับ property ปกติ

Property ปกติจะเก็บข้อมูล

```swift
var c = 30
```

ในที่นี้ `c` เก็บค่าที่ชัดเจนคือ `30`

Property แบบคำนวณไม่เก็บข้อมูล

```swift
var c: Int {
    a + b
}
```

ในที่นี้ `c` ไม่ได้เก็บ `30` มันเพียงให้วิธีการคำนวณเท่านั้น

เมื่ออ่าน `c` Swift จะรัน:

```swift
a + b
```

จากนั้น return ผลลัพธ์ที่คำนวณได้

ดังนั้น property แบบคำนวณจึงเหมาะกับสถานการณ์ที่ต้องคำนวณผลลัพธ์จากข้อมูลอื่น

## body ก็เป็น property แบบคำนวณ

หลังจากเรียนรู้ property แบบคำนวณแล้ว เราสามารถทำความเข้าใจโค้ดที่พบได้บ่อยที่สุดใน SwiftUI อีกครั้ง:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ในที่นี้ `body` ก็เป็น property แบบคำนวณเช่นกัน

มันถูกประกาศด้วย `var`:

```swift
var body
```

มันมี return type:

```swift
some View
```

สิ่งที่ return ภายใน `{}` คือเนื้อหาของ SwiftUI view:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

ดังนั้นสามารถเข้าใจ `body` ได้ว่า: เมื่อ SwiftUI ต้องแสดง view นี้ SwiftUI จะอ่าน `body` แล้วสร้าง interface จากเนื้อหาที่ `body` return

ถ้าเขียน `return` จะเข้าใจได้แบบนี้:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

แต่ใน SwiftUI โดยทั่วไปเราจะละ `return` แล้วเขียนตรง ๆ แบบนี้:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

เมื่อข้อมูล `@State` เปลี่ยน SwiftUI จะอ่าน `body` อีกครั้ง แล้วอัปเดต interface ตามข้อมูลใหม่

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

หลังจากกดปุ่ม `count` จะเปลี่ยน

```swift
count += 1
```

เมื่อ `count` เปลี่ยน SwiftUI จะคำนวณ `body` ใหม่ ดังนั้นข้อความใน interface ก็จะอัปเดตด้วย

```swift
Text("count: \(count)")
```

นี่ก็เป็นเหตุผลที่ใน SwiftUI เมื่อข้อมูลเปลี่ยนแล้ว interface สามารถ refresh อัตโนมัติได้

### ไม่แนะนำให้เขียนการคำนวณที่ซับซ้อนใน body

เนื่องจาก `body` เป็น property แบบคำนวณ มันอาจถูกอ่านและคำนวณใหม่หลายครั้ง

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

เมื่อ `name` เปลี่ยน SwiftUI จะคำนวณ `body` ใหม่

ในตอนนั้น โค้ดภายใน `body` ก็จะถูกรันใหม่ และ `num` ก็จะถูกสร้างใหม่ด้วย

```swift
let num = 10
```

ในตัวอย่างนี้ `num` ง่ายมาก จึงแทบไม่มีผลกระทบ

แต่ถ้าทำการคำนวณที่ซับซ้อนใน `body` เช่น filter ข้อมูลจำนวนมาก, sort ข้อมูล, process รูปภาพ และอื่น ๆ อาจส่งผลต่อความลื่นไหลของ interface ได้

ดังนั้นใน SwiftUI `body` ควรมีหน้าที่หลักในการอธิบายโครงสร้างของ interface

ข้อมูลชั่วคราวที่เรียบง่ายสามารถเขียนใน `body` ได้

ส่วนการคำนวณที่ซับซ้อนควรพิจารณาย้ายไปไว้ข้างนอก `body` เช่น property แบบคำนวณ, method หรือส่วนประมวลผลข้อมูลแยกต่างหาก

## ตัวอย่าง: จำนวนและราคารวม

ต่อไป เราจะใช้ตัวอย่างง่าย ๆ เพื่อทำความเข้าใจ property แบบคำนวณ

สมมติว่าแครอทหนึ่งชิ้นราคา 2 $ ผู้ใช้สามารถกดปุ่มเพื่อเปลี่ยนจำนวนที่ต้องการซื้อ และ interface ต้องแสดงราคารวม

วิธีคำนวณราคารวมคือ:

```text
จำนวน * ราคาต่อชิ้น
```

ถ้าใช้ variable ปกติเก็บราคารวม จะค่อนข้างยุ่งยาก

เพราะทุกครั้งที่จำนวนเปลี่ยน จะต้องอัปเดตราคารวมด้วยตนเอง

วิธีที่ดีกว่าคือใช้ property แบบคำนวณ:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../Resource/024_view.png)

ในตัวอย่างนี้:

```swift
@State private var count = 1
```

`count` หมายถึงจำนวนแครอท เมื่อกดปุ่ม `count` จะเปลี่ยน

```swift
private let price = 2
```

`price` หมายถึงราคาต่อชิ้นของแครอท ในที่นี้เป็นค่าคงที่ จึงใช้ `let`

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` หมายถึงราคารวม

ไม่จำเป็นต้องเก็บแยกไว้ เพราะราคารวมสามารถคำนวณได้เสมอจาก `count * price`

เมื่อ `count` เป็น `1`:

```swift
totalPrice = 1 * 2
```

ผลลัพธ์ที่แสดงคือ:

```swift
totalPrice: 2 $
```

หลังจากกดปุ่ม `+` แล้ว `count` จะกลายเป็น `2`

เมื่ออ่าน `totalPrice` อีกครั้ง มันจะคำนวณใหม่:

```swift
totalPrice = 2 * 2
```

ผลลัพธ์ที่แสดงคือ:

```swift
totalPrice: 4 $
```

นี่คือหน้าที่ของ property แบบคำนวณ: คำนวณผลลัพธ์ใหม่แบบ dynamic จากข้อมูลที่มีอยู่แล้ว

## Property แบบคำนวณสามารถใช้สำหรับการตรวจสอบเงื่อนไขได้

Property แบบคำนวณไม่เพียงคำนวณตัวเลขได้ แต่ยังสามารถ return ผลลัพธ์ของการตรวจสอบเงื่อนไขได้ด้วย

ตัวอย่างเช่น เมื่อเราต้องการให้จำนวนต่ำสุดเป็น 1

เมื่อจำนวนเป็น 1 อยู่แล้ว ปุ่ม `-` ไม่ควรลดลงต่อ

เราสามารถเพิ่ม property แบบคำนวณได้:

```swift
private var canDecrease: Bool {
    count > 1
}
```

โค้ดเต็ม:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../Resource/024_view1.png)

ในที่นี้:

```swift
private var canDecrease: Bool {
    count > 1
}
```

โค้ดนี้หมายถึง ตอนนี้ยังสามารถลดจำนวนได้หรือไม่

เมื่อ `count` มากกว่า `1`:

```swift
canDecrease == true
```

หมายความว่าสามารถลดได้

เมื่อ `count` เท่ากับ `1`:

```swift
canDecrease == false
```

หมายความว่าไม่สามารถลดต่อได้แล้ว

### การตรวจสอบเงื่อนไขในปุ่ม

ภายในปุ่มใช้โค้ดนี้:

```swift
if canDecrease {
    count -= 1
}
```

เฉพาะเมื่อ `canDecrease` เป็น `true` เท่านั้น จึงจะลด `count` ได้

### ควบคุม foreground color ของ view

สามารถใช้ `canDecrease` เพื่อควบคุม foreground color ของปุ่มได้ด้วย:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ในที่นี้ใช้ ternary operator:

```swift
canDecrease ? Color.primary : Color.gray
```

ความหมายของโค้ดนี้คือ ถ้า `canDecrease` เป็น `true` ให้ foreground color ใช้ `Color.primary`; ถ้า `canDecrease` เป็น `false` ให้ foreground color ใช้ `Color.gray`

`Color.primary` คือ system semantic color ที่ SwiftUI มีให้ หมายถึงสีข้อความหลักใน interface ปัจจุบัน

ใน Light Mode โดยทั่วไป `Color.primary` จะใกล้เคียงสีดำ ส่วนใน Dark Mode โดยทั่วไปจะใกล้เคียงสีขาว

ดังนั้นข้อดีของการใช้ `Color.primary` คือ มันจะปรับให้เหมาะกับ Light Mode และ Dark Mode โดยอัตโนมัติ

### ควบคุมสถานะ disabled ของ view

`disabled` ใช้สำหรับควบคุมว่า view อยู่ในสถานะ disabled หรือไม่:

```swift
.disabled(!canDecrease)
```

เมื่อ `disabled` เป็น `false` จะสามารถกด view ได้

เมื่อ `disabled` เป็น `true` view จะอยู่ในสถานะ disabled และไม่สามารถกดได้

ในที่นี้ใช้ `canDecrease` เป็นเงื่อนไข ทำให้โค้ดเข้าใจง่ายขึ้น

เมื่อเห็น `canDecrease` ก็จะเข้าใจได้ทันทีว่ามันหมายถึง “ตอนนี้ยังลดต่อได้หรือไม่”

### คำอธิบายเพิ่มเติม: ทำไมต้องตรวจสอบสองครั้ง?

ในปุ่ม `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ในที่นี้ใช้ทั้ง `.disabled(!canDecrease)` และ `if canDecrease` ภายในปุ่ม

`.disabled(!canDecrease)` ทำหน้าที่ปิดใช้งานปุ่มในระดับ interface เพื่อไม่ให้ผู้ใช้กดได้

`if canDecrease` ทำหน้าที่ตรวจสอบอีกครั้งก่อนโค้ดทำงาน เฉพาะเมื่อสามารถลดได้ จึงจะรัน `count -= 1`

นี่ถือเป็นการป้องกันสองชั้น ในการพัฒนาจริง ถ้าปุ่มถูก disabled แล้ว สามารถละเงื่อนไขภายในได้ แต่ในตัวอย่างเพื่อการสอน การเก็บไว้จะช่วยให้เห็นบทบาทของ `canDecrease` ชัดเจนขึ้น

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้เรื่อง property แบบคำนวณเป็นหลัก

Property แบบคำนวณไม่ได้เก็บค่าโดยตรง แต่เมื่อถูกอ่าน มันจะคำนวณผลลัพธ์จากข้อมูลที่มีอยู่แล้ว

ตัวอย่างเช่น:

```swift
var c: Int {
    a + b
}
```

ในที่นี้ `c` ไม่จำเป็นต้องเก็บแยกไว้ เพราะสามารถคำนวณได้จาก `a + b`

Property แบบคำนวณต้องประกาศด้วย `var` และต้องระบุ return type

```swift
var canDecrease: Bool {
    count > 1
}
```

Property แบบคำนวณไม่เพียง return ค่าตัวเลขได้ แต่ยังสามารถ return ผลลัพธ์ของเงื่อนไข, เนื้อหาข้อความ หรือแม้กระทั่งเนื้อหาของ SwiftUI view ได้

ในบทเรียนนี้ เรายังได้เรียนรู้ `return`

`return` หมายถึงการส่งผลลัพธ์กลับ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

ถ้าใน property แบบคำนวณมี expression เพียงหนึ่งบรรทัดที่ให้ผลลัพธ์โดยตรง สามารถละ `return` ได้

```swift
var totalPrice: Int {
    count * price
}
```

นอกจากนี้ เรายังได้รู้จัก `Color.primary` และ `disabled`

`Color.primary` คือ system semantic color ของ SwiftUI ซึ่งจะปรับการแสดงผลโดยอัตโนมัติตาม Light Mode และ Dark Mode

```swift
.foregroundStyle(Color.primary)
```

`disabled` ใช้สำหรับควบคุมว่า view ถูกปิดใช้งานหรือไม่

```swift
.disabled(true)
```

หมายถึง disabled ไม่สามารถกดได้

```swift
.disabled(false)
```

หมายถึงใช้งานได้ สามารถกดได้

ดังนั้น property แบบคำนวณจึงพบได้บ่อยมากใน SwiftUI มันช่วยให้เราจัดระเบียบผลลัพธ์จากการคำนวณ เงื่อนไข และเนื้อหาที่แสดงได้ชัดเจนยิ่งขึ้น
