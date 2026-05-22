//
//  HapticManager.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/22.
//

import UIKit

struct HapticManager {
    static let shared = HapticManager()
    private init() {}
    
    private let selectionGenerator = UISelectionFeedbackGenerator()
    private var isEnabled: Bool = true
//    {
        // AppStorageManager.shared.isVibration
//    }
    
    func selectionChanged() {
        guard isEnabled else { return }
        selectionGenerator.prepare()
        selectionGenerator.selectionChanged()
    }
    
    func success() {
        guard isEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func error() {
        guard isEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func warning() {
        guard isEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
}
