//
//  Culinary_DelightsApp.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import SwiftUI

@main
struct Culinary_DelightsApp: App {
    // For keeping single source of truth
    // Lets all the views access RecipesManager through environmentObject
    @StateObject var manager = RecipesManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
