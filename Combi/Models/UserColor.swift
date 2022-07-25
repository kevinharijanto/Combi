//
//  UserColor.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

class UserColor: ObservableObject {
    @Published var primaryColor : Color = .combiGray
    @Published var secondaryColor : Color = .combiPink
    @Published var accentColor : Color = .combiLightBlue
    
//    var primaryColor : Color = .combiGray
//    var secondaryColor : Color = .combiPink
//    var accentColor : Color = .combiLightBlue
}
