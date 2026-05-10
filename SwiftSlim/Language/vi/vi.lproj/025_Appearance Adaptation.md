# Thích ứng giao diện

Trong bài học này, chúng ta sẽ học cách thích ứng giao diện với chế độ sáng và chế độ tối.

Trên iPhone, iPad và Mac, người dùng có thể chọn chế độ sáng hoặc chế độ tối.

Khi hệ thống chuyển sang chế độ tối, màu nền, văn bản và biểu tượng của nhiều App cũng sẽ thay đổi theo.

Ví dụ, ban ngày giao diện có thể dùng nền sáng, còn ban đêm giao diện có thể chuyển thành nền tối.

![view](../../../Resource/025_view9.png)

Khả năng tự động điều chỉnh cách hiển thị giao diện theo giao diện hệ thống này được gọi là thích ứng giao diện.

## Xem trước thích ứng giao diện trong Xcode

Trước khi học về thích ứng giao diện, chúng ta hãy tìm hiểu cách xem trước chế độ sáng và chế độ tối trong Xcode.

Ở cuối khu vực `Canvas`, nhấn nút `Device Settings` để mở cửa sổ bật lên `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Trong cửa sổ bật lên, bạn có thể thấy thiết lập `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Trong đó:

- `Light Appearance` biểu thị chế độ sáng.
- `Dark Appearance` biểu thị chế độ tối.

Chúng ta có thể chuyển giao diện xem trước tại đây và xem giao diện hiện tại hiển thị như thế nào trong chế độ sáng và chế độ tối.

## Hiển thị song song hai giao diện

Nếu muốn xem đồng thời chế độ sáng và chế độ tối, bạn có thể dùng tính năng `Variants`.

Ở cuối khu vực `Canvas`, nhấn nút `Variants`, rồi chọn `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Sau khi chọn, `Canvas` sẽ đồng thời hiển thị hiệu quả xem trước của chế độ sáng và chế độ tối.

![canvas3](../../../Resource/025_view3.png)

Cách này giúp so sánh sự khác biệt của giao diện trong hai kiểu giao diện thuận tiện hơn.

Nói đơn giản:

Nếu chỉ muốn tạm thời chuyển đổi chế độ sáng/tối, bạn có thể dùng `Canvas Device Settings`.

Nếu muốn xem đồng thời cả hai kiểu giao diện, bạn có thể dùng `Color Scheme Variants`.

## View mặc định sẽ thích ứng với giao diện

Trong SwiftUI, nhiều view hệ thống mặc định sẽ tự động thích ứng với chế độ sáng và chế độ tối.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Sáng")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nội dung nội dung nội dung")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Hiệu quả hiển thị:

![canvas](../../../Resource/025_view4.png)

Có thể thấy, trong chế độ sáng, biểu tượng và tiêu đề thường hiển thị bằng màu tối.

Trong chế độ tối, biểu tượng và tiêu đề sẽ tự động chuyển thành màu sáng.

Đó là vì các view SwiftUI như `Text`, `Image` mặc định sẽ điều chỉnh màu theo giao diện hệ thống.

Nói cách khác, nếu chúng ta không tự chỉ định màu cố định, SwiftUI sẽ giúp chúng ta xử lý một phần việc thích ứng giao diện.

## Màu cố định sẽ không tự động hoán đổi

Cần chú ý rằng nếu chúng ta tự chỉ định một màu cố định, màu đó sẽ không tự động hoán đổi theo chế độ sáng/tối.

Ví dụ:

```swift
Text("nội dung nội dung nội dung")
	.foregroundStyle(Color.gray)
```

Văn bản ở đây được chỉ định là `Color.gray`, vì vậy nó sẽ luôn hiển thị màu xám.

Một ví dụ khác:

```swift
Text("Tiêu đề")
    .foregroundStyle(Color.white)
```

Đoạn code này sẽ hiển thị chữ màu trắng dù ở chế độ sáng hay chế độ tối.

Nếu nền cũng là màu sáng, chữ màu trắng có thể sẽ khó nhìn rõ.

Vì vậy khi làm thích ứng giao diện, nên tránh tùy tiện viết cứng các màu cố định như `Color.white`, `Color.black`.

Trong nhiều trường hợp, có thể ưu tiên dùng các kiểu ngữ nghĩa hệ thống, ví dụ:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Trong đó:

- `.primary` thường dùng cho nội dung chính.
- `.secondary` thường dùng cho nội dung phụ.

Chúng sẽ tự động điều chỉnh hiệu quả hiển thị theo chế độ sáng/tối.

## Hiển thị nội dung khác nhau theo giao diện

Đôi khi, chúng ta không chỉ muốn màu thay đổi, mà còn muốn hiển thị nội dung khác nhau trong các kiểu giao diện khác nhau.

Ví dụ:

- Trong chế độ sáng, hiển thị biểu tượng bóng đèn thông thường.
- Trong chế độ tối, hiển thị biểu tượng bóng đèn đang phát sáng.
- Trong chế độ sáng, tiêu đề hiển thị `Sáng`.
- Trong chế độ tối, tiêu đề hiển thị `Tối`.

Lúc này, chúng ta cần phán đoán hệ thống hiện tại đang ở chế độ sáng hay chế độ tối.

Trong SwiftUI, có thể lấy chế độ giao diện hiện tại thông qua giá trị môi trường `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Code đầy đủ:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Sáng" : "Tối"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nội dung nội dung nội dung")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/025_view5.png)

Từ hiệu quả xem trước, có thể thấy cùng một view trong các chế độ giao diện khác nhau không hiển thị nội dung hoàn toàn giống nhau.

Trong chế độ sáng, `Image` hiển thị biểu tượng bóng đèn thông thường, tiêu đề hiển thị `Sáng`.

Trong chế độ tối, `Image` hiển thị biểu tượng bóng đèn phát sáng, tiêu đề hiển thị `Tối`.

Nói cách khác, thay đổi ở đây không chỉ là màu sắc thay đổi, mà tên biểu tượng và văn bản tiêu đề cũng thay đổi.

Đó là vì chúng ta không viết cứng biểu tượng và tiêu đề trực tiếp trong `body`, mà tính ra nội dung khác nhau dựa trên `colorScheme`.

Trong đoạn code này, chúng ta đã dùng hai computed property:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Sáng" : "Tối"
}
```

Khi `colorScheme` là `.light`, điều đó cho biết hiện tại là chế độ sáng.

Khi `colorScheme` là `.dark`, điều đó cho biết hiện tại là chế độ tối.

Vì vậy chúng ta có thể trả về tên biểu tượng và văn bản tiêu đề khác nhau theo các chế độ giao diện khác nhau.

Đây cũng là một cách dùng phổ biến của computed property: dựa trên trạng thái hiện tại để tính ra nội dung mà view cần hiển thị.

## Hiểu @Environment

Đây là lần đầu chúng ta tiếp xúc với `@Environment`.

Có thể hiểu `@Environment` là: đọc một giá trị từ môi trường của SwiftUI.

Khi App chạy, hệ thống sẽ cung cấp nhiều thông tin môi trường, ví dụ:

- Ngôn ngữ hiện tại
- Chế độ giao diện hiện tại
- Hướng bố cục hiện tại
- Thiết lập cỡ chữ hiện tại

Khi cần lấy chế độ giao diện hiện tại, chúng ta có thể đọc `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Trong đó

```swift
\.colorScheme
```

biểu thị đọc giá trị `colorScheme` từ môi trường.

```swift
private var colorScheme
```

biểu thị lưu giá trị đã đọc vào biến `colorScheme`.

Tên biến có thể tự quyết định, ví dụ cũng có thể viết thành:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Miễn là `\.colorScheme` phía trước không thay đổi, điều đó có nghĩa là đang đọc chế độ giao diện hiện tại.

## Hai giá trị thường gặp của colorScheme

`colorScheme` thường có hai giá trị:

```swift
.light
.dark
```

Chúng biểu thị:

- `.light`: chế độ sáng
- `.dark`: chế độ tối

Ví dụ:

```swift
private var titleName: String {
    colorScheme == .light ? "Sáng" : "Tối"
}
```

Ý nghĩa của đoạn code này là:

Nếu hiện tại là chế độ sáng, `colorScheme == .light` đúng, nên trả về `"Sáng"`.

Nếu không, sẽ trả về `"Tối"`.

Vì vậy, trong chế độ sáng:

```swift
Text(titleName)
```

Nội dung hiển thị là:

```swift
Sáng
```

Trong chế độ tối, nội dung hiển thị là:

```swift
Tối
```

Thông qua cách này, chúng ta có thể hiển thị nội dung khác nhau theo các giao diện khác nhau.

## Ví dụ thích ứng màu sắc

Ngoài văn bản và biểu tượng, đôi khi chúng ta cũng cần tự xử lý việc thích ứng màu sắc.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Văn bản")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/025_view6.png)

Trong đoạn code này, văn bản là màu trắng, nền là màu đen.

Trong chế độ sáng, nền đen khá rõ ràng.

Nhưng trong chế độ tối, nếu nền của toàn bộ giao diện cũng là màu đen, nền đen này sẽ hòa vào nền hệ thống và trông không đủ rõ.

Lúc này, chúng ta có thể chuyển màu chữ và màu nền theo chế độ giao diện:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Văn bản")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/025_view7.png)

Bây giờ, trong chế độ sáng là nền đen, chữ trắng.

Trong chế độ tối là nền trắng, chữ đen.

Như vậy, dù ở kiểu giao diện nào, văn bản và nền đều có độ tương phản rõ ràng, người dùng đều có thể nhìn rõ nội dung.

## Dùng Assets để thích ứng màu sắc

Ngoài việc dùng `colorScheme` để phán đoán thủ công, chúng ta còn có thể dùng màu tài nguyên `Assets` để thích ứng với chế độ sáng/tối.

Cách này phù hợp hơn để quản lý các màu dùng chung trong App.

Trong dự án Xcode, tìm thư mục tài nguyên `Assets`.

![assets](../../../Resource/025_color.png)

Mở thư mục `Assets`, nhấn chuột phải vào vùng trống, chọn `New Color Set` để tạo một tài nguyên màu mới.

![assets](../../../Resource/025_color1.png)

Ở đây chúng ta tạo một màu và đặt tên là `redText`.

![assets](../../../Resource/025_color2.png)

Tài nguyên màu có thể thiết lập riêng màu cho chế độ sáng và chế độ tối.

![assets](../../../Resource/025_color3.png)

Sau khi chọn vùng màu tương ứng, bạn có thể sửa màu trong trình kiểm tra thuộc tính ở bên phải.

Nhấn nút `Hide or show the Inspectors` ở góc trên bên phải để mở khu vực trình kiểm tra.

Sau đó chọn `Show the Attributes inspector`, tìm `Show Color Panel` ở phía dưới và mở bảng màu.

![assets](../../../Resource/025_color4.png)

Nhấn vào một màu trong bảng màu, vùng màu tương ứng của `redText` sẽ thay đổi đồng thời.

Ở đây chúng ta đặt `redText` thành:

- Chế độ sáng hiển thị màu đỏ
- Chế độ tối hiển thị màu xanh lá

![assets](../../../Resource/025_color5.png)

Quay lại code SwiftUI, có thể dùng màu này như sau:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Trong đó:

```swift
Color("redText")
```

biểu thị đọc tài nguyên màu có tên `redText` từ `Assets`.

Hiệu quả hiển thị:

![assets](../../../Resource/025_view8.png)

Có thể thấy, cùng một `Color("redText")` sẽ hiển thị màu khác nhau trong chế độ sáng và chế độ tối.

Điều này cho thấy bản thân màu trong `Assets` cũng hỗ trợ thích ứng giao diện.

## Sự khác biệt giữa colorScheme và Assets

`colorScheme` và `Assets` đều có thể thực hiện thích ứng giao diện, nhưng chúng phù hợp với các tình huống khác nhau.

Nếu chỉ cần chuyển nội dung văn bản, tên ảnh hoặc tên `SF Symbols` theo chế độ sáng/tối, bạn có thể dùng `colorScheme`.

Ví dụ:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Nếu là màu thường dùng trong App, ví dụ màu chủ đề, màu nền thẻ hoặc màu chữ, nên ưu tiên dùng màu `Assets` hơn.

Vì màu `Assets` có thể được tái sử dụng trong nhiều view, sau này sửa đổi cũng thuận tiện hơn.

Ví dụ:

```swift
Color("redText")
```

Như vậy chỉ cần sửa màu trong `Assets`, tất cả nơi dùng màu này sẽ thay đổi cùng nhau.

## Tổng kết

Trong bài học này, chúng ta đã học thích ứng giao diện cho chế độ sáng và chế độ tối.

Trước tiên, chúng ta học cách xem trước các giao diện khác nhau trong `Canvas` của Xcode, đồng thời học cách dùng `Color Scheme Variants` để xem đồng thời chế độ sáng và chế độ tối.

Sau đó, chúng ta hiểu rằng các view như `Text`, `Image` trong SwiftUI mặc định sẽ tự động thích ứng màu theo giao diện hệ thống.

Tuy nhiên, nếu tự chỉ định màu cố định, ví dụ `Color.white` hoặc `Color.black`, những màu này sẽ không tự động hoán đổi.

Tiếp theo, chúng ta học `@Environment` và `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Thông qua `colorScheme`, chúng ta có thể phán đoán hiện tại là chế độ sáng hay chế độ tối, rồi hiển thị biểu tượng, văn bản hoặc màu sắc khác nhau theo các giao diện khác nhau.

Cuối cùng, chúng ta học về màu `Assets`.

Màu `Assets` có thể thiết lập riêng màu cho chế độ sáng và chế độ tối, phù hợp để quản lý các tài nguyên màu dùng chung trong App.

Thích ứng giao diện có thể giúp App có hiệu quả hiển thị tốt hơn cả ban ngày lẫn ban đêm, đồng thời tránh các vấn đề như chữ khó đọc hoặc nền không rõ.

Trong phát triển thực tế, nên ưu tiên dùng khả năng thích ứng mặc định của SwiftUI và màu `Assets`.

Khi cần chuyển văn bản, biểu tượng, hình ảnh trong các giao diện khác nhau, hoặc xử lý một số ít hiệu ứng hiển thị đặc biệt, rồi mới dùng `colorScheme` để phán đoán.

## Kiến thức mở rộng: chỉ định cỡ chữ

Khi học `font` trước đây, chúng ta đã dùng một số kiểu chữ hệ thống:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Ngoài việc dùng các kiểu chữ hệ thống như `.largeTitle`, `.callout`, cũng có thể tự chỉ định cỡ chữ.

Ví dụ:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Ở đây:

```swift
.font(.system(size: 100))
```

biểu thị đặt cỡ chữ thành `100 pt`.

Đối với biểu tượng `SF Symbols`, `font` cũng sẽ ảnh hưởng đến kích thước biểu tượng.

Vì vậy, nếu muốn biểu tượng hiển thị lớn hơn, có thể chỉ định kích thước thông qua `.font(.system(size:))`.

Ví dụ:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Cần chú ý rằng mặc dù tự chỉ định cỡ chữ linh hoạt hơn, nhưng không nên dùng quá nhiều cỡ chữ cố định cho văn bản thông thường.

Với văn bản thông thường, nên ưu tiên dùng các kiểu chữ hệ thống như `.title`, `.headline`, `.body`, `.caption`.

Cách này có thể thích ứng tốt hơn với các thiết bị khác nhau và thiết lập cỡ chữ của người dùng.
