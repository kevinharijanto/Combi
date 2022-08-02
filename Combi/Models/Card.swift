//
//  Card.swift
//  Combi
//
//  Created by Kevin Harijanto on 25/07/22.
//

import SwiftUI

// MARK: Data model and sample data

struct Card: Identifiable {
    var id = UUID().uuidString
    var logo: String
    var cardTitle: String
    var cardScreens: String
    var artwork: String
}

var cardItems: [Card] = [
    Card(logo: "CardLogo", cardTitle: "Book Summarizing App", cardScreens: "2 Screens", artwork: "Mock1 Card"),

    Card(logo: "CardLogo", cardTitle: "Habit Tracker App", cardScreens: "3 Screens", artwork: "Mock1 Card"),
]
