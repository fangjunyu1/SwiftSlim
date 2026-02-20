# 引言

## 什么是 Swift ?

在学习 Swift 之前，我们先谈论一下 Swift 编程语言。Swift 是由 Apple 开发的一门现代编程语言，主要用于构建 iOS、macOS、iPadOS、watchOS 等 Apple 平台上的应用程序。

![Swift](000_swift.png)

Swift 语言相比其他编程语言来讲，语法简洁，更强调安全性和可读性。配合 SwiftUI 更容易学习和理解。当然，我之前并没有学习过其他编程语言，可能比 HTML 稍难一点。

Swift 不仅可以开发 Apple 平台上的应用程序，Swift 社区正在努力将 Swift 移植到 [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) 平台，甚至运行在[服务器](https://github.com/awslabs/swift-aws-lambda-runtime)等其他环境。从长远发展的角度来看，Swift 的发展空间更大，未来有机会成为类似 Flutter、React Native 等跨平台编程语言。

## 学习内容

本教程以 Swift 和 SwiftUI 基础知识为主。

我们将从简单的变量和数据类型开始学习，使用 SwiftUI 构建界面，理解数据的存储和读取方式，最后可能还会深入学习 Swift Data、iCloud 同步等进阶内容。

每一章节都会围绕一个实际案例展开，在实际应用中学习 Swift 知识。

有些教程可能会先集中讲解大量语法和 API，再进入项目实践。这对初学者来讲，就像孩童从字典中识字一样，在没有应用场景下记忆大量内容，最终只会让初学者失去兴趣。

本教程将在实际开发场景中学习知识，用需求引出相关的知识点。

完成本教程后，你将能够独立开发并运行一个基础应用，并安装在自己的 iOS / macOS 设备上，也可以将应用发布到 App Store。

## 零基础如何学习？

我之前也是一个零基础，起初只是浏览了几期 Youtube 上的 [Swift 教学视频](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3)，发现开发 iOS 应用并不复杂，让我产生了一定的兴趣。之后，我开始尝试获取更多的 Swift 知识。例如，游玩 [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12) 上的编程游戏，阅读 [Swift 官方教程文档](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/)，以及学习 [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui)。

现在看来，主要还是 [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) 提供了一个学习框架，让我可以系统性的学习 SwiftUI。但是，因为教程是英文，加上自己缺乏编程基础，导致在理解的过程中存在非常多的困难。对此，我使用 [ChatGPT](https://chatgpt.com/) 和 [Claude](https://claude.ai/?redirect=claude.com) 等 AI 辅助理解知识点。

在学习的过程中，难免出现一些理解起来比较困难的知识，我记得在学习 UserDefaults 的时候，只知道如何保存数据，不知道数据需要手动读取，以至于怀疑我的代码存在问题。即便是这样一个简单的知识点，也让我浪费了几天的时间。

再比如闭包、主线程、泛型等知识点，我在前期学习的过程中，因为不能够深入理解它们，在实际开发中再次遇到这些知识时，又需要拿出精力重新学习。

因此，我的建议是：

**1、补充基础知识**

中国有句话叫做“万事开头难”，对于零基础来讲，刚开始学习 Swift 时，一些知识点往往难以理解，这不是因为知识点本身复杂，而是在这个知识的金字塔下，还有更加基础的知识你没有学习或了解过。

这时应该询问 [ChatGPT](https://chatgpt.com/) 和 [Claude](https://claude.ai/?redirect=claude.com) 等AI，补全基础知识。

**2、尽量理解每一个知识点**

在学习的过程中，应该尽量理解每一个知识点，哪怕需要耗费几天的时间来学习。

当你选择跳过不理解的内容时，只会在后续开发中再次遇到并阻碍开发进度，最终需要重新投入时间去学习。与其亡羊补牢，不如在学习的阶段把知识理解清楚。

每一个知识点本质上都是一件工具 —— 掌握的工具越多，解决问题的能力越强。

就像建造房屋一样，如果你手里只有一件工具，虽然勉强可以完成大部分工作，但在面对更高质量要求时，就会显得力不从心。掌握更多工具，才能建造出更稳固的房子。

**3、保持持续学习**

学习需要从一而终。很少有人真正愿意拿出几个月的时间来认真学习一个教程。持续投入时间学习，比短期高强度更重要。

即使每天只完成百分之一，一百天也可以完成整个学习目标。

## 教育愿景

这个课程不会教授太多的 Swift 和 SwiftUI 知识，而是把初学者领到 Swift 这条编程的道路上。就像拼积木 —— 教程负责讲解拼接方法，剩下的时间就是你自己去拼搭属于你的积木。

项目已在 [GitHub](https://github.com/fangjunyu1/SwiftSlim) 开源，可以免费下载、使用。同时也提供 App Store 版本用于体验。

我们希望帮助更多没有技术背景但渴望改变职业路径的人，通过学习编程、开发应用，获得新的可能性。

## 内容更新

本教程基于当前版本的 Swift 与 SwiftUI 编写。

随着 Apple 平台和工具的更新，部分 API 可能发生变化。若发现问题或内容需要更新，可参考官方文档或开源仓库的最新版本。

---
方君宇

2026-02-14