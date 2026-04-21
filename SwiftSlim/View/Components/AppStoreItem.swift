//
//  AppStoreItem.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/21.
//

import SwiftUI

enum AppStoreItem: String, Identifiable, CaseIterable {
    var id: String {
        self.rawValue
    }
    
    case App1
    case App2
    case App3
    case App4
    case App5
    
    var link: URL {
        switch self {
            // 轻压图片
        case .App1:
            URL(string:"https://apps.apple.com/cn/app/%E8%BD%BB%E5%8E%8B%E5%9B%BE%E7%89%87/id6748277056?mt=12")!
            
            // 轻学编程
        case .App2:
            URL(string:"https://apps.apple.com/app/qinote-app-development/id6748941042")!
            // 存钱猪猪
        case .App3:
            URL(string:"https://apps.apple.com/cn/app/%E5%AD%98%E9%92%B1%E7%8C%AA%E7%8C%AA-%E5%AD%98%E9%92%B1%E7%BD%90/id6503047096")!
            // 汇率仓库
        case .App4:
            URL(string:"https://apps.apple.com/cn/app/%E6%B1%87%E7%8E%87%E4%BB%93%E5%BA%93/id6737148150")!
            // 方方块
        case .App5:
            URL(string:"https://apps.apple.com/us/app/%E6%96%B9%E6%96%B9%E5%9D%97/id6742731756?l=zh-Hans-CN")!
        }
    }
}
