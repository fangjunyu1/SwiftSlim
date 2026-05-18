# Sắp xếp dữ liệu động vật

Trong bài học trước, chúng ta đã hoàn thành một ví dụ bách khoa động vật đơn giản.

![view](../../../Resource/029_view.png)

Khi người dùng nhấn vào một con vật, trang sẽ dùng `Sheet` để bật lên phần chi tiết động vật.

Tuy nhiên, trong mã của bài học trước có một vấn đề: dữ liệu động vật được viết trực tiếp bên trong `ContentView`.

Ví dụ:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Hiển thị danh sách động vật
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Đoạn mã này có thể chạy bình thường, nhưng khi dữ liệu động vật ngày càng nhiều, `ContentView` sẽ trở nên rất dài.

`ContentView` vốn nên chủ yếu chịu trách nhiệm hiển thị giao diện, nhưng bây giờ nó còn lưu rất nhiều dữ liệu động vật. Điều này sẽ ảnh hưởng đến việc đọc mã và cũng không thuận tiện cho việc bảo trì sau này.

Vì vậy, trong bài học này chúng ta cần làm một việc:

Sắp xếp dữ liệu động vật ra khỏi `ContentView`.

## Vì sao cần tách dữ liệu?

Trong SwiftUI, mã view thường chịu trách nhiệm hiển thị giao diện.

Ví dụ:

```swift
Text("Dolphin")
Image("dolphin")
```

Những đoạn mã này đều liên quan đến việc hiển thị giao diện.

Còn bản thân dữ liệu động vật, ví dụ tên động vật, tên hình ảnh, khu vực phân bố, môi trường sống, văn bản mô tả, không phải là cấu trúc giao diện.

Chúng giống một nhóm tư liệu cố định hơn:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Nếu viết toàn bộ mã giao diện và mã dữ liệu cùng một chỗ, mã sẽ ngày càng rối.

Vì vậy, chúng ta có thể đặt dữ liệu động vật vào kiểu `Animal`.

## Dùng static để lưu dữ liệu cố định

Trước tiên, chúng ta xem cách viết sau khi sắp xếp:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Ở đây có thêm một dòng mã:

```swift
static let animals: [Animal] = [
    
]
```

`static` biểu thị thuộc tính tĩnh.

Thuộc tính tĩnh thuộc về chính kiểu dữ liệu, không thuộc về một instance cụ thể nào.

Câu này hơi trừu tượng, chúng ta có thể hiểu thông qua một ví dụ đơn giản.

## Thuộc tính thông thường và thuộc tính tĩnh

Ví dụ, chúng ta định nghĩa một `Student`:

```swift
struct Student {
    let name: String
}
```

Ở đây, `name` là thuộc tính thông thường. Thuộc tính thông thường thuộc về một instance cụ thể.

Nếu muốn truy cập `name`, chúng ta phải tạo một học sinh cụ thể trước:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Ở đây, `student` là một instance; trước tiên cũng có thể hiểu nó là một phần dữ liệu học sinh cụ thể.

Vì tên của mỗi học sinh có thể khác nhau, nên `name` phải được đặt trên một học sinh cụ thể.

Nhưng có một số dữ liệu không thuộc về một instance cụ thể nào.

Ví dụ, chúng ta muốn chuẩn bị một nhóm dữ liệu mẫu có thể dùng để preview:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Ở đây, phía trước `previewStudents` có `static`, nên nó là thuộc tính tĩnh.

Thuộc tính tĩnh không thuộc về một học sinh nào đó, mà thuộc về chính kiểu `Student`.

Vì vậy, chúng ta không cần tạo một học sinh trước, mà có thể truy cập trực tiếp thông qua tên kiểu:

```swift
print(Student.previewStudents.count)    // 3
```

Cách truy cập ở đây là:

```swift
TênKiểu.tênThuộcTínhTĩnh
```

Tức là:

```swift
Student.previewStudents
```

Tương tự, trong bách khoa động vật, chúng ta có thể truy cập dữ liệu động vật như sau:

```swift
Animal.animals
```

## Quay lại ContentView

Bây giờ, dữ liệu động vật đã được lưu trong kiểu `Animal`.

Vì vậy, bên trong `ContentView` không cần viết một mảng động vật rất dài nữa.

Chúng ta có thể đổi thành:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Hiển thị danh sách động vật
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Dòng mã này biểu thị:

```swift
let animals = Animal.animals
```

Lấy nhóm dữ liệu động vật `animals` từ kiểu `Animal`, sau đó lưu vào hằng `animals` của view hiện tại.

Sau khi viết như vậy, `ContentView` sẽ gọn hơn.

`ContentView` chịu trách nhiệm hiển thị giao diện, còn `Animal.animals` chịu trách nhiệm cung cấp dữ liệu động vật.

## Tách Animal sang một file riêng

Trong bài học trước, để ví dụ dễ hiểu hơn, chúng ta đã viết `Animal` và `ContentView` trong cùng một file.

Vì khi đó mã còn khá ít, cách viết như vậy không có vấn đề.

Nhưng bây giờ dữ liệu động vật ngày càng nhiều. Nếu tiếp tục viết toàn bộ mã trong `ContentView.swift`, file sẽ trở nên rất dài và cũng không tiện đọc.

Vì vậy, chúng ta có thể đặt riêng `Animal` vào một file Swift mới.

Trong Xcode, có thể tạo một file Swift mới, ví dụ:

```swift
Animal.swift
```

Sau đó di chuyển struct `Animal` vào file này:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Sau khi sắp xếp như vậy:

`ContentView.swift` chịu trách nhiệm hiển thị giao diện.

`Animal.swift` chịu trách nhiệm mô tả cấu trúc dữ liệu động vật.

Mặc dù chúng được đặt trong các file khác nhau, nhưng chỉ cần chúng đều nằm trong cùng một project, `ContentView` vẫn có thể sử dụng trực tiếp `Animal`.

Ví dụ:

```swift
let animals = Animal.animals
```

Ở đây không cần import thêm `Animal.swift` trong `ContentView.swift`.

Swift sẽ tự động nhận diện các file Swift trong cùng một project.

## Dùng extension để tiếp tục sắp xếp mã

Bây giờ, chúng ta đã di chuyển dữ liệu động vật từ `ContentView` vào `Animal`.

Tuy nhiên, trong struct `Animal` vẫn đồng thời chứa hai loại mã:

Loại thứ nhất là các thuộc tính của chính mô hình động vật:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Loại thứ hai là dữ liệu động vật cố định:

```swift
static let animals: [Animal] = [
    // ...
]
```

Để cấu trúc mã rõ ràng hơn, chúng ta có thể dùng `extension` để tách hai phần này ra.

`extension` có nghĩa là mở rộng.

Nó có thể tiếp tục thêm mã mới trên nền tảng của kiểu dữ liệu đã có.

Ví dụ:

```swift
extension Animal {
    
}
```

Điều này biểu thị rằng chúng ta đang mở rộng kiểu `Animal`.

## Đặt dữ liệu động vật vào extension

Chúng ta có thể đổi `Animal` thành như sau:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Sau khi sắp xếp như vậy, cấu trúc mã sẽ rõ ràng hơn.

`struct Animal` chịu trách nhiệm mô tả một con vật nên có những thuộc tính nào.

`extension Animal` chịu trách nhiệm lưu một nhóm dữ liệu động vật cố định.

Lưu ý, mặc dù `animals` đã được di chuyển vào `extension Animal`, cách sử dụng vẫn không thay đổi.

Chúng ta vẫn có thể sử dụng như sau:

```swift
let animals = Animal.animals
```

Đây cũng là một đặc điểm của `extension`: nó chỉ giúp chúng ta sắp xếp mã, không thay đổi cách gọi từ bên ngoài.

## Khi dữ liệu nhiều, có thể tạo thêm file AnimalData

Bây giờ, chúng ta đã đặt `Animal` vào file `Animal.swift` riêng.

Nếu dữ liệu động vật tương đối ít, có thể viết trực tiếp `extension Animal` trong `Animal.swift`.

Nhưng nếu dữ liệu động vật ngày càng nhiều, cũng có thể tạo thêm một file mới, ví dụ:

```swift
AnimalData.swift
```

Sau đó đặt dữ liệu động vật cố định vào đó:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dữ liệu động vật
    ]
}
```

Sau khi làm như vậy, việc phân công trong mã sẽ rõ ràng hơn:

`Animal.swift` chỉ chịu trách nhiệm định nghĩa mô hình động vật.

`AnimalData.swift` chỉ chịu trách nhiệm lưu dữ liệu động vật.

`ContentView.swift` chỉ chịu trách nhiệm hiển thị giao diện.

Trách nhiệm của mỗi file đều rõ ràng hơn.

Lưu ý, `AnimalData.swift` chỉ là tên file, không phải một kiểu Swift mới. Trong file này vẫn đang dùng `extension Animal` để thêm dữ liệu cố định cho `Animal`.

## Mã hoàn chỉnh

Dưới đây là mã `Animal.swift` sau khi sắp xếp:

```swift
import Foundation

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

Mã `AnimalData.swift` sau khi sắp xếp:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

Trong `ContentView.swift`, có thể sử dụng như sau:

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
```

Gợi ý: Trong các file `Animal.swift` và `AnimalData.swift`, dòng đầu tiên đều viết:

```swift
import Foundation
```

Trước đây khi viết giao diện SwiftUI, chúng ta thường dùng:

```swift
import SwiftUI
```

Đó là vì `ContentView`, `Text`, `Button`, `Color` đều liên quan đến giao diện, nên khi viết file giao diện thường cần import SwiftUI.

Nhưng `Animal.swift` và `AnimalData.swift` ở đây đều không phải file giao diện. Chúng chủ yếu dùng để định nghĩa mô hình động vật và lưu dữ liệu động vật.

Trong đoạn mã này, `UUID()` cần sử dụng `Foundation`, nên chỉ cần import `Foundation` là được.

## Tổng kết

Bài học này chủ yếu làm một việc: sắp xếp dữ liệu động vật ra khỏi `ContentView`.

Cách viết ban đầu là viết trực tiếp dữ liệu động vật trong `ContentView`. Cách này có thể chạy, nhưng khi dữ liệu nhiều hơn, file view sẽ ngày càng dài.

Sau khi sắp xếp, `ContentView` chỉ chịu trách nhiệm hiển thị giao diện, còn `Animal.animals` chịu trách nhiệm cung cấp dữ liệu động vật.

Bài học này cũng học thêm hai kiến thức mới.

Thứ nhất là `static`.

`static` biểu thị thuộc tính tĩnh. Thuộc tính tĩnh thuộc về chính kiểu dữ liệu và có thể truy cập trực tiếp bằng cách “TênKiểu.tênThuộcTính”.

Ví dụ:

```swift
Animal.animals
```

Thứ hai là `extension`.

`extension` biểu thị mở rộng. Nó có thể tách mã của cùng một kiểu ra để viết, giúp cấu trúc mã rõ ràng hơn.

Trong ví dụ này, chúng ta dùng `extension Animal` để lưu dữ liệu động vật, giúp bản thân struct `Animal` gọn hơn.

Ngoài ra, `Animal` chủ yếu lưu mô hình dữ liệu, không trực tiếp viết giao diện SwiftUI, nên ở đây sử dụng `import Foundation`.

Trọng điểm của bài học này không phải là làm mã phức tạp hơn, mà là làm cho mã dễ đọc và dễ bảo trì hơn.
