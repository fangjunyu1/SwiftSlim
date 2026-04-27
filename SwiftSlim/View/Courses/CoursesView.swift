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
        ScrollView {
            education
                .padding(.vertical, 20)
        }
        .navigationTitle("Courses")
    }
    
    // 学习列表
    var education: some View {
        Education()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
