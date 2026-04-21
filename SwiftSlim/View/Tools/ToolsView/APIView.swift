//
//  APIView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct APIView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "APIView")
            }
            .modifier(BackgroundModifiers())
        }
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
    }
}
