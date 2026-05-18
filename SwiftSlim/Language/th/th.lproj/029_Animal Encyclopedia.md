# สารานุกรมสัตว์ 

ในบทเรียนนี้ เราจะฝึกเรื่องมุมมองแบบกำหนดเองและการส่งข้อมูลต่อไป

เราจะสร้างมุมมองสารานุกรมสัตว์แบบง่าย ๆ หน้าเว็บจะแสดงสัตว์ห้าชนิด เมื่อคลิกสัตว์ตัวใดตัวหนึ่ง จะมีมุมมองรายละเอียดเด้งขึ้นมาเพื่อแสดงรูปภาพ พื้นที่กระจายพันธุ์ แหล่งที่อยู่อาศัย และคำอธิบายของสัตว์ตัวนั้น

ผลลัพธ์ที่ได้:

![view](../../../Resource/029_view.png)

จากตัวอย่างนี้ เราจะได้ฝึกการทำงานร่วมกันระหว่างโครงสร้างข้อมูล การแสดงรายการ การโต้ตอบเมื่อคลิก และมุมมองป๊อปอัปแบบ Sheet

## เตรียมรูปภาพประกอบ

ก่อนอื่น เราต้องเตรียมรูปภาพสัตว์ห้าภาพ:

- โลมา: `dolphin.jpg`
- ยีราฟ: `giraffe.jpg`
- สิงโต: `lion.jpg`
- แพนด้า: `panda.jpg`
- หมีขั้วโลก: `polarBear.jpg`

สามารถใช้รูปภาพต่อไปนี้เป็นสื่อประกอบได้:

[โลมา](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[ยีราฟ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[สิงโต](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[แพนด้า](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[หมีขั้วโลก](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

หลังจากดาวน์โหลดรูปภาพแล้ว ให้ลากรูปภาพเข้าไปในโฟลเดอร์ทรัพยากร `Assets` ของโปรเจกต์ Xcode

![assets](../../../Resource/029_assets.png)

สิ่งที่ต้องระวังคือ เมื่อต้องการใช้รูปภาพในโค้ด โดยปกติไม่จำเป็นต้องเขียนนามสกุล `.jpg`

เช่น หากชื่อทรัพยากรรูปภาพคือ `dolphin` ในโค้ดให้เขียนว่า:

```swift
Image("dolphin")
```

ถ้าเขียนชื่อรูปภาพผิด รูปภาพก็จะไม่สามารถแสดงได้ตามปกติ

หมายเหตุ: รูปภาพข้างต้นมาจากโครงการ Wikimedia เมื่อใช้งาน แนะนำให้เก็บลิงก์ต้นฉบับและข้อมูลแหล่งที่มาไว้ด้วย

## สร้างโครงสร้าง Animal

ในหน้านี้ สัตว์แต่ละตัวมีข้อมูลหลายรายการ:

- ชื่อสัตว์
- รูปภาพสัตว์
- อีโมจิของสัตว์
- พื้นที่กระจายพันธุ์
- แหล่งที่อยู่อาศัย
- คำอธิบายสัตว์

ถ้าเราแยกข้อมูลเหล่านี้ออกเป็นตัวแปรจำนวนมาก โค้ดจะค่อนข้างยุ่งเหยิง ดังนั้น เราสามารถสร้างโครงสร้าง `Animal` แล้วเก็บข้อมูลของสัตว์หนึ่งตัวไว้ด้วยกัน

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
```

ในโค้ดส่วนนี้:

- `id`: ตัวระบุเฉพาะของสัตว์
- `name`: ชื่อสัตว์
- `imageName`: ชื่อรูปภาพสัตว์
- `avatarEmoji`: อีโมจิของสัตว์
- `distributionArea`: พื้นที่กระจายพันธุ์
- `habitat`: แหล่งที่อยู่อาศัย
- `animalDescription`: คำอธิบายสัตว์

โดยในส่วนนี้:

```swift
let id = UUID()
```

`id` ใช้ระบุสัตว์แต่ละตัว เพราะต่อไปเราจะใช้ `ForEach` เพื่อแสดงรายการสัตว์ และยังจะใช้ `.sheet(item:)` เพื่อเด้งรายละเอียดตามสัตว์ที่ถูกเลือก ดังนั้นจึงต้องให้ `Animal` ปฏิบัติตามโปรโตคอล `Identifiable`

หน้าที่ของ `Identifiable` คือบอก SwiftUI ว่า สัตว์แต่ละตัวมี `id` ที่ใช้แยกตัวตนได้

## สร้างข้อมูลสัตว์

ถัดมา เราจะสร้างอาร์เรย์สัตว์ใน `ContentView`

ในอาร์เรย์จะเก็บ `Animal` ห้าตัว โดย `Animal` แต่ละตัวแทนสัตว์หนึ่งชนิด

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // โลมา
        Animal(
            name: "โลมา",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "มหาสมุทรเขตร้อนและเขตอบอุ่นทั่วโลก",
            habitat: "มหาสมุทร น่านน้ำชายฝั่ง และแม่น้ำขนาดใหญ่บางสาย",
            animalDescription: "โลมาเป็นสัตว์เลี้ยงลูกด้วยนมทางทะเลที่ฉลาด พวกมันอยู่รวมกันเป็นฝูง สื่อสารด้วยเสียง และขึ้นชื่อเรื่องพฤติกรรมที่ขี้เล่น"
        ),
        // ยีราฟ
        Animal(
            name: "ยีราฟ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ทุ่งสะวันนาและป่าโปร่งในแอฟริกา",
            habitat: "ทุ่งหญ้า ทุ่งสะวันนา และป่าโปร่ง",
            animalDescription: "ยีราฟเป็นสัตว์บกที่สูงที่สุด พวกมันมีคอยาว ขายาว และมักกินใบไม้จากต้นไม้สูง"
        ),
        // สิงโต
        Animal(
            name: "สิงโต",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "พบส่วนใหญ่ในแอฟริกาตอนใต้ของทะเลทรายซาฮารา และมีประชากรขนาดเล็กในอินเดียตะวันตก",
            habitat: "ทุ่งหญ้า ทุ่งสะวันนา และป่าโปร่ง",
            animalDescription: "สิงโตเป็นแมวใหญ่ที่ทรงพลัง พวกมันมักอยู่รวมกันเป็นกลุ่มที่เรียกว่าไพรด์ และมักถูกเรียกว่าราชาแห่งโลกสัตว์"
        ),
        // แพนด้า
        Animal(
            name: "แพนด้า",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ป่าภูเขาในภาคกลางของจีน",
            habitat: "ป่าไผ่ในพื้นที่ภูเขาที่เย็นและชื้น",
            animalDescription: "แพนด้าเป็นหมีที่มีขนสีขาวดำ พวกมันกินไผ่เป็นหลัก และเป็นหนึ่งในสัตว์ที่ผู้คนจดจำได้ง่ายที่สุดในโลก"
        ),
        // หมีขั้วโลก
        Animal(
            name: "หมีขั้วโลก",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ภูมิภาคอาร์กติกรอบขั้วโลกเหนือ",
            habitat: "น้ำแข็งทะเล พื้นที่ชายฝั่ง และสภาพแวดล้อมอาร์กติกที่หนาวเย็น",
            animalDescription: "หมีขั้วโลกเป็นหมีขนาดใหญ่ที่ปรับตัวให้เข้ากับสภาพแวดล้อมหนาวเย็นได้ดี พวกมันว่ายน้ำเก่ง และพึ่งพาน้ำแข็งทะเลเป็นหลักในการล่าแมวน้ำ"
        )
    ]

    var body: some View {
        Text("สารานุกรมสัตว์")
    }
}
```

`animals` ที่นี่คืออาร์เรย์:

```swift
let animals: [Animal]
```

`[Animal]` หมายความว่าในอาร์เรย์นี้เก็บ `Animal` หลายตัว

กล่าวคือ `animals` ไม่ใช่สัตว์หนึ่งตัว แต่เป็นกลุ่มของสัตว์

## แสดงรายการสัตว์

ตอนนี้ เราสามารถใช้ `ForEach` เพื่อแสดงรายการสัตว์ได้แล้ว

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

ผลลัพธ์ที่ได้:

![view](../../../Resource/029_view1.png)

ในโค้ดส่วนนี้:

```swift
ForEach(animals) { animal in
    ...
}
```

หมายถึงการวนผ่านอาร์เรย์ `animals`

ทุกครั้งที่วนลูป `animal` จะหมายถึงสัตว์ตัวที่กำลังแสดงอยู่ในตอนนั้น

เช่น ในรอบแรก `animal` คือโลมา ส่วนในรอบที่สอง `animal` คือยีราฟ

ดังนั้น เราสามารถแสดงข้อมูลของสัตว์ปัจจุบันด้วยวิธีต่อไปนี้:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

เพียงเท่านี้ ก็สามารถแสดงสัตว์ทั้งห้าตัวออกมาได้

## ทำให้รายการสัตว์คลิกได้

ตอนนี้รายการแสดงออกมาแล้ว แต่ยังคลิกไม่ได้

ถ้าต้องการให้คลิกสัตว์ตัวใดตัวหนึ่งแล้วแสดงรายละเอียด เราต้องบันทึก “สัตว์ที่เลือกอยู่ในปัจจุบัน” ก่อน

ดังนั้น ให้เพิ่มตัวแปรสถานะใน `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

`selectedAnimal` ที่นี่เป็นชนิดค่าทางเลือก `Animal?`

หมายความว่า มันอาจมีสัตว์หนึ่งตัวอยู่ หรืออาจไม่มีสัตว์ก็ได้

ค่าเริ่มต้นคือ `nil` หมายความว่าตอนแรกยังไม่ได้เลือกสัตว์ใด ๆ

จากนั้น เราเปลี่ยนแต่ละแถวของสัตว์ให้เป็น `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

จุดสำคัญคือโค้ดบรรทัดนี้:

```swift
selectedAnimal = animal
```

เมื่อผู้ใช้คลิกสัตว์ตัวใดตัวหนึ่ง เราก็จะบันทึกสัตว์ตัวนั้นไว้ใน `selectedAnimal`

เช่น ผู้ใช้คลิกโลมา `selectedAnimal` ก็จะเก็บโลมาไว้

ผู้ใช้คลิกแพนด้า `selectedAnimal` ก็จะเก็บแพนด้าไว้

กล่าวคือ `selectedAnimal` ใช้บันทึกว่าสัตว์ตัวใดคือสัตว์ที่ผู้ใช้คลิกอยู่ในปัจจุบัน

## มุมมองป๊อปอัป Sheet

ตอนนี้เราสามารถบันทึก “สัตว์ที่คลิกอยู่ในปัจจุบัน” ผ่านปุ่มได้แล้ว

ต่อไป เราต้องสร้างมุมมองป๊อปอัปเพื่อแสดงรายละเอียดของสัตว์

![view](../../../Resource/029_view2.png)

ใน SwiftUI สามารถใช้ `Sheet` เพื่อสร้างเอฟเฟกต์การแสดงแบบป๊อปอัปนี้ได้

`Sheet` สามารถเข้าใจได้ว่าเป็นหน้าชั่วคราวที่เด้งขึ้นมา มันจะแสดงอยู่เหนือหน้าปัจจุบัน เมื่อผู้ใช้ดูเนื้อหาเสร็จแล้ว สามารถปัดลงเพื่อปิดได้

## ตัวอย่าง Sheet

ก่อนจะแสดงรายละเอียดสัตว์จริง ๆ เรามาทำความเข้าใจก่อนว่า `Sheet` เด้งขึ้นมาได้อย่างไรผ่านตัวอย่างง่าย ๆ

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("แสดง Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("มุมมอง Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

ผลลัพธ์ที่ได้:

![view](../../../Resource/029_view3.png)

ในโค้ดนี้ เราสร้างค่าบูลีนหนึ่งตัว:

```swift
@State private var showSheet = false
```

ค่าเริ่มต้นของ `showSheet` คือ `false` หมายความว่าตอนแรกไม่แสดง `Sheet`

เมื่อคลิกปุ่ม:

```swift
showSheet.toggle()
```

`toggle()` หมายถึงการสลับค่าบูลีน

ถ้าเดิมเป็น `false` หลังเรียก `toggle()` ก็จะเปลี่ยนเป็น `true`

ถ้าเดิมเป็น `true` หลังเรียก `toggle()` ก็จะเปลี่ยนเป็น `false`

ดังนั้น หลังคลิกปุ่ม `showSheet` จะเปลี่ยนจาก `false` เป็น `true`

เมื่อ `showSheet` เปลี่ยนเป็น `true` โค้ดด้านล่างนี้ก็จะเด้ง `Sheet` ขึ้นมา:

```swift
.sheet(isPresented: $showSheet) {
    Text("มุมมอง Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

โค้ดส่วนนี้หมายความว่า: เมื่อ `showSheet` เป็น `true` ให้เด้ง `Sheet` ขึ้นมา และแสดง `Text("มุมมอง Sheet")` ภายใน `Sheet`

ผลลัพธ์ที่ได้:

![view](../../../Resource/029_view4.png)

รูปแบบนี้เหมาะกับการเด้งเนื้อหาคงที่

เช่น หลังคลิกปุ่มแล้วเด้งหน้าการตั้งค่า หน้าอธิบาย หรือหน้าข้อความแจ้งเตือน เป็นต้น

### ตำแหน่งที่เขียน Sheet

แม้ว่า `Sheet` จะเป็นมุมมองแบบป๊อปอัป แต่ใน SwiftUI มันไม่ได้เขียนเป็นมุมมองอิสระโดยตรงเหมือน `Text()` หรือ `Image()` แต่ใช้งานในฐานะ view modifier

กล่าวคือ `.sheet(...)` คล้ายกับ modifier อย่าง `.font()`、`.padding()`、`.shadow()` ทั้งหมดต้องต่อท้ายมุมมองบางตัว

เช่น:

```swift
Button("แสดง Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("มุมมอง Sheet")
}
```

ในตัวอย่างนี้ `.sheet` ถูกเพิ่มไว้หลัง `Button`

เมื่อ `showSheet` เปลี่ยนเป็น `true` SwiftUI ก็จะเด้ง `Sheet` ขึ้นมา และแสดงเนื้อหาในวงเล็บปีกกา:

```swift
Text("มุมมอง Sheet")
```

อย่างไรก็ตาม ในการพัฒนาจริง หากหน้าเดียวมีหลายปุ่ม โดยปกติจะไม่เพิ่ม `.sheet` ให้ทุกปุ่มแยกกัน

วิธีที่พบบ่อยกว่าคือ: เพิ่ม `.sheet` ไว้หลังมุมมองชั้นนอก

เช่น:

```swift
VStack {
    Button("แสดง Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("มุมมอง Sheet")
}
```

ปุ่มมีหน้าที่แก้ไขค่า `showSheet` ส่วนมุมมองชั้นนอกมีหน้าที่ตัดสินว่าจะเด้ง `Sheet` หรือไม่ตามว่า `showSheet` เป็น `true` หรือไม่

## ผูก Sheet กับค่า Optional

รูปแบบที่เราเรียนไปก่อนหน้านี้คือ:

```swift
.sheet(isPresented: $showSheet) {
    Text("มุมมอง Sheet")
}
```

รูปแบบนี้เหมาะสำหรับควบคุมการแสดงและซ่อนหน้าคงที่หนึ่งหน้า

แต่ในตัวอย่างสารานุกรมสัตว์ เราไม่ได้ต้องการรู้แค่ว่า “จะเด้ง `Sheet` หรือไม่” เท่านั้น แต่ยังต้องรู้ด้วยว่า “คลิกสัตว์ตัวใด”

เช่น:

ผู้ใช้คลิกโลมา ใน `Sheet` ควรแสดงรายละเอียดของโลมา

ผู้ใช้คลิกแพนด้า ใน `Sheet` ควรแสดงรายละเอียดของแพนด้า

ดังนั้น ในที่นี้จึงเหมาะกับการใช้การเขียน Sheet อีกแบบหนึ่งมากกว่า:

```swift
.sheet(item: $selectedAnimal) { animal in
    // เนื้อหาที่แสดงใน Sheet
}
```

ในโค้ดส่วนนี้ `Sheet` ผูกกับค่าทางเลือก `selectedAnimal`

ต้องสังเกตว่า หลัง `item:` เขียนเป็น `$selectedAnimal` ไม่ใช่ `selectedAnimal`

เพราะ `Sheet` ไม่ได้แค่อ่านค่าของ `selectedAnimal` แต่ยังต้องตัดสินว่าจะเด้งขึ้นมาหรือไม่ตามการเปลี่ยนแปลงของมันด้วย

โค้ดส่วนนี้สามารถเข้าใจได้ดังนี้:

- เมื่อ `selectedAnimal` เป็น `nil` จะไม่แสดง `Sheet`
- เมื่อ `selectedAnimal` มีค่า จะแสดง `Sheet`
- เมื่อ `Sheet` ถูกปิด SwiftUI จะเปลี่ยน `selectedAnimal` กลับเป็น `nil` อีกครั้ง

SwiftUI จะส่งสัตว์ที่เก็บอยู่ใน `selectedAnimal` ให้กับ `animal` ในวงเล็บปีกกา

กล่าวคือ `.sheet(item:)` ไม่ได้ควบคุมแค่การเด้งขึ้นมาเท่านั้น แต่ยังส่งข้อมูลที่เลือกเข้าไปใน `Sheet` ด้วย

## ใช้ Sheet แสดงชื่อสัตว์

ตอนนี้ เรายังไม่ต้องรีบสร้างมุมมองรายละเอียดที่ซับซ้อน

เพื่อให้โค้ดเข้าใจง่ายขึ้น เราจะเริ่มจากการแสดงชื่อสัตว์ปัจจุบันใน `Sheet` ก่อน

เพิ่ม `.sheet(item:)` ไว้ด้านนอก `VStack`:

```swift
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
                        .cornerRadius(20)
                    
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
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

จุดที่สำคัญที่สุดคือโค้ดส่วนนี้:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

เมื่อ `selectedAnimal` มีค่า `Sheet` จะเด้งขึ้นมา

`animal` ในวงเล็บปีกกา คือสัตว์ที่ถูกเลือกอยู่ในปัจจุบัน

ดังนั้น:

```swift
Text(animal.name)
```

จะแสดงชื่อของสัตว์ที่ถูกคลิกอยู่ในปัจจุบัน

เช่น คลิก `โลมา` ใน Sheet จะแสดง `โลมา`

คลิก `แพนด้า` ใน `Sheet` จะแสดง `แพนด้า`

ด้วยวิธีนี้ เราก็สร้างเอฟเฟกต์คลิกสัตว์ต่างกัน แล้วเด้งชื่อสัตว์ต่างกันได้แล้ว

แสดงชื่อสัตว์:

![view](../../../Resource/029_view5.png)

อย่างไรก็ตาม รายละเอียดสัตว์ไม่ควรแสดงแค่ชื่อเดียว แต่ควรแสดงชื่อ พื้นที่กระจายพันธุ์ แหล่งที่อยู่อาศัย และคำอธิบายด้วย

ถ้าเขียนโค้ดเหล่านี้ทั้งหมดไว้ใน `.sheet` โค้ดจะยาวมากและอ่านไม่สะดวก

ดังนั้น ต่อไปเราจะสร้างมุมมองแบบกำหนดเองใหม่ ที่รับผิดชอบการแสดงรายละเอียดสัตว์โดยเฉพาะ

## สร้างมุมมองรายละเอียดสัตว์

ต่อไป เราจะสร้างมุมมองแบบกำหนดเองใหม่ชื่อ `AnimalDetailView`

มุมมองนี้รับ `Animal` หนึ่งตัว และแสดงรายละเอียดของสัตว์

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**พื้นที่กระจายพันธุ์**: \(animal.distributionArea)")

                    Divider()

                    Text("**แหล่งที่อยู่อาศัย**: \(animal.habitat)")

                    Divider()

                    Text("**คำอธิบายสัตว์**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

ผลลัพธ์ที่ได้:

![view](../../../Resource/029_view2.png)

จุดสำคัญที่นี่คือ:

```swift
var animal: Animal
```

นี่หมายความว่า `AnimalDetailView` ต้องรับสัตว์หนึ่งตัวจากภายนอก

หลังจากรับสัตว์แล้ว มุมมองรายละเอียดก็สามารถใช้ข้อมูลต่าง ๆ ของสัตว์ตัวนั้นได้:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

กล่าวคือ `AnimalDetailView` มีหน้าที่แสดงสัตว์ที่ถูกส่งเข้ามาเท่านั้น

### ข้อความตัวหนาด้วย Markdown

ในมุมมองรายละเอียด เราเขียนโค้ดลักษณะนี้:

```swift
Text("**แหล่งที่อยู่อาศัย:** \(animal.habitat)")
```

ตรงนี้มีความรู้สองจุด

ข้อแรก `**แหล่งที่อยู่อาศัย:**` ใช้ไวยากรณ์ `Markdown` ตัวอักษรที่ถูกครอบด้วยดอกจันสองตัวจะแสดงเป็นตัวหนา

ข้อที่สอง `\()` คือ string interpolation สามารถนำค่าของตัวแปรมาแสดงในข้อความได้

โค้ดส่วนนี้หมายถึง แสดง `แหล่งที่อยู่อาศัย:` แบบตัวหนาก่อน แล้วจึงแสดงแหล่งที่อยู่อาศัยของสัตว์ตัวนี้

## แสดงมุมมองรายละเอียดใน Sheet

หลังจากสร้าง `AnimalDetailView` แล้ว เราสามารถกลับไปที่ `ContentView` แล้วแทนที่มุมมองชื่อเดิมใน `Sheet` ด้วยมุมมองรายละเอียด

เดิมคือ:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

ตอนนี้แก้เป็น:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

`animal:` ที่นี่คือชื่อพารามิเตอร์ของ `AnimalDetailView`

ส่วน `animal` ที่อยู่ด้านหลังคือสัตว์ปัจจุบันที่ `.sheet(item:)` ส่งเข้ามา

นั่นก็คือ ส่งสัตว์ที่คลิกอยู่ในปัจจุบันให้ `AnimalDetailView` แสดง

โครงสร้างทั้งหมด:

```swift
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
                        .cornerRadius(20)
                    
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
```

เมื่อผู้ใช้คลิกสัตว์:

```swift
selectedAnimal = animal
```

`selectedAnimal` จะเปลี่ยนจาก `nil` เป็นสัตว์ตัวหนึ่ง เมื่อ `Sheet` ตรวจพบว่า `selectedAnimal` มีค่า ก็จะเด้งมุมมองขึ้นมา

`Sheet` จะส่งสัตว์ใน `selectedAnimal` ให้กับมุมมอง `AnimalDetailView` และ `AnimalDetailView` จะแสดงรายละเอียดของสัตว์

ด้วยวิธีนี้ เราก็สร้างฟังก์ชันคลิกรายการสัตว์ แล้วเด้งรายละเอียดของสัตว์ที่ตรงกันได้แล้ว

## ความแตกต่างระหว่างการเขียน Sheet สองแบบ

ตอนนี้ เราใช้ `.sheet(item:)` เพื่อแสดงมุมมองรายละเอียดสัตว์เรียบร้อยแล้ว

ตรงนี้สามารถสรุปการเขียน `Sheet` ที่พบบ่อยสองแบบอย่างง่ายได้

### แบบแรกคือผูกกับค่าบูลีน

```swift
@State private var showSheet = false

Button("แสดง Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("มุมมอง Sheet")
}
```

รูปแบบนี้เหมาะกับการเด้งเนื้อหาคงที่ เช่น หน้าการตั้งค่า หน้าอธิบาย หน้าแจ้งเตือน เป็นต้น

`showSheet` เป็นค่าบูลีน มีเพียงสองสถานะคือ `true` และ `false`

เมื่อ `showSheet` เป็น `true` `Sheet` จะแสดง

เมื่อ `showSheet` เป็น `false` `Sheet` จะไม่แสดง

### แบบที่สองคือผูกกับค่า Optional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

รูปแบบนี้เหมาะกับการเด้งเนื้อหาต่างกันตามข้อมูลที่เลือก

ในบทเรียนนี้ เราคลิกสัตว์คนละตัวและต้องแสดงรายละเอียดคนละแบบ ดังนั้นจึงเหมาะกับการใช้ `.sheet(item:)` มากกว่า

## โค้ดทั้งหมด

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // ชื่อสัตว์
    let name: String
    
    // รูปภาพสัตว์
    let imageName: String
    
    // สัญลักษณ์อีโมจิของสัตว์
    let avatarEmoji: String
    
    // พื้นที่กระจายพันธุ์
    let distributionArea: String
    
    // แหล่งที่อยู่อาศัย
    let habitat: String
    
    // คำอธิบายสัตว์
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // โลมา
        Animal(
            name: "โลมา",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "มหาสมุทรเขตร้อนและเขตอบอุ่นทั่วโลก",
            habitat: "มหาสมุทร น่านน้ำชายฝั่ง และแม่น้ำขนาดใหญ่บางสาย",
            animalDescription: "โลมาเป็นสัตว์เลี้ยงลูกด้วยนมทางทะเลที่ฉลาด พวกมันอยู่รวมกันเป็นฝูง สื่อสารด้วยเสียง และขึ้นชื่อเรื่องพฤติกรรมที่ขี้เล่น"
        ),
        // ยีราฟ
        Animal(
            name: "ยีราฟ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "ทุ่งสะวันนาและป่าโปร่งในแอฟริกา",
            habitat: "ทุ่งหญ้า ทุ่งสะวันนา และป่าโปร่ง",
            animalDescription: "ยีราฟเป็นสัตว์บกที่สูงที่สุด พวกมันมีคอยาว ขายาว และมักกินใบไม้จากต้นไม้สูง"
        ),
        // สิงโต
        Animal(
            name: "สิงโต",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "พบส่วนใหญ่ในแอฟริกาตอนใต้ของทะเลทรายซาฮารา และมีประชากรขนาดเล็กในอินเดียตะวันตก",
            habitat: "ทุ่งหญ้า ทุ่งสะวันนา และป่าโปร่ง",
            animalDescription: "สิงโตเป็นแมวใหญ่ที่ทรงพลัง พวกมันมักอยู่รวมกันเป็นกลุ่มที่เรียกว่าไพรด์ และมักถูกเรียกว่าราชาแห่งโลกสัตว์"
        ),
        // แพนด้า
        Animal(
            name: "แพนด้า",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "ป่าภูเขาในภาคกลางของจีน",
            habitat: "ป่าไผ่ในพื้นที่ภูเขาที่เย็นและชื้น",
            animalDescription: "แพนด้าเป็นหมีที่มีขนสีขาวดำ พวกมันกินไผ่เป็นหลัก และเป็นหนึ่งในสัตว์ที่ผู้คนจดจำได้ง่ายที่สุดในโลก"
        ),
        // หมีขั้วโลก
        Animal(
            name: "หมีขั้วโลก",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "ภูมิภาคอาร์กติกรอบขั้วโลกเหนือ",
            habitat: "น้ำแข็งทะเล พื้นที่ชายฝั่ง และสภาพแวดล้อมอาร์กติกที่หนาวเย็น",
            animalDescription: "หมีขั้วโลกเป็นหมีขนาดใหญ่ที่ปรับตัวให้เข้ากับสภาพแวดล้อมหนาวเย็นได้ดี พวกมันว่ายน้ำเก่ง และพึ่งพาน้ำแข็งทะเลเป็นหลักในการล่าแมวน้ำ"
        )
    ]
    
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
                            .cornerRadius(20)

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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**พื้นที่กระจายพันธุ์**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**แหล่งที่อยู่อาศัย**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**คำอธิบายสัตว์**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## สรุป

ในบทเรียนนี้ เราสร้างหน้าสารานุกรมสัตว์แบบง่าย ๆ เสร็จแล้ว

เราเริ่มจากใช้โครงสร้าง `Animal` เพื่อเก็บข้อมูลสัตว์ จากนั้นใช้อาร์เรย์เพื่อเก็บสัตว์ห้าตัว แล้วใช้ `ForEach` เพื่อแสดงรายการสัตว์

เมื่อผู้ใช้คลิกสัตว์ตัวใดตัวหนึ่ง เราจะบันทึกสัตว์ตัวนั้นไว้ใน `selectedAnimal`:

```swift
selectedAnimal = animal
```

เมื่อ `selectedAnimal` มีค่า `.sheet(item:)` จะเด้งมุมมองรายละเอียดขึ้นมา และส่งสัตว์ที่ถูกเลือกให้กับ `AnimalDetailView`

สิ่งที่สำคัญที่สุดในบทเรียนนี้ไม่ใช่สไตล์ของหน้าจอ แต่คือการทำความเข้าใจเส้นทางการส่งข้อมูลนี้:

```swift
คลิกสัตว์ → selectedAnimal บันทึกสัตว์ → Sheet เด้งขึ้นมา → AnimalDetailView แสดงรายละเอียด
```

เมื่อเข้าใจเส้นทางนี้แล้ว ต่อไปก็สามารถสร้างฟังก์ชันลักษณะคล้ายกันได้มากขึ้น เช่น รายละเอียดสินค้า รายละเอียดคอร์ส รายละเอียดบทความ รายละเอียดผู้ติดต่อ เป็นต้น
