//
//  GradientsColor.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

// 渐变颜色
enum GradientsColor: String, Identifiable, CaseIterable {
    var id: String { rawValue }

    case linearGradient
    case radialGradient
    case angularGradient

    var name: String {
        switch self {
        case .linearGradient:  "Linear Gradient"
        case .radialGradient:  "Radial Gradient"
        case .angularGradient: "Angular Gradient"
        }
    }

    var title: String {
        switch self {
        case .linearGradient:  "线性渐变"
        case .radialGradient:  "径向渐变"
        case .angularGradient: "角度渐变"
        }
    }

    var describe: String {
        switch self {
        case .linearGradient:
            "线性渐变会在指定的方向上从一个颜色过渡到另一个颜色。"
        case .radialGradient:
            "径向渐变是从中心向外扩展的渐变效果，适合用于圆形或有中心点的渐变效果。"
        case .angularGradient:
            "角度渐变是围绕某个点旋转的渐变效果，适合用于圆形或圆弧区域。"
        }
    }

    // 用 @ViewBuilder 替代多余的 VStack 包裹
    @ViewBuilder
    var view: some View {
        switch self {
        case .linearGradient:
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        case .radialGradient:
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    RadialGradient(
                        colors: [.yellow, .orange, .red],
                        center: .center,
                        startRadius: 0,
                        endRadius: 100
                    )
                )
        case .angularGradient:
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    AngularGradient(
                        colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                        center: .center
                    )
                )
        }
    }

    var code: String {
        switch self {
        case .linearGradient:
            """
            LinearGradient(
              colors: [.blue, .purple],
              startPoint: .leading,
              endPoint: .trailing
            )
            """
        case .radialGradient:
            """
            RadialGradient(
              colors: [.yellow, .orange, .red],
              center: .center,
              startRadius: 0,
              endRadius: 100
            )
            """
        case .angularGradient:
            """
            AngularGradient(
              colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
              center: .center
            )
            """
        }
    }
}
