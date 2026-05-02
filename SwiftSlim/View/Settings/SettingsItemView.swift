//
//  SettingsItemView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/2.
//

import SwiftUI

// MARK: - Row
struct SettingsItemView: View {
    @Environment(\.openURL) private var openURL
    let item: SettingsType

    var body: some View {
        rowContent
    }

    @ViewBuilder
    private var rowContent: some View {
        switch item.action {
        case .destination(let destination):
            NavigationLink(destination: destination) {
                itemView
            }

        case .url(let url):
            Link(destination: url) {
                itemView
            }

        case .email:
            Button {
                Email.sendFeedback(using: openURL)
            } label: {
                itemView
            }
            .buttonStyle(.plain)
        }
    }

    private var itemView: some View {
        HStack(spacing: 10) {
            Image(item.img)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.white)
                .padding(6)
                .background(item.color)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            Text(LocalizedStringKey(item.title))
                .foregroundStyle(Color("BlackColor"))

            Spacer()

            Image("right")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.gray.opacity(0.8))
                .opacity(0.5)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }
}
