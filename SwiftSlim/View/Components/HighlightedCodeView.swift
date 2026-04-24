//
//  HighlightedCodeView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import SwiftUI
import Splash
import UIKit

struct HighlightedCodeView: UIViewRepresentable {
    let code: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        
        // 允许长行换行
        textView.textContainer.widthTracksTextView = true
        textView.textContainer.lineBreakMode = .byCharWrapping
        
        // 防止 UIKit 自己撑开宽度
        textView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        let theme = Splash.Theme.wwdc17(withFont: .init(size: 12))
        
        let highlighter = SyntaxHighlighter(
            format: AttributedStringOutputFormat(theme: theme)
        )
        
        let attributedString = highlighter.highlight(code)
        uiView.attributedText = NSAttributedString(attributedString: attributedString)
    }
}

#Preview {
    ContentView()
}
