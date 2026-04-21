//
//  ShortcutsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct ShortcutsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "ShortcutsView")
            }
            .modifier(BackgroundModifiers())
        }
        .navigationTitle("Shortcuts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ShortcutsView()
    }
}
