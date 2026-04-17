//
//  Card.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

struct Card: View {
    let numberOfCourses: Int
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                // 第一章
                Text("Chapter 1")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(hex: "4E47DD"))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color(hex: "EFF2FE"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                // 20 课时
                HStack {
                    Text(verbatim: "\(numberOfCourses)")
                    Text("lesson")
                }
                .foregroundStyle(.gray)
            }
            
            // 基础入门
            HStack {
                Text("Basics")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            // 完成进度
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    lessonRow(icon: "checkmark.circle", width: 160, isDone: true)
                    lessonRow(icon: "checkmark.circle", width: 100, isDone: true)
                    lessonRow(icon: "circle", width: 160, isDone: false)
                }
                Spacer()
            }
        }
        .padding(20)
        .frame(width: 300)
        .background(Color("WhiteAndGrayBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.gray.opacity(0.3), radius: 5, y: 3)
    }
    
    private func lessonRow(icon: String, width: CGFloat, isDone: Bool) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .foregroundStyle(isDone ? Color(hex: "34CB46") : .gray)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: width, height: 14)
                .foregroundStyle(Color("LightGray"))
        }
    }

}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
}
