//
//  SettingsBg.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/19.
//

import SwiftUI

struct SettingsBg: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background()
            .cornerRadius(18)
    }
}
