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
                
                VStack(spacing: 16) {
                    Text("Combi-ne It!")
                        .font(.custom("Ubuntu-Bold", size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                    
                    colors
                    
                    Text("Views")
                        .font(Font.custom("Ubuntu-Bold", size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    CardView1(viewModel: viewModel, animation: animation)
                        .shadow(color: Color("ShadowColor").opacity(0.5), radius: 10, x: 0, y: 8)
                    
                    CardView2(viewModel: viewModel, animation: animation)
                        .shadow(color: Color("ShadowColor").opacity(0.5), radius: 10, x: 0, y: 8)
                    
                    Spacer(minLength: 500)
                    
                }
            }
            .foregroundStyle(Color("TextColor"))
            .background(Color("BGColor"))
            .overlay {
                if viewModel.showDetailPage1 {
                    DetailPage1(viewModel: viewModel, animation: animation)
                }
                
                if viewModel.showDetailPage2 {
                    DetailPage2(viewModel: viewModel, animation: animation)
                }
            }
    }
    
    var colors: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CardColor"))
            //                .frame(width: 358, height: 160, alignment: .center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .shadow(color: Color("ShadowColor"), radius: 10, x: 0, y: 8)
            
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
}

struct MainPageView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CombiContentView()
            .preferredColorScheme(.dark)
    }
}
