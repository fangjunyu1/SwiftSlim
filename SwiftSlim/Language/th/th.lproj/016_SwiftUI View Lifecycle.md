# วงจรชีวิตของ View ใน SwiftUI

ในบทเรียนก่อนหน้านี้ เราได้รู้แล้วว่าตัวแปร `@State` จะทำงานตามวงจรชีวิตของ view และยังได้เรียนรู้การใช้งานพื้นฐานของ `onAppear` ด้วย

ในบทเรียนนี้ เราจะทำความเข้าใจวงจรชีวิตของ view ใน SwiftUI ให้ลึกขึ้น ศึกษาว่า view ถูกสร้างและแสดงผลอย่างไร รวมถึงตัวแปรภายใน view ถูกสร้างและถูกสร้างใหม่อย่างไร พร้อมทั้งเรียนรู้ `onAppear`, `onDisappear` และตัวสร้าง `init`

จากความรู้เหล่านี้ เราจะค่อย ๆ สร้างความเข้าใจภาพรวมของกระบวนการสร้าง view ใน SwiftUI

## ลำดับการเริ่มทำงานของแอป

เมื่อสร้างโปรเจกต์ iOS ขึ้นมา Xcode จะสร้างไฟล์มาให้โดยอัตโนมัติ 2 ไฟล์:

```id="6cp1t1"
ContentView.swift
ชื่อโปรเจกต์ + App.swift
```

ในสองไฟล์นี้ ไฟล์ “ชื่อโปรเจกต์ + App”.swift คือจุดเริ่มต้นของทั้งแอป

ตัวอย่างเช่น:

```swift id="qw2xet"
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

### ลำดับการทำงานของโค้ด

เมื่อเราเปิดแอป (ไม่ว่าจะเป็นบน Simulator หรือเครื่องจริง) ระบบจะค้นหาคีย์เวิร์ด `@main` ก่อน:

```swift id="dfgjlwm"
@main
struct SwiftSlimTestApp: App {...}
```

เมื่อยืนยันไฟล์เริ่มต้นได้แล้ว ระบบก็จะเริ่มทำงานตามโค้ด

ก่อนอื่นจะเข้าสู่ struct ของ App แล้วทำโค้ดภายใน `body` จากนั้นสร้าง `WindowGroup` และโหลด `ContentView` ที่อยู่ภายใน

### หน้าที่ของ WindowGroup

`WindowGroup` ใช้สำหรับจัดการหน้าต่าง:

```swift id="k2t5gr"
WindowGroup {
    ContentView()
}
```

ระบบ iPad และ macOS รองรับหลายหน้าต่าง ส่วน iPhone โดยทั่วไปจะมีเพียงหน้าต่างเดียว

ดังนั้น บน iPhone `WindowGroup` จึงมีหน้าที่หลักในการจัดการหน้าจอแรกที่ถูกแสดง

### กระบวนการโหลด view

เมื่อระบบพบ `ContentView` แล้ว:

```swift id="usj7az"
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

SwiftUI จะประมวลผลโค้ดภายใน `body` แล้วสร้างหน้าจอตามโครงสร้าง view ที่คืนกลับมา เช่น `VStack`, `Text` เป็นต้น จากนั้นจึงแสดงผลบนหน้าจอ

เมื่อขั้นตอนเหล่านี้เสร็จสิ้น เราก็จะเห็น `ContentView` ปรากฏบนหน้าจอ

![ContentView](../../Resource/016_view1.png)

สิ่งที่ต้องสังเกตคือ `body` มีหน้าที่ “สร้าง” view ไม่ใช่ “เก็บ” view

นั่นหมายความว่า ทุกครั้งที่ view ถูกรีเฟรช SwiftUI จะคำนวณ `body` ใหม่อีกครั้ง และสร้างโครงสร้าง view ชุดใหม่ขึ้นมา

### ตรรกะของ Preview

Xcode Preview (Canvas) และการรันจริง เป็นคนละกลไกกัน

ตัวอย่างเช่น ถ้าเราเพิ่มโค้ดดีบักในไฟล์เริ่มต้น:

```swift id="pbe5cq"
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

เมื่อเราเปิดดู `ContentView` ผ่าน Xcode Preview มันจะไม่เริ่มทำงานจากทางเข้า `@main` ดังนั้น `onAppear` ที่เขียนไว้ในไฟล์เริ่มต้นจะไม่ถูกเรียก

แต่ถ้าเรารันบน Simulator หรือเครื่องจริง ระบบจะเริ่มจาก `@main` และรันแอปตามลำดับครบทั้งกระบวนการ จึงจะเรียก `onAppear` ที่อยู่ในจุดเริ่มต้น พร้อมแสดงข้อความดีบักออกมา

จุดสำคัญอยู่ที่ Xcode Preview เป็นเพียง “การเรนเดอร์เฉพาะบางส่วน” ใช้เพื่อแสดง view ปัจจุบันเท่านั้น ส่วน Simulator และเครื่องจริงจะให้ “สภาพแวดล้อมการทำงานแบบสมบูรณ์” ซึ่งรันทั้งแอปจริง ๆ

ดังนั้น เวลาทดสอบฟังก์ชันของแอป ควรยึดผลจาก Simulator หรือเครื่องจริงเป็นหลัก เพราะ Xcode Preview ไม่สามารถให้สภาพแวดล้อมการทำงานแบบครบถ้วนได้

## วงจรชีวิตของ view

ในช่วงนี้ โค้ดทั้งหมดของเรายังอยู่รวมกันใน `ContentView` แต่ในแอปจริง แอปหนึ่งมักมีหลาย view และมีการสลับไปมาระหว่าง view ต่าง ๆ ตามสถานการณ์

ตัวอย่างเช่น ในโปรเจกต์ “กระปุกออมสิน”:

![PiggyBank](../../Resource/016_view.png)

เมื่อกด “ออมเงิน” ก็จะแสดง view ชื่อ `SaveView` และเมื่อออมเงินเสร็จหรือปิดหน้านั้น `SaveView` ก็จะถูกนำออก

กระบวนการนี้ก็คือวงจรชีวิตของ view: เริ่มจากการสร้าง view แสดง view และสุดท้ายเอา view ออก

### การปิดแอป

เมื่อแอปถูกปิด view ทั้งหมดก็จะถูกนำออก และสถานะที่เกี่ยวข้องก็จะหายไปด้วย

ดังนั้น `ContentView` และ view อื่น ๆ จะถูกนำออกจากหน่วยความจำ และสถานะการทำงานทั้งหมดของแอปก็จะถูกล้างไปพร้อมกัน

## วงจรชีวิตของตัวแปรภายใน view

ใน SwiftUI วงจรชีวิตของตัวแปรมักจะผูกกับ view

ตัวอย่างเช่น:

```swift id="zj5d6a"
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

### ตัวแปร `@State`

ตัวแปรที่ประกาศด้วย `@State` จะผูกกับวงจรชีวิตของ view

```swift id="76njpm"
@State private var name = "FangJunyu"
```

เมื่อ view ถูกสร้างขึ้น `name` ก็จะถูกสร้างขึ้นด้วย และเมื่อ view ถูกนำออก `name` ก็จะถูกทำลายไปด้วย

นี่จึงเป็นเหตุผลว่าทำไมเราจึงต้องใช้วิธีอย่าง UserDefaults เพื่อบันทึกข้อมูลแบบถาวร

### ตัวแปรภายใน body

ตัวแปรที่ประกาศอยู่ใน `body`:

```swift id="l1cn8c"
var num = 10
```

วงจรชีวิตของมันจะผูกอยู่กับกระบวนการทำงานของ `body`

เมื่อสถานะของ SwiftUI เปลี่ยน เช่น:

```swift id="sxj48m"
@State private var name = "FangJunyu"
name = "Hu"
```

เมื่อ `name` เปลี่ยน `@State` จะตรวจพบว่าข้อมูลมีการเปลี่ยนแปลง และแจ้งให้ SwiftUI คำนวณ view ใหม่ ทำให้ `body` ถูกคำนวณใหม่

เมื่อ `body` ถูกคำนวณใหม่ โค้ดทั้งหมดภายใน `body` ก็จะถูกรันใหม่ และตัวแปรใน `body` อย่าง `num` ก็จะถูกสร้างใหม่ทั้งหมด

นี่จึงเป็นเหตุผลว่า ทำไมจึงไม่แนะนำให้ประกาศตัวแปรที่ซับซ้อนภายใน `body`

เพราะทุกครั้งที่ view รีเฟรช ตัวแปรภายใน `body` จะถูกสร้างใหม่ทั้งหมด ซึ่งจะเพิ่มต้นทุนการคำนวณ และกระทบต่อประสิทธิภาพ

ใน SwiftUI ข้อมูลคนละชนิดควรใช้วิธีจัดการต่างกัน ข้อมูลที่ต้องผูกกับวงจรชีวิตของ view สามารถเก็บด้วย `@State` ส่วนข้อมูลชั่วคราวที่ใช้คำนวณสามารถวางไว้ใน `body` ได้

## onAppear และ onDisappear

ในบทเรียนก่อนหน้า เราได้เรียนรู้ `onAppear` แล้ว ซึ่งจะถูกเรียกเมื่อ view ปรากฏบนหน้าจอ

```swift id="s8l70g"
.onAppear {}
```

ตัวอย่างเช่น:

```swift id="uck08l"
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

ไม่ว่าจะใน Xcode Preview หรือการรันจริง เราจะเห็นข้อความดีบักจาก `onAppear`

### onDisappear

สิ่งที่ทำงานคู่กับ `onAppear` ก็คือ `onDisappear`:

```swift id="kqh8i4"
.onDisappear {}
```

เมื่อ view ถูกปิดหรือถูกนำออก `onDisappear` จะถูกเรียก

ตัวอย่างเช่น:

```swift id="d7gjm6"
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

เมื่อ view ถูกนำออก โค้ดใน `onDisappear` ก็จะถูกเรียกใช้

หมายเหตุ: ในช่วงนี้ `ContentView` ที่เราใช้อยู่ยังเป็น root view ของแอป จึงไม่สามารถปิดหรือเอาออกได้โดยตรง ดังนั้นตอนนี้เราจึงยังไม่สามารถสังเกตผลของ `onDisappear` ได้ชัดเจน

เราจะเห็นการเรียก `onDisappear` ได้จริงมากขึ้นในบทต่อ ๆ ไป เมื่อเริ่มเรียนเรื่องการเปลี่ยนหน้าและการเปิด view ใหม่

## ตรรกะของการสร้างและการแสดงผล

สิ่งที่ต้องเข้าใจคือ “การสร้าง view” และ “การแสดง view” เป็นคนละช่วงกัน

ตอนที่ view ถูกสร้าง จะมีการเรียก constructor ของ struct:

```swift id="o7ngq8"
init() {}
```

เพราะ view ของ SwiftUI เป็นโครงสร้างแบบ `struct`:

```swift id="u94khf"
struct ContentView: View { ... }
```

ดังนั้น เมื่อ instance ของ view ถูกสร้างขึ้น ระบบจะเรียก `init` ก่อน และเมื่อ view ถูกแสดงแล้ว จึงค่อยเรียก `onAppear`

ตัวอย่างเช่น:

```swift id="3vvdwp"
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

เมื่อดูใน Xcode Preview เราจะเห็นข้อความดีบักดังนี้:

```swift id="3b4d56"
Create ContentView
Show ContentView
```

สิ่งนี้อธิบายว่า ระบบจะเรียก `init` เพื่อสร้าง view ก่อน จากนั้นคำนวณโค้ดใน `body` และสุดท้ายจึงแสดง view พร้อมเรียก `onAppear`

ดังนั้น เราจึงต้องเข้าใจให้ชัดว่า “ช่วงสร้าง” และ “ช่วงแสดง” ของ view เป็นคนละขั้นตอนกัน

### ตัวสร้าง `init`

`init` เป็นไวยากรณ์พื้นฐานของ Swift โดยทั้ง `struct` และ `class` สามารถประกาศได้ ใช้สำหรับกำหนดค่าเริ่มต้นให้วัตถุ

```swift id="n0t0u3"
init() {}
```

ใน SwiftUI เมื่อ view ถูกสร้างขึ้น ระบบจะเรียก `init` ของ view ซึ่งสามารถใช้เพื่อรับพารามิเตอร์ หรือเตรียมข้อมูลเริ่มต้นได้

ถ้าเราไม่ได้เขียน `init` เอง Swift จะสร้าง constructor เริ่มต้นให้กับ `struct` โดยอัตโนมัติ

สำหรับ view อย่าง `ContentView` เมื่อ view ถูกสร้าง ระบบจะเรียก `init` และเมื่อ view ถูกแสดง ระบบจะเรียก `onAppear`

ดังนั้น `init` คือ constructor ที่ทำงานในช่วงที่ view ถูกสร้าง ซึ่งในภายหลังเราจะใช้มันตอนส่งพารามิเตอร์หรือเตรียมข้อมูลเริ่มต้น

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้ลำดับการเริ่มต้นของแอป ตั้งแต่ไฟล์เริ่มต้นไปจนถึงกระบวนการทำงานของ `ContentView`

เราได้เข้าใจวงจรชีวิตของ view ใน SwiftUI: ตอนที่ view ถูกสร้างจะเรียก `init` ตอนที่แสดงบนหน้าจอจะเรียก `onAppear` และตอนที่ถูกนำออกหรือปิดจะเรียก `onDisappear`

เราได้เรียนรู้กลไกการอัปเดต view ด้วยว่า view ใน SwiftUI ขับเคลื่อนด้วยสถานะ เมื่อสถานะอย่าง `@State` เปลี่ยน SwiftUI จะรีเฟรช view และคำนวณ `body` ใหม่ ซึ่งทำให้ตัวแปรภายใน `body` ถูกสร้างใหม่ด้วย

วงจรชีวิตของตัวแปรจะผูกกับวงจรชีวิตของ view ส่วนตัวแปรชั่วคราวภายใน `body` จะถูกสร้างใหม่ทุกครั้งที่มีการรีเฟรช

การเข้าใจพฤติกรรมของวงจรชีวิตเหล่านี้และพฤติกรรมของตัวแปร จะช่วยให้เราจัดระเบียบโค้ดได้ดีขึ้น และทำให้ตรรกะของแอปชัดเจนขึ้น
