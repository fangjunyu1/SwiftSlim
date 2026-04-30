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
                // SwiftUI 高级开发
                SwiftUIAdvancedDevelopment
            }
        }
        .navigationTitle("Courses")
        .padding(.top, 30)
        .safeAreaInset(edge: .bottom) {
            Spacer().frame(height: 120)
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
                print("点击了敬请期待")
            }, label:  {
                Text("Coming Soon")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 55)
                    .foregroundStyle(.black)
                    .background(Color("GoldColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            })
            .disabled(true)
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
            Spacer()
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
        .padding(.vertical, 16)
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
