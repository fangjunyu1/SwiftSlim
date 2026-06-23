//
//  CodableGeneratorView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/13.
//

import SwiftUI

struct CodableGeneratorView: View {
    @EnvironmentObject var appStorage: AppStorageManager

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                    ToolHeaderView(tool: .Models)
            }
            .padding(.bottom, 40)
        }
        .navigationTitle("Models")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
}

#Preview {
    NavigationView {
        CodableGeneratorView()
            .environmentObject(AppStorageManager.shared)
    }
}
