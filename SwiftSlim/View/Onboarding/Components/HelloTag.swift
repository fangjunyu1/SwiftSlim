//
//  helloTag.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

struct HelloTag: View {
    var body: some View {
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
