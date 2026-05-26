//
//  ContentView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//

import SwiftUI

struct ContentView: View {
    @Binding var selected: contentType
    
//    init(selected: contentType) {
//        UITabBar.appearance().isHidden = true
//        self.selected = selected
//    }
    
    var body: some View {
        ZStack {
            switch selected {
            case .home:
                HomeView(selected: $selected)
                    .modifier(BackgroundModifiers())
            case .courses:
                CoursesView(selected: $selected)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("BackgroundColor"))
                    .ignoresSafeArea(.container, edges: .bottom)
            case .tools:
                ToolsView(selected: $selected)
                    .modifier(BackgroundModifiers())
            case .settings:
                SettingsView(selected: $selected)
                    .modifier(BackgroundModifiers())
            case .notifications:
                NotificationView()
            }
        }
    }
}

struct StandbyView: View {
    var body: some View {
        VStack {
            Image("app0")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(Color.gray.opacity(0.3))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(BackgroundModifiers())
    }
}

struct NavigationTabView<Content: View>: View {
    let content: Content
    @Binding var selected: contentType
    
    init(selected: Binding<contentType>, content: () -> Content) {
        self.content = content()
        self._selected = selected
    }
    
    var body: some View {
        NavigationView {
            content
                .modifier(BackgroundModifiers())
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    RootView()
        .environmentObject(AppStorageManager.shared)
        .environmentObject(IAPManager.shared)
}
