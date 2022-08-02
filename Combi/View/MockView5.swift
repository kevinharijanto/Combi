//
//  MockView2.swift
//  Combi
//
//  Created by Kevin Harijanto on 27/07/22.
//

import SwiftUI

struct MockView5: View {
    //ViewModel
    @ObservedObject var viewModel: MockViewModel
    
    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            viewModel.bgColor
                .ignoresSafeArea()

            Image("12.5primary variation")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())
            
            Image("11.5ilustration")

            Image("10.5accent neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)

            Image("9.5primary on neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())

            Image("8.5primary on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnBackground())

            Image("7.5primary tabbar")
                .renderingMode(.template)
                .foregroundColor(viewModel.accentOnPrimaryNeutral())

            Image("6.5tabbar accent")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)

            Image("5.5tabbar white")
                .renderingMode(.template)
                .foregroundColor(viewModel.tabBarWhite())

            ZStack {
                Image("4.5neutral")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.primaryColor.opacity(0.1))

                //button and text
                Image("textandbutton")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.accentOnBackground())
                
                Image("playbutton")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.accentButtonOnBackground())

                Image("2.5white on primary")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.primaryOnAccent().lighter())

                Image("1.5element")
            }
        }
    }
}

struct MockView5_Previews: PreviewProvider {
    static var previews: some View {
        MockView5(viewModel: MockViewModel(userColor: UserColor()))
    }
}
