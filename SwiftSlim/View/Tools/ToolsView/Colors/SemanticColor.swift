//
//  SemanticColor.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

// 语义颜色
enum SemanticColor: String, Identifiable, CaseIterable {
    var id: String { rawValue }

    case primary
    case secondary
    case accentColor

    var name: String { ".\(rawValue)" }

    var color: Color {
        switch self {
        case .primary:     .primary
        case .secondary:   .secondary
        case .accentColor: .accentColor
        }
    }

    var describe: String {
        switch self {
        case .primary:     "Primary text color, adapts to light and dark modes"
        case .secondary:   "Secondary text for supporting information"
        case .accentColor: "App accent color, default blue"
        }
    }
}
