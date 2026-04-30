//
//  SymbolsItemView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/30.
//

import SwiftUI

struct SymbolsItemView: View {
    @State private var didCopy = false
    var symbol: SingleSymbols
    
    var body: some View {
        Button(action: copyCode) {
            VStack(spacing: 16) {
                Image(systemName: symbol.name)
                    .font(.system(size: 22).weight(.bold))
                    .imageScale(.large)
                    .foregroundStyle(Color.accentColor)
                Text(symbol.name)
                    .modifier(NotesText())
                    .lineLimit(1)
                    .frame(width: 60)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color("WhiteAndBlack"))
            .overlay {
                if didCopy {
                    ZStack {
                        Color.accentColor
                        Image(systemName: "checkmark")
                            .font(.system(size: 24).bold())
                            .foregroundStyle(.white)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 0.5)
        }
    }
    
    private func copyCode() {
        UIPasteboard.general.string = symbol.name
        withAnimation(.easeInOut(duration: 0.2)) { didCopy = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) { didCopy = false }
        }
    }
}
