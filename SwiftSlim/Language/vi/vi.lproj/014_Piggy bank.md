# Heo Đất

Trong bài học này, chúng ta sẽ phát triển một dự án "heo đất" đơn giản, chức năng đơn giản, bao gồm logic tương tác hoàn chỉnh, rất phù hợp cho người mới bắt đầu.

Thông qua dự án này, chúng ta sẽ học về TextField (ô nhập liệu) và border đường viền, đồng thời tìm hiểu về ràng buộc dữ liệu (`$`).

Mục tiêu cuối cùng là thực hiện một dự án "heo đất" có thể nhập số tiền, nhấn nút lưu và tích lũy tổng số tiền.

Kết quả thực hiện:

![Piggy Bank](../../RESOURCE/014_view.png)

## Hiển Thị Tổng Số Tiền

Đầu tiên, chúng ta cần hiển thị tổng số tiền của "heo đất" trong view.

Trong `ContentView`, khai báo một biến để lưu tổng số tiền của "heo đất".

```swift
@State private var amount = 0
```

Tiếp theo, dùng `Text` để hiển thị số tiền này:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Ở đây, dùng `.font` và `.fontWeight` để đặt kích thước và độ đậm của font chữ.

```swift
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

Khi `amount` thay đổi, tổng số tiền hiển thị trong `Text` cũng sẽ tự động làm mới.

## Nhập Số Tiền

"Heo đất" ngoài việc hiển thị tổng số tiền, còn cần cho phép người dùng "nhập" số tiền gửi vào, điều này cần dùng đến control view `TextField` của SwiftUI.

### TextField

`TextField` là control view trong SwiftUI dùng để nhập nội dung, thường dùng cho nhập liệu một dòng.

`TextField` chủ yếu cung cấp hai định dạng ràng buộc:

**1. Ràng buộc kiểu chuỗi (String)**

```swift
TextField("Placeholder", text: $text)
```

Phù hợp cho nội dung nhập văn bản như tên, tiêu đề, v.v.

**2. Ràng buộc kiểu số (Int/Double)**

```swift
TextField("Amount", value: $number, format: .number)
```

Phù hợp cho nội dung nhập số như tuổi, lương, số tiền, v.v.

`format: .number` có nghĩa là ô nhập này sẽ phân tích và hiển thị theo "định dạng số".

#### Văn Bản Gợi Ý

Tham số đầu tiên của `TextField` là văn bản gợi ý (Placeholder), dùng để nhắc nhở người dùng nhập nội dung:

```swift
TextField("input your name", text: $text)
```

Khi ô nhập trống, sẽ hiển thị một đoạn văn bản gợi ý màu xám.

![textfield](../../RESOURCE/014_textfield.png)

#### Ràng Buộc Dữ Liệu

`TextField` không chịu trách nhiệm lưu trữ nội dung nhập, cần quản lý dữ liệu thông qua ràng buộc biến.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Nội dung người dùng nhập sẽ được lưu trực tiếp vào biến `text`, `TextField` chỉ chịu trách nhiệm giao diện nhập liệu.

`$` biểu diễn ràng buộc (Binding):

```swift
$text
```

Đây không phải biến thông thường, mà là một kiểu `Binding`.

Vai trò của nó là thiết lập kết nối giữa view và dữ liệu:

Khi người dùng nhập nội dung vào `TextField`, `text` sẽ tự động cập nhật; khi `text` thay đổi, `TextField` cũng sẽ đồng bộ cập nhật.

Ví dụ:

```swift
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

Nhập nội dung vào `TextField`, `Text` phía trên sẽ đồng bộ hiển thị theo thời gian thực.

![textField](../../RESOURCE/014_textfield1.png)

### Ràng Buộc Kiểu Số

Khi cần nhập số, cần ràng buộc biến có kiểu tương ứng:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Khi người dùng nhập số tiền, `TextField` sẽ phân tích nội dung nhập và tự động cập nhật giá trị của `number`.

## Thêm Ô Nhập Liệu

Sau khi hiểu cách dùng cơ bản của `TextField`, chúng ta áp dụng nó vào dự án "heo đất".

"Heo đất" cần nhập "số tiền", vì vậy chúng ta dùng cách "ràng buộc kiểu số (Int/Double)", và thêm biến `number` để lưu số tiền người dùng nhập:

```swift
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

Bây giờ, `TextField` mặc định hiển thị giá trị của `number` (mặc định là 0).

Khi xóa nội dung nhập, sẽ hiển thị văn bản gợi ý "Amount".

Điều này cũng một lần nữa cho thấy, `TextField` hiển thị giá trị của biến ràng buộc, chứ không phải tự lưu nội dung.

### Vấn Đề Kích Thước Ô Nhập

Trong view hiện tại, chúng ta sẽ thấy `TextField` không có đường viền, chỉ hiển thị một số 0, nội dung trông như là căn trái.

Kết quả như sau:

![textfield](../../RESOURCE/014_textfield2.png)

Điều này là vì `TextField` mặc định sẽ chiếm toàn bộ chiều rộng của view cha.

Chúng ta có thể thêm màu nền để xác nhận điều này:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Kết quả như sau:

![textfield](../../RESOURCE/014_textfield3.png)

Có thể thấy `TextField` thực tế đã lấp đầy toàn bộ chiều rộng dòng.

### Đặt Chiều Rộng Cố Định

Nếu muốn ô nhập gọn hơn, có thể dùng `frame` để giới hạn chiều rộng:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Kết quả như sau:

![textfield](../../RESOURCE/014_textfield4.png)

### Thêm Đường Viền và Padding Bên Trong

Vì `TextField` mặc định không có đường viền, chúng ta có thể thêm style thủ công:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Bây giờ, ô nhập này trông giống một "ô nhập chuẩn" hơn.

![textfield](../../RESOURCE/014_textfield5.png)

## Đường Viền

Trong SwiftUI, `border` dùng để thêm đường viền cho view.

Cách dùng cơ bản:

```swift
border(Color.black, width: 1)
```

Trong đó, `Color.black` biểu diễn màu đường viền, `width` biểu diễn độ dày đường viền.

Trong `TextField`, chúng ta dùng:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Điều này có nghĩa là thêm đường viền màu đen, độ rộng 1 pt cho ô nhập.

Cũng có thể thử đổi sang màu khác như `Color.blue`, `Color.green`, hoặc làm dày đường viền `width: 2`.

## Nút Lưu Tiền

Bây giờ, chúng ta có biến `amount` để hiển thị tổng số tiền, một `TextField` để nhập số tiền, và biến `number` được ràng buộc với ô nhập.

Code hiện tại như sau:

```swift
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

### Thêm Nút Bấm

Tiếp theo, chúng ta cần thêm một nút để kích hoạt thao tác lưu tiền.

```swift
Button("Save") {
    
}
```

### Thực Hiện Logic Lưu Tiền

Chúng ta muốn thực hiện việc người dùng nhập số tiền, nhấn nút, số tiền sẽ tự động tích lũy vào tổng số tiền.

```swift
Button("Save") {
    amount += number
}
```

Ở đây dùng "toán tử gán kết hợp", cộng số tiền `number` người dùng nhập vào tổng số tiền `amount`.

### Đặt Lại Số Tiền Nhập

Bây giờ có một vấn đề: mỗi lần nhấn nút, số tiền trong ô nhập sẽ không bị xóa.

Khi người dùng nhập 10, nhấn lưu, ô nhập vẫn giữ 10, sẽ ảnh hưởng đến số tiền lưu lần nhập tiếp theo.

Điều này là vì `TextField` ràng buộc với `number`, khi nhấn nút chúng ta chỉ sửa đổi `amount`, `number` không thay đổi, nên ô nhập vẫn hiển thị giá trị cũ.

Chúng ta cần thêm logic xóa: khi nhấn nút, trước tiên cộng số tiền lưu, rồi đặt lại số tiền đã nhập:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Bây giờ, khi người dùng nhập số tiền và nhấn nút, số tiền nhập được cộng vào tổng số tiền. `number` được đặt lại về 0 để chuẩn bị cho lần nhập tiếp theo của người dùng.

Chúng ta đã thực hiện toàn bộ logic lưu tiền của "heo đất".

## Tối Ưu View

Sau khi hoàn thành chức năng, chúng ta có thể tối ưu giao diện đơn giản, thêm ảnh nền và style nút bấm.

Thêm style nút bấm:

```swift
.buttonStyle(.borderedProminent)
```

Thêm ảnh nền:

```swift
.background {
    Image("1")
}
```

Bây giờ, chúng ta đã hoàn thành toàn bộ công việc phát triển "heo đất".

## Code Hoàn Chỉnh

```swift
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

Kết quả thực hiện:

![Piggy Bank](../../RESOURCE/014_view.png)

Bây giờ, chúng ta có thể thử gửi vào 100 hoặc nhiều hơn, để kiểm tra logic "heo đất" có vấn đề không.

Hoặc chạy "heo đất" trên trình giả lập hoặc thiết bị thực, để trải nghiệm ứng dụng "heo đất" chúng ta đã phát triển.

### Đầu Ra Debug

Để xác minh logic có đúng không, chúng ta cũng có thể thêm logic debug vào nút bấm, để xác nhận số tiền nhập có đúng không:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Mỗi lần lưu tiền và nhấn nút, chúng ta có thể thấy đầu ra debug tương ứng, để kiểm tra logic code có vấn đề không.

```
---Saving---
amount:11
number:0
```