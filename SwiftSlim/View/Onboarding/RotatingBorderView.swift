//
//  RotatingBorderView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

// 边框旋转视图
struct RotatingBorderView: View {
    let animate: Bool
    @State private var rotation: Double = 0

    var body: some View {
        Image("border")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .rotationEffect(.degrees(rotation))
            .opacity(animate ? 1 : 0)
            .onChange(of: animate) { newValue in
                if newValue {
                    rotation = 0
                    withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                } else {
                    rotation = 0
                }
            }
            .onAppear {
                if animate {
                    rotation = 0
                    withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
            }
    }
}
