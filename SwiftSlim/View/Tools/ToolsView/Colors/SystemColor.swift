//
//  SystemColor.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

// 系统颜色
enum SystemColor: String, Identifiable, CaseIterable {
    var id: String { rawValue }

    case red, blue, green, yellow, orange
    case purple, pink, brown, gray, mint
    case teal, cyan, indigo, white, black, clear

    var name: String { ".\(rawValue)" }

    var color: Color {
        switch self {
        case .red:    .red
        case .blue:   .blue
        case .green:  .green
        case .yellow: .yellow
        case .orange: .orange
        case .purple: .purple
        case .pink:   .pink
        case .brown:  .brown
        case .gray:   .gray
        case .mint:   .mint
        case .teal:   .teal
        case .cyan:   .cyan
        case .indigo: .indigo
        case .white:  .white
        case .black:  .black
        case .clear:  .clear
        }
    }

    var hexColor: String {
        switch self {
        case .red:    "#FF3B30"
        case .blue:   "#007AFF"
        case .green:  "#34C759"
        case .yellow: "#FFCC00"
        case .orange: "#FF9500"
        case .purple: "#AF52DE"
        case .pink:   "#FF2D55"
        case .brown:  "#A2845E"
        case .gray:   "#8E8E93"
        case .mint:   "#00C7BE"
        case .teal:   "#30B0C7"
        case .cyan:   "#32ADE6"
        case .indigo: "#5856D6"
        case .white:  "#FFFFFF"
        case .black:  "#000000"
        case .clear:  "#00000000"
        }
    }
}
