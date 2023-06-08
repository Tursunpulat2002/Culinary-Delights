//
//  RecipesView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(recipe.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Ingredients:")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            
            Text("Instructions:")
                .font(.headline)
            
            Text(recipe.instructions)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
    }
}

struct RecipesView: View {
    let recipes = [
        Recipe2(name: "Pasta Carbonara", ingredients: ["Spaghetti", "Eggs", "Pancetta", "Parmesan Cheese", "Black Pepper"], instructions: "1. Cook the pasta according to the package instructions.\n2. Meanwhile, fry the pancetta in a pan until crispy.\n3. In a bowl, whisk together the eggs and grated Parmesan cheese.\n4. Drain the pasta and add it to the pan with the pancetta.\n5. Turn off the heat and pour in the egg mixture, stirring quickly to coat the pasta.\n6. Season with black pepper and serve immediately."),
        Recipe2(name: "Chocolate Chip Cookies", ingredients: ["Flour", "Butter", "Sugar", "Eggs", "Vanilla Extract", "Chocolate Chips"], instructions: "1. Preheat the oven to 350°F.\n2. In a bowl, cream together the butter and sugar until light and fluffy.\n3. Beat in the eggs one at a time, then stir in the vanilla extract.\n4. Gradually add the flour and mix until well combined.\n5. Fold in the chocolate chips.\n6. Drop spoonfuls of dough onto a baking sheet and bake for 10-12 minutes.\n7. Allow to cool before serving.")
    ]
    
    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeView(recipe: recipe)) {
                    Text(recipe.name)
                }
            }
            .navigationBarTitle("Recipe App")
        }
    }
}

struct Recipe2: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let instructions: String
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
