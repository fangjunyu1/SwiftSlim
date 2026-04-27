//
//  ContentView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = contentType.home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
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
                    }
                
                // 磨砂玻璃 TabView 视图
                ContentFrostedTabView(selectedTab: $selected)
            }
        }
        .navigationViewStyle(.stack)
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
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
