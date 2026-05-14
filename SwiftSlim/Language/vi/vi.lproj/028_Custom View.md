# Chế độ xem tùy chỉnh

Trong bài học này, chúng ta sẽ học một cách viết rất quan trọng trong SwiftUI: **chế độ xem tùy chỉnh**.

Chế độ xem tùy chỉnh có thể đóng gói một đoạn mã giao diện bị lặp lại, biến nó thành một chế độ xem có thể sử dụng nhiều lần.

Khi phát triển App thực tế, chúng ta thường gặp tình huống như sau: nhiều giao diện có cấu trúc giống nhau, chỉ khác nội dung hiển thị.

Ví dụ, trong danh sách bài viết của một diễn đàn, mỗi bài viết có thể đều có tiêu đề, hình ảnh, số lượt thích và các thông tin khác.

![Reddit](../../../Resource/028_view1.png)

Trong danh sách sản phẩm của một trang mua sắm, mỗi sản phẩm có thể đều có hình ảnh, tên và giá.

![Amazon](../../../Resource/028_view2.png)

Cấu trúc của những nội dung này tương tự nhau, điểm khác biệt chỉ là dữ liệu được hiển thị không giống nhau.

Nếu viết thủ công mã cho từng mục, mã sẽ trở nên rất dài và cũng không thuận tiện cho việc chỉnh sửa sau này.

Vì vậy, chúng ta có thể đóng gói phần cấu trúc giống nhau thành một chế độ xem tùy chỉnh, sau đó truyền phần nội dung khác nhau vào dưới dạng tham số.

Như vậy, cùng một chế độ xem có thể hiển thị các nội dung khác nhau.

## Tình huống yêu cầu

Ví dụ, bây giờ chúng ta muốn tạo một danh sách cài đặt.

Hiệu quả hiển thị:

![view](../../../Resource/028_view.png)

Trong danh sách cài đặt này có ba mục cài đặt khác nhau, lần lượt là `Cài đặt`, `Thư mục`, `Âm nhạc`.

Mặc dù biểu tượng, màu sắc và tiêu đề của chúng khác nhau, nhưng cấu trúc tổng thể là giống nhau:

- Biểu tượng bên trái
- Màu nền của biểu tượng
- Tiêu đề ở giữa
- Mũi tên bên phải

Nếu không dùng chế độ xem tùy chỉnh, chúng ta có thể viết như sau:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Cài đặt")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Thư mục")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Âm nhạc")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Đoạn mã này có thể hiển thị bình thường, nhưng vấn đề cũng rất rõ ràng: mã của ba mục cài đặt gần như hoàn toàn giống nhau.

Những chỗ khác nhau chỉ là biểu tượng, màu sắc và tiêu đề:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Cài đặt")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Thư mục")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Âm nhạc")
```

Nói cách khác, cấu trúc của mỗi mục cài đặt là cố định, chỉ có biểu tượng, màu sắc và tiêu đề là khác nhau.

Tình huống này rất phù hợp để sử dụng chế độ xem tùy chỉnh.

### Bóng đổ shadow

Ở đây chúng ta dùng một modifier mới là `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` có thể thêm bóng đổ cho chế độ xem.

`radius` biểu thị bán kính làm mờ của bóng đổ. Giá trị càng lớn, phạm vi lan tỏa của bóng thường càng rộng và nhìn cũng mềm mại hơn.

Ở đây đặt là `1`, nghĩa là chỉ thêm một hiệu ứng bóng rất nhẹ.

## Đóng gói chế độ xem mục cài đặt

Tiếp theo, chúng ta sẽ đóng gói mỗi mục cài đặt thành một chế độ xem mới.

Có thể tạo một `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Trong chế độ xem này, chúng ta định nghĩa ba thuộc tính:

```swift
let icon: String
let color: Color
let title: String
```

Trong đó:

- `icon` biểu thị tên biểu tượng
- `color` biểu thị màu nền của biểu tượng
- `title` biểu thị tiêu đề của mục cài đặt

Vì ba nội dung này không giống nhau trong các mục cài đặt khác nhau, nên chúng ta biến chúng thành các tham số có thể truyền từ bên ngoài vào.

## Sử dụng chế độ xem tùy chỉnh

Sau khi có `SettingItemView`, chúng ta không cần lặp lại một đoạn mã `HStack` dài nữa.

Bây giờ có thể sử dụng như sau:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")
```

Dòng mã này biểu thị việc tạo một chế độ xem mục cài đặt và truyền vào ba tham số:

```swift
icon: "gear"
color: Color.blue
title: "Cài đặt"
```

Sau khi truyền vào, các thuộc tính bên trong `SettingItemView` sẽ nhận được giá trị tương ứng:

- Giá trị của `icon` là `gear`
- Giá trị của `color` là `Color.blue`
- Giá trị của `title` là `"Cài đặt"`

Vì vậy, bên trong chế độ xem, `Image(systemName: icon)` sẽ hiển thị biểu tượng bánh răng, `.background(color)` sẽ sử dụng nền màu xanh lam, còn `Text(title)` sẽ hiển thị `Cài đặt`.

Mã hoàn chỉnh:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Thư mục")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Âm nhạc")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/028_view.png)

Có thể thấy, sau khi đóng gói, hiệu quả hiển thị vẫn giống trước, nhưng mã trở nên rõ ràng hơn.

Trước đây mỗi mục cài đặt đều phải viết cả một đoạn `HStack`, bây giờ chỉ cần một dòng mã:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")
```

Đây chính là tác dụng của chế độ xem tùy chỉnh: **đóng gói cấu trúc giao diện bị lặp lại, chỉ truyền phần nội dung khác nhau vào dưới dạng tham số.**

## Vì sao có thể truyền tham số

Tiếp theo, chúng ta sẽ hiểu đơn giản vì sao chế độ xem tùy chỉnh có thể truyền tham số.

Trong SwiftUI, về bản chất, một chế độ xem là một struct.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Xin chào, Thế giới!")
    }
}
```

Ở đây, `ContentView` là một struct.

Khi chúng ta viết:

```swift
ContentView()
```

Thực ra là đang tạo một chế độ xem `ContentView`.

Dấu `()` phía sau biểu thị việc gọi phương thức khởi tạo của nó, cũng có thể hiểu là tạo chế độ xem này.

Vì `ContentView` này không có thuộc tính nào cần truyền từ bên ngoài vào, nên có thể viết trực tiếp:

```swift
ContentView()
```

Nhưng nếu trong chế độ xem có thuộc tính chưa được gán giá trị, thì khi tạo chế độ xem, cần truyền vào giá trị tương ứng.

Ví dụ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("tên: \(name)")
    }
}
```

Ở đây `name` là một thuộc tính và không có giá trị mặc định.

Vì vậy, khi tạo `ContentView`, bắt buộc phải cung cấp cho `name` một giá trị cụ thể:

```swift
ContentView(name: "Fang Junyu")
```

Như vậy, bên trong chế độ xem mới có thể sử dụng giá trị này:

```swift
Text("tên: \(name)")
```

Đây cũng là lý do khi tạo `SettingItemView`, chúng ta cần truyền tham số:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")
```

Vì trong `SettingItemView` có ba thuộc tính không có giá trị mặc định:

```swift
let icon: String
let color: Color
let title: String
```

Cho nên khi tạo chế độ xem này, cần truyền chúng vào. Các tham số được truyền vào sẽ được Swift dùng để gán giá trị cho các thuộc tính bên trong chế độ xem.

## Phương thức khởi tạo

Tiếp theo, chúng ta sẽ hiểu thêm về phương thức khởi tạo.

### Phương thức khởi tạo mặc định

Khi chúng ta định nghĩa một chế độ xem thông thường:

```swift
struct ContentView: View {
    var body: some View {
        Text("Xin chào, Thế giới!")
    }
}
```

Trong đoạn mã này, chúng ta không viết thủ công phương thức khởi tạo.

Nhưng khi sử dụng chế độ xem này, có thể viết như sau:

```swift
ContentView()
```

Dấu `()` ở đây thực ra biểu thị việc tạo `ContentView`, cũng có thể hiểu là gọi phương thức khởi tạo của nó.

### Vì sao không có phương thức khởi tạo mà vẫn có thể gọi?

Bởi vì trình biên dịch Swift sẽ tự động tạo một phương thức khởi tạo giúp chúng ta.

Cần lưu ý rằng, **phương thức khởi tạo này được tự động tạo ra, thông thường chúng ta sẽ không trực tiếp nhìn thấy nó trong mã.**

Nói cách khác, mặc dù chúng ta không viết thủ công trong `struct`:

```swift
init() {

}
```

Nhưng trình biên dịch Swift sẽ âm thầm tạo cho chúng ta một phương thức khởi tạo tương tự như sau:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Xin chào, Thế giới!")
    }
}
```

Đây là lý do chúng ta có thể viết trực tiếp:

```swift
ContentView()
```

Vì vậy, trong mã thực tế, thông thường chúng ta không cần viết phương thức khởi tạo thủ công.

Chỉ cần hiểu một điểm: **khi tạo chế độ xem SwiftUI, phương thức khởi tạo của chế độ xem sẽ được gọi. Ngay cả khi chúng ta không viết phương thức khởi tạo thủ công, Swift cũng có thể tự động tạo giúp chúng ta.**

### Phương thức khởi tạo có tham số

Nếu trong chế độ xem có một thuộc tính không có giá trị mặc định, ví dụ:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("tên: \(name)")
    }
}
```

Trình biên dịch Swift sẽ dựa trên thuộc tính đó để tự động tạo một phương thức khởi tạo có tham số.

Có thể hiểu đơn giản như sau:

```swift
init(name: String) {
    self.name = name
}
```

Trong đó:

```swift
init(name: String)
```

biểu thị rằng khi tạo `ContentView`, cần truyền vào một tham số `name` có kiểu `String`.

Khi chúng ta viết:

```swift
ContentView(name: "Fang Junyu")
```

Ý nghĩa là: truyền `"Fang Junyu"` làm tham số cho phương thức khởi tạo.

Sau đó bên trong phương thức khởi tạo sẽ thực hiện:

```swift
self.name = name
```

Dòng mã này có nghĩa là: gán `name` được truyền từ bên ngoài vào cho thuộc tính `name` của chính chế độ xem hiện tại.

Có thể hiểu đơn giản như sau:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("tên: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Như vậy, bên trong chế độ xem có thể sử dụng giá trị được truyền vào.

Đây là quy trình khởi tạo của một chế độ xem có tham số: **khi thuộc tính trong chế độ xem không có giá trị mặc định, lúc tạo chế độ xem cần truyền vào tham số tương ứng để phương thức khởi tạo hoàn tất việc gán giá trị cho thuộc tính.**

## Trường hợp thuộc tính có giá trị mặc định

Nếu thuộc tính đã có giá trị mặc định, khi tạo chế độ xem có thể không truyền tham số.

Ví dụ:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("tên: \(name)")
    }
}
```

Ở đây `name` đã có một giá trị mặc định:

```swift
"Fang Junyu"
```

Vì vậy, khi tạo `ContentView`, có thể viết trực tiếp:

```swift
ContentView()
```

Lúc này, `name` sẽ sử dụng giá trị mặc định, giao diện hiển thị:

```swift
tên: Fang Junyu
```

Tất nhiên, cũng có thể truyền vào một giá trị mới khi tạo chế độ xem:

```swift
ContentView(name: "Sam")
```

Lúc này, chế độ xem sẽ sử dụng `"Sam"` được truyền từ bên ngoài vào, thay vì dùng giá trị mặc định. Giao diện hiển thị:

```swift
tên: Sam
```

Để dễ hiểu, có thể xem phương thức khởi tạo được trình biên dịch Swift tự động tạo ra như sau:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Ở đây `name: String = "Fang Junyu"` biểu thị rằng: nếu khi tạo chế độ xem không truyền vào `name`, thì sử dụng giá trị mặc định `"Fang Junyu"`; nếu khi tạo chế độ xem truyền vào `name` mới, thì sử dụng giá trị được truyền vào.

Nói cách khác: **nếu bên ngoài không truyền tham số, thì sử dụng giá trị mặc định của thuộc tính; nếu bên ngoài truyền tham số, thì sử dụng giá trị được truyền vào.**

## Quay lại SettingItemView

Bây giờ chúng ta quay lại xem `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Cấu trúc của chế độ xem này là cố định.

Các phần cố định bao gồm:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Các phần khác nhau bao gồm:

```swift
icon
color
title
```

Vì vậy, chúng ta biến phần nội dung khác nhau thành thuộc tính và truyền chúng vào thông qua tham số khi tạo chế độ xem.

Khi tạo các mục cài đặt khác nhau, chỉ cần truyền vào các tham số khác nhau:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")
SettingItemView(icon: "folder", color: Color.brown, title: "Thư mục")
SettingItemView(icon: "music.note", color: Color.purple, title: "Âm nhạc")
```

Như vậy, cùng một `SettingItemView` có thể hiển thị ba mục cài đặt khác nhau.

Đây chính là cách sử dụng phổ biến nhất của chế độ xem tùy chỉnh.

## Tổng kết

Trong bài học này, chúng ta đã học về chế độ xem tùy chỉnh.

Tác dụng cốt lõi của chế độ xem tùy chỉnh là: **đóng gói mã giao diện bị lặp lại để nó có thể được tái sử dụng.**

Trong ví dụ này, cấu trúc của ba mục cài đặt là giống nhau, chỉ có biểu tượng, màu sắc và tiêu đề là khác nhau.

Vì vậy, chúng ta đã tạo một `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Sau đó, khi sử dụng chế độ xem này, chúng ta truyền vào các tham số khác nhau:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Cài đặt")
```

Các tham số ở đây sẽ đi vào bên trong `SettingItemView`.

Bằng cách này, chúng ta có thể dùng ít mã hơn để tạo các chế độ xem có cấu trúc giống nhau nhưng nội dung khác nhau.

Đây cũng là một cách viết rất thường gặp trong phát triển SwiftUI.
