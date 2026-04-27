//
//  CoursesPage.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI
import MarkdownUI

struct CoursesPage: View {
    @EnvironmentObject var appStorage: AppStorageManager
    private let content: String?
    init(url: URL) {
        let markdown = try? String(contentsOf: url)
        self.content = markdown
    }
    
    var body: some View {
        VStack {
            if let content = content {
                ScrollView {
                    if UIDevice.isPhone {
                        // iPhone
                        Markdown(content)
                            .markdownImageProvider(.asset)
                            .markdownTheme(.custom(isLargeLayout: false))
                            .padding(.horizontal)
                            .padding(.top, 20)
                            .padding(.bottom, 50)
                    } else {
                        // iPad / Mac
                        Markdown(content)
                            .markdownImageProvider(.asset)
                            .markdownTheme(.custom(isLargeLayout: true))
                            .padding(.horizontal, 50)
                            .padding(.top, 20)
                            .padding(.bottom, 50)
                    }
                }
            } else {
                ProgressView {
                    Text(verbatim: "...")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
}
