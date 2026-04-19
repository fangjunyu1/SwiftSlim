//
//  Email.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/19.
//

import SwiftUI

enum Email {
    static func sendFeedback(using openURL: OpenURLAction) {
        let email = "fangjunyu.com@gmail.com"
        let subject = "Qinote Feedback"
        let body = "Hi fangjunyu,\n\n"
        
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let urlString = "mailto:\(email)?subject=\(subjectEncoded)&body=\(bodyEncoded)"
        
        guard let url = URL(string: urlString) else { return }
        openURL(url)
    }
}
