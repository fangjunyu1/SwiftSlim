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
}

struct ShortcutsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 预览视图
                ShortcutsItemView(title: "tool_Preview", list: ShortcutKey.PreviewList)
                
                // 搜索视图
                ShortcutsItemView(title: "Search", list: ShortcutKey.SearchList)
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
                                .background(Color(hex: "F3F3F3"))
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
            .background()
            .cornerRadius(20)
        }
    }
}

#Preview {
    NavigationView {
        ShortcutsView()
    }
}
