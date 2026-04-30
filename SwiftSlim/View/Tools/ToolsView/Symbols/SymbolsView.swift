//
//  SymbolsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

struct SymbolsView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    // 搜索类型和内容
    @State private var selectedCategory: SymbolsVersion? = nil
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 90, maximum: 140), spacing: 20, alignment: .leading)
    ]
    
    let filtered = SingleSymbols.listSymbols.filter {
        UIImage(systemName: $0.name) != nil
    }

    var availableSymbols: [SingleSymbols] {
        Array(filtered.prefix(200))
    }
    
    var filteredSymbols: [SingleSymbols] {
        
        // 计算兼容的版本类型
        var compatibleCategory:[SymbolsVersion]
        
        if let selectedCategory = selectedCategory {
            compatibleCategory = selectedCategory.compatibleVersion
        } else {
            compatibleCategory = SymbolsVersion.allCases
        }
        
        // 返回筛选后的 SF Symbols
        return availableSymbols.filter { item in
            // 如果没有选择搜索类型，或者当前搜索类型和当前组件类型一致，或者当前搜索类型高于其他搜索类型时，则类型返回 true
            
            let matchCategory = compatibleCategory.contains(item.version)
            
            // 本地化名称和关键词数组
            let localizedKeywords = item.keywords.map {
                NSLocalizedString($0, comment: "")
            }
            
            // 如果输入内容为空，或者 Symbols 的英文名称、本地化描述和输入内容相匹配，返回 true
            let matchSearch =
            searchText.isEmpty ||
            item.name.localizedCaseInsensitiveContains(searchText) ||
            item.keywords_en.contains { $0.localizedCaseInsensitiveContains(searchText) } ||
            localizedKeywords.contains { $0.localizedCaseInsensitiveContains(searchText) }
            
            return matchCategory && matchSearch
            
        }
    }
    
    var body: some View {
        ScrollView {
            // 导航组件
            ToolCategoryView(tool: .Symbols, searchTips: "Search icons...", searchText: $searchText, selectedCategory: $selectedCategory)
            // 图标
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredSymbols) { symbol in
                    SymbolsItemView(symbol: symbol)
                }
            }
            .padding(.vertical, 30)
        }
        .navigationTitle("Symbols")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
}

#Preview {
    SymbolsView()
        .environmentObject(AppStorageManager.shared)
}
