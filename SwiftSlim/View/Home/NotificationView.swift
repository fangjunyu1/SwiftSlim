//
//  NotificationView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            VStack {
                Text("No messages")
                    .modifier(PromptText())
            }
            .padding(30)
            .frame(width: 300)
            .background()
            .cornerRadius(10)
        }
        .modifier(BackgroundModifiers())
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
