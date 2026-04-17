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
            .font(.title)
            .foregroundColor(.blue)
        """,
        """
        VStack {
            Image(systemName: "star.fill")
            Text("Favorite")
        }
        """
    ]
    
    static var randomCode: String {
        DailyTips.codes.randomElement() ?? "No code"
    }
}
