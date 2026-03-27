# Swift và SwiftUI

Khi học phát triển trên nền tảng Apple, nhiều hướng dẫn có xu hướng giải thích Swift và SwiftUI tách biệt nhau, điều này dễ khiến người mới bắt đầu có cảm giác bị phân mảnh, hiểu lầm rằng chúng là hai công nghệ hoàn toàn độc lập.

Thực tế, Swift và SwiftUI là một thể thống nhất được tích hợp sâu sắc: Swift là ngôn ngữ lập trình, chịu trách nhiệm cung cấp logic và dữ liệu; còn SwiftUI là framework giao diện người dùng được xây dựng dựa trên Swift, chịu trách nhiệm kết xuất và tương tác của View (giao diện).

Bài học này sẽ giúp bạn xây dựng một khung nhận thức rõ ràng: Swift là gì, SwiftUI là gì và làm thế nào chúng phối hợp với nhau trong mã nguồn.

## Swift là gì?

Swift là một ngôn ngữ lập trình hiện đại do Apple giới thiệu, được sử dụng để phát triển các ứng dụng trên các nền tảng như iOS, macOS, watchOS và tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift là một ngôn ngữ kiểu tĩnh (statically typed), định kiểu mạnh (strongly typed), được thiết kế chú trọng hơn vào tính an toàn, giảm thiểu nhiều lỗi lập trình phổ biến (như con trỏ null, vượt quá giới hạn mảng, v.v.) và hỗ trợ tích hợp liền mạch với C và Objective-C.

Trong thực tế phát triển, Swift chủ yếu chịu trách nhiệm cho phần logic của ứng dụng, chẳng hạn như xử lý dữ liệu, yêu cầu mạng, thao tác lưu trữ, v.v.

## SwiftUI là gì?

SwiftUI là một framework xây dựng giao diện mới được Apple ra mắt vào năm 2019. SwiftUI áp dụng mô hình lập trình khai báo (declarative programming), cho phép các nhà phát triển sử dụng mã nguồn ngắn gọn hơn để mô tả cấu trúc giao diện và hành vi tương tác.

![swiftui](../../RESOURCE/010_swiftui.png)

Lập trình khai báo có nghĩa là nhà phát triển chỉ cần cho hệ thống biết họ muốn hiển thị những gì, và hệ thống sẽ tự động làm mới View dựa trên những thay đổi của dữ liệu. Thay vì phải cập nhật trạng thái giao diện một cách thủ công, điều này giúp đơn giản hóa đáng kể sự phức tạp của việc phát triển UI.

Cốt lõi của SwiftUI là các thành phần View (như Text, Image, Button, v.v.) và các bộ chứa bố cục (như VStack, HStack, ZStack). Các thành phần này tương tác thông qua liên kết dữ liệu (data binding) và quản lý trạng thái, cho phép giao diện phản hồi lại các thay đổi của dữ liệu và tự động làm mới.

## Swift và SwiftUI phối hợp như thế nào?

Trách nhiệm của Swift và SwiftUI có thể được tóm tắt trong các điểm sau:

**1. Swift: Xử lý logic và dữ liệu**

Swift chủ yếu được sử dụng để quản lý dữ liệu, lưu trữ trạng thái và thực thi logic. Những đoạn mã này thường không ảnh hưởng trực tiếp đến việc kết xuất (render) giao diện, mà chịu trách nhiệm xử lý dữ liệu và hành vi.

Ví dụ, xử lý dữ liệu trong Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Những đoạn mã này liên quan đến khai báo biến, định nghĩa hằng số, hàm, luồng điều khiển (control flow), v.v. và không ảnh hưởng trực tiếp đến việc hiển thị của View.

**2. SwiftUI: Khai báo và kết xuất giao diện**

Mặt khác, SwiftUI được sử dụng để xây dựng bố cục và nội dung của giao diện người dùng, chủ yếu chịu trách nhiệm kết xuất giao diện và tương tác của View.

Ví dụ, tạo một Text view bằng SwiftUI:

```swift
Text("SwiftSlim")
```

Đây đều là những đoạn mã được sử dụng để xây dựng và kiểm soát các phần tử giao diện, tương tác trực tiếp với giao diện người dùng.

### Ví dụ cơ bản

Dưới đây là một ví dụ SwiftUI đơn giản:

```swift
// ContentView.swift

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

Trong ví dụ này:

**Mã SwiftUI**: VStack, Image, Text, padding đều thuộc về SwiftUI, chịu trách nhiệm hiển thị và bố cục của giao diện.

**Mã Swift**: Các chú thích // ở đầu tệp và import SwiftUI thuộc về cấu trúc mã Swift; #Preview ở dưới cùng là một macro được sử dụng để xem trước trong Xcode, không tham gia vào quá trình kết xuất giao diện thực tế.

### Ví dụ nâng cao

Trong các dự án thực tế, Swift và SwiftUI thường được sử dụng kết hợp để hoàn thành các nhiệm vụ mà chúng giỏi nhất:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Trong ví dụ này:

**Mã SwiftUI**: @State là một property wrapper (trình bọc thuộc tính) đặc thù của SwiftUI, được sử dụng để khai báo trạng thái có thể thay đổi của View; Button và Text là các thành phần View của SwiftUI, chịu trách nhiệm hiển thị giao diện và tương tác với người dùng.

**Mã Swift**: private var name và func printName() là mã Swift, được sử dụng để lưu trữ dữ liệu và thực thi logic, không ảnh hưởng trực tiếp đến việc kết xuất View.

Khi người dùng nhấn nút, SwiftUI sẽ kích hoạt mã thao tác bên trong nút:

```swift
Button("Print") {
    printName()
}
```

Trong đó, Button là thành phần của SwiftUI, trong khi hàm printName() được thực thi lại là mã Swift, chịu trách nhiệm xử lý logic cụ thể.

Sự hợp tác này cho phép Swift và SwiftUI kết hợp hoàn hảo với nhau, Swift đảm nhận phần xử lý dữ liệu và logic, còn SwiftUI lo phần hiển thị giao diện người dùng.

## Mã Swift và SwiftUI thường được viết ở đâu?

Trong SwiftUI, giao diện được xây dựng thông qua View được trả về bởi thuộc tính body. Do đó, tất cả các mã được sử dụng để mô tả giao diện thường được viết bên trong body.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Trong ví dụ này, Text là một thành phần View của SwiftUI, do đó bắt buộc phải được viết trong body, bởi vì SwiftUI sẽ đọc và tạo ra giao diện thông qua body.

Các đoạn mã không liên quan đến giao diện, chẳng hạn như biến, hàm hoặc logic xử lý dữ liệu, thường được viết bên ngoài body. Ví dụ:

```swift
struct ContentView: View {

    // Swift: Dữ liệu hoặc logic
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: Giao diện
    var body: some View {
        Text(name)
    }
}
```

Cần lưu ý rằng, bên trong body vẫn có thể sử dụng cú pháp của Swift, ví dụ như các câu lệnh luồng điều khiển if, for, v.v., chúng chỉ được sử dụng để điều khiển việc tạo ra các View của SwiftUI:

```
if isLogin {
    Text("Welcome")
}
```

Do đó, trong quá trình phát triển SwiftUI, có thể hiểu đơn giản là: mã giao diện (Text, Image, Button, v.v.) thường được viết bên trong body; mã dữ liệu và logic (biến, hàm, v.v.) thường được viết bên ngoài body.

## Tệp Swift

Khi đi sâu vào học tập, chúng ta sẽ còn tiếp xúc với kiến trúc MVVM, trong đó các lớp ViewModel và Model thường được tạo thành từ mã Swift thuần túy, hoàn toàn tách biệt với lớp View (SwiftUI).

Ví dụ, một lớp được sử dụng để quản lý trạng thái ứng dụng:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Hoặc một struct mô tả cấu trúc dữ liệu:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Trách nhiệm của những loại tệp này là quản lý và lưu trữ dữ liệu, không hiển thị trực tiếp trên View, vì vậy chúng hoàn toàn thuộc về Swift.

## Bối cảnh lịch sử

Để hiểu mối quan hệ giữa Swift và SwiftUI, chúng ta cũng cần phải biết về quá trình phát triển của các công nghệ của Apple. Tính đến năm 2026, bộ công nghệ (tech stack) này đã trải qua nhiều lần lặp lại (iteration).

### Lịch sử của Swift

Trước khi Swift xuất hiện, Objective-C là ngôn ngữ lập trình chính trên các nền tảng của Apple, hỗ trợ biên dịch hỗn hợp với ngôn ngữ C. Cú pháp của nó khá dài dòng, và rào cản gia nhập cao đối với người mới bắt đầu:

```Obj-c
// Cách viết của Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Năm 2014, Apple đã phát hành ngôn ngữ Swift tại WWDC. Cú pháp của Swift hiện đại hơn, tính an toàn kiểu cao hơn và đã dần thay thế Objective-C để trở thành ngôn ngữ phát triển chủ đạo:

```swift
// Cách viết của Swift
let name = "Fang"
print("Hello, \(name)")
```

Tuy nhiên, Objective-C vẫn chưa hoàn toàn rút khỏi vũ đài lịch sử, nó vẫn được sử dụng rộng rãi trong nhiều dự án cũ và các framework cấp thấp. Việc hiểu các cú pháp cơ bản của nó vẫn có giá trị trong việc bảo trì các dự án cũ và hiểu biết về hệ thống cốt lõi.

### Lịch sử của SwiftUI

Trước khi SwiftUI xuất hiện, iOS sử dụng **UIKit**, còn macOS sử dụng **AppKit**. Hai framework này sử dụng phương pháp lập trình "mệnh lệnh" (imperative). Nhà phát triển cần kéo thả các control thông qua Storyboard hoặc viết mã thủ công để kiểm soát trạng thái của View, khối lượng mã lớn và chi phí bảo trì cao, đặc biệt nổi bật khi logic giao diện trở nên phức tạp.

![storyboard](../../RESOURCE/010_xcode.png)

Năm 2019, Apple chính thức ra mắt SwiftUI tại WWDC. SwiftUI đã giới thiệu mô hình lập trình "khai báo" (declarative), giúp đơn giản hóa đáng kể quy trình phát triển UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Đáng chú ý là, SwiftUI không hoàn toàn là một triển khai cấp thấp độc lập. Trên các nền tảng khác nhau, về bản chất, nó là một cầu nối và phối hợp với UIKit (iOS) hoặc AppKit (macOS), ở cấp thấp nó vẫn phụ thuộc vào hai framework này để chạy.

### Mối quan hệ giữa Swift và UIKit/AppKit

Mặc dù Swift là một ngôn ngữ lập trình đa dụng, có thể chạy trên mọi nền tảng của Apple, nhưng nó không thể thay thế hoàn toàn UIKit hoặc AppKit. Đối với một số yêu cầu giao diện phức tạp, hoặc các tính năng mà SwiftUI chưa bao phủ hết, vẫn cần phải nhờ đến UIKit hoặc AppKit để thực hiện.

Ví dụ, UIKit đã rất trưởng thành trong việc xử lý quản lý view controller phức tạp, hiệu ứng hoạt ảnh, nhận dạng cử chỉ, v.v., và đã tích lũy được một lượng lớn kiểm chứng thực tế trong sản xuất. Trong khi khả năng của SwiftUI trong những khía cạnh này mặc dù liên tục được tăng cường, nhưng vẫn còn những hạn chế trong một số tình huống đặc biệt (edge cases).

Do đó, nhiều nhà phát triển sẽ kết hợp sử dụng SwiftUI và UIKit (hoặc AppKit) trong dự án của họ để tận dụng tối đa thế mạnh của cả hai.

Hiểu theo góc độ này, có thể coi SwiftUI là một lớp đóng gói (encapsulation) bậc cao của UIKit / AppKit. Trong quá trình học SwiftUI, việc tìm hiểu các khái niệm cơ bản của UIKit và AppKit một cách thích hợp sẽ giúp ích trong việc đưa ra các quyết định công nghệ hợp lý hơn khi bảo trì các dự án cũ hoặc triển khai các tính năng phức tạp.

## Tổng kết

**Swift**: Chủ yếu được sử dụng để viết logic, xử lý dữ liệu, luồng điều khiển, v.v., không liên quan đến bố cục View.

**SwiftUI**: Được sử dụng để xây dựng giao diện người dùng theo kiểu khai báo, mã nội dung và bố cục của View thuộc về SwiftUI.

Trong thực tế phát triển, Swift và SwiftUI thường được sử dụng kết hợp, Swift xử lý logic, còn SwiftUI xử lý giao diện.

Từ Objective-C và UIKit đến Swift và SwiftUI, môi trường phát triển của Apple dần chuyển sang một phương thức lập trình hiện đại và ngắn gọn hơn, nhưng UIKit và AppKit vẫn không thể bị bỏ qua trong nhiều dự án truyền thống.

Bằng cách hiểu mối quan hệ giữa Swift và SwiftUI, chúng ta có thể tiến hành phát triển iOS/macOS một cách hiệu quả hơn, và cũng có thể đưa ra những lựa chọn công nghệ hợp lý hơn khi bảo trì các dự án cũ.