# Bắt đầu từ ContentView

## Chuẩn bị trước bài học

Trong bài học này, chúng ta sẽ bắt đầu từ tệp ContentView.swift để tìm hiểu một cách có hệ thống về cấu trúc cơ bản của SwiftUI, bao gồm:

- Chú thích (Comment)
- Cấu trúc View
- Bố cục VStack / HStack / ZStack
- Biểu tượng SF Symbols
- Bộ điều chỉnh khung nhìn (modifier)
- Mã xem trước #Preview

Đầu tiên, hãy tìm dự án Xcode đã tạo trước đó, nhấp đúp vào tệp .xcodeproj.

Trong khu vực điều hướng Navigator bên trái, hãy chọn tệp ContentView.swift.

Chú ý: Mỗi khi mở dự án, Canvas có thể hiển thị "Preview paused". Nhấp vào nút làm mới để khôi phục xem trước.

![Swift](../../RESOURCE/002_view7.png)

## Tìm hiểu ContentView

Mã ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Mặc dù mã khá ít, nhưng nó bao gồm cấu trúc cốt lõi của SwiftUI.

### 1. Chú thích

Đầu tệp:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Đây là chú thích tệp, dùng để ghi lại thông tin tệp, bao gồm tên tệp, tên dự án, người tạo và thời gian tạo.

Trong Swift, sử dụng // để tạo chú thích trên một dòng:

```swift
// Đây là chú thích
```

Chú thích có thể cải thiện khả năng đọc mã, giúp nhà phát triển hiểu logic của mã.

Trong quá trình phát triển thực tế, mã có thể khó hiểu. Nếu không viết chú thích, bạn sẽ gặp tình trạng không hiểu nổi mã của chính mình chỉ sau ba ngày.

Do đó, chủ động thêm chú thích trong quá trình viết mã là một thói quen phát triển tốt. Sử dụng chú thích để ghi lại logic mã, giúp thuận tiện cho việc bảo trì mã sau này.

**Tạm thời vô hiệu hóa mã**

Chú thích cũng có thể dùng để tạm thời che (vô hiệu hóa) mã, giúp chúng ta khắc phục sự cố.

Ví dụ:

```
A
B
C
```

A, B, C là ba đoạn mã, trong đó có một đoạn mã bị lỗi, chúng ta có thể tạm thời chú thích mã để kiểm tra.

Đầu tiên thêm chú thích cho A:

```
// A
B
C
```

Nếu sau khi chú thích A, mã hoạt động bình thường, điều đó chứng tỏ mã A có vấn đề.

Nếu sau khi chú thích A mà vẫn còn vấn đề, chúng ta có thể tiếp tục chú thích B, và cứ thế tiếp tục cho đến khi tìm ra đoạn mã bị lỗi.

Trong quá trình phát triển sẽ gặp rất nhiều vấn đề, phần lớn chúng ta cần thông qua việc chú thích mã để tìm ra nguyên nhân, điều này giúp chúng ta xác định vị trí đoạn mã có vấn đề và tìm ra BUG.

Trong Xcode, bạn có thể sử dụng phím tắt:

```
Command ⌘ + /
```

Để thêm hoặc xóa chú thích một cách nhanh chóng.

### 2. Nhập (Import) framework SwiftUI

```swift
import SwiftUI
```

Đoạn mã này biểu thị việc nhập framework SwiftUI.

Các kiểu như View, Text, Image, VStack, v.v. trong SwiftUI đều đến từ framework này.

Nếu không nhập framework SwiftUI, Xcode sẽ báo lỗi:

```
Cannot find type 'View' in scope
```

Cho thấy trình biên dịch không thể nhận diện được kiểu View.

### 3. Cấu trúc View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Lần đầu tiên nhìn thấy cấu trúc View này, bạn có thể cảm thấy lạ lẫm, vì nó bao gồm các từ khóa như struct, View, var, body, some.

Hiện tại chúng ta chưa học những từ khóa này, chỉ cần biết rằng ý nghĩa của đoạn mã này là tạo ra một khung nhìn View có tên là ContentView.

Bạn có thể hiểu View như một bảng vẽ, chúng ta có thể vẽ lên đó, và công cụ để vẽ chính là SwiftUI.

Ví dụ:

![Swift](../../RESOURCE/002_view.png)

Hình ảnh trên hiển thị ba trang, thực chất chính là ba View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Khi chúng ta sử dụng SwiftUI để phát triển App, mỗi trang đều là một View.

### 4. Mã SwiftUI

Bên trong khung nhìn View, hiển thị mã SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Đoạn mã SwiftUI này biểu thị đây là một bố cục dọc, hiển thị một biểu tượng và một đoạn văn bản.

![Swift](../../RESOURCE/002_view1.png)

#### Bố cục VStack

```swift
VStack { }  // Bố cục dọc
```

VStack biểu thị vùng chứa bố cục dọc. Các khung nhìn bên trong được sắp xếp từ trên xuống dưới.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI có ba loại bố cục phổ biến:

- VStack —— Sắp xếp dọc
- HStack —— Sắp xếp ngang
- ZStack —— Sắp xếp chồng lên nhau (trục Z)

```swift
HStack { }  // Sắp xếp ngang
ZStack { }  // Sắp xếp chồng
```

Sơ đồ minh họa sắp xếp của các bố cục:

![Swift](../../RESOURCE/002_view2.png)

Ví dụ: Sử dụng HStack để sắp xếp ngang.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Có thể thấy, biểu tượng trái đất và văn bản được hiển thị theo chiều ngang.

![Swift](../../RESOURCE/002_view3.png)

Khi chúng ta muốn sắp xếp ngang, hãy sử dụng HStack. Khi cần sắp xếp chồng lên nhau, hãy sử dụng ZStack.

#### Image và SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Đoạn mã này hiển thị một biểu tượng trái đất, biểu tượng trái đất đến từ hệ thống biểu tượng SF Symbols của Apple.

![Swift](../../RESOURCE/002_view9.png)

Ý nghĩa của mã là hiển thị một biểu tượng trái đất, kích thước lớn, màu sắc là màu nhấn (tint color).

Ngoài việc hiển thị biểu tượng trái đất, chúng ta còn có thể hiển thị các biểu tượng khác.

Ví dụ, hiển thị một chiếc ba lô:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Làm thế nào để hiển thị các biểu tượng khác?**

Chúng ta cần sử dụng thư viện biểu tượng hệ thống SF Symbols do Apple chính thức cung cấp.

Mở trang web chính thức của Apple Developer và tải xuống [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Mở App SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Bên trái là phân loại ký hiệu, bên phải là các biểu tượng tương ứng.

Nhấp chuột phải vào biểu tượng và chọn "Copy Name" (Sao chép tên), tên sẽ là nội dung chuỗi tương ứng.

Ví dụ:

```
"globe"
"backpack"
"heart"
```

Đưa tên biểu tượng đã sao chép vào Image(systemName:), bạn sẽ có thể hiển thị các biểu tượng khác nhau.

Chú ý: Mỗi biểu tượng SF Symbols đều có phiên bản hệ thống hỗ trợ tối thiểu. Nếu phiên bản hệ thống quá thấp, biểu tượng có thể không hiển thị được. Cần xem thông tin tương thích của nó trong App SF Symbols.

#### Bộ điều chỉnh (Modifier)

Trong SwiftUI, bộ điều chỉnh (modifier) là một phương pháp được sử dụng để thay đổi giao diện hoặc hành vi của khung nhìn.

Có thể hiểu bộ điều chỉnh giống như quần áo, mặc những bộ quần áo khác nhau thì diện mạo thể hiện ra cũng sẽ khác nhau.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale và foregroundStyle chính là các bộ điều chỉnh của khung nhìn Image, chúng tinh chỉnh khung nhìn Image mà không làm thay đổi nội dung của Image.

**1. imageScale**

```swift
.imageScale(.large)
```

Nó có thể kiểm soát kích thước của biểu tượng SF Symbols:

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

Chúng ta có thể thay đổi các tùy chọn khác nhau để biểu tượng SF Symbols hiển thị các kích thước khác nhau.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle có thể kiểm soát màu tiền cảnh (màu chữ/biểu tượng).

.tint biểu thị màu nhấn (accent color) của môi trường hiện tại, mặc định trên iOS là màu xanh lam.

Nếu chúng ta muốn đổi màu tiền cảnh thành màu đỏ:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Khung nhìn Text

Text là khung nhìn văn bản, dùng để hiển thị chuỗi ký tự.

```swift
Text("Hello, world!")
```

Ví dụ, hiển thị tên của tôi:

```swift
Text("FangJunyu")
```

Chú ý: Chuỗi ký tự phải được bọc trong dấu ngoặc kép "".

Bạn có thể thử hiển thị tên, số điện thoại của mình và các nội dung khác.

#### padding (Lề trong)

Trong SwiftUI, padding được sử dụng để thêm khoảng trắng giữa nội dung khung nhìn và đường viền của nó, nó thuộc về “lề trong (padding / content inset)”.

```swift
HStack {
    ...
}
.padding()
```

Đoạn mã trên biểu thị việc thêm lề mặc định của hệ thống vào khung nhìn HStack.

**padding là gì?**

padding biểu thị "khu vực khoảng trắng giữa nội dung khung nhìn và đường viền của nó".

Trong hình dưới đây, sau khi HStack màu xanh lam được cài đặt padding, khu vực màu xanh lam sẽ co lại vào trong, trông có vẻ "nhỏ đi một vòng".

![Swift](../../RESOURCE/002_view6.png)

**Lề mặc định**

Bộ điều chỉnh padding() mặc định sử dụng khoảng cách tiêu chuẩn do hệ thống đề xuất.

```swift
.padding()
```

Trên các nền tảng và ngữ cảnh khác nhau, giá trị này sẽ có sự khác biệt, ví dụ:

- iOS thường là khoảng 16 pt.
- Trên macOS hoặc watchOS, khoảng cách tiêu chuẩn của hệ thống có thể khác nhau, thường sẽ lớn hơn hoặc nhỏ hơn, tùy thuộc vào quy chuẩn thiết kế của từng nền tảng.

**Tùy chỉnh lề**

Cũng có thể cài đặt lề riêng biệt cho khung nhìn.

1. Cài đặt một hướng duy nhất

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Giải thích về hướng:

- .top: Lề trên
- .bottom: Lề dưới
- .leading: Lề trước (trái)
- .trailing: Lề sau (phải)

![Swift](../../RESOURCE/002_view12.png)

Chú ý: leading và trailing sẽ tự động điều chỉnh theo hướng của ngôn ngữ. Ví dụ trong môi trường tiếng Ả Rập (RTL - Phải sang Trái), chúng sẽ tự động đảo ngược.

2. Cài đặt nhiều hướng

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Có thể chỉ định đồng thời nhiều hướng thông qua một mảng. Cách sử dụng cụ thể của mảng sẽ được giải thích chi tiết trong các bài hướng dẫn sau, ở đây chỉ cần hiểu cách viết này là đủ.

3. Cài đặt hướng ngang hoặc hướng dọc

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Tương đương với:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Xóa bỏ lề**

Nếu không muốn có bất kỳ khoảng lề nào, bạn có thể sử dụng .padding(0) để xóa bỏ:

```swift
.padding(0)
```

Hoặc xóa trực tiếp bộ điều chỉnh padding:

```swift
// .padding()
```

### 6. Mã xem trước Preview

```swift
#Preview {
    ContentView()
}
```

Đoạn mã này biểu thị việc tạo ra bản xem trước của khung nhìn ContentView trong Canvas.

Chú ý: #Preview là cú pháp mới được giới thiệu trong Swift 5.9 / Xcode 15, trước đó, cấu trúc PreviewProvider được sử dụng.

**Điều gì sẽ xảy ra nếu chú thích phần Preview?**

Nếu bạn chú thích đi phần Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas sẽ không còn hiển thị nội dung có thể kết xuất (render) nữa.

![Swift](../../RESOURCE/002_xcode.png)

Đó là do #Preview kiểm soát việc Canvas hiển thị khung nhìn xem trước.

Khi chúng ta cần xem trước khung nhìn SwiftUI trong Xcode, hãy thêm mã xem trước #Preview. Nếu không cần khung nhìn xem trước, bạn có thể chú thích hoặc xóa đoạn mã xem trước #Preview đi.

## Tổng kết

Mặc dù tệp ContentView.swift không có nhiều mã, nhưng thực tế nó bao hàm nhiều khái niệm cốt lõi của SwiftUI. Đối với người mới bắt đầu, đoạn mã này có vẻ lạ lẫm, nhưng thông qua việc phân tích cấu trúc mã, bạn có thể thiết lập những hiểu biết ban đầu về SwiftUI.

Nhìn lại nội dung của bài học này, đầu tiên chúng ta đã học về chú thích //, có thể sử dụng chú thích để giải thích logic của mã hoặc tạm thời vô hiệu hóa mã.

Tiếp theo, chúng ta hiểu được rằng các tệp SwiftUI phải nhập framework SwiftUI:

```swift
import SwiftUI
```

Nếu không nhập framework, trình biên dịch sẽ không thể nhận dạng được các kiểu dữ liệu như View.

Sau đó, chúng ta đã tìm hiểu về cấu trúc cơ bản của khung nhìn SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Trong đó ContentView là tên của khung nhìn.

Chúng ta cũng đã học ba vùng chứa bố cục phổ biến: VStack (Sắp xếp dọc), HStack (Sắp xếp ngang) và ZStack (Sắp xếp chồng).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Đoạn mã này mang ý nghĩa hiển thị một vùng chứa được sắp xếp theo chiều dọc, bên trong vùng chứa đó hiển thị một biểu tượng và một đoạn văn bản.

Image có thể hiển thị các biểu tượng SF Symbols, thông qua các bộ điều chỉnh để kiểm soát kích thước và màu sắc của biểu tượng.

Khung nhìn Text có thể hiển thị nội dung văn bản.

padding là lề, giúp thêm một khoảng không gian trong suốt xung quanh khung nhìn.

Cuối cùng là khung nhìn xem trước #Preview, giúp có thể hiển thị khung nhìn xem trước trong Canvas.

### Bài tập về nhà

Đối với người mới bắt đầu, nội dung của bài học này có thể hơi phức tạp. Chúng ta có thể thông qua việc luyện tập thêm để đào sâu mức độ hiểu biết đối với những kiến thức đã học trong bài này:

- Sửa đổi tên biểu tượng SF Symbols
- Đổi màu tiền cảnh của biểu tượng thành màu đen
- Đổi VStack thành HStack
- Chú thích Image hoặc Text, quan sát sự thay đổi của khung nhìn xem trước

### Bất ngờ thú vị (Easter Egg): Tự động hoàn thành mã (Code Completion)

Khi nhập mã, nếu tinh ý bạn có thể đã nhận ra rằng, Xcode sẽ tự động hiển thị danh sách các tùy chọn khả dụng.

Ví dụ, khi chúng ta thay đổi bộ điều chỉnh imageScale:

```swift
.imageScale(.)
```

Xcode sẽ hiển thị các tùy chọn khả dụng:

![Swift](../../RESOURCE/002_view10.png)

Đây thuộc về cơ chế tự động hoàn thành mã (Code Completion), nó dựa trên việc suy luận kiểu và gợi ý thành viên liệt kê (enum), có thể cải thiện hiệu suất nhập liệu và giảm thiểu lỗi.

Trong các bài học tiếp theo, chúng ta sẽ chính thức giới thiệu về kiểu liệt kê (enum), bây giờ chỉ cần tìm hiểu sơ qua một chút.