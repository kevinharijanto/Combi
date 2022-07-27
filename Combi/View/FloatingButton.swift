//
//  FloatingButton.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct FloatingButton: View {
    //User Colors
    @EnvironmentObject var userColor: UserColor
    
    @State var openButton = false
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Circle()
                    .fill(userColor.primaryColor)
                    .opacity(openButton ? 1 : 0)
            }
            
            // Button
            Button {
                withAnimation(.spring()) {
                    openButton.toggle()
                }
            } label: {
                Image("FloatingMenu")
                    .rotationEffect(.degrees(openButton ? 180 : 0))
                    .saturation(openButton ? 0 : 1)
            }
            .background(Color.combiGray)
            .mask(Circle())
            .shadow(color: Color("ShadowColor"), radius: 10, x: 0, y: 0)
            .zIndex(2)
            
        }
        
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
