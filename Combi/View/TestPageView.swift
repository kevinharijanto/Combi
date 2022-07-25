//
//  TestPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct TestPageView: View {
    
    @EnvironmentObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            Color("BGColor").edgesIgnoringSafeArea(.all)
                .navigationTitle("Color View")
                .navigationBarTitleDisplayMode(.large)
            
            ScrollView {
                Rectangle()
                    .fill(userColor.primaryColor)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Rectangle()
                            .stroke(Color(UIColor(rgb: 0x000000)), lineWidth: 5))
                
                Rectangle()
                    .fill(userColor.secondaryColor)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Rectangle()
                            .stroke(Color(UIColor(rgb: 0x000000)), lineWidth: 5))
                
                Rectangle()
                    .fill(userColor.accentColor)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Rectangle()
                            .stroke(Color(UIColor(rgb: 0x000000)), lineWidth: 5))
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Hello")
        //            .font(Font.custom("Ubuntu-Bold", size: 36))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TestPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestPageView()
    }
}
