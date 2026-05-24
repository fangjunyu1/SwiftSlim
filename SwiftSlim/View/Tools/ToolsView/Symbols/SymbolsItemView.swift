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
    var isLocked: Bool
    let onLockedTap: () -> Void
    
    var body: some View {
        Button(action: handleTap) {
            VStack(spacing: 16) {
                Image(systemName: symbol.name)
                    .font(.system(size: 22).weight(.bold))
                    .imageScale(.large)
                    .foregroundStyle(isLocked ? Color.gray : Color.accentColor)
                Text(isLocked ? "••••••" : symbol.name)
                    .modifier(Caption2Text())
                    .lineLimit(1)
                    .frame(width: 60)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color("WhiteAndBlack"))
            .overlay {
                if isLocked {
                VStack {
                    HStack {
                        Spacer()
                        HStack(spacing: 3) {
                            Text(verbatim:"PRO")
                                .font(.system(size: 8))
                        }
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 8)
                        .background(Color(hex: "FF8140"))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding(3)
                    }
                    Spacer()
                }
                }
            }
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
        .buttonStyle(.plain)
    }
    
    private func handleTap() {
        // 如果图标为锁定状态，则不执行复制代码
        if isLocked {
            print("当前图标为锁定状态")
            
            // 触发震动
            HapticManager.shared.selectionChanged()
            
            // 调用闭包，弹出高级会员视图
            onLockedTap()
            return
        }
        
        copyCode()
    }
    private func copyCode() {
        // 触发振动
        HapticManager.shared.selectionChanged()
        UIPasteboard.general.string = symbol.name
        
        withAnimation(.easeInOut(duration: 0.2)) { didCopy = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) { didCopy = false }
        }
    }
}


#Preview {
    SymbolsItemView(
            symbol: SingleSymbols.listSymbols[0],
            isLocked: true,
            onLockedTap: {
                print("打开 PRO 页面")
            }
        )
        .environmentObject(AppStorageManager.shared)
}
