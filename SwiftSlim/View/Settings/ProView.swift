//
//  ProView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/21.
//

import SwiftUI

struct ProView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("")
            }
            .multilineTextAlignment(.center)
        }
        .navigationTitle("Pro")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
}
