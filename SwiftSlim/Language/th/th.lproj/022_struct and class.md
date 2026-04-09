# struct และ class

ในบทเรียนก่อนหน้า เราเพิ่งเริ่มทำความรู้จักกับ `struct` ได้กำหนด structure ขึ้นมาหนึ่งตัว และยังได้ขยายการเรียนรู้ไปยังความรู้เรื่อง protocol, `UUID` และหัวข้ออื่น ๆ ด้วย

ตอนนี้ เรามีความเข้าใจเบื้องต้นเกี่ยวกับคีย์เวิร์ด `struct` แล้ว แต่ก็ยังไม่อาจบอกได้ว่าเราเข้าใจมันอย่างแท้จริง

ในบทเรียนนี้ เราจะยังคงใช้ `struct` เป็นเนื้อหาหลัก และทำความรู้จักกับ `class` ไปพร้อมกัน ผ่านบทเรียนนี้ คุณจะเข้าใจได้ชัดเจนยิ่งขึ้นว่า instance คืออะไร constructor คืออะไร และทำไมเราจึงสามารถใช้ `struct` และ `class` มาจัดระเบียบข้อมูลได้

## ระบบจัดการนักเรียน

ตัวอย่างเช่น ตอนนี้เราต้องการพัฒนาระบบจัดการนักเรียน นักเรียนแต่ละคนมีข้อมูล เช่น ชื่อ เพศ โทรศัพท์ อายุ ที่อยู่บ้าน เป็นต้น

ในเวลานี้ เราสามารถรวมข้อมูลเหล่านี้เข้าด้วยกัน แล้วกำหนดเป็น structure `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

ที่นี่เราใช้ `struct` เพื่อกำหนดประเภทของนักเรียน

ภายใน structure `Student` นี้ มี properties หลายตัว:

- `id`: ตัวระบุเฉพาะของนักเรียน
- `name`: ชื่อนักเรียน
- `sex`: เพศของนักเรียน
- `phone`: โทรศัพท์ของนักเรียน
- `age`: อายุของนักเรียน
- `address`: ที่อยู่บ้าน

ด้วยวิธีนี้ ข้อมูลหลายส่วนที่เดิมกระจัดกระจายอยู่ ก็ถูกรวมเป็น “นักเรียน” ที่สมบูรณ์หนึ่งคน

`Student` ตรงนี้ยังปฏิบัติตาม protocol `Identifiable` และกำหนด field `id` ขึ้นมา เพื่อให้สะดวกต่อการแสดงข้อมูลร่วมกับลูป `ForEach` ในภายหลัง

จากนั้น เราสามารถสร้าง instance ของนักเรียนได้:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

โค้ดส่วนนี้หมายความว่า ตามโครงสร้าง `Student` นี้ เราสามารถสร้างข้อมูลนักเรียนที่เป็นรูปธรรมขึ้นมาได้

ในที่นี้ `Student` คือ type และ `Student(...)` หมายถึง instance ที่ถูกสร้างขึ้น

ใน SwiftUI เราสามารถกำหนด instance นี้ให้กับตัวแปรหนึ่งตัว แล้วแสดงผลออกมาได้

ตัวอย่างเช่น:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

ด้วยวิธีนี้ เราก็จะมองเห็นชื่อของนักเรียนคนนี้ใน view: `Fang Junyu`

ที่นี่ เราได้สร้าง instance `Student` ก่อน จากนั้นกำหนดมันให้กับตัวแปร `student` และสุดท้ายก็อ่าน property ภายในผ่าน `student.name`

## instance คืออะไร

เมื่อเราเพิ่งเริ่มเรียน `struct` เราอาจรู้สึกว่าคำว่า “instance” เป็นคำที่แปลกใหม่มาก

แต่จริง ๆ แล้ว เราใช้งาน instance มาตั้งแต่แรก เพียงแต่ก่อนหน้านี้เราไม่ได้สังเกตเป็นพิเศษ

ตัวอย่างเช่น:

```swift
let name = "Fang Junyu"
```

ที่นี่ `"Fang Junyu"` คือค่า string value ซึ่งโดยแก่นแท้แล้วก็คือ instance ของ type `String`

เรายังสามารถเขียนได้แบบนี้:

```swift
let name = String("Fang Junyu")
```

การเขียนทั้งสองแบบนี้สื่อถึงสิ่งเดียวกัน: สร้าง instance ของ type `String` แล้วกำหนดให้กับตัวแปร `name`

เช่นเดียวกัน `Int` ก็เป็นแบบนี้:

```swift
let num = 3
```

ตรงนี้ `3` โดยแก่นแท้แล้วคือค่าของ type `Int` และก็สามารถเข้าใจได้ว่าเป็น instance ของ `Int`

ดังนั้น instance จึงไม่ใช่แนวคิดพิเศษที่มีอยู่แค่ใน `struct` เท่านั้น

ไม่ว่าจะเป็น `String`, `Int`, `Double`, `Bool` หรือ `Student` ที่เรากำหนดขึ้นเอง ทั้งหมดนี้ต่างก็สามารถสร้าง instance ได้

ดังนั้น เมื่อเราเขียนว่า:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

โดยแก่นแท้แล้วก็เหมือนกับการสร้าง instance ของ `String` หรือ `Int` เพียงแต่ `Student` เป็น type ที่เรานิยามขึ้นเองเท่านั้น

## constructor

เมื่อเราสร้าง instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ในความเป็นจริง เรากำลังเรียกเมธอดเริ่มต้นของ `Student` หรือก็คือ `init`

คุณสามารถเข้าใจ constructor ได้ว่า: **เป็นจุดเริ่มต้นที่รับผิดชอบการกำหนดค่าให้กับ properties ตอนที่สร้าง instance**

กล่าวคือ ก่อนที่ instance จะถูกสร้างเสร็จสมบูรณ์ โดยปกติแล้วจะต้องผ่าน `init` ก่อน

ตัวอย่างเช่น ตอนที่ก่อนหน้านี้เราเรียนเรื่อง lifecycle ของ SwiftUI view เราเคยเขียนโค้ดลักษณะนี้:

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
    }
}
```

ตรงนี้ `init()` จะทำงานเมื่อ instance ของ `ContentView` ถูกสร้างขึ้น ส่วน `onAppear` จะทำงานก็ต่อเมื่อ view ถูกแสดงบนหน้าจอจริง ๆ เท่านั้น กล่าวคือ การสร้าง view และการแสดง view ไม่ใช่จังหวะเวลาเดียวกัน

ในทำนองเดียวกัน เมื่อเราสร้าง `Student(...)` ก็เท่ากับว่าเรากำลังเรียก constructor ของ `Student`

### constructor ที่ระบบสร้างให้อัตโนมัติ

ตอนที่เรากำหนด `Student` เราไม่ได้เขียน `init` ด้วยตัวเอง:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

แต่เราก็ยังสามารถสร้าง instance ได้โดยตรง:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ทำไมถึงสร้าง instance ได้ทั้งที่ไม่มี constructor ล่ะ?

เพราะสำหรับ `struct` ถ้าเราไม่ได้เขียน constructor ด้วยตัวเอง ระบบมักจะช่วยสร้าง constructor ที่เหมาะสมให้โดยอัตโนมัติ

ในช่วงเริ่มต้นเรียนรู้ คุณสามารถเข้าใจง่าย ๆ ได้ว่า: Swift ช่วยเติมโค้ดสำหรับการเริ่มต้นให้เราอัตโนมัติ

สามารถเข้าใจคร่าว ๆ ได้ว่าระบบช่วยเติมโค้ดประมาณนี้ให้:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

ตรงนี้มีรายละเอียดหนึ่งที่ต้องสังเกต:

```swift
let id = UUID()
```

`id` มีค่า default อยู่แล้ว ดังนั้นตอนสร้าง instance เราจึงไม่จำเป็นต้องส่ง `id` เข้าไปเอง

กล่าวคือ properties ที่ไม่มี default value โดยทั่วไปมักต้องส่งผ่าน constructor ส่วน properties ที่มี default value อยู่แล้ว ก็มักจะใช้ค่าเดิมนั้นได้โดยตรง

ดังนั้น ตอนที่เราสร้าง instance ของ `Student` เราจึงต้องส่งแค่ `name`, `sex`, `phone`, `age` และ `address`

### คำใบ้จาก compiler

นอกจากนี้ เมื่อเราพิมพ์ `Student(...)` ใน Xcode เราก็จะเห็นคำใบ้พารามิเตอร์ที่ระบบแสดงให้ด้วย

![student](../../Resource/022_student.png)

สิ่งนี้ก็แสดงให้เห็นเช่นกันว่า type ปัจจุบันนี้มี constructor ที่ระบบสร้างขึ้นให้อัตโนมัติจริง ๆ

### เขียน constructor เอง

แม้ว่าระบบจะสามารถสร้าง constructor ให้อัตโนมัติได้ แต่บางครั้งวิธีการเริ่มต้นแบบ default นี้ก็อาจไม่ตรงกับความต้องการของเราอย่างสมบูรณ์

ตัวอย่างเช่น เรามี structure `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

ตาม constructor ที่ระบบสร้างให้อัตโนมัติ ตอนที่เราสร้าง instance เราจำเป็นต้องส่งทั้งสามพารามิเตอร์นี้พร้อมกัน:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

แต่ถ้าตอนนี้เราต้องการบันทึกข้อมูลภาพยนตร์เก่าชุดหนึ่ง โดยรู้แค่ชื่อเรื่อง แต่ไม่รู้ผู้กำกับและคะแนน ก็จะค่อนข้างยุ่งยาก

เพราะเราทำได้แค่เขียนแบบนี้:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

ถึงแม้ว่าจะใช้งานได้ แต่การต้องเขียน `--` ซ้ำ ๆ ทุกครั้งก็ไม่สะดวก

ในเวลานี้ เราสามารถเขียน constructor ขึ้นมาเองได้:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

แบบนี้ ตอนที่เราสร้างภาพยนตร์เก่า ก็จะต้องส่งแค่ `name` เท่านั้น:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

นี่คือหนึ่งในความหมายของการเขียน constructor เอง: **ทำให้วิธีการสร้าง instance สอดคล้องกับความต้องการจริงมากขึ้น**

### วิเคราะห์ constructor แบบกำหนดเอง

มาดู constructor ที่เราเขียนเองเมื่อกี้นี้:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

ความหมายของโค้ดนี้คือ ตอนสร้าง instance ของ `Movie` เราต้องส่งพารามิเตอร์ `name` มาเพียงตัวเดียว

จากนั้น ภายใน constructor ก็จะนำ `name` ที่ส่งเข้ามาไปกำหนดให้กับ `name` ของ instance เอง และกำหนดค่า default `--` ให้กับ `director` และ `rating`

`self` ตรงนี้หมายถึง “instance ปัจจุบันนี้เอง”

ตัวอย่างเช่น:

```swift
self.name = name
```

`self.name` ทางซ้ายหมายถึง property ใน instance ส่วน `name` ทางขวาหมายถึงพารามิเตอร์ที่เราส่งเข้ามา

สามารถเข้าใจง่าย ๆ ได้ว่า เป็นการนำค่าที่ส่งมาจากภายนอกไปเก็บไว้ใน property ของ instance เอง

เมื่อ properties ทั้งหมดถูกกำหนดค่าเสร็จแล้ว instance นี้ก็จะถูกสร้างเสร็จสมบูรณ์

### กลไกของ constructor

เมื่อเราประกาศ constructor อย่างชัดเจนแล้ว จะมีการเปลี่ยนแปลงอีกอย่างหนึ่งตามมา:

constructor ที่ระบบสร้างให้อัตโนมัติไว้เดิม โดยทั่วไปจะไม่สามารถใช้งานได้โดยตรงอีก

ตัวอย่างเช่น:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

ตอนนี้ถ้าเราเขียนแบบนี้อีก:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler ก็จะรายงาน error:

```swift
Extra arguments at positions #2, #3 in call
```

ความหมายก็คือ: คุณส่ง arguments ที่เกินมา

ทำไมถึงเกิด error นี้ขึ้น?

เพราะใน structure `Movie` ปัจจุบัน มี constructor ที่คุณประกาศเองไว้เพียงแบบเดียวคือ:

```swift
init(name: String)
```

มันรับแค่พารามิเตอร์ `name` ตัวเดียว และไม่รับ `director` กับ `rating`

กล่าวคือ หลังจากที่คุณเพิ่ม constructor ของตัวเองเข้าไปแล้ว วิธีการเริ่มต้นแบบที่ระบบสร้างให้อัตโนมัติแต่เดิมก็จะไม่สามารถใช้ได้โดยตรงอีก

ถ้าเราต้องการรองรับทั้งแบบ “ส่งแค่ชื่อ” และแบบ “ส่งข้อมูลครบถ้วน” เราก็ต้องเขียน constructor แบบเต็มเพิ่มเองอีกตัว:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

แบบนี้ เราก็จะมี constructor ที่แตกต่างกันสองแบบ

ตอนสร้างภาพยนตร์เก่า สามารถเขียนได้แบบนี้:

```swift
Movie(name: "The Night of the Hunter")
```

ตอนสร้างภาพยนตร์ใหม่ที่มีข้อมูลครบถ้วน สามารถเขียนได้แบบนี้:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

รูปแบบการเขียนแบบนี้ยังแสดงให้เห็นด้วยว่า type เดียวกันสามารถมี constructor ได้หลายตัว ตราบใดที่รูปแบบของพารามิเตอร์แตกต่างกัน

## overloading คืออะไร

ตรงนี้ขอเสริมความรู้ที่จำเป็นอีกหนึ่งจุด

เมื่อกี้นี้เราได้เขียน `init` ให้กับ `Movie` สองตัว:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

รูปแบบการเขียนแบบนี้ที่ “ชื่อฟังก์ชันเหมือนกัน แต่พารามิเตอร์ต่างกัน” เรียกว่า “overloading”

ตรงนี้ ฟังก์ชันทั้งสองตัวต่างก็ชื่อ `init` เหมือนกัน แต่รับพารามิเตอร์ไม่เหมือนกัน ดังนั้น Swift จึงสามารถแยกแยะได้ว่าคุณกำลังเรียกฟังก์ชันตัวไหน

ตัวอย่างเช่น:

```swift
Movie(name: "Days of Heaven")
```

จะเรียก:

```swift
init(name: String)
```

ส่วน:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

จะเรียกเมธอดเริ่มต้นอีกเวอร์ชันที่สมบูรณ์กว่า

ดังนั้น หน้าที่ของ overloading ก็คือ: ทำให้ type เดียวกันสามารถมีวิธีการสร้างที่ต่างกันตามสถานการณ์ต่าง ๆ ได้

## ทำความรู้จักกับ class

ต่อไป เรามาทำความรู้จักกับ `class` แบบสั้น ๆ กัน

นอกจาก `struct` ที่พบได้บ่อยใน Swift แล้ว หลายภาษาโปรแกรมยังใช้ `class` ในการสร้าง instance ด้วย เช่น Java, C#, Kotlin เป็นต้น

ใน Swift รูปแบบการเขียน `class` มีความใกล้เคียงกับ `struct` มาก

ตัวอย่างเช่น:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

คุณจะสังเกตเห็นว่า นอกจากคีย์เวิร์ดจะเปลี่ยนจาก `struct` เป็น `class` แล้ว ส่วนอื่น ๆ ดูแทบจะเหมือนกันหมด

วิธีการสร้าง instance ก็คล้ายกันมากเช่นกัน:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

ดังนั้น ในระดับไวยากรณ์ `struct` และ `class` จึงดูคล้ายกันมากจริง ๆ

### ความแตกต่างระหว่าง Struct และ Class

แม้ว่า `struct` และ `class` จะดูคล้ายกันมาก แต่ก็ไม่ได้เหมือนกันทั้งหมด

**1. วิธีการเริ่มต้นต่างกัน**

สำหรับ `struct` ถ้าเราไม่ได้เขียน constructor เอง โดยทั่วไปแล้วระบบมักจะสร้างเมธอดเริ่มต้นที่เหมาะสมให้โดยอัตโนมัติ

แต่สำหรับ `class` ถ้ามี properties ที่ยังไม่มี default value โดยทั่วไปแล้วจำเป็นต้องเขียน `init` เอง ไม่เช่นนั้นก็จะเกิด error

ตัวอย่างเช่น:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

`class` ตัวนี้ไม่มี constructor จึงเกิด error เพราะ properties ยังไม่ได้ถูก initialize

compiler จะขึ้นข้อความประมาณว่า:

```swift
Class 'Movie' has no initializers
```

ดังนั้น ในตัวอย่างนี้ `class` จำเป็นต้องเขียน constructor เอง

**2. `struct` เป็น value type ส่วน `class` เป็น reference type**

`struct` เป็น value type ส่วน `class` เป็น reference type

ในช่วงเริ่มต้นเรียนรู้ ยังไม่จำเป็นต้องเข้าใจสองแนวคิดนี้อย่างถ่องแท้ แค่มีความเข้าใจแบบง่าย ๆ ก็เพียงพอ

ตัวอย่างเช่น `struct` จะคล้ายกับ “การคัดลอกค่าใหม่อีกชุดหนึ่ง”

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

ตรงนี้หลังจากกำหนด `user1` ให้กับ `user2` ก็เหมือนกับการคัดลอกข้อมูลชุดใหม่ขึ้นมา ดังนั้นการแก้ไข `user2` จะไม่ส่งผลต่อ `user1`

ส่วน `class` จะคล้ายกับ “การชี้ไปยัง instance เดียวกันร่วมกัน”

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

ตรงนี้ `user1` และ `user2` ชี้ไปยัง instance เดียวกัน

ตอนนี้เรายังไม่จำเป็นต้องเข้าใจกลไกเบื้องลึกของ value type และ reference type อย่างสมบูรณ์ แค่รู้ว่า `struct` เหมาะกับการเก็บข้อมูลที่เป็นอิสระ ส่วน `class` เหมาะกับกรณีที่หลายที่ต้องใช้ instance เดียวกันร่วมกันก็พอ

## ช่วงเริ่มต้นควรเลือกอย่างไร

ในช่วงปัจจุบัน สำหรับ data model ทั่วไปให้พิจารณา `struct` ก่อน ส่วนข้อมูลที่ต้องแชร์และแก้ไขให้สอดคล้องกัน จึงค่อยพิจารณา `class`

นี่ไม่ใช่กฎตายตัว แต่สำหรับผู้เริ่มต้นถือว่าเป็นวิธีตัดสินใจที่ใช้งานได้จริงเพียงพอ

โดยเฉพาะใน SwiftUI หลายครั้งคุณจะพบว่า `struct` ก็สามารถทำงานส่วนใหญ่ได้แล้ว

นอกจากนี้ ในเอกสารการเขียนโปรแกรมหลายแห่ง สิ่งที่สร้างขึ้นจาก `class` ก็ยังถูกเรียกว่า “object” ด้วย ในช่วงเริ่มต้น คุณสามารถเข้าใจมันเป็น instance ไปก่อนได้ โดยไม่จำเป็นต้องแยกความแตกต่างอย่างตั้งใจ

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้ `struct` อย่างลึกซึ้งขึ้น และได้รู้จัก `class` ไปพร้อมกัน ทั้งสองอย่างสามารถใช้กำหนด types ได้

types สามารถสร้าง instance ได้ และตอนที่สร้าง instance ก็จะมีการเรียก constructor หรือก็คือ `init`

สำหรับ `struct` ถ้าไม่ได้เขียน constructor เอง โดยทั่วไปแล้วระบบจะสร้าง constructor ที่เหมาะสมให้โดยอัตโนมัติ หาก constructor แบบ default ไม่ตอบโจทย์ เราก็สามารถเขียน constructor เองได้เช่นกัน

นอกจากนี้ เรายังได้ทำความเข้าใจเบื้องต้นถึงความแตกต่างระหว่าง `struct` และ `class`: `struct` เป็น value type ส่วน `class` เป็น reference type ใน SwiftUI ช่วงเริ่มต้น สิ่งที่มักจะได้พบมากกว่าก็คือ `struct`

ต่อจากนี้ เมื่อเราเรียนเรื่องการส่งค่าใน view, data model และ state management เนื้อหาเหล่านี้ก็จะยังถูกนำมาใช้อย่างต่อเนื่อง
