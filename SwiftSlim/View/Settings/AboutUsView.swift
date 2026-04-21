//
//  AboutUsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/18.
//

import SwiftUI

struct AboutUsView: View {
    @Environment(\.openURL) var openURL
    @State private var showFangPhoto = false
    
    // App 本地化名称
    private var appName: String {
        Bundle.main.appName
    }
    
    // “作者”翻译
    private var author: String {
        NSLocalizedString("Author", comment: "作者")
    }
    
    // 照片名称
    private var photoName: String {
        showFangPhoto ? "FangJunyu" : "FangJunyuIcon"
    }
    
    // 关于作者
    let aboutAuthorBodyArray = ["about_author_body1","about_author_body2","about_author_body3","about_author_body4","about_author_body5"]
    
    // 产品初衷
    let whyThisAppArray = ["why_this_app1","why_this_app2","why_this_app3"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                // 方君宇
                FangJunyu
                // 关于作者
                AboutAuthor
                // 产品初衷
                WhyThisApp
                // 联系我们
                ContactUs
                // 更多作品
                MoreApps
            }
            .multilineTextAlignment(.center)
        }
        .navigationTitle("About Us")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
    
    // 方君宇
    var FangJunyu: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "Fang Junyu",
                describe: "《\(appName)》\(author)"
            )
            // 关于作者
            Button(action: {
                withAnimation {
                    showFangPhoto.toggle()
                }
            }, label: {
                Image(photoName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .cornerRadius(8)
                    .shadow(radius: 3)
            })
            Text("Hello, I’m Fang Junyu, an independent developer from China and the author of \(appName).")
                .modifier(PromptText())
                .padding(.top, 20)
        }
    }
    
    // 关于作者
    var AboutAuthor: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "About the Author",
                describe: "From Self-Taught to Indie Dev"
            )
            VStack(spacing: 10) {
                ForEach(aboutAuthorBodyArray, id:\.self) { item in
                    Text(LocalizedStringKey(item))
                        .modifier(PromptText())
                }
            }
        }
    }
    
    // 产品初衷
    var WhyThisApp: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "Why This App",
                describe: "Why I Built This App"
            )
            VStack(spacing: 10) {
                ForEach(whyThisAppArray, id:\.self) { item in
                    Text(LocalizedStringKey(item))
                        .modifier(PromptText())
                }
            }
        }
    }
    
    // 联系我们
    var ContactUs: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "Contact Us",
                describe: "Feedback and issues are welcome"
            )
            VStack(spacing: 10) {
                // 邮箱
                HStack(spacing: 0) {
                    Text("Email")
                    Text(verbatim: " : ")
                    Text(verbatim: "fangjunyu.com@gmail.com")
                }
                // 网站
                HStack(spacing: 0) {
                    Text("Website")
                    Text(verbatim: " : ")
                    Text(verbatim: "www.fangjunyu.com")
                }
                // 反馈标语
                Text("If you run into any confusion while learning, or have any suggestions for the app, you can let me know through “Feedback” in Settings. I will carefully read every piece of feedback.")
            }
            .modifier(PromptText())
        }
    }
    
    // 更多作品
    var MoreApps: some View {
        VStack {
            AcknowLedgementsTitle(
                title: "More Apps",
                describe: "A collection of iOS & macOS apps"
            )
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(AppStoreItem.allCases) { item in
                        Button(action: {
                            // 打开方君宇的 AppStore 页面
                            openURL(item.link)
                        }, label: {
                            Image(item.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                        })
                    }
                }
            }
            Button(action: {
                // 打开方君宇的 AppStore 页面
                openURL(URL(string: "https://apps.apple.com/cn/developer/%E5%90%9B%E5%AE%87-%E6%96%B9/id1746520472")!)
            }, label: {
                Text(verbatim: "App Store")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .background(Color("AppColor"))
                    .cornerRadius(10)
                    .shadow(radius: 3)
            })
            .padding(.vertical, 20)
        }
    }
}

#Preview {
    VStack {
        AboutUsView()
            .environmentObject(AppStorageManager.shared)
    }
}
