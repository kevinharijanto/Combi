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

            Image("11.5primary")
                .renderingMode(.template)
                .foregroundColor(viewModel.primaryColor)

            Image("10.5neutral variation")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())
                .saturation(3)

            Image("9.5ilustration")

            Image("8.5neutral on bg")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            Image("7.5playbutton")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralColor)

            Image("6.5neutral")
                .renderingMode(.template)
                .foregroundColor(viewModel.neutralOnBackground())

            ZStack {
                Image("5.5white on primary")
                    .renderingMode(.template)
                    .foregroundColor(viewModel.neutralOnNeutral())

                Image("4.5element")
                
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
}

struct MockView5_Previews: PreviewProvider {
    static var previews: some View {
        MockView5(viewModel: MockViewModel(userColor: UserColor()))
    }
}
