//
//  ToolHeaderView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

import SwiftUI

struct ToolHeaderView: View {
    var tool: ToolType
    var body: some View {
        // 标题组件
        headerView
            .padding(.bottom, 10)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(LocalizedStringKey(tool.title))
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Text(LocalizedStringKey(tool.description))
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }
        .padding(.top, 12)
    }
    
}
