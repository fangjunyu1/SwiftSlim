////
////  ErrorsView.swift
////  SwiftSlim
////
////  Created by 方君宇 on 2026/4/24.
////
//
//import SwiftUI
//import UIKit
//
//// MARK: - 报错库页面
//
//struct ErrorsView: View {
//    private let errors = ErrorLibraryItem.all
//    
//    @State private var searchText = ""
//    @State private var selectedCategory: ErrorCategory? = nil
//    @State private var expandedIDs: Set<String> = []
//    
//    private var filteredErrors: [ErrorLibraryItem] {
//        errors.filter { item in
//            let matchCategory = selectedCategory == nil || item.category == selectedCategory
//            
//            let matchSearch =
//            searchText.isEmpty ||
//            item.title.localizedCaseInsensitiveContains(searchText) ||
//            item.summary.localizedCaseInsensitiveContains(searchText) ||
//            item.reason.localizedCaseInsensitiveContains(searchText) ||
//            item.solution.localizedCaseInsensitiveContains(searchText) ||
//            item.tags.contains { $0.localizedCaseInsensitiveContains(searchText) }
//            
//            return matchCategory && matchSearch
//        }
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 18) {
//                
////                ToolCategoryView(tool: .Errors, searchTips: "Search errors...", searchText: $searchText, selectedCategory: $selectedCategory)
//                
//                LazyVStack(spacing: 14) {
//                    ForEach(filteredErrors) { item in
//                        ErrorCardView(
//                            item: item,
//                            isExpanded: expandedIDs.contains(item.id),
//                            onToggle: {
//                                toggleExpand(item.id)
//                            }
//                        )
//                    }
//                }
//            }
//            .padding(.horizontal, 20)
//            .padding(.bottom, 30)
//        }
//        .navigationTitle("Errors")
//        .navigationBarTitleDisplayMode(.inline)
//        .modifier(BackgroundModifiers())
//    }
//    
//    private func toggleExpand(_ id: String) {
//        if expandedIDs.contains(id) {
//            expandedIDs.remove(id)
//        } else {
//            expandedIDs.insert(id)
//        }
//    }
//}
//
//// MARK: - 报错卡片
//
//struct ErrorCardView: View {
//    let item: ErrorLibraryItem
//    let isExpanded: Bool
//    let onToggle: () -> Void
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            Button(action: onToggle) {
//                VStack(alignment: .leading, spacing: 12) {
//                    HStack(alignment: .top, spacing: 12) {
//                        Image(systemName: item.category.icon)
//                            .font(.system(size: 18, weight: .semibold))
//                            .foregroundColor(item.category.color)
//                            .frame(width: 24, height: 24)
//                        
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text(item.title)
//                                .font(.system(size: 16, weight: .bold))
//                                .foregroundColor(.primary)
//                                .lineLimit(2)
//                            
//                            Text(item.summary)
//                                .font(.system(size: 14))
//                                .foregroundColor(.secondary)
//                        }
//                        
//                        Spacer()
//                        
//                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
//                            .font(.system(size: 13, weight: .semibold))
//                            .foregroundColor(.secondary)
//                            .padding(.top, 4)
//                    }
//                    
//                    tagList
//                }
//                .padding(18)
//            }
//            .buttonStyle(.plain)
//            
//            if isExpanded {
//                Divider()
//                    .padding(.leading, 54)
//                
//                VStack(alignment: .leading, spacing: 16) {
//                    detailSection(title: "常见原因", text: item.reason)
//                    
//                    detailSection(title: "解决方法", text: item.solution)
//                    
//                    if let wrongCode = item.wrongCode {
//                        CodeBlockView(title: "错误示例", code: wrongCode)
//                    }
//                    
//                    if let correctCode = item.correctCode {
//                        CodeBlockView(title: "正确写法", code: correctCode)
//                    }
//                }
//                .padding(18)
//                .padding(.top, 2)
//            }
//        }
//        .background(Color(.secondarySystemGroupedBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
//    }
//    
//    private var tagList: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 8) {
//                Text(item.category.title)
//                    .font(.system(size: 12, weight: .semibold))
//                    .foregroundColor(item.category.color)
//                    .padding(.horizontal, 9)
//                    .padding(.vertical, 5)
//                    .background(item.category.color.opacity(0.12))
//                    .clipShape(Capsule())
//                
//                ForEach(item.tags, id: \.self) { tag in
//                    Text(tag)
//                        .font(.system(size: 12))
//                        .foregroundColor(.secondary)
//                        .padding(.horizontal, 9)
//                        .padding(.vertical, 5)
//                        .background(Color(.systemBackground))
//                        .clipShape(Capsule())
//                }
//            }
//        }
//    }
//    
//    private func detailSection(title: String, text: String) -> some View {
//        VStack(alignment: .leading, spacing: 6) {
//            Text(title)
//                .font(.system(size: 14, weight: .bold))
//                .foregroundColor(.primary)
//            
//            Text(text)
//                .font(.system(size: 14))
//                .foregroundColor(.secondary)
//                .lineSpacing(3)
//        }
//    }
//}
//
//// MARK: - 代码块
//
//struct CodeBlockView: View {
//    let title: String
//    let code: String
//    
//    @State private var didCopy = false
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            HStack {
//                Text(title)
//                    .font(.system(size: 13, weight: .semibold))
//                    .foregroundColor(.secondary)
//                
//                Spacer()
//                
//                Button {
//                    UIPasteboard.general.string = code
//                    
//                    withAnimation {
//                        didCopy = true
//                    }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//                        withAnimation {
//                            didCopy = false
//                        }
//                    }
//                } label: {
//                    Label(didCopy ? "已复制" : "复制", systemImage: didCopy ? "checkmark" : "doc.on.doc")
//                        .font(.system(size: 12, weight: .semibold))
//                }
//                .buttonStyle(.plain)
//            }
//            .padding(.horizontal, 12)
//            .padding(.vertical, 10)
//            .background(Color(.tertiarySystemGroupedBackground))
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                Text(code)
//                    .font(.system(size: 13, design: .monospaced))
//                    .foregroundColor(.primary)
//                    .padding(12)
//            }
//            .background(Color(.systemBackground))
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
//    }
//}
//
//// MARK: - 分类
//
//enum ErrorCategory: String, CaseIterable, Identifiable, CategoryItem {
//    
//    case swift
//    case swiftUI
//    case xcode
//    case state
//    case appStore
//    
//    var id: String { rawValue }
//    
//    var title: String {
//        switch self {
//        case .swift:
//            return "Swift"
//        case .swiftUI:
//            return "SwiftUI"
//        case .xcode:
//            return "Xcode"
//        case .state:
//            return "状态"
//        case .appStore:
//            return "上架"
//        }
//    }
//    
//    var icon: String {
//        switch self {
//        case .swift:
//            return "swift"
//        case .swiftUI:
//            return "rectangle.3.group"
//        case .xcode:
//            return "hammer"
//        case .state:
//            return "arrow.triangle.2.circlepath"
//        case .appStore:
//            return "shippingbox"
//        }
//    }
//    
//    var color: Color {
//        switch self {
//        case .swift:
//            return .orange
//        case .swiftUI:
//            return .blue
//        case .xcode:
//            return .purple
//        case .state:
//            return .green
//        case .appStore:
//            return .red
//        }
//    }
//}
//
//// MARK: - 数据模型
//
//struct ErrorLibraryItem: Identifiable {
//    let id: String
//    let title: String
//    let summary: String
//    let category: ErrorCategory
//    let tags: [String]
//    let reason: String
//    let solution: String
//    let wrongCode: String?
//    let correctCode: String?
//}
//
//// MARK: - 示例数据
//
//extension ErrorLibraryItem {
//    static let all: [ErrorLibraryItem] = [
//        ErrorLibraryItem(
//            id: "type-empty-cannot-conform-view",
//            title: "Type '()' cannot conform to 'View'",
//            summary: "视图返回了空内容。",
//            category: .swiftUI,
//            tags: ["body", "View", "print"],
//            reason: "SwiftUI 的 body 必须返回一个 View。如果在 body 中只写了 print()、赋值语句，或者某个分支没有返回视图，就会出现这个错误。",
//            solution: "确保 body 或闭包中的每一个分支都返回有效的视图。调试代码可以放到 onAppear 中，不要直接写在 body 的视图结构里。",
//            wrongCode: """
//            var body: some View {
//                print("Hello")
//            }
//            """,
//            correctCode: """
//            var body: some View {
//                Text("Hello")
//                    .onAppear {
//                        print("Hello")
//                    }
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "missing-return-in-closure",
//            title: "Missing return in closure expected to return 'some View'",
//            summary: "闭包缺少返回值。",
//            category: .swiftUI,
//            tags: ["closure", "return", "ViewBuilder"],
//            reason: "某些闭包需要返回 View，但闭包内部没有返回任何视图，或者使用了普通函数写法却没有显式 return。",
//            solution: "如果闭包只有一个表达式，Swift 可以自动返回。如果闭包里有多行逻辑，通常需要把最终视图明确返回，或者把逻辑移出 ViewBuilder。",
//            wrongCode: """
//            var content: some View {
//                let title = "Hello"
//                Text(title)
//            }
//            """,
//            correctCode: """
//            var content: some View {
//                VStack {
//                    Text("Hello")
//                }
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "cannot-convert-binding-string",
//            title: "Cannot convert value of type 'String' to expected argument type 'Binding<String>'",
//            summary: "需要绑定值，但传入了普通字符串。",
//            category: .state,
//            tags: ["Binding", "@State", "TextField"],
//            reason: "TextField 这类输入控件需要绑定数据，也就是 $name，而不是 name。普通 String 只能读取，Binding<String> 才能读写。",
//            solution: "使用 @State 保存输入内容，并在 TextField 中传入 $变量名。",
//            wrongCode: """
//            @State private var name = ""
//            
//            TextField("Name", text: name)
//            """,
//            correctCode: """
//            @State private var name = ""
//            
//            TextField("Name", text: $name)
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "result-builder-control-flow",
//            title: "Closure containing control flow statement cannot be used with result builder 'ViewBuilder'",
//            summary: "ViewBuilder 中使用了不支持的控制流写法。",
//            category: .swiftUI,
//            tags: ["ViewBuilder", "if", "for"],
//            reason: "SwiftUI 的视图构建器支持 if、switch、ForEach 等常见结构，但不支持某些普通 Swift 控制流写法，例如直接使用 for 循环生成视图。",
//            solution: "如果要循环生成视图，使用 ForEach，而不是普通 for 循环。",
//            wrongCode: """
//            VStack {
//                for item in items {
//                    Text(item)
//                }
//            }
//            """,
//            correctCode: """
//            VStack {
//                ForEach(items, id: \\.self) { item in
//                    Text(item)
//                }
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "generic-parameter-content-could-not-be-inferred",
//            title: "Generic parameter 'Content' could not be inferred",
//            summary: "Swift 无法推断泛型内容类型。",
//            category: .swiftUI,
//            tags: ["Generic", "Content", "View"],
//            reason: "通常是某个 SwiftUI 容器的闭包内容不完整，或者传入的参数类型不符合要求，导致 Swift 无法推断具体的 View 类型。",
//            solution: "检查 VStack、HStack、ForEach、NavigationLink 等组件的闭包是否返回了有效视图，并确认参数类型正确。",
//            wrongCode: """
//            VStack {
//                
//            }
//            """,
//            correctCode: """
//            VStack {
//                Text("Content")
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "cannot-use-mutating-member-on-immutable-value",
//            title: "Cannot use mutating member on immutable value: 'self' is immutable",
//            summary: "在不可变的 View 中直接修改属性。",
//            category: .state,
//            tags: ["@State", "mutating", "Button"],
//            reason: "SwiftUI 的 View 是结构体。普通属性在 body 中不能直接修改。如果这个值会影响界面，需要使用 @State、@Binding 或 ObservableObject。",
//            solution: "把需要变化的属性声明为 @State，然后在按钮或手势中修改它。",
//            wrongCode: """
//            var count = 0
//            
//            Button("Add") {
//                count += 1
//            }
//            """,
//            correctCode: """
//            @State private var count = 0
//            
//            Button("Add") {
//                count += 1
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "initializer-init-wrappedvalue-not-available",
//            title: "Initializer 'init(wrappedValue:)' is not available due to missing import of defining module 'SwiftUI'",
//            summary: "缺少 SwiftUI 导入。",
//            category: .xcode,
//            tags: ["import", "SwiftUI", "@State"],
//            reason: "@State、@Binding、View、Text 等 SwiftUI 类型都来自 SwiftUI。如果文件顶部没有 import SwiftUI，就会出现相关错误。",
//            solution: "在文件顶部添加 import SwiftUI。",
//            wrongCode: """
//            struct ContentView: View {
//                @State private var name = ""
//            }
//            """,
//            correctCode: """
//            import SwiftUI
//            
//            struct ContentView: View {
//                @State private var name = ""
//                
//                var body: some View {
//                    Text(name)
//                }
//            }
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "cannot-find-in-scope",
//            title: "Cannot find 'xxx' in scope",
//            summary: "找不到变量、函数或类型。",
//            category: .swift,
//            tags: ["scope", "变量", "作用域"],
//            reason: "当前作用域中不存在这个名字。可能是变量没有声明、拼写错误、访问范围不对，或者文件没有加入当前 Target。",
//            solution: "检查名称拼写、声明位置、访问权限，以及文件是否勾选了 Target Membership。",
//            wrongCode: """
//            Text(userName)
//            """,
//            correctCode: """
//            let userName = "Junyu"
//            
//            Text(userName)
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "extra-argument-in-call",
//            title: "Extra argument in call",
//            summary: "调用时传入了多余参数。",
//            category: .swift,
//            tags: ["参数", "函数", "初始化"],
//            reason: "函数或初始化方法并不接受你传入的某个参数。常见原因是 API 写错、参数名写错，或者当前系统版本不支持这个参数。",
//            solution: "对照文档或 Xcode 自动补全，删除多余参数，或改成当前 API 支持的写法。",
//            wrongCode: """
//            Text("Hello", color: .blue)
//            """,
//            correctCode: """
//            Text("Hello")
//                .foregroundColor(.blue)
//            """
//        ),
//        
//        ErrorLibraryItem(
//            id: "multiple-commands-produce",
//            title: "Multiple commands produce Info.plist",
//            summary: "多个构建命令生成了同一个文件。",
//            category: .xcode,
//            tags: ["Info.plist", "Build", "Target"],
//            reason: "通常是 Info.plist 被错误加入了 Copy Bundle Resources，或者项目重命名、Target 配置混乱后产生了重复构建输出。",
//            solution: "打开 Target → Build Phases → Copy Bundle Resources，检查是否包含 Info.plist。如果有，删除它。然后清理构建文件夹并重新编译。",
//            wrongCode: nil,
//            correctCode: nil
//        ),
//        
//        ErrorLibraryItem(
//            id: "app-store-guideline-525",
//            title: "Guideline 5.2.5 - Legal - Intellectual Property",
//            summary: "App 元数据可能与 Apple 产品或商标混淆。",
//            category: .appStore,
//            tags: ["App Store", "审核", "商标"],
//            reason: "App 名称、副标题、图标、截图或关键词可能使用了 Apple 的产品名、商标元素，导致审核认为容易与 Apple 官方产品或服务混淆。",
//            solution: "减少在名称、副标题、图标和关键词中使用 Apple 商标词。课程内容中可以描述技术主题，但元数据要避免看起来像 Apple 官方产品。",
//            wrongCode: nil,
//            correctCode: nil
//        )
//    ]
//}
//
//// MARK: - Preview
//
//struct ErrorLibraryView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ErrorsView()
//        }
//    }
//}
