# Bố cục, Hình ảnh và Văn bản

Trong bài học trước, chúng ta đã học mã ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Trong bài học này, chúng ta sẽ học cơ chế bố cục mặc định của SwiftUI, cùng với cách sử dụng hình ảnh và văn bản. Trên cơ sở của bài học trước, chúng ta sẽ hiểu sâu hơn về cấu trúc và cách hiển thị của khung nhìn, những kiến thức này có thể hỗ trợ chúng ta xây dựng các bố cục giao diện cơ bản.

## Cơ chế bố cục mặc định của SwiftUI

Khi xem trước khung nhìn ContentView, chúng ta sẽ thấy biểu tượng và văn bản được hiển thị ở giữa, thay vì bắt đầu sắp xếp từ trên cùng.

![Swift](../../RESOURCE/003_view.png)

Theo mặc định, cách căn chỉnh của vùng chứa Stack là .center, do đó các khung nhìn con thường hiển thị hiệu ứng căn giữa.

### Căn chỉnh Alignment

Rõ ràng căn giữa chỉ là một trong các cách căn chỉnh, nếu chúng ta muốn căn trái hoặc căn phải, thì cần sử dụng alignment để kiểm soát cách căn chỉnh của khung nhìn.

```swift
alignment
```

Trong SwiftUI, việc căn chỉnh thường xuất hiện trong hai tình huống:

**1. Tham số căn chỉnh của vùng chứa Stack**

Ví dụ, biểu tượng và văn bản trong ContentView được căn trái:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment của VStack kiểm soát cách căn chỉnh theo hướng ngang.

Các cách căn chỉnh:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack là sắp xếp ngang, alignment kiểm soát cách căn chỉnh theo hướng dọc:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack là sắp xếp chồng, alignment có thể kiểm soát cách căn chỉnh theo hướng ngang hoặc dọc:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Nếu không chỉ định rõ alignment, VStack, HStack và ZStack sẽ mặc định là .center.

**2. alignment bên trong frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Khi kích thước do frame cung cấp lớn hơn kích thước bản thân của khung nhìn, alignment quyết định vị trí của khung nhìn bên trong frame. Cách sử dụng cụ thể của frame sẽ được giải thích tiếp ở phần sau, ở đây chỉ cần tìm hiểu sơ qua.

### Spacer và Cơ chế phân bổ không gian

alignment có thể giúp khung nhìn hiển thị sắp xếp theo hướng ngang hoặc dọc. Tuy nhiên, khi chúng ta muốn văn bản và hình ảnh hiển thị ở hai đầu, một cách căn chỉnh đơn lẻ không thể đáp ứng nhu cầu của chúng ta.

Ví dụ, khi chúng ta muốn thực hiện một khung nhìn trên cùng của trang web [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), bên trái là biểu tượng trang web NHK, bên phải là biểu tượng danh mục trong trang.

![Swift](../../RESOURCE/003_alignment3.png)

Nếu chúng ta chỉ sử dụng alignment, biểu tượng trang web NHK và biểu tượng danh mục trong trang đều sẽ chỉ hiển thị ở một bên. Không thể phân bổ hai biểu tượng ở hai bên trái phải, do đó cần Spacer để phân bổ không gian còn lại.

Spacer là một khung nhìn linh hoạt dùng cho bố cục, có thể tự động lấp đầy không gian còn lại.

Cách sử dụng:

```swift
Spacer()
```

Ví dụ:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Khi chúng ta thêm Spacer giữa Image và Text, Spacer sẽ lấp đầy không gian còn lại, đẩy Image và Text về hai đầu trên và dưới.

![Swift](../../RESOURCE/003_view1.png)

Nếu có nhiều Spacer:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Không gian còn lại sẽ được Spacer phân bổ đồng đều.

![Swift](../../RESOURCE/003_spacer.png)

## Hiển thị và Kiểm soát kích thước của Image

Khung nhìn Image chủ yếu dùng để hiển thị hình ảnh, biểu tượng SF Symbols đã học ở bài trước chỉ là một cách sử dụng của Image.

Cách sử dụng:

```swift
Image("imageName")
```

Bên trong dấu ngoặc kép của Image là tên hình ảnh, không cần viết phần mở rộng.

### Hiển thị hình ảnh

Đầu tiên, chúng ta chuẩn bị một bức ảnh.

![Swift](../../RESOURCE/003_img.jpg)

Trong Xcode, chọn thư mục tài nguyên Assets, kéo thả hình ảnh vào trong Assets.

![Swift](../../RESOURCE/003_img1.png)

Trong ContentView, sử dụng Image để hiển thị hình ảnh:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Chú ý: Image của SwiftUI không hỗ trợ phát ảnh động GIF (chỉ có thể hiển thị khung hình tĩnh).

### Kiểm soát kích thước hình ảnh

Trong SwiftUI, Image mặc định hiển thị với kích thước gốc của hình ảnh, nếu muốn điều chỉnh kích thước hiển thị của hình ảnh, trước tiên cần sử dụng resizable để nội dung hình ảnh có thể thay đổi kích thước, sau đó sử dụng frame để chỉ định kích thước bố cục.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Bộ điều chỉnh resizable

Bộ điều chỉnh resizable cho phép hình ảnh tham gia vào việc thay đổi kích thước trong bố cục, thay vì cố định sử dụng kích thước gốc.

```swift
.resizable()
```

Chỉ khi thêm resizable(), frame mới có thể thực sự thay đổi kích thước hiển thị của hình ảnh.

Nếu bỏ qua resizable:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame sẽ chỉ cung cấp không gian bố cục cho hình ảnh, nhưng bản thân kích thước hình ảnh sẽ không thay đổi.

### Bộ điều chỉnh frame

frame(width:height) được dùng để chỉ định chiều rộng và chiều cao của khung nhìn.

Cách sử dụng cơ bản:

```swift
.frame(width: 10,height: 10)
```

Ví dụ, đặt hình ảnh thành hình chữ nhật có width là 300, height là 100.


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Cũng có thể thiết lập riêng chiều rộng hoặc chiều cao:

```swift
.frame(width: 200)
.frame(height: 100)
```

Sự kết hợp giữa resizable + frame có thể kiểm soát linh hoạt kích thước hiển thị của hình ảnh trong giao diện, đồng thời giữ được khả năng thay đổi kích thước.

### Tỷ lệ thu phóng: scaledToFit và scaledToFill

Khi tỷ lệ chiều rộng và chiều cao mà chúng ta thiết lập bằng frame không đồng nhất, hình ảnh có thể bị kéo giãn biến dạng.

Nếu chúng ta muốn hình ảnh phù hợp với không gian bố cục khả dụng trong khi vẫn giữ nguyên tỷ lệ hình ảnh, có thể sử dụng scaledToFit hoặc scaledToFill.

**scaledToFit**

scaledToFit sẽ giữ nguyên tỷ lệ chiều rộng và chiều cao gốc của hình ảnh, thay đổi kích thước hình ảnh để hoàn toàn vừa vặn với không gian khả dụng, không cắt xén hình ảnh:

```swift
.scaledToFit()
```

Hoặc

```swift
.aspectRatio(contentMode: .fit)
```

Cách này phù hợp với các tình huống cần hiển thị trọn vẹn hình ảnh và không muốn bị biến dạng.

Nếu mỗi hình ảnh đều được thiết lập cùng chiều rộng và chiều cao, khó tránh khỏi tình trạng hình ảnh bị kéo giãn.

Ví dụ:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Khi chưa thiết lập tỷ lệ thu phóng, hình ảnh không thể hiển thị với kích thước gốc.

![Swift](../../RESOURCE/003_img4.png)

Thiết lập scaledToFit có thể giúp hình ảnh giữ nguyên tỷ lệ gốc.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill cũng có thể giữ tỷ lệ hình ảnh, nhưng sẽ lấp đầy toàn bộ không gian khả dụng, nếu tỷ lệ không đồng nhất, phần vượt quá sẽ bị cắt xén:

```swift
.scaledToFill()
```

Hoặc

```swift
.aspectRatio(contentMode: .fill)
```

Cách này phù hợp với các tình huống cần hình ảnh bao phủ toàn bộ khu vực, ví dụ như làm ảnh nền hoặc banner. Thích hợp cho các tình huống dùng hình ảnh làm nền.

**Sự khác biệt giữa hai loại**

![Swift](../../RESOURCE/003_img6.png)

## Văn bản

Trong SwiftUI, Text được dùng để hiển thị văn bản.

Cách sử dụng cơ bản:

```swift
Text("FangJunyu")
```

Chúng ta đã học Text ở bài trước, trong bài này chúng ta sẽ học sâu hơn về cách kiểm soát kích thước và độ đậm nhạt của phông chữ, giúp văn bản trong khung nhìn có sức biểu đạt hơn.

### Kích thước phông chữ

Sử dụng bộ điều chỉnh font có thể kiểm soát kích thước văn bản:

```swift
.font(.title)
```

Ví dụ:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Các kích thước phông chữ thường dùng (từ lớn đến nhỏ):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Độ đậm nhạt của phông chữ

Nếu muốn làm cho văn bản in đậm, có thể sử dụng bộ điều chỉnh fontWeight:

```swift
.fontWeight(.bold)
```

Ví dụ:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Các độ đậm nhạt của phông chữ thường dùng (từ mỏng đến dày):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font kiểm soát kích thước phông chữ, fontWeight kiểm soát độ đậm nhạt của phông chữ, cả hai có thể kết hợp sử dụng, làm phong phú thêm sức biểu đạt của văn bản.

## Tổng kết và Thực hành

Cho đến nay, chúng ta đã học các kiến thức cơ bản về bố cục mặc định của SwiftUI, Spacer, Image và Text, những nội dung này đã đủ để dùng cho việc phát triển một số khung nhìn đơn giản.

Ví dụ: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Giao diện của Google rất gọn gàng, nó bao gồm hình ảnh và văn bản, chúng ta có thể thử phân tích cấu trúc giao diện của Google từ góc độ của SwiftUI:

1. Tổng thể được chia thành ba phần: Biểu tượng Google, hộp tìm kiếm và văn bản gợi ý. Có thể sử dụng VStack để sắp xếp dọc.
2. Biểu tượng Google là một hình ảnh, có thể sử dụng Image để hiển thị.
3. Hộp tìm kiếm bao gồm ô nhập liệu và biểu tượng, trong trường hợp bỏ qua ô nhập liệu, có thể sử dụng Image để hiển thị biểu tượng tìm kiếm.
4. Văn bản gợi ý sử dụng Text để hiển thị, việc sắp xếp ngang của văn bản có thể sử dụng HStack, màu sắc phông chữ có thể được kiểm soát bằng foregroundStyle.

Thông qua việc thực hành những kiến thức này, chúng ta có thể tạo ra một số khung nhìn đơn giản, đào sâu sự hiểu biết và cách vận dụng đối với các khung nhìn Image và Text cùng các bộ điều chỉnh của chúng.