//
//  OnboardingPageContainer.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

struct OnboardingPageContainer: View {
    let step: OnboardingStep
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
            Text(LocalizedStringKey(step.title))
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(LocalizedStringKey(step.description))
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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("contentView")
                .resizable()
                .scaledToFit()
                .frame(width: 280)
                .shadow(radius: 10)
                .scaleEffect(animateIn ? 1 : 0.96)
                .opacity(animateIn ? 1 : 0)
                .animation(.easeOut(duration: 0.35), value: animateIn)
            
            helloTag
                .offset(y: animateIn ? 20 : 80)
                .opacity(animateIn ? 1 : 0)
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
    }
    
    private var helloTag: some View {
        HStack {
            Text(verbatim: "</>")
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Color(hex: "176ACD"))
                .padding(5)
                .background(
                    Circle()
                        .fill(Color(hex: "DEEAFC"))
                        .frame(width: 25, height: 25)
                )
            
            Text(verbatim: "Hello, SwiftUI!")
                .font(.footnote)
                .fontWeight(.bold)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color("WhiteAndGrayBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.gray.opacity(0.3), radius: 5)
    }
}

// 入门课程
struct StartLessonsStage: View {
    let numberOfCourses = 20
    @State private var animateIn = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            card
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
    
    private var card: some View {
        VStack(spacing: 20) {
            HStack {
                // 第一章
                Text("Chapter 1")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(hex: "4E47DD"))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color(hex: "EFF2FE"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                // 20 课时
                Text("\(numberOfCourses) lessons")
                    .foregroundStyle(.gray)
            }
            
            HStack {
                Text("Basics")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    lessonRow(icon: "checkmark.circle", width: 160, isDone: true)
                    lessonRow(icon: "checkmark.circle", width: 100, isDone: true)
                    lessonRow(icon: "circle", width: 160, isDone: false)
                }
                Spacer()
            }
        }
        .padding(20)
        .frame(width: 300)
        .background(Color("WhiteAndGrayBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color(hex: "5335FF").opacity(0.3), radius: 10, y: 6)
    }
    
    private func lessonRow(icon: String, width: CGFloat, isDone: Bool) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .foregroundStyle(isDone ? Color(hex: "34CB46") : .gray)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: width, height: 14)
                .foregroundStyle(Color("LightGray"))
        }
    }
}

// 开发者工具箱
struct ToolboxStage: View {
    @State private var animateIn = false
    
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
        VStack(spacing: 20) {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(Color(hex: imageColor))
                .padding(10)
                .background(Color(hex: backgroundColor))
                .cornerRadius(10)
            
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .frame(width: 100, height: 14)
                .foregroundStyle(Color("LightGray"))
        }
        .padding(16)
        .frame(width: 140)
        .background(Color("WhiteAndGrayBackground"))
        .cornerRadius(20.0)
        .shadow(color: Color.gray.opacity(0.3), radius: 3)
        .offset(y: animateIn ? 0 : 60)
        .opacity(animateIn ? 1 : 0)
        .animation(.spring(response: 0.48, dampingFraction: 0.82).delay(delay), value: animateIn)
    }
}

struct ReadyStage: View {
    @State private var animateIn = false
    
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
                    .frame(width: 250, height: 250)
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

// 开发者工具箱独立视图
struct DeveloperToolbox: View {
    let image: String
    let imageColor: String
    let backgroundColor: String
    var body: some View {
        VStack(spacing: 20) {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(Color(hex: imageColor))
                .padding(10)
                .background(Color(hex: backgroundColor))
                .cornerRadius(10)
            
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .frame(width: 100, height: 14)
                .foregroundStyle(Color("LightGray"))
        }
        .padding(16)
        .frame(width: 140)
        .background(Color("WhiteAndGrayBackground"))
        .cornerRadius(20.0)
        .shadow(color: Color.gray.opacity(0.3), radius: 3)
    }
}

// 课时图标
struct CourseBadges: View {
    var numberOfCourses: Int
    var body: some View {
        VStack {
            Text(verbatim: "\(numberOfCourses)+")
                .font(.title)
                .fontWeight(.black)
            Text(verbatim:"LESSONS")
                .font(.caption2)
                .fontWeight(.bold)
        }
        .foregroundStyle(Color.white)
        .background {
            let size = 90.0
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "f3c766"), Color(hex: "de954c")]), // 渐变的颜色
                    startPoint: .topLeading, // 渐变的起始点
                    endPoint: .bottomTrailing // 渐变的结束点
                )
                .cornerRadius(10)
                .frame(width: size, height: size)
                .cornerRadius(100)
                .shadow(radius: 10)
                Circle()
                    .stroke(Color.white, lineWidth: 5)
            }
        }
        .rotationEffect(Angle(degrees: -20.0))
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
}
