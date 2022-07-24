//
//  CardView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("CardColor"))
                .frame(width: 340, height: 330)
            
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 340, height: 230)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(category)
                            .font(Font.custom("Ubuntu-Bold", size: 12))
                            .foregroundColor(Color("TextColor"))
                        Text(heading)
                            .font(Font.custom("Ubuntu-Bold", size: 20))
                            .fontWeight(.black)
                            .foregroundColor(Color("TextColor"))
                            .lineLimit(3)
                        Text(author)
                            .font(Font.custom("Ubuntu-Medium", size: 12))
                            .foregroundColor(Color("TextColor"))
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .cornerRadius(10)
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
            .padding([.top, .horizontal])
            .shadow(color: Color("ShadowColor").opacity(0.2), radius: 10, x: 0, y: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "cityvector", category: "SwiftUI", heading: "Drawing a border", author: "Kevin H.")
    }
}
