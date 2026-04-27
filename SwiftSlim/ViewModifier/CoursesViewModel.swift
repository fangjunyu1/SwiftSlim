//
//  CoursesViewModel.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/27.
//

import SwiftUI

class CoursesViewModel {
    // 获取当前语言环境下的 Markdown 文档
    static var coursesItems: [CoursesModel] {
        // 批量获取某一类型的资源（这里加载Markdown文件）
        let mdFiles = Bundle.main.urls(forResourcesWithExtension: "md", subdirectory: nil) ?? []
        var index = 0
        return mdFiles
            .sorted { $0.lastPathComponent.localizedStandardCompare($1.lastPathComponent) == .orderedAscending}
            .compactMap { url -> CoursesModel? in
                let fileName = url.deletingPathExtension().lastPathComponent
                // 安全地提取子字符串
                guard fileName.count > 4 else { return nil }
                let displayName = String(fileName.dropFirst(4))
                index += 1
                return CoursesModel(index: index, name: displayName, url: url)
            }
    }
    
    // 将 Markdown 文件归类到具体章节
    static var chapters: [CoursesChapter] {
        let items = coursesItems
        
        let chapter1 = Array(items.prefix(20))
        let chapter2 = Array(items.dropFirst(20).prefix(20))
        
        // 本地化章节一
        let localizedchapter1Text1 = NSLocalizedString("Chapter 1", comment: "章节一")
        let localizedchapter1Text2 = NSLocalizedString("Basic Introduction", comment: "基础入门")
        let chapter1Name = localizedchapter1Text1 + ": " + localizedchapter1Text2
        
        // 本地化章节二
        let localizedchapter2Text1 = NSLocalizedString("Chapter 2", comment: "章节二")
        let localizedchapter2Text2 = NSLocalizedString("Advanced Layout", comment: "进阶布局")
        let chapter2Name = localizedchapter2Text1 + ": " + localizedchapter2Text2
        
        return [
            CoursesChapter(title: chapter1Name, items: chapter1),
            CoursesChapter(title: chapter2Name, items: chapter2)
        ]
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
