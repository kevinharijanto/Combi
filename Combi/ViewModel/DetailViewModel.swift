//
//  DetailViewModel.swift
//  Combi
//
//  Created by Kevin Harijanto on 25/07/22.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    
    //Animation Properties
    @Published var currentItem: Card?
    @Published var showDetailPage: Bool = false
    
    //Detail Animation Properties
    @Published var animateView: Bool = false
    @Published var animateContent: Bool = false
}
