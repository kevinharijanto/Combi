//
//  DetailView.swift
//  Combi
//
//  Created by Kevin Harijanto on 25/07/22.
//

import SwiftUI

struct DetailView: View {
    var item: Card
    
    //Hide status bar Properties
    @State private var hideStatusBar = true
    
    // User Color Properties
    @ObservedObject var userColor: UserColor
    
    // Animation Properties
    @ObservedObject var viewModel: DetailViewModel
    var animation: Namespace.ID
    
    //Drag Gesture Properties
    @State var scale: CGFloat = 1
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Rectangle()
                    .fill(Color("CardColor"))
                    .ignoresSafeArea()
                
                VStack {
                    CardView(item: item, animation: animation)
                        .scaleEffect(viewModel.animateView ? 1 : 0.93)
                    
                    Divider()
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("by Kevin Harijanto")
                                .font(Font.custom("Ubuntu", size: 16))
                                .foregroundColor(Color("TextColor"))
                        }
                        
                        
                        // ISI DISINI
                        PagingView(config: .init(margin: 16, spacing: 10)) {
                            Group {
                                MockView(userColor: userColor)
                                Rectangle()
                                    .fill(userColor.secondaryColor)
                                Rectangle()
                                    .fill(userColor.accentColor)
                            }
                            .mask(RoundedRectangle(cornerRadius: 10))
                        }
                        .frame(minHeight: 690)
                        
                        Spacer()
                            .frame(minHeight: 200)
                    }
                    .padding()
                    .opacity(viewModel.animateContent ? 1 : 0)
                    .scaleEffect(viewModel.animateView ? 1 : 0, anchor:  .top)
                }
                .scaleEffect(scale)
            }
            .gesture(DragGesture(minimumDistance:0)
                .onChanged(onChanged(value:))
                .onEnded(onEnded(value:)))
        }
        .overlay(alignment: .topTrailing, content: {
            Button {
                 // Closing View
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    viewModel.animateView = false
                    viewModel.animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
                    viewModel.currentItem = nil
                    viewModel.showDetailPage = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
            }
            .padding()
            .padding(.top, safeArea().top)
            .offset(y: -30)
            .opacity(viewModel.animateView ? 1 : 0)
        })
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                viewModel.animateView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                viewModel.animateContent = true
            }
        }
        .transition(.identity)
        .statusBar(hidden: hideStatusBar)
    }
    
    func onChanged(value: DragGesture.Value) {
        // calculating scale value by total height
        let scale = value.translation.height / UIScreen.main.bounds.height

        // if scale is 0.1, actual scale is 1 - 0.1 = 0.9
        if 1 - scale > 0.7 {
            self.scale = 1 - scale
        }
    }

    func onEnded(value: DragGesture.Value) {

//        withAnimation(.spring()) {
//            print("scale is \(scale)")
//            if scale < 0.9 {
//                viewModel.animateView = false
//                viewModel.animateContent = false
//                viewModel.currentItem = nil
//                viewModel.showDetailPage = false
//            }
//            scale = 1
//        }
        
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            print("scale is \(scale)")
            
            if self.scale < 0.9 {
                viewModel.animateView = false
                viewModel.animateContent = false
                viewModel.currentItem = nil
                viewModel.showDetailPage = false
                
            }
            scale = 1
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(item: <#Card#>, detail: <#DetailViewModel#>, animation: <#Namespace.ID#>)
//    }
//}
