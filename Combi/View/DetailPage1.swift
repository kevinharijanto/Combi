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
    
    @Environment(\.colorScheme) var colorScheme
    @State var openButton = false
    
    var item = cardItems[0]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                Image(item.artwork)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: "artwork1", in: animation)
                    .frame(width: UIScreen.main.bounds.width, height: 358, alignment: .top)
                
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
                .padding(.horizontal, 20)
                .frame(width:UIScreen.main.bounds.width, height: 80, alignment: .leading)
                
                Divider()
                
//                Spacer()
                
                HStack {
                    Spacer()
                    Link(destination: URL(string: "https://dribbble.com/shots/17219653-Task-Management-App")!) {
                        Image(systemName: "link.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("TextColor"))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                HStack(spacing: 16) {
                    Spacer()

                    Text("Original Design by Achmad Qomarudin")
                        .font(Font.custom("Ubuntu", size: 16))
                        .foregroundColor(Color("TextColor"))
                    
                    Spacer()
                }
                
                Text("Mock Views")
                    .font(Font.custom("Ubuntu-Bold", size: 36))
                    .foregroundColor(Color("TextColor"))

                PagingView(config: .init(margin: 64, spacing:64)) {
                    Group {
                        MockView1(userColor: userColor)
                            .scaleEffect(0.8)
                            .frame(width: 312, height: 675)
                        MockView2(userColor: userColor)
                            .scaleEffect(0.8)
                            .frame(width: 312, height: 675)
                    }
                    .mask(RoundedRectangle(cornerRadius: 15))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                            .opacity(0.2)
                            .frame(width: 312, height: 675)
                    )
                }
                .frame(minWidth: 390, minHeight: 700)
                
                Spacer(minLength: 100)
            }
        }
//        .scaleEffect(scale)
//        .gesture(DragGesture(minimumDistance:0)
//                        .onChanged(onChanged(value:))
//                        .onEnded(onEnded(value:)))
        .statusBar(hidden: hideStatusBar)
        .ignoresSafeArea()
        .background {
            Color("CardColor")
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
                            if colorScheme == .dark {
                                Image("FloatingMenuLight")
                                    .rotationEffect(.degrees(openButton ? 180 : 0))
                                    .saturation(openButton ? 0 : 1)
                            } else {
                                Image("FloatingMenu")
                                    .rotationEffect(.degrees(openButton ? 180 : 0))
                                    .saturation(openButton ? 0 : 1)
                            }
                        }
                        .background(Color("TextColor"))
                        .mask(Circle())
                        .shadow(color: Color("ShadowColor"), radius: 10, x: 0, y: 0)
                        .opacity(viewModel.showDetailPage1 ? 1 : 0)
                        .padding(.bottom, UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > 20 ? 0 : 20)
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
                viewModel.showDetailPage1.toggle()
            }
            scale = 1
        }
    }
}

struct DetailPageDummy_Previews: PreviewProvider {
    static var previews: some View {
        CombiContentView()
//            .preferredColorScheme(.dark)
    }
}
