//
//  ProductResultView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/22.
//

import SwiftUI

struct ProductResultView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @Environment(\.dismiss) var dismiss
    let result: ProductResultEnum
    
    // 当前方案、选择方案的选项高度
    private let buttonHeight: Double = 60
    
    private var expirationDateString: String {
        Self.formatExpirationDate(appStorage.expirationDate)
    }
    
    // 格式化显示日期
    private static func formatExpirationDate(_ timestamp: TimeInterval) -> String {
        Date(timeIntervalSince1970: timestamp)
            .formatted(date: .abbreviated, time: .omitted)
    }
    
    // Lottie 动画
    var LottieName: String? {
        switch result {
        case .purchase_Success, .restore_Success:
            "check"
        case .purchase_Failed, .restore_Failed:
            "checkmark"
        case .stateless:
            nil
        }
    }
    
    // 完成状态
    var ResultName: LocalizedStringKey? {
        switch result {
        case .purchase_Success:
            "Purchased"
        case .purchase_Failed:
            "Purchase Failed"
        case .restore_Success:
            "Restored"
        case .restore_Failed:
            "Restore Failed"
        case .stateless:
            nil
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                lottie
                proTitle
                proInfo
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                proButton
                Spacer()
            }
            .padding(.top, 50)
        }
        .modifier(Background2Modifiers())
    }
    
    @ViewBuilder
    var lottie: some View {
        // Lottie 动画
        if let LottieName = LottieName {
            LottieView(filename: LottieName)
                .modifier(LottieModifier())
        }
    }
    
    var proTitle: some View {
        VStack(spacing: 16) {
            // 完成状态
            if let ResultName = ResultName {
                Text(ResultName)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            
            // 高级会员
            Text("Pro")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(Color("AppColor2"))
        }
    }
    
    // 会员信息
    var proInfo: some View {
        VStack {
            if Date(timeIntervalSince1970: appStorage.expirationDate) > Date() {
                // 高级会员
                HStack {
                    Text("Pro")
                        .fontWeight(.medium)
                    Spacer()
                    // 到期时间
                    VStack(alignment: .trailing) {
                        Text("Expiration Date")
                        Text(expirationDateString)
                    }
                    .modifier(FootnoteGrayText())
                }
                .frame(height: buttonHeight)
                .modifier(Pro2Bg())
            }
            if appStorage.isLifetime {
                // 终身
                HStack {
                    Text("Lifetime Pro")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Lifetime Access")
                        .modifier(FootnoteGrayText())
                }
                .frame(height: buttonHeight)
                .modifier(Pro2Bg())
            }
        }
    }
    
    // 按钮
    var proButton: some View {
        // 完成
        Button(action: {
            // 振动
            HapticManager.shared.selectionChanged()
            dismiss()
        }, label: {
            Text("Done")
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .frame(width: 240,height: 60)
                .background(Color(hex: "3477F5"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        })
    }
}

#Preview {
    PreviewProView()
}
