//
//  ButtonModifier.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
            .frame(width: 240,height: 60)
            .background(Color(hex: "3762E3"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct DisabledButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
            .frame(width: 240,height: 60)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
