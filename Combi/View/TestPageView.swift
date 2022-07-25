//
//  TestPageView.swift
//  Combi-NC2
//
//  Created by Kevin Harijanto on 22/07/22.
//

import SwiftUI

struct TestPageView: View {
    //User Color Properties
    @StateObject var userColor = UserColor()
    
    //Animation Properties
    @State var currentItem: Card?
    @State var showDetailPage: Bool = false
    
    //Matched Geometry Effect
    @Namespace var animation
    
    //Detail Animation Properties
    @State var animateView: Bool = false
    @State var animateContent: Bool = false
    
    //Hide status bar Properties
    @State private var hideStatusBar = true
    
    //Drag Gesture Properties
    @State var scale: CGFloat = 1
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(cardItems) { item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                            currentItem = item
                            showDetailPage = true
                        }
                    } label: {
                        CardView(item: item)
                        // For matched geometry effect, dont apply padding,Apply scaling instead
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1 : 0.93)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
                }
            }
            .padding(.vertical)
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage {
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .background(alignment: .top) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CardColor"))
                .frame(height: animateView ? nil : 350, alignment: .top)
                .scaleEffect(animateView ? 1 : 0.93)
                .opacity(animateView ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    
    // MARK: CardView
    @ViewBuilder
    func CardView(item: Card)-> some View {
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
    
    //MARK: Detail View
    func DetailView(item: Card) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Color("CardColor")
                    .ignoresSafeArea()
                
                VStack {
                    CardView(item: item)
                        .scaleEffect(animateView ? 1 : 0.93)
                    
                    Divider()
                    
                    VStack {
                        HStack(spacing: 16) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("by Kevin Harijanto")
                                .font(Font.custom("Ubuntu", size: 16))
                                .foregroundColor(Color("TextColor"))
                        }
                        
                        Text("HELOOOOOOOOOWWWW")
                        // ISI DISINI
                        
                        Spacer()
                            .frame(minHeight: 1000)
                    }
                    .padding()
                    .opacity(animateContent ? 1 : 0)
                    .scaleEffect(animateView ? 1 : 0, anchor:  .top)
                }
            }
            .scaleEffect(scale)
        }
//        .gesture(DragGesture(minimumDistance:0)
//            .onChanged(onChanged(value:))
//            .onEnded(onEnded(value:)))
        .overlay(alignment: .topTrailing, content: {
            Button {
                 // Closing View
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
                    currentItem = nil
                    showDetailPage = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
            }
            .padding()
            .padding(.top, safeArea().top)
            .offset(y: -30)
            .opacity(animateView ? 1 : 0)
        })
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                animateView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                animateContent = true
            }
        }
        .transition(.identity)
        .statusBar(hidden: hideStatusBar)
        
    }
    
//    func onChanged(value: DragGesture.Value) {
//        // calculating scale value by total height
//        let scale = value.translation.height / UIScreen.main.bounds.height
//        print(scale)
//        // if scale is 0.1, actual scale is 1 - 0.1 = 0.9
//        if 1 - scale > 0.8 {
//            self.scale = 1 - scale
//        }
//    }
//
//    func onEnded(value: DragGesture.Value) {
//
//        withAnimation(.spring()) {
//            print(scale)
//            if scale < 0.9 {
//                animateView = false
//                animateContent = false
//                currentItem = nil
//                showDetailPage = false
//            }
//            scale = 1
//        }
//    }
}

struct TestPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestPageView()
            .preferredColorScheme(.dark)
    }
} 


