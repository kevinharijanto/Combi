//
//  UserColor.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

class UserColor: ObservableObject {
    @AppStorage("primaryColor") var primaryColor : Color = Color(UIColor(rgb: 0xFFC1C2))
    @AppStorage("accentColor") var accentColor : Color = Color(UIColor(rgb: 0x1B4A5A))
    @AppStorage("bgColor") var bgColor : Color = Color(UIColor(rgb: 0xFFFFFF))
}
