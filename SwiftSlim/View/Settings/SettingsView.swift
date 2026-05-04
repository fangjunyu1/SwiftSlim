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
    @State private var isLoadingAvatar = false
    
    private let supportItems: [SettingsType] = [
        .feedback, .privacy, .termsOfUse
    ]
    
    private let aboutItems: [SettingsType] = [
        .aboutUs, .acknowLedgements, .openSource
    ]
    
    private func loadAvatar() async {
        let imageName = appStorage.userImageName
        
        // 设置加载头像标识
        await MainActor.run {
            isLoadingAvatar = true
        }
        
        let image = await loadAvatarImage(imageName: imageName)
        
        // 如果头像发生变化，或者任务被取消，退出加载头像函数
        await MainActor.run {
            if Task.isCancelled {
                isLoadingAvatar = false
                return
            }
            
            appStorage.userImage = image
            isLoadingAvatar = false
        }
    }
    
    private func loadAvatarImage(imageName: String) async  -> UIImage? {
        
        let image: UIImage? = await Task.detached(priority: .utility) {
            
            // 1、先从 iCloud 获取头像文件
            if let data = try? iCloudFileManager.shared.read(fileName: "userProfileImage.jpg"), let image = UIImage(data: data) {
                print("从 iCloud 获取头像文件成功 ✅")
                return image
            }
            
            // 2、从本地获取头像文件
            guard !imageName.isEmpty else {
                print("无法从 iCloud 获取文件，本地保存的 imageName 为空，返回 nil")
                return nil
            }
            
            print("尝试从本地读取头像文件")
            
            // 每次读取时动态获取当前 Documents 路径
            let fileManager = FileManager.default
            let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = docURL.appendingPathComponent(imageName)
            
            print("本地头像文件，读取路径：\(fileURL.path)")
            print("本地头像文件存在：\(fileManager.fileExists(atPath: fileURL.path))")
            
            if let data = try? Data(contentsOf: fileURL), let image = UIImage(data: data) {
                print("从本地获取头像文件成功 ✅")
                return image
            }
            
            print("本地和 iCloud 都没有头像文件，返回 nil")
            return nil
        }.value
        
        return image
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
        .task(id: appStorage.avatarUpdatedUUID) {
            await loadAvatar()
        }
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
