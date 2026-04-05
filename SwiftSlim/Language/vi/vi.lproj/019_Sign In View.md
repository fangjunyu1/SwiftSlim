# Giao diện đăng nhập

Trong bài học này, chúng ta sẽ học một tình huống rất thực tế, đó là giao diện đăng nhập.

Dù là trang web hay ứng dụng, trong quá trình sử dụng, rất nhiều lúc người dùng cần đăng nhập tài khoản và nhập mật khẩu.

Ví dụ, trang đăng nhập GitHub:

![WordPress](../../Resource/019_github.png)

Trong bài học này, chúng ta sẽ tạo một giao diện đăng nhập tương tự, để người dùng có thể tự nhập tài khoản và mật khẩu, đồng thời kiểm tra xem nội dung đã nhập có vấn đề gì không.

## Bố cục phía trên

Chúng ta sẽ viết mã của giao diện đăng nhập trong tệp `ContentView`.

Trước tiên, hãy tạo khu vực nhận diện ở phía trên của giao diện đăng nhập. Bạn có thể chuẩn bị trước một hình biểu tượng phù hợp và đặt nó vào thư mục `Assets`.

![icon](../../Resource/019_icon1.png)

Sau đó, dùng `Image` và các modifier để hiển thị hình ảnh:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Ý nghĩa của các modifier ở đây là:

- `resizable()`: cho phép thay đổi kích thước hình ảnh.
- `scaledToFit()`: phóng to hoặc thu nhỏ hình ảnh trong khi vẫn giữ nguyên tỉ lệ ban đầu.
- `frame(width: 100)`: đặt chiều rộng hiển thị của hình ảnh là `100`.

Tiếp theo, dùng `Text` và các modifier để hiển thị tiêu đề đăng nhập:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Sau đó, dùng `VStack` để sắp xếp hình ảnh và văn bản theo chiều dọc:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view.png)

Đến đây, chúng ta đã hoàn thành khu vực tiêu đề ở phía trên của giao diện đăng nhập.

### Tối ưu bố cục

Bây giờ, hình ảnh và tiêu đề mặc định đang ở khu vực giữa của toàn bộ bố cục.

Nếu chúng ta muốn chúng trông giống như một “dấu hiệu đăng nhập ở phía trên trang” hơn, có thể dùng `Spacer()` để kéo giãn phần không gian còn lại, giúp nội dung hiển thị gần phía trên hơn.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view1.png)

Nhưng lúc này, `Image` và `Text` lại quá gần phần trên của màn hình, nhìn hơi chật chội.

Khi đó, chúng ta có thể dùng `padding` để thêm khoảng cách phía trên cho toàn bộ `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view2.png)

Như vậy, khu vực tiêu đề ở phía trên trang sẽ trông phù hợp hơn.

## Tên người dùng và mật khẩu

Trang đăng nhập thường yêu cầu người dùng nhập tên người dùng và mật khẩu.

Trong SwiftUI, chúng ta có thể dùng `TextField` để nhận nội dung do người dùng nhập vào.

Nhưng cần lưu ý: `TextField` tự nó không lưu giữ dữ liệu nhập vào trong thời gian dài, nó chỉ là một điều khiển nhập liệu. Thứ thực sự lưu nội dung này là các biến mà chúng ta bind vào nó.

Vì vậy, trước tiên chúng ta cần tạo hai biến `@State` để lưu tên người dùng và mật khẩu:

```swift
@State private var user = ""
@State private var password = ""
```

Khi giá trị của biến `@State` thay đổi, SwiftUI sẽ tự động làm mới giao diện liên quan.

Tiếp theo, dùng `TextField` để bind hai biến này:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Ở đây, `$user` và `$password` có nghĩa là “binding”.

Nói cách khác, khi người dùng gõ vào ô nhập liệu thì biến cũng thay đổi đồng thời; và khi biến thay đổi, nội dung hiển thị trong ô nhập liệu cũng thay đổi đồng thời.

Mối quan hệ “giao diện và dữ liệu đồng bộ với nhau” này chính là binding.

Lưu ý rằng ở đây phải dùng cách viết có `$`:

```swift
$user
```

Vì `TextField` không cần một chuỗi thông thường mà cần một giá trị binding “có thể thay đổi dữ liệu theo hai chiều”.

### Hiển thị ô nhập liệu

Hãy đặt chúng vào trong `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view3.png)

Vì bây giờ `user` và `password` mặc định đều là chuỗi rỗng:

```swift
""
```

Nên ô nhập liệu trước tiên sẽ hiển thị chữ gợi ý, ví dụ:

```swift
input user
```

Đoạn chữ này chỉ dùng để nhắc người dùng “nên nhập gì vào đây”, chứ không phải nội dung đã nhập thực sự.

### Tối ưu ô nhập liệu

Bây giờ ô nhập liệu đã có thể sử dụng, nhưng kiểu mặc định còn khá đơn giản.

Để giao diện rõ ràng hơn, chúng ta có thể thêm tiêu đề phía trước ô nhập liệu, đồng thời tối ưu một chút về kiểu dáng của chính ô đó.

Ví dụ, trước tiên thêm một tiêu đề:

```swift
Text("Username")
    .fontWeight(.bold)
```

Sau đó, dùng `HStack` để đặt tiêu đề và ô nhập liệu trên cùng một hàng:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Ở đây dùng `HStack` vì chúng ta muốn “bên trái hiển thị tiêu đề, bên phải hiển thị ô nhập liệu”.

Cần chú ý rằng `TextField` mặc định sẽ chiếm toàn bộ phần không gian còn lại có thể sử dụng.

![color](../../Resource/019_view6.png)

Để kích thước của hai ô nhập liệu đồng đều hơn, chúng ta có thể dùng `frame(width:)` để đặt chiều rộng cho nó, làm cho các ô trông gọn gàng hơn.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Sau đó thêm một đường viền để ô nhập liệu nổi bật hơn:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Bây giờ, chúng ta thêm cả tên người dùng và mật khẩu vào giao diện `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view4.png)

Đến đây, người dùng đã có thể nhập tên người dùng và mật khẩu.

## Nút đăng nhập

Tiếp theo, chúng ta thêm một nút đăng nhập ở dưới các ô nhập liệu.

```swift
Button("Sign in") {

}
```

Sau đó, dùng `buttonStyle` để thêm cho nút một kiểu hệ thống nổi bật hơn:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Hiệu ứng hiển thị:

![view](../../Resource/019_view5.png)

Để xác nhận rằng nút thật sự có phản hồi khi bấm, trước tiên chúng ta có thể viết một `print` vào trong nút để thử:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Khi bấm vào nút, bảng điều khiển sẽ in ra:

```swift
click Sign in
```

Điều này cho thấy nút đã phản hồi thành công với thao tác bấm.

## Logic đăng nhập

Bây giờ, chúng ta thêm logic kiểm tra cơ bản nhất cho nút đăng nhập: **kiểm tra xem người dùng đã nhập tên người dùng và mật khẩu hay chưa**.

Chúng ta muốn thực hiện các trường hợp sau:

- Nếu người dùng không nhập gì cả, in ra `Empty`
- Nếu người dùng chỉ nhập một trong hai, nhắc còn thiếu mục nào
- Nếu cả tên người dùng và mật khẩu đều đã nhập, in ra `Success`

### Không nhập bất kỳ thông tin nào

Vì `user` và `password` mặc định đều là chuỗi rỗng:

```swift
@State private var user = ""
@State private var password = ""
```

Nên khi người dùng không nhập gì, chúng vẫn sẽ rỗng.

Trong Swift, các kiểu như `String` có thể dùng `isEmpty` để kiểm tra xem nội dung có rỗng hay không.

### Thuộc tính isEmpty

`isEmpty` thường được dùng để kiểm tra xem chuỗi, mảng và các nội dung khác có rỗng hay không.

Ví dụ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Nếu nội dung rỗng thì `isEmpty` trả về `true`; nếu nội dung không rỗng thì `isEmpty` trả về `false`.

Vì vậy, chúng ta có thể dùng nó để xác định xem tên người dùng và mật khẩu đã được nhập hay chưa.

### Dùng isEmpty để kiểm tra biến

Nếu người dùng không nhập bất kỳ thông tin nào, thì:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Lúc này, chúng ta có thể viết điều kiện như sau:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Đoạn mã này có nghĩa là: nếu `user` rỗng, và `password` cũng rỗng, thì in ra:

```swift
Empty
```

Ở đây, `&&` là toán tử logic mang nghĩa “và”.

Tức là điều kiện bên trái đúng, đồng thời điều kiện bên phải cũng đúng, thì toàn bộ điều kiện mới đúng.

Vì vậy, đoạn mã này chỉ được thực thi khi cả tên người dùng và mật khẩu đều rỗng.

## Người dùng chỉ điền một phần

Tiếp theo, hãy xét một tình huống khác: người dùng chỉ điền tên người dùng hoặc chỉ điền mật khẩu.

Ví dụ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Lúc này, tên người dùng không rỗng, nhưng mật khẩu thì rỗng.

Chúng ta có thể tiếp tục dùng `isEmpty` để kiểm tra:

### Trường hợp người dùng điền tài khoản hoặc mật khẩu

Nếu người dùng chỉ điền tên người dùng hoặc mật khẩu, chúng ta cần đưa ra lời nhắc tương ứng về phần còn thiếu.

Ví dụ, nếu người dùng chỉ điền tên người dùng:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logic của đoạn mã này là: nếu tên người dùng rỗng thì nhắc nhập tên người dùng. Nếu không, kiểm tra xem mật khẩu có rỗng không; nếu rỗng thì nhắc nhập mật khẩu.

### Người dùng đã điền đầy đủ thông tin

Nếu cả tên người dùng và mật khẩu đều đã được nhập, thì `isEmpty` của cả hai đều sẽ trả về `false`.

Lúc này, chúng ta có thể viết như sau:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Ở đây, `!` có nghĩa là “phủ định”.

Ví dụ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Tức là `user.isEmpty` dùng để kiểm tra “tên người dùng có rỗng hay không”, còn `!user.isEmpty` dùng để kiểm tra “tên người dùng không rỗng”.

Mật khẩu cũng có logic tương tự.

Vì vậy, ý nghĩa của đoạn mã này là: tên người dùng không rỗng, và mật khẩu cũng không rỗng.

Khi cả hai điều kiện này đều đúng, hệ thống sẽ in ra:

```swift
Success
```

## Logic kiểm tra hoàn chỉnh

Bây giờ, chúng ta kết hợp ba trường hợp này lại và viết vào trong `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Thứ tự thực thi của đoạn mã này có thể hiểu như sau:

Bước đầu tiên, trước hết kiểm tra:

```swift
if user.isEmpty && password.isEmpty
```

Nếu cả tên người dùng và mật khẩu đều rỗng, thì trực tiếp in ra `Empty`.

Nếu cả hai không cùng rỗng, chương trình sẽ tiếp tục kiểm tra dòng sau:

```swift
else if user.isEmpty || password.isEmpty
```

Ở đây, `||` có nghĩa là “hoặc”.

Tức là chỉ cần một trong các điều kiện đúng thì toàn bộ biểu thức sẽ đúng.

Vì vậy, chỉ cần tên người dùng rỗng hoặc mật khẩu rỗng thì khối mã trong `else if` sẽ được thực thi.

Sau khi vào khối mã, chúng ta kiểm tra thêm xem chính xác ô nhập liệu nào chưa được điền:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Nếu hai điều kiện phía trên đều không đúng, điều đó có nghĩa là tên người dùng không rỗng và mật khẩu cũng không rỗng.

Khi đó, chương trình sẽ đi vào `else` cuối cùng:

```swift
print("Success")
```

Như vậy, chúng ta đã hoàn thành logic kiểm tra nhập liệu đăng nhập cơ bản nhất.

## Kiểm tra tên người dùng và mật khẩu

Logic ở trên chỉ kiểm tra “có nhập nội dung hay không”.

Nhưng trong một App thực tế, chỉ nhập nội dung thôi là chưa đủ. Thông thường còn cần gửi tên người dùng và mật khẩu lên máy chủ để xác thực.

Nếu máy chủ xác nhận rằng tên người dùng tồn tại và mật khẩu chính xác, thì cho phép đăng nhập; nếu không, sẽ thông báo đăng nhập thất bại.

Để luyện tập quá trình này, trước tiên chúng ta có thể đặt một tài khoản và mật khẩu tạm thời trong mã để mô phỏng “thông tin đăng nhập đúng”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Khi cả tên người dùng và mật khẩu đều không rỗng, chúng ta tiếp tục so sánh xem chúng có đúng không:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Ở đây, `==` có nghĩa là “có bằng nhau hay không”.

Ví dụ:

```swift
user == userID
```

Điều đó có nghĩa là tên người dùng do người dùng nhập vào có hoàn toàn giống với tên người dùng đúng mà chúng ta đã thiết lập hay không; đối với mật khẩu, logic cũng giống như vậy.

Vì vậy, khi tên người dùng và mật khẩu được nhập trùng với giá trị đã đặt, hệ thống sẽ in ra `Success`; chỉ cần một trong hai không bằng nhau thì sẽ in ra `Input error`.

Như vậy, chúng ta đã hoàn thành một “xác thực đăng nhập mô phỏng” đơn giản.

Mặc dù đây vẫn chưa phải là chức năng đăng nhập thật sự kết nối với máy chủ, nhưng nó đã đủ để giúp chúng ta hiểu rằng: **sau khi nhấn nút, có thể thực thi các đoạn mã khác nhau tùy theo các điều kiện khác nhau**.

## Tổng kết

Trong bài học này, chúng ta đã hoàn thành một giao diện đăng nhập cơ bản và tập trung học “logic phán đoán nội dung nhập dựa trên điều kiện”.

Nội dung cốt lõi của bài học này là: dùng `isEmpty` để kiểm tra xem chuỗi có rỗng hay không, và dùng câu lệnh `if` kết hợp với các toán tử logic để xử lý các tình huống khác nhau.

Trong đó, có hai toán tử logic rất quan trọng là:

- `&&`: nghĩa là “và”, cả hai điều kiện đều phải thỏa mãn
- `||`: nghĩa là “hoặc”, chỉ cần một điều kiện thỏa mãn là đủ

Khi các điều kiện này cuối cùng cho ra `true` hoặc `false`, câu lệnh `if` sẽ thực thi các đoạn mã khác nhau tùy theo kết quả.

Thông qua giao diện đăng nhập này, chúng ta đã bắt đầu làm quen với cách phát triển kết hợp “giao diện + dữ liệu + phán đoán logic”.

## Mã hoàn chỉnh

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
