# แกลเลอรีภาพถ่าย

ในบทเรียนนี้ เราจะสร้างหน้าแกลเลอรีภาพถ่าย

![view](../../../Resource/032_view13.png)

ในตัวอย่างนี้ เราจะทบทวนความรู้เกี่ยวกับ `extension`、`self` และอินสแตนซ์ พร้อมเรียนรู้รูปทรง `Shape` ที่ใช้บ่อยใน SwiftUI

ด้วยความรู้เหล่านี้ เราสามารถตัดภาพธรรมดาให้กลายเป็นรูปแบบต่าง ๆ เช่น วงกลม สี่เหลี่ยมมุมมน แคปซูล และวงรี พร้อมเพิ่มเอฟเฟกต์เส้นขอบให้รูปภาพได้

บทเรียนนี้จะใช้ความรู้ใหม่หลายอย่าง ได้แก่ `Shape`、`clipShape`、`strokeBorder` และ `overlay`

โดย `clipShape` ใช้สำหรับตัดรูปร่างของวิว, `strokeBorder` ใช้สำหรับวาดเส้นขอบของรูปทรง และ `overlay` ใช้สำหรับซ้อนวิวใหม่ไว้ด้านบนของวิวเดิม

## ไฟล์รูปภาพ

ก่อนเริ่มต้น เราต้องเตรียมรูปภาพหลายรูป

คุณสามารถใช้รูปภาพของตัวเอง หรือใช้รูปภาพตัวอย่างที่บทเรียนนี้เตรียมไว้ก็ได้

รูปภาพตัวอย่างในบทเรียนนี้มาจากเว็บไซต์ [Pixabay](https://pixabay.com/):

[ทิวทัศน์](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[สุนัขจิ้งจอก](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[อาคาร](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[ดอกไม้](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[หงส์](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

หลังจากดาวน์โหลดรูปภาพแล้ว ให้เพิ่มรูปภาพเหล่านี้ลงในโฟลเดอร์ทรัพยากร `Assets` และตั้งชื่อตามลำดับเป็น `1`、`2`、`3`、`4`、`5`

![assets](../../../Resource/032_view17.png)

ด้วยวิธีนี้ เราก็สามารถแสดงรูปภาพใน SwiftUI ผ่านรูปแบบ `Image("1")`、`Image("2")` ได้

## แสดงรูปภาพ

ก่อนอื่น เราจะแสดงรูปภาพ 5 รูปใน `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/032_view.png)

ในโค้ดส่วนนี้ เราใช้ `ScrollView` เพื่อให้รายการรูปภาพเลื่อนได้ และใช้ `VStack` เพื่อจัดเรียงรูปภาพหลายรูปจากบนลงล่าง

รูปภาพแต่ละรูปใช้ `.resizable()`、`.scaledToFit()` และ `.frame(width: 300)` เพื่อกำหนดเอฟเฟกต์การแสดงผล ทำให้รูปภาพย่อขยายได้ รักษาสัดส่วนให้แสดงครบถ้วน และจำกัดความกว้างของรูปภาพ

`.padding(.vertical, 100)` บน `VStack` ใช้สำหรับเพิ่มระยะห่างด้านบนและด้านล่าง เพื่อหลีกเลี่ยงไม่ให้รูปภาพแรกและรูปภาพสุดท้ายชิดขอบหน้าจอมากเกินไป

`.ignoresSafeArea()` สุดท้าย หมายถึงให้มุมมองแบบเลื่อนละเว้นพื้นที่ปลอดภัย ทำให้เมื่อเลื่อนรูปภาพ รูปภาพสามารถขยายไปถึงด้านบนและด้านล่างของหน้าจอได้ และทำให้หน้าดูสมบูรณ์ขึ้น

อย่างไรก็ตาม ตอนนี้รูปภาพทั้ง 5 รูปใช้ modifier ชุดเดียวกันทั้งหมด:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

เมื่อเราเห็นโค้ดซ้ำ ๆ ก็สามารถพิจารณาใช้ `extension` เพื่อจัดระเบียบได้

## ใช้ extension จัดระเบียบสไตล์รูปภาพ

เราสามารถขยาย `Image` ด้วยเมธอดเฉพาะสำหรับแกลเลอรีภาพถ่ายได้:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ตรงนี้ เราได้ขยายประเภท `Image` ด้วยเมธอด `photoGalleryStyle`

ภายในเมธอดนี้มี `.resizable()`、`.scaledToFit()` และ `.frame(width: 300)` ที่เราใช้ซ้ำก่อนหน้านี้ กล่าวคือ มันรวมโค้ดสำหรับการย่อขยายรูปภาพ การแสดงตามสัดส่วน และการตั้งค่าความกว้างไว้ด้วยกัน

หลังจากใช้ extension นี้ โค้ดรูปภาพเดิม:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

ก็สามารถย่อให้สั้นลงเป็น:

```swift
Image("1")
    .photoGalleryStyle()
```

ด้วยวิธีนี้ รูปภาพแต่ละรูปเพียงเรียก `.photoGalleryStyle()` ก็สามารถใช้สไตล์แกลเลอรีภาพถ่ายเดียวกันได้ โค้ดจะกระชับขึ้น และสะดวกต่อการแก้ไขรวมในภายหลัง

## ทำความเข้าใจ self

ในเมธอด extension เราเขียน `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

`self` ในที่นี้ หมายถึงอินสแตนซ์รูปภาพปัจจุบันที่เรียกใช้เมธอดนี้

ตัวอย่างเช่น:

```swift
Image("1")
    .photoGalleryStyle()
```

ในโค้ดส่วนนี้ `photoGalleryStyle()` ถูกเรียกโดย `Image("1")` ดังนั้น `self` ภายในเมธอดจึงหมายถึงรูปภาพ `Image("1")` นี้

สามารถเข้าใจง่าย ๆ ว่า ใครเป็นผู้เรียกเมธอดนี้ `self` ก็หมายถึงคนนั้นหรือสิ่งนั้น

สิ่งที่ต้องสังเกตคือ modifier ของ SwiftUI จะคืนผลลัพธ์เป็นวิวใหม่อย่างต่อเนื่อง ดังนั้น `photoGalleryStyle()` จึงคืนค่าวิวที่ถูกปรับแต่งแล้ว ไม่ใช่คืนค่า `Image` ต้นฉบับแบบตรง ๆ

## รูปร่างของรูปภาพ

ตอนนี้ รูปภาพสามารถแสดงได้ตามปกติแล้ว แต่รูปภาพเหล่านี้เป็นสี่เหลี่ยมผืนผ้าโดยค่าเริ่มต้น จึงดูค่อนข้างธรรมดา

ถ้าต้องการให้รูปภาพมีมุมมนเท่านั้น สามารถใช้ `.cornerRadius()` ได้โดยตรง:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

ผลลัพธ์ที่แสดง:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` หมายถึงการเพิ่มมุมมนขนาด `20 pt` ให้กับรูปภาพ สำหรับรูปภาพมุมมนทั่วไป วิธีเขียนแบบนี้ก็เพียงพอแล้ว

อย่างไรก็ตาม `.cornerRadius()` จัดการได้เฉพาะเอฟเฟกต์มุมมน เหมาะสำหรับทำรูปภาพมุมมนธรรมดา หากเราต้องการให้รูปภาพกลายเป็นรูปทรงอื่น ๆ มากขึ้น modifier นี้อย่างเดียวก็ไม่พอ

ในกรณีนี้ เราจำเป็นต้องใช้ `Shape` ใน SwiftUI `Shape` สามารถแทนรูปทรงต่าง ๆ และเมื่อใช้ร่วมกับ `clipShape` ก็จะสามารถตัดรูปภาพให้เป็นรูปทรงนั้น ๆ ได้

## ทำความรู้จัก Shape

ใน SwiftUI `Shape` หมายถึงรูปทรง มันเป็นประเภทที่ใช้บ่อยมากใน SwiftUI เช่นเดียวกับ `View`

`Shape` ที่พบบ่อยมีวงกลม สี่เหลี่ยม สี่เหลี่ยมมุมมน แคปซูล และวงรี เพื่อให้สังเกตรูปลักษณ์ของรูปทรงต่าง ๆ ได้ชัดเจนขึ้น ตัวอย่างด้านล่างจะตั้งค่าสีและขนาดที่แตกต่างกันให้แต่ละรูปทรง

ในตัวอย่างเหล่านี้ `.fill()` ใช้สำหรับเติมสีให้รูปทรง และ `.frame()` ใช้สำหรับกำหนดขนาดการแสดงผลของรูปทรง สีมีไว้เพื่อแยกรูปทรงต่าง ๆ เท่านั้น ไม่ใช่สีคงที่ของรูปทรงเอง

### Circle วงกลม

`Circle` หมายถึงวงกลม มักใช้กับเอฟเฟกต์อินเทอร์เฟซ เช่น รูปโปรไฟล์ ปุ่มวงกลม และรูปภาพวงกลม

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle สี่เหลี่ยมผืนผ้า

`Rectangle` หมายถึงสี่เหลี่ยมผืนผ้า เป็นหนึ่งในรูปทรงพื้นฐานที่สุด และยังใช้ทำพื้นหลัง พื้นที่แบ่งส่วน หรือเส้นขอบทั่วไปได้ด้วย

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle สี่เหลี่ยมมุมมน

`RoundedRectangle` หมายถึงสี่เหลี่ยมมุมมน `cornerRadius` ใช้สำหรับกำหนดขนาดมุมมน

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule รูปแคปซูล

`Capsule` หมายถึงรูปแคปซูล ปลายทั้งสองด้านเป็นส่วนโค้ง มักใช้กับเอฟเฟกต์อินเทอร์เฟซ เช่น ปุ่มแคปซูล และพื้นหลังของแท็ก

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse วงรี

`Ellipse` หมายถึงวงรี คล้ายกับ `Circle` แต่เมื่อความกว้างและความสูงไม่เท่ากัน จะแสดงเป็นวงรี

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

จากตัวอย่างเหล่านี้จะเห็นได้ว่า `Shape` เองสามารถแสดงเป็นรูปทรงได้โดยตรง ต่อไป เราจะใช้ `Shape` เหล่านี้ร่วมกับ `clipShape` เพื่อตัดรูปภาพให้แสดงเป็นรูปทรงต่าง ๆ

## ใช้ clipShape ตัดรูปภาพ

ตอนนี้ เราสามารถใช้ `clipShape` เพื่อตัดรูปภาพให้เป็นรูปทรงต่าง ๆ ได้แล้ว

ตัวอย่างเช่น ตัดรูปภาพแรกให้เป็นวงกลม:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

โค้ดส่วนนี้หมายถึง แสดงรูปภาพหนึ่งรูปก่อน จากนั้นใช้ `Circle()` ตัดให้เป็นวงกลม

![view](../../../Resource/032_view2.png)

รูปแบบพื้นฐานของ `clipShape` คือ:

```swift
.clipShape(รูปทรง)
```

เพิ่ม `.clipShape(...)` ไว้หลังวิว แล้วใส่รูปทรงที่ต้องการตัดไว้ในวงเล็บ

ตัวอย่างเช่น:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

ตอนนี้ เราจะตัดรูปภาพทั้ง 5 รูปให้เป็นรูปทรงที่แตกต่างกัน:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/032_view8.png)

ในนั้น ผลลัพธ์หลังจากใช้ `Rectangle()` ตัดจะใกล้เคียงกับรูปภาพสี่เหลี่ยมธรรมดา ดังนั้นการเปลี่ยนแปลงทางสายตาจึงไม่ชัดเจน จุดประสงค์หลักคือใช้เปรียบเทียบกับรูปทรงอื่น

ตอนนี้ รูปภาพไม่ได้เป็นเพียงสี่เหลี่ยมธรรมดาอีกต่อไป แต่มีรูปทรงที่แตกต่างกันแล้ว

## เพิ่มเส้นขอบรูปภาพ

หากเราต้องการเพิ่มเส้นขอบให้รูปภาพวงกลม เราอาจนึกถึงการใช้ `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

แต่ผลลัพธ์ที่ได้โดยทั่วไปไม่ใช่เส้นขอบวงกลม แต่เป็นเส้นขอบสี่เหลี่ยม

![view](../../../Resource/032_view9.png)

นี่เป็นเพราะ `border` เพิ่มเส้นขอบตามพื้นที่สี่เหลี่ยมของวิว ไม่ใช่ตามรูปทรงที่ถูกตัดหลังจากใช้ `clipShape`

ดังนั้น หากเราต้องการเส้นขอบวงกลม ก็ไม่สามารถใช้ `border` โดยตรงได้

## ใช้ strokeBorder วาดเส้นขอบของรูปทรง

ใน SwiftUI `strokeBorder` สามารถวาดเส้นขอบด้านในให้กับ `Shape` ที่พบบ่อยเหล่านี้ได้

ตัวอย่างเช่น วาดเส้นขอบวงกลม:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

โค้ดส่วนนี้หมายถึง วาดเส้นขอบสีน้ำตาลให้กับ `Circle` โดยความกว้างของเส้นขอบคือ `10 pt`

![view](../../../Resource/032_view12.png)

ตรงนี้ต้องสังเกตว่า `strokeBorder` ไม่ได้เพิ่มเส้นขอบให้รูปภาพโดยตรง แต่เป็นการวาดเส้นขอบให้รูปทรง `Circle()` นี้

กล่าวคือ โค้ดส่วนนี้ได้เพียงเส้นขอบวงกลมอิสระหนึ่งอัน ซึ่งยังไม่เกี่ยวข้องกับรูปภาพ

หากต้องการให้เส้นขอบวงกลมนี้แสดงอยู่ด้านบนของรูปภาพ ก็ต้องใช้ `overlay` ต่อไป เพื่อซ้อนเส้นขอบลงบนรูปภาพ

## ใช้ overlay ซ้อนเส้นขอบ

`overlay` เป็น modifier ของวิว ใช้สำหรับซ้อนวิวใหม่ไว้ด้านบนของวิวปัจจุบัน

โครงสร้างพื้นฐานสามารถเข้าใจได้ว่า:

```swift
วิวปัจจุบัน
    .overlay {
        วิวที่ซ้อนทับ
    }
```

ในตัวอย่างนี้ วิวปัจจุบันคือรูปภาพที่ถูกตัดเป็นวงกลมแล้ว:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

วิวใหม่ที่เราต้องการซ้อนขึ้นไป คือเส้นขอบวงกลม:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

ดังนั้น เราสามารถรวมรูปภาพและเส้นขอบเข้าด้วยกันได้:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

`overlay` ตรงนี้หมายถึงการซ้อนวิวใหม่ไว้ด้านบนของวิวปัจจุบัน

ใน `overlay` เส้นขอบจะซ้อนตามขอบเขตการแสดงผลของรูปภาพปัจจุบัน จึงไม่จำเป็นต้องตั้งค่า `frame` แยกต่างหากอีก เพียงให้รูปทรงของเส้นขอบตรงกับรูปทรงที่ใช้ตัด เส้นขอบก็จะแนบพอดีกับรูปภาพ

![view](../../../Resource/032_view10.png)

ผลลัพธ์สุดท้ายคือ ด้านบนของรูปภาพวงกลมมีเส้นขอบวงกลมซ้อนอยู่

เมื่อเทียบกับ `ZStack` แล้ว `overlay` เหมาะกับสถานการณ์แบบ “เพิ่มของตกแต่งให้วิวปัจจุบัน” มากกว่า รูปภาพคือส่วนหลัก ส่วนเส้นขอบเป็นเพียงเอฟเฟกต์เพิ่มเติม ดังนั้นการใช้ `overlay` จะชัดเจนกว่า

## ทำแกลเลอรีภาพถ่ายให้เสร็จ

ตอนนี้ เราจะเพิ่มรูปทรงและเส้นขอบที่สอดคล้องกันให้รูปภาพแต่ละรูป:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

ผลลัพธ์ที่แสดง:

![view](../../../Resource/032_view13.png)

ด้วยวิธีนี้ หน้าแกลเลอรีภาพถ่ายพื้นฐานก็เสร็จสมบูรณ์แล้ว

ในหน้านี้ เราใช้ `ScrollView` เพื่อแสดงผลแบบเลื่อน ใช้ `Image` เพื่อแสดงรูปภาพ ใช้ `clipShape` เพื่อตัดรูปร่างของรูปภาพ และใช้ `overlay` กับ `strokeBorder` เพื่อเพิ่มเส้นขอบ

## โค้ดฉบับสมบูรณ์

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## สรุป

ในบทเรียนนี้ เราสร้างหน้าแกลเลอรีภาพถ่ายเสร็จแล้ว

![view](../../../Resource/032_view13.png)

ในตัวอย่างนี้ เราเริ่มจากใช้ `Image` เพื่อแสดงรูปภาพ จากนั้นใช้ `extension` เพื่อขยาย `Image` ด้วยเมธอด `photoGalleryStyle` สำหรับจัดระเบียบโค้ดสไตล์รูปภาพที่ซ้ำกัน

ต่อมา เราเรียนรู้ `Shape` ที่พบบ่อยใน SwiftUI เช่น `Circle`、`Rectangle`、`RoundedRectangle`、`Capsule` และ `Ellipse` รูปทรงเหล่านี้ไม่เพียงสามารถแสดงได้โดยตรง แต่ยังสามารถใช้ร่วมกับ `clipShape` เพื่อตัดวิวได้ด้วย

ตัวอย่างเช่น:

```swift
.clipShape(Circle())
```

หมายถึงการตัดวิวให้เป็นวงกลม

สุดท้าย เราใช้ `overlay` และ `strokeBorder` เพื่อเพิ่มเส้นขอบตามรูปทรงให้รูปภาพ สิ่งที่ต้องสังเกตคือ `border` โดยทั่วไปจะวาดเส้นขอบตามพื้นที่สี่เหลี่ยมของวิว หากต้องการให้เส้นขอบตามรูปวงกลม แคปซูล หรือวงรี การซ้อนด้วย `Shape` เดียวกันจะเหมาะกว่า

ผ่านบทเรียนนี้ เราไม่เพียงทำเอฟเฟกต์แกลเลอรีภาพถ่ายเสร็จ แต่ยังเข้าใจรูปแบบการใช้งานร่วมกันของ `Shape`、`clipShape`、`strokeBorder` และ `overlay` ที่พบบ่อยในอินเทอร์เฟซด้วย

## แบบฝึกหัดหลังเรียน

### 1、เพิ่มพื้นหลังให้แกลเลอรีภาพถ่าย

เพิ่มรูปภาพพื้นหลังแบบเต็มหน้าจอให้หน้าแกลเลอรีภาพถ่าย

ข้อกำหนด: รูปภาพพื้นหลังสามารถปูเต็มทั้งหน้าจอ และละเว้นพื้นที่ปลอดภัยได้

### 2、เส้นขอบแบบไล่ระดับสี

แก้ไขเส้นขอบสีเดียวที่มีอยู่ให้เป็นเส้นขอบแบบไล่ระดับเชิงเส้น

สามารถลองใช้ `LinearGradient` เพื่อสร้างเอฟเฟกต์เส้นขอบที่หลากหลายมากขึ้น

### 3、เส้นขอบรูปภาพแบบสมจริง

ค้นหารูปแบบกรอบรูปจริงจากอินเทอร์เน็ต แล้วลองใช้ `overlay` เพื่อซ้อนรูปภาพกรอบ ทำให้รูปภาพดูใกล้เคียงกับกรอบรูปจริงมากขึ้น

ผลลัพธ์ตัวอย่างของแบบฝึกหัด:

![button](../../../Resource/032_view15.jpeg)

### 4、สร้างเส้นขอบปุ่มมุมมน

ในการพัฒนาจริง ปุ่มมักใช้เส้นขอบสี่เหลี่ยมมุมมน

โปรดลองสร้างปุ่มมุมมนหนึ่งปุ่ม และใช้ `RoundedRectangle` กับ `strokeBorder` เพื่อเพิ่มเส้นขอบมุมมนให้ปุ่ม

ผลลัพธ์ตัวอย่างของแบบฝึกหัด:

![button](../../../Resource/032_view14.png)

### คำถามชวนคิด

หากไม่ต้องการใช้เส้นขอบสีเดียว และไม่ต้องการใช้เส้นขอบไล่ระดับสี แต่ต้องการให้เส้นขอบแสดงเป็นลวดลายบางอย่าง ควรทำอย่างไร

สามารถลองค้นหาข้อมูล เพื่อทำความเข้าใจการใช้งานที่เกี่ยวข้อง เช่น `overlay`、`mask` หรือ `ImagePaint`

ผลลัพธ์ตัวอย่างของแบบฝึกหัด:

![button](../../../Resource/032_view16.png)
