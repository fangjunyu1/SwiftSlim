# Lưu Số Tiền Heo Đất

Trong bài học trước, chúng ta đã xây dựng một "heo đất" đơn giản. Trong bài học này, chúng ta sẽ học cách lưu trữ bền vững số tiền của "heo đất".

Bài học này chủ yếu học về `UserDefaults` và property wrapper `@AppStorage`, đồng thời sẽ mở rộng giải thích về vai trò của `onAppear`, cũng như cách sử dụng kiểu tùy chọn (`nil`).

Cần lưu ý rằng bài học này cần sử dụng tiếp code "heo đất" đã phát triển từ bài trước.

## Vấn Đề Lưu Trữ Bền Vững

Hiện tại, giao diện "heo đất" rất gọn gàng và dễ dùng.

![Piggy Bank](../../Resource/014_view.png)

Tuy nhiên, có một vấn đề rõ ràng: mỗi lần làm mới view hoặc đóng ứng dụng, tổng số tiền của "heo đất" luôn trở về 0, tổng số tiền trước đó cũng bị mất hết.

Điều này có nghĩa là dữ liệu không thực sự được lưu lại, nói cách khác, "heo đất" hiện tại chỉ có thể lưu dữ liệu tạm thời.

### Tại Sao Không Thể Lưu Bền Vững?

Điều này là vì chúng ta dùng biến được khai báo bằng `@State`:

```swift
@State private var amount = 0
```

Biến được khai báo bằng `@State`, vòng đời của nó hoàn toàn phụ thuộc vào view.

Khi view được tạo, `amount` được khởi tạo về 0, khi view bị hủy, `amount` cũng bị hủy.

`amount` ở đây chỉ lưu dữ liệu trong bộ nhớ, không được lưu vào thiết bị.

Chúng ta không muốn `amount` bị ràng buộc với vòng đời của view, cần thực hiện lưu trữ dữ liệu bền vững. Hay nói cách khác, lưu dữ liệu vào thiết bị.

### "Lưu Trữ Dữ Liệu Bền Vững" Là Gì?

Lưu trữ dữ liệu bền vững có thể hiểu là chuyển dữ liệu từ "bộ nhớ tạm thời" sang "bộ nhớ thiết bị".

Khi đóng view hoặc đóng ứng dụng, dữ liệu sẽ không bị mất.

Trong phát triển Swift, "lưu trữ dữ liệu bền vững" đơn giản có thể dùng `UserDefaults`, dữ liệu phức tạp hơn cần dùng `SwiftData` hoặc `CoreData`.

Trong bài học này, chúng ta học về `UserDefaults` đơn giản nhất trước.

## UserDefaults

`UserDefaults` dùng để lưu dữ liệu cặp khóa-giá trị nhẹ, thường dùng để lưu các kiểu cơ bản như `String`, `Int`, `Double`, `Bool`.

### Lưu Dữ Liệu

`UserDefaults` dùng phương thức `set` để lưu dữ liệu:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Tham số đầu tiên của `UserDefaults` là dữ liệu cần lưu, ở đây truyền vào dữ liệu kiểu `String`, `Int`, v.v.

Tham số thứ hai `forKey` giống như tên biến, dùng để xác định dữ liệu được lưu trong `UserDefaults`.

### Đọc Dữ Liệu

`UserDefaults` dùng phương thức tương ứng để đọc:

```swift
let name = UserDefaults.standard.string(forKey: "name")     // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")      // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")   // true
```

Khi đọc phải dùng phương thức của kiểu tương ứng, nếu không sẽ xảy ra lỗi hoặc dữ liệu không đúng.

### Lưu Ý Về UserDefaults

#### 1. Trả Về Kiểu Tùy Chọn

Khi dùng `UserDefaults` để đọc dữ liệu, một số phương thức trả về kiểu tùy chọn (Optional).

Ví dụ:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Kiểu `name` được trả về là:

```swift
String?
```

Điều này có nghĩa là có thể có giá trị, cũng có thể không có giá trị.

**Tại Sao Trả Về Kiểu Tùy Chọn?**

Điều này là vì một Key nhất định trong `UserDefaults` không nhất thiết tồn tại dữ liệu tương ứng.

Ví dụ:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Nếu trước đây chưa bao giờ lưu Key "City", thì kết quả đọc là:

```swift
nil
```

Cần nhấn mạnh rằng `nil` có nghĩa là không có dữ liệu, chứ không phải chuỗi rỗng.

Trong bài học "Hệ Thống Kiểu", chúng ta đã gặp vấn đề tương tự: khi chuyển đổi kiểu dữ liệu thất bại sẽ trả về kiểu tùy chọn.

Lúc này, chúng ta cần dùng `??` để cung cấp giá trị mặc định, thực hiện giải bao:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

Nếu `UserDefaults` đọc được dữ liệu, dùng giá trị đã đọc; nếu không đọc được (`nil`), dùng giá trị mặc định.

#### 2. Trả Về Kiểu Không Tùy Chọn

Khi `UserDefaults` đọc kiểu `Int`, `Double`, `Bool`, trả về kiểu không tùy chọn.

Ví dụ:

```swift
let num = UserDefaults.standard.integer(forKey: "num")          // 0
let height = UserDefaults.standard.double(forKey: "height")     // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")   // false
```

Ngay cả khi các Key này chưa bao giờ được lưu dữ liệu, giá trị trả về cũng không phải `nil`.

Mà trả về giá trị mặc định:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Giới Hạn Dung Lượng Dữ Liệu

`UserDefaults` chỉ phù hợp để lưu ít dữ liệu, như cấu hình ứng dụng, trạng thái đơn giản, v.v.

Trong thực tế, không phù hợp để lưu lượng lớn dữ liệu hoặc dữ liệu đọc/ghi thường xuyên.

## Lưu Số Tiền "Heo Đất"

Bây giờ, chúng ta có thể dùng `UserDefaults` để thực hiện logic lưu tổng số tiền "heo đất".

Khi người dùng nhấn nút, số tiền nhập được cộng vào tổng số tiền, rồi lưu tổng số tiền vào `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

Bây giờ, chúng ta đã thực hiện được logic ghi dữ liệu.

## Giải Thích Logic Lưu Trữ Bền Vững

Mặc dù chúng ta đã hoàn thành logic ghi dữ liệu bền vững, nhưng khi chạy thực tế sẽ thấy: mỗi lần làm mới view hoặc mở lại ứng dụng, biến `amount` vẫn là 0.

Điều này là vì:

```swift
@State private var amount = 0
```

Trong SwiftUI, biến `@State` sẽ được khởi tạo lại khi view được tạo.

Mặc dù `UserDefaults` đã lưu giá trị của `amount`, khi view tải lại, `amount` vẫn sẽ được đặt lại về 0.

Điều này cho thấy, hiện tại chỉ là lưu dữ liệu vào `UserDefaults`, chưa khôi phục dữ liệu trong view.

Vì vậy, khi view tải, còn cần thủ công đọc dữ liệu từ `UserDefaults` và gán lại cho `amount`, mới có thể thực hiện toàn bộ logic lưu trữ dữ liệu bền vững.

### Phép Loại Suy Logic

Có thể hiểu quá trình này như "bảng đen trong lớp học":

Khi học, giáo viên sẽ viết nội dung lên bảng đen, những nội dung này giống như trạng thái hiện tại trong view (`@State`).

Sau khi tiết học kết thúc, bảng đen sẽ được xóa sạch để chuẩn bị cho tiết học tiếp theo. Điều này tương đương với view bị hủy, dữ liệu trong `@State` cũng bị xóa.

Để tránh mất nội dung giảng dạy, giáo viên sẽ lưu nội dung vào tài liệu bài giảng trước. Tài liệu bài giảng này tương đương với dữ liệu được lưu trong `UserDefaults`.

Khi bắt đầu tiết học tiếp theo, bảng đen ban đầu trống (khởi tạo `@State`), giáo viên cần dựa trên nội dung tài liệu, viết lại kiến thức trước đây lên bảng (đọc `UserDefaults`).

Cần hiểu rằng, bảng đen sẽ không tự động khôi phục nội dung trước, phải thông qua cách "đọc tài liệu" (đọc `UserDefaults`) để viết lại.

## Dùng onAppear Để Đọc Dữ Liệu

Khi view hiển thị, cần thủ công đọc giá trị từ `UserDefaults` và gán cho biến `amount` của `@State`, từ đó thực hiện lưu trữ dữ liệu bền vững thực sự.

Trong SwiftUI, có thể dùng `onAppear` để thực thi logic khởi tạo khi view hiển thị:

```swift
.onAppear {}
```

Đặt code đọc `UserDefaults` vào trong `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Khi view được tạo, `amount` khởi tạo về 0; khi view hiển thị, kích hoạt `onAppear`, đọc từ `UserDefaults` và gán cho `amount`. Như vậy, view có thể hiển thị tổng số tiền đã lưu lần trước.

Bây giờ, toàn bộ logic lưu trữ bền vững của "heo đất" đã hoàn thành.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Property Wrapper @AppStorage

SwiftUI cung cấp property wrapper `@AppStorage`, có thể đơn giản hóa logic lưu của `UserDefaults`.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` là lớp bao bọc của `UserDefaults`, `"amount"` tương ứng với Key của `UserDefaults`.

Khi view được tạo, sẽ đọc dữ liệu từ `UserDefaults`; khi biến thay đổi, tự động ghi vào `UserDefaults`.

Hỗ trợ cơ chế cập nhật trạng thái của SwiftUI, giống như `@State`, khi thay đổi sẽ làm mới view SwiftUI.

Tức là `@AppStorage` có thể thực hiện logic đọc và lưu dữ liệu, không cần gọi thủ công `UserDefaults`, cũng không cần dùng `onAppear` để đọc dữ liệu thủ công.

Vì vậy, chúng ta có thể dùng `@AppStorage` để thay thế `UserDefaults` trong code:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Tổng Kết

Bài học này chủ yếu học các kiến thức sau:

Đầu tiên, `UserDefaults` dùng để lưu dữ liệu nhẹ, chúng ta dùng `UserDefaults` để lưu tổng số tiền vào thiết bị. `UserDefaults` cung cấp các phương thức đọc và ghi, và cần xử lý các tình huống kiểu tùy chọn.

Tiếp theo, biến `@State` chỉ dùng để quản lý trạng thái tạm thời trong view, vòng đời của nó nhất quán với view. Khi view được tạo lại, `@State` sẽ được khởi tạo lại.

Khi khôi phục dữ liệu `UserDefaults`, học cách dùng `onAppear` để đọc `UserDefaults` khi view hiển thị và hoàn thành khôi phục dữ liệu.

Cuối cùng, dùng `@AppStorage` để thay thế `UserDefaults`, thực hiện tự động đọc dữ liệu khi view tải và tự động ghi khi dữ liệu thay đổi, từ đó thay thế logic gọi thủ công `UserDefaults` và `onAppear`.

Thông qua các kiến thức này, chúng ta có thể thực hiện chức năng lưu trữ dữ liệu cơ bản cho App, giúp dữ liệu có thể được lưu trữ bền vững.

## Bài Tập Sau Bài Học

Hiện tại, "heo đất" hỗ trợ lưu số tiền, nhưng chức năng vẫn chưa hoàn chỉnh.

1. Khi người dùng cần rút tiền, cần thiết kế logic rút tiền tương ứng.
2. Khi người dùng muốn xóa sạch số tiền, cũng cần thực hiện logic đặt lại.
3. Nếu muốn thêm tên cho heo đất, còn cần thêm lưu dữ liệu kiểu `String`.

Có thể hoàn thiện các chức năng này trên nền tảng hiện có, làm cho "heo đất" đầy đủ chức năng hơn.

## Kiến Thức Mở Rộng - Vấn Đề Giá Trị Mặc Định Của Ô Nhập

Bây giờ, chúng ta có thể tối ưu thêm tương tác của ô nhập, giúp thao tác nhập tiện lợi hơn.

![textfield](../../Resource/015_view.png)

Trong cài đặt hiện tại, giá trị mặc định của ô nhập là 0. Mỗi lần người dùng nhập số tiền, đều cần xóa 0 trước, rồi nhập giá trị mới, trải nghiệm tương tác này không hợp lý.

Chúng ta nên để giá trị ban đầu của ô nhập là trống, chứ không phải 0.

Điều này là vì `TextField` và `number` ràng buộc hai chiều:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Khi `number` khởi tạo là 0, ô nhập cũng sẽ hiển thị 0.

Vì vậy, chúng ta cần đổi `number` thành giá trị rỗng, tức là `nil`.

```swift
@State private var number = nil
```

Lúc này sẽ xuất hiện lỗi:

```
Generic parameter 'Value' could not be inferred
```

Đây chính là tình huống chúng ta đã đề cập trong "Hệ Thống Kiểu": khi biến không thể tự động suy luận kiểu, cần khai báo kiểu biến tường minh.

Vì chúng ta đặt `number` là `nil`, mà `nil` bản thân không chứa bất kỳ thông tin kiểu nào, trình biên dịch không thể xác định biến đó là `String`, `Int`, hay kiểu khác, nên sẽ báo lỗi.

Vì vậy, chúng ta cần khai báo kiểu tường minh cho `number`:

```swift
@State private var number: Int? = nil
```

`Int?` ở đây biểu diễn kiểu tùy chọn (Optional), có nghĩa là giá trị của `number` có thể là `Int`, cũng có thể là `nil`.

Như vậy, khi khởi tạo đặt nó là `nil`, ô nhập sẽ hiển thị trống, chứ không phải 0.

### Giải Bao Kiểu Tùy Chọn

Khi chúng ta sửa `number` thành kiểu tùy chọn, code tính toán cũ sẽ báo lỗi:

```swift
amount += number
```

Thông báo:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Điều này là vì `number` hiện có thể là `nil`. Nếu tham gia tính toán trực tiếp, sẽ trở thành:

```swift
amount += nil
```

Rõ ràng, `nil` không thể cộng với `amount`, đây là thao tác không hợp lệ.

Vì vậy, khi dùng kiểu tùy chọn tham gia tính toán, cần giải bao trước.

Ở đây có thể dùng `??` để cung cấp giá trị mặc định:

```swift
amount += number ?? 0
```

Khi `number` là `nil`, dùng giá trị mặc định 0; khi `number` có giá trị, dùng dữ liệu thực tế đã nhập.

Như vậy vừa đảm bảo tính đúng đắn của phép tính, vừa thực hiện được hiệu ứng ô nhập mặc định là trống, người dùng không cần thủ công xóa số 0 trong ô nhập nữa.

## Code Mở Rộng

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number: Int? = nil
    
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
                amount += number ?? 0
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