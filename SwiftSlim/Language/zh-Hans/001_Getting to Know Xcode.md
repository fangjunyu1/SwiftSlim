# 认识 Xcode

## 什么是 Xcode

Xcode 是 Apple 官方提供的集成开发环境（IDE, Integrated Development Environment），用于开发 iOS、macOS、watchOS、tvOS 等 Apple 平台应用。

![Swift](001_xcode.png)

在整个教学过程中，我们都将使用 Xcode 编写代码、运行程序。

本节课，我们将学习如何下载 Xcode，创建第一个 iOS 应用，以及初步认识 Xcode 界面结构。

## 下载 Xcode

Xcode 目前有两种安装方式：

1、通过 [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) 下载

2、通过 [Apple Developer 官方网站](https://developer.apple.com/xcode/)下载

两种安装方式都可以下载 Xcode。区别在于 Apple Developer 官方网站除了正式版，还可以下载 [Beta](https://developer.apple.com/download/all/?q=Xcode) 版或历史版本。

如果只是学习开发，建议使用正式版。Beta 版本主要用于测试新功能，可能存在不稳定情况。

## 创建第一个项目

打开 Xcode 后，会看到启动界面。

![Swift](001_xcode1.png)

左侧包含三个常用选项:

- Create New Project —— 创建新项目  
- Clone Git Repository —— 克隆 Git 仓库  
- Open Existing Project —— 打开已有项目

右侧显示最近打开的 Xcode 项目。

我们选择 "Create New Porject" 选项。

### 选择项目模版

![Swift](001_xcode2.png)

进入项目模板选择界面，这里显示多个平台（iOS、macOS等）以及不同类型的项目模版。

常见模版说明:
- App —— 最基础的应用类型（推荐）
- Document App —— 基于文档模式的应用
- Game —— 用于游戏开发
- Framework —— 可复用模块

在入门阶段，我们只选择 "iOS" - "App" 模版，因为这是最基础、最通用的 GUI 应用类型。

点击 "Next"。

### 填写项目信息

进入项目信息填写界面，我们需要根据字段类型进行填写。

![Swift](001_xcode3.png)

各字段的含义：

- Product Name —— 项目名称，例如: SwiftSlimTest
- Team —— 开发者团队，如果没有付费 Apple Developer 账号，可以不选
- Organization Identifier —— 组织标识符，通常采用反向域名格式，例如：
  - com.yourname
  - com.yourcompany
  - 如果没有域名，可以使用自己的英文名作为标识
- Bundle Identifier —— 应用的唯一标识符，它会根据 Organization Identifier 和 Product Name 自动生成
- Interface —— 界面技术，选择 SwiftUI
- Language —— 开发语言，选择 Swift
- Testing System —— 默认会创建测试目标（Unit Tests），初学阶段忽略
- Storage —— 本地数据持久化框架，可自动集成 SwiftData 或 Core Data，初学阶段忽略

填写完成后，点击 "Next"。

### 保存项目

![Swift](001_xcode4.png)

选择一个合适的文件夹保存。

点击 "Create" 按钮，Xcode 会自动生成项目结构。

## Xcode 项目结构

保存 Xcode 项目后，在 Finder 中可以看到生成的项目文件夹。

![Swift](001_xcode5.png)

- Assets.xcassets —— 用于存放图片、App图标等资源的文件夹

- ContentView.swift —— 默认生成的 SwiftUI 视图文件，我们后续将在这里编写界面代码。

- SwiftSlimTestApp.swift —— 应用的入口文件（App Entry Point），负责启动应用，我们暂时不需要了解它。

- SwiftSlimTest.xcodeproj —— Xcode 项目文件，双击该文件即可打开项目。

## 认识 Xcode 界面

双击 .xcodeproj 文件打开项目，在左侧 Navigator 区域选择 ContentView.swift 文件。

Xcode 界面主要由五个区域组成：

- Navigator —— 导航区域，用于查看文件结构、搜索
- Editor —— 编辑区域，用于编写 Swift 或 SwiftUI 代码
- Canvas —— 画布区域，用于 SwiftUI 预览
- Inspector —— 属性检查区域，用于查看和修改文件的属性
- Debug Area —— 调试区域，查看日志输出

![Swift](001_xcode6.png)

注意：Canvas 主要用于 SwiftUI 视图预览，从 Xcode 官方架构来讲，它属于 Editor 的辅助预览区域。只有在打开 SwiftUI 视图文件时，才可以启用 Canvas，其他类型文件不会显示预览功能。

在后面的课程中，我们主要在 Editor 区域编写 Swift 和 SwiftUI 代码。

第一次打开 Xcode 项目时，Inspector 和 Debug Area 默认可能是隐藏状态，可以点击右上角和右下角按钮显示。

![Swift](001_xcode7.png)

提示：Inspector 区域主要用于查看和修改文件属性。在实际开发中，通常会隐藏该区域，以获得更大的编辑空间。

## 总结

本节课，我们学习了如何下载 Xcode，创建第一个 Xcode 项目，以及基本的 Xcode 界面布局。

下面是自由活动时间：
- 你可以尝试在 Navigator 区域创建、删除文件。  
- 查看 Editor 区域的代码，观察代码结构。
- 查看 Canvas 区域的按钮，尝试放大、缩小预览视图。

下一节课，我们将开始写一些简单的代码，并帮助我们进一步了解 Xcode。  
