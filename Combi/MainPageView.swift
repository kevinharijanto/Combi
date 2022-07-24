//
//  MainPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

class UserColor: ObservableObject {
    @Published var primaryColor : Color = Color(UIColor.combiGray)
    @Published var secondaryColor : Color = Color(UIColor.combiPink)
    @Published var accentColor : Color = Color(UIColor.combiLightBlue)
}

struct MainPageView: View {
    
    @StateObject var userColor = UserColor()
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Ubuntu-Bold", size: 36)!]
//        
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Ubuntu", size: 18)!]
//    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("BGColor").edgesIgnoringSafeArea(.all)
                    .navigationTitle("Combi-ne It!")
                    .navigationBarTitleDisplayMode(.large)
                
                ScrollView {
                    VStack {
                        
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
                                    .foregroundColor(Color("TextColor"))
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
                                    .foregroundColor(Color("TextColor"))
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
                                    .foregroundColor(Color("TextColor"))
                            }
                        }
                        .padding()
                        
                        HStack {
                            Text("Views")
                                .font(Font.custom("Ubuntu-Bold", size: 36))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("TextColor"))
                            .padding()
                            
                            Rectangle()
                                .fill(userColor.primaryColor)
                                .frame(width: 20, height: 20)
                            Rectangle()
                                .fill(userColor.secondaryColor)
                                .frame(width: 20, height: 20)
                            Rectangle()
                                .fill(userColor.accentColor)
                                .frame(width: 20, height: 20)
                        }
                        
                        NavigationLink(destination: TestPageView(), label: {
                            CardView(image: "cityvector", category: "SwiftUI", heading: "Task Management App", author: "by Kevin Harijanto")
                        })
                        
                        
                        NavigationLink(destination: TestPageView(), label: {
                            CardView(image: "Onboarding1", category: "SwiftUI", heading: "Task Management App", author: "by Kevin Harijanto")
                        })
                       
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .environmentObject(userColor)
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
