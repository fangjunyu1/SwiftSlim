//
//  SettingsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @Binding var selected: contentType
    
    private let supportItems: [SettingsType] = [
        .feedback, .privacy, .termsOfUse
    ]
    
    private let aboutItems: [SettingsType] = [
        .aboutUs, .acknowLedgements, .openSource
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 16) {
                accountSection
                
                // 会员
                SettingsItemView(item: SettingsType.pro)
                    .cardStyle()
                
                // 支持
                settingsSection(
                    title: "Support",
                    items: supportItems
                )
                
                // 关于
                settingsSection(
                    title: "About",
                    items: aboutItems
                )
                
                versionSection
                
                // 测试按钮
                #if DEBUG
                testButton
                #endif
            }
            .padding(.bottom, 120)
            
        }
        .navigationTitle("Settings")
    }
}

private extension SettingsView {
    var testButton: some View {
        VStack(spacing: 16) {
            Button(action: {
                appStorage.hasCompletedOnboarding = false
            }, label: {
                Text(verbatim: "重制引导页")
                    .font(.caption2)
            })
            .buttonStyle(.plain)
            
            Button(action: {
                appStorage.isLifetime = false
                appStorage.expirationDate = 0
            }, label: {
                Text(verbatim: "重制会员")
                    .font(.caption2)
            })
            .buttonStyle(.plain)
        }
        .foregroundStyle(Color.gray)
    }
}

private extension SettingsView {
    var versionSection: some View {
        HStack {
            Text(verbatim: Bundle.main.version + "（" +  Bundle.main.build + "）")
        }
        .modifier(Caption2Text())
    }
}

private extension SettingsView {
    var accountSection: some View {
        NavigationLink(destination: {
            SettingsProfileView()
        }, label: {
            HStack(spacing: 20) {
                // 用户头像
                SettingsEnum.userImageView(displayName: appStorage.userDisplayName, image: appStorage.userImage, size: 68, fontSize: .title)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(appStorage.userDisplayName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Free Account")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
                
                Image("right")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.gray.opacity(0.8))
                    .opacity(0.5)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .cardStyle()
        })
    }
    
    @ViewBuilder
    func settingsSection(title: LocalizedStringKey, items: [SettingsType]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
//            Text(title)
//                .modifier(PromptText())
            
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element) { index, item in
                    SettingsItemView(item: item)
                    
                    if index != items.count - 1 {
                        Divider()
                            .padding(.leading, 46)
                    }
                }
            }
            .cardStyle()
        }
    }
}

// MARK: - Reusable Style
private extension View {
    func cardStyle() -> some View {
        self
            .background(Color("WhiteAndBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    NavigationView {
        SettingsView(selected: .constant(.settings))
            .modifier(BackgroundModifiers())
            .environmentObject(AppStorageManager.shared)
    }
}
