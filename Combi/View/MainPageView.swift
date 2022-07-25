//
//  MainPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct MainPageView: View {
    
    @StateObject var userColor = UserColor()
    
    @Namespace var namespace
    @State var show = false
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Ubuntu-Bold", size: 36)!]
//
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Ubuntu", size: 18)!]
//    }
    
    var body: some View {
        
        ZStack {
            Color("BGColor")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 0) {
                    Text("Combi-ne It!")
                        .font(.custom("Ubuntu-Bold", size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    
                    HStack(spacing: 20) {
                        
                        VStack(spacing: 20) {
                            ZStack {
                                ColorPicker("",selection: $userColor.primaryColor, supportsOpacity: false)
                                    .labelsHidden()
                                    .padding()
                                    .scaleEffect(CGSize(width: 3, height: 3))
                                
                                Circle()
                                    .fill(userColor.primaryColor)
                                    .frame(width: 100, height: 100)
                                    .allowsHitTesting(false)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(UIColor(rgb: 0xEFEEF3)), lineWidth: 5))
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
                                    .frame(width: 100, height: 100)
                                    .allowsHitTesting(false)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(UIColor(rgb: 0xEFEEF3)), lineWidth: 5))
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
                                    .frame(width: 100, height: 100)
                                    .allowsHitTesting(false)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(UIColor(rgb: 0xEFEEF3)), lineWidth: 5))
                            }
                            
                            Text("Accent")
                                .font(Font.custom("Ubuntu", size: 16))
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("Views")
                            .font(Font.custom("Ubuntu-Bold", size: 36))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        Button {
                            print("Go to all scenes")
                        } label: {
                            Text("All Scenes")
                                .font(Font.custom("Ubuntu", size: 18))
                                .opacity(0.5)
                        }
                        .padding()

                    }
                    
                    if !show {
                        CardItem(namespace: namespace, show: $show, title: "Task Management App", screen: "2 Screens", subtitle: "Task management concept app from Dribbble.", image: "card1")
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    show.toggle()
                                }
                            }
                    }
                    
                    Spacer(minLength: 200)
                    
                }
            }
            .foregroundStyle(Color("TextColor"))
            .padding()
            
            if show {
                DetailView(namespace: namespace, show: $show, userColor: userColor)
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainPageView()
    }
}
