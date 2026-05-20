# Tường ảnh

Trong bài học này, chúng ta sẽ tạo một trang tường ảnh.

![view](../../../Resource/032_view13.png)

Trong ví dụ này, chúng ta sẽ ôn lại kiến thức về `extension`, `self` và instance, đồng thời học các hình `Shape` thường dùng trong SwiftUI.

Thông qua những kiến thức này, chúng ta có thể cắt ảnh thông thường thành nhiều kiểu khác nhau như hình tròn, hình chữ nhật bo góc, hình con nhộng, hình elip, đồng thời thêm hiệu ứng viền cho ảnh.

Bài học này sẽ dùng đến một vài kiến thức mới: `Shape`, `clipShape`, `strokeBorder` và `overlay`.

Trong đó, `clipShape` dùng để cắt hình dạng của view, `strokeBorder` dùng để vẽ viền cho hình, còn `overlay` dùng để chồng một view mới lên phía trên view hiện tại.

## Tài nguyên ảnh

Trước khi bắt đầu, chúng ta cần chuẩn bị một vài ảnh.

Bạn có thể sử dụng ảnh của riêng mình, hoặc sử dụng các ảnh mẫu được cung cấp trong bài học này.

Các ảnh mẫu trong bài học này đến từ trang web [Pixabay](https://pixabay.com/):

[Phong cảnh](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Cáo](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Tòa nhà](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Hoa](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Thiên nga](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Sau khi tải ảnh xuống, hãy thêm chúng vào thư mục tài nguyên `Assets`, rồi lần lượt đặt tên là `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

Như vậy, chúng ta có thể hiển thị ảnh trong SwiftUI bằng cách dùng `Image("1")`, `Image("2")`, v.v.

## Hiển thị ảnh

Trước tiên, chúng ta hiển thị 5 tấm ảnh trong `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/032_view.png)

Trong đoạn code này, chúng ta dùng `ScrollView` để danh sách ảnh có thể cuộn, và dùng `VStack` để sắp xếp nhiều ảnh từ trên xuống dưới.

Mỗi ảnh đều dùng `.resizable()`, `.scaledToFit()` và `.frame(width: 300)` để thiết lập hiệu quả hiển thị, giúp ảnh có thể co giãn, giữ nguyên tỉ lệ và giới hạn chiều rộng.

`.padding(.vertical, 100)` trên `VStack` dùng để tăng khoảng cách trên dưới, tránh việc tấm ảnh đầu tiên và cuối cùng nằm quá sát mép màn hình.

`.ignoresSafeArea()` ở cuối có nghĩa là cho phép scroll view bỏ qua vùng an toàn, để khi cuộn, ảnh có thể mở rộng lên phía trên và phía dưới màn hình, giúp trang hiển thị đầy đủ hơn.

Tuy nhiên, hiện tại cả 5 tấm ảnh đều sử dụng cùng một nhóm modifier:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Khi thấy code bị lặp lại, chúng ta có thể cân nhắc dùng `extension` để tổ chức lại.

## Dùng extension để tổ chức kiểu ảnh

Chúng ta có thể mở rộng `Image` bằng một phương thức dành riêng cho tường ảnh:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Ở đây, chúng ta mở rộng kiểu `Image` bằng một phương thức `photoGalleryStyle`.

Bên trong phương thức này có các modifier đã được dùng lặp lại phía trước: `.resizable()`, `.scaledToFit()` và `.frame(width: 300)`. Nói cách khác, nó gom phần code về co giãn ảnh, hiển thị theo tỉ lệ và thiết lập chiều rộng vào cùng một chỗ.

Sau khi dùng extension này, đoạn code ảnh ban đầu:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

có thể được rút gọn thành:

```swift
Image("1")
    .photoGalleryStyle()
```

Như vậy, mỗi tấm ảnh chỉ cần gọi `.photoGalleryStyle()` là có thể áp dụng cùng một kiểu tường ảnh. Code sẽ gọn hơn và sau này cũng dễ chỉnh sửa thống nhất hơn.

## Hiểu về self

Trong phương thức mở rộng, chúng ta đã viết `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Ở đây, `self` biểu thị instance ảnh hiện tại đang gọi phương thức này.

Ví dụ:

```swift
Image("1")
    .photoGalleryStyle()
```

Trong đoạn code này, `photoGalleryStyle()` được gọi bởi `Image("1")`, vì vậy `self` bên trong phương thức biểu thị chính ảnh `Image("1")` này.

Có thể hiểu đơn giản là: ai gọi phương thức này thì `self` biểu thị người đó.

Cần lưu ý rằng các modifier của SwiftUI sẽ liên tục trả về kết quả view mới. Vì vậy, `photoGalleryStyle()` trả về một view đã được modifier xử lý, chứ không chỉ đơn giản trả về bản thân `Image` ban đầu.

## Hình dạng ảnh

Bây giờ, các ảnh đã có thể hiển thị bình thường. Tuy nhiên, mặc định các ảnh này đều là hình chữ nhật, nhìn khá thông thường.

Nếu chỉ muốn ảnh có bo góc, có thể trực tiếp dùng `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Hiệu quả hiển thị:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` có nghĩa là thêm bo góc `20 pt` cho ảnh. Với ảnh bo góc thông thường, cách viết này đã đủ dùng.

Tuy nhiên, `.cornerRadius()` chỉ xử lý được hiệu ứng bo góc, phù hợp để tạo ảnh bo góc thông thường. Nếu chúng ta muốn biến ảnh thành nhiều hình dạng khác nhau hơn, chỉ dùng modifier này là chưa đủ.

Lúc này, chúng ta cần sử dụng `Shape` trong SwiftUI. `Shape` có thể biểu thị các hình khác nhau, và khi kết hợp với `clipShape`, nó có thể cắt ảnh thành hình tương ứng.

## Tìm hiểu Shape

Trong SwiftUI, `Shape` biểu thị hình vẽ. Giống như `View`, đây cũng là một kiểu rất thường dùng trong SwiftUI.

Các `Shape` thường gặp gồm hình tròn, hình chữ nhật, hình chữ nhật bo góc, hình con nhộng và hình elip. Để quan sát trực quan hơn diện mạo của các hình khác nhau, các ví dụ dưới đây sẽ thiết lập màu sắc và kích thước khác nhau cho từng hình.

Trong các ví dụ này, `.fill()` dùng để tô màu cho hình, còn `.frame()` dùng để thiết lập kích thước hiển thị của hình. Màu sắc chỉ dùng để phân biệt các hình khác nhau, không phải màu cố định của bản thân hình đó.

### Circle hình tròn

`Circle` biểu thị hình tròn. Nó thường được dùng cho avatar, nút tròn, ảnh tròn và các hiệu ứng giao diện tương tự.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle hình chữ nhật

`Rectangle` biểu thị hình chữ nhật. Đây là một trong những hình cơ bản nhất, cũng có thể dùng để tạo nền, vùng phân tách hoặc viền thông thường.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle hình chữ nhật bo góc

`RoundedRectangle` biểu thị hình chữ nhật bo góc. `cornerRadius` dùng để thiết lập độ bo góc.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule hình con nhộng

`Capsule` biểu thị hình con nhộng. Hai đầu của nó là dạng cung tròn, thường dùng cho nút con nhộng, nền nhãn và các hiệu ứng giao diện tương tự.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse hình elip

`Ellipse` biểu thị hình elip. Nó tương tự `Circle`, nhưng khi chiều rộng và chiều cao khác nhau, nó sẽ hiển thị thành hình elip.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Thông qua các ví dụ này, chúng ta có thể thấy bản thân `Shape` có thể trực tiếp hiển thị thành hình. Tiếp theo, chúng ta sẽ dùng các `Shape` này kết hợp với `clipShape` để cắt ảnh, giúp ảnh hiển thị thành các hình dạng khác nhau.

## Dùng clipShape để cắt ảnh

Bây giờ, chúng ta có thể dùng `clipShape` để cắt ảnh thành các hình dạng khác nhau.

Ví dụ, cắt tấm ảnh đầu tiên thành hình tròn:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Đoạn code này có nghĩa là: trước tiên hiển thị một tấm ảnh, sau đó dùng `Circle()` để cắt nó thành hình tròn.

![view](../../../Resource/032_view2.png)

Cú pháp cơ bản của `clipShape` là:

```swift
.clipShape(shape)
```

Thêm `.clipShape(...)` phía sau view, rồi điền hình muốn cắt vào trong dấu ngoặc.

Ví dụ:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Bây giờ, chúng ta cắt 5 tấm ảnh thành các hình dạng khác nhau:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/032_view8.png)

Trong đó, hiệu quả sau khi dùng `Rectangle()` để cắt khá giống ảnh chữ nhật thông thường, nên thay đổi thị giác không rõ ràng, chủ yếu dùng để so sánh với các hình khác.

Bây giờ, ảnh không còn chỉ là hình chữ nhật thông thường nữa, mà đã có các hình dạng khác nhau.

## Thêm viền cho ảnh

Nếu muốn thêm viền cho ảnh hình tròn, chúng ta có thể sẽ nghĩ đến việc dùng `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Tuy nhiên, kết quả nhận được thường không phải viền tròn, mà là một viền hình chữ nhật.

![view](../../../Resource/032_view9.png)

Đó là vì `border` thêm viền theo vùng hình chữ nhật của view, chứ không phải theo hình dạng sau khi đã được `clipShape` cắt.

Vì vậy, nếu muốn có viền tròn, chúng ta không thể trực tiếp dùng `border`.

## Dùng strokeBorder để vẽ viền hình dạng

Trong SwiftUI, `strokeBorder` có thể vẽ viền bên trong cho các kiểu `Shape` thường gặp này.

Ví dụ, vẽ một viền hình tròn:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Đoạn code này có nghĩa là: vẽ cho `Circle` một viền màu nâu, với độ rộng viền là `10 pt`.

![view](../../../Resource/032_view12.png)

Ở đây cần lưu ý rằng `strokeBorder` không trực tiếp thêm viền cho ảnh, mà vẽ viền cho hình `Circle()`.

Nói cách khác, đoạn code này chỉ tạo ra một viền tròn độc lập, nó vẫn chưa liên quan đến ảnh.

Nếu muốn viền tròn này hiển thị phía trên ảnh, chúng ta cần tiếp tục dùng `overlay` để chồng viền lên ảnh.

## Dùng overlay để chồng viền

`overlay` là một view modifier, có thể chồng một view mới lên phía trên view hiện tại.

Cấu trúc cơ bản của nó có thể hiểu là:

```swift
View hiện tại
    .overlay {
        View được chồng lên
    }
```

Trong ví dụ này, view hiện tại là tấm ảnh đã được cắt thành hình tròn:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

View mới mà chúng ta muốn chồng lên là một viền hình tròn:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Vì vậy, chúng ta có thể kết hợp ảnh và viền lại với nhau:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Ở đây, `overlay` có nghĩa là chồng một view mới lên phía trên view hiện tại.

Trong `overlay`, viền sẽ được chồng theo phạm vi hiển thị của tấm ảnh hiện tại, vì vậy không cần thiết lập `frame` riêng. Chỉ cần hình viền và hình cắt giống nhau, viền có thể khớp với ảnh.

![view](../../../Resource/032_view10.png)

Hiệu quả cuối cùng là phía trên ảnh hình tròn được phủ thêm một viền tròn.

So với `ZStack`, `overlay` phù hợp hơn với loại tình huống “thêm phần trang trí cho view hiện tại” này. Ảnh là nội dung chính, còn viền chỉ là hiệu ứng bổ sung, vì vậy dùng `overlay` sẽ rõ ràng hơn.

## Hoàn thành tường ảnh

Bây giờ, chúng ta thêm hình dạng và viền tương ứng cho từng tấm ảnh:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hiệu quả hiển thị:

![view](../../../Resource/032_view13.png)

Như vậy, một trang tường ảnh cơ bản đã hoàn thành.

Trong trang này, chúng ta dùng `ScrollView` để triển khai hiển thị cuộn, dùng `Image` để hiển thị ảnh, dùng `clipShape` để cắt hình dạng ảnh, đồng thời dùng `overlay` và `strokeBorder` để thêm viền.

## Code hoàn chỉnh

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Tổng kết

Trong bài học này, chúng ta đã hoàn thành một trang tường ảnh.

![view](../../../Resource/032_view13.png)

Trong ví dụ này, trước tiên chúng ta dùng `Image` để hiển thị ảnh, sau đó thông qua `extension`, mở rộng `Image` bằng một phương thức `photoGalleryStyle` để tổ chức phần code kiểu ảnh bị lặp lại.

Tiếp theo, chúng ta đã học các `Shape` thường gặp trong SwiftUI, ví dụ như `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` và `Ellipse`. Những hình này không chỉ có thể hiển thị trực tiếp, mà còn có thể kết hợp với `clipShape` để cắt view.

Ví dụ:

```swift
.clipShape(Circle())
```

có nghĩa là cắt view thành hình tròn.

Cuối cùng, chúng ta dùng `overlay` và `strokeBorder` để thêm viền có hình dạng tương ứng cho ảnh. Cần lưu ý rằng `border` thường vẽ viền theo vùng hình chữ nhật của view. Nếu muốn viền đi theo hình tròn, hình con nhộng hoặc hình elip, cách phù hợp hơn là chồng cùng một `Shape` lên trên.

Thông qua bài học này, chúng ta không chỉ hoàn thành hiệu ứng tường ảnh, mà còn hiểu cách kết hợp thường gặp của `Shape`, `clipShape`, `strokeBorder` và `overlay` trong giao diện.

## Bài tập sau giờ học

### 1. Thêm nền cho tường ảnh

Thêm một ảnh nền toàn màn hình cho trang tường ảnh.

Yêu cầu: ảnh nền có thể phủ kín toàn bộ màn hình và bỏ qua vùng an toàn.

### 2. Viền chuyển sắc

Thay các viền một màu hiện có bằng viền chuyển sắc tuyến tính.

Bạn có thể thử dùng `LinearGradient` để tạo hiệu ứng viền phong phú hơn.

### 3. Mô phỏng khung ảnh

Tìm kiếm trên mạng một số kiểu khung ảnh thật, rồi thử dùng `overlay` để chồng khung ảnh dạng hình ảnh lên, giúp ảnh trông gần với khung ảnh thật hơn.

Hiệu quả hiển thị của bài tập:

![button](../../../Resource/032_view15.jpeg)

### 4. Tạo viền nút bo góc

Trong phát triển thực tế, nút thường sử dụng viền hình chữ nhật bo góc.

Hãy thử tạo một nút bo góc, rồi dùng `RoundedRectangle` và `strokeBorder` để thêm viền bo góc cho nút.

Hiệu quả hiển thị của bài tập:

![button](../../../Resource/032_view14.png)

### Câu hỏi suy nghĩ

Nếu không muốn dùng viền một màu, cũng không muốn dùng viền chuyển sắc, mà muốn viền hiển thị một hiệu ứng hoa văn nào đó, thì nên triển khai như thế nào?

Bạn có thể thử tìm kiếm tài liệu để tìm hiểu các cách dùng liên quan như `overlay`, `mask` hoặc `ImagePaint`.

Hiệu quả hiển thị của bài tập:

![button](../../../Resource/032_view16.png)
