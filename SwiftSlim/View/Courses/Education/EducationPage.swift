//
//  EducationPage.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI
import MarkdownUI

struct EducationPage: View {
    @EnvironmentObject var appStorage: AppStorageManager
    private let content: String?
    init(url: URL) {
        let markdown = try? String(contentsOf: url)
        self.content = markdown
    }
    
    // 进入课程详情页时，只统计打开次数
    func increaseOpenCount() {
        appStorage.openCount += 1
        print("打开课程次数:\(appStorage.openCount)")
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
        .onAppear {
            // 进入课程视图，执行数据统计方法
            print("打开课程次数:\(appStorage.openCount)")
            print("是否已显示评分窗口:\(appStorage.hasRequestedReview)")
            increaseOpenCount()
        }
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
}
