//
//  APIComponent.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/23.
//

import SwiftUI

struct APIComponent: Identifiable {
    var id = UUID()
    let category: APICategory
    var name: String
    var subtitle: String
    let code: String    // 代码，用于复制
}



//struct PreviewComponent: Identifiable {
//    var id = UUID()
//    let category: PreviewCategory   // 类别
//    let name: String    // 组件名称
//    let subtitle: String    // 组件副标题
//    let description: String // 组件描述
//    let demo: PreviewDemo   // 测试 Demo
//    let code: String    // 代码，用于复制
//}
