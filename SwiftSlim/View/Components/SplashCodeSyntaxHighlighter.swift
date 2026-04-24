//
//  SplashCodeSyntaxHighlighter.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/17.
//

import MarkdownUI
import Splash
import SwiftUI

struct SplashCodeSyntaxHighlighter: CodeSyntaxHighlighter {
    private let syntaxHighlighter: SyntaxHighlighter<TextOutputFormat>

    init(theme: Splash.Theme) {
        self.syntaxHighlighter = SyntaxHighlighter(
            format: TextOutputFormat(theme: theme)
        )
    }

    func highlightCode(_ content: String, language: String?) -> Text {
        guard let language, language.lowercased() == "swift" else {
            return Text(content)
        }

        return self.syntaxHighlighter.highlight(content)
    }
}

extension CodeSyntaxHighlighter where Self == SplashCodeSyntaxHighlighter {
    static func splash(theme: Splash.Theme) -> Self {
        SplashCodeSyntaxHighlighter(theme: theme)
    }
}
