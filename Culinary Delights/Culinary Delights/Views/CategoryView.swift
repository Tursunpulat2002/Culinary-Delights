//
//  RecipesView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var manager: RecipesManager
    var body: some View {
        NavigationView {
            List(manager.categories) { category in
                NavigationLink(destination: MealsView(category: category)) {
                    Text(category.strCategory)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Recipe App")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(RecipesManager())
    }
}
