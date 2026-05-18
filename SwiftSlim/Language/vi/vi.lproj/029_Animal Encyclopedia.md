# Bách khoa động vật 

Trong bài học này, chúng ta tiếp tục luyện tập về view tùy chỉnh và truyền dữ liệu.

Chúng ta sẽ tạo một view bách khoa động vật đơn giản. Trang sẽ hiển thị năm loài động vật. Khi nhấn vào một loài, một view chi tiết sẽ bật lên để hiển thị hình ảnh, khu vực phân bố, môi trường sống và mô tả của loài đó.

Kết quả thực hiện:

![view](../../../Resource/029_view.png)

Thông qua ví dụ này, chúng ta có thể luyện tập cách phối hợp giữa cấu trúc dữ liệu, hiển thị danh sách, tương tác nhấn và view bật lên Sheet.

## Chuẩn bị tài nguyên hình ảnh

Trước tiên, chúng ta cần chuẩn bị năm hình ảnh động vật:

- Cá heo: `dolphin.jpg`
- Hươu cao cổ: `giraffe.jpg`
- Sư tử: `lion.jpg`
- Gấu trúc: `panda.jpg`
- Gấu Bắc Cực: `polarBear.jpg`

Có thể sử dụng các tài nguyên hình ảnh sau:

[Cá heo](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Hươu cao cổ](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Sư tử](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Gấu trúc](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Gấu Bắc Cực](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Sau khi tải hình ảnh xuống, hãy kéo chúng vào thư mục tài nguyên `Assets` của dự án Xcode.

![assets](../../../Resource/029_assets.png)

Cần lưu ý rằng khi sử dụng hình ảnh trong code, thông thường không cần viết hậu tố `.jpg`.

Ví dụ, nếu tên tài nguyên hình ảnh là `dolphin`, trong code chỉ cần viết:

```swift
Image("dolphin")
```

Nếu tên hình ảnh bị viết sai, hình ảnh sẽ không thể hiển thị bình thường.

Lưu ý: Các hình ảnh ở trên đến từ dự án Wikimedia. Khi sử dụng, nên giữ lại liên kết ảnh gốc và thông tin nguồn.

## Tạo cấu trúc động vật

Trong trang này, mỗi loài động vật có nhiều thông tin:

- Tên động vật
- Hình ảnh động vật
- Biểu tượng cảm xúc của động vật
- Khu vực phân bố
- Môi trường sống
- Mô tả động vật

Nếu tách các thông tin này thành nhiều biến khác nhau, code sẽ khá rối. Vì vậy, chúng ta có thể tạo một cấu trúc `Animal` để đặt thông tin của một loài động vật vào cùng một chỗ.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Trong đoạn code này:

- `id`: định danh duy nhất của động vật.
- `name`: tên động vật.
- `imageName`: tên hình ảnh động vật.
- `avatarEmoji`: biểu tượng cảm xúc của động vật.
- `distributionArea`: khu vực phân bố.
- `habitat`: môi trường sống.
- `animalDescription`: mô tả động vật.

Trong đó:

```swift
let id = UUID()
```

`id` dùng để định danh từng loài động vật. Vì phía sau chúng ta sẽ dùng `ForEach` để hiển thị danh sách động vật, đồng thời dùng `.sheet(item:)` để bật chi tiết theo động vật được chọn, nên cần để `Animal` tuân thủ giao thức `Identifiable`.

Tác dụng của `Identifiable` là nói với SwiftUI rằng mỗi loài động vật đều có một `id` để phân biệt danh tính.

## Tạo dữ liệu động vật

Tiếp theo, chúng ta tạo một mảng động vật trong `ContentView`.

Mảng này lưu năm `Animal`, mỗi `Animal` đại diện cho một loài động vật.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Cá heo
        Animal(
            name: "Cá heo",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Các vùng biển ấm và ôn đới trên khắp thế giới.",
            habitat: "Đại dương, vùng nước ven biển và một số con sông lớn.",
            animalDescription: "Cá heo là loài động vật có vú biển thông minh. Chúng sống theo đàn, giao tiếp bằng âm thanh và được biết đến với hành vi vui nhộn."
        ),
        // Hươu cao cổ
        Animal(
            name: "Hươu cao cổ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Thảo nguyên và rừng thưa ở châu Phi.",
            habitat: "Đồng cỏ, thảo nguyên và rừng thưa.",
            animalDescription: "Hươu cao cổ là loài động vật trên cạn cao nhất. Chúng có cổ dài, chân dài và thường ăn lá trên những cây cao."
        ),
        // Sư tử
        Animal(
            name: "Sư tử",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Chủ yếu phân bố ở châu Phi hạ Sahara, với một quần thể nhỏ ở miền tây Ấn Độ.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Sư tử là loài mèo lớn mạnh mẽ. Chúng thường sống theo bầy gọi là đàn sư tử và thường được biết đến như vua của thế giới động vật."
        ),
        // Gấu trúc
        Animal(
            name: "Gấu trúc",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Rừng núi ở miền trung Trung Quốc.",
            habitat: "Rừng tre ở các vùng núi mát và ẩm ướt.",
            animalDescription: "Gấu trúc là loài gấu nổi tiếng với bộ lông đen trắng. Chúng chủ yếu ăn tre và là một trong những loài động vật dễ nhận biết nhất trên thế giới."
        ),
        // Gấu Bắc Cực
        Animal(
            name: "Gấu Bắc Cực",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Các vùng Bắc Cực xung quanh Cực Bắc.",
            habitat: "Băng biển, khu vực ven biển và môi trường Bắc Cực lạnh giá.",
            animalDescription: "Gấu Bắc Cực là loài gấu lớn thích nghi với môi trường lạnh. Chúng bơi rất giỏi và chủ yếu dựa vào băng biển để săn hải cẩu."
        )
    ]

    var body: some View {
        Text("Bách khoa động vật")
    }
}
```

Ở đây, `animals` là một mảng:

```swift
let animals: [Animal]
```

`[Animal]` biểu thị rằng trong mảng này lưu nhiều `Animal`.

Nói cách khác, `animals` không phải là một con vật, mà là một nhóm động vật.

## Hiển thị danh sách động vật

Bây giờ, chúng ta có thể dùng `ForEach` để hiển thị danh sách động vật.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Kết quả hiển thị:

![view](../../../Resource/029_view1.png)

Trong đoạn code này:

```swift
ForEach(animals) { animal in
    ...
}
```

Nó biểu thị việc duyệt qua mảng `animals`.

Mỗi lần lặp, `animal` biểu thị loài động vật hiện đang được hiển thị.

Ví dụ, ở lần lặp đầu tiên, `animal` là cá heo; ở lần lặp thứ hai, `animal` là hươu cao cổ.

Vì vậy, chúng ta có thể hiển thị thông tin của động vật hiện tại bằng cách sau:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Như vậy, chúng ta có thể hiển thị năm loài động vật.

## Cho phép nhấn vào danh sách động vật

Hiện tại danh sách đã được hiển thị, nhưng vẫn chưa thể nhấn được.

Nếu muốn sau khi nhấn vào một loài động vật sẽ bật ra chi tiết, trước tiên chúng ta cần ghi lại “động vật hiện đang được chọn”.

Vì vậy, hãy thêm một biến trạng thái trong `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Ở đây, `selectedAnimal` là một kiểu optional `Animal?`.

Điều này có nghĩa là nó có thể có một loài động vật, cũng có thể không có loài nào.

Giá trị mặc định là `nil`, biểu thị rằng ban đầu chưa chọn bất kỳ động vật nào.

Sau đó, chúng ta đổi mỗi hàng động vật thành `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Trọng điểm là dòng code này:

```swift
selectedAnimal = animal
```

Khi người dùng nhấn vào một loài động vật, chúng ta lưu loài đó vào `selectedAnimal`.

Ví dụ, nếu người dùng nhấn vào cá heo, `selectedAnimal` sẽ lưu cá heo.

Nếu người dùng nhấn vào gấu trúc, `selectedAnimal` sẽ lưu gấu trúc.

Nói cách khác, `selectedAnimal` dùng để ghi lại loài động vật mà người dùng vừa nhấn.

## View bật lên Sheet

Bây giờ chúng ta đã có thể ghi lại “động vật hiện được nhấn” thông qua nút.

Tiếp theo, chúng ta cần tạo một view bật lên để hiển thị chi tiết động vật.

![view](../../../Resource/029_view2.png)

Trong SwiftUI, có thể dùng `Sheet` để thực hiện hiệu ứng bật lên này.

`Sheet` có thể được hiểu là một trang tạm thời bật lên. Nó hiển thị phía trên trang hiện tại, và sau khi xem xong nội dung, người dùng có thể vuốt xuống để đóng.

## Ví dụ về Sheet

Trước khi thực sự hiển thị chi tiết động vật, chúng ta dùng một ví dụ đơn giản để hiểu `Sheet` bật lên như thế nào.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Hiển thị Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Chế độ xem Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Kết quả hiển thị:

![view](../../../Resource/029_view3.png)

Trong đoạn code này, chúng ta tạo một giá trị Boolean:

```swift
@State private var showSheet = false
```

`showSheet` mặc định là `false`, biểu thị rằng ban đầu không hiển thị `Sheet`.

Khi nhấn nút:

```swift
showSheet.toggle()
```

`toggle()` biểu thị việc chuyển đổi giá trị Boolean.

Nếu ban đầu là `false`, sau khi gọi `toggle()` nó sẽ thành `true`.

Nếu ban đầu là `true`, sau khi gọi `toggle()` nó sẽ thành `false`.

Vì vậy, sau khi nhấn nút, `showSheet` sẽ chuyển từ `false` thành `true`.

Khi `showSheet` trở thành `true`, đoạn code sau sẽ bật `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Chế độ xem Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Đoạn code này có nghĩa là: khi `showSheet` là `true`, một `Sheet` sẽ bật lên và hiển thị `Text("Chế độ xem Sheet")` trong `Sheet`.

Kết quả hiển thị:

![view](../../../Resource/029_view4.png)

Cách viết này phù hợp để bật lên nội dung cố định.

Ví dụ, sau khi nhấn nút sẽ bật lên trang cài đặt, trang giải thích, trang nhắc nhở, v.v.

### Vị trí đặt Sheet

Mặc dù `Sheet` là một view bật lên, nhưng trong SwiftUI, nó không được viết trực tiếp như một view độc lập giống `Text()` hoặc `Image()`, mà được sử dụng như một view modifier.

Nói cách khác, `.sheet(...)` giống các modifier như `.font()`, `.padding()`, `.shadow()`, đều cần được thêm phía sau một view nào đó.

Ví dụ:

```swift
Button("Hiển thị Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Chế độ xem Sheet")
}
```

Trong ví dụ này, `.sheet` được thêm phía sau `Button`.

Khi `showSheet` trở thành `true`, SwiftUI sẽ bật `Sheet` và hiển thị nội dung trong cặp dấu ngoặc nhọn:

```swift
Text("Chế độ xem Sheet")
```

Tuy nhiên, trong phát triển thực tế, nếu một trang có nhiều nút, thông thường chúng ta sẽ không thêm `.sheet` cho từng nút.

Cách làm phổ biến hơn là thêm `.sheet` phía sau view bên ngoài.

Ví dụ:

```swift
VStack {
    Button("Hiển thị Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Chế độ xem Sheet")
}
```

Nút chịu trách nhiệm thay đổi `showSheet`, còn view bên ngoài chịu trách nhiệm bật `Sheet` dựa trên việc `showSheet` có phải là `true` hay không.

## Ràng buộc Sheet với optional

Cách viết chúng ta đã học phía trước là:

```swift
.sheet(isPresented: $showSheet) {
    Text("Chế độ xem Sheet")
}
```

Cách viết này phù hợp để điều khiển việc hiển thị và ẩn một trang cố định.

Nhưng trong ví dụ bách khoa động vật, chúng ta không chỉ cần biết “có bật `Sheet` hay không”, mà còn cần biết “động vật nào được nhấn”.

Ví dụ:

Người dùng nhấn vào cá heo thì trong `Sheet` nên hiển thị chi tiết cá heo.

Người dùng nhấn vào gấu trúc thì trong `Sheet` nên hiển thị chi tiết gấu trúc.

Vì vậy, ở đây phù hợp hơn để dùng một cách viết Sheet khác:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Nội dung hiển thị trong Sheet
}
```

Trong đoạn code này, `Sheet` được ràng buộc với một giá trị optional `selectedAnimal`.

Cần chú ý rằng phía sau `item:` là `$selectedAnimal`, không phải `selectedAnimal`.

Bởi vì `Sheet` không chỉ đọc giá trị của `selectedAnimal`, mà còn cần dựa vào sự thay đổi của nó để quyết định có bật lên hay không.

Có thể hiểu đoạn code này như sau:

- Khi `selectedAnimal` là `nil`, không hiển thị `Sheet`.
- Khi `selectedAnimal` có giá trị, hiển thị `Sheet`.
- Khi `Sheet` bị đóng, SwiftUI sẽ đưa `selectedAnimal` trở lại `nil`.

SwiftUI sẽ truyền động vật được lưu trong `selectedAnimal` cho `animal` trong cặp dấu ngoặc nhọn.

Nói cách khác, `.sheet(item:)` không chỉ điều khiển việc bật lên, mà còn truyền dữ liệu được chọn vào `Sheet`.

## Dùng Sheet để hiển thị tên động vật

Bây giờ, chúng ta chưa cần vội tạo một view chi tiết phức tạp.

Để code dễ hiểu hơn, trước tiên chúng ta chỉ hiển thị tên động vật hiện tại trong `Sheet`.

Thêm `.sheet(item:)` bên ngoài `VStack`:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Phần quan trọng nhất ở đây là đoạn code này:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Khi `selectedAnimal` có giá trị, `Sheet` sẽ bật lên.

`animal` trong cặp dấu ngoặc nhọn chính là động vật hiện đang được chọn.

Vì vậy:

```swift
Text(animal.name)
```

sẽ hiển thị tên động vật hiện được nhấn.

Ví dụ, nhấn vào `Cá heo`, trong Sheet sẽ hiển thị `Cá heo`.

Nhấn vào `Gấu trúc`, trong `Sheet` sẽ hiển thị `Gấu trúc`.

Như vậy, chúng ta đã thực hiện được hiệu quả nhấn vào các động vật khác nhau và bật lên các tên động vật khác nhau.

Hiển thị tên động vật:

![view](../../../Resource/029_view5.png)

Tuy nhiên, chi tiết động vật không nên chỉ hiển thị một tên. Nó còn nên hiển thị tên, khu vực phân bố, môi trường sống và mô tả.

Nếu viết toàn bộ những code này trong `.sheet`, code sẽ trở nên rất dài và khó đọc.

Vì vậy, tiếp theo chúng ta tạo một view tùy chỉnh mới, chuyên phụ trách hiển thị chi tiết động vật.

## Tạo view chi tiết động vật

Tiếp theo, chúng ta tạo một view tùy chỉnh mới là `AnimalDetailView`.

View này nhận một `Animal` và hiển thị chi tiết động vật.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Khu vực phân bố** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Môi trường sống** ：\(animal.habitat)")

                    Divider()

                    Text("**Mô tả động vật** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Kết quả hiển thị:

![view](../../../Resource/029_view2.png)

Trọng điểm ở đây là:

```swift
var animal: Animal
```

Điều này biểu thị rằng `AnimalDetailView` cần nhận một động vật từ bên ngoài.

Sau khi nhận được động vật, view chi tiết có thể sử dụng các thông tin khác nhau của động vật đó:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Nói cách khác, `AnimalDetailView` chỉ phụ trách hiển thị động vật được truyền vào.

### Chữ in đậm trong Markdown

Trong view chi tiết, chúng ta đã viết đoạn code như sau:

```swift
Text("**Môi trường sống:** \(animal.habitat)")
```

Ở đây có hai điểm kiến thức.

Thứ nhất, `**Môi trường sống:**` sử dụng cú pháp `Markdown`. Phần chữ được bao bởi hai dấu sao sẽ hiển thị in đậm.

Thứ hai, `\()` là nội suy chuỗi, có thể hiển thị giá trị của biến trong văn bản.

Đoạn code này có nghĩa là trước tiên hiển thị `Môi trường sống:` in đậm, sau đó hiển thị môi trường sống của động vật này.

## Hiển thị view chi tiết trong Sheet

Sau khi tạo xong `AnimalDetailView`, chúng ta có thể quay lại `ContentView` và thay view tên ban đầu trong `Sheet` bằng view chi tiết.

Ban đầu là:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Bây giờ đổi thành:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ở đây, `animal:` là tên tham số của `AnimalDetailView`.

`animal` phía sau là động vật hiện tại được `.sheet(item:)` truyền vào.

Tức là truyền động vật hiện được nhấn cho `AnimalDetailView` để hiển thị.

Cấu trúc đầy đủ:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

Khi người dùng nhấn vào động vật:

```swift
selectedAnimal = animal
```

`selectedAnimal` chuyển từ `nil` thành một động vật cụ thể. Sau khi `Sheet` phát hiện `selectedAnimal` có giá trị, nó sẽ bật view lên.

`Sheet` truyền động vật trong `selectedAnimal` cho view `AnimalDetailView`, và `AnimalDetailView` hiển thị chi tiết động vật.

Như vậy, chúng ta đã thực hiện được chức năng nhấn vào danh sách động vật và bật ra chi tiết tương ứng.

## Sự khác nhau giữa hai cách viết Sheet

Bây giờ, chúng ta đã dùng `.sheet(item:)` để hoàn thành việc hiển thị view chi tiết động vật.

Ở đây có thể tóm tắt ngắn gọn hai cách viết `Sheet` thường gặp.

### Cách thứ nhất là ràng buộc giá trị Boolean

```swift
@State private var showSheet = false

Button("Hiển thị Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Chế độ xem Sheet")
}
```

Cách viết này phù hợp để bật lên nội dung cố định, ví dụ trang cài đặt, trang giải thích, trang nhắc nhở, v.v.

`showSheet` là một giá trị Boolean, chỉ có hai trạng thái `true` và `false`.

Khi `showSheet` là `true`, `Sheet` hiển thị.

Khi `showSheet` là `false`, `Sheet` không hiển thị.

### Cách thứ hai là ràng buộc optional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Cách viết này phù hợp để bật lên nội dung khác nhau dựa trên dữ liệu được chọn.

Trong bài học này, chúng ta nhấn vào các động vật khác nhau và cần hiển thị chi tiết khác nhau, nên dùng `.sheet(item:)` sẽ phù hợp hơn.

## Code hoàn chỉnh

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Tên động vật
    let name: String
    
    // Hình ảnh động vật
    let imageName: String
    
    // Biểu tượng động vật
    let avatarEmoji: String
    
    // Khu vực phân bố
    let distributionArea: String
    
    // Môi trường sống
    let habitat: String
    
    // Mô tả động vật
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Cá heo
        Animal(
            name: "Cá heo",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Các vùng biển ấm và ôn đới trên khắp thế giới.",
            habitat: "Đại dương, vùng nước ven biển và một số con sông lớn.",
            animalDescription: "Cá heo là loài động vật có vú biển thông minh. Chúng sống theo đàn, giao tiếp bằng âm thanh và được biết đến với hành vi vui nhộn."
        ),
        // Hươu cao cổ
        Animal(
            name: "Hươu cao cổ",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Thảo nguyên và rừng thưa ở châu Phi.",
            habitat: "Đồng cỏ, thảo nguyên và rừng thưa.",
            animalDescription: "Hươu cao cổ là loài động vật trên cạn cao nhất. Chúng có cổ dài, chân dài và thường ăn lá trên những cây cao."
        ),
        // Sư tử
        Animal(
            name: "Sư tử",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Chủ yếu phân bố ở châu Phi hạ Sahara, với một quần thể nhỏ ở miền tây Ấn Độ.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Sư tử là loài mèo lớn mạnh mẽ. Chúng thường sống theo bầy gọi là đàn sư tử và thường được biết đến như vua của thế giới động vật."
        ),
        // Gấu trúc
        Animal(
            name: "Gấu trúc",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Rừng núi ở miền trung Trung Quốc.",
            habitat: "Rừng tre ở các vùng núi mát và ẩm ướt.",
            animalDescription: "Gấu trúc là loài gấu nổi tiếng với bộ lông đen trắng. Chúng chủ yếu ăn tre và là một trong những loài động vật dễ nhận biết nhất trên thế giới."
        ),
        // Gấu Bắc Cực
        Animal(
            name: "Gấu Bắc Cực",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Các vùng Bắc Cực xung quanh Cực Bắc.",
            habitat: "Băng biển, khu vực ven biển và môi trường Bắc Cực lạnh giá.",
            animalDescription: "Gấu Bắc Cực là loài gấu lớn thích nghi với môi trường lạnh. Chúng bơi rất giỏi và chủ yếu dựa vào băng biển để săn hải cẩu."
        )
    ]
    
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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Khu vực phân bố** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Môi trường sống** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Mô tả động vật** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Tổng kết

Trong bài học này, chúng ta đã hoàn thành một trang bách khoa động vật đơn giản.

Trước tiên, chúng ta dùng cấu trúc `Animal` để lưu thông tin động vật, sau đó dùng mảng để lưu năm loài động vật, rồi dùng `ForEach` để hiển thị danh sách động vật.

Khi người dùng nhấn vào một loài động vật, chúng ta lưu loài đó vào `selectedAnimal`:

```swift
selectedAnimal = animal
```

Khi `selectedAnimal` có giá trị, `.sheet(item:)` sẽ bật view chi tiết và truyền động vật được chọn cho `AnimalDetailView`.

Điều quan trọng nhất trong bài học này không phải là kiểu dáng giao diện, mà là hiểu tuyến truyền dữ liệu sau:

```swift
Nhấn vào động vật → selectedAnimal lưu động vật → Sheet bật lên → AnimalDetailView hiển thị chi tiết
```

Sau khi hiểu tuyến này, sau này bạn có thể tạo thêm nhiều chức năng tương tự, chẳng hạn như chi tiết sản phẩm, chi tiết khóa học, chi tiết bài viết, chi tiết liên hệ, v.v.
