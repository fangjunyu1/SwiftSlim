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
        GridItem(.adaptive(minimum: 140, maximum: 300) , spacing: 20, alignment: .leading)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                
                // 学习工具
                LearningTools
                
                // 设计参考
                DesignRef
            }
            .padding(.bottom, 120)
            
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
                ForEach(ToolType.allCases.filter { $0.category == .LearningTool }) { item in
                        DevToolsView(tool: item)
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
                ForEach(ToolType.allCases.filter { $0.category == .DesignTools }) { item in
                    
                        DevToolsView(tool: item)
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
