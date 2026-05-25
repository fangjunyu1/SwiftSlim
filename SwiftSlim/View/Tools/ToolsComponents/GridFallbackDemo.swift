//
//  GridFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/25.
//

import SwiftUI

struct GridFallbackDemo: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                GridRow {
                    Text(verbatim: "A")
                    Text(verbatim: "B")
                    Text(verbatim: "C")
                }
                
                GridRow {
                    Text(verbatim: "1")
                    Text(verbatim: "2")
                    Text(verbatim: "3")
                }
                
                GridRow {
                    Image(systemName: "star.fill")
                    Image(systemName: "heart.fill")
                    Image(systemName: "bolt.fill")
                }
            }
            .font(.system(size: 20, weight: .semibold))
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        } else {
            VStack(spacing: 12) {
                HStack(spacing: 22) {
                    Text(verbatim: "A")
                    Text(verbatim: "B")
                    Text(verbatim: "C")
                    
                }
                
                HStack(spacing: 25) {
                    Text(verbatim: "1")
                    Text(verbatim: "2")
                    Text(verbatim: "3")
                    
                }
                
                HStack(spacing: 12) {
                    Image(systemName: "star.fill")
                    Image(systemName: "heart.fill")
                    Image(systemName: "bolt.fill")
                }
            }
            .font(.system(size: 20, weight: .semibold))
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}
