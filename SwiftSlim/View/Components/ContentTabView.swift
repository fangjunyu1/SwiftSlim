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
                ForEach(contentType.allCases, id:\.rawValue) { item in
                    tabView(name: item.name, img: item.image, type: item, selectedTab: $selectedTab)
                }
            }
            .padding(.vertical,12)
            .padding(.horizontal,20)
            .background(
                HStack {
                    Rectangle()
                        .fill(Color("WhiteAndGrayBackground"))
                        .frame(width: 90,height: 58)
                        .cornerRadius(40)
                        .offset(x:10)
                        .offset(x: CGFloat(77) * CGFloat(selectedTab.rawValue))
                        .opacity(0.8)
                    Spacer()
                }
            )
            .background(
                Rectangle()
                    .fill(.regularMaterial)
                    .blur(radius: 3)
                    .cornerRadius(100)
                    .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                    .opacity(0.9)
            )
            .cornerRadius(50)
        }
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
                .scaleEffect(clicked ? 1.1 : 1)
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(selected ? Color.blue : Color.gray)
            Text(LocalizedStringKey(name))
                .font(.footnote)
                .foregroundStyle(selected ? Color.blue : Color.gray)
        }
        .frame(width: 70)
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
