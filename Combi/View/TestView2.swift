//
//  TestView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 24/07/22.
//

import SwiftUI

struct TestView2: View {
    
    @State var show = false
    
    var body: some View {
        if !show {
            PagingView(config: .init(margin: 20, spacing: 10)) {
                TestView3(show: $show)
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        show.toggle()
                    }
                
                TestView3(show: $show)
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        show.toggle()
                    }
                
                TestView3(show: $show)
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        show.toggle()
                    }
                
            }
            .background(Color("BGColor"))
            
        } else {
            TestView3(show: $show)
                .ignoresSafeArea()
        }
        
        
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
