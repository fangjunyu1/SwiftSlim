# Quản lý tệp Xcode

Trong bài học này, chúng ta sẽ học các thao tác tệp thường gặp trong Xcode.

Trong các bài học trước, phần lớn mã của chúng ta đều được viết trong `ContentView`. Cách này giúp dễ quan sát mã và kết quả hiển thị.

Ví dụ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Nhưng trong một App thật, thông thường chúng ta sẽ không viết toàn bộ mã trong một tệp.

Khi số lượng trang, thành phần và chức năng ngày càng nhiều, chúng ta cần tách các view khác nhau vào các tệp SwiftUI khác nhau.

Ví dụ:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Cách này giúp cấu trúc mã rõ ràng hơn, đồng thời thuận tiện cho việc bảo trì và chỉnh sửa sau này.

## Vì sao cần quản lý tệp

Trong SwiftUI, một trang hoặc một thành phần thường có thể được viết thành một tệp view riêng.

Ví dụ:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Ở đây, `CardView` chính là một view SwiftUI.

Nếu tất cả view đều được viết trong `ContentView`, mã sẽ ngày càng dài và cũng ngày càng khó đọc.

Vì vậy, chúng ta cần học cách tạo tệp, đổi tên tệp, xóa tệp, cũng như sử dụng thư mục để quản lý các tệp mã khác nhau.

## Tạo tệp SwiftUI

Trong Xcode, thường có hai cách phổ biến để tạo tệp SwiftUI:

Một cách là tạo tệp trống, sau đó tự viết mã.

Cách còn lại là tạo tệp mẫu SwiftUI, để Xcode tự động tạo mã cơ bản.

Đối với người mới bắt đầu, nên dùng tệp mẫu SwiftUI hơn, vì nó sẽ tự động tạo cấu trúc cơ bản.

### Tạo tệp trống

Trong khu vực Navigator ở bên trái Xcode, nhấp chuột phải vào vùng trống hoặc thư mục, rồi chọn `New Empty File`.

Vị trí thao tác như sau:

![xcode](../../../Resource/027_view1.png)

Sau khi tạo tệp trống, Xcode thường sẽ tạo một tệp Swift chưa được đặt tên, ví dụ `Untitled.swift`.

Chúng ta có thể đổi tên tệp đó thành `TestView.swift`.

Trong dự án SwiftUI, nếu tệp này dùng để hiển thị một view, thông thường nên thêm `View` vào cuối tên.

Ví dụ:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Đây không phải là quy tắc bắt buộc, nhưng có thể giúp chúng ta nhìn qua là biết đây là một tệp view.

Sau khi tạo tệp trống, trong tệp có thể chỉ có phần chú thích mặc định, hoặc cũng có thể là nội dung trống. Điều này tùy thuộc vào phiên bản Xcode và cách tạo.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Lúc này, chúng ta cần tự viết mã SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Như vậy, một tệp view SwiftUI đơn giản đã được tạo xong.

### Đổi tên tệp

Nếu sau khi tạo tệp, bạn muốn sửa tên tệp, có thể chọn tệp trong khu vực Navigator ở bên trái Xcode, rồi nhấn phím Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Như vậy là có thể sửa tên tệp.

Cần chú ý rằng việc sửa tên tệp sẽ không tự động sửa tên view trong mã.

Ví dụ, sau khi tên tệp được đổi thành `ProfileView.swift`, trong mã có thể vẫn là `struct TestView: View`.

Điều này không nhất thiết gây ra lỗi, nhưng dễ khiến người đọc nhầm lẫn.

Vì vậy, nên giữ cho tên tệp và tên view nhất quán. Ví dụ, nếu tên tệp là `ProfileView.swift`, thì tên view cũng nên dùng `ProfileView`.

## Tạo tệp mẫu SwiftUI

Ngoài việc tạo tệp trống, chúng ta cũng có thể tạo trực tiếp tệp mẫu SwiftUI.

Trong khu vực Navigator ở bên trái Xcode, nhấp chuột phải vào vùng trống hoặc thư mục, rồi chọn `New File from Template...`.

Vị trí thao tác như sau:

![xcode](../../../Resource/027_view3.png)

Trong cửa sổ hiện ra, phía trên có thể chọn các nền tảng khác nhau, ví dụ `iOS`, `macOS`, v.v.

Ở đây chỉ cần giữ nền tảng tương ứng với dự án hiện tại. Ví dụ, nếu chúng ta đang tạo iOS App, thì chọn `iOS`.

![xcode](../../../Resource/027_view4.png)

Sau đó chọn `SwiftUI View` ở bên dưới.

![xcode](../../../Resource/027_view12.png)

Tiếp theo nhấp `Next`, nhập tên tệp và lưu lại.

Ví dụ, chúng ta tạo một tệp `Test2View.swift`.

Xcode sẽ tự động tạo mã tương tự như bên dưới:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

So với tệp trống, tệp mẫu sẽ tự động chứa `import SwiftUI`, `struct`, `body` và `#Preview`.

Vì vậy đối với người mới bắt đầu, sử dụng tệp mẫu SwiftUI sẽ đơn giản hơn và cũng ít bị thiếu mã hơn.

**Gợi ý**: Ngoài việc nhấp chuột phải để tạo tệp, bạn cũng có thể nhấp vào nút dấu cộng ở cuối Navigator bên trái Xcode để tạo tệp hoặc thư mục.

![xcode](../../../Resource/027_view5.png)

## Tạo thư mục

Khi số lượng tệp ngày càng nhiều, chúng ta có thể dùng thư mục để quản lý.

Trong khu vực Navigator ở bên trái Xcode, nhấp chuột phải vào vùng trống hoặc thư mục, rồi chọn `New Folder`.

Sau khi tạo thư mục, bạn có thể kéo các tệp liên quan vào trong thư mục đó.

![xcode](../../../Resource/027_view7.png)

Thư mục chủ yếu dùng để sắp xếp cấu trúc dự án, không làm thay đổi cách sử dụng của chính view.

Chỉ cần tên view đúng, trong các tệp khác vẫn có thể sử dụng bằng cách như `TestView()`, `Test2View()`.

## Xóa tệp hoặc thư mục

Nếu muốn xóa tệp hoặc thư mục, có thể chọn tệp tương ứng trong khu vực Navigator ở bên trái Xcode, sau đó nhấp chuột phải và chọn `Delete`.

Bạn cũng có thể chọn tệp rồi nhấn phím Delete `⌫`.

Xcode sẽ hiện cửa sổ xác nhận xóa.

![xcode](../../../Resource/027_view10.png)

Chọn `Move to Trash` có nghĩa là chuyển tệp vào Thùng rác.

Nếu thấy `Remove Reference`, điều đó có nghĩa là chỉ xóa tham chiếu khỏi dự án Xcode, nhưng không xóa tệp gốc trên ổ đĩa.

Đối với người mới bắt đầu, nếu chỉ xóa một tệp thông thường do mình vừa tạo, thông thường chọn `Move to Trash` là được.

## Hiển thị nhiều view SwiftUI

Sau khi học cách tạo tệp, chúng ta có thể tách các view khác nhau vào các tệp khác nhau.

Ví dụ, chúng ta tạo hai tệp SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` dùng để hiển thị tên tác giả:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` dùng để hiển thị nền thẻ:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Sau đó, chúng ta có thể sử dụng hai view này trong `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Sau khi chạy, có thể thấy `CardView` và `AuthorView` được kết hợp hiển thị cùng nhau:

![xcode](../../../Resource/027_view11.png)

Trong hiệu quả này, `CardView` đóng vai trò làm nền, còn `AuthorView` hiển thị ở phía trên, vì chúng được đặt trong `ZStack`.

Trong `ContentView`, chúng ta sử dụng hai view này thông qua `CardView()` và `AuthorView()`. Dấu `()` sau tên biểu thị việc tạo và sử dụng view này.

Đây là cách lồng view thường gặp trong SwiftUI: trong một view, có thể tiếp tục sử dụng các view khác.

## Tệp điểm vào

Cuối cùng, chúng ta xem lại App bắt đầu hiển thị giao diện từ đâu.

Trong dự án SwiftUI, thường sẽ có một tệp điểm vào:

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

Ở đây, `@main` biểu thị đây là vị trí điểm vào của App.

Trong `WindowGroup`, chúng ta thấy:

```swift
ContentView()
```

Điều này có nghĩa là sau khi App khởi động, đầu tiên sẽ hiển thị `ContentView`.

Sau đó trong `ContentView` lại hiển thị:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Vì vậy, có thể hiểu cấp bậc view như sau:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Nếu chúng ta đổi view được hiển thị trong tệp điểm vào thành `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Vậy sau khi App khởi động, nó sẽ chỉ hiển thị `CardView`.

Nói cách khác, `WindowGroup` trong mã điểm vào quyết định view nào sẽ được hiển thị đầu tiên sau khi App khởi động.

Còn bên trong view này, vẫn có thể tiếp tục hiển thị các view khác.

## Tổng kết

Trong bài học này, chúng ta đã học các thao tác quản lý tệp thường gặp trong Xcode.

Chúng ta đã tìm hiểu cách tạo tệp SwiftUI, cách đổi tên tệp, cách tạo thư mục, cũng như cách xóa tệp.

Đồng thời, chúng ta cũng đã học một khái niệm quan trọng: view SwiftUI có thể được tách vào các tệp khác nhau, rồi sử dụng trong các view khác.

Ví dụ:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Ở đây, `CardView()` và `AuthorView()` chính là việc sử dụng các view khác trong `ContentView`.

Cuối cùng, chúng ta cũng đã xem lại logic hiển thị của tệp điểm vào.

Khi App khởi động, trước tiên nó sẽ đi vào mã điểm vào được đánh dấu bằng `@main`, sau đó hiển thị view trong `WindowGroup`.

Điều này giúp chúng ta hiểu rằng các tệp SwiftUI khác nhau không tồn tại cô lập. Chúng có thể kết hợp với nhau và cuối cùng tạo thành giao diện App hoàn chỉnh.
