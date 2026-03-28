//
//  SwiftSlimApp.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2025/7/29.
//

import SwiftUI

@main
struct SwiftSlimApp: App {
    @StateObject private var appStorage = AppStorageManager.shared
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appStorage)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                appStorage.updateAppUsageDay()
            }
        }
    }
}
