//
//  ToolCategoryView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

import SwiftUI

struct ToolCategoryView<Category: CategoryItem>: View {
    var tool: ToolType
    var searchTips: String
    @Binding var searchText: String
    @Binding var selectedCategory: Category?
    var body: some View {
        VStack(spacing: 20) {
            
            // 标题组件
            headerView
            
            // 搜索组件
            searchBar
            
            // 分类组件
            categoryBar
        }
    }
    
    private var headerView: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .center) {
                    Text(LocalizedStringKey(tool.title))
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.primary)
                }
                Text(LocalizedStringKey(tool.description))
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(tool.img)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 45,height: 45)
                .foregroundStyle(tool.color)
                .padding(10)
                .background(tool.bgColor.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .padding(.top, 12)
    }
    
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
            
            TextField(LocalizedStringKey(searchTips), text: $searchText)
                .font(.system(size: 15))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    
    var categoryBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                categoryButton(title: "All", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                
                ForEach(Array(Category.allCases)) { category in
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
