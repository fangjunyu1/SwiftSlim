//
//  SettingsTitle.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/19.
//

import SwiftUI

struct SettingsTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.weight(.bold))
            .multilineTextAlignment(.center)
    }
}
