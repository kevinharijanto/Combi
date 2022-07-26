//
//  TestView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

struct MockView: View {
    
    @ObservedObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            Color.white
                .mask(RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea()
            
            Text("Hello!")
                .font(Font.custom("Ubuntu-Bold", size: 36))
                .foregroundColor(Color.combiGray)
        }
        
    }
}


struct MockView_Previews: PreviewProvider {
    static var previews: some View {
        MockView(userColor: UserColor())
    }
}
