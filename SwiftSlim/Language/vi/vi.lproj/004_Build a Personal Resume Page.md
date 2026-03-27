# Xây dựng trang hồ sơ cá nhân

Trong bài học này, chúng ta sẽ tạo một khung nhìn hồ sơ cá nhân đơn giản và học các kiến thức sau:

- cornerRadius
- spacing
- ScrollView

Trong quá trình xây dựng, chúng ta sẽ ôn lại các kiến thức về bố cục, Text và Image, đồng thời thực hiện việc kiểm soát khoảng cách và hiệu ứng cuộn nội dung.

## Hồ sơ cá nhân

Hiệu ứng mục tiêu:

![Swift](../../RESOURCE/004_img.png)

**Vui lòng thử tự hoàn thành trước, sau đó tiếp tục đọc phần giải thích bên dưới.**

### Tạo dự án

Tạo một dự án iOS mới hoặc tiếp tục sử dụng dự án trước đó.

Mã ContentView mặc định:

```swift
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
```

Bây giờ hãy xóa mã đi và bắt đầu viết nội dung của riêng bạn:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Cấu trúc tổng thể

Trong quá trình phát triển thực tế, chúng ta thường thiết kế cấu trúc tổng thể trước.

Trang của chúng ta bao gồm:

1. Tiêu đề
2. Thông tin cá nhân
3. Giới thiệu bản thân

Chúng ta thêm một VStack ở lớp ngoài cùng:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack có thể đảm bảo các khung nhìn được sắp xếp theo chiều dọc, đồng thời có thể kiểm soát sự sắp xếp và khoảng cách của các khung nhìn.

### Tiêu đề

Đầu tiên, chúng ta tạo một Text để hiển thị tiêu đề.

Ở đây, tôi sẽ hiển thị tiêu đề là tên tiếng Anh của mình:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Tiêu đề thường được phóng to và in đậm, ở đây sử dụng các bộ điều chỉnh font và fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Dàn trang

Căn chỉnh mặc định của SwiftUI là center, hiện tại tiêu đề hiển thị ở vị trí chính giữa của ContentView.

![Swift](../../RESOURCE/004_img3.png)

Chúng ta cần hiển thị tiêu đề ở trên cùng của khung nhìn, có thể sử dụng Spacer để thực hiện điều chỉnh bố cục:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer sẽ chiếm không gian còn lại, đẩy Text lên phía trên của vùng chứa.

![Swift](../../RESOURCE/004_img4.png)

### Khoảng trắng

Nếu bạn cho rằng phần văn bản quá gần với đỉnh, bạn có thể sử dụng padding hoặc Spacer.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Thiết lập lề trên (padding top) của VStack là 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Cũng có thể sử dụng Spacer, thiết lập chiều cao của frame, để có được một khoảng trắng với chiều cao được chỉ định.

Hiệu ứng đạt được:

![Swift](../../RESOURCE/004_img5.png)

### Hình ảnh

Chúng ta chuẩn bị một bức ảnh chân dung của bản thân, đưa vào thư mục tài nguyên Assets.

![Swift](../../RESOURCE/004_img6.png)

Sử dụng Image trong ContentView để hiển thị hình ảnh:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Vì kích thước gốc của hình ảnh khá lớn, chúng ta cần sử dụng frame để kiểm soát kích thước hiển thị.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Lúc này chúng ta sẽ phát hiện ra một vấn đề:

Nếu tỷ lệ chiều rộng và chiều cao của frame không nhất quán với tỷ lệ gốc của hình ảnh, hình ảnh sẽ bị biến dạng.

Ví dụ:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Để tránh hình ảnh bị biến dạng, chúng ta cần sử dụng scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Tác dụng của scaledToFit là:

Trong phạm vi frame đã cho, thu phóng theo tỷ lệ gốc của hình ảnh và hiển thị trọn vẹn nội dung hình ảnh.

Nó sẽ không cưỡng ép kéo giãn hình ảnh để lấp đầy toàn bộ frame, mà giữ nguyên tỷ lệ chiều rộng và chiều cao không đổi, thu phóng theo cùng tỷ lệ, cho đến khi một cạnh vừa vặn khớp với ranh giới.

Điều này có nghĩa là:

- Nếu chiều rộng của frame nhỏ hơn, hình ảnh sẽ dùng chiều rộng làm hệ quy chiếu để thu phóng.
- Nếu chiều cao của frame nhỏ hơn, hình ảnh sẽ dùng chiều cao làm hệ quy chiếu để thu phóng.
- Hình ảnh luôn giữ tỷ lệ gốc, không bị biến dạng.

Thông thường có thể thiết lập kích thước theo một hướng. Ví dụ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Như vậy hệ thống sẽ tự động tính toán chiều cao phù hợp dựa trên chiều rộng 140, đồng thời giữ nguyên tỷ lệ hình ảnh.

Nếu cần cố định tỷ lệ khung hình hoặc tránh bị nén trong các bố cục phức tạp, có thể ràng buộc đồng thời cả chiều rộng và chiều cao.

### Bo góc

Nếu bạn muốn hình ảnh hiển thị dưới dạng bo góc, có thể sử dụng bộ điều chỉnh cornerRadius:

```swift
.cornerRadius(10)
```

Ví dụ:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Thêm cornerRadius(20) vào sau bộ điều chỉnh của Image.

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) biểu thị việc cắt ranh giới của khung nhìn và áp dụng bán kính bo góc là 20.

Sau khi thêm bo góc, bốn góc của hình ảnh sẽ trở thành hình vòng cung, làm cho hiệu ứng hình ảnh mềm mại và hiện đại hơn.

Phong cách thiết kế này rất phổ biến trong thiết kế giao diện hiện tại, ví dụ như biểu tượng ứng dụng của iOS đã áp dụng hình dạng chữ nhật bo góc (tuy nhiên biểu tượng hệ thống sử dụng hình siêu elip với độ cong liên tục, chứ không phải bo góc đơn giản).

### Thông tin cá nhân

Bây giờ bắt đầu thực hiện khu vực thông tin cá nhân ở bên trái hình ảnh. Từ cấu trúc giao diện có thể thấy, thông tin cá nhân và hình ảnh được sắp xếp theo chiều ngang, cần sử dụng HStack để sắp xếp.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Nội dung thông tin cá nhân được sắp xếp theo chiều dọc.

![Swift](../../RESOURCE/004_img11.png)

Do đó, lớp ngoài dùng HStack, thông tin cá nhân dùng VStack, nội dung văn bản dùng Text.

Cấu trúc cơ bản:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**In đậm tiêu đề trường**

Để phân biệt giữa tên trường và giá trị trường, có thể sử dụng fontWeight cho tên trường:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Căn trái văn bản**

VStack mặc định là căn giữa, nếu muốn toàn bộ văn bản căn trái, cần thiết lập cách căn chỉnh:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading biểu thị việc căn chỉnh theo bên trái (trong môi trường ngôn ngữ từ trái sang phải).

![Swift](../../RESOURCE/004_img14.png)

### Khoảng cách

Nếu bạn muốn giữ một khoảng cách cố định giữa thông tin cá nhân và hình ảnh, trước đây chúng ta đã học cách dùng Spacer để tạo khoảng trắng:

```swift
Spacer()
    .frame(width: 10)
```

Cũng có thể sử dụng tham số spacing của HStack:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 biểu thị khoảng cách giữa hai khung nhìn con là 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**spacing là gì?**

Trong VStack, HStack, ZStack, spacing có thể kiểm soát khoảng cách giữa các khung nhìn con.

Ví dụ:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Khoảng cách giữa các khung nhìn con trong VStack sẽ được thiết lập là 10pt.

![Swift](../../RESOURCE/004_img16.png)

Cần lưu ý rằng, spacing chỉ tác dụng lên "các khung nhìn con trực tiếp", sẽ không ảnh hưởng đến bố cục bên trong các vùng chứa lồng nhau.

**Kiểm soát khoảng cách bên trong danh sách**

Nếu muốn tăng khoảng cách giữa các trường, cách trực tiếp nhất là thiết lập spacing cho VStack:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Như vậy khoảng cách giữa tất cả các khung nhìn con đều sẽ trở thành 10 pt.

Nhưng quan sát giao diện sẽ phát hiện ra một vấn đề:

Giữa các nhóm trường có khoảng cách, đồng thời giữa tên trường và giá trị trường cũng xuất hiện khoảng cách tương tự.

Điều này là do spacing tác dụng lên toàn bộ các khung nhìn con trực tiếp của vùng chứa hiện tại.

Trong cấu trúc này, mỗi Text đều là một khung nhìn con trực tiếp của VStack lớp ngoài, do đó khoảng cách là đồng nhất.

Nếu muốn có khoảng cách giữa các nhóm trường, còn giữa tên trường và giá trị trường giữ nguyên khoảng cách gần gọn mặc định, có thể xem "tên trường + giá trị trường" như một tổng thể logic, và bọc bên ngoài bằng một VStack:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Lúc này cấu trúc trở thành giữa các VStack lớp ngoài có khoảng cách, giữa các VStack lớp trong có khoảng cách gần gọn mặc định, do đó giữa tên trường và giá trị trường sẽ không xuất hiện khe hở thừa.

![Swift](../../RESOURCE/004_img18.png)

### Giới thiệu bản thân

Tiếp theo thực hiện khu vực giới thiệu bản thân.

Nhìn từ cấu trúc giao diện, nội dung giới thiệu bao gồm nhiều dòng văn bản, văn bản được sắp xếp theo chiều dọc.

![Swift](../../RESOURCE/004_img19.png)

Do đó, có thể sử dụng VStack kết hợp với Text:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Tăng khoảng cách**

Hiện tại phần thông tin cá nhân và giới thiệu bản thân khá sát nhau, kiểu dáng không được đẹp mắt.

![Swift](../../RESOURCE/004_img20.png)

Vì chúng đều nằm trong cùng một vùng chứa lớp ngoài, nên có thể kiểm soát khoảng cách tổng thể trên vùng chứa lớp ngoài:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Hiệu ứng đạt được:

![Swift](../../RESOURCE/004_img21.png)

**Khoảng cách danh sách**

Sử dụng spacing để thiết lập khoảng cách giữa các văn bản giới thiệu bản thân:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Hoàn thành hồ sơ cá nhân

Bây giờ, bộ khung cơ bản cho hồ sơ cá nhân của chúng ta đã hoàn thành.

![Swift](../../RESOURCE/004_img.png)

### Khung nhìn cuộn (ScrollView)

Hiện tại cấu trúc trang đang sử dụng VStack, khi số lượng văn bản giới thiệu ít thì không có vấn đề gì, nhưng nếu tăng lên 20 dòng, 30 dòng hoặc thậm chí nhiều hơn, chiều cao của nội dung sẽ vượt quá màn hình.

Ví dụ:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Lúc này sẽ xuất hiện hai hiện tượng:

- Nội dung phía dưới bị cắt bớt
- Trang không thể cuộn

Đây không phải là vấn đề của VStack, VStack chỉ là một vùng chứa bố cục, nó sẽ không tự động cung cấp khả năng cuộn.

**ScrollView là gì**

ScrollView là một vùng chứa có thể cuộn, phù hợp với lượng lớn nội dung vượt quá kích thước màn hình. Ví dụ như danh sách dọc hoặc ngang.

Cấu trúc cơ bản:

```swift
ScrollView {
    ...
}
```

Nếu muốn tạo hiệu ứng cuộn, cần phải bọc toàn bộ nội dung trang bên trong ScrollView:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Bằng cách này, toàn bộ trang trở thành một khu vực có thể cuộn, khi nội dung vượt quá chiều cao màn hình, nó có thể cuộn một cách tự nhiên.

ScrollView mặc định sẽ hiển thị thanh cuộn chỉ thị, nếu muốn ẩn thanh cuộn, có thể thiết lập:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Mã hoàn chỉnh

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```