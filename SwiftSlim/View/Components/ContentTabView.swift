//
//  ContentTabView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//
//  导航栏
//

import SwiftUI

struct ContentTabView: View {
    @Binding var selectedTab: contentType
    
    var body: some View {
        // 导航栏
        VStack {
            Spacer()
            HStack {
                Spacer()
                ForEach(contentType.allCases, id:\.rawValue) { item in
                    Spacer()
                    tabView(name: item.name, img: item.image, type: item, selectedTab: $selectedTab)
                    Spacer()
                }
                Spacer()
            }
            .padding(.vertical, 20)
            .background(
                Rectangle()
                    .fill(.regularMaterial)
                    .blur(radius: 3)
                    .opacity(0.9)
            )
        }
        .ignoresSafeArea()
    }
    
}

struct tabView: View {
    @State private var clicked = false
    var name: String
    var img: String
    var type: contentType
    @Binding var selectedTab: contentType
    
    var body: some View {
        let selected = selectedTab == type
        VStack {
            Image(img)
                .resizable()
                .renderingMode(.template)
                .scaleEffect(clicked ? 1.05 : 1)
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(selected ? Color.appColor : Color.gray)
            Text(LocalizedStringKey(name))
                .font(.footnote)
                .foregroundStyle(selected ? Color.appColor : Color.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !selected {
                withAnimation {
                    // 点击时修改 TabView
                    selectedTab = type
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    clicked = true
                    withAnimation {
                        clicked = false
                    }
                }
            }
        }
    }
}
enum contentType: Int, CaseIterable {
    case home = 0
    case courses
    case tools
    case settings
    
    var name: String {
        switch self {
        case .home:
            "Home"
        case .courses:
            "Courses"
        case .tools:
            "Tools"
        case .settings:
            "Settings"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            "homeHome"
        case .courses:
            "homeBook"
        case .tools:
            "homeTools"
        case .settings:
            "homeSetting"
        }
    }
}

#Preview {
    ContentView()
}
