//
//  CoursesView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct CoursesModel:Identifiable,Equatable,Hashable {
    var id: Int { index }
    let index: Int
    let name: String
    let url: URL
}

struct CoursesChapter: Identifiable {
    var id: String { title }
    let title: String
    let items: [CoursesModel]
}

struct CoursesView: View {
    @EnvironmentObject var iapManager: IAPManager
    @EnvironmentObject var appStorage: AppStorageManager
    
    // 搜索内容
    @State private var searchText = ""
    // 显示会员视图
    @State private var showProView = false
    @Binding var selected: contentType
    
    var body: some View {
        if UIDevice.isPhone {
            mainContent
                .navigationTitle("Courses")
                .navigationBarTitleDisplayMode(.large)
        } else {
            mainContent
                .navigationTitle("Courses")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 搜索课程 - 数据源
    private var filteredChapters: [CoursesChapter] {
        
        let keyword = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !keyword.isEmpty else {
            return CoursesViewModel.chapters
        }
        
        return CoursesViewModel.chapters.compactMap { chapter in
            let filteredItems = chapter.items.filter { item in
                // 1. 搜索课程标题
                let titleMatched = item.name.localizedCaseInsensitiveContains(keyword)
                
                // 2. 搜索 Markdown 正文内容
                let contentMatched: Bool = {
                    guard let data = try? Data(contentsOf: item.url),
                          let text = String(data: data, encoding: .utf8) else {
                        return false
                    }
                    
                    return text.localizedCaseInsensitiveContains(keyword)
                }()
                
                return titleMatched || contentMatched
            }
            
            // 如果这个章节里没有匹配课程，就不显示这个章节
            guard !filteredItems.isEmpty else {
                return nil
            }
            
            // 保留原章节标题，只替换搜索后的课程列表
            return CoursesChapter(title: chapter.title, items: filteredItems)
        }
    }
    
    private var mainContent: some View {
        ScrollView {VStack(spacing: 20) {
            // 搜索栏
            ToolSearchView(tool: .Preview, searchTips: "Search courses...", showHeader: false, searchText: $searchText)
            ForEach(filteredChapters) { chapter in
                CoursesChapterView(
                    chapter: chapter,
                    isSearching: !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                )
                .background(Color("WhiteAndBlack"))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            
            if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                // SwiftUI 高级开发
                SwiftUIAdvancedDevelopment
            }
        }
        .padding(.top, 20)
        }
        .safeAreaInset(edge: .bottom) {
            Spacer().frame(height: 120)
        }
        .sheet(isPresented: $showProView) {
            ProView(showCloseButton: true)
                .environmentObject(appStorage)
                .environmentObject(iapManager)
        }
    }
    
    var SwiftUIAdvancedDevelopment: some View {
        VStack(spacing: 20) {
            // PREMIUM
            HStack {
                Image("lock")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                Text(verbatim: "PREMIUM")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                Spacer()
            }
            .foregroundStyle(Color("GoldColor"))
            
            // SwiftUI 高级开发
            HStack {
                Text("SwiftUI Advanced Development")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
            }
            
            // 描述：从 SwiftUI 基础继续深入...
            HStack {
                Text("Dive deeper into SwiftUI from the basics, covering data storage, view splitting, state management, project organization, and real-world application development.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white.opacity(0.8))
                Spacer()
            }
            Button(action: {
                if !appStorage.isValidMember {
                    showProView = true
                }
            }, label:  {
                Text("Coming Soon")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 200, height: 55)
                    .frame(maxWidth: 260)
                    .foregroundStyle(.black)
                    .background(Color("GoldColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            })
            .disabled(appStorage.isValidMember)
        }
        .padding(26)
        .background {
            VStack {
                HStack {
                    Spacer()
                    Image("start2")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.white.opacity(0.1))
                }
                Spacer()
            }
            .padding(20)
        }
        .background(Color("LightBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
    }
}

struct CoursesChapterView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @State private var showList = false
    let chapter: CoursesChapter
    var isSearching: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    showList.toggle()
                }
            }, label: {
                HStack {
                    Text(LocalizedStringKey(chapter.title))
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("BlackColor"))
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: showList ? "chevron.down" : "chevron.forward")
                        .font(.headline.bold())
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 30)
            })
            if showList || isSearching {
                Divider()
                ForEach(Array(chapter.items.enumerated()), id:\.offset) { index, item in
                    NavigationLink(destination: CoursesPage(item: item)) {
                        CoursesItem(item: item)
                    }
                    if index != chapter.items.count - 1 {
                        Divider()
                    }
                }
            }
        }
    }
}
struct CoursesItem: View {
    @EnvironmentObject var appStorage: AppStorageManager
    let item: CoursesModel
    
    var isCompleted: Bool {
        AppStorageManager.shared.completedCourse.contains(item.index)
    }
    
    var isContinueLearning: Bool {
        AppStorageManager.shared.lastOpenedCourse == item.index
    }
    
    var titleColor: Color {
        isCompleted || isContinueLearning ? Color("BlackColor") : Color.secondary
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Text(verbatim: "\(item.index)")
                .foregroundStyle(Color.secondary)
            Text(LocalizedStringKey(item.name))
                .fontWeight(.medium)
                .foregroundStyle(titleColor)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            Spacer()
            VStack {
                if isCompleted {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.green)
                    
                } else {
                    if isContinueLearning {
                        Image(systemName: "arrowtriangle.right.circle")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.blue)
                    }
                }
            }
            .frame(height: 10)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 30)
    }
}

#Preview {
    RootView()
        .environmentObject(AppStorageManager.shared)
        .environmentObject(IAPManager.shared)
}
