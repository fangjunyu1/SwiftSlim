//
//  ShareLinkFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//


import SwiftUI

struct ShareLinkFallbackDemo: View {
    @State private var showShareSheet = false
    
    private let shareURL = URL(string: "https://apps.apple.com/us/app/qinote-app-development/id6748941042/")!

    var body: some View {
        if #available(iOS 16.0, *) {
            ShareLink(item: shareURL) {
                shareButtonLabel
            }
        } else {
            Button(action: {
                showShareSheet = true
            }, label: {
                shareButtonLabel
            })
            .background {
                ActivitySharePresenter(
                    isPresented: $showShareSheet,
                    items: [shareURL]
                )
                .frame(width: 0, height: 0)
            }
        }
    }
    
    var shareButtonLabel: some View {
        Label {
            Text(verbatim: "Share")
        } icon: {
            Image(systemName: "square.and.arrow.up")
        }
        .font(.system(size: 16, weight: .semibold))
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
        .background(.blue.opacity(0.14))
        .clipShape(Capsule())
    }
}
