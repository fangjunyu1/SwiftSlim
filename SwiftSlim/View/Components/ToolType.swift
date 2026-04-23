//
//  ToolType.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI

enum ToolCategory {
    case LearningTool
    case DesignTools
}

extension ToolType {
    static let LearningTools:[ToolType] = [.Shortcuts, .API_Dictionary]
    static let DesignTools:[ToolType] = [.Preview]
}
enum ToolType: String, Identifiable, CaseIterable {
    
    case Shortcuts
    case Preview
    case API_Dictionary
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .Preview:
            "Preview"
        case .Shortcuts:
            "Shortcuts"
        case .API_Dictionary:
            "API Dictionary"
        }
    }
    
    var color: Color {
        switch self {
        case .Preview:
            Color(hex:"883AE2")
        case .Shortcuts:
            Color(hex: "4A5466")
        case .API_Dictionary:
            Color(hex:"4EAE54")
        }
    }
    
    var img: String {
        switch self {
        case .Preview:
            "mokuai"
        case .Shortcuts:
            "shortcutKey"
        case .API_Dictionary:
            "book"
        }
    }
    
    var description: String {
        switch self {
        case .Preview:
            "UI Controls"
        case .Shortcuts:
            "Xcode Shortcuts"
        case .API_Dictionary:
            "API Quick Reference"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .Shortcuts:
            ShortcutsView()
        case .Preview:
            PreviewView()
        case .API_Dictionary:
            APIView()
        }
    }
}
