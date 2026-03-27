# Hệ Thống Kiểu Dữ Liệu

Trong các bài học trước, chúng ta đã học về biến và biết rằng biến có thể lưu trữ các loại dữ liệu khác nhau.

Ví dụ:

```swift
var hello = "Hello, World"
```

Ở đây `hello` lưu trữ một đoạn văn bản, vì vậy kiểu của nó là `String`.

Tiếp theo, chúng ta sẽ học có hệ thống về khái niệm Kiểu (Type), cũng như khai báo kiểu tường minh và suy luận kiểu, để hiểu sâu hơn về bản chất của biến.

## Kiểu Dữ Liệu Là Gì

Trong Swift, mỗi giá trị đều có một kiểu xác định. Kiểu quyết định giá trị đó là gì và có thể làm gì.

Ví dụ:

- `42` là một `Int` (số nguyên)
- `"Hello"` là `String` (chuỗi ký tự)
- `true` là `Bool` (giá trị boolean)

Chúng thuộc các kiểu khác nhau và có công dụng khác nhau.

## Các Kiểu Cơ Bản Phổ Biến Trong Swift

Ở giai đoạn mới học, các kiểu phổ biến nhất như sau:

- `String`: Chuỗi ký tự (văn bản)
- `Int`: Số nguyên
- `Double`: Số thực dấu phẩy động (có phần thập phân, độ chính xác cao)
- `Bool`: Giá trị boolean (`true`/`false`)

Ngoài ra còn có `Float` (số thực dấu phẩy động), nhưng độ chính xác thấp hơn `Double` nên ít được dùng hơn; và `Character` (ký tự đơn), ví dụ `"A"`, `"!"`, v.v.

### Khai Báo Kiểu (Kiểu Tường Minh)

Trong Swift, có thể chỉ định kiểu thủ công khi khai báo biến:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Thêm `: Kiểu` sau tên biến để khai báo kiểu của biến.

Cách viết kiểu cho mảng là `: [Kiểu]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Trong đoạn code này, mảng `scores` chỉ có thể lưu các phần tử kiểu `Int`, `tags` chỉ có thể lưu các phần tử kiểu `String`.

Khai báo kiểu tường minh giúp ý định của code rõ ràng hơn, và trong một số trường hợp tránh được lỗi suy luận kiểu.

## Suy Luận Kiểu

Trong nhiều trường hợp, có thể không cần khai báo kiểu tường minh:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores = [90, 85, 78]   // [Int]
var tags = ["Swift", "iOS"] // [String]
```

Điều này là vì trình biên dịch Swift sẽ tự động suy luận kiểu dựa trên "giá trị khởi tạo".

## Khai Báo Tường Minh và Suy Luận Kiểu

Trong các bài học trước, chúng ta không sử dụng khai báo tường minh, ví dụ:

```swift
var age: Int = 18
```

Mà ưu tiên dùng suy luận kiểu:

```swift
var age = 18
```

Trong ví dụ này, hai cách viết là tương đương nhau, `age` đều được xác định là kiểu `Int`. So sánh với nhau, cách viết suy luận kiểu ngắn gọn hơn.

Lý do không nhấn mạnh khai báo tường minh ở giai đoạn đầu là vì suy luận kiểu có thể giảm bớt thông tin dư thừa trong code, từ đó giảm chi phí hiểu code ở giai đoạn mới học.

## Tại Sao Cần Kiểu Dữ Liệu

Swift là một ngôn ngữ kiểu mạnh (Strongly Typed Language).

Điều này có nghĩa là: một khi kiểu của biến đã được xác định, không thể thay đổi tùy tiện.

Ví dụ:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

`20` đầu tiên là kiểu `Int`, có thể gán cho `age`; `"20"` thứ hai là kiểu `String`, không nhất quán với kiểu `Int`, vì vậy sẽ báo lỗi.

`nums` là mảng kiểu `[Int]`, chỉ có thể lưu số nguyên, không thể trộn lẫn chuỗi ký tự.

Kiểu dữ liệu có thể ràng buộc việc sử dụng dữ liệu, phát hiện vấn đề không khớp kiểu ở giai đoạn biên dịch, từ đó giảm lỗi do nhầm lẫn kiểu, nâng cao tính ổn định và khả năng bảo trì của code.

## Khi Nào Phải Khai Báo Kiểu Tường Minh

Mặc dù Swift có thể tự động suy luận kiểu, nhưng có những trường hợp trình biên dịch không suy luận được, hoặc suy luận sai, khi đó phải khai báo thủ công.

**1. Mảng rỗng**

Khi tạo mảng rỗng, phải khai báo kiểu tường minh:

```swift
var nums: [Int] = []
```

Nếu không viết kiểu:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

Trình biên dịch không thể suy luận kiểu phần tử của mảng từ mảng rỗng, vì vậy sẽ xảy ra lỗi biên dịch.

**2. Tránh suy luận sai**

```swift
var value = 10   // Int
```

Trong ví dụ này, mặc dù `10` cũng có thể biểu diễn số thực (`Double`), nhưng vì không có dấu thập phân, trình biên dịch sẽ mặc định suy luận là kiểu `Int`.

Nếu muốn `value` là số thực, cần khai báo kiểu tường minh:

```swift
var value: Double = 10   // Double
```

Khi kết quả suy luận kiểu không như mong đợi, nên khai báo kiểu tường minh hoặc điều chỉnh dạng literal để đảm bảo kiểu đúng.

**3. Kiểu tùy chỉnh**

Sau này chúng ta cũng sẽ học về kiểu tùy chỉnh, khi dùng kiểu tùy chỉnh thường cũng cần khai báo tường minh:

```swift
var info: GameInfo
var users: [User] = []
```

Lý do này giống với mảng rỗng, trình biên dịch không thể tự động suy luận kiểu từ giá trị rỗng.

## Chuyển Đổi Kiểu

Trong Swift, không thể tự động chuyển đổi giữa các kiểu khác nhau, phải chuyển đổi thủ công.

Ví dụ, cộng hai số có kiểu khác nhau:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b  // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Trong đoạn code này, `a` là kiểu `Int`, `b` là kiểu `Double`, kiểu khác nhau, không thể trực tiếp thực hiện phép toán.

Trước khi thực hiện phép toán, cần chuyển đổi một trong hai giá trị về cùng kiểu:

```swift
var result = Double(a) + b
```

Đoạn code này có nghĩa là chuyển đổi `a` kiểu `Int` thành kiểu `Double`, rồi cộng với `b`, kết quả tính toán được gán cho `result`.

Cần lưu ý rằng chuyển đổi kiểu không sửa đổi kiểu của biến gốc. Ví dụ, `Double(a)` không thay đổi kiểu `Int` của `a`, mà tạo ra một giá trị `Double` mới để tham gia phép toán.

Các kiểu khác cũng có thể chuyển đổi theo cách tương tự, tức là dùng dạng `KiểuMụcTiêu()`, truyền giá trị cần chuyển đổi vào. Ví dụ:

```
Int()、Double()、String()
```

Ví dụ:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int, 9
```

Cần lưu ý rằng không phải tất cả các chuyển đổi kiểu đều thành công, ví dụ khi `Double → Int`, phần thập phân sẽ bị cắt bỏ trực tiếp, không làm tròn.

## Bí Danh Kiểu

Trong Swift, cũng có thể đặt bí danh cho kiểu đã có, giúp ngữ nghĩa code rõ ràng hơn:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

`UserID` ở đây về bản chất vẫn là `Int`, kiểu không thay đổi, chỉ là tên có ý nghĩa hơn.

Trong các dự án có lượng code lớn và kiểu phức tạp, bí danh kiểu giúp code dễ đọc hơn.

## Ví Dụ Về Kiểu

Dưới đây là một ví dụ đơn giản minh họa vai trò của kiểu trong phát triển thực tế.

### Tạo Biến

Đầu tiên, chúng ta tạo một biến `age`:

```swift
var age = 20
```

Vì cần hiển thị và sửa đổi biến này trong SwiftUI, cần khai báo bằng `@State`:

```swift
@State private var age = 20
```

`private` đã được đề cập trước đây, nghĩa là biến này chỉ có thể được dùng trong view hiện tại, sẽ học thêm sau.

### Hiển Thị Dữ Liệu Trong SwiftUI

Hiển thị biến `age` trong SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Bây giờ view sẽ hiển thị:

```
age: 20
```

### Sửa Đổi Dữ Liệu

Tiếp theo, chúng ta thêm hai nút để sửa đổi `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Kết Quả Chạy

Khi nhấn `changeAge1`, `age` sẽ được gán giá trị `18`:

```swift
age = 18
```

Vì `18` là kiểu `Int`, nhất quán với kiểu của `age`, nên gán thành công.

`changeAge2` sẽ xuất hiện lỗi:

```swift
age = "18"
```

Thông báo lỗi:

```
Cannot assign value of type 'String' to type 'Int'
```

Điều này là vì `"18"` là kiểu `String` (chuỗi ký tự cần được bao bọc bằng `""`), còn `age` là kiểu `Int`, kiểu không nhất quán, không thể gán.

### Tại Sao Báo Lỗi?

Mấu chốt nằm ở dòng code này:

```swift
@State private var age = 20   // Int
```

Mặc dù không khai báo kiểu tường minh, nhưng vì giá trị khởi tạo `20` là kiểu `Int`, nên trình biên dịch sẽ tự động suy luận `age` là kiểu `Int`.

Một khi kiểu đã xác định, không thể gán giá trị của kiểu khác nữa.

Hơn nữa, nút `changeAge2` không phải "thất bại khi chạy", mà sẽ báo lỗi ngay ở giai đoạn biên dịch, code không thể vượt qua quá trình biên dịch.

Đây cũng là một trong những ưu điểm của kiểu mạnh trong Swift: có thể phát hiện sớm vấn đề kiểu ngay khi viết code.

### Cách Viết Đúng

Sau khi xóa code lỗi:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Nhấn nút `changeAge1`, view sẽ cập nhật thành:

```
age: 18
```

### Khai Báo Kiểu Tường Minh (Tùy Chọn)

Cũng có thể chỉ định kiểu rõ ràng khi định nghĩa:

```swift
@State private var age: Int = 20
```

Cách viết này giúp kiểu rõ ràng hơn, nhưng không bắt buộc trong các tình huống đơn giản.

## Tổng Kết

Bài học này chủ yếu giới thiệu hệ thống kiểu của Swift và vai trò của nó trong phát triển thực tế.

Trong Swift, mỗi giá trị đều có kiểu xác định, kiểu quyết định ý nghĩa của dữ liệu và các phép toán mà nó có thể tham gia.

Swift là kiểu mạnh, một khi biến đã xác định kiểu, không thể gán giá trị của kiểu khác nữa. Ràng buộc này có thể phát hiện lỗi ở giai đoạn biên dịch, từ đó giảm các vấn đề khi chạy, nâng cao tính an toàn của code.

Kiểu của biến có thể được tự động suy luận từ giá trị khởi tạo, hoặc khai báo tường minh. Trong một số trường hợp (như mảng rỗng, suy luận kiểu sai, kiểu tùy chỉnh), trình biên dịch không thể suy luận kiểu đúng, khi đó phải khai báo tường minh.

Không thể tự động chuyển đổi giữa các kiểu khác nhau, phải chuyển đổi tường minh qua `Int()`, `Double()`, `String()`, v.v.

Kiểu cũng hỗ trợ bí danh, đặc biệt trong các dự án phức tạp, bí danh kiểu có thể nâng cao khả năng đọc code.

Kiểu không chỉ là nhãn dán dữ liệu, mà còn là một cơ chế ràng buộc, đảm bảo việc sử dụng dữ liệu an toàn, rõ ràng và có thể kiểm soát.

## Kiến Thức Mở Rộng - Kiểu Tùy Chọn (Optional)

Khi thực hiện chuyển đổi kiểu, một số thao tác có thể thất bại.

Ví dụ, chuyển đổi `String` thành `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

`Double(input)` ở đây trả về không phải `Double`, mà là:

```
Double?
```

Đây chính là Kiểu Tùy Chọn (Optional).

### Tại Sao Trả Về Kiểu Tùy Chọn?

Vì nội dung của chuỗi ký tự không chắc chắn, `"3.14"` có thể chuyển đổi thành `Double`, còn `"Hello"` không thể chuyển đổi thành `Double`.

Tức là, thao tác này có thể thành công, cũng có thể thất bại.

Vì vậy, Swift dùng kiểu tùy chọn để biểu diễn sự không chắc chắn này.

### Kiểu Tùy Chọn Là Gì?

Kiểu tùy chọn biểu diễn: một giá trị có thể tồn tại hoặc có thể không tồn tại.

Ví dụ:

```
Double?
```

Kiểu này có nghĩa là, nếu có giá trị, khi in ra sẽ hiển thị `Optional(...)`, nếu không có giá trị, sẽ trả về `nil`.

Cần lưu ý rằng `nil` nghĩa là "không có giá trị", chứ không phải `0` hay chuỗi rỗng.

### Ví Dụ

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Kết quả:

```
pi:Optional(3.14)
```

Điều này có nghĩa là chuỗi ký tự đã chuyển đổi thành công sang `Double`, thu được `3.14`, nhưng vì kiểu là `Double?`, nên được bao bọc trong `Optional`.

Nếu chuyển đổi thất bại:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Kết quả:

```
pi: nil
```

Vì `"Hello"` không thể chuyển đổi thành kiểu `Double`, nên chuyển đổi thất bại và trả về `nil`.

### Optional(...) Là Gì?

Khi chúng ta in trực tiếp kiểu tùy chọn:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift sẽ hiển thị "mô tả debug" của nó:

```
Optional(3.14)
```

Đây không phải là một phần của dữ liệu thực tế, mà là gợi ý rằng giá trị hiện tại là một "kiểu tùy chọn" và bên trong chứa một giá trị.

### Giải Bao Kiểu Tùy Chọn

Trong phát triển thực tế, chúng ta thường cần lấy giá trị thực từ kiểu tùy chọn, quá trình này được gọi là Giải Bao (Unwrapping).

Một cách phổ biến là dùng `??` để cung cấp giá trị mặc định:

```
??
```

Đây được gọi là: Toán Tử Hợp Nil (Nil-Coalescing Operator).

Ví dụ:

```swift
name ?? "FangJunyu"
```

Đoạn code này có nghĩa là, nếu `name` có giá trị, trả về giá trị tương ứng; nếu là `nil`, dùng giá trị mặc định `"FangJunyu"`.

Cần lưu ý rằng kiểu của giá trị mặc định phải nhất quán với kiểu tùy chọn.

### Dùng ?? Để Cung Cấp Giá Trị Mặc Định

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")  // 30
```

Kết quả:

```
pi: 30
```

Khi `input` được chuyển đổi thành kiểu `Double`, chuyển đổi thành công và xuất ra giá trị. Nếu chuyển đổi thất bại, sẽ xuất ra giá trị mặc định được cung cấp bởi `??`.

Nếu chuyển đổi thất bại:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Kết quả:

```
pi: 10
```

Ở đây, khi `input` được chuyển đổi thành kiểu `Double`, chuyển đổi thất bại và trả về `nil`, `??` sẽ cung cấp một giá trị mặc định cho `nil`.

Kiểu tùy chọn được dùng để biểu diễn tình huống "có thể có giá trị, cũng có thể không có giá trị".

Trong các thao tác có thể thất bại như chuyển đổi kiểu, Swift sẽ trả về kiểu tùy chọn để đảm bảo tính an toàn của chương trình.

Khi cần dùng giá trị bên trong, có thể dùng `??` để cung cấp giá trị mặc định, từ đó khi `nil` xuất hiện vẫn có thể thu được kết quả hợp lý.