//
//  LottieModifier.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/19.
//

import SwiftUI

struct LottieModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(maxHeight: 160)
            .frame(maxWidth: 500)
    }
}
