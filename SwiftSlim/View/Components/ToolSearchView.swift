//
//  ToolSearchView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

import SwiftUI

struct ToolSearchView: View {
    var tool: ToolType
    var searchTips: String
    @Binding var searchText: String
    var body: some View {
        VStack(spacing: 20) {
            
            // 标题组件
            headerView
            
            // 搜索组件
            searchBar
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
            
            TextField(searchTips, text: $searchText)
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
}
