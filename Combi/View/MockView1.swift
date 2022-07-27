//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView1: View {
    @ObservedObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 167, height: 108)
                .foregroundColor(userColor.accentColor)
                .offset(x: -93,y: 8)
                .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 167, height: 219)
                .foregroundColor(userColor.secondaryColor.opacity(0.2))
                .offset(x: -93,y: 190)
                .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 167, height: 219)
                .foregroundColor(userColor.secondaryColor.opacity(0.2))
                .offset(x: 93,y: 64)
                .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
            
            Image("mock1.6")
                .renderingMode(.template)
                .foregroundColor(userColor.primaryColor)
            Image("mock1.5")
            Image("mock1.4")
                .renderingMode(.template)
                .foregroundColor(userColor.primaryColor)
            Image("mock1.3")
                .renderingMode(.template)
                .foregroundColor(userColor.accentColor)
            Image("mock1.2")
                .renderingMode(.template)
                .foregroundColor(userColor.secondaryColor)
            Image("mock1.1")
                .renderingMode(.template)
                .foregroundColor(userColor.accentColor)
        }
    }
}

struct MockView1_Previews: PreviewProvider {
    static var previews: some View {
        MockView1(userColor: UserColor())
    }
}
