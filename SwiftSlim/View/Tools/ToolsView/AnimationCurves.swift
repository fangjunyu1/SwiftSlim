//
//  AnimationCurves.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

//
//  AnimationCurves.swift
//  SwiftSlim
//

import SwiftUI

// MARK: - Enum

enum AnimationCurvesEnum: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
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
        rawValue == "default1" ? ".default" : ".\(rawValue)"
    }
    
    var describe: String {
        switch self {
        case .default1:         "System default curve, typically easeInOut"
        case .linear:           "Linear animation with constant speed throughout"
        case .easeIn:           "Gradually accelerates from slow to fast"
        case .easeOut:          "Gradually decelerates from fast to slow"
        case .easeInOut:        "Smooth transition with acceleration then deceleration"
        case .smooth:           "Smoother than easeInOut, more natural feel"
        case .snappy:           "Fast response with slight springy finish"
        case .bouncy:           "Bounce effect with overshoot and return"
        case .spring:           "Spring animation with natural physical elasticity"
        case .interactiveSpring:"Spring tuned for gestures, more responsive"
        case .interpolatingSpring:"Physics-based spring interpolation with precise control parameters"
        }
    }
    
    func animation(duration: Double = 1.0) -> Animation {
        switch self {
        case .default1:             .default
        case .linear:               .linear(duration: duration)
        case .easeIn:               .easeIn(duration: duration)
        case .easeInOut:            .easeInOut(duration: duration)
        case .easeOut:              .easeOut(duration: duration)
        case .bouncy:               .bouncy(duration: duration)
        case .smooth:               .smooth(duration: duration)
        case .snappy:               .snappy(duration: duration)
        case .spring:               .spring(duration: duration)
        case .interactiveSpring:    .interactiveSpring(duration: duration)
        case .interpolatingSpring:  .interpolatingSpring(duration: duration)
        }
    }
}

// MARK: - Main View

struct AnimationCurves: View {
    @EnvironmentObject var appStorage: AppStorageManager
    /// 用时间戳触发"全部播放"，避免多个 item 的 asyncAfter 互相竞争重置 Bool
    @State private var playAllTrigger: Date? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ToolHeaderView(tool: .Curves)
                playAllButton
                animationList
                customSpringSection
            }
            .padding(.bottom, 40)
        }
        .navigationTitle("Animation Curves")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
    
    // MARK: 全部播放按钮
    private var playAllButton: some View {
        Button {
            playAllTrigger = Date()
        } label: {
            HStack {
                Image(systemName: "play.fill")
                Text("Play All Comparisons")
                    .fontWeight(.bold)
            }
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color("CurvesColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
    
    // MARK: 动画列表
    private var animationList: some View {
        VStack(spacing: 10) {
            ForEach(Array(AnimationCurvesEnum.allCases.enumerated()), id: \.offset) { index, item in
                AnimationCurvesItem(playAllTrigger: $playAllTrigger, curves: item)
                if index != AnimationCurvesEnum.allCases.count - 1 {
                    Divider()
                }
            }
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    // MARK: 自定义弹簧动画
    private var customSpringSection: some View {
        CustomSpringAnimationView()
    }
}

// MARK: - Animation Item

struct AnimationCurvesItem: View {
    
    @State private var circleX: Double = 0
    @State private var circleStartX: Double = 0
    @State private var circleEndX: Double = 0
    @State private var isPlaying = false
    
    @Binding var playAllTrigger: Date?
    var curves: AnimationCurvesEnum
    
    var body: some View {
        VStack(spacing: 10) {
            // 标题行
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(curves.title)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("CurvesColor"))
                    Text(LocalizedStringKey(curves.describe))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                playButton
            }
            
            // 动画轨道
            animationTrack
        }
        .padding(.vertical, 6)
    }
    
    // MARK: 播放按钮
    private var playButton: some View {
        Button {
            guard !isPlaying else { return }
            playAnimation()
        } label: {
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .foregroundStyle(Color("CurvesColor"))
                .frame(width: 16, height: 16)
                .padding(8)
                .background(Color("CurvesColor").opacity(0.15))
                .clipShape(Circle())
        }
        .disabled(isPlaying)
    }
    
    // MARK: 动画轨道
    private var animationTrack: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            ZStack {
                // 轨道线
                Capsule()
                    .fill(Color.secondary.opacity(0.2))
                    .frame(height: 3)
                    .padding(.horizontal, 16)
                
                // 动画圆球
                Circle()
                    .fill(Color("CurvesColor"))
                    .frame(width: 24, height: 24)
                    .shadow(color: Color("CurvesColor").opacity(0.4), radius: isPlaying ? 6 : 0, y: 2)
                    .offset(x: circleX)
                    .onAppear { setupPositions(width: width) }
                    .onChange(of: width) { newWidth in setupPositions(width: newWidth) }
                    .onChange(of: playAllTrigger) { _ in
                        guard !isPlaying else { return }
                        playAnimation()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 40)
        .padding(.vertical, 6)
        .padding(.horizontal, 4)
        .background(Color.secondary.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
    // MARK: 辅助方法
    private func setupPositions(width: Double) {
        let travel = width - 32
        circleStartX = -travel / 2
        circleEndX = travel / 2
        if !isPlaying { circleX = circleStartX }
    }
    
    private func playAnimation() {
        isPlaying = true
        circleX = circleStartX
        
        withAnimation(curves.animation()) {
            circleX = circleEndX
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(curves.animation()) {
                circleX = circleStartX
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isPlaying = false
            }
        }
    }
}

// MARK: - Custom Spring View

struct CustomSpringAnimationView: View {
    @State private var duration: Double = 0.8
    @State private var bounce: Double = 0.3
    @State private var circleX: Double = 0
    @State private var circleStartX: Double = 0
    @State private var circleEndX: Double = 0
    @State private var isPlaying = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 标题
            HStack {
                Label("Custom Spring Animation", systemImage: "slider.horizontal.3")
                    .font(.headline)
                    .foregroundStyle(Color("CurvesColor"))
                Spacer()
            }
            
            // 参数控制
            VStack(spacing: 12) {
                paramSlider(
                    label: "Duration",
                    value: $duration,
                    range: 0.2...2.0,
                    format: "%.1f s"
                )
                paramSlider(
                    label: "Bounce",
                    value: $bounce,
                    range: 0.0...1.0,
                    format: "%.2f"
                )
            }
            
            // 预览轨道
            GeometryReader { geometry in
                let width = geometry.size.width
                ZStack {
                    Capsule()
                        .fill(Color.secondary.opacity(0.2))
                        .frame(height: 3)
                        .padding(.horizontal, 16)
                    
                    Circle()
                        .fill(Color("CurvesColor"))
                        .frame(width: 24, height: 24)
                        .shadow(color: Color("CurvesColor").opacity(0.4), radius: isPlaying ? 6 : 0, y: 2)
                        .offset(x: circleX)
                        .onAppear { setupPositions(width: width) }
                        .onChange(of: width) { newWidth in setupPositions(width: newWidth) }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 40)
            .padding(.vertical, 6)
            .padding(.horizontal, 4)
            .background(Color.secondary.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            // 播放按钮
            Button {
                guard !isPlaying else { return }
                playAnimation()
            } label: {
                HStack {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    Text(isPlaying ? "Playing..." : "Preview Effect")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(isPlaying ? Color.gray : Color("CurvesColor"))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .disabled(isPlaying)
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    private func paramSlider(
        label: String,
        value: Binding<Double>,
        range: ClosedRange<Double>,
        format: String
    ) -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(LocalizedStringKey(label))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(String(format: format, value.wrappedValue))
                    .font(.subheadline.monospacedDigit())
                    .foregroundStyle(Color("CurvesColor"))
            }
            Slider(value: value, in: range)
                .tint(Color("CurvesColor"))
        }
    }
    
    private func setupPositions(width: Double) {
        let travel = width - 32
        circleStartX = -travel / 2
        circleEndX = travel / 2
        if !isPlaying { circleX = circleStartX }
    }
    
    private func playAnimation() {
        let anim = Animation.spring(duration: duration, bounce: bounce)
        isPlaying = true
        circleX = circleStartX
        
        withAnimation(anim) { circleX = circleEndX }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.5) {
            withAnimation(anim) { circleX = circleStartX }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.3) {
                isPlaying = false
            }
        }
    }
}

#Preview {
    NavigationView {
        AnimationCurves()
    }
}
