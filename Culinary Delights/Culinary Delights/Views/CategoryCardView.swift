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
            Color("Background").ignoresSafeArea()
            AsyncImage(url: URL(string: category.strCategoryThumb))
                .cornerRadius(10)
                .padding()
            
            VStack{
                Spacer()
                Text(category.strCategory)
                    .shadow(color: .black, radius: 1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                
                Text(category.strCategoryDescription)
                    .lineLimit(2)
                    .font(.body)
                    .foregroundColor(.white)
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
