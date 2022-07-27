//
//  CardViewDummy.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct CardView1: View {
    //User Colors
    @EnvironmentObject var userColor: UserColor
    //ViewModel
    @ObservedObject var viewModel: DetailViewModel
    //Namespace
    var animation: Namespace.ID
    
    var item = cardItems[0]
    
    var body: some View {
        
        card1
    }
    var card1: some View {
        
        Button {
            withAnimation(.spring()) {
                viewModel.showDetailPage1.toggle()
            }
            
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                Image(item.artwork)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: "artwork1", in: animation)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 200, alignment: .top)
                    .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))
                
                ZStack {
                    
                    Color("CardColor")
                        .matchedGeometryEffect(id: "background1", in: animation)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 80)
                        .clipShape(CustomCorner(corners: [.bottomLeft,.bottomRight], radius: 15))
                    
                    HStack(spacing: 12) {
                        Image(item.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "logo1", in: animation)
                            .frame(width: 46, height: 46)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.cardTitle)
                                .font(Font.custom("Ubuntu-Bold", size: 18))
                                .matchedGeometryEffect(id: "title1", in: animation)
                            
                            Text(item.cardScreens)
                                .font(Font.custom("Ubuntu-Medium", size: 12))
                                .opacity(0.4)
                                .matchedGeometryEffect(id: "subtitle1", in: animation)
                        }
                        .foregroundStyle(Color("TextColor"))
                    }
                    .padding(.horizontal, 16)
                    .frame(width:UIScreen.main.bounds.width - 32, height: 80, alignment: .leading)
                }
            }
        }
        .buttonStyle(ScaledButtonStyle())
    }
    
    
}

//struct CardViewDummy_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPageDummy()
////            .preferredColorScheme(.dark)
//    }
//}
