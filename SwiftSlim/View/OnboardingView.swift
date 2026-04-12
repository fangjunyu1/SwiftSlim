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
    @State private var rotation: Double = 0
    // 20课时
    let numberOfCourses = 20
    var body: some View {
        VStack {
            // 跳过按钮
            headerView
            // TabView 动画和文字
            TabView(selection: $step) {
                ForEach(OnboardingStep.allCases) { item in
                    onboardingPage(step: item)
                        .tag(item)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            Spacer()
            // 进度条
            progressView
            // 按钮
            actionButton
            Spacer().frame(height: 30)
        }
        .padding(.top, 30)
    }
    
    private var headerView: some View {
        HStack {
            Spacer()
            Button("Skip") {
                appStorage.hasCompletedOnboarding = true
            }
            .foregroundStyle(.gray)
        }
        .padding(.trailing, 30)
        .opacity(step == .areYouReady ? 0 : 1)
    }
    
    private var progressView: some View {
        HStack {
            ForEach(OnboardingStep.allCases, id:\.self) { item in
                Rectangle()
                    .frame(width: step == item ? 30 : 10, height: 10)
                    .cornerRadius(10)
                    .foregroundColor(step == item ? Color.blue : Color.gray)
                    .animation(.spring(duration: 0.3))
            }
        }
        .padding(30)
    }
    
    private var actionButton: some View {
        Button(action: {
            if let next = step.next() {
                step = next
            } else {
                appStorage.hasCompletedOnboarding = true
            }
        }, label: {
            HStack {
                Text(LocalizedStringKey(step.buttonTitle.0))
                    .fontWeight(.bold)
                Text(verbatim: step.buttonTitle.1)
                    .fontWeight(.bold)
            }
            .foregroundColor(Color.white)
            .frame(width: 240,height: 60)
            .background(Color(hex: "3762E3"))
            .cornerRadius(20)
        })
    }
    
    func onboardingPage(step: OnboardingStep)  -> some View {
        VStack(spacing: 30) {
            // 动画区域
            ZStack {
                // contentView 代码
                ZStack(alignment: .bottomTrailing) {
                    Image("contentView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .shadow(radius: 10)
                    HStack {
                        Text(verbatim: "</>")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(hex: "176ACD"))
                            .padding(5)
                            .background {
                                let size = 25.0
                                Circle()
                                    .foregroundStyle(Color(hex: "DEEAFC"))
                                    .scaledToFill()
                                    .frame(width: size, height: size)
                            }
                        Text(verbatim: "Hello, SwiftUI!")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,16)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .offset(x: 0, y: 20)
                    .transition(.offset(x:0,y:100))
                }
                .opacity(step == .learnSwiftUI ? 1 : 0)
                
                // 入门课程
                ZStack(alignment: .trailing) {
                    VStack(spacing: 20) {
                        HStack {
                            // 第一章
                            Text("Chapter 1")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(hex: "4E47DD"))
                                .padding(.vertical,8)
                                .padding(.horizontal,16)
                                .background(Color(hex: "EFF2FE"))
                                .cornerRadius(10)
                            Spacer()
                            Text("\(numberOfCourses) lessons")
                                .foregroundColor(.gray)
                        }
                        // 基础入门
                        HStack {
                            Text("Basics")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        // 列表
                        HStack {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(spacing: 20) {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundStyle(Color(hex: "34CB46"))
                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                    
                                        .frame(width: 160, height: 14)
                                        .foregroundStyle(Color(hex: "F3F3F3"))
                                }
                                HStack(spacing: 20) {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundStyle(Color(hex: "34CB46"))
                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                    
                                        .frame(width: 100, height: 14)
                                        .foregroundStyle(Color(hex: "F3F3F3"))
                                }
                                HStack(spacing: 20) {
                                    Image(systemName: "circle")
                                        .foregroundStyle(.gray)
                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                    
                                        .frame(width: 160, height: 14)
                                        .foregroundStyle(Color(hex: "F3F3F3"))
                                }
                            }
                            Spacer()
                        }
                        
                    }
                    .padding(20)
                    .frame(width: 300)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color(hex: "5335FF").opacity(0.3), radius: 3)
                    .padding(.horizontal,20)
                    // 评分
                    CourseBadges(numberOfCourses: numberOfCourses)
                        .offset(x: -20, y: 80)
                }
                .opacity(step == .startLessons ? 1 : 0)
                
                // 开发者工具箱
                ZStack {
                    let size = 80.0
                    RadialGradient(
                        gradient: Gradient(colors: [Color(hex: "1000E3")]), // 渐变的颜色
                        center: .center, // 渐变的中心位置
                        startRadius: 20, // 起始半径
                        endRadius: 100 // 结束半径
                    )
                    .frame(width: size,height: size)
                    .cornerRadius(40)
                    .blur(radius: 100)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            DeveloperToolbox(image: "fenlei", imageColor: "D9622B", backgroundColor: "FFEED5")
                            DeveloperToolbox(image: "mokuai", imageColor: "883AE2", backgroundColor: "E7D8FF")
                        }
                        HStack(spacing: 20) {
                            DeveloperToolbox(image: "book", imageColor: "4EAE54", backgroundColor: "E9FBEC")
                            DeveloperToolbox(image: "danger", imageColor: "CA3A32", backgroundColor: "FFDDDD")
                        }
                    }
                }
                .opacity(step == .toolBox ? 1 : 0)
                
                // 准备好了吗？
                ZStack {
                    Image("app")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .cornerRadius(10)
                        .overlay {
                            Image("start")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .offset(x: 60,y:  -60)
                        }
                        .background {
                            let size = 140.0
                            RadialGradient(
                                gradient: Gradient(colors: [Color(hex: "1000E3")]), // 渐变的颜色
                                center: .center, // 渐变的中心位置
                                startRadius: 20, // 起始半径
                                endRadius: 200 // 结束半径
                            )
                            .frame(width: size, height: size)
                            .cornerRadius(90)
                            .blur(radius: 40)
                        }
                        .frame(height: 250)
                    
                    RotatingBorderView()
                }
                .opacity(step == .areYouReady ? 1 : 0)
            }
            
            // 标题和描述
            VStack(spacing: 16) {
                Text(LocalizedStringKey(step.title))
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text(LocalizedStringKey(step.description))
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppStorageManager.shared)
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

// 开发者工具箱独立视图
struct DeveloperToolbox: View {
    let image: String
    let imageColor: String
    let backgroundColor: String
    var body: some View {
        VStack {
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
                .foregroundStyle(Color(hex: "F3F3F3"))
        }
        .padding(16)
        .frame(width: 140)
        .background(Color.white)
        .cornerRadius(20.0)
        .shadow(radius: 3)
    }
}

// 单独抽取旋转视图
struct RotatingBorderView: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        Image("border")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                rotation = 0 // 每次出现先重置
                withAnimation(
                    .linear(duration: 10)
                    .repeatForever(autoreverses: false)
                ) {
                    rotation = 360
                }
            }
    }
}

enum OnboardingStep: Int, Identifiable, CaseIterable {
    case learnSwiftUI = 0, startLessons, toolBox, areYouReady
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .learnSwiftUI:
            return "Learn SwiftUI"
        case .startLessons:
            return "Beginner Courses"
        case .toolBox:
            return "Tools"
        case .areYouReady:
            return "Are You Ready?"
        }
    }
    
    var description: String {
        switch self {
        case .learnSwiftUI:
            return "From syntax to interface, from examples to practice, learn SwiftUI in a way that is easier to understand."
        case .startLessons:
            return "Start with the fundamentals, learn common SwiftUI patterns step by step, and build a clear development mindset."
        case .toolBox:
            return "Combine tutorials with tools to create a more complete experience for learning, searching, and understanding."
        case .areYouReady:
            return "Starting now, write your first line of code and gradually build your very first app."
        }
    }
    
    var buttonTitle: (String, String) {
        switch self {
        case .areYouReady:
            return ("Start Learning","")
        default:
            return ("Next",">")
        }
    }
    
    func next() -> OnboardingStep? {
        OnboardingStep(rawValue: rawValue + 1)
    }
}
