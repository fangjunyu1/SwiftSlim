# Lời mở đầu

## Swift là gì?

Trước khi học Swift, chúng ta hãy tìm hiểu sơ qua về ngôn ngữ lập trình Swift. Swift là một ngôn ngữ lập trình hiện đại do Apple phát triển, chủ yếu được sử dụng để xây dựng các ứng dụng trên các nền tảng của Apple như iOS, macOS, iPadOS, watchOS, v.v.

![Swift](../../RESOURCE/000_swift.png)

So với các ngôn ngữ lập trình khác, ngôn ngữ Swift có cú pháp ngắn gọn, nhấn mạnh hơn vào tính an toàn và khả năng đọc hiểu. Kết hợp với SwiftUI sẽ càng dễ học và dễ tiếp thu hơn. Tất nhiên, trước đây tôi chưa từng học qua ngôn ngữ lập trình nào khác, có lẽ nó sẽ khó hơn HTML một chút.

Swift không chỉ có thể phát triển các ứng dụng trên nền tảng của Apple, cộng đồng Swift hiện đang nỗ lực đưa Swift lên nền tảng [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), thậm chí chạy trên [máy chủ](https://github.com/awslabs/swift-aws-lambda-runtime) và các môi trường khác. Nhìn từ góc độ phát triển lâu dài, Swift có không gian phát triển rộng mở hơn, trong tương lai có cơ hội trở thành ngôn ngữ lập trình đa nền tảng tương tự như Flutter hay React Native.

## Nội dung học tập

Hướng dẫn này chủ yếu tập trung vào các kiến thức cơ bản của Swift và SwiftUI.

Chúng ta sẽ bắt đầu học từ các biến và kiểu dữ liệu đơn giản, sử dụng SwiftUI để xây dựng giao diện, hiểu cách thức lưu trữ và đọc dữ liệu, và cuối cùng có thể sẽ đi sâu vào các nội dung nâng cao như SwiftData, đồng bộ hóa iCloud.

Mỗi chương sẽ xoay quanh một dự án thực tế, giúp bạn học kiến thức Swift thông qua việc ứng dụng vào thực tiễn.

Một số hướng dẫn có thể tập trung giải thích một lượng lớn cú pháp và API trước, sau đó mới đi vào thực hành dự án. Đối với người mới bắt đầu, điều này giống như một đứa trẻ học chữ từ từ điển vậy, việc ghi nhớ một lượng lớn nội dung mà không có ngữ cảnh ứng dụng cuối cùng sẽ chỉ làm cho người mới bắt đầu mất đi hứng thú.

Hướng dẫn này sẽ giúp bạn học kiến thức trong các tình huống phát triển thực tế, dùng các yêu cầu công việc để dẫn dắt đến các điểm kiến thức liên quan.

Sau khi hoàn thành hướng dẫn này, bạn sẽ có thể tự phát triển và chạy một ứng dụng cơ bản, cài đặt nó trên thiết bị iOS / macOS của riêng mình, và cũng có thể phát hành ứng dụng lên App Store.

## Học từ con số không như thế nào?

Ban đầu tôi cũng bắt đầu từ con số không, thoạt tiên chỉ lướt xem vài video hướng dẫn Swift trên Youtube, nhận thấy việc phát triển ứng dụng iOS không hề phức tạp, điều đó đã khiến tôi cảm thấy hứng thú nhất định. Sau đó, tôi bắt đầu thử học thêm kiến thức về Swift. Ví dụ: trải nghiệm trò chơi lập trình trên [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), đọc [Tài liệu hướng dẫn chính thức của Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/), cũng như học [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Bây giờ nhìn lại, chủ yếu vẫn là [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) đã cung cấp một khuôn khổ học tập, giúp tôi có thể học SwiftUI một cách có hệ thống. Tuy nhiên, vì hướng dẫn bằng tiếng Anh, cộng thêm việc bản thân thiếu nền tảng lập trình, dẫn đến việc tôi gặp rất nhiều khó khăn trong quá trình tiếp thu. Đối với vấn đề này, tôi đã sử dụng các công cụ AI như [ChatGPT](https://chatgpt.com/) và [Claude](https://claude.ai/?redirect=claude.com) để hỗ trợ tìm hiểu các điểm kiến thức.

Trong quá trình học, khó tránh khỏi việc xuất hiện một số kiến thức tương đối khó hiểu. Tôi nhớ khi học về UserDefaults, tôi chỉ biết cách lưu dữ liệu mà không biết rằng dữ liệu cần phải được đọc một cách thủ công, đến mức tôi đã nghi ngờ mã code của mình có vấn đề. Ngay cả một điểm kiến thức đơn giản như vậy cũng khiến tôi lãng phí mất vài ngày.

Hay ví dụ như các kiến thức về Closures (Bao đóng), Main thread (Luồng chính), Generics (Kiểu tổng quát), trong giai đoạn đầu học tập, vì không thể hiểu sâu về chúng, nên khi gặp lại những kiến thức này trong quá trình phát triển thực tế, tôi lại phải bỏ công sức ra để học lại.

Do đó, lời khuyên của tôi là:

**1. Bổ sung kiến thức nền tảng**

Tục ngữ có câu "Vạn sự khởi đầu nan", đối với những người mới học Swift từ con số không, trong quá trình học khó tránh khỏi việc gặp phải một số kiến thức khó hiểu —— Điều này thường không phải do bản thân kiến thức đó quá phức tạp, mà là ở phần đáy của kim tự tháp kiến thức này, vẫn còn một số khái niệm cơ bản hơn mà người mới học chưa từng được tiếp xúc.

Khi gặp tình huống này, bạn có thể cân nhắc nhờ đến sự trợ giúp của các công cụ AI như [ChatGPT](https://chatgpt.com/) và [Claude](https://claude.ai/?redirect=claude.com) để kịp thời bổ sung những kiến thức nền tảng còn thiếu.

**2. Nắm vững từng điểm kiến thức**

Trong quá trình học, điều quan trọng nhất là cố gắng hiểu rõ từng điểm kiến thức, cho dù phải mất vài ngày.

Nếu chọn cách bỏ qua những nội dung không hiểu, thì xác suất cao là bạn sẽ gặp lại chúng trong quá trình phát triển sau này và làm cản trở tiến độ phát triển, cuối cùng vẫn phải đầu tư thời gian để học lại. Thay vì "mất bò mới lo làm chuồng", tốt hơn hết là hãy hiểu rõ các kiến thức ngay trong giai đoạn học tập.

Mỗi điểm kiến thức về bản chất đều là một công cụ —— Bạn càng nắm vững nhiều công cụ, khả năng giải quyết vấn đề của bạn càng mạnh mẽ.

Giống như việc xây nhà vậy, nếu trong tay bạn chỉ có một công cụ, mặc dù có thể miễn cưỡng hoàn thành phần lớn công việc, nhưng khi đối mặt với những yêu cầu chất lượng cao hơn, bạn sẽ cảm thấy bất lực. Chỉ khi nắm vững nhiều công cụ hơn, bạn mới có thể xây dựng được một ngôi nhà vững chắc hơn.

**3. Duy trì việc học tập liên tục**

Học tập đòi hỏi sự kiên trì lâu dài. Rất ít người thực sự sẵn lòng bỏ ra vài tháng để học một cách nghiêm túc một hướng dẫn nào đó. Việc liên tục đầu tư thời gian cho việc học quan trọng hơn là học cường độ cao trong thời gian ngắn.

Ngay cả khi mỗi ngày chỉ hoàn thành một phần trăm, thì trong một trăm ngày bạn cũng có thể hoàn thành toàn bộ mục tiêu học tập.

## Tầm nhìn giáo dục

Khóa học này sẽ không dạy quá nhiều kiến thức về Swift và SwiftUI, mà là dẫn dắt người mới bắt đầu bước vào con đường lập trình Swift. Giống như trò chơi xếp hình LEGO vậy —— Hướng dẫn sẽ chịu trách nhiệm giải thích các phương pháp lắp ráp, thời gian còn lại là để bạn tự lắp ráp những khối hình của riêng mình.

Dự án đã được mã nguồn mở trên [GitHub](https://github.com/fangjunyu1/SwiftSlim), bạn có thể tải xuống và sử dụng miễn phí. Đồng thời, chúng tôi cũng cung cấp phiên bản trên App Store để bạn trải nghiệm.

Chúng tôi hy vọng có thể giúp đỡ nhiều người không có nền tảng công nghệ nhưng khao khát thay đổi lộ trình nghề nghiệp, thông qua việc học lập trình và phát triển ứng dụng, để có được những cơ hội mới.

## Cập nhật nội dung

Hướng dẫn này được biên soạn dựa trên phiên bản hiện tại của Swift và SwiftUI.

Cùng với sự cập nhật của nền tảng và các công cụ Apple, một số API có thể thay đổi. Nếu bạn phát hiện vấn đề hoặc nội dung cần được cập nhật, vui lòng tham khảo tài liệu chính thức hoặc phiên bản mới nhất trên kho lưu trữ mã nguồn mở.

---
Fang Junyu

2026-02-14
