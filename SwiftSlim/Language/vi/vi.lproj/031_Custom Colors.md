# Màu tùy chỉnh

Trong bài học này, chúng ta sẽ học cách tùy chỉnh màu trong SwiftUI.

Trong các bài học trước, chúng ta đã sử dụng các màu mặc định do SwiftUI cung cấp, ví dụ:

```swift
Color.blue
Color.red
Color.green
```

Những màu này rất tiện khi sử dụng, nhưng trong quá trình phát triển App thực tế, màu mặc định thường chưa đủ chính xác.

Ví dụ, bản thiết kế có thể sử dụng những màu như sau:

```text
#2c54c2
#4875ed
#213e8d
```

Loại màu này được gọi là màu Hex.

Trong bài học này, trước tiên chúng ta sẽ giúp SwiftUI hỗ trợ màu Hex, sau đó dùng `static` để sắp xếp các màu thường dùng.

Cuối cùng, chúng ta sẽ áp dụng màu tùy chỉnh vào giao diện bách khoa động vật, đồng thời sử dụng thêm nền chuyển sắc để nút trông có chiều sâu hơn.

## Vì sao cần màu tùy chỉnh?

Trong SwiftUI, chúng ta có thể sử dụng trực tiếp màu hệ thống.

Ví dụ:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Ở đây, `.blue` biểu thị màu xanh lam. Thực ra đây là cách viết rút gọn của `Color.blue`.

Ưu điểm của màu mặc định là đơn giản và tiện lợi, nhưng lựa chọn màu tương đối hạn chế.

Ví dụ:

```swift
Color.blue
```

Cách viết này chỉ có thể biểu thị màu xanh lam mặc định do SwiftUI cung cấp.

![Color.blue](../../../Resource/031_color6.png)

Tuy nhiên, trong phát triển thực tế, chúng ta thường cần những màu cụ thể hơn.

Ví dụ, cùng là màu xanh lam, nhưng cũng có thể có xanh lam nhạt, xanh lam đậm, xanh lam xám, xanh lam sáng và nhiều hiệu ứng khác.

![More Blue](../../../Resource/031_color5.png)

Lúc này, nếu chỉ dùng `Color.blue`, sẽ rất khó tái hiện đúng hiệu ứng trong thiết kế.

Vì vậy, chúng ta cần giúp SwiftUI hỗ trợ màu tùy chỉnh.

## Màu Hex là gì?

Màu sắc trên màn hình thường được tạo thành từ ba kênh: đỏ, xanh lục và xanh lam, tức là RGB.

RGB lần lượt biểu thị:

```text
Red     // Màu đỏ
Green   // Màu xanh lục
Blue    // Màu xanh lam
```

Màu Hex là một cách biểu diễn màu RGB.

Ví dụ:

```swift
#5479FF
```

Giá trị màu này có thể hiểu đơn giản thành ba phần:

```text
54  // Biểu thị kênh màu đỏ
79  // Biểu thị kênh màu xanh lục
FF  // Biểu thị kênh màu xanh lam
```

Trong bài học này, chúng ta không cần tính toán các giá trị này, cũng không cần hiểu sâu quy tắc hệ thập lục phân.

Hiện tại chỉ cần biết: `#5479FF` biểu thị một màu cụ thể.

Sau này, khi thấy các cách viết như `#2c54c2`, `#4875ed`, chúng ta có thể tạm hiểu chúng là một giá trị màu.

Trong các công cụ thiết kế như Sketch, Figma, Photoshop, chúng ta cũng thường thấy các giá trị màu tương tự.

![color](../../../Resource/031_color.png)

Tuy nhiên, mặc định SwiftUI không thể viết trực tiếp như sau:

```swift
Color(hex: "#5479FF")
```

Vì vậy, chúng ta cần tự mở rộng kiểu `Color`, để nó hỗ trợ tạo màu thông qua chuỗi Hex.

## Tạo tệp Color+Hex.swift

Trước tiên, chúng ta tạo một tệp Swift mới.

Tên tệp có thể viết là:

```text
Color.swift
```

Cũng có thể viết rõ ràng hơn là:

```text
Color+Hex.swift
```

Ở đây khuyến nghị dùng:

```text
Color+Hex.swift
```

Trong dự án Swift, những tên tệp như `Color+Hex.swift` rất thường gặp.

Nó biểu thị rằng tệp này là tệp extension dùng để thêm khả năng Hex cho `Color`.

Tên tệp không ảnh hưởng trực tiếp đến việc chạy code, mà chỉ giúp chúng ta dễ hiểu hơn mục đích của tệp này.

## Thêm code Color(hex:)

Trong tệp `Color+Hex.swift`, nhập đoạn code sau:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Đoạn code này dùng `extension` để mở rộng kiểu `Color`, đồng thời thêm cho `Color` một phương thức khởi tạo mới:

```swift
init(hex: String)
```

Sau khi có phương thức khởi tạo này, chúng ta có thể truyền chuỗi Hex cho `Color`, từ đó tạo một màu tùy chỉnh:

```swift
Color(hex: "#5479FF")
```

Bên trong đoạn extension này, chuỗi Hex sẽ được chuyển đổi thành màu RGB mà SwiftUI có thể nhận biết.

Ở giai đoạn hiện tại, không cần hiểu sâu logic chuyển đổi của từng dòng. Chỉ cần biết rằng phương thức `Color(hex:)` được thêm vào có thể giúp chúng ta tạo màu tùy chỉnh thông qua giá trị màu Hex.

## Sử dụng màu tùy chỉnh

Bây giờ, chúng ta có thể kiểm tra màu tùy chỉnh trong `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Hiệu quả hiển thị:

![color](../../../Resource/031_color1.png)

Trong ví dụ này, dòng đầu tiên sử dụng màu hệ thống:

```swift
.foregroundStyle(Color.blue)
```

Ba dòng phía sau sử dụng màu Hex tùy chỉnh:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Qua đối chiếu, có thể thấy màu xanh lam hệ thống chỉ có một hiệu ứng mặc định.

Trong khi đó, màu Hex có thể biểu thị các biến thể xanh lam chi tiết hơn.

Đây chính là giá trị của màu tùy chỉnh: nó có thể giúp màu sắc giao diện gần hơn với thiết kế thật, đồng thời giúp chúng ta kiểm soát phong cách thị giác của App dễ hơn.

## Dùng static để sắp xếp màu

Bây giờ, chúng ta đã có thể tạo màu thông qua chuỗi Hex:

```swift
Color(hex: "#2c54c2")
```

Cách viết này có thể sử dụng bình thường, nhưng nếu cùng một màu xuất hiện lặp lại ở nhiều nơi, việc bảo trì về sau sẽ không tiện.

Nếu giá trị màu này được viết ở 10 vị trí, sau này khi muốn chỉnh màu xanh lam này, chúng ta phải sửa từng vị trí một.

Lúc này, chúng ta có thể dùng `static` để thống nhất sắp xếp các màu thường dùng.

Ở cuối tệp `Color+Hex.swift`, tiếp tục thêm đoạn code sau:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Ở đây, chúng ta đã thêm ba thuộc tính tĩnh cho `Color`: `animalBlue`, `animalLightBlue` và `animalDarkBlue`; chúng lần lượt biểu thị các sắc độ xanh lam khác nhau.

Vì những thuộc tính này sử dụng `static`, nên chúng thuộc về chính kiểu `Color`.

Khi sử dụng, có thể truy cập trực tiếp thông qua `Color.`:

```swift
Color.animalBlue
```

Cách viết này rõ ràng hơn so với việc viết trực tiếp chuỗi Hex.

Khi nhìn thấy `Color.animalBlue`, chúng ta có thể biết nó biểu thị màu xanh lam được dùng trong bách khoa động vật.

Còn khi nhìn thấy `Color(hex: "#2c54c2")`, chúng ta chỉ biết đó là một giá trị màu, nhưng không dễ nhìn ra mục đích cụ thể của nó.

Quản lý màu tập trung còn có một lợi ích khác: chỉnh sửa về sau thuận tiện hơn.

Nếu muốn điều chỉnh màu chủ đạo của bách khoa động vật, chỉ cần sửa tại vị trí định nghĩa:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Tất cả những nơi sử dụng màu này sẽ được cập nhật cùng lúc.

Đây chính là ý nghĩa của việc dùng `static` để sắp xếp màu: giúp tên màu rõ ràng hơn, đồng thời giúp việc bảo trì sau này thuận tiện hơn.

## Áp dụng vào bách khoa động vật

Bây giờ, chúng ta có thể áp dụng màu tùy chỉnh vào giao diện bách khoa động vật ở phần trước.

Trước đây, nền của nút động vật là màu trắng:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Bây giờ, chúng ta có thể đổi thành màu tùy chỉnh:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Ở đây, `Color.animalBlue` chính là màu tĩnh mà chúng ta vừa định nghĩa trong `Color+Hex.swift`.

Chữ trên nút sử dụng màu trắng:

```swift
.foregroundStyle(Color.white)
```

Nền của emoji động vật sử dụng màu trắng bán trong suốt:

```swift
.background(Color.white.opacity(0.15))
```

Như vậy, nút sẽ tạo thành một phong cách thị giác xanh lam thống nhất.

Trọng điểm của bước này không phải là thêm code phức tạp, mà là thật sự áp dụng màu tùy chỉnh đã học ở phần trước vào giao diện.

## Sử dụng nền chuyển sắc

Ngoài việc sử dụng một màu đơn, chúng ta cũng có thể kết hợp nhiều màu thành hiệu ứng chuyển sắc.

Ví dụ, phía trước chúng ta đã định nghĩa các màu này:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Những màu này không chỉ có thể sử dụng riêng lẻ, mà cũng có thể kết hợp thành nền chuyển sắc.

Trong SwiftUI, có thể dùng `LinearGradient` để tạo chuyển sắc tuyến tính.

Ví dụ:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Đoạn code này sẽ tạo một nền chuyển sắc từ trái sang phải, màu chuyển dần từ `Color.animalBlue` sang `Color.animalLightBlue`.

Trong đó, `colors` dùng để thiết lập các màu tham gia vào chuyển sắc, còn `startPoint` và `endPoint` dùng để điều khiển hướng chuyển sắc.

### Kiểm tra hiệu ứng chuyển sắc

Chúng ta có thể dùng một Text đơn giản để kiểm tra nền chuyển sắc.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Hiệu quả hiển thị:

![color](../../../Resource/031_color3.png)

Trong ví dụ này, nền của `Text` không còn là một màu đơn nữa, mà là màu chuyển sắc thay đổi dần từ trái sang phải.

So với nền màu thông thường, nền chuyển sắc có nhiều tầng lớp hơn, đồng thời dễ tạo điểm nhấn thị giác cho giao diện hơn.

## Sử dụng nền chuyển sắc trong bách khoa động vật

Bây giờ, chúng ta có thể đổi màu nền của nút động vật:

```swift
.background(Color.animalBlue)
```

Thành nền chuyển sắc:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Code hoàn chỉnh như sau:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Hiệu quả hiển thị:

![color](../../../Resource/031_color4.png)

Bây giờ, nút động vật không còn chỉ là một màu nền đơn nữa, mà có hiệu ứng chuyển sắc từ trái sang phải.

So với nền đơn sắc, nền chuyển sắc có thể khiến giao diện trông có chiều sâu hơn, đồng thời gần hơn với thiết kế thị giác trong App thật.

## Sự khác biệt giữa nền đơn sắc và nền chuyển sắc

Nền đơn sắc chỉ sử dụng một màu.

Ví dụ:

```swift
.background(Color.animalBlue)
```

Cách viết này đơn giản, rõ ràng, phù hợp với phần lớn giao diện cơ bản.

Nền chuyển sắc sử dụng nhiều màu.

Ví dụ:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Cách viết này có thể giúp giao diện có nhiều tầng lớp hơn, nhưng cũng dễ làm tăng độ phức tạp thị giác hơn.

Vì vậy, trong phát triển thực tế, có thể hiểu như sau:

Nền đơn sắc phù hợp với văn bản thông thường, nút thông thường, thẻ thông thường và nền trang thông thường.

Nền chuyển sắc phù hợp với nút quan trọng, khu vực đầu trang, thẻ bìa, lối vào tính năng và những vị trí cần được nhấn mạnh.

## Tổng kết

Trong bài học này, chúng ta đã học cách sử dụng màu tùy chỉnh trong SwiftUI.

Trước tiên, chúng ta đã tìm hiểu màu Hex.

Ví dụ:

```text
#2c54c2
```

Nó biểu thị một màu cụ thể.

Sau đó, chúng ta dùng `extension Color` để mở rộng kiểu `Color`.

Điều này cho phép SwiftUI tạo màu bằng cách sau:

```swift
Color(hex: "#2c54c2")
```

Tiếp theo, chúng ta dùng `static` để sắp xếp các màu thường dùng:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Như vậy, trong các view khác, chúng ta có thể sử dụng trực tiếp:

```swift
Color.animalBlue
```

So với việc mỗi lần đều viết chuỗi Hex, cách này rõ ràng hơn và cũng thuận tiện hơn khi cần chỉnh sửa màu thống nhất về sau.

Cuối cùng, chúng ta đã học `LinearGradient`, đồng thời kết hợp màu tùy chỉnh thành nền chuyển sắc:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Thông qua bài học này, chúng ta đã hoàn thành quá trình từ “tạo màu tùy chỉnh” đến “sử dụng màu trong giao diện thật”.

Sau này, khi một màu cần được sử dụng lặp lại ở nhiều nơi, có thể ưu tiên cân nhắc sắp xếp nó vào extension của `Color`.

Như vậy code sẽ rõ ràng hơn, và phong cách giao diện cũng dễ thống nhất hơn.
