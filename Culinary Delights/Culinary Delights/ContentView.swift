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
        VStack{
            Text("Categories")
                .font(.title)
                .bold()
            
            ForEach(manager.categories){category in
                Text(category.id)
                Text(category.strCategory)
                Text(category.strCategoryThumb)
                Text(category.strCategoryDescription)
            }
        }
//        RecipesView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesManager())
    }
}
