//
//  GradientsColorBlock.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

struct GradientsColorBlock: View {
    @State private var isCopied = false
    var gColor: GradientsColor

    private func copyCode() {
        UIPasteboard.general.string = gColor.code
        withAnimation(.easeInOut(duration: 0.2)) { isCopied = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) { isCopied = false }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading) {
                    Text(gColor.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("BlackColor"))
                    Text(LocalizedStringKey(gColor.title))
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Button(action: copyCode) {
                    Text(isCopied ? "Copied" : "Copy")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }
            }

            Divider()

            HStack {
                Text(LocalizedStringKey(gColor.describe))
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Spacer()
            }

            gColor.view
                .frame(height: 80)
                .frame(maxWidth: .infinity)

            codeCard
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 0.5)
    }

    private var codeCard: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(gColor.code)
                .font(.system(size: 13, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
        }
        .background(Color.black.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}
