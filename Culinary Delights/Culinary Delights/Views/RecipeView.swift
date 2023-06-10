//
//  RecipeView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/8/23.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var manager: RecipesManager
    @Binding var meal: Meal
    var body: some View {
        ZStack(alignment: .top){
            Color("Background").ignoresSafeArea()
            VStack{
                ScrollView(showsIndicators: false){
                    // Get image from url
                    AsyncImage(
                        url: URL(string: manager.recipe.strMealThumb ?? ""),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 400)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    
                    // Show meal name
                    Text(manager.recipe.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Show country the food came from
                    Text((manager.recipe.strArea ?? "") + " quisine")
                        .padding(.vertical, 5)
                        .font(.system(size: 20))
                    
                    // List the ingredients and their measurements
                    VStack{
                        ForEach(0..<manager.recipe.ingredients.count, id:\.self){ i in
                            HStack{
                                Text(manager.recipe.ingredients[i])
                                Spacer()
                                Text(manager.recipe.measurements[i])
                            }.padding(.horizontal, 30)
                        }
                    }.padding(.vertical)
                    
                    // List out instructions
                    VStack(alignment: .leading){
                        ForEach(manager.recipe.instructions, id:\.self){i in
                            Text(i)
                                .padding(.horizontal)
                        }
                    }
                }
            }.onAppear{// when page loads get the recipe for the specific meal
                manager.getRecipe(recipeurl: manager.recipeURL+meal.id)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(meal: .constant(Meal.standard))
            .environmentObject(RecipesManager())
    }
}
