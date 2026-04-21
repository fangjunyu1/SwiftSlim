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
        
        TabView(selection: $selected) {
            NavigationTabView(selected: $selected) {
                HomeView(selected: $selected)
            }
            .tag(contentType.home)
            
            NavigationTabView(selected: $selected) {
                CoursesView(selected: $selected)
            }
            .tag(contentType.courses)
            
            NavigationTabView(selected: $selected) {
                ToolsView(selected: $selected)
            }
            .tag(contentType.tools)
            
            NavigationTabView(selected: $selected) {
                SettingsView(selected: $selected)
            }
            .tag(contentType.settings)
        }
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
            ZStack {
                content
                    .modifier(BackgroundModifiers())
                
                ContentFrostedTabView(selectedTab: $selected)
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
