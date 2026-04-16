//
//  UIDevice.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/16.
//

import UIKit

extension UIDevice {
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
