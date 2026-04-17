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
        NavigationView {
            ZStack {
                TabView(selection: $selected) {
                    HomeView(selected: $selected)
                        .tag(contentType.home)
                        .padding(20)
                        .modifier(BackgroundModifiers())
                    
                    CoursesView(selected: $selected)
                        .tag(contentType.courses)
                        .padding(20)
                        .modifier(BackgroundModifiers())
                    
                    ToolsView(selected: $selected)
                        .tag(contentType.tools)
                        .padding(20)
                        .modifier(BackgroundModifiers())
                    
                    SettingsView(selected: $selected)
                        .tag(contentType.settings)
                        .padding(20)
                        .modifier(BackgroundModifiers())
                }
                ContentFrostedTabView(selectedTab: $selected)
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
