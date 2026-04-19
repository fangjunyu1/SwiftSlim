//
//  SettingsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct SettingsView: View {
    @Binding var selected: contentType
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 36) {
                // 开发者
                account
                // 支持
                support
                // 关于
                about
            }
            .padding(.bottom, 30)
        }
        .navigationTitle("Settings")
    }
    
    // 开发者
    var account: some View {
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                let name = NSLocalizedString("Developer", comment: "UserName")
                Text(verbatim: String(name.prefix(1)))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(24)
                    .background {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color("Linear1"), Color("Linear2")]), // 渐变的颜色
                                    startPoint: .topLeading, // 渐变的起始点
                                    endPoint: .bottomTrailing // 渐变的结束点
                                )
                            )
                    }
                // 开发者 + 免费账户
                VStack(alignment: .leading, spacing: 5) {
                    Text("Developer")
                        .fontWeight(.bold)
                    Text("Free Account")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                }
                Spacer()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background()
        .cornerRadius(30)
    }
    
    // 支持
    var support: some View {
        VStack(alignment: .leading) {
            Text("Support")
                .modifier(PromptText())
            VStack {
                SettingsItemView(item: .feedback)
                Divider()
                SettingsItemView(item: .privacy)
                Divider()
                SettingsItemView(item: .termsOfUse)
            }
            .modifier(SettingsBg())
        }
    }
    
    // 关于
    var about: some View {
        VStack(alignment: .leading) {
            Text("About")
                .modifier(PromptText())
            VStack {
                SettingsItemView(item: .aboutUs)
                Divider()
                SettingsItemView(item: .acknowLedgements)
                Divider()
                SettingsItemView(item: .openSource)
            }
            .modifier(SettingsBg())
        }
    }
}

struct SettingsItemView: View {
    @Environment(\.openURL) private var openURL
    let item: SettingsType
    var body: some View {
        switch item.action {
        case .destination(let anyView):
            NavigationLink(destination: anyView) {
                viewStack
            }
        case .url(let uRL):
            Link(destination: uRL) {
                viewStack
            }
        case .email:
            Button(action: {
                Email.sendFeedback(using: openURL)
            }, label: {
                viewStack
            })
        }
        
    }
    
    var viewStack: some View {
        HStack(spacing: 10) {
            Image(item.img)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 20)
                .foregroundStyle(.white)
                .padding(5)
                .background(item.color)
                .cornerRadius(10)
            Text(LocalizedStringKey(item.title))
                .foregroundStyle(Color("BlackColor"))
            Spacer()
            Image("right")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16)
                .foregroundStyle(Color.gray.opacity(0.8))
                .opacity(0.5)
        }
        .padding(8)
    }
}

#Preview {
    ZStack {
        NavigationView {
            SettingsView(selected: .constant(.settings))
                .modifier(BackgroundModifiers())
        }
        .navigationViewStyle(.stack)
        .tag(contentType.settings)
        ContentFrostedTabView(selectedTab: .constant(.settings))
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
