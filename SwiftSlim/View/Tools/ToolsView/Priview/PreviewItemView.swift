//
//  PreviewItemView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

struct PreviewItemView: View {
    let item: PreviewComponent
    
    @State private var didCopy = false
    
    var isLocked: Bool
    var onLockedTap:() -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
            Divider()
            descriptionView
            previewCard
            codeCard
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
    }
    
    // 组件头部
    private var headerView: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 22, weight: .bold))
                
                Text(LocalizedStringKey(item.subtitle))
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // 复制按钮
            Button(action: handleCopyButtonTap) {
                if isLocked {
                    Text(verbatim: "PRO")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(hex: "FF8140"))
                        .clipShape(Capsule())
                } else {
                    Text(didCopy ? "Copied" : "Copy")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
        }
    }
    
    // 组件描述
    private var descriptionView: some View {
        Text(LocalizedStringKey(item.description))
            .font(.system(size: 14))
            .foregroundColor(.secondary)
    }
    
    // 预览卡片
    private var previewCard: some View {
        VStack(spacing: 12) {
            PreviewItemDemoView(item: item)
        }
        .padding(18)
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .disabled(isLocked)
    }
    
    // 锁定代码视图
    private var lockedCodeCard: some View {
        Button(action: onLockedTap) {
            ZStack {
                GeometryReader { geo in
                    let contentWidth = max(0, geo.size.width - 36)
                    let ratios: [CGFloat] = [0.55, 0.80, 0.68, 0.92, 0.46]
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<5, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.secondary.opacity(index == 0 ? 0.22 : 0.14))
                                .frame(
                                    width: contentWidth * ratios[index],
                                    height: 10
                                )
                        }
                    }
                    .padding(18)
                    .blur(radius: 1.2)
                    .opacity(0.75)
                }
                .frame(height: 118)
                
                HStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 12, weight: .bold))
                    
                    Text("Unlock Code")
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 14)
                .padding(.vertical, 9)
                .background(Color(hex: "FF8140"))
                .clipShape(Capsule())
            }
            .background(Color.black.opacity(0.04))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(.plain)
    }
    
    // 代码卡片
    private var codeCard: some View {
        Group {
//            #if DEBUG
//            ScrollView(.horizontal, showsIndicators: false) {
//                Text(item.code)
//                    .font(.system(size: 13, design: .monospaced))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(16)
//                
//            }
//            .background(Color.black.opacity(0.04))
//            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//            #else
            if isLocked {
                lockedCodeCard
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    Text(item.code)
                        .font(.system(size: 13, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                    
                }
                .background(Color.black.opacity(0.04))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
//            #endif
        }
    }
    
    // 点击手势
    private func handleCopyButtonTap() {
        // 如果图标为锁定状态，则不执行复制代码
        if isLocked {
            print("当前组件为锁定状态")
            
            // 触发震动
            HapticManager.shared.selectionChanged()
            
            // 调用闭包，弹出高级会员视图
            onLockedTap()
            return
        }
        
        // 复制代码
        copyCode()
    }
    
    // 复制代码
    private func copyCode() {
        // 触发振动
        HapticManager.shared.selectionChanged()
        
        UIPasteboard.general.string = item.code
        
        withAnimation(.easeInOut(duration: 0.2)) {
            didCopy = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) {
                didCopy = false
            }
        }
    }
}

#Preview {
    NavigationView {
        PreviewView()
            .environmentObject(AppStorageManager.shared)
            .environmentObject(IAPManager.shared)
    }
}

