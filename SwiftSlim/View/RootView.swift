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
    }
}

#Preview {
    return RootView()
        .environmentObject(AppStorageManager.shared)
}
