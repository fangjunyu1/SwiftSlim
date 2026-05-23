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
    // 显示会员视图
    @State private var showProView = false
    
    let columns = [
        GridItem(.adaptive(minimum: 90, maximum: 140), spacing: 20, alignment: .leading)
    ]
    
    // 免费用户限制的图标数量
    private static let freeLimit = 200
    
    // 全部可用的 Symbols
    private static let supportedSymbols: [SingleSymbols] = SingleSymbols.listSymbols.filter {
        UIImage(systemName: $0.name) != nil
    }
    
    // 免费图标名称集合（用户判断是否为免费图标）
    private static let freeSymbolNames: Set<String> = {
        Set(Self.supportedSymbols.prefix(Self.freeLimit).map { $0.name })
    }()
    
    // 判断是否锁定样式
    private func isLocked(_ symbol: SingleSymbols) -> Bool {
        !appStorage.isValidMember && !Self.freeSymbolNames.contains(symbol.name)
    }
    
    // SF Symbols 数据源
    // 会员返回全部可用 Symbols，非会员限制对应的 SF Symbols
    var symbolSource: [SingleSymbols] {
        if appStorage.isValidMember {
            return Self.supportedSymbols
        }
        
        // 当用户没有搜索或者分类时，仅显示可用的 SF Symbols
        // 而不是显示所有需解锁的图标，会给用户带来压力
        if searchText.isEmpty && selectedCategory == nil {
            return Array(Self.supportedSymbols.prefix(Self.freeLimit))
        }
        
        return Self.supportedSymbols
    }
    
    var filteredSymbols: [SingleSymbols] {
        
        // 计算兼容的版本类型
        var compatibleCategory:[SymbolsVersion]
        
        // 根据分类计算兼容的版本类型
        if let selectedCategory = selectedCategory {
            compatibleCategory = selectedCategory.compatibleVersion
        } else {
            compatibleCategory = SymbolsVersion.allCases
        }
        
        // 返回筛选后的 SF Symbols
        return symbolSource.filter { item in
            
            // 如果没有选择搜索类型
            // 或者当前搜索类型和当前组件类型一致
            // 或者当前搜索类型高于其他搜索类型时
            // 则类型返回 true
            let matchCategory = compatibleCategory.contains(item.version)
            
            // 本地化名称和关键词数组
            let localizedKeywords = item.keywords.map {
                NSLocalizedString($0, tableName: "Symbols", comment: "")
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
                    SymbolsItemView(symbol: symbol, isLocked: isLocked(symbol)) {
                        showProView = true
                    }
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
        .sheet(isPresented: $showProView) {
            ProView()
                .safeAreaInset(edge: .top) {
                    Spacer().frame(height: 50)
                }
        }
    }
}

#Preview {
    SymbolsView()
        .environmentObject(AppStorageManager.shared)
}
