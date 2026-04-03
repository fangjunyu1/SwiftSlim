# แอป Fill Light

ในบทเรียนนี้ เราจะสร้างแอป fill light ที่น่าสนใจมาก เมื่อถึงเวลากลางคืน เราสามารถให้หน้าจอโทรศัพท์แสดงสีที่แตกต่างกัน และใช้มันเป็นไฟเสริมแบบง่าย ๆ ได้

แอป fill light นี้สามารถสลับสีได้ด้วยการแตะหน้าจอ และยังสามารถปรับความสว่างด้วย slider ได้อีกด้วย

ในตัวอย่างนี้ เราจะเรียนรู้การใช้ `brightness` เพื่อปรับความสว่างของ view, ใช้ `onTapGesture` เพื่อเพิ่มท่าทางการแตะให้กับ view และใช้งาน control ของ view อย่าง `Slider`

ผลลัพธ์:

![Color](../../Resource/018_color.png)

## แสดงสี

ก่อนอื่น มาทำให้ view แสดงสีหนึ่งสีก่อน

ใน SwiftUI นั้น `Color` ไม่ได้หมายถึงแค่สีเท่านั้น แต่ยังสามารถแสดงเป็น view ได้ด้วย:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

ตรงนี้ `Color.red` หมายถึง view สีแดง ส่วน `.ignoresSafeArea()` จะทำให้ view สีขยายเต็มทั้งหน้าจอ ทำให้ดูคล้ายเอฟเฟกต์ fill light จริงมากขึ้น

ผลลัพธ์:

![Color](../../Resource/018_color1.png)

### array ของสีและ index

ตอนนี้มีการแสดงเพียงสีเดียว แต่ fill light โดยทั่วไปไม่ได้มีแค่สีเดียว มันยังอาจแสดงสีน้ำเงิน สีเหลือง สีม่วง สีขาว และสีอื่น ๆ ได้อีก

เราต้องการให้เมื่อแตะหน้าจอแล้วสามารถสลับไปยังสีต่าง ๆ ได้ จึงสามารถนำสีเหล่านี้มาเก็บไว้ใน array เพื่อจัดการร่วมกันได้:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

array เหมาะสำหรับเก็บ “ชุดข้อมูลที่เป็นชนิดเดียวกัน” ในที่นี้แต่ละ element ใน array ก็คือ `Color`

ถ้าเราต้องการแสดงสีใดสีหนึ่ง ก็สามารถใช้ index ได้:

```swift
colors[0]
```

นี่หมายถึงการอ่านสีที่ตำแหน่ง index `0` ใน array หรือก็คือสีแรกนั่นเอง

ตอนนี้ code สามารถเขียนได้แบบนี้:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

ด้วยวิธีนี้ หน้าจอจะแสดงสีแรกใน array ซึ่งก็คือสีแดง

### ใช้ index ควบคุมสี

ถ้าเราต้องการสลับไปมาระหว่างสีต่าง ๆ เราจำเป็นต้องใช้ตัวแปรเพื่อจัดการ index แทนการเขียน index แบบตายตัว

เราสามารถใช้ `@State` เพื่อประกาศตัวแปรสำหรับเก็บ index ได้:

```swift
@State private var index = 0
```

ตรงนี้ `index` หมายถึง index ของสีปัจจุบัน

เมื่อ `index` เปลี่ยน SwiftUI จะคำนวณหน้าจอใหม่และอัปเดตสิ่งที่แสดงผล

จากนั้นเปลี่ยน `colors[0]` เดิมให้เป็น:

```swift
colors[index]
```

ด้วยวิธีนี้ สีที่แสดงใน view จะถูกกำหนดโดย `index`

ตอนนี้ code จะกลายเป็น:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

เมื่อ `index` เปลี่ยน `colors[index]` ก็จะแสดงสีที่ต่างออกไปตามไปด้วย

ตัวอย่างเช่น:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

สิ่งที่ต้องระวังคือ `index` ต้องไม่เกิน index สูงสุดของ array ไม่เช่นนั้นจะเกิดข้อผิดพลาด index out of range

## ท่าทางการแตะ

ตอนนี้เราสามารถแสดงสีที่แตกต่างกันตาม `index` ได้แล้ว แต่ยังแตะเพื่อสลับสีไม่ได้

ในตัวอย่าง “Quote Carousel” ก่อนหน้านี้ เราใช้ `Button` เพื่อควบคุมการสลับคำคม

แต่ครั้งนี้เราต้องการ “แตะทั้งพื้นที่สี” เพื่อสลับสี ดังนั้น `onTapGesture` จึงเหมาะกว่า

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

เมื่อเราแตะ view สี จะมีการทำงานดังนี้:

```swift
index += 1
```

ซึ่งหมายความว่า `index` จะเพิ่มขึ้น `1` เมื่อ index เพิ่มขึ้น `colors[index]` ก็จะแสดงสีถัดไปใน array

### onTapGesture

`onTapGesture` คือ gesture modifier ที่สามารถเพิ่มการทำงานเมื่อแตะให้กับ view ได้

รูปแบบพื้นฐาน:

```swift
.onTapGesture {
    // code
}
```

ตัวอย่างเช่น:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

เมื่อแตะ view สีแดงนี้ code ในวงเล็บปีกกาจะถูกเรียกใช้ และ console จะแสดงผลเป็น:

```swift
Click color
```

ด้วย `onTapGesture` เราสามารถกำหนดได้ว่าเมื่อแตะ view แล้วจะให้เกิดอะไรขึ้น

### ความแตกต่างจาก `Button`

ก่อนหน้านี้เราได้เรียนรู้เกี่ยวกับ view อย่าง `Button` มาแล้ว ทั้ง `Button` และ `onTapGesture` ต่างก็สามารถจัดการการแตะได้ แต่สถานการณ์ที่เหมาะกับการใช้งานนั้นไม่เหมือนกันทั้งหมด

`onTapGesture` เหมาะกับการ “เพิ่มความสามารถในการแตะให้กับ view ที่มีอยู่แล้ว” เช่น `Color`, `Image`, `Text` หรือ view ทั่วไปอื่น ๆ

ส่วน `Button` เหมาะกับการแสดงปุ่มที่ชัดเจน เช่น “ยืนยัน”, “ส่ง” หรือ “ลบ”

ในแอป fill light นี้ เราต้องการให้การสลับสีง่ายที่สุด จึงสามารถใช้ `onTapGesture` เพื่อสลับสีด้วยการแตะทั้งพื้นที่สีได้

## ปัญหาของ index

ตอนนี้เราสามารถแตะหน้าจอเพื่อสลับระหว่างสีต่าง ๆ ได้แล้ว

แต่มีปัญหาสำคัญอยู่ตรงนี้คือ: **index อาจเกินขอบเขตของ array ได้**

ตัวอย่างเช่น:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

ถ้าแตะหน้าจอไปเรื่อย ๆ `index` จะกลายเป็น `4` ในที่สุด และจะทำให้เกิดข้อผิดพลาด “index out of range”

เพราะว่า array `colors` มีอยู่ `4` elements แต่ index เริ่มนับจาก `0` ดังนั้น index ที่ถูกต้องจึงอยู่ในช่วง `0 - 3` ไม่ใช่ `4`

ถ้าเข้าถึง `colors[4]` ก็จะเกิด “index out of range”

ใน code ปัจจุบัน ทุกครั้งที่แตะหน้าจอ `index` จะเพิ่มขึ้น `1` โดยอัตโนมัติ ถ้าเราไม่จัดการ ในที่สุดมันก็จะเกินช่วงที่กำหนดแน่นอน

ดังนั้น เมื่อแตะหน้าจอ เราจำเป็นต้องตรวจสอบ index: ถ้าเป็นสีสุดท้ายแล้วให้ย้อนกลับไปยังสีแรก มิฉะนั้นให้เพิ่มต่อไปอีก `1`

สามารถใช้คำสั่ง `if` ทำได้แบบนี้:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

ใน code นี้ `colors.count` หมายถึงจำนวน elements ใน array

ใน array ปัจจุบันมีสีอยู่ `4` สี ดังนั้น:

```swift
colors.count // 4
```

แต่ index สูงสุดไม่ใช่ `4` มันคือ `3` เพราะ index เริ่มต้นจาก `0`

ดังนั้น index สุดท้ายจึงต้องเขียนเป็น:

```swift
colors.count - 1
```

ก็คือ:

```swift
4 - 1 = 3
```

logic นี้หมายความว่า ถ้า index ปัจจุบันเป็นสีสุดท้ายอยู่แล้ว ก็ให้รีเซ็ตกลับเป็น `0` ไม่เช่นนั้นก็เพิ่มขึ้น `1`

ด้วยวิธีนี้ สีต่าง ๆ ก็จะสามารถวนลูปสลับกันได้

### ทำให้ index กระชับขึ้น

ถ้าต้องการให้ code สั้นลงอีก สามารถใช้ ternary operator ได้:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

code นี้หมายความว่า ถ้า `index == colors.count - 1` เป็นจริง ก็คืนค่า `0` ถ้าไม่จริง ก็คืนค่า `index + 1`

สุดท้ายก็นำผลลัพธ์นั้นไปกำหนดกลับให้กับ `index`

ตอนนี้เราก็สามารถทำเอฟเฟกต์การสลับสีได้แล้ว

code แบบสมบูรณ์:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

ตอนนี้เราสามารถแตะหน้าจอและสลับสีต่าง ๆ ได้แล้ว และแอป fill light พื้นฐานก็เสร็จสมบูรณ์

## แสดงชื่อสี

เราสามารถเพิ่มชุดข้อความที่สอดคล้องกับสีเข้าไปได้ด้วย เพื่อให้เมื่อสลับสีแล้ว หน้าจอก็จะแสดงชื่อของสีปัจจุบันไปพร้อมกัน

ตัวอย่างเช่น:

- เมื่อเป็นสีแดง ให้แสดง `Red`
- เมื่อเป็นสีน้ำเงิน ให้แสดง `Blue`
- เมื่อเป็นสีเหลือง ให้แสดง `Yellow`
- เมื่อเป็นสีม่วง ให้แสดง `Purple`

ตรงนี้ก็สามารถใช้ array เพื่อเก็บชื่อสีได้เช่นกัน:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

ลำดับของข้อความใน array นี้จะต้องตรงกับลำดับของสีใน array สี

จากนั้นเราก็สามารถใช้ `Text` เพื่อแสดงชื่อสีที่ตรงกับ index ปัจจุบันได้:

```swift
Text(colorsName[index])
```

`Text` จะแสดงชื่อสีปัจจุบันตามค่า `index`

ใช้ modifier เพื่อปรับ appearance ของ `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

ด้วยวิธีนี้ `Text` จะแสดงเป็นสีขาว ขนาดหัวเรื่องใหญ่ และตัวหนา

ตอนนี้เรามี `Color` view แบบเต็มหน้าจออยู่แล้ว ถ้าเราต้องการให้ `Text` แสดงอยู่ด้านบนของ `Color` view ก็ต้องใช้ container สำหรับ layout อย่าง `ZStack`

```swift
ZStack {
    Color
    Text
}
```

ดังนั้น code จึงเปลี่ยนเป็น:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

ด้วยวิธีนี้ ด้านหลังจะเป็น view สี ส่วนด้านหน้าจะเป็น view ข้อความที่ซ้อนอยู่ด้านบน

ผลลัพธ์:

![Color](../../Resource/018_color2.png)

สิ่งที่ต้องระวังคือ ใน `ZStack` view ที่เขียนทีหลังมักจะแสดงอยู่ด้านหน้า ถ้าเขียน `Text` ไว้ก่อน `Color` ก็มีโอกาสที่ `Color` ซึ่งอยู่ทีหลังจะบัง `Text`

## ควบคุมความสว่าง

ตอนนี้เราสามารถสลับระหว่างสีต่าง ๆ ได้แล้ว แต่ fill light ยังมีความสามารถสำคัญอีกอย่างคือ: **การปรับความสว่าง**

ใน SwiftUI เราสามารถใช้ modifier `brightness` เพื่อปรับความสว่างของ view ได้

ตัวอย่างเช่น:

```swift
.brightness(1)
```

เราสามารถเขียนแบบนี้ได้:

```swift
colors[index]
    .brightness(0.5)
```

ด้วยวิธีนี้ สีปัจจุบันจะสว่างขึ้น และดูใกล้เคียงกับเอฟเฟกต์ fill light มากขึ้น

ช่วงค่าของ `brightness` คือ `0 - 1` โดย `0` หมายถึงคงสีเดิมไว้ ยิ่งเข้าใกล้ `1` มากเท่าไร สีจะยิ่งสว่างขึ้น และ `1` หมายถึงความสว่างสีขาวสูงสุด

ถึงแม้ว่าเราจะควบคุม `brightness` ใน code ได้ แต่ผู้ใช้ยังไม่สามารถปรับมันเองได้

เราจำเป็นต้องเพิ่ม control ที่ลากได้เข้าไป นั่นคือ `Slider`

## Slider view

ใน SwiftUI นั้น `Slider` เป็น control แบบแถบเลื่อนที่ใช้เลือกค่าภายในช่วงที่กำหนด Apple อธิบายไว้ว่าเป็น “control for selecting a value from a bounded linear range”

การใช้งานพื้นฐาน:

```swift
Slider(value: $value, in: 0...1)
```

คำอธิบายของ parameter:

1. `value: $value`: `Slider` จำเป็นต้อง bind กับตัวแปร

    เมื่อมีการลาก slider ค่าในตัวแปรจะเปลี่ยนตามไปด้วย ในทางกลับกัน ถ้าค่าตัวแปรเปลี่ยน slider ก็จะอัปเดตตามเช่นกัน

    ตรงนี้คล้ายกับ `TextField` ที่เราเคยเรียนมาก่อน เพราะทั้งคู่ต่างก็เป็นการ “bind control เข้ากับตัวแปร”
    
    หน้าตัวแปรที่ bind จะต้องใส่สัญลักษณ์ `$` เพื่อแสดงว่าเป็น binding

2. `in: 0...1`: parameter นี้แสดงช่วงค่าของ slider

    ตรงนี้ `0...1` หมายถึงค่าต่ำสุดคือ `0` และค่าสูงสุดคือ `1`

    เมื่อเลื่อน slider ไปทางซ้ายสุด ตัวแปรที่ bind จะมีค่าใกล้ `0`; เมื่อเลื่อนไปทางขวาสุด ก็จะมีค่าใกล้ `1`

ตัวอย่างเช่น:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` นี้ bind กับตัวแปร `value` ดังนั้นเมื่อเลื่อน slider ค่า `value` ก็จะเปลี่ยนตามไปพร้อมกัน

ลักษณะการแสดงผล:

![Slider](../../Resource/018_slider.png)

เมื่อ `Slider` อยู่ทางซ้ายสุด ค่า `value` ที่ bind จะกลายเป็น `0` และเมื่ออยู่ทางขวาสุดก็จะกลายเป็น `1`

### ช่วงของค่า

ช่วงค่าของ `Slider` ไม่ได้ตายตัวเสมอไป เราสามารถเขียนเป็น:

```swift
0...100
```

หรือช่วงอื่น ๆ ก็ได้

แต่ใน fill light นี้ เราต้องการควบคุมความสว่าง ดังนั้น `0...1` จึงเหมาะสมที่สุด

## ใช้ Slider ควบคุม brightness

ตอนนี้เราจะเชื่อม `Slider` เข้ากับ `brightness`

ก่อนอื่น สร้างตัวแปรสำหรับเก็บค่าความสว่าง:

```swift
@State private var slider = 0.0
```

ตรงนี้ `0.0` เป็นค่าชนิด `Double`

เพราะ `Slider` มัก bind กับค่าตัวเลข และในที่นี้เราต้องการให้มันเปลี่ยนแปลงได้อย่างต่อเนื่อง จึงเหมาะที่จะใช้ `Double` นอกจากนี้ `brightness` ก็รับได้เฉพาะค่าชนิด `Double` เช่นกัน

จากนั้นส่งค่านี้เข้าไปให้ `brightness`:

```swift
colors[index]
    .brightness(slider)
```

เมื่อ `slider == 0` สีจะยังคงอยู่ในสถานะปกติ และเมื่อ `slider` เข้าใกล้ `1` มากขึ้น สีจะดูสว่างมากขึ้น

### เพิ่ม control Slider

ถัดไป ให้เพิ่ม control `Slider` เพื่อแก้ไขตัวแปรนี้:

```swift
Slider(value: $slider, in: 0...1)
```

เมื่อ slider เปลี่ยน ค่า `slider` ก็จะเปลี่ยนตาม และ `brightness(slider)` ก็จะปรับความสว่างไปพร้อมกัน

นี่คือตัวอย่างที่พบได้บ่อยมากใน SwiftUI ของแนวคิดที่ว่า “ตัวแปรขับเคลื่อน view”

### ปรับ appearance ของ Slider

โดยปกติแล้ว `Slider` จะใช้ความกว้างตามพื้นที่ที่มีอยู่

เราสามารถกำหนดความกว้างแบบคงที่ให้มันได้:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

จากนั้นเพิ่ม modifier อีกเล็กน้อยเพื่อให้มองเห็นได้ชัดขึ้น:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

ด้วยวิธีนี้ slider จะมีพื้นหลังสีขาวและมุมโค้งมน ทำให้มองเห็นได้เด่นชัดมากขึ้นบน `Color` view

สุดท้าย เราจะวางมันไว้ที่ด้านล่างของหน้าจอ

เพราะก่อนหน้านี้เราใช้ `ZStack` อยู่แล้ว เราจึงสามารถใส่ `VStack` เพิ่มเข้าไปด้านใน และใช้ `Spacer()` เพื่อดัน `Slider` ลงไปด้านล่างได้

## code แบบสมบูรณ์

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

ผลลัพธ์:

![Color](../../Resource/018_color.png)

## สรุป

เราได้นำความรู้ที่เรียนมาก่อนหน้านี้ รวมกับพื้นฐานเกี่ยวกับสีและ array มาสร้างเป็นแอป fill light ที่น่าสนใจมาก

ผ่านแอป fill light นี้ เราได้เรียนรู้การใช้ `brightness` เพื่อปรับความสว่าง การใช้ `onTapGesture` เพื่อเพิ่มการแตะให้กับ view และการใช้ control ของ view อย่าง `Slider`

เราเพิ่ม `onTapGesture` ให้กับ `Color` view และสร้างความสามารถในการสลับสีขึ้นมา ผ่าน `Slider` control เราควบคุมตัวแปรที่จัดการ `brightness` ทำให้สามารถปรับความสว่างของสีได้ ซึ่งนี่ก็เป็นอีกตัวอย่างหนึ่งของแนวคิด “ตัวแปรขับเคลื่อน view”

เราได้ทบทวน ternary operator, ใช้ `ZStack` เพื่อซ้อน view และใช้ array เพื่อจัดการกลุ่มข้อมูลชนิดเดียวกัน สิ่งนี้ช่วยให้เราเข้าใจ array และ index ลึกขึ้น รวมถึงคำนึงถึงปัญหา index out of range ในการใช้งานจริง

แม้ตัวอย่างนี้จะไม่ซับซ้อน แต่ก็นำความรู้พื้นฐานหลายอย่างที่เราเรียนมาก่อนหน้านี้มาเชื่อมเข้าด้วยกัน เมื่อได้นำมันมาใช้ในโปรเจกต์เล็ก ๆ ที่ใกล้เคียงการใช้งานจริง ก็จะยิ่งทำให้เข้าใจบทบาทของแต่ละแนวคิดได้ง่ายขึ้น

### สถานการณ์การใช้งานจริง

ลองจินตนาการว่าคุณนำ iPhone เครื่องเก่ามาวางไว้บนโต๊ะ แล้วใช้แอป fill light ที่คุณพัฒนาขึ้นเองเพื่อควบคุมสีของแสง นั่นคงเป็นประสบการณ์ที่ดีมาก

ใน App Store ก็มีแอป “fill light” อยู่มากมาย ซึ่งดูแล้วก็ไม่ได้ซับซ้อนมากนักเช่นกัน

![AppStore](../../Resource/018_appStore.PNG)

เราสามารถเริ่มต้นจากการพัฒนาแอปง่าย ๆ แล้วลองนำขึ้น App Store ได้ สิ่งนี้ไม่เพียงเพิ่มความสนใจในการพัฒนา แต่ยังช่วยบันทึกเส้นทางการเติบโตของเราอีกด้วย

### แบบฝึกหัดหลังเรียน

คุณสามารถลองคิดต่อได้ว่าแอป fill light นี้จะต่อยอดไปทางไหนได้อีก เช่น:

- เพิ่มสีให้มากขึ้น
- แสดงค่าความสว่างปัจจุบัน
- ปรับปรุงดีไซน์ของพื้นที่ slider ด้านล่าง

เมื่อคุณเริ่มนำความรู้พื้นฐานเหล่านี้ไปใช้จริง คุณจะพบว่าสิ่งที่เราเรียนรู้แต่ละอย่าง แท้จริงแล้วล้วนเป็นเครื่องมือสำหรับการพัฒนาแอป
