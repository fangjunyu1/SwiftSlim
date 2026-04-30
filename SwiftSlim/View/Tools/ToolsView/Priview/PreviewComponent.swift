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
            subtitle: "Text",
            description: "Displays plain text.",
            demo: .text,
            code: """
Text("Hello, SwiftUI")
    .font(.system(size: 24, weight: .semibold))
"""
        ),
        .init(
            category: .display,
            name: "Image",
            subtitle: "Image",
            description: "Displays system icons or local images.",
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
            subtitle: "Icon & Text",
            description: "Combines an icon and text.",
            demo: .label,
            code: """
Label("Favorites", systemImage: "star.fill")
"""
        ),
        .init(
            category: .display,
            name: "Divider",
            subtitle: "Divider",
            description: "Separates content sections.",
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
            subtitle: "Progress",
            description: "Displays loading status or task progress.",
            demo: .progressView,
            code: """
ProgressView(value: 0.3)
"""
        ),
        .init(
            category: .action,
            name: "Button",
            subtitle: "Button",
            description: "Responds to tap actions.",
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
            subtitle: "Link",
            description: "Opens web pages or jumps to a URL.",
            demo: .link,
            code: """
Link("Open Fang Junyu",
     destination: URL(string: "https://fangjunyu.com/")!)
"""
        ),
        .init(
            category: .action,
            name: "Menu",
            subtitle: "Menu",
            description: "Shows multiple actions.",
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
            subtitle: "NavigationLink",
            description: "Navigates to another view.",
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
            subtitle: "TextField",
            description: "Accepts short text input.",
            demo: .textField,
            code: """
TextField("Enter your name", text: $text)
    .textFieldStyle(.roundedBorder)
"""
        ),
        .init(
            category: .input,
            name: "SecureField",
            subtitle: "SecureField",
            description: "Hides sensitive text input.",
            demo: .secureField,
            code: """
SecureField("Enter password", text: $password)
    .textFieldStyle(.roundedBorder)
"""
        ),
        .init(
            category: .input,
            name: "TextEditor",
            subtitle: "TextEditor",
            description: "Edits multi-line text.",
            demo: .textEditor,
            code: """
TextEditor(text: $text)
    .frame(height: 100)
"""
        ),
        .init(
            category: .input,
            name: "Toggle",
            subtitle: "Toggle",
            description: "Switches a value on or off.",
            demo: .toggle,
            code: """
Toggle("Dark Mode", isOn: $isOn)
"""
        ),
        .init(
            category: .input,
            name: "Slider",
            subtitle: "Slider",
            description: "Selects a value in a range.",
            demo: .slider,
            code: """
Slider(value: $value, in: 0...100, step: 1)
"""
        ),
        .init(
            category: .input,
            name: "Stepper",
            subtitle: "Stepper",
            description: "Adjusts a value step by step.",
            demo: .stepper,
            code: """
Stepper("Num: \\(count)", value: $count, in: 1...10)
"""
        ),
        .init(
            category: .input,
            name: "Picker (Segmented)",
            subtitle: "Segmented Picker",
            description: "Switches quickly between options.",
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
            subtitle: "Menu Picker",
            description: "Presents options in a menu.",
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
            subtitle: "Wheel Picker",
            description: "Presents options in a wheel.",
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
            subtitle: "DatePicker",
            description: "Selects a date and time.",
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
            subtitle: "ColorPicker",
            description: "Selects a color.",
            demo: .colorPicker,
            code: """
ColorPicker("Accent Color", selection: $color)
"""
        ),
        .init(
            category: .container,
            name: "ScrollView",
            subtitle: "ScrollView",
            description: "Shows scrollable content.",
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
            subtitle: "List",
            description: "Shows data in rows.",
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
            subtitle: "Section",
            description: "Groups list or form content.",
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
            subtitle: "Form",
            description: "Collects settings or user input.",
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
            subtitle: "DisclosureGroup",
            description: "Expands or collapses content.",
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
            subtitle: "TabView",
            description: "Switches between multiple views.",
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
