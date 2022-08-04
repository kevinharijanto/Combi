//
//  CombiContentView.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI

// Define observable
class AppState: ObservableObject {
    enum CurrentView: Int {
        case onboarding
        case initialpicker
        case main
    }
    
    @AppStorage("scene") var switchScene = CurrentView.onboarding
//    @Published var switchScene = CurrentView.onboarding
}

struct CombiContentView: View {
    @StateObject var appState = AppState()
    @StateObject var userColor = UserColor()
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some View {
        Group {
            switch (appState.switchScene) {
            case .onboarding:
                OnboardingView()
                    .environmentObject(appState)
                    .transition(transition)
            
            case .initialpicker:
                InitialPickerView()
                    .environmentObject(appState)
                    .environmentObject(userColor)
                    .transition(transition)
                
            case .main:
                MainPageView()
                    .environmentObject(appState)
                    .environmentObject(userColor)
                    .transition(transition)
                
            }
        }
        .animation(.default, value: appState.switchScene)
    }
}
