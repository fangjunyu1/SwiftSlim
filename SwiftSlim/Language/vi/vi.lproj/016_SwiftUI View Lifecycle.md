# Vòng Đời View Trong SwiftUI

Trong bài học trước, chúng ta đã biết biến `@State` sẽ theo dõi vòng đời của view, và đã học cách dùng cơ bản của `onAppear`.

Trong bài học này, chúng ta sẽ hiểu sâu hơn về vòng đời của view trong SwiftUI, tìm hiểu view được tạo và hiển thị như thế nào, các biến trong view được tạo và tái tạo như thế nào, đồng thời học về `onAppear`, `onDisappear` và hàm khởi tạo `init`.

Dựa trên những kiến thức này, chúng ta sẽ xây dựng nhận thức tổng thể về toàn bộ quá trình xây dựng view trong SwiftUI.

## Thứ Tự Khởi Động Ứng Dụng

Khi tạo dự án iOS, Xcode sẽ mặc định tạo ra hai tệp:

```
ContentView.swift
Tên dự án + App.swift
```

Trong đó, "Tên dự án + App".swift là tệp đầu vào của toàn bộ ứng dụng.

Ví dụ:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Luồng Thực Thi Code

Khi chúng ta chạy App (trình giả lập hoặc thiết bị thực), hệ thống sẽ tìm từ khóa `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Sau khi xác nhận tệp đầu vào, bắt đầu thực thi code.

Đầu tiên vào struct App, thực thi code trong `body`, sau đó tạo `WindowGroup` và tải `ContentView` bên trong.

### Vai Trò Của WindowGroup

`WindowGroup` dùng để quản lý cửa sổ:

```swift
WindowGroup {
    ContentView()
}
```

iPad / macOS hỗ trợ nhiều cửa sổ, iPhone thường chỉ có một cửa sổ.

Vì vậy, `WindowGroup` trên iPhone chủ yếu quản lý giao diện đầu tiên được hiển thị.

### Quá Trình Tải View

Sau khi hệ thống tìm thấy `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI sẽ thực thi code trong `body`, sau đó xây dựng giao diện dựa trên cấu trúc view được trả về (như `VStack`, `Text`, v.v.) và hiển thị lên màn hình.

Sau khi các bước này hoàn thành, chúng ta có thể thấy `ContentView` trong view.

![ContentView](../../Resource/016_view1.png)

Cần lưu ý rằng vai trò của `body` là tạo ra view, chứ không phải lưu trữ view.

Điều này có nghĩa là, mỗi lần làm mới view, SwiftUI sẽ tính toán lại `body` và tạo ra cấu trúc view mới.

### Logic Xem Trước View

Xem trước Xcode (Canvas) và chạy thực tế là hai cơ chế khác nhau.

Ví dụ, thêm một debug output vào tệp đầu vào:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Khi xem trước `ContentView` trong Xcode, sẽ không bắt đầu thực thi từ đầu vào `@main`, vì vậy sẽ không kích hoạt `onAppear` trong tệp đầu vào.

Nhưng nếu chạy trên trình giả lập hoặc thiết bị thực, hệ thống sẽ bắt đầu thực thi từ `@main`, chạy toàn bộ App theo quy trình hoàn chỉnh, sẽ kích hoạt `onAppear` trong đầu vào và xuất thông tin debug.

Điểm mấu chốt là, xem trước Xcode chỉ là "render cục bộ", chỉ dùng để hiển thị view hiện tại; trình giả lập và thiết bị thực cung cấp "môi trường chạy hoàn chỉnh", sẽ thực thi toàn bộ App.

Vì vậy, khi kiểm tra chức năng App, nên lấy trình giả lập hoặc thiết bị thực làm chuẩn, xem trước Xcode không thể cung cấp môi trường chạy hoàn chỉnh.

## Vòng Đời Của View

Ở giai đoạn hiện tại, tất cả code của chúng ta đều tập trung trong `ContentView`. Nhưng trong ứng dụng thực tế, một App thường chứa nhiều view và chuyển đổi trong các tình huống khác nhau.

Ví dụ, trong "heo đất":

![PiggyBank](../../Resource/016_view.png)

Khi nhấn "lưu tiền", hiển thị view `SaveView`; khi lưu tiền xong hoặc đóng lại, xóa view `SaveView`.

Quá trình này chính là vòng đời của một view, từ tạo view, hiển thị view, đến cuối cùng xóa view.

### Đóng Ứng Dụng

Khi App bị đóng, tất cả view sẽ bị xóa, trạng thái liên quan cũng sẽ biến mất.

Vì vậy, `ContentView` và các view khác đều sẽ bị xóa khỏi bộ nhớ, trạng thái chạy của toàn bộ App cũng sẽ bị xóa.

## Vòng Đời Của Biến Trong View

Trong SwiftUI, vòng đời của biến thường được ràng buộc với view.

Ví dụ:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Biến @State

Biến được khai báo bằng `@State`, ràng buộc vòng đời của view.

```swift
@State private var name = "FangJunyu"
```

Khi view được tạo, `name` cũng sẽ được tạo; khi view bị xóa, `name` cũng sẽ bị hủy.

Đây là lý do tại sao cần dùng `UserDefaults` và các cách khác để lưu trữ dữ liệu bền vững.

### Biến Trong body

Biến được định nghĩa trong `body`:

```swift
var num = 10
```

Vòng đời của nó ràng buộc với quá trình thực thi của `body`.

Khi trạng thái SwiftUI thay đổi, ví dụ:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Khi `name` thay đổi, `@State` phát hiện dữ liệu thay đổi, sẽ thông báo SwiftUI tính toán lại view, `body` được tính toán lại.

Khi `body` được tính toán lại, tất cả code trong `body` đều được thực thi lại, biến trong `body` (như `num`) sẽ được tạo lại.

Đây cũng là lý do tại sao không khuyến khích định nghĩa biến phức tạp trong `body`.

Vì mỗi lần làm mới view, biến trong `body` đều được tạo lại, điều này sẽ tăng chi phí tính toán và ảnh hưởng đến hiệu năng.

Trong SwiftUI, các loại dữ liệu khác nhau nên được quản lý theo cách khác nhau: dữ liệu cần theo dõi vòng đời view có thể dùng `@State` để lưu; dữ liệu tính toán tạm thời có thể đặt trong `body`.

## onAppear và onDisappear

Trong bài học trước, chúng ta đã học `onAppear`, khi view hiển thị sẽ gọi `onAppear`.

```swift
.onAppear {}
```

Ví dụ:

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Khi xem trước hoặc chạy trong Xcode, có thể thấy debug output trong `onAppear`.

### onDisappear

Tương ứng với `onAppear` là `onDisappear`:

```swift
.onDisappear {}
```

Khi view bị đóng, sẽ gọi `onDisappear`.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Khi view bị xóa, code trong `onDisappear` sẽ được gọi.

Gợi ý: `ContentView` đang dùng ở giai đoạn hiện tại là root view của ứng dụng, không thể đóng hoặc xóa trực tiếp. Vì vậy, ở giai đoạn này không thể quan sát được hiệu ứng thực thi của `onDisappear`.

Phải đến khi học chuyển trang, mở view mới sau này, mới có thể thấy `onDisappear` được gọi.

## Logic Tạo và Hiển Thị

Cần lưu ý rằng, tạo view và hiển thị view là hai giai đoạn khác nhau.

Khi view được tạo, sẽ gọi phương thức khởi tạo của struct:

```swift
init() {}
```

Vì view SwiftUI là cấu trúc struct:

```swift
struct ContentView: View { ... }
```

Vì vậy, khi instance của view được tạo, sẽ thực thi phương thức khởi tạo `init`. Khi view được hiển thị, mới gọi phương thức `onAppear`.

Ví dụ:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Khi xem trước view trong Xcode, có thể thấy debug output:

```swift
Create ContentView
Show ContentView
```

Cho thấy, trước tiên thực thi `init` để tạo view, rồi tính toán code trong `body`, cuối cùng hiển thị view và thực thi phương thức `onAppear`.

Vì vậy, cần hiểu rằng giai đoạn tạo và hiển thị view là tách biệt nhau.

### Phương Thức Khởi Tạo init

`init` là cú pháp cơ bản của Swift, cả `struct` và `class` đều có thể định nghĩa, dùng để khởi tạo đối tượng.

```swift
init() {}
```

Trong SwiftUI, khi view được tạo, hệ thống sẽ gọi phương thức `init` của view, có thể dùng để nhận tham số, khởi tạo dữ liệu.

Nếu không tự viết `init`, Swift sẽ tự động tạo một phương thức khởi tạo mặc định cho struct.

Đối với các view SwiftUI như `ContentView`, khi tạo view, thực thi `init`; khi hiển thị view, thực thi `onAppear`.

Vì vậy, `init` là phương thức khởi tạo được thực thi khi view được tạo, sẽ được dùng khi truyền tham số hoặc khởi tạo dữ liệu sau này.

## Tổng Kết

Trong bài học này, chúng ta đã học thứ tự khởi động ứng dụng, luồng thực thi từ tệp đầu vào đến tệp `ContentView`.

Chúng ta đã hiểu về vòng đời view SwiftUI: khi view được tạo sẽ thực thi `init`, khi hiển thị lên màn hình sẽ thực thi `onAppear`, khi view bị xóa hoặc đóng sẽ thực thi `onDisappear`.

Học được cơ chế cập nhật view: view được điều khiển bởi trạng thái, khi các trạng thái như `@State` thay đổi, SwiftUI sẽ làm mới view, tính toán lại `body`, biến trong `body` cũng sẽ được tạo lại.

Vòng đời của biến sẽ ràng buộc với vòng đời của view, còn biến tạm thời trong `body` mỗi lần làm mới đều sẽ được tạo lại.

Hiểu được các vòng đời và hành vi biến này giúp chúng ta tổ chức code tốt hơn, làm cho logic ứng dụng rõ ràng hơn.