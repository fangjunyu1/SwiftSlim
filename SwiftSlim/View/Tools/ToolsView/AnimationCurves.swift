//
//  AnimationCurves.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

import SwiftUI

enum AnimationCurvesEnum: String, CaseIterable, Identifiable {
    
    var id: String {
        rawValue
    }
    
    case default1
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case smooth
    case snappy
    case bouncy
    case spring
    case interactiveSpring
    case interpolatingSpring
    
    var title: String {
        if rawValue == "default1" {
            ".default"
        } else {
            ".\(rawValue)"
        }
    }
    
    var describe: String {
        switch self {
        case .default1:
            "匀速动画，速度保持不变"
        case .linear:
            "匀速动画，速度保持不变"
        case .easeIn:
            "匀速动画，速度保持不变"
        case .easeInOut:
            "匀速动画，速度保持不变"
        case .easeOut:
            "匀速动画，速度保持不变"
        case .smooth:
            "匀速动画，速度保持不变"
        case .bouncy:
            "匀速动画，速度保持不变"
        case .spring:
            "匀速动画，速度保持不变"
        case .interpolatingSpring:
            "匀速动画，速度保持不变"
        case .interactiveSpring:
            "匀速动画，速度保持不变"
        
        case .snappy:
            "匀速动画，速度保持不变"
        }
    }
    
    var animation: Animation {
        switch self {
        case .default1:
                .default
        case .linear:
                .linear(duration: 1)
        case .easeIn:
                .easeIn(duration: 1)
        case .easeInOut:
                .easeInOut(duration: 1)
        case .easeOut:
                .easeOut(duration: 1)
        case .bouncy:
                .bouncy(duration: 1)
        case .smooth:
                .smooth(duration: 1)
        case .snappy:
                .snappy(duration: 1)
        case .spring:
                .spring(duration: 1)
        case .interactiveSpring:
                .interactiveSpring(duration: 1)
        case .interpolatingSpring:
                .interpolatingSpring(duration: 1)
        }
    }
}

struct AnimationCurves: View {
    @State private var playAllCurves = false
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // 标题和描述
                ToolHeaderView(tool: .Curves)
                
                // 播放全部按钮
                playAllButton
                
                // 动画列表
                animationList
                
                // 自定义动画
                customAnimation
            }
        }
        .navigationTitle("Animation Curves")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
    
    // 播放全部动画按钮
    var playAllButton: some View {
        Button(action:{
            playAllCurves = true
        }, label: {
            Text(verbatim: "全部播放对比")
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "36A392"))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
        })
    }
    
    // 动画列表
    var animationList: some View {
        VStack(spacing: 10) {
            ForEach(Array(AnimationCurvesEnum.allCases.enumerated()), id:\.offset) { index, item in
                AnimationCurvesItem(playAllCurves: $playAllCurves, curves: item)
                if index != AnimationCurvesEnum.allCases.count - 1 {
                    Divider()
                }
            }
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    // 自定义动画
    var customAnimation: some View {
        VStack {
            
        }
    }
}

struct AnimationCurvesItem: View {
    @State private var playCurves = false
    @State private var circleX = 0.0
    @State private var circleStartX = 0.0
    @State private var circleEntX = 0.0
    @Binding var playAllCurves: Bool
    var curves: AnimationCurvesEnum
    var body: some View {
        VStack {
            // 标题、描述和按钮
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(verbatim: curves.title)
                        .fontWeight(.medium)
                        .foregroundStyle(Color(hex: "36A392"))
                    Text(verbatim: curves.describe)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button(action: {
                    print("点击了按钮")
                    print("circleX:\(circleX),circleStartX:\(circleStartX),circleEntX:\(circleEntX)")
                    withAnimation(curves.animation) {
                        circleX = circleEntX
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        circleX = circleStartX
                    }
                }, label: {
                    Image("play")
                        .resizable()
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(Color(hex: "36A392"))
                        .frame(width: 20, height: 20)
                        .padding(3)
                        .background(Color(hex: "36A392").opacity(0.3))
                        .clipShape(Circle())
                })
            }
            
            // 动画
            ZStack {
                GeometryReader { geometry in
                    // 通过 `geometry` 获取布局信息
                    let width = geometry.size.width
                    ZStack {
                        Divider()
                        Circle()
                            .frame(width: 26, height: 26)
                            .foregroundStyle(Color(hex: "36A392"))
                            .offset(x: circleX)
                            .onAppear {
                                let travel = width - 26
                                circleStartX = -travel / 2
                                circleEntX = travel / 2
                                circleX = circleStartX
                            }
                            .onChange(of: playAllCurves) { item in
                                if playAllCurves == true {
                                    circleX = circleStartX
                                    withAnimation(curves.animation) {
                                        circleX = circleEntX
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        withAnimation(curves.animation) {
                                            circleX = circleStartX
                                        }
                                        playAllCurves = false
                                    }
                                }
                            }
                            .onChange(of: width) { newWidth in
                                let travel = newWidth - 26
                                circleStartX = -travel / 2
                                circleEntX = travel / 2
                                circleX = circleStartX
                            }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.secondary.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationView {
        AnimationCurves()
    }
}
