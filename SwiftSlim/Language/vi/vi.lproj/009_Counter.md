# Bộ đếm (Counter)

Trong hai bài học trước, chúng ta đã tìm hiểu về biến, hằng số, nút bấm (button) và phương thức (method).

Trong bài học này, chúng ta sẽ kết hợp những kiến thức đó lại để tạo ra một ứng dụng bộ đếm đơn giản.

Trong ví dụ này, chúng ta sẽ học cách lưu trữ và thay đổi biến, cũng như sử dụng @State để quản lý biến.

## Triển khai bộ đếm

Bộ đếm thường được sử dụng để ghi lại các số lượng cần được cộng dồn liên tục. Ví dụ: số lần nhảy dây, số vòng chạy và các tình huống đếm số khác.

Dưới đây chúng ta sẽ triển khai một bộ đếm đơn giản: hiển thị một con số và một nút bấm, khi nhấn vào nút thì con số sẽ tăng lên.

![Num](../../RESOURCE/009_num.png)

### Hiển thị con số

Đầu tiên, chúng ta sử dụng Text để hiển thị con số.

```swift
Text("0")
```

Tuy nhiên, nếu con số cần phải thay đổi, chúng ta không thể viết cứng là "0", mà nên sử dụng một biến để lưu trữ con số đó.

```swift
var num = 0
```

Sau đó hiển thị biến này trong Text:

```swift
Text("\(num)")
```

Ở đây chúng ta sử dụng String Interpolation (nội suy chuỗi) \(), để chuyển đổi con số thành chuỗi nhằm mục đích hiển thị.

### Nút bấm tăng số

Tiếp theo, chúng ta thêm một nút bấm.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Khi nút được nhấn, chúng ta muốn con số tăng lên.

Vì vậy, chúng ta có thể sửa đổi biến bên trong nút bấm:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Đoạn mã này có ý nghĩa là: khi nhấn vào nút, nó sẽ tính toán num + 1, và gán kết quả đó lại cho num.

### Cách viết ngắn gọn hơn

Swift cung cấp một cách viết ngắn gọn hơn:

```swift
num += 1
```

Nó tương đương với:

```swift
num = num + 1
```

Cách viết này được gọi là "Toán tử gán phức hợp" (Compound assignment operator).

Các toán tử gán phức hợp phổ biến trong Swift bao gồm:

```
+=   Gán phép cộng
-=   Gán phép trừ
*=   Gán phép nhân
/=   Gán phép chia
%=   Gán phép chia lấy dư
```

Ví dụ:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Mã nguồn hoàn chỉnh

Bây giờ, chúng ta có thể viết ra một bộ đếm đơn giản:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Tuy nhiên, lúc này đoạn mã không thể hoạt động bình thường.

### Xuất hiện lỗi

Xcode sẽ báo lỗi:

```
Cannot assign to property: 'self' is immutable
```

Điều này có nghĩa là không thể sửa đổi thuộc tính, bởi vì View (giao diện) là không thể thay đổi (immutable).

Tại sao lại như vậy?

## Nguyên lý hoạt động của SwiftUI

Trong SwiftUI: **giao diện được điều khiển bởi dữ liệu (data-driven)**, điều này có nghĩa là khi dữ liệu thay đổi, giao diện sẽ tự động làm mới.

Nhưng cần lưu ý rằng, chỉ khi các trạng thái (như @State, @Binding) có sự thay đổi, SwiftUI mới theo dõi và làm mới giao diện.

Nếu sử dụng biến thông thường, SwiftUI sẽ chỉ đọc giá trị của biến một lần khi tạo View, sau đó dù biến có thay đổi, giao diện cũng sẽ không được cập nhật.

Ví dụ:

```swift
var num = 0   // 0
num = 1   // 0
```

Trong ví dụ trên, num là một biến thông thường, mặc dù giá trị của nó đã thay đổi, nhưng SwiftUI sẽ không cập nhật giao diện, màn hình vẫn sẽ hiển thị giá trị ban đầu là 0.

![Num](../../RESOURCE/009_state.png)

Do đó, chỉ khi dữ liệu được đánh dấu là trạng thái (ví dụ như sử dụng các Property Wrapper - Trình bọc thuộc tính - như @State, @Binding), SwiftUI mới tự động theo dõi sự thay đổi của nó và cập nhật View.

## Trình bọc thuộc tính @State

Trong SwiftUI, nếu cần sửa đổi một biến và cập nhật giao diện, bạn bắt buộc phải sử dụng @State.

```swift
@State var num = 0
```

@State sẽ yêu cầu SwiftUI lắng nghe biến này.

Khi biến thay đổi, SwiftUI sẽ tính toán lại View và cập nhật hiển thị.

Mã nguồn hoàn chỉnh:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Bây giờ, khi nhấn vào nút:

```swift
num += 1
```

SwiftUI sẽ phát hiện ra sự thay đổi của num, sau đó tự động cập nhật giao diện.

![Num](../../RESOURCE/009_state1.png)

## Quy tắc sử dụng @State

Trong thực tế phát triển, @State thường tuân theo hai quy tắc.

### 1. @State thường sử dụng private

Các biến @State thường chỉ được sử dụng trong kiểu dữ liệu hiện tại (chẳng hạn như cấu trúc View hiện tại), vì vậy nó thường được viết là:

```swift
@State private var num = 0
```

Điều này giúp tránh việc các View khác truy cập hoặc sửa đổi trực tiếp biến này.

Vì chúng ta chưa học về private, bạn có thể hiểu đơn giản là:

**Những nội dung có từ khóa private chỉ có thể được sử dụng trong View hiện tại, các View bên ngoài không thể sử dụng.**

### 2. @State chỉ dùng cho trạng thái của View hiện tại

@State thích hợp cho dữ liệu mà View hiện tại tự quản lý.

Ví dụ, nội dung ô nhập liệu, trạng thái của công tắc (switch).

```swift
@State private var isOn = false
@State private var text = ""
```

Nếu dữ liệu cần được chia sẻ giữa nhiều View, chúng ta cần sử dụng các loại trạng thái khác, ví dụ như @Binding hoặc @Observable.

Những nội dung này sẽ được tìm hiểu trong các bài học sau.

### Nút bấm giảm số

Ngoài việc tăng, bộ đếm cũng có thể giảm.

Chúng ta có thể thêm một nút -.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Sau đó sử dụng HStack để sắp xếp các nút theo chiều ngang:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Kết quả:

![Num](../../RESOURCE/009_num1.png)

Khi nhấn nút +, số sẽ cộng thêm 1; khi nhấn nút -, số sẽ trừ đi 1.

### Nút cài đặt lại (Reset)

Chúng ta cũng có thể thêm một nút đặt lại để đưa con số về 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Khi nhấn vào nút đặt lại, num sẽ được gán giá trị là 0.

Kết quả:

![Num](../../RESOURCE/009_num2.png)

Khi nhấn nút 0, con số sẽ trở về 0.

### Tùy chỉnh nút bấm

Hiện tại nút của chúng ta chỉ có thể hiển thị văn bản:

```swift
Button("+") {

}
```

Cách viết này khiến nút chỉ hiển thị được nội dung văn bản, ví dụ + hoặc -.

Trong thực tế phát triển, chúng ta thường muốn giao diện của nút phong phú hơn, chẳng hạn như sử dụng biểu tượng (icon) hoặc các View khác.

SwiftUI cho phép chúng ta tùy chỉnh nội dung hiển thị của nút, lúc này chúng ta có thể sử dụng một cách viết khác của nút:

```swift
Button(action: {

}, label: {

})
```

Trong cách viết này, action đại diện cho đoạn mã được thực thi khi nhấn nút, còn label dùng để hiển thị giao diện của nút.

Ví dụ, chúng ta có thể làm cho nút hiển thị một biểu tượng SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Như vậy, nút sẽ không còn hiển thị văn bản nữa mà là một biểu tượng.

### Tối ưu hóa giao diện bộ đếm

Để giao diện bộ đếm rõ ràng hơn, chúng ta cũng có thể điều chỉnh kiểu hiển thị của con số. Ví dụ phóng to chữ số:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Tiếp theo, chúng ta thay đổi nội dung hiển thị của nút thành biểu tượng, đồng thời phóng to kích thước biểu tượng lên một chút:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Tương tự, chúng ta cũng có thể đổi nút giảm và nút đặt lại thành dạng biểu tượng:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Bây giờ các nút hiển thị biểu tượng SF Symbols, giao diện cũng trở nên trực quan hơn.

![Num](../../RESOURCE/009_num3.png)

## Tổng kết

Trong bài học này, thông qua việc tạo ra một bộ đếm đơn giản, chúng ta đã thực hành tổng hợp về cách sử dụng biến, Text và Button. Chúng ta sử dụng biến để lưu trữ con số, và điều khiển việc tăng giảm số thông qua nút bấm, đồng thời học về các toán tử gán phức hợp như num += 1 và num -= 1.

Trong quá trình thực hiện, chúng ta đã hiểu cách hoạt động của SwiftUI: giao diện được điều khiển bởi dữ liệu. Chỉ khi dữ liệu thay đổi, giao diện mới được làm mới. Do đó, cần sử dụng @State để lưu trữ các trạng thái có thể thay đổi, khi biến @State thay đổi, SwiftUI sẽ tự động cập nhật View.

Cuối cùng, chúng ta đã tiến hành tối ưu hóa giao diện một cách đơn giản, điều chỉnh kiểu phông chữ của Text, và sử dụng Button(action:label:) để tùy chỉnh nội dung nút, giúp nút có thể hiển thị biểu tượng, từ đó làm cho giao diện bộ đếm trở nên rõ ràng và đẹp mắt hơn.

Bây giờ, chúng ta đã tiếp xúc với cách sử dụng cơ bản của các View trong SwiftUI. Trong SwiftUI, phần lớn giao diện được điều khiển thông qua các biến. Khi biến thay đổi, SwiftUI tự động cập nhật View. Do đó, khi phát triển ứng dụng SwiftUI, chúng ta thường cần thiết kế trước các dữ liệu cần lưu trữ, sau đó dựa vào các dữ liệu này để xây dựng giao diện và logic tương tác.

## Mã nguồn hoàn chỉnh

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```