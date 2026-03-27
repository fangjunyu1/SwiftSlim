# กระปุกออมสิน

ในบทเรียนนี้ เราจะพัฒนาโปรเจกต์ “กระปุกออมสิน” แบบง่าย ๆ ตัวหนึ่ง ซึ่งมีฟังก์ชันไม่ซับซ้อน แต่มีตรรกะการโต้ตอบครบถ้วน จึงเหมาะมากสำหรับผู้เริ่มต้น

ผ่านโปรเจกต์นี้ เราจะได้เรียนรู้ TextField (ช่องกรอกข้อมูล) และ border (เส้นขอบ) พร้อมทั้งทำความเข้าใจเรื่องการผูกข้อมูล (Data Binding) ด้วย $

เป้าหมายสุดท้ายคือการสร้าง “กระปุกออมสิน” ที่ผู้ใช้สามารถกรอกจำนวนเงิน กดปุ่มบันทึก และสะสมยอดรวมของเงินได้

ผลลัพธ์ที่ต้องการ:

![Piggy Bank](../../RESOURCE/014_view.png)

## แสดงยอดรวมทั้งหมด

ก่อนอื่น เราจำเป็นต้องแสดง “ยอดรวม” ของกระปุกออมสินบนหน้าจอ

ใน ContentView ให้ประกาศตัวแปรหนึ่งตัวเพื่อเก็บยอดรวมของ “กระปุกออมสิน”

```swift id="m6k1qa"
@State private var amount = 0
```

จากนั้นใช้ Text เพื่อแสดงจำนวนเงินนี้:

```swift id="jnxjwk"
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ตรงนี้เราใช้ .font และ .fontWeight เพื่อกำหนดขนาดและความหนาของตัวอักษร

```swift id="owgtm6"
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

เมื่อ amount เปลี่ยนแปลง ตัวเลขยอดรวมที่แสดงใน Text ก็จะรีเฟรชตามโดยอัตโนมัติ

## กรอกจำนวนเงิน

“กระปุกออมสิน” ไม่ได้มีแค่การแสดงยอดรวมเท่านั้น แต่ยังต้องให้ผู้ใช้สามารถ “กรอก” จำนวนเงินที่จะออมหรือเพิ่มเข้าไปได้ ซึ่งตรงนี้เราต้องใช้คอนโทรลของ SwiftUI ที่ชื่อว่า TextField

### TextField

TextField คือคอนโทรลใน SwiftUI ที่ใช้สำหรับกรอกข้อมูล โดยปกติมักใช้สำหรับการกรอกข้อมูลแบบบรรทัดเดียว

TextField โดยหลักแล้วรองรับการ bind อยู่ 2 รูปแบบ:

**1. ผูกกับชนิด String**

```swift id="sdjlwm"
TextField("Placeholder", text: $text)
```

เหมาะสำหรับข้อมูลข้อความ เช่น ชื่อ หรือหัวข้อ

**2. ผูกกับชนิดตัวเลข (Int/Double)**

```swift id="0z6lg2"
TextField("Amount", value: $number, format: .number)
```

เหมาะสำหรับข้อมูลตัวเลข เช่น อายุ เงินเดือน หรือจำนวนเงิน

format: .number หมายความว่าช่องกรอกนี้จะทำการแปลงและแสดงผลตาม “รูปแบบตัวเลข”

#### ข้อความตัวอย่างในช่องกรอก

พารามิเตอร์ตัวแรกของ TextField คือ Placeholder ซึ่งใช้เป็นข้อความแนะนำให้ผู้ใช้กรอกข้อมูล:

```swift id="v61m5g"
TextField("input your name", text: $text)
```

เมื่อช่องกรอกยังว่างอยู่ จะแสดงข้อความแนะนำสีเทาอ่อนขึ้นมา

![textfield](../../RESOURCE/014_textfield.png)

#### การผูกข้อมูล

TextField ไม่ได้มีหน้าที่บันทึกข้อมูลอย่างถาวรด้วยตัวเอง แต่จะต้องใช้ตัวแปรที่ bind ไว้เพื่อจัดการข้อมูล

```swift id="b1t51x"
@State private var text = ""
TextField("Placeholder", text: $text)
```

ข้อมูลที่ผู้ใช้กรอกจะถูกเก็บลงในตัวแปร text โดยตรง ส่วน TextField ทำหน้าที่เป็นเพียงอินเทอร์เฟซสำหรับการกรอกข้อมูล

$ หมายถึงการ bind (Binding):

```swift id="svm9hk"
$text
```

นี่ไม่ใช่ตัวแปรธรรมดา แต่เป็นชนิด Binding

หน้าที่ของมันคือสร้างการเชื่อมต่อระหว่าง view กับข้อมูล:

เมื่อผู้ใช้พิมพ์ข้อความใน TextField ค่า text จะอัปเดตโดยอัตโนมัติ และเมื่อ text เปลี่ยนแปลง TextField ก็จะอัปเดตตามเช่นกัน

ตัวอย่างเช่น:

```swift id="4f7nw8"
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

เมื่อกรอกข้อความลงใน TextField ข้อความใน Text ด้านบนก็จะแสดงตามแบบเรียลไทม์

![textField](../../RESOURCE/014_textfield1.png)

### การผูกกับชนิดตัวเลข

เมื่อเราต้องการให้ผู้ใช้กรอกตัวเลข ก็ต้อง bind กับตัวแปรที่มีชนิดข้อมูลเป็นตัวเลขเช่นกัน:

```swift id="cxo20u"
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

เมื่อผู้ใช้กรอกจำนวนเงิน TextField จะทำการแปลงค่าที่กรอก และอัปเดตค่า number ให้โดยอัตโนมัติ

## เพิ่มช่องกรอกข้อมูล

เมื่อเข้าใจการใช้งานพื้นฐานของ TextField แล้ว เราจะนำมันมาใช้ในโปรเจกต์ “กระปุกออมสิน”

เนื่องจาก “กระปุกออมสิน” ต้องกรอก “จำนวนเงิน” ดังนั้นเราจึงใช้รูปแบบ “ผูกกับชนิดตัวเลข (Int/Double)” และเพิ่มตัวแปร number ขึ้นมาอีกตัวเพื่อเก็บค่าที่ผู้ใช้กรอก:

```swift id="kdn6x0"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

ตอนนี้ TextField จะแสดงค่าเริ่มต้นของ number ตามค่าเริ่มต้น (ซึ่งคือ 0)

เมื่อเราลบข้อความในช่องกรอกจนว่าง ก็จะแสดง Placeholder “Amount”

นี่ก็ยืนยันอีกครั้งว่า สิ่งที่ TextField แสดงอยู่คือค่าของตัวแปรที่ bind ไว้ ไม่ใช่การเก็บข้อมูลไว้ในตัวมันเอง

### ปัญหาเรื่องขนาดของช่องกรอก

ในหน้าจอปัจจุบัน เราจะพบว่า TextField ยังไม่มีเส้นขอบ แสดงเพียงเลข 0 และเนื้อหาดูเหมือนจะจัดชิดซ้าย

ผลลัพธ์เป็นดังนี้:

![textfield](../../RESOURCE/014_textfield2.png)

นี่เป็นเพราะว่าโดยค่าเริ่มต้น TextField จะขยายเต็มความกว้างของ view แม่

เราสามารถเพิ่มสีพื้นหลังเข้าไปเพื่อยืนยันจุดนี้ได้:

```swift id="x3hpac"
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

ผลลัพธ์เป็นดังนี้:

![textfield](../../RESOURCE/014_textfield3.png)

จะเห็นได้ว่าในความเป็นจริง TextField กินพื้นที่เต็มทั้งบรรทัด

### กำหนดความกว้างคงที่

ถ้าเราต้องการให้ช่องกรอกดูเล็กและกระชับขึ้น สามารถใช้ frame เพื่อจำกัดความกว้างได้:

```swift id="he3jg2"
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

ผลลัพธ์เป็นดังนี้:

![textfield](../../RESOURCE/014_textfield4.png)

### เพิ่มระยะด้านในและเส้นขอบ

เนื่องจากโดยปกติ TextField จะไม่มีเส้นขอบ เราจึงสามารถเพิ่มสไตล์ด้วยตนเองได้:

```swift id="x38dmi"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ตอนนี้ช่องกรอกนี้ก็จะดูเหมือน “ช่องกรอกมาตรฐาน” มากขึ้น

![textfield](../../RESOURCE/014_textfield5.png)

## เส้นขอบ

ใน SwiftUI นั้น border ใช้สำหรับเพิ่มเส้นขอบให้กับ view

การใช้งานพื้นฐาน:

```swift id="oj0v34"
border(Color.black, width: 1)
```

โดยที่ Color.black คือสีของเส้นขอบ และ width คือความหนาของเส้นขอบ

ใน TextField เราใช้:

```swift id="kcgd1d"
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

ซึ่งหมายถึงการเพิ่มเส้นขอบสีดำ ความหนา 1 pt ให้กับช่องกรอก

คุณยังสามารถลองเปลี่ยนเป็นสีอื่นได้ เช่น Color.blue, Color.green หรือเพิ่มความหนาเป็น width: 2

## ปุ่มออมเงิน

ตอนนี้เรามีตัวแปร amount สำหรับแสดงยอดรวม มี TextField สำหรับกรอกจำนวนเงิน และมีตัวแปร number ที่ bind กับช่องกรอก

โค้ดปัจจุบันเป็นดังนี้:

```swift id="6qjlwm"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### เพิ่มปุ่ม

ต่อไป เราจำเป็นต้องเพิ่มปุ่มเพื่อใช้กระตุ้นการออมเงิน

```swift id="jlwm2n"
Button("Save") {
    
}
```

### เขียนตรรกะการออมเงิน

สิ่งที่เราต้องการคือ เมื่อผู้ใช้กรอกจำนวนเงินแล้วกดปุ่ม เงินจำนวนนั้นจะถูกนำไปสะสมเพิ่มในยอดรวมโดยอัตโนมัติ

```swift id="zjlwm3"
Button("Save") {
    amount += number
}
```

ตรงนี้เราใช้ “ตัวดำเนินการกำหนดค่าแบบผสม” เพื่อนำจำนวนเงินที่ผู้ใช้กรอกไว้ใน number ไปบวกสะสมกับยอดรวมใน amount

### รีเซ็ตจำนวนเงินที่กรอก

ตอนนี้มีปัญหาอยู่ข้อหนึ่งคือ หลังจากกดปุ่มแล้ว จำนวนเงินในช่องกรอกจะไม่ถูกล้าง

ถ้าผู้ใช้กรอก 10 แล้วกดบันทึก ช่องกรอกก็ยังคงแสดง 10 อยู่ ซึ่งจะส่งผลต่อการกรอกเงินในครั้งถัดไป

สาเหตุเป็นเพราะ TextField bind อยู่กับ number และตอนที่เรากดปุ่ม เราแก้แค่ amount แต่ number ไม่ได้เปลี่ยนแปลง ดังนั้นช่องกรอกจึงยังคงแสดงค่าเดิม

เราจึงต้องเพิ่มตรรกะสำหรับล้างค่า โดยเมื่อกดปุ่มแล้ว ให้สะสมยอดเงินก่อน แล้วรีเซ็ตค่าที่กรอกกลับเป็น 0:

```swift id="ljlwm4"
Button("Save") {
    amount += number
	number = 0
}
```

ตอนนี้เมื่อผู้ใช้กรอกจำนวนเงินแล้วกดปุ่ม จำนวนเงินที่กรอกจะถูกบวกเข้าไปในยอดรวม และ number จะถูกรีเซ็ตกลับเป็น 0 เพื่อเตรียมสำหรับการกรอกครั้งถัดไป

เพียงเท่านี้ เราก็ได้ทำตรรกะการออมเงินทั้งหมดของ “กระปุกออมสิน” เสร็จเรียบร้อยแล้ว

## ปรับปรุงหน้าจอ

หลังจากฟังก์ชันทำงานครบแล้ว เราสามารถปรับแต่งหน้าจอเพิ่มเติมเล็กน้อย เช่น เพิ่มภาพพื้นหลัง และปรับสไตล์ของปุ่ม

เพิ่มสไตล์ให้ปุ่ม:

```swift id="0jlwm5"
.buttonStyle(.borderedProminent)
```

เพิ่มภาพพื้นหลัง:

```swift id="1jlwm6"
.background {
    Image("1")
}
```

ตอนนี้เราก็พัฒนา “กระปุกออมสิน” เสร็จสมบูรณ์แล้ว

## โค้ดฉบับสมบูรณ์

```swift id="2jlwm7"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

ผลลัพธ์ที่ได้:

![Piggy Bank](../../RESOURCE/014_view.png)

ตอนนี้เราสามารถลองออมเงิน 100 หรือมากกว่านั้น เพื่อตรวจสอบว่าตรรกะของ “กระปุกออมสิน” มีปัญหาหรือไม่

หรือจะนำ “กระปุกออมสิน” ไปรันบน Simulator หรืออุปกรณ์จริง เพื่อทดลองใช้งานแอปที่เราพัฒนาขึ้นก็ได้

### การพิมพ์เพื่อดีบัก

เพื่อยืนยันว่าตรรกะทำงานถูกต้องหรือไม่ เรายังสามารถเพิ่มโค้ดดีบักเข้าไปในปุ่ม เพื่อตรวจสอบว่าจำนวนเงินที่กรอกเข้ามาถูกต้องหรือไม่:

```swift id="3jlwm8"
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

ทุกครั้งที่ออมเงินแล้วกดปุ่ม เราจะเห็นผลลัพธ์ของการดีบักที่สอดคล้องกัน เพื่อใช้ตรวจสอบว่า logic ของโค้ดมีปัญหาหรือไม่

```id="4jlwm9"
---Saving---
amount:11
number:0
```
