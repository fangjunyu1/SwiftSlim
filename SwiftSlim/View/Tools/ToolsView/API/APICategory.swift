//
//  APICategory.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/23.
//

import SwiftUI

enum APICategory: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case view
    case state
}
