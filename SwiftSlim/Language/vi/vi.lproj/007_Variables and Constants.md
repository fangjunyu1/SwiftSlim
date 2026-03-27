# Biến và Hằng số

Bài học này chủ yếu tìm hiểu về biến và hằng số trong Swift, đồng thời làm quen với một số kiểu dữ liệu và toán tử cơ bản thường dùng.

Những nội dung này là kiến thức nền tảng nhất trong lập trình, cũng là cơ sở quan trọng cho việc học SwiftUI sau này.

## Biến và hằng số trong đời sống

Chúng ta có thể hiểu về biến và hằng số thông qua các sự vật trong đời sống.

Biến trong đời sống:

- Nội dung phát sóng của mỗi chương trình trên tivi là khác nhau
- Thời tiết mỗi ngày đều không giống nhau
- Đồng hồ thay đổi theo từng giây

Đặc điểm chung của những sự vật này là: chúng sẽ xảy ra sự thay đổi.

Nếu tivi mãi mãi chỉ có một khung hình, thời tiết lúc nào cũng nắng đẹp, kim đồng hồ không bao giờ nhúc nhích, thì những sự vật này chính là hằng số.

Một cái có khả năng thay đổi, một cái không bao giờ thay đổi.

## Hiểu về biến và hằng số

Trong quá trình phát triển App, thường yêu cầu người dùng điền hoặc lưu trữ một số thông tin.

Ví dụ:

- Tên tài khoản
- Ngày sinh
- Thông tin liên hệ
- Địa chỉ

Những thông tin này sẽ được lưu lại và hiển thị ra.

Ví dụ, người dùng nhập một cái tên trong App:

```
FangJunyu
```

Chúng ta cần lưu trữ cái tên này lại để có thể hiển thị trong App.

Có thể hiểu đơn giản quá trình lưu trữ này giống như: Cất đồ vật vào trong một ngăn kéo.

Khi chúng ta lưu cái tên, cũng giống như việc đặt cái tên vào trong một ngăn kéo.

Có thể có rất nhiều thứ cần lưu trữ, và cũng sẽ có rất nhiều ngăn kéo. Để biết trong mỗi ngăn kéo chứa cái gì, chúng ta cần đặt tên cho từng ngăn kéo.

Ví dụ:

```
name
```

Trong ví dụ này, name là tên của ngăn kéo, còn FangJunyu là thông tin được lưu trữ.

![Var](../../RESOURCE/007_var.png)

**Trong Swift, nếu cần lưu trữ dữ liệu, bắt buộc phải sử dụng biến (var) hoặc hằng số (let) để khai báo.**

Vì tên thường có thể sửa đổi được, do đó chúng ta nên sử dụng biến.

```swift
var name = "FangJunyu"
```

Ở đây đã khai báo một biến có tên là name, kiểu của biến là String, giá trị là "FangJunyu".

### Sự khác biệt giữa biến và hằng số

Biến được khai báo bằng var:

```swift
var
```

Hằng số được khai báo bằng let:

```swift
let
```

Ví dụ:

```swift
var name = "FangJunyu"
let id = 123456
```

Nếu được khai báo là biến, điều đó biểu thị giá trị này có thể được sửa đổi; nếu được khai báo là hằng số, thì sẽ không thể sửa đổi được nữa.

Do đó, sự khác biệt chính giữa biến và hằng số nằm ở: Giá trị có được phép thay đổi hay không.

### Sửa đổi hằng số

Nếu mã nguồn cố gắng sửa đổi giá trị của hằng số:

```swift
let name = "Sam"
name = "Bob"
```

Swift sẽ thông báo không thể hoàn thành việc gán giá trị, bởi vì nó là một hằng số.

```
Cannot assign to property: 'name' is a 'let' constant
```

Cơ chế này có thể giúp nhà phát triển tránh việc một số dữ liệu quan trọng bị sửa đổi ngoài ý muốn.

### Hiển thị trong SwiftUI

Mở tệp ContentView.swift, khai báo biến bên trong View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Ở đây đã khai báo một biến có tên là name, và hiển thị nó lên giao diện thông qua Text.

Nếu chúng ta sửa đổi nội dung của biến:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Nội dung văn bản mà Text hiển thị cũng sẽ thay đổi theo.

Thông qua cách này, chúng ta có thể sử dụng biến để kiểm soát nội dung hiển thị trên giao diện, mà không cần mỗi lần phải sửa đổi trực tiếp văn bản bên trong Text.

Nếu những nơi khác cần lấy thông tin này, chúng ta cũng có thể truyền biến đó đi, tương đương với việc giao nội dung trong "ngăn kéo" cho những nơi khác sử dụng.

### Vị trí của biến và hằng số trong SwiftUI

Trong SwiftUI, biến và hằng số thường được viết bên ngoài body:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tất nhiên, cũng có thể viết biến và hằng số bên trong body:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Tuy nhiên có một sự khác biệt quan trọng giữa hai cách này:

- Nếu biến và hằng số được viết bên trong body, mỗi khi khung nhìn tính toán lại, biến này sẽ được tạo lại.
- Nếu được viết bên ngoài body, biến sẽ tồn tại như một thuộc tính của cấu trúc khung nhìn, cấu trúc mã nguồn sẽ rõ ràng hơn.

Do đó, trong quá trình phát triển thực tế, người ta thường viết biến và hằng số bên ngoài body.

## Kiểu dữ liệu

Biến có thể lưu trữ rất nhiều loại dữ liệu khác nhau, các loại này được gọi là kiểu dữ liệu.

Ví dụ, trước đây chúng ta đã sử dụng Text để hiển thị văn bản:

```swift
Text("Hello, World")
```

Ở đây "Hello, World" thuộc kiểu chuỗi ký tự (String).

Chuỗi ký tự được sử dụng để biểu thị nội dung văn bản, trong Swift cần phải được bọc trong cặp dấu ngoặc kép "".

Ví dụ:

```swift
var hello = "Hello, World"
```

Ngoài chuỗi ký tự, trong Swift còn có rất nhiều kiểu dữ liệu.

Bốn kiểu thường gặp nhất ở giai đoạn mới học là:

- String
- Int
- Double
- Bool

Bốn kiểu này có thể hoàn thành phần lớn các công việc xử lý dữ liệu cơ bản.

**String**

String biểu thị nội dung văn bản, ví dụ:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Chuỗi ký tự thường được dùng để biểu thị: Tên người dùng, tiêu đề, nội dung văn bản.

**Int**

Int biểu thị số nguyên, tức là số nguyên không có phần thập phân.

Ví dụ:

```swift
var age = 26
var count = 100
```

Số nguyên thường được dùng để biểu thị: Tuổi tác, số lượng, đếm số.

**Double**

Double biểu thị số có chứa phần thập phân.

Ví dụ:

```swift
var weight = 74.5
var height = 185.0
```

Trong Swift, số thập phân thường mặc định sử dụng kiểu Double.

Còn một kiểu tương tự tên là Float, nhưng phạm vi giá trị mà nó có thể biểu diễn nhỏ hơn, do đó trong phát triển thực tế Double được sử dụng phổ biến hơn.

**Bool**

Kiểu Bool dùng để biểu thị hai trạng thái: true (đúng) và false (sai).

Ví dụ:

```swift
var isShowAlert = true
var isLogin = false
```

Kiểu Bool thường được dùng cho việc phán đoán điều kiện. Ví dụ, có hiển thị hộp thoại thông báo hay không.

Đối với những trường hợp chỉ có hai kết quả, việc sử dụng kiểu Bool để biểu diễn là rất phù hợp.

### Hiển thị trong SwiftUI

Khi chúng ta hiển thị kiểu String, có thể sử dụng trực tiếp Text:

```swift
Text(name)
```

Nhưng các kiểu như Int, Double không phải là chuỗi ký tự, do đó không thể trực tiếp dùng làm một phần của nội dung văn bản.

Nếu cần hiển thị những dữ liệu này trong Text, có thể sử dụng phép nội suy chuỗi (String Interpolation):

```swift
\()
```

Phép nội suy chuỗi cần được viết bên trong nội dung chuỗi ký tự, và sử dụng \() để bọc biến hoặc hằng số.

Ví dụ:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Trong đoạn mã trên, "" biểu thị chuỗi ký tự, \() được dùng để chèn biến hoặc hằng số vào trong chuỗi.

Ví dụ:

```swift
"DoubleNum: \(num * 2)"
```

Nội dung hiển thị sẽ là:

```swift
DoubleNum: 2
```

Thông qua cách này, chúng ta có thể chèn các biến hoặc hằng số vào trong chuỗi ký tự, sau đó sử dụng Text để hiển thị chúng lên giao diện.

Mẹo: \() chỉ có thể được sử dụng bên trong chuỗi ký tự "".

## Toán tử

Khi khai báo biến hoặc hằng số, chúng ta có thể thấy cách viết dưới đây:

```swift
var num = 1
```

Dấu = ở đây được gọi là toán tử gán.

Tác dụng của nó là: Gán giá trị ở bên phải cho biến ở bên trái.

Trong ví dụ này, 1 được gán cho biến num.

Ngoài toán tử gán, còn có một số toán tử số học phổ biến:

- `+`
- `-`
- `*`
- `/`

Khi chúng ta thực hiện tính toán với các con số, ví dụ như dữ liệu kiểu Int hoặc Double, sẽ sử dụng đến các toán tử này.

Ví dụ:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Sau khi hoàn thành tính toán, kết quả sẽ được lưu vào biến.

## Tổng kết

Biến, hằng số và toán tử là những khái niệm cơ bản nhất trong lập trình.

Thông qua biến và hằng số, chúng ta có thể lưu trữ các loại dữ liệu khác nhau trong chương trình; thông qua kiểu dữ liệu, có thể làm rõ chủng loại của dữ liệu; thông qua toán tử, có thể tiến hành tính toán và xử lý dữ liệu.

Những kiến thức này giống như những công cụ nền tảng của thế giới lập trình. Việc nắm vững những nội dung này có thể tạo nền tảng vững chắc cho việc học Swift và SwiftUI sau này.