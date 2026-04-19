//
//  SettingsType.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/18.
//

import SwiftUI

enum SettingsType: Int, Identifiable, CaseIterable {
    
    case feedback = 0
    case privacy
    case termsOfUse
    case aboutUs
    case acknowLedgements
    case openSource
    
    var id: Int {
        rawValue
    }
    
    var img: String {
        switch self {
        case .feedback:
            "problemFeedback"
        case .privacy:
            "privacyPolicy"
        case .termsOfUse:
            "termsOfUse"
        case .aboutUs:
            "aboutUs"
        case .acknowLedgements:
            "acknowLedgements"
        case .openSource:
            "openSource"
        }
    }
    
    var color: Color {
        switch self {
        case .feedback:
            Color(hex: "AD5CFF")
        case .privacy:
            Color(hex: "5E5E5E")
        case .termsOfUse:
            Color(hex: "21C091")
        case .aboutUs:
            Color(hex: "000000")
        case .acknowLedgements:
            Color(hex: "F04B4B")
        case .openSource:
            Color(hex: "D69F3C")
        }
    }
    
    var title: String {
        switch self {
        case .feedback:
            "Feedback"
        case .privacy:
            "Privacy"
        case .termsOfUse:
            "Terms"
        case .aboutUs:
            "About Us"
        case .acknowLedgements:
            "Acknowledgements"
        case .openSource:
            "Open Source"
        }
    }
    
    var action: SettingsAction {
        switch self {
        case .feedback:
                .email
            
        case .privacy:
                .url(URL(string: "https://fangjunyu.com/2026/03/27/%e8%bd%bb%e5%ad%a6swift-%e9%9a%90%e7%a7%81%e6%94%bf%e7%ad%96/")!)
            
        case .termsOfUse:
                .url(URL(string: "https://fangjunyu.com/2026/04/15/%e8%bd%bb%e5%ad%a6%e7%bc%96%e7%a8%8b-%e4%bd%bf%e7%94%a8%e6%9d%a1%e6%ac%be/")!)
            
        case .aboutUs:
                .destination(AnyView(AboutUsView()))
            
        case .acknowLedgements:
                .destination(AnyView(AcknowLedgementsView()))
            
        case .openSource:
                .destination(AnyView(OpenSourceView()))
        }
    }
}

enum SettingsAction {
    case destination(AnyView)
    case url(URL)
    case email
}
