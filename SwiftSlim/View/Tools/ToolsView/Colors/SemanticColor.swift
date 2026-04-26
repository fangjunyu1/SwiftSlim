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
        case .primary:     "主要文本颜色，自动适应深浅模式"
        case .secondary:   "次要文本，用于补充信息"
        case .accentColor: "App 的强调色，默认蓝色"
        }
    }
}
