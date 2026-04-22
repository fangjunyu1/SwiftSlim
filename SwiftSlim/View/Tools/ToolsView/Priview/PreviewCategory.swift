//
//  PreviewCategory.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

// 预览组件分类
enum PreviewCategory: String, CaseIterable, Identifiable {
    case display
    case action
    case input
    case container
    case navigation
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .display: return "Display"
        case .action: return "Action"
        case .input: return "Input"
        case .container: return "Container"
        case .navigation: return "Navigation"
        }
    }
    
    var subtitle: String {
        switch self {
        case .display: return "Text, Image & Status"
        case .action: return "Buttons, Menus & Actions"
        case .input: return "Input, Selection & Editing"
        case .container: return "Content, Layout & Containers"
        case .navigation: return "Navigation & Transitions"
        }
    }
}
