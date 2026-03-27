# Tìm hiểu Xcode

## Xcode là gì

Xcode là môi trường phát triển tích hợp (IDE, Integrated Development Environment) chính thức do Apple cung cấp, được sử dụng để phát triển các ứng dụng trên nền tảng Apple như iOS, macOS, watchOS, tvOS, v.v.

![Swift](../../RESOURCE/001_xcode.png)

Trong suốt quá trình học tập, chúng ta sẽ sử dụng Xcode để viết mã và chạy chương trình.

Trong bài học này, chúng ta sẽ học cách tải xuống Xcode, tạo ứng dụng iOS đầu tiên và bước đầu tìm hiểu cấu trúc giao diện của Xcode.

## Tải xuống Xcode

Hiện tại Xcode có hai cách cài đặt:

1. Tải xuống thông qua [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Tải xuống thông qua [trang web chính thức của Apple Developer](https://developer.apple.com/xcode/)

Cả hai cách đều có thể tải xuống Xcode. Điểm khác biệt là trang web chính thức của Apple Developer ngoài phiên bản chính thức, còn có thể tải xuống phiên bản [Beta](https://developer.apple.com/download/all/?q=Xcode) hoặc các phiên bản cũ hơn.

Nếu chỉ để học phát triển, khuyên bạn nên sử dụng phiên bản chính thức. Phiên bản Beta chủ yếu được sử dụng để thử nghiệm các tính năng mới và có thể gặp tình trạng không ổn định.

## Tạo dự án đầu tiên

Sau khi mở Xcode, bạn sẽ thấy giao diện khởi động.

![Swift](../../RESOURCE/001_xcode1.png)

Phía bên trái bao gồm ba tùy chọn thường dùng:

- Create New Project —— Tạo dự án mới  
- Clone Git Repository —— Sao chép kho lưu trữ Git  
- Open Existing Project —— Mở dự án đã có

Phía bên phải hiển thị các dự án Xcode đã mở gần đây.

Chúng ta chọn tùy chọn "Create New Project".

### Chọn mẫu dự án

![Swift](../../RESOURCE/001_xcode2.png)

Vào giao diện chọn mẫu dự án, tại đây hiển thị nhiều nền tảng (iOS, macOS, v.v.) cũng như các loại mẫu dự án khác nhau.

Giải thích các mẫu thường gặp:
- App —— Loại ứng dụng cơ bản nhất (được đề xuất)
- Document App —— Ứng dụng dựa trên chế độ tài liệu
- Game —— Dùng cho phát triển trò chơi
- Framework —— Mô-đun có thể tái sử dụng

Ở giai đoạn nhập môn, chúng ta chỉ chọn mẫu "iOS" - "App", bởi vì đây là loại ứng dụng giao diện.

Nhấp vào "Next".

### Điền thông tin dự án

Vào giao diện điền thông tin dự án, chúng ta cần điền theo từng loại trường.

![Swift](../../RESOURCE/001_xcode3.png)

Ý nghĩa của các trường:

- Product Name —— Tên dự án, ví dụ: SwiftSlimTest
- Team —— Nhóm nhà phát triển, nếu không có tài khoản Apple Developer trả phí, có thể không chọn
- Organization Identifier —— Định danh tổ chức, thường sử dụng định dạng tên miền đảo ngược, ví dụ:
  - com.yourname
  - com.yourcompany
  - Nếu không có tên miền, có thể sử dụng tên tiếng Anh của mình làm định danh
- Bundle Identifier —— Định danh duy nhất của ứng dụng, nó sẽ tự động được tạo ra dựa trên Organization Identifier và Product Name
- Interface —— Công nghệ giao diện, chọn SwiftUI
- Language —— Ngôn ngữ phát triển, chọn Swift
- Testing System —— Mặc định sẽ tạo mục tiêu kiểm thử (Unit Tests), giai đoạn mới học có thể bỏ qua
- Storage —— Khung lưu trữ dữ liệu cục bộ, có thể tự động tích hợp SwiftData hoặc Core Data, giai đoạn mới học có thể bỏ qua

Sau khi điền xong, nhấp vào "Next".

### Lưu dự án

![Swift](../../RESOURCE/001_xcode4.png)

Chọn một thư mục phù hợp để lưu.

Nhấp vào nút "Create", Xcode sẽ tự động tạo cấu trúc dự án.

## Cấu trúc dự án Xcode

Sau khi lưu dự án Xcode, trong Finder bạn có thể thấy thư mục dự án được tạo ra.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— Thư mục dùng để lưu trữ hình ảnh, biểu tượng App và các tài nguyên khác

- ContentView.swift —— Tệp khung nhìn SwiftUI được tạo mặc định, sau này chúng ta sẽ viết mã giao diện tại đây.

- SwiftSlimTestApp.swift —— Tệp điểm vào của ứng dụng (App Entry Point), chịu trách nhiệm khởi động ứng dụng, tạm thời chúng ta chưa cần tìm hiểu nó.

- SwiftSlimTest.xcodeproj —— Tệp dự án Xcode, nhấp đúp vào tệp này là có thể mở dự án.

## Tìm hiểu giao diện Xcode

Nhấp đúp vào tệp .xcodeproj để mở dự án, trong khu vực Navigator bên trái hãy chọn tệp ContentView.swift.

Giao diện Xcode chủ yếu bao gồm năm khu vực:

- Navigator —— Khu vực điều hướng, dùng để xem cấu trúc tệp, tìm kiếm
- Editor —— Khu vực chỉnh sửa, dùng để viết mã Swift hoặc SwiftUI
- Canvas —— Khu vực khung vẽ, dùng để xem trước SwiftUI
- Inspector —— Khu vực kiểm tra thuộc tính, dùng để xem và sửa đổi thuộc tính của tệp
- Debug Area —— Khu vực gỡ lỗi, xem đầu ra nhật ký

![Swift](../../RESOURCE/001_xcode6.png)

Chú ý: Canvas chủ yếu được sử dụng để xem trước khung nhìn SwiftUI, xét về kiến trúc chính thức của Xcode, nó là bảng xem trước phụ trợ (Preview Pane) của Editor. Chỉ khi mở tệp khung nhìn SwiftUI, Canvas mới có thể được bật, các loại tệp khác sẽ không hiển thị chức năng xem trước.

Trong các bài học sau, chúng ta chủ yếu sẽ viết mã Swift và SwiftUI trong khu vực Editor.

Trong lần đầu tiên mở dự án Xcode, Inspector và Debug Area mặc định có thể ở trạng thái ẩn, bạn có thể nhấp vào nút ở góc trên bên phải và góc dưới bên phải để hiển thị.

![Swift](../../RESOURCE/001_xcode7.png)

Mẹo: Khu vực Inspector chủ yếu được sử dụng để xem và sửa đổi thuộc tính tệp. Trong quá trình phát triển thực tế, khu vực này thường được ẩn đi để có được không gian chỉnh sửa lớn hơn.

## Tổng kết

Trong bài học này, chúng ta đã học cách tải xuống Xcode, tạo dự án Xcode đầu tiên và bố cục giao diện cơ bản của Xcode.

Dưới đây là thời gian hoạt động tự do:
- Bạn có thể thử tạo, xóa tệp trong khu vực Navigator.  
- Xem mã nguồn trong khu vực Editor, quan sát cấu trúc mã.
- Xem các nút trong khu vực Canvas, thử phóng to, thu nhỏ chế độ xem trước.

Ở bài học tiếp theo, chúng ta sẽ bắt đầu viết một số mã đơn giản và giúp chúng ta hiểu sâu hơn về Xcode.