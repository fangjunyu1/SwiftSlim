//
//  RootView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/10.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    var body: some View {
        ZStack {
            if appStorage.hasCompletedOnboarding {
                // 主视图
                ContentView()
                    .transition(.opacity)
            } else {
                // 引导页
                OnboardingView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: appStorage.hasCompletedOnboarding)
//        .onAppear {
//            // 测试引导页，测试后必须删除 ！！！
//            #if DEBUG
//            appStorage.hasCompletedOnboarding = false
//            #endif
//        }
    }
}

#Preview {
    return RootView()
        .environmentObject(AppStorageManager.shared)
}
