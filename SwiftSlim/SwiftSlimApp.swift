//
//  SwiftSlimApp.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//
//  Change App Name(2026-03-30)
//  SwiftSlim -> Qight
//
//  Change App Name(2026-04-09)
//  Qight -> Qinote
//

import SwiftUI

@main
struct SwiftSlimApp: App {
    @StateObject private var appStorage = AppStorageManager.shared
    @StateObject private var iapManager = IAPManager.shared
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .task {
                    await iapManager.loadProduct()   // 加载产品信息
                    await iapManager.handleTransactions()   // 加载内购交易更新
                }
                .environmentObject(appStorage)
                .environmentObject(iapManager)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                appStorage.updateAppUsageDay()
            }
        }
    }
}
