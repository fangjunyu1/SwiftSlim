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
                    HomeView()
                    CoursesView()
                    ToolsView()
                    SettingsView()
                }
                ContentTabView(selectedTab: $selected)
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
