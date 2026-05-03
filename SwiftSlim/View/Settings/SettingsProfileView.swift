//
//  SettingsProfileView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/2.
//

import SwiftUI

enum SettingsSaveStats {
    case prepar
    case load
    case success
    case error
}

struct SettingsProfileView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var saveStats: SettingsSaveStats = .prepar
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            // 用户头像
            if selectedImage != nil {
                SettingsEnum.userImageView(appStorage: appStorage, img: selectedImage, size: 100, fontSize: .system(size: 50))
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            } else {
                SettingsEnum.userImageView(appStorage: appStorage, size: 100, fontSize: .system(size: 50))
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            }
            // 用户名称
            userName
            // 提示信息
            userTip
            // 确认和取消按钮
            button
            Spacer()
        }
        .modifier(BackgroundModifiers())
        .navigationTitle("profile card")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // 初始化用户名
            name = SettingsEnum.userName(appStorage: appStorage)
            // 初始化用户头像
            selectedImage = loadImage()
            // 从 iClod 获取用户头像
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerViewController(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
    }
    
    private var userName: some View {
        VStack(alignment: .leading) {
            Text("name")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 10)
            TextField("", text: $name)
                .padding(.horizontal, 20)
                .frame(height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .strokeBorder(lineWidth: 0.5)
                        .opacity(0.3)
                }
                .padding(.horizontal, 10)
        }
    }
    private var userTip: some View {
        Text("ProfilTip")
            .modifier(PromptGrayText())
            .multilineTextAlignment(.center)
    }
    
    private var button: some View {
        VStack(spacing: 16) {
            Button(action: {
                // 保存用户名
                saveStats = .load
                appStorage.userName = name
                saveImage(image: selectedImage)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundStyle(Color("AppColor2"))
                        .frame(width: 230, height: 55)
                    VStack {
                        if saveStats == .success {
                            Image(systemName: "checkmark")
                                .font(.system(size: 20).bold())
                        } else if saveStats == .prepar {
                            Text("save")
                                .fontWeight(.bold)
                        } else if saveStats == .error {
                            Image(systemName: "xmark")
                                .font(.system(size: 20).bold())
                        } else {
                            ProgressView()
                        }
                    }
                    .foregroundStyle(.white)
                }
            })
            .disabled(saveStats == .load)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("cancel")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            })
        }
    }
    
    // 保存图片
    private func saveImage(image: UIImage?) {
        do {
            try savelocalImage(image: image)
            saveUserImageToiCloud(image)
            print("保存文件成功，等待 1.5 秒，返回成功状态")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                saveStats = .success
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    saveStats = .prepar
                }
            }
        } catch {
            print("保存文件失败，等待 1.5 秒，返回报错状态")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                saveStats = .error
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    saveStats = .prepar
                }
            }
        }
    }
    private func savelocalImage(image: UIImage?) throws {
        guard let image = image,
              let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        let fileName = "userProfileImage.jpg"  // 只保存文件名
        let fileManager = FileManager.default
        let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(fileName)
        
        print("保存本地文件")
        try data.write(to: fileURL)
        appStorage.userImage = fileName  // 只存文件名，不存绝对路径
        print("本地文件保存成功：\(fileURL.path)")
    }
    
    // 保存 iCloud 文件
    func saveUserImageToiCloud(_ image: UIImage?) {
        guard let image = image, let data = image.jpegData(compressionQuality: 0.9) else { return }
        
        print("保存 iCloud 文件")
        do {
            try iCloudFileManager.shared.save(
                data: data,
                fileName: "userProfileImage.jpg"
            )
            print("iCloud 文件保存成功")
        } catch {
            print("iCloud 文件保存失败")
        }
    }
    
    private func loadImage() -> UIImage? {
        var image: UIImage?
        if let iCloudImage = loadUserImageFromiCloud() {
            image = iCloudImage
            return image
        } else if let localImage = loadlocalImage() {
            image = localImage
            return image
        }
        print("iCloud 和本地都没有头像文件，返回 nil")
        return image
    }
    
    private func loadlocalImage() -> UIImage? {
        print("尝试从本地读取头像文件")
        guard !appStorage.userImage.isEmpty else { return nil }
        
        // 每次读取时动态获取当前 Documents 路径
        let fileManager = FileManager.default
        let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(appStorage.userImage)
        
        print("本地头像文件，读取路径：\(fileURL.path)")
        print("本地头像文件存在：\(fileManager.fileExists(atPath: fileURL.path))")
        
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        print("从本地获取头像文件成功 ✅")
        return UIImage(data: data)
    }
    
    func loadUserImageFromiCloud() -> UIImage? {
        do {
            print("尝试从 iCloud 获取头像文件")
            let data = try iCloudFileManager.shared.read(
                fileName: "userProfileImage.jpg"
            )
            print("从 iCloud 获取头像文件成功 ✅")
            return UIImage(data: data)
        } catch {
            print("iCloud 头像文件获取失败：\(error.localizedDescription)")
            return nil
        }
    }
}

#Preview {
    NavigationView {
        SettingsProfileView()
            .environmentObject(AppStorageManager.shared)
    }
}
