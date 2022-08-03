//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView4: View {
    //ViewModel
    @ObservedObject var viewModel: MockViewModel
    
    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            viewModel.bgColor
                .ignoresSafeArea()
            
            Image("5.4primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            Image("4.4illustration")
            
            Image("3.4neutral on primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("2.4neutral on neutrals")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("1.4neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
            
            Image("0.5tabbar color")
                .renderingMode(.template)
                .foregroundColor(viewModel.darkNeutralColor())
            
            Image("0tabbar white")
                .renderingMode(.template)
                .foregroundColor(viewModel.whiteOnNeutral())
            
            Image("0tabbar primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
        }
    }
}

struct MockView4_Previews: PreviewProvider {
    static var previews: some View {
        MockView4(viewModel: MockViewModel(userColor: UserColor()))
    }
}
