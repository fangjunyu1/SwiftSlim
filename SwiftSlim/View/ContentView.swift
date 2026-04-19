//
//  ContentView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = contentType.home
    var body: some View {
        
        ZStack {
            TabView(selection: $selected) {
                NavigationView {
                    HomeView(selected: $selected)
                        .modifier(BackgroundModifiers())
                }
                .navigationViewStyle(.stack)
                .tag(contentType.home)
                
                
                NavigationView {
                    CoursesView(selected: $selected)
                        .modifier(BackgroundModifiers())
                }
                .navigationViewStyle(.stack)
                .tag(contentType.courses)
                
                NavigationView {
                    ToolsView(selected: $selected)
                        .modifier(BackgroundModifiers())
                }
                .navigationViewStyle(.stack)
                .tag(contentType.tools)
                
                NavigationView {
                    SettingsView(selected: $selected)
                        .modifier(BackgroundModifiers())
                }
                .navigationViewStyle(.stack)
                .tag(contentType.settings)
            }
            ContentFrostedTabView(selectedTab: $selected)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
