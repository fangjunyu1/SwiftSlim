//
//  AcknowLedgementsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/18.
//
// 鸣谢视图

import SwiftUI

struct AcknowLedgementsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // 开发者鸣谢
                Acknowledgements
                
                // 资源与技术
                ResourcesSupport
                
                // 第三方库支持
                ThirdPartyLibraries
            }
            .padding(.bottom, 50)
        }
        .navigationTitle("Acknowledgements")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
    
    // 开发者鸣谢
    var Acknowledgements: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "Acknowledgements2",
                describe: "Thanks to every user for downloading, using, and supporting."
            )
            // 致谢动画
            LottieView(filename: "ThanksAnimation")
                .modifier(LottieModifier())
        }
    }
    
    // 资源与技术
    var ResourcesSupport: some View {
        let imgs: [String] = ["LottieFiles","Freepik","iconfont","magicpatterns","GitHub"]
        return VStack {
            AcknowLedgementsTitle(
                title: "Resources & Support",
                describe: "Thanks to the following platforms for their resources and technical support."
            )
            ForEach(imgs, id:\.self) { img in
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .padding(.vertical,3)
            }
        }
    }
    
    // 第三方库支持
    var ThirdPartyLibraries: some View {
        let imgs: [String] = ["splash","MarkdownUI"]
        return VStack {
            AcknowLedgementsTitle(
                title: "Third-Party Libraries",
                describe: "Thanks to the following open-source projects for their support in this app."
            )
            ForEach(imgs, id:\.self) { img in
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .padding(.vertical,3)
            }
        }
    }
}

struct AcknowLedgementsTitle: View {
    let title: String
    let describe: String
    var body: some View {
        VStack(spacing: 16) {
            Text(LocalizedStringKey(title))
                .modifier(SettingsTitle())
                .multilineTextAlignment(.center)
            Text(LocalizedStringKey(describe))
                .modifier(PromptGrayText())
                .multilineTextAlignment(.center)
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
