# Ứng dụng Fill Light

Trong bài học này, chúng ta sẽ tạo một ứng dụng fill light rất thú vị. Khi đêm đến, chúng ta có thể để màn hình điện thoại hiển thị các màu khác nhau và dùng nó như một chiếc đèn bổ sung đơn giản.

Ứng dụng fill light này có thể chuyển màu bằng cách chạm vào màn hình, đồng thời điều chỉnh độ sáng bằng slider.

Trong ví dụ này, chúng ta sẽ học cách dùng `brightness` để điều chỉnh độ sáng của view, `onTapGesture` để thêm thao tác chạm cho view và control view `Slider`.

Kết quả:

![Color](../../Resource/018_color.png)

## Hiển thị màu sắc

Trước tiên, hãy để view hiển thị một màu.

Trong SwiftUI, `Color` không chỉ biểu thị một màu mà còn có thể được hiển thị như một view:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Ở đây, `Color.red` biểu thị một view màu đỏ. `.ignoresSafeArea()` làm cho view màu phủ kín toàn bộ màn hình, vì vậy trông nó giống hiệu ứng fill light thật hơn.

Kết quả:

![Color](../../Resource/018_color1.png)

### Mảng màu và index

Hiện tại chỉ có một màu được hiển thị, nhưng fill light thường không chỉ có một màu. Nó còn có thể hiển thị màu xanh dương, vàng, tím, trắng và các màu khác.

Chúng ta muốn khi chạm vào màn hình thì có thể chuyển giữa các màu khác nhau. Có thể đưa những màu này vào một mảng để quản lý chung:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Mảng phù hợp để lưu “một nhóm dữ liệu cùng kiểu”. Ở đây, mỗi phần tử trong mảng đều là một `Color`.

Nếu muốn hiển thị một màu cụ thể, chúng ta có thể dùng index:

```swift
colors[0]
```

Điều này có nghĩa là đọc màu ở index `0` trong mảng, tức là màu đầu tiên.

Bây giờ code có thể được viết như sau:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Như vậy, màn hình sẽ hiển thị màu đầu tiên trong mảng, tức là màu đỏ.

### Dùng index để điều khiển màu

Nếu cần chuyển giữa các màu khác nhau, chúng ta phải dùng một biến để quản lý index, thay vì viết cứng index.

Có thể dùng `@State` để khai báo một biến lưu index:

```swift
@State private var index = 0
```

Ở đây, `index` biểu thị index của màu hiện tại.

Khi `index` thay đổi, SwiftUI sẽ tính toán lại giao diện và cập nhật nội dung hiển thị.

Sau đó đổi `colors[0]` ban đầu thành:

```swift
colors[index]
```

Như vậy, màu hiển thị trong view sẽ được quyết định bởi `index`.

Bây giờ code trở thành:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Khi `index` thay đổi, `colors[index]` cũng sẽ hiển thị màu khác theo.

Ví dụ:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Điều cần lưu ý là `index` không được vượt quá index lớn nhất của mảng, nếu không sẽ xảy ra lỗi index out of range.

## Cử chỉ chạm

Bây giờ chúng ta có thể hiển thị các màu khác nhau dựa trên `index`, nhưng vẫn chưa thể chạm để chuyển đổi.

Trong ví dụ “Quote Carousel” trước đó, chúng ta đã dùng `Button` để điều khiển việc chuyển câu trích dẫn.

Nhưng lần này, chúng ta muốn “chạm vào toàn bộ vùng màu” để chuyển màu, nên `onTapGesture` sẽ phù hợp hơn.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Khi chúng ta chạm vào view màu, đoạn này sẽ được thực thi:

```swift
index += 1
```

Điều này có nghĩa là `index` tăng thêm `1`. Sau khi index tăng, `colors[index]` sẽ hiển thị màu tiếp theo trong mảng.

### onTapGesture

`onTapGesture` là một gesture modifier có thể thêm thao tác chạm cho view.

Cách dùng cơ bản:

```swift
.onTapGesture {
    // code
}
```

Ví dụ:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Khi chạm vào view màu đỏ này, code bên trong dấu ngoặc nhọn sẽ chạy, và console sẽ in ra:

```swift
Click color
```

Thông qua `onTapGesture`, chúng ta có thể thiết lập điều gì sẽ xảy ra sau khi chạm vào một view.

### Khác biệt với `Button`

Trước đó chúng ta đã học về view `Button`. Cả `Button` và `onTapGesture` đều có thể xử lý thao tác chạm, nhưng tình huống sử dụng của chúng không hoàn toàn giống nhau.

`onTapGesture` phù hợp hơn để “thêm khả năng chạm cho một view đã có sẵn”, chẳng hạn như `Color`, `Image`, `Text` hoặc các view thông thường khác.

Còn `Button` phù hợp hơn để biểu thị một nút rõ ràng, như “Xác nhận”, “Gửi” hay “Xóa”.

Trong ứng dụng fill light này, chúng ta muốn chức năng chuyển màu đơn giản hơn, nên có thể dùng `onTapGesture` để chuyển màu bằng cách chạm vào toàn bộ vùng màu.

## Vấn đề với index

Bây giờ, chúng ta có thể chạm vào màn hình để chuyển giữa các màu khác nhau.

Nhưng ở đây có một vấn đề quan trọng: **index có thể vượt ra ngoài phạm vi của mảng**.

Ví dụ:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Nếu tiếp tục chạm vào màn hình, cuối cùng `index` sẽ trở thành `4`, và lúc đó sẽ gây ra lỗi “index out of range”.

Đó là vì mảng `colors` có `4` phần tử, nhưng index bắt đầu tính từ `0`, nên phạm vi index hợp lệ là `0 - 3`, chứ không phải `4`.

Nếu truy cập `colors[4]`, sẽ xảy ra lỗi “index out of range”.

Trong code hiện tại, mỗi lần chạm vào màn hình thì `index` tự động tăng thêm `1`. Nếu chúng ta không xử lý điều này, sớm muộn gì nó cũng sẽ vượt ra ngoài phạm vi.

Vì vậy, khi chạm vào màn hình, chúng ta cần kiểm tra index: nếu đó là màu cuối cùng thì quay lại màu đầu tiên, nếu không thì tiếp tục tăng thêm `1`.

Có thể dùng câu lệnh `if` để làm điều đó:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Trong đoạn code này, `colors.count` biểu thị số phần tử trong mảng.

Trong mảng hiện tại có `4` màu, nên:

```swift
colors.count // 4
```

Nhưng index lớn nhất không phải là `4`, mà là `3`, vì index bắt đầu từ `0`.

Vì vậy index cuối cùng phải được viết là:

```swift
colors.count - 1
```

Tức là:

```swift
4 - 1 = 3
```

Logic này có nghĩa là nếu index hiện tại đã là màu cuối cùng thì đặt lại về `0`, nếu không thì tăng thêm `1`.

Như vậy, màu sắc có thể được chuyển đổi theo vòng lặp.

### Tối ưu index

Nếu muốn code ngắn gọn hơn, cũng có thể dùng ternary operator:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Đoạn code này có nghĩa là: nếu `index == colors.count - 1` đúng, trả về `0`. Nếu không đúng, trả về `index + 1`.

Cuối cùng, kết quả này lại được gán cho `index`.

Bây giờ, chúng ta có thể tạo được hiệu ứng chuyển màu.

Code hoàn chỉnh:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Bây giờ, chúng ta có thể chạm vào màn hình và chuyển giữa các màu khác nhau, và một ứng dụng fill light cơ bản đã hoàn thành.

## Hiển thị tên màu

Chúng ta cũng có thể thêm một nhóm văn bản tương ứng với các màu, để khi chuyển màu thì màn hình cũng đồng thời hiển thị tên của màu hiện tại.

Ví dụ:

- khi là màu đỏ thì hiển thị `Red`
- khi là màu xanh dương thì hiển thị `Blue`
- khi là màu vàng thì hiển thị `Yellow`
- khi là màu tím thì hiển thị `Purple`

Ở đây cũng có thể dùng mảng để lưu tên các màu:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Thứ tự văn bản trong mảng này phải tương ứng với thứ tự trong mảng màu.

Sau đó chúng ta có thể dùng `Text` để hiển thị tên màu tương ứng với index hiện tại:

```swift
Text(colorsName[index])
```

`Text` sẽ hiển thị tên màu hiện tại dựa theo `index`.

Dùng modifier để tối ưu kiểu hiển thị của `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Như vậy `Text` sẽ được hiển thị bằng màu trắng, kiểu tiêu đề lớn và chữ đậm.

Hiện tại, chúng ta có một view `Color` toàn màn hình. Nếu muốn `Text` hiển thị phía trên view `Color`, chúng ta cần dùng layout container `ZStack`.

```swift
ZStack {
    Color
    Text
}
```

Vì thế code được đổi thành:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Như vậy, phía sau là view màu, còn phía trước chồng lên là một view văn bản.

Kết quả:

![Color](../../Resource/018_color2.png)

Cần lưu ý rằng trong `ZStack`, view được viết sau thường sẽ hiển thị phía trước. Nếu viết `Text` trước `Color`, view `Color` viết sau có thể che mất `Text`.

## Điều khiển độ sáng

Bây giờ chúng ta có thể chuyển giữa các màu khác nhau, nhưng fill light còn có một chức năng quan trọng nữa: **điều chỉnh độ sáng**.

Trong SwiftUI, có thể dùng modifier `brightness` để điều chỉnh độ sáng của view.

Ví dụ:

```swift
.brightness(1)
```

Chúng ta có thể viết như sau:

```swift
colors[index]
    .brightness(0.5)
```

Như vậy, màu hiện tại sẽ sáng hơn và trông gần với hiệu ứng fill light hơn.

Phạm vi của `brightness` là `0 - 1`. `0` nghĩa là giữ nguyên màu gốc. Càng gần `1`, màu sẽ càng sáng hơn, và `1` nghĩa là độ sáng trắng tối đa.

Mặc dù chúng ta có thể điều khiển `brightness` trong code, nhưng người dùng vẫn chưa thể tự điều chỉnh nó.

Chúng ta cần thêm một control có thể kéo được: `Slider`.

## View slider Slider

Trong SwiftUI, `Slider` là một control dạng thanh trượt dùng để chọn giá trị trong một phạm vi. Tài liệu Apple mô tả nó là “a control for selecting a value from a bounded linear range”.

Cách dùng cơ bản:

```swift
Slider(value: $value, in: 0...1)
```

Giải thích tham số:

1. `value: $value`: `Slider` cần được bind với một biến.

    Khi kéo slider, giá trị của biến cũng sẽ thay đổi đồng thời. Ngược lại, nếu biến thay đổi thì slider cũng được cập nhật theo.

    Điều này rất giống với `TextField` mà chúng ta đã học trước đó, vì cả hai đều là “bind control với biến”.
    
    Trước biến được bind cần thêm ký hiệu `$` để biểu thị binding.

2. `in: 0...1`: tham số này biểu thị phạm vi giá trị của slider.

    Ở đây `0...1` nghĩa là giá trị nhỏ nhất là `0`, lớn nhất là `1`.

    Khi kéo slider sang cực trái, biến được bind sẽ gần `0`; khi kéo sang cực phải, nó sẽ gần `1`.

Ví dụ:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` được bind với biến `value`, nên khi kéo slider thì biến `value` cũng thay đổi theo.

Hiển thị:

![Slider](../../Resource/018_slider.png)

Khi `Slider` ở bên trái, giá trị `value` được bind sẽ trở thành `0`; còn khi ở bên phải thì sẽ thành `1`.

### Phạm vi giá trị

Phạm vi giá trị của `Slider` không cố định. Nó cũng có thể được viết thành:

```swift
0...100
```

hoặc các phạm vi khác.

Nhưng trong fill light này, chúng ta cần điều khiển độ sáng, nên `0...1` là phù hợp nhất.

## Dùng Slider để điều khiển brightness

Bây giờ, chúng ta sẽ kết nối `Slider` với `brightness`.

Trước tiên, tạo một biến để lưu giá trị độ sáng:

```swift
@State private var slider = 0.0
```

Ở đây, `0.0` là một giá trị kiểu `Double`.

Vì `Slider` thường được bind với kiểu số, và ở đây chúng ta muốn nó thay đổi liên tục, nên dùng `Double` sẽ phù hợp hơn. Ngoài ra, `brightness` cũng chỉ nhận giá trị kiểu `Double`.

Sau đó truyền giá trị này vào `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Khi `slider == 0`, màu vẫn giữ trạng thái mặc định; khi `slider` càng gần `1`, màu sẽ trông càng sáng hơn.

### Thêm control Slider

Tiếp theo, thêm một control `Slider` để thay đổi biến này:

```swift
Slider(value: $slider, in: 0...1)
```

Khi slider thay đổi, giá trị `slider` cũng sẽ thay đổi, và `brightness(slider)` cũng đồng thời điều chỉnh độ sáng.

Đây là một ví dụ rất điển hình trong SwiftUI về việc “biến điều khiển view”.

### Điều chỉnh giao diện Slider

Theo mặc định, `Slider` sẽ dùng chiều rộng theo không gian có sẵn.

Chúng ta có thể đặt cho nó một chiều rộng cố định:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Sau đó thêm một số modifier để nó dễ nhìn hơn:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Như vậy, slider sẽ có nền trắng và bo góc, nên sẽ nổi bật hơn trên view `Color`.

Cuối cùng, hãy đặt nó ở phía dưới màn hình.

Vì trước đó chúng ta đã dùng `ZStack`, nên có thể thêm một `VStack` vào bên trong, rồi dùng `Spacer()` để đẩy `Slider` xuống dưới.

## Code hoàn chỉnh

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Kết quả:

![Color](../../Resource/018_color.png)

## Tổng kết

Chúng ta đã vận dụng kiến thức đã học trước đó, cùng với các khái niệm cơ bản như màu sắc và mảng, để tạo ra một ứng dụng fill light rất thú vị.

Thông qua ứng dụng fill light này, chúng ta đã học cách dùng `brightness` để điều chỉnh độ sáng, `onTapGesture` để thêm thao tác chạm cho view và control view `Slider`.

Chúng ta đã thêm `onTapGesture` cho view `Color` và triển khai chức năng chuyển màu. Thông qua control `Slider`, chúng ta điều khiển một biến quản lý `brightness`, từ đó điều chỉnh độ sáng của màu. Đây cũng là một ví dụ cho thấy “biến điều khiển view”.

Chúng ta đã ôn lại ternary operator, dùng `ZStack` để chồng các view lên nhau và dùng mảng để quản lý một nhóm dữ liệu cùng kiểu. Điều này giúp chúng ta hiểu sâu hơn về mảng và index, đồng thời trong thực tế cũng lưu ý đến vấn đề index out of range.

Ví dụ này tuy không phức tạp, nhưng nó kết nối nhiều kiến thức nền tảng mà chúng ta đã học trước đó. Khi dùng chúng trong một dự án nhỏ thực tế, chúng ta sẽ dễ hiểu hơn vai trò của từng khái niệm.

### Tình huống sử dụng thực tế

Hãy thử tưởng tượng đặt một chiếc iPhone cũ trên bàn, rồi dùng chính ứng dụng fill light do bạn tự phát triển để điều khiển màu của ánh sáng. Đó sẽ là một trải nghiệm rất tuyệt.

Trong App Store có rất nhiều ứng dụng “fill light”, và chúng trông cũng không quá phức tạp.

![AppStore](../../Resource/018_appStore.PNG)

Chúng ta có thể bắt đầu bằng cách phát triển những ứng dụng đơn giản và thử đưa chúng lên App Store. Điều đó không chỉ làm tăng hứng thú của chúng ta với việc phát triển, mà còn ghi lại hành trình trưởng thành của chính mình.

### Bài tập sau giờ học

Bạn có thể tiếp tục suy nghĩ về cách mở rộng ứng dụng fill light này, chẳng hạn như:

- thêm nhiều màu hơn
- hiển thị giá trị độ sáng hiện tại
- làm đẹp khu vực slider ở phía dưới

Khi bạn thực sự bắt đầu dùng những kiến thức cơ bản này, bạn sẽ nhận ra rằng mỗi điều chúng ta học được thực ra đều là một công cụ để phát triển ứng dụng.
