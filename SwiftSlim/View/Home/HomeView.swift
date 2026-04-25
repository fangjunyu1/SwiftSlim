//
//  HomeView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct HomeView: View {
    @Binding var selected: contentType
    @State private var currentCode = DailyTips.randomCode()
    @EnvironmentObject var appStorage: AppStorageManager
    let languageCode = Locale.current.languageCode ?? "zh"
    var isNotEnglish: Bool {
        languageCode != "en"
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 36) {
                // 顶部视图
                header
                // 问候语
                greeting
                // 学习进度
                // learningProgress
                // 开发工具
                devTools
                // 每日提醒
                tip
                Spacer()
                    .frame(height: 50)
            }
        }
    }
    
    // 顶部视图
    var header: some View {
        HStack(spacing: 10) {
            Image("app")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .cornerRadius(5)
            Text(Bundle.main.appName)
                .fontWeight(.bold)
            Spacer()
            NavigationLink(destination: {
                NotificationView()
            }, label: {
                Image("bell")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundStyle(Color("BlackColor"))
                    .padding(10)
                    .background(Color("WhiteAndBlack"))
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.3), radius: 3, y:3)
            })
        }
    }
    
    // 问候语
    var greeting: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    // 问候语：你好，开发者👋
                    let name = NSLocalizedString(appStorage.userName, comment: "Developer")
                    let great = String(format: NSLocalizedString("Hello, %@", comment: "问候语"), name)
                    Text(great)
                        .fontWeight(.bold)
                    Text(verbatim:"👋")
                        .fontWeight(.bold)
                }
                .font(.title)
                Text("Learn something new today")
                    .fontWeight(.medium)
                    .modifier(PromptText())
            }
            Spacer()
        }
    }
    
    // 学习进度
    var learningProgress: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                // 需要传入真实的学习进度
                BlockProgress(rows: 4, columns: 8, progress: 0.7)
                VStack(alignment: .leading) {
                    Spacer()
                    Text("LearningProgress")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("AppColor"))
                    HStack(alignment: .bottom,spacing: 3) {
                        Text(verbatim: "1")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.trailing, 3)
                            .offset(y: 6)
                        Group {
                            Text(verbatim: "/")
                            Text(verbatim: "20")
                                .padding(.trailing, 3)
                            Text("lessons")
                        }
                        .modifier(PromptText())
                    }
                }
                .padding(5)
                Spacer()
            }
            .padding(10)
            .frame(width: 340, height: 100)
            .background(Color("WhiteAndBlack"))
            .cornerRadius(10)
            Image("book2")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .rotationEffect(Angle(degrees: 30))
                .offset(x: -10,y: -35)
                .scaleEffect(x: -1, y: 1)
        }
    }
    
    // 开发工具
    var devTools: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 140, maximum: 200) , spacing: 20, alignment: .leading)
        ]
        
        return VStack(spacing: 20) {
            // 开发工具和更多
            HStack {
                Text("Dev Tools")
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    selected = .tools
                }, label: {
                    Text("More")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("AppColor"))
                })
            }
            // 开发者工具（前四个）
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach(ToolType.allCases) { tool in
                        DevToolsView(tool: tool, displayLocation: .Home)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 8)
    }
    
    // 每日技巧
    var tip: some View {
        
        VStack(spacing: 16) {
            // 每日技巧标题
            HStack {
                Image("lightBulb")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundStyle(Color(hex:"F3CD49"))
                Group {
                    Text("Daily Tips")
                    if isNotEnglish {
                        Text(verbatim: "(Daily Tips)")
                    }
                }
                .font(.footnote)
                .foregroundStyle(Color("LightGray2"))
                Spacer()
            }
            // 每日技巧代码
            HStack {
                HighlightedCodeView(code: currentCode)
                Spacer()
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 26)
        .background(Color("LightBlack"))
        .cornerRadius(10)
        .shadow(radius: 1)
        .onTapGesture {
            print("修改 currentCode")
            currentCode = DailyTips.randomCode()
        }
    }
}

// 进度网格视图
struct BlockProgress: View {
    let rows: Int
    let columns: Int
    let progress: Double
    let spacings = 5.0
    
    var body: some View {
        
        let total: Int = rows * columns
        let filled: Int = Int(Double(total) * progress)
        let width: Double = Double(columns * 20)
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(12),spacing: spacings), count: columns), spacing: spacings) {
                ForEach(0..<total,id: \.self) { index in
                    Rectangle()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor( index < filled ? Color("AppColor") : Color("LightGray"))
                        .cornerRadius(2)
                        .animation(.easeInOut(duration: 0.3), value: progress)
                }
            }
        }
        .frame(width: width)
    }
}
#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
