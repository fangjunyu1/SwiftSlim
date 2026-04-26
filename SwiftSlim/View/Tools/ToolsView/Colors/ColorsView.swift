//
//  ColorsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/25.
//

import SwiftUI

struct ColorsView: View {
    let columns = [
        GridItem(.adaptive(minimum: 90, maximum: 120), spacing: 10, alignment: .leading)
    ]

    var body: some View {
        ScrollView {
            ToolHeaderView(tool: .Colors)
            VStack(spacing: 30) {
                // 系统颜色
                VStack(alignment: .leading, spacing: 10) {
                    sectionTitle("System Colors")
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(SystemColor.allCases) { color in
                            SystemColorBlock(color: color)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // 语义颜色
                VStack(alignment: .leading, spacing: 10) {
                    sectionTitle("Semantic Colors")
                    VStack(spacing: 20) {
                        ForEach(Array(SemanticColor.allCases.enumerated()), id: \.offset) { index, color in
                            SemanticColorBlock(sColor: color)
                            if index != SemanticColor.allCases.count - 1 {
                                Divider()
                            }
                        }
                    }
                    .padding(20)
                    .background(Color("WhiteAndBlack"))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 0.5)
                }

                // 渐变颜色
                VStack(alignment: .leading, spacing: 10) {
                    sectionTitle("Gradient Colors")
                    VStack(spacing: 20) {
                        ForEach(Array(GradientsColor.allCases.enumerated()), id: \.offset) { index, color in
                            GradientsColorBlock(gColor: color)
                        }
                    }
                }
            }
            .padding(.vertical, 16)
        }
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }

    // 提取为私有方法，避免重复代码
    private func sectionTitle(_ name: String) -> some View {
        HStack {
            Text(LocalizedStringKey(name))
                .modifier(PromptText())
            Spacer()
        }
    }
}

#Preview {
    ColorsView()
}
