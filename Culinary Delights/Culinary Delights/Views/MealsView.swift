//
//  RecipesView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/8/23.
//

import SwiftUI

struct MealsView: View {
    @EnvironmentObject var manager: RecipesManager
    var category: Category
    var body: some View {
        NavigationView {
            List(manager.meals) { meal in
                NavigationLink(destination: CategoryView()) {
                    Text(meal.strMeal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meals")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }.onAppear{
            manager.getMeals(mealurl: manager.mealURL+category.strCategory)
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(category: Category.standard)
            .environmentObject(RecipesManager())
    }
}
