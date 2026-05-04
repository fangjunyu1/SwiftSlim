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
    
    static func userImageView(displayName: String, image: UIImage?, size: CGFloat, fontSize: Font) -> some View {
        
        let trimmedName = displayName.trimmingCharacters(in: .whitespacesAndNewlines)
        let initial = trimmedName.first.map(String.init) ?? "D"
        
        return VStack {
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFill()
            } else {
                Text(verbatim: String(initial.prefix(1)))
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
