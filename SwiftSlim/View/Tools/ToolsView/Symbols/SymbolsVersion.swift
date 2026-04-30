//
//  SymbolsVersion.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/30.
//

import SwiftUI

// SF Symbols 版本对应关系：
// SF1 = SF Symbols 1.0 → iOS 13+
// SF2 = SF Symbols 2.0 → iOS 14+
// SF3 = SF Symbols 3.0 → iOS 15+
// SF4 = SF Symbols 4.0 → iOS 16+
// SF5 = SF Symbols 5.0 → iOS 17+
// SF6 = SF Symbols 6.0 → iOS 18+
// SF7 = SF Symbols 7.0 → iOS 26+
enum SymbolsVersion: String, Identifiable, CaseIterable, CategoryItem {
    
    var id: String { rawValue }
    case SF1
    case SF2
    case SF3
    case SF4
    case SF5
    case SF6
    case SF7
    
    var title: String {
        switch self {
        case .SF1: return "iOS 13+"
        case .SF2: return "iOS 14+"
        case .SF3: return "iOS 15+"
        case .SF4: return "iOS 16+"
        case .SF5: return "iOS 17+"
        case .SF6: return "iOS 18+"
        case .SF7: return "iOS 26+"
        }
    }
    
    // 兼容版本
    var compatibleVersion: [SymbolsVersion] {
        switch self {
        case .SF1:
            [.SF1]
        case .SF2:
            [.SF1, .SF2]
        case .SF3:
            [.SF1, .SF2, .SF3]
        case .SF4:
            [.SF1, .SF2, .SF3, .SF4]
        case .SF5:
            [.SF1, .SF2, .SF3, .SF4, .SF5]
        case .SF6:
            [.SF1, .SF2, .SF3, .SF4, .SF5, .SF6]
        case .SF7:
            [.SF1, .SF2, .SF3, .SF4, .SF5, .SF6, .SF7]
        }
    }
}
