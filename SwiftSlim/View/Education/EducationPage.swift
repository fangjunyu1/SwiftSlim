//
//  EducationPage.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI
import MarkdownUI
import StoreKit

struct EducationPage: View {
    @EnvironmentObject var appStorage: AppStorageManager
    private let content: String?
    let device = UIDevice.current
    init(url: URL) {
        let markdown = try? String(contentsOf: url)
        self.content = markdown
    }
    
    // 进入课程详情页时，只统计打开次数
    func increaseOpenCount() {
        appStorage.openCount += 1
        print("打开课程次数:\(appStorage.openCount)")
    }
    
    // 离开课程页时，再判断是否请求评分
    func checkReviewIfNeeded() {
        // 如果打开次数小于 3，则退出判断
        guard appStorage.openCount >= 3 else {
            print("当前打开次数为:\(appStorage.openCount),小于 3，退出判断")
            return
        }
        guard !appStorage.hasRequestedReview else {
            print("已弹出过评分窗口，不再弹出。")
            return
        }
        // 弹出评分窗口
        SKStoreReviewController.requestReview()
        appStorage.hasRequestedReview = true
        
        print("已请求评分，后续不再重复请求")
    }
    
    var body: some View {
        VStack {
            if let content = content {
                ScrollView {
                    if device.userInterfaceIdiom == .phone {
                        // iPhone
                        Markdown(content)
                            .markdownImageProvider(.asset)
                            .markdownTheme(.custom(isLargeLayout: false))
                            .padding(.horizontal)
                    } else {
                        // iPad / Mac
                        Markdown(content)
                            .markdownImageProvider(.asset)
                            .markdownTheme(.custom(isLargeLayout: true))
                            .padding(.horizontal)
                    }
                    Spacer().frame(height: 50)
                }
            } else {
                ProgressView {
                    Text(verbatim: "...")
                }
            }
        }
        .onAppear {
            // 进入课程视图，执行数据统计方法
            print("打开课程次数:\(appStorage.openCount)")
            print("是否已显示评分窗口:\(appStorage.hasRequestedReview)")
            increaseOpenCount()
        }
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            checkReviewIfNeeded()
        }
    }
}
