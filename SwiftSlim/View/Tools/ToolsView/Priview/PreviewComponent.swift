//
//  PreviewComponent.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

struct PreviewComponent: Identifiable {
    var id = UUID()
    let category: PreviewCategory   // 类别
    let name: String    // 组件名称
    let subtitle: String    // 组件副标题
    let description: String // 组件描述
    let demo: PreviewDemo   // 测试 Demo
    let code: String    // 代码，用于复制
}

extension PreviewComponent {
    static let all: [PreviewComponent] = [
        .init(
            category: .display,
            name: "Text",
            subtitle: "文本",
            description: "用于显示一段普通文本。",
            demo: .text,
            code: """
Text("Hello, SwiftUI")
    .font(.system(size: 24, weight: .semibold))
"""
        ),
        .init(
            category: .display,
            name: "Image",
            subtitle: "图片",
            description: "用于显示系统图标或本地图片。",
            demo: .image,
            code: """
Image(systemName: "swift")
    .font(.system(size: 40))
    .foregroundColor(.orange)
"""
        ),
        .init(
            category: .display,
            name: "Label",
            subtitle: "图标与文字",
            description: "用于将图标和文本组合显示。",
            demo: .label,
            code: """
Label("Favorites", systemImage: "star.fill")
"""
        ),
        .init(
            category: .display,
            name: "Divider",
            subtitle: "分隔线",
            description: "用于分隔不同区域的内容。",
            demo: .divider,
            code: """
VStack {
    Text("Top Content")
    Divider()
    Text("Bottom Content")
}
"""
        ),
        .init(
            category: .display,
            name: "ProgressView",
            subtitle: "进度",
            description: "用于显示加载状态或任务进度。",
            demo: .progressView,
            code: """
ProgressView(value: 0.3)
"""
        ),
        .init(
            category: .action,
            name: "Button",
            subtitle: "按钮",
            description: "用于响应点击操作。",
            demo: .button,
            code: """
Button("Tap Me") {
    count += 1
}
.buttonStyle(.borderedProminent)
"""
        ),
        .init(
            category: .action,
            name: "Link",
            subtitle: "链接",
            description: "用于打开网页链接。",
            demo: .link,
            code: """
Link("Open Apple Developer",
     destination: URL(string: "https://developer.Apple.com")!)
"""
        ),
        .init(
            category: .action,
            name: "Menu",
            subtitle: "菜单",
            description: "用于展示多个可选操作。",
            demo: .menu,
            code: """
Menu("More Actions") {
    Button("Edit", action: {})
    Button("Share", action: {})
    Button("Delete", role: .destructive, action: {})
}
"""
        ),
        .init(
            category: .action,
            name: "NavigationLink",
            subtitle: "页面跳转",
            description: "用于导航到新页面。",
            demo: .navigationLink,
            code: """
NavigationLink {
    Text("Detail Page")
} label: {
    Text("Go to Detail")
}
"""
        ),
        .init(
            category: .input,
            name: "TextField",
            subtitle: "单行输入",
            description: "用于输入简短文本。",
            demo: .textField,
            code: """
TextField("Enter your name", text: $text)
    .textFieldStyle(.roundedBorder)
"""
        ),
        .init(
            category: .input,
            name: "SecureField",
            subtitle: "密码输入",
            description: "用于输入隐藏内容。",
            demo: .secureField,
            code: """
SecureField("Enter password", text: $password)
    .textFieldStyle(.roundedBorder)
"""
        ),
        .init(
            category: .input,
            name: "TextEditor",
            subtitle: "多行输入",
            description: "用于输入较长文本内容。",
            demo: .textEditor,
            code: """
TextEditor(text: $text)
    .frame(height: 100)
"""
        ),
        .init(
            category: .input,
            name: "Toggle",
            subtitle: "开关",
            description: "用于切换开与关状态。",
            demo: .toggle,
            code: """
Toggle("Dark Mode", isOn: $isOn)
"""
        ),
        .init(
            category: .input,
            name: "Slider",
            subtitle: "滑块",
            description: "用于选择连续范围的数值。",
            demo: .slider,
            code: """
Slider(value: $value, in: 0...100, step: 1)
"""
        ),
        .init(
            category: .input,
            name: "Stepper",
            subtitle: "步进器",
            description: "用于逐步增加或减少数值。",
            demo: .stepper,
            code: """
Stepper("Num: \\(count)", value: $count, in: 1...10)
"""
        ),
        .init(
            category: .input,
            name: "Picker (Segmented)",
            subtitle: "分段选择",
            description: "适合少量选项之间快速切换。",
            demo: .pickerSegmented,
            code: """
Picker("Number", selection: $selection) {
    Text("First").tag(0)
    Text("Second").tag(1)
    Text("Third").tag(2)
}
.pickerStyle(.segmented)
"""
        ),
        .init(
            category: .input,
            name: "Picker (Menu)",
            subtitle: "菜单选择",
            description: "以菜单方式展示选项。",
            demo: .pickerMenu,
            code: """
Picker("Theme", selection: $selection) {
    Text("Light").tag("Light")
    Text("Dark").tag("Dark")
    Text("System").tag("System")
}
.pickerStyle(MenuPickerStyle())
"""
        ),
        .init(
            category: .input,
            name: "Picker (Wheel)",
            subtitle: "滚轮选择",
            description: "以滚轮形式选择选项。",
            demo: .pickerWheel,
            code: """
Picker("Fruit", selection: $wheelSelection) {
    Text("Apple").tag("Apple")
    Text("Banana").tag("Banana")
    Text("Cherry").tag("Cherry")
}
.pickerStyle(.wheel)
"""
        ),
        .init(
            category: .input,
            name: "DatePicker",
            subtitle: "日期选择",
            description: "用于选择日期和时间。",
            demo: .datePicker,
            code: """
DatePicker("Select Date",
           selection: $date,
           displayedComponents: [.date, .hourAndMinute])
"""
        ),
        .init(
            category: .input,
            name: "ColorPicker",
            subtitle: "颜色选择",
            description: "用于选择颜色。",
            demo: .colorPicker,
            code: """
ColorPicker("Accent Color", selection: $color)
"""
        ),
        .init(
            category: .container,
            name: "ScrollView",
            subtitle: "滚动视图",
            description: "用于展示可滚动内容。",
            demo: .scrollView,
            code: """
ScrollView(.horizontal, showsIndicators: false) {
    HStack {
        // content
    }
}
"""
        ),
        .init(
            category: .container,
            name: "List",
            subtitle: "列表",
            description: "用于按行展示数据内容。",
            demo: .list,
            code: """
List {
    Text("Apple")
    Text("Banana")
    Text("Orange")
}
"""
        ),
        .init(
            category: .container,
            name: "Section",
            subtitle: "分组",
            description: "用于给列表或表单内容分区。",
            demo: .section,
            code: """
List {
    Section("Fruits") {
        Text("Apple")
        Text("Orange")
    }
}
"""
        ),
        .init(
            category: .container,
            name: "Form",
            subtitle: "表单",
            description: "适合设置页与资料录入场景。",
            demo: .form,
            code: """
Form {
    Section("Account") {
        TextField("Username", text: $username)
        SecureField("Password", text: $password)
    }
}
"""
        ),
        .init(
            category: .container,
            name: "DisclosureGroup",
            subtitle: "折叠组",
            description: "用于展开或收起内容。",
            demo: .disclosureGroup,
            code: """
DisclosureGroup("Show Details") {
    Text("This is the content")
}
"""
        ),
        .init(
            category: .navigation,
            name: "TabView",
            subtitle: "标签页",
            description: "用于多个页面之间切换。",
            demo: .tabView,
            code: """
TabView {
    Text("Home").tag(0)
    Text("Courses").tag(1)
    Text("Tools").tag(2)
}
.tabViewStyle(PageTabViewStyle())
"""
        )
    ]
}
