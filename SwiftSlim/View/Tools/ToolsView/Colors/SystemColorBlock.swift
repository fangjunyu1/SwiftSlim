//
//  SystemColorBlock.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

struct SystemColorBlock: View {
    @State private var isCopied = false
    // Fix: 用 Int 计数器替代 Date() Hack，语义更清晰
    @State private var tapCount = 0
    @State private var isScale = false

    var color: SystemColor

    private var needsBorder: Bool {
        color == .white || color == .clear
    }

    var body: some View {
        Button {
            UIPasteboard.general.string = color.hexColor
            isCopied = true
            tapCount += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                isCopied = false
            }
        } label: {
            VStack(spacing: 8) {
                Circle()
                    .fill(color.color)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 0.5)
                    .overlay {
                        Image(systemName: "checkmark")
                            .foregroundStyle(needsBorder ? .black : .white)
                            .opacity(isCopied ? 1 : 0)
                    }
                Text(color.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("BlackColor"))
                Text(color.hexColor)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .frame(height: 110)
            .frame(maxWidth: .infinity)
            .background(Color("WhiteAndBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 0.5)
            .scaleEffect(isScale ? 0.9 : 1)
            .onChange(of: tapCount) { _ in
                withAnimation(.easeIn(duration: 0.1)) { isScale = true }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation { isScale = false }
                }
            }
        }
    }
}
