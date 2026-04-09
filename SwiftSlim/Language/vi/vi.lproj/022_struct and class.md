# struct và class

Ở bài học trước, chúng ta mới bắt đầu làm quen với `struct`, đã định nghĩa một structure, đồng thời cũng mở rộng việc học sang các kiến thức như protocol, `UUID` và những nội dung khác.

Bây giờ, chúng ta đã có nhận thức ban đầu về từ khóa `struct`, nhưng vẫn chưa thể nói là đã thật sự hiểu nó.

Trong bài học này, chúng ta tiếp tục lấy `struct` làm nội dung cốt lõi, đồng thời cũng sẽ làm quen với `class`. Thông qua bài học này, bạn sẽ hiểu rõ hơn: instance là gì, constructor là gì, và vì sao chúng ta có thể dùng `struct` và `class` để tổ chức dữ liệu.

## Hệ thống quản lý học sinh

Ví dụ, bây giờ chúng ta muốn phát triển một hệ thống quản lý học sinh. Mỗi học sinh đều có thông tin như tên, giới tính, số điện thoại, tuổi, địa chỉ nhà, v.v.

Lúc này, chúng ta có thể kết hợp những thông tin này lại và định nghĩa thành một structure `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Ở đây, chúng ta sử dụng `struct` để định nghĩa một type học sinh.

Structure `Student` này chứa nhiều properties:

- `id`: định danh duy nhất của học sinh
- `name`: tên học sinh
- `sex`: giới tính của học sinh
- `phone`: số điện thoại của học sinh
- `age`: tuổi của học sinh
- `address`: địa chỉ nhà

Như vậy, nhiều dữ liệu vốn rời rạc ban đầu đã được kết hợp thành một “học sinh” hoàn chỉnh.

`Student` ở đây cũng tuân theo protocol `Identifiable` và định nghĩa một field `id`, để thuận tiện cho việc hiển thị dữ liệu bằng vòng lặp `ForEach` về sau.

Sau đó, chúng ta có thể tạo một instance học sinh:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Đoạn code này cho biết rằng, dựa theo structure `Student`, chúng ta có thể tạo ra dữ liệu học sinh cụ thể.

Trong đó, `Student` là type, còn `Student(...)` biểu thị một instance được tạo ra.

Trong SwiftUI, chúng ta có thể gán instance này cho một biến rồi hiển thị nó ra.

Ví dụ:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Như vậy, trong view chúng ta có thể thấy tên của học sinh này: `Fang Junyu`.

Ở đây, trước tiên chúng ta tạo một instance `Student`, sau đó gán nó cho biến `student`, cuối cùng đọc property bên trong thông qua `student.name`.

## instance là gì

Khi mới bắt đầu học `struct`, có thể chúng ta sẽ cảm thấy từ “instance” khá xa lạ.

Nhưng thực ra, ngay từ đầu chúng ta đã sử dụng instance rồi, chỉ là trước đây chưa đặc biệt để ý.

Ví dụ:

```swift
let name = "Fang Junyu"
```

Ở đây, `"Fang Junyu"` là một string value, về bản chất nó chính là một instance của type `String`.

Chúng ta cũng có thể viết như sau:

```swift
let name = String("Fang Junyu")
```

Hai cách viết này diễn đạt cùng một việc: tạo một instance của type `String` và gán nó cho biến `name`.

Tương tự, `Int` cũng như vậy:

```swift
let num = 3
```

Ở đây, `3` về bản chất là một value của type `Int`, đồng thời cũng có thể hiểu là một instance `Int`.

Vì vậy, instance không phải là một khái niệm đặc biệt chỉ xuất hiện trong `struct`.

Dù là `String`, `Int`, `Double`, `Bool` hay `Student` do chúng ta tự định nghĩa, tất cả đều có thể tạo ra instance.

Do đó, khi chúng ta viết:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Về bản chất cũng giống như tạo instance của `String` hay `Int`, chỉ là `Student` là type do chúng ta tự định nghĩa mà thôi.

## constructor

Khi chúng ta tạo một instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Thực tế, chúng ta đang gọi initialization method của `Student`, tức là `init`.

Bạn có thể hiểu constructor là: **điểm vào chịu trách nhiệm gán values cho properties khi tạo instance.**

Nói cách khác, trước khi một instance thực sự được tạo xong, thông thường nó đều phải đi qua `init` trước.

Ví dụ, khi trước đó học vòng đời của SwiftUI view, chúng ta đã viết đoạn code như thế này:

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
    }
}
```

Ở đây, `init()` sẽ được thực thi khi instance `ContentView` được tạo ra, còn `onAppear` chỉ được thực thi khi view thực sự hiển thị lên giao diện. Nói cách khác, thời điểm tạo view và thời điểm hiển thị view không phải là một.

Tương tự, khi chúng ta tạo `Student(...)`, cũng chính là đang gọi constructor của `Student`.

### constructor do hệ thống tự động tạo

Khi chúng ta định nghĩa `Student`, chúng ta đã không tự viết `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Nhưng chúng ta vẫn có thể trực tiếp tạo instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Vì sao có thể tạo instance khi không có constructor?

Bởi vì đối với `struct`, nếu chúng ta không tự viết constructor, hệ thống thường sẽ tự động tạo giúp chúng ta một constructor phù hợp.

Ở giai đoạn mới học, có thể hiểu đơn giản là: Swift tự động bổ sung initialization code cho chúng ta.

Có thể hiểu gần đúng là hệ thống sẽ bổ sung đoạn code như sau:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Ở đây cần chú ý một chi tiết:

```swift
let id = UUID()
```

`id` đã có default value, vì vậy khi tạo instance chúng ta không cần tự truyền `id` vào nữa.

Nói cách khác, các properties không có default value thường cần được truyền vào constructor; còn các properties đã có default value thì thường có thể dùng trực tiếp giá trị mặc định đó.

Vì vậy, khi tạo instance `Student`, chúng ta chỉ cần truyền `name`, `sex`, `phone`, `age` và `address`.

### Gợi ý của compiler

Ngoài ra, khi chúng ta nhập `Student(...)` trong Xcode, cũng có thể thấy gợi ý tham số mà hệ thống đưa ra.

![student](../../Resource/022_student.png)

Điều này thực ra cũng cho thấy: type hiện tại thực sự có một constructor do hệ thống tự động tạo.

### Tự viết constructor

Mặc dù hệ thống có thể tự động tạo constructor, nhưng đôi khi cách khởi tạo mặc định này lại không hoàn toàn phù hợp với nhu cầu của chúng ta.

Ví dụ, chúng ta có một structure `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Theo constructor do hệ thống tự động tạo, khi tạo instance chúng ta bắt buộc phải truyền đồng thời cả ba tham số này:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Nhưng nếu bây giờ chúng ta muốn nhập một loạt phim cũ, chỉ biết tên phim mà không biết đạo diễn và rating, thì sẽ khá bất tiện.

Bởi vì chúng ta chỉ có thể viết như thế này:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Mặc dù cách này vẫn hoạt động, nhưng việc lặp đi lặp lại `--` mỗi lần thì không tiện.

Lúc này, chúng ta có thể tự viết một constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Như vậy, khi tạo các phim cũ, chúng ta chỉ cần truyền `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Đây chính là một trong những ý nghĩa của việc tự viết constructor: **khiến cách tạo instance phù hợp hơn với nhu cầu thực tế.**

### Phân tích custom constructor

Hãy cùng xem constructor do chúng ta tự viết vừa rồi:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Ý nghĩa của đoạn code này là, khi tạo instance `Movie`, chỉ yêu cầu truyền vào một tham số `name`.

Sau đó, bên trong constructor, `name` được truyền vào sẽ được gán cho `name` của chính instance, còn `director` và `rating` sẽ được gán giá trị mặc định `--`.

`self` ở đây có nghĩa là “chính instance hiện tại này”.

Ví dụ:

```swift
self.name = name
```

`self.name` ở bên trái biểu thị property của instance; còn `name` ở bên phải biểu thị tham số mà chúng ta truyền vào.

Có thể hiểu đơn giản rằng giá trị được truyền từ bên ngoài sẽ được lưu vào property của chính instance.

Khi tất cả properties đều đã được gán values xong, instance này sẽ được tạo hoàn tất.

### Cơ chế của constructor

Khi chúng ta khai báo rõ ràng một constructor, sẽ còn kéo theo một thay đổi nữa:

Constructor mà hệ thống tự động tạo ban đầu, thông thường sẽ không thể tiếp tục dùng trực tiếp được nữa.

Ví dụ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Bây giờ nếu chúng ta lại viết như sau:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler sẽ báo lỗi:

```swift
Extra arguments at positions #2, #3 in call
```

Nghĩa là: bạn đã truyền vào các arguments dư thừa.

Vì sao lỗi này xuất hiện?

Bởi vì trong structure `Movie` hiện tại, chỉ tồn tại duy nhất constructor do bạn tự khai báo này:

```swift
init(name: String)
```

Nó chỉ chấp nhận một tham số `name`, chứ không chấp nhận `director` và `rating`.

Nói cách khác, sau khi bạn tự thêm constructor của riêng mình, cách khởi tạo mà hệ thống tự động tạo trước đó thường sẽ không còn dùng trực tiếp được nữa.

Nếu chúng ta vừa muốn hỗ trợ “chỉ truyền tên”, vừa muốn hỗ trợ “truyền đầy đủ thông tin”, thì cần phải tự bổ sung thêm một constructor đầy đủ:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Như vậy, chúng ta sẽ có hai constructor khác nhau.

Khi tạo phim cũ, có thể viết như sau:

```swift
Movie(name: "The Night of the Hunter")
```

Khi tạo phim mới có đầy đủ thông tin, có thể viết như sau:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Cách viết này cũng cho thấy: cùng một type có thể có nhiều constructor, miễn là hình thức tham số của chúng khác nhau.

## overloading là gì

Ở đây bổ sung thêm một kiến thức cần thiết.

Vừa rồi, chúng ta đã viết hai `init` cho `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Kiểu viết mà “cùng một function name nhưng tham số khác nhau” này được gọi là “overloading”.

Ở đây, cả hai functions đều có tên là `init`, nhưng chúng nhận các tham số khác nhau, vì vậy Swift có thể phân biệt được bạn đang gọi function nào.

Ví dụ:

```swift
Movie(name: "Days of Heaven")
```

Sẽ gọi:

```swift
init(name: String)
```

Còn:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Sẽ gọi phiên bản đầy đủ còn lại của initialization method.

Vì vậy, tác dụng của overloading là: cho phép cùng một type cung cấp những cách tạo khác nhau tùy theo từng tình huống.

## Làm quen với class

Tiếp theo, chúng ta hãy cùng làm quen ngắn gọn với `class`.

Ngoài `struct` thường gặp trong Swift, nhiều ngôn ngữ lập trình cũng sử dụng `class` để tạo instance, ví dụ như Java, C#, Kotlin, v.v.

Trong Swift, cách viết `class` rất gần với `struct`.

Ví dụ:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Bạn sẽ thấy rằng, ngoài việc keyword chuyển từ `struct` thành `class`, các phần còn lại nhìn gần như giống hệt nhau.

Cách tạo instance cũng rất giống:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Vì vậy, ở mức syntax, `struct` và `class` quả thực rất giống nhau.

### Sự khác nhau giữa Struct và Class

Mặc dù `struct` và `class` trông rất giống nhau, nhưng chúng không hoàn toàn giống nhau.

**1. Cách initialization khác nhau**

Đối với `struct`, nếu chúng ta không tự viết constructor, hệ thống thường sẽ tự động tạo ra một initialization method phù hợp.

Nhưng đối với `class`, nếu còn properties chưa có default value, thì thông thường cần phải tự viết `init`, nếu không sẽ báo lỗi.

Ví dụ:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

`class` này vì không có constructor nên sẽ báo lỗi do properties chưa được khởi tạo.

compiler sẽ đưa ra gợi ý tương tự như:

```swift
Class 'Movie' has no initializers
```

Vì vậy, trong ví dụ này, `class` bắt buộc phải tự viết constructor.

**2. `struct` là value type, còn `class` là reference type**

`struct` là value type, còn `class` là reference type.

Ở giai đoạn mới học, chưa cần nắm vững hoàn toàn hai khái niệm này, chỉ cần có một hiểu biết đơn giản là đủ.

Ví dụ, `struct` giống hơn với việc “sao chép ra một value mới”.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Ở đây, sau khi gán `user1` cho `user2`, tương đương với việc sao chép ra một bản dữ liệu mới, vì vậy việc sửa `user2` sẽ không ảnh hưởng đến `user1`.

Còn `class` thì giống hơn với việc “cùng trỏ đến một instance”.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Ở đây, `user1` và `user2` cùng trỏ đến một instance.

Hiện tại chúng ta chưa cần hiểu hoàn toàn cơ chế bên dưới của value type và reference type, chỉ cần biết rằng `struct` phù hợp hơn để lưu trữ dữ liệu độc lập, còn `class` phù hợp hơn khi nhiều nơi cần chia sẻ cùng một instance.

## Giai đoạn mới học nên chọn thế nào

Ở giai đoạn hiện tại, với data model thông thường nên ưu tiên `struct`; còn với dữ liệu cần được chia sẻ và chỉnh sửa đồng bộ thì mới cân nhắc `class`.

Đây không phải là quy tắc tuyệt đối, nhưng đối với người mới học thì đó là một cách phán đoán đủ thực tế.

Đặc biệt trong SwiftUI, nhiều khi bạn sẽ nhận ra rằng `struct` đã có thể hoàn thành phần lớn công việc.

Ngoài ra, trong nhiều tài liệu lập trình, nội dung được tạo ra bởi `class` cũng được gọi là “object”. Ở giai đoạn mới học, bạn có thể tạm hiểu nó như instance, không nhất thiết phải cố tình phân biệt.

## Tổng kết

Trong bài học này, chúng ta đã học sâu hơn về `struct`, đồng thời cũng làm quen với `class`; cả hai đều có thể được dùng để định nghĩa types.

Types có thể tạo ra instance. Khi tạo instance, constructor, tức là `init`, sẽ được gọi.

Đối với `struct`, nếu không tự viết constructor, hệ thống thường sẽ tự động tạo ra một constructor phù hợp. Nếu constructor mặc định không đáp ứng nhu cầu, chúng ta cũng có thể tự viết constructor.

Ngoài ra, chúng ta cũng đã hiểu sơ bộ sự khác nhau giữa `struct` và `class`: `struct` là value type, còn `class` là reference type. Trong SwiftUI, ở giai đoạn mới học, thứ mà chúng ta thường gặp nhiều hơn thường là `struct`.

Về sau, khi học truyền value giữa các view, data model và state management, những nội dung này sẽ còn tiếp tục được sử dụng.
