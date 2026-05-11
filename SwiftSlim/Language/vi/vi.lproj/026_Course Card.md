# Thẻ khóa học

Bài học này là một bài ôn tập theo giai đoạn. Chúng ta sẽ hoàn thành một “thẻ khóa học”.

Thông qua bài luyện tập này, chúng ta có thể ôn lại các nội dung đã học trước đó như `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, đồng thời học cách kết hợp nhiều view nhỏ thành một mô-đun view hoàn chỉnh.

Hiệu ứng thẻ khóa học:

![view](../../../Resource/026_view.png)

Thẻ khóa học này chủ yếu gồm một vài phần:

- Cấp độ khóa học: `Beginner`
- Nội dung khóa học: `20+ Lessons`
- Tiêu đề khóa học: `SwiftUI Beginner Tutorial`
- Mô tả khóa học
- Nút: `Start Learning`
- Nền khóa học: biểu tượng Swift và nền màu chàm

Chúng ta có thể hoàn thành view này trong `ContentView`.

## Khu vực trên cùng

Trước tiên, tạo khu vực trên cùng của thẻ khóa học.

![view](../../../Resource/026_view1.png)

Bên trái của khu vực trên cùng hiển thị cấp độ khóa học, bên phải hiển thị nội dung khóa học.

Vì hai nội dung này được sắp xếp theo chiều ngang, nên có thể sử dụng `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Người mới bắt đầu")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ bài học")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Ở đây, chúng ta tách khu vực trên cùng thành một thuộc tính tính toán:

```swift
var topView: some View
```

Lợi ích của cách làm này là giúp `body` rõ ràng hơn.

Khu vực trên cùng chủ yếu sử dụng các nội dung sau:

- `HStack`: sắp xếp hai đoạn văn bản theo chiều ngang.
- `Text`: hiển thị nội dung văn bản.
- `Spacer()`: đẩy văn bản bên trái sang trái và văn bản bên phải sang phải.
- `.font(.footnote)`: đặt kiểu chữ nhỏ hơn.
- `.fontWeight(.bold)`: đặt chữ in đậm.
- `.foregroundStyle(Color.white)`: đặt màu tiền cảnh thành màu trắng.
- `.padding(.vertical, 10)`: đặt khoảng đệm theo chiều dọc.
- `.padding(.horizontal, 16)`: đặt khoảng đệm theo chiều ngang.
- `.background(Color.white.opacity(0.15))`: đặt nền trắng bán trong suốt.
- `.cornerRadius(20)`: đặt bo góc.

Ở đây, `Beginner` sử dụng `.padding()` theo hai hướng:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Như vậy văn bản sẽ có khoảng trống ở cả trên dưới và trái phải, nhìn giống một nhãn hơn.

`Color.white.opacity(0.15)` biểu thị màu trắng có độ mờ `15%`, tức là một màu trắng rất nhạt.

### Thêm nền thẻ

Trước đó, chúng ta đã tạo `topView`, nhưng chỉ tạo view thì nó sẽ không tự động hiển thị.

Trong SwiftUI, nội dung thực sự hiển thị trên giao diện cần được viết trong `body`.

Vì vậy, trước tiên có thể đặt `topView` vào `body` để hiển thị:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Lúc này bạn sẽ thấy khu vực trên cùng đã được hiển thị:

![view](../../../Resource/026_view2.png)

Tuy nhiên, vì văn bản trong `topView` là màu trắng, còn nền mặc định cũng là màu sáng, nên trong chế độ sáng có thể không dễ nhìn rõ.

Do đó, chúng ta có thể thêm một `VStack` ở bên ngoài, rồi đặt khoảng đệm, màu nền và bo góc cho toàn bộ khu vực:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view3.png)

`VStack` ở đây hiện chỉ chứa một `topView`, nên có vẻ như không thật sự cần thiết.

Nhưng sau đó, chúng ta sẽ tiếp tục thêm tiêu đề khóa học, mô tả khóa học và khu vực nút. Chúng đều là các nội dung được sắp xếp theo chiều dọc, nên sử dụng `VStack` trước ở đây sẽ thuận tiện hơn cho việc tiếp tục kết hợp view sau này.

Ở đây có hai `.padding()`, và tác dụng của chúng khác nhau.

`.padding(20)` đầu tiên được viết trước `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Nó kiểm soát khoảng đệm bên trong của thẻ, tức là khoảng cách giữa nội dung và mép nền.

`.padding(30)` thứ hai được viết sau `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Nó kiểm soát khoảng đệm bên ngoài của thẻ, tức là khoảng cách giữa toàn bộ thẻ và mép màn hình.

![view](../../../Resource/026_view4.png)

Vì vậy, dù đều là `.padding()`, nhưng đặt ở các vị trí khác nhau sẽ tạo ra hiệu ứng khác nhau.

## Khu vực nội dung

Tiếp theo, tạo khu vực nội dung của thẻ khóa học.

Hiệu ứng hiển thị:

![view](../../../Resource/026_view5.png)

Khu vực nội dung gồm tiêu đề khóa học và mô tả khóa học. Chúng được sắp xếp theo chiều dọc, nên sử dụng `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Hướng dẫn SwiftUI cho người mới bắt đầu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Bắt đầu từ con số không với SwiftUI và học một cách có hệ thống về phát triển giao diện khai báo của Apple. Thông qua giải thích rõ ràng và ví dụ thực tế, bạn sẽ dần nắm vững bố cục, tương tác và quản lý trạng thái để xây dựng các giao diện ứng dụng đẹp và hữu ích.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view6.png)

Trong `VStack` này có sử dụng hai tham số:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` có nghĩa là các view bên trong `VStack` được căn theo mép dẫn.

`spacing: 10` có nghĩa là các view bên trong `VStack` giữ khoảng cách `10 pt` với nhau.

Vì vậy, tiêu đề khóa học và mô tả khóa học sẽ bắt đầu từ phía bên trái và giữ một khoảng cách nhất định giữa chúng.

Mô tả khóa học tương đối dài. Nếu hiển thị toàn bộ, thẻ sẽ trở nên rất cao, nên ở đây sử dụng `.lineLimit()` để giới hạn số dòng hiển thị:

```swift
.lineLimit(3)
```

Nó có nghĩa là hiển thị tối đa `3` dòng. Khi nội dung vượt quá số dòng giới hạn, phần vượt quá sẽ bị lược bỏ.

### Căn view sang trái

Ở đây còn một điểm cần chú ý.

`VStack(alignment: .leading)` chỉ có thể kiểm soát cách căn chỉnh của các view bên trong `VStack`. Nó không trực tiếp kiểm soát vị trí của chính `VStack` trong container bên ngoài.

Ví dụ, nếu mô tả khóa học tương đối ngắn:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Hướng dẫn SwiftUI cho người mới bắt đầu")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Chỉ là một đoạn nội dung.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view7.png)

Có thể thấy, mặc dù tiêu đề khóa học và mô tả khóa học được căn trái bên trong `VStack`, nhưng toàn bộ `VStack` lại không sát về mép trái của thẻ.

Đó là vì khi nội dung ngắn, chiều rộng của `VStack` cũng sẽ tương đối hẹp. Khi container bên ngoài bố trí nội dung, nó có thể đặt `VStack` hẹp hơn này ở giữa.

Có thể hiểu như sau: `VStack(alignment: .leading)` chịu trách nhiệm căn trái bên trong.
Nhưng nó không chịu trách nhiệm đẩy toàn bộ khu vực nội dung sang sát bên trái.

Nếu muốn toàn bộ khu vực nội dung thật sự căn sang trái, có thể bọc nó bằng một `HStack` khác và thêm `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hướng dẫn SwiftUI cho người mới bắt đầu")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Chỉ là một đoạn nội dung.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view8.png)

`HStack` ở đây là bố cục theo chiều ngang.

`Spacer()` sẽ chiếm phần không gian còn lại ở bên phải, từ đó đẩy `VStack` bên trái sang sát bên trái.

Vì vậy, `HStack + Spacer()` có thể được dùng để kiểm soát vị trí của toàn bộ khu vực nội dung.

Trong thẻ khóa học thực tế, mô tả khóa học tương đối dài và thường chiếm nhiều chiều rộng hơn, nên vấn đề này không nhất định rõ ràng. Nhưng hiểu sự khác biệt này rất quan trọng, vì sau này khi làm bố cục văn bản ngắn, thường sẽ gặp các tình huống tương tự.

### Kiểm soát khoảng cách giữa các view bên trong

Trước đó, chúng ta đã viết `spacing: 10` trong `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` dùng để kiểm soát khoảng cách giữa các view bên trong.

Nếu không đặt `spacing`, `VStack` cũng sẽ có khoảng cách mặc định, nhưng khoảng cách mặc định không nhất định phù hợp với hiệu ứng chúng ta muốn.

Ở đây, nếu tiêu đề khóa học và mô tả khóa học quá gần nhau, bố cục sẽ trông chật chội, nên sử dụng:

```swift
spacing: 10
```

Để giữ lại một chút khoảng trống giữa chúng.

Hiệu ứng hiển thị:

![view](../../../Resource/026_view9.png)

Tương tự, khu vực trên cùng và khu vực nội dung cũng được sắp xếp theo chiều dọc, nên cũng có thể sử dụng `spacing` để kiểm soát khoảng cách giữa chúng.

Bây giờ, đặt `topView` và `contentView` vào `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view10.png)

Ở đây, `VStack(spacing: 20)` kiểm soát khoảng cách giữa `topView` và `contentView`.

Nói cách khác:

```swift
VStack(alignment: .leading, spacing: 10)
```

Kiểm soát khoảng cách giữa tiêu đề khóa học và mô tả khóa học.

```swift
VStack(spacing: 20)
```

Kiểm soát khoảng cách giữa khu vực trên cùng và khu vực nội dung.

Chúng đều là `spacing`, nhưng tác động lên các `VStack` khác nhau, nên phạm vi ảnh hưởng cũng khác nhau.

Như vậy, view của khu vực nội dung đã hoàn thành.

## Khu vực nút

Tiếp theo, tạo khu vực nút ở dưới cùng.

Hiệu ứng hiển thị:

![view](../../../Resource/026_view11.png)

Khu vực nút chủ yếu gồm một biểu tượng phát và một đoạn văn bản.

Chúng ta có thể dùng `Image` để hiển thị biểu tượng phát, dùng `Text` để hiển thị văn bản nút.

Ở đây, trước tiên tạo giao diện của một nút:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("nhấn nút")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Bắt đầu học")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view12.png)

Ở đây sử dụng hai `HStack`:

`HStack` bên trong dùng để sắp xếp biểu tượng và văn bản theo chiều ngang:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Bắt đầu học")
}
```

`HStack` bên ngoài kết hợp với `Spacer()`, dùng để căn giao diện nút sang trái:

```swift
HStack {
    ...
    Spacer()
}
```

Khi nhấn vào nút, console sẽ xuất ra `nhấn nút`.

## Hoàn thành thẻ cơ bản

Bây giờ, kết hợp khu vực trên cùng, khu vực nội dung và khu vực nút lại với nhau:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Hiệu ứng hiển thị:

![view](../../../Resource/026_view13.png)

Đến đây, một thẻ khóa học cơ bản đã hoàn thành.

## Nền biểu tượng Swift

Cuối cùng, chúng ta thêm một nền biểu tượng Swift bán trong suốt cho thẻ.

![view](../../../Resource/026_view.png)

Trước đó, chúng ta đã dùng `Color.indigo` làm màu nền. Thực ra, ngoài việc thêm màu, `.background()` cũng có thể thêm một view hoàn chỉnh.

Vì vậy, trước tiên chúng ta có thể tạo một view nền riêng:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Trong view nền này, chúng ta sử dụng `VStack`, `HStack` và `Spacer()` để đẩy biểu tượng Swift xuống góc dưới bên phải.

Vì biểu tượng Swift chỉ được dùng làm nền trang trí, nên ở đây sử dụng màu trắng bán trong suốt:

```swift
Color.white.opacity(0.15)
```

Như vậy biểu tượng sẽ không quá nổi bật, cũng không ảnh hưởng đến nội dung văn bản phía trước.

Tiếp theo, thêm `backgroundView` vào thẻ:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Hiệu ứng hoàn thiện:

![view](../../../Resource/026_view14.png)

Ở đây sử dụng liên tiếp hai `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

`.background()` đầu tiên dùng để thêm nền biểu tượng Swift.
`.background()` thứ hai dùng để thêm nền màu chàm.

Như vậy, biểu tượng Swift sẽ hiển thị phía trên nền màu chàm và xuất hiện như một phần của nền thẻ.

Từ đây có thể thấy, `.background()` không chỉ có thể thêm màu, mà còn có thể thêm view tùy chỉnh. Nhiều `.background()` cũng có thể được kết hợp để tạo ra hiệu ứng nền phong phú hơn.

Đến đây, một thẻ khóa học hoàn chỉnh đã hoàn thành.

## Tổng kết

Trong bài học này, thông qua một thẻ khóa học, chúng ta đã ôn lại các cách bố cục cơ bản thường dùng trong SwiftUI.

Chúng ta sử dụng `Text` để hiển thị văn bản, sử dụng `Image` để hiển thị biểu tượng hệ thống, và sử dụng `VStack`, `HStack` cùng `Spacer()` để kiểm soát cách sắp xếp view.

Chúng ta đã học `.lineLimit()`, nó có thể giới hạn số dòng tối đa mà văn bản hiển thị. Khi nội dung vượt quá giới hạn, phần vượt quá sẽ bị lược bỏ.

Đồng thời, chúng ta cũng ôn lại các modifier thường dùng như `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()`.

Sau khi hoàn thành bài học này, chúng ta đã có thể kết hợp nhiều view nhỏ thành một mô-đun thẻ hoàn chỉnh.

Đây cũng là một tư duy rất thường gặp trong phát triển SwiftUI: trước tiên tách view thành các phần nhỏ, sau đó kết hợp chúng thành một giao diện hoàn chỉnh.

## Mã hoàn chỉnh

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Người mới bắt đầu")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ bài học")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Hướng dẫn SwiftUI cho người mới bắt đầu")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Bắt đầu từ con số không với SwiftUI và học một cách có hệ thống về phát triển giao diện khai báo của Apple. Thông qua giải thích rõ ràng và ví dụ thực tế, bạn sẽ dần nắm vững bố cục, tương tác và quản lý trạng thái để xây dựng các giao diện ứng dụng đẹp và hữu ích.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("nhấn nút")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Bắt đầu học")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
