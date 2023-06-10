//
//  RecipesView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/8/23.
//

import SwiftUI

struct MealsView: View {
    @EnvironmentObject var manager: RecipesManager
    @State private var showSheet: Bool = false
    @State var mealVar: Meal = Meal.standard
    var category: Category
    var body: some View {
        // Nav View so i can use nav links
        NavigationView{
            ZStack{
                Color("Background").ignoresSafeArea()
                VStack{
                    Text("Meals")
                        .font(.largeTitle.bold())
                    // need scrollview to scroll through meals
                    ScrollView(showsIndicators: false){
                        // loop through each category and generate a nav link
                        ForEach(manager.meals){ meal in
                            MealCardView(meal: meal)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.6), radius: 2, x: 0, y: 5)
                                .padding()
                                .sheet(isPresented: $showSheet, content: {
                                    RecipeView(meal: $mealVar)
                                })
                                .onTapGesture {// on tap show sheet with recipe for the specific meal
                                    showSheet.toggle()
                                    mealVar = meal
                                }
                        }
                    }
                }
            }
        }.onAppear{// when page loads get the meals for the specific category
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
