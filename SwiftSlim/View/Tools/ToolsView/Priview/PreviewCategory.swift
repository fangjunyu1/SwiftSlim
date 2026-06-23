//
//  PreviewCategory.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/22.
//

import SwiftUI

// 预览组件分类
enum PreviewCategory: String, CaseIterable, Identifiable, CategoryItem {
    case display
    case action
    case input
    case layout
    case container
    case data
    case navigation
    case presentation
    case media
    case drawing
    case shape
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .display: return "Display"
        case .action: return "Action"
        case .input: return "Input"
        case .layout: return "Layout"
        case .container: return "Container"
        case .data: return "Data"
        case .navigation: return "Navigation"
        case .presentation: return "Presentation"
        case .media: return "Media"
        case .drawing: return "Drawing"
        case .shape: return "Shapes"
        }
    }
    
    var subtitle: String {
        switch self {
        case .display: return "Text, Image & Status"
        case .action: return "Buttons, Menus & Actions"
        case .input: return "Input, Selection & Editing"
        case .layout: return "Stacks, Grids & Geometry"
        case .container: return "Content, Layout & Containers"
        case .data: return "Tables & Charts"
        case .navigation: return "Navigation & Transitions"
        case .presentation: return "Sheets, Alerts & Dialogs"
        case .media: return "Maps, Photos & Video"
        case .drawing: return "Canvas & Custom Drawing"
        case .shape: return "Shapes, Borders & Drawing"
        }
    }
    
    // 分类限制数量
    var freeLimit: Int {
        switch self {
        case .display: 6
        case .action: 4
        case .input: 8
        case .layout: 5
        case .container: 5
        case .data:  1
        case .navigation: 2
        case .presentation: 2
        case .media:  1
        case .drawing:  1
        case .shape: 5
        }
    }
}
