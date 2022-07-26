//
//  CombiContentView.swift
//  Combi
//
//  Created by Kevin Harijanto on 26/07/22.
//

import SwiftUI


enum CurrentView: Int {
    case onboarding
    case initialpicker
    case main
}

// Define observable
class AppState: ObservableObject {
//    @AppStorage("scene") var switchScene = CurrentView.onboarding
    // warna di initial picker blm nyambung
    @Published var switchScene = CurrentView.initialpicker
}

struct CombiContentView: View {
    @ObservedObject var appState = AppState()
    
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
                    .transition(transition)
                
            case .main:
                MainPageView()
                    .environmentObject(appState)
                    .transition(transition)
            }
        }
        .animation(.default, value: appState.switchScene)
    }
}
