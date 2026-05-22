//
//  Caption2Text.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI

struct Caption2Text: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .foregroundStyle(.gray)
    }
}
