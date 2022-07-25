//
//  CardView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct CardView: View {
    var item: Card
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            ZStack(alignment: .topLeading) {
                //Banner Image
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(
                            CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                }
                .frame(height: 200)
            }
            
            HStack(spacing: 12) {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 46, height: 46)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.cardTitle)
                        .font(Font.custom("Ubuntu-Bold", size: 18))
                    
                    Text(item.cardScreens)
                        .font(Font.custom("Ubuntu-Medium", size: 12))
                        .opacity(0.4)
                }
                .foregroundStyle(Color("TextColor"))
            }
            .padding([.horizontal,.bottom],16)
        }
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CardColor"))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
        
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
