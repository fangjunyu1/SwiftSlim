//
//  RootView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/10.
//

import SwiftUI

struct RootView: View {
    @State private var selected = contentType.home
    @EnvironmentObject var appStorage: AppStorageManager
    var body: some View {
        ZStack {
            if appStorage.hasCompletedOnboarding {
                if UIDevice.isPhone {
                    phoneLayout
                } else {
                    sidebarLayout
                }
            } else {
                OnboardingView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: appStorage.hasCompletedOnboarding)
    }
    
    
    // MARK: - iPhone：悬浮导航栏
    private var phoneLayout: some View {
        NavigationView {
            ZStack {
                mainContent
                
                // 仅 iOS 可以显示底部 TabView
                // iPad、MacOS 的 TabView 在外层
                if appStorage.hasCompletedOnboarding {
                    ContentFrostedTabView(selectedTab: $selected)
                }
            }
        }
    }
    
    // MARK: - iPad / Mac：左侧导航栏
    private var sidebarLayout: some View {
        NavigationView {
            ContentSidebarTabView(selectedTab: $selected)
            mainContent
        }
    }
    
    // MARK: - 主内容
    
    @ViewBuilder
    private var mainContent: some View {
        ContentView(selected: $selected)
            .transition(.opacity)
    }
}

#Preview {
    RootView()
        .environmentObject(AppStorageManager.shared)
        .environmentObject(IAPManager.shared)
}
