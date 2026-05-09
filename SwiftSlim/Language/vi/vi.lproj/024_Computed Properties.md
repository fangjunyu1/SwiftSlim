# Thuộc tính tính toán

Trong bài học này, chúng ta sẽ chủ yếu học về thuộc tính tính toán.

Thuộc tính tính toán được dùng để tính ra một kết quả mới dựa trên dữ liệu đã có. Nó có thể tính các giá trị số, cũng có thể tính nội dung cần hiển thị trong SwiftUI view.

Ví dụ:

```swift
let a = 10
let b = 20
let c = a + b
```

Ở đây, `c` là kết quả sau khi cộng `a` và `b`.

Trong code thông thường, cách viết này rất phổ biến.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Gợi ý: bên trong click event của `Button`, chúng ta có thể chạy code Swift thông thường.

Nhưng nếu viết code tương tự trực tiếp trong property của SwiftUI view, vấn đề sẽ xuất hiện.

Ví dụ:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Code này sẽ báo lỗi.

Nhìn qua thì có vẻ `a` và `b` đã được viết trước `c`, nên giá trị của `c` có vẻ có thể được tính ra.

Nhưng khi khai báo property trong struct, cách viết này không thể dùng trực tiếp.

## Tại sao không thể trực tiếp tính c bằng a + b?

Vì `a`, `b`, `c` không phải là các constant tạm thời bên trong click event của button. Chúng là các property của view `ContentView`.

Trong click event của button, code này có thể chạy bình thường:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Vì sau khi button được bấm, code sẽ chạy theo thứ tự. Đầu tiên tạo `a`, sau đó tạo `b`, cuối cùng dùng `a + b` để tính `c`.

Nhưng khi khai báo property bên trong view, tình huống lại khác:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Ở đây, `a`, `b`, `c` đều là property của view `ContentView`.

Khi view `ContentView` được tạo, Swift phải chuẩn bị các property này trước. Để quá trình tạo object an toàn, Swift không cho phép default value của một instance stored property đọc trực tiếp các instance property khác trong cùng một instance.

Vì vậy dòng này sẽ báo lỗi:

```swift
let c = a + b
```

Có thể hiểu đơn giản như sau: **khi khai báo property bên trong view, không thể dùng trực tiếp một property thông thường để tính một property thông thường khác.**

Loại property trực tiếp lưu giá trị như vậy được gọi là “stored property”. Để dễ hiểu, tạm thời có thể xem nó là property thông thường.

Ví dụ:

```swift
let a = 10
```

`a` lưu `10`.

```swift
let b = 20
```

`b` lưu `20`.

Nhưng:

```swift
let c = a + b
```

Ở đây, `c` không phải là một giá trị cố định được viết trực tiếp. Nó mong muốn được tính ra thông qua `a + b`.

Trong tình huống “lấy kết quả từ dữ liệu đã có” như vậy, thuộc tính tính toán phù hợp hơn.

Có thể sửa thành như sau:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Ở đây, `c` là một thuộc tính tính toán.

```swift
var c: Int {
    return a + b
}
```

Ý nghĩa của nó là: **khi cần sử dụng `c`, khi đó mới đọc `a` và `b`, sau đó return kết quả của `a + b`.**

Ví dụ:

```swift
Text("c: \(c)")
```

Khi `Text` hiển thị `c`, lúc đó phép tính của `c` mới được thực hiện.

## Thuộc tính tính toán là gì?

Thuộc tính tính toán nhìn giống như một variable, nhưng bản thân nó không lưu trữ dữ liệu.

Ví dụ:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Ở đây, `c` là thuộc tính tính toán.

Nó không lưu một giá trị cố định giống property thông thường. Mỗi lần `c` được đọc, code bên trong `{}` sẽ chạy lại, rồi return kết quả đã tính.

Có thể hiểu như sau:

```swift
var c: Int {
    return a + b
}
```

Khi cần `c`, `a + b` sẽ được tính.

Vì vậy, thuộc tính tính toán phù hợp với tình huống này: **một kết quả không cần được lưu riêng, vì nó có thể được tính từ dữ liệu đã có.**

## Cách viết cơ bản

Thuộc tính tính toán thường gồm ba phần:

```swift
var c: Int {
    return a + b
}
```

### 1. Khai báo bằng `var`

```swift
var c
```

Thuộc tính tính toán bắt buộc phải khai báo bằng `var`, không thể dùng `let`.

Vì thuộc tính tính toán không phải là một giá trị cố định được lưu trữ, mà là kết quả được tính động mỗi lần được đọc.

### 2. Chỉ định return type

```swift
var c: Int
```

Thuộc tính tính toán cần chỉ định return type.

Ở đây, `c` cuối cùng sẽ return một số nguyên, nên type là `Int`.

### 3. Viết logic tính toán trong {}

```swift
{
    return a + b
}
```

Bên trong `{}` viết logic tính toán. Ở đây, kết quả được return là `a + b`.

## Từ khóa return

Thuộc tính tính toán phải return một kết quả.

Ví dụ:

```swift
var c: Int {
    return a + b
}
```

Ở đây, `return` có nghĩa là: return kết quả tính toán của `a + b` ra bên ngoài.

Nếu trong thuộc tính tính toán chỉ có một expression trực tiếp tạo ra kết quả, có thể bỏ `return`:

```swift
var c: Int {
    a + b
}
```

Nhưng nếu trong thuộc tính tính toán có nhiều dòng code, cần dùng `return` để chỉ rõ kết quả được trả về.

Ví dụ:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Ở đây, quá trình tính toán được chia thành hai bước.

Bước đầu tiên, tính tổng giá:

```swift
let total = count * price
```

Bước thứ hai, ghép tổng giá thành text rồi return:

```swift
return "Total：\(total) $"
```

Nếu bỏ `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Code này sẽ báo lỗi.

Nguyên nhân là: **trong thuộc tính tính toán này đã có nhiều dòng code, Swift không thể tự động xác định dòng nào là kết quả cuối cùng cần return.**

Vì vậy, nếu trong thuộc tính tính toán chỉ có một expression tạo ra kết quả, có thể bỏ `return`.

```swift
var c: Int {
    a + b
}
```

Nếu trong thuộc tính tính toán có nhiều dòng code, nên viết `return` rõ ràng.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Sự khác nhau giữa thuộc tính tính toán và property thông thường

Property thông thường lưu trữ dữ liệu.

```swift
var c = 30
```

Ở đây, `c` lưu một giá trị cụ thể: `30`.

Thuộc tính tính toán không lưu trữ dữ liệu.

```swift
var c: Int {
    a + b
}
```

Ở đây, `c` không lưu `30`. Nó chỉ cung cấp một cách tính toán.

Khi `c` được đọc, Swift sẽ chạy:

```swift
a + b
```

Sau đó return kết quả đã tính.

Vì vậy, thuộc tính tính toán phù hợp với những tình huống cần tính kết quả dựa trên dữ liệu khác.

## body cũng là thuộc tính tính toán

Sau khi học thuộc tính tính toán, chúng ta có thể hiểu lại đoạn code thường gặp nhất trong SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ở đây, `body` cũng là một thuộc tính tính toán.

Nó được khai báo bằng `var`:

```swift
var body
```

Nó có return type:

```swift
some View
```

Nội dung được return bên trong `{}` là SwiftUI view content:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Vì vậy, có thể hiểu `body` như sau: khi SwiftUI cần hiển thị view này, SwiftUI sẽ đọc `body`, rồi tạo interface dựa trên nội dung mà `body` return.

Nếu viết `return`, có thể hiểu như sau:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Nhưng trong SwiftUI, chúng ta thường bỏ `return` và viết trực tiếp như sau:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Khi dữ liệu `@State` thay đổi, SwiftUI sẽ đọc lại `body` và cập nhật interface dựa trên dữ liệu mới.

Ví dụ:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Sau khi bấm button, `count` thay đổi.

```swift
count += 1
```

Sau khi `count` thay đổi, SwiftUI sẽ tính lại `body`, vì vậy text trong interface cũng được cập nhật.

```swift
Text("count: \(count)")
```

Đây cũng là lý do vì sao trong SwiftUI, sau khi dữ liệu thay đổi, interface có thể tự động refresh.

### Không nên viết các phép tính phức tạp trong body

Vì `body` là thuộc tính tính toán, nó có thể được đọc và tính lại nhiều lần.

Ví dụ:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Khi `name` thay đổi, SwiftUI sẽ tính lại `body`.

Lúc này, code bên trong `body` cũng sẽ chạy lại, và `num` cũng được tạo lại.

```swift
let num = 10
```

Trong ví dụ này, `num` rất đơn giản, nên ảnh hưởng không lớn.

Nhưng nếu thực hiện các phép tính phức tạp trong `body`, chẳng hạn filtering lượng lớn dữ liệu, sorting, image processing, v.v., điều đó có thể ảnh hưởng đến độ mượt của interface.

Vì vậy trong SwiftUI, `body` chủ yếu nên chịu trách nhiệm mô tả cấu trúc interface.

Dữ liệu tạm thời đơn giản có thể viết trong `body`.

Các phép tính phức tạp nên được đưa ra ngoài `body`, chẳng hạn đặt trong thuộc tính tính toán, method hoặc một phần xử lý dữ liệu riêng.

## Ví dụ: số lượng và tổng giá

Bây giờ, chúng ta dùng một ví dụ đơn giản để hiểu thuộc tính tính toán.

Giả sử một củ cà rốt có giá 2 $. Người dùng có thể bấm button để thay đổi số lượng mua, và interface cần hiển thị tổng giá.

Cách tính tổng giá:

```text
Số lượng * Đơn giá
```

Nếu lưu tổng giá bằng một variable thông thường, việc này sẽ hơi phiền.

Vì mỗi lần số lượng thay đổi, chúng ta phải cập nhật tổng giá thủ công.

Cách tốt hơn là dùng thuộc tính tính toán:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Kết quả hiển thị:

![view](../../Resource/024_view.png)

Trong ví dụ này:

```swift
@State private var count = 1
```

`count` biểu thị số lượng cà rốt. Khi bấm button, `count` thay đổi.

```swift
private let price = 2
```

`price` biểu thị đơn giá của cà rốt. Ở đây nó là giá trị cố định, nên dùng `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` biểu thị tổng giá.

Không cần lưu nó riêng, vì tổng giá luôn có thể được tính bằng `count * price`.

Khi `count` là `1`:

```swift
totalPrice = 1 * 2
```

Kết quả hiển thị là:

```swift
totalPrice: 2 $
```

Sau khi bấm button `+`, `count` trở thành `2`.

Lúc này khi đọc lại `totalPrice`, nó sẽ được tính lại:

```swift
totalPrice = 2 * 2
```

Kết quả hiển thị là:

```swift
totalPrice: 4 $
```

Đây chính là vai trò của thuộc tính tính toán: tính động một kết quả mới dựa trên dữ liệu đã có.

## Thuộc tính tính toán cũng có thể dùng để kiểm tra điều kiện

Thuộc tính tính toán không chỉ có thể tính số, mà còn có thể return kết quả kiểm tra điều kiện.

Ví dụ, khi chúng ta muốn số lượng tối thiểu là 1.

Khi số lượng đã là 1, button `-` không nên tiếp tục giảm nữa.

Có thể thêm một thuộc tính tính toán:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Code đầy đủ:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Kết quả hiển thị:

![view](../../Resource/024_view1.png)

Ở đây:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Đoạn code này biểu thị hiện tại có thể tiếp tục giảm hay không.

Khi `count` lớn hơn `1`:

```swift
canDecrease == true
```

Nghĩa là có thể giảm.

Khi `count` bằng `1`:

```swift
canDecrease == false
```

Nghĩa là không thể giảm thêm nữa.

### Kiểm tra điều kiện bên trong button

Trong button sử dụng:

```swift
if canDecrease {
    count -= 1
}
```

Chỉ khi `canDecrease` là `true`, `count` mới được giảm.

### Điều khiển foreground color của view

Cũng có thể dùng `canDecrease` để điều khiển foreground color của button:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ở đây dùng ternary operator:

```swift
canDecrease ? Color.primary : Color.gray
```

Ý nghĩa của đoạn code này là: nếu `canDecrease` là `true`, foreground color dùng `Color.primary`; nếu `canDecrease` là `false`, foreground color dùng `Color.gray`.

`Color.primary` là system semantic color do SwiftUI cung cấp. Nó biểu thị màu chữ chính trong interface hiện tại.

Trong Light Mode, `Color.primary` thường gần với màu đen; trong Dark Mode, thường gần với màu trắng.

Vì vậy lợi ích của việc dùng `Color.primary` là: nó tự động thích ứng với Light Mode và Dark Mode.

### Điều khiển trạng thái disabled của view

`disabled` được dùng để điều khiển view có đang ở trạng thái disabled hay không:

```swift
.disabled(!canDecrease)
```

Khi `disabled` là `false`, view có thể được bấm.

Khi `disabled` là `true`, view ở trạng thái disabled và không thể bấm.

Ở đây dùng `canDecrease` làm điều kiện, nên code dễ hiểu hơn.

Khi nhìn thấy `canDecrease`, có thể hiểu ngay rằng nó có nghĩa là “hiện tại có thể tiếp tục giảm hay không”.

### Giải thích bổ sung: tại sao kiểm tra hai lần?

Trong button `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ở đây vừa dùng `.disabled(!canDecrease)`, vừa dùng `if canDecrease` bên trong button.

`.disabled(!canDecrease)` chịu trách nhiệm disable button ở cấp interface, khiến người dùng không thể bấm nó.

`if canDecrease` kiểm tra thêm một lần trước khi code chạy. Chỉ khi có thể giảm thì `count -= 1` mới được thực hiện.

Đây là bảo vệ kép. Trong phát triển thực tế, nếu button đã bị disabled, có thể bỏ kiểm tra bên trong. Nhưng trong ví dụ giảng dạy, giữ lại nó có thể làm rõ hơn vai trò của `canDecrease`.

## Tóm tắt

Trong bài học này, chúng ta chủ yếu học về thuộc tính tính toán.

Thuộc tính tính toán không trực tiếp lưu giá trị. Khi được đọc, nó tính kết quả dựa trên dữ liệu đã có.

Ví dụ:

```swift
var c: Int {
    a + b
}
```

Ở đây, `c` không cần được lưu riêng, vì nó có thể được tính bằng `a + b`.

Thuộc tính tính toán bắt buộc phải khai báo bằng `var`, đồng thời cần chỉ định return type.

```swift
var canDecrease: Bool {
    count > 1
}
```

Thuộc tính tính toán không chỉ có thể return giá trị số, mà còn có thể return kết quả kiểm tra điều kiện, nội dung text, thậm chí SwiftUI view content.

Trong bài học này, chúng ta cũng học `return`.

`return` có nghĩa là trả về một kết quả:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Nếu trong thuộc tính tính toán chỉ có một expression trực tiếp tạo ra kết quả, có thể bỏ `return`.

```swift
var totalPrice: Int {
    count * price
}
```

Ngoài ra, chúng ta cũng đã tìm hiểu `Color.primary` và `disabled`.

`Color.primary` là system semantic color của SwiftUI. Nó tự động điều chỉnh hiệu ứng hiển thị theo Light Mode và Dark Mode.

```swift
.foregroundStyle(Color.primary)
```

`disabled` được dùng để điều khiển view có bị disabled hay không.

```swift
.disabled(true)
```

Nghĩa là disabled, không thể bấm.

```swift
.disabled(false)
```

Nghĩa là available, có thể bấm.

Vì vậy, thuộc tính tính toán rất phổ biến trong SwiftUI. Nó giúp tổ chức kết quả tính toán, điều kiện và nội dung hiển thị rõ ràng hơn.
