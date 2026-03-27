# เลย์เอาต์ รูปภาพ และข้อความ

ในบทเรียนก่อนหน้า เราได้เรียนรู้โค้ดของ ContentView ดังนี้:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
````

ในบทนี้ เราจะเรียนรู้กลไกการจัดวางเริ่มต้นของ SwiftUI รวมถึงวิธีใช้งานรูปภาพและข้อความ บนพื้นฐานของบทก่อนหน้า เราจะทำความเข้าใจโครงสร้างและวิธีการแสดงผลของมุมมองให้ลึกขึ้น ซึ่งความรู้เหล่านี้จะช่วยให้เราสามารถสร้างเลย์เอาต์พื้นฐานของหน้าจอได้

## กลไกการจัดวางเริ่มต้นของ SwiftUI

เมื่อพรีวิวมุมมอง ContentView เราจะพบว่าไอคอนและข้อความถูกแสดงไว้กึ่งกลาง แทนที่จะเรียงจากด้านบนลงมา

![Swift](../../RESOURCE/003_view.png)

โดยค่าเริ่มต้น วิธีการจัดแนวของ Stack container คือ .center ดังนั้นมุมมองลูกจึงมักแสดงผลในลักษณะกึ่งกลาง

### Alignment การจัดแนว

เห็นได้ชัดว่าการจัดกึ่งกลางเป็นเพียงรูปแบบหนึ่งของการจัดแนวเท่านั้น ถ้าเราต้องการจัดชิดซ้ายหรือชิดขวา ก็จำเป็นต้องใช้ alignment เพื่อควบคุมการจัดแนวของมุมมอง

```swift
alignment
```

ใน SwiftUI การจัดแนวมักปรากฏใน 2 สถานการณ์หลัก:

**1. พารามิเตอร์การจัดแนวของ Stack container**

ตัวอย่างเช่น ทำให้ไอคอนและข้อความใน ContentView จัดชิดซ้าย:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment ของ VStack ใช้ควบคุมการจัดแนวในทิศทางแนวนอน

รูปแบบการจัดแนวมีดังนี้:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack เป็นการเรียงในแนวนอน และ alignment จะใช้ควบคุมการจัดแนวในทิศทางแนวตั้ง:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack เป็นการเรียงซ้อนทับกัน และ alignment สามารถใช้ควบคุมได้ทั้งแนวนอนและแนวตั้ง:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

หากไม่ได้ระบุ alignment อย่างชัดเจน VStack, HStack และ ZStack จะใช้ค่าเริ่มต้นเป็น .center

**2. alignment ภายใน frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

เมื่อ frame มีขนาดใหญ่กว่าขนาดจริงของมุมมอง alignment จะเป็นตัวกำหนดตำแหน่งของมุมมองภายใน frame การใช้งาน frame แบบละเอียดจะอธิบายในภายหลัง ตอนนี้เพียงทำความรู้จักเบื้องต้นก่อน

### Spacer และกลไกการกระจายพื้นที่

alignment สามารถทำให้มุมมองเรียงตามแนวนอนหรือแนวตั้งได้ แต่เมื่อเราต้องการให้ข้อความและรูปภาพแสดงอยู่คนละด้าน การจัดแนวเพียงอย่างเดียวจะไม่เพียงพอ

ตัวอย่างเช่น ถ้าเราต้องการสร้างมุมมองส่วนบนของเว็บไซต์ [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) โดยด้านซ้ายเป็นโลโก้เว็บไซต์ NHK และด้านขวาเป็นไอคอนเมนูของเว็บไซต์

![Swift](../../RESOURCE/003_alignment3.png)

ถ้าเราใช้เพียง alignment ไอคอนเว็บไซต์ NHK และไอคอนเมนูจะยังคงไปอยู่ด้านเดียวกัน ไม่สามารถกระจายไปอยู่ซ้ายและขวาได้ ดังนั้นจึงต้องใช้ Spacer เพื่อแบ่งพื้นที่ที่เหลือ

Spacer คือมุมมองยืดหยุ่นที่ใช้สำหรับการจัดวาง ซึ่งสามารถเติมพื้นที่ที่เหลือได้โดยอัตโนมัติ

วิธีใช้:

```swift
Spacer()
```

ตัวอย่างเช่น:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

เมื่อเราเพิ่ม Spacer ไว้ระหว่าง Image และ Text แล้ว Spacer จะเติมพื้นที่ที่เหลือ ทำให้ Image และ Text ถูกดันไปอยู่คนละด้านบนและล่าง

![Swift](../../RESOURCE/003_view1.png)

ถ้ามี Spacer หลายตัว:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

พื้นที่ที่เหลือจะถูกแบ่งให้ Spacer อย่างเท่า ๆ กัน

![Swift](../../RESOURCE/003_spacer.png)

## การแสดงผลของ Image และการควบคุมขนาด

มุมมอง Image ใช้สำหรับแสดงรูปภาพเป็นหลัก ส่วนไอคอน SF Symbols ที่เราเรียนในบทก่อนหน้า ก็เป็นเพียงหนึ่งในรูปแบบการใช้งานของ Image เท่านั้น

วิธีใช้:

```swift
Image("imageName")
```

ข้อความในเครื่องหมายอัญประกาศคู่ของ Image คือชื่อรูปภาพ โดยไม่จำเป็นต้องใส่นามสกุลไฟล์

### การแสดงรูปภาพ

ก่อนอื่น เราเตรียมรูปภาพหนึ่งรูป

![Swift](../../RESOURCE/003_img.jpg)

ใน Xcode ให้เลือกโฟลเดอร์ทรัพยากร Assets แล้วลากรูปภาพเข้าไปใน Assets

![Swift](../../RESOURCE/003_img1.png)

ใน ContentView ใช้ Image เพื่อแสดงรูปภาพ:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ข้อควรระวัง: Image ของ SwiftUI ไม่รองรับการเล่นภาพเคลื่อนไหว GIF (จะแสดงได้เพียงเฟรมภาพนิ่งเท่านั้น)

### การควบคุมขนาดของรูปภาพ

ใน SwiftUI โดยค่าเริ่มต้น Image จะแสดงตามขนาดจริงของรูปภาพ หากต้องการปรับขนาดการแสดงผลของรูปภาพ จำเป็นต้องใช้ resizable เพื่อให้รูปภาพสามารถย่อขยายได้ก่อน แล้วจึงใช้ frame เพื่อกำหนดขนาดของเลย์เอาต์

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### ตัวปรับแต่ง resizable

modifier อย่าง resizable ทำให้รูปภาพสามารถมีส่วนร่วมในการย่อขยายภายในเลย์เอาต์ได้ แทนที่จะใช้ขนาดต้นฉบับแบบคงที่

```swift
.resizable()
```

เมื่อเพิ่ม resizable() แล้ว frame จึงจะสามารถเปลี่ยนขนาดการแสดงผลของรูปภาพได้จริง

ถ้าละ resizable ออก:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame จะเพียงแค่จัดสรรพื้นที่เลย์เอาต์ให้รูปภาพ แต่ขนาดของรูปภาพเองจะไม่เปลี่ยน

### ตัวปรับแต่ง frame

frame(width:height) ใช้สำหรับกำหนดความกว้างและความสูงของมุมมอง

วิธีใช้พื้นฐาน:

```swift
.frame(width: 10,height: 10)
```

ตัวอย่างเช่น ตั้งค่ารูปภาพให้มีความกว้าง 300 และความสูง 100 เป็นรูปสี่เหลี่ยมผืนผ้า

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

นอกจากนี้ยังสามารถกำหนดเฉพาะความกว้างหรือความสูงแยกกันได้:

```swift
.frame(width: 200)
.frame(height: 100)
```

การใช้ resizable + frame ร่วมกันช่วยให้เราควบคุมขนาดการแสดงผลของรูปภาพบนหน้าจอได้อย่างยืดหยุ่น พร้อมคงความสามารถในการย่อขยายไว้

### สัดส่วนการย่อขยาย: scaledToFit และ scaledToFill

เมื่อเราใช้ frame กำหนดความกว้างและความสูงที่มีอัตราส่วนไม่ตรงกับรูปภาพ รูปภาพอาจถูกยืดจนผิดสัดส่วน

ถ้าเราต้องการให้รูปภาพยังคงสัดส่วนเดิมไว้ พร้อมทั้งใช้งานพื้นที่เลย์เอาต์ที่มีอยู่ได้เหมาะสม เราสามารถใช้ scaledToFit หรือ scaledToFill ได้

**scaledToFit**

scaledToFit จะรักษาสัดส่วนความกว้างและความสูงเดิมของรูปภาพ โดยย่อหรือขยายให้พอดีกับพื้นที่ที่มีอยู่ทั้งหมด และจะไม่ตัดรูปภาพ:

```swift
.scaledToFit()
```

หรือ

```swift
.aspectRatio(contentMode: .fit)
```

วิธีนี้เหมาะกับกรณีที่ต้องการแสดงรูปภาพให้ครบถ้วนและไม่ต้องการให้รูปภาพผิดสัดส่วน

หากตั้งค่าความกว้างและความสูงเท่ากันให้กับรูปภาพทุกภาพ ย่อมหลีกเลี่ยงไม่ได้ที่จะเกิดกรณีรูปภาพถูกยืด

ตัวอย่างเช่น:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

เมื่อยังไม่ได้ตั้งค่าสัดส่วนการย่อขยาย รูปภาพจะไม่สามารถแสดงด้วยสัดส่วนเดิมได้

![Swift](../../RESOURCE/003_img4.png)

การตั้งค่า scaledToFit จะช่วยให้รูปภาพรักษาสัดส่วนเดิมไว้

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill ก็สามารถรักษาสัดส่วนของรูปภาพไว้ได้เช่นกัน แต่จะเติมเต็มพื้นที่ทั้งหมด หากสัดส่วนไม่ตรงกัน ส่วนที่เกินออกมาจะถูกตัดออก:

```swift
.scaledToFill()
```

หรือ

```swift
.aspectRatio(contentMode: .fill)
```

วิธีนี้เหมาะกับกรณีที่ต้องการให้รูปภาพครอบคลุมพื้นที่ทั้งหมด เช่น ใช้เป็นภาพพื้นหลังหรือแบนเนอร์ เหมาะกับสถานการณ์ที่รูปภาพถูกใช้เป็นพื้นหลัง

**ความแตกต่างของทั้งสองแบบ**

![Swift](../../RESOURCE/003_img6.png)

## ข้อความ

ใน SwiftUI, Text ใช้สำหรับแสดงข้อความ

วิธีใช้พื้นฐาน:

```swift
Text("FangJunyu")
```

เราได้เรียนรู้ Text ไปแล้วในบทก่อนหน้า และในบทนี้เราจะเรียนต่อว่าควบคุมขนาดตัวอักษรและความหนาอย่างไร เพื่อให้ข้อความมีพลังในการสื่อสารมากขึ้นภายในมุมมอง

### ขนาดตัวอักษร

สามารถใช้ modifier อย่าง font เพื่อควบคุมขนาดของตัวอักษรได้:

```swift
.font(.title)
```

ตัวอย่างเช่น:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

ขนาดตัวอักษรที่ใช้บ่อย (จากใหญ่ไปเล็ก):

```swift
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### ความหนาของตัวอักษร

หากต้องการทำให้ข้อความหนาขึ้น สามารถใช้ modifier อย่าง fontWeight ได้:

```swift
.fontWeight(.bold)
```

ตัวอย่างเช่น:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

ระดับความหนาของตัวอักษรที่ใช้บ่อย (จากบางไปหนา):

```swift
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font ใช้ควบคุมขนาดตัวอักษร ส่วน fontWeight ใช้ควบคุมความหนา ทั้งสองอย่างสามารถใช้ร่วมกันได้ เพื่อเพิ่มความหลากหลายในการแสดงผลของข้อความ

## สรุปและการฝึกปฏิบัติ

จนถึงตอนนี้ เราได้เรียนรู้เนื้อหาพื้นฐานของ SwiftUI แล้ว เช่น เลย์เอาต์เริ่มต้น, Spacer, Image และ Text ซึ่งทั้งหมดนี้เพียงพอสำหรับการพัฒนามุมมองง่าย ๆ บางอย่างได้แล้ว

ตัวอย่างเช่น: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

หน้าจอของ Google ดูสะอาดมาก มันประกอบด้วยรูปภาพและข้อความ เราสามารถลองวิเคราะห์โครงสร้างของหน้าจอ Google จากมุมมองของ SwiftUI ได้ดังนี้:

1. โดยรวมแบ่งออกเป็น 3 ส่วน: โลโก้ Google, ช่องค้นหา และข้อความแนะนำ สามารถใช้ VStack จัดเรียงแนวตั้งได้
2. โลโก้ Google เป็นรูปภาพหนึ่งรูป สามารถใช้ Image แสดงได้
3. ช่องค้นหาประกอบด้วยช่องกรอกข้อความและไอคอน หากยังไม่พิจารณาช่องกรอกข้อความ ก็สามารถใช้ Image แสดงไอคอนค้นหาได้
4. ข้อความแนะนำใช้ Text แสดงได้ ส่วนการเรียงข้อความในแนวนอนสามารถใช้ HStack และสีของตัวอักษรสามารถควบคุมด้วย foregroundStyle

ผ่านการฝึกใช้ความรู้เหล่านี้ เราจะสามารถสร้างมุมมองง่าย ๆ บางอย่างได้ และช่วยให้เข้าใจการใช้งานมุมมอง Image และ Text รวมถึง modifier ของพวกมันได้ลึกขึ้น
