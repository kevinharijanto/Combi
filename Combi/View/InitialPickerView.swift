//
//  InitialPickerView.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct InitialPickerView: View {
    //App state properties
    @EnvironmentObject var appState: AppState
    // User Color
    @EnvironmentObject var userColor: UserColor
    
    var body: some View {
        VStack(spacing: 21) {
            Image("Onboarding3")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 5) {
                Text("Define Your Vibe!")
                    .font(Font.custom("Ubuntu-Bold", size: 36))
                
                Text("Pick your project colors")
                    .font(Font.custom("Ubuntu-Medium", size: 20))
            }
            
            VStack(spacing:UIScreen.main.bounds.height / 20) {
                HStack(spacing: 20) {
                    
                    VStack(spacing: 20) {
                        ZStack {
                            ColorPicker("",selection: $userColor.primaryColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 3, height: 3))
                            
                            Circle()
                                .fill(userColor.primaryColor)
                                .frame(width: 90, height: 90)
                                .allowsHitTesting(false)
                                .background(
                                    Circle()
                                        .stroke(Color("OutlineColor"), lineWidth: 10))
                        }
                        
                        Text("Primary")
                            .font(Font.custom("Ubuntu", size: 16))
                    }
                    
                    VStack(spacing: 20) {
                        ZStack {
                            ColorPicker("",selection: $userColor.secondaryColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 3, height: 3))
                            
                            Circle()
                                .fill(userColor.secondaryColor)
                                .frame(width: 90, height: 90)
                                .allowsHitTesting(false)
                                .background(
                                    Circle()
                                        .stroke(Color("OutlineColor"), lineWidth: 10))
                        }
                        
                        Text("Secondary")
                            .font(Font.custom("Ubuntu", size: 16))
                    }
                    
                    VStack(spacing: 20) {
                        ZStack {
                            ColorPicker("",selection: $userColor.accentColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 3, height: 3))
                            
                            Circle()
                                .fill(userColor.accentColor)
                                .frame(width: 90, height: 90)
                                .allowsHitTesting(false)
                                .background(
                                    Circle()
                                        .stroke(Color("OutlineColor"), lineWidth: 10))
                        }
                        
                        Text("Accent")
                            .font(Font.custom("Ubuntu", size: 16))
                    }
                }
                .padding()
                
                VStack(spacing: 16) {
                    Button {
                        appState.switchScene = .main
                        // save custom color to core data?
                        
                    } label: {
                        Text("Get Started")
                            .font(Font.custom("Ubuntu", size: 20))
                            .frame(width: 278, height: 55)
                            .foregroundColor(Color("BGColor"))
                            .background(Color("TextColor"))
                            .cornerRadius(35)
                    }
                    
                    
                    Button {
                        appState.switchScene = .main
                    } label: {
                        Text("Let me pick later.")
                            .font(Font.custom("Ubuntu", size: 20))
                            .frame(width: 275, height: 55)
                            .foregroundColor(Color("TextColor"))
                            .background(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(lineWidth: 3)
                                    .opacity(0.3)
                            )
                    }
                }
            }
            
            Spacer()
        }
        .foregroundStyle(Color("TextColor"))
//        .background(Color("BGColor"))
    }
}

struct InitialPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CombiContentView()
            .preferredColorScheme(.dark)
    }
}
