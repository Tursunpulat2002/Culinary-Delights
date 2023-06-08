//
//  ContentView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: RecipesManager
    var body: some View {
        CategoryView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesManager())
    }
}
