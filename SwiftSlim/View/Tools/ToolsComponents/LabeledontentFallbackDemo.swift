//
//  LabeledContentFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/23.
//

import SwiftUI

struct LabeledContentFallbackDemo: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack(spacing: 12) {
                LabeledContent(content: {
                    Text(verbatim: "64 GB")
                }, label: {
                    Text(verbatim: "Storage")
                })
                
                LabeledContent {
                    Text(verbatim: "Online")
                        .foregroundStyle(.green)
                } label: {
                    Label(title: {
                        Text(verbatim: "Status")
                    }, icon: {
                        Image(systemName: "wifi")
                    })
                }
            }
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        } else {
            VStack(spacing: 12) {
                HStack {
                    Text(verbatim: "Storage")
                    Spacer()
                    Text(verbatim: "64 GB")
                        .foregroundColor(Color.gray)
                }
                HStack {
                    Label(title: {
                        Text(verbatim: "Status")
                    }, icon: {
                        Image(systemName: "wifi")
                    })
                    Spacer()
                    Text(verbatim: "Online")
                        .foregroundStyle(.green)
                }
            }
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    LabeledContentFallbackDemo()
}
