//
//  UserColor.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

class UserColor: ObservableObject {
    @Published var primaryColor : Color = Color(UIColor(rgb: 0x1B4A5A))
    @Published var secondaryColor : Color = Color(UIColor(rgb: 0xFFFFFF))
    @Published var accentColor : Color = Color(UIColor(rgb: 0xFFB057))
}
