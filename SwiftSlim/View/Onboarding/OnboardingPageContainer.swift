//
//  OnboardingPageContainer.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

struct OnboardingPageContainer: View {
    let currentStep: OnboardingStep
    var body: some View {
        VStack(spacing: 30) {
            animationArea
            textArea
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 30)
    }
    
    // 动画区域
    private var animationArea: some View {
        ZStack {
            switch currentStep {
            case .learnSwiftUI:
                LearnSwiftUIStage()
                
            case .startLessons:
                StartLessonsStage()
                
            case .toolBox:
                ToolboxStage()
                
            case .areYouReady:
                ReadyStage()
            }
        }
        .frame(height: 300)
    }
    
    // 文字区域
    private var textArea: some View {
        VStack(spacing: 16) {
            Text(LocalizedStringKey(currentStep.title))
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(LocalizedStringKey(currentStep.description))
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 10)
    }
}

// 轻松学 SwiftUI
struct LearnSwiftUIStage: View {
    @State private var animateIn = false
//    let step: OnboardingStep
    let hello = "Hello"
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("contentView")
                .resizable()
                .scaledToFit()
                .frame(width: 280)
                .shadow(radius: 10)
                .scaleEffect(animateIn ? 1 : 0.96)
                .animation(.easeOut(duration: 0.35), value: animateIn)
            HelloTag(hello: hello)
                .scaleEffect(animateIn ? 1 : 0.2)
                .opacity(animateIn ? 1 : 0)
                .offset(y: animateIn ? 20 : 80)
                .animation(.spring(response: 0.5, dampingFraction: 0.82).delay(0.1), value: animateIn)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        ))
        .onAppear {
            animateIn = false
            DispatchQueue.main.async {
                animateIn = true
            }
        }
//        .onChange(of: step) { _ in
//            animateIn = false
//            DispatchQueue.main.async {
//                animateIn = true
//            }
//        }
    }
}

// 入门课程
struct StartLessonsStage: View {
    let numberOfCourses = 20
//    let step: OnboardingStep
    @State private var animateIn = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Card(numberOfCourses: numberOfCourses)
                .offset(y: animateIn ? 0 : 40)
                .opacity(animateIn ? 1 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.86), value: animateIn)
            
            CourseBadges(numberOfCourses: numberOfCourses)
                .scaleEffect(animateIn ? 1 : 0.2)
                .opacity(animateIn ? 1 : 0)
                .offset(x: -20, y: 80)
                .animation(.interpolatingSpring(stiffness: 260, damping: 11).delay(0.15), value: animateIn)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        ))
        .onAppear {
            animateIn = false
            DispatchQueue.main.async {
                animateIn = true
            }
        }
    }
}

// 开发者工具箱
struct ToolboxStage: View {
    @State private var animateIn = false
//    let step: OnboardingStep
    
    var body: some View {
        ZStack {
            // 背景色
            RadialGradient(
                gradient: Gradient(colors: [Color("LightPurple")]),
                center: .center,
                startRadius: 20,
                endRadius: 200
            )
            .frame(width: 200, height: 200)
            .cornerRadius(90)
            .blur(radius: 40)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    toolboxItem(image: "fenlei", imageColor: "D9622B", backgroundColor: "FFEED5", delay: 0.00)
                    toolboxItem(image: "mokuai", imageColor: "883AE2", backgroundColor: "E7D8FF", delay: 0.08)
                }
                
                HStack(spacing: 20) {
                    toolboxItem(image: "book", imageColor: "4EAE54", backgroundColor: "E9FBEC", delay: 0.16)
                    toolboxItem(image: "danger", imageColor: "CA3A32", backgroundColor: "FFDDDD", delay: 0.24)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            ))
        }
        .onAppear {
            animateIn = false
            DispatchQueue.main.async {
                animateIn = true
            }
        }
    }
    
    // 工具箱视图
    private func toolboxItem(
        image: String,
        imageColor: String,
        backgroundColor: String,
        delay: Double
    ) -> some View {
        DeveloperToolbox(
            image: image,
            imageColor: imageColor,
            backgroundColor: backgroundColor
        )
        .offset(y: animateIn ? 0 : 60)
        .opacity(animateIn ? 1 : 0)
        .animation(.spring(response: 0.48, dampingFraction: 0.82).delay(delay), value: animateIn)
    }
}

// 准备好了吗？
struct ReadyStage: View {
    @State private var animateIn = false
//    let step: OnboardingStep
    
    var body: some View {
        ZStack {
            Image("app")
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .cornerRadius(30)
                .overlay {
                    Image("start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .offset(x: 60, y: -60)
                        .scaleEffect(animateIn ? 1 : 0.2)
                        .opacity(animateIn ? 1 : 0)
                        .animation(.spring(response: 0.45, dampingFraction: 0.75).delay(0.15), value: animateIn)
                }
                .rotationEffect(.degrees(animateIn ? 0 : -180))
                .scaleEffect(animateIn ? 1 : 0.5)
                .opacity(animateIn ? 1 : 0)
                .background {
                    RadialGradient(
                        gradient: Gradient(colors: [Color(hex: "1000E3")]),
                        center: .center,
                        startRadius: 20,
                        endRadius: 200
                    )
                    .frame(width: 210, height: 210)
                    .opacity(0.5)
                    .cornerRadius(90)
                    .blur(radius: 40)
                }
                .frame(height: 250)
                .animation(.spring(response: 0.65, dampingFraction: 0.8), value: animateIn)
            
            RotatingBorderView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        ))
        .onAppear {
            animateIn = false
            DispatchQueue.main.async {
                animateIn = true
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
}
