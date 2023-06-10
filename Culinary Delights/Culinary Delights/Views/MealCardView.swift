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
        ZStack(alignment: .top) {
            Color("CardBackground").ignoresSafeArea()
            // Get image from url
            AsyncImage(
                url: URL(string: meal.strMealThumb),
                content: { image in
                    image
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                .opacity(0.7)
            
            // Show passed in meal name
            VStack(alignment: .leading){
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
