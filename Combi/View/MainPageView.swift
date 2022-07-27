//
//  MainPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct MainPageView: View {
    //App state properties
    @EnvironmentObject var appState: AppState
    //User Colors
    @EnvironmentObject var userColor: UserColor
    //ViewModel
    @StateObject private var viewModel = DetailViewModel()
    
    //Matched Geometry Effect
    @Namespace var animation
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                Spacer(minLength: 10)
                
                Text("Combi-ne It!")
                    .font(.custom("Ubuntu-Bold", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                colors
                
                Text("Contrast")
                    .font(Font.custom("Ubuntu-Bold", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                contrast
                    .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
                
                Text("Views")
                    .font(Font.custom("Ubuntu-Bold", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                CardView1(viewModel: viewModel, animation: animation)
                    .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
                
                Spacer(minLength: 10)
                
                Text("by Kevin Harijanto")
                    .font(Font.custom("Ubuntu", size: 16))
                    .padding()
                
                
            }
        }
        .foregroundStyle(Color("TextColor"))
        .background(Color("BGColor"))
        .overlay {
            if viewModel.showDetailPage1 {
                DetailPage1(viewModel: viewModel, animation: animation)
            }
        }
            
    }
    
    var colors: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CardColor"))
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 4)
            
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
        }
    }
    
    var contrast: some View {
        
        PagingView(config: .init(margin: 32, spacing: 32)) {
            Group {
                //bg prim, text accent
                ZStack {
                    Rectangle()
                        .fill(userColor.primaryColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.accentColor)
                }
                //bg accent, text prim
                ZStack {
                    Rectangle()
                        .fill(userColor.accentColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.primaryColor)
                }
                //bg prim, text sec
                ZStack {
                    Rectangle()
                        .fill(userColor.primaryColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.secondaryColor)
                }
                //bg sec, text prim
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(userColor.secondaryColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.primaryColor)
                        
                }
                //bg accent, text sec
                ZStack {
                    Rectangle()
                        .fill(userColor.accentColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.secondaryColor)
                }
                //bg sec, text accent
                ZStack {
                    Rectangle()
                        .fill(userColor.secondaryColor)
                        .frame(width: UIScreen.main.bounds.width-42,height: 200)
                    
                    Text("Hello, World!")
                        .font(Font.custom("Ubuntu-Bold", size: 24))
                        .foregroundColor(userColor.accentColor)
                }
                
            }
            .mask(RoundedRectangle(cornerRadius: 15))
        }
        .frame(minHeight: 200)
    }
}

struct MainPageView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        Group {
            CombiContentView()
                .previewDevice("iPhone 13")
//            CombiContentView()
        }
//            .preferredColorScheme(.dark)
    }
}
