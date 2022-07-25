//
//  TestView3.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

struct TestView3: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Color("BGColor")
                .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("TextColor"))
            
            if show {
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
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.combiGray, lineWidth: 5))
    }
}

struct TestView3_Previews: PreviewProvider {
    static var previews: some View {
        TestView3(show: .constant(true))
    }
}
