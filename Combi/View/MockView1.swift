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
            
            Image("7primary neutral")//
                .renderingMode(.template)
                .foregroundColor(viewModel.accentNeutralSurface())
            
            Image("6primary option on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryOnBackground())
            
            Image("5accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            //
            Image("4primary on surface")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())

            Image("3primary on accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentColor)
            
            Image("2primary on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())

            Image("1books")
        }
    }
}

struct MockView1_Previews: PreviewProvider {
    static var previews: some View {
        MockView1(viewModel: MockViewModel(userColor: UserColor()))
    }
}
