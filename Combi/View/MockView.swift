//
//  TestView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI
import UIKit

struct MockView: View {
    
    @ObservedObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            Color(UIColor(rgb: 0xFAFAFA))
                .ignoresSafeArea()
                .frame(width: 390, height: 844)
            
            VStack(spacing: 30){
                VStack(spacing: 20) {
                    HStack {
                        Group {
                            Text("Let's become more ")
                                .font(Font.custom("Ubuntu-Medium", size: 24))
                                .foregroundColor(userColor.primaryColor) + Text("Productive")
                                .font(Font.custom("Ubuntu-Bold", size: 24))
                                .foregroundColor(userColor.secondaryColor)
                        }
                        .frame(width: 200, height: 60)
                        
                        Spacer()
                        
                        Image(systemName: "bell.fill")
                            .foregroundColor(userColor.primaryColor)
                            .scaleEffect(1.5)
                            .padding()
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 35)
                            .fill(userColor.primaryColor)
                            .frame(width: 305, height: 161)
                            .offset(y: 10)
                            .opacity(0.2)
                        
                        RoundedRectangle(cornerRadius: 35)
                            .fill(userColor.primaryColor)
                            .frame(width: 348, height: 162)
                        
                        //                        Circle()
                        //                            .strokeBorder(userColor.accentColor.opacity(0.2), lineWidth: 3)
                        //                            .frame(width: 72, height: 72)
                        //                            .offset(x: -150, y: -60)
                        //
                        //                        Circle()
                        //                            .strokeBorder(userColor.accentColor.opacity(0.2), lineWidth: 3)
                        //                            .frame(width: 26, height: 26)
                        //                            .offset(x: -150, y: -60)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Great, your today's plan almost done")
                                .font(Font.custom("Ubuntu-Bold", size: 20))
                                .foregroundColor(textColor(bgColor: userColor.primaryColor))
                                .frame(width: 200)
                            
                            HStack(alignment: .bottom, spacing: 110) {
                                Text("View Task")
                                    .font(Font.custom("Ubuntu-Medium", size: 14))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .foregroundColor(userColor.accentColor)
                                    .background {
                                        RoundedRectangle(cornerRadius: 35)
                                            .fill(userColor.secondaryColor)
                                    }
                                
                                
                                ZStack {
                                    Circle()
                                        .stroke(
                                            userColor.accentColor.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    
                                    Circle()
                                        .trim(from: 0.2, to: 1)
                                        .stroke(
                                            userColor.secondaryColor,
                                            lineWidth: 10
                                        )
                                    
                                    Text("80%")
                                        .font(Font.custom("Ubuntu-Medium", size: 20))
                                        .foregroundColor(userColor.accentColor)
                                }
                                .frame(width: 70, height: 70)
                            }
                            
                        }
                        .padding(.horizontal, 30)
                    }
                    
                }
                
                HStack {
                    Text("Today's Schedule")
                        .font(Font.custom("Ubuntu-Medium", size: 24))
                        .foregroundColor(userColor.primaryColor)
                    
                    Spacer()
                }
                
                HStack() {
                    VStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(userColor.accentColor)
                            .frame(width: 168, height: 108)
                            
                            VStack(spacing: 5) {
                                Text("Meeting with developer")
                                    .font(Font.custom("Ubuntu-Medium", size: 14))
                                    .foregroundColor(userColor.primaryColor)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .frame(width: 90)
                                
                                Text("07:00 - 09:00")
                                    .font(Font.custom("Ubuntu-Medium", size: 12))
                                    .foregroundColor(userColor.primaryColor).opacity(0.5)
                                    .frame(width: 90)
                            }
                        }
                        
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(userColor.secondaryColor.opacity(0.2))
                            .frame(width: 168, height: 220)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Create a plan for business")
                                    .font(Font.custom("Ubuntu-Medium", size: 14))
                                    .foregroundColor(userColor.primaryColor)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(5)
                                    .frame(width: 90)
                                
                                Text("11:00 - 12:00")
                                    .font(Font.custom("Ubuntu-Medium", size: 12))
                                    .foregroundColor(userColor.primaryColor).opacity(0.5)
                                
                                Image("MockImage2")
                                    .frame(width: 50, height: 50)
                                    .padding([.leading,.top],40)
                            }
                            .padding(20)
                        }
                    }
                    
                    VStack(spacing: 16) {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(userColor.secondaryColor.opacity(0.2))
                            .frame(width: 168, height: 220)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Meeting with designer")
                                    .font(Font.custom("Ubuntu-Medium", size: 14))
                                    .foregroundColor(userColor.primaryColor)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(5)
                                    .frame(width: 90)
                                
                                Text("09:00 - 10:00")
                                    .font(Font.custom("Ubuntu-Medium", size: 12))
                                    .foregroundColor(userColor.primaryColor).opacity(0.5)
                                
                                Image("MockImage1")
                                    .frame(width: 50, height: 50)
                                    .padding([.leading,.top],40)
                            }
                            .padding(20)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(userColor.primaryColor)
                            .frame(width: 168, height: 108)
                            
                            VStack(spacing: 5) {
                                Text("Click to view more")
                                    .font(Font.custom("Ubuntu-Medium", size: 14))
                                    .foregroundColor(userColor.accentColor)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .frame(width: 90)
                                
                                Text("+5 schedule")
                                    .font(Font.custom("Ubuntu-Medium", size: 12))
                                    .foregroundColor(userColor.accentColor).opacity(0.5)
                                    .frame(width: 90)
                            }
                        }
                        
                    }
                }
                .shadow(color: Color("ShadowColor").opacity(0.1), radius: 8, x: 0, y: 8)
                
                Spacer(minLength: 10)
                
                //                 Tab Bar
                HStack(alignment: .top, spacing: 33) {
                    VStack(spacing: 6) {
                        Image(systemName: "square.grid.2x2.fill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .foregroundColor(userColor.primaryColor)
                        
                        Circle()
                            .fill(userColor.primaryColor)
                            .frame(width: 8, height: 8)
                    }
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundColor(userColor.primaryColor)
                        .opacity(0.2)
                    
                    Circle()
                        .fill(userColor.accentColor)
                    
                    Image(systemName: "chart.bar.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundColor(userColor.primaryColor)
                        .opacity(0.2)
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundColor(userColor.primaryColor)
                        .opacity(0.2)
                    
                }
                .frame(maxWidth: .infinity)
                
                
            }
            .padding()
        }
    }
    
    func textColor(bgColor: Color) -> Color {
        
        let r = bgColor.components.red
        let g = bgColor.components.green
        let b = bgColor.components.blue
        _ = bgColor.components.opacity
        var brightness: CGFloat = 0.0
        
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        
        return brightness < 0.5 ? .white : .combiBlack
    }
}


struct MockView_Previews: PreviewProvider {
    static var previews: some View {
        MockView(userColor: UserColor())
    }
}
