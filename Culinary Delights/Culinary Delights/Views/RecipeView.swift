//
//  RecipeView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/8/23.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var manager: RecipesManager
    let meal: Meal
    var body: some View {
        VStack{
            Text(meal.id)
            Text(meal.strMeal)
            Text(meal.strMealThumb)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(meal: Meal.standard)
            .environmentObject(RecipesManager())
    }
}
