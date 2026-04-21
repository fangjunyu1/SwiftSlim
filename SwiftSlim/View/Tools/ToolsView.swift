//
//  ToolsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct ToolsView: View {
    @Binding var selected: contentType
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 12)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                
                // 学习工具
                LearningTools
                
                // 设计参考
                DesignRef
            }
            .padding(.bottom, 30)
            
        }
        .navigationTitle("Tools")
    }
    
    // 学习工具
    var LearningTools: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Learning Tools")
                    .modifier(PromptText())
                Spacer()
            }
            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(ToolType.LearningTool) { item in
                        DevToolsView(tool: item, displayLocation: .Tools)
                }
            }
        }
    }
    
    // 设计参考
    var DesignRef: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Design Ref")
                    .modifier(PromptText())
                Spacer()
            }
            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(ToolType.DesignTools) { item in
                    
                        DevToolsView(tool: item, displayLocation: .Tools)
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
