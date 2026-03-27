# สร้างหน้าเรซูเม่ส่วนตัว

ในบทนี้ เราจะสร้างมุมมองเรซูเม่ส่วนตัวแบบง่าย ๆ และเรียนรู้ความรู้ต่อไปนี้:

- cornerRadius
- spacing
- ScrollView

ระหว่างการสร้าง เราจะทบทวนเรื่องเลย์เอาต์, Text และ Image รวมถึงทำเอฟเฟกต์การควบคุมระยะห่างและการเลื่อนเนื้อหา

## เรซูเม่ส่วนตัว

ผลลัพธ์เป้าหมาย:

![Swift](../../RESOURCE/004_img.png)

**โปรดลองทำด้วยตัวเองก่อน แล้วค่อยอ่านคำอธิบายด้านล่างต่อ**

### สร้างโปรเจกต์

สร้างโปรเจกต์ iOS ใหม่ หรือใช้โปรเจกต์เดิมที่สร้างไว้ก่อนหน้านี้ต่อก็ได้

โค้ดเริ่มต้นของ ContentView แบบค่าเริ่มต้น:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
````

ตอนนี้ให้ล้างโค้ดออก แล้วเริ่มเขียนเนื้อหาของเราเอง:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### โครงสร้างโดยรวม

ในการพัฒนาจริง โดยทั่วไปเรามักจะออกแบบโครงสร้างโดยรวมก่อน

หน้าของเราประกอบด้วย:

1. หัวเรื่อง
2. ข้อมูลส่วนตัว
3. คำแนะนำตัว

ให้เราเพิ่ม VStack ไว้ชั้นนอกสุด:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack ช่วยให้มุมมองเรียงในแนวตั้ง และสามารถควบคุมการจัดเรียงรวมถึงระยะห่างของมุมมองได้

### หัวเรื่อง

ก่อนอื่น เราสร้าง Text เพื่อแสดงหัวเรื่อง

ที่นี่ ผมใช้ชื่อภาษาอังกฤษของตัวเองเป็นหัวเรื่อง:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

โดยทั่วไปหัวเรื่องมักจะมีขนาดใหญ่และตัวหนา ตรงนี้จึงใช้ modifier อย่าง font และ fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### การจัดวาง

ค่าเริ่มต้นของ SwiftUI คือจัดแนวแบบ center ตอนนี้หัวเรื่องจึงแสดงอยู่ตรงกลางของ ContentView

![Swift](../../RESOURCE/004_img3.png)

เราจำเป็นต้องให้หัวเรื่องแสดงที่ด้านบนของมุมมอง ซึ่งสามารถใช้ Spacer เพื่อปรับเลย์เอาต์ได้:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer จะกินพื้นที่ที่เหลือ และดัน Text ขึ้นไปด้านบนของ container

![Swift](../../RESOURCE/004_img4.png)

### พื้นที่ว่าง

ถ้าคิดว่าข้อความอยู่ใกล้ด้านบนเกินไป สามารถใช้ padding หรือ Spacer ได้

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

ตั้งค่า padding ด้านบนของ VStack เป็น 20

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

เรายังสามารถใช้ Spacer และกำหนดความสูงผ่าน frame เพื่อสร้างพื้นที่ว่างตามขนาดที่กำหนดได้เช่นกัน

ผลลัพธ์ที่ได้:

![Swift](../../RESOURCE/004_img5.png)

### รูปภาพ

เราเตรียมรูปถ่ายหน้าตรงของตัวเองหนึ่งรูป แล้วใส่ไว้ในโฟลเดอร์ทรัพยากร Assets

![Swift](../../RESOURCE/004_img6.png)

ใน ContentView ใช้ Image เพื่อแสดงรูปภาพ:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

เนื่องจากขนาดต้นฉบับของรูปค่อนข้างใหญ่ เราจึงต้องใช้ frame เพื่อควบคุมขนาดที่แสดง

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ตอนนี้เราจะพบปัญหาหนึ่ง:

ถ้าอัตราส่วนความกว้างและความสูงของ frame ไม่ตรงกับอัตราส่วนเดิมของรูปภาพ รูปภาพจะถูกบิดเบี้ยว

ตัวอย่างเช่น:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

เพื่อหลีกเลี่ยงไม่ให้รูปภาพบิดเบี้ยว เราจำเป็นต้องใช้ scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

หน้าที่ของ scaledToFit คือ:

ภายในขอบเขต frame ที่กำหนด จะย่อหรือขยายรูปภาพตามสัดส่วนเดิมของรูป และแสดงเนื้อหารูปภาพได้ครบทั้งหมด

มันจะไม่บังคับยืดรูปภาพให้เต็ม frame แต่จะรักษาสัดส่วนความกว้างและความสูงเดิม แล้วปรับขนาดตามสัดส่วนจนกระทั่งด้านใดด้านหนึ่งพอดีกับขอบ

นั่นหมายความว่า:

* ถ้าความกว้างของ frame เล็กกว่า รูปภาพจะย่อหรือขยายโดยอิงความกว้างเป็นหลัก
* ถ้าความสูงของ frame เล็กกว่า รูปภาพจะย่อหรือขยายโดยอิงความสูงเป็นหลัก
* รูปภาพจะรักษาสัดส่วนเดิมไว้เสมอ และจะไม่บิดเบี้ยว

โดยทั่วไปเรามักตั้งค่าขนาดเพียงด้านเดียวก็ได้ ตัวอย่างเช่น:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

วิธีนี้ระบบจะคำนวณความสูงที่เหมาะสมให้อัตโนมัติตามความกว้าง 140 พร้อมรักษาสัดส่วนของรูปภาพไว้

ถ้าต้องการตรึงสัดส่วนทางสายตา หรือหลีกเลี่ยงการถูกบีบในเลย์เอาต์ที่ซับซ้อน ก็สามารถกำหนดทั้งความกว้างและความสูงพร้อมกันได้

### มุมโค้ง

ถ้าต้องการให้รูปภาพแสดงในลักษณะมุมโค้ง สามารถใช้ modifier อย่าง cornerRadius:

```swift
.cornerRadius(10)
```

ตัวอย่างเช่น:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

เพิ่ม cornerRadius(20) ต่อท้าย modifier ของ Image

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) หมายถึงการตัดขอบของมุมมอง แล้วใช้รัศมีมุมโค้งเป็น 20

หลังจากเพิ่มมุมโค้งแล้ว มุมทั้งสี่ของรูปภาพจะกลายเป็นเส้นโค้ง ทำให้ภาพดูนุ่มนวลและทันสมัยมากขึ้น

รูปแบบการออกแบบนี้พบได้บ่อยมากในงานออกแบบอินเทอร์เฟซปัจจุบัน ตัวอย่างเช่น ไอคอนแอปของ iOS ก็ใช้รูปทรงสี่เหลี่ยมมุมโค้งเช่นกัน (แต่ไอคอนของระบบใช้เส้นโค้งต่อเนื่องแบบ superellipse ไม่ใช่มุมโค้งธรรมดา)

### ข้อมูลส่วนตัว

ต่อไปเริ่มทำส่วนข้อมูลส่วนตัวที่อยู่ทางซ้ายของรูปภาพ จากโครงสร้างของหน้าจอจะเห็นว่าข้อมูลส่วนตัวและรูปภาพถูกจัดเรียงในแนวนอน ดังนั้นต้องใช้ HStack

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

เนื้อหาข้อมูลส่วนตัวถูกจัดเรียงในแนวตั้ง

![Swift](../../RESOURCE/004_img11.png)

ดังนั้น ชั้นนอกใช้ HStack, ส่วนข้อมูลส่วนตัวใช้ VStack และใช้ Text สำหรับเนื้อหาข้อความ

โครงสร้างพื้นฐาน:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**ทำให้ชื่อฟิลด์เป็นตัวหนา**

เพื่อแยกชื่อฟิลด์ออกจากค่าของฟิลด์ สามารถใช้ fontWeight กับชื่อฟิลด์ได้:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**จัดข้อความชิดซ้าย**

ค่าเริ่มต้นของ VStack คือจัดกึ่งกลาง ถ้าต้องการให้ข้อความทั้งหมดชิดซ้าย ต้องตั้งค่าการจัดแนว:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading หมายถึงจัดแนวตามด้านซ้าย (ในสภาพแวดล้อมภาษาที่เขียนจากซ้ายไปขวา)

![Swift](../../RESOURCE/004_img14.png)

### ระยะห่าง

ถ้าต้องการให้ข้อมูลส่วนตัวกับรูปภาพมีระยะห่างคงที่ ก่อนหน้านี้เราเรียนการใช้ Spacer เพื่อสร้างพื้นที่ว่าง:

```swift
Spacer()
    .frame(width: 10)
```

นอกจากนี้ยังสามารถใช้พารามิเตอร์ spacing ของ HStack ได้:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 หมายถึงระยะห่างระหว่างมุมมองลูกสองตัวเท่ากับ 30 pt

![Swift](../../RESOURCE/004_img15.png)

**spacing คืออะไร?**

ใน VStack, HStack และ ZStack, spacing สามารถใช้ควบคุมระยะห่างระหว่างมุมมองลูกได้

ตัวอย่างเช่น:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

ระยะห่างระหว่างมุมมองลูกใน VStack จะถูกตั้งค่าเป็น 10pt

![Swift](../../RESOURCE/004_img16.png)

สิ่งที่ต้องระวังคือ spacing มีผลเฉพาะกับ "มุมมองลูกโดยตรง" เท่านั้น และจะไม่กระทบกับเลย์เอาต์ภายใน container ที่ซ้อนอยู่ด้านใน

**ควบคุมระยะห่างภายในรายการ**

ถ้าต้องการเพิ่มระยะห่างระหว่างฟิลด์ วิธีที่ตรงที่สุดคือกำหนด spacing ให้ VStack:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

วิธีนี้จะทำให้ระยะห่างระหว่างมุมมองลูกทั้งหมดกลายเป็น 10 pt

แต่เมื่อสังเกตหน้าจอจะพบปัญหาหนึ่ง:

ระหว่างแต่ละกลุ่มฟิลด์มีระยะห่าง และระหว่างชื่อฟิลด์กับค่าของฟิลด์ก็มีระยะห่างเท่ากันด้วย

นั่นเป็นเพราะ spacing มีผลกับมุมมองลูกโดยตรงทั้งหมดของ container ปัจจุบัน

ในโครงสร้างนี้ Text แต่ละตัวล้วนเป็นมุมมองลูกโดยตรงของ VStack ชั้นนอก ดังนั้นระยะห่างจึงถูกกำหนดแบบเดียวกันทั้งหมด

ถ้าต้องการให้มีระยะห่างเฉพาะระหว่าง "กลุ่มฟิลด์" แต่ยังคงให้ชื่อฟิลด์กับค่าของฟิลด์อยู่ชิดกันแบบปกติ เราสามารถมองว่า "ชื่อฟิลด์ + ค่าฟิลด์" เป็นหนึ่งหน่วยเชิงตรรกะ แล้วใช้ VStack ครอบไว้ด้านนอก:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

ตอนนี้โครงสร้างจะเปลี่ยนเป็นมีระยะห่างระหว่าง VStack ชั้นนอก ส่วน VStack ชั้นในยังคงใช้ระยะชิดแบบค่าเริ่มต้น ดังนั้นระหว่างชื่อฟิลด์กับค่าของฟิลด์จะไม่มีช่องว่างเพิ่มขึ้น

![Swift](../../RESOURCE/004_img18.png)

### คำแนะนำตัว

ต่อไปทำส่วนคำแนะนำตัว

จากโครงสร้างหน้าจอ จะเห็นว่าเนื้อหาส่วนแนะนำตัวประกอบด้วยข้อความหลายบรรทัด และข้อความถูกจัดเรียงในแนวตั้ง

![Swift](../../RESOURCE/004_img19.png)

ดังนั้นจึงสามารถใช้ VStack ร่วมกับ Text ได้:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**เพิ่มระยะห่าง**

ตอนนี้ส่วนข้อมูลส่วนตัวกับส่วนคำแนะนำตัวดูค่อนข้างแน่น และรูปแบบยังไม่สวยงามนัก

![Swift](../../RESOURCE/004_img20.png)

เพราะทั้งสองส่วนอยู่ใน container ชั้นนอกเดียวกัน เราจึงสามารถควบคุมระยะห่างโดยรวมที่ container ชั้นนอกได้:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

ผลลัพธ์ที่ได้:

![Swift](../../RESOURCE/004_img21.png)

**ระยะห่างของรายการ**

ใช้ spacing เพื่อกำหนดระยะห่างระหว่างข้อความในส่วนคำแนะนำตัว:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### ทำเรซูเม่ส่วนตัวให้เสร็จสมบูรณ์

ตอนนี้ โครงสร้างพื้นฐานของเรซูเม่ส่วนตัวก็เสร็จสมบูรณ์แล้ว

![Swift](../../RESOURCE/004_img.png)

### มุมมองแบบเลื่อน

ตอนนี้โครงสร้างหน้าจอของเราใช้ VStack ซึ่งเมื่อจำนวนข้อความในส่วนแนะนำตัวยังน้อยก็ไม่มีปัญหา แต่ถ้าเพิ่มเป็น 20 บรรทัด, 30 บรรทัด หรือมากกว่านั้น ความสูงของเนื้อหาจะเกินหน้าจอ

ตัวอย่างเช่น:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

ตอนนี้จะเกิดปรากฏการณ์สองอย่าง:

* เนื้อหาด้านล่างถูกตัด
* หน้าไม่สามารถเลื่อนได้

นี่ไม่ใช่ปัญหาของ VStack เพราะ VStack เป็นเพียง container สำหรับจัดเลย์เอาต์ และมันไม่ได้มีความสามารถในการเลื่อนให้อัตโนมัติ

**ScrollView คืออะไร**

ScrollView คือ container ที่สามารถเลื่อนได้ เหมาะสำหรับเนื้อหาจำนวนมากที่เกินขนาดหน้าจอ เช่น รายการแนวตั้งหรือแนวนอน

โครงสร้างพื้นฐาน:

```swift
ScrollView {
    ...
}
```

ถ้าต้องการให้เกิดเอฟเฟกต์การเลื่อน จำเป็นต้องครอบเนื้อหาของทั้งหน้าด้วย ScrollView:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

แบบนี้ทั้งหน้าจะกลายเป็นพื้นที่ที่เลื่อนได้ เมื่อเนื้อหามีความสูงเกินหน้าจอ ก็จะสามารถเลื่อนได้อย่างเป็นธรรมชาติ

โดยค่าเริ่มต้น ScrollView จะแสดงตัวบ่งชี้แถบเลื่อน หากต้องการซ่อนแถบเลื่อน สามารถตั้งค่าได้ดังนี้:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## โค้ดฉบับสมบูรณ์

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```