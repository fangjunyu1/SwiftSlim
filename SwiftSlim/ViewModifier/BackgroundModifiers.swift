//
//  BackgroundModifiers.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import SwiftUI

struct BackgroundModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}
