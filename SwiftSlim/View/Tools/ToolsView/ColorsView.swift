//
//  ColorsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/25.
//

import SwiftUI

// 渐变颜色
enum GradientsColor: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    case linearGradient
    case radialGradient
    case angularGradient
    
    var name: String {
        switch self {
        case .linearGradient:
            "Linear Gradient"
        case .radialGradient:
            "Radial Gradient"
        case .angularGradient:
            "Angular Gradient"
        }
    }
    
    var title: String {
        switch self {
        case .linearGradient:
            "线性渐变"
        case .radialGradient:
            "径向渐变"
        case .angularGradient:
            "径向渐变"
        }
    }
    
    var describe: String {
        switch self {
        case .linearGradient:
            "线性渐变会在指定的方向上从一个颜色过渡到另一个颜色。"
        case .radialGradient:
            "径向渐变是从中心向外扩展的渐变效果，适合用于圆形或有中心点的渐变效果。"
        case .angularGradient:
            "角度渐变是围绕某个点旋转的渐变效果，适合用于圆形或圆弧区域。"
        }
    }
    
    var view: some View {
        VStack {
            switch self {
            case .linearGradient:
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            case .radialGradient:
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(
                        RadialGradient(
                            colors: [.yellow, .orange, .red],
                            center: .center,
                            startRadius: 0,
                            endRadius: 100
                        )
                    )
            case .angularGradient:
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(
                        AngularGradient(
                            colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                            center: .center
                        )
                    )
            }
        }
    }
    
    var code: String {
        switch self {
        case .linearGradient:
            """
            LinearGradient(
              colors: [.blue, .purple],
              startPoint: .leading,
              endPoint: .trailing
            )
            """
        case .radialGradient:
            """
            RadialGradient(
              colors: [.yellow, .orange, .red],
              center: .center,
              startRadius: 0,
              endRadius: 100
            )
            """
        case .angularGradient:
            """
            AngularGradient(
              colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
              center: .center
            )
            """
        }
    }
}

// 语义颜色
enum SemanticColor: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    case primary
    case secondary
    case accentColor
    
    var name: String {
        ".\(rawValue)"
    }
    
    var color: Color {
        switch self {
        case .primary:      .primary
        case .secondary:    .secondary
        case .accentColor:  .accentColor
        }
    }
    
    var describe: String {
        switch self {
        case .primary:
            "主要文本颜色，自动适应深浅模式"
        case .secondary:
            "次要文本，用于补充信息"
        case .accentColor:
            "App 的强调色，默认蓝色"
        }
    }
}

// 系统颜色
enum SystemColor: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    
    case red
    case blue
    case green
    case yellow
    case orange
    case purple
    case pink
    case brown
    case gray
    case mint
    case teal
    case cyan
    case indigo
    case white
    case black
    case clear
    
    var name: String {
        ".\(rawValue)"
    }
    
    var color: Color {
        switch self {
        case .red:          .red
        case .blue:         .blue
        case .green:        .green
        case .yellow:       .yellow
        case .orange:       .orange
        case .purple:       .purple
        case .pink:         .pink
        case .brown:        .brown
        case .gray:         .mint
        case .teal:         .teal
        case .cyan:         .cyan
        case .indigo:       .indigo
        case .mint:         .gray
        case .white:        .white
        case .black:        .black
        case .clear:        .clear
        }
    }
    
    var hexColor: String {
        switch self {
        case .red:"#FF3B30"
        case .blue:
            "#007AFF"
        case .green:
            "#34C759"
        case .yellow:
            "#FFCC00"
        case .orange:
            "#FF9500"
        case .purple:
            "#AF52DE"
        case .pink:
            "#FF2D55"
        case .brown:
            "#A2845E"
        case .gray:
            "#8E8E93"
        case .mint:
            "#00C7BE"
        case .teal:
            "#30B0C7"
        case .cyan:
            "#32ADE6"
        case .indigo:
            "#5856D6"
        case .white:
            "#FFFFFF"
        case .black:
            "#000000"
        case .clear:
            "#00000000"
        }
    }
}

struct ColorsView: View {
    let columns = [
        GridItem(.adaptive(minimum: 90, maximum: 120) , spacing: 10, alignment: .leading)
    ]
    var body: some View {
        ScrollView {
            ToolHeaderView(tool: .Colors)
            // 系统颜色
            VStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 10) {
                    title(name: "系统颜色")
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(SystemColor.allCases) { color in
                            SystemColorBlock(color: color)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                // 语义颜色
                VStack(alignment: .leading, spacing: 10) {
                    title(name: "语义颜色")
                    VStack(spacing: 20) {
                        ForEach(Array(SemanticColor.allCases.enumerated()), id:\.offset) { index, color in
                            SemanticColorBlock(sColor: color)
                            if index != SemanticColor.allCases.count - 1 {
                                Divider()
                            }
                        }
                    }
                    .padding(20)
                    .background(Color("WhiteAndBlack"))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 0.5)
                }
                
                // 渐变颜色
                VStack(alignment: .leading, spacing: 10) {
                    title(name: "渐变颜色")
                    VStack(spacing: 20) {
                        ForEach(Array(GradientsColor.allCases.enumerated()), id:\.offset) { index, color in
                            GradientsColorBlock(gColor: color)
                            if index != SemanticColor.allCases.count - 1 {
                                Divider()
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 16)
            
        }
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
    }
    
    func title(name: String) -> some View {
        HStack {
            Text(LocalizedStringKey(name))
                .font(.system(size: 15))
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct GradientsColorBlock: View {
    @State private var isCopied = false
    var gColor: GradientsColor
    
    // 复制代码
    private func copyCode() {
        UIPasteboard.general.string = gColor.code
        
        withAnimation(.easeInOut(duration: 0.2)) {
            isCopied = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) {
                isCopied = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                // 渐变色英文名称
                VStack(alignment: .leading) {
                    Text(gColor.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("BlackColor"))
                    // 渐变色本地化名称
                    Text(LocalizedStringKey(gColor.title))
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                // 复制按钮
                Button(action: copyCode) {
                    Text(isCopied ? "Copied" : "Copy")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
            // 分割线
            Divider()
            // 渐变色描述
            HStack {
                Text(LocalizedStringKey(gColor.describe))
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Spacer()
            }
            // 渐变色颜色
            gColor.view
                .frame(height: 80)
                .frame(maxWidth: .infinity)
            codeCard
        }
        .padding(20)
        .background(Color("WhiteAndBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 0.5)
    }
    
    // 代码卡片
    private var codeCard: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(gColor.code)
                .font(.system(size: 13, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
        }
        .background(Color.black.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct SemanticColorBlock: View {
    var sColor: SemanticColor
    var body: some View {
        HStack {
            if sColor == .primary {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(sColor.color)
                    .environment(\.colorScheme, .light)
                    .frame(width: 30, height: 30)
                    .shadow(radius: 1)
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(sColor.color)
                    .environment(\.colorScheme, .dark)
                    .frame(width: 30, height: 30)
                    .shadow(radius: 1)
            } else {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(sColor.color)
                    .frame(width: 30, height: 30)
                    .shadow(radius: 1)
            }
            VStack(alignment: .leading) {
                Text(sColor.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("BlackColor"))
                Text(sColor.describe)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
    }
}

struct SystemColorBlock: View {
    @State private var isCopied = false
    @State private var isScaling = Date()
    @State private var isScale = false
    var color: SystemColor
    func isWhiteAndClear(color: SystemColor) -> Bool {
        if color == .white || color == .clear {
            true
        } else {
            false
        }
    }
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = color.hexColor
            isCopied = true
            isScaling = Date()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                isCopied = false
            }
        }, label: {
            VStack(spacing: 8) {
                Circle()
                    .fill(color.color)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 0.5)
                    .overlay {
                        Image(systemName: "checkmark")
                            .foregroundStyle(isWhiteAndClear(color: color) ? .black : .white)
                            .opacity(isCopied ? 1 : 0)
                    }
                Text(color.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("BlackColor"))
                Text(color.hexColor)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .frame(height: 110)
            .frame(maxWidth: .infinity)
            .background(Color("WhiteAndBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
            .shadow(radius: 0.5)
            .scaleEffect(isScale ? 0.9 : 1)
            .onChange(of: isScaling) { value in
                withAnimation(.easeIn(duration: 0.1)) {
                    isScale = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        isScale = false
                    }
                }
            }
        })
    }
}

#Preview {
    ColorsView()
}
