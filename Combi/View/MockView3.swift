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
            
            Image("5.3primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            //jempol kanan
            Image("4.3neutral on primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            //jempol kiri
            Image("3.3neutral on neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("2.3neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("1.3illustration")
        }
    }
}

struct MockView3_Previews: PreviewProvider {
    static var previews: some View {
        MockView3(viewModel: MockViewModel(userColor: UserColor()))
    }
}
