//
//  CircularGaugeFallback.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct CircularGaugeFallback: View {
    let value: Double        // 0.0 ~ 1.0
    let currentValue: String
    var color: Color = .blue

    private var clampedValue: Double {
        min(max(value, 0), 1)
    }

    var body: some View {
        ZStack {
            // 背景圆环
            Circle()
                .stroke(
                    Color.blue.opacity(0.18),
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )

            // 进度圆环
            Circle()
                .trim(from: 0, to: clampedValue)
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))

            VStack(spacing: 4) {
                Text(verbatim: currentValue)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            }
        }
    }
}
