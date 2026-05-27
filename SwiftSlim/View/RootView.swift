//
//  RootView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/10.
//

import SwiftUI

struct RootView: View {
    @State private var selected = contentType.home
    @StateObject private var appUIState = AppUIState()
    
    @EnvironmentObject var appStorage: AppStorageManager
    
    private var shouldShowFrostedTabView: Bool {
        if UIDevice.isPhone {
            return appUIState.isTabViewVisible
        } else {
            return true
        }
    }
    
    var body: some View {
        ZStack {
            if appStorage.hasCompletedOnboarding {
                if UIDevice.isPhone {
                    phoneLayout
                } else if !appStorage.minimalMode {
                    phoneLayout
                } else {
                    sidebarLayout
                }
            } else {
                OnboardingView()
                    .transition(.opacity)
            }
        }
        .environmentObject(appUIState)
        .animation(.easeInOut(duration: 0.25), value: appStorage.hasCompletedOnboarding)
    }
    
    
    // MARK: - iPhone：悬浮导航栏
    private var phoneLayout: some View {
        NavigationView {
            ZStack {
                mainContent
                
                if shouldShowFrostedTabView {
                    ContentFrostedTabView(selectedTab: $selected)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            StandbyView()
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
