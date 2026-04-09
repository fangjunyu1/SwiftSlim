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
