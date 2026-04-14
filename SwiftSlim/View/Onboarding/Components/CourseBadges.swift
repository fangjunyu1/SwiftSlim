//
//  CourseBadges.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

// 课时图标
struct CourseBadges: View {
    var numberOfCourses: Int
    var body: some View {
        VStack {
            Text(verbatim: "\(numberOfCourses)+")
                .font(.title)
                .fontWeight(.black)
            Text(verbatim:"LESSONS")
                .font(.caption2)
                .fontWeight(.bold)
        }
        .foregroundStyle(Color.white)
        .background {
            let size = 90.0
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "f3c766"), Color(hex: "de954c")]), // 渐变的颜色
                    startPoint: .topLeading, // 渐变的起始点
                    endPoint: .bottomTrailing // 渐变的结束点
                )
                .cornerRadius(10)
                .frame(width: size, height: size)
                .cornerRadius(100)
                .shadow(radius: 10)
                Circle()
                    .stroke(Color.white, lineWidth: 5)
            }
        }
        .rotationEffect(Angle(degrees: -20.0))
    }
}
