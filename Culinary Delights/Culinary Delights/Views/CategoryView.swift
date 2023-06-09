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
        NavigationView{
            ZStack{
                Color("Sunset").ignoresSafeArea()
                VStack{
                    Text("Categories")
                        .font(.largeTitle.bold())
                    ScrollView(showsIndicators: false){
                        ForEach(manager.categories){ category in
                            NavigationLink(destination: MealsView(category: category)) {
                                CategoryCardView(category: category)
                                    .cornerRadius(10)
                                    .frame(minHeight: 320)
                                    .shadow(color: Color.black.opacity(0.6), radius: 2, x: 0, y: 5)
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
