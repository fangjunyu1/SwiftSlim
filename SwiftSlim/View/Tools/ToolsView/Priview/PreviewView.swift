//
//  PreviewView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct PreviewView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    // 所有视图组件
    private let components = PreviewComponent.all
    
    // 搜索类型和内容
    @State private var selectedCategory: PreviewCategory? = nil
    @State private var searchText = ""
    
    // 输入搜索内容，筛选后的组件
    var filteredComponents: [PreviewComponent] {
        components.filter { item in
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
                                    PreviewItemView(item: item)
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
    }
}

#Preview {
    NavigationView {
        PreviewView()
    }
}
