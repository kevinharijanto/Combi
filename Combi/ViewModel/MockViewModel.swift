//
//  MockViewModel.swift
//  Combi
//
//  Created by Kevin Harijanto on 28/07/22.
//

import SwiftUI

class MockViewModel: ObservableObject {
    let userColor: UserColor

    @Published var primaryColor: Color
    @Published var neutralColor: Color
    @Published var bgColor: Color
    
    init(userColor: UserColor) {
        self.userColor = userColor
        self.primaryColor = userColor.primaryColor
        self.neutralColor = userColor.neutralColor
        self.bgColor = userColor.bgColor
    }

    func brightnessValues(color: Color) -> CGFloat {
        let r = color.components.red
        let g = color.components.green
        let b = color.components.blue

        var brightness: CGFloat = 0.0

        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000

        return brightness
    }
    
    // primary colors
    func darkPrimaryColor() -> Color {
        return brightnessValues(color: primaryColor) < 0.5 ? primaryColor : .combiBlack
    }
    
    func lightPrimaryColor() -> Color {
        return brightnessValues(color: primaryColor) < 0.5 ? .white : primaryColor
    }
    
    func primaryOnBackground() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.5 ? lightPrimaryColor() : darkPrimaryColor()
    }
    
    // neutral colors
    func darkNeutralColor() -> Color {
        return brightnessValues(color: neutralColor) < 0.5 ? neutralColor : .black
    }
    
    func lightNeutralColor() -> Color {
        return brightnessValues(color: neutralColor) < 0.5 ?  .white : neutralColor
    }
    
    func neutralOnBackground() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.5 ? lightNeutralColor() : darkNeutralColor()
    }
    
    func neutralOnNeutral() -> Color {
        let brightness = brightnessValues(color: neutralColor)
        return brightness < 0.5 ? lightNeutralColor() : darkNeutralColor()
    }
    
    // tab bar
    func whiteOnNeutral() -> Color {
        let brightness = brightnessValues(color: neutralColor)
        return brightness < 0.5 ? .white : .combiBlack
    }
    
}
