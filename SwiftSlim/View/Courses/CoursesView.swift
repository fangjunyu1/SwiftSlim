//
//  CoursesView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct CoursesModel:Identifiable,Equatable,Hashable {
    let id = UUID()
    let index: Int
    let name: String
    let url: URL
}

struct CoursesChapter: Identifiable {
    let id = UUID()
    let title: String
    let items: [CoursesModel]
}

struct CoursesView: View {
    @Binding var selected: contentType
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(CoursesViewModel.chapters) { chapter in
                    CoursesChapterView(chapter: chapter)
                        .background(Color("WhiteAndBlack"))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
            }
        }
        .navigationTitle("Courses")
        .padding(.top, 30)
        .safeAreaInset(edge: .bottom) {
            Spacer().frame(height: 120)
        }
    }
}

struct CoursesChapterView: View {
    @State private var showList = false
    let chapter: CoursesChapter
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
                    Spacer()
                    Image(systemName: showList ? "chevron.down" : "chevron.forward")
                        .font(.headline.bold())
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 30)
            })
            if showList {
                Divider()
                ForEach(Array(chapter.items.enumerated()), id:\.offset) { index, item in
                    NavigationLink(destination: CoursesPage(url: item.url)) {
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
    let item: CoursesModel
    var body: some View {
        HStack(spacing: 20) {
            Text(verbatim: "\(item.index)")
                .foregroundStyle(Color.secondary)
            Text(LocalizedStringKey(item.name))
                .fontWeight(.medium)
                .foregroundStyle(Color("BlackColor"))
            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
