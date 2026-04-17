//
//  NotesText.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI

struct NotesText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .foregroundStyle(Color.gray)
    }
}
