//
//  CoursesView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct CoursesView: View {
    @Binding var selected: contentType
    var body: some View {
        ScrollView(showsIndicators: false) {
            // SwiftUI 入门教程
            tutorial
        }
        .navigationTitle("Contents")
    }
    
    // 入门教程
    var tutorial: some View {
        VStack(alignment: .leading, spacing: 24) {
            // 顶部入门、20+ 课
            HStack {
                // 入门
                Text("Beginner")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background {
                        Color.white
                            .opacity(0.15)
                            .cornerRadius(30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.white.opacity(0.5), lineWidth: 0.5)
                            }
                    }
                Spacer()
                HStack(spacing: 0) {
                    Text(verbatim: "20")
                        .fontWeight(.medium)
                    Text(verbatim: "+")
                        .fontWeight(.medium)
                    Text("lessons")
                        .fontWeight(.medium)
                        .padding(.leading, 3)
                }
                .font(.footnote)
                .foregroundStyle(Color.white)
            }
            
            // SwiftUI 入门教程 标题和描述
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI Beginner Tutorial")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Start from zero with SwiftUI and systematically learn Apple’s declarative UI development. Through clear explanations and practical examples, you will gradually master layout, interaction, and state management to build beautiful and useful app interfaces.")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
            .foregroundStyle(Color.white)
            
            NavigationLink(destination: Education()) {
                HStack {
                    Image("play")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 18)
                    Text("Start Learning")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color("AppColor"))
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(Color("WhiteAndGrayBackground"))
                .cornerRadius(40)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 24)
        .background {
            ZStack(alignment: .bottomTrailing) {
                LinearGradient(
                            gradient: Gradient(colors: [Color("Linear1"), Color("Linear2")]), // 渐变的颜色
                            startPoint: .topLeading, // 渐变的起始点
                            endPoint: .bottomTrailing // 渐变的结束点
                        )
                Image("swift")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 150)
                    .foregroundStyle(Color.white.opacity(0.1))
                    .padding(20)
            }
        }
        .cornerRadius(30)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
