# Toán Tử

Trong bài học này, chúng ta sẽ học về Toán Tử (Operators) trong Swift.

Khi thực hiện tính toán, so sánh hay phán đoán logic, chúng ta đều cần dùng toán tử. Các thao tác này xuyên suốt mọi khâu thực thi chương trình, là một trong những kỹ năng nền tảng nhất trong lập trình.

```swift
let a = 100 * 8
```

Trong quá trình học lập trình, nhiều người nhận ra rằng: người có tư duy toán học nhất định thường dễ hiểu logic chương trình hơn. Điều này là vì bản chất của lập trình không thể tách rời "tính toán" và "phán đoán quy tắc", và đây chính là vai trò cốt lõi mà toán tử đảm nhận.

Trong phát triển thực tế, toán tử không chỉ dùng cho tính toán số đơn giản, mà còn được áp dụng rộng rãi trong nhiều tình huống cụ thể.

Ví dụ, trong trò chơi xếp hình, khi người dùng kéo một khối đến vị trí chỉ định, cần tính toán:

- Tọa độ vị trí của khối
- Vị trí mà khối có thể lấp đầy
- Kiểm tra xem vị trí mục tiêu có khả dụng hay không

Quá trình "tính toán + phán đoán" này về bản chất đều dựa vào toán tử để thực hiện.

![Block](../../Resource/013_block.png)

Học toán tử không chỉ là học tính toán số, mà còn đặt nền tảng cho bố cục giao diện, xử lý dữ liệu và logic tương tác sau này.

## Cách Thực Thi Tính Toán Trong SwiftUI

Trong SwiftUI, thông thường dùng Button để kích hoạt hàm, rồi thực thi logic tính toán trong hàm đó.

Ví dụ:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Khi nhấn nút, Console xuất ra:

```
c: 20
```

Trong bài học này, chúng ta thống nhất viết logic tính toán trong `func`, kích hoạt thực thi qua nút bấm, và dùng `print` để xuất kết quả.

Trong các ví dụ tiếp theo, để đơn giản hóa việc trình bày code, chúng ta sẽ trực tiếp chú thích kết quả tính toán trong code, không lặp lại việc dùng `print` để xuất ra nữa.

## Quản Lý Đầu Ra Console

Vì mỗi lần nhấn đều tạo ra thông tin đầu ra, có thể nhấn nút xóa ở góc dưới bên phải khu vực Console để xóa lịch sử log, tiện theo dõi kết quả hiện tại.

![Console](../../Resource/013_console.png)

## Cách Viết Khác Của Button

Khi nút chỉ thực thi một hàm, có thể dùng cách viết ngắn gọn hơn:

```swift
Button(action: ) {
    // View
}
```

Trong cách viết này, `action` chỉ định hàm cần thực thi khi nhấn nút (hàm không có tham số), dấu ngoặc nhọn `{}` dùng để định nghĩa view của nút.

Kết hợp với hàm `calculate` ở trên, có thể viết là:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Khi nhấn nút, hàm `calculate` sẽ được thực thi trực tiếp.

Vì vậy, khi logic nút đơn giản và chỉ gọi một hàm, dùng cách viết `action` rõ ràng hơn và phù hợp với quy chuẩn code hơn.

## Toán Tử Số Học

Toán Tử Số Học (Arithmetic Operators) dùng cho tính toán số:

- `+` Cộng
- `-` Trừ
- `*` Nhân
- `/` Chia
- `%` Lấy phần dư (số dư)

Ví dụ:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Cần lưu ý rằng Swift là ngôn ngữ kiểu mạnh, không tự động trộn lẫn các kiểu dữ liệu khác nhau:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b       // Error
let d = Double(a) + b   // 15.0
```

Khi hai kiểu khác nhau, cần chuyển đổi kiểu thủ công.

## Toán Tử So Sánh

Toán Tử So Sánh (Comparison Operators) dùng để phán đoán quan hệ giữa hai giá trị, kết quả là `Bool`:

- `==` Bằng
- `!=` Không bằng
- `>` Lớn hơn
- `<` Nhỏ hơn
- `>=` Lớn hơn hoặc bằng
- `<=` Nhỏ hơn hoặc bằng

Ví dụ:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Toán tử so sánh thường dùng trong câu lệnh điều kiện. Ví dụ trong "vòng lặp danh ngôn", chúng ta cần kiểm soát chỉ số không vượt quá phạm vi mảng:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Nếu `index` nhỏ hơn `sayings.count - 1`, kết quả so sánh là `true`, code trong câu lệnh `if` sẽ được thực thi; nếu kết quả so sánh là `false`, code phía sau sẽ không được thực thi.

## Toán Tử Logic

Toán Tử Logic (Logical Operators) dùng để kết hợp nhiều điều kiện:

- `&&` Và (AND)
- `||` Hoặc (OR)
- `!` Không (NOT)

### && Và

Khi nhiều điều kiện phải đồng thời thỏa mãn, dùng `&&`.

Ví dụ:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Trong code này, có hai điều kiện: `age >= 18` và `age <= 100`.

Chỉ khi cả hai điều kiện đều là `true`, `legalAge` mới là `true`; chỉ cần một điều kiện không thỏa mãn, kết quả là `false`.

### || Hoặc

Khi trong nhiều điều kiện chỉ cần thỏa mãn một, dùng `||`.

Ví dụ:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Đoạn code này có nghĩa là, chỉ cần `money >= 50` hoặc `creditCard >= 50` thỏa mãn một trong hai, `payAllowed` sẽ là `true`.

Chỉ khi cả hai điều kiện đều không thỏa mãn, kết quả mới là `false`.

Ví dụ trong tình huống thanh toán, có thể thanh toán bằng tiền mặt hoặc thẻ tín dụng. Nếu cả hai đều không thể thanh toán, thì thanh toán thất bại.

### ! Không

`!` là toán tử logic NOT, dùng để đảo ngược giá trị `Bool`.

Có thể hiểu là `!` biến `true` thành `false`, biến `false` thành `true`.

Ví dụ:

```swift
let allowed = true
let result = !allowed   // false
```

`!allowed` ở đây có nghĩa là đảo ngược giá trị của `allowed`.

Cần lưu ý rằng `!` và `!=` là hai toán tử khác nhau: `!` đảo ngược giá trị `Bool`, còn `!=` là toán tử so sánh, trả về giá trị `Bool`.

## Toán Tử Gán

Toán Tử Gán (Assignment Operators) dùng để gán hoặc cập nhật biến:

- `=` Gán

Trong khai báo biến hoặc quá trình tính toán, đều liên quan đến thao tác gán:

```swift
let a = 5
```

Đoạn code này có nghĩa là gán giá trị `5` cho biến `a`.

### Toán Tử Gán Kết Hợp

Trong phát triển thực tế, ngoài toán tử gán cơ bản, còn thường dùng "toán tử gán kết hợp", dùng để tính toán trực tiếp trên giá trị gốc và cập nhật:

- `+=`
- `-=`
- `*=`
- `/=`

Trong bài học "Bộ Đếm" trước đây, chúng ta đã tìm hiểu sơ qua về toán tử gán kết hợp.

Ví dụ, khi nhấn nút, cho biến tự động tăng lên:

```swift
var num = 10
num += 5   // num = 15
```

Đoạn code này có nghĩa là `num` thực hiện phép cộng với `5`, rồi gán lại kết quả cho `num`.

Vì vậy, nó tương đương với:

```swift
var num = 10
num = num + 5   // num = 15
```

## Toán Tử Ba Ngôi

Toán Tử Ba Ngôi (Ternary Operator) trong Swift sẽ phán đoán theo điều kiện và trả về một trong hai kết quả:

```swift
điều kiện ? giá trị1 : giá trị2
```

Logic thực thi là: nếu điều kiện là `true`, trả về "giá trị1"; nếu điều kiện là `false`, trả về "giá trị2".

Ví dụ:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Đoạn code này sẽ phán đoán giá trị của `showColor`: nếu là `true`, trả về `Color.blue`, nền hiển thị màu xanh lam; nếu là `false`, trả về `Color.clear`, không hiển thị màu nền.

Gợi ý: `Color.clear` biểu diễn màu trong suốt (không hiển thị nội dung).

### Sự Khác Biệt So Với if-else

Toán tử ba ngôi về mặt logic tương đương với câu lệnh `if-else`.

Ví dụ, code trên có thể viết thành:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logic thực thi của cả hai hoàn toàn nhất quán: khi điều kiện là `true`, thực thi kết quả thứ nhất; khi điều kiện là `false`, thực thi kết quả thứ hai.

Trong thực tế sử dụng, cách viết toán tử ba ngôi ngắn gọn hơn, phù hợp hơn để biểu đạt phán đoán đơn giản "chọn một trong hai", thường dùng để trả về trực tiếp một giá trị.

Trong việc xây dựng View của SwiftUI, toán tử ba ngôi rất phổ biến, ví dụ:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Cách viết này có thể trong một dòng code, động thái thay đổi hiệu ứng view dựa theo điều kiện.

## Toán Tử Phạm Vi

Toán Tử Phạm Vi (Range Operators) dùng để biểu diễn khoảng giá trị:

- `...` Khoảng đóng (bao gồm cả hai đầu)
- `..<` Khoảng nửa mở (không bao gồm đầu bên phải)

Ví dụ:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Có thể hiểu là `1...3` biểu diễn từ 1 đến 3, bao gồm 3; `5..<8` biểu diễn từ 5 đến 8, nhưng không bao gồm 8.

Dạng mở rộng (chỉ cần hiểu):

```
5...    // >= 5
...5    // <= 5
```

Cách viết này biểu diễn "phạm vi một phía", thường dùng trong phán đoán điều kiện hoặc khớp mẫu.

Toán tử phạm vi sẽ được dùng khi học vòng lặp `for` sau này, hiện tại có thể hiểu sơ là một dải giá trị số liên tiếp.

## Thực Hành Toán Tử

Dưới đây, chúng ta sẽ thực hành vai trò của toán tử trong view qua một vài ví dụ đơn giản.

### 1. Tính Tổng Số Xe

Ví dụ, tại một ngã tư mỗi ngày có 500 xe đi qua, tính tổng số xe đi qua trong 30 ngày.

Chúng ta có thể dùng toán tử tính toán:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Quá trình tính toán ở đây là: mỗi ngày 500 xe, tổng 30 ngày là 500 × 30, cuối cùng thu được tổng 15000 xe.

### 2. Kiểm Tra Thành Viên Mua Trong Ứng Dụng

Chúng ta có thể kiểm tra xem một người có phải thành viên mua trong ứng dụng hay không: chỉ cần họ đã đăng ký thành viên vĩnh viễn hoặc thành viên đăng ký bất kỳ một trong hai, thì được coi là thành viên.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Đoạn code này dùng toán tử `||` (hoặc): `lifeTime = false` nghĩa là không có thành viên vĩnh viễn; `subscription = true` nghĩa là có thành viên đăng ký.

Vì chỉ cần thỏa mãn một trong hai điều kiện, `isMember` sẽ là `true`. Vì vậy, người này là thành viên mua trong ứng dụng.

## Tổng Kết

Trong Swift, toán tử là nền tảng của tính toán dữ liệu và phán đoán logic, giống như `Text` hiển thị nội dung, toán tử dùng để xử lý bản thân dữ liệu.

Từ tính toán số đơn giản nhất, đến phán đoán logic phức tạp, rồi kiểm soát trạng thái và tính toán bố cục trong view, đều không thể thiếu sự tham gia của toán tử.

Thông qua thực hành trong các tình huống khác nhau, có thể dần dần làm quen và nắm vững các loại toán tử được giới thiệu trong bài học này, đây là nền tảng quan trọng cho việc học tiếp theo.

### Kiến Thức Mở Rộng - Toán Tử Bit

Ngoài ra, Swift còn cung cấp một loại toán tử cấp độ thấp hơn — Toán Tử Bit (Bitwise Operators):

- `&` (AND theo bit)
- `|` (OR theo bit)
- `^` (XOR theo bit)
- `~` (NOT theo bit)
- `>>` (Dịch phải)
- `<<` (Dịch trái)

Ví dụ:

```swift
let a = 6  // nhị phân 110
let b = 3  // nhị phân 011

print(a & b) // 2 (nhị phân 010)
print(a | b) // 7 (nhị phân 111)
print(a ^ b) // 5 (nhị phân 101)
print(~a)    // -7 (đảo ngược)
```

Trong Swift, số nguyên được biểu diễn bằng bù hai nhị phân, sau khi đảo ngược sẽ thu được kết quả số âm tương ứng.

Toán tử bit trực tiếp thao tác trên nhị phân, thường dùng trong xử lý dữ liệu cấp thấp và các tình huống tối ưu hiệu năng.

Đối với người mới học, các trường hợp sử dụng loại toán tử này tương đối ít, cũng không phổ biến trong phát triển iOS hoặc SwiftUI thông thường, vì vậy ở đây không đi sâu giải thích.

Nếu sau này liên quan đến logic cấp thấp hoặc tối ưu hiệu năng, có thể tiếp tục học và tìm hiểu thêm.