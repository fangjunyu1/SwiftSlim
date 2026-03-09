//
//  CodeBlockWithCopyButton.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/3/9.
//

import SwiftUI
import MarkdownUI

struct CodeBlockWithCopyButton: View {
    let configuration: CodeBlockConfiguration
    @State private var copied = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // 顶部栏：语言标签 + 复制按钮
            HStack {
                Button(action: copyCode) {
                    HStack(spacing: 4) {
                        Image(systemName: copied ? "checkmark" : "doc.on.doc")
                        Text(copied ? "已复制" : "复制")
                    }
                    .font(.caption)
                    .foregroundColor(copied ? .green : .secondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                }
                .animation(.spring(response: 0.3), value: copied)
                .padding(.trailing, 8)
                .padding(.vertical, 6)
            }
            .background(Color(.systemGray5))

            Divider()

            // 代码内容（横向可滚动）
            ScrollView(.horizontal, showsIndicators: false) {
                configuration.label
                    .textSelection(.enabled)
                    .relativeLineSpacing(.em(0.25))
                    .markdownTextStyle {
                        FontFamilyVariant(.monospaced)
                        FontSize(.em(0.85))
                    }
                    .padding(12)
            }
        }
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.systemGray4), lineWidth: 0.5)
        )
        .markdownMargin(top: 16, bottom: 16)
    }

    private func copyCode() {
        UIPasteboard.general.string = configuration.content
        withAnimation(.spring(response: 0.3)) {
            copied = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.spring(response: 0.3)) {
                copied = false
            }
        }
    }
}

#Preview {
    NavigationView {
        Education()
    }
}
