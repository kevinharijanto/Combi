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
    @Published var accentColor: Color
    @Published var bgColor: Color
    
    init(userColor: UserColor) {
        self.userColor = userColor
        self.primaryColor = userColor.primaryColor
        self.accentColor = userColor.accentColor
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
    
    func primaryOnAccent() -> Color {
        let brightness = brightnessValues(color: accentColor)
        return brightness < 0.6 ? lightPrimaryColor() : darkPrimaryColor()
    }
    
    func primaryOnPrimaryNeutral() -> Color {
        let brightness = brightnessValues(color: primaryNeutralSurface())
        return brightness < 0.6 ? lightPrimaryColor() : darkPrimaryColor()
    }
    
    func primaryNeutralSurface() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.5 ? primaryColor.lighter().opacity(0.5) : primaryColor.darker().opacity(0.5)
    }
    
    //accent colors
    func darkAccentColor() -> Color {
        return brightnessValues(color: accentColor) < 0.5 ? accentColor : .combiBlack
    }
    
    func lightAccentColor() -> Color {
        return brightnessValues(color: accentColor) < 0.5 ? .white : accentColor
    }
    
    func accentOnBackground() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.6 ? lightAccentColor() : darkAccentColor()
    }
    
    func accentButtonOnBackground() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.6 ? accentColor : accentColor.lighter()
    }
    
    func accentNeutralSurface() -> Color {
        let brightness = brightnessValues(color: bgColor)
        return brightness < 0.5 ? .white : .black
    }
    
    func accentOnPrimaryNeutral() -> Color {
        let brightness = brightnessValues(color: primaryNeutralSurface())
        return brightness < 0.6 ? lightAccentColor() : darkAccentColor()
    }
    
    func accentOnPrimary() -> Color {
        let brightness = brightnessValues(color: primaryColor)
        return brightness < 0.5 ? .white : darkAccentColor()
    }
    
    // tab bar
    func tabBarWhite() -> Color {
        let brightness = brightnessValues(color: accentOnPrimaryNeutral())
        return brightness < 0.6 ? .white : .combiBlack
    }
    
//    func accentOnPrimary() -> Color {
//        let brightness = brightnessValues(color: primaryOnBackground())
//        return brightness < 0.6 ? accentColor.lighter() : accentColor.darker()
//    }
    
}
