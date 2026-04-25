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

enum ToolType: String, Identifiable, CaseIterable {
    
    case Shortcuts
    case Preview
    case Curves
    case Colors
//    case API_Dictionary
//    case Errors
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .Preview:
            "Preview"
        case .Shortcuts:
            "Shortcuts"
//        case .API_Dictionary:
//            "Reference"
//        case .Errors:
//            "Errors"
        case .Curves:
            "Animation Curves"
        case .Colors:
            "Colors"
        }
    }
    
    
    var category: ToolCategory {
        switch self {
        case .Shortcuts:
                .LearningTool
        case .Preview,.Curves, .Colors:
                .DesignTools
        }
    }
    
    var color: Color {
        switch self {
        case .Preview:
            Color(hex:"883AE2")
        case .Shortcuts:
            Color(hex: "4A5466")
        case .Curves:
            Color(hex: "27746A")
        case .Colors:
            Color(hex: "CE2A66")
//        case .API_Dictionary:
//            Color(hex:"4EAE54")
//        case .Errors:
//            Color(hex: "CA3A32")
        }
    }
    
    var bgColor: Color {
        switch self {
        case .Preview:
            Color(hex:"883AE2")
        case .Shortcuts:
            Color(hex: "4A5466")
        case .Curves:
            Color(hex: "1EE5C7")
        case .Colors:
            Color(hex: "FF6BCE")
//        case .API_Dictionary:
//            Color(hex:"4EAE54")
//        case .Errors:
//            Color(hex: "CA3A32")
        }
    }
    
    var img: String {
        switch self {
        case .Preview:
            "mokuai"
        case .Shortcuts:
            "shortcutKey"
        case .Curves:
            "curve"
        case .Colors:
            "paletteLine"
//        case .API_Dictionary:
//            "book"
//        case .Errors:
//            "danger"
        }
    }
    
    var description: String {
        switch self {
        case .Preview:
            "UI Controls"
        case .Shortcuts:
            "Xcode Shortcuts"
        case .Curves:
            "Animation Preview"
        case .Colors:
            "Semantic Colors"
//        case .API_Dictionary:
//            "API Reference"
//        case .Errors:
//            "Common Fixes"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .Shortcuts:
            ShortcutsView()
        case .Preview:
            PreviewView()
        case .Curves:
            AnimationCurves()
        case .Colors:
            ColorsView()
//        case .API_Dictionary:
//            APIView()
//        case .Errors:
//            ErrorsView()
        }
    }
}
