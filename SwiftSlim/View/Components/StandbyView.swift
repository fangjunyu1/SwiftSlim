//
//  StandbyView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/27.
//

import SwiftUI

struct StandbyView: View {
    var body: some View {
        VStack {
            Image("app0")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(Color.gray.opacity(0.3))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(BackgroundModifiers())
    }
}
