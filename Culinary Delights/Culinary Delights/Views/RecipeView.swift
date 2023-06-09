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
            ForEach(manager.recipes){ i in
                Text(i.id)
            }
        }.onAppear{
            manager.getRecipe(recipeurl: manager.recipeURL+meal.id)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(meal: Meal.standard)
            .environmentObject(RecipesManager())
    }
}
