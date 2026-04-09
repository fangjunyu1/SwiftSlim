//
//  Theme.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/8.
//

import SwiftUI
import MarkdownUI

extension Theme {
    static var custom: Theme {
        Theme()
            .codeBlock { configuration in
                CodeBlockWithCopyButton(configuration: configuration)
            }
            .image { configuration in
                configuration.label
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                    .markdownMargin(top: 16, bottom: 16)
            }
            .heading1 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(24)
                        FontWeight(.bold)
                        FontFamily(.system(.serif))
                    }
                    .markdownMargin(top: 16, bottom: 16)
            }
            .heading2 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(20)
                        FontWeight(.semibold)
                        FontFamily(.system(.serif))
                    }
                    .markdownMargin(top: 16, bottom: 16)
            }
            .heading3 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(17)
                        FontWeight(.semibold)
                        FontFamily(.system(.serif))
                    }
                    .markdownMargin(top: 16, bottom: 16)
            }
        
            .heading4 { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontSize(15)
                        FontWeight(.semibold)
                        FontFamily(.system(.serif))
                    }
                    .markdownMargin(top: 16, bottom: 16)
            }
            .text {
                FontSize(16)
                FontWeight(.regular)
                FontFamily(.system(.serif))
            }
        // 段落：控制正文行间距、段落上下间距
            .paragraph { configuration in
                configuration.label
                    .relativeLineSpacing(.em(0.22))
                    .markdownMargin(top: 0, bottom: 12)
            }
        
        // 整个列表块（ul / ol）
            .list { configuration in
                configuration.label
                    .markdownMargin(top: 4, bottom: 12)
            }
        
        // 每一个 li
            .listItem { configuration in
                configuration.label
                    .relativeLineSpacing(.em(0.2))
                    .markdownMargin(top: 4, bottom: 4)
            }
    }
}
