//
//  ContentSidebarTabView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/26.
//

import SwiftUI

struct ContentSidebarTabView: View {
    @Binding var selectedTab: contentType
    let settings = contentType.settings
    private var mark: some View {
        // 轻学编程标识
        HStack(spacing: 16) {
            Image("app")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .cornerRadius(5)
            VStack(alignment: .leading, spacing: 2) {
                Text(Bundle.main.appName)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Minimal UI")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
            .padding(.trailing, 20)
        }
    }
    
    var body: some View {
        // 导航栏
        VStack {
            mark
                .padding(.top, 20)
                .padding(.bottom, 30)
            
            // 首页、课程、工具箱
            VStack(spacing: 10) {
                ForEach(contentType.allCases.filter {$0 != .settings}, id:\.rawValue) { item in
                    tabView(name: item.name, img: item.image, type: item, selectedTab: $selectedTab)
                }
            }
            
            Spacer()
            
            // 设置按钮
            tabView(name: settings.name, img: settings.image, type: settings, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
    }
}

private struct tabView: View {
    var name: String
    var img: String
    var type: contentType
    @Binding var selectedTab: contentType
    
    var body: some View {
        let selected = selectedTab == type
        HStack(spacing: 24) {
            Image(img)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 28)
                .foregroundStyle(selected ? Color("AppColor") : Color.gray)
            Text(LocalizedStringKey(name))
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(selected ? Color("AppColor") : Color.gray)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(selected ? Color("AppColor").opacity(0.08) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contentShape(Rectangle())
        .onTapGesture {
            if !selected {
                withAnimation {
                    // 点击时修改 TabView
                    selectedTab = type
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppStorageManager.shared)
        .environmentObject(IAPManager.shared)
}
