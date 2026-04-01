# ลูปและรายการ

ในบทเรียนนี้ เราจะเรียนรู้ `for` loop ใน Swift และ `ForEach` ใน SwiftUI

ทั้งสองอย่างช่วยให้เราอ่าน elements ใน array ตามลำดับได้ ในการพัฒนาจริง เรามักต้องดึงข้อมูลจาก data group ออกมาทีละรายการ แล้วจึงนำไป process หรือ display ต่อ ซึ่ง loop ก็คือเครื่องมือสำคัญสำหรับงานลักษณะนี้

เวลาเรา browse web หรือใช้งาน App เรามักจะเห็น lists หรือ items จำนวนมาก เนื้อหาแบบนี้มักจะถูกเก็บไว้ใน `array` ก่อน จากนั้นจึงถูกอ่านออกมาทีละรายการผ่าน `loop` และสุดท้ายจึงค่อยแสดงบนหน้าจอ

ตัวอย่างเช่น รายการผลการค้นหาของ Google:

![Google](../../Resource/017_google.png)

แต่ละ item ในรายการผลการค้นหา มักจะตรงกับข้อมูลหนึ่งรายการ และถูกแสดงออกมาทีละรายการผ่าน loop

ดังนั้น `array` และ `loop` จึงมักปรากฏร่วมกันอยู่เสมอ `Array` มีหน้าที่เก็บ data group ส่วน `loop` มีหน้าที่หยิบข้อมูลเหล่านั้นออกมาตามลำดับและทำงานแบบเดิมซ้ำ ๆ

ต่อไป เราจะเริ่มจาก `for` loop ที่พื้นฐานที่สุดก่อน

## นับถอยหลัง

สมมติว่าเราต้องการจำลองฟังก์ชันนับถอยหลัง โดยให้ output `“5, 4, 3, 2, 1”` ตามลำดับ

วิธีเขียนที่ตรงที่สุดคือ:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

วิธีนี้สามารถจำลองการนับถอยหลังได้ก็จริง แต่ถ้ามีเนื้อหามาก ๆ code จะดูซ้ำมาก และแก้ไขภายหลังก็ไม่สะดวก

ในตอนนี้ เราสามารถใส่ data ลงใน array ก่อน แล้วค่อยใช้ `for` loop เพื่อ output ออกมาทีละรายการ:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

การเขียนแบบนี้กระชับกว่า และขยายต่อได้ง่ายกว่า แม้ว่าจะมีตัวเลขใน countdown จำนวนมาก เราก็ไม่จำเป็นต้องเขียน `print` ซ้ำทีละบรรทัด แค่ปล่อยให้ loop จัดการแต่ละ element ใน array โดยอัตโนมัติก็พอ

เราสามารถเอา code นี้ไปใส่ใน button เพื่อทดสอบได้:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

เมื่อกด button, `for` loop จะหยิบ integer แต่ละตัวใน `countDown` ออกมาตามลำดับของ array แล้วพิมพ์ออกไปที่ console

ต่อไป เรามาดูกันว่า `for` loop ทำงานอย่างไร

## for loop

`for` loop ใช้สำหรับ process data group ตามลำดับ โดยสิ่งที่ใช้กันบ่อยที่สุดคือ arrays และ ranges

รูปแบบพื้นฐาน:

```swift
for element in arrayOrRange {
    codeToExecute
}
```

ตัวอย่างเช่น code นับถอยหลังเมื่อกี้:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

ตรงนี้ `i` หมายถึง element ที่ถูกหยิบออกมาในขณะนั้น ส่วนหลัง `in` คือ data ที่เราต้องการ loop ผ่าน นั่นก็คือ array `countDown`

ความหมายของ code นี้คือ: โปรแกรมจะหยิบแต่ละ element ออกจาก array `countDown` ตามลำดับ ทุกครั้งที่หยิบออกมาหนึ่ง element ก็จะใช้ `i` แทนชั่วคราว แล้วจึง execute code ในวงเล็บปีกกา

เราสามารถเข้าใจกระบวนการทำงานได้แบบนี้:

- ครั้งแรกจะหยิบ `5` ออกมา ดังนั้นตอนนั้น `i` มีค่าเป็น `5`
- execute `print(i)` แล้ว output `5`
- จากนั้นหยิบ element ถัดไปคือ `4`
- execute `print(i)` อีกครั้ง แล้ว output `4`

ส่วน `3`, `2`, `1` ที่เหลือก็จะถูก execute ตามลำดับในลักษณะเดียวกัน

![for](../../Resource/017_for.png)

เมื่อ elements ทั้งหมดใน array ถูก process เสร็จแล้ว `for` loop จะจบเองโดยอัตโนมัติ

เราสามารถใช้ `for` loop เพื่อเข้าถึงทุก element ใน array และทำงานอย่าง countdown ให้สำเร็จได้

**คำแนะนำ**: `i` เป็นชื่อที่พบได้บ่อยมากใน for loop เพื่อใช้แทน element ปัจจุบัน แต่ไม่ใช่รูปแบบที่ตายตัว คุณสามารถใช้ชื่อภาษาอังกฤษอื่นได้เช่นกัน

ตัวอย่างเช่น ใช้ `num` เพื่อแทนแต่ละ element ที่ถูกหยิบออกมา:

```swift
for num in countDown {
    print(num)
}
```

ภายในวงเล็บปีกกา เราก็ต้องใช้ `num` เพื่อแทน element ปัจจุบันเหมือนกัน

### การ loop ผ่าน range

`for` loop ไม่ได้ใช้ได้แค่กับ array เท่านั้น แต่ยังใช้กับ range ได้ด้วย

ตัวอย่างเช่น ถ้าเราต้องการคำนวณผลรวมของ positive integers ภายใน `50`, เราจำเป็นต้องนำ integer ทุกตัวตั้งแต่ `1` ถึง `50` มาบวกกันทีละตัว

วิธีเขียนที่ตรงที่สุดอาจเป็นแบบนี้:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

ปัญหาของการเขียนแบบนี้คือ เราต้องเขียนทุกตัวเลขด้วยมือทั้งหมด ซึ่งทั้งยุ่งยากและไม่เหมาะกับงานพัฒนาจริง

ในตอนนี้ เราสามารถใช้ range operator ร่วมกับ `for` loop เพื่อทำงานนี้ได้

ใน chapter เรื่อง “operators” ก่อนหน้านี้ เราได้เรียนรู้ range operator ไปแล้ว:

```swift
1...3   // 1, 2, 3
```

ตรงนี้ `...` หมายถึง closed range นั่นคือรวมทั้งจุดเริ่มต้นและจุดสิ้นสุดไว้ด้วย

ดังนั้น ที่นี่เราสามารถใช้ `for` loop กับ integer range ตั้งแต่ `1` ถึง `50` ได้:

```swift
for i in 1...50 {
    
}
```

เนื่องจากเราต้องการบวก integer เหล่านี้เข้าด้วยกัน จึงต้องมี variable สำหรับเก็บผลรวมด้วย:

```swift
var count = 0
```

จากนั้นในแต่ละรอบของ loop ให้นำ number ที่หยิบออกมาในขณะนั้นไปบวกเข้ากับ `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

code นี้มีความหมายว่า:

- `count` ใช้เก็บผลรวมปัจจุบัน
- `for` loop จะหยิบ integer ตั้งแต่ `1` ถึง `50` ออกมาตามลำดับ
- ทุกครั้งที่หยิบ integer ออกมา จะ execute `count += i`
- หลังจาก loop จบลง `count` จะเก็บผลรวมสุดท้ายไว้

ด้วยวิธีนี้ เราก็จะได้ผลรวมของ positive integers ทั้งหมดภายใน `50`

ในทำนองเดียวกัน ถ้าเราต้องการคำนวณผลรวมของ integers ตั้งแต่ `1` ถึง `100` เราแค่เปลี่ยน range ก็พอ:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` loop ไม่ได้ใช้กับ array ได้อย่างเดียว แต่ยังใช้กับ range ได้ด้วย ความสามารถในการ process data ซ้ำ ๆ ตามลำดับแบบนี้พบได้บ่อยมากในการพัฒนา

มันช่วยให้เราจัดการงานที่ซ้ำกันจำนวนมากได้โดยอัตโนมัติ โดยไม่ต้องเขียนกระบวนการบวกของแต่ละตัวเลข หรือ operations ซ้ำ ๆ แบบอื่นด้วยมือทีละขั้น

## loop ใน SwiftUI

`for` loop ที่กล่าวถึงก่อนหน้านี้เป็นส่วนหนึ่งของภาษา Swift

แต่ใน SwiftUI เราไม่สามารถใช้ `for` ตรง ๆ ภายในโครงสร้าง view เพื่อสร้าง views ได้:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

เหตุผลก็คือ ภายใน `VStack` ต้องเป็น SwiftUI views ขณะที่ `for` loop ปกตินั้นไม่ได้เป็น view ด้วยตัวมันเอง

ถ้าเราต้องการสร้าง interface ซ้ำ ๆ ใน SwiftUI ตาม content ของ array เราจำเป็นต้องใช้ `ForEach`

ตัวอย่างเช่น ถ้าต้องการแสดงชื่อของสมาชิกทุกคนในกลุ่ม เราสามารถเขียนได้ว่า:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

ผลลัพธ์ที่แสดง:

![for1](../../Resource/017_for1.png)

จากนั้น เราเพิ่ม modifiers แบบเดียวกันให้กับแต่ละ `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

ตอนนี้ `Text` ทุกตัวจะแสดงด้วย font ที่เล็กลงและหนาขึ้น

ผลลัพธ์ที่แสดง:

![](../../Resource/017_for2.png)

แม้ว่า modifiers จะทำให้ interface ดูสวยขึ้น แต่ก็ทำให้ code ยาวขึ้นและซ้ำมากขึ้นด้วย

ถ้าชื่อมีมากขึ้นเรื่อย ๆ หรือภายหลังเราต้องการแก้ไข font, color หรือ styles อื่น ๆ ให้เหมือนกันทั้งหมด เราก็จะต้องเขียนและแก้ code แบบเดียวกันซ้ำ ๆ จำนวนมาก ซึ่งทั้งยุ่งยากและดูแลรักษาได้ไม่สะดวก

ในตอนนี้ เราสามารถใส่ names เหล่านี้ลงใน array ก่อน แล้วใช้ `ForEach` ใน SwiftUI เพื่อสร้าง views ซ้ำ ๆ ตาม data ใน array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

code ชุดนี้กระชับกว่า `ForEach` จะอ่านแต่ละ element ใน array ตามลำดับ แล้วแสดง content ที่ตรงกันบนหน้าจอ

เมื่อภายหลังเราต้องเพิ่มชื่อใหม่ ๆ ก็แค่แก้ content ใน array `names` เท่านั้น ไม่จำเป็นต้องเพิ่ม `Text` และ modifiers ที่ซับซ้อนซ้ำทุกครั้ง

## ForEach

`ForEach` คือ structure ใน SwiftUI ที่ใช้สร้าง views แบบซ้ำ ๆ คุณสามารถมองมันว่าเป็น structure ที่คล้ายกับ `for` loop ในโลกของ SwiftUI

การใช้งานพื้นฐาน:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

ตัวอย่างเช่น names ของกลุ่มเมื่อครู่:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

code นี้มีความหมายว่า:

`names` คือ array ที่ถูก loop หรือก็คือ data ที่ต้องการแสดง

`id:\.self` หมายถึงใช้ element ใน array เองเพื่อแยกความแตกต่างของแต่ละ item

ในตัวอย่างนี้ array เก็บค่าเป็น strings:

```swift
["Sam", "John", "Wathon", "Bob"]
```

ดังนั้น SwiftUI จะใช้ strings อย่าง "Sam", "John", "Wathon", "Bob" เองโดยตรงเพื่อแยก content ที่แตกต่างกัน

สำหรับ arrays แบบง่ายที่เจอบ่อยในช่วงเริ่มต้น เช่น String และ Int เรามักเริ่มต้นได้ด้วยการเขียน:

```swift
id: \.self
```

ตอนนี้แค่จำรูปแบบนี้ไว้ก่อนก็พอ ยังไม่จำเป็นต้องลงลึกถึงกฎอื่น ๆ ของ id

`item in` หมายความว่า `item` แทน element ที่ถูกหยิบออกมาในขณะนั้น

ตัวอย่างเช่น ในรอบแรกของ loop, `item` คือ `"Sam"` และในรอบที่สอง `item` คือ `"John"`

ดังนั้น:

```swift
Text(item)
```

จะกลายเป็นตามลำดับดังนี้:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

ดังนั้น หน้าที่ของ code นี้ก็คือหยิบแต่ละชื่อจาก array `names` ออกมาตามลำดับ แล้วสร้าง `Text` view หนึ่งตัวสำหรับแต่ละชื่อ

### กระบวนการทำงาน

เราสามารถเข้าใจกระบวนการทำงานได้แบบนี้:

- `ForEach` จะอ่าน element แรก `"Sam"` จาก array `names` ก่อน
- `item` จะแทน `"Sam"` ชั่วคราว
- `Text(item)` จะแสดง `"Sam"`
- จากนั้นจึงอ่าน element ถัดไปคือ `"John"`
- แล้ว execute view code เดิมซ้ำอีกครั้ง

สุดท้าย names ทั้งหมดใน array ก็จะถูกแสดงออกมา

ข้อดีของการเขียนแบบนี้คือ เมื่อจำนวนชื่อมากขึ้น เราไม่จำเป็นต้องเขียน `Text` จำนวนมากซ้ำ ๆ เพียงแค่แก้ content ใน array ก็พอ

### loop รูปภาพ

`ForEach` ไม่ได้ใช้แสดงแค่ข้อความเท่านั้น แต่ยังใช้แสดงรูปภาพ สี หรือ SwiftUI views อื่น ๆ ได้ด้วย

ตัวอย่างเช่น เราเตรียมรูปภาพไว้ 4 รูป:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

ลากรูปทั้งสี่นี้เข้าไปในโฟลเดอร์ Assets ของ Xcode

![image](../../Resource/017_for3.png)

ถ้าเราไม่ใช้ `ForEach`, เราจะต้องเขียนรูปแต่ละรูปออกมาด้วยมือ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

ผลลัพธ์ที่แสดง:

![image](../../Resource/017_for4.png)

วิธีนี้ทำงานได้ก็จริง แต่ code จะค่อนข้างยาว

ถ้าจำนวนรูปภาพมากขึ้นเรื่อย ๆ เราก็ต้องเขียน `Image` code เพิ่มขึ้นเรื่อย ๆ

ถ้าภายหลังต้องการปรับขนาดรูปภาพทั้งหมดให้เหมือนกัน ก็ต้องแก้ทีละรูป

ในตอนนี้ เราสามารถเก็บชื่อรูปภาพไว้ใน array แล้วใช้ `ForEach` เพื่อสร้าง image views ซ้ำ ๆ ได้:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

ตรงนี้ `images` เป็น array ของ strings และแต่ละ element ใน array ก็คือชื่อของรูปภาพ

`ForEach(images, id: \.self)` หมายถึงอ่านแต่ละ element ใน array `images` ตามลำดับ ใช้ element นั้นเองในการแยกแต่ละ item แล้วสร้าง view ที่สอดคล้องกับ element ปัจจุบัน

ตัวอย่างเช่น ถ้าอ่าน `"430F9BEF"` เป็นรายการแรก:

```swift
Image(item)
```

ก็เท่ากับ:

```swift
Image("430F9BEF")
```

รูปภาพที่เหลือก็จะแสดงตามลำดับด้วยวิธีเดียวกัน

![image](../../Resource/017_for4.png)

ตรงนี้เรายังคงใช้:

```swift
id: \.self
```

เหตุผลก็เหมือนเดิม เพราะ elements ใน array `images` ก็เป็น string type แบบง่ายเช่นกัน ดังนั้นในช่วงเริ่มต้นก็ใช้ element เองเพื่อแยกความแตกต่างได้เลย

เราสามารถจำสิ่งนี้เป็นสูตรคงที่ได้ง่าย ๆ:

**เมื่อ `ForEach` loop ผ่าน array แบบง่ายอย่าง `String` หรือ `Int`, โดยทั่วไปจะเขียนเป็น `id: \.self`**

### เพิ่มรูปภาพ

ถ้าภายหลังต้องการเพิ่มรูปภาพใหม่ เพียงแค่แก้ content ของ array ก็พอ:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

ไม่จำเป็นต้องเขียน `Image` code ใหม่ซ้ำอีก

ถ้ามีรูปภาพจำนวนมาก สามารถใช้ร่วมกับ `ScrollView` ได้ ไม่เช่นนั้นเมื่อ content เกินหน้าจอ ก็จะไม่สามารถ preview ได้ครบทั้งหมด

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### แก้ไขรูปภาพ

เมื่อเราต้องการปรับ style ของรูปภาพทั้งหมดให้เหมือนกัน เราเพียงแค่แก้ code ภายใน `ForEach` ก็พอ

ตัวอย่างเช่น เปลี่ยนความกว้างเป็น `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

แบบนี้รูปภาพทั้งหมดก็จะถูก update พร้อมกัน โดยไม่ต้องไปแก้ทีละรูป

นี่คือหนึ่งในบทบาทสำคัญของ `ForEach`:

**เมื่อ views หลายตัวมี structure เหมือนกันและต่างกันแค่ content เราสามารถเขียน view code เพียงครั้งเดียว แล้วปล่อยให้ data ใน array เป็นตัวกำหนดว่าอะไรจะถูกแสดง**

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้ `for` loop และ `ForEach`

`for` loop ใช้สำหรับ process elements ใน array หรือ range ตามลำดับ และเอนเอียงไปทางการจัดการ data มากกว่า

`ForEach` ใช้ใน SwiftUI เพื่อสร้าง views ซ้ำ ๆ ตาม content ของ array และเอนเอียงไปทางการแสดงผลของ UI มากกว่า

ในช่วงเริ่มต้น รูปแบบที่พบบ่อยที่สุดของ `ForEach` คือ:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

ตรงนี้ `id: \.self` หมายถึงใช้ element เองเพื่อแยกความแตกต่างของแต่ละ element

เมื่อ content ใน array เป็น types แบบง่ายอย่าง `String` หรือ `Int`, โดยทั่วไปเราสามารถเริ่มจากรูปแบบนี้ได้เลย

ต่อไป เมื่อคุณ browse web หรือใช้ App แล้วเห็นข้อความ รูปภาพ หรือ list content ที่ซ้ำกันเป็นชุด ๆ คุณสามารถนึกได้ว่า ใน SwiftUI content แบบนี้มักถูกใส่ไว้ใน array ก่อน แล้วค่อยแสดงออกมาทีละรายการผ่าน `ForEach`
