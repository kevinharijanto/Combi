//
//  MainPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct MainPageView: View {
    
    @StateObject var userColor = UserColor()
    
    @StateObject private var viewModel = DetailViewModel()
    
    //Matched Geometry Effect
    @Namespace var animation
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 16) {
                    Text("Combi-ne It!")
                        .font(.custom("Ubuntu-Bold", size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    colors
                    
                    Text("Views")
                        .font(Font.custom("Ubuntu-Bold", size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    VStack(spacing: 0) {
                        ForEach(cardItems) { item in
                            Button {
                                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    viewModel.currentItem = item
                                    viewModel.showDetailPage = true
                                }
                            } label: {
                                CardView(item: item, animation: animation)
                                    .scaleEffect(viewModel.currentItem?.id == item.id && viewModel.showDetailPage ? 1 : 0.93)
                            }
                            .buttonStyle(ScaledButtonStyle())
                            .opacity(viewModel.showDetailPage ? (viewModel.currentItem?.id == item.id ? 1 : 0) : 1)
                        }
                    }
                    .padding(.vertical)
                    
                    Spacer(minLength: 200)
                    
                }
//                .opacity(viewModel.showDetailPage ? 0 : 1)
            }
            .background(Color("BGColor"))
            .foregroundStyle(Color("TextColor"))
            
            .background(alignment: .top) {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color("CardColor"))
                    .frame(height: viewModel.animateView ? nil : 350, alignment: .top)
                    .scaleEffect(viewModel.animateView ? 1 : 0.93)
                    .opacity(viewModel.animateView ? 1 : 0)
                    .ignoresSafeArea()
            }
            .overlay {
                if let currentItem = viewModel.currentItem, viewModel.showDetailPage {
                    DetailView(item: currentItem, userColor: userColor, viewModel: viewModel, animation: animation)
                        .ignoresSafeArea(.container, edges: .top)
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
        MainPageView()
            .preferredColorScheme(.dark)
    }
}
