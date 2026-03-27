# Bắt đầu làm việc với Nút bấm (Button)

Bài học này chủ yếu tìm hiểu về nút bấm Button, lệnh in thông tin gỡ lỗi print và các hàm (function) trong Swift.

Những nội dung này là nền tảng của lập trình tương tác trong SwiftUI.

## Nút bấm (Button)

Nút bấm là điều khiển UI (Giao diện người dùng) phổ biến nhất của chúng ta, khi cần thực hiện các thao tác như tải xuống, mở hoặc thoát, chúng ta thường sẽ nhấp vào nút bấm.

Ví dụ trong App Store, nhấp vào nút "Nhận" để tải App.

![Button](../../RESOURCE/008_button.png)

Trong SwiftUI, nút bấm được biểu diễn bằng Button.

Cách sử dụng cơ bản:

```swift
Button("") {
    
}
```

Cấu trúc có thể chia thành hai phần:

```swift
Button("Chữ trên nút") {
    Mã được thực thi khi nhấp vào nút
}
```

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Sau khi chạy sẽ hiển thị một nút Start.

![Button](../../RESOURCE/008_button1.png)

Khi người dùng nhấp vào nút, mã bên trong {} sẽ được thực thi.

Cần lưu ý rằng: Button thuộc về điều khiển giao diện (View) của SwiftUI, do đó bắt buộc phải được viết bên trong body.

### Bộ điều chỉnh buttonStyle

Trong SwiftUI, Button cung cấp các kiểu dáng nút được tích hợp sẵn trong hệ thống, có thể sử dụng thông qua bộ điều chỉnh buttonStyle.

Ví dụ:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle sẽ sử dụng kiểu dáng nút do hệ thống cung cấp.

Các tùy chọn phổ biến bao gồm:

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

Sự khác biệt giữa các kiểu dáng chủ yếu thể hiện ở việc nút bấm có viền, có nền hay không và mức độ nhấn mạnh về mặt thị giác.

## Lệnh in (print)

Trong lập trình, chúng ta thường cần kiểm tra xem chương trình có chạy đến một đoạn mã nào đó hay không.

Swift cung cấp hàm print dùng để xuất thông tin gỡ lỗi.

Cách viết cơ bản:

```swift
print("Hello")
```

Dòng mã này sẽ xuất văn bản ra Console (Bảng điều khiển).

### Kiểm tra tính khả dụng của nút bấm

Chúng ta có thể viết lệnh print bên trong nút bấm, dùng để kiểm tra xem nút bấm có được nhấp hay không.

```swift
Button("Start") {
    print("Test 123")
}
```

Khi nhấp vào nút, Console sẽ xuất ra:

```
Test 123
```

Điều này chứng tỏ nút bấm đã được kích hoạt thành công.

![Button](../../RESOURCE/008_button3.png)

Chú ý: print là mã Swift, không phải là điều khiển giao diện. Nó không thể đặt trực tiếp bên trong body, nếu không sẽ báo lỗi.

Ví dụ, viết như dưới đây là sai:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Lỗi: body bắt buộc phải trả về một View
    }
}
```

Trong SwiftUI, body được dùng để mô tả cấu trúc giao diện, chỉ có thể đặt các điều khiển giao diện (View), ví dụ như Text, Button, Image, v.v.

Các mã thông thường (logic tính toán, print, v.v.) bắt buộc phải đặt trong nút bấm, hàm hoặc các trình xử lý sự kiện khác.

### Bảng điều khiển (Console)

Nội dung mà print xuất ra sẽ hiển thị trong Console (Bảng điều khiển) của Xcode.

Nếu không nhìn thấy Console, bạn có thể nhấp vào nút Show the Debug Area ở góc dưới bên phải để mở khu vực gỡ lỗi, sau đó nhấp vào nút Show the Console để hiển thị bảng điều khiển.

![](../../RESOURCE/008_button4.png)

Ở góc dưới bên trái của Console có hai thẻ (tab): Executable và Previews.

![](../../RESOURCE/008_button5.png)

Hai thẻ này tương ứng với các môi trường chạy khác nhau: khi xem trước giao diện trên Canvas, kết quả xuất ra của lệnh print sẽ hiển thị ở thẻ Previews; nếu chạy ứng dụng trên trình giả lập hoặc thiết bị thực, kết quả xuất ra sẽ hiển thị ở thẻ Executable.

Do đó, khi bạn nhận thấy lệnh print không xuất ra gì, trước tiên hãy kiểm tra xem mình đã chọn đúng thẻ hay chưa.

## Ví dụ - Tranh ký tự ASCII

Trong một số dự án lập trình, chúng ta thường thấy tranh ký tự ASCII.

Tranh ký tự là những hình ảnh được ghép từ các ký tự thông thường, ví dụ:

![ASCII](../../RESOURCE/008_ascii.png)

Chúng ta có thể sử dụng nút bấm + lệnh print để xuất ra một bức tranh ký tự ASCII.

Mã mẫu:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Khi nhấp vào nút, Console sẽ xuất ra:

```
 /\_/\
( o.o )
 > ^ <
```

Chú ý: Ký tự \ trong chuỗi phải được viết thành \\, bởi vì dấu gạch chéo ngược là ký tự thoát (escape character) trong chuỗi.

## Hàm (Function)

Bên trong nút bấm, chúng ta có thể trực tiếp viết mã.

Ví dụ:

```swift
Button("Start") {
    print("Hello")
}
```

Nếu lượng mã ít thì viết như vậy không có vấn đề gì. Nhưng trong quá trình phát triển thực tế, logic được kích hoạt bởi một nút bấm có thể rất nhiều.

Ví dụ:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Có thể còn rất nhiều mã nữa
}
```

Nếu lượng mã ngày càng nhiều, việc viết trực tiếp bên trong nút sẽ làm cho mã giao diện trở nên rất lộn xộn, đồng thời cũng không thuận tiện cho việc đọc hiểu và bảo trì.

Do đó, chúng ta thường sẽ gom những đoạn mã này vào một hàm, sau đó gọi hàm đó bên trong nút bấm.

### Hàm là gì

Hàm là một đoạn mã có thể được sử dụng lại nhiều lần.

Khi một số đoạn mã cần được thực thi, chúng ta chỉ cần gọi hàm này là có thể chạy đoạn mã bên trong hàm đó.

Điều này có thể làm cho cấu trúc mã rõ ràng hơn, đồng thời cũng thuận tiện cho việc tái sử dụng.

### Cách viết cơ bản

Trong Swift, hàm được định nghĩa bằng từ khóa **func**:

```swift
func randomInt() {
    // code
}
```

Đoạn mã này đã định nghĩa một hàm.

randomInt là tên hàm, dùng để định danh đoạn mã này.

() biểu thị vị trí của tham số, có thể nhận dữ liệu được truyền từ bên ngoài vào tại đây. Nếu không cần dữ liệu, có thể để trống.

Bên trong {} là khu vực chứa mã của hàm, tất cả các mã cần thực thi đều được viết ở đây.

Ví dụ:

```swift
func getName() {
    print("FangJunyu")
}
```

Tác dụng của hàm này là xuất ra một đoạn văn bản.

### Gọi hàm

Định nghĩa hàm mới chỉ là tạo ra đoạn mã đó, nếu muốn thực thi nó, còn cần phải gọi hàm.

Cách gọi là thêm () vào sau tên hàm:

```swift
getName()
```

Khi chương trình chạy đến dòng mã này, nó sẽ thực thi đoạn mã bên trong hàm getName.

Ví dụ hoàn chỉnh:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Sau khi chạy, Console sẽ xuất ra:

```
FangJunyu
```

### Sử dụng hàm trong SwiftUI

Trong khung nhìn SwiftUI, hàm thường được viết bên ngoài body.

Ví dụ:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Khi nhấp vào nút, hàm getName() sẽ được gọi.

Cách này có thể giữ cho mã giao diện được ngắn gọn, còn logic cụ thể sẽ được đặt trong hàm để xử lý.

### Tham số của hàm

Đôi khi, một hàm cần thực hiện các thao tác khác nhau dựa trên những dữ liệu khác nhau.

Ví dụ, chúng ta muốn hàm có thể xuất ra những cái tên khác nhau, thay vì chỉ xuất ra tên cố định "FangJunyu".

Lúc này có thể sử dụng tham số, tham số có thể được hiểu là: dữ liệu được truyền vào khi gọi hàm.

Ví dụ:

```swift
func getName(name: String) {
    print(name)
}
```

Hàm này đã thêm một tham số, name là tên tham số, String là kiểu tham số. 

Điều này biểu thị rằng hàm cần nhận một dữ liệu kiểu String.

Vì hàm hiện tại cần dữ liệu, nên bắt buộc phải cung cấp dữ liệu này khi gọi hàm.

```swift
getName(name: "Sam")
```

Khi gọi hàm và truyền vào "Sam", bên trong hàm sẽ sử dụng giá trị này để xuất ra.

Kết quả khi chạy:

```
Sam
```

## Ví dụ - Sử dụng hàm để xuất tranh ký tự ASCII

Trong ví dụ trước, chúng ta đã viết trực tiếp lệnh print bên trong nút bấm.

Nhưng nếu bức tranh ký tự khá phức tạp, đoạn mã sẽ trở nên rất dài. Lúc này, có thể đưa logic vào trong hàm, giúp mã giao diện trở nên rõ ràng hơn.

Mã mẫu:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Sau khi chạy và nhấp vào nút, Console sẽ xuất ra:

```
 /\_/\
( o.o )
 > ^ <
```

Ở đây đã xảy ra hai sự việc, sau khi người dùng nhấp vào nút:

1. Nút bấm gọi hàm printCat()
2. Đoạn mã print bên trong hàm được thực thi

Cách này có thể giúp mã giao diện chỉ chịu trách nhiệm kích hoạt sự kiện, còn logic cụ thể sẽ được đặt trong hàm để xử lý.

Trong quá trình phát triển thực tế, phần lớn các thao tác của nút bấm đều sẽ được thực hiện thông qua hàm.

## Tổng kết

Bài học này đã tìm hiểu ba nội dung quan trọng:

**1. Nút bấm Button**

Button là điều khiển dùng để kích hoạt thao tác trong SwiftUI.

```swift
Button("Start") {

}
```

Khi người dùng nhấp vào nút, đoạn mã trong dấu ngoặc nhọn sẽ được thực thi.

**2. Lệnh in print**

print dùng để xuất thông tin gỡ lỗi ra Console.

```swift
print("Hello")
```

Nhà phát triển có thể kiểm tra trạng thái chạy của chương trình thông qua Console.

**3. Hàm (Function)**

Hàm là một đoạn mã có thể được sử dụng lại nhiều lần.

```swift
func sayHello() {
    print("Hello")
}
```

Gọi hàm:

```swift
sayHello()
```

Nếu hàm cần dữ liệu, có thể sử dụng Tham số:

```swift
func sayHello(name: String) {
    print(name)
}
```

Trong các bài học tiếp theo, chúng ta sẽ tiếp tục tìm hiểu thêm về các điều khiển trong SwiftUI cũng như cách dữ liệu tương tác với giao diện.

## Bài tập

Hãy thử hoàn thành các bài tập dưới đây:

1. Tạo một nút bấm, chữ trên nút là "Hello"
2. Khi nhấp vào nút, xuất ra chữ Hello Swift trên Console
3. Viết đoạn mã xuất dữ liệu vào trong một hàm, sau đó gọi hàm này bên trong nút bấm