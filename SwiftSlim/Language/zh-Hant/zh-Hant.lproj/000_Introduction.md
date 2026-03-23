# 引言

## 什麼是 Swift？

在學習 Swift 之前，我們先簡單瞭解一下 Swift 程式語言。Swift 是由 Apple 開發的一門現代程式語言，主要用於構建 iOS、macOS、iPadOS、watchOS 等 Apple 平台上的應用程式。

![Swift](../../RESOURCE/000_swift.png)

Swift 語言相比其他程式語言，語法簡潔，更強調安全性和可讀性。配合 SwiftUI 更容易學習和理解。當然，我之前並沒有學習過其他程式語言，可能比 HTML 稍難一點。

Swift 不僅可以開發 Apple 平台上的應用程式，Swift 社區正在努力將 Swift 移植到 [Android](../../RESOURCE/https://www.swift.org/blog/nightly-swift-sdk-for-android/) 平台，甚至運行在[伺服器](../../RESOURCE/https://github.com/awslabs/swift-aws-lambda-runtime)等其他環境。從長遠發展的角度來看，Swift 的發展空間更大，未來有機會成為類似 Flutter、React Native 等跨平台程式語言。

## 學習內容

本教程以 Swift 和 SwiftUI 基礎知識為主。

我們將從簡單的變數和資料類型開始學習，使用 SwiftUI 構建界面，理解資料的存儲和讀取方式，最後可能還會深入學習 SwiftData、iCloud 同步等進階內容。

每一章節都會圍繞一個實際案例展開，在實際應用中學習 Swift 知識。

有些教程可能會先集中講解大量語法和 API，再進入項目實踐。這對初學者來講，就像孩童從字典中識字一樣，在沒有應用場景下記憶大量內容，最終只會讓初學者失去興趣。

本教程將在實際開發場景中學習知識，用需求引出相關的知識點。

完成本教程後，你將能夠獨立開發並運行一個基礎應用，並安裝在自己的 iOS / macOS 設備上，也可以將應用發佈到 App Store。

## 零基礎如何學習？

我一開始也是一個零基礎，起初只是瀏覽了幾期 Youtube 上的 [Swift 教學影片](../../RESOURCE/https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3)，發現開發 iOS 應用並不複雜，讓我產生了一定的興趣。之後，我開始嘗試學習更多 Swift 知識。例如，體驗 [Swift Playgrounds](../../RESOURCE/https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12) 上的程式設計遊戲，閱讀 [Swift 官方教程文件](../../RESOURCE/https://docs.swift.org/swift-book/documentation/the-swift-programming-language/)，以及學習 [100 Days Of SwiftUI](../../RESOURCE/https://www.hackingwithswift.com/100/swiftui)。

現在看來，主要還是 [100 Days Of SwiftUI](../../RESOURCE/https://www.hackingwithswift.com/100/swiftui) 提供了一個學習框架，讓我可以系統性的學習 SwiftUI。但是，因為教程是英文，加上自己缺乏程式設計基礎，導致在理解的過程中存在非常多的困難。對此，我使用 [ChatGPT](../../RESOURCE/https://chatgpt.com/) 和 [Claude](../../RESOURCE/https://claude.ai/?redirect=claude.com) 等 AI 輔助理解知識點。

在學習的過程中，難免出現一些理解起來比較困難的知識，我記得在學習 UserDefaults 的時候，只知道如何保存資料，不知道資料需要手動讀取，以至於懷疑我的程式碼存在問題。即便是這樣一個簡單的知識點，也讓我浪費了幾天的時間。

再比如閉包、主線程、泛型等知識點，我在前期學習的過程中，因為不能深入理解它們，在實際開發中再次遇到這些知識時，又需要拿出精力重新學習。

因此，我的建議是：

**1、補充基礎知識**

中國有句話叫做“萬事開頭難”，對於零基礎學習 Swift 的新人來說，學習過程中難免會遇到的一些難以理解的知識點 —— 這往往並非知識點本身有多複雜，而是在這座知識金字塔的底部，還有一些更基礎的概念沒有被初學者接觸過。

遇到這種情況，可以考慮借助 [ChatGPT](../../RESOURCE/https://chatgpt.com/) 和 [Claude](../../RESOURCE/https://claude.ai/?redirect=claude.com) 等 AI 工具，及時補全缺失的基礎知識。

**2、理解每一個知識點**

學習過程中，最重要的是盡量去理解每一個知識點，哪怕需要花費幾天的時間。

如果選擇跳過不理解的內容，在後續開發中大概率還會再次遇到，並阻礙開發進度，最終還是需要重新投入時間去學習。與其亡羊補牢，不如在學習的階段把知識理解清楚。

每一個知識點本質上都是一件工具 —— 掌握的工具越多，解決問題的能力越強。

就像建造房屋一樣，如果你手裡只有一件工具，雖然勉強可以完成大部分工作，但在面對更高質量要求時，就會顯得力不從心。掌握更多工具，才能建造出更穩固的房子。

**3、保持持續學習**

學習需要長期堅持。很少有人真正願意拿出幾個月的時間來認真學習一個教程。持續投入時間學習，比短期高強度更重要。

即使每天只完成百分之一，一百天也可以完成整個學習目標。

## 教育願景

這個課程不會教授太多的 Swift 和 SwiftUI 知識，而是把初學者領到 Swift 這條程式設計的道路上。就像拼積木 —— 教程負責講解拼接方法，剩下的時間就是你自己去拼搭屬於你的積木。

項目已在 [GitHub](../../RESOURCE/https://github.com/fangjunyu1/SwiftSlim) 開源，可以免費下載、使用。同時也提供 App Store 版本用於體驗。

我們希望幫助更多沒有技術背景但渴望改變職業路徑的人，通過學習程式設計、開發應用，獲得新的可能性。

## 內容更新

本教程基於當前版本的 Swift 與 SwiftUI 編寫。

隨著 Apple 平台和工具的更新，部分 API 可能發生變化。若發現問題或內容需要更新，可參考官方文件或開源倉庫的最新版本。

---
方君宇

2026-02-14  