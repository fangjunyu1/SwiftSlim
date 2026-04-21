//
//  DeveloperToolbox.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

// 开发者工具箱独立视图
struct DeveloperToolbox: View {
    let image: String
    let imageColor: String
    let backgroundColor: String
    var body: some View {
        VStack(spacing: 20) {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24)
                .foregroundStyle(Color(hex: imageColor))
                .padding(10)
                .background(Color(hex: backgroundColor))
                .cornerRadius(10)
            
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .frame(width: 100, height: 14)
                .foregroundStyle(Color("LightGray"))
        }
        .padding(16)
        .frame(width: 140)
        .background(Color("WhiteAndGrayBackground"))
        .cornerRadius(20.0)
        .shadow(color: Color.gray.opacity(0.3), radius: 3)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
}
