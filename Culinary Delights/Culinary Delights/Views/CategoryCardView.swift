//
//  CategoryCardView.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/8/23.
//

import SwiftUI

struct CategoryCardView: View {
    let category: Category
    var body: some View {
        ZStack(alignment: .top) {
            Color("CardBackground").ignoresSafeArea()
            // Get image from url
            AsyncImage(
                url: URL(string: category.strCategoryThumb),
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
            
            // Draw white arrow pointing right
            ZStack{
                Rectangle()
                    .frame(width: 80, height: 50)
                    .foregroundColor(Color.yellow)
                    .cornerRadius(30)
                Text("\u{2192}")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .offset(x:-13)
            }.padding()
                .offset(x:170)
            
            VStack(alignment: .leading){
                Spacer()
                
                // Show category name
                Text(category.strCategory)
                    .shadow(color: .black, radius: 1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Show category description
                Text(category.strCategoryDescription)
                    .shadow(color: .black, radius: 1)
                    .lineLimit(2)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .padding()
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category.standard)
    }
}
