# การโต้ตอบการเข้าสู่ระบบ

ในบทเรียนก่อนหน้า เราได้สร้างมุมมองเข้าสู่ระบบ และใช้ปุ่มร่วมกับตรรกะแบบมีเงื่อนไขเพื่อทำการตรวจสอบข้อมูลที่ป้อนเข้าแบบง่าย ๆ

ในบทเรียนนี้ เราจะต่อยอดจากโค้ดของบทเรียนก่อนหน้าเพื่อเรียนรู้เกี่ยวกับช่องป้อนรหัสผ่าน `SecureField`, กล่องเตือน `Alert` และวิธีควบคุมการแสดงผลของมุมมองที่แตกต่างกันตามตัวแปร

ผ่านบทเรียนนี้ คุณจะเข้าใจลำดับการโต้ตอบพื้นฐานของมุมมองเข้าสู่ระบบได้ลึกขึ้น ซึ่งนี่ก็เป็นตรรกะพื้นฐานที่ถูกใช้บ่อยในหลายแอปเช่นกัน

## ช่องป้อนรหัสผ่าน

ในบทเรียนก่อนหน้า เราใช้ `TextField` เพื่อป้อนรหัสผ่าน

แต่ในหน้าจอเข้าสู่ระบบจริง รหัสผ่านมักจะไม่ถูกแสดงออกมาโดยตรง แต่จะแสดงเป็นจุดหรือเอฟเฟกต์ซ่อนแบบอื่น ซึ่งช่วยปกป้องความเป็นส่วนตัวของผู้ใช้

ใน SwiftUI คอนโทรลที่ใช้สำหรับป้อนรหัสผ่านโดยเฉพาะคือ `SecureField`

ตัวอย่างเช่น:

```swift
SecureField("Password", text: $password)
```

รูปแบบการเขียนของมันคล้ายกับ `TextField` มาก โดยต้องมีข้อความคำใบ้และตัวแปรที่ผูกไว้เช่นกัน

สามารถเข้าใจแบบง่าย ๆ ได้ว่า `SecureField` ก็เป็นช่องป้อนข้อมูลชนิดหนึ่ง เพียงแต่จะซ่อนเนื้อหาที่ผู้ใช้พิมพ์เข้าไป

เราสามารถเปลี่ยน `TextField` ที่เดิมใช้ป้อนรหัสผ่านให้เป็น `SecureField` ได้โดยตรง:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

เมื่อผู้ใช้ป้อนรหัสผ่าน เนื้อหารหัสผ่านจะไม่ถูกแสดงบนหน้าจอโดยตรงอีกต่อไป

เอฟเฟกต์การแสดงผล:

![password](../../Resource/020_password.png)

ตอนนี้เราสามารถป้อนชื่อผู้ใช้และรหัสผ่าน จากนั้นคลิกปุ่มเพื่อตรวจสอบว่าข้อมูลที่ป้อนถูกต้องหรือไม่

### การแสดงข้อความตอบกลับ

ก่อนหน้านี้เราใช้ `print` เพื่อแสดงผลลัพธ์มาโดยตลอด

เนื้อหาจาก `print` จะแสดงเฉพาะในคอนโซล นักพัฒนาสามารถเห็นได้เมื่อรันโปรแกรมใน Xcode แต่ผู้ใช้ทั่วไปบนโทรศัพท์จะไม่เห็นข้อความเหล่านี้

นั่นหมายความว่า แม้โปรแกรมจะตรวจสอบเสร็จแล้ว ผู้ใช้ก็ยังไม่รู้ว่าข้อมูลที่ป้อนถูกต้องหรือไม่

ดังนั้น ณ จุดนี้ เราจำเป็นต้องมีวิธีแสดงข้อความโดยตรงบนหน้าจอ

## กล่องเตือน Alert

ใน SwiftUI เราสามารถใช้ `Alert` เพื่อแสดงกล่องข้อความแบบป๊อปอัปได้

การใช้งานพื้นฐาน:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

โค้ดนี้ดูซับซ้อนกว่าคอนโทรลก่อนหน้านี้เล็กน้อย แต่เราสามารถทำความเข้าใจได้ด้วยการแยกเป็นส่วน ๆ

`Alert` ประกอบด้วยส่วนหลักดังต่อไปนี้:

- `"Title"`: ชื่อเรื่องของกล่องเตือน
- `isPresented`: ค่า Boolean แบบผูกที่ใช้ควบคุมว่าจะแสดงกล่องเตือนหรือไม่
- `Button(...)`: ปุ่มในกล่องเตือน
- `message:`: เนื้อหาข้อความที่แสดงในกล่องเตือน

สามารถเข้าใจแบบง่าย ๆ ได้ว่า เมื่อค่าของตัวแปรที่ผูกไว้กลายเป็น `true` ระบบก็จะแสดงกล่องเตือนนี้ขึ้นมา

เอฟเฟกต์การแสดงผล:

![alert](../../Resource/020_alert3.png)

โครงสร้างที่สอดคล้องกัน:

![alert](../../Resource/020_alert.png)

### Alert เป็นตัวปรับแต่ง

เช่นเดียวกับตัวปรับแต่งหลายตัวที่เราเรียนมาก่อน `Alert` ก็ถูกเพิ่มต่อท้ายมุมมองใดมุมมองหนึ่งเช่นกัน

ตัวอย่างเช่น มันสามารถต่อท้ายหลังปุ่มได้:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

หรือจะต่อท้ายหลัง `VStack` ชั้นนอกก็ได้:

```swift
VStack {
    // ...
}
.alert() {...}
```

นั่นหมายความว่า `Alert` ไม่ใช่มุมมองอิสระที่วางอยู่บนหน้าจอโดยลำพัง แต่เป็นตัวปรับแต่งที่ยึดติดอยู่กับมุมมองใดมุมมองหนึ่ง

สามารถเข้าใจแบบง่าย ๆ ได้ว่า โดยทั่วไป `Alert` จะเขียนไว้หลังปุ่มหรือหลังโครงร่างชั้นนอก เพื่อใช้แสดงข้อความเมื่อเงื่อนไขบางอย่างเป็นจริง

### การแสดง Alert

ถ้าเราต้องการแสดง `Alert` เราจำเป็นต้องมีตัวแปรสำหรับควบคุมมัน

ตัวอย่างเช่น:

```swift
@State private var showAlert = false
```

ตัวแปรนี้มีชนิดเป็น `Bool` ซึ่งหมายความว่ามีได้เพียงสองค่า: `true` หรือ `false`

จากนั้นผูกมันเข้ากับ `isPresented` ของ `Alert`:

```swift
isPresented: $showAlert
```

เมื่อ `showAlert` เป็น `false` กล่องเตือนจะไม่ถูกแสดง เมื่อ `showAlert` เป็น `true` กล่องเตือนจะเด้งขึ้นมา

### การแสดงกล่องเตือนผ่านปุ่ม

ตอนนี้เรามาเริ่มจากสถานการณ์ที่ง่ายที่สุดก่อน:

เมื่อผู้ใช้ไม่ได้กรอกอะไรเลย แล้วคลิกปุ่ม `Sign in` โดยตรง ให้แสดงกล่องข้อความเพื่อบอกเขาว่ายังไม่ได้ป้อนข้อมูลใด ๆ

ก่อนอื่น ให้สร้างตัวแปรสำหรับควบคุมกล่องข้อความนี้:

```swift
@State private var showEmpty = false
```

จากนั้นเพิ่ม `Alert` ต่อท้าย `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

ถัดไป ทำการตรวจสอบในโค้ดของการคลิกปุ่ม:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

หากทั้ง `user` และ `password` ว่างเปล่า ให้ตั้งค่า `showEmpty` เป็น `true`

และเนื่องจาก `Alert` ผูกอยู่กับตัวแปรนี้ เมื่อมันกลายเป็น `true` ระบบก็จะแสดงกล่องเตือนขึ้นมาโดยอัตโนมัติ

เอฟเฟกต์การแสดงผล:

![alert](../../Resource/020_alert1.png)

ด้วยวิธีนี้ หลังจากผู้ใช้คลิกปุ่ม เขาจะเห็นข้อความได้ทันที และนักพัฒนาก็ไม่จำเป็นต้องไปตรวจดูผลลัพธ์ของ `print` ในคอนโซล

### ปรับปรุงปุ่มและกล่องเตือนให้สมบูรณ์ขึ้น

ก่อนหน้านี้ เราจัดการเฉพาะกรณีที่ “ไม่ได้กรอกอะไรเลย”

เรายังต้องจัดการกับสถานการณ์ต่อไปนี้:

- ไม่ได้กรอกชื่อผู้ใช้
- ไม่ได้กรอกรหัสผ่าน
- กรอกทั้งชื่อผู้ใช้และรหัสผ่านแล้ว แต่ข้อมูลไม่ถูกต้อง

ดังนั้น เราจึงต้องเตรียมข้อความที่สอดคล้องกับแต่ละกรณีด้วย

ก่อนอื่น เพิ่มตัวแปรใหม่สามตัว:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

จากนั้นเพิ่ม `Alert` ที่สอดคล้องกันต่อท้ายปุ่ม:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

จากนั้นทำให้ตรรกะการตัดสินใจภายในปุ่มสมบูรณ์:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

เมื่อปุ่มตรวจพบว่าผู้ใช้ไม่ได้กรอกข้อมูลใด ๆ, เว้นข้อมูลบางส่วนไว้ หรือการตรวจสอบข้อมูลล้มเหลว มันจะเปลี่ยนตัวแปร Boolean ที่เกี่ยวข้องให้เป็น `true` แล้ว `Alert` ที่เกี่ยวข้องก็จะปรากฏขึ้น

ตรงนี้ฉันแนะนำให้คุณลองทดสอบหลาย ๆ สถานการณ์ด้วยตัวเอง:

- ไม่กรอกอะไรเลย
- กรอกเฉพาะชื่อผู้ใช้
- กรอกเฉพาะรหัสผ่าน
- กรอกทั้งชื่อผู้ใช้และรหัสผ่าน แต่เนื้อหาไม่ถูกต้อง
- กรอกทั้งชื่อผู้ใช้และรหัสผ่าน และเนื้อหาถูกต้อง

สิ่งนี้ช่วยตรวจสอบว่าโค้ดของเรามีปัญหาหรือไม่ และยังเป็นขั้นตอน “การทดสอบ” ที่สำคัญมากในการพัฒนาแอปอีกด้วย

หากโปรแกรมแสดงพฤติกรรมไม่ถูกต้องในสถานการณ์ใดสถานการณ์หนึ่ง นั่นหมายความว่าอาจมีปัญหาอยู่ในตรรกะ และมี `Bug` เกิดขึ้นในโปรแกรม

สิ่งที่นักพัฒนามักเรียกว่า `Bug` หมายถึงข้อผิดพลาด จุดบกพร่อง หรือพฤติกรรมที่ไม่ตรงตามความคาดหวัง

## ทำมุมมองเข้าสู่ระบบให้เสร็จสมบูรณ์

ตัวอย่าง `Alert` ที่เราได้พูดถึงก่อนหน้านี้ ล้วนเกี่ยวกับวิธีให้ข้อความตอบกลับแก่ผู้ใช้เมื่อ “ข้อมูลที่ป้อนผิด”

เมื่อผู้ใช้ป้อนชื่อผู้ใช้และรหัสผ่านที่ถูกต้อง โดยปกติเราจะไม่แสดง “กล่องเตือน” แต่จะเข้าสู่หน้าจอหลังการเข้าสู่ระบบโดยตรง

สิ่งนี้เกี่ยวข้องกับแนวคิดที่สำคัญมากอย่างหนึ่ง: **การแสดงมุมมองที่แตกต่างกันตามค่าของตัวแปร**

ตัวอย่างเช่น:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

ที่นี่เราใช้ชนิด `Bool` เพื่อจัดการว่าควรแสดงมุมมองใด:

- ถ้า `login` เป็น `true` หมายความว่าการเข้าสู่ระบบสำเร็จแล้ว และจะแสดงเนื้อหาหลังการเข้าสู่ระบบ
- ถ้า `login` เป็น `false` หมายความว่ายังเข้าสู่ระบบไม่สำเร็จ และยังคงแสดงหน้าจอเข้าสู่ระบบต่อไป

แม้ว่า `if` จะเป็นคำสั่งเงื่อนไขใน Swift แต่ภายใน `body` ของ SwiftUI มันสามารถใช้เพื่อควบคุมตรรกะการแสดงผลของมุมมองได้

นั่นหมายความว่า SwiftUI จะตัดสินว่าขณะนี้ควรแสดงมุมมองใดตามผลลัพธ์ของเงื่อนไข

เราสามารถวางตรรกะการแสดงผลนี้ไว้ใน `ContentView` ปัจจุบันได้:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// โค้ดของมุมมองเข้าสู่ระบบเดิม
		}
	}
}
```

ที่นี่เราได้เพิ่มตัวแปรใหม่ชื่อ `login` เพื่อใช้บอกว่าผู้ใช้เข้าสู่ระบบสำเร็จแล้วหรือยัง

จากนั้น เราก็นำโค้ดของมุมมองเข้าสู่ระบบที่เขียนไว้ก่อนหน้านี้ไปวางไว้หลังคำสั่ง `else`

ตรรกะการแสดงผลของมุมมอง:

- เมื่อ `login` เป็น `false` หมายความว่ายังเข้าสู่ระบบไม่สำเร็จ ดังนั้นมุมมองเข้าสู่ระบบเดิมจะยังคงถูกแสดงต่อไป
- เมื่อ `login` เป็น `true` หมายความว่าการเข้าสู่ระบบสำเร็จ ในเวลานี้ มุมมองเข้าสู่ระบบจะไม่ถูกแสดงอีกต่อไป และจะแสดง `Login successful` แทน

นั่นหมายความว่า `ContentView` จะแสดงเนื้อหามุมมองที่แตกต่างกันตามค่าของ `login`

ต่อไป เรามาแก้ไขตรรกะการเข้าสู่ระบบสำเร็จภายในปุ่ม:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

เมื่อชื่อผู้ใช้และรหัสผ่านที่ผู้ใช้ป้อนถูกต้องทั้งคู่ เราก็ตั้งค่า `login` เป็น `true`

ทันทีที่ค่าของ `login` เปลี่ยนไป ผลลัพธ์ของการตรวจสอบ `if` ใน `ContentView` ก็จะเปลี่ยนไปด้วย และหน้าจอก็จะสลับจากมุมมองเข้าสู่ระบบเดิมไปเป็น `Login successful`

เอฟเฟกต์การแสดงผลมีดังนี้:

![view](../../Resource/020_view.png)

ตอนนี้เราได้นำแนวคิด “การแสดงมุมมองที่แตกต่างกันตามเงื่อนไข” มาประยุกต์ใช้กับหน้าการเข้าสู่ระบบนี้อย่างแท้จริงแล้ว

ในแอปจริงก็มักจะใช้วิธีนี้เช่นกัน คือแสดงมุมมองที่แตกต่างกันตามค่าบางอย่าง

ตัวอย่างเช่น เมื่อผู้ใช้ยังไม่ได้เข้าสู่ระบบ ก็จะแสดงหน้าล็อกอิน เมื่อผู้ใช้เข้าสู่ระบบสำเร็จแล้ว ก็จะแสดงอีกหน้าจอหนึ่ง

แนวคิดหลักก็คือ: **ใช้การเปลี่ยนแปลงของตัวแปรเพื่อควบคุมว่าหน้าจอจะแสดงเนื้อหาอะไร**

## สรุป

ในบทเรียนนี้ เราได้เรียนรู้สามเรื่องสำคัญ:

1. ใช้ `SecureField` สำหรับป้อนรหัสผ่าน เพื่อไม่ให้เนื้อหารหัสผ่านถูกแสดงโดยตรงบนหน้าจอ
2. ใช้ `Alert` เพื่อแสดงข้อความแจ้งให้ผู้ใช้เห็น แทนที่จะพิมพ์ออกไปเฉพาะในคอนโซล
3. ใช้ตัวแปรและเงื่อนไข `if` เพื่อควบคุมการแสดงผลของมุมมองต่าง ๆ ทำให้สามารถสลับระหว่างหน้าจอก่อนเข้าสู่ระบบและหลังเข้าสู่ระบบได้

ด้วยความรู้เหล่านี้ ตอนนี้เราสามารถสร้างมุมมองเข้าสู่ระบบที่มีปฏิสัมพันธ์พื้นฐานได้สำเร็จ และยังเข้าใจแนวคิดการพัฒนาใน SwiftUI ที่ว่า “เมื่อสถานะเปลี่ยน หน้าจอก็อัปเดต” ได้ดียิ่งขึ้น

## โค้ดเต็ม

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
            VStack {
                Image("019_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Sign in to App")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Username")
                        .fontWeight(.bold)
                    TextField("input user", text: $user)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                HStack {
                    Text("Password")
                        .fontWeight(.bold)
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## ความรู้เพิ่มเติม - Alert ที่มีหลายปุ่ม

ในช่วงก่อนหน้าของบทเรียนนี้ เราใช้ `Alert` แบบพื้นฐานที่สุด ซึ่งมีเพียงปุ่มเดียว และส่วนใหญ่ใช้เพื่อแจ้งเตือนผู้ใช้

จริง ๆ แล้ว `Alert` ยังสามารถมีหลายปุ่มได้ เพื่อให้ผู้ใช้เลือกการกระทำที่แตกต่างกัน

ตัวอย่างเช่น:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

หลังจากคลิกปุ่มแล้ว จะมีกล่องข้อความที่มีตัวเลือกสามตัวคือ `Ok`, `delete` และ `cancel` ปรากฏขึ้น

เอฟเฟกต์การแสดงผล:

![alert](../../Resource/020_alert2.png)

เมื่อคลิกปุ่มที่แตกต่างกัน ก็จะทำงานตามโค้ดที่เกี่ยวข้อง

### คุณสมบัติ `role` ของ Button

ที่นี่คุณจะสังเกตได้ว่า `Button` ภายใน `Alert` แตกต่างจากรูปแบบปุ่มทั่วไปที่เราเรียนมาก่อนเล็กน้อย:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

ที่นี่มีพารามิเตอร์เพิ่มเติมชื่อ `role`

ใน SwiftUI, `role` ใช้เพื่อบอกระบบว่าปุ่มนี้เป็นการกระทำประเภทใด

บทบาทที่พบบ่อยมีดังนี้:

- `.cancel`: การกระทำแบบยกเลิก
- `.destructive`: การกระทำที่มีความเสี่ยง เช่น การลบ
- `nil`: การกระทำทั่วไป

ค่า `role` ที่แตกต่างกันมักจะทำให้รูปแบบการแสดงผลในหน้าจอแตกต่างกันด้วย

ตัวอย่างเช่น การกระทำที่มีความเสี่ยงมักจะแสดงด้วยรูปแบบที่เด่นชัดกว่า เพื่อเตือนผู้ใช้ให้กดอย่างระมัดระวัง

นอกจากนี้ `role` ยังให้ข้อมูลเชิงความหมายเพิ่มเติมกับปุ่ม ทำให้โปรแกรมอ่านหน้าจอ เช่น VoiceOver บนอุปกรณ์ Apple สามารถอธิบายหน้าที่ของปุ่มให้ผู้ใช้เข้าใจได้ง่ายขึ้น

ดังนั้น ในสถานการณ์ที่เหมาะสม การเพิ่ม `role` ให้กับปุ่มจึงเป็นนิสัยที่ดีมาก
