//
//  PreviewView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct PreviewView: View {
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
            // 如果输入内容为空，或者组件名称、副标题、介绍和输入内容相匹配，返回 true
            let matchSearch =
            searchText.isEmpty ||
            item.name.localizedCaseInsensitiveContains(searchText) ||
            item.subtitle.localizedCaseInsensitiveContains(searchText) ||
            item.description.localizedCaseInsensitiveContains(searchText)
            
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
        VStack {
            
            // 分类组件
            categoryBar
            
            // 组件列表
            ScrollView {
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
            
            // 防止搜索内容为空时，类别从顶部掉下来
            Spacer()
        }
        .searchable(
            text: $searchText,
            prompt: "Search components..."
        )
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
    
    // 分类组件
    private var categoryBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                categoryButton(title: "All", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                
                ForEach(PreviewCategory.allCases) { category in
                    categoryButton(title: category.title, isSelected: selectedCategory == category) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.vertical, 2)
        }
    }
    
    // 分类按钮
    private func categoryButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(LocalizedStringKey(title))
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

#Preview {
    NavigationView {
        PreviewView()
    }
}
