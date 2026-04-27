//
//  DevToolsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

// 开发工具视图
struct DevToolsView: View {
    @Environment(\.colorScheme) var colorScheme
    let tool: ToolType
    
    var devColor: Color {
        colorScheme == .light ? tool.color : Color.white
    }
    
    var devBgColor: Color {
        colorScheme == .light ? tool.bgColor : Color.white
    }
    
    var body: some View {
        NavigationLink(destination: tool.view) {
            toolContent
        }
    }
    
    var toolContent: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Image(tool.img)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(devColor)
                    .padding(6)
                    .background(devBgColor.opacity(0.15))
                    .cornerRadius(8)
                    .padding(.bottom, 8)
                Text(LocalizedStringKey(tool.title))
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("BlackColor"))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                Text(LocalizedStringKey(tool.description))
                    .modifier(NotesText())
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding(16)
        .frame(height: 110)
        .frame(maxWidth: .infinity)
        .background(Color("WhiteAndBlack"))
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
        .environment(\.locale, .init(identifier: "en"))
}
