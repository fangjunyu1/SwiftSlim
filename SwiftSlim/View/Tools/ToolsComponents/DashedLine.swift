//
//  DashedLine.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/23.
//


import SwiftUI

struct DashedLine: Shape {
    var isVertical: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if isVertical {
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }

        return path
    }
}

#Preview {
    DashedLine(isVertical: false)
        .stroke(
            .gray,
            style: StrokeStyle(
                lineWidth: 1,
                dash: [5, 3]
            )
        )
        .frame(height: 1)
}
