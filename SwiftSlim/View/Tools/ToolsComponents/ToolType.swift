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
    
    case Preview
    case Models
    case Symbols
    case Maps
    case Colors
    case Curves
    case Shortcuts
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
            "Curves"
        case .Colors:
            "Colors"
        case .Symbols:
            "Symbols"
        case .Models:
            "Models"
        case .Maps:
            "Maps"
        }
    }
    
    
    var category: ToolCategory {
        switch self {
        case .Shortcuts, .Models:
                .LearningTool
        case .Symbols,.Preview,.Curves, .Colors, .Maps:
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
        case .Symbols:
            Color(hex: "D9622B")
//        case .API_Dictionary:
//            Color(hex:"4EAE54")
//        case .Errors:
//            Color(hex: "CA3A32")
        case .Models:
                    Color(hex: "2563EB")
        case .Maps:
                    Color(hex: "16A34A")
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
        case .Symbols:
            Color(hex: "D9622B")
//        case .API_Dictionary:
//            Color(hex:"4EAE54")
//        case .Errors:
//            Color(hex: "CA3A32")
        case .Models:
            Color(hex: "3B82F6")
        case .Maps:
            Color(hex: "22C55E")
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
        case .Symbols:
            "fenlei"
//        case .API_Dictionary:
//            "book"
//        case .Errors:
//            "danger"
        case .Models:
            "json"
        case .Maps:
            "map"
        }
    }
    
    var description: String {
        switch self {
        case .Preview:
            "UI Controls"
        case .Shortcuts:
            "Xcode Hotkeys"
        case .Curves:
            "Anim Preview"
        case .Colors:
            "System Colors"
        case .Symbols:
            "SF Symbol Icons"
//        case .API_Dictionary:
//            "API Docs"
//        case .Errors:
//            "Common Fixes"
        case .Models:
            "JSON Codable"
        case .Maps:
            "Map Preview"
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
        case .Symbols:
            SymbolsView()
//        case .API_Dictionary:
//            APIView()
//        case .Errors:
//            ErrorsView()
        case .Models:
            CodableGeneratorView()
        case .Maps:
            MapsToolView()
        }
    }
}
