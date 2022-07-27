//
//  DetailPageDummy.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct DetailPage1: View {
    //Hide status bar Properties
    @State private var hideStatusBar = true
    //User Colors
    @EnvironmentObject var userColor: UserColor
    //ViewModel
    @ObservedObject var viewModel: DetailViewModel
    //Namespace
    var animation: Namespace.ID
    //Drag Gesture Properties
    @State var scale: CGFloat = 1
    
    var item = cardItems[0]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack {
                ZStack(alignment: .top) {
                    // content
                    VStack {
                        Spacer(minLength: 350)

                        Divider()

                        HStack(spacing: 16) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)

                            Text("by Kevin Harijanto")
                                .font(Font.custom("Ubuntu", size: 16))
                                .foregroundColor(Color("TextColor"))
                        }

                        PagingView(config: .init(margin: 20, spacing: 10)) {
                            Group {
        //                        MockView(userColor: userColor)
        //
                                Rectangle()
                                    .fill(userColor.secondaryColor)
                                Rectangle()
                                    .fill(userColor.accentColor)
                            }
                            .mask(RoundedRectangle(cornerRadius: 10))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .opacity(0.3)
                            )
                        }
                        .frame(minHeight: 700)

                        Spacer(minLength: 1000)
                    }
                    .zIndex(0)
                    
                    // card view
                    VStack(alignment: .leading, spacing: 0) {
                        Image(item.artwork)
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: "artwork1", in: animation)
                        .frame(width: UIScreen.main.bounds.width, height: 280, alignment: .top)
                        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 15))
                        
                            
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
                        .frame(width:UIScreen.main.bounds.width, height: 80, alignment: .leading)
                    }
                    .zIndex(1)
                    
                }
            }
        }
        .scaleEffect(scale)
        .gesture(DragGesture(minimumDistance:0)
                        .onChanged(onChanged(value:))
                        .onEnded(onEnded(value:)))
        .statusBar(hidden: hideStatusBar)
        .ignoresSafeArea()
        .background {
            Color("CardColor")
                .matchedGeometryEffect(id: "background1", in: animation)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation(.spring()) {
                    viewModel.showDetailPage1.toggle()
                }
               
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
            }
            .padding()
            .opacity(viewModel.showDetailPage1 ? 1 : 0)
        }
    }
    
    func onChanged(value: DragGesture.Value) {
            // calculating scale value by total height
        let scaleHere = value.translation.height / UIScreen.main.bounds.height

        // if scale is 0.1, actual scale is 1 - 0.1 = 0.9
        if 1 - scaleHere > 0.8 {
            self.scale = 1 - scaleHere
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if self.scale < 0.9 {
                viewModel.showDetailPage1.toggle()
            }
            scale = 1
        }
    }
}

struct DetailPageDummy_Previews: PreviewProvider {
    static var previews: some View {
        CombiContentView()
            .preferredColorScheme(.dark)
    }
}
