//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView2: View {
    //ViewModel
    @ObservedObject var viewModel: MockViewModel
    
    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            viewModel.bgColor
                .ignoresSafeArea()

            Image("5.2neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            Image("4.2primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            Image("3.2neutral on primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("2.2neutral on neutral bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            Image("1.2neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
        }
    }
}

struct MockView2_Previews: PreviewProvider {
    static var previews: some View {
        MockView2(viewModel: MockViewModel(userColor: UserColor()))
    }
}
