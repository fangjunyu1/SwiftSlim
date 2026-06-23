//
//  scrollViewReaderFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/23.
//

import SwiftUI

struct scrollViewReaderFallbackDemo: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 12) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<20, id: \.self) { index in
                            Text(verbatim: "\(index)")
                                .font(.headline)
                                .frame(width: 50, height: 50)
                                .background(Color("WhiteAndBlack"))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .id(index)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    withAnimation {
                        proxy.scrollTo(10, anchor: .center)
                    }
                }, label: {
                    Text(verbatim: "Scroll to 10")
                })
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        scrollViewReaderFallbackDemo()
    }
}
