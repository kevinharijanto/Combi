//
//  Extensions.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 21/07/22.
//

import UIKit
import SwiftUI

// UIColor extension for Hex Color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension Color {
    static let combiBlack = Color(UIColor(rgb: 0x111315))
    static let combiGray = Color(UIColor(rgb:0x2A2E31))
    static let combiPurple = Color(UIColor(rgb: 0x6E62E5))
    static let combiPink = Color(UIColor(rgb: 0xFFC1C2))
    static let combiLightBlue = Color(UIColor(rgb: 0xDCE5FF))
}

// fill and border in shape
extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

