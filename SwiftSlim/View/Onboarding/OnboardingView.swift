//
//  OnboardingView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/10.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    @State private var step = OnboardingStep.learnSwiftUI
    let numberOfCourses = 20
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                Spacer().frame(height: 40)
                
                // TabView 动画和文字
                TabView(selection: $step) {
                    ForEach(OnboardingStep.allCases) { item in
                        OnboardingPageContainer(
                            step: step,
                            currentStep: item,
                            numberOfCourses: numberOfCourses
                        )
                        .tag(item)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // 进度条
                progressView
                // 按钮
                actionButton
                
                Spacer().frame(height: 30)
            }
            // 跳过按钮
            headerView
                .padding(.top, 40)
                .padding(.trailing, 40)
                .zIndex(10)
        }
        .animation(.spring(response: 0.45, dampingFraction: 0.88), value: step)
    }
    
    // 跳过按钮
    private var headerView: some View {
        Button("Skip") {
            appStorage.hasCompletedOnboarding = true
        }
        .foregroundStyle(.gray)
        .opacity(step == .areYouReady ? 0 : 1)
    }
    
    // 进度条
    private var progressView: some View {
        HStack {
            ForEach(OnboardingStep.allCases, id:\.self) { item in
                Capsule()
                    .fill(step == item ? Color.blue : Color.gray.opacity(0.5))
                    .frame(width: step == item ? 30 : 10, height: 10)
                    .animation(.spring(response: 0.35, dampingFraction: 0.85), value: step)
            }
        }
        .padding(30)
    }
    
    // 下一步按钮
    private var actionButton: some View {
        Button(action: {
            if let next = step.next() {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.88)) {
                    step = next
                }
            } else {
                withAnimation {
                    appStorage.hasCompletedOnboarding = true
                }
            }
        }, label: {
            HStack {
                Text(LocalizedStringKey(step.buttonTitle.0))
                    .fontWeight(.bold)
                
                Text(verbatim: step.buttonTitle.1)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .frame(width: 240,height: 60)
            .background(Color(hex: "3762E3"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        })
        .buttonStyle(PressScaleButtonStyle())
    }
}

struct PressScaleButtonStyle: ButtonStyle {
    var scale: CGFloat = 0.9
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
}
