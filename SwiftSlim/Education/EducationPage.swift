//
//  EducationPage.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI
import MarkdownUI

struct EducationPage: View {
    private let content: String?
    
    init(url: URL) {
        let markdown = try? String(contentsOf: url)
        self.content = markdown
    }
    
    var body: some View {
        if let content = content {
            ScrollView {
                Markdown(content)
                    .markdownImageProvider(.asset)
                    .padding(.horizontal)
            }
        } else {
            ProgressView("...")
        }
    }
}
