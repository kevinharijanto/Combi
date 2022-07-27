//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView2: View {
    @ObservedObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 266, height: 144)
                .foregroundColor(userColor.secondaryColor.opacity(0.2))
                .offset(x: 30,y: 95)
            Image("5.")
                .renderingMode(.template)
                .foregroundColor(userColor.primaryColor)
            Image("4.")
                .renderingMode(.template)
                .foregroundColor(userColor.primaryColor)
            Image("3.")
                .renderingMode(.template)
                .foregroundColor(userColor.primaryColor)
            Image("2.")
                .renderingMode(.template)
                .foregroundColor(userColor.secondaryColor)
            Image("1.")
                .renderingMode(.template)
                .foregroundColor(userColor.accentColor)
        }
    }
}

struct MockView2_Previews: PreviewProvider {
    static var previews: some View {
        MockView2(userColor: UserColor())
    }
}
