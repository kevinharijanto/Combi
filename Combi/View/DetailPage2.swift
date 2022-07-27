//
//  DetailPageDummy.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct DetailPage2: View {
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
    
    @State var openButton = false
    
    var item = cardItems[1]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
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
                    .matchedGeometryEffect(id: "artwork2", in: animation)
                    .frame(width: UIScreen.main.bounds.width, height: 280, alignment: .top)
                        
                    HStack(spacing: 12) {
                        Image(item.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "logo2", in: animation)
                            .frame(width: 46, height: 46)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.cardTitle)
                                .font(Font.custom("Ubuntu-Bold", size: 18))
                                .matchedGeometryEffect(id: "title2", in: animation)
                            
                            Text(item.cardScreens)
                                .font(Font.custom("Ubuntu-Medium", size: 12))
                                .opacity(0.4)
                                .matchedGeometryEffect(id: "subtitle2", in: animation)
                        }
                        .foregroundStyle(Color("TextColor"))
                    }
                    .padding(.horizontal, 16)
                    .frame(width:UIScreen.main.bounds.width, height: 80, alignment: .leading)
                }
                .zIndex(1)
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
                .matchedGeometryEffect(id: "background2", in: animation)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
        .overlay {
            VStack {
                // Close Button
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            viewModel.showDetailPage2.toggle()
                        }

                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(Color("TextColor"))
                    }
                    .padding()
                .opacity(viewModel.showDetailPage2 ? 1 : 0)
                }
                
                Spacer()
                
                // Floating Button
                HStack {
                    Spacer()
                    
                    VStack {
                        // Color Picker
                        HStack(spacing: 0) {
                            ColorPicker("",selection: $userColor.primaryColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                                .opacity(openButton ? 1 : 0)
                                .offset(y: 20)
                            
                            ColorPicker("",selection: $userColor.secondaryColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                                .opacity(openButton ? 1 : 0)
                            
                            ColorPicker("",selection: $userColor.accentColor, supportsOpacity: false)
                                .labelsHidden()
                                .padding()
                                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                                .opacity(openButton ? 1 : 0)
                                .offset(y: 20)
                        }
                        
                        // Actual Button
                        Button {
                            withAnimation(.spring()) {
                                openButton.toggle()
                            }
                        } label: {
                            Image("FloatingMenu")
                                .rotationEffect(.degrees(openButton ? 180 : 0))
                                .saturation(openButton ? 0 : 1)
                        }
                        .background(Color.combiGray)
                        .mask(Circle())
                        .shadow(color: Color("ShadowColor"), radius: 10, x: 0, y: 0)
                        .opacity(viewModel.showDetailPage2 ? 1 : 0)
                    }
                    
                    Spacer()
                }
            }
        }
    }
    func onChanged(value: DragGesture.Value) {
            // calculating scale value by total height
        let scaleHere = value.translation.height / UIScreen.main.bounds.height

        // if scale is 0.1, actual scale is 1 - 0.1 = 0.9
        if 1 - scaleHere > 0.8 && scaleHere > 0 {
            self.scale = 1 - scaleHere
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if self.scale < 0.9 {
                viewModel.showDetailPage2.toggle()
            }
            scale = 1
        }
    }
}
