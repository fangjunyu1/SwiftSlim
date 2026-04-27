//
//  Theme.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/8.
//

import SwiftUI
import MarkdownUI

extension Theme {
    static func custom(isLargeLayout: Bool = false) -> Theme {
        let h1: Double = isLargeLayout ? 30 : 24
        let h2: Double = isLargeLayout ? 26 : 20
        let h3: Double = isLargeLayout ? 24 : 18
        let h4: Double = isLargeLayout ? 22 : 16
        let body: Double = isLargeLayout ? 22 : 16
        let imageMaxHeight: Double = isLargeLayout ? 420 : 300
        let listMargin: Double = isLargeLayout ? 10 : 5
        let listItemMargin: Double = isLargeLayout ? 16 : 8
        let family: Font.Design = isLargeLayout ? .default : .serif
        let heading1Weight: Font.Weight = isLargeLayout ? .semibold : .bold
        let textWeight: Font.Weight = isLargeLayout ? .light : .regular
        let headingWeight: Font.Weight = isLargeLayout ? .medium : .semibold
        let margin: Double = 30
        let paragraphMargin: Double = isLargeLayout ? 30 : 20
        let lineSpacing: Double = isLargeLayout ? 0.44 : 0.22
        let liLineSpacing: Double = 0.22
        
        return Theme()
            .codeBlock { configuration in
                CodeBlockWithCopyButton(configuration: configuration)
            }
            .code {
                FontSize(body)
                FontWeight(.semibold)
            }
            .image { configuration in
                configuration.label
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: imageMaxHeight, alignment: .center)
                    .markdownMargin(top: margin, bottom: margin)
            }
            .heading1 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(h1)
                        FontWeight(heading1Weight)
                        FontFamily(.system(family))
                    }
                    .markdownMargin(top: margin, bottom: margin)
            }
            .heading2 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(h2)
                        FontWeight(headingWeight)
                        FontFamily(.system(family))
                    }
                    .markdownMargin(top: margin, bottom: margin)
            }
            .heading3 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(h3)
                        FontWeight(headingWeight)
                        FontFamily(.system(family))
                    }
                    .markdownMargin(top: margin, bottom: margin)
            }
        
            .heading4 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(h4)
                        FontWeight(headingWeight)
                        FontFamily(.system(family))
                    }
                    .markdownMargin(top: margin, bottom: margin)
            }
            .text {
                FontSize(body)
                FontWeight(textWeight)
                FontFamily(.system(family))
            }
        // 段落：控制正文行间距、段落上下间距
            .paragraph { configuration in
                configuration.label
                    .relativeLineSpacing(.em(lineSpacing))
                    .markdownMargin(top: paragraphMargin, bottom: paragraphMargin)
            }
        
        // 整个列表块（ul / ol）
            .list { configuration in
                configuration.label
                    .markdownMargin(top: listMargin, bottom: listMargin)
            }
        
        // 每一个 li
            .listItem { configuration in
                configuration.label
                    .relativeLineSpacing(.em(liLineSpacing))
                    .markdownMargin(top: listItemMargin, bottom: listItemMargin)
            }
    }
}
