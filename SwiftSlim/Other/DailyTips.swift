//
//  DailyTips.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//
//  每日技巧
//

enum DailyTips {
    static let codes: [String] = [
        """
        Text("Hello World")
        """,
        """
        Text("Hello World")
            .font(.title)
        """,
        """
        Text("Hello World")
            .foregroundColor(.blue)
        """,
        """
        Text("Bold Text")
            .fontWeight(.bold)
        """,
        """
        Text("Large Title")
            .font(.largeTitle)
        """,
        """
        Text("Underlined")
            .underline()
        """,
        """
        Text("Opacity")
            .opacity(0.5)
        """,
        """
        Text("Rotation")
            .rotationEffect(.degrees(15))
        """,
        """
        Text("Padding")
            .padding()
        """,
        """
        Text("Rounded")
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        """,
        """
        Text("Shadow")
            .shadow(radius: 4)
        """,
        """
        Text("Border")
            .padding()
            .border(Color.blue)
        """,
        """
        Text("Capsule")
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
        """,
        """
        Image(systemName: "heart.fill")
        """,
        """
        Image(systemName: "heart.fill")
            .foregroundColor(.red)
        """,
        """
        Image(systemName: "star.fill")
            .font(.title)
        """,
        """
        Image(systemName: "paperplane.fill")
            .font(.largeTitle)
            .foregroundColor(.blue)
        """,
        """
        VStack {
            Text("Hello")
            Text("SwiftUI")
        }
        """,
        """
        HStack {
            Text("Hello")
            Text("SwiftUI")
        }
        """,
        """
        HStack(spacing: 12) {
            Image(systemName: "sun.max.fill")
            Text("Weather")
        }
        """,
        """
        VStack(alignment: .leading) {
            Text("Title")
            Text("Subtitle")
        }
        """,
        """
        ZStack {
            Color.blue
            Text("Overlay")
        }
        """,
        """
        Spacer()
        """,
        """
        Divider()
        """,
        """
        Rectangle()
            .fill(Color.purple)
            .frame(width: 120, height: 80)
        """,
        """
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blue)
            .frame(width: 140, height: 80)
        """,
        """
        Capsule()
            .fill(Color.pink)
            .frame(width: 140, height: 50)
        """,
        """
        Circle()
            .fill(Color.orange)
            .frame(width: 80, height: 80)
        """,
        """
        Ellipse()
            .fill(Color.green)
            .frame(width: 120, height: 80)
        """,
        """
        Button("Tap Me") {
            print("Tapped")
        }
        """,
        """
        Text("Tap Me")
            .onTapGesture {
                print("Tapped")
            }
        """,
        """
        Text("Scale")
            .scaleEffect(1.2)
        """,
        """
        Text("Offset")
            .offset(x: 10, y: 5)
        """,
        """
        Text("Monospaced")
            .font(.system(.body, design: .monospaced))
        """,
        """
        Text("Two Colors")
            .foregroundStyle(.blue)
        """,
        """
        LinearGradient(
            colors: [.blue, .purple],
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(height: 80)
        """,
        """
        Color.blue
            .frame(height: 80)
        """,
        """
        ProgressView(value: 0.6)
            .padding()
        """,
        """
        Text("SwiftUI")
            .italic()
        """,
        """
        Text("Hello")
            .multilineTextAlignment(.center)
        """
    ]
    
    static func randomCode() -> String{
        if codes.isEmpty { return "No Code" }
        var tmp = codes.randomElement() ?? "No Code"
        while codeList.contains(tmp) && codeList.count < codes.count {
            tmp = codes.randomElement() ?? "No Code"
        }
        codeList.append(tmp)
        if codeList.count > 3 {
            codeList = Array(codeList.dropFirst())
        }
        return tmp
    }
    
    static var codeList:[String] = []
    
    
}
