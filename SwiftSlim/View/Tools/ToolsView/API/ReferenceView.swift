////
////  ReferenceView.swift
////  SwiftSlim
////
////  Created by 方君宇 on 2026/4/23.
////
//
//import SwiftUI
//
//// MARK: - 分类
//
//enum ReferenceCategory: String, CaseIterable, Identifiable {
//    case component
//    case state
//    case modifier
//    
//    var id: String { rawValue }
//    
//    var title: String {
//        switch self {
//        case .component: return "组件"
//        case .state: return "状态"
//        case .modifier: return "修饰符"
//        }
//    }
//}
//
//// MARK: - 展示类型
//
//enum ReferenceStyle {
//    case component
//    case state
//    case modifier
//}
//
//// MARK: - 示例类型
//
//enum ReferenceDemo {
//    case text
//    case button
//    case stateCounter
//    case padding
//}
//
//// MARK: - 数据模型
//
//struct ReferenceItem: Identifiable {
//    var id = UUID()
//    let category: ReferenceCategory
//    let style: ReferenceStyle
//    
//    let name: String
//    let subtitle: String
//    let summary: String
//    let code: String
//    let notes: [String]
//    let demo: ReferenceDemo
//}
//
//// MARK: - 示例数据
//
//extension ReferenceItem {
//    static let samples: [ReferenceItem] = [
//        .init(
//            category: .component,
//            style: .component,
//            name: "Text",
//            subtitle: "显示只读文本",
//            summary: "用于在界面上显示一行或多行文本，是 SwiftUI 中最常见的视图之一。",
//            code: """
//            Text("Hello, SwiftUI")
//                .font(.title)
//                .foregroundColor(.blue)
//            """,
//            notes: [
//                "适合显示标题、正文、提示信息",
//                "如果不希望参与本地化查找，可以使用 Text(verbatim:)",
//                "常与 .font()、.foregroundColor()、.lineLimit() 搭配使用"
//            ],
//            demo: .text
//        ),
//        
//        .init(
//            category: .component,
//            style: .component,
//            name: "Button",
//            subtitle: "响应点击操作",
//            summary: "用于处理用户点击事件，可以执行函数、修改状态，或触发页面交互。",
//            code: """
//            Button("Tap Me") {
//                print("Button tapped")
//            }
//            """,
//            notes: [
//                "Button 的核心由标题和点击动作组成",
//                "适合按钮、提交、跳转、确认等场景",
//                "可以配合 .buttonStyle() 自定义样式"
//            ],
//            demo: .button
//        ),
//        
//        .init(
//            category: .state,
//            style: .state,
//            name: "@State",
//            subtitle: "在当前视图中保存状态",
//            summary: "用于在当前视图内部保存可变数据。状态变化后，界面会自动刷新。",
//            code: """
//            struct CounterView: View {
//                @State private var count = 0
//                
//                var body: some View {
//                    VStack {
//                        Text("Count: \\(count)")
//                        
//                        Button("Add 1") {
//                            count += 1
//                        }
//                    }
//                }
//            }
//            """,
//            notes: [
//                "@State 适合当前视图自己拥有的数据",
//                "当值变化时，依赖它的视图会自动更新",
//                "不要把需要跨多个页面共享的数据都塞进 @State"
//            ],
//            demo: .stateCounter
//        ),
//        
//        .init(
//            category: .modifier,
//            style: .modifier,
//            name: ".padding()",
//            subtitle: "为视图添加内边距",
//            summary: "用于给视图内容和边界之间增加间距，让界面更舒展、更易读。",
//            code: """
//            Text("Hello")
//                .padding()
//            """,
//            notes: [
//                "不写参数时，会在四周添加默认边距",
//                "可以指定方向，例如 .padding(.horizontal)",
//                "是界面排版中最常用的修饰符之一"
//            ],
//            demo: .padding
//        )
//    ]
//}
//
//// MARK: - 入口视图
//
//struct ReferenceView: View {
//    private let items = ReferenceItem.samples
//    
//    @State private var selectedCategory: ReferenceCategory? = nil
//    @State private var searchText = ""
//    
//    private var filteredItems: [ReferenceItem] {
//        items.filter { item in
//            let matchCategory = selectedCategory == nil || item.category == selectedCategory
//            let matchSearch =
//                searchText.isEmpty ||
//                item.name.localizedCaseInsensitiveContains(searchText) ||
//                item.subtitle.localizedCaseInsensitiveContains(searchText) ||
//                item.summary.localizedCaseInsensitiveContains(searchText)
//            
//            return matchCategory && matchSearch
//        }
//    }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            categoryBar
//            
//            List(filteredItems) { item in
//                NavigationLink(destination: ReferenceDetailView(item: item)) {
//                    ReferenceRow(item: item)
//                }
//                .listRowSeparator(.hidden)
//                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//            }
//            .listStyle(.plain)
//        }
//        .searchable(text: $searchText, prompt: "搜索组件、状态或修饰符")
//        .navigationTitle("速查")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//    
//    private var categoryBar: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 10) {
//                categoryButton(title: "全部", isSelected: selectedCategory == nil) {
//                    selectedCategory = nil
//                }
//                
//                ForEach(ReferenceCategory.allCases) { category in
//                    categoryButton(title: category.title, isSelected: selectedCategory == category) {
//                        selectedCategory = category
//                    }
//                }
//            }
//            .padding(.horizontal, 16)
//            .padding(.vertical, 12)
//        }
//        .background(Color(.systemBackground))
//    }
//    
//    private func categoryButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
//        Button(action: action) {
//            Text(title)
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundColor(isSelected ? .white : .primary)
//                .padding(.horizontal, 14)
//                .padding(.vertical, 10)
//                .background(isSelected ? Color.blue : Color(.secondarySystemBackground))
//                .clipShape(Capsule())
//        }
//        .buttonStyle(.plain)
//    }
//}
//
//// MARK: - 列表行
//
//struct ReferenceRow: View {
//    let item: ReferenceItem
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: 12) {
//            Circle()
//                .fill(colorForCategory(item.category).opacity(0.15))
//                .frame(width: 42, height: 42)
//                .overlay(
//                    Image(systemName: iconForCategory(item.category))
//                        .foregroundColor(colorForCategory(item.category))
//                )
//            
//            VStack(alignment: .leading, spacing: 4) {
//                Text(item.name)
//                    .font(.system(size: 18, weight: .bold))
//                
//                Text(item.subtitle)
//                    .font(.system(size: 13))
//                    .foregroundColor(.secondary)
//                
//                Text(item.summary)
//                    .font(.system(size: 14))
//                    .foregroundColor(.secondary)
//                    .lineLimit(2)
//            }
//            
//            Spacer()
//        }
//        .padding(16)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
//    }
//    
//    private func iconForCategory(_ category: ReferenceCategory) -> String {
//        switch category {
//        case .component: return "square.grid.2x2"
//        case .state: return "arrow.triangle.2.circlepath"
//        case .modifier: return "slider.horizontal.3"
//        }
//    }
//    
//    private func colorForCategory(_ category: ReferenceCategory) -> Color {
//        switch category {
//        case .component: return .blue
//        case .state: return .green
//        case .modifier: return .orange
//        }
//    }
//}
//
//// MARK: - 详情页
//
//struct ReferenceDetailView: View {
//    let item: ReferenceItem
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                headerCard
//                summaryCard
//                
//                switch item.style {
//                case .component:
//                    ComponentTemplateView(item: item)
//                case .state:
//                    StateTemplateView(item: item)
//                case .modifier:
//                    ModifierTemplateView(item: item)
//                }
//                
//                notesCard
//                codeCard
//            }
//            .padding(16)
//        }
//        .navigationTitle(item.name)
//        .navigationBarTitleDisplayMode(.inline)
//        .background(Color(.systemGroupedBackground))
//    }
//    
//    private var headerCard: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            Text(item.name)
//                .font(.system(size: 28, weight: .bold))
//            
//            Text(item.subtitle)
//                .font(.system(size: 15))
//                .foregroundColor(.secondary)
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//    
//    private var summaryCard: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("作用")
//                .font(.system(size: 18, weight: .bold))
//            
//            Text(item.summary)
//                .font(.system(size: 15))
//                .foregroundColor(.secondary)
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//    
//    private var notesCard: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("提示")
//                .font(.system(size: 18, weight: .bold))
//            
//            ForEach(item.notes, id: \.self) { note in
//                HStack(alignment: .top, spacing: 8) {
//                    Circle()
//                        .fill(Color.blue)
//                        .frame(width: 6, height: 6)
//                        .padding(.top, 6)
//                    
//                    Text(note)
//                        .font(.system(size: 15))
//                        .foregroundColor(.secondary)
//                }
//            }
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//    
//    private var codeCard: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("代码")
//                .font(.system(size: 18, weight: .bold))
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                Text(item.code)
//                    .font(.system(size: 13, design: .monospaced))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(16)
//                    .background(Color.black.opacity(0.05))
//                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//            }
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//}
//
//// MARK: - 组件模板
//
//struct ComponentTemplateView: View {
//    let item: ReferenceItem
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("效果预览")
//                .font(.system(size: 18, weight: .bold))
//            
//            demoView
//                .padding(20)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(Color(.tertiarySystemBackground))
//                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//    
//    @ViewBuilder
//    private var demoView: some View {
//        switch item.demo {
//        case .text:
//            Text("Hello, SwiftUI")
//                .font(.system(size: 26, weight: .semibold))
//                .foregroundColor(.blue)
//            
//        case .button:
//            Button(action: {}) {
//                Text("Tap Me")
//                    .font(.system(size: 16, weight: .semibold))
//                    .foregroundColor(.white)
//                    .padding(.horizontal, 18)
//                    .padding(.vertical, 12)
//                    .background(Color.blue)
//                    .clipShape(Capsule())
//            }
//            
//        default:
//            EmptyView()
//        }
//    }
//}
//
//// MARK: - 状态模板
//
//struct StateTemplateView: View {
//    let item: ReferenceItem
//    @State private var count = 0
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("状态演示")
//                .font(.system(size: 18, weight: .bold))
//            
//            Text("下面这个小例子演示了 @State 如何在当前视图中保存数据，并在数值变化时自动刷新界面。")
//                .font(.system(size: 15))
//                .foregroundColor(.secondary)
//            
//            VStack(spacing: 16) {
//                Text("Count: \(count)")
//                    .font(.system(size: 28, weight: .bold))
//                
//                Button("Add 1") {
//                    count += 1
//                }
//                .font(.system(size: 16, weight: .semibold))
//                .foregroundColor(.white)
//                .padding(.horizontal, 18)
//                .padding(.vertical, 12)
//                .background(Color.green)
//                .clipShape(Capsule())
//            }
//            .frame(maxWidth: .infinity)
//            .padding(20)
//            .background(Color(.tertiarySystemBackground))
//            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//}
//
//// MARK: - 修饰符模板
//
//struct ModifierTemplateView: View {
//    let item: ReferenceItem
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("效果对比")
//                .font(.system(size: 18, weight: .bold))
//            
//            Text("这类 API 更适合展示“添加前”和“添加后”的差异。")
//                .font(.system(size: 15))
//                .foregroundColor(.secondary)
//            
//            VStack(spacing: 16) {
//                beforeAfterRow(
//                    title: "未添加 .padding()",
//                    content: AnyView(
//                        Text("Hello")
//                            .background(Color.blue.opacity(0.2))
//                    )
//                )
//                
//                beforeAfterRow(
//                    title: "已添加 .padding()",
//                    content: AnyView(
//                        Text("Hello")
//                            .padding()
//                            .background(Color.blue.opacity(0.2))
//                    )
//                )
//            }
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//    }
//    
//    private func beforeAfterRow(title: String, content: AnyView) -> some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text(title)
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundColor(.secondary)
//            
//            content
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(16)
//                .background(Color(.tertiarySystemBackground))
//                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//        }
//    }
//}
//
//// MARK: - Preview
//
//#Preview {
//    NavigationView {
//        ReferenceView()
//    }
//}
