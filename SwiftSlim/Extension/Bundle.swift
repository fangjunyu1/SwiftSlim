//
//  Bundle.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/3/28.
//

import SwiftUI

extension Bundle {
    var version: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }

    var build: String {
        object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "1"
    }
}
