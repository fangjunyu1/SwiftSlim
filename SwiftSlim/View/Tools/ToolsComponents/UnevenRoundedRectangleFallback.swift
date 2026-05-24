//
//  UnevenRoundedRectangleFallback.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct UnevenRoundedRectangleFallback: Shape {
    var topLeading: CGFloat
    var bottomLeading: CGFloat
    var bottomTrailing: CGFloat
    var topTrailing: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let maxRadius = min(rect.width, rect.height) / 2
        
        let topLeading = min(topLeading, maxRadius)
        let bottomLeading = min(bottomLeading, maxRadius)
        let bottomTrailing = min(bottomTrailing, maxRadius)
        let topTrailing = min(topTrailing, maxRadius)
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + topLeading, y: rect.minY))
        
        // 顶边
        path.addLine(to: CGPoint(x: rect.maxX - topTrailing, y: rect.minY))
        
        // 右上角
        path.addArc(
            center: CGPoint(x: rect.maxX - topTrailing, y: rect.minY + topTrailing),
            radius: topTrailing,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: false
        )
        
        // 右边
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomTrailing))
        
        // 右下角
        path.addArc(
            center: CGPoint(x: rect.maxX - bottomTrailing, y: rect.maxY - bottomTrailing),
            radius: bottomTrailing,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        // 底边
        path.addLine(to: CGPoint(x: rect.minX + bottomLeading, y: rect.maxY))
        
        // 左下角
        path.addArc(
            center: CGPoint(x: rect.minX + bottomLeading, y: rect.maxY - bottomLeading),
            radius: bottomLeading,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        // 左边
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeading))
        
        // 左上角
        path.addArc(
            center: CGPoint(x: rect.minX + topLeading, y: rect.minY + topLeading),
            radius: topLeading,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}
