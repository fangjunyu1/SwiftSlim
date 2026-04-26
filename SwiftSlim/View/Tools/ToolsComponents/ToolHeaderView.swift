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
}
