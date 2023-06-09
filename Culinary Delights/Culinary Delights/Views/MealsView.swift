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
    var category: Category
    var body: some View {
        NavigationView{
            ZStack{
               Color("Sunset").ignoresSafeArea()
                VStack{
                    Text("Meals")
                        .font(.largeTitle.bold())
                    ScrollView(showsIndicators: false){
                        ForEach(manager.meals){ meal in
//                            NavigationLink(destination: RecipeView(meal: meal)) {
                                MealCardView(meal: meal)
                                    .cornerRadius(10)
                                    .frame(minHeight: 320)
                                    .shadow(color: Color.black.opacity(0.6), radius: 2, x: 0, y: 5)
                                    .padding()
                                    .sheet(isPresented: $showSheet, content: {
                                        RecipeView(meal: meal)
                                    })
                                    .onTapGesture {
                                        showSheet.toggle()
                                    }
//                            }
                        }
                    }
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
