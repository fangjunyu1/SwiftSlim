//
//  ToolType.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI

enum ToolType: String, Identifiable, CaseIterable {
    
    case Shortcuts
    case Preview
    
    static var LearningTool: [ToolType] {
        return [.Shortcuts]
    }
    
    static var DesignTools: [ToolType] {
        return [.Preview]
    }
    
    var id: String {
        rawValue
    }
    
    var color: Color {
        switch self {
        case .Preview:
            Color(hex:"883AE2")
        case .Shortcuts:
            Color(hex: "4A5466")
        }
    }
    
    var img: String {
        switch self {
        case .Preview:
            "mokuai"
        case .Shortcuts:
            "shortcutKey"
        }
    }
    
    var description: String {
        switch self {
        case .Preview:
            "UI Controls"
        case .Shortcuts:
            "Xcode Shortcuts"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .Shortcuts:
            ShortcutsView()
        case .Preview:
            PreviewView()
        }
    }
}
