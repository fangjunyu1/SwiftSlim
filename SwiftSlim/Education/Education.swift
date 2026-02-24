//
//  Education.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI

struct EducationModel:Identifiable,Equatable {
    let id = UUID()
    let name: String
    let url: URL
}

class EducationViewModel {
    // 获取当前语言环境下的 Markdown 文档
    static var educationItems: [EducationModel] {
        // 批量获取某一类型的资源（这里加载Markdown文件）
        let mdFiles = Bundle.main.urls(forResourcesWithExtension: "md", subdirectory: nil) ?? []
        return mdFiles
            .sorted { $0.lastPathComponent.localizedStandardCompare($1.lastPathComponent) == .orderedAscending}
            .compactMap { url -> EducationModel? in
                let fileName = url.deletingPathExtension().lastPathComponent
                // 安全地提取子字符串
                guard fileName.count > 4 else { return nil }
                let displayName = String(fileName.dropFirst(4))
                return EducationModel(name: displayName, url: url)
            }
    }
}

struct Education: View {
    @State private var EducationVM = EducationViewModel()
    var body: some View {
        // 课程列表
        List {
            ForEach(Array(EducationViewModel.educationItems.enumerated()), id: \.element.id) { index, item in
                NavigationLink(destination: EducationPage(url: item.url)) {
                    Text("\(index + 1)")
                    Text(LocalizedStringKey(item.name))
                }
            }
        }
        .navigationTitle("Contents")
        
        // 默认占位视图（双栏布局时显示在右侧）
        Image("placeholder")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.gray)
            .scaledToFit()
            .frame(width: 100)
    }
}

#Preview {
    NavigationView {
        Education()
    }
}
