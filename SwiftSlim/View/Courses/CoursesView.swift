//
//  CoursesView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct CoursesView: View {
    @Binding var selected: contentType
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Education()
            }
        }
        .navigationTitle("Contents")
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
