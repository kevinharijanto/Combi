//
//  Onboarding.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct Onboarding: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

extension Onboarding {
    static var onboardingItem: [Onboarding] = [
        Onboarding(image: "Onboarding1", title: "Unleash Your Inner Creativity!", description: "Here you can visualize your colors in an instant!"),
        
        Onboarding(image: "Onboarding2", title: "Find Your Combi-nation!", description: "Change the color as much as you like!")
    ]
}
