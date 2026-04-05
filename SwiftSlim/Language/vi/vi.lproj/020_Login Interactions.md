# Tương tác đăng nhập

Ở bài học trước, chúng ta đã tạo một giao diện đăng nhập và dùng các nút bấm cùng với logic điều kiện để thực hiện việc kiểm tra đơn giản cho nội dung được nhập vào.

Trong bài học này, chúng ta sẽ tiếp tục dựa trên đoạn mã của bài học trước để tìm hiểu về ô nhập mật khẩu `SecureField`, hộp cảnh báo `Alert`, và cách điều khiển việc hiển thị các giao diện khác nhau dựa trên biến.

Thông qua bài học này, bạn có thể hiểu sâu hơn về luồng tương tác cơ bản của một giao diện đăng nhập. Đây cũng là logic nền tảng thường được dùng trong rất nhiều ứng dụng.

## Ô nhập mật khẩu

Ở bài học trước, chúng ta đã dùng `TextField` để nhập mật khẩu.

Tuy nhiên, trong giao diện đăng nhập thực tế, mật khẩu thường sẽ không được hiển thị trực tiếp. Thay vào đó, nó sẽ được hiển thị dưới dạng các chấm hoặc một hiệu ứng ẩn khác, giúp bảo vệ quyền riêng tư của người dùng.

Trong SwiftUI, điều khiển được dùng riêng để nhập mật khẩu là `SecureField`.

Ví dụ:

```swift
SecureField("Password", text: $password)
```

Cách viết của nó rất giống với `TextField`. Nó cũng cần một đoạn văn bản gợi ý và một biến được ràng buộc.

Có thể hiểu đơn giản như sau: `SecureField` cũng là một ô nhập liệu, chỉ khác là nó sẽ ẩn nội dung đang được nhập.

Chúng ta có thể trực tiếp thay `TextField` vốn dùng để nhập mật khẩu bằng `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Khi người dùng nhập mật khẩu, nội dung mật khẩu sẽ không còn hiển thị trực tiếp trên giao diện nữa.

Hiệu ứng hiển thị:

![password](../../Resource/020_password.png)

Bây giờ, chúng ta có thể nhập tên người dùng và mật khẩu, sau đó nhấn nút để xác định xem thông tin nhập vào có đúng hay không.

### Hiển thị thông báo phản hồi

Trước đó, chúng ta vẫn luôn dùng `print` để xuất kết quả.

Nội dung của `print` chỉ hiển thị trong console. Nhà phát triển có thể nhìn thấy khi chạy chương trình trong Xcode, nhưng người dùng thông thường trên điện thoại thì không thể thấy những thông báo này.

Điều đó có nghĩa là mặc dù chương trình đã hoàn thành việc kiểm tra, người dùng vẫn không biết nội dung mình nhập có đúng hay không.

Lúc này, chúng ta cần một cách để hiển thị thông báo trực tiếp trên giao diện.

## Hộp cảnh báo Alert

Trong SwiftUI, chúng ta có thể dùng `Alert` để bật lên một hộp thông báo.

Cách dùng cơ bản:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Đoạn mã này trông có vẻ phức tạp hơn một chút so với các điều khiển trước đó, nhưng chúng ta có thể hiểu nó bằng cách tách thành từng phần.

`Alert` chủ yếu bao gồm các phần sau:

- `"Title"`: tiêu đề của hộp cảnh báo
- `isPresented`: một giá trị Boolean được ràng buộc, dùng để kiểm soát xem hộp cảnh báo có được hiển thị hay không
- `Button(...)`: nút trong hộp cảnh báo
- `message:`: nội dung thông báo hiển thị trong hộp cảnh báo

Có thể hiểu đơn giản thế này: khi biến được ràng buộc trở thành `true`, hệ thống sẽ bật hộp cảnh báo này lên.

Hiệu ứng hiển thị:

![alert](../../Resource/020_alert3.png)

Cấu trúc tương ứng:

![alert](../../Resource/020_alert.png)

### Alert là một modifier

Giống như nhiều modifier mà chúng ta đã học trước đó, `Alert` cũng được thêm vào phía sau một giao diện nào đó.

Ví dụ, nó có thể được gắn sau một nút:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Nó cũng có thể được gắn sau `VStack` bên ngoài:

```swift
VStack {
    // ...
}
.alert() {...}
```

Điều đó có nghĩa là `Alert` không phải là một giao diện độc lập được đặt riêng trên màn hình. Thay vào đó, nó là một modifier gắn vào một giao diện cụ thể.

Có thể hiểu đơn giản là: `Alert` thường được viết sau nút hoặc sau bố cục bên ngoài để bật thông báo khi một điều kiện nào đó được đáp ứng.

### Hiển thị Alert

Nếu muốn hiển thị một `Alert`, chúng ta cần một biến để điều khiển nó.

Ví dụ:

```swift
@State private var showAlert = false
```

Biến này có kiểu `Bool`, nghĩa là nó chỉ có hai giá trị: `true` hoặc `false`.

Sau đó, ràng buộc nó với `isPresented` của `Alert`:

```swift
isPresented: $showAlert
```

Khi `showAlert` là `false`, hộp cảnh báo sẽ không hiển thị; khi `showAlert` là `true`, hộp cảnh báo sẽ bật lên.

### Hiển thị hộp cảnh báo thông qua nút

Bây giờ, trước tiên hãy hiện thực tình huống đơn giản nhất:

Khi người dùng không nhập gì cả mà bấm trực tiếp nút `Sign in`, hãy bật lên một hộp thông báo cho họ biết rằng họ vẫn chưa nhập nội dung nào.

Trước hết, tạo một biến để điều khiển hộp thông báo này:

```swift
@State private var showEmpty = false
```

Sau đó, thêm một `Alert` sau `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Tiếp theo, thực hiện kiểm tra trong đoạn mã xử lý khi nhấn nút:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Nếu cả `user` và `password` đều trống, hãy đặt `showEmpty` thành `true`.

Và vì `Alert` được ràng buộc với biến này, nên khi nó trở thành `true`, hệ thống sẽ tự động bật hộp cảnh báo lên.

Hiệu ứng hiển thị:

![alert](../../Resource/020_alert1.png)

Bằng cách này, sau khi người dùng nhấn nút, họ có thể nhìn thấy thông báo ngay lập tức, và nhà phát triển cũng không cần phải kiểm tra kết quả `print` trong console nữa.

### Hoàn thiện nút và các hộp cảnh báo

Trước đó, chúng ta chỉ xử lý trường hợp “không điền gì cả”.

Chúng ta vẫn cần xử lý các trường hợp sau:

- thiếu tên người dùng
- thiếu mật khẩu
- cả tên người dùng và mật khẩu đều đã nhập, nhưng dữ liệu nhập sai

Vì vậy, chúng ta cũng cần chuẩn bị các thông báo tương ứng cho những trường hợp này.

Trước hết, thêm ba biến mới:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Sau đó tiếp tục thêm các `Alert` tương ứng sau nút:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Tiếp theo, hoàn thiện logic điều kiện bên trong nút:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Khi nút xác định rằng người dùng không điền thông tin nào, bỏ sót một phần thông tin, hoặc thất bại trong việc xác thực đầu vào, nó sẽ đổi biến Boolean tương ứng thành `true`, sau đó `Alert` tương ứng sẽ bật lên.

Ở đây, tôi khuyên bạn nên tự mình thử một số tình huống:

- không nhập gì cả
- chỉ nhập tên người dùng
- chỉ nhập mật khẩu
- nhập cả tên người dùng và mật khẩu nhưng nội dung sai
- nhập cả tên người dùng và mật khẩu, và nội dung đúng

Điều này giúp xác minh xem mã của chúng ta có vấn đề gì không. Đây cũng là một bước “kiểm thử” rất quan trọng trong quá trình phát triển ứng dụng.

Nếu chương trình hoạt động không đúng trong một tình huống nào đó, điều đó có nghĩa là có thể tồn tại vấn đề trong logic, và một `Bug` đã xuất hiện trong chương trình.

Điều mà các nhà phát triển thường gọi là `Bug` chính là lỗi, khiếm khuyết, hoặc hành vi không đúng với kỳ vọng.

## Hoàn thành giao diện đăng nhập

Các ví dụ `Alert` mà chúng ta vừa nói trước đó đều xoay quanh việc làm thế nào để phản hồi cho người dùng khi “dữ liệu nhập sai”.

Khi người dùng nhập đúng tên người dùng và mật khẩu, thông thường chúng ta sẽ không bật “hộp cảnh báo”, mà sẽ đi thẳng vào giao diện sau khi đăng nhập.

Điều này liên quan đến một khái niệm rất quan trọng: **hiển thị các giao diện khác nhau dựa trên giá trị của biến.**

Ví dụ:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Ở đây, chúng ta dùng kiểu `Bool` để quản lý giao diện nào sẽ được hiển thị:

- nếu `login` là `true`, điều đó có nghĩa là đăng nhập đã thành công, và nội dung sau đăng nhập sẽ được hiển thị
- nếu `login` là `false`, điều đó có nghĩa là đăng nhập chưa thành công, và giao diện đăng nhập sẽ tiếp tục được hiển thị.

Mặc dù câu lệnh `if` là một câu lệnh điều kiện trong Swift, nhưng bên trong `body` của SwiftUI, nó có thể được dùng để điều khiển logic hiển thị của giao diện.

Điều đó có nghĩa là SwiftUI sẽ quyết định giao diện nào nên được hiển thị ở thời điểm hiện tại dựa trên kết quả của điều kiện.

Chúng ta có thể đặt logic hiển thị này vào `ContentView` hiện tại:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Mã của giao diện đăng nhập ban đầu
		}
	}
}
```

Ở đây, chúng ta đã thêm một biến mới là `login` để biểu thị người dùng đã đăng nhập thành công hay chưa.

Sau đó, chúng ta đặt đoạn mã giao diện đăng nhập đã viết trước đó vào phía sau câu lệnh `else`.

Logic hiển thị giao diện:

- khi `login` là `false`, điều đó có nghĩa là đăng nhập vẫn chưa thành công, vì vậy giao diện đăng nhập ban đầu sẽ tiếp tục được hiển thị.
- khi `login` là `true`, điều đó có nghĩa là đăng nhập đã thành công. Lúc này, giao diện đăng nhập sẽ không còn được hiển thị nữa, mà thay vào đó là `Login successful`.

Điều đó có nghĩa là `ContentView` sẽ hiển thị nội dung giao diện khác nhau tùy theo giá trị của `login`.

Tiếp theo, hãy sửa đổi logic đăng nhập thành công bên trong nút:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Khi tên người dùng và mật khẩu mà người dùng nhập vào đều đúng, chúng ta sẽ đặt `login` thành `true`.

Một khi giá trị của `login` thay đổi, kết quả của câu lệnh `if` trong `ContentView` cũng sẽ thay đổi, và giao diện sẽ chuyển từ giao diện đăng nhập ban đầu sang `Login successful`.

Hiệu ứng hiển thị như sau:

![view](../../Resource/020_view.png)

Đến đây, chúng ta đã thực sự áp dụng ý tưởng “hiển thị các giao diện khác nhau dựa trên điều kiện” vào trang đăng nhập hiện tại này.

Trong ứng dụng thực tế, thông thường cũng vận hành theo cách này: các giao diện khác nhau được hiển thị dựa trên một giá trị nào đó.

Ví dụ, khi người dùng chưa đăng nhập, trang đăng nhập sẽ được hiển thị; sau khi người dùng đăng nhập thành công, một giao diện khác sẽ được hiển thị.

Ý tưởng cốt lõi là: **dùng sự thay đổi của biến để điều khiển giao diện sẽ hiển thị nội dung gì.**

## Tóm tắt

Trong bài học này, chúng ta đã học được ba nội dung quan trọng:

1. Dùng `SecureField` để nhập mật khẩu, giúp nội dung mật khẩu không bị hiển thị trực tiếp trên giao diện.
2. Dùng `Alert` để hiển thị thông báo cho người dùng, thay vì chỉ xuất ra trong console.
3. Dùng biến và điều kiện `if` để điều khiển việc hiển thị các giao diện khác nhau, cho phép chuyển đổi giữa giao diện trước khi đăng nhập và sau khi đăng nhập.

Thông qua những kiến thức này, giờ đây chúng ta đã có thể hoàn thành một giao diện đăng nhập với hiệu ứng tương tác cơ bản, đồng thời hiểu rõ hơn tư duy phát triển trong SwiftUI rằng “khi trạng thái thay đổi, giao diện sẽ được cập nhật”.

## Mã hoàn chỉnh

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
            VStack {
                Image("019_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Sign in to App")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Username")
                        .fontWeight(.bold)
                    TextField("input user", text: $user)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                HStack {
                    Text("Password")
                        .fontWeight(.bold)
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Kiến thức mở rộng - Alert với nhiều nút

Ở phần trước của bài học này, chúng ta đã dùng loại `Alert` cơ bản nhất, chỉ có một nút và chủ yếu dùng để nhắc nhở người dùng.

Thực ra, `Alert` cũng có thể chứa nhiều nút để người dùng đưa ra các lựa chọn khác nhau.

Ví dụ:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Sau khi nhấn nút, một hộp nhắc với ba lựa chọn `Ok`, `delete` và `cancel` sẽ bật lên.

Hiệu ứng hiển thị:

![alert](../../Resource/020_alert2.png)

Khi nhấn vào các nút khác nhau, đoạn mã tương ứng sẽ được thực thi.

### Thuộc tính `role` của Button

Tại đây bạn sẽ nhận thấy rằng `Button` bên trong `Alert` hơi khác so với cách viết nút thông thường mà chúng ta đã học trước đó:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Ở đây có thêm một tham số `role`.

Trong SwiftUI, `role` được dùng để nói cho hệ thống biết nút này đại diện cho loại hành động nào.

Một số vai trò phổ biến là:

- `.cancel`: hành động hủy
- `.destructive`: hành động nguy hiểm, chẳng hạn như xóa
- `nil`: hành động thông thường

Các giá trị `role` khác nhau thường cũng dẫn đến các kiểu hiển thị khác nhau trên giao diện.

Ví dụ, các hành động nguy hiểm thường được hiển thị nổi bật hơn để nhắc người dùng nhấn một cách cẩn thận.

Ngoài ra, `role` còn cung cấp thêm thông tin ngữ nghĩa cho nút, giúp các trình đọc màn hình như VoiceOver trên thiết bị Apple giải thích mục đích của nút cho người dùng dễ hơn.

Vì vậy, trong những tình huống phù hợp, thêm `role` cho một nút là một thói quen rất tốt.
