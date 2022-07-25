//
//  DetailView.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

struct DetailView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    @State private var hideStatusBar = true
    
//    @Binding var userColor: UserColor
    @ObservedObject var userColor: UserColor
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                cover
                
                HStack {
                    userColor.primaryColor
                        .frame(height: 200)
                    userColor.secondaryColor
                        .frame(height: 200)
                    userColor.accentColor
                        .frame(height: 200)
                }
                .offset(x: 0, y: 100)
                .padding()
                
                HStack {
                    ColorPicker("",selection: $userColor.primaryColor, supportsOpacity: false)
                        .labelsHidden()
                    
                    ColorPicker("",selection: $userColor.secondaryColor, supportsOpacity: false)
                        .labelsHidden()
                    
                    ColorPicker("",selection: $userColor.accentColor, supportsOpacity: false)
                        .labelsHidden()
                }
                .offset(x: 0, y: 100)
                .padding()
                
                Spacer(minLength: 200)
            }
            .background(Color("BGColor"))
            .ignoresSafeArea()
            
            
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.horizontal,20)
            .padding(.vertical, 50)
            .ignoresSafeArea()
            
        }
        .statusBar(hidden: hideStatusBar)
        .environmentObject(userColor)
    }
    
    var cover: some View {
        VStack {
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(Color("TextColor"))
        .background(
            Image("card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask (
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {

                Text("Task Management App")
                    .font(Font.custom("Ubuntu-Bold", size: 24))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("3 Screens")
                    .font(Font.custom("Ubuntu-Medium", size: 12))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    .opacity(0.5)

                Text("Task management concept app from Dribbble.")
                    .font(Font.custom("Ubuntu", size: 12))
                    .matchedGeometryEffect(id: "text", in: namespace)

                Divider()

                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in:
                                        RoundedRectangle(cornerRadius: 18, style: .continuous))

                    Text("Achmad Komarudin")
                        .font(Font.custom("Ubuntu", size: 16))
                }
            }
                .padding(20)
                .background(
                    Rectangle()
//                        .fill(Color("CardColor"))
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                        .blur(radius: 10)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                        .shadow(color: Color("ShadowColor"), radius: 8, x: 0, y: 8)
                )
                .offset(y: 250)
                .padding(20)

        )
    }
}


struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    
    static var previews: some View {
        DetailView(namespace: namespace, show: .constant(true), userColor: UserColor())
    }
}
