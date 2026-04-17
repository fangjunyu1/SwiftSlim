//
//  ToolType.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI

enum ToolType: String, Identifiable, CaseIterable {
    
    case componentPreview = "Preview"
    
    var id: String {
        rawValue
    }
    
    var img: String {
        switch self {
        case .componentPreview:
            "mokuai"
        }
    }
    
    var color: Color {
        switch self {
        case .componentPreview:
            Color(hex:"883AE2")
        }
    }
    
    var description: String {
        switch self {
        case .componentPreview:
            "UI Controls"
        }
    }
}
