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
    
    @Binding var selectedImage: UIImage?
    @Binding var userName: String
    @Binding var avatarUpdatedAt: Double
    
    @State private var name = ""
    @State private var draftImage: UIImage?
    @State private var saveStats: SettingsSaveStats = .prepar
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            // 用户头像
            SettingsEnum.userImageView(appStorage: appStorage, userName: userName, img: draftImage, size: 100, fontSize: .system(size: 50))
                .onTapGesture {
                    isImagePickerPresented = true
                }
            // 用户名称
            userNameTextField
            // 提示信息
            userTip
            // 确认和取消按钮
            button
            Spacer()
        }
        .modifier(BackgroundModifiers())
        .navigationTitle("profile card")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerViewController(selectedImage: $draftImage)
                .ignoresSafeArea()
        }
        .onAppear {
            name = userName
            draftImage = selectedImage
        }
    }
    
    private var userNameTextField: some View {
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
                
                userName = name
                appStorage.userName = name
                avatarUpdatedAt = Date().timeIntervalSince1970
                
                saveImage(image: draftImage)
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
                                .tint(.white)
                        }
                    }
                    .foregroundStyle(.white)
                }
            })
            .disabled(saveStats == .load)
            
            Button(action: {
                draftImage = selectedImage
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
}

#Preview {
    NavigationView {
        SettingsProfileView(selectedImage: .constant(nil), userName: .constant("123"), avatarUpdatedAt: .constant(Date().timeIntervalSince1970))
            .environmentObject(AppStorageManager.shared)
    }
}
