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
    
    private let content: String?    // Markdown 文档内容
    private let courseNumber: Int   // 本节课编号
    
    @State private var showCompletedFeedback = false
    
    private var isCompleted: Bool {
        appStorage.completedCourse.contains(courseNumber)
    }
    
    init(item: CoursesModel) {
        let markdown = try? String(contentsOf: item.url)
        self.content = markdown
        self.courseNumber = item.index
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
                    
                    completionArea
                }
            } else {
                ProgressView {
                    Text(verbatim: "...")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                AppStorageManager.shared.lastOpenedCourse = courseNumber
            }
        }
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
    
    @ViewBuilder
    var completionArea: some View {
        ZStack {
            Button(action: {
                // 添加完成的课程序号
                appStorage.completedCourse.insert(courseNumber)
                
                withAnimation {
                    showCompletedFeedback = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        showCompletedFeedback = false
                    }
                }
            }, label: {
                Text("Mark as Complete")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 20)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 0.3)
            })
            .opacity(!isCompleted && !showCompletedFeedback ? 1 : 0)
            .allowsHitTesting(!isCompleted && !showCompletedFeedback)
            
            Label("Completed", systemImage: "checkmark.circle.fill")
                .foregroundStyle(.green)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .opacity(showCompletedFeedback ? 1 : 0)
        }
        .frame(height: 44)
        .padding(.top, 30)
        .padding(.bottom, 50)
    }
}
