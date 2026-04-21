//
//  PromptText.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import SwiftUI

struct PromptText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(Color("PromptText"))
    }
}

struct PromptGrayText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
    }
}
