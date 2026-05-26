//
//  contentType.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import SwiftUI

enum contentType: Int, CaseIterable {
    case home = 0
    case notifications = 4
    case courses = 1
    case tools = 2
    case settings = 3
    
    var name: String {
        switch self {
        case .home:
            "Home"
        case .courses:
            "Courses"
        case .tools:
            "Tools"
        case .settings:
            "Settings"
        case .notifications:
            "Notifications"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            "homeHome"
        case .courses:
            "homeBook"
        case .tools:
            "homeTools"
        case .settings:
            "homeSetting"
        case .notifications:
            "bell"
        }
    }
}
