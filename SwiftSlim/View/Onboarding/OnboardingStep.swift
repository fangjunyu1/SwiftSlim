//
//  OnboardingStep.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/13.
//

import SwiftUI

enum OnboardingStep: Int, Identifiable, CaseIterable {
    case learnSwiftUI = 0, startLessons, toolBox, areYouReady
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .learnSwiftUI:
            return "Learn SwiftUI"
        case .startLessons:
            return "Beginner Courses"
        case .toolBox:
            return "Tools"
        case .areYouReady:
            return "Are You Ready?"
        }
    }
    
    var description: String {
        switch self {
        case .learnSwiftUI:
            return "From syntax to interface, from examples to practice, learn SwiftUI in a way that is easier to understand."
        case .startLessons:
            return "Start with the fundamentals, learn common SwiftUI patterns step by step, and build a clear development mindset."
        case .toolBox:
            return "Combine tutorials with tools to create a more complete experience for learning, searching, and understanding."
        case .areYouReady:
            return "Starting now, write your first line of code and gradually build your very first app."
        }
    }
    
    var buttonTitle: (String, String) {
        switch self {
        case .areYouReady:
            return ("Start Learning","")
        default:
            return ("Next",">")
        }
    }
    
    func next() -> OnboardingStep? {
        OnboardingStep(rawValue: rawValue + 1)
    }
}
