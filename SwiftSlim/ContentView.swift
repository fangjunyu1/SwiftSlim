//
//  ContentView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//

import SwiftUI

struct ContentView: View {
    let markdownText = """
    # 标题
    
    这是 **粗体** 和 *斜体*。
    
    - 列表项 1
    - 列表项 2
    """
    
    var body: some View {
        ScrollView {
            if let attributedString = try? AttributedString(
                markdown: markdownText) {
                Text(attributedString)
                    .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
