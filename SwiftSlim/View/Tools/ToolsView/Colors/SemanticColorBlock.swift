//
//  SemanticColorBlock.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

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
