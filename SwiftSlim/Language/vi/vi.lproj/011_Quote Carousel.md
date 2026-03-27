This task is a translation, not a document creation task, so no skills are needed. I'll translate the full document into Vietnamese in Markdown format.

---

# Vòng Lặp Danh Ngôn

Trong bài học này, chúng ta sẽ xây dựng tính năng "vòng lặp danh ngôn" và tìm hiểu sâu hơn về các kiến thức Swift cơ bản như Mảng (Array) và câu lệnh điều kiện (if-else).

Chúng ta sẽ tìm hiểu cách lưu trữ nhiều danh ngôn và thực hiện vòng lặp hiển thị danh ngôn thông qua tương tác nút bấm.

![alt text](../../RESOURCE/011_word.png)

## Hiển Thị Danh Ngôn

Đầu tiên, chúng ta cần hiển thị một câu danh ngôn trong SwiftUI.

Cách đơn giản nhất là dùng Text view:

```swift
Text("Slow progress is still progress.")
```

Đoạn mã này chỉ hiển thị một câu danh ngôn cố định. Nếu muốn hiển thị nhiều danh ngôn và có khả năng chuyển đổi, chúng ta cần lưu trữ chúng lại.

Tuy nhiên, biến chuỗi thông thường chỉ lưu được một câu danh ngôn:

```swift
let sayings = "Slow progress is still progress."
```

Nếu cần lưu nhiều câu danh ngôn, phải khai báo một biến riêng cho mỗi câu:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Tuy nhiên trong phát triển thực tế, cách này không chỉ rườm rà mà còn không thể thực hiện chuyển đổi linh hoạt vì mỗi biến là độc lập.

Để quản lý nhiều câu danh ngôn một cách thuận tiện, chúng ta cần một cấu trúc dữ liệu lưu trữ chúng cùng nhau, đó chính là Mảng (Array).

Sau khi dùng mảng, đoạn mã trên có thể viết lại như sau:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Gợi ý: Trong quy tắc lập trình, tên biến mảng lưu nhiều phần tử thường dùng dạng số nhiều như `sayings`, để thể hiện đặc tính tập hợp.**

## Mảng (Array)

Trong Swift, mảng là tập hợp các phần tử được sắp xếp có thứ tự, được biểu diễn bằng dấu ngoặc vuông `[]`.

```swift
[]
```

Bên trong mảng có thể chứa nhiều phần tử cùng kiểu dữ liệu, các phần tử được phân cách bởi dấu phẩy `,`.

Ví dụ:

```swift
[101, 102, 103, 104, 105]
```

Có thể hiểu mảng đơn giản như một đoàn tàu:

![Array](../../RESOURCE/011_array1.png)

Toàn bộ đoàn tàu đại diện cho đối tượng mảng, mỗi toa xe được sắp xếp theo thứ tự trước sau.

### Chỉ Số và Truy Cập Phần Tử

Vì mảng có thứ tự, hệ thống có thể định vị phần tử cụ thể dựa trên thứ tự. Cơ chế định vị này được gọi là Chỉ số (Index).

Trong Swift (và hầu hết các ngôn ngữ lập trình), chỉ số mảng bắt đầu từ 0, không phải 1. Điều này có nghĩa là phần tử đầu tiên có chỉ số 0, phần tử thứ hai là 1, và cứ tiếp tục như vậy.

![Array](../../RESOURCE/011_array2.png)

Để truy cập phần tử cụ thể trong mảng, chỉ cần thêm dấu ngoặc vuông sau tên mảng và điền vào đó chỉ số của phần tử cần truy cập.

Ví dụ:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Nếu cố truy cập chỉ số vượt quá phạm vi hợp lệ của mảng, sẽ xảy ra lỗi "Index Out of Range" (Chỉ số vượt ngoài phạm vi). Vì vậy, hãy cẩn thận khi truy cập mảng, đảm bảo chỉ số nằm trong phạm vi hợp lệ.

**Chỉ số vượt ngoài phạm vi**

Ví dụ, khi mảng chỉ có 5 phần tử, phạm vi chỉ số hợp lệ là từ 0 đến 4. Nếu thử truy cập `sayings[5]`, chương trình sẽ không tìm thấy "toa xe" tương ứng, dẫn đến lỗi "chỉ số vượt ngoài phạm vi" và ứng dụng bị crash.

![Array](../../RESOURCE/011_array3.png)

### Thao Tác Với Mảng

Mảng không chỉ hỗ trợ khai báo tĩnh mà còn hỗ trợ thêm, xóa, sửa phần tử và lấy độ dài mảng.

Gợi ý: Nếu cần sửa đổi mảng, phải khai báo biến bằng `var`, không phải hằng số `let`.

**1. Thêm phần tử**

Dùng phương thức `append` để thêm phần tử vào cuối mảng:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Xóa phần tử**

Dùng phương thức `remove(at:)` để xóa phần tử tại vị trí chỉ định:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Sửa phần tử**

Dùng chỉ số để trực tiếp sửa đổi phần tử trong mảng:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Đếm độ dài mảng**

Dùng thuộc tính `count` để lấy số phần tử trong mảng:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Dùng Mảng để Hiển Thị Danh Ngôn

Để hiển thị nhiều danh ngôn, chúng ta có thể lưu danh ngôn vào mảng, sau đó truy cập và hiển thị qua chỉ số.

Đầu tiên, tạo mảng `sayings` trong `ContentView` để lưu danh ngôn, rồi dùng chỉ số trong Text view để đọc và hiển thị danh ngôn tương ứng:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Ở đây, `sayings[0]` đại diện cho câu danh ngôn đầu tiên trong mảng.

Nếu muốn hiển thị danh ngôn khác, chỉ cần thay đổi giá trị chỉ số trong ngoặc vuông:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Định Nghĩa Chỉ Số Danh Ngôn

Để thực hiện hiệu ứng chuyển đổi danh ngôn động, chúng ta không thể "cứng hóa" chỉ số trong Text view.

Chúng ta cần tạo một biến để lưu riêng giá trị chỉ số hiện tại.

Trong SwiftUI, chúng ta có thể dùng `@State` để khai báo một chỉ số có thể thay đổi:

```swift
@State private var index = 0
```

SwiftUI sẽ theo dõi biến được bao bọc bởi `@State`. Khi `index` thay đổi, SwiftUI sẽ render lại view và hiển thị danh ngôn tương ứng.

Tiếp theo, dùng `sayings[index]` để lấy danh ngôn trong mảng một cách động:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Khi giá trị `index` thay đổi, Text sẽ hiển thị danh ngôn khác nhau.

### Dùng Nút Bấm Điều Khiển Chỉ Số

Để điều khiển việc chuyển đổi danh ngôn, chúng ta có thể dùng `Button` để thay đổi giá trị `index`. Mỗi lần nhấn nút, `index` tự động tăng thêm 1:

```swift
Button("Next") {
    index += 1
}
```

Khi nhấn nút, giá trị `index` sẽ thay đổi từ 0 thành 1, kích hoạt làm mới view, và `Text(sayings[index])` sẽ đọc câu danh ngôn tiếp theo.

Tuy nhiên, ở đây có một vấn đề tiềm ẩn: nếu nhấn nút liên tục, `index` sẽ tăng đến giá trị vượt quá phạm vi mảng, gây ra lỗi chỉ số vượt ngoài phạm vi. Ví dụ, khi `index` đạt 5 (phạm vi chỉ số mảng là 0 đến 4), chương trình sẽ crash.

Để ngăn chỉ số vượt ngoài phạm vi mảng, chúng ta cần thêm kiểm soát điều kiện, đảm bảo `index` không vượt quá phạm vi mảng. Có thể dùng câu lệnh `if-else` để kiểm tra xem `index` có nhỏ hơn độ dài mảng hay không.

## Điều Kiện Kiểm Soát: Câu Lệnh if-else

Câu lệnh `if-else` là câu lệnh điều kiện rẽ nhánh phổ biến nhất trong Swift, dùng để kiểm tra điều kiện có thỏa mãn hay không và thực thi các khối mã khác nhau dựa trên kết quả đúng/sai.

Cấu trúc cơ bản:

```swift
if condition {
    // Code thực thi khi condition là true
} else {
    // Code thực thi khi condition là false
}
```

Trong câu lệnh `if`, điều kiện `condition` là giá trị kiểu Bool, có thể là `true` hoặc `false`. Khi điều kiện là `true`, phần code trong `if` sẽ được thực thi, ngược lại thực thi phần `else`.

Ví dụ:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Trong ví dụ này, giá trị của `age` là 25, câu lệnh `if` kiểm tra xem `age > 18` có thỏa mãn không. Điều kiện thỏa mãn thì in ra "Big Boy".

Nếu không cần phần code trong `else`, có thể bỏ qua:

```swift
if condition {
    // Code thực thi khi condition là true
}
```

### Dùng Điều Kiện Kiểm Soát Phạm Vi Chỉ Số

Để ngăn chỉ số mảng vượt ngoài phạm vi, có thể dùng câu lệnh `if` để đảm bảo `index` không vượt quá phạm vi mảng:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Phân tích logic: giá trị của `sayings.count` là 5 (có 5 câu danh ngôn), nên `sayings.count - 1` có giá trị là 4, đây cũng là chỉ số hợp lệ cuối cùng của mảng.

Khi `index` nhỏ hơn 4, thao tác tăng thêm 1 khi nhấn nút là an toàn; khi `index` đạt 4, điều kiện không còn thỏa mãn, nhấn nút sẽ không có phản ứng gì.

Bây giờ, code đã thực hiện được tính năng chuyển đổi danh ngôn:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Vòng Lặp Danh Ngôn

Nếu muốn sau khi hiển thị đến câu danh ngôn cuối cùng, nhấn nút sẽ quay lại hiển thị câu đầu tiên để thực hiện hiển thị vòng lặp, có thể dùng phần `else` để thực hiện:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Khi nhấn nút, nếu `index` đạt đến phần tử cuối cùng của mảng, `index` sẽ được đặt lại về 0, bắt đầu hiển thị danh ngôn theo vòng lặp.

## Tối Ưu Giao Diện Danh Ngôn

Bây giờ logic vòng lặp danh ngôn đã được thực hiện, nhưng chúng ta có thể tối ưu thêm giao diện để đẹp hơn.

Code hoàn chỉnh:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Trong ví dụ này, Text view được thêm nền trắng bán trong suốt và góc bo tròn, nút Button dùng style `.borderedProminent`, VStack đặt ảnh nền.

Bổ sung kiến thức: Khi dùng modifier `background()` để xử lý ảnh nền, hành vi mặc định của nó là lấp đầy hết vùng bố cục mà view hiện tại chiếm. Trong nhiều trường hợp, nó có thể tự nhiên kéo dài bao phủ cả vùng Safe Area.

Bây giờ, chúng ta đã thực hiện được view vòng lặp danh ngôn.

![SwiftUI View](../../RESOURCE/011_word.png)

## Tổng Kết

Qua bài học này, chúng ta đã nắm được cách dùng mảng để lưu trữ nhiều câu danh ngôn, và dùng câu lệnh `if` và `if-else` để thực hiện vòng lặp danh ngôn.

Chúng ta cũng đã tìm hiểu các thao tác cơ bản với mảng như thêm, xóa, sửa phần tử, và cách ngăn chặn lỗi chỉ số vượt ngoài phạm vi.

Bài học này không chỉ giải thích cách thực hiện tính năng vòng lặp danh ngôn, mà còn kết hợp các cách dùng cơ bản của mảng và câu lệnh điều kiện, giúp chúng ta nắm vững khả năng xử lý dữ liệu và kiểm soát luồng chương trình.

## Kiến Thức Mở Rộng - Kiểm Tra Nhiều Điều Kiện: Câu Lệnh if-else if-else

Trong phát triển thực tế, thường cần xử lý nhiều điều kiện. Ví dụ, trong một trò chơi, khi điểm bằng 1 kích hoạt sự kiện A, bằng 2 kích hoạt sự kiện B, bằng 3 kích hoạt sự kiện C, và cứ tiếp tục như vậy.

Khi đối mặt với tình huống có nhiều hơn hai nhánh điều kiện, chúng ta cần dùng câu lệnh `if-else if-else` để thực hiện kiểm tra nhiều điều kiện.

Cú pháp cơ bản:

```swift
if conditionA {
    // Code thực thi khi conditionA là true
} else if conditionB {
    // Code thực thi khi conditionB là true
} else if conditionC {
    // Code thực thi khi conditionC là true
} else {
    // Code thực thi khi tất cả điều kiện đều không thỏa mãn
}
```

Trong trường hợp này, chương trình sẽ kiểm tra điều kiện theo thứ tự và thực thi điều kiện đầu tiên thỏa mãn. Nếu không có điều kiện nào thỏa mãn, sẽ thực thi code sau `else`.

Trong vòng lặp danh ngôn, chúng ta cũng có thể dùng câu lệnh `if-else if-else` để kiểm tra nhiều điều kiện:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Khi `index` là 0, 1, 2, 3, mỗi lần nhấn nút thực thi `index += 1`, khi `index` là 4 (phần tử cuối cùng), `index` được đặt lại về 0, thực hiện vòng lặp.

Nhánh `else` dùng để dự phòng, ngăn xuất hiện giá trị không hợp lệ (ví dụ `index` bị sửa đổi sai).

Cần lưu ý rằng `==` ở đây có nghĩa là kiểm tra "có bằng nhau không", nếu câu lệnh `if` kiểm tra `index` bằng một số nào đó thì trả về `true` và thực thi khối code phía sau. Nếu không bằng, tiếp tục kiểm tra câu lệnh `if` tiếp theo.

Kiểm tra nhiều điều kiện này có lợi cho việc thực thi code khác nhau trong các tình huống điều kiện khác nhau.