//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView1: View {
    //ViewModel
    @ObservedObject var viewModel: MockViewModel
    
    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            viewModel.bgColor
                .ignoresSafeArea()
            
            Image("7.1neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("6.1neutral option on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
                .saturation(3)
            
            Image("5.1primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            Image("4.1neutral on surface")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            Image("3.1neutral on accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("2.1neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            Image("1.1books")
        }
    }
}

struct MockView1_Previews: PreviewProvider {
    static var previews: some View {
        MockView1(viewModel: MockViewModel(userColor: UserColor()))
    }
}
