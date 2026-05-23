//
//  CurrentPlanView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/23.
//

import SwiftUI

struct CurrentPlanView: View {
    @EnvironmentObject var appStorage: AppStorageManager

    private var expirationDateString: String {
        Date(timeIntervalSince1970: appStorage.expirationDate)
            .formatted(date: .abbreviated, time: .omitted)
    }

    var body: some View {
        VStack {
            // 当前方案
            HStack {
                Text("Current Plan")
                    .modifier(FootnoteGrayText())
                Spacer()
            }
            
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
                .frame(height: 60)
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
                .frame(height: 60)
                .modifier(Pro2Bg())
            }
        }
    }
}
