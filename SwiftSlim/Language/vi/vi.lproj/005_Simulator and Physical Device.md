# Trình giả lập và Thiết bị thực

Cho đến thời điểm hiện tại, chúng ta đã hoàn thành việc xây dựng khung nhìn cơ bản. Nội dung chính của bài học này là tìm hiểu cách chạy App trên trình giả lập và thiết bị thực (Physical Device).

Tôi vẫn còn nhớ lần đầu tiên cài đặt App lên iPhone, tôi đã rất vui mừng vì có thể nhìn thấy trực quan hơn thành quả phát triển của mình. Đây là một loại phản hồi tích cực, khi chúng ta có thể sử dụng App do chính mình phát triển, sự hứng thú sẽ thúc đẩy chúng ta tự giác học hỏi thêm nhiều kiến thức hơn.

Bây giờ, vui lòng mở dự án hồ sơ cá nhân đã hoàn thành ở bài trước, chuẩn bị chạy trên trình giả lập và thiết bị thực.

## Trình giả lập

Xcode tích hợp sẵn nhiều loại trình giả lập, bao gồm các dòng iPhone, iPad và Apple Watch khác nhau. Trình giả lập có thể kiểm chứng sự khác biệt về bố cục giao diện của App trên các dòng máy hoặc phiên bản khác nhau.

### Chọn trình giả lập

Trong danh sách thiết bị trên thanh công cụ ở phía trên của Xcode, hãy chọn một trình giả lập (ví dụ: iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### Chạy trình giả lập

Sau đó nhấp vào nút chạy ở góc trên bên trái.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode sẽ tự động xây dựng dự án và khởi động trình giả lập.

![Swift](../../RESOURCE/005_xcode2.png)

### Đóng trình giả lập

Nếu cần đóng trình giả lập, hãy nhấp vào nút dừng trong thanh công cụ Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Cũng có thể đóng trực tiếp trình giả lập:

![Swift](../../RESOURCE/005_xcode17.png)

Nếu đóng trực tiếp trình giả lập, Xcode có thể hiển thị thông báo:

```
Thread 1: signal SIGTERM
```

Đây thường không phải là lỗi logic của chương trình, mà là do tiến trình gỡ lỗi bị chấm dứt từ bên ngoài. Thường có thể bỏ qua, không thuộc về lỗi logic ứng dụng.

So với tính năng xem trước của Xcode, trình giả lập gần với môi trường chạy thực tế hơn. Nhưng vẫn không phải là môi trường thiết bị hoàn chỉnh. Nó phù hợp cho việc kiểm chứng bố cục, kiểm tra tương thích trên nhiều dòng máy.

## Về thứ tự ưu tiên của môi trường kiểm thử

Trong quy trình phát triển thực tế, nên tuân theo thứ tự kiểm thử như sau:

Thiết bị thực > Trình giả lập > Xem trước trên Xcode

Tính năng xem trước phù hợp để điều chỉnh UI nhanh chóng; trình giả lập phù hợp cho kiểm thử cấu trúc; việc xác minh cuối cùng bắt buộc phải được hoàn thành trên thiết bị thực, đặc biệt là các thao tác liên quan đến iCloud.

## Thiết bị thực

Cả tính năng xem trước của Xcode và trình giả lập đều có thể xảy ra tình trạng hiển thị không chính xác, do đó thiết bị thực mang ý nghĩa quyết định. Quyền hệ thống, hiệu suất, cơ chế thông báo và các hành vi khác, chỉ có thể được kiểm chứng một cách trọn vẹn trên thiết bị thực.

### Bật Chế độ nhà phát triển

Trên iPhone:

Cài đặt → Quyền riêng tư & Bảo mật → Chế độ nhà phát triển → Bật

![Swift](../../RESOURCE/005_xcode4.png)

Hệ thống sẽ buộc thiết bị khởi động lại. Nếu không bật chế độ nhà phát triển sẽ không thể chạy gỡ lỗi.

### Cấu hình Nhóm nhà phát triển

Xcode bắt buộc phải cấu hình nhóm nhà phát triển, nếu không sẽ không thể ký và cài đặt ứng dụng.

Quy trình cấu hình:

Tên dự án → TARGETS → Signing & Capabilities → Team

Nếu hiển thị "Add Account...", điều đó cho thấy bạn chưa thêm tài khoản Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Nhấp vào nút thêm, đăng nhập Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Sau khi đăng nhập Apple ID, chọn tài khoản tương ứng để hoàn tất cấu hình nhóm nhà phát triển.

![Swift](../../RESOURCE/005_xcode7.png)

### Kết nối thiết bị

Sử dụng cáp kết nối để kết nối iPhone và Mac.

Khi kết nối lần đầu:

- Mac sẽ nhắc nhở xem có muốn kết nối iPhone với máy Mac này không
- iPhone sẽ nhắc nhở xem có tin cậy máy tính này không.

Bắt buộc phải nhấn "Tin cậy" trên iPhone và nhập mật khẩu khóa màn hình. Sau đó, trong danh sách thiết bị của Xcode hãy chọn iPhone của bạn.

![Swift](../../RESOURCE/005_xcode9.png)

Nhấp vào nút chạy ở góc trên bên trái.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode sẽ tiến hành xây dựng và cài đặt App lên iPhone.

![Swift](../../RESOURCE/005_view.png)

**Gỡ lỗi không dây**

Trên phiên bản iOS 11 trở lên, Xcode hỗ trợ gỡ lỗi không dây.

![Swift](../../RESOURCE/005_xcode18.png)

Điều kiện tiên quyết:

1. iPhone và Mac lần đầu tiên bắt buộc phải sử dụng cáp dữ liệu để hoàn tất việc ghép đôi
2. iPhone và Mac ở cùng một mạng Wi-Fi
3. Cả hai thiết bị đều duy trì trạng thái mở khóa

Sau khi sử dụng cáp dữ liệu hoàn tất ghép đôi lần đầu tiên, về sau ngay cả khi rút cáp dữ liệu, chỉ cần ở trong cùng một môi trường mạng là cũng có thể chạy trực tiếp.

Những điều cần lưu ý:

- Nếu thiết bị không xuất hiện trong danh sách thiết bị, có thể cắm lại cáp dữ liệu để tiến hành kết nối
- Gỡ lỗi qua Wi-Fi đôi khi không ổn định, khi xuất hiện lỗi kết nối chỉ cần cắm lại cáp là được
- Mạng công ty hoặc môi trường mạng bị cô lập có thể bị hạn chế

## Các lỗi thường gặp và Giải pháp

Khi kết nối iPhone với Xcode để gỡ lỗi, có thể sẽ gặp các thông báo lỗi khác nhau. Dưới đây liệt kê một số vấn đề thường gặp và cách xử lý tương ứng, có thể giúp xác định nhanh chóng vị trí và giải quyết lỗi kết nối.

**1. Ghép đôi chưa hoàn tất**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Điều này cho thấy việc ghép đôi gỡ lỗi giữa Xcode và iPhone vẫn chưa hoàn tất.

Giải pháp: Xác nhận iPhone đã nhấp vào "Tin cậy", nếu vẫn báo lỗi, hãy khởi động lại Xcode rồi kết nối lại.

**2. Chưa cấu hình nhóm nhà phát triển**

```
Signing for "SwiftSlimTest" requires a development team.
```

Có thể là chưa cấu hình nhóm nhà phát triển.

Giải pháp: Chọn tài khoản đã đăng nhập trong Signing & Capabilities.

**3. Không thể gắn Developer Disk Image**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Thường xuất hiện khi quá trình cài đặt bị gián đoạn (như rút cáp, buộc dừng), dẫn đến việc bị hạn chế và báo lỗi khi cài đặt lại.

Giải pháp: Khởi động lại iPhone, cắm lại cáp để kết nối.

**4. Kết nối đường hầm gỡ lỗi thất bại**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Lỗi này thường gặp do VPN hoặc proxy mạng can thiệp.

Giải pháp: Tắt VPN hoặc proxy mạng rồi thử lại.

**5. Thiết bị chưa mở khóa**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Thiết bị đang ở trạng thái khóa màn hình, chỉ cần mở khóa iPhone là được.

**6. Thiết bị chưa được đăng ký**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Điều này cho thấy thiết bị này chưa được thêm vào danh sách thiết bị của tài khoản nhà phát triển, Xcode không thể tạo tệp mô tả hợp lệ cho nó để ký và cài đặt app.

Giải pháp: Nhấp vào "Register Device" để tự động đăng ký.

**7. Phiên bản triển khai không khớp**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Biểu thị phiên bản hệ thống của thiết bị thấp hơn phiên bản triển khai tối thiểu của dự án.

Đường dẫn sửa đổi:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Điều chỉnh phiên bản để không cao hơn phiên bản hệ thống của thiết bị.

Sau khi sửa đổi, dọn dẹp thư mục xây dựng:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Sau khi dọn dẹp xong thì chạy lại.