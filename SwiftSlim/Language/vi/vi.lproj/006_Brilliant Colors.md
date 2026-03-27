# Những màu sắc rực rỡ

Trong bài học này, chúng ta sẽ tìm hiểu các bộ điều chỉnh (modifier) trực quan phổ biến trong SwiftUI, bao gồm:

- Màu sắc
- Màu tiền cảnh
- Màu nền
- Độ lệch (Offset)
- Độ trong suốt (Opacity)
- Độ mờ (Blur)

Chúng ta cũng sẽ tìm hiểu về Safe Area (Vùng an toàn).

Các bộ điều chỉnh này được sử dụng để kiểm soát diện mạo của khung nhìn, giúp giao diện trở nên rõ ràng và có chiều sâu hơn.

## Màu sắc

Trong SwiftUI, bạn có thể thiết lập màu sắc cho văn bản.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue biểu thị màu xanh lam, thực chất đây là cách viết rút gọn của Color.blue (suy luận kiểu).

Các màu sắc thường gặp bao gồm:

```
.black
.green
.yellow
.pink
.gray
...
```

Đây đều là các thuộc tính tĩnh của Color.

![Color](../../RESOURCE/006_color.png)

Có thể hiểu Color là một kiểu màu sắc, .blue, .red đều là các màu cụ thể của nó.

### Khung nhìn Color

Trong SwiftUI, Color cũng có thể được hiển thị như một khung nhìn.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Đoạn mã này sẽ tạo ra một khối vuông màu đỏ có kích thước 100x100.

Cũng có thể để toàn bộ giao diện hiển thị một màu sắc nào đó:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Sau khi chạy, có thể thấy màu đỏ không phủ kín toàn bộ màn hình, phần trên và phần dưới của iPhone vẫn là màu trắng, điều này liên quan đến sự tồn tại của Safe Area (Vùng an toàn).

## Safe Area (Vùng an toàn)

Safe Area là khu vực được hệ thống dành riêng để tránh nội dung bị che khuất, bao gồm:

1. Thanh trạng thái ở trên cùng (thời gian, pin)

2. Thanh chỉ thị Home ở dưới cùng

3. Khu vực tai thỏ (notch) hoặc Dynamic Island (Đảo động)

![Color](../../RESOURCE/006_color3.png)

Mặc định, SwiftUI sẽ giới hạn nội dung bên trong vùng an toàn, do đó khung nhìn sẽ không mở rộng đến các cạnh của màn hình.

### Bỏ qua Safe Area (Vùng an toàn)

Nếu muốn màu sắc phủ kín toàn bộ màn hình, có thể sử dụng ignoresSafeArea:

```swift
Color.red
    .ignoresSafeArea()
```

Hoặc sử dụng edgesIgnoringSafeArea:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Như vậy khung nhìn sẽ mở rộng ra toàn bộ màn hình.

Cần lưu ý rằng, edgesIgnoringSafeArea là cách viết cũ hơn, từ iOS 14 trở đi, khuyến nghị sử dụng ignoresSafeArea.

## Màu tiền cảnh

### Bộ điều chỉnh foregroundStyle

Trong các bài học trước, chúng ta đã học cách dùng foregroundStyle để thiết lập màu sắc.

Ví dụ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle là hệ thống kiểu dáng mới, hỗ trợ màu sắc, độ chuyển màu (gradient), chất liệu (material), v.v.

![Color](../../RESOURCE/006_color2.png)

### Bộ điều chỉnh foregroundColor

foregroundColor cũng có thể thiết lập màu sắc:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Cách sử dụng giống như foregroundStyle.

Trong các phiên bản Xcode mới nhất, Xcode sẽ đưa ra cảnh báo rằng foregroundColor có thể không được hỗ trợ trong các phiên bản iOS tương lai, do đó khuyến nghị ưu tiên sử dụng foregroundStyle.

## Hình nền

Nếu muốn thêm màu nền cho khung nhìn, có thể sử dụng background:

```swift
background(.red)
```

Ví dụ, thêm màu nền cho văn bản:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Khi chọn văn bản trong các ứng dụng như Word, Chrome, v.v., chúng ta có thể thấy hiệu ứng màu nền tương tự.

![Color](../../RESOURCE/006_color16.png)

Nếu muốn mở rộng phần nền, cần kết hợp với padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Ở đây cần chú ý một quy tắc quan trọng:

Các bộ điều chỉnh trong SwiftUI xây dựng khung nhìn từ trên xuống dưới. Bộ điều chỉnh được viết sau sẽ tác dụng lên kết quả của phần trước.

Do đó:

```swift
.padding()
.background()
```

Điều này có nghĩa là phần nền sẽ bao bọc khung nhìn sau khi đã được thêm lề trong.

Nếu viết ngược lại thứ tự:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Phần nền sẽ không được mở rộng, bởi vì nền không bao bọc phần padding phía sau.

## Ví dụ - Đai ốc bốn cạnh

Bây giờ, chúng ta sẽ tạo một khung nhìn đai ốc bốn cạnh đơn giản.

![Color](../../RESOURCE/006_color8.png)

Đầu tiên tạo một khối vuông màu trắng 50 x 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Nếu muốn biến thành hình tròn, có thể sử dụng cornerRadius:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Khi bán kính góc bo bằng một nửa chiều rộng và chiều cao, nó sẽ biến thành hình tròn.

Bây giờ, thêm một nền màu xanh lam:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

padding mới được thêm sẽ mở rộng khu vực lớp ngoài, background sẽ vẽ màu xanh lam trên khu vực lớp ngoài đó.

Bây giờ chúng ta đã hoàn thành hiệu ứng đai ốc bốn cạnh.

### Một hướng tiếp cận khác

Ngoài việc sử dụng màu nền để hoàn thành đai ốc bốn cạnh, cũng có thể sử dụng ZStack để thực hiện.

Trước đây chúng ta đã học ZStack có thể thực hiện việc sắp xếp xếp chồng, đai ốc bốn cạnh cũng có thể được hiểu là sự xếp chồng hiển thị của một hình tròn và một hình chữ nhật.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack sẽ xếp chồng các khung nhìn theo thứ tự, khung nhìn được thêm vào sau sẽ hiển thị ở lớp trên.

## Ví dụ - Hai hình tròn chồng lên nhau

Rất nhiều biểu tượng được tạo thành từ sự xếp chồng của các hình khối đơn giản, ví dụ như hai hình tròn chồng lên nhau.

![Color](../../RESOURCE/006_color14.png)

Đầu tiên, tạo hai hình tròn:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Bởi vì cần để hai hình tròn hiển thị xếp chồng lên nhau, nên sử dụng bố cục ZStack:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Lúc này, hai hình tròn có kích thước bằng nhau hoàn toàn xếp chồng lên nhau.

Chúng ta cần làm cho hai hình tròn chồng lên nhau một phần, thay vì che khuất hoàn toàn, có thể sử dụng offset để tạo hiệu ứng dịch chuyển.

## Độ lệch (Offset)

offset chỉ thay đổi vị trí vẽ của khung nhìn, không ảnh hưởng đến việc tính toán bố cục của khung nhìn cha.

Cách sử dụng:

```swift
.offset(x:y:)
```

x là độ lệch theo hướng ngang, y là độ lệch theo hướng dọc.

Giá trị dương biểu thị độ lệch sang phải/xuống dưới, giá trị âm biểu thị độ lệch sang trái/lên trên.

Sử dụng offset để thiết lập hai hình tròn chồng lên nhau một phần:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Vị trí của hình tròn màu đỏ trong bố cục không thay đổi, nhưng vị trí vẽ của nó đã dịch chuyển sang trái 25 điểm. Do đó hai hình tròn tạo ra hiệu ứng thị giác chồng lên nhau một phần.

## Độ trong suốt (Opacity)

Trong SwiftUI, opacity được sử dụng để thiết lập độ trong suốt của khung nhìn.

Cách sử dụng cơ bản:

```swift
.opacity(0.5)
```

Phạm vi tham số của opacity là từ 0.0 đến 1.0, trong đó:

- 0 biểu thị hoàn toàn trong suốt
- 1 biểu thị không trong suốt

Có thể sử dụng opacity để thiết lập độ trong suốt cho hình tròn màu cam:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Sau khi thiết lập opacity của hình tròn màu cam thành 0.8, độ không trong suốt của nó là 80%, khi hai hình tròn xếp chồng lên nhau, khu vực chồng chéo sẽ tạo ra hiệu ứng pha trộn màu sắc.

## Độ mờ (Blur)

Trong SwiftUI, có thể sử dụng blur để thiết lập hiệu ứng làm mờ:

```swift
.blur(radius:10)
```

radius xác định bán kính làm mờ, giá trị càng lớn, hiệu ứng làm mờ càng rõ rệt.

Chúng ta có thể thêm hiệu ứng làm mờ cho hai hình tròn:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Cuối cùng, chúng ta có thể nhìn thấy hai hình tròn rất mờ.

## Tổng kết

Bài học này xoay quanh các bộ điều chỉnh trực quan phổ biến trong SwiftUI, tìm hiểu cách kiểm soát màu sắc, vị trí và hiệu ứng hình ảnh của khung nhìn thông qua các bộ điều chỉnh.

Thông qua các ví dụ cụ thể, có thể thấy được tác dụng thực tế của các bộ điều chỉnh trực quan khác nhau trong giao diện, và hiểu biết thêm kiến thức về vùng an toàn.

Đây đều là những bộ điều chỉnh rất cơ bản, chúng ta có thể luyện tập và sử dụng nhiều hơn, điều này sẽ giúp ích cho việc kiểm soát hiệu ứng giao diện một cách rõ ràng hơn trong quá trình phát triển thực tế.

### Bài tập sau giờ học

- Thêm hiệu ứng trong suốt và làm mờ cho một bức ảnh
- Thiết lập ba hình tròn xếp chồng lên nhau với các độ trong suốt khác nhau
- Tạo một hình nền phủ kín toàn bộ màn hình, và bỏ qua vùng an toàn
- Sử dụng offset để điều chỉnh vị trí của nhiều khung nhìn

Mục đích của việc luyện tập không phải là ghi nhớ API, mà là quan sát mối quan hệ giữa sự thay đổi trực quan và hành vi bố cục.