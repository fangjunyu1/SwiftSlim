//
//  ContentFrostedTabView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import SwiftUI

// 磨砂底部导航栏
struct ContentFrostedTabView: View {
    @Binding var selectedTab: contentType
    
    var body: some View {
        // 导航栏
        VStack {
            Spacer()
            HStack {
                ForEach(contentType.allCases, id:\.rawValue) { item in
                    frostedTabView(name: item.name, img: item.image, type: item, selectedTab: $selectedTab)
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
                        .offset(x: 6)
                        .offset(x: CGFloat(70) * CGFloat(selectedTab.rawValue))
                        .opacity(0.8)
                    Spacer()
                }
            )
            .background(
                Rectangle()
                    .fill(.regularMaterial)
                    .blur(radius: 3)
                    .cornerRadius(100)
                    .shadow(color: .gray.opacity(0.3), radius: 10, y: 5)
                    .opacity(0.9)
            )
            .cornerRadius(50)
        }
        .ignoresSafeArea()
        .padding(.bottom, UIDevice.isPhone ? 3 : 30)
    }
    
}

struct frostedTabView: View {
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
                .frame(width: 24)
                .foregroundStyle(selected ? Color("AppColor") : Color.gray)
            Text(LocalizedStringKey(name))
                .font(.footnote)
                .foregroundStyle(selected ? Color("AppColor") : Color.gray)
        }
        .frame(width: 63)
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

#Preview {
    ContentView()
}
