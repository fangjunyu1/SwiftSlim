//
//  SettingsProfileView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/2.
//

import SwiftUI

struct SettingsProfileView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var saveStats = false
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
            // 初始化用户图标
            selectedImage = loadImage()
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
                appStorage.userName = name
                saveImage(image: selectedImage)
                saveStats = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    saveStats = false
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundStyle(Color("AppColor2"))
                        .frame(width: 230, height: 55)
                    VStack {
                        if saveStats {
                            Image(systemName: "checkmark")
                                .font(.system(size: 20).bold())
                        } else {
                            Text("save")
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundStyle(.white)
                }
            })
            .disabled(saveStats)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("cancel")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            })
        }
    }
    
    private func saveImage(image: UIImage?) {
        guard let image = image,
              let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        let fileName = "userProfileImage.jpg"  // 只保存文件名
        let fileManager = FileManager.default
        let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(fileName)
        do {
            try data.write(to: fileURL)
            appStorage.userImage = fileName  // 只存文件名，不存绝对路径
            print("保存成功：\(fileURL.path)")
        } catch {
            print("保存失败：\(error)")
        }
    }
    
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
    
}

#Preview {
    NavigationView {
        SettingsProfileView()
            .environmentObject(AppStorageManager.shared)
    }
}
