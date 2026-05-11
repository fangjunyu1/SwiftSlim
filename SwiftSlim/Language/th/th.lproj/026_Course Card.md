# การ์ดบทเรียน

บทเรียนนี้เป็นบทเรียนทบทวนตามช่วง เราจะสร้าง “การ์ดบทเรียน” ให้เสร็จสมบูรณ์

ผ่านแบบฝึกหัดนี้ เราสามารถทบทวนเนื้อหาที่เรียนไปก่อนหน้านี้ เช่น `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` และเรียนรู้วิธีรวมมุมมองย่อยหลายส่วนให้กลายเป็นโมดูลมุมมองที่สมบูรณ์

ผลลัพธ์ของการ์ดบทเรียน:

![view](../../../Resource/026_view.png)

การ์ดบทเรียนนี้ประกอบด้วยส่วนหลัก ๆ ดังนี้:

- ระดับบทเรียน: `Beginner`
- เนื้อหาบทเรียน: `20+ Lessons`
- ชื่อบทเรียน: `SwiftUI Beginner Tutorial`
- คำอธิบายบทเรียน
- ปุ่ม: `Start Learning`
- พื้นหลังบทเรียน: ไอคอน Swift และพื้นหลังสีคราม

เราสามารถสร้างมุมมองนี้ใน `ContentView`

## พื้นที่ด้านบน

ก่อนอื่น สร้างพื้นที่ด้านบนของการ์ดบทเรียน

![view](../../../Resource/026_view1.png)

ด้านซ้ายของพื้นที่ด้านบนแสดงระดับบทเรียน ส่วนด้านขวาแสดงเนื้อหาบทเรียน

เพราะเนื้อหาทั้งสองส่วนนี้จัดเรียงในแนวนอน จึงสามารถใช้ `HStack` ได้

```swift
var topView: some View {
    HStack {
        Text("ผู้เริ่มต้น")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ บทเรียน")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ที่นี่เราแยกพื้นที่ด้านบนออกมาเป็นพร็อพเพอร์ตีคำนวณ:

```swift
var topView: some View
```

ข้อดีของการทำแบบนี้คือช่วยให้ `body` ชัดเจนขึ้น

พื้นที่ด้านบนใช้เนื้อหาต่อไปนี้เป็นหลัก:

- `HStack`: ทำให้ข้อความสองส่วนจัดเรียงในแนวนอน
- `Text`: แสดงเนื้อหาข้อความ
- `Spacer()`: ดันข้อความด้านซ้ายไปทางซ้าย และดันข้อความด้านขวาไปทางขวา
- `.font(.footnote)`: ตั้งค่าสไตล์ข้อความให้มีขนาดเล็กลง
- `.fontWeight(.bold)`: ทำให้ข้อความเป็นตัวหนา
- `.foregroundStyle(Color.white)`: ตั้งค่าสีด้านหน้าเป็นสีขาว
- `.padding(.vertical, 10)`: ตั้งค่าระยะขอบด้านในแนวตั้ง
- `.padding(.horizontal, 16)`: ตั้งค่าระยะขอบด้านในแนวนอน
- `.background(Color.white.opacity(0.15))`: ตั้งค่าพื้นหลังสีขาวแบบโปร่งแสง
- `.cornerRadius(20)`: ตั้งค่ามุมโค้ง

ที่นี่ `Beginner` ใช้ `.padding()` สองทิศทาง:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

วิธีนี้ทำให้ข้อความมีพื้นที่ทั้งด้านบนล่างและซ้ายขวา ดูเหมือนป้ายมากขึ้น

`Color.white.opacity(0.15)` หมายถึงสีขาวที่มีค่าความทึบ `15%` หรือก็คือสีขาวที่อ่อนมาก

### เพิ่มพื้นหลังการ์ด

ก่อนหน้านี้เราได้สร้าง `topView` แล้ว แต่การสร้างมุมมองเพียงอย่างเดียวจะยังไม่แสดงผลโดยอัตโนมัติ

ใน SwiftUI เนื้อหาที่ต้องแสดงจริงบนหน้าจอต้องเขียนไว้ใน `body`

ดังนั้น เราสามารถนำ `topView` ไปไว้ใน `body` ก่อนเพื่อแสดงผล:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

ตอนนี้จะเห็นว่าพื้นที่ด้านบนแสดงขึ้นมาแล้ว:

![view](../../../Resource/026_view2.png)

แต่เนื่องจากข้อความใน `topView` เป็นสีขาว และพื้นหลังเริ่มต้นก็เป็นสีอ่อนเช่นกัน จึงอาจมองเห็นไม่ชัดในโหมดสว่าง

ดังนั้น เราสามารถเพิ่ม `VStack` ไว้ด้านนอก จากนั้นตั้งค่าระยะขอบด้านใน สีพื้นหลัง และมุมโค้งให้กับพื้นที่ทั้งหมด:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view3.png)

ตอนนี้ `VStack` ตรงนี้มีเพียง `topView` อยู่ข้างใน จึงอาจดูเหมือนไม่จำเป็น

แต่หลังจากนี้เราจะเพิ่มชื่อบทเรียน คำอธิบายบทเรียน และพื้นที่ปุ่มต่อไป เนื้อหาเหล่านี้ล้วนเป็นเนื้อหาที่จัดเรียงจากบนลงล่าง ดังนั้นการใช้ `VStack` ไว้ล่วงหน้าจะช่วยให้รวมมุมมองต่อได้สะดวกขึ้น

ที่นี่มี `.padding()` สองตัว และมีหน้าที่ต่างกัน

`.padding(20)` ตัวแรกเขียนไว้ก่อน `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

มันควบคุมระยะขอบด้านในของการ์ด หรือก็คือระยะห่างระหว่างเนื้อหากับขอบของพื้นหลัง

`.padding(30)` ตัวที่สองเขียนไว้หลัง `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

มันควบคุมระยะขอบด้านนอกของการ์ด หรือก็คือระยะห่างระหว่างการ์ดทั้งใบกับขอบหน้าจอ

![view](../../../Resource/026_view4.png)

ดังนั้น แม้จะเป็น `.padding()` เหมือนกัน แต่เมื่อเขียนไว้ในตำแหน่งต่างกัน ผลลัพธ์ก็จะแตกต่างกัน

## พื้นที่เนื้อหา

ต่อไป สร้างพื้นที่เนื้อหาของการ์ดบทเรียน

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view5.png)

พื้นที่เนื้อหาประกอบด้วยชื่อบทเรียนและคำอธิบายบทเรียน ทั้งสองส่วนจัดเรียงจากบนลงล่าง ดังนั้นจึงใช้ `VStack`

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("บทเรียน SwiftUI สำหรับผู้เริ่มต้น")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("เริ่มจากศูนย์ด้วย SwiftUI และเรียนรู้การพัฒนา UI แบบประกาศของ Apple อย่างเป็นระบบ ผ่านคำอธิบายที่ชัดเจนและตัวอย่างที่ใช้งานได้จริง คุณจะค่อย ๆ เข้าใจเลย์เอาต์ การโต้ตอบ และการจัดการสถานะ เพื่อสร้างอินเทอร์เฟซแอปที่สวยงามและใช้งานได้")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view6.png)

ใน `VStack` นี้มีการใช้พารามิเตอร์สองตัว:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` หมายถึงให้มุมมองภายใน `VStack` จัดชิดขอบนำ

`spacing: 10` หมายถึงให้มุมมองภายใน `VStack` มีระยะห่างระหว่างกัน `10 pt`

ดังนั้น ชื่อบทเรียนและคำอธิบายบทเรียนจะเริ่มจัดเรียงจากด้านซ้าย และเว้นระยะห่างระหว่างกันพอสมควร

คำอธิบายบทเรียนค่อนข้างยาว หากแสดงทั้งหมด การ์ดจะสูงมาก ดังนั้นที่นี่จึงใช้ `.lineLimit()` เพื่อจำกัดจำนวนบรรทัดที่แสดง:

```swift
.lineLimit(3)
```

มันหมายถึงแสดงได้สูงสุด `3` บรรทัด เมื่อเนื้อหาเกินจำนวนบรรทัดที่กำหนด ส่วนที่เกินจะถูกย่อไว้

### จัดมุมมองชิดซ้าย

ที่นี่ยังมีอีกจุดหนึ่งที่ต้องสังเกต

`VStack(alignment: .leading)` ควบคุมได้เฉพาะการจัดแนวของมุมมองภายใน `VStack` เท่านั้น ไม่ได้ควบคุมตำแหน่งของตัว `VStack` เองในคอนเทนเนอร์ภายนอกโดยตรง

ตัวอย่างเช่น หากคำอธิบายบทเรียนค่อนข้างสั้น:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("บทเรียน SwiftUI สำหรับผู้เริ่มต้น")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("เนื้อหาตัวอย่างสั้น ๆ.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view7.png)

จะเห็นว่า แม้ชื่อบทเรียนและคำอธิบายบทเรียนจะจัดชิดซ้ายภายใน `VStack` แล้ว แต่ `VStack` ทั้งก้อนยังไม่ได้ชิดขอบซ้ายสุดของการ์ด

สาเหตุคือ เมื่อเนื้อหาสั้น ความกว้างของ `VStack` ก็จะค่อนข้างแคบด้วย เมื่อคอนเทนเนอร์ด้านนอกจัดเลย์เอาต์ อาจวาง `VStack` ที่แคบนี้ไว้ตรงกลาง

สามารถเข้าใจได้ว่า: `VStack(alignment: .leading)` รับผิดชอบการจัดชิดซ้ายภายใน
แต่ไม่ได้รับผิดชอบการดันพื้นที่เนื้อหาทั้งหมดไปชิดซ้ายสุด

หากต้องการให้พื้นที่เนื้อหาทั้งหมดชิดซ้ายจริง ๆ สามารถห่อด้านนอกด้วย `HStack` อีกชั้น แล้วเพิ่ม `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("บทเรียน SwiftUI สำหรับผู้เริ่มต้น")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("เนื้อหาตัวอย่างสั้น ๆ.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view8.png)

`HStack` ตรงนี้เป็นเลย์เอาต์แนวนอน

`Spacer()` จะใช้พื้นที่ว่างที่เหลือทางด้านขวา จึงดัน `VStack` ทางด้านซ้ายไปชิดซ้ายสุด

ดังนั้น `HStack + Spacer()` จึงสามารถใช้ควบคุมตำแหน่งของพื้นที่เนื้อหาทั้งหมดได้

ในการ์ดบทเรียนจริง คำอธิบายบทเรียนค่อนข้างยาว และมักจะใช้พื้นที่กว้างกว่า ดังนั้นปัญหานี้อาจไม่ชัดเจน แต่การเข้าใจความแตกต่างนี้สำคัญมาก เพราะเมื่อทำเลย์เอาต์ข้อความสั้นในภายหลัง มักจะเจอสถานการณ์คล้ายกัน

### ควบคุมระยะห่างระหว่างมุมมองภายใน

ก่อนหน้านี้เราเขียน `spacing: 10` ใน `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` ใช้ควบคุมระยะห่างระหว่างมุมมองภายใน

หากไม่ตั้งค่า `spacing` ตัว `VStack` ก็มีระยะห่างเริ่มต้นอยู่แล้ว แต่ระยะห่างเริ่มต้นอาจไม่ตรงกับผลลัพธ์ที่เราต้องการ

ที่นี่ หากชื่อบทเรียนและคำอธิบายบทเรียนอยู่ใกล้กันเกินไป เลย์เอาต์จะดูอึดอัด ดังนั้นจึงใช้:

```swift
spacing: 10
```

เพื่อให้ทั้งสองส่วนมีพื้นที่ว่างคั่นเล็กน้อย

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view9.png)

เช่นเดียวกัน พื้นที่ด้านบนและพื้นที่เนื้อหาก็จัดเรียงจากบนลงล่าง จึงสามารถใช้ `spacing` เพื่อควบคุมระยะห่างระหว่างกันได้เช่นกัน

ตอนนี้ ให้นำ `topView` และ `contentView` ใส่เข้าไปใน `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view10.png)

ที่นี่ `VStack(spacing: 20)` ควบคุมระยะห่างระหว่าง `topView` และ `contentView`

กล่าวอีกอย่างคือ:

```swift
VStack(alignment: .leading, spacing: 10)
```

ควบคุมระยะห่างระหว่างชื่อบทเรียนและคำอธิบายบทเรียน

```swift
VStack(spacing: 20)
```

ควบคุมระยะห่างระหว่างพื้นที่ด้านบนและพื้นที่เนื้อหา

ทั้งสองอย่างเป็น `spacing` เหมือนกัน แต่ทำงานกับ `VStack` คนละตัว ดังนั้นช่วงที่ได้รับผลกระทบจึงต่างกันด้วย

ด้วยวิธีนี้ มุมมองของพื้นที่เนื้อหาก็เสร็จสมบูรณ์

## พื้นที่ปุ่ม

ต่อไป สร้างพื้นที่ปุ่มด้านล่าง

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view11.png)

พื้นที่ปุ่มประกอบด้วยไอคอนเล่นและข้อความหนึ่งส่วนเป็นหลัก

เราสามารถใช้ `Image` เพื่อแสดงไอคอนเล่น และใช้ `Text` เพื่อแสดงข้อความบนปุ่ม

ตรงนี้ให้สร้างรูปลักษณ์ของปุ่มก่อน:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("คลิกปุ่ม")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("เริ่มเรียน")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view12.png)

ที่นี่ใช้ `HStack` สองตัว:

`HStack` ด้านในใช้จัดเรียงไอคอนและข้อความในแนวนอน:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("เริ่มเรียน")
}
```

`HStack` ด้านนอกเมื่อทำงานร่วมกับ `Spacer()` จะทำให้รูปลักษณ์ของปุ่มชิดซ้าย:

```swift
HStack {
    ...
    Spacer()
}
```

เมื่อแตะปุ่ม คอนโซลจะส่งออก `คลิกปุ่ม`

## การ์ดพื้นฐานเสร็จสมบูรณ์

ตอนนี้ ให้นำพื้นที่ด้านบน พื้นที่เนื้อหา และพื้นที่ปุ่มมารวมกัน:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/026_view13.png)

ถึงตรงนี้ การ์ดบทเรียนพื้นฐานก็เสร็จสมบูรณ์แล้ว

## พื้นหลังไอคอน Swift

สุดท้าย เราจะเพิ่มพื้นหลังไอคอน Swift แบบโปร่งแสงให้กับการ์ด

![view](../../../Resource/026_view.png)

ก่อนหน้านี้เราใช้ `Color.indigo` เป็นสีพื้นหลัง จริง ๆ แล้ว `.background()` นอกจากจะเพิ่มสีได้ ยังสามารถเพิ่มมุมมองที่สมบูรณ์ได้ด้วย

ดังนั้น เราสามารถสร้างมุมมองพื้นหลังเฉพาะขึ้นมาก่อน:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

ในมุมมองพื้นหลังนี้ เราใช้ `VStack`, `HStack` และ `Spacer()` เพื่อดันไอคอน Swift ไปที่มุมขวาล่าง

เพราะไอคอน Swift ใช้เป็นเพียงพื้นหลังตกแต่ง ดังนั้นที่นี่จึงใช้สีขาวแบบโปร่งแสง:

```swift
Color.white.opacity(0.15)
```

วิธีนี้ทำให้ไอคอนไม่เด่นเกินไป และไม่รบกวนเนื้อหาข้อความด้านหน้า

ต่อไป เพิ่ม `backgroundView` เข้าไปในการ์ด:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

ผลลัพธ์สุดท้าย:

![view](../../../Resource/026_view14.png)

ที่นี่ใช้ `.background()` สองตัวติดต่อกัน:

```swift
.background(backgroundView)
.background(Color.indigo)
```

`.background()` ตัวแรกใช้เพิ่มพื้นหลังไอคอน Swift
`.background()` ตัวที่สองใช้เพิ่มพื้นหลังสีคราม

ด้วยวิธีนี้ ไอคอน Swift จะแสดงอยู่บนพื้นหลังสีคราม และเป็นส่วนหนึ่งของพื้นหลังการ์ด

จากตรงนี้จะเห็นได้ว่า `.background()` นอกจากเพิ่มสีได้แล้ว ยังเพิ่มมุมมองที่กำหนดเองได้ด้วย การใช้ `.background()` หลายตัวร่วมกันยังช่วยสร้างเอฟเฟกต์พื้นหลังที่หลากหลายมากขึ้น

ถึงตรงนี้ การ์ดบทเรียนที่สมบูรณ์ก็เสร็จแล้ว

## สรุป

ในบทเรียนนี้ เราทบทวนวิธีจัดเลย์เอาต์พื้นฐานที่พบบ่อยใน SwiftUI ผ่านการ์ดบทเรียนหนึ่งใบ

เราใช้ `Text` เพื่อแสดงข้อความ ใช้ `Image` เพื่อแสดงไอคอนระบบ และใช้ `VStack`, `HStack` และ `Spacer()` เพื่อควบคุมการจัดเรียงมุมมอง

เราได้เรียนรู้ `.lineLimit()` ซึ่งสามารถจำกัดจำนวนบรรทัดสูงสุดที่ข้อความจะแสดงได้ เมื่อเนื้อหาเกินขีดจำกัด ส่วนที่เกินจะถูกย่อไว้

ขณะเดียวกัน เรายังทบทวนตัวปรับแต่งที่ใช้บ่อย เช่น `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` เป็นต้น

หลังจากทำบทเรียนนี้เสร็จ เราก็สามารถรวมมุมมองย่อยหลายส่วนให้กลายเป็นโมดูลการ์ดที่สมบูรณ์ได้แล้ว

นี่ก็เป็นแนวคิดที่พบบ่อยมากในการพัฒนา SwiftUI: แยกมุมมองออกเป็นส่วนเล็ก ๆ ก่อน แล้วค่อยรวมเป็นอินเทอร์เฟซที่สมบูรณ์

## โค้ดฉบับสมบูรณ์

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("ผู้เริ่มต้น")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ บทเรียน")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("บทเรียน SwiftUI สำหรับผู้เริ่มต้น")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("เริ่มจากศูนย์ด้วย SwiftUI และเรียนรู้การพัฒนา UI แบบประกาศของ Apple อย่างเป็นระบบ ผ่านคำอธิบายที่ชัดเจนและตัวอย่างที่ใช้งานได้จริง คุณจะค่อย ๆ เข้าใจเลย์เอาต์ การโต้ตอบ และการจัดการสถานะ เพื่อสร้างอินเทอร์เฟซแอปที่สวยงามและใช้งานได้")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("คลิกปุ่ม")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("เริ่มเรียน")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
