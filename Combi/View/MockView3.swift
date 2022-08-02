//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView3: View {
    //ViewModel
    @ObservedObject var viewModel: MockViewModel
    
    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            viewModel.bgColor
                .ignoresSafeArea()

            Image("6.3accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            Image("5.3primary neutrals")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            //jempol kanan
            Image("4.3primary on accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentColor)
            //jempol kiri
            Image("3.3primary on neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            Image("2.3primary on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            Image("1.3illustration")
        }
    }
}

struct MockView3_Previews: PreviewProvider {
    static var previews: some View {
        MockView3(viewModel: MockViewModel(userColor: UserColor()))
    }
}
