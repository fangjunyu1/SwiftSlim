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
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .padding(.vertical, 20)
                        .background(Color("WhiteAndBlack"))
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }
            }
        }
        .navigationTitle("Courses")
        .padding(.vertical, 30)
    }
}

struct CoursesChapterView: View {
    @State private var showList = false
    let chapter: CoursesChapter
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showList.toggle()
                }
            }, label: {
                HStack {
                    Text(LocalizedStringKey(chapter.title))
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("BlackColor"))
                    Spacer()
                    Image(systemName: showList ? "chevron.down" : "chevron.forward")
                        .font(.headline.bold())
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 12)
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
        HStack(spacing: 30) {
            Text(verbatim: "\(item.index)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            Text(LocalizedStringKey(item.name))
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color("BlackColor"))
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
