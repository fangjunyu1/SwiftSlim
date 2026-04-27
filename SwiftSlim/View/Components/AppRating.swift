//
//  AppRating.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/27.
//

import SwiftUI
import StoreKit

struct AppRating {
    // 离开课程页、工具视图时，再判断是否请求评分
    static func checkReviewIfNeeded(appStorage: AppStorageManager) {
        
        print("当前课程页/工具视图打开次数:\(appStorage.openCount)")
        
        guard !appStorage.hasRequestedReview else {
            print("已弹出过评分窗口，不再弹出。")
            return
        }
        
        // 如果打开次数小于 10，则退出判断
        guard appStorage.openCount >= 10 else {
            print("当前打开次数为:\(appStorage.openCount),小于 10，添加一次打开次数后，退出判断")
            appStorage.openCount += 1
            return
        }
        
        // 弹出评分窗口
        SKStoreReviewController.requestReview()
        appStorage.hasRequestedReview = true
        
        print("已请求评分，后续不再重复请求")
    }
}
