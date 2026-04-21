//
//  PreviewView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct PreviewView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "PreviewView")
            }
            .modifier(BackgroundModifiers())
        }
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
    }
}
