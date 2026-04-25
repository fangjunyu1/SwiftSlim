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
    let displayLocation: DevToolsDisplayLocation
    
    var devColor: Color {
        colorScheme == .light ? tool.color : Color.white
    }
    
    var devBgColor: Color {
        colorScheme == .light ? tool.bgColor : Color.white
    }
    
    var alignment: HorizontalAlignment {
        if displayLocation == .Home {
            return .leading
        } else if displayLocation == .Tools {
            return .center
        } else {
            return .center
        }
    }
    
    var padding: CGFloat {
        if displayLocation == .Home {
            return 16
        } else if displayLocation == .Tools {
            return 20
        } else {
            return 20
        }
    }
    
    var isHome: Bool {
        displayLocation == .Home
    }
    
    var width: Double {
        if displayLocation == .Home {
            return 140
        } else if displayLocation == .Tools {
            return 120
        } else {
            return 120
        }
    }
    
    var height: Double {
        if displayLocation == .Home {
            return 110
        } else if displayLocation == .Tools {
            return 140
        } else {
            return 140
        }
    }
    
    var spacing: Double {
        if displayLocation == .Home {
            return 5
        } else if displayLocation == .Tools {
            return 8
        } else {
            return 8
        }
    }
    
    var imageSize: Double {
        if displayLocation == .Home {
            return 18
        } else if displayLocation == .Tools {
            return 24
        } else {
            return 24
        }
    }
    
    var body: some View {
        NavigationLink(destination: tool.view) {
            toolContent
        }
    }
    
    var toolContent: some View {
        HStack {
            VStack(alignment: alignment, spacing: spacing) {
                Image(tool.img)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
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
            if isHome {
                Spacer()
            }
        }
        .padding(padding)
        .frame(width: width, height: height)
        .background(Color("WhiteAndBlack"))
        .cornerRadius(10)
    }
}

enum DevToolsDisplayLocation {
    case Home
    case Tools
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
        .environment(\.locale, .init(identifier: "en"))
}
