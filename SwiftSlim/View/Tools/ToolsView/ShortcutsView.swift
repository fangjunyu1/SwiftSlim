//
//  ShortcutsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct ShortcutKey: Identifiable {
    var id: String {
        name
    }
    var name: String
    var key: [String]
    
    // 预览
    static var PreviewList: [ShortcutKey] = [
        ShortcutKey(name: "Show/Hide Canvas", key: ["⌘","⌥","↩\u{FE0E}"]),
        ShortcutKey(name: "Refresh Preview", key: ["⌘","⌥","P"])
    ]
    
    // 搜索
    static var SearchList: [ShortcutKey] = [
        ShortcutKey(name: "Current File Search", key: ["⌘","F"]),
        ShortcutKey(name: "Project Search", key: ["⇧","⌘","F"]),
        ShortcutKey(name: "Quick Open", key: ["⇧","⌘","O"]),
        ShortcutKey(name: "Command Search", key: ["⇧","⌘","A"])
    ]
    
    // 编辑
    static var EditList: [ShortcutKey] = [
        ShortcutKey(name: "Comment/Uncomment", key: ["⌘","/"]),
        ShortcutKey(name: "Re-Indent", key: ["⌃","I"])
    ]
    
    // 运行
    static var RunList: [ShortcutKey] = [
        ShortcutKey(name: "Build Project", key: ["⌘","B"]),
        ShortcutKey(name: "Run Project", key: ["⌘","R"]),
        ShortcutKey(name: "Stop", key: ["⌘","."]),
        ShortcutKey(name: "Clean Build", key: ["⇧","⌘","K"])
    ]
    
    // 测试和调试
    static var TestDebugList: [ShortcutKey] = [
        ShortcutKey(name: "Add Breakpoint", key: ["⌘","\\"]),
        ShortcutKey(name: "Clear Console", key: ["⌘","K"]),
        ShortcutKey(name: "Show/Hide Debug Area", key: ["⇧","⌘","Y"])
    ]
}

struct ShortcutsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 预览视图
                ShortcutsItemView(title: "tool_Preview", list: ShortcutKey.PreviewList)
                
                // 搜索视图
                ShortcutsItemView(title: "Search", list: ShortcutKey.SearchList)
                
                // 编辑视图
                ShortcutsItemView(title: "Edit", list: ShortcutKey.EditList)
                
                // 运行视图
                ShortcutsItemView(title: "Run", list: ShortcutKey.RunList)
                
                // 测试和调试视图
                ShortcutsItemView(title: "Test & Debug", list: ShortcutKey.TestDebugList)
            }
        }
        .navigationTitle("Shortcuts")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
}

struct ShortcutsItemView: View {
    var title: String
    var list: [ShortcutKey]
    var body: some View {
        VStack {
            // 标题
            HStack {
                Text(LocalizedStringKey(title))
                    .modifier(PromptText())
                Spacer()
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 16)
            
            // 列表
            VStack(spacing: 12) {
                ForEach(Array(list.enumerated()), id: \.offset) { index, item in
                    HStack {
                        Text(LocalizedStringKey(item.name))
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Spacer()
                        ForEach(item.key, id:\.self) { key in
                            Text(verbatim: key)
                                .font(.footnote)
                                .frame(width: 26, height: 26)
                                .background(Color("LightDrak"))
                                .cornerRadius(5)
                                .shadow(radius: 1)
                        }
                    }
                    if index != list.count - 1 {
                        Divider()
                    }
                }
            }
            .padding(20)
            .background(Color("WhiteAndBlack"))
            .cornerRadius(20)
        }
    }
}

#Preview {
    NavigationView {
        ShortcutsView()
    }
}
