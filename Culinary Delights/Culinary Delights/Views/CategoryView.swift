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
        // Nav View so i can use nav links
        NavigationView{
            ZStack{
                Color("Background").ignoresSafeArea()
                VStack{
                    Text("Categories")
                        .font(.largeTitle.bold())
                    // need scrollview to scroll through categories
                    ScrollView(showsIndicators: false){
                        // loop through each category and generate a nav link
                        ForEach(manager.categories){ category in
                            NavigationLink(destination: MealsView(category: category)) {
                                CategoryCardView(category: category)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.4), radius: 3, x: 0, y: 4)
                                    .padding()
                            }
                        }
                    }
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
