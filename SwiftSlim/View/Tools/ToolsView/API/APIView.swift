//
//  APIView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

struct APIView: View {
    @State private var searchText = ""
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "APIView")
            }
            .modifier(BackgroundModifiers())
        }
        .searchable(
            text: $searchText,
            prompt: "Search APIs, like Text or VStack..."
        )
        .navigationTitle("API Dictionary")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
}

#Preview {
    NavigationView {
        APIView()
    }
}
