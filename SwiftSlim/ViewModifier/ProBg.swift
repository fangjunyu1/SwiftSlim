//
//  ProBg.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/21.
//

import SwiftUI

struct ProBg: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color("WhiteAndBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
