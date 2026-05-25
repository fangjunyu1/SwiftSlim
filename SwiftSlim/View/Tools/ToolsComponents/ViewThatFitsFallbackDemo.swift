//
//  ViewThatFitsFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/25.
//

import SwiftUI

struct ViewThatFitsFallbackDemo: View {
    @State private var availableWidth: CGFloat = 0
    
    private let switchWidth: CGFloat = 327
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ViewThatFits {
                horizontalContent
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .background(.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                verticalContent
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .background(.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        } else {
            Group {
                if availableWidth > switchWidth {
                    horizontalContent
                } else {
                    verticalContent
                }
            }
            .font(.system(size: 16, weight: .semibold))
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .frame(maxWidth: .infinity)
            .background {
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            availableWidth = geo.size.width
                        }
                        .onChange(of: geo.size.width) { newValue in
                            availableWidth = newValue
                        }
                }
            }
        }
    }
    
    private var horizontalContent: some View {
        HStack(spacing: 10) {
            Text(verbatim: "SwiftUI")
            Text(verbatim: "Layout")
            Text(verbatim: "Preview")
            Text(verbatim: "ViewThatFits")
        }
    }
    
    private var verticalContent: some View {
        VStack(spacing: 8) {
            Text(verbatim: "SwiftUI")
            Text(verbatim: "Layout")
            Text(verbatim: "Preview")
            Text(verbatim: "ViewThatFits")
        }
    }
}
struct ViewThatFitsFallbackDemo1: View {
    var body: some View {
        
        VStack {
            if #available(iOS 16.0, *) {
                ViewThatFits {
                    HStack(spacing: 10) {
                        Text(verbatim: "SwiftUI")
                        Text(verbatim: "Layout")
                        Text(verbatim: "Preview")
                        Text(verbatim: "ViewThatFits")
                    }
                    
                    VStack(spacing: 8) {
                        Text(verbatim: "SwiftUI")
                        Text(verbatim: "Layout")
                        Text(verbatim: "Preview")
                        Text(verbatim: "ViewThatFits")
                    }
                }
                .font(.system(size: 16, weight: .semibold))
                .padding()
                .background(.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                GeometryReader { geo in
                    let width = geo.size.width
                    
                    if width > 327 {
                        HStack(spacing: 10) {
                            Text(verbatim: "SwiftUI")
                            Text(verbatim: "Layout")
                            Text(verbatim: "Preview")
                            Text(verbatim: "ViewThatFits")
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .background(.gray.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    } else {
                        VStack(spacing: 8) {
                            Text(verbatim: "SwiftUI")
                            Text(verbatim: "Layout")
                            Text(verbatim: "Preview")
                            Text(verbatim: "ViewThatFits")
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .background(.gray.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        PreviewView()
            .environmentObject(AppStorageManager.shared)
            .environmentObject(IAPManager.shared)
    }
}
