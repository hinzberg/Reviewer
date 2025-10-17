//
//  ReviewerApp.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

@main
struct ReviewerApp: App {
    
    var reviewRepository = ReviewItemsRepository()
    @StateObject var appState = ApplicationState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(reviewRepository)
                .environmentObject(appState)
        }
    }
}
