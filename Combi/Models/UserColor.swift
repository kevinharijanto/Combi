//
//  UserColor.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

class UserColor: ObservableObject {
    @AppStorage("primaryColor") var primaryColor : Color = Color(UIColor(rgb: 0x1B4A5A))
    @AppStorage("secondaryColor") var secondaryColor : Color = Color(UIColor(rgb: 0xFFB057))
    @AppStorage("accentColor") var accentColor : Color = Color(UIColor(rgb: 0xFFFFFF))
}
