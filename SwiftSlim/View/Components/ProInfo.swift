//
//  ProInfo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/22.
//

import SwiftUI

enum ProInfo: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    case icon
    case components
    case contenet
    case resource
    case access
    case expanding
    
    var color: Color {
        switch self {
        case .icon:
            Color(hex: "D9622B")
        case .components:
            Color(hex: "8A3CFF")
        case .contenet:
            Color(hex: "B820CF")
        case .resource:
            Color(hex: "2471EB")
        case .access:
            Color(hex: "FF8140")
        case .expanding:
            Color(hex: "FF2C8D")
        }
    }
    
    var icon: String {
        switch self {
        case .icon:
            "pro_fenlei"
        case .components:
            "pro_mokuai"
        case .contenet:
            "pro_book"
        case .resource:
            "pro_settings"
        case .access:
            "pro_lightning"
        case .expanding:
            "pro_start"
        }
    }
    
    var name: LocalizedStringKey {
        switch self {
        case .icon:
            "Full Icon Library"
        case .components:
            "Pro Components"
        case .contenet:
            "Advanced Content"
        case .resource:
            "Practical Resources"
        case .access:
            "Early Access"
        case .expanding:
            "Ongoing Expansion"
        }
    }
    
    var description: LocalizedStringKey {
        switch self {
        case .icon:
            "Unlock more SF Symbols with localized search and version filtering, so you can quickly find system icons that fit your interface."
        case .components:
            "Access more SwiftUI components and page examples, review previews, code, and use cases, and build interfaces more efficiently."
        case .contenet:
            "More advanced courses, developer tools, and component examples will be added over time to help you gradually improve your app development skills."
        case .resource:
            "Get more SwiftUI learning materials, code references, and development resources to reduce repeated searching and trial and error."
        case .access:
            "Get early access to new features, new components, and Pro content updates, with continued support for learning and development."
        case .expanding:
            "Courses, components, tools, and development resources will continue to grow, providing long-term support for learning and development."
        }
    }
}
