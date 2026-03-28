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
    @State private var isHovering = false
    @State private var copied = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // 顶部栏：语言标签 + 复制按钮
            HStack {
                if let language = configuration.language, !language.isEmpty { Text(language.capitalized) .font(.footnote) .foregroundColor(.secondary) .padding(.leading, 12)
                }
                Spacer()
                Button(action: copyCode) {
                    HStack(spacing: 4) {
                        Image(copied ? "checkmark" : "copy")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 12)
                        Text(copied ? "Copied" : "Copy")
                    }
                    .font(.footnote)
                    .foregroundColor(copied ? Color(.systemGray) : .secondary)
                }
                .animation(.spring(response: 0.3), value: copied)
                .padding(12)
                .hoverEffect(.lift)
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
