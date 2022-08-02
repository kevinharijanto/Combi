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

            Image("6.2primary neutrals")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentNeutralSurface())

            Image("5.2accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)

            Image("4.2neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryOnBackground())
            
            Image("3.2primary on accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentColor)
            
            Image("2.2primary on neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())

            Image("1.2primary on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
        }
    }
}

struct MockView2_Previews: PreviewProvider {
    static var previews: some View {
        MockView2(viewModel: MockViewModel(userColor: UserColor()))
    }
}
