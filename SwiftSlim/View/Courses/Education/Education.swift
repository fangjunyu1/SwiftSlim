//
//  Education.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/2/8.
//

import SwiftUI

struct EducationModel:Identifiable,Equatable,Hashable {
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
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(EducationViewModel.educationItems.enumerated()), id: \.element.id) { index, item in
                NavigationLink(destination: EducationPage(url: item.url)) {
                    EducationItem(index:index, item: item)
                }
                if index != EducationViewModel.educationItems.count - 1 {
                    Divider()
                        .padding(.leading, 20)
                }
            }
        }
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct EducationItem: View {
    let index: Int
    let item: EducationModel
    var body: some View {
        HStack(spacing: 20) {
            Text(verbatim: "\(index + 1)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            Text(LocalizedStringKey(item.name))
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color("BlackColor"))
            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    NavigationView {
        ScrollView {
            Education()
        }
        .modifier(BackgroundModifiers())
    }
}
