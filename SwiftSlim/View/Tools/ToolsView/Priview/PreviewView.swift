//
//  PreviewView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct PreviewView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @EnvironmentObject var iapManager: IAPManager
    // 所有视图组件
    private let components = PreviewComponent.all
    
    // 搜索类型和内容
    @State private var selectedCategory: PreviewCategory? = nil
    @State private var searchText = ""
    
    // 显示 Pro 视图
    @State private var showProView = false
    
    // 组件数据源
    // 会员返回全部可用组件，非会员限制组件的显示
    private var previewSource: [PreviewComponent] {
        if appStorage.isValidMember {
            return components
        }
        
        // 当用户没有搜索或者分类时，仅显示可用的组件预览
        // 而不是显示所有需解锁的组件，会给用户带来压力
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && selectedCategory == nil {
            return components.filter { item in !isLocked(item) }
        }
        
        return components
    }
    
    // 输入搜索内容，筛选后的组件
    var filteredComponents: [PreviewComponent] {
        
        previewSource.filter { item in
            // 如果没有选择搜索类型，或者当前搜索类型和当前组件类型一致，则类型返回 true
            let matchCategory = selectedCategory == nil || item.category == selectedCategory
            let localizedSubtitle = NSLocalizedString(item.subtitle, comment: "")
            let localizedDescription = NSLocalizedString(item.description, comment: "")
            // 如果输入内容为空，或者组件名称、副标题、介绍和输入内容相匹配，返回 true
            let matchSearch =
            searchText.isEmpty ||
            item.name.localizedCaseInsensitiveContains(searchText) ||
            localizedSubtitle.localizedCaseInsensitiveContains(searchText) ||
            localizedDescription.localizedCaseInsensitiveContains(searchText)
            
            return matchCategory && matchSearch
        }
    }
    
    // 筛选后的分类
    var displayedCategories: [PreviewCategory] {
        if let selectedCategory {
            return [selectedCategory]
        } else {
            return PreviewCategory.allCases
        }
    }
    
    // 判断是否锁定
    private func isLocked(_ item: PreviewComponent) -> Bool {
        guard !appStorage.isValidMember else { return false }
        
        // 获取分类下所有组件
        let itemsInCategory = PreviewComponent.all.filter {
            $0.category == item.category
        }
        
        // firstIndex 匹配当前组件在分类下的序号
        // 匹配失败则返回 false，不锁定
        guard let index = itemsInCategory.firstIndex(where: { $0.id == item.id }) else {
            return false
        }
        
        // 如果当前序号大于等于分类免费数量，则锁定
        return index >= item.category.freeLimit
    }
    
    var body: some View {
        ScrollView {
            // 导航组件
            ToolCategoryView(tool: .Preview, searchTips: "Search components...", searchText: $searchText, selectedCategory: $selectedCategory)
            
            // 组件列表
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(displayedCategories) { category in
                    let items = filteredComponents.filter { $0.category == category }
                    if !items.isEmpty {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(LocalizedStringKey(category.title))
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text(LocalizedStringKey(category.subtitle))
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal, 10)
                            // 视图预览组件
                            LazyVStack(spacing: 18) {
                                ForEach(items) { item in
                                    #if DEBUG
                                    PreviewItemView(item: item, isLocked: isLocked(item)) {
                                        showProView = true
                                    }
                                    #else
                                    PreviewItemView(item: item, isLocked: isLocked(item)) {
                                        showProView = true
                                    }
                                    #endif
                                }
                            }
                        }
                        .padding(.vertical, 20)
                    }
                }
            }
        }
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
        .sheet(isPresented: $showProView) {
            ProView(showCloseButton: true)
                .environmentObject(appStorage)
                .environmentObject(iapManager)
        }
    }
}

#Preview {
    NavigationView {
        PreviewView()
            .environmentObject(AppStorageManager.shared)
            .environmentObject(IAPManager.shared)
    }
}
