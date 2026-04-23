//
//  APIComponent.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/23.
//

import SwiftUI

struct APIComponent: Identifiable {
    var id = UUID()
    let category: APICategory   // 类别
    let name: String    // 名称
    let subtitle: String    // 副标题
    let statement: [String]   // 声明
    let availability: [APIAvailability]   // 可用性
    let parameter: [APIParameter]   // 参数
    let hint: [String]  // 提示与最佳实践
    let code: String    // 代码，用于复制
}

enum APIAvailability {
    case iOS(Double)
    case macOS(Double)
    case watchOS(Double)
}

// 参数类型
struct APIParameter: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let describe: String
}

extension APIComponent {
    static let APIList: [APIComponent] = [
        .init(
            category: .view,
            name: "Text",
            subtitle: "显示一行或多行只读文本",
            statement: ["""
            Text(_ content: StringProtocol)
            """],
            availability: [.iOS(13.0),.macOS(10.15),.watchOS(6.0)],
            parameter: [
                .init(name: "content", type: "StringProtocol", describe: "要显示的文本内容")
            ],
            hint: ["使用 Text(verbatim:) 避免本地化查找","多个 Text 可以用 + 运算符拼接",".lineLimit(nil) 允许无限行数"],
            code: """
                Text("Hello World")
                  .font(.title)
                  .foregroundColor(.blue)
                  .bold()
                """
        )
    ]
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
