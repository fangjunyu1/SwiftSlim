//
//  APIReferenceCategory.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/23.
//

import SwiftUI

// MARK: - 分类

enum APIReferenceCategory: String, CaseIterable, Identifiable {
    case component
    case state
    case modifier
    case concurrency
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .component: return "组件"
        case .state: return "状态"
        case .modifier: return "修饰符"
        case .concurrency: return "并发"
        }
    }
    
    var icon: String {
        switch self {
        case .component: return "square.grid.2x2"
        case .state: return "arrow.triangle.2.circlepath"
        case .modifier: return "slider.horizontal.3"
        case .concurrency: return "bolt"
        }
    }
    
    var color: Color {
        switch self {
        case .component: return .blue
        case .state: return .green
        case .modifier: return .orange
        case .concurrency: return .purple
        }
    }
}

// MARK: - 展示风格

enum APIReferenceStyle {
    case component
    case state
    case modifier
    case concept
}

// MARK: - 演示类型

enum APIReferenceDemo {
    case text
    case button
    case stateCounter
    case bindingToggle
    case padding
    case mainThread
}

// MARK: - 平台可用性

enum APIPlatform: String {
    case iOS
    case macOS
    case watchOS
}

struct APIAvailabilityInfo: Identifiable {
    let id = UUID()
    let platform: APIPlatform
    let version: String
    
    var label: String {
        "\(platform.rawValue) \(version)+"
    }
}

// MARK: - 参数模型

struct APIParameterInfo: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let defaultValue: String?
    let description: String
}

// MARK: - 条目模型

struct APIReferenceItem: Identifiable {
    var id = UUID()
    
    let category: APIReferenceCategory
    let style: APIReferenceStyle
    
    let name: String
    let subtitle: String
    let summary: String
    
    let declarations: [String]
    let availability: [APIAvailabilityInfo]
    let parameters: [APIParameterInfo]
    
    let notes: [String]
    let relatedItems: [String]
    let code: String
    let demo: APIReferenceDemo
}

// MARK: - 示例数据

extension APIReferenceItem {
    static let samples: [APIReferenceItem] = [
        .init(
            category: .component,
            style: .component,
            name: "Text",
            subtitle: "显示只读文本",
            summary: "用于在界面上显示一行或多行文本，是 SwiftUI 中最基础也最常用的视图之一。",
            declarations: [
                #"Text(_ key: LocalizedStringKey)"#,
                #"Text(verbatim content: String)"#
            ],
            availability: [
                .init(platform: .iOS, version: "13.0"),
                .init(platform: .macOS, version: "10.15"),
                .init(platform: .watchOS, version: "6.0")
            ],
            parameters: [
                .init(name: "key / content", type: "LocalizedStringKey / String", defaultValue: nil, description: "要显示的文本内容"),
            ],
            notes: [
                "适合显示标题、正文、提示信息",
                "如果不希望参与本地化查找，可以使用 Text(verbatim:)",
                "常与 .font()、.foregroundColor()、.lineLimit() 搭配使用"
            ],
            relatedItems: ["Label", "TextField", "TextEditor"],
            code: """
            Text("Hello, SwiftUI")
                .font(.title)
                .foregroundColor(.blue)
            """,
            demo: .text
        ),
        
        .init(
            category: .component,
            style: .component,
            name: "Button",
            subtitle: "响应点击操作",
            summary: "用于处理用户点击事件，可以执行函数、修改状态，或触发页面交互。",
            declarations: [
                #"Button(_ titleKey: LocalizedStringKey, action: () -> Void)"#,
                #"Button(action: () -> Void, label: () -> Label)"#
            ],
            availability: [
                .init(platform: .iOS, version: "13.0"),
                .init(platform: .macOS, version: "10.15"),
                .init(platform: .watchOS, version: "6.0")
            ],
            parameters: [
                .init(name: "titleKey", type: "LocalizedStringKey", defaultValue: nil, description: "按钮显示的标题"),
                .init(name: "action", type: "() -> Void", defaultValue: nil, description: "点击按钮后执行的操作"),
                .init(name: "label", type: "() -> Label", defaultValue: nil, description: "自定义按钮内容")
            ],
            notes: [
                "最简单的按钮只需要标题和点击动作",
                "复杂样式通常使用 label 闭包来自定义",
                "按钮本身不保存状态，通常配合 @State 使用"
            ],
            relatedItems: ["@State", "Toggle", "NavigationLink"],
            code: """
            Button("Tap Me") {
                print("Button tapped")
            }
            """,
            demo: .button
        ),
        
        .init(
            category: .state,
            style: .state,
            name: "@State",
            subtitle: "在当前视图中保存状态",
            summary: "用于在当前视图内部保存可变数据。状态变化后，依赖它的界面会自动刷新。",
            declarations: [
                #"@State private var count = 0"#
            ],
            availability: [
                .init(platform: .iOS, version: "13.0"),
                .init(platform: .macOS, version: "10.15"),
                .init(platform: .watchOS, version: "6.0")
            ],
            parameters: [
                .init(name: "wrappedValue", type: "Value", defaultValue: nil, description: "状态的初始值")
            ],
            notes: [
                "@State 适合当前视图自己拥有的数据",
                "当值变化时，依赖它的 body 会重新计算",
                "如果数据需要传给子视图并允许修改，通常会继续用到 @Binding"
            ],
            relatedItems: ["@Binding", "Button", "Toggle"],
            code: """
            struct CounterView: View {
                @State private var count = 0
                
                var body: some View {
                    VStack {
                        Text("Count: \\(count)")
                        
                        Button("Add 1") {
                            count += 1
                        }
                    }
                }
            }
            """,
            demo: .stateCounter
        ),
        
        .init(
            category: .state,
            style: .state,
            name: "@Binding",
            subtitle: "引用并修改外部状态",
            summary: "用于在子视图中读取和修改父视图传进来的状态。它本身不拥有数据，只是建立连接。",
            declarations: [
                #"@Binding var isOn: Bool"#
            ],
            availability: [
                .init(platform: .iOS, version: "13.0"),
                .init(platform: .macOS, version: "10.15"),
                .init(platform: .watchOS, version: "6.0")
            ],
            parameters: [
                .init(name: "wrappedValue", type: "Value", defaultValue: nil, description: "从外部传入的绑定值")
            ],
            notes: [
                "@Binding 不拥有数据，只是引用外部状态",
                "常用于父子视图之间的数据联动",
                "父视图传入的是 $变量，子视图接收的是 @Binding"
            ],
            relatedItems: ["@State", "Toggle", "TextField"],
            code: """
            struct ParentView: View {
                @State private var isOn = true
                
                var body: some View {
                    ChildView(isOn: $isOn)
                }
            }

            struct ChildView: View {
                @Binding var isOn: Bool
                
                var body: some View {
                    Toggle("Power", isOn: $isOn)
                }
            }
            """,
            demo: .bindingToggle
        ),
        
        .init(
            category: .modifier,
            style: .modifier,
            name: ".padding()",
            subtitle: "为视图添加内边距",
            summary: "用于给视图内容和边界之间增加间距，让界面更舒展，也更容易阅读。",
            declarations: [
                #".padding()"#,
                #".padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil)"#
            ],
            availability: [
                .init(platform: .iOS, version: "13.0"),
                .init(platform: .macOS, version: "10.15"),
                .init(platform: .watchOS, version: "6.0")
            ],
            parameters: [
                .init(name: "edges", type: "Edge.Set", defaultValue: ".all", description: "指定添加边距的方向"),
                .init(name: "length", type: "CGFloat?", defaultValue: "nil", description: "边距大小；为 nil 时使用系统默认值")
            ],
            notes: [
                "不写参数时，会在四周添加默认边距",
                "可以指定方向，例如 .padding(.horizontal)",
                "是最常见的布局修饰符之一"
            ],
            relatedItems: [".frame()", ".background()", ".overlay()"],
            code: """
            Text("Hello")
                .padding()
            """,
            demo: .padding
        ),
        
        .init(
            category: .concurrency,
            style: .concept,
            name: "MainActor / 主线程",
            subtitle: "在主线程更新界面",
            summary: "耗时任务通常应放到后台处理，而界面相关的状态更新，需要切回主线程执行。",
            declarations: [
                #"await MainActor.run { ... }"#,
                #"@MainActor func updateUI() { ... }"#
            ],
            availability: [
                .init(platform: .iOS, version: "15.0"),
                .init(platform: .macOS, version: "12.0"),
                .init(platform: .watchOS, version: "8.0")
            ],
            parameters: [],
            notes: [
                "网络请求、解码、耗时操作通常不应阻塞主线程",
                "更新 @State、刷新界面时，应保证在主线程上执行",
                "常见写法是 await MainActor.run { ... }"
            ],
            relatedItems: ["Task", "@State", ".task"],
            code: """
            @State private var message = "Idle"
            @State private var isLoading = false

            func loadData() async {
                isLoading = true
                message = "Loading..."

                let result = await withCheckedContinuation { continuation in
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                        continuation.resume(returning: "Loaded from background")
                    }
                }

                await MainActor.run {
                    message = result
                    isLoading = false
                }
            }
            """,
            demo: .mainThread
        )
    ]
}

// MARK: - 主入口视图

struct APIView: View {
    private let items = APIReferenceItem.samples
    
    @State private var selectedCategory: APIReferenceCategory? = nil
    @State private var searchText = ""
    
    private var filteredItems: [APIReferenceItem] {
        items.filter { item in
            let matchCategory = selectedCategory == nil || item.category == selectedCategory
            let matchSearch =
                searchText.isEmpty ||
                item.name.localizedCaseInsensitiveContains(searchText) ||
                item.subtitle.localizedCaseInsensitiveContains(searchText) ||
                item.summary.localizedCaseInsensitiveContains(searchText)
            
            return matchCategory && matchSearch
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            categoryBar
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(filteredItems) { item in
                        NavigationLink(destination: APIReferenceDetailView(item: item)) {
                            APIReferenceRow(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .searchable(text: $searchText, prompt: "搜索 API、状态、修饰符...")
        .navigationTitle("API 速查")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
    
    private var categoryBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                categoryButton(title: "全部", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                
                ForEach(APIReferenceCategory.allCases) { category in
                    categoryButton(title: category.title, isSelected: selectedCategory == category) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color(.systemBackground))
    }
    
    private func categoryButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(isSelected ? .white : .primary)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(isSelected ? Color.blue : Color(.secondarySystemBackground))
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 列表卡片

struct APIReferenceRow: View {
    let item: APIReferenceItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(item.category.color.opacity(0.15))
                .frame(width: 42, height: 42)
                .overlay(
                    Image(systemName: item.category.icon)
                        .foregroundColor(item.category.color)
                )
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 8)
                    
                    Text(item.category.title)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(item.category.color)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(item.category.color.opacity(0.12))
                        .clipShape(Capsule())
                }
                
                Text(item.subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                
                Text(item.summary)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(16)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

// MARK: - 详情页

struct APIReferenceDetailView: View {
    let item: APIReferenceItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                headerCard
                summarySection
                declarationSection
                demoSection
                
                if !item.availability.isEmpty {
                    availabilitySection
                }
                
                if !item.parameters.isEmpty {
                    parameterSection
                }
                
                notesSection
                
                if !item.relatedItems.isEmpty {
                    relatedSection
                }
                
                CodeCardView(title: "代码示例", code: item.code)
            }
            .padding(16)
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(item.name)
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                
                Text(item.category.title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(item.category.color)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(item.category.color.opacity(0.12))
                    .clipShape(Capsule())
            }
            
            Text(item.subtitle)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
    
    private var summarySection: some View {
        SectionCard(title: "作用") {
            Text(item.summary)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }
    }
    
    private var declarationSection: some View {
        SectionCard(title: "常用写法") {
            VStack(spacing: 12) {
                ForEach(item.declarations, id: \.self) { declaration in
                    Text(declaration)
                        .font(.system(size: 13, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(14)
                        .background(Color.black.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .textSelection(.enabled)
                }
            }
        }
    }
    
    private var demoSection: some View {
        SectionCard(title: "演示") {
            APIDemoContainerView(item: item)
        }
    }
    
    private var availabilitySection: some View {
        SectionCard(title: "可用性") {
            FlowWrap(spacing: 10) {
                ForEach(item.availability) { info in
                    Text(info.label)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.tertiarySystemBackground))
                        .clipShape(Capsule())
                }
            }
        }
    }
    
    private var parameterSection: some View {
        SectionCard(title: "参数") {
            VStack(spacing: 12) {
                ForEach(item.parameters) { parameter in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text(parameter.name)
                                .font(.system(size: 15, weight: .bold))
                            
                            Text(parameter.type)
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(.tertiarySystemBackground))
                                .clipShape(Capsule())
                        }
                        
                        if let defaultValue = parameter.defaultValue {
                            Text("默认值：\(defaultValue)")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                        }
                        
                        Text(parameter.description)
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.tertiarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
            }
        }
    }
    
    private var notesSection: some View {
        SectionCard(title: "提示与最佳实践") {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(item.notes, id: \.self) { note in
                    HStack(alignment: .top, spacing: 8) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 6, height: 6)
                            .padding(.top, 7)
                        
                        Text(note)
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
    private var relatedSection: some View {
        SectionCard(title: "相关内容") {
            FlowWrap(spacing: 10) {
                ForEach(item.relatedItems, id: \.self) { text in
                    Text(text)
                        .font(.system(size: 13, weight: .semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.tertiarySystemBackground))
                        .clipShape(Capsule())
                }
            }
        }
    }
}

// MARK: - 演示容器

struct APIDemoContainerView: View {
    let item: APIReferenceItem
    
    var body: some View {
        Group {
            switch item.demo {
            case .text:
                TextDemoBox()
            case .button:
                ButtonDemoBox()
            case .stateCounter:
                StateCounterDemoBox()
            case .bindingToggle:
                BindingDemoBox()
            case .padding:
                PaddingCompareDemoBox()
            case .mainThread:
                MainThreadDemoBox()
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

// MARK: - 具体演示

struct TextDemoBox: View {
    var body: some View {
        Text("Hello, SwiftUI")
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ButtonDemoBox: View {
    @State private var didTap = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Button(action: {
                didTap.toggle()
            }) {
                Text("Tap Me")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
            
            Text(didTap ? "按钮已点击" : "点击按钮试试看")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
    }
}

struct StateCounterDemoBox: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)")
                .font(.system(size: 28, weight: .bold))
            
            Button("Add 1") {
                count += 1
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(Color.green)
            .clipShape(Capsule())
        }
        .frame(maxWidth: .infinity)
    }
}

struct BindingDemoBox: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("父视图拥有状态，子视图通过 @Binding 修改它。")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            Toggle("Parent value", isOn: $isOn)
            
            BindingChildDemoBox(isOn: $isOn)
            
            Text(isOn ? "当前状态：开启" : "当前状态：关闭")
                .font(.system(size: 15, weight: .semibold))
        }
    }
}

struct BindingChildDemoBox: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button(isOn ? "Child turns Off" : "Child turns On") {
            isOn.toggle()
        }
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.green)
        .clipShape(Capsule())
    }
}

struct PaddingCompareDemoBox: View {
    var body: some View {
        VStack(spacing: 16) {
            compareRow(title: "未添加 .padding()") {
                Text("Hello")
                    .background(Color.blue.opacity(0.2))
            }
            
            compareRow(title: "已添加 .padding()") {
                Text("Hello")
                    .padding()
                    .background(Color.blue.opacity(0.2))
            }
        }
    }
    
    private func compareRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.secondary)
            
            content()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
}

struct MainThreadDemoBox: View {
    @State private var message = "Idle"
    @State private var isLoading = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("模拟一个后台任务完成后，再切回主线程更新界面。")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            HStack {
                Button(isLoading ? "Loading..." : "模拟请求") {
                    Task {
                        await loadData()
                    }
                }
                .disabled(isLoading)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(isLoading ? Color.gray : Color.purple)
                .clipShape(Capsule())
                
                Spacer()
            }
            
            Text(message)
                .font(.system(size: 15, weight: .medium))
        }
    }
    
    private func loadData() async {
        isLoading = true
        message = "后台处理中..."
        
        let result = await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.2) {
                continuation.resume(returning: "数据已返回，已切回主线程刷新 UI")
            }
        }
        
        await MainActor.run {
            message = result
            isLoading = false
        }
    }
}

// MARK: - 公共组件

struct SectionCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            
            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct CodeCardView: View {
    let title: String
    let code: String
    
    @State private var didCopy = false
    
    var body: some View {
        SectionCard(title: title) {
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    
                    Button(action: copyCode) {
                        Text(didCopy ? "已复制" : "复制代码")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.12))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    Text(code)
                        .font(.system(size: 13, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(Color.black.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .textSelection(.enabled)
                }
            }
        }
    }
    
    private func copyCode() {
        #if canImport(UIKit)
        UIPasteboard.general.string = code
        #endif
        
        didCopy = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            didCopy = false
        }
    }
}

// 简单的自动换行流式布局
struct FlowWrap<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    private let data: Data
    private let spacing: CGFloat
    private let content: (Data.Element) -> Content
    
    init(_ data: Data, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        _FlowWrapLayout(data: Array(data), spacing: spacing, content: content)
    }
}

extension FlowWrap where Data == [String], Content == Text {
    init(spacing: CGFloat = 8, @ViewBuilder content: @escaping () -> Content) {
        self.data = []
        self.spacing = spacing
        self.content = { _ in content() }
    }
}

// 针对任意 View 的便捷初始化
extension FlowWrap where Data == [Int] {
    init(spacing: CGFloat = 8, @ViewBuilder content: @escaping () -> Content) {
        self.data = [0]
        self.spacing = spacing
        self.content = { _ in content() }
    }
}

private struct _FlowWrapLayout<T: Hashable, Content: View>: View {
    let data: [T]
    let spacing: CGFloat
    let content: (T) -> Content
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(data, id: \.self) { item in
                content(item)
                    .padding(.trailing, spacing)
                    .padding(.bottom, spacing)
                    .alignmentGuide(.leading) { dimension in
                        if abs(width - dimension.width) > geometry.size.width {
                            width = 0
                            height -= dimension.height + spacing
                        }
                        let result = width
                        if item == data.last {
                            width = 0
                        } else {
                            width -= dimension.width + spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == data.last {
                            height = 0
                        }
                        return result
                    }
            }
        }
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        totalHeight = proxy.size.height
                    }
                    .onChange(of: proxy.size.height) { newValue in
                        totalHeight = newValue
                    }
            }
        )
    }
}

// MARK: - 预览

#Preview {
    NavigationView {
        APIView()
    }
}
