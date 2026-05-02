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
    private var selectedImage: UIImage? {
        loadImage()
    }
    
    private let supportItems: [SettingsType] = [
        .feedback, .privacy, .termsOfUse
    ]
    
    private let aboutItems: [SettingsType] = [
        .aboutUs, .acknowLedgements, .openSource
    ]
    
    private func loadImage() -> UIImage? {
        guard !appStorage.userImage.isEmpty else { return nil }
        
        // 每次读取时动态获取当前 Documents 路径
        let fileManager = FileManager.default
        let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(appStorage.userImage)
        
        print("读取路径：\(fileURL.path)")
        print("文件存在：\(fileManager.fileExists(atPath: fileURL.path))")
        
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 36) {
                accountSection
                
                settingsSection(
                    title: "Support",
                    items: supportItems
                )
                
                settingsSection(
                    title: "About",
                    items: aboutItems
                )
                
                versionSection
            }
            .padding(.bottom, 120)
            
        }
        .navigationTitle("Settings")
    }
}

private extension SettingsView {
    var versionSection: some View {
        HStack {
            Text(verbatim: Bundle.main.version + "（" +  Bundle.main.build + "）")
        }
        .modifier(NotesText())
    }
}

private extension SettingsView {
    var accountSection: some View {
        NavigationLink(destination: {
            SettingsProfileView()
        }, label: {
            HStack(spacing: 20) {
                // 用户头像
                if selectedImage != nil {
                    SettingsEnum.userImageView(appStorage: appStorage, img: selectedImage, size: 68, fontSize: .title)
                } else {
                    SettingsEnum.userImageView(appStorage: appStorage, size: 68, fontSize: .title)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text( SettingsEnum.userName(appStorage: appStorage))
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
            Text(title)
                .modifier(PromptText())
            
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
