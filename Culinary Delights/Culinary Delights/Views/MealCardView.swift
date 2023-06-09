//
//  MealCardView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/9/23.
//

import SwiftUI

struct MealCardView: View {
    let meal: Meal
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                AsyncImage(
                    url: URL(string: meal.strMealThumb),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 300)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Spacer()
                Text(meal.strMeal)
                    .shadow(color: .black, radius: 1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct MealCardView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView(meal: Meal.standard)
    }
}
