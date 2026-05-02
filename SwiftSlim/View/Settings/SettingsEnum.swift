//
//  SettingsEnum.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/2.
//

import SwiftUI

enum SettingsEnum {
    
    static var avatarGradient: some ShapeStyle {
        LinearGradient(
            colors: [Color("Linear1"), Color("Linear2")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static func userName(appStorage: AppStorageManager) -> String {
        if appStorage.userName.isEmpty {
            // 如果用户名为空，返回本地化的开发者名称
            return NSLocalizedString("Developer", comment: "UserName")
        } else {
            return appStorage.userName
        }
    }
    
    
    static func userImageView(appStorage: AppStorageManager, img: UIImage? = nil,  size: CGFloat, fontSize: Font) -> some View {
        
        VStack {
            if let img = img {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFill()
            } else {
                Text(verbatim: String(userName(appStorage: appStorage).prefix(1)))
                    .font(fontSize)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(SettingsEnum.avatarGradient)
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}


#Preview {
    NavigationView {
        SettingsView(selected: .constant(.settings))
            .modifier(BackgroundModifiers())
            .environmentObject(AppStorageManager.shared)
    }
}
