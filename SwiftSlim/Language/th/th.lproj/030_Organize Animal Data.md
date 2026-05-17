# การจัดระเบียบข้อมูลสัตว์

ในบทเรียนก่อนหน้า เราได้ทำตัวอย่างสารานุกรมสัตว์แบบง่ายเสร็จแล้ว

![view](../../../Resource/029_view.png)

เมื่อผู้ใช้แตะสัตว์ตัวใดตัวหนึ่ง หน้าเว็บจะแสดงรายละเอียดสัตว์ผ่าน `Sheet`

อย่างไรก็ตาม โค้ดจากบทเรียนก่อนหน้ามีปัญหาอยู่หนึ่งอย่าง: ข้อมูลสัตว์ถูกเขียนไว้โดยตรงภายใน `ContentView`

ตัวอย่างเช่น:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // แสดงรายการสัตว์
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

โค้ดส่วนนี้สามารถทำงานได้ตามปกติ แต่เมื่อข้อมูลสัตว์มีจำนวนมากขึ้น `ContentView` จะยาวมากขึ้นเรื่อย ๆ

เดิมที `ContentView` ควรรับผิดชอบการแสดงส่วนติดต่อเป็นหลัก แต่ตอนนี้มันยังเก็บข้อมูลสัตว์จำนวนมากไว้ด้วย สิ่งนี้ส่งผลต่อการอ่านโค้ด และทำให้การดูแลรักษาในภายหลังไม่สะดวก

ดังนั้น ในบทเรียนนี้ เราจะทำสิ่งหนึ่ง:

ย้ายข้อมูลสัตว์ออกจาก `ContentView`

## ทำไมต้องแยกข้อมูลออกมา?

ใน SwiftUI โค้ดของ View มักรับผิดชอบการแสดงส่วนติดต่อ

ตัวอย่างเช่น:

```swift
Text("Dolphin")
Image("dolphin")
```

โค้ดเหล่านี้ล้วนเกี่ยวข้องกับการแสดงผลของส่วนติดต่อ

แต่ข้อมูลสัตว์เอง เช่น ชื่อสัตว์ ชื่อรูปภาพ พื้นที่กระจายพันธุ์ ถิ่นอาศัย และข้อความคำอธิบาย ไม่ใช่โครงสร้างของส่วนติดต่อ

มันเหมือนกับชุดข้อมูลคงที่มากกว่า:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

ถ้าเขียนโค้ดส่วนติดต่อและโค้ดข้อมูลทั้งหมดไว้ด้วยกัน โค้ดจะยิ่งยุ่งเหยิงมากขึ้นเรื่อย ๆ

ดังนั้น เราสามารถนำข้อมูลสัตว์ไปไว้ในชนิด `Animal` ได้

## ใช้ static เพื่อเก็บข้อมูลคงที่

ก่อนอื่น มาดูรูปแบบที่จัดระเบียบแล้ว:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

ตรงนี้มีการเพิ่มโค้ดหนึ่งบรรทัด:

```swift
static let animals: [Animal] = [
    
]
```

`static` หมายถึงพร็อพเพอร์ตีแบบสแตติก

พร็อพเพอร์ตีแบบสแตติกเป็นของชนิดนั้นเอง ไม่ได้เป็นของอินสแตนซ์ใดอินสแตนซ์หนึ่งโดยเฉพาะ

ประโยคนี้ค่อนข้างนามธรรม เราสามารถทำความเข้าใจผ่านตัวอย่างง่าย ๆ ได้

## พร็อพเพอร์ตีทั่วไปและพร็อพเพอร์ตีแบบสแตติก

ตัวอย่างเช่น เรากำหนด `Student` ขึ้นมา:

```swift
struct Student {
    let name: String
}
```

ตรงนี้ `name` เป็นพร็อพเพอร์ตีทั่วไป พร็อพเพอร์ตีทั่วไปเป็นของอินสแตนซ์ใดอินสแตนซ์หนึ่งโดยเฉพาะ

ถ้าเราต้องการเข้าถึง `name` เราต้องสร้างนักเรียนคนหนึ่งขึ้นมาก่อน:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ตรงนี้ `student` คืออินสแตนซ์ ในตอนนี้คุณสามารถเข้าใจว่าเป็นข้อมูลนักเรียนหนึ่งชุดที่เฉพาะเจาะจง

เพราะนักเรียนแต่ละคนอาจมีชื่อแตกต่างกัน ดังนั้น `name` จึงต้องอยู่กับนักเรียนคนใดคนหนึ่งโดยเฉพาะ

แต่ข้อมูลบางอย่างไม่ได้เป็นของอินสแตนซ์ใดอินสแตนซ์หนึ่งโดยเฉพาะ

ตัวอย่างเช่น เราต้องการเตรียมชุดข้อมูลตัวอย่างสำหรับพรีวิว:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

ตรงนี้ `previewStudents` มี `static` อยู่ข้างหน้า ดังนั้นมันจึงเป็นพร็อพเพอร์ตีแบบสแตติก

พร็อพเพอร์ตีแบบสแตติกไม่ได้เป็นของนักเรียนคนใดคนหนึ่ง แต่เป็นของชนิด `Student` เอง

ดังนั้น เราไม่จำเป็นต้องสร้างนักเรียนขึ้นมาก่อน ก็สามารถเข้าถึงได้โดยตรงผ่านชื่อชนิด:

```swift
print(Student.previewStudents.count)    // 3
```

รูปแบบการเข้าถึงตรงนี้คือ:

```swift
ชื่อชนิด.ชื่อพร็อพเพอร์ตีแบบสแตติก
```

ก็คือ:

```swift
Student.previewStudents
```

ในทำนองเดียวกัน ในสารานุกรมสัตว์ เราสามารถเข้าถึงข้อมูลสัตว์ได้แบบนี้:

```swift
Animal.animals
```

## กลับมาที่ ContentView

ตอนนี้ ข้อมูลสัตว์ถูกเก็บไว้ในชนิด `Animal` แล้ว

ดังนั้นใน `ContentView` เราไม่จำเป็นต้องเขียนอาร์เรย์สัตว์ที่ยาวมากอีกต่อไป

เราสามารถเปลี่ยนเป็น:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // แสดงรายการสัตว์
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

โค้ดบรรทัดนี้หมายความว่า:

```swift
let animals = Animal.animals
```

นำข้อมูลสัตว์ชุด `animals` ออกจากชนิด `Animal` แล้วเก็บไว้ในค่าคงที่ `animals` ของ View ปัจจุบัน

หลังจากเขียนแบบนี้ `ContentView` จะกระชับขึ้น

`ContentView` รับผิดชอบการแสดงส่วนติดต่อ ส่วน `Animal.animals` รับผิดชอบการให้ข้อมูลสัตว์

## แยก Animal ไปไว้ในไฟล์ต่างหาก

ในบทเรียนก่อนหน้า เพื่อให้ตัวอย่างเข้าใจง่ายขึ้น เราเขียน `Animal` และ `ContentView` ไว้ในไฟล์เดียวกัน

เพราะในตอนนั้นโค้ดยังมีไม่มากนัก การเขียนแบบนี้จึงไม่มีปัญหา

แต่ตอนนี้ข้อมูลสัตว์มีมากขึ้นเรื่อย ๆ ถ้ายังคงเขียนโค้ดทั้งหมดไว้ใน `ContentView.swift` ไฟล์จะยาวมากและอ่านยากขึ้น

ดังนั้น เราสามารถนำ `Animal` ไปไว้ในไฟล์ Swift ใหม่อีกไฟล์หนึ่งได้

ใน Xcode คุณสามารถสร้างไฟล์ Swift ใหม่ได้ เช่น:

```swift
Animal.swift
```

จากนั้นย้ายโครงสร้าง `Animal` ไปไว้ในไฟล์นี้:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

หลังจากจัดระเบียบแบบนี้:

`ContentView.swift` รับผิดชอบการแสดงส่วนติดต่อ

`Animal.swift` รับผิดชอบการอธิบายโครงสร้างของข้อมูลสัตว์

แม้ว่าทั้งสองจะอยู่คนละไฟล์กัน แต่ตราบใดที่อยู่ในโปรเจกต์เดียวกัน `ContentView` ก็ยังสามารถใช้ `Animal` ได้โดยตรง

ตัวอย่างเช่น:

```swift
let animals = Animal.animals
```

ตรงนี้ไม่จำเป็นต้อง import `Animal.swift` เพิ่มเติมใน `ContentView.swift`

Swift จะรู้จักไฟล์ Swift ในโปรเจกต์เดียวกันโดยอัตโนมัติ

## ใช้ extension เพื่อจัดระเบียบโค้ดต่อไป

ตอนนี้ เราได้ย้ายข้อมูลสัตว์จาก `ContentView` ไปไว้ใน `Animal` แล้ว

อย่างไรก็ตาม โครงสร้าง `Animal` ยังมีโค้ดสองประเภทอยู่พร้อมกัน:

ประเภทแรกคือพร็อพเพอร์ตีของโมเดลสัตว์เอง:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

ประเภทที่สองคือข้อมูลสัตว์แบบคงที่:

```swift
static let animals: [Animal] = [
    // ...
]
```

เพื่อให้โครงสร้างโค้ดชัดเจนขึ้น เราสามารถใช้ `extension` เพื่อแยกสองส่วนนี้ออกจากกัน

`extension` หมายถึงการขยาย

มันสามารถเพิ่มโค้ดใหม่ต่อจากชนิดที่มีอยู่เดิมได้

ตัวอย่างเช่น:

```swift
extension Animal {
    
}
```

นี่หมายความว่าเรากำลังขยายชนิด `Animal`

## นำข้อมูลสัตว์ไปไว้ใน extension

เราสามารถเปลี่ยน `Animal` เป็นแบบนี้:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

หลังจากจัดระเบียบแบบนี้ โครงสร้างโค้ดจะชัดเจนขึ้น

`struct Animal` รับผิดชอบการอธิบายว่าสัตว์หนึ่งตัวควรมีพร็อพเพอร์ตีอะไรบ้าง

`extension Animal` รับผิดชอบการเก็บข้อมูลสัตว์แบบคงที่หนึ่งชุด

โปรดสังเกตว่า แม้ `animals` จะถูกย้ายเข้าไปใน `extension Animal` แล้ว แต่วิธีใช้งานไม่เปลี่ยนแปลง

เรายังสามารถใช้แบบนี้ได้:

```swift
let animals = Animal.animals
```

นี่ก็เป็นลักษณะหนึ่งของ `extension`: มันเพียงช่วยให้เราจัดระเบียบโค้ด และไม่เปลี่ยนวิธีเรียกใช้จากภายนอก

## เมื่อข้อมูลมีมากขึ้น สามารถสร้างไฟล์ AnimalData เพิ่มได้

ตอนนี้ เราได้นำ `Animal` ไปไว้ในไฟล์ `Animal.swift` แยกต่างหากแล้ว

ถ้าข้อมูลสัตว์มีไม่มาก คุณสามารถเขียน `extension Animal` ไว้ใน `Animal.swift` โดยตรงได้

แต่ถ้าข้อมูลสัตว์มีมากขึ้นเรื่อย ๆ ก็สามารถสร้างไฟล์อีกไฟล์หนึ่งได้ เช่น:

```swift
AnimalData.swift
```

จากนั้นนำข้อมูลสัตว์แบบคงที่ไปไว้ในไฟล์นั้น:

```swift
extension Animal {
    static let animals: [Animal] = [
        // ข้อมูลสัตว์
    ]
}
```

หลังจากทำแบบนี้ หน้าที่ของโค้ดจะชัดเจนขึ้น:

`Animal.swift` รับผิดชอบเฉพาะการกำหนดโมเดลสัตว์

`AnimalData.swift` รับผิดชอบเฉพาะการเก็บข้อมูลสัตว์

`ContentView.swift` รับผิดชอบเฉพาะการแสดงส่วนติดต่อ

หน้าที่ของแต่ละไฟล์จะชัดเจนยิ่งขึ้น

โปรดสังเกตว่า `AnimalData.swift` เป็นเพียงชื่อไฟล์ ไม่ใช่ชนิด Swift ใหม่ ภายในไฟล์นี้ เรายังคงใช้ `extension Animal` เพื่อเพิ่มข้อมูลคงที่ให้กับ `Animal`

## โค้ดฉบับสมบูรณ์

ด้านล่างคือโค้ด `Animal.swift` ที่จัดระเบียบแล้ว:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

โค้ด `AnimalData.swift` ที่จัดระเบียบแล้ว:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

ใน `ContentView.swift` สามารถใช้แบบนี้ได้:

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
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

คำแนะนำ: ในไฟล์ `Animal.swift` และ `AnimalData.swift` บรรทัดแรกเขียนว่า:

```swift
import Foundation
```

ก่อนหน้านี้ เมื่อเราเขียนส่วนติดต่อ SwiftUI เรามักใช้:

```swift
import SwiftUI
```

เพราะ `ContentView`, `Text`, `Button`, `Color` เหล่านี้ล้วนเกี่ยวข้องกับส่วนติดต่อ ดังนั้นเมื่อเขียนไฟล์ส่วนติดต่อ มักจำเป็นต้อง import SwiftUI

แต่ตรงนี้ `Animal.swift` และ `AnimalData.swift` ไม่ใช่ไฟล์ส่วนติดต่อ พวกมันใช้เป็นหลักเพื่อกำหนดโมเดลสัตว์และเก็บข้อมูลสัตว์

ในโค้ดส่วนนี้ `UUID()` ต้องใช้ `Foundation` ดังนั้น import `Foundation` ก็เพียงพอแล้ว

## สรุป

บทเรียนนี้เราทำสิ่งสำคัญหนึ่งอย่าง: ย้ายข้อมูลสัตว์ออกจาก `ContentView`

รูปแบบเดิมคือเขียนข้อมูลสัตว์ไว้โดยตรงใน `ContentView` โค้ดแบบนี้สามารถทำงานได้ แต่เมื่อข้อมูลมีมากขึ้น ไฟล์ View จะยาวขึ้นเรื่อย ๆ

หลังจากจัดระเบียบแล้ว `ContentView` รับผิดชอบเฉพาะการแสดงส่วนติดต่อ ส่วน `Animal.animals` รับผิดชอบการให้ข้อมูลสัตว์

บทเรียนนี้ยังได้เรียนรู้ความรู้ใหม่สองอย่าง

อย่างแรกคือ `static`

`static` หมายถึงพร็อพเพอร์ตีแบบสแตติก พร็อพเพอร์ตีแบบสแตติกเป็นของชนิดนั้นเอง และสามารถเข้าถึงได้โดยตรงผ่านรูปแบบ “ชื่อชนิด.ชื่อพร็อพเพอร์ตี”

ตัวอย่างเช่น:

```swift
Animal.animals
```

อย่างที่สองคือ `extension`

`extension` หมายถึงการขยาย มันสามารถแยกโค้ดของชนิดเดียวกันออกเป็นส่วนต่าง ๆ ทำให้โครงสร้างโค้ดชัดเจนขึ้น

ในตัวอย่างนี้ เราใช้ `extension Animal` เพื่อเก็บข้อมูลสัตว์ ทำให้โครงสร้าง `Animal` เองกระชับขึ้น

นอกจากนี้ `Animal` ใช้เก็บโมเดลข้อมูลเป็นหลัก และไม่ได้เขียนส่วนติดต่อ SwiftUI โดยตรง ดังนั้นตรงนี้จึงใช้ `import Foundation`

จุดสำคัญของบทเรียนนี้ไม่ใช่การทำให้โค้ดซับซ้อนขึ้น แต่คือการทำให้โค้ดอ่านง่ายและดูแลรักษาได้ง่ายขึ้น
