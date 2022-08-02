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

            Image("8.4bottom element")
            
            Image("7.4semantic")
            
            Image("6.4accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)
            
            Image("5.4elements")
            
            Image("4.4primary on accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            Image("3.4primary neutrals")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentNeutralSurface())
            
            Image("2.4primary on neutrals")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            Image("1.4primary on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            // tab bar masi blm bener
            ZStack {
                Image("0.4tabbar")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.accentOnPrimaryNeutral())
                
                Image("0.4tabbar white")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.tabBarWhite())
                
                Image("0.4tabbar accent")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.primaryColor)
            }
        }
    }
}

struct MockView4_Previews: PreviewProvider {
    static var previews: some View {
        MockView4(viewModel: MockViewModel(userColor: UserColor()))
    }
}
