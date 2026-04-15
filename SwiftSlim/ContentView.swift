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
                    VStack {
                        switch selected {
                        case .home:
                            HomeView()
                        case .courses:
                            CoursesView()
                        case .tools:
                            ToolsView()
                        case .settings:
                            SettingsView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "F2F2F7"))
                }
                ContentTabView(selectedTab: $selected)
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
