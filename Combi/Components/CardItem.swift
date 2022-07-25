//
//  CardItem.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

struct CardItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var title: String = "Title"
    var screen: String = "Screen"
    var subtitle: String = "Subtitle"
    var image: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(Font.custom("Ubuntu-Bold", size: 24))
                    .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(screen)
                    .font(Font.custom("Ubuntu-Medium", size: 12))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    .opacity(0.5)
                
                Text(subtitle)
                    .font(Font.custom("Ubuntu", size: 12))
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
//                    .fill(Color("CardColor"))
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 10)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .foregroundStyle(Color("TextColor"))
        .background(
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .frame(height: 280)
        .padding(16)
        .shadow(color: Color("ShadowColor"), radius: 8, x: 0, y: 8)
    }
}

struct CardItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CardItem(namespace: namespace, show: .constant(true), title: "Task Management App", screen: "3 Screens", subtitle: "Task management concept app from Dribbble.", image: "card1")
    }
}
