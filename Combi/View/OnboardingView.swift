//
//  OnboardingView.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

struct OnboardingView: View {
    let transition: AnyTransition =
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
    
    //App state properties
    @EnvironmentObject var appState: AppState
    
    // onboarding properties
    var onboardingItem = Onboarding.onboardingItem
    @State private var selection = 0
    
    // change tab view indicator to black
   init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
    
    var body: some View {
        VStack(spacing: 30) {
            TabView(selection: $selection) {
                ForEach(onboardingItem.indices) { item in
                    VStack(spacing: 0) {
                        Image(onboardingItem[item].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        VStack(spacing: 16) {
                            Text(onboardingItem[item].title)
                                .font(Font.custom("Ubuntu-Bold", size: 36))
                                .multilineTextAlignment(.center)
                                .frame(width: 300)
                            
                            Text(onboardingItem[item].description)
                                .font(Font.custom("Ubuntu", size: 20))
                                .multilineTextAlignment(.center)
                                .frame(width: 230)
                        }
                        
                        Spacer()
                    }
                    .tag(item)
                }
            }
            .frame(height: UIScreen.main.bounds.height-160)
            .foregroundStyle(Color("TextColor"))
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Button {
                withAnimation {
                    if selection < onboardingItem.count - 1 {
                        selection += 1
                    }
                    else {
                        appState.switchScene = .initialpicker
                        // push to initial picker
                        
                    }
                }
            } label: {
                if selection == onboardingItem.count - 1 {
                    Text("Start")
                        .font(Font.custom("Ubuntu", size: 24))
                        .padding(.horizontal, 49)
                        .padding(.vertical, 16)
                        .foregroundColor(Color("BGColor"))
                        .background {
                            RoundedRectangle(cornerRadius: 35)
                                .fill(Color("TextColor"))
                        }
                }
                else {
                    Text("Next")
                        .font(Font.custom("Ubuntu", size: 24))
                        .padding(.horizontal, 49)
                        .padding(.vertical, 16)
                        .foregroundColor(Color("BGColor"))
                        .background {
                            RoundedRectangle(cornerRadius: 35)
                                .fill(Color("TextColor"))
                        }
                }
            }
            
            Spacer()
        }
        .background(Color("BGColor"))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
//            .preferredColorScheme(.dark)
    }
}
