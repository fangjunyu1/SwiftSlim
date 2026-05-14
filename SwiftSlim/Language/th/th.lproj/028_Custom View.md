# มุมมองแบบกำหนดเอง

ในบทเรียนนี้ เราจะเรียนรู้รูปแบบการเขียน SwiftUI ที่สำคัญมากอย่างหนึ่ง: **มุมมองแบบกำหนดเอง**。

มุมมองแบบกำหนดเองสามารถห่อหุ้มโค้ดมุมมองที่ซ้ำกันให้กลายเป็นมุมมองที่สามารถนำกลับมาใช้ซ้ำได้หลายครั้ง

ในการพัฒนา App จริง เรามักพบสถานการณ์แบบนี้: โครงสร้างของหลายหน้าจอเหมือนกัน แต่เนื้อหาที่แสดงต่างกัน

เช่น รายการโพสต์ในเว็บไซต์ฟอรัม แต่ละโพสต์อาจมีข้อมูลอย่างชื่อเรื่อง รูปภาพ จำนวนไลก์ เป็นต้น

![Reddit](../../../Resource/028_view1.png)

รายการสินค้าในเว็บไซต์ช้อปปิ้ง แต่ละสินค้าอาจมีข้อมูลอย่างรูปภาพ ชื่อ และราคา เป็นต้น

![Amazon](../../../Resource/028_view2.png)

โครงสร้างของเนื้อหาเหล่านี้คล้ายกัน ความแตกต่างมีเพียงข้อมูลที่แสดงไม่เหมือนกัน

ถ้าเขียนโค้ดของแต่ละรายการด้วยมือทั้งหมด โค้ดจะยาวมาก และไม่สะดวกต่อการแก้ไขในภายหลัง

ดังนั้น เราสามารถห่อหุ้มโครงสร้างที่เหมือนกันให้เป็นมุมมองแบบกำหนดเอง แล้วส่งเนื้อหาที่ต่างกันเข้าไปเป็นพารามิเตอร์

ด้วยวิธีนี้ มุมมองเดียวกันก็สามารถแสดงเนื้อหาที่แตกต่างกันได้

## สถานการณ์ความต้องการ

ตัวอย่างเช่น ตอนนี้เราต้องการสร้างรายการการตั้งค่า

ผลลัพธ์ที่แสดง:

![view](../../../Resource/028_view.png)

ในรายการการตั้งค่านี้ มีรายการตั้งค่าที่แตกต่างกันสามรายการ ได้แก่ `การตั้งค่า`、`โฟลเดอร์`、`เพลง`

แม้ว่าไอคอน สี และชื่อเรื่องของรายการเหล่านี้จะแตกต่างกัน แต่โครงสร้างโดยรวมเหมือนกัน:

- ไอคอนด้านซ้าย
- สีพื้นหลังของไอคอน
- ชื่อเรื่องตรงกลาง
- ลูกศรด้านขวา

ถ้าไม่ใช้มุมมองแบบกำหนดเอง เราอาจเขียนแบบนี้:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("การตั้งค่า")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("โฟลเดอร์")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("เพลง")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

โค้ดส่วนนี้สามารถแสดงผลได้ตามปกติ แต่ปัญหาก็ชัดเจนมากเช่นกัน: โค้ดของรายการตั้งค่าทั้งสามรายการเกือบเหมือนกันทั้งหมด

ส่วนที่แตกต่างกันมีเพียงไอคอน สี และชื่อเรื่อง:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("การตั้งค่า")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("โฟลเดอร์")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("เพลง")
```

กล่าวคือ โครงสร้างของแต่ละรายการตั้งค่าเป็นแบบตายตัว มีเพียงไอคอน สี และชื่อเรื่องที่แตกต่างกัน

สถานการณ์แบบนี้เหมาะมากสำหรับการใช้มุมมองแบบกำหนดเอง

### เงา shadow

ที่นี่เราใช้ modifier ใหม่ `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` สามารถเพิ่มเงาให้กับมุมมองได้

`radius` หมายถึงรัศมีการเบลอของเงา ยิ่งค่ามาก ขอบเขตการกระจายของเงามักยิ่งกว้าง และดูนุ่มนวลมากขึ้น

ที่นี่ตั้งค่าเป็น `1` หมายถึงเพิ่มเอฟเฟกต์เงาเพียงเล็กน้อยเท่านั้น

## ห่อหุ้มมุมมองรายการตั้งค่า

ต่อไป เราจะห่อหุ้มรายการตั้งค่าแต่ละรายการให้เป็นมุมมองใหม่

สามารถสร้าง `SettingItemView` ได้:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ในมุมมองนี้ เรากำหนดพร็อพเพอร์ตีสามตัว:

```swift
let icon: String
let color: Color
let title: String
```

โดยมีความหมายดังนี้:

- `icon` หมายถึงชื่อไอคอน
- `color` หมายถึงสีพื้นหลังของไอคอน
- `title` หมายถึงชื่อรายการตั้งค่า

เพราะเนื้อหาทั้งสามอย่างนี้แตกต่างกันในแต่ละรายการตั้งค่า ดังนั้นเราจึงทำให้เป็นพารามิเตอร์ที่สามารถส่งเข้ามาจากภายนอกได้

## ใช้มุมมองแบบกำหนดเอง

เมื่อมี `SettingItemView` แล้ว เราก็ไม่จำเป็นต้องเขียนโค้ด `HStack` ยาว ๆ ซ้ำอีก

ตอนนี้สามารถใช้งานแบบนี้ได้:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")
```

โค้ดบรรทัดนี้หมายถึงการสร้างมุมมองรายการตั้งค่าหนึ่งรายการ และส่งพารามิเตอร์สามตัวเข้าไป:

```swift
icon: "gear"
color: Color.blue
title: "การตั้งค่า"
```

หลังจากส่งเข้าไปแล้ว พร็อพเพอร์ตีภายใน `SettingItemView` จะได้รับค่าที่สอดคล้องกัน:

- ค่าของ `icon` คือ `gear`
- ค่าของ `color` คือ `Color.blue`
- ค่าของ `title` คือ `"การตั้งค่า"`

ดังนั้น `Image(systemName: icon)` ภายในมุมมองจะแสดงไอคอนรูปเฟือง `.background(color)` จะใช้พื้นหลังสีน้ำเงิน และ `Text(title)` จะแสดง `การตั้งค่า`

โค้ดเต็ม:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "โฟลเดอร์")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "เพลง")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/028_view.png)

จะเห็นได้ว่า หลังจากห่อหุ้มแล้ว ผลลัพธ์ที่แสดงยังเหมือนเดิม แต่โค้ดชัดเจนขึ้น

เดิมทีแต่ละรายการตั้งค่าต้องเขียน `HStack` ทั้งชุด ตอนนี้ใช้เพียงโค้ดหนึ่งบรรทัด:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")
```

นี่คือบทบาทของมุมมองแบบกำหนดเอง: **ห่อหุ้มโครงสร้างมุมมองที่ซ้ำกัน แล้วส่งเฉพาะเนื้อหาที่แตกต่างกันเข้าไปเป็นพารามิเตอร์**

## ทำไมจึงส่งพารามิเตอร์ได้

ต่อไป เราจะทำความเข้าใจอย่างง่ายว่า ทำไมมุมมองแบบกำหนดเองจึงส่งพารามิเตอร์ได้

ใน SwiftUI มุมมองโดยพื้นฐานแล้วคือโครงสร้างชนิดหนึ่ง

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    var body: some View {
        Text("สวัสดี โลก!")
    }
}
```

ที่นี่ `ContentView` คือโครงสร้าง

เมื่อเราเขียน:

```swift
ContentView()
```

จริง ๆ แล้วคือการสร้างมุมมอง `ContentView`

เครื่องหมาย `()` ด้านหลังหมายถึงการเรียกเมธอดเริ่มต้นของมัน และสามารถเข้าใจได้ว่าเป็นการสร้างมุมมองนี้

เพราะ `ContentView` นี้ไม่มีพร็อพเพอร์ตีที่ต้องส่งค่าจากภายนอก จึงสามารถเขียนได้โดยตรงว่า:

```swift
ContentView()
```

แต่ถ้าในมุมมองมีพร็อพเพอร์ตีที่ยังไม่ได้กำหนดค่า ก็ต้องส่งค่าที่สอดคล้องกันตอนสร้างมุมมอง

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ชื่อ: \(name)")
    }
}
```

ที่นี่ `name` เป็นพร็อพเพอร์ตี และไม่มีค่าเริ่มต้น

ดังนั้นตอนสร้าง `ContentView` ต้องให้ค่าเฉพาะกับ `name`:

```swift
ContentView(name: "Fang Junyu")
```

แบบนี้ ภายในมุมมองจึงจะสามารถใช้ค่านี้ได้:

```swift
Text("ชื่อ: \(name)")
```

นี่ก็เป็นเหตุผลที่เราต้องส่งพารามิเตอร์เมื่อสร้าง `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")
```

เพราะใน `SettingItemView` มีพร็อพเพอร์ตีสามตัวที่ไม่มีค่าเริ่มต้น:

```swift
let icon: String
let color: Color
let title: String
```

ดังนั้นตอนสร้างมุมมองนี้ จึงต้องส่งค่าเหล่านี้เข้าไป พารามิเตอร์ที่ส่งเข้าไปจะถูก Swift ใช้เพื่อกำหนดค่าให้พร็อพเพอร์ตีภายในมุมมอง

## เมธอดเริ่มต้น

ต่อไป เราจะทำความเข้าใจเมธอดเริ่มต้นเพิ่มเติมอีกเล็กน้อย

### เมธอดเริ่มต้นแบบค่าเริ่มต้น

เมื่อเรากำหนดมุมมองทั่วไป:

```swift
struct ContentView: View {
    var body: some View {
        Text("สวัสดี โลก!")
    }
}
```

ในโค้ดส่วนนี้ เราไม่ได้เขียนเมธอดเริ่มต้นด้วยตัวเอง

แต่เมื่อเราใช้มุมมองนี้ สามารถเขียนแบบนี้ได้:

```swift
ContentView()
```

ที่นี่ `()` จริง ๆ แล้วหมายถึงการสร้าง `ContentView` และสามารถเข้าใจได้ว่าเป็นการเรียกเมธอดเริ่มต้นของมัน

### ทำไมไม่มีเมธอดเริ่มต้น แต่ยังเรียกได้?

เพราะคอมไพเลอร์ Swift จะช่วยสร้างเมธอดเริ่มต้นให้เราโดยอัตโนมัติ

ต้องสังเกตว่า **เมธอดเริ่มต้นนี้ถูกสร้างขึ้นโดยอัตโนมัติ โดยปกติเราจะไม่เห็นมันโดยตรงในโค้ด**

กล่าวคือ แม้ว่าเราไม่ได้เขียนใน `struct` ด้วยตัวเองว่า:

```swift
init() {

}
```

แต่คอมไพเลอร์ Swift จะช่วยสร้างเมธอดเริ่มต้นลักษณะคล้ายแบบนี้ให้เราอยู่เบื้องหลัง:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("สวัสดี โลก!")
    }
}
```

นี่คือเหตุผลที่เราสามารถเขียนได้โดยตรงว่า:

```swift
ContentView()
```

ดังนั้น ในโค้ดจริง เรามักไม่จำเป็นต้องเขียนเมธอดเริ่มต้นออกมาด้วยตัวเอง

เพียงต้องเข้าใจประเด็นหนึ่ง: **เมื่อสร้างมุมมอง SwiftUI จะมีการเรียกเมธอดเริ่มต้นของมุมมองนั้น แม้เราไม่ได้เขียนเมธอดเริ่มต้นเอง Swift ก็อาจช่วยสร้างให้โดยอัตโนมัติ**

### เมธอดเริ่มต้นที่มีพารามิเตอร์

ถ้าในมุมมองมีพร็อพเพอร์ตีหนึ่งตัวที่ไม่มีค่าเริ่มต้น เช่น:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ชื่อ: \(name)")
    }
}
```

คอมไพเลอร์ Swift จะสร้างเมธอดเริ่มต้นที่มีพารามิเตอร์โดยอัตโนมัติตามพร็อพเพอร์ตี

สามารถเข้าใจอย่างง่ายว่า:

```swift
init(name: String) {
    self.name = name
}
```

ตรงนี้:

```swift
init(name: String)
```

หมายถึง ตอนสร้าง `ContentView` ต้องส่งพารามิเตอร์ `name` ชนิด `String` เข้าไป

เมื่อเราเขียน:

```swift
ContentView(name: "Fang Junyu")
```

ความหมายคือ: ส่ง `"Fang Junyu"` เข้าไปเป็นพารามิเตอร์ให้เมธอดเริ่มต้น

จากนั้นภายในเมธอดเริ่มต้นจะทำงานว่า:

```swift
self.name = name
```

โค้ดบรรทัดนี้หมายถึง: นำ `name` ที่ส่งเข้ามาจากภายนอก ไปกำหนดให้พร็อพเพอร์ตี `name` ของมุมมองปัจจุบันเอง

สามารถเข้าใจอย่างง่ายว่า:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ชื่อ: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

ด้วยวิธีนี้ ภายในมุมมองก็สามารถใช้ค่าที่ส่งเข้ามาได้

นี่คือกระบวนการเริ่มต้นของมุมมองที่มีพารามิเตอร์: **เมื่อพร็อพเพอร์ตีภายในมุมมองไม่มีค่าเริ่มต้น ตอนสร้างมุมมองก็ต้องส่งพารามิเตอร์ที่สอดคล้องกันเข้าไป เพื่อให้เมธอดเริ่มต้นกำหนดค่าให้พร็อพเพอร์ตี**

## กรณีที่พร็อพเพอร์ตีมีค่าเริ่มต้น

ถ้าพร็อพเพอร์ตีมีค่าเริ่มต้นอยู่แล้ว ตอนสร้างมุมมองก็สามารถไม่ส่งพารามิเตอร์ได้

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ชื่อ: \(name)")
    }
}
```

ที่นี่ `name` มีค่าเริ่มต้นอยู่แล้ว:

```swift
"Fang Junyu"
```

ดังนั้นตอนสร้าง `ContentView` สามารถเขียนได้โดยตรงว่า:

```swift
ContentView()
```

ในตอนนี้ `name` จะใช้ค่าเริ่มต้น และหน้าจอจะแสดง:

```swift
ชื่อ: Fang Junyu
```

แน่นอน ตอนสร้างมุมมองก็สามารถส่งค่าใหม่เข้าไปได้เช่นกัน:

```swift
ContentView(name: "Sam")
```

ในตอนนี้ มุมมองจะใช้ `"Sam"` ที่ส่งเข้ามาจากภายนอก แทนการใช้ค่าเริ่มต้น และหน้าจอจะแสดง:

```swift
ชื่อ: Sam
```

เพื่อให้เข้าใจง่าย สามารถมองเมธอดเริ่มต้นที่คอมไพเลอร์ Swift สร้างให้อัตโนมัติอย่างง่ายได้แบบนี้:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ตรงนี้ `name: String = "Fang Junyu"` หมายถึง: ถ้าตอนสร้างมุมมองไม่ได้ส่ง `name` เข้ามา ก็ใช้ค่าเริ่มต้น `"Fang Junyu"`; ถ้าตอนสร้างมุมมองส่ง `name` ใหม่เข้ามา ก็ใช้ค่าที่ส่งเข้ามา

กล่าวคือ: **ถ้าภายนอกไม่ได้ส่งพารามิเตอร์เข้ามา ก็ใช้ค่าเริ่มต้นของพร็อพเพอร์ตี; ถ้าภายนอกส่งพารามิเตอร์เข้ามา ก็ใช้ค่าที่ส่งเข้ามา**

## กลับมาที่ SettingItemView

ตอนนี้เรากลับมาดู SettingItemView อีกครั้ง:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

โครงสร้างของมุมมองนี้เป็นแบบตายตัว

ส่วนที่ตายตัวประกอบด้วย:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

ส่วนที่แตกต่างกันประกอบด้วย:

```swift
icon
color
title
```

ดังนั้น เราจึงทำให้เนื้อหาที่แตกต่างกันเป็นพร็อพเพอร์ตี และส่งเข้ามาเป็นพารามิเตอร์ตอนสร้างมุมมอง

เมื่อเราสร้างรายการตั้งค่าที่แตกต่างกัน เพียงต้องส่งพารามิเตอร์ที่ต่างกันเข้าไป:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")
SettingItemView(icon: "folder", color: Color.brown, title: "โฟลเดอร์")
SettingItemView(icon: "music.note", color: Color.purple, title: "เพลง")
```

ด้วยวิธีนี้ `SettingItemView` ตัวเดียวกันก็สามารถแสดงรายการตั้งค่าที่แตกต่างกันสามรายการได้

นี่คือวิธีใช้มุมมองแบบกำหนดเองที่พบบ่อยที่สุด

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้มุมมองแบบกำหนดเอง

บทบาทหลักของมุมมองแบบกำหนดเองคือ: **ห่อหุ้มโค้ดมุมมองที่ซ้ำกัน เพื่อให้สามารถนำกลับมาใช้ซ้ำได้**

ในตัวอย่างนี้ โครงสร้างของรายการตั้งค่าทั้งสามรายการเหมือนกัน มีเพียงไอคอน สี และชื่อเรื่องที่แตกต่างกัน

ดังนั้นเราจึงสร้าง `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

จากนั้น เมื่อใช้มุมมองนี้ เราจะส่งพารามิเตอร์ที่แตกต่างกันเข้าไป:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "การตั้งค่า")
```

พารามิเตอร์เหล่านี้จะเข้าไปภายใน `SettingItemView`

ด้วยวิธีนี้ เราสามารถใช้โค้ดน้อยลง เพื่อสร้างมุมมองที่มีโครงสร้างเหมือนกันแต่มีเนื้อหาต่างกัน

นี่ก็เป็นรูปแบบการเขียนที่พบได้บ่อยมากในการพัฒนา SwiftUI
